Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E71812D3C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654440.1021364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDjBR-00011j-35; Thu, 14 Dec 2023 10:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654440.1021364; Thu, 14 Dec 2023 10:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDjBQ-0000zQ-WA; Thu, 14 Dec 2023 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 654440;
 Thu, 14 Dec 2023 10:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDjBP-0000zI-S7
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:43:11 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92a9cbf6-9a6d-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:43:09 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50dfac6c0beso6065970e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:43:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vh2-20020a170907d38200b00a1be80a0b69sm9182928ejc.58.2023.12.14.02.43.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:43:08 -0800 (PST)
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
X-Inumbo-ID: 92a9cbf6-9a6d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702550589; x=1703155389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZVpokky+TFEHortVvpzOfyP1wjxhMg3ImUBtqh5rg0=;
        b=gGtCNfyLD9Gt1/uNdHJYKKnYu/xp5lRGG7my3E34aMZYG/8LVgr8p3KpS30eTWow2B
         P8ca4yVo4j2VXqvKY1SXYwk4pWPJZ/f+GoCI6VeroGfyCJ7fxDey77v/5Q/d4h3g42Lj
         VTeysK7DL2JHN9rzXgs92mvACwR+3XSRCakdCcz9Y3IrJLrOZGOI+8l5ogSpJVweQAkH
         hZDAkK3SgKVn5A5CzylghPiJkxkdZWDlS92oghe9tKX75XwF7xHsoLNjZtCpQsxJdnlV
         phoc3n8JRJs8Wy8e5VaZbrWaFAkDtzIWqHA+mbD/YnjVN6MUg7P7mjo3P7HrE1xNBH3C
         QTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550589; x=1703155389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZVpokky+TFEHortVvpzOfyP1wjxhMg3ImUBtqh5rg0=;
        b=TjM2PMdmMfX55L1L4YHqK4b0eBZCWCEGtJODir5PjKejw8Putrx8cyBOu9tb928fEt
         S9eWzLjUBO5+8R5VoM7RjnQhr/lZE3+vJZY9W043JhO4ut2vdCCNzAUCNH6aaVdr6t0X
         Pw0bff2HiicPXlfudWv5VpIT/2yYUcVuv8ZHK8aGHArpeIu02+XZS0ctLTZPI1sa3TFp
         DAn3bxy0rWlZXRF6mWRuP2EN6AFAzewL9TjAICOThP+AZKHHHIVXsJrGEaBkZKGEw7ot
         +WngQnO4wH84USXwpoIW29P8HiMMtx2aizWIrlTrwDi1JoicsUHSqMHtgmXWqhEz3J77
         togQ==
X-Gm-Message-State: AOJu0YzpCgi6ahyj4pKVPFOrm7veSM5OZctkut22QAB1XsQxNpLd3Jz3
	vL9XNSLgadhDQHYkOD7Uet4F0K19tAD1UzbxKANE
X-Google-Smtp-Source: AGHT+IGMggLN8ETdOWbZhVYXIIb7kpl0Jh2jzXNLIvBnBjsN/XPF9W4oLGgL//QMdyMiqucj2tTRag==
X-Received: by 2002:ac2:4542:0:b0:50d:12f6:da8a with SMTP id j2-20020ac24542000000b0050d12f6da8amr4112760lfm.48.1702550589187;
        Thu, 14 Dec 2023 02:43:09 -0800 (PST)
Message-ID: <dd07f28a-891e-48ed-a07c-eb3850811601@suse.com>
Date: Thu, 14 Dec 2023 11:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | cad6f9a4
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <657adb903cbdd_2c95448341d4@gitlab-sidekiq-catchall-v2-66957bfcc9-q9pqb.mail>
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
In-Reply-To: <657adb903cbdd_2c95448341d4@gitlab-sidekiq-catchall-v2-66957bfcc9-q9pqb.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 11:40, GitLab wrote:
> 
> 
> Pipeline #1106780344 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: cad6f9a4 ( https://gitlab.com/xen-project/hardware/xen/-/commit/cad6f9a4c12dd4d5cdb2620e3fe24727ee81c7ce )
> Commit Message: smp: move cpu_is_offline() definition
> 
> It's all...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1106780344 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1106780344 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 22 failed jobs.
> 
> Job #5751094611 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094611/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-randconfig
> Job #5751094255 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094255/raw )
> 
> Stage: build
> Name: kernel-6.1.19-export
> Job #5751094548 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094548/raw )
> 
> Stage: build
> Name: archlinux-current-gcc-riscv64-debug-randconfig
> Job #5751094078 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094078/raw )
> 
> Stage: analyze
> Name: eclair-x86_64
> Job #5751094580 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094580/raw )
> 
> Stage: build
> Name: alpine-3.18-clang
> Job #5751094585 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094585/raw )
> 
> Stage: build
> Name: archlinux-gcc
> Job #5751094587 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094587/raw )
> 
> Stage: build
> Name: archlinux-gcc-debug
> Job #5751094540 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094540/raw )
> 
> Stage: build
> Name: archlinux-current-gcc-riscv64
> Job #5751094593 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094593/raw )
> 
> Stage: build
> Name: debian-stretch-clang
> Job #5751094620 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094620/raw )
> 
> Stage: build
> Name: fedora-gcc-debug
> Job #5751094595 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094595/raw )
> 
> Stage: build
> Name: debian-stretch-32-clang-debug
> Job #5751094597 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094597/raw )
> 
> Stage: build
> Name: debian-stretch-32-gcc-debug
> Job #5751094603 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094603/raw )
> 
> Stage: build
> Name: debian-bookworm-clang
> Job #5751094608 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/5751094608/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc

Picking out this one:

Reinitialized existing Git repository in /builds/xen-project/hardware/xen/.git/
fatal: unable to access 'https://gitlab.com/xen-project/hardware/xen.git/': SSL certificate problem: self signed certificate in certificate chain

No idea what to do about it.

Jan

