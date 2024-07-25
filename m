Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B9193C5CD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765045.1175619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWztD-0007p6-0v; Thu, 25 Jul 2024 14:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765045.1175619; Thu, 25 Jul 2024 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWztC-0007kE-U2; Thu, 25 Jul 2024 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 765045;
 Thu, 25 Jul 2024 14:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWztB-0007k4-Ty
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 14:56:17 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7b1f3a-4a96-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 16:56:16 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6694b50a937so12643097b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 07:56:15 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d81d7sm8027786d6.1.2024.07.25.07.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 07:56:14 -0700 (PDT)
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
X-Inumbo-ID: 0a7b1f3a-4a96-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721919375; x=1722524175; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4AwIE1qUdpDdyhq95igZC041Bcf6gYh00JLvLezD1o=;
        b=LN+EfiLmM2r1OLOuqR/yoEubwy7W5sj9vZfvoCRLyiuo3fUYADXPjB486mGhzCJxtO
         n7jtTCipYna95qBUW7V4DlyyDhVxTufM4b7BXbjj5nuLpu3wWr2GcVJ5kvg0FdGhStma
         sCy4x39sNWtjXO6ULyD97iYIhkaZ9l4YcTgsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721919375; x=1722524175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4AwIE1qUdpDdyhq95igZC041Bcf6gYh00JLvLezD1o=;
        b=cpL9A3bvFMs6q6MlPSRBUgEQXP2Hq2pi4UIfBFCA3Vb1HfMzWkcugyhsLlw7OnNYeZ
         j/krh3ZQW+MgRA3pz/lWxLZ9nx7OZSZRu0d4pAcSu/Swo12McDIqKAKk9SsvS0rzcCIo
         k4eBES1X4VcZsBz1cU6rZhR0MtsFcHO0ptFI1I7ssmDD5wE4k8tnIc80p+nUCIgxiiuo
         0WMxdoLfPjakQZDXgcT37DUT2y6XrD8LIDbqobbfwRYtGw51mHIIqp3qzoooB7MipeDz
         207EbQieMPEl3rjR46VXE5RlsKIZu06M7y+xuG7XfaGytPH1DxlluA9jkR/XREdTwKII
         /e7Q==
X-Gm-Message-State: AOJu0YzqgvpVJ1s9PWfCMeYvw4FdBHYTfOma3Fja7AsDWV0yrJMRvmCZ
	YDEEpdDo9fLb4AgGFnr2pFSX0ZoU8Mva6d+OFn8v9oo3naQ+hQYkzd1IE/0IjRg=
X-Google-Smtp-Source: AGHT+IHEM3aG+B4ili8UmU0BLDY0jUN8kzMFsu5pcohs927DRHXUTgxwr+WYqLjPChrN/kuas9SJyw==
X-Received: by 2002:a05:690c:490c:b0:64b:6f7f:bc29 with SMTP id 00721157ae682-675b949d34emr31660307b3.16.1721919374725;
        Thu, 25 Jul 2024 07:56:14 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:56:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.19 release cycle
Message-ID: <ZqJnjCt_tt3l6qNj@macbook>
References: <b0e62915605cbc00548afd70c5fad81f57ce5217.1721913394.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0e62915605cbc00548afd70c5fad81f57ce5217.1721913394.git.oleksii.kurochko@gmail.com>

On Thu, Jul 25, 2024 at 03:20:29PM +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  CHANGELOG.md | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index f8fbe82df6..39e8737e61 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Reduce IOMMU setup time for hardware domain.
>     - Allow HVM/PVH domains to map foreign pages.
>     - Declare PVH dom0 supported with caveats.
> + - On Arm:
> +   - Reworking the logic so all the MMU-off code is now self-contained for
> +     secondary boot CPUs on arm64.
> +   - Code symbol annotations and MISRA compliance improvements.
> +   - Addressing issues of the static shared memory feature.
> + - On PPC:
> +   - Minor fixes and improvements:
> +     - Add .text.exceptions section for exception vectors.
> +     - Replace debug printing code with printk.
> +     - Address violations of MISRA C:2012 Rule 11.8.
> +     - Ensure ELF sections' physical load addresses start at 0x0.
>   - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
>   - Increase the maximum number of CPUs Xen can be built for from 4095 to
>     16383.
> @@ -23,6 +34,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     using a standalone library implementation.
>   - xenalyze no longer requires `--svm-mode` when analyzing traces
>     generated on AMD CPUs
> + - CI updates:
> +   - minimum fixes to rebuild the containers, following the HEREDOC problems.
> +   - rebuild containers to have testing with up-to-date LTS distros.
> +   - few build system checks, and strip the obsolete contents of
> +     the build containers.

Nit: the above items want to start with uppercase letters.

Thanks, Roger.

