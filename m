Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAAA7BABD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938082.1338890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0eHz-0001gC-Ln; Fri, 04 Apr 2025 10:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938082.1338890; Fri, 04 Apr 2025 10:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0eHz-0001e5-J9; Fri, 04 Apr 2025 10:28:43 +0000
Received: by outflank-mailman (input) for mailman id 938082;
 Fri, 04 Apr 2025 10:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8GG=WW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u0eHx-0001dz-Is
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:28:41 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ef6c75-113f-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 12:28:40 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736b98acaadso1835997b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:28:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-739d95e6e57sm3017389b3a.0.2025.04.04.03.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 03:28:38 -0700 (PDT)
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
X-Inumbo-ID: 92ef6c75-113f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743762519; x=1744367319; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LuaxFPkOvn7Up6+/anoGz4CWtqvZAcmgaZBQEQ/Dowo=;
        b=Kql8Pwnf1QiyaEPBJG5Jd5QBF5rLpQ+i+GijQiy91vv3ZKcqtsQSOn7nodT8dlqAZm
         mqSWw/r/riveFD+HLarzlYh8vFda9dcQoOhXNb86zlrdHIkqjDdaOEC7YLcUUBA0xUmz
         L63xI2iBsHKbhTLDQh8+IODAziMf85ZwagQtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762519; x=1744367319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuaxFPkOvn7Up6+/anoGz4CWtqvZAcmgaZBQEQ/Dowo=;
        b=SxjI6sIzilT8TT/i56HI3YQ5JU1w97BleawGKMaqUNHUvjpQAbpwAZb+pWsg0ybp75
         itzu6nrmhwu7Aw5Qs4ZUmGKgwh9G6sPa8rOaI7Cyg060gDZr7YpXxTtVf3ERET4Pzq3k
         V5KXxlfJAz3heaqFhpy08Al/79pbftSPxT6V0H05/yqCDto6qoifB6iQTVLw9BjEsX9/
         RmYcgTHsxzguolaLFsWtxYmsY1Jf+Bzm1CIXuJ1/esT54IiKuaWdR7zrRB4g5sTwr7lI
         PavjjHB14xOVTtpbXghvrGECdu7khIcFGV0BLsWIwTkPL07PkVi4uMKNrM54U8zwU0by
         S3EQ==
X-Gm-Message-State: AOJu0YzXeMpDb+JJJTsij/knoso1TQpsyBSxW+hmUAWeW2hLg1K5i/7b
	P81bbuRLPbPLKlKF7CnyXhUw3qW5iePDtIHd/p8o8RR6uBzG2/KPDy9vurKa8hw=
X-Gm-Gg: ASbGncsRyzhsuklKBrTqwlo6oDsu1cQUj8Ladx6i9AmuXF2O6SKAL4E+i2B0ankL9eR
	DIx2GNhvWdTesyZ4QE0xaNX2cM4oVIS+YZqvGFCOQIoHgO5l+eeSh4GCXPwWc7gMeTURjG3Uvbb
	draQHKTCD/Q+mWkL0ouu9vIzEsNsf4gMchnpcWJ3S3YuPUGWEMzlaZVtq16Q5aE+/dNdBrLs7ZN
	7TDpAxlg7NPh9dW0j2ZzWZL7uCYJVmsXsEsK7lI4lly87i9tieD6fwZ0L1DBxQmIv9KAbHSvQOw
	wDzevKXAC32uwJX4fzZxcZU+2QwRYf4bCp3I01mEEUNu3N3iEA==
X-Google-Smtp-Source: AGHT+IHZnPp32G5T6bHegMBNiPYFyHdxaI9TByzxWT8f6+g+LQkY9jz5YUYypkw3pOKbSbMLgRhFBA==
X-Received: by 2002:a05:6a20:918a:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-201045a6303mr4699926637.17.1743762518857;
        Fri, 04 Apr 2025 03:28:38 -0700 (PDT)
Date: Fri, 4 Apr 2025 12:28:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, jason.andryuk@amd.com,
	Xenia.Ragiadakou@amd.com, Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <Z--0USril0UIhR4R@macbook.lan>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>

On Thu, Apr 03, 2025 at 06:01:42PM -0700, Stefano Stabellini wrote:
> On one Sapphire AMD x86 board, I see this:
> 
> 
> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
> [...]
> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
> 
> 
> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
> This is because the pci_check_bar->is_memory_hole check fails due to the
> MMIO region overlapping with the EFI reserved region.

That's weird.  (Partially) the reason to not attempt to map such BAR
is that it should already be mapped, because at dom0 creation time all
reserved regions are added to the p2m (see arch_iommu_hwdom_init()).
If that's not the case we should figure out why this reserved region
is not added to dom0 p2m as part of arch_iommu_hwdom_init().

Can you paste the dom0 build output when booted with `iommu=verbose
dom0=pvh,verbose`?  Does using `dom0=pvh,verbose,pf-fixup` solve the
boot issue? (and can you paste the output if it does)

The issue with allowing BARs to modify p2m reserved regions is that if
memory decoding is disabled for the PCI device, the BAR will be
unmapped from the p2m, thus creating a hole in the p2m for a reserved
region, which would be undesirable IMO.

Thanks, Roger.

