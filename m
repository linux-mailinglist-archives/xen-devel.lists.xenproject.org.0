Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867084271D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 15:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673483.1047818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpOq-0002sa-9v; Tue, 30 Jan 2024 14:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673483.1047818; Tue, 30 Jan 2024 14:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpOq-0002q6-7D; Tue, 30 Jan 2024 14:47:44 +0000
Received: by outflank-mailman (input) for mailman id 673483;
 Tue, 30 Jan 2024 14:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUpOo-0002q0-Rf
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 14:47:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84233444-bf7e-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 15:47:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40eacb4bfa0so43633265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 06:47:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 by5-20020a056000098500b0033afef9bdfbsm165010wrb.8.2024.01.30.06.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:47:39 -0800 (PST)
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
X-Inumbo-ID: 84233444-bf7e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706626059; x=1707230859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qFZq1Kph9B36QRA8Hq7ImKlPVDa941bgkGY4EbEwdc=;
        b=KtJIQQC/F+1ly6UYuKszpmyR3Uuenzg2xycSEz8pENo2d8A99tHOCJc3lZgcflajMQ
         iGBRbnCrBWUv++2WDBQjEPEk+nufhd6sEG1mPgZWgnFxU4WVUCPxWxEbdiZ5r5X/S5kZ
         lZSlmzl7u4izFSgY/uJ2RU2tG56Jp1tE9zWs2+q7rjSkbTZxwAoZG+qixmN9zTc1xgWd
         XvDR1CPDVlO1mBo0rNfnPnSJpzQekMqlRxO4r/Z9HMlYmQhmSbftDV3IQg9+QdE94+y6
         p5r/Enq1+F/jzid+LNk6XIzqb9GW2CaoVEEyor5zVYza32AvGsuiquroIDqX64coulPf
         Mx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626059; x=1707230859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qFZq1Kph9B36QRA8Hq7ImKlPVDa941bgkGY4EbEwdc=;
        b=hNV1BDRaRv/kEBx/5pTJdMD6zg1fr+yr9PGiWBYtF8jowHIlbTZslzIidDSe6mPye3
         kvZKWoSGRH0hoOB/s/BauK6tID09ETmEk30ktMVkWaMBrqRqG/F7tGWAfTXZszknLITX
         pUxSb+YlgLSWIBhdfRJ7kUS3MGlG326IXOtxhx4ADt9XGyHLgJyCKDLbA6Fh/345MWco
         OqZDMts21ZZF5nGG5Vqq04AXey36cVrLRyWEfUlXtipj1PHK7Xtf9b/ixgcFrWieC/nn
         jTathfBAN7Cwl3eGeUvyUGG4N+LbEFLfXYIl+mJAom2tI6SISNNrhd88FMDZssZ5Urq4
         6fmA==
X-Gm-Message-State: AOJu0YxFoHWBHILh6z2G3RuH0c+Y3PAZhlYHjjgtJWJoxEx4Y2an8J5F
	ElAuKohfnZCH1XeEFwlIGVEUNpeHafeP+BggZaUD77MWQ58xjn++XOXrgnvILg==
X-Google-Smtp-Source: AGHT+IES7Rh5NYSeJZcY66bz4W3Vx6dxaIb1JpR1D6pTWNlDpBLN7LHlzJzt9GwQ2hQ5hrp0Oph02A==
X-Received: by 2002:a5d:558b:0:b0:33a:edba:4e1d with SMTP id i11-20020a5d558b000000b0033aedba4e1dmr3507134wrv.31.1706626059480;
        Tue, 30 Jan 2024 06:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVPENBN87UySOlNDUNWhObLinO8MlJYtRtyGIB05LNs2oECLewvHQWv39i+EL5ZOFTD08JH9oYopsoH2BAFTDXtqlHU5rX57bq+qK0z6s3lSrCa75aHW2wuTIo=
Message-ID: <9f117de7-a729-46d8-ad09-30b1f2bb7580@suse.com>
Date: Tue, 30 Jan 2024 15:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com> <ZbjmS2oLAV7Fyqdn@macbook>
 <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com> <ZbkJH6qhCa1GjTES@macbook>
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
In-Reply-To: <ZbkJH6qhCa1GjTES@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2024 15:35, Roger Pau Monné wrote:
> On Tue, Jan 30, 2024 at 01:59:14PM +0100, Jan Beulich wrote:
>> On 30.01.2024 13:06, Roger Pau Monné wrote:
>>> On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
>>>> On 30.01.2024 10:13, Roger Pau Monne wrote:
>>>>> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
>>>>> SPEC_CTRL MSR.
>>>>>
>>>>> Note that those controls are not used by the hypervisor.
>>>>
>>>> Despite this, ...
>>>>
>>>>> --- a/xen/arch/x86/msr.c
>>>>> +++ b/xen/arch/x86/msr.c
>>>>> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
>>>>>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
>>>>>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
>>>>>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
>>>>> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
>>>>> +                                    SPEC_CTRL_IPRED_DIS_S)
>>>>> +                                 : 0) |
>>>>>              0);
>>>>>  }
>>>>
>>>> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
>>>> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
>>>> description it wants clarifying why it is acceptable to run Xen with the
>>>> guest chosen settings for at least the DIS_S bit (assuming that it is
>>>> okay to do so). Likely (didn't look there yet) also applicable to the
>>>> further two patches.
>>>
>>> "The added feature is made dependent on IBRSB, which ensures it will
>>> only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
>>> ensures the value of SPEC_CTRL will get context switched on exit/entry
>>> to guest."
>>>
>>> Would adding the above to the commit message clarify the intended
>>> implementation?
>>
>> It would improve things, at least hinting towards there being a connection
>> between exposure and updating on entry to Xen. I'd like to ask though to
>> avoid "context switch" when talking about entry from guest context. While
>> in a way technically correct, our normal meaning of the term is the
>> process of switching vCPU-s out/in on a pCPU.
> 
> "The added feature is made dependent on IBRSB, which ensures it will
> only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
> ensures the value of SPEC_CTRL will get toggled between guest and Xen
> values on exit/entry to guest."
> 
> But I wonder, we already allow guests the play with other SPEC_CTRL
> bits, and Xen toggles the SPEC_CTRL values as required on entry/exit
> to Xen, so I'm unsure why adding more bits needs so much
> justification.

Well, yes, I'm sorry, it was me forgetting the open-coded effect
SC_MSR_{PV,HVM} has on exposing of the MSR. I guess I'd be happy with
extending the last sentence a little, maybe "Note that those controls
are not used by the hypervisor, and they're cleared on entry to Xen."
If you're okay with that, I'd be happy to adjust while committing
(and assuming no other concerns are raised):
Reviewed-by: Jan Beulich <jbeulich@suse.com>
for all three patches.

Jan

