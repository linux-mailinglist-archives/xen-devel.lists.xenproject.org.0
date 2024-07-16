Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDA932ABE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 17:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759684.1169376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkEz-0007Lv-4f; Tue, 16 Jul 2024 15:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759684.1169376; Tue, 16 Jul 2024 15:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkEz-0007KK-05; Tue, 16 Jul 2024 15:37:21 +0000
Received: by outflank-mailman (input) for mailman id 759684;
 Tue, 16 Jul 2024 15:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTkEx-0007Iv-2x
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 15:37:19 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48637470-4389-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 17:37:17 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c79so7982882e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 08:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eb9e357sm6415227b3a.22.2024.07.16.08.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 08:37:16 -0700 (PDT)
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
X-Inumbo-ID: 48637470-4389-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721144237; x=1721749037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kLVGuAQtORRx5gC43xs1LAgzGnfdXQCsOwV41vcaFoQ=;
        b=VlKHlfIG8+8hg+nKHU9jrZ5r6HSBmWKv0Jw6GD9sNk8o62ny9pllCf8rvQe71FbgNS
         KnSMxZQdotZaUVB+UP4ntLDCQt2PGtmPSBpu/Bj2P3w+xPoRXlbfKTVnrcSBMAdxqECy
         oLsnJtuisnbJA/TNLyDNxtozma0gk4YAP9PG1ysQb+pV8WhcJf6ok8LO710O8MrqK9L8
         +Kk7JrHaUkXT7LUpPuep/26AP/OV2iBcbK1OVdpoR+2gE16/yp+x5eIlTq3HaNgs7gI4
         ibOy8v7D4bob943VxAS57nvGqMBhyKzBmXTJXDb52oYZoa6KWS2r+1aya3QoX/jC+YI7
         QjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144237; x=1721749037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLVGuAQtORRx5gC43xs1LAgzGnfdXQCsOwV41vcaFoQ=;
        b=r13tBbQm4TrlVNnU/Fxl3V2K7oUNTmmY4d+mPDts8AQoL4DO55yNx+pTotjN/LIsH6
         nhqAwlseVdiM6xcJ32AfaXCNHLBhFous7/Iv1fOGK3DW2wIJ52/MoxlDxQNDrH9Au5qB
         vdmFmUDXFqqWswwhqjqxS0KvdAqtH8XKz0D7t2SieskLIJ03kUIJCO/j3U+D5mtEQroa
         TRpew3PM+Jd3ZIRvGCfvWsDGQOZb1AqF+igErlITR8EOXyrvP3Q0HPBM66NCQu78Kncq
         SsCkvyebmMerWT9oVRdoEwJ1iPP5KpVEOBs6NX4ajrvEiEERrriung2Zo7pB+NNe1PV2
         05HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkSEtD8PQGlPP9KPB5qgegi6Z9W9vOmc07gyEKn/oEP10zRrlgwkKt0TzsZqIUlMKW+gybC9tsjIPeQJjYuM76E5jlifKJaeaDQYd7NK4=
X-Gm-Message-State: AOJu0YwcofFScqtfqWcfMKakumXQqZmd2zmslxI+a9mkO2tt3yHlaBsH
	OZ3TepW0cXTIlq39LnThYB660nZvYT8CoyR7ZTpnXNc7o9AVQsDWEjv8Het4EA==
X-Google-Smtp-Source: AGHT+IHpSFRGU7krjNdzGJs32+N5sChYFgjlpD3DHxzrAeTpNDtef7DTL2tFAYo1OWcD+pm7KnzxWg==
X-Received: by 2002:a05:651c:4ca:b0:2ee:8ce9:3037 with SMTP id 38308e7fff4ca-2eef41d8b29mr21897411fa.37.1721144237097;
        Tue, 16 Jul 2024 08:37:17 -0700 (PDT)
Message-ID: <def172dd-17f4-445c-9a2d-5b2ea8ecb064@suse.com>
Date: Tue, 16 Jul 2024 17:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
 <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>
 <66968bd1.050a0220.dfc8c.b00f@mx.google.com>
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
In-Reply-To: <66968bd1.050a0220.dfc8c.b00f@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 17:03, Matthew Barnes wrote:
> On Tue, Jul 09, 2024 at 08:40:18AM +0200, Jan Beulich wrote:
>> On 08.07.2024 17:42, Matthew Barnes wrote:
>>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
>>> startup.
>>>
>>> There are efforts to support a maximum of 128 vCPUs, which would involve
>>> bumping the OVMF constant from 64 to 128.
>>>
>>> However, it would be more future-proof for OVMF to access the maximum
>>> number of vCPUs for a domain and set itself up appropriately at
>>> run-time.
>>>
>>> For OVMF to access the maximum vCPU count, Xen will have to expose this
>>> property via cpuid.
>>
>> Why "have to"? The information is available from xenstore, isn't it?
> 
> I shall reword the commit message in patch v2 to avoid the wording "have
> to".
> 
>>> This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
>>> leaf in edx.
>>
>> If exposing via CPUID, why only for HVM?
> 
> Other related cpuid fields are also exposed in the HVM hypervisor leaf,
> such as the vcpu id and the domain id.
> 
> Having said that, I wouldn't mind moving this field (or other fields, in
> a separate patch) to a location meant for HVM *and* PV guests. Do you
> have any suggestions?

I don't think we can literally move anything. We could duplicate things
into shared fields, but would that gain us anything? Therefore I think
going forward we should limit type-specific fields to cases where type
really matters, and otherwise expose in a type-independent way.

Jan

