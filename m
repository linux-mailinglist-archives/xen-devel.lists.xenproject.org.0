Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965171DAE0D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 10:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKTp-0001qo-B2; Wed, 20 May 2020 08:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jY/2=7C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jbKTn-0001qj-OY
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 08:53:35 +0000
X-Inumbo-ID: 63305f32-9a77-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63305f32-9a77-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 08:53:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B86EAB76;
 Wed, 20 May 2020 08:53:36 +0000 (UTC)
Subject: Re: grant table issues mapping a ring order 10
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
References: <alpine.DEB.2.21.2005191252040.27502@sstabellini-ThinkPad-T480s>
 <03bad8fd-9826-7652-1c08-549e22634f8d@suse.com>
Message-ID: <ecd0bdf8-6e65-24a7-8383-c244853f7ae6@suse.com>
Date: Wed, 20 May 2020 10:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <03bad8fd-9826-7652-1c08-549e22634f8d@suse.com>
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
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.05.20 08:00, Jürgen Groß wrote:
> On 19.05.20 23:21, Stefano Stabellini wrote:
>> Hi Juergen, Boris,
>>
>> I am trying to increase the size of the rings used for Xen 9pfs
>> connections for performance reasons and also to reduce the likehood of
>> the backend having to wait on the frontend to free up space from the
>> ring.
>>
>> FYI I realized that we cannot choose order 11 or greater in Linux
>> because then we incur into the hard limit CONFIG_FORCE_MAX_ZONEORDER=11.
>> But that is not the reason why I am writing to you :-)
>>
>>
>> The reason why I am writing is that even order 10 fails for some
>> grant-table related reason I cannot explain. There are two rings, each
>> of them order 10. Mapping the first ring results into an error. (Order 9
>> works fine, resulting in both rings being mapped correctly.)
>>
>> QEMU tries to map the refs but gets an error:
>>
>>    gnttab: error: mmap failed: Invalid argument
>>    xen be: 9pfs-0: xen be: 9pfs-0: xengnttab_map_domain_grant_refs 
>> failed: Invalid argument
>>    xengnttab_map_domain_grant_refs failed: Invalid argument
>>
>> The error comes from Xen. The hypervisor returns GNTST_bad_gntref to
>> Linux (drivers/xen/grant-table.c:gnttab_map_refs). Then:
>>
>>          if (map->map_ops[i].status) {
>>             err = -EINVAL;
>>             continue;
>>         }
>>
>> So Linux returns -EINVAL to QEMU. The ref seem to be garbage. The
>> following printks are in Xen in the implemenation of map_grant_ref:
>>
>> (XEN) DEBUG map_grant_ref 1017 ref=998 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=999 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=2050669706 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x7a3abc8a for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=19 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=56423797 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x35cf575 for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=348793 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x55279 for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=2070386184 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x7b679608 for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=3421871 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=875999099 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af7b for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=2705045486 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa13bb7ee for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=4294967295 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0xffffffff for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=213291910 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0xcb69386 for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=4912 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0x1330 for d1
>> (XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=24 nr=2560
>> (XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
>> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>> (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
>>
>>
>> Full logs https://pastebin.com/QLTUaUGJ
>> It is worth mentioning that no limits are being reached: we are below
>> 2500 entries per domain and below the 64 pages of grant refs per domain.
>>
>> What it seems to happen is that after ref 999, the next refs are garbage.
>> Do you have any ideas why?
> 
> I don't think there is enough space for all the needed grant refs in the
> initial interface page passed via Xenstore. So how do you pass the refs
> to the backend?

Looking into the full log this seems to be the problem: The processing
is starting with ref=9 and the last successful ref is 999, so 991 refs
have been processed. Each ref needs 4 bytes, so a page could hold 1024
refs, but the first 132 bytes of the page are used for other information
resulting in 1024-33 == 991 refs possible.


Juergen

