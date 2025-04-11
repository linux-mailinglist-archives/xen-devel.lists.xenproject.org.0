Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FAA8557E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946698.1344492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38rL-0000AR-6n; Fri, 11 Apr 2025 07:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946698.1344492; Fri, 11 Apr 2025 07:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38rL-00007V-2m; Fri, 11 Apr 2025 07:31:31 +0000
Received: by outflank-mailman (input) for mailman id 946698;
 Fri, 11 Apr 2025 07:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u38rJ-00007P-2H
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:31:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8375c7f-16a6-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:31:23 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so886655f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:31:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f233a2f08sm74771535e9.12.2025.04.11.00.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 00:31:22 -0700 (PDT)
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
X-Inumbo-ID: f8375c7f-16a6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744356683; x=1744961483; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MI1biN8NF20WmiJruFT5kx73Vb34Ei4zROcma0NcqJ0=;
        b=BngydtJoeK/sVcGSDxl5jDwuF/tEwT3tCiOJevSSVYR7FRU5BMFKQY6lEh3EMjkkX8
         LD4RE/FGa2IOKiIdqTQkvd0v1lEfBrSx4Kk3g+5KfbNkKYsKDCK9A22Il/SAgFWKlL1p
         t3HLkDfBIgKCjYvFTWMrTo2ppYv6I6O46GxHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356683; x=1744961483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI1biN8NF20WmiJruFT5kx73Vb34Ei4zROcma0NcqJ0=;
        b=InOjz7MZZQ4KaKy2YaISQBeUiSH8nLrCb0auDWIsZYjnu4vE/Tn4lso9KpQ5WVBUXr
         l+e7aABJQzAHU24ryhbh9VPBf/JW2aD01du2ALC37h3ai3ZsGYRsQCP8/VOZsMIDTeGp
         I9VD4kgZRS/7qJhQPQ7RKXrNLQGEQtq6xdl9Y/gNO6WgpIcZ/LJ4wfjfMqEHdLYkL8Cq
         NChouy9GgrPgTI1/W3DgRf7kmzVCvAmXV1OoL/mvKPOKwNMs5tIlxbXUWX5GYNqqkpg9
         bNwkpqDdE4fVqEH+Ayruce0SHMoy5SAlWKzy1ehnXqZUCkeNQlCmHXdb+dbrAQsiqhFu
         3A9w==
X-Forwarded-Encrypted: i=1; AJvYcCXF9QkiCWc+kJqU2uAaSMFGFUMmZFCIbWAuttzQtaXxR1GRMKQf3Ly3jZM98DIPxB3iTtPvN6f/37s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiVxDg2u+FuJtSanUlmRvyzkOhXtO4mEBqzz/RTeiONlQaAmCd
	MYFhct3ymRG6CBC7TNla0o0lry89ak8QqVpWRtujlB1fBrKLTKCceW7VM0aPx5c=
X-Gm-Gg: ASbGncs7V+ZTf5WZV9HRYPVgjTMco7cfUU6v3paSZUYnBcUg91uESSL+aIX6Zf+EosS
	aoMoS9VLVifMBUqn/AeNBP7qmglqV9mWM3+yIUph3w4bA9gM2OzoqsooU2PGrdSLSjX7eSpiOJi
	8A250J4JJzfyo9lQqbXt+3tnWc5gRBILSFtsF2jCiP3INuTLI7OyzK9FathRiIgv45XZTkj2JDt
	JVpsHzUjqz/zv3RYCCmZgSB83xb1xIjkAUYxEWIbCxGG7hqr7JSJnIiigaVMA5fCYUoYHW9vRyC
	dWpzX0UnG/pfDhlaxLWcZVVVHFYGMjCj5OKB6xbAP2ruQA==
X-Google-Smtp-Source: AGHT+IHjgO/saC8eh3qcyKqrNEusmVmrEIecZJYCZPKuyQBEZWsn+Hi/UEgpI9gczvm7S0PIEfI/WA==
X-Received: by 2002:a05:6000:18a2:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39eaaec7db5mr1224381f8f.40.1744356682828;
        Fri, 11 Apr 2025 00:31:22 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:31:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com,
	"Lira, Victor M" <VictorM.Lira@amd.com>
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <Z_jFSb2-efexUNlL@macbook.lan>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
 <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>

