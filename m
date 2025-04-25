Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40087A9C2A9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967513.1357300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ex8-0001Iv-A4; Fri, 25 Apr 2025 09:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967513.1357300; Fri, 25 Apr 2025 09:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ex8-0001Hq-7I; Fri, 25 Apr 2025 09:02:34 +0000
Received: by outflank-mailman (input) for mailman id 967513;
 Fri, 25 Apr 2025 09:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8Ex6-0001Hh-Ka
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:02:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0016cc28-21b4-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 11:02:22 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so393259866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:02:30 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace6e586bc6sm103107666b.75.2025.04.25.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:02:29 -0700 (PDT)
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
X-Inumbo-ID: 0016cc28-21b4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745571750; x=1746176550; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KP1QobxFM1EW/SEc4NqvRxI/iCT2aUT+lwIh2ZrFRAk=;
        b=ajQiESIMLArccuiMLN0e242NW45xnYxHLxV0JaO4Mslc9VeeDkJm8euATYJWk9vFTb
         akHEphJ0X6esW0YDxW7jGZ8+NRonHDlweuqaS1JJUJLBSv2Vqmy44RlxWXSqcfX0Xzah
         ORzG/j+BbwFRb+6MY7daMEMKQn3e2lrGPGLpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571750; x=1746176550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KP1QobxFM1EW/SEc4NqvRxI/iCT2aUT+lwIh2ZrFRAk=;
        b=WSyiaX9JusOeXGmXcXDobaiRHIbm+QpmkqCuvSr/BteTuvT3kbAseidm+OX2nbLggY
         sxhiFZde8XSIjthpYbKbQxmYzgQQAuNGq2puZ7aCHEYhdLLCwqAbaVnCxEzKhhu67Kax
         T/nDSqoPBUy55fg9HdVRpdfRJHJwHY8fDozp6l+4do25PpSMe30jc3rHNhz6OSREdMK3
         L8FkbVUwt1IOEN9k9rt0FGBa7u8aOtOK+D+cE3SOjh8R0ZitMaQ1fH2HaL9R+rY0dJYg
         cZR5rHSC9g5AJ0LDElNWSbkRKw7uLJSdCwPrPZmghpDUm1EBN+P79rGJ8D0K6/mwwlZ5
         LCog==
X-Forwarded-Encrypted: i=1; AJvYcCW5kxaP0NHThhhPRPr2D+FKajtJIBXDnsrH9VR4gToBcIYGHQbORborRxk92gtzBbLYL0RWRw4D4mQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2CSVva0r4RXmH5GLOM0eSRCVSLv5/CnUZJwcgoGY1xGff8lUI
	BVrszPIVBb5UXQw7FiWaHCCTRMCerx8zJAv4M66f5qkSMfU3x4/bT4vSguDM5kU=
X-Gm-Gg: ASbGncuMtpwLubeA2rohDmxbllB1jmrw5/7PMUe0662fLB2+WK/SzOCb7XJHvvQ5dBx
	NPJewBX/QmmpsVziuuQhL1G0bDs2PfzzAKZRruSeUNarB+JwNIrByr2+oQXvVKdFz4pk40ZK+ed
	iP5aSgmTbXTjW5lTGUyVZ2VNthzEW51D6se+cIRk5dTQPt1jdCrMupHbKPC9vZ5SYl4TP3Y29Qk
	8w5STThJfGqGKszi9a/JuHpwieYXh9NJGYlca/s2eGbpR9xA5c9axEuT6AaWSbHJx08svIK84fe
	VTLVQbQvx/Ws7ZhhsFkN62y+8GaBvCfFcP2Mpvv5MWQGU3nmn+Kkh4ce
X-Google-Smtp-Source: AGHT+IEO6iQDJjv6WH/ZvAHd94NzcJ7zUzGc0XJSNcXDsiCwGq7sG/7TcN3rnZzHGgeY49qfX5NDjg==
X-Received: by 2002:a17:907:da9:b0:acb:1165:9a93 with SMTP id a640c23a62f3a-ace5a124befmr547548666b.3.1745571749766;
        Fri, 25 Apr 2025 02:02:29 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:02:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aAtPpOq2Kc_N6hBy@macbook.lan>
