Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E388FDF4E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735929.1142057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Ei-0002jB-Rp; Thu, 06 Jun 2024 07:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735929.1142057; Thu, 06 Jun 2024 07:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Ei-0002g0-OP; Thu, 06 Jun 2024 07:08:36 +0000
Received: by outflank-mailman (input) for mailman id 735929;
 Thu, 06 Jun 2024 07:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF7Eg-0002fu-Im
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:08:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95f1af14-23d3-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 09:08:33 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso238277f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:08:33 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d66cf6sm748524f8f.49.2024.06.06.00.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 00:08:32 -0700 (PDT)
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
X-Inumbo-ID: 95f1af14-23d3-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717657713; x=1718262513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVAZpPXiWZYzmFX1DPoHmlYfKiRk3H4WVr2/Kknry/8=;
        b=JbFu6Yl3lnNQFwBPGnmwQm6wc7hLkQJMbrYLJ8hyZIgb+H6WON6kfT69vf1dGzyKzi
         ki+ZdlyGb3gj4xhVaJWW8Yyut/pAHKbbE8X8Rx37YpMS3tpQC6VBHJCZMwImpSUoACxT
         02+2ZUxvtWd6WtMJFTMv7ADROV221uphAFnKe4Dht/3fUeyYQ9dZiw2LuA2fy36jCZlq
         gytJHGPbOSEUBvbDDe7gEc51rANneD2qS7t+NQBEKqA6qaWNBz6L+NVPMLsXFjfZdoAy
         13tGnMd9zBHqo4BiK0xsBLMpr8keD5odjacEtmNealLGidRCHd13iczXG1idkDZdaAfx
         ToBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717657713; x=1718262513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVAZpPXiWZYzmFX1DPoHmlYfKiRk3H4WVr2/Kknry/8=;
        b=oDjcBzthhXnBXigWgf2mE8dBga6a7BSvGbk6VJd1fR6N5aOaOl3a68u9l6QGHHJAGB
         YFvyuUqUIWKtUdeqT4TETVP/WZpDGAoIYh0st8lSv4twzf+HXox32IMapjSjvWyqU13r
         nIwFHyLLGFZqgo6WVLL5UXW5pjAGvR7AP8u0VHYydRqkh/z323CU03KrcehgFocfjJ4y
         O2Gl4Ea5YmR5sNx0byLC/VG4NO5WUOkrIRBJdfvwRcZr3VhXKsO08UB+C3Bs/ijChmkg
         JO9RpXJytHKsHAdIMpFAb+tHI5NAATVVOs9ZuRqiDoXEkkzql8dfFgt5itcdFbYSkBMx
         e/6w==
X-Forwarded-Encrypted: i=1; AJvYcCW6PLbYMPh5xKlzoBGUGpiJsOcCQ7S6rZQCc7d4LLlQfq8rmydZOiG8vysNVZfRjs8kI4kOlrsL5XlSHTnj/1nEJe0cBL5gDNdzlgq9XAs=
X-Gm-Message-State: AOJu0Yy05TOm6QXopXMYQBDl3nNo8Td9o2HwFVyTS6WtHRb8YoFia8/V
	c7hSHONoFLMCN2f0IW9oQgKfKbB5RnPs0Pa3k7g3nQqyv+MrLKWTTXobHIBa4Q==
X-Google-Smtp-Source: AGHT+IHaBt9PvzUYaH1zWNTBbrPH/BWP5OInr8lF+bZUwhn40ujKdll7eF8RWOaxRCGGU4YW+J8eXA==
X-Received: by 2002:adf:ffd1:0:b0:34d:b0bf:f1b5 with SMTP id ffacd0b85a97d-35ef0ed0a22mr956674f8f.35.1717657712735;
        Thu, 06 Jun 2024 00:08:32 -0700 (PDT)
Message-ID: <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
Date: Thu, 6 Jun 2024 09:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 11:34, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>          case X86_VENDOR_AMD:
>          case X86_VENDOR_HYGON:
> -            ret = powernow_register_driver();
> +            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>              break;
>          }

What about the Intel-specific code immediately up from here?
Dealing with that as well may likely permit to reduce ...

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -252,6 +252,7 @@ void cpufreq_dbs_timer_resume(void);
>  
>  void intel_feature_detect(struct cpufreq_policy *policy);
>  
> +#ifdef CONFIG_INTEL
>  int hwp_cmdline_parse(const char *s, const char *e);
>  int hwp_register_driver(void);
>  bool hwp_active(void);
> @@ -260,4 +261,35 @@ int get_hwp_para(unsigned int cpu,
>  int set_hwp_para(struct cpufreq_policy *policy,
>                   struct xen_set_cppc_para *set_cppc);
>  
> +#else
> +
> +static inline int hwp_cmdline_parse(const char *s, const char *e)
> +{
> +    return -EINVAL;
> +}
> +
> +static inline int hwp_register_driver(void)
> +{
> +    return -ENODEV;
> +}
> +
> +static inline bool hwp_active(void)
> +{
> +    return false;
> +}
> +
> +static inline int get_hwp_para(unsigned int cpu,
> +                               struct xen_cppc_para *cppc_para)
> +{
> +    return -EINVAL;
> +}
> +
> +static inline int set_hwp_para(struct cpufreq_policy *policy,
> +                               struct xen_set_cppc_para *set_cppc)
> +{
> +    return -EINVAL;
> +}
> +
> +#endif /* CONFIG_INTEL */

... the number of stubs you're adding here.

Jan

