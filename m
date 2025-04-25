Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8CA9C6B8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967654.1357400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Gvj-0005bF-Vi; Fri, 25 Apr 2025 11:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967654.1357400; Fri, 25 Apr 2025 11:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Gvj-0005Zk-Ra; Fri, 25 Apr 2025 11:09:15 +0000
Received: by outflank-mailman (input) for mailman id 967654;
 Fri, 25 Apr 2025 11:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8Gvi-0005Ze-JE
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:09:14 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b71eb53f-21c5-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:09:12 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2264aefc45dso33626105ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:09:12 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22db4dbd3f9sm29359285ad.89.2025.04.25.04.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:09:10 -0700 (PDT)
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
X-Inumbo-ID: b71eb53f-21c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745579351; x=1746184151; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flH7NV7DxjiB5u/XjLHIVVxOBB9ob3xcQlbGaybYu6w=;
        b=VhKYwkjU8CnP7DcQvZWQiYJNaDmIx3VNJs79ZnmHIAIc1XyNAzMkewVvcUSg/7AsAx
         L5bQmC5OAm0+2CNQJNW3BiHm1MELBuvj3DdexaL39awYisVklPI6H4ApjUwPScF3g82b
         BVcm5FiP3WYj26EkuagtF5kICglS2Ep20sXjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579351; x=1746184151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flH7NV7DxjiB5u/XjLHIVVxOBB9ob3xcQlbGaybYu6w=;
        b=J2p2kaj/cAyroCx8EGvlxHq5Bbskn1KmehIPRWiTi/JTZcUX+dAwGGcqYFUz3Gn7Mx
         RJKPdt7sGeoxwYazapy+rLLmR+Ks19YWnWcPCEvT9TYYAFISCLPTwIZ/K9voGhp1in8E
         wCAFA8eh+Tr5QTBqjKfXEc7TEyhymo9/bJMDfkDR5UfG7Pg3jVZFPqbfDepgIy9y+9Yi
         iEEuBiCu/vAy8GaR1XqzqhBcP1oIqLFiTMVltnqbsY7lq2H+g6Dclv944mNYTy7rRmrI
         XKBJS+OacPNxllm5AtggsVt8orihC9jqi7HqNYRIy6I1FGX1fSjXniw/auVJ4OsHBS8E
         GQtA==
X-Forwarded-Encrypted: i=1; AJvYcCVTNYC+/VP5J3ZLWSVCI2cC3cu2qyED0q3JJCjNvWdDVOcbA600wQGM/ArfyvObsN0+L514cOwpbkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCn91BHyEiri/taWmTNAxqeyBlWpkyqb4q8G0J1jq5LzB3p8j2
	BKmVG9RA2zy5MlQWhoTBQZbT7fUk0FurantrXWIWgBc5929R5zUKDxZbCTkGw8k=
X-Gm-Gg: ASbGnctrF6yPBie+6nJJnQ4/JNbStI+GSM4ziu2/Hqu1nuIrKmv3YiSxkQD08e5RhNx
	ADDEckGZTH14osIeggRYQ7WEzoAP7Em+k3jebx21b7RzeG46MxYDoXxVCRZuFaFMaOhNt7mdpq+
	bBT0PXJFh/qwaEAiGjRmiGa9Fm9aG2jiREwzRe+1r9N748T4prKGaWW4xEdX3tkX9lHsPXSoNPz
	QgkutGRI89hhw03fEO/LXqgrnK2nYGEFkVMIA748jcLd7Xvo3G9DTfEPpLmxHNyUkbLc55afwg6
	KxOrxalkBa/7CgZw0XU0G7N5qwX//3Ui92zygu8zwWM4aw==
X-Google-Smtp-Source: AGHT+IHFiaFRamNCy0JEwhpQTZNxw8yTKTeZY8wbDZL+8lLCjxcbegDkF/+CuSZsvX63yNQmZkx/ag==
X-Received: by 2002:a17:902:d4ca:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22dbf5faf1emr34090255ad.24.1745579350650;
        Fri, 25 Apr 2025 04:09:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:09:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Lira, Victor M" <VictorM.Lira@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aAttUBx57tds8WJJ@macbook.lan>
References: <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan>
 <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan>
 <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan>
 <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>
 <aAtPpOq2Kc_N6hBy@macbook.lan>
 <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>

