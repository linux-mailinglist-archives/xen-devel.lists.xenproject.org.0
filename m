Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64451A502CD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902401.1310352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq9F-0004xi-Ah; Wed, 05 Mar 2025 14:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902401.1310352; Wed, 05 Mar 2025 14:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq9F-0004vm-7j; Wed, 05 Mar 2025 14:55:01 +0000
Received: by outflank-mailman (input) for mailman id 902401;
 Wed, 05 Mar 2025 14:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpq9E-0004vg-5S
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:55:00 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce7fafab-f9d1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:54:58 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso31661195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:54:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c836sm19386615e9.37.2025.03.05.06.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:54:57 -0800 (PST)
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
X-Inumbo-ID: ce7fafab-f9d1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741186497; x=1741791297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1cQC6vYhD116p/beCQKFVQAku44xo9abXmPmldl+uTg=;
        b=deLX0bKJodmc5pKEN0H5EBna/1jCtln9JC2ACDII3KzYXJFiKxDZ4YGP0t1Unb02B4
         4nsfivFUC+0G4KKP3tTkOo36nMSSGGaN7L5058TFF1XFR4MLYuFPAEjH0QBtXfFOkx+6
         zel0YUwvifvUdYM2zU8+7Zz8paAmRd7qG8p+gFMHNAA0BTWQRvnb2Hns7oD5DPkeYZER
         g9Hp3RjHZZ9y3WJrXVnMZba4u9pQwBDVkLD30BmJhkf/M9TOACi1L84WswY/D0vgJwed
         eryuJKtuEemlcED9rrrwv6q5DLkEC7S1erNERCHArTGCUZTEVltpfOdM7orXZnv8bu/l
         D/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186497; x=1741791297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cQC6vYhD116p/beCQKFVQAku44xo9abXmPmldl+uTg=;
        b=sAbY6ECL5H+aq4x3IZedQMNjojPqHOHI/6rJcNIQZ09egpuF5HydzwzVz3kTqtG0Qk
         EmtSnXTMXkb8cyCN+3oMxE2uYWCwrsuLt1yGURZGNn0nOFgCBrf4MjXH+Lx/inFPjb+d
         Pv7e92IeWgvLGJVDdeShXuyxi0vt2vjFbIlmPksyta8fi3Rcfx9PDAt2XssCAOn/nmKH
         2fWiPlArg01nWBytwo7nnwgMyp1wxUV0QdeN3C7KpD9WSHFF/4fkNTdAJqjk3JgYzzd4
         RwzpQQW4M0ab4acR1Xo/ELF3vyzOJam9qHtSBrZkeGdcZh2E8CLTYkqh2PQCMTM/BvzL
         iFMA==
X-Forwarded-Encrypted: i=1; AJvYcCXkdSOSwy2JZTGHh0arwohE1veTTyljQAu70NAYo6LTrTofkl9CjjQq10RAvmulWV+J69ZwET+YbH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQvWP1eIoq7oA1VnKb7tesapGeX0QG/pgAgQpIgLdvYG9bH2ov
	cr5C/yokuovBcMeDOAB7uMM/Lk7tQdRb/vh2fkxfzA0jSGn3cmtXN95gl3UF6w==
X-Gm-Gg: ASbGncsaFvYfVCOLeeCBDfN5+FG8uTtvoovG4tnGMLP/6inS6OFYMVpp8hnD2ldVpQ1
	LgtlPPqVIhmzfxg5xJiR6lKRq6DHmvR8d8zKcccQTfjf5laianc07LwY01kLj7kCAyHgkr6kKc9
	aNw7lq+NefCl7AB4e4dcaEPNofyM5cQchRktwUTGhHbeZgeA5a/+wf1F5uDo8An5fOYZE3oCKHa
	KK30sCo1B+Drt67GZPfwdFEkZbGesobbbFx8G5kAC+1p/M+XaGIC7ZUVlPWJOifHj0kFVuoZ2W4
	VsDnf73dsWK2Bc7/4mh60rJDHa5TEa/sGvOoePuHHJa0W86TytJQg7bAOUd4Yi0p68QRHJul+Jh
	sVBlClMpK1SDLNVv0dppQGCn+UKpzLg==
X-Google-Smtp-Source: AGHT+IHNtZr2A3dyGK9ML05XEcPWO8cfUCLOQMbaXC80WjYMTu/STBoLSa3mzAv4poS1h8cQ72Gcsg==
X-Received: by 2002:a05:600c:4f15:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-43bd294bc2dmr26615015e9.4.1741186497576;
        Wed, 05 Mar 2025 06:54:57 -0800 (PST)
Message-ID: <03dfb2ad-50de-406d-bdd0-41352c21f82b@suse.com>
Date: Wed, 5 Mar 2025 15:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <db3113a1-4cae-4d2b-8840-645f56af3c51@suse.com>
 <Z8hhKa-KdTbmp6rE@macbook.local>
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
In-Reply-To: <Z8hhKa-KdTbmp6rE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 15:35, Roger Pau Monné wrote:
> On Wed, Mar 05, 2025 at 03:27:18PM +0100, Jan Beulich wrote:
>> On 19.02.2025 17:48, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> First two patches are preparatory changes to reduce the changes required
>>> in patch 3.  I would have wanted those to go in 4.20 to fix the issues
>>> on Lenovo Thinkpads, but it's too late now.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (3):
>>>   x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
>>>   x86/iommu: account for IOMEM caps when populating dom0 IOMMU
>>>     page-tables
>>>   x86/dom0: be less restrictive with the Interrupt Address Range
>>
>> I'm uncertain whether to take this and "x86/pvh: workaround missing MMIO
>> regions in dom0 p2m" for backport. The sole Fixes: tag is in patch 1 here.
>> Thoughts?
> 
> At least the ones here would be helpful for the reported Lenovo
> Thinkpad issue.  The PVH p2m addition would be nice IMO.

Are the ones here sufficient to deal with that issue? IOW iasn't the other
2-patch series also necessary?

Jan

