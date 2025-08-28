Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990A5B39ABF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098363.1452435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraKW-0006B2-Sp; Thu, 28 Aug 2025 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098363.1452435; Thu, 28 Aug 2025 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraKW-00068b-PC; Thu, 28 Aug 2025 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1098363;
 Thu, 28 Aug 2025 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uraKV-00068T-Qs
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:58:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e008b47c-83fd-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:58:05 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so107875866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:58:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61caae5fc3fsm3785196a12.51.2025.08.28.03.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:58:04 -0700 (PDT)
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
X-Inumbo-ID: e008b47c-83fd-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756378685; x=1756983485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WtohK9f0LMbOuqZ8A/KDlfL+M1uy2XxklyzjfRyM06g=;
        b=UBpWR3KfcNj1yEtD7XFN2jL5ORQglp44w0NvI0h4w0SwHJWXZMTNlTc/wH8+WUimoO
         iedhui7fRLj5RJ8arCEKBnZWjdZ3K51x2aBoVhnszXdIrPeqcC/Z++Ze1tw7S09oKBMB
         WCVG8Z/cwJ6Tbd/l1KDFQKdekwHDyPC7JQ3/q+zLztgciE/vHmRldTo+rG1dML92FflD
         PLiboBHTC2r4Z9E0yxM8F7yTZP9th60MfcUAYTi6GpCa5E159wUOBjB0P5HBA71J7uvn
         FkNkCFWvk2QPvDHGBvZ+yDG2vRdWGCZ8Wbwn5YH9RiSVAxAemtPFIAOSU1WGYPQhKILt
         of3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378685; x=1756983485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtohK9f0LMbOuqZ8A/KDlfL+M1uy2XxklyzjfRyM06g=;
        b=qGQRmqqBnaozdkV6i0tufwzslbOiAbNWIWajDhnD5QLW+9dJiDb+MsdR8/4x4x5mYD
         OlvCWM9KMeIWTJae7B+D8DvBdBsspDGXyNAAXtmlA98hJiBGWEZ/PKpbgX27GlU2iPlL
         lsKC0d7z8bym4yU1Eiyr234d9cSYLFS79VknmJWmmPQgS+x3fyCwOOJxIPvIf+GigVjr
         wL9zEqGOyoWPmRZWp63IKQqRsQPU93JzTeBmHMLb46/HjWC+GPeUYx3PxYOfZ3ZrFIF0
         g+ZDyEuCIBgmjd7NgCmq+8/Q1IlPWlpteky9Dlshbh4qtAF/QoZ0xiReixB54vAKOuIT
         urQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEA6fAmMt5DPfWgvVoGcyBUfV5qP6T0vDS9gZNXgJRczCLgHgN/ilH2IxV+c243nLVCKaA4ipIWSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVBwxUoaBjj7YhUQ9DjIDJWPCoRl56mNnSpZrVwQv7pLj6Vxqs
	cy1f1sIFoW0Ku3NQjC4qKzn01ZkpERGJ1JoFLKRFIGTG1GO7azlMOgDbBKoOVep0GKO7iTRqPtV
	kFdk=
X-Gm-Gg: ASbGncuIoK1/QGwtcV215rc5twGPGSApA7yvSDxps7+3keCdbflZAFceYXQo41bYzgU
	jBWwlGvBjedPvxhamu+xOlKPcPdR9rSbcQ2rRceZTBm13AEtBDHgTEL0cikz78dr7XzNlfN8y8f
	64mLlxg9qlYTGdtf77aVn87rHySF3XsX+seC9JVP3ABuHk51sAh+zVxjC0KY6VEw29PiCj34rHu
	a3b7xgtg1qXqTWWKxhUe43OyhIMbW2qO5XuqXHTzr68fmDu+KM7qfk1EkAUmFBSuYd8rlYbuKjW
	3vUHfOGO8tOAom9x9MCVo15aUnUCaPEa5Lo4FaLsbwE0uuOruERzR4EsCY0ZsTntSTeHsZHugjM
	FGmddQEIPhhyCQ8YCbbPltYeFHR4Dm07AXuRJvo/TkORBgimbBvq8F9rDmTtBDxhjPYo7oDUYa1
	fPWcHxPTmbMsk5XWCJ9Q==
X-Google-Smtp-Source: AGHT+IGVMRrGsDLiMwUQd0+/BX+xQJiTjr69AQd8SQFn4mDWjNo3IH16pvNvMinBkLlvUneX7E1LEQ==
X-Received: by 2002:a17:907:7206:b0:afe:b097:e1db with SMTP id a640c23a62f3a-afeb097e673mr838876566b.45.1756378685204;
        Thu, 28 Aug 2025 03:58:05 -0700 (PDT)
Message-ID: <eed6afd9-a4ae-4d98-a807-e443848d5c14@suse.com>
Date: Thu, 28 Aug 2025 12:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/8] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250828100534.1777023-1-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250828100534.1777023-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:05, Penny Zheng wrote:
> HWP and amd-cppc-epp are both governor-less driver, so we introduce
> "is_governor_less" flag and cpufreq_is_governorless() to help bypass
> governor-related info on dealing with cpufreq para.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


