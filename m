Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B4A290A1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 15:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882218.1292387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfgX2-000257-UQ; Wed, 05 Feb 2025 14:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882218.1292387; Wed, 05 Feb 2025 14:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfgX2-00023L-R9; Wed, 05 Feb 2025 14:37:36 +0000
Received: by outflank-mailman (input) for mailman id 882218;
 Wed, 05 Feb 2025 14:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMUO=U4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tfgX0-00023F-Sb
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 14:37:34 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb123593-e3ce-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 15:37:31 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38da84c9e4bso1391119f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 06:37:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57ccsm19041239f8f.79.2025.02.05.06.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:37:30 -0800 (PST)
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
X-Inumbo-ID: bb123593-e3ce-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738766251; x=1739371051; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1preHnfdKmkbmU1gsgwNyC3lA8zHJPzy0hUwq35yPcc=;
        b=johGfk6YNbxP3JlUt/ZXshZy81131uGwW+1EIKTTnCt/Sbf/qNRW8NYGwz+3t/x66z
         3s9kqgQeWUz3VAtYcL0CocG5fpx6EEFgpFnzHA8wc/W+yy9LqtVWnXzzuhTmvBiM+Aah
         O0KOLHaOGmmh80Tlo4xOiJ90D3Y/Z1S5TK1Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766251; x=1739371051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1preHnfdKmkbmU1gsgwNyC3lA8zHJPzy0hUwq35yPcc=;
        b=BEvWDt6YYxE3QJsHz/HF4vZfkoGWSuT+kW/dZODtCfuJy87Jtha8OjBZ+p/hh7R742
         +N94CBehB9yUQCruAUnrEAlOPlyKqkaawoxJdmldkeL69ibdmLmja4LmUZaL6egCT9Nu
         m9EsS3vVA6wre/T+AzYNn/S3pCl1JpQ1BCc3oWI/sMDSS7XO6Srt/8S9owDRnGz2t2Sv
         Mr0AyPtGzof3eY0PJ37LQ12mis9Ts2ovoZOg4NC6/fgULTbptCOQpPHjjth7t18RCmbf
         HsRUIdihbgXw7h4datrjOhzVPyB2SazTNqEMVG7pkRBQgIvfCsda+FX+aWOTP+daaoIJ
         8koQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNrMNL3Z8ygL7sxAj6PfQUpHSVAsOfIGhPKfCt2x7kidQzdYwgwSqZUNdwhaepVqjFTENoHOF82cU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8haTreYMzwSReOVEevKAu+2l0bVOVZp12b5DTLvhAQviclQ+s
	qS3pVV5UQTRBbIdfOK3Pd5iATkux6HUXeEFHwLMtSHkC+tsVG9D1NnrKbdKsbTI=
X-Gm-Gg: ASbGncvbeWoxKNW9SCWUXRLMnrFg66RoG15yUOkszlXzXLKSJ5Q3h6oRCgAZUfHtemv
	Nw253Gh4LxMhmF54Pk+xgaPocpbpuVC7NpJtwGC3Sht3KMiuGVX0aD2pbGAelfl/PbM1qtnnpiC
	L7nl+rD4mdOo7Fw1L6hBHZZFHf62528WDdgKBCDqJSz36hmzBT+xVZ9ydzk3sJwW/GFNQ07ZLlZ
	IWBx6wvQOgzcWLKXEGvTBKXUhjZOGjHUZRnEbXxQS7ToyL+rFkkJuZei4mo2UCNiZF6Jej2b7fq
	xi/9MYlObZJSQNwb0tQx
X-Google-Smtp-Source: AGHT+IFOCkeQw/te7Xj6XjmuTzpyCR4I4eargtnjQ4iFDGYm/cauHUnshVfepGP393nQSjN5TLGc/A==
X-Received: by 2002:a5d:6aca:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38db48fda63mr1937153f8f.45.1738766250870;
        Wed, 05 Feb 2025 06:37:30 -0800 (PST)
Date: Wed, 5 Feb 2025 15:37:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
Message-ID: <Z6N3qQfNo8UXvLjM@macbook.local>
References: <20250114103315.51328-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114103315.51328-1-roger.pau@citrix.com>

Ping? This has been pending for 3 weeks without replies.

Thanks, Roger.

On Tue, Jan 14, 2025 at 11:33:10AM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series should fix the usage of devices behind a VMD bridge
> when running Linux as a Xen PV hardware domain (dom0).  I've only been
> able to test PV. I think PVH should also work but I don't have hardware
> capable of testing it right now.
> 
> I don't expect the first two patches to be problematic, the last patch
> is likely to be more controversial.  I've tested it internally and
> didn't see any issues, but my testing of PV mode is mostly limited to
> dom0.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   xen/pci: do not register devices with segments >= 0x10000
>   vmd: disable MSI remapping bypass under Xen
>   pci/msi: remove pci_msi_ignore_mask
> 
>  arch/x86/pci/xen.c           |  8 ++------
>  drivers/pci/controller/vmd.c | 19 ++++++++++++++++++
>  drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
>  drivers/xen/pci.c            | 19 ++++++++++++++++++
>  include/linux/msi.h          |  3 ++-
>  kernel/irq/msi.c             |  2 +-
>  6 files changed, 64 insertions(+), 24 deletions(-)
> 
> -- 
> 2.46.0
> 

