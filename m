Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25A519DA32
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:31:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOII-0003bk-13; Fri, 03 Apr 2020 15:31:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKOIF-0003bS-Sx
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:31:39 +0000
X-Inumbo-ID: 36051650-75c0-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36051650-75c0-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 15:31:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2888AADE8;
 Fri,  3 Apr 2020 15:31:38 +0000 (UTC)
Subject: Re: [PATCH v7 04/12] xen: add basic hypervisor filesystem support
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-5-jgross@suse.com>
 <7dda5c2c-cb81-2cfa-2cf4-4440b49d401a@suse.com>
 <d454afb8-40ff-c8a4-7a5a-6f8f4f4f0e4a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b83570b-17ac-9da4-cfee-fbd44c7d3edf@suse.com>
Date: Fri, 3 Apr 2020 17:31:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d454afb8-40ff-c8a4-7a5a-6f8f4f4f0e4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 03.04.2020 17:05, Jürgen Groß wrote:
> On 03.04.20 16:23, Jan Beulich wrote:
>> On 02.04.2020 17:46, Juergen Gross wrote:
>>> +int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
>>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>>> +{
>>> +    char *buf;
>>> +    int ret;
>>> +
>>> +    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
>>> +         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
>>> +        return -EDOM;
>>> +
>>> +    buf = xmalloc_array(char, ulen);
>>> +    if ( !buf )
>>> +        return -ENOMEM;
>>> +
>>> +    ret = -EFAULT;
>>> +    if ( copy_from_guest(buf, uaddr, ulen) )
>>> +        goto out;
>>> +
>>> +    ret = -EINVAL;
>>> +    if ( leaf->e.type == XEN_HYPFS_TYPE_STRING &&
>>> +         memchr(buf, 0, ulen) != (buf + ulen - 1) )
>>> +        goto out;
>>> +
>>> +    ret = 0;
>>> +    memcpy(leaf->write_ptr, buf, ulen);
>>> +    leaf->e.size = ulen;
>>> +
>>> + out:
>>> +    xfree(buf);
>>> +    return ret;
>>> +}
>>> +
>>> +int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
>>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>>> +{
>>> +    bool buf;
>>> +
>>> +    ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL && leaf->e.size == sizeof(bool));
>>> +
>>> +    if ( ulen != leaf->e.max_size )
>>
>> Why max_size here when the ASSERT() checks size?
> 
> Just for consistency with the other write functions.

In which case perhaps extend the ASSERT() to also check max_size?

>>> +static int hypfs_write(struct hypfs_entry *entry,
>>> +                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>>> +{
>>> +    struct hypfs_entry_leaf *l;
>>> +
>>> +    if ( !entry->write )
>>> +        return -EACCES;
>>> +
>>> +    if ( ulen > entry->max_size )
>>> +        return -ENOSPC;
>>
>> max_size being zero for non-writable entries, perhaps use -EACCES
>> also for this special case? Together with the other comment above,
>> maybe the ->write check wants replacing this way?
> 
> Checking the write function being not NULL is a nice security addon,
> as I avoid to call into a non existing function. Basically both tests
> would be equivalent, but this one is IMO better to avoid crashes.

In which case perhaps ASSERT(entry->max_size) between the two if()s?

Jan

