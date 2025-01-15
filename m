Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9057A11C07
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872220.1283173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXypC-0002Uc-Iq; Wed, 15 Jan 2025 08:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872220.1283173; Wed, 15 Jan 2025 08:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXypC-0002Rx-FV; Wed, 15 Jan 2025 08:32:30 +0000
Received: by outflank-mailman (input) for mailman id 872220;
 Wed, 15 Jan 2025 08:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXypB-0002Rr-1w
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:32:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ffdbc7-d31b-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 09:32:28 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso45721765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 00:32:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3834fbsm16784078f8f.26.2025.01.15.00.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 00:32:27 -0800 (PST)
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
X-Inumbo-ID: 40ffdbc7-d31b-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736929947; x=1737534747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6qCLVnBEHpF1uDdnaIR4GaCRmAKrcju4TeWNLPlBjFQ=;
        b=UMMp0aCqhRfXabiuvsThiLdITEUw4RlVvbjiUtIkcNm5oZS72TfYCrT//g+qqiDB0j
         MYUQl+3+YMlxMWCWVt3CVSIuj5xyhPq+xXpRW8XHtFPAWP9CtrRLnEhs/ju2Nypucll4
         7CWVG02wsN6yeT8nxehjrb/T2gUVvTCY3kRZRRV6e185KST0VxEuWf76s2KNack7lAVH
         AV6ZaWl5y8cfczet1UuMSn7l7Vo199VkHKgofpZhXOdJlcCtQP+4rDTaZ0f+VTgQGKwZ
         F4lrEGNUi0E980qoOdeRjn+w05PYk0PDa5l25zMJ60dkcQ4MDpLx6hs5RMoDHkzMjtpp
         tNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929947; x=1737534747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qCLVnBEHpF1uDdnaIR4GaCRmAKrcju4TeWNLPlBjFQ=;
        b=qa2tTkWuH99EozYzspav6hjAtSadUhGghwG8XjBDy8OJpPRfLGsxx1rDWRWqpQrFWO
         HFogkt+TWNapRWLTz2ZP7Hp4LAdV9IoRDHCLeWJZ2a/NheeoIxaXb8cF3KPMEInN3ilj
         g2CaDS2JuhZ6muxx0lD3AKNvaRlq++u0x+Kdo+Pq3kDedh4gp22Xnxa5chGFUsouEEGk
         Bun+aQlZany6JVfexFCHSnVrBQ7syLjhy3YnFZgyYn1XqpRhC0vk1xE+5d9hdh2+ibUv
         4g2TBLhg/7LqYgP5VJNeQFOzZceg0DI8jgErjYhwAcaSL+mUhcbRFx4W4m3H+oe2p5S8
         07XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcAY0OLKtHZbV5gErf357iUnW3fZM3DemG7oEo457XWKP9c+Y9OSYru7j23LOsCgGFW3ifRdT4nec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTfkNUt22HbJHPORRqsdT4fJoZ88v8bNNW7XY6Rd0gpYi1/5qS
	8FY0i7CZb2P9q01Vn0i87Ghy73GdC2urxiDhwy06lstPySrRN/a3h2iOT0ZNnA==
X-Gm-Gg: ASbGnctklnFzRBBgsqWMbPCeVNwsZYL/TknaoJN5Qu2JbDryIp+QniCh3PqE+Byelir
	lJxLVymYxbPw5bwTT6PidjtF1B6xpfSPfOIu/ZxkcLf/FSXuD4AJskYIz+oPh5e+Ibxsi4A/3sV
	9KL/SP1KpGWdT5w6msZPxdl8lclQVN/YCJvsaoBpHX4oaeasNUiC91QnX0x2xuk5CLOL753KzRe
	L8XFeAOEfcAeYvrp7VDslLpRsyPndtSYDnfgLDuUgR593+1gelIk+IupVzfMqV2FJxJoWs4Mulo
	06+2+T/RWnv0RYqMKV1vC68+sX7Kcz7IGeqqJ59q8A==
X-Google-Smtp-Source: AGHT+IFygbadXDWwWxfe8yuZemjT0loOm1T5xqvNYzQJzPlHntxDo+b9ESgM8Gj3uUrcwCKeYbFaNw==
X-Received: by 2002:a5d:47a6:0:b0:385:f195:2a8 with SMTP id ffacd0b85a97d-38a87312734mr23712996f8f.30.1736929947512;
        Wed, 15 Jan 2025 00:32:27 -0800 (PST)
Message-ID: <af88f6db-f8db-4a2c-b6a7-7955071dd10b@suse.com>
Date: Wed, 15 Jan 2025 09:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-4-Penny.Zheng@amd.com>
 <e7f1b3c3-dce4-4a0e-b1cf-c6ba8af95290@suse.com>
 <DM4PR12MB8451AF14F5B8609E54312F8DE1192@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451AF14F5B8609E54312F8DE1192@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 09:18, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, January 9, 2025 5:59 PM
>>
>> On 03.12.2024 09:11, Penny Zheng wrote:
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -574,6 +574,12 @@ ret_t do_platform_op(
>>>
>>>          case XEN_PM_CPPC:
>>>          {
>>> +            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
>>> +            {
>>> +                ret = -ENOSYS;
>>
>> ENOSYS isn't appropriate for such a situation.
> 
> I've mirrored the return value, so maybe -EINVAL is better?

Generally most wrong uses of ENOSYS want replacing by EOPNOTSUPP.

Jan

