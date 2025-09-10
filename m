Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECDB5131D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 11:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118043.1463967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHPi-0006rg-46; Wed, 10 Sep 2025 09:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118043.1463967; Wed, 10 Sep 2025 09:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHPi-0006pf-1R; Wed, 10 Sep 2025 09:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1118043;
 Wed, 10 Sep 2025 09:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwHPg-0006pZ-K2
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 09:46:52 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1309778b-8e2b-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 11:46:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-627b85e4c0fso867733a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 02:46:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c01bdb952sm2968644a12.52.2025.09.10.02.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 02:46:49 -0700 (PDT)
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
X-Inumbo-ID: 1309778b-8e2b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757497610; x=1758102410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgsRajd9sO0PsGqGTyI/+yzgRrq5KWbZfc5YAND8Kw4=;
        b=ds3R42XLVlEKpPUUTxrppXhc7pp8WF2ViJ2jX6QFeHVXygLaoSCNX2EpKcLy2RP/8a
         09gkNkbnf539cwiI50DcG1bMokBrJ0SmrDwDGcDNq24FJdPLl8DUxS2aToUQKWXMj/HA
         Don9KOvfMYfeEGLNJKw/ScOHuEFH1K4fI2joDH0y3ZdwksdJ28h9IqErAYQcWUcnyhEl
         xqb4INAcxCjyW/v8DnY96eATMSAFEYnHFhZP3M2mhVNIyrYuD5qmdFk8cwEJQ9bnyDbe
         P48N5cTW7/SkX0vhjU+R6pyG3v2I4xON02P1yDQOB5/ylwphqKP1Y74y0K8WLE83v5qX
         xb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497610; x=1758102410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgsRajd9sO0PsGqGTyI/+yzgRrq5KWbZfc5YAND8Kw4=;
        b=BbcWyVWjsba2DiU1wF/QhU+cAk8zbEwKzfClwcAObab0ajUcM03X4RNhg5jbCc/E7F
         A1Pm4M4CeBQ4HLvADGm49aVFeLafK9oHmD5mQrbQpM4NxGIr2ADUuaR5TGQluLlw251p
         iGZzHwppYBoRsjeSla8KY+BaRKaePLVwOsXQevwU1zkcTIK80InqcJeZ4dpWuPXVEjp5
         wQDoyABYrqvhrbxogunqMaTZm45aHYy1NkYWmzfk+Rt6HwOpLxN2gP/GS+cKuRae7gMa
         4X2XjqaRtm2ITOO0MAFKXbzeZu5tNNVr89ZqAHJGeeVWaO8s//jHWqESFAwJrJaSXbJN
         YGow==
X-Forwarded-Encrypted: i=1; AJvYcCWiTCPzxHNeS1FbYk9ji7JRf0u+28tggsIz7ONp8DmRqihcHxgYvByU2uTBGu1jtsbs36hVxYt2myo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2NKLEW4nIXc2woI/41f/zgfhSrSIU6nrUvsp7U50tNtOb49jr
	+ZfFIHP+ASJe/u5dp7L3f75YnU/I6XzmpfNY2LvbWa6jYIJhu1jHck0fJwirG2CQ4A==
X-Gm-Gg: ASbGncvpEUB7DAIBVUiaxr41/icG+Zri5pjA8UwQ3IV93uI8+ukQPv8F/+sJH3zXEJC
	GX6bECNQr4k5uonqEMdyvTPxh4OZ0dtNIKb6z3PDCgJ0kdbBJgxkz72cqwt0tJCXI71Qnh98KcB
	fwAuGyPGLkOHvhwNQN8UAGrRwk8wCmNZjEV1zfdrfH5LCZmJ+eAYuEcXw5rH0D1WA0u18qa4F9g
	dd0N72Q4i5ay/NDZFuLr5BfmztMAD4qw6bMTi9DMFvY8Wyh23/tiWCXsZkkzZHnZB2YtJPTn8UM
	UAkdQ22+9ASS/aka+RrOXbGEoYpn7wWGWnZZ0o/fHhzEtMJafR9Z28YXTh1y4nCQmt5MpBxmf0v
	yRiOl3OrUzJAs0+78qflngsW87uzsLxE2nY9Ht87VkQRwltGJBNYhPLKi7IOTzzp409n07FpdCW
	wfay11x1+B5skZEXLgIg==
X-Google-Smtp-Source: AGHT+IEyGb2I5+uWnwZVMyFKUx6TFqjo20D6YFPpJ1EfutV5Ji8OqhM7CXf9fjpFHMJy5Gs5z9k3Ew==
X-Received: by 2002:a05:6402:688:b0:626:15e3:fa with SMTP id 4fb4d7f45d1cf-62615e3029dmr9463454a12.13.1757497609751;
        Wed, 10 Sep 2025 02:46:49 -0700 (PDT)
Message-ID: <a2abf1d0-be5b-4aac-ba02-9643fbf45981@suse.com>
Date: Wed, 10 Sep 2025 11:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] amd-cppc CPU Performance Scaling Driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <b648990a-7efe-4400-8b85-9e437cfc6eaa@suse.com>
 <DM4PR12MB84518B78EEC2D8E7780DB042E10EA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84518B78EEC2D8E7780DB042E10EA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 11:27, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 10, 2025 12:11 AM
>>
>> On 04.09.2025 08:35, Penny Zheng wrote:
>>> Penny Zheng (8):
>>>   xen/cpufreq: embed hwp into struct cpufreq_policy{}
>>>   xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
>>>   xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
>>>   xen/cpufreq: get performance policy from governor set via xenpm
>>>   tools/cpufreq: extract CPPC para from cpufreq para
>>>   xen/cpufreq: bypass governor-related para for amd-cppc-epp
>>>   xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-
>> cppc
>>>     driver
>>>   CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support
>>>
>>>  CHANGELOG.md                         |   1 +
>>>  docs/misc/xen-command-line.pandoc    |   9 +-
>>>  tools/include/xenctrl.h              |   3 +-
>>>  tools/libs/ctrl/xc_pm.c              |  25 +-
>>>  tools/misc/xenpm.c                   |  94 ++--
>>>  xen/arch/x86/acpi/cpufreq/amd-cppc.c | 703 ++++++++++++++++++++++++++-
>>>  xen/arch/x86/acpi/cpufreq/hwp.c      |  32 +-
>>>  xen/arch/x86/cpu/amd.c               |   8 +-
>>>  xen/arch/x86/include/asm/amd.h       |   2 +
>>>  xen/arch/x86/include/asm/msr-index.h |   6 +
>>>  xen/drivers/acpi/pm-op.c             |  58 ++-
>>>  xen/drivers/cpufreq/utility.c        |  15 +
>>>  xen/include/acpi/cpufreq/cpufreq.h   |  44 ++
>>>  xen/include/public/sysctl.h          |   5 +-
>>>  14 files changed, 936 insertions(+), 69 deletions(-)
>>
>> As we're considering our options towards getting this work in, can you clarify two
>> things please:
>> (1) In v9, the sole changes were related to the use of per-CPU data and the
>>     adding of a ChangeLog entry?
> 
> Yes, also in commit of "xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC". I added description of "moving the copying of the governor name"

Oh, right, and that description is either too little or possibly unnecessary,
with a change made to "tools/cpufreq: extract CPPC para from cpufreq para"
(both as per my v9 comments). IOW v8 also isn't exactly what would want to go
in. All not a good basis for rushing this in at (later than) the last minute.

Jan

