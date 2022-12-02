Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBA6400E8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 08:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451479.709220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p108h-00021Y-SS; Fri, 02 Dec 2022 07:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451479.709220; Fri, 02 Dec 2022 07:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p108h-0001y6-Po; Fri, 02 Dec 2022 07:07:15 +0000
Received: by outflank-mailman (input) for mailman id 451479;
 Fri, 02 Dec 2022 07:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6g/C=4A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p108g-0001y0-Ny
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 07:07:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f171bcfd-720f-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 08:07:12 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id o5so6472822wrm.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 23:07:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020adff34e000000b0024228b0b932sm7589601wrp.27.2022.12.01.23.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:07:11 -0800 (PST)
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
X-Inumbo-ID: f171bcfd-720f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcqQL/ZizWrnpHMjGdFtp/KhnA24UId7fItCFmRMZA4=;
        b=v2OGdm3x+NHQ4qE7XEZ3WD70Oeb+Wv2Tf6PpV0ciBflZarn5rlDT+GrVmyRGH3yrUc
         jRKjPkO9Y7EZwNHbA3HlJopmPCSLg1k6IM96LQRU67DHehqz+JMtqfHq2plXw1sor6ZJ
         XZmHxEhQCgswkxikESobGazqXlneGvNKaSDnnigEGCcV3vjHf4AXzyOemsmRZ2q6VkJt
         CiNuCap9XUSDnv9ixKXRJ+1QhKZx1qOAJZ3uXZytLFnjT3Pi5gwf4uo1yzpSLxm/6ayy
         TJ3hFqJ/rNPMkFybwp7OrzEPaNfhxuEnGMAMbQWYd89H1kDS3RjChNn+S9KXTnkhSlTe
         a6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcqQL/ZizWrnpHMjGdFtp/KhnA24UId7fItCFmRMZA4=;
        b=dCYaVH962F1citaVcrQ2diH6y16dDfV/b1/TFGNJXZc5JkqNq5z5zAZECsN90l/K96
         Ccu5bAq7YtxN9WS0zIYFWo6+iZ2XGm6+0jV1BvdSvvflbjlT7rb05oMGZg1mIoCvGvny
         4UYXA4LTGZTMVNOZXReTZYFB2v2yHqGO6Zd+7x+YtXX9k5BpOp4QWm/Rf/ZlVAkia5Zs
         vlGuXCtyYGTEpLexDybTRmXvyOusqehRg+XNHT2ITYkKwUx8krYTwkJwjvfrtNSa8C0/
         cz9/fIugUwzuMtzxd4wga7RY/UqtUCcWfUh6B8mxkwg4rJ3JmZgsA/dUBX/JbJzAQlB9
         bqDw==
X-Gm-Message-State: ANoB5pkJtOt84hlOXqH8OZUS7z6W72NS7u+CrsCgwMVDfvhrXatci4vW
	k4itYme34spdMa49Dj6QY+v+YA==
X-Google-Smtp-Source: AA0mqf58bRtPu7gG0d8EAP4vIVJyFeK01H0sUh15HI8xUl9C9vICGdlkwIobwLyY6GU41CY4qopnfQ==
X-Received: by 2002:a5d:4d51:0:b0:242:1bad:6f79 with SMTP id a17-20020a5d4d51000000b002421bad6f79mr13790807wru.342.1669964832241;
        Thu, 01 Dec 2022 23:07:12 -0800 (PST)
Message-ID: <a124e139-7072-7290-93fc-da22c6a0758c@linaro.org>
Date: Fri, 2 Dec 2022 08:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 01/11] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-2-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/22 03:59, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)

Not needed ...

> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

... because we can simply add in the softmmu_ss list at the beginning
of this file.

Otherwise LGTM.


