Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB698C4C8E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721142.1124285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mED-0007n1-0f; Tue, 14 May 2024 07:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721142.1124285; Tue, 14 May 2024 07:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mEC-0007kA-Tl; Tue, 14 May 2024 07:05:36 +0000
Received: by outflank-mailman (input) for mailman id 721142;
 Tue, 14 May 2024 07:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mEB-0007k4-Na
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:05:35 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a20f472-11c0-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 09:05:31 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso42982111fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:05:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a178a9d68sm686572166b.80.2024.05.14.00.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:05:32 -0700 (PDT)
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
X-Inumbo-ID: 5a20f472-11c0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715670333; x=1716275133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JgMKTvgEP03nckpkq+PCRNqoamnknhD5+kUsUVCa38=;
        b=YAbtiIWC6nFgCOF6XRDRy6UfVd82ZB09tjA2lGe6KNAtAIY7mGrMBgB3tiOE/OksBB
         XUveKCggsaUvfbMpggTC4NpWf4MitJtYe1ZnsIsQyKy4uelajPEdqWvHOYx0u4tO2lNV
         5pUR/jbSPUTMx3fEBH1EWXgUPGPwdzFEeE/luY4O7aQyMYLDnV7HXy/kZggIU3OWo3v1
         qOtZ8EDYbR6NxycfgzaHJTF9wwP2/Z+RZmreFMdWTOdFvaZHmo7GEuLDD0qtMm8t4WIG
         Ufp1re1QwjLofCm4brf+qIjW98E9vq6sbCDDcgYDBBXOHTtyhmmYzpg1/XNPuDGbxySf
         K1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670333; x=1716275133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JgMKTvgEP03nckpkq+PCRNqoamnknhD5+kUsUVCa38=;
        b=cggmgTPbPsQOorGGPoZsDCk0/lCCbOhqug5iXzhCO/9xM69eeMx0bry7M4OHNsh3qH
         WNRRMf/N/0AgVHMVhqg4L0wdCkayNp6N8h2B0SePTkNqGYoL3+dvaO14dHZmxS/aBgwk
         7Wc/ETMik+RixkF+/DUReU8CJtLQzotryks6dG2y5uEJyo5JCHd9FUd7TDVdpr41DanV
         JMWVYp/iZdl3RM4Mb2v62Z+R+0KyZ1TyqCeyBZxoynHqJlm7kJVAdQ2Otx5LWfknQYzQ
         ayETw7ZsonYBpjoXJ7QC2gQr0nV9OG7m2V4wrHZBkMTFGCxYEDdJWu6d2aqwOyhhsePm
         S8gw==
X-Forwarded-Encrypted: i=1; AJvYcCUX3yP5613XgqNIyqYXBbO+hjX/AEn09OA/NJbW8NG5lzA8XCfeyi+j8ASp7oS+hqdrSr/fhk9irLA7UYiV9Bs444No6WbjDlc0G00/jbc=
X-Gm-Message-State: AOJu0YyvYLX0ZTTfw6YdngHGR90DUowVO0qCRD4yJlbW4uqILDkLJiPP
	7lBsg/p/l8cVIuyYkmz9b3axWngSf/0iIY2x/hrvKwtC9rz18nCzisdxtz+DEHggxgI5gGG6Bek
	=
X-Google-Smtp-Source: AGHT+IE+qypl3TYv3mtDpoooRDRZHZfMcaTzpxUDf6ugVInQxEb7xA23EbQVo3j2vcLFziWw/8rdaA==
X-Received: by 2002:a05:651c:149:b0:2e2:9842:a9d3 with SMTP id 38308e7fff4ca-2e52039dc3emr94524221fa.46.1715670332974;
        Tue, 14 May 2024 00:05:32 -0700 (PDT)
Message-ID: <c8a4ab8e-786a-4e85-80d4-4da0ea5d9129@suse.com>
Date: Tue, 14 May 2024 09:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/MCE: optional build of AMD/Intel MCE code
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <47d32ecff7b915bd23b6d13b76cedf4b39db71a2.1714640459.git.Sergiy_Kibrik@epam.com>
 <dc14d45e-b2b2-4414-a937-ae95115aa2cd@suse.com>
 <63dc5c56-19e4-405d-a016-03175dd704bf@epam.com>
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
In-Reply-To: <63dc5c56-19e4-405d-a016-03175dd704bf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 11:11, Sergiy Kibrik wrote:
> 06.05.24 14:32, Jan Beulich:
>> On 02.05.2024 11:21, Sergiy Kibrik wrote:
>>> Also global Intel-specific variables lmce_support & cmci_support have to be
>>> redefined if !INTEL, as they get checked in common code.
>>
>> Them being checked in common code may have different resolution strategies.
>> The justification here imo is that, right now, both variables are only ever
>> written by mce_intel.c. As mentioned for vmce_has_lmce(), there's nothing
>> fundamentally preventing MCG_CAP from having respective bits set on a non-
>> Intel CPU.
>>
> 
> so could these global variables just be moved to common code then? Like 
> arch/x86/cpu/mcheck/mce.c ?

That would likely be a better approach, yes.

Jan

