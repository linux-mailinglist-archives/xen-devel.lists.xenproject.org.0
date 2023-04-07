Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E06DB6BB
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519111.806323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv57-0007ga-Mj; Fri, 07 Apr 2023 23:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519111.806323; Fri, 07 Apr 2023 23:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv57-0007e2-Jh; Fri, 07 Apr 2023 23:01:21 +0000
Received: by outflank-mailman (input) for mailman id 519111;
 Fri, 07 Apr 2023 23:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkv55-0007Nc-Pr
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:01:19 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a6d04b8-d598-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:01:18 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so87304pjb.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:01:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902968a00b0019f3cc463absm3447735plp.0.2023.04.07.16.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:16 -0700 (PDT)
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
X-Inumbo-ID: 1a6d04b8-d598-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FM1IoSWydLocj7jgKW9MEFCM/UyoS3Vw58k8MbYXpPI=;
        b=VQRL/jwZ/iwhTjW4uDgB/xQLypDFRo9dz1YtZKQWTGVtHNnhpUq2Kgr4tJlXpVc9Qj
         KBbQLfG2Z5FHXSI2VMMAmE9q1dOQk2iWj8kn9Q3lFDBbsPO0CVUPQMhVWuKl2kkGhFG/
         8Zx43AFsVbKUnCTXY9xLDWzf05mzNP0m7zfiIrbp+mM1baQPyagVzxLIe6pjmdO2GbAF
         FeHj3l+btpKL7NfDJ58MeRoUTWNwI8jp8DY7i9J3B7PBjUoMr2KbS1QbvXFBz9wfhpPH
         DHITQUJiwZ2kYMJ1/oiVdG61WqG2rvBx9o0dwXq2wqhvT0EMxe8M67t1dsAj1odQ8rE9
         zrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FM1IoSWydLocj7jgKW9MEFCM/UyoS3Vw58k8MbYXpPI=;
        b=5N9o5spoxtihNK7B9eTgJNVFIfR+RVt1Z+5LgP67uiDzv48u+6RwJ/zItYipYouDnu
         nGG9+YPw404v6hD0j3W5XmMwerDQyrvQXvgtDjVmTWDJpdFXwgbzYTer1yoPRIFQE1W8
         h1dUDBos83KP8i/NpKK/wkBOvmjijSpVf2ZG/sDcNhepuSrKBFj9rWxxz2yuNg7UBaX8
         ptEfX4LxrWaAD+3QQsDX9Axe4lfoYk1Ro76WGehicKcad8aTN9VgVmSxCo3K5VOHTtm4
         6xXCvdvPqT+XtLVi4ksjxurwRVaJG6XUt10zSsiTD8PafhK4y8jQKKUYSWa5/MYP8KXo
         X7Kg==
X-Gm-Message-State: AAQBX9e1er5oa5MXn0J02hb8cx7Jlz8UWkQ7eEQFjqKE0+jsU9Mjv8hg
	+5HWD2+52M7R9zBabBV1ZoaGcQ==
X-Google-Smtp-Source: AKy350bRqvhbX5rOLuwqRdImyfLdTcBcyn1BquKHrKT2CT3Zjs0A2Q1f98kdBv1POsH49ZV8G3BXyw==
X-Received: by 2002:a17:902:d2c9:b0:1a0:50bd:31a8 with SMTP id n9-20020a170902d2c900b001a050bd31a8mr5700663plc.26.1680908476761;
        Fri, 07 Apr 2023 16:01:16 -0700 (PDT)
Message-ID: <af0397ba-f714-427f-c050-10b423cc772e@linaro.org>
Date: Fri, 7 Apr 2023 16:01:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/14] accel: Remove unused hThread variable on TCG/WHPX
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:17, Philippe Mathieu-Daudé wrote:
> On Windows hosts, cpu->hThread is assigned but never accessed:
> remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c   | 4 ----
>   accel/tcg/tcg-accel-ops-rr.c      | 3 ---
>   target/i386/whpx/whpx-accel-ops.c | 3 ---
>   3 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

