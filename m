Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296DB9DBE2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129997.1469665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1g0L-00014z-Mf; Thu, 25 Sep 2025 07:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129997.1469665; Thu, 25 Sep 2025 07:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1g0L-00012v-Jt; Thu, 25 Sep 2025 07:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1129997;
 Thu, 25 Sep 2025 07:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1g0K-00012p-U3
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:03:00 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab5971a8-99dd-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 09:02:59 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so102507966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:02:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7472sm102925266b.57.2025.09.25.00.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:02:57 -0700 (PDT)
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
X-Inumbo-ID: ab5971a8-99dd-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758783778; x=1759388578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qXfTsvr5LGr8oL3ZbSYuAdZO4jHsITLutkexUXEdZUc=;
        b=RBt1sEeuE0cJdsIfIZeKPrPxfcPBlTgNJl4RuHvdXW1bb3mj/VEYh5sgpbSC8/5+jN
         cKWUvpq5x/jw+kyzMuF+8nYAOFEmu7zfPeLkreiSKjlCh9knC/hc4qYEaOneGmoVYT/c
         298SMX/FDtAnL9Seu1w32xGyYKugjfES6MEAp5k3BGQU8RevfofbUU3s+vUI4jmbOCdW
         Y6Bax85q3Ly0BUxkP09+Gb4iHbRor8GokqSMVnjXBHw0eOR1/+D5J44iH432YtHqLKfP
         wmOtcw0VsZUZiTb8RyFpLvO06S8yRF7de+sC3DNUZNERnYLe/awJZKWL9QDCxl1hNtZW
         m62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783778; x=1759388578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXfTsvr5LGr8oL3ZbSYuAdZO4jHsITLutkexUXEdZUc=;
        b=W8vCfVTG7EloRlUqvYkIMUKIV20qazEWNaLdwdmcIjR+Z2zS3HjhAYx8c2Kq2UP9OL
         XxJuHrzxmszEOQtoPtcqGAvqZzOA5N6WmPYNro38YOZm0Pf6TKUdk3rksxuMDOQH2Vn7
         0EN9tnuUNlSn91sXQGxUTnxCpvC6LIOcCjkIi5Pt0iVohmEoQdHhe2ySnJVCxP9L4exF
         Fk8yUjbH1/bRkAEM7Peb8xyEl8wbzsj5adX79JA/54JZjCqFKFAyi/uoQwPEf8AU7D9J
         TIvgQHWj3YomfqVIGvi7o5bgtO/QqP53vX+35C+Jt1nmgF6ykvbK54zHp2+CyhOFvEA4
         lOrg==
X-Gm-Message-State: AOJu0YwacRIUFPNYD1WhadtXZvDJIm6K5BZ8zxpTbQZgyR4Dg2snMuOM
	4TlIcJNUxkhmeAj3Hkk9bWrpBrOp4vA82SEwGq6Tr4twwvV8FPgXGQLlOokU1H7N0g==
X-Gm-Gg: ASbGncus/mLpDciClKSQdlFtRoC3XUNS0iRmPREcI/Xgy72/c2ys9hijhzbAi6qjbiq
	faNJsJ+ndl+plP38CmVN8eQFLBpjoQN8UgesYONqv1FqBBIa/zHiZrPQPoGIkEcEMrPeo9ssO+1
	6Ln/Prq1AlGWH9ZrQtTZNFGVhJxu2mpwc7YNX+8/ruQsqLPi6piYyKqiWzCMUN8mCFJ/cxbhh5t
	Utst9aMZ6+FHZRKPqZ5+qx3pHLnPPx2RkPTCGvzud++aFw7r4+eXvhHKvdnZBQGEqPbDPMI2Z/y
	nPPqUHYp2I9HMyWm0r9DD/3GA7rT8K5SKbg8rTEgtNhvytO9brvKhd8uv8r36d8EcCcGBWgoKD/
	vqPEJ+4u8t8aJ28ERKSnEw+joBsiQEFE2U8S/BEMJh7yWDbqQDX5R+DiXjePRs00kBOwqHhMVCl
	UoSyKEdq0=
X-Google-Smtp-Source: AGHT+IFkh/ypWGz1LPM8SPv8MCqUdDE3rvFo8B8/uDPplQ6qjJMMKj3S4BAxWJtU+1YDeMsuni9xQA==
X-Received: by 2002:a17:907:3eaa:b0:b30:852e:bea with SMTP id a640c23a62f3a-b34bd62cd56mr250537766b.63.1758783778490;
        Thu, 25 Sep 2025 00:02:58 -0700 (PDT)
Message-ID: <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
Date: Thu, 25 Sep 2025 09:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper@citrix.com>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan>
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
In-Reply-To: <aNP0iNtp2q3342G9@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 15:40, Roger Pau Monné wrote:
> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
>>> Otherwise the check for the SS feature in
>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
>>> X86_FEATURE_XEN_SELFSNOOP never being set.
>>>
>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
>>> identify_cpu(), because SS detection uses boot_cpu_data.
>>
>> Doesn't this, mean ...
> 
> Well, that's the reason for the rant here.  The reset at the top of
> identify_cpu() has been there since 2005.  It's arguably to make sure
> the BSP and the APs have the same empty state in the passed
> cpuinfo_x86 struct, as for the BSP this would be already partially
> initialized due to what's done in early_cpu_init().
> 
> The underlying question is whether we would rather prefer to not do
> the reset for the BSP, but that would lead to differences in the
> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
> past we have arranged for leaves needed early to be populated in
> generic_identify(), like FEATURESET_e21a, hence the proposed patch
> does that for FEATURESET_1d.
> 
>>>   However that
>>> creates an imbalance on the state of the BSP versus the APs in the
>>> identify_cpu() code.
>>>
>>> I've opted for the less controversial solution of populating FEATURESET_1d
>>> in generic_identify(), as the value is already there.  The same is done for
>>> the AMD faulting probe code.
>>>
>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> ... this Fixes tag is incorrect?
> 
> I think the Fixes tag is accurate; the code was OK before that change.
> Nothing in c_early_init hooks depended on (some of) the x86_capability
> fields being populated, which is required after the change.

I agree. Hence:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though whether while there we wouldn't want to also store ecx if
we already have it. (Really there is the question of whether we haven't
other cpu_has_* uses which similarly come "too early".)

Jan

