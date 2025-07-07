Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE9AFAE8E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035308.1407542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYh9a-0003jF-IQ; Mon, 07 Jul 2025 08:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035308.1407542; Mon, 07 Jul 2025 08:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYh9a-0003gU-F1; Mon, 07 Jul 2025 08:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1035308;
 Mon, 07 Jul 2025 08:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYh9Z-0003gO-VG
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:24:45 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6485a17-5b0b-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 10:24:44 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-453749aef9eso8697225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:24:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc4e102sm11993492a91.3.2025.07.07.01.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:24:43 -0700 (PDT)
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
X-Inumbo-ID: d6485a17-5b0b-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751876684; x=1752481484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6feaULcezJTJFyxnT5hCpX0VyZDX0E14j5tqvGp6sRg=;
        b=f73bfo1+erbiHExPQQCazf5PnQXFj+nDLXrqdeMxzQ8eG8kgyKBhEYWY777PHEVhhM
         8cUDx95Nu6qVVaw15NG0Q0iFkop98d5yTThWzsSjxcKztldvcemhpr8lhxJ6oXCe/vWn
         IrS/ScQBR1Ud2xvIVfXdCG0fCTQZmMWCnlwhmX+TS/6bwRhSjgXn20UDJ0Qw3krx02Mx
         QhHY3tdB/JOkp07/I9gh/uqmgMOjDlWXiEOZzd2XJS3vX3cKk0cbzjhjxYbVRenOIKhh
         AFqEUyCqPqSafD7+4V3anyLAod40hstayhqOgOnf52BoiFERwqxWfJmmOGc7k0cMDsSA
         qSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876684; x=1752481484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6feaULcezJTJFyxnT5hCpX0VyZDX0E14j5tqvGp6sRg=;
        b=oxkiDJlbhbMTrL8gdgV+bYA7U0q279TdfMb6vULL5TJwc3YtjLxrM6hHRrNqMASm1b
         OujfpmAVN5qaHUHcnKxTSOnafwx4mVqQqUdszk69h0RZs1uu8oHHtzwMV991wAURRfOH
         kXpfGGy+ObaH/YCq4t3VDe+93yRtRnJCbgw7vjGZ0ZR3XwNy10Y6Wj9ac92te4EsspKI
         pYrtjl6f4Q/0Avw9jrmRRws2pPGo76K0ufgrnQqUbq/kTjyVDGW8jipqDRM66T/zdSDI
         1zV2XVWSDHNjpr2XU4lNXdBEKDIFSsHVUDVblyicrUSlkgnh7wAwFS49iRI6eY3Fic9l
         YaNA==
X-Forwarded-Encrypted: i=1; AJvYcCUesJ6J26wsht2LD0yLU665OR+89rsirFdR/LUq5zNTcNKEMogj+qojUJ6T+DUfiR5GkZTYN5Qs3k0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ675bl4PQ5RBUsM8aIRMv5MpVWrqSUkI9WPvVUnO3Y88/ua85
	O1swmystFOKUnbLig1kVtndZkWKzMjDXJDckhbE/Gppuelerg1sCrc74Fhdqilhe0A==
X-Gm-Gg: ASbGncuHVVOaiVIx56ESu6awPI5mvB5/o7YW9Cw+hYUwk41JRXb5B3y4WZ30TwwFwin
	XCTqrM8iiOcQ4H/7a0CPUMEEk4kfOUAgWk82eFDgFl6VrTJUHjQj8O679FykyUfUcb9tRkM0kYa
	ML+abeZyMhTcGS3VroGzucqWP7aNXivSFLyAjWhPEtGGmeMYTtv5tcspTEMDyhrmqS/tAcAyMQj
	HZWlzqG6sv/2V9wGAXsIRc1IF+1efNb4qW9EHeU6I65ExiSrQnHmtadcHX40aonBftE0g1JNWkq
	LEhMfP86QrdAECqkCLL4Q/qEFtmpHg3ulWOAMoH3JcDKpv7af86tBU0r1zfybpLLKpWBUW78YjZ
	y3MFEl6rE6sPyxtdUrTO9C7tQKnRQIWPICDVdnrKhwYWHaPdZmTSxCV8X0w==
X-Google-Smtp-Source: AGHT+IGa7CjrARa9Ak4jPtpY98egKvZsC8MBh3g4e8xvePrPKPIi09Tj8b9Lm3bR6dyhhSyEmr8NNg==
X-Received: by 2002:a5d:5850:0:b0:3a5:7904:b959 with SMTP id ffacd0b85a97d-3b49aa87545mr5264664f8f.58.1751876684064;
        Mon, 07 Jul 2025 01:24:44 -0700 (PDT)
Message-ID: <70869cab-ecd1-4756-a874-91fbc9b7ec35@suse.com>
Date: Mon, 7 Jul 2025 10:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com> <aGqc6HfryKoVoLDL@MjU3Nj>
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
In-Reply-To: <aGqc6HfryKoVoLDL@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.07.2025 17:57, Sergii Dmytruk wrote:
> On Wed, Jul 02, 2025 at 04:29:18PM +0200, Jan Beulich wrote:
>> Btw, a brief rev log would be nice here. I saw you have something in the
>> cover letter, but having to look in two places isn't very helpful.
> 
> I don't really know how to effectively maintain 23 logs at the same time
> given that changing one patch has cascading effects on the rest.  I'd
> suggest using `git diff-range` instead, commands for which I can include
> in cover letters for convenience.

Well, no, doing this per patch is possible and relevant. For cascading
effects their mentioning in a revlog can be pretty brief.

>>> +#define _txt(x) __va(x)
>>> +#endif
>>
>> Without any uses the correctness of the above is hard to judge.
> 
> The _txt() macro is used right below:

Well, the comment was meant a little indirectly: The correctness in
particular wrt the __EARLY_SLAUNCH__ distinction.

>>> +/*
>>> + * Always use private space as some of registers are either read-only or not
>>> + * present in public space.
>>> + */
>>> +static inline uint64_t txt_read(unsigned int reg_no)
>>> +{
>>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>>> +    return *reg;
>>> +}
>>> +
>>> +static inline void txt_write(unsigned int reg_no, uint64_t val)
>>> +{
>>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>>> +    *reg = val;
>>> +}
> 
>>> +     * This serves as TXT register barrier after writing to
>>> +     * TXTCR_CMD_UNLOCK_MEM_CONFIG. Must be done to ensure that any future
>>> +     * chipset operations see the write.
>>> +     */
>>> +    (void)txt_read(TXTCR_ESTS);
>>
>> I don't think the cast is needed.
> 
> It's not needed, but I think that explicitly discarding unused return
> value is a generally good practice even when there is a comment.

In the context of Misra there has been discussion about doing so. But in our
present code base you will find such as the exception, not the rule.

>>> +    txt_write(TXTCR_CMD_RESET, 1);
>>> +    unreachable();
>>
>> What guarantees the write to take immediate effect? That is, shouldn't there
>> be e.g. an infinite loop here, just in case?
> 
> I'll return infinite loop from v2.  Tried adding `halt()` as Ross
> suggests, but including <asm/system.h> doesn't work in the early code
> (something about compat headers and missing expansion of things like
> __DeFiNe__).

Yeah, untangling that may be a little involved. Open-coding halt() is an
option, as long as you clearly indicate it as such (for e.g. grep to still
find that instance).

Jan

