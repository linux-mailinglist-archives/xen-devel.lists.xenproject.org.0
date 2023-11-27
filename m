Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F17FA39B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642207.1001546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7czL-0001LY-7J; Mon, 27 Nov 2023 14:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642207.1001546; Mon, 27 Nov 2023 14:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7czL-0001Ic-4P; Mon, 27 Nov 2023 14:53:31 +0000
Received: by outflank-mailman (input) for mailman id 642207;
 Mon, 27 Nov 2023 14:53:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1wO=HI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7czK-0001IW-9A
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:53:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7709f04-8d34-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:53:25 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so2959854f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:53:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040b32edf626sm8532359wmo.31.2023.11.27.06.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:53:24 -0800 (PST)
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
X-Inumbo-ID: b7709f04-8d34-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701096805; x=1701701605; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myBAOJYFsx4wkz4rU0sw7kfl9scNwXPkx5D7RaVVg5Y=;
        b=KZVOIMe5QMAtbKQJU71KfA6mkUDAtXljMJ6RdkVZ2pNF7ETjALxilH8/WcTi6Z/2Zv
         bN37NS/JMNbabJmNVJ4m9k9QA0fQL9a6/KN+3dxfNMvvHOlo4cFA0WV2NrsAiBBdLNwR
         i89zLH+uKu3LeuCa0lcv1lVqcp8luscjAWDPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701096805; x=1701701605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myBAOJYFsx4wkz4rU0sw7kfl9scNwXPkx5D7RaVVg5Y=;
        b=CnYB2uIgrWrJsT1JntxVIqtf3EZBugZCMxMPdoPRhVrwZCwVpdcJFTKC+D/hqD+C9x
         OOp5BcbmSkRWo2gtn1Qe/9NAqk09THixT8S40UEH6kawZdFqnTcMmbY5TD/D5oTw82gc
         S4gRZVczI1lnRgKapuKG4nr/fwrzQi30WivG9vaB4gB30oFxY3qXlep9A8o+CWzubjvk
         bRM1hTpeDGmWf6/UdcXgbICFBDy0rQQF1RjY5DaCu3tsDTEktltGYQ59GfDGUWOnDmkm
         e8YJU9om+hkJkocblDnC+3tImlTLZkiz/GXZk2BHzVIAGtduyrNeYOqP69a58kfQj2ql
         KQEA==
X-Gm-Message-State: AOJu0Yyw8eZz++GNywruaRUw7yojpsR5nMJfRuj30wuTjCrYbZ2DXvh8
	ULicRvwWip9ckBzH41L4PBuwQw==
X-Google-Smtp-Source: AGHT+IErJJqMy2gqG4PnroabFbwfgaSz2K9mSYXh2JNm6jERD+YGieUe0eBo5H8hKvFX7vFhNrIAmA==
X-Received: by 2002:adf:e543:0:b0:32f:7be5:50f with SMTP id z3-20020adfe543000000b0032f7be5050fmr7924484wrm.48.1701096804755;
        Mon, 27 Nov 2023 06:53:24 -0800 (PST)
Date: Mon, 27 Nov 2023 15:53:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Neowutran <xen@neowutran.ovh>, Elliott Mitchell <ehem+xen@m5p.com>,
	Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZWStY7G_Anh1MWHX@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <x4qzfuqkkebjkdfmhw6rvdhrn2ewa6ghjtjqd7xevnuylfahh7@pjratinsg76a>
 <a4b4546a-60b8-4d0e-bdf4-9af6699fb925@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4b4546a-60b8-4d0e-bdf4-9af6699fb925@citrix.com>

On Mon, Nov 27, 2023 at 11:49:03AM +0000, Andrew Cooper wrote:
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
> > "acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL" -> 0
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
> > (XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
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
> 
> First, by "unusable slow", other than the speed, did everything else
> appear to operate adequately?  Any chance you could guess the slowdown. 
> i.e. was it half the speed, or "seconds per log console line during
> boot" levels of slow?
> 
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

FWIW, Jan also pointed out that the ACPI spec mentions xAPIC strictly,
even for ACPI_FADT_APIC_PHYSICAL.  It's possible APIC_PHYSICAL should
also be enforced only in xAPIC mode.  Or it's also possible the ACPI
spec was not updated to mention both xAPIC and x2APIC modes.

Roger.

