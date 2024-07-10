Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C818D92CE45
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756656.1165336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTkk-0002zc-Bp; Wed, 10 Jul 2024 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756656.1165336; Wed, 10 Jul 2024 09:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTkk-0002xr-8x; Wed, 10 Jul 2024 09:36:46 +0000
Received: by outflank-mailman (input) for mailman id 756656;
 Wed, 10 Jul 2024 09:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Omq=OK=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sRTki-0002o7-Fg
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:36:44 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2d9232-3e9f-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 11:36:43 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so75485191fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 02:36:43 -0700 (PDT)
Received: from [192.168.14.50] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89108sm4822568f8f.55.2024.07.10.02.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 02:36:42 -0700 (PDT)
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
X-Inumbo-ID: eb2d9232-3e9f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720604203; x=1721209003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vfw6I0ttUhq40nWTXLtLOdxIbCy05jSinljrXQf7waY=;
        b=fud3+UkmL/FlYoO10TjzkaiELj3oE8IBV1gWG8On8Y8Ep4CrTEWSzo1Rbfq2Z8hFg7
         ZIhjUgmo6VQ/76RA4XploaTCPbEbWnkBIUvMNHcrSBV/T6rphp8BJmLfrVyw7O0KcvWW
         3EfALY8J3epfTNYe+Ph5ovsrrxMG0zdgFqCNExydrmMzcx4ywM0EIQ9WjsATxK839KMq
         8nyTFdHHeC/gYsPb+V73HM1pVM6G9/vtnRKz02yfTtuOimmQWGGv/e2AJLHPT51kC9HO
         qKVhHk8LUajf37VPeoa/pqe2wXa3HI2B6VlWvnx7k4QVUPNIADF9Qz1cbdxqM4rzEdPC
         CDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604203; x=1721209003;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vfw6I0ttUhq40nWTXLtLOdxIbCy05jSinljrXQf7waY=;
        b=j4FS/52KlQHi9+vR6pTQdjrld8IGTbp76SfgrWYUNkrYI9GTdmsJG2XPjrrO2e11Nl
         68/m67x3z/2W39TmSGyrUiVxyRfIwYG4W0v2jaFNUsajJKA0fuqzTq9Zxijz/Y5Gf789
         wrHszr27L8+CoXXpi+iZ2r9ZCS8kjlBHyIPkucXXTk950tidQM8If2vyvRxtAADHzEsj
         MfjizQMK0jZ8boRerMZ6JG5eVKABLKJQIEtr7oPqCqcLgV2k4mtz7hFzCENB5Hmjkog5
         PpXAjevvBe2NFUYKTN5rNhmsqYCPQRmbPBDUFfnSvFjzYhpoT84f0xSoSrskz95FExjv
         LPkg==
X-Forwarded-Encrypted: i=1; AJvYcCVyV2QE/0CEgtWnKBpZeqnWjdNI7P714/MFfpgTwXdbc9SohKnd58Uq37WaLtrMLKSHdp1WYejgvZUx6vpcFifYUem8GaeS7+O6siK2+eo=
X-Gm-Message-State: AOJu0YzdH8qnysfkhm+8cH0d0w0kU6Clem7rfZ3QK2LYDTHDRoKfsjKR
	asNPCWxTbZaand2ja2FvyWWj2CJmkWPY7bndFEdYZ+udW6b0mnI7
X-Google-Smtp-Source: AGHT+IHQsx2aK31RT5t93WyMQ3zjqVCmQA0gQzAyZtc5vQ47WsY6QKkTQ36vzs3hzHSaGRxFIQUleA==
X-Received: by 2002:a2e:9786:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2eeb30db364mr28598491fa.20.1720604202976;
        Wed, 10 Jul 2024 02:36:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <39617ea9-a41c-455b-81e2-b94eaba4cdcb@xen.org>
Date: Wed, 10 Jul 2024 11:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH v4 10/14] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2024 08:05, Sergiy Kibrik wrote:
> There're several places in common code, outside of arch/x86/hvm/vmx,
> where cpu_has_vmx_* get accessed without checking whether VMX supported first.
> These macros rely on global variables defined in vmx code, so when VMX support
> is disabled accesses to these variables turn into build failures.
> 
> To overcome these failures, build-time check is done before accessing global
> variables, so that DCE would remove these variables.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v4:
>   - use IS_ENABLED(CONFIG_VMX) instead of using_vmx
> changes in v3:
>   - using_vmx instead of cpu_has_vmx
>   - clarify description on why this change needed
> changes in v2:
>   - do not touch SVM code and macros
>   - drop vmx_ctrl_has_feature()
>   - guard cpu_has_vmx_* macros in common code instead
> ---
>   xen/arch/x86/hvm/hvm.c                  |  2 +-
>   xen/arch/x86/hvm/viridian/viridian.c    |  4 ++--
>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 17 +++++++++++------
>   xen/arch/x86/traps.c                    |  5 +++--
>   4 files changed, 17 insertions(+), 11 deletions(-)
> 

Viridian changes...

Acked-by: Paul Durrant <paul@xen.org>


