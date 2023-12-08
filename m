Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F5C80A802
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650707.1016453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdFr-0007ln-UM; Fri, 08 Dec 2023 15:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650707.1016453; Fri, 08 Dec 2023 15:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdFr-0007jR-Qq; Fri, 08 Dec 2023 15:59:07 +0000
Received: by outflank-mailman (input) for mailman id 650707;
 Fri, 08 Dec 2023 15:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdFq-0007ij-DF
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:59:06 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5fc225e-95e2-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 16:59:04 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so18978055e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 07:59:04 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056000136f00b00336098d0e64sm1276525wrz.106.2023.12.08.07.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:59:03 -0800 (PST)
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
X-Inumbo-ID: b5fc225e-95e2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702051144; x=1702655944; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/v+mSP3tKfdKjEHoi3wYE8TrVOBSbYo92dEu9SjNSVo=;
        b=WlwjSk7gl8YvSeYgZx9f7B/hkMa21W0FyNvWIk+QgZYDODF4TiFLTTejib3gPGiAoS
         6+M9YD0/gY5Q10Qxp+yh14/MX6knMHlEs3MqIuWA1+HY+n+y2j6kjuTMunOBRP2OAkaH
         gQpduVpqpbxRdaarR5WTjMYTiCUm8DjWuUr6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051144; x=1702655944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v+mSP3tKfdKjEHoi3wYE8TrVOBSbYo92dEu9SjNSVo=;
        b=fFc2GYP8ogrFTQX2uHVnP9ykdgSeT0uHmMTF5/HhsDznE2S3he+je+c+ofP0PsW1XF
         s+kqhi0UtljCUE3hBCmA8wwp+IzWxXVr/CDp0J0XO/HilrGSXUCN68nRNYx+naSXIwFn
         upjwkDysRlNPY1wkUqaM8aBL+477XfwEeYrDy/QikOv7wLuSrh0TeLr5ETEI3PK2GRsB
         IT+KZ0glfFoxFd/VxRTh/mUa+If3PP1zh5FS9rplUuIHKyXLu3T7QK/OF1sP0AdiwVVs
         b4bO0MCtBlA1ifsWUTIalZ8zGIKDcW0xERl2h+fMf2SvxC3zyMlYGMjhkWSBtlQvcS4l
         Rjcg==
X-Gm-Message-State: AOJu0YylOfHx6oKeonJOrj42ifThietVGNNWToCH3Ytjg9e530g/EgjM
	jWLi+AioY+HmkYSiPF28f0HgJw==
X-Google-Smtp-Source: AGHT+IEJGEY4amexJFBuk6nGUupx+3uuYK2eS9VVPKdjmNFzM6tb/kSe0XqcPMG6RIC5yODm69sA6w==
X-Received: by 2002:a05:600c:c3:b0:40c:2671:1e56 with SMTP id u3-20020a05600c00c300b0040c26711e56mr54170wmm.223.1702051143983;
        Fri, 08 Dec 2023 07:59:03 -0800 (PST)
Date: Fri, 8 Dec 2023 15:59:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] OSStest: use CONFIG_X86_GENERIC for 32-bit x86 kernel
Message-ID: <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>
References: <20231207080953.27976-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207080953.27976-1-jgross@suse.com>

On Thu, Dec 07, 2023 at 09:09:53AM +0100, Juergen Gross wrote:
> Today the cpu type for a 32-bit x86 kernel is not specified in the
> used kernel config, resulting in the M686 to be used.
> 
> Instead of using the M686 which isn't even a 64-bit cpu (thus not
> capable to run a Xen guest), use the X86_GENERIC variant which is
> more appropriate.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  ts-kernel-build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/ts-kernel-build b/ts-kernel-build
> index 719b33aa..d9e033c4 100755
> --- a/ts-kernel-build
> +++ b/ts-kernel-build
> @@ -608,7 +608,10 @@ setopt CONFIG_POWER_RESET_XGENE y
>  setopt CONFIG_RTC_DRV_XGENE y
>  
>  case ${XEN_TARGET_ARCH} in
> -    x86_32) setopt CONFIG_64BIT n ;;
> +    x86_32)
> +	setopt CONFIG_64BIT n
> +	setopt CONFIG_X86_GENERIC y

It would be nice if that was working, but XEN_TARGET_ARCH is never set,
so the change isn't going to work.

I'm preparing patches to set X86_GENERIC on i386 builds, and fixing some
issues.

Thanks,

-- 
Anthony PERARD

