Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A7B39D41
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098671.1452664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbiU-0005aV-9q; Thu, 28 Aug 2025 12:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098671.1452664; Thu, 28 Aug 2025 12:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbiU-0005Xx-7A; Thu, 28 Aug 2025 12:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1098671;
 Thu, 28 Aug 2025 12:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvL0=3I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urbiT-0005Xr-BI
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:26:57 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 482b5bda-840a-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 14:26:55 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f39c0a22dso999401e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:26:54 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a21fsm3307228e87.128.2025.08.28.05.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:26:53 -0700 (PDT)
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
X-Inumbo-ID: 482b5bda-840a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756384014; x=1756988814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIUl6jzlU4kobRnbqVovL8x7qcBFxpRgts/Sh7PKryo=;
        b=njDCYXcuQpkoT3HE1RonKwKiK6tRAUBnjIhKueX6IsjCNwd14vczPfaDfg0Y8oOcyK
         gkjIdY4KonjBnNk7ezhDeZusxkHhYCnO5y8+3+pB+mmsOI41lsu7p9ozl86VjzgtBV7I
         52fG4eCFpmxfAsfrfXJ21r0UP2Zl9Ndufs6B7whTIhbUWdBlq5pNLdAsu/dJ2GD3KMgl
         3WhSMdHyxYvXKaQllVdsCrEzx5xjUrqSOwaoFXtYyvZwlSxQW9Xdpc0O4KU/nbfIxFgo
         17R/TZwkh7dD93PCfwJv+ZTB2aK4MAALp78A/dUg16bLdFV39mFesqBbuffoy2n5TbD2
         jzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384014; x=1756988814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIUl6jzlU4kobRnbqVovL8x7qcBFxpRgts/Sh7PKryo=;
        b=N83r3hepjJdb63rvt0mpYLguDwAVBjM18waI1dveW7kLCDKtL7/Mxj0+4OhPvX65u1
         2UwXfAEq540z67kicILsfWD/P2OC7965CLiCyKBSbtieY+4ZTQzXTSEHA4Ox0MboH1RB
         k9diDyedH7F/yO3XGCqpSp9NSTriGFqffxxjudcvWjxyjClqRtwI9nH6miAMNnKc6byh
         ZxbyIkPw5dm9hj/7pjdw9PHbFL8jFmfoj6Cz58s8kwCPwvanJIcRdfo9vEJyatqXc0Wb
         zSfj9h26oB9kJGzK/2izcDxWFakk8YDVh5xd7JQi2KRAD2kn+h3FsI3SejD3khQhZ7SA
         4MUA==
X-Forwarded-Encrypted: i=1; AJvYcCVH9jN3WVF3MklxmdhkTRf/nf16Qx0FzJ1RA3rKOVyncnhwRxqs/LnhuGl+etDIgF2TNNgwphFyXYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws7AqRpc/nVtO9yYNdkJcw6orSMKPdTUy5RDElPI58bsRxzS2b
	wxwHfBUwC8bVWpK/9xZkAYZCLl3cF75zV4E56fiIl4n90Ij9u9nSSo3z
X-Gm-Gg: ASbGncvCjVsdaq/q830NF26S0H8T5hZ3T1+BzSyHptuMx2z+g4ndkPVr8q+5zP3hY2W
	+DU+tPTI+VuSpJ+0ugd/fGZgsyxs4Y/uabeSzFymlmTfBf069fuwhZsORm9nda1Yv6zgx2N2BSh
	sAxwdhDslOYEifJ7LHwZnQteopVPOlrB9i9NRpp6b0JcGE68nzNC+DWP3+xC/cq0Kuun+LHUsrV
	diXnmqnZaeujc0IYb+zJOxCLh484QgqPrC7GUsnWkPJOouCRByCmuZDoOwhn8eAS7fN3mypJBzc
	SxW8NOWmTsy5kzJ6ESSzD+fusmaX9+d77GTMc265ply0kp7xahtI0GLhRCpF/0GKfWZs4MJer1H
	4h2k4/Uplm+ApjqTTs4ERL/aaaA==
X-Google-Smtp-Source: AGHT+IG6ZZX8dIHtyQxamVbeZl/7OEn6mJ2rOHEHQzdM1+XhFSRatDhklwKbSPydGqnWFFKE4DeT1Q==
X-Received: by 2002:a05:6512:4201:b0:55f:49af:d5 with SMTP id 2adb3069b0e04-55f49af0492mr3827924e87.20.1756384013533;
        Thu, 28 Aug 2025 05:26:53 -0700 (PDT)
Message-ID: <75c4a280-cdb0-4004-8793-2d6cadd50c25@gmail.com>
Date: Thu, 28 Aug 2025 15:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for
 virq checks
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 21:24, Leonid Komarianskyi wrote:

Hello Leonid


> Introduced two new helper functions for vGIC: vgic_is_valid_line and
> vgic_is_spi. The functions are similar to the newly introduced
> gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
> 
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
> 
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V4:
> - removed redundant parentheses
> 
> Changes in V3:
> - renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
>    to vgic_is_spi
> - added vgic_is_valid_line implementation for new-vgic, because
>    vgic_is_valid_line is called from generic code. It is necessary to fix
>    the build for new-vgic.

The comments I provided are addressed (thanks), so you can add my:

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

[snip]

