Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD88A77C09
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934342.1336071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbe0-0006gA-3z; Tue, 01 Apr 2025 13:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934342.1336071; Tue, 01 Apr 2025 13:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbe0-0006eI-1J; Tue, 01 Apr 2025 13:27:08 +0000
Received: by outflank-mailman (input) for mailman id 934342;
 Tue, 01 Apr 2025 13:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbdy-0006e9-QZ
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:27:06 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0027a2ed-0efd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:27:05 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-301d6cbbd5bso8893384a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:27:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2291eee0bfdsm88335955ad.72.2025.04.01.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:27:02 -0700 (PDT)
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
X-Inumbo-ID: 0027a2ed-0efd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743514023; x=1744118823; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/P6zE2mL8Ng1bH7wNcqBTKLcot4sfQX+ZxLrcuajBU=;
        b=UgFMmLt9ZrrBd+wIXoWd6BDCAZr+yN+uIFum3BUhmoIkj9Cuyco2ZJnBbHDwli8Nab
         rCRyvANUMZ81yoCK0mf7BjdzPxHu88w5JC6x0AoX//fHZ49QAZ39gS8qdVh/LT9aPteD
         0CGf9YhtzT6akvIcz/GVg/apC1fH1rBOAy+1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514023; x=1744118823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/P6zE2mL8Ng1bH7wNcqBTKLcot4sfQX+ZxLrcuajBU=;
        b=ut4p6Lju/Im92r/RarZoiPT9s/3cP0zMKrbhkR9kIZn1rvfsrMMiheH5q1KSleVIIM
         oSk3ig9bk4xUo2dexLtnNyX/uvh3HeCeWZq2/mXSu9Zngzn/7ywUheExjygdZ2yi9Vji
         BV6V65Lb5DcNMBeKbs881PP34ZuYBqKxp45EM+QBa1F6wBwe0FpEsv9q3z/r/k2P1lhT
         Xv8MSfvPAADsPmH/tL1Ie5dLXBRooOb0JtiT1RGfMJOFoX9qW1NPRK0aEPR27YhLMyN3
         RN0dHF8QXikpbftjBEQ2g+BbTE/8rEbjxnJbnwSNVfpzLHLmizVaEHMb74s3EDyE1Nwy
         Q3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWOr7RnbY52CwTRrqPo80RZL84BvxVa0rAzTldFn4EeEOZ8xVvyI+LCx5TDHn1dTCrtBqzYQVa5A0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj5j1vOD2A8aomkf0J9HVVC6N/Y0hlIUtdHGqM0yowk68nKBoM
	zXadbyTbcidys8JdjalxdKmu0FFXPrmBzXtdeuHW31lPlz0cv66e2euRCulcnBE=
X-Gm-Gg: ASbGncuvYNUlKTg6OB4be/cfeKIn5LRU7l5te+mOYQCC2qirUzgjSO8+O/3TCVJucv7
	v984CET+LPcIZ0iwlhg8DdkYhnwXMgUP2NaYnZpAOGvEpfsPpNmErYT4GSA2psmPIoPOWuBvn51
	9xWlGJSOrk84ghfq4dPAusOmcXBbebFtfcKvwlpl6f+s+S2VVjgx+/3VtkUAZtg17koV/3Kpw5p
	ZYRP6FezCwqUursz8x1FjK6iO5DErQmqIcE+LuGvjFAlOpfbDGOCV0uM41jU4Cr4N9lQ/JxUvpP
	ZLvGekE5xfsgRIdzG+asUV05RVJo9WXDLd1X2cccgQGTxGwPgw==
X-Google-Smtp-Source: AGHT+IFz0phDLuDwLdRjon3b8HeLoAsC6aO+gfIyHRul27N+fvrvbn040xWYs3no5Q4Yrq/vOmgzJQ==
X-Received: by 2002:a17:90b:1f8b:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30531f928cdmr21437266a91.9.1743514023425;
        Tue, 01 Apr 2025 06:27:03 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:26:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
Message-ID: <Z-vpoh858ldjXok_@macbook.local>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>

On Tue, Apr 01, 2025 at 03:13:52PM +0200, Jan Beulich wrote:
> On 01.04.2025 15:08, Roger Pau Monne wrote:
> > Hello,
> > 
> > The following series aim to remove the presence of any write and execute
> > section in the PE Xen image.  This is required to support the NX
> > compatible flag in the PE header.   By the end of the series the
> > resulting PE image has no relocations that apply to text sections, as
> > text sections are strictly mapped read-execute only.  Xen itself
> > attempting to apply relocations to text would result in page-faults.
> > 
> > A smoke test is added to Gitlab to ensure the PE NX support doesn't
> > regress.
> > 
> > Only patches 5 and 10 are carried over from v1, the rest are new.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (11):
> >   automation/dockers: add to README how to rebuild all containers
> >   x86/mkreloc: fix obtaining PE image base address
> >   x86/mkreloc: use the string table to get names
> >   x86/mkreloc: print the linear address of relocations to read-only
> >     sections
> >   xen: remove -N from the linker command line
> >   x86/efi: discard .text.header for PE binary
> >   x86/efi: discard multiboot related entry code for PE binary
> >   x86/boot: place trampoline code in a non-execute section
> >   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
> >   x86/efi: do not merge all .init sections
> >   automation/x86: add a xen.efi test with a strict NX OVMF build
> > 
> >  automation/build/README.md                   |  7 ++
> >  automation/build/fedora/41-x86_64.dockerfile |  5 ++
> >  automation/gitlab-ci/test.yaml               |  9 +++
> >  automation/scripts/qemu-smoke-x86-64-efi.sh  | 22 +++++-
> >  xen/arch/arm/Makefile                        |  6 +-
> >  xen/arch/ppc/Makefile                        |  6 +-
> >  xen/arch/riscv/Makefile                      |  6 +-
> >  xen/arch/x86/Makefile                        | 12 +--
> >  xen/arch/x86/boot/head.S                     |  3 +-
> >  xen/arch/x86/efi/efi-boot.h                  |  7 +-
> >  xen/arch/x86/efi/mkreloc.c                   | 77 +++++++++++++++++---
> >  xen/arch/x86/xen.lds.S                       | 20 +++--
> >  12 files changed, 138 insertions(+), 42 deletions(-)
> 
> From titles and diffstat (all Makefile changes being covered by patch 05)
> it looks like you still don't add passing --nxcompat to the linker. Is
> that intentionally left out here?

Hm, and I see I also failed to add (the already RB patch) "xen/build:
warn about RWX load segments".

nxcompat should be enabled by default I think?  I can of course make
it explicit by adding to the PE link command line.

Thanks, Roger.

