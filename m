Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2A8765C2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 14:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690307.1076177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riahr-0006hm-GF; Fri, 08 Mar 2024 13:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690307.1076177; Fri, 08 Mar 2024 13:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riahr-0006fG-DV; Fri, 08 Mar 2024 13:56:15 +0000
Received: by outflank-mailman (input) for mailman id 690307;
 Fri, 08 Mar 2024 13:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riahp-0006f4-Sc
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 13:56:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7ceae1-dd53-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 14:56:10 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a45aa7cb2b3so112045966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 05:56:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qw16-20020a1709066a1000b00a3edb758561sm9273026ejc.129.2024.03.08.05.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 05:56:10 -0800 (PST)
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
X-Inumbo-ID: 9e7ceae1-dd53-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709906170; x=1710510970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQt+anzuoreJqZXjI7mW21JZ1SpXQKd5IvO+pVvYhDY=;
        b=fRvrDto7KiQcjCPe5xVC9cGt+TceSPH94gg9EjRHEcSPds20ECRlgCPhBa087d6n8n
         LhiyJzpg2NKWRWSY4MuuvAQkx3SXnQy35zEAgvUCFBbQ4eW58/PQxoU0Sqpc1/2tNQpr
         DlkGf9b86x7USHTGNGHcsJO99/G8CQWZ+WN/6ZBDn12sZl8WBZ8crC0R5zjS2/qXUQKs
         fGGNk7X0sq8lvBKLbQjAIFEyyIbj/7TsYI5IH1/+qxkdGEtOUz0o+Z+dSYi9nrHWnZyW
         iFFNIJBsC2KvhbiZemsuo57m2aLc2aWYh34IUT8j7CTW75DBxAtQMog/A6Q7Fu5BtDda
         A7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709906170; x=1710510970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQt+anzuoreJqZXjI7mW21JZ1SpXQKd5IvO+pVvYhDY=;
        b=HxDL6wBqYnfXC73r9G6+vgYZxJIdhqnl42D4WdQou9Sxol6tkoUJ8+m6iKSwhW59CZ
         Jx5mW2hqrHRCEUjvAjsZghI/P0aJ1GUI/Wvb2CSqww5jLHOqASlaHhGwU22QJuQAUeqN
         pL7vCk/2E+DHsgZPevZJ44G+WZg7OO+3lx3idfF0tT4mDrVfFRF6E4WDiIlLC9Ju8vcJ
         NYqdQjWfDmsn4YZ4ThQtOm4lN1e0LtvydSS6AFcwZkw30RlpnjZdrwz7hfyWubM+w/Gd
         kl/i5fPGwQ5B9fEqSjQqJCHWBP1IK58oS5aee8A1LCNRP6qglK1MRW4drovwFFg1nIE0
         xs9Q==
X-Gm-Message-State: AOJu0YzZNU0/LPJI9BITcIccD9wQqnM0jphrP15hmUElz/sn/+IZzVvx
	N3riTEqr+JzujZdrPJjWkCskJKAzUA2m2+FEqXfHem3KHPUysjyNAc+khQMIjJimyRlnmIVU/wU
	=
X-Google-Smtp-Source: AGHT+IEzjNbzCNVhFfCokMmXcWTBscTY/w67gEAT41R1RyP8dqF/nyHc+jbdbNCEMjd1vPWrscPXXw==
X-Received: by 2002:a17:906:b00c:b0:a44:c1a9:ee37 with SMTP id v12-20020a170906b00c00b00a44c1a9ee37mr13600966ejy.61.1709906170248;
        Fri, 08 Mar 2024 05:56:10 -0800 (PST)
Message-ID: <5c21d349-5021-490f-bc6b-eb5973622688@suse.com>
Date: Fri, 8 Mar 2024 14:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 184940: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-184940-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
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
In-Reply-To: <osstest-184940-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.03.2024 14:45, osstest service owner wrote:
> flight 184940 xen-unstable real [real]
> flight 184945 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/184940/
> http://logs.test-lab.xenproject.org/osstest/logs/184945/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-livepatch   13 livepatch-run            fail REGR. vs. 184927
>  test-amd64-i386-livepatch    13 livepatch-run            fail REGR. vs. 184927

Hmm, both have "(XEN) common/livep" following the shell prompt,
i.e. an incomplete hypervisor log message (maybe a failed assertion?),
suggesting a triple fault may have occurred. While some livepatch
related changes are under test, I can't (for now) connect any of them
(or any of the other changes) with such behavior.

Jan