On Fri, Apr 25, 2025 at 11:19:21AM +0200, Jan Beulich wrote:
> On 25.04.2025 11:02, Roger Pau Monné wrote:
> > On Thu, Apr 24, 2025 at 02:38:29PM -0700, Lira, Victor M wrote:
> >> Hello all,
> >>
> >> Here is the output from Roger's patch.
> >> This is the section of interest:
> >>
> >>> (XEN) [ 7.547326] d0 has maximum 3328PIRQs
> >>> (XEN) [ 7.555644] *** Building a PVH Dom0 ***
> >>> (XEN) [ 7.567780] d0: identity mappings for IOMMU:
> >>> (XEN) [ 7.577312]  [00000000a0, 00000000ff] RW
> >>> (XEN) [ 7.586153]  [0000009bff, 0000009fff] RW
> >>> (XEN) [ 7.594992]  [00000cabc9, 00000cc14c] RW
> >>> (XEN) [ 7.603866]  [00000cc389, 00000cc389] RW
> >>> (XEN) [ 7.612707]  [00000cc70a, 00000cd1fe] RW
> >>> (XEN) [ 7.621896]  [00000ce000, 00000cffff] RW
> >>> (XEN) [ 7.630731]  [00000fd000, 00000fd2ff] RW
> >>> (XEN) [ 7.639573]  [00000fd304, 00000febff] RW
> >>> (XEN) [ 7.648414] gfn 0xfe800mfn 0xfe800type 5order 9
> >>> (XEN) [ 7.658985] Xen WARNat arch/x86/mm/p2m-pt.c:599
> >>> (XEN) [ 7.669215] ----[ Xen-4.21-unstable x86_64  debug=y  Tainted:   C
> >>>    ]----
> >>> ...
> >>> (XEN) [ 8.227521] Xen call trace:
> >>> (XEN) [ 8.234107]    [<ffff82d040309bd6>] R
> >>> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> >>> (XEN) [ 8.250925]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> >>> (XEN) [ 8.263579]    [<ffff82d0402fc091>] F
> >>> arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfd/0x6f0
> >>> (XEN) [ 8.280388]    [<ffff82d0402fdcd4>] F set_mmio_p2m_entry+0x62/0x6b
> >>> (XEN) [ 8.293735]    [<ffff82d0402ff9cf>] F map_mmio_regions+0x77/0xcf
> >>> (XEN) [ 8.306734]    [<ffff82d04042fc1b>] F
> >>> drivers/passthrough/x86/iommu.c#identity_map+0x7e/0x196
> >>> (XEN) [ 8.324761]    [<ffff82d040232935>] F
> >>> rangeset_report_ranges+0x10a/0x159
> >>> (XEN) [ 8.339149]    [<ffff82d0404301e6>] F
> >>> arch_iommu_hwdom_init+0x27f/0x316
> >>> (XEN) [ 8.353361]    [<ffff82d04042cffa>] F
> >>> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xa9/0xc1
> >>> (XEN) [ 8.373988]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> >>> (XEN) [ 8.386989]    [<ffff82d040441a30>] F
> >>> dom0_construct_pvh+0x265/0x1141
> >>> (XEN) [ 8.400860]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> >>> (XEN) [ 8.413511]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> >>> (XEN) [ 8.426340]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> >>> (XEN) [ 8.438646]
> >>> (XEN) [ 8.442632]  [00000fec02, 00000fedff] RW
> >>> (XEN) [ 8.451599]  [00000fee01, 00000fffff] RW
> >>> (XEN) [ 8.460571]  [000080f340, 00008501ff] RW
> >>> (XEN) [ 8.470205] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid
> >>> position
> >>> (XEN) [ 8.484769] 0000:03:00.0: not mapping BAR [fe900, fe90f] invalid
> >>> position
> >>> (XEN) [ 8.499330] 0000:03:00.0: not mapping BAR [fe910, fe913] invalid
> >>> position
> >>> (XEN) [ 8.513890] gfn 0xfe910mfn 0xfffffffffffffffftype 1order 0
> >>> (XEN) [ 8.526370] Xen WARNat arch/x86/mm/p2m-pt.c:599
> >>> ...
> >>> (XEN) [ 9.094902] Xen call trace:
> >>> (XEN) [ 9.101491]    [<ffff82d040309bd6>] R
> >>> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> >>> (XEN) [ 9.118306]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> >>> (XEN) [ 9.130957]    [<ffff82d0402fe1fb>] F
> >>> p2m_remove_identity_entry+0x26f/0x2ca
> >>> (XEN) [ 9.145865]    [<ffff82d040268a4a>] F
> >>> vpci_make_msix_hole+0x11a/0x27a
> >>> (XEN) [ 9.159734]    [<ffff82d0402654c4>] F
> >>> drivers/vpci/header.c#modify_decoding+0x4e/0x1b3
> >>> (XEN) [ 9.176547]    [<ffff82d040265c89>] F
> >>> drivers/vpci/header.c#modify_bars+0x660/0x6c4
> >>> (XEN) [ 9.192838]    [<ffff82d040266427>] F
> >>> drivers/vpci/header.c#init_header+0x5e7/0x86f
> >>> (XEN) [ 9.209129]    [<ffff82d04026449c>] F vpci_assign_device+0xd3/0x115
> >>> (XEN) [ 9.222648]    [<ffff82d040430de4>] F
> >>> drivers/passthrough/pci.c#setup_one_hwdom_device+0x92/0x15b
> >>> (XEN) [ 9.241368]    [<ffff82d04043112a>] F
> >>> drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x158/0x241
> >>> (XEN) [ 9.260612]    [<ffff82d04027aad7>] F
> >>> drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> >>> (XEN) [ 9.278814]    [<ffff82d040431513>] F
> >>> setup_hwdom_pci_devices+0x28/0x2f
> >>> (XEN) [ 9.293026]    [<ffff82d04042d009>] F
> >>> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xb8/0xc1
> >>> (XEN) [ 9.313649]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> >>> (XEN) [ 9.326652]    [<ffff82d040441a30>] F
> >>> dom0_construct_pvh+0x265/0x1141
> >>> (XEN) [ 9.340516]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> >>> (XEN) [ 9.353172]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> >>> (XEN) [ 9.365999]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> >>> (XEN) [ 9.378305]
> >>> (XEN) [ 9.382289] 0000:04:00.0: not mapping BAR [fe700, fe77f] invalid
> >>> position
> >>> (XEN) [ 9.396850] 0000:04:00.3: not mapping BAR [fe500, fe5ff] invalid
> >>> position
> >>> (XEN) [ 9.411412] 0000:04:00.4: not mapping BAR [fe400, fe4ff] invalid
> >>> position
> >>> (XEN) [ 9.425972] 0000:05:00.0: not mapping BAR [fe801, fe801] invalid
> >>> position
> >>> (XEN) [ 9.440531] 0000:05:00.1: not mapping BAR [fe800, fe800] invalid
> >>> position
> >>
> >> So vpci_make_msix_hole is where it's getting removed.
> > 
> > Oh, the output is very mangled when displaying the email on my MUA,
> > but I see.  I think I now get what's happening.
> > 
> > Since the BAR falls into a reserved region, the `enabled` bit for it is
> > never set, and thus the handling in msix_accept() never triggers,
> > leaving those accesses unhandled and terminated by the null handler.
> > 
> > I think the patch below should fix it, let me know how it goes.
> 
> Just to mention - "fix" isn't quite the right term here, is it? BARs may
> not live in E820_RESERVED areas. And while we make those up from the EFI
> memory map we're handed, ...

It is a fix IMO, because the 'enabled' bit is not set for those BARs
when they are indeed mapped in the p2m, just not handled by the vPCI
code due to being placed in a E820_RESERVED region.

Due to the 'enabled' bit not being set, the MSI-X handlers didn't
function as expected, even when the BARs are properly mapped.  I'm not
convinced the provided patch is the best way to solve this, I need to
think more carefully about it.  It should however fix the issue
reported.

> > There's also a further known issue with vpci_make_msix_hole(): if the
> > BARs are repositioned the holes are not restored to their previous
> > values, but I don't think you are hitting that issue (yet).
> 
> ... the memory map we're seeing here will go stale once the OS (any; not
> just Xen or Linux) decides to move those BARs. Imo firmware simply may
> not request runtime mappings of BARs.

Indeed, but Xen still needs to keep a consistent view for the guest in
the p2m.  Currently if a PVH dom0 moves BARs inside of a E820_RESERVED
region the MSI-X holes will get out-of-sync with the BAR placements,
and hence MSI-X traps won't work correctly for those devices.

That's however a different issue that the patch provided in the
previous email doesn't fix.

Regards, Roger.

