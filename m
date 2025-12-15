Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE7CBDD77
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 13:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186968.1508397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7qr-0003uP-SI; Mon, 15 Dec 2025 12:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186968.1508397; Mon, 15 Dec 2025 12:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7qr-0003rg-P9; Mon, 15 Dec 2025 12:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1186968;
 Mon, 15 Dec 2025 12:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV7qr-0003ra-55
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 12:38:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05304f6a-d9b3-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 13:38:56 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso1790750f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 04:38:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f38d01d6sm14264042f8f.8.2025.12.15.04.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 04:38:54 -0800 (PST)
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
X-Inumbo-ID: 05304f6a-d9b3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765802335; x=1766407135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5nla8UoluNpOGuoTN7ASOb5gf+87bQhrOoW9Cgp0pWY=;
        b=C11sChJEnv0/4RHPv9W/ECJG9hFSrtKtJgNzwNmYcS+RopMMFGVJ7C6uIom/lnzcxr
         vdejFaqVSSzVKwmGGM2Sxhd31SshGmPmWOyHi4eHx3TBpApwD4xkwZn5mU9bE65PEXSi
         uhkBHAY50ynJVdx/OzvbJuPlOVmIU/Y5GDtbSnjsn4D0z79G4NvANcecAsDiuF0692CZ
         jfLCwdgEJ+2xUno0Pj4/O6JBV+qPiXMfNc+M+mcJ7h72ApDWM1wFWLnvvpEpVjFmN+Pi
         EzZEYl+QAsy+mclMhsPOES1Zg+Jf5CSSAbbc8N7JAgrBSpz1WV6hWx00x1M0FEJF5Z9K
         98gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765802335; x=1766407135;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nla8UoluNpOGuoTN7ASOb5gf+87bQhrOoW9Cgp0pWY=;
        b=KZnlCSYu9Ip01Lm5OBWmd/NLEb1hENGnNuQS7jgCaMZ2H4K7YFvCgmaHaWODmPjwk+
         k58qfmUnTMcqtNTHc24wgFrxkum2bJAIuRS+vha9Fb9Jcd75j/EUbosX5Bnqw58usd3y
         Nuu8waSyu7A8Jl36BguFXbv42p3PfSTq+480vG1/TAu7cBDCE0lx0bATl3MphIMZC81j
         oTHQCK9iRvKwuCCAlSHy6U3ja15W9oj5/r/6Cb05cMm7R9WlPVGhjhf69FL5r6M/ibiZ
         aH2eYcUfJKZHyGdAKH4PgyZDOcWBq/bwLFhhGa/gDjpzfgN/HpaGlqgvcM4tdzoGaVyA
         LbAw==
X-Forwarded-Encrypted: i=1; AJvYcCXGKkVMLFhaZoxLx3wgL1Idqj1leD6C9yZxdd/1lwupPSLeN2WKqOV/DVl0eMo6N8bytlk9INgRGOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMgd0GUprn5oKFUsynt3elEoyKzlt3csIJciiSLTq3aeaKXsJa
	baQgxKHjeaRY17jen8XOf0ALPSrGHvAabLKGpVrN4FNUCB03ASnySzYX9RNqE+AtXA==
X-Gm-Gg: AY/fxX4QnR/bYxlSFq91BFIudDG2mBvLJXOQEvjBEm8ibKI/IflQ5fndd3wIuoyEnHI
	OQNTL2eu98JzEefWPikNRIziA55z0VLTiSeLpK7SuMP4XEqBL5fKWLG0nGf/ZIQFWgcC7nQF+YC
	7B0REOtUcQ8p7FwP4KhxbyMCGnLWRjc/1+JoJiDP6J6pZ00O9tF79BEiacRaQLiSIapnhQa541o
	X0EqWmgxQaI60n3URoLQNLnN0dL9ljqHoQuugjh+sfeDeuo7Y19Y5kNihoxHoVWcb4qKwZrgJuO
	XJQ405KubIi14vkQJrHHXGEEcMUqmEJOEwjgUrdwxTjB7Sx644R8H8K5MBTIghoJCxlSWwLzT9h
	FjEnBaaGvXwxk2aeaeWoYmxMc7uUlXroF/KoPn8v4SXHi2JaXAOtqt+YAzkMG6+kwx5x/m0pT7T
	VcLyXeaiJ2MhRuJIcST04qnegAWxPg0eHLbGQO/ah0EmZlnko3vTgU2uE92Mm4QrKyI6X2sx5OW
	Bw=
X-Google-Smtp-Source: AGHT+IHKpsr/G28KMuWC6I5qU7xwsSG47M352qdnc0PnoTgfDmaLxIN5WiAA8P9oLQMs6NN5Ovvuew==
X-Received: by 2002:a05:6000:604:b0:42b:3155:21da with SMTP id ffacd0b85a97d-42fb44a3a65mr11141848f8f.2.1765802335301;
        Mon, 15 Dec 2025 04:38:55 -0800 (PST)
Message-ID: <8d66f6b1-c3cf-4bb0-8065-5c007ad2e2f1@suse.com>
Date: Mon, 15 Dec 2025 13:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-16-Penny.Zheng@amd.com>
 <2e9b0bb4-ca33-4996-9804-5859310d4ae6@suse.com>
Content-Language: en-US
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
In-Reply-To: <2e9b0bb4-ca33-4996-9804-5859310d4ae6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2025 13:36, Jan Beulich wrote:
> On 12.12.2025 05:02, Penny Zheng wrote:
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -333,9 +333,11 @@ struct iommu_ops {
>>                           uint32_t flag);
>>      int (*reassign_device)(struct domain *s, struct domain *t,
>>                             uint8_t devfn, device_t *dev);
>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>  #ifdef CONFIG_HAS_PCI
>>      int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
>>  #endif /* HAS_PCI */
>> +#endif /* MGMT_HYPERCALLS */
> 
> I remain concerned of the former two hooks staying around for x86, despite
> them now being NULL when !MGMT_HYPERCALLS. Imo, to play safe, they will
> want to be guarded (transiently) with
> 
> #if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)

Looking at the next patch - not just transiently. The .assign_device hook
stays present there (for presumably a good reason), yet for x86 it shouldn't
exist anymore when !MGMT_HYPERCALLS.

Jan

