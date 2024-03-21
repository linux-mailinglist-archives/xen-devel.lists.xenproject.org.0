Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A41885D10
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 17:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696483.1087476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKzy-0004Ny-CU; Thu, 21 Mar 2024 16:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696483.1087476; Thu, 21 Mar 2024 16:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKzy-0004ML-9g; Thu, 21 Mar 2024 16:10:34 +0000
Received: by outflank-mailman (input) for mailman id 696483;
 Thu, 21 Mar 2024 16:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnKzw-0004Kw-V1
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 16:10:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnKzw-0005F0-6d; Thu, 21 Mar 2024 16:10:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnKzw-000776-1f; Thu, 21 Mar 2024 16:10:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=BH1SvWNFn+/0pXsiXRGsXt+pBKip9G+iv18Mri06eEo=; b=mUW/sYbnzfVNUKLHrovqpIIUdF
	82jIS6lIPL7u3OXTnd78rmXJ7GHUFMb+y9+WX2WTwFx3xVPBbIeAlBrY9967mQTnm6sMYvVF4Oq/c
	1La0uwxJcWbdZdH/ZpRlosfMGyELRpvP9YZeUkFz0xxxvTw6sFZmYqM9wwX4J9hTg2xc=;
Message-ID: <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org>
Date: Thu, 21 Mar 2024 16:10:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
 <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
