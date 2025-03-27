Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D7A73359
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:29:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929288.1331904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnHr-0003Hl-DW; Thu, 27 Mar 2025 13:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929288.1331904; Thu, 27 Mar 2025 13:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnHr-0003FX-9g; Thu, 27 Mar 2025 13:28:47 +0000
Received: by outflank-mailman (input) for mailman id 929288;
 Thu, 27 Mar 2025 13:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txnHq-0003FR-87
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:28:46 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f6c5d7-0b0f-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 14:28:44 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so680650f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3f7csm19629523f8f.49.2025.03.27.06.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:28:43 -0700 (PDT)
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
X-Inumbo-ID: 67f6c5d7-0b0f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743082124; x=1743686924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p4bQIgCrWkTChR58ukhq3Bu5CIaiUZg8fIqb+7xUY6s=;
        b=ZjWtdCFbJeGvXipx/QNYYtT5X8R47bLuTZGzazZySDQKl7w6+XWxElq2zyL1HeQKqH
         3Rqbfv0T6bA/l2FPIq6hGh81X6L/UFnucUbHDhv6XW1msd+rL+gcD3/uIbMByQXWu73K
         7kSX9LrSn4xOgSaa9+nF3GEy6zwqcgayMSTiqmbPgUSLJ6KG6tOncAqmspgzJZluWysX
         QDyciERdTn4ZQUcXU0vVtxvDp6KLaLO3U1UnWL/N9OkLDcWAXpbOeijcDDcPpo/hAC7y
         ir8YYuafIpmW5a7IgDH1xq6d9KmjLWFEtBPdO7+g7syO0sxTkGiKOw0Aj2ztS0m0ApOf
         cPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082124; x=1743686924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4bQIgCrWkTChR58ukhq3Bu5CIaiUZg8fIqb+7xUY6s=;
        b=szVRkBh+7H4fhIM71GtXQgZzhizNVIujKPDKeJNzBGmplpfYqAvnYIhT9HsTM39Ii3
         8dBtN1hIFzJiBi1aePHsgFMRGDKHwy6ppNOPrdGwVt5rmGPauVxqQkY2rOTy7dDfS1cH
         zXcQwtpfc4pzW5RXKh5v/KKc4IAyQevfmd45iK6v4gVkZHEDkCge8BpZO+xmgG9TE5+5
         CyXe2ILUmsSb/lV6XZJMbA/vGO2HXXwDBn+x7FpvsegqNdKd1rd88uqT4DoPrHWwvKwi
         0C+pmxUAr/u0I5cfzWLCY2qpsLPTjP3BkhLm6TzJkxrYCdtO3gEb2sLFNXz/YDgdMvle
         aa+Q==
X-Gm-Message-State: AOJu0YygB4awY5ZKANF+yZMbu8q+byJ5Xt+Z4sSomkd0EdNmKHApBizw
	okbWBE7FLMEILI1WQbJHHR7f7vhuTOuIR3RDqB+DC8XuAgITnLLA5zqHDDg/dQ==
X-Gm-Gg: ASbGncvQfYgECA/Vpj4sGGjW8QLPyW6ZwDGaolFQ2VRL59fCdze/5JveiFuw6Pfej+N
	U25P8lIbvM9hnhW3OXLDt7k3q5CPiomFgwfzKMs8FNk+73QVdf+P0OCYYX9TYl/qGL93a36RCHB
	Yc7OyvRSqNb8rlVYf1mUYGCBsPy2WVowJ1N7SnspvPCEalTTpmfxt+konbw6zCxcILP8cvc+vt9
	brcBWETi6R6+UG9nqaiZtfYOlIEigDfh2+M85mKS1y+1eAN385LLWHqrdGfNQ8CXW62T2uGrX+/
	gU1QHG9i+6yDeihTmMgpLEGN8lAR/5jkq01bPZgToRUCqlf4gCGvu2l3xai2SWzxCDQDKQFLOId
	mLwOj9GCSuR8doDHChsnjIFA0zjw5lvMxARyt7msk
X-Google-Smtp-Source: AGHT+IGSQuvRL5+2EeZOHCgW1Yin50C6KIR0XS0gtSyYQzy5xHvKOc83B5lydbeqxArI5WK5mVgfeQ==
X-Received: by 2002:a5d:59a9:0:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39ad17414b1mr3407132f8f.1.1743082124050;
        Thu, 27 Mar 2025 06:28:44 -0700 (PDT)
Message-ID: <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>
Date: Thu, 27 Mar 2025 14:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
 <Z-VJBIbQal-jZAGM@macbook.local>
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
In-Reply-To: <Z-VJBIbQal-jZAGM@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 13:48, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
>> On 27.03.2025 12:38, Roger Pau Monné wrote:
>>> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
>>>> Unlike stated in the offending commit's description,
>>>> load_system_tables() wasn't the only thing left to retain from the
>>>> earlier restore_rest_processor_state().
>>>>
>>>> While there also do Misra-related tidying for the function itself: The
>>>> function being used from assembly only means it doesn't need to have a
>>>> declaration, but wants to be asmlinkage.
>>>
>>> I wonder, maybe the intention was for the MTRR restoring on the BSP to
>>> also be done by the mtrr_aps_sync_end() call in enter_state()?
>>>
>>> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
>>> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
>>> process.
>>
>> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
>> then, though, as for the BP the writing then isn't just "okay" but necessary.
>> Question is whether doing this so much later is actually good enough.
> 
> Hm, no idea really.  We do the device restore ahead of the MTRR
> restore, so I wonder whether we could have issues by using unexpected
> effective cache attributes for device memory accesses as a result of
> MTRRs not being initialized?

That's just one of the possible problems. The father the MTRRs we run with
diverged from what firmware puts in place, the bigger the possible trouble.
I think the restoring better is done as being switched to here again. The
absence of any discussion of MTRRs in that earlier change leaves me pretty
certain that the behavioral change there wasn't intended. Andrew is usually
pretty good at spelling out all intended effects.

Jan

