Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12152294C7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 11:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyAyH-00059P-Kd; Wed, 22 Jul 2020 09:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/5f=BB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jyAyF-00059K-BW
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:23:27 +0000
X-Inumbo-ID: fc87ac42-cbfc-11ea-a18b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc87ac42-cbfc-11ea-a18b-12813bfff9fa;
 Wed, 22 Jul 2020 09:23:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA4D3B052;
 Wed, 22 Jul 2020 09:23:28 +0000 (UTC)
Subject: Re: [xen-unstable test] 152067: regressions - trouble:
 fail/pass/starved
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-152067-mainreport@xen.org>
 <20200722083805.GT7191@Air-de-Roger>
 <d3ba53f3-aae0-b8f1-4205-fedcd59e2243@suse.com>
 <20200722090259.GU7191@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c69e8dd0-97ba-545c-fc58-748012513cd7@suse.com>
Date: Wed, 22 Jul 2020 11:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722090259.GU7191@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 osstest service owner <osstest-admin@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.20 11:02, Roger Pau Monné wrote:
> On Wed, Jul 22, 2020 at 10:59:48AM +0200, Jürgen Groß wrote:
>> On 22.07.20 10:38, Roger Pau Monné wrote:
>>> On Wed, Jul 22, 2020 at 12:37:46AM +0000, osstest service owner wrote:
>>>> flight 152067 xen-unstable real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/152067/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>    test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 152045
>>>
>>> Failure was caused by:
>>>
>>> Jul 21 16:20:58.985209 [  530.412043] libxl-save-help: page allocation failure: order:4, mode:0x60c0c0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null)
>>> Jul 21 16:21:00.378548 [  530.412261] libxl-save-help cpuset=/ mems_allowed=0
>>> Jul 21 16:21:00.378622 [  530.412318] CPU: 1 PID: 15485 Comm: libxl-save-help Not tainted 4.19.80+ #1
>>> Jul 21 16:21:00.390740 [  530.412377] Hardware name: Dell Inc. PowerEdge R420/0K29HN, BIOS 2.4.2 01/29/2015
>>> Jul 21 16:21:00.390810 [  530.412448] Call Trace:
>>> Jul 21 16:21:00.402721 [  530.412499]  dump_stack+0x72/0x8c
>>> Jul 21 16:21:00.402801 [  530.412541]  warn_alloc.cold.140+0x68/0xe8
>>> Jul 21 16:21:00.402841 [  530.412585]  __alloc_pages_slowpath+0xc73/0xcb0
>>> Jul 21 16:21:00.414737 [  530.412640]  ? __do_page_fault+0x249/0x4d0
>>> Jul 21 16:21:00.414786 [  530.412681]  __alloc_pages_nodemask+0x235/0x250
>>> Jul 21 16:21:00.426555 [  530.412734]  kmalloc_order+0x13/0x60
>>> Jul 21 16:21:00.426619 [  530.412774]  kmalloc_order_trace+0x18/0xa0
>>> Jul 21 16:21:00.426671 [  530.412816]  alloc_empty_pages.isra.15+0x24/0x60
>>> Jul 21 16:21:00.438447 [  530.412867]  privcmd_ioctl_mmap_batch.isra.18+0x303/0x320
>>> Jul 21 16:21:00.438507 [  530.412918]  ? vmacache_find+0xb0/0xb0
>>> Jul 21 16:21:00.450475 [  530.412957]  privcmd_ioctl+0x253/0xa9b
>>> Jul 21 16:21:00.450540 [  530.412996]  ? mmap_region+0x226/0x630
>>> Jul 21 16:21:00.450592 [  530.413043]  ? selinux_mmap_file+0xb0/0xb0
>>> Jul 21 16:21:00.462757 [  530.413084]  ? selinux_file_ioctl+0x15c/0x200
>>> Jul 21 16:21:00.462823 [  530.413136]  do_vfs_ioctl+0x9f/0x630
>>> Jul 21 16:21:00.474698 [  530.413177]  ksys_ioctl+0x5b/0x90
>>> Jul 21 16:21:00.474762 [  530.413224]  __x64_sys_ioctl+0x11/0x20
>>> Jul 21 16:21:00.474813 [  530.413264]  do_syscall_64+0x57/0x130
>>> Jul 21 16:21:00.486480 [  530.413305]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> Jul 21 16:21:00.486548 [  530.413357] RIP: 0033:0x7f4f7ecde427
>>> Jul 21 16:21:00.486600 [  530.413395] Code: 00 00 90 48 8b 05 69 aa 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 39 aa 0c 00 f7 d8 64 89 01 48
>>> Jul 21 16:21:00.510766 [  530.413556] RSP: 002b:00007ffc1ef6eb38 EFLAGS: 00000213 ORIG_RAX: 0000000000000010
>>> Jul 21 16:21:00.522758 [  530.413629] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f4f7ecde427
>>> Jul 21 16:21:00.534632 [  530.413699] RDX: 00007ffc1ef6eb90 RSI: 0000000000205004 RDI: 0000000000000007
>>> Jul 21 16:21:00.534702 [  530.413810] RBP: 00007ffc1ef6ebe0 R08: 0000000000000007 R09: 0000000000000000
>>> Jul 21 16:21:00.547013 [  530.413881] R10: 0000000000000001 R11: 0000000000000213 R12: 000055d754136200
>>> Jul 21 16:21:00.558751 [  530.413951] R13: 00007ffc1ef6f340 R14: 0000000000000000 R15: 0000000000000000
>>> Jul 21 16:21:00.558846 [  530.414079] Mem-Info:
>>> Jul 21 16:21:00.558928 [  530.414123] active_anon:1724 inactive_anon:3931 isolated_anon:0
>>> Jul 21 16:21:00.570481 [  530.414123]  active_file:7862 inactive_file:86530 isolated_file:0
>>> Jul 21 16:21:00.582599 [  530.414123]  unevictable:0 dirty:18 writeback:0 unstable:0
>>> Jul 21 16:21:00.582668 [  530.414123]  slab_reclaimable:4704 slab_unreclaimable:4036
>>> Jul 21 16:21:00.594782 [  530.414123]  mapped:3461 shmem:124 pagetables:372 bounce:0
>>> Jul 21 16:21:00.594849 [  530.414123]  free:1863 free_pcp:16 free_cma:0
>>> Jul 21 16:21:00.606733 [  530.414579] Node 0 active_anon:6896kB inactive_anon:15724kB active_file:31448kB inactive_file:346120kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:13844kB dirty:72kB writeback:0kB shmem:496kB writeback_tmp:0kB unstable:0kB all_unreclaimable? no
>>> Jul 21 16:21:00.630626 [  530.414870] DMA free:1816kB min:92kB low:112kB high:132kB active_anon:0kB inactive_anon:0kB active_file:76kB inactive_file:9988kB unevictable:0kB writepending:0kB present:15980kB managed:14328kB mlocked:0kB kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>>> Jul 21 16:21:00.658448 [  530.415329] lowmem_reserve[]: 0 431 431 431
>>> Jul 21 16:21:00.658513 [  530.415404] DMA32 free:5512kB min:2608kB low:3260kB high:3912kB active_anon:6896kB inactive_anon:15724kB active_file:31372kB inactive_file:336132kB unevictable:0kB writepending:72kB present:508300kB managed:451760kB mlocked:0kB kernel_stack:2848kB pagetables:1488kB bounce:0kB free_pcp:184kB local_pcp:0kB free_cma:0kB
>>> Jul 21 16:21:00.694702 [  530.415742] lowmem_reserve[]: 0 0 0 0
>>> Jul 21 16:21:00.694778 [  530.415806] DMA: 8*4kB (UM) 3*8kB (UM) 4*16kB (UM) 3*32kB (M) 5*64kB (UM) 2*128kB (UM) 4*256kB (UM) 0*512kB 0*1024kB 0*2048kB 0*4096kB = 1816kB
>>> Jul 21 16:21:00.706798 [  530.416015] DMA32: 4*4kB (UH) 459*8kB (MH) 2*16kB (H) 6*32kB (H) 5*64kB (H) 4*128kB (H) 3*256kB (H) 0*512kB 0*1024kB 0*2048kB 0*4096kB = 5512kB
>>> Jul 21 16:21:00.718789 [  530.416287] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
>>> Jul 21 16:21:00.730785 [  530.416413] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
>>> Jul 21 16:21:00.742847 [  530.416538] 94608 total pagecache pages
>>> Jul 21 16:21:00.742881 [  530.416598] 79 pages in swap cache
>>> Jul 21 16:21:00.754859 [  530.416670] Swap cache stats: add 702, delete 623, find 948/1025
>>> Jul 21 16:21:00.754924 [  530.416759] Free swap  = 1947124kB
>>> Jul 21 16:21:00.766880 [  530.416822] Total swap = 1949692kB
>>> Jul 21 16:21:00.766960 [  530.416924] 131070 pages RAM
>>> Jul 21 16:21:00.767021 [  530.416988] 0 pages HighMem/MovableOnly
>>> Jul 21 16:21:00.778697 [  530.417051] 14548 pages reserved
>>>
>>> AFAICT from the kernel config used for the test [0]
>>> CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled, so I'm not sure where
>>> the memory exhaustion is coming from. Maybe 512M is too low for a PVH
>>> dom0, even when using hotplug balloon memory?
>>
>> I don't see how CONFIG_XEN_BALLOON_MEMORY_HOTPLUG would help here, as it
>> will be used for real memory hotplug only. Well, you _can_ use it for
>> mapping of foreign pages, but you'd have to:
>>
>> echo 1 > /proc/sys/xen/balloon/hotplug_unpopulated
> 
> Uh, I've completely missed the point then. I assume there's some
> reason for not doing it by default then? (using empty hotplug ranges
> to map foreign memory)

This dates back to 2015. See commit 1cf6a6c82918c9aad.

I guess we could initialize xen_hotplug_unpopulated with 1 for PVH
dom0.


Juergen