Thanks Jason for getting back, I'm intrigued by this issue :).

On Thu, Apr 10, 2025 at 04:55:54PM -0400, Jason Andryuk wrote:
> On 2025-04-04 06:28, Roger Pau Monné wrote:
> > On Thu, Apr 03, 2025 at 06:01:42PM -0700, Stefano Stabellini wrote:
> > > On one Sapphire AMD x86 board, I see this:
> > > 
> > > 
> > > (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
> > > (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
> > > [...]
> > > (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
> > > 
> > > 
> > > Linux boots fine on this platform but Linux as Dom0 on Xen does not.
> > > This is because the pci_check_bar->is_memory_hole check fails due to the
> > > MMIO region overlapping with the EFI reserved region.
> > 
> > That's weird.  (Partially) the reason to not attempt to map such BAR
> > is that it should already be mapped, because at dom0 creation time all
> > reserved regions are added to the p2m (see arch_iommu_hwdom_init()).
> > If that's not the case we should figure out why this reserved region
> > is not added to dom0 p2m as part of arch_iommu_hwdom_init().
> 
> Victor discovered these regions are type 11 EfiMemoryMappedIO, but they get
> converted to e820 RESERVED.  The BAR points into it.
> 
> 00000f0000000-00000f7ffffff type=11 attr=800000000000100d
> 00000fd000000-00000fedfffff type=11 attr=800000000000100d
> 00000fee00000-00000fee00fff type=11 attr=8000000000000001
> 00000fee01000-00000ffffffff type=11 attr=800000000000100d
> 
> Xenia discovered Linux keeps small regions like this reserved, but lets
> larger ones (>= 256kb) become holes.  See the comment in Linux
> arch/x86/platform/efi/efi.c:efi_remove_e820_mmio() around line 301.

Right, but whatever Linux decides to do with the reserved regions
won't affect how Xen maps them into the p2m.  Anything that's reserved
in the e820 should end up identity mapped in the p2m for PVH dom0,
unless it's being exclusively used by Xen (see
dom0_setup_permissions() use of iomem_deny_access() to deny dom0
access to some MMIO regions).

> The description of EfiMemoryMappedIO is a little confusing, which is
> probably why its use in unclear.
> 
> ```
> Table 7.5 Memory Type Usage before ExitBootServices()
> EfiMemoryMappedIO
> 
> Used by system firmware to request that a memory-mapped IO region be mapped
> by the OS to a virtual address so it can be accessed by EFI runtime
> services.
> 
> Table 7.6 Memory Type Usage after ExitBootServices()
> EfiMemoryMappedIO
> 
> This memory is not used by the OS. All system memory-mapped IO information
> should come from ACPI tables.
> ```
> 
> The two after ExitBootServices sentences seem contradictory.  I wonder if it
> should be "Ignore this memory type - All system memory-mapped IO information
> should come from ACPI tables".

Not very helpful indeed.  The description in "before
ExitBootServices()" seems more sensible to me: if the MMIO region is
used by runtime services Xen should ensure it's always mapped in the
dom0 p2m (which Xen should in principle already do).

> > Can you paste the dom0 build output when booted with `iommu=verbose
> > dom0=pvh,verbose`?

Would it be possible to see the output of a debug=y build when booted
with `iommu=verbose dom0=pvh,verbose` (with or without pf-fixup,
either is fine).

I'm specially interested in the ranggeset contents printed after "d0:
identity mappings for IOMMU:", but if possible would like to see the
full boot log (including Linux dom0).

> > Does using `dom0=pvh,verbose,pf-fixup` solve the
> > boot issue? (and can you paste the output if it does)
> 
> pf-fixup did not resolve it.  The vpci pci_check_bar() check is independent
> of pf-fixup from what I can tell.

Yup, the check is independent, but pf-fixup would create additional
p2m mappings if required (note this is only available on staging).

Also, when using a build of Xen from staging you should now get
messages about unhandled memory accesses by a PVH dom0 whne not using
the `pf-fixup` option.

Thanks, Roger.

