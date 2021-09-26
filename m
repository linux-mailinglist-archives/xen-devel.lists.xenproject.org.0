Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD0418CE8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 00:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196214.349004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUd1t-0008Tu-Am; Sun, 26 Sep 2021 22:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196214.349004; Sun, 26 Sep 2021 22:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUd1t-0008Qr-7E; Sun, 26 Sep 2021 22:53:53 +0000
Received: by outflank-mailman (input) for mailman id 196214;
 Sun, 26 Sep 2021 22:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YEj3=OQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mUd1r-0008Ql-LM
 for xen-devel@lists.xenproject.org; Sun, 26 Sep 2021 22:53:51 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d0e5166-1f1c-11ec-bc2e-12813bfff9fa;
 Sun, 26 Sep 2021 22:53:50 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 18QMrfNX098393
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 26 Sep 2021 18:53:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 18QMrfqD098392;
 Sun, 26 Sep 2021 15:53:41 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 9d0e5166-1f1c-11ec-bc2e-12813bfff9fa
Date: Sun, 26 Sep 2021 15:53:41 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YVD59QVbmdVwzYQI@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Sep 15, 2021 at 08:05:05AM +0200, Jan Beulich wrote:
> On 15.09.2021 04:40, Elliott Mitchell wrote:
> > On Tue, Sep 07, 2021 at 05:57:10PM +0200, Jan Beulich wrote:
> >> On 07.09.2021 17:03, Elliott Mitchell wrote:
> >>>  Could be this system is in an
> >>> intergenerational hole, and some spot in the PVH/HVM code makes an
> >>> assumption of the presence of NPT guarantees presence of an operational
> >>> IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
> >>> code, some portion of the IOMMU code might be checking for presence of
> >>> NPT instead of presence of IOMMU.
> >>
> >> This is all very speculative; I consider what you suspect not very likely,
> >> but also not entirely impossible. This is not the least because for a
> >> long time we've been running without shared page tables on AMD.
> >>
> >> I'm afraid without technical data and without knowing how to repro, I
> >> don't see a way forward here.
> > 
> > Downtimes are very expensive even for lower-end servers.  Plus there is
> > the issue the system wasn't meant for development and thus never had
> > appropriate setup done.
> > 
> > Experimentation with a system of similar age suggested another candidate.
> > System has a conventional BIOS.  Might some dependancies on the presence
> > of UEFI snuck into the NPT code?
> 
> I can't think of any such, but as all of this is very nebulous I can't
> really rule out anything.

Getting everything right to recreate is rather inexact.  Having an
equivalent of `sysctl` to turn on the serial console while running might
be handy...

Luckily get things together and...

