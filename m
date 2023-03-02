Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EA6A8B8E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 23:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505465.778266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXrEN-0005EA-Nu; Thu, 02 Mar 2023 22:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505465.778266; Thu, 02 Mar 2023 22:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXrEN-0005BN-LF; Thu, 02 Mar 2023 22:16:55 +0000
Received: by outflank-mailman (input) for mailman id 505465;
 Thu, 02 Mar 2023 22:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pWRm=62=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pXrEL-0005BH-W8
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 22:16:54 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeafa0d5-b947-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 23:16:51 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id f11so543306wrv.8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 14:16:51 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003e206cc7237sm4096886wmi.24.2023.03.02.14.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:16:50 -0800 (PST)
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
X-Inumbo-ID: eeafa0d5-b947-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677795411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
        b=ALhBjpW+9d/4nqIcn9T7comSyKRfOMYle0Ef7GQcmPgOMdutjgV9UKobixXu/69zHV
         Gna/Ej5gE7HUKBhbCvqj8/rzOOj3rbijoydiLuqrANb5aNRLMwdpFwlO6Ij0SEjLwLD2
         SuURyr8oCgi/BLZT/28QMLcv7vIq/RsDcJEHtcwC9g3SA4Sh23srhZ96u5XizNgGCXBf
         ZH3j7PM46/BS1tqUUOXxHHonLNrabmZBig13eMG/aln6neAwBf8pxBBx/y54Rue4bw03
         m/17PD9lLEL2rAwGbbb36CMxU3NG/S/W6it0v6UIN8EOIM9HtOZbnfqO+RvCmNpJkpgk
         4s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677795411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
        b=idI1gSI/yhMjfA9b7d7SEM35BoyJAYsF24uhLG3XqQqBp3FTm0fM0rFVWnuB4hop5N
         tp6AL/iTRyaqXmg7JJyvRs2K973DTCvfhSCOJRDIGb4T6Dh1HPX167ddkyCHp7UhnZNc
         FlvyBE2+Zcxjb+ORV4Ef90BElEWRaouGwruJDR36CgUEA5X0uC3G2bcCOI7EGCVXybs9
         vhEykO3zigYTsVqemg6A+41698eHzNXcBSB/3P60UEXiLb1fFDdd3So3LuwNljBFNaiE
         rLa3NDTjHXq73fe29OQk43ZBElTwoJoF4QLVlN5d/OSyD7jGrS9iXOfxNTR1qXjBqIHS
         w21g==
X-Gm-Message-State: AO0yUKWaLGDsZR+mn8Yj0ZdkMTg/+H4+nN50ud+61T6Q9cxRTgDYsVr3
	lxpMN/MUka4rcFcgGfXuT04dug==
X-Google-Smtp-Source: AK7set8FAJoagkadDS0ky4D6I6VKl6CQte+kz2H8UpkpBkrwx3GyTQUjYMJKyj+fdM6XhAnFPLxhzw==
X-Received: by 2002:a05:6000:11c2:b0:2c7:1d55:a56b with SMTP id i2-20020a05600011c200b002c71d55a56bmr8281108wrx.70.1677795411324;
        Thu, 02 Mar 2023 14:16:51 -0800 (PST)
Message-ID: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
Date: Thu, 2 Mar 2023 23:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/23 17:31, Thomas Huth wrote:
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>   to use the ``qemu-system-x86_64`` binary instead.
>   
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
> +this 32-bit KVM support has been removed some years ago already (see:

s/some/few/?

> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
> +future release. Use ``qemu-system-aarch64`` instead.

If we unify, wouldn't it be simpler to name the single qemu-system
binary emulating various ARM architectures as 'qemu-system-arm'?

