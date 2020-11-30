Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C62C8378
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 12:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41048.74142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhhK-0003S5-Nl; Mon, 30 Nov 2020 11:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41048.74142; Mon, 30 Nov 2020 11:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhhK-0003Rg-KS; Mon, 30 Nov 2020 11:50:26 +0000
Received: by outflank-mailman (input) for mailman id 41048;
 Mon, 30 Nov 2020 11:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3zd=FE=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kjhhJ-0003Rb-7i
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 11:50:25 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 553e2e2b-eebb-4cdf-a44d-b7a8aa80c1cb;
 Mon, 30 Nov 2020 11:50:23 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AUBoIsU021271
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 12:50:19 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 266502E9CAC; Mon, 30 Nov 2020 12:50:13 +0100 (MET)
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
X-Inumbo-ID: 553e2e2b-eebb-4cdf-a44d-b7a8aa80c1cb
Date: Mon, 30 Nov 2020 12:50:13 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201130115013.GF1084@antioche.eu.org>
References: <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
 <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
 <20201128171430.GB631@antioche.eu.org>
 <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
 <20201130113527.GE1084@antioche.eu.org>
 <7e284ec6-a3a3-6c04-ce48-10a8290304d5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e284ec6-a3a3-6c04-ce48-10a8290304d5@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 30 Nov 2020 12:50:19 +0100 (MET)

On Mon, Nov 30, 2020 at 12:44:23PM +0100, Jan Beulich wrote:
> On 30.11.2020 12:35, Manuel Bouyer wrote:
> > On Mon, Nov 30, 2020 at 11:00:23AM +0100, Jan Beulich wrote:
> >> On 28.11.2020 18:14, Manuel Bouyer wrote:
> >>> On Sat, Nov 28, 2020 at 03:53:11PM +0100, Roger Pau Monné wrote:
> >>>>> the trace is at
> >>>>> http://www-soc.lip6.fr/~bouyer/xen-log13.txt
> >>>>
> >>>> Thanks! I think I've found the issue and I'm attaching a possible fix
> >>>> (fix.patch) to this email. In any case I've also attached a further
> >>>> debug patch, in case the fix turns out to be wrong. Please test the
> >>>> fix first, as the debug patch will end up triggering a panic when the
> >>>> buffer is full.
> >>>
> >>> Yes, fix.patch does make the system boot as expected !
> >>
> >> May I translate this to a Tested-by?
> >>
> >> Patch also
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> Thanks much to both of you for all the effort here!
> > 
> > Also, please don't forget the attached patch !
> > Without it, the hypervisor panics.
> 
> Well - this one still needs a proper description and S-o-b.
> The other one came in immediately consumable shape right away.

The patch was sent by Roger on 12 Nov 2020, in reply to my mail
about the panic. The panic is:

(XEN) Xen call trace:
(XEN)    [<ffff82d08031cc28>] R vpci_msix_arch_mask_entry+0x18/0x20
(XEN)    [<ffff82d08025a38a>] S drivers/vpci/msix.c#msix_write+0x18a/0x2b0
(XEN)    [<ffff82d08030d943>] S arch/x86/hvm/intercept.c#hvm_mmio_write+0x23/0x3
0
(XEN)    [<ffff82d08030dd19>] S hvm_process_io_intercept+0x1e9/0x260
(XEN)    [<ffff82d08030ddad>] S hvm_io_intercept+0x1d/0x40
(XEN)    [<ffff82d0802fe7ba>] S arch/x86/hvm/emulate.c#hvmemul_do_io+0x26a/0x4d0
(XEN)    [<ffff82d080259ef9>] S drivers/vpci/msix.c#msix_accept+0x9/0x20
(XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x36
/0x70
(XEN)    [<ffff82d0802ff005>] S arch/x86/hvm/emulate.c#hvmemul_linear_mmio_access+0x1e5/0x300
(XEN)    [<ffff82d0802fff44>] S arch/x86/hvm/emulate.c#linear_write+0x84/0x160
(XEN)    [<ffff82d080301ca8>] S arch/x86/hvm/emulate.c#hvmemul_write+0xe8/0x100
(XEN)    [<ffff82d0802de6cc>] S x86_emulate+0x289dc/0x2cfb0
(XEN)    [<ffff82d08027c7ab>] S map_domain_page+0x4b/0x600
(XEN)    [<ffff82d080340eaa>] S __get_gfn_type_access+0x6a/0x100
(XEN)    [<ffff82d08034a367>] S arch/x86/mm/p2m-ept.c#ept_next_level+0x107/0x150
(XEN)    [<ffff82d0802e4961>] S x86_emulate_wrapper+0x21/0x60
(XEN)    [<ffff82d08030024f>] S arch/x86/hvm/emulate.c#_hvm_emulate_one+0x4f/0x220
(XEN)    [<ffff82d0803004ed>] S hvmemul_get_seg_reg+0x4d/0x50
(XEN)    [<ffff82d08030042e>] S hvm_emulate_one+0xe/0x10
(XEN)    [<ffff82d08030e4ca>] S hvm_emulate_one_insn+0x3a/0xf0
(XEN)    [<ffff82d0802e4af0>] S x86_insn_is_mem_access+0/0x260
(XEN)    [<ffff82d08030e5c9>] S handle_mmio_with_translation+0x49/0x60
(XEN)    [<ffff82d080305d78>] S hvm_hap_nested_page_fault+0x2c8/0x720
(XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hv(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 13:
(XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
(XEN) ****************************************

This is when it configures the broadcom network interface, which interrupts
at "msix3 vec 0". It is the first MSI-X device configured; the previous
ones are MSI only.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

