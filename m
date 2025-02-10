Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE1A2E86E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884519.1294230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQcD-0006aw-0D; Mon, 10 Feb 2025 10:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884519.1294230; Mon, 10 Feb 2025 10:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQcC-0006Yj-TR; Mon, 10 Feb 2025 10:02:08 +0000
Received: by outflank-mailman (input) for mailman id 884519;
 Mon, 10 Feb 2025 10:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uJm=VB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thQcB-0006Wq-0Y
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:02:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14d45b0d-e796-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:02:05 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so811253466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:02:05 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b73f8csm7492702a12.8.2025.02.10.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 02:02:04 -0800 (PST)
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
X-Inumbo-ID: 14d45b0d-e796-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739181725; x=1739786525; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59hstfw6SvPqkBVZTOucYXMNjtdlU1fqhpIS3aG5YGQ=;
        b=m7KwOzNf3nAi+SYOiJUhcVB/E4/DSF2euDS5KGTiV0FmWMtbgHv1A3oCT3Z5DMxjzp
         IOfN3eVH2ayXv8KE+NC4zIxp3vdvCziLT38PqnRMfwUHfCzy1Cl/ZmmR0BGQbqqbdKkw
         +XB0Q4z6HQZWXZW/vb2XXQLCZrHmcYomYIVCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181725; x=1739786525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59hstfw6SvPqkBVZTOucYXMNjtdlU1fqhpIS3aG5YGQ=;
        b=BNNuBHMMRFbI02jhJY1yIoaVtIAWLLv0SLLmDAhMWJBqF1aO2VV9lZX5VZC/lUBYtX
         ddsrny6SQw2SxK1iZdIvLmSysSb0Wk0aMAYedWW+6dlYKCpDH8rGZkk/XV9OfNCUtYb1
         Zc/aYjCz2M/K+3xQreCWuNwSjSlbBWRH78VbkJNuQyxp6suwFRxmJTOHBSDnRgiCn4Tx
         agCz5GyO7YeNUk9hkWDTasUqFei784admZ6vegB2Tlt4yFabM4Wjt8fFzIWRQWd+06T5
         b/nEWGQZId/8v1WL4Bey+5mOtVmNCQ7qiGDZ2GwExET96LCMGEiE4p++oqABCtmjLCsk
         3/CQ==
X-Gm-Message-State: AOJu0YyWGxr3AGybsrliPROYNTZJb+e0dYygTnl6bGOeNI0seESHvulv
	FvKsydiCXcz0sG6SzG3Nq01bxtTN/ZBJynZX0o8R2gsUu1rUOANWKYKI3iJH3E8TZIcbxE+AKFp
	e
X-Gm-Gg: ASbGncsUsa5XCbIUUCEg5ACrXCUTiS9iGrEYBNim84XBUTq9Ct4pPQ5+WPP0316IR4O
	gy/Q8PRakRHF9J5O4pVetyQKH87jNPLxK6LzvRd8JqKcW0fafh1EAzGmqEv7TJtyTRu9lQAOvUo
	IZQcoTb8EQA0kZPAfaPRJCzWnKu7MFTfQzbMOz+qBX0xA5+eppz/VXZynpSN7rKGSDCfet2KALN
	PfPi8tRXPOSDVHtdZZ7+h4FNcGBv64iHmueXyfEb+PUGJeuZA8C5Pq33ReIDu34eBNwI7Lf7axC
	03pdIpnBFvZnVE5xBnw6fMuH2Q==
X-Google-Smtp-Source: AGHT+IHtSmtRmDjcTzIpnoh9sKCH62jaLNrJEwTuhL+ijyq1/p8iDmjlq0+QwMQaI2kmLdq4AaZyNg==
X-Received: by 2002:a17:907:2cc5:b0:ab3:3b92:8ca5 with SMTP id a640c23a62f3a-ab76e8982cbmr1788079266b.12.1739181724649;
        Mon, 10 Feb 2025 02:02:04 -0800 (PST)
Date: Mon, 10 Feb 2025 11:02:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20? v2 0/5] xen/x86: prevent local APIC errors at
 shutdown
Message-ID: <Z6nOmwdp8iRNmkzh@macbook.local>
References: <20250206150615.52052-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>

Hello,

This should have had a 'for-4.20?' tag in the subject name, as
otherwise we will need to add an errata to the release notes to notice
that reboot can sometimes fail on AMD boxes.

Also adding Oleksii.

Thanks, Roger.

On Thu, Feb 06, 2025 at 04:06:10PM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series aims to prevent local APIC errors from stalling the
> shtudown process.  On XenServer testing we have seen reports of AMD
> boxes sporadically getting stuck in a spam of:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Messages during shutdown, as a result of device interrupts targeting
> CPUs that are offline (and have the local APIC disabled).
> 
> First patch strictly solves the issue of shutdown getting stuck, further
> patches aim to quiesce interrupts from all devices (known by Xen) as an
> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
> make kexec more reliable.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (5):
>   x86/shutdown: offline APs with interrupts disabled on all CPUs
>   x86/irq: drop fixup_irqs() parameters
>   x86/smp: perform disabling on interrupts ahead of AP shutdown
>   x86/pci: disable MSI(-X) on all devices at shutdown
>   x86/iommu: disable interrupts at shutdown
> 
>  xen/arch/x86/crash.c                        |  2 ++
>  xen/arch/x86/include/asm/irq.h              |  4 +--
>  xen/arch/x86/include/asm/msi.h              |  1 +
>  xen/arch/x86/irq.c                          | 30 ++++++++-----------
>  xen/arch/x86/msi.c                          | 18 +++++++++++
>  xen/arch/x86/smp.c                          | 33 +++++++++++++++------
>  xen/arch/x86/smpboot.c                      |  2 +-
>  xen/drivers/passthrough/amd/iommu.h         |  1 +
>  xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
>  xen/drivers/passthrough/iommu.c             |  6 ++++
>  xen/drivers/passthrough/pci.c               | 33 +++++++++++++++++++++
>  xen/drivers/passthrough/vtd/iommu.c         | 19 ++++++++++++
>  xen/include/xen/iommu.h                     |  3 ++
>  xen/include/xen/pci.h                       |  4 +++
>  15 files changed, 145 insertions(+), 29 deletions(-)
> 
> -- 
> 2.46.0
> 

