Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4096DF9A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 18:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791282.1201154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFKw-0006Ou-3e; Thu, 05 Sep 2024 16:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791282.1201154; Thu, 05 Sep 2024 16:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFKw-0006Lj-0o; Thu, 05 Sep 2024 16:27:58 +0000
Received: by outflank-mailman (input) for mailman id 791282;
 Thu, 05 Sep 2024 16:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkBE=QD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1smFKv-000648-66
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 16:27:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce1900d3-6ba3-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 18:27:55 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c3c3b63135so1096605a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 09:27:55 -0700 (PDT)
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
X-Inumbo-ID: ce1900d3-6ba3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553675; x=1726158475; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=keygZ2eFxDOr4bAQfX6rzwmPXVMg+cYWF6Ayf0+YV3o=;
        b=fuRJMFdnVDKA2RzMWh6TWz/RgNo4NRFXFmlS0aY9rSLh35Vl09RqGUGVvJBGsuNqzV
         Acl8jjYHSY4q9fcySAovGaIBvZ5oSld1NaOr9W5/+TTNUKKUVXYHiSf3BvztsPeDQVqG
         k03Ex9GD6F/sgzaK90CiibM3LWsvgU305VoQRyXrKzysW5qF9CMbtbkwUGGWWXOonl0b
         6DSCj3UncPReP/Y0rqKyF4KIn9dN7UZ2csOv7EizASGIZDJ3FtDk0QXhHxFnKIdRkcRr
         oClXrxZQsT3mOHKhNR7YbO3EDXVkFsuacR06mD04ESFb7qTzxBNcFfg004vtcblA8rB0
         3ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553675; x=1726158475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keygZ2eFxDOr4bAQfX6rzwmPXVMg+cYWF6Ayf0+YV3o=;
        b=fcJpFBdbcmx1xn7SSzFNd1oPZtQ2vefiWE7D2h9h7ks6g7OJ+xBReZtjm0ufrk6BgH
         y405TI06urQg8aH0p33djTcOlTIyf7bZnxKKGR8yKHxby1zE80XkRkJcIpNFDMp21JAB
         sP1bmf1T0CILq3PZl90lWsHH2joM3YikotxC5mlXVBniv/34+cj3mEr9lx0abbzpSKDW
         P5YjD39S+VjkfQikvCbaHWHwRiEPDbrKw3T85p8jCKFOn920fc6IGCWsBgHb/tdPFpug
         PU8rhhnojuiielyrC/ytvJVdY9v5URFd0TWbihl/wEzNr3sbvpPDBuBJJSccCJSrJtfm
         pyBA==
X-Forwarded-Encrypted: i=1; AJvYcCWL96Bu18H752pVcrAHmIr+/rtjeMF4e7DzIQ3rYruCwXI1JmCDNlqaNk2Oftzi7USWPffjVObjlNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNjn+XsUKOza3x1SKXwEj1W84j4ShLGc33fA1+lyyMp5sm3vde
	5SM7SpT1ze4vsihfpBzp4GmJP7HSXfkuxeVMBp/F5/lszGiVdNk1FIEl4MYQA65d13rsGpTVgpd
	eIHmBV3T0QXdqDrzQUnSECBeefdkhBjY98URQUA==
X-Google-Smtp-Source: AGHT+IEz6sRxe/3hMOSER+YAj1Uows6NvdSEOJG02iCROPTl/h8il9/GtNoNQTrW0Vr9d5RihsVKNNZyvqQNqmUcMyg=
X-Received: by 2002:a05:6402:2549:b0:5c2:6e51:9d22 with SMTP id
 4fb4d7f45d1cf-5c275831da7mr6383108a12.25.1725553674586; Thu, 05 Sep 2024
 09:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2024 17:27:43 +0100
Message-ID: <CAFEAcA-XB0286jF8h8Mev1wyygokRHHjnv_=D3qgSiLsb1zSsQ@mail.gmail.com>
Subject: Re: [PULL v1 00/12] Xen queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, alex.bennee@linaro.org, xenia.ragiadakou@amd.com, 
	jason.andryuk@amd.com, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sept 2024 at 17:15, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> The following changes since commit e638d685ec2a0700fb9529cbd1b2823ac4120c53:
>
>   Open 9.2 development tree (2024-09-03 09:18:43 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-09-04.for-upstream
>
> for you to fetch changes up to 0b57c8160a2a6c833cfb1d958f08385c4391ab70:
>
>   docs/system/i386: xenpvh: Add a basic description (2024-09-04 16:50:43 +0200)
>
> ----------------------------------------------------------------
> Edgars Xen queue.
>
> ----------------------------------------------------------------
> Edgar E. Iglesias (12):
>       MAINTAINERS: Add docs/system/arm/xenpvh.rst
>       hw/arm: xenpvh: Update file header to use SPDX
>       hw/arm: xenpvh: Tweak machine description
>       hw/arm: xenpvh: Add support for SMP guests
>       hw/arm: xenpvh: Remove double-negation in warning
>       hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
>       hw/arm: xenpvh: Break out a common PVH machine
>       hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
>       hw/arm: xenpvh: Reverse virtio-mmio creation order
>       hw/xen: pvh-common: Add support for creating PCIe/GPEX
>       hw/i386/xen: Add a Xen PVH x86 machine
>       docs/system/i386: xenpvh: Add a basic description


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

