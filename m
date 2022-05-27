Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30433536703
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 20:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338125.562885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuevD-0002mk-91; Fri, 27 May 2022 18:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338125.562885; Fri, 27 May 2022 18:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuevD-0002kS-6B; Fri, 27 May 2022 18:42:51 +0000
Received: by outflank-mailman (input) for mailman id 338125;
 Fri, 27 May 2022 18:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lq+z=WD=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nuevB-0002kM-M0
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 18:42:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce36f315-ddec-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 20:42:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id t13so6901497wrg.9
 for <xen-devel@lists.xenproject.org>; Fri, 27 May 2022 11:42:48 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adff486000000b0020c5253d907sm2354149wro.83.2022.05.27.11.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 11:42:47 -0700 (PDT)
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
X-Inumbo-ID: ce36f315-ddec-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/FfqEuqYsoYBH9BqWPgEI0X7vtMAlkOKI53z/x9ljKA=;
        b=a2c6NEIN3y/nYEhLsYo11LjIlTVy2FQXsq3C4LB3KwUdq0ld2EjY1vtjMquttnxNPd
         iewaBFDgbPbLmpffB7oZCVE7kTAnWZSfg8iUSkSXEtPrRUWX5o3wstSCurJ5xjKhgtyw
         7FlPNtKgQPSWj1gPOSKfUOi+/y3arR5umOBZg1fE2QuvsENlkFn712csg9+Y5Gz7Hbo0
         U5uJ29L/ZDgFN0TDAhs+2RNFVfpnMLSsgZfqE7uERxQMjJwMqDJKsw2q+R5sVm2cxHox
         1QSlcrfuvo2Mt+GrFyhsIf8wbrdbCaOK4f1tWekfn5TCW1d25tbMUbCtYwn5she9fghW
         UmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/FfqEuqYsoYBH9BqWPgEI0X7vtMAlkOKI53z/x9ljKA=;
        b=3lX04fxXfElxeRDlRGM9Pu7JF6Fyk4tbXXa4lx+GjFGvPK/1pa2vG7mNOEBRnEwIdK
         KpQVLzLXP9JtuHn70+USzFedIYAeCu7aFOVMwiNUekopRHc9R/A92kJKsrbJCxxmzwMY
         hKDt13QLKR/DyRzAhcu0V2SSMhXwIXYZKerUApl8E6JUaNfuvQ6eheqq2Zwn8pcCNehw
         Hiiusl0u0abHClh6dH7YyKVHlfF+RPUZe7UuE1Op1LZ8Kt9L/9Xi0RkwIOBMT0xr8wm4
         utJqMfOn+T2i/vEnBeFuRyvwTxH5LCjmdmmtzFFYXGhYc96VF3v28FKUyHqJ4PT8b5Gd
         dB+A==
X-Gm-Message-State: AOAM530dx1AiipTJj8JwfuRt503zLe1DZ1ZCCkI9ETAYLj3ha1mxVH9l
	QiqjMYqpVWLXvHnZM1XxJvw=
X-Google-Smtp-Source: ABdhPJyU7aV3eXuKoLVF22q8YpyzjY/eyXUYrukOmK/dDtaDK5orO9Scgfdf/5bxWSM/kh24UIuTgg==
X-Received: by 2002:a5d:5955:0:b0:20d:4b4:9879 with SMTP id e21-20020a5d5955000000b0020d04b49879mr35386889wri.550.1653676967872;
        Fri, 27 May 2022 11:42:47 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Update Xen maintainership
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
References: <1653674225-10447-1-git-send-email-boris.ostrovsky@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <69716937-59d0-b316-2a42-94194c79320c@gmail.com>
Date: Fri, 27 May 2022 21:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1653674225-10447-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.05.22 20:57, Boris Ostrovsky wrote:

Hello Boris

> Due to time constraints I am stepping down as maintainter. I will stay
> as reviewer for x86 code (for which create a separate category).
>
> Stefano is now maintainer for Xen hypervisor interface and Oleksandr has
> graciously agreed to become a reviewer.
>
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Acked-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> ---
>   MAINTAINERS | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6d879cb0afd..b879c4e6750e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21549,23 +21549,29 @@ F:	arch/arm64/include/asm/xen/
>   F:	arch/arm64/xen/
>   
>   XEN HYPERVISOR INTERFACE
> -M:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
>   M:	Juergen Gross <jgross@suse.com>
> -R:	Stefano Stabellini <sstabellini@kernel.org>
> +M:	Stefano Stabellini <sstabellini@kernel.org>
> +R:	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>   L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
>   S:	Supported
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
>   F:	Documentation/ABI/stable/sysfs-hypervisor-xen
>   F:	Documentation/ABI/testing/sysfs-hypervisor-xen
> -F:	arch/x86/include/asm/pvclock-abi.h
> -F:	arch/x86/include/asm/xen/
> -F:	arch/x86/platform/pvh/
> -F:	arch/x86/xen/
>   F:	drivers/*/xen-*front.c
>   F:	drivers/xen/
>   F:	include/uapi/xen/
>   F:	include/xen/
>   
> +XEN HYPERVISOR X86
> +M:	Juergen Gross <jgross@suse.com>
> +R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
> +L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
> +S:	Supported
> +F:	arch/x86/include/asm/pvclock-abi.h
> +F:	arch/x86/include/asm/xen/
> +F:	arch/x86/platform/pvh/
> +F:	arch/x86/xen/
> +
>   XEN NETWORK BACKEND DRIVER
>   M:	Wei Liu <wei.liu@kernel.org>
>   M:	Paul Durrant <paul@xen.org>

-- 
Regards,

Oleksandr Tyshchenko


