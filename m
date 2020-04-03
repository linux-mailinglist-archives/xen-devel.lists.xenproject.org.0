Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD719D9B8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:05:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNt4-000050-44; Fri, 03 Apr 2020 15:05:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKNt2-0008WV-Li
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:05:36 +0000
X-Inumbo-ID: 921de6a0-75bc-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921de6a0-75bc-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 15:05:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E5DEAB76;
 Fri,  3 Apr 2020 15:05:34 +0000 (UTC)
Subject: Re: [PATCH v7 04/12] xen: add basic hypervisor filesystem support
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-5-jgross@suse.com>
 <7dda5c2c-cb81-2cfa-2cf4-4440b49d401a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d454afb8-40ff-c8a4-7a5a-6f8f4f4f0e4a@suse.com>
Date: Fri, 3 Apr 2020 17:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7dda5c2c-cb81-2cfa-2cf4-4440b49d401a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.20 16:23, Jan Beulich wrote:
> On 02.04.2020 17:46, Juergen Gross wrote:
>> Add the infrastructure for the hypervisor filesystem.
>>
>> This includes the hypercall interface and the base functions for
>> entry creation, deletion and modification.
>>
>> In order not to have to repeat the same pattern multiple times in case
>> adding a new node should BUG_ON() failure, the helpers for adding a
>> node (hypfs_add_dir() and hypfs_add_leaf()) get a nofault parameter
>> causing the BUG() in case of a failure.
>>
>> When supporting writable leafs the entry's write pointer will need to
>> be set to the function performing the write to the variable holding the
>> content. In case there are no special constraints this will be
>> hypfs_write_bool() for type XEN_HYPFS_TYPE_BOOL and hypfs_write_leaf()
>> for the other entry types.
> 
> Seeing your HYPFS_*_INIT_WRITABLE() macros I find this a pretty
> strange requirement. Why can't the macros set the write hook right
> away?

Okay, will expand the macros.

> 
>> +int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>> +{
>> +    char *buf;
>> +    int ret;
>> +
>> +    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
>> +         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
>> +        return -EDOM;
>> +
>> +    buf = xmalloc_array(char, ulen);
>> +    if ( !buf )
>> +        return -ENOMEM;
>> +
>> +    ret = -EFAULT;
>> +    if ( copy_from_guest(buf, uaddr, ulen) )
>> +        goto out;
>> +
>> +    ret = -EINVAL;
>> +    if ( leaf->e.type == XEN_HYPFS_TYPE_STRING &&
>> +         memchr(buf, 0, ulen) != (buf + ulen - 1) )
>> +        goto out;
>> +
>> +    ret = 0;
>> +    memcpy(leaf->write_ptr, buf, ulen);
>> +    leaf->e.size = ulen;
>> +
>> + out:
>> +    xfree(buf);
>> +    return ret;
>> +}
>> +
>> +int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>> +{
>> +    bool buf;
>> +
>> +    ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL && leaf->e.size == sizeof(bool));
>> +
>> +    if ( ulen != leaf->e.max_size )
> 
> Why max_size here when the ASSERT() checks size?

Just for consistency with the other write functions.

> 
>> +static int hypfs_write(struct hypfs_entry *entry,
>> +                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>> +{
>> +    struct hypfs_entry_leaf *l;
>> +
>> +    if ( !entry->write )
>> +        return -EACCES;
>> +
>> +    if ( ulen > entry->max_size )
>> +        return -ENOSPC;
> 
> max_size being zero for non-writable entries, perhaps use -EACCES
> also for this special case? Together with the other comment above,
> maybe the ->write check wants replacing this way?

Checking the write function being not NULL is a nice security addon,
as I avoid to call into a non existing function. Basically both tests
would be equivalent, but this one is IMO better to avoid crashes.


Juergen

