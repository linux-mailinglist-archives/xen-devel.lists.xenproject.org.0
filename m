Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36280591E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648085.1012053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXid-0006Zv-Mj; Tue, 05 Dec 2023 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648085.1012053; Tue, 05 Dec 2023 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXid-0006X0-Jx; Tue, 05 Dec 2023 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 648085;
 Tue, 05 Dec 2023 15:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXib-0006VX-LN
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:52:17 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 438d3f5f-9386-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:52:16 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-33348e711e0so1955771f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:52:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b003333fc2cb92sm8277421wrx.58.2023.12.05.07.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:52:15 -0800 (PST)
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
X-Inumbo-ID: 438d3f5f-9386-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701791536; x=1702396336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ddamk8lI7CKSJajJ77Rm6qKeyNaj9mnBdA6yYENfrYc=;
        b=PGFnDWk99Y3Uut+/ie5OuVLmrBK174GRP7prNzR5lMLlsv8lnhWtl8KWgTOfpDaSRO
         OmXPDqOQyz5ZAKNadpDG6tIiu197YAH0jLHx/1EZJexsGRFisOiI8DGBbFy2a47REXRP
         Fxi52sl/cyXATnkyACdpo2Rq4WhVgOhWVJy4dnvL51Ya7MJwybVj78BR2WOoSARjz21N
         2zszCkjWxgRoS/QEM3IXWUpNNhYZzFkMFp01zOnPZLmXBBMIxd3KP8eIq8Prit8STaR5
         PKCDx/0f/rIjQ/0P3b1lGIx+2yblpXNHCsyYfVnEIaEuAd/8tfeXLMPrsbpuUR855qNO
         Y2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791536; x=1702396336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddamk8lI7CKSJajJ77Rm6qKeyNaj9mnBdA6yYENfrYc=;
        b=IlpbuRpVdZg13u3rLEoS6f0E6Ygcum5ddkzTchiwHFQ8vanV1sr9IybSVyAiSryUNB
         QY4y+0bVI82+xpFuZZbSh1yJgsTO7pMKhTgrHJpu4tBM7MFI9sakJ+Z7pG8vxV4ko37J
         RveOatkG+AiSomG9L8szqscukXNdG+Rsd4R7WzC+8Fo4xLVKK08vMKAHrzlDSKHiIodO
         oloZTU4CJbh9g0D7HSMJBx2URHXcf4j/gXR4qEwStOl7LCoX8qBzwi73r1WDb0YQpXUc
         GmPlv+YyH3WfpqEO6Rx25c4VIPovuTaVHSwDuQGaiy4HcLEugnmH1aAfsmOz/CkGQ5HE
         cI7A==
X-Gm-Message-State: AOJu0Yy7Ws9/tAN+RKrGK8qQEMWw1bbExQNjDk28uEwYUHDSzq+A2ZVN
	8oADILdnNeBQR3pOo7Pl6FFf
X-Google-Smtp-Source: AGHT+IGnwrq4Uoc7P8jbI9uJj9N5K2cMR3kpqJtkhMJC9ofuBl5Udg16sQ2e9k7LtRFho3eI4336hQ==
X-Received: by 2002:a5d:6a09:0:b0:333:4bd9:8e with SMTP id m9-20020a5d6a09000000b003334bd9008emr1722712wru.25.1701791536017;
        Tue, 05 Dec 2023 07:52:16 -0800 (PST)
Message-ID: <f26426b3-977f-4ef6-9fdd-b955ca4f66e1@suse.com>
Date: Tue, 5 Dec 2023 16:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/iommu: cleanup unused functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-7-roger.pau@citrix.com>
 <37624f9d-a679-44c8-84ab-42fb8e6a28a0@suse.com> <ZW9GTeqW4Gsqi5Rg@macbook>
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
In-Reply-To: <ZW9GTeqW4Gsqi5Rg@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:48, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 04:29:18PM +0100, Jan Beulich wrote:
>> On 04.12.2023 10:43, Roger Pau Monne wrote:
>>> Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
>>
>> Of the latter you remove only the declaration. Stale patch maybe?
> 
> Fixed.
> 
>> For the former, am I misremembering that Andrew had asked for the function
>> to stay?
> 
> https://lore.kernel.org/xen-devel/81534803-9da4-49b7-894e-f3fb5e8fb131@citrix.com
> 
> I did read Andrew's response as it being fine to switch the current
> function to use a rangeset, but not as a request to duplicate it.

Hmm, maybe I inferred too much from "And I'd hoped to make this common".

Jan


