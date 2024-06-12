Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BE90559B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 16:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739387.1146397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPFw-0000f8-EG; Wed, 12 Jun 2024 14:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739387.1146397; Wed, 12 Jun 2024 14:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPFw-0000d4-AX; Wed, 12 Jun 2024 14:47:20 +0000
Received: by outflank-mailman (input) for mailman id 739387;
 Wed, 12 Jun 2024 14:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHPFu-0000cy-Q2
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 14:47:18 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a81e3b8e-28ca-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 16:47:14 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso6268081e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 07:47:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f51d7db37sm728266b.23.2024.06.12.07.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:47:13 -0700 (PDT)
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
X-Inumbo-ID: a81e3b8e-28ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718203634; x=1718808434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1qth86KmYUuRlpIkhFYQ/Pic099/vjZZTjocKnp7wjI=;
        b=MIcSKfbz59YI4biok26CMLckHmJyq5f7QyWQs8rPLUJuS8J3MK53RnosaBJxgaIjBt
         HisLblpN0aGqZ9MSNct6R7ks5n7SiSVeXbymyqCF8Vjot4ewbG9AfHv99dLFgWFSRkFs
         5+/uHGULtZ+j3AMXHBZjpXdoIGel9zJxdrOFrhMeuOFDCbOc63ivWEz4GbPOtHuzzm0C
         4yHjzIJm9ZREN+em90TCSi079557tpqI9HAZLNyTQ7vLFzH3UaUiDjsXfrdy7RQZtshB
         XPD4WdgL2aBm/ATl97z/fj/zGYVPCMvVM0+W/7KN+/qpo41QZtxN2dqyh4DWf3P7RSFy
         lIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203634; x=1718808434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qth86KmYUuRlpIkhFYQ/Pic099/vjZZTjocKnp7wjI=;
        b=vSMOOZwJvSc2LiTFcMah0m7RoWafASflWcttndNXHvqjxhQJf0BYvt75unq1589Vs1
         eN76ZwzDWfxb0P1DG0oaSWAcDT6onoO6qQbWIBjpRfb0Bi4B8iUnE//iZyryue6eY/c+
         jAin7BdX4S9jPPk90HaAK8OfuQCz9LoBWQBJogbIS3+Ql2VVrSNu/7F0HAStL/9TQsGj
         dUpgJ8Qd/VEpKLLZm2PmRjFWTI7JqJ9dSPhgeyqXnUNZf7wo3deoOjebjfBzKNfHv8ds
         ljyvdw0/VQYGd3rDRiF3AF8t40+hw0N4BsBe3kAUIi3ngmj7GIVY28ilHgjoGRx+OLVU
         w8KQ==
X-Gm-Message-State: AOJu0YyWZAyIYB07L2xETeg18C0u85t9yZ/htsfR93IQ+3k8GGud4QXU
	2GYxaF8t7j6ggjTbqDVCQD/NTmPczmYjW/JipUBzsope9bzr4CimVyjwXm0V+w==
X-Google-Smtp-Source: AGHT+IG3fRONXzlz1YcmOA+OZs4NndjjN2rZKCsbEekz3fcqc8JQcJapDHhFa+/fNEMaAxPsY2e1mg==
X-Received: by 2002:a05:6512:3694:b0:52c:993d:b462 with SMTP id 2adb3069b0e04-52c9a3e233bmr1444359e87.29.1718203634008;
        Wed, 12 Jun 2024 07:47:14 -0700 (PDT)
Message-ID: <b2985742-75e4-4974-be9d-be088d728731@suse.com>
Date: Wed, 12 Jun 2024 16:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking in
 epte_get_entry_emt()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com> <ZmmskwdoKvAotRk-@macbook>
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
In-Reply-To: <ZmmskwdoKvAotRk-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 16:11, Roger Pau Monné wrote:
> On Wed, Jun 12, 2024 at 03:16:37PM +0200, Jan Beulich wrote:
>> mfn_valid() granularity is (currently) 256Mb. Therefore the start of a
>> 1Gb page passing the test doesn't necessarily mean all parts of such a
>> range would also pass.
> 
> How would such a superpage end up in the EPT?
> 
> I would assume this can only happen when adding a superpage MMIO that
> has part of it return success from mfn_valid()?

Yes, that's the only way I can think of.

>> Yet using the result of mfn_to_page() on an MFN
>> which doesn't pass mfn_valid() checking is liable to result in a crash
>> (the invocation of mfn_to_page() alone is presumably "just" UB in such a
>> case).
>>
>> Fixes: ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Of course we could leverage mfn_valid() granularity here to do an
>> increment by more than 1 if mfn_valid() returned false. Yet doing so
>> likely would want a suitable helper to be introduced first, rather than
>> open-coding such logic here.
> 
> We would still need to call is_special_page() on each 4K chunk,

Why? Within any block for which mfn_valid() returns false, there can be
no RAM pages and hence also no special ones. It's only blocks where
mfn_valid() returns true that we'd need to iterate through page-by-page.

> at
> which point taking advantage of the mfn_valid() granularity is likely
> to make the code more complicated to follow IMO.

Right, this making it more complicated is the main counter argument. Hence
why I think that if to go such a route at all, it would need some new
helper(s) such that at the use sites things still would remain reasonably
clear.

Jan

