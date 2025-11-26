Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18344C89796
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 12:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172544.1497622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODWN-0004Fa-If; Wed, 26 Nov 2025 11:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172544.1497622; Wed, 26 Nov 2025 11:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODWN-0004Cp-Eo; Wed, 26 Nov 2025 11:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1172544;
 Wed, 26 Nov 2025 11:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vODWM-0004Cj-3v
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 11:17:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70bad215-cab9-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 12:17:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso5413228f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 03:17:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e598sm39344642f8f.4.2025.11.26.03.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 03:17:04 -0800 (PST)
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
X-Inumbo-ID: 70bad215-cab9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764155825; x=1764760625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=49x1y/0dDRT0kPEmtsNsz+msYAorMgA4JUYyEWbk58w=;
        b=Uv/Axgfdv0bX1DEpZsY2SmvKTP15yjL5so52oeBInwTYx+IVooi+RpJmjmCsP1c9GB
         kTEjpxj88m0HFCQEFHCOXim3QOr9w82KJ8ICawAAK5NomgMHTdrV3K60dK47dgd6WFOC
         N4UqaTGkS8GoYDr8fpZDw9TudsFam8rsEpqRygJxb8h5vpeWVJG1VknfjKBsKPYRtkAD
         PKbliOU+1AGPaIXSecWapd2mM8Pq5Ch1mOhVEnhPjT8BwU90onBebihPFfj5Pmn223Ig
         Mlqp4I1RX2rnQEtVSokGCTAwkDlKob+YUmPJPyGJXfNpVt5AeGau2KfOusXNuNU79VhA
         KoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764155825; x=1764760625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49x1y/0dDRT0kPEmtsNsz+msYAorMgA4JUYyEWbk58w=;
        b=PN/nGnlvs8L5lma8t6faumzEozJDPmscr8O5My2xtOfzqYvIrdGUQx3wIzYfGlGP9Q
         u/kkDFc5zrSpMG3++F7npYzcTts3YqMP6UScxqSMpj5yWmKOiu+26lluXRTssG17dF24
         7sFPR12OxnIfBTwDk3rsOBsltt1fGN01VY5sFgvN/01uXAkY3yViXQPJHVd+sA9wGbyw
         eeiGhoTAw1tNgKpDk4Vc8pzzywNg7VD8Yr/PIFZWRMjsiyyvu7LakmnvTYKaM+N83rAd
         VMYAkODeSC7nqPPiv+Op722UQrQMLmWa3QSpSVkpuhVN3q72dtx2o+Id7/XwlXyyoWKM
         Okbw==
X-Forwarded-Encrypted: i=1; AJvYcCXeJw14m0/+RjkmVmgsvPoxoR2Pb8/NmjORj6WQgSbmStxzYt8We/nQptmIvoH/qJfmylrgy/f+440=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMUJN5M2JnqUCblu9Y5i93GdoparYo/yUIK2ieNEYuSugA9yzP
	cQcvA0/gHP22yzb24i6RLd1bOE85r+dfTZ6BejV/NeIZA5ngBnxRXLiJfq/3VkGOPA==
X-Gm-Gg: ASbGncu1wwUNm6d9oxLD9lldJhgMo2k9VRxQHGwjkzvS1z7sRhSgET5T8AW5e6ATKmi
	+74l8w0EUdEqRg1/1Nhy6/F0xaJZzjXJMD4NtIop2KzT1W1KupVnScCrBjRHtfgm5Y6NRNiqfON
	GqV0df1bNP2378JSGViQChRCvlCSfSrGk8q80C87uUu2a+PBOtUXB3rtUkO8eZG0GMhb8+3zT6O
	1jzTevamtwyWGjzKWMon9dxYaMlBzjGFC1XNmXNEj7GyZq21aWzcMsz48h/wF8o/t4EK2QEKJ4C
	2bihgF/qTCt2xes65JOQ1O4OlcaM4FckrUZx9Abl4YfqN0XYWes5UBGIQmQSHMm9U+oGk+UzUnj
	aShJ0AaLmdz/Wh0y2TaLoRdjoLmsbMEeR0STuAzzvbPPji+ZBP/l13DglayGYN/rT49I/bk79vW
	LdmvjcbrhoEifHDG/MQMJCVvwlbtS51XikGHf2qKCv3vJx2yVG5PbHfm195ZgtDcaHoOuiJo1I7
	e8=
X-Google-Smtp-Source: AGHT+IHn8+G2QkrhtawRS5x0JSo9O0cAU5xapwguCRzb9GE7TukYc+z5aa3Iz7BTrFEu+ktu0XDrgg==
X-Received: by 2002:a05:6000:4210:b0:42b:4279:eddd with SMTP id ffacd0b85a97d-42cc1cc3084mr23523887f8f.24.1764155825136;
        Wed, 26 Nov 2025 03:17:05 -0800 (PST)
Message-ID: <ff054628-2eaf-4a9a-8f0a-c0fc6b439036@suse.com>
Date: Wed, 26 Nov 2025 12:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: add barrier in vcpu_create()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bea22906-5805-4fad-b73a-fb2e3a8da807@suse.com>
 <098fb798-9dab-483f-8ddd-d4f406cedd73@suse.com>
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
In-Reply-To: <098fb798-9dab-483f-8ddd-d4f406cedd73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 12:05, Juergen Gross wrote:
> On 26.11.25 11:13, Jan Beulich wrote:
>> The lock-less list updating isn't safe against racing for_each_vcpu(),
>> unless done (by hardware) in exactly the order written.
>>
>> Fixes: 3037c5a2cb82 ("arm: domain")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The Fixes: tag is pretty arbitrary; the issue was becoming non-latent when
>> Arm support was added. (Strictly speaking IA-64 and PPC would have been
>> affected too afaict, just that now that doesn't matter anymore [or, for
>> PPC, not yet, seeing that its support is being re-built from scratch].)
>>
>> I'm not quite happy about prev_id being plain int, but changing it to
>> unsigned (with suitable other adjustments) actually makes gcc15 generate
>> worse code on x86.
>>
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -464,6 +464,7 @@ struct vcpu *vcpu_create(struct domain *
>>               prev_id--;
>>           BUG_ON(prev_id < 0);
>>           v->next_in_list = d->vcpu[prev_id]->next_in_list;
>> +        smp_wmb();
>>           d->vcpu[prev_id]->next_in_list = v;
>>       }
>>   
>>
> 
> It should be noted that this is an issue only in case for_each_vcpu() is
> running against the idle domain during cpu hotplug.
> 
> All other domain get the vcpus populated form vcpu 0 upwards, so
> v->next_in_list will always be NULL for a new vcpu of a "normal" domain.

Hmm, right. And I don't think we ever do for_each_vcpu() on the idle domain.

Jan

