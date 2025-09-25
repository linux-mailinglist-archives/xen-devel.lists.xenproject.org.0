Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FBB9FACE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 15:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130575.1470074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mPk-0000HX-7D; Thu, 25 Sep 2025 13:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130575.1470074; Thu, 25 Sep 2025 13:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mPk-0000G1-4S; Thu, 25 Sep 2025 13:53:40 +0000
Received: by outflank-mailman (input) for mailman id 1130575;
 Thu, 25 Sep 2025 13:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1mPj-0000Ft-5d
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 13:53:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09660469-9a17-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 15:53:38 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b3331adeadbso288761666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 06:53:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f74fbsm169349366b.51.2025.09.25.06.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:53:37 -0700 (PDT)
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
X-Inumbo-ID: 09660469-9a17-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758808418; x=1759413218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ad7moKFCCJNMEpHmJMVE/TQCTp5JiBqNPpo6LQlNXhA=;
        b=FjnYNrd69lVtnRutxGC/CnQ1fiW2ZrFNQEDb+RHb+17cw9sDOw8OZMQolxvpF8Fq+X
         EBfZTV3zoAZwWKKgGl5xRi2cWEVjhrqWzwQjRqY36jt2cnLvoq1CbXP5okJdEqCoO2f5
         xBZuI0rLr/91zXqbRNNw0sbnpZVUNa8bmMujJ7tzvy22mSlmOkP9E6UNfFPQTC9QexVM
         5VOEahLyxRY5hfvsVP0JA1v2hRHzY3piGzoNjRwEAdp3x0WB7UFeW1Lr61gtJvhngbIv
         msS6jLbbPcFXSm3h3o4N8f+9yvOpJ/92FPN2v/39itWpO/BG0LM/Zy+1nZG5aluH43Pw
         wVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808418; x=1759413218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad7moKFCCJNMEpHmJMVE/TQCTp5JiBqNPpo6LQlNXhA=;
        b=nG9ublWkpUZ5MGDAs0OcwLCCLGv9ziN0EI/gTWnN+coLZlx1w7ELihoPsmHd/9oAE2
         8fy/nKnxz2/we6IrVinGVbHX1RqE11bE8jUtuTn8jinss8teRTG2m7va6bJi+cTkpjLb
         +KSiB3ku3oWhHPET+1xoO3Bu66Z01gLH+SYAmFBmpi7xG2GigIhIZ7FM0pxREH60LbZO
         wqqfozDb7W5ZnIYsCkWaqRb3ayDPtWLPPg3hH46VtRCyx5ftw6jWHPtCH392kDmcsP2O
         1qLUl7Qv9ob2QpGZoBKih13BBf2+dRpgXdAT/gLKYMB4KI75nyU9vGu2V7zVWeEhpKzC
         XXrw==
X-Forwarded-Encrypted: i=1; AJvYcCVk0xJm299KmsN/qZM/omK8BBE5BwP6Jxn799/6WmmRPjs9iVMZ2tat8uyHptgTKWq4e9AOOE+Lsmo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxGQnyF8Ol4GF/30oqEZH24mLhqvx7acgHH4UnjwlcPFtNHnbh
	oWe+QWhGIHnYNxrSFAP23H9PtOJ6sUMdZp+7oN8Uh+mScw7sEnbCnzg0w/s3hTaXyA==
X-Gm-Gg: ASbGncsF9IncFaT12+gS8pqPxWkizE+/5nfwSsaAnBlqQjmph9wCvROgADJhk30Zzik
	NuNYGQtMOAU+Gr4YVRAO7YeQIK8R373ECLtf4jaZTjqYAYIqxIvqkKbGHwd7kNaTkcdwOR95Kqw
	oKi6SmwRlvsiwKfjOdFEaOVxReB15lL5BUeiHSJ73Uk2R6eAFanGtq30W+Vse/ZHlr0gOr5M274
	05ZzZxyLTd0wzhbe/+ZNyAuRGWMraGBKO6cbK1XHwqWyvanDB0AHtWUX446Yl2ZXwABmzWqp8/F
	SN6k3csCPJlQufWH4NdzzSUTaQSQbBv9nrcPN1iKUykG8M1JDIG+JKGiBGOfYmidDBmALmZGbqO
	UlKnJMIPKT2yXs9iVk6kDTBH+MfKy3Zpvj7NNXpp1Kf9rH4ykF1P+x7D795Xx9eC4zFQgStrr6G
	LWGYg5joM=
X-Google-Smtp-Source: AGHT+IHiBHN0SAmPR0OToRUpcXTbPySvE3aJfmw3vQy3eTpHWPp8nx1w+4Gx7z1DkNEEQWJOzh/Uog==
X-Received: by 2002:a17:907:7fa7:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b354a2b1cd5mr301963066b.9.1758808417713;
        Thu, 25 Sep 2025 06:53:37 -0700 (PDT)
Message-ID: <27f9632c-2aa4-4953-b731-9d3c523bff79@suse.com>
Date: Thu, 25 Sep 2025 15:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <ee861e4d0e43917d230e0c31ee51ff0573fcf2bd.1758145428.git.oleksii.kurochko@gmail.com>
 <03c68390-fd9b-443b-a012-2846dda2a923@suse.com>
 <1be98c7f-59ff-4808-957c-daa55d1f441d@gmail.com>
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
In-Reply-To: <1be98c7f-59ff-4808-957c-daa55d1f441d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 16:25, Oleksii Kurochko wrote:
> 
> On 9/19/25 11:26 PM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>> @@ -151,6 +152,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>   
>>>       gstage_mode_detect();
>>>   
>>> +    vmid_init();
>> Like for the earlier patch, I'm not convinced this is a function good
>> to call from the top-level start_xen(). The two functions sitting side
>> by side actually demonstrates the scalability issue pretty well.
> 
> In the case of vmid_init(), it could be a good place to call it here since
> vmid_init() is expected to be called once when a pCPU is booted. For the boot
> CPU, all "setup" functions are called in start_xen(), so vmid_init() could
> potentially be called there as well.
> 
> For other (non-boot) CPUs, vmid_init() could be called somewhere in the
> __cpu_up() code or at the CPU’s entry point.

And then perhaps many more functions. This simply doesn't scale well. See
how we have hvm_enable() for the boot CPU part of this, and then
{svm,vmx}_cpu_up() for the secondary CPUs.

Jan

