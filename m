Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC665506
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 08:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475090.736607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFVFd-0005lv-B1; Wed, 11 Jan 2023 07:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475090.736607; Wed, 11 Jan 2023 07:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFVFd-0005jc-85; Wed, 11 Jan 2023 07:10:21 +0000
Received: by outflank-mailman (input) for mailman id 475090;
 Wed, 11 Jan 2023 07:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBaj=5I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pFVFb-0005jW-ME
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 07:10:19 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004f5cb0-917f-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 08:10:17 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id d17so14095027wrs.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 23:10:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm15291197wrx.72.2023.01.10.23.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 23:10:16 -0800 (PST)
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
X-Inumbo-ID: 004f5cb0-917f-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
        b=QsnvU3QjCsGrUrsWmZMal1dSye7ALlPTlWdR8roEyrDSpSTxK4uCYZRp8s0YPW7Pi+
         iNCH8BzYk3d67MKeCG1vRxV7zdeIFTl3dhKrDxswgfX1ppqfAPl/q5ksc0vXLhXpgmZ5
         gyZ14dlu5esz4Yna9dWY4Bupdu0Ra7GI6TtXdqPYjQetM3qHuHJPdCy9pMjWSYJ1aXu3
         RJEHUS+8Y+cJu+27SNrPJ853dDlN/4lYwMCZsHFppzlmfeFZ42cCme2GHrtMhJ1J6ZKL
         GrjNaiXAgexd1SaOpVMGq7zBPoqHafa7W63RaApTWq0/QMvDX4+KE5cgoHgXVFcvY9ko
         arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
        b=LU15ll/uVm9UhFnvkeWLXrr9ae+ifQ5mSXPn49PxmhkIoGzG79a1TTjMWORVGliLE+
         VJ/qkKn5nhjLq5VVo1AGr/uPMFMtANBlDD27MLvcrY9kHFgabHpdo4IPJwl7rLVeEFLr
         lcDBtcVaxP59ACE2Rbhw+KpC0YHhW3qoLZ28Ke2aSipvfRkBLZNIvmcinjw/ahjC3u0N
         lrcIJw1/5SgdlsClddpW0W/xf0k3d8tgv5eWHL5klj+RUo38mL8dJcTPaVOHzf7nDDae
         RBCNFdcXNzJUxLx8SNbNCqCvn0aBAv4RJmdzxSHbV5krbv9WJ0XK+pMq3zqN6mphtwmt
         +MDQ==
X-Gm-Message-State: AFqh2ko1j8Fr0STTI8CibvwQ3JNt+GjkyEoJ+Swp5K1ZHebTlDFlNfHB
	Nr9ORnPntetcTZnV9oY8HSWoIQ==
X-Google-Smtp-Source: AMrXdXsGPsc4OJU/t1NQdJK4GmcIPv1Y7o5mpehNbv/fNNrQ3c/gKOMp6+JozXH+1a+SCVhmx/wolA==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id r7-20020adff107000000b0028450505e59mr33484997wro.29.1673421016818;
        Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Message-ID: <92cd2724-6a14-deb1-923c-dad28de5e8c6@linaro.org>
Date: Wed, 11 Jan 2023 08:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, ale@rev.ng,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>
References: <20230110212947.34557-1-philmd@linaro.org>
 <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/23 23:01, BALATON Zoltan wrote:
> On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
>> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>>
>>    hwaddr is the type of a physical address
>>   (its size can be different from 'target_ulong').
>>
>> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>>
>> $ fgrep define include/exec/hwaddr.h
>> #define HWADDR_H
>> #define HWADDR_BITS 64
>> #define HWADDR_MAX UINT64_MAX
>> #define TARGET_FMT_plx "%016" PRIx64
>>         ^^^^^^
>> #define HWADDR_PRId PRId64
>> #define HWADDR_PRIi PRIi64
>> #define HWADDR_PRIo PRIo64
>> #define HWADDR_PRIu PRIu64
>> #define HWADDR_PRIx PRIx64
> 
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
> HWADDR_PRIx instead?

Too lazy to specify the 0-digit alignment format I presume?

