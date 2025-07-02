Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C339BAF6400
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 23:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031558.1405371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX51C-0008WL-8q; Wed, 02 Jul 2025 21:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031558.1405371; Wed, 02 Jul 2025 21:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX51C-0008Uu-5z; Wed, 02 Jul 2025 21:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1031558;
 Wed, 02 Jul 2025 21:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFEm=ZP=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uX51B-0008Uo-3C
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 21:29:25 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dfdef31-578b-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 23:29:22 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so6093247b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 14:29:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34f7a42d37sm10941044a12.8.2025.07.02.14.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:29:20 -0700 (PDT)
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
X-Inumbo-ID: 9dfdef31-578b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751491760; x=1752096560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JBN4VEHHJ5qhrPCRoUcNoq+v/jCXyf0QfQS+wS4gxU=;
        b=GvXM+6kL0OAc04tIobBGK8rJ23ozepQ4XSnsNsSFvhPHWladeJ//mg9mv2IAyjj/1U
         neMVCGZwinIxfEntCEMS+Ny1/eyYgnznVUHN8G87Y3UJAiyw1TYIN6RkFiihXHcQBe6A
         ypYLx3sHPaBO1q70n2+Iwywn8+D8rjjIBJ+ezVplymOKIdLEedAM0cNgTTEtHXPwuGly
         3vmVByYoEQnHmuKPs35+lfS/YTLsF5E1VRSPBUYu+DInE4kCVE4SL1XC7h+h8Rq1u5q8
         dlwz5pzOcGJUYyP8c9t2U0E+fj9fcofGX9oclOXcm+XQys1tephia65NNwaD/sQ15Skp
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751491760; x=1752096560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JBN4VEHHJ5qhrPCRoUcNoq+v/jCXyf0QfQS+wS4gxU=;
        b=FFT9H8Ui0rNSDW0NuTD4g5Gd1MJ8e56e13Hs2ZfhaJ5LPj5q9ndTeBFnKPTLBZjBv9
         HVpGbQT6WZu1GasgkYLDlF7vMwyG18WmuAsWSmGQ/9fwEn72BJV8WXIH3rGtzUsq092E
         uJqhmHnHljIAbavHCYkqxsyO3BxI/e0bC2nZ2nwimtUPAQcDdGYp0HJ9n7Lo0KQ37AD9
         NGsCfspHk4h5AnEUzGPt/CVbRiNYGMVtgDpNBkHlBIJFzfV8V54YE6z6yXv7A/OtWkaY
         XYQrxH884thqoWTKkqxeH8z5Gh9OSPqJrkmnwR5H6PFvL50i++NGf9HCiS8qp+4jypHE
         G9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeSAHH7BMM/XEHWMfPBzvUp+FnUAP4h5oJVaN0ZzTsXBbsl+Re7KGEJR1Uk071NpP773PYpD4UUW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjViNwu+6824/DK9yoxB0HpvOV5a2TglMgWvcIDYXkPKmjEXRA
	LUpg15OmNjTwdP0oVCGyvOHWKJAh5T06Uz1zZ160jU+S6dc4alVTQXLdT3YsNVpihkA=
X-Gm-Gg: ASbGncuvc2JRP9uHZuNeaC/z1q3nBejvayDW5U0DJXQ2V9ZGdugbiD10UZwCVJ2BI3w
	mi7UM2Bo9Km7h5GCqKE9U0OysoHlgwdn7fFlxdn/CuIsZzzTXaErmeCjTzJ0Y+79PrpqUfpCAjH
	P32w+oV90MNJf9nocls5Wzh/SYrtZ0jDQRc2TtlzHQ8jTN606p1mfv1tRrDL22gPndq/NOzLIvA
	BbKw01LWTmlyas1hjHbOngd7N5JdUkYqN+2/QAm0DNggi343SDDXhfkvlMzXb36pOR8IPfwo6TO
	vq6mU3uwd0B5IAZMIyniAymmdb0ILaL6nCsdaqlLgzsvqa/kDbDv7Q1Q8Jg8af4S6vOKE8t0tW8
	V4WhvDQwI5Q==
X-Google-Smtp-Source: AGHT+IGRuBACXsDA843dAiaUWQFNi7ADzA2La0R7WmOEy5AendhMfLNglWDzA26LIY1kDqUHVWxHxg==
X-Received: by 2002:a05:6a20:c79a:b0:220:ab9a:953b with SMTP id adf61e73a8af0-222d7ee75d9mr7746925637.29.1751491760494;
        Wed, 02 Jul 2025 14:29:20 -0700 (PDT)
Message-ID: <137f258f-c481-4a5d-a7e6-0e290e081091@linaro.org>
Date: Wed, 2 Jul 2025 14:29:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 58/65] accel: Always register
 AccelOpsClass::get_elapsed_ticks() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-59-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250702185332.43650-59-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::get_elapsed_ticks(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_elapsed_ticks() mandatory.
> Register the default cpus_kick_thread() for each accelerator.

Missing a replace when copied from previous description.

>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/accel-ops.h        | 1 +
>   accel/hvf/hvf-accel-ops.c         | 2 ++
>   accel/kvm/kvm-accel-ops.c         | 3 +++
>   accel/qtest/qtest.c               | 2 ++
>   accel/tcg/tcg-accel-ops.c         | 3 +++
>   accel/xen/xen-all.c               | 2 ++
>   system/cpus.c                     | 6 ++----
>   target/i386/nvmm/nvmm-accel-ops.c | 3 +++
>   target/i386/whpx/whpx-accel-ops.c | 3 +++
>   9 files changed, 21 insertions(+), 4 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