In-Reply-To: <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/03/2024 16:07, Julien Grall wrote:
> (+ Roger)
> 
> Hi Carlo,
> 
> On 15/03/2024 10:58, Carlo Nonato wrote:
>> PGC_static and PGC_extra needs to be preserved when assigning a page.
>> Define a new macro that groups those flags and use it instead of or'ing
>> every time.
>>
>> To make preserved flags even more meaningful, they are kept also when
>> switching state in mark_page_free().
>>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> 
> This patch is introducing a regression in OSStest (and possibly gitlab?):
> 
> Mar 21 12:00:29.533676 (XEN) pg[0] MFN 2211c5 c=0x2c00000000000000 o=0 
> v=0xe40000010007ffff t=0x24
> Mar 21 12:00:42.829785 (XEN) Xen BUG at common/page_alloc.c:1033
> Mar 21 12:00:42.829829 (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y 
> Not tainted ]----
> Mar 21 12:00:42.829857 (XEN) CPU:    12
> Mar 21 12:00:42.841571 (XEN) RIP:    e008:[<ffff82d04022fe1f>] 
> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> Mar 21 12:00:42.841609 (XEN) RFLAGS: 0000000000010282   CONTEXT: 
> hypervisor (d0v8)
> Mar 21 12:00:42.853654 (XEN) rax: ffff83023e3ed06c   rbx: 
> 000000000007ffff   rcx: 0000000000000028
> Mar 21 12:00:42.853689 (XEN) rdx: ffff83047bec7fff   rsi: 
> ffff83023e3ea3e8   rdi: ffff83023e3ea3e0
> Mar 21 12:00:42.865657 (XEN) rbp: ffff83047bec7c10   rsp: 
> ffff83047bec7b98   r8:  0000000000000000
> Mar 21 12:00:42.877647 (XEN) r9:  0000000000000001   r10: 
> 000000000000000c   r11: 0000000000000010
> Mar 21 12:00:42.877682 (XEN) r12: 0000000000000001   r13: 
> 0000000000000000   r14: ffff82e0044238a0
> Mar 21 12:00:42.889652 (XEN) r15: 0000000000000000   cr0: 
> 0000000080050033   cr4: 0000000000372660
> Mar 21 12:00:42.901651 (XEN) cr3: 000000046fe34000   cr2: 00007fb72757610b
> Mar 21 12:00:42.901685 (XEN) fsb: 00007fb726def380   gsb: 
> ffff88801f200000   gss: 0000000000000000
> Mar 21 12:00:42.913646 (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000 
> ss: e010   cs: e008
> Mar 21 12:00:42.913680 (XEN) Xen code around <ffff82d04022fe1f> 
> (common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2):
> Mar 21 12:00:42.925645 (XEN)  d1 1c 00 e8 ad dd 02 00 <0f> 0b 48 85 c9 
> 79 36 0f 0b 41 89 cd 48 c7 47 f0
> Mar 21 12:00:42.937649 (XEN) Xen stack trace from rsp=ffff83047bec7b98:
> Mar 21 12:00:42.937683 (XEN)    0000000000000024 000000007bec7c20 
> 0000000000000001 ffff83046ccda000
> Mar 21 12:00:42.949653 (XEN)    ffff82e000000021 0000000000000016 
> 0000000000000000 0000000000000000
> Mar 21 12:00:42.949687 (XEN)    0000000000000000 0000000000000000 
> 0000000000000028 0000000000000021
> Mar 21 12:00:42.961652 (XEN)    ffff83046ccda000 0000000000000000 
> 00007d2000000000 ffff83047bec7c48
> Mar 21 12:00:42.961687 (XEN)    ffff82d0402302ff ffff83046ccda000 
> 0000000000000100 0000000000000000
> Mar 21 12:00:42.973655 (XEN)    ffff82d0405f0080 00007d2000000000 
> ffff83047bec7c80 ffff82d0402f626c
> Mar 21 12:00:42.985656 (XEN)    ffff83046ccda000 ffff83046ccda640 
> 0000000000000000 0000000000000000
> Mar 21 12:00:42.985690 (XEN)    ffff83046ccda220 ffff83047bec7cb0 
> ffff82d0402f65a0 ffff83046ccda000
> Mar 21 12:00:42.997662 (XEN)    0000000000000000 0000000000000000 
> 0000000000000000 ffff83047bec7cc0
> Mar 21 12:00:43.009660 (XEN)    ffff82d040311f8a ffff83047bec7ce0 
> ffff82d0402bd543 ffff83046ccda000
> Mar 21 12:00:43.009695 (XEN)    ffff83047bec7dc8 ffff83047bec7d08 
> ffff82d04032c524 ffff83046ccda000
> Mar 21 12:00:43.021653 (XEN)    ffff83047bec7dc8 0000000000000002 
> ffff83047bec7d58 ffff82d040206750
> Mar 21 12:00:43.033642 (XEN)    0000000000000000 ffff82d040233fe5 
> ffff83047bec7d48 0000000000000000
> Mar 21 12:00:43.033678 (XEN)    0000000000000002 00007fb72767f010 
> ffff82d0405e9120 0000000000000001
> Mar 21 12:00:43.045654 (XEN)    ffff83047bec7e70 ffff82d040240728 
> 0000000000000007 ffff83023e3b3000
> Mar 21 12:00:43.045690 (XEN)    0000000000000246 ffff83023e2efa90 
> ffff83023e38e000 ffff83023e2efb40
> Mar 21 12:00:43.057609 (XEN)    0000000000000007 ffff83023e3afb80 
> 0000000000000206 ffff83047bec7dc0
> Mar 21 12:00:43.069662 (XEN)    0000001600000001 000000000000ffff 
> e75aaa8d0000000c ac0d6d864e487f62
> Mar 21 12:00:43.069697 (XEN)    000000037fa48d76 0000000200000000 
> ffffffff000003ff 00000002ffffffff
> Mar 21 12:00:43.081647 (XEN)    0000000000000000 00000000000001ff 
> 0000000000000000 0000000000000000
> Mar 21 12:00:43.093646 (XEN) Xen call trace:
> Mar 21 12:00:43.093677 (XEN)    [<ffff82d04022fe1f>] R 
> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> Mar 21 12:00:43.093705 (XEN)    [<ffff82d0402302ff>] F 
> alloc_domheap_pages+0x17d/0x1e4
> Mar 21 12:00:43.105652 (XEN)    [<ffff82d0402f626c>] F 
> hap_set_allocation+0x73/0x23c
> Mar 21 12:00:43.105685 (XEN)    [<ffff82d0402f65a0>] F 
> hap_enable+0x138/0x33c
> Mar 21 12:00:43.117646 (XEN)    [<ffff82d040311f8a>] F 
> paging_enable+0x2d/0x45
> Mar 21 12:00:43.117679 (XEN)    [<ffff82d0402bd543>] F 
> hvm_domain_initialise+0x185/0x428
> Mar 21 12:00:43.129652 (XEN)    [<ffff82d04032c524>] F 
> arch_domain_create+0x3e7/0x4c1
> Mar 21 12:00:43.129687 (XEN)    [<ffff82d040206750>] F 
> domain_create+0x4cc/0x7e2
> Mar 21 12:00:43.141665 (XEN)    [<ffff82d040240728>] F 
> do_domctl+0x1850/0x192d
> Mar 21 12:00:43.141699 (XEN)    [<ffff82d04031a96a>] F 
> pv_hypercall+0x617/0x6b5
> Mar 21 12:00:43.153656 (XEN)    [<ffff82d0402012ca>] F 
> lstar_enter+0x13a/0x140
> Mar 21 12:00:43.153689 (XEN)
> Mar 21 12:00:43.153711 (XEN)
> Mar 21 12:00:43.153731 (XEN) ****************************************
> Mar 21 12:00:43.165647 (XEN) Panic on CPU 12:
> Mar 21 12:00:43.165678 (XEN) Xen BUG at common/page_alloc.c:1033
> Mar 21 12:00:43.165703 (XEN) ****************************************
> Mar 21 12:00:43.177633 (XEN)
> Mar 21 12:00:43.177662 (XEN) Manual reset required ('noreboot' specified)
> 
> The code around the BUG is:
> 
>          /* Reference count must continuously be zero for free pages. */
>          if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
>          {
>              printk(XENLOG_ERR
>                     "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
>                     i, mfn_x(page_to_mfn(pg + i)),
>                     pg[i].count_info, pg[i].v.free.order,
>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
>              BUG();
>          }
> 
> Now that you are preserving some flags, you also want to modify the 
> condition. I haven't checked the rest of the code, so there might be 
> some adjustments necessary.

Actually maybe the condition should not be adjusted. I think it would be 
wrong if a free pages has the flag PGC_extra set. Any thoughts?

Cheers,

-- 
Julien Grall

