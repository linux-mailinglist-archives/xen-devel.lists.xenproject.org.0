Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988367FA43F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642247.1001635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dNg-0006Kl-Hw; Mon, 27 Nov 2023 15:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642247.1001635; Mon, 27 Nov 2023 15:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dNg-0006Hy-Eq; Mon, 27 Nov 2023 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 642247;
 Mon, 27 Nov 2023 15:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCh1=HI=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1r7dNe-0005xN-1W
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:18:39 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bd5acb3-8d38-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 16:18:35 +0100 (CET)
Received: from neowutran.ovh (unknown [10.200.200.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id E47C661314;
 Mon, 27 Nov 2023 15:18:31 +0000 (UTC)
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
X-Inumbo-ID: 3bd5acb3-8d38-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1701098312; bh=7NPGcxtH9RhluoakQAhBixQkqHYu5YSF440oIYGP1HE=;
	h=Date:From:To:Cc:Subject:References;
	b=ETzJFxszNp3y61f2EX823PgfNWjwwobpYcHX1PmCR0SZBwlAP3uG0hZDSmZorqgzs
	 Np8VP7/J/f0HoGKud6W5sWGmIyAcLu3uSV8CPpkjmbOG6pk07sHf8SDctS9gscVwzS
	 t6V3txmREZBlphtmGhlGWzKj1facY0Kz4J/ODCsCyrxJcwFuH7wazAaee84i5RATl+
	 VpeGQgTbVCZzy3C8yKpqXkCCqIqzgGhgGegaN6c9mcK79/Wrv++nUt19wIIZYgDjtc
	 pBu4RZYohn7cJwAfOzoTKXsmuyuQzjqCRfFbMb/3t4G8b1+wr1JxUYnFggjQuZcSV3
	 9Zc7mG6hz4K1j3PkdDp0zsnrEeHRSnS9oZ5A5/dZrrLTEIGx8qE3geCfq+gvZ8F5W/
	 nJhLAAP8FDXyuYM6UCYDREf3x3weZgo1d2rC4ibwuSg0KcAusum6glDWIaK2YfLDXA
	 n1w5Dc49N4DmM3dEgHsLHY8A7Bj3U1ecq2cetsH90NjHpFxnW/Ecu//wPQtHljBRAe
	 +CoG0lN8PaRj77/Y1hPNj09PBEuBflOeBImHfi8gpUIkVAzzgvcpwYrGfm+IiibLs9
	 x3V1IllUJOemMNDtTLQg3JXCAJvUOc9SSL5OwhSNA87BQ++8PkapGbZ2PQ6PpiBxJX
	 ABnftd7SRBa07oZpEgPVNfEc=
Date: Mon, 27 Nov 2023 16:18:01 +0100
From: Neowutran <xen@neowutran.ovh>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Neowutran <xen@neowutran.ovh>, Elliott Mitchell <ehem+xen@m5p.com>, 
	Henry Wang <Henry.Wang@arm.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <2lyqb2u7tlcaig7nit3rnw5ftfupfemqmffr4ddsnolcrdojme@kmmlzigrzch3>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47

cab@citrix.com>
 <x4qzfuqkkebjkdfmhw6rvdhrn2ewa6ghjtjqd7xevnuylfahh7@pjratinsg76a>
 <a4b4546a-60b8-4d0e-bdf4-9af6699fb925@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4b4546a-60b8-4d0e-bdf4-9af6699fb925@citrix.com>


Hello, 
Thanks a lot for all the details and explainations ! :)

On 2023-11-27 11:11, Andrew Cooper wrote:
> On 24/11/2023 7:54 pm, Neowutran wrote:
> > Hi, 
> > I did some more tests and research, indeed this patch improved/solved my specific case. 
> >
> > Starting point: 
> >
> > I am using Xen version 4.17.2 (exactly this source https://github.com/QubesOS/qubes-vmm-xen).
> > In the bios (a Asus motherboard), I configured the "local apic" parameter to "X2APIC".
> > For Xen, I did not set the parameter "x2apic-mode" nor the parameter "x2apic_phys". 
> >
> > Case 1:
> > I tryied to boot just like that, result: system is unusuably slow
> >
> > Case 2:
> > Then, I applied a backport of the patch  
 
> > https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw 
> > to the original Xen version of QubesOS and I recompiled. 
> > (https://github.com/neowutran/qubes-vmm-xen/blob/x2apic3/X2APIC.patch)
> > Result: it work, the system is usable. 
> >
> > Case 3:
> > Then, I applied the patch https://github.com/xen-project/xen/commit/26a449ce32cef33f2cb50602be19fcc0c4223ba9
> > to the original Xen version of QubesOS and I recompiled.
> > (https://github.com/neowutran/qubes-vmm-xen/blob/x2apic4/X2APIC.patch)
> > Result: system is  
> > unusuably slow. 
> >
> >
> > In "Case 2", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_mixed". 
> > In "Case 3", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_cluster". 
> >
> >
> > -------------------
> > If you want / need, details for the function "apic_x2apic_probe":
> >
> > Known "input" value:
> >
> > "CONFIG_X2APIC_PHYSICAL" is not defined
> > "iommu_intremap == iommu_intremap_off" = false
> > "acpi 
_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL" -> 0
> > "acpi_gbl_FADT.flags" = 247205 (in decimal)
> > "CONFIG_X2APIC_PHYSICAL" is not defined
> > "CONFIG_X2APIC_MIXED" is defined, because it is the default choice
> > "x2apic_mode" = 0
> > "x2apic_phys" = -1
> >
> >
> >
> > Trace log (I did some call "printk" to trace what was going on)
> > Case 2:
> > (XEN) NEOWUTRAN: X2APIC_MODE: 0 
> > (XEN) NEOWUTRAN: X2APIC_PHYS: -1 
> > (XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
> > (XEN) NEOWUTRAN IOMMU_INTREMAP: different 
> > (XEN) Neowutran: PASSE 2 
> > (XEN) Neowutran: PASSE 4 
> > (XEN) NEOWUTRAN: X2APIC_MODE: 3 
> > (XEN) Neowutran: PASSE 7 
> > (XEN) NEOWUTRAN: X2APIC_MODE: 3 
> >  
> > (XEN) NEOWUTRAN: X2APIC_PHYS: -1 
> > (XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
> > (XEN) NEOWUTRAN IOMMU_INTREMAP: different 
> >
> > Case 3:
> > (XEN) NEOWUTRAN2: X2APIC_PHYS: -1 
> > (XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
> > (XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
> > (XEN) Neowutran2: Passe 1 
> > (XEN) NEO 
WUTRAN2: X2APIC_PHYS: 0 
> > (XEN) Neowutran2: Passe 6 
> > (XEN) Neowutran2: Passe 7 
> > (XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
> > (XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
> > (XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
> > (XEN) Neowutran2: Passe 2 
> > (XEN) Neowutran2: Passe 4 
> > (XEN) Neowutran2: Passe 7
> >
> >
> >
> > If you require the full logs, I could publish the full logs somewhere.
> > ----------------------
> >
> > ( However I do not understand if the root issue is a buggy motherboard, a
> > bug in xen, or if the parameter "X2APIC_PHYSICAL" should have been set
> > by the QubesOS project, or something else)
> 
> Hello,
> 
> Thankyou for the analysis.
> 
> For your base version of QubeOS Xen, was that 4.13.2-5 ?   I can't see
> any APIC changes in the patchqueue, and I believe all relevant bugfixes
> are in 4.17.2, but I'd just like to confirm.

I was using the qubes-vmm-xen release "4.17.2-5" that use xen version
"4.17.2" . I don't see custom modification for APIC in the patchs
applied t 
o Xen by QubesOS

> 
> First, by "unusable slow", other than the speed, did everything else
> appear to operate adequately?  Any chance you could guess the slowdown. 
> i.e. was it half the speed, or "seconds per log console line during
> boot" levels of slow?

Once I was logged in, it took me around 10 minutes to type the command
"sudo dmesg > log"

There was also graphical instabilities (screen display something, then it is black,
few seconds later it display things again. 
Sometime it completly crash and I need to reboot to try to finish the boot+login process),
and unable to start guests due to the system being too slow. 

Some of the logs gathered from "sudo dmesg" that only appear for case 1 and
case 3: 

"
 nvme nvme1: I/O 998 QID 1 timeout, completion polled
 nvme nvme1: I/O 854 QID 5 timeout, completion polled
 ...
 [drm] Fence fallback timer expired on ring sdma0
 [drm] Fence fallback timer expired on ring sdma0
 ...
 [drm] Fence fallback timer expired on ring sdma0
 [drm] Fence fallback timer ex 
pired on ring gfx_0.0.0
 [drm] Fence fallback timer expired on ring gfx_0.0.0
 [drm] Fence fallback timer expired on ring sdma0
 ...
" 
things like that repeated hundreds of times. 

> 
> Having re-reviewed 26a449ce32, the patch is correct but the reasoning is
> wrong.
> 
> ACPI_FADT_APIC_CLUSTER predates x2APIC by almost a decade (it appeared
> in ACPI 3.0), and is not relevant outside of xAPIC mode.  xAPIC has 2
> different logical destination modes, cluster and flat, and their
> applicability is dependent on whether you have fewer or more than 8
> local APICs, hence that property being called out in the ACPI spec.
> 
> x2APIC does not have this property.  DFR was removed from the
> architecture, and logical mode is strictly cluster.  So the bit should
> never have been interpreted on an x2APIC code path.
> 
> Not that it matters in your case - the bit isn't set in your FADT, hence
> why case 1 and 3 have the same behaviour.
> 
> 
> This brings us to case 2, where mixed mode does seem to resolve the per 
f
> problem.
> 
> Since that patch was written, I've learnt how cluster delivery mode
> works for external interrupts, and Xen should never ever have been using
> it (Xen appears to be alone in OS software here).  For an external
> interrupt in Logical cluster mode, it always sends to the lowest ID in
> the cluster.  If that APIC decides that the local processor is too busy
> to handle the interrupt now, it forwards the interrupt to the next APIC
> in the cluster, and this cycle continues until one APIC accepts the message.
> 
> You get most interrupts hitting the lowest APIC in the cluster, but the
> interrupt can be forwarded between APICs for an unbounded quantity of
> time depending on system utilisation.
> 
> 
> Could you please take case 2 and confirm what happens when booting with
> x2apic-mode={physical,cluster}?  If the pattern holds, the physical
> should be fine, and cluster should see the same problems as case 1 and 3.

I confirm that the pattern holds. "physical" is fine and "cluster"
have th 
e same issue as case 1 and case 3. 


> Thanks,
> 
> ~Andrew

Thanks, 
Neowutran
 

