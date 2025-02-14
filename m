Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C4A357F6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888421.1297783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqEJ-00009H-Ii; Fri, 14 Feb 2025 07:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888421.1297783; Fri, 14 Feb 2025 07:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqEJ-00006H-FA; Fri, 14 Feb 2025 07:35:19 +0000
Received: by outflank-mailman (input) for mailman id 888421;
 Fri, 14 Feb 2025 07:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqEH-00006B-QT
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:35:17 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c2e64c3-eaa6-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:35:16 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7fa1bc957so323669166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:35:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376ba4sm286225666b.106.2025.02.13.23.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:35:15 -0800 (PST)
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
X-Inumbo-ID: 3c2e64c3-eaa6-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739518516; x=1740123316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8PI07fGs6Z5nSIPWBumR8ahBk0npDTIKeDmWfwGTztQ=;
        b=U1lUPZvctrV34LMmb0oDMBYJHJpJfZWfZpmWnDWnuWx9XGhp+xtTqzjQLNBNV4B5gc
         dY+UFJASbE2ZkXrG3Wixd1ZfCYnt8Hqraa2XPDjEkNGnhJtxs+v2V1s8rMn+jhN3wafq
         d/ruYBUNYBHrxi3LQtpdQEmB4J9TKsbDuUrpda5HMEMhpEIkc49k/rSAveBUKIsTgxBN
         G91SWatC/HXx7tOH2rYZ4pzTNIgzGEKI61wWgZn/8hazva4X9+3kpiAXqG1HTwJBbp3e
         +uBSyDvqFc0N40OemNt+UoQ9owYw66bTZrg9+Q3RreFURS/+GhAjxgNZKE4bKqZSEOsv
         pZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518516; x=1740123316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PI07fGs6Z5nSIPWBumR8ahBk0npDTIKeDmWfwGTztQ=;
        b=jdwFc7D9JEQ8ZSI6RYoqYRlIb4kCExiO5DENQlE2JeOC6BP5d+kKuyFroVoJcFW9vZ
         0rrJytzOHXdKC6HZ8Gb86V4pR4vyq+wLSodKjheisQuXODn+iKImN4l4dBRXmrfWx1Z+
         2W78wR1gtgkm5Al29mOzK5CuOLxkU3WoenJwAnts3Nolw6kHUpqx83v0bBipZnCfmZP6
         yyaFTE7WJjLbItl4c2wgyeSxr9kGnicep+yM/KqkTwyyj62DzTy7vCxSeOV0W7UVniTr
         MEVkGhctmSh81U/bdATkcVu5lbh/tqF7xtVl/Hv2uxrY1wqKlxbcapdtTgwr/AsEm3Ca
         SGdg==
X-Gm-Message-State: AOJu0YyJKxbzeIYVyIcqAkuQ3GXUsbbk7UYK3qM+rkfc5sgCi+xNODI9
	6j6z/16UgAzCrwdmG+KlGrlOs8Ivt3sVfDqr/Mt+63BSJo5YrNTlC9VAclPa3m/E/alsmU3vNgE
	=
X-Gm-Gg: ASbGncvDWP6tIdsiyWeAIh1nWPx5K/gRgvQGfuWfjqPcbBGq/10cT+aH/SyrisN0iYR
	rM5bNFK+GkXXWmBMiuq5EaAlll3cCM2QCdAMP76brklXbAVRS6a3QuCerdJV8e9UUig+SpAcnqb
	hpZdZOZ5Pog5PLKez1UAsaF7fD8TMflNWViCFHY+JVAWloHgAk+l7eUI+RvOylV/bKIYXYZt1t7
	iBFPURwdRJOYM9ntqOgAIb/fF129hsL8AisBk4brpY6XaSLUqGChVNkTmRBHxha2C1bAojhVGFm
	hUoLA/d4Ia5+KMRXQfrzLZFQw1Tvl8SLMevaRJ0ocqRLFMWa7/SxAMKJ1WoXw/Pb5YPQdZqq4cO
	a
X-Google-Smtp-Source: AGHT+IEp3BaTOi3eqkV9+FOM+eSS15oM6HYIPsGyyDy8fuG4iwhkuH5W527CHd5XfiumJJOfKIyw5Q==
X-Received: by 2002:a17:907:d24:b0:aa6:9198:75a2 with SMTP id a640c23a62f3a-aba5017f149mr609722166b.44.1739518516237;
        Thu, 13 Feb 2025 23:35:16 -0800 (PST)
Message-ID: <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
Date: Fri, 14 Feb 2025 08:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 04:32, Chen, Jiqian wrote:
> On 2025/2/11 17:21, Roger Pau Monné wrote:
>> On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
>>> Some devices, like AMDGPU, support resizable bar capability,
>>> but vpci of Xen doesn't support this feature, so they fail
>>> to resize bars and then cause probing failure.
>>>
>>> According to PCIe spec, each bar that supports resizing has
>>> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
>>> handlers to support resizing the size of BARs.
>>>
>>> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
>>> is read-only register and the hardware domain already gets
>>> access to it without needing any setup.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Thank you!
> May I know whether this can be merged in Xen version 4.20?

That's a question Oleksii would have to answer. My take is that it's (far)
too late in the cycle for a feature addition.

Jan

