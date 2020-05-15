Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F151D453F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 07:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZSy5-0002ZM-VT; Fri, 15 May 2020 05:33:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yAEg=65=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZSy4-0002ZH-M8
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 05:33:08 +0000
X-Inumbo-ID: 8e6dfba4-966d-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e6dfba4-966d-11ea-9887-bc764e2007e4;
 Fri, 15 May 2020 05:33:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 287D2AEED;
 Fri, 15 May 2020 05:33:09 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] xen: add basic hypervisor filesystem support
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-5-jgross@suse.com>
 <db277779-5b1e-a2aa-3948-9e6dd8e8bef0@suse.com>
 <23938228-e947-fe36-8b19-0e89886db9ac@suse.com>
Message-ID: <28dd8109-1815-70cd-834c-53330d5c824d@suse.com>
Date: Fri, 15 May 2020 07:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <23938228-e947-fe36-8b19-0e89886db9ac@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On 14.05.20 11:50, Jürgen Groß wrote:
> On 14.05.20 09:59, Jan Beulich wrote:
>> On 08.05.2020 17:34, Juergen Gross wrote:
>>> +int hypfs_read_dir(const struct hypfs_entry *entry,
>>> +                   XEN_GUEST_HANDLE_PARAM(void) uaddr)
>>> +{
>>> +    const struct hypfs_entry_dir *d;
>>> +    const struct hypfs_entry *e;
>>> +    unsigned int size = entry->size;
>>> +
>>> +    d = container_of(entry, const struct hypfs_entry_dir, e);
>>> +
>>> +    list_for_each_entry ( e, &d->dirlist, list )
>>
>> This function, in particular because of being non-static, makes
>> me wonder how, with add_entry() taking a lock, it can be safe
>> without any locking. Initially I thought the justification might
>> be because all adding of entries is an init-time-only thing, but
>> various involved functions aren't marked __init (and it is at
>> least not implausible that down the road we might see new
>> entries getting added during certain hotplug operations).
>>
>> I do realize that do_hypfs_op() takes the necessary read lock,
>> but then you're still building on the assumption that the
>> function is reachable through only that code path, despite
>> being non-static. An ASSERT() here would be the minimum I guess,
>> but with read locks now being recursive I don't see why you
>> couldn't read-lock here again.
> 
> Right, will add the read-lock.
> 
>>
>> The same goes for other non-static functions, albeit things may
>> become more interesting for functions living on the
>> XEN_HYPFS_OP_write_contents path (because write locks aren't
> 
> Adding an ASSERT() in this regard should be rather easy.

As the type specific read- and write-functions should only be called
through the generic read/write functions I think it is better to have
a percpu variable holding the current locking state and ASSERT() that
to match. This will be cheaper than nesting locks and I don't have to
worry about either write_lock nesting or making _is_write_locked_by_me()
an official interface.


Juergen

