Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFD905187
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739228.1146211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMON-0004rX-DV; Wed, 12 Jun 2024 11:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739228.1146211; Wed, 12 Jun 2024 11:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMON-0004oO-AT; Wed, 12 Jun 2024 11:43:51 +0000
Received: by outflank-mailman (input) for mailman id 739228;
 Wed, 12 Jun 2024 11:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHMOL-0004oF-Vw
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:43:49 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080a234f-28b1-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 13:43:48 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52c9034860dso3486581e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:43:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f16427842sm461770366b.100.2024.06.12.04.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 04:43:47 -0700 (PDT)
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
X-Inumbo-ID: 080a234f-28b1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718192628; x=1718797428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DR8MrFMpPBxo4kGOVNcrzp+benZP9y/vQ7nGRow2i/U=;
        b=KtC0ctw0f3KTnUf7tmb1YXS0tlsgwzLQF757AJ1jMRz1PJ37ux7u6DKebu851iEj5S
         OrSQ9L3t9CU+b+cWxMrflV0BL5NDqMM9S17SLEVmj49ckN25BI09PVBC8VuVegv1H05p
         3AkHNGlPuwbxUqB2Fb1KUZvIGsOTovg0zJVk0HUCGsCQvB3CHrt5agE3HEw9Jq/dyOJr
         UvdrvuXv0cBaZnaxmxpCv0PW+SSmO5xS1IuBJNom3w7UgAuyUhYKjC56hXjv79oVJkAO
         ecPpCJcDTTRYv4BZ7wf2amrk3xfmLfQan51AQcxYw/D56kpH1VShbs3TyL0D85DHHxex
         vLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718192628; x=1718797428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DR8MrFMpPBxo4kGOVNcrzp+benZP9y/vQ7nGRow2i/U=;
        b=vqGRVcvrwHYHeTqZlF2N95hUr3r4HF3nM9mhWRMO67nripNWEwq5KRQ5AC73XXvnnT
         1j8JDDi8LnrZpA18aQ0EpoUPKZMJ+O1nXRKjSmPuwZWvyvhjbyseLrKTVNbvY+ROuYit
         I4I1kFQ/E9GJ8b1FWz//TJ38CzS5piIBYpyQVfI31nMLUJl1y+T6dPhf5WrxqCeyGz43
         bRo5KyOeuWydAnTzFwqFDe0PCgT01OxIom1aeMpDxC32Pv6f7ta6JuCYgY/+PB6tzmHR
         OYKCFV0pcVgIttR2dqxSb2Ss9miZl1pZwlEowYSd17IGqzJIVjitQEH+4AiWZv2IuVC7
         DWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHCTUaNlZPB5k0D370rxOTLgPEClsFlKX10YvlkhTu3+xJBrQ7ppxONf2egPGDL0mv/R8fvxGHgaSdeKei+liBTkBXDtvOb5lGGW/bZjE=
X-Gm-Message-State: AOJu0Yya1biRK6z5ymwxVc/UD0o9FLS6wzQDebxga3CJyo1VX1v9fdKP
	wM9NSr1z45AH2auqYgXn4Gn6VmDkqCsYgofH7GLr2hANUMvuZX1tMfpp0u2W9Q==
X-Google-Smtp-Source: AGHT+IHZiNvJpPTDC7TlKYlJrzr43r9YbGWfkBZepwqIx8UpABBVxFd16HQOGRKfmcOr1HZcg5JFLg==
X-Received: by 2002:a19:2d4e:0:b0:52b:c88e:cec1 with SMTP id 2adb3069b0e04-52c9a3e3b37mr1144596e87.33.1718192627587;
        Wed, 12 Jun 2024 04:43:47 -0700 (PDT)
Message-ID: <258b3241-c9fd-4534-9dd6-88d8542757bc@suse.com>
Date: Wed, 12 Jun 2024 13:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
 <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 12:55, Chen, Jiqian wrote:
> On 2024/6/12 18:34, Jan Beulich wrote:
>> On 12.06.2024 12:12, Chen, Jiqian wrote:
>>> On 2024/6/11 22:39, Jan Beulich wrote:
>>>> On 07.06.2024 10:11, Jiqian Chen wrote:
>>>>> +    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);
>>>>
>>>> Looking at the hypervisor side, this will fail for PV Dom0. In which case imo
>>>> you better would avoid making the call in the first place.
>>> Yes, for PV dom0, the errno is EOPNOTSUPP, then it will do below xc_domain_irq_permission.
>>
>> Hence why call xc_domain_gsi_permission() at all on a PV Dom0?
> Is there a function to distinguish that current dom0 is PV or PVH dom0 in tools/libs?

That's a question to the tools folks, I suppose?

Jan

