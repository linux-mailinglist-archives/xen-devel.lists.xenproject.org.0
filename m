Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF1B3B305
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 08:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100565.1453930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursL2-00049p-TM; Fri, 29 Aug 2025 06:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100565.1453930; Fri, 29 Aug 2025 06:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursL2-00047o-Pg; Fri, 29 Aug 2025 06:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1100565;
 Fri, 29 Aug 2025 06:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ursL1-00047i-6W
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 06:11:51 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c2bb7fe-849f-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 08:11:48 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso2470228a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 23:11:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcc1c75csm127415566b.84.2025.08.28.23.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 23:11:47 -0700 (PDT)
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
X-Inumbo-ID: 0c2bb7fe-849f-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756447908; x=1757052708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=doZyjIjeTOVM+BViPQyDUiH5kKVjr2hzxAi0ahYVTkE=;
        b=RtMtoHk87jQz5V0U6fQHaMuYBz0LQOQiPzgH0Ip/XrkIpMdJCs2pNbkfylFaXusVeL
         fnlDSnL/6s6Vmyllv0r7+podmOaujqi6YjVxQzx+an+ZTllfSeMUsaaloWbsVb6ZR3B6
         nL+9ht9GaMHpTZ/nL3uJ1Kgz37wSjTB3kK9D0seYpFcOuER3rB1ca7gjXKe/lG1ghkru
         P0+i7YVNMheb7rV5QKyLoycDAr07Y/3jpmO/3dk9C00vOCUWpaG8bNGVtRfiE8vdBgWd
         wZaStqww5LPqrKt2Hj5ovbDugci6kczLYEvkUrHm8/bT+46jbkzpCAlB1oHv9rNNt8S/
         JbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447908; x=1757052708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doZyjIjeTOVM+BViPQyDUiH5kKVjr2hzxAi0ahYVTkE=;
        b=hBsE66ozKtJSzZGaAZLYGvA2/kDNWpacsrCoFJB2QwGCV1mGj+ur0Ju5apLDQv8wNc
         svEz1TqN9RhWmJXrpkkmfWaXASUzb8qvdQSrGUy+tdsqlwqR8WCK6DubbVpiDQ9/obMD
         xrQ6MAWZaEdXdmvVqXdsK96bROOf2Apm7rR5vYHzPDUM4uMPIr2ZYDhlZu9M7Azvpt4y
         3ujs5fUZ0VPpzmL+3CfN1YsP1VR6S2PdpL/18apQR3FMg9AWS3eV4QaTbYsTulJqVDdJ
         EQ8X48Qdr7NVz1CAAG7pJP5yJKxp0sFvu2zeCRNDBIT02zZ2hBfq5STqq5Z2oFYv2Uz8
         vDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGSFxFQFkAPIKRcDidWolTMfoK2Zj0jYQ1vcJR+gfVIgaLd17dZX5HXq3yCjtMhzo0N/qTNe2B4fE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqnxP5C4+oA+DtGP/z1NNc/zIdQLl2NWzPl3kDDD/AIiDbQSiM
	D7DRLuG+Zsi4CCv+J0DEcY5itz3F6KcIbfLg/7emUETZ0KZscNqvjhRQ+aerkVWC5Q==
X-Gm-Gg: ASbGncsBzv3K7n5HbMkiikrnjNx3gcoJYX7rfMfJHsakThCyTP/lBKZJX0KWXaX5Ud4
	Uv1HqHOd2jeQWlgFuVjGNqsWHRNlytS95iZKDOchrUqUd/+YnSK7Gd/y8Z3699GztSl32lSZjxn
	iAxenJWM5WXF2UIN17PomLDrlmNFYybGFi3GeeYvsTYlGMBjUVAkaRIoa6gBVLUX9VB1uxODnOZ
	eiNT4n6oyWL9ZQvfIxJsszORfpa7C9zzC8BPlUdZcUijFSVJAzht/Rv9Q/WTN++eKo1l/9n+osr
	2BgXh5Lsk3cCm3Gdyr52uvNg5i5ejgx9lUNJYSrPFyLEIBeVD7QuGKOEcOd3sKbBcDZMmdfx93W
	OuOqjJC6KfMxkTDy8zeJywRowtvzXtyHpbY8Ko24mK/rm/ia9nfL9Y6H9/6f+V89QXVqwVnqoBA
	0Jy8H/Fe0=
X-Google-Smtp-Source: AGHT+IHfRnYqey61DT/LRitGGGiBME7Gy+20dQ6ENpsfs5qkiVYnhpAAIciToLLeFezTyT7B12CX/g==
X-Received: by 2002:a17:907:1c17:b0:ae9:8dc8:511c with SMTP id a640c23a62f3a-afe28ffbea0mr2486689866b.13.1756447908211;
        Thu, 28 Aug 2025 23:11:48 -0700 (PDT)
Message-ID: <1ad85430-2aa7-4834-be56-67515ca51310@suse.com>
Date: Fri, 29 Aug 2025 08:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
 <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
 <DM4PR12MB8451D6ACE480227632A8156FE13AA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451D6ACE480227632A8156FE13AA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 05:30, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, August 28, 2025 7:23 PM
>>
>> On 28.08.2025 12:03, Penny Zheng wrote:
>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>> +                                            unsigned int target_freq,
>>> +                                            unsigned int relation) {
>>> +    unsigned int cpu = policy->cpu;
>>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
>>> +cpu);
>>
>> I fear there's a problem here that I so far overlooked. As it happens, just
>> yesterday I made a patch to eliminate cpufreq_drv_data[] global. In the course of
>> doing so it became clear that in principle the CPU denoted by
>> policy->cpu can be offline. Hence its per-CPU data is also unavailable.
>> policy->See
>> cpufreq_add_cpu()'s invocation of .init() and cpufreq_del_cpu()'s invocation
>> of .exit(). Is there anything well-hidden (and likely lacking some suitable
>> comment) which guarantees that no two CPUs (threads) will be in the same
>> domain? If not, I fear you simply can't use per-CPU data here.
>>
> 
> Correct me if I understand you wrongly:
> No, my env is always per pcpu per cpufreq domain. So it never occurred to me that cpus, other than the first one in domain, will never call .init(), and of course, no per_cpu(amd_cppc_drv_data) ever gets allocated then.

Well, the question is how domains are organized when using the CPPC driver.
Aiui that's still driven by data passed in by Dom0, so in turn the question
is whether there are any constraints on what ACPI may surface. If there are,
all that may be necessary is adding a check. If there aren't, ...

>> Since initially I was thinking of using per-CPU data also in my patch, I'm
>> reproducing this in raw form below, for your reference. It's generally only
>> 4.22 material now, of course. Yet in turn for your driver the new drv_data field
>> may want to become a union, with an "acpi" and a "cppc" sub-struct.
> 
> How about I embed my new driver data " struct amd_cppc_drv_data * " into cpufreq policy, maybe pointer is enough?
> Later, maybe, all "cppc", "acpi" and "hwp" could constitute an union in policy.

... I'd prefer to go the union approach right away. Whether then to take my
patch as a prereq is tbd; that largely depends on what (if anything) is
needed on the HWP side. If HWP needs fixing, that wants to to come first, as
it would want backporting.

Jan