(XEN) mm locking order violation: 48 > 16
(XEN) Xen BUG at mm-locks.h:82
(XEN) ----[ Xen-4.14.3  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    2
(XEN) RIP:    e008:[<ffff82d0402e8be0>] arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
(XEN) RFLAGS: 0000000000010292   CONTEXT: hypervisor (d1v0)
(XEN) rax: ffff83080b2f106c   rbx: ffff83081da0f2d0   rcx: 0000000000000000
(XEN) rdx: ffff83080b27ffff   rsi: 000000000000000a   rdi: ffff82d040469738
(XEN) rbp: ffff82d040580688   rsp: ffff83080b27f8b0   r8:  0000000000000002
(XEN) r9:  0000000000008000   r10: ffff82d04058f381   r11: ffff82d040375100
(XEN) r12: ffff82d040580688   r13: ffff83080b27ffff   r14: ffff83081ddf6000
(XEN) r15: 00000000004f8c00   cr0: 000000008005003b   cr4: 00000000000406e0
(XEN) cr3: 000000081dee6000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0010   gs: 0010   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0402e8be0> (arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260):
(XEN)  e3 0c 00 e8 30 7f f6 ff <0f> 0b 66 0f 1f 44 00 00 42 8b 34 20 48 8d 3d 8d
(XEN) Xen stack trace from rsp=ffff83080b27f8b0:
(XEN)    ffff83081ddf67c8 ffff83081ddf6810 ffff82d040580688 000000081ddf4067
(XEN)    0000000000000001 ffff82d0402ec51c ffff83081ddf6000 0000000000000000
(XEN)    ffff82d0402e0528 ffff83081da0f010 ffff83081dde9000 ffff830800000002
(XEN)    ffff83081ddf6690 0000000000000001 ffff83081dde9000 ffff83081ddf5000
(XEN)    0000000000000000 ffff83081da0f010 ffff83081da0f010 00000000004f8c00
(XEN)    ffff82d0402f009a 0000000000000067 0000000100000000 ffff83080b27fa00
(XEN)    ffff83081dde9000 000000000081ddf4 ffff83081ddf4000 ffff83081da0f010
(XEN)    0000000000000000 0000000000000006 0000000000000000 0000000000000000
(XEN)    ffff83080b27f9f0 ffff82d0402f1097 0000000000000001 0000000000000000
(XEN)    ffffffffffffffff ffff83081ddf6000 ffff83080b27fa00 0000000400000000
(XEN)    0000000000000000 0000000000000000 ffff83081dde9000 0000000000000000
(XEN)    0000000000000000 ffffffffffffffff 0000000000000001 0000000000000001
(XEN)    0000000000000000 ffff83081ddf6000 0000000000000000 ffff82d0402ea0a6
(XEN)    ffffffffffffffff ffff83081da0f010 0000000700000006 ffff8304f8c00000
(XEN)    ffff83081da0f010 0000000000000000 ffff83080b27fba0 ffff83080b27fc98
(XEN)    0000000000000000 ffff82d0402f4ecd ffff83080b27fac8 ffff83080b27fb20
(XEN)    ffff83081ddf6000 ffff83080b27fae0 0000000100000000 0000000000000007
(XEN)    0000000000000002 ffff83081ca88018 ffff830800000000 0000000000000012
(XEN)    ffff82d0402f023f ffff82d0402f02ed 00000000000fa400 ffff82d0402f00ed
(XEN)    ffff83080b27fb38 ffff82d0402e03da 00000000004f8c00 ffff83081dff1e90
(XEN) Xen call trace:
(XEN)    [<ffff82d0402e8be0>] R arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
(XEN)    [<ffff82d0402ec51c>] S p2m_flush_nestedp2m+0x1c/0x30
(XEN)    [<ffff82d0402e0528>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x378/0x490
(XEN)    [<ffff82d0402f009a>] S arch/x86/mm/p2m-pt.c#p2m_next_level.constprop.10+0x24a/0x2e0
(XEN)    [<ffff82d0402f1097>] S arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0x3c7/0x7b0
(XEN)    [<ffff82d0402ea0a6>] S p2m_set_entry+0xa6/0x130
(XEN)    [<ffff82d0402f4ecd>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check+0x1cd/0x440
(XEN)    [<ffff82d0402f023f>] S arch/x86/mm/p2m-pt.c#do_recalc+0x10f/0x470
(XEN)    [<ffff82d0402f02ed>] S arch/x86/mm/p2m-pt.c#do_recalc+0x1bd/0x470
(XEN)    [<ffff82d0402f00ed>] S arch/x86/mm/p2m-pt.c#p2m_next_level.constprop.10+0x29d/0x2e0
(XEN)    [<ffff82d0402e03da>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x22a/0x490
(XEN)    [<ffff82d0402f0fe2>] S arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0x312/0x7b0
(XEN)    [<ffff82d0402f0c4e>] S arch/x86/mm/p2m-pt.c#p2m_pt_get_entry+0x3fe/0x480
(XEN)    [<ffff82d0402f59aa>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check_superpage+0x17a/0x600
(XEN)    [<ffff82d0402f5ba0>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check_superpage+0x370/0x600
(XEN)    [<ffff82d0402f7c78>] S p2m_pod_demand_populate+0x6b8/0xa90
(XEN)    [<ffff82d0402f0aa6>] S arch/x86/mm/p2m-pt.c#p2m_pt_get_entry+0x256/0x480
(XEN)    [<ffff82d0402e9a1f>] S __get_gfn_type_access+0x6f/0x130
(XEN)    [<ffff82d0402ab12b>] S hvm_hap_nested_page_fault+0xeb/0x760
(XEN)    [<ffff82d04028c87e>] S svm_asm_do_resume+0x12e/0x164
(XEN)    [<ffff82d04028c87e>] S svm_asm_do_resume+0x12e/0x164

The stack trace goes further, but I suspect the rest would be overkill.
That seems to readily qualify as "Xen bug".


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