References: <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
 <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan>
 <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan>
 <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan>
 <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>

On Thu, Apr 24, 2025 at 02:38:29PM -0700, Lira, Victor M wrote:
> Hello all,
> 
> Here is the output from Roger's patch.
> This is the section of interest:
> 
> > (XEN) [ 7.547326] d0 has maximum 3328PIRQs
> > (XEN) [ 7.555644] *** Building a PVH Dom0 ***
> > (XEN) [ 7.567780] d0: identity mappings for IOMMU:
> > (XEN) [ 7.577312]  [00000000a0, 00000000ff] RW
> > (XEN) [ 7.586153]  [0000009bff, 0000009fff] RW
> > (XEN) [ 7.594992]  [00000cabc9, 00000cc14c] RW
> > (XEN) [ 7.603866]  [00000cc389, 00000cc389] RW
> > (XEN) [ 7.612707]  [00000cc70a, 00000cd1fe] RW
> > (XEN) [ 7.621896]  [00000ce000, 00000cffff] RW
> > (XEN) [ 7.630731]  [00000fd000, 00000fd2ff] RW
> > (XEN) [ 7.639573]  [00000fd304, 00000febff] RW
> > (XEN) [ 7.648414] gfn 0xfe800mfn 0xfe800type 5order 9
> > (XEN) [ 7.658985] Xen WARNat arch/x86/mm/p2m-pt.c:599
> > (XEN) [ 7.669215] ----[ Xen-4.21-unstable x86_64  debug=y  Tainted:   C
> >    ]----
> > ...
> > (XEN) [ 8.227521] Xen call trace:
> > (XEN) [ 8.234107]    [<ffff82d040309bd6>] R
> > arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> > (XEN) [ 8.250925]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> > (XEN) [ 8.263579]    [<ffff82d0402fc091>] F
> > arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfd/0x6f0
> > (XEN) [ 8.280388]    [<ffff82d0402fdcd4>] F set_mmio_p2m_entry+0x62/0x6b
> > (XEN) [ 8.293735]    [<ffff82d0402ff9cf>] F map_mmio_regions+0x77/0xcf
> > (XEN) [ 8.306734]    [<ffff82d04042fc1b>] F
> > drivers/passthrough/x86/iommu.c#identity_map+0x7e/0x196
> > (XEN) [ 8.324761]    [<ffff82d040232935>] F
> > rangeset_report_ranges+0x10a/0x159
> > (XEN) [ 8.339149]    [<ffff82d0404301e6>] F
> > arch_iommu_hwdom_init+0x27f/0x316
> > (XEN) [ 8.353361]    [<ffff82d04042cffa>] F
> > drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xa9/0xc1
> > (XEN) [ 8.373988]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> > (XEN) [ 8.386989]    [<ffff82d040441a30>] F
> > dom0_construct_pvh+0x265/0x1141
> > (XEN) [ 8.400860]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> > (XEN) [ 8.413511]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> > (XEN) [ 8.426340]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> > (XEN) [ 8.438646]
> > (XEN) [ 8.442632]  [00000fec02, 00000fedff] RW
> > (XEN) [ 8.451599]  [00000fee01, 00000fffff] RW
> > (XEN) [ 8.460571]  [000080f340, 00008501ff] RW
> > (XEN) [ 8.470205] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid
> > position
> > (XEN) [ 8.484769] 0000:03:00.0: not mapping BAR [fe900, fe90f] invalid
> > position
> > (XEN) [ 8.499330] 0000:03:00.0: not mapping BAR [fe910, fe913] invalid
> > position
> > (XEN) [ 8.513890] gfn 0xfe910mfn 0xfffffffffffffffftype 1order 0
> > (XEN) [ 8.526370] Xen WARNat arch/x86/mm/p2m-pt.c:599
> > ...
> > (XEN) [ 9.094902] Xen call trace:
> > (XEN) [ 9.101491]    [<ffff82d040309bd6>] R
> > arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> > (XEN) [ 9.118306]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> > (XEN) [ 9.130957]    [<ffff82d0402fe1fb>] F
> > p2m_remove_identity_entry+0x26f/0x2ca
> > (XEN) [ 9.145865]    [<ffff82d040268a4a>] F
> > vpci_make_msix_hole+0x11a/0x27a
> > (XEN) [ 9.159734]    [<ffff82d0402654c4>] F
> > drivers/vpci/header.c#modify_decoding+0x4e/0x1b3
> > (XEN) [ 9.176547]    [<ffff82d040265c89>] F
> > drivers/vpci/header.c#modify_bars+0x660/0x6c4
> > (XEN) [ 9.192838]    [<ffff82d040266427>] F
> > drivers/vpci/header.c#init_header+0x5e7/0x86f
> > (XEN) [ 9.209129]    [<ffff82d04026449c>] F vpci_assign_device+0xd3/0x115
> > (XEN) [ 9.222648]    [<ffff82d040430de4>] F
> > drivers/passthrough/pci.c#setup_one_hwdom_device+0x92/0x15b
> > (XEN) [ 9.241368]    [<ffff82d04043112a>] F
> > drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x158/0x241
> > (XEN) [ 9.260612]    [<ffff82d04027aad7>] F
> > drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> > (XEN) [ 9.278814]    [<ffff82d040431513>] F
> > setup_hwdom_pci_devices+0x28/0x2f
> > (XEN) [ 9.293026]    [<ffff82d04042d009>] F
> > drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xb8/0xc1
> > (XEN) [ 9.313649]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> > (XEN) [ 9.326652]    [<ffff82d040441a30>] F
> > dom0_construct_pvh+0x265/0x1141
> > (XEN) [ 9.340516]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> > (XEN) [ 9.353172]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> > (XEN) [ 9.365999]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> > (XEN) [ 9.378305]
> > (XEN) [ 9.382289] 0000:04:00.0: not mapping BAR [fe700, fe77f] invalid
> > position
> > (XEN) [ 9.396850] 0000:04:00.3: not mapping BAR [fe500, fe5ff] invalid
> > position
> > (XEN) [ 9.411412] 0000:04:00.4: not mapping BAR [fe400, fe4ff] invalid
> > position
> > (XEN) [ 9.425972] 0000:05:00.0: not mapping BAR [fe801, fe801] invalid
> > position
> > (XEN) [ 9.440531] 0000:05:00.1: not mapping BAR [fe800, fe800] invalid
> > position
> 
> So vpci_make_msix_hole is where it's getting removed.

Oh, the output is very mangled when displaying the email on my MUA,
but I see.  I think I now get what's happening.

Since the BAR falls into a reserved region, the `enabled` bit for it is
never set, and thus the handling in msix_accept() never triggers,
leaving those accesses unhandled and terminated by the null handler.

I think the patch below should fix it, let me know how it goes.

There's also a further known issue with vpci_make_msix_hole(): if the
BARs are repositioned the holes are not restored to their previous
values, but I don't think you are hitting that issue (yet).

Thanks, Roger.
---
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index f3804ce047a3..bcdeffc16a95 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -158,12 +158,10 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
-        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
         unsigned int i;
 
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
-            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
+            if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
                 return msix;
     }
 
@@ -392,7 +390,7 @@ static int cf_check msix_read(
         return rc;
     }
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    if ( !msix->enabled || !access_allowed(msix->pdev, addr, len) )
     {
         read_unlock(&d->pci_lock);
         return X86EMUL_OKAY;
@@ -539,7 +537,7 @@ static int cf_check msix_write(
         return rc;
     }
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    if ( !msix->enabled || !access_allowed(msix->pdev, addr, len) )
     {
         read_unlock(&d->pci_lock);
         return X86EMUL_OKAY;


