Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD3B2C95A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 18:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086700.1444880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoP45-0004Q8-Cq; Tue, 19 Aug 2025 16:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086700.1444880; Tue, 19 Aug 2025 16:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoP45-0004Oc-9s; Tue, 19 Aug 2025 16:20:01 +0000
Received: by outflank-mailman (input) for mailman id 1086700;
 Tue, 19 Aug 2025 16:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoP44-0004O9-RW
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 16:20:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59a052dd-7d18-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 18:19:58 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so853412866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 09:19:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded530ecbsm8446666b.102.2025.08.19.09.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 09:19:57 -0700 (PDT)
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
X-Inumbo-ID: 59a052dd-7d18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755620398; x=1756225198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D4XkkX6dw6jJEpGtQSkad40L9aUzB61QSIrr3o6QIV0=;
        b=CiBUeMMonFVrs7huzEfkqXZjns89deU9s5XlDJf4Q2248p1/i+6DGitsWHaEV6eFbS
         mD+cVufcP/S871s3uG8q9WlbA9DBwXvh1QVuHPiChXz97UBTiTp60Qb/1tZa92epOZ11
         Po29IH4XO/jEUynoRbGNF0NrffiCs82teoaS/Yzcd9bqYoGhDmpkdsxYDTtI74Fs9N09
         KyVZm3OolugXY0/599trpCvqjMlRdCeGjexEtf+J4iHqaaffSHOgA9PImEUuK6Rbm/JT
         Wcofyy4eMMy5PANQDqsMiIxYMEd8DD3tr166J+dXrDSSuZZpB/LIkit6bCaV34BATFc8
         NAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755620398; x=1756225198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4XkkX6dw6jJEpGtQSkad40L9aUzB61QSIrr3o6QIV0=;
        b=jbiECN1aeH8cGXg+ISzmGa0NoTx9X9KU3cba4EQAoi8QENPVGIG19P9k2FKs831VRy
         cddy3NlTpr9lvOJTqObedJ60PPovzDuDuHuzGGBGqEZ6P5z5z2dsh9TPBWcWBajQiWgz
         m+Zdpg86Guc78v5q1MHx/jUfu/lJqhMw5mmrlvD/ek56Aa6cy4qRey2XfGLfIntDl4n/
         cRjnN3nNkdsWLyF265iu1krPQXwt0YoMMYyAE1klrOSSgTBVEbOxUd5sOg2TxE/UkHwS
         HYgXBx9+CbPParSrMMfFdP5V56V8putyB3Ltv35t6m3myh6aer8To5AqaO+X2lSAq12F
         qbNg==
X-Forwarded-Encrypted: i=1; AJvYcCXys8aptiDRoGgQ2boZqq59WMbNwb/du+uNhMouCLISRKhbtKNntkA/Tvvk0ja4xula4RDLXk9mvds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2ijlLrwIzzghoauhwZ7tpdUmKyMQydTSue6F8v22JWZww6fMt
	d4C1uC/aDDvnn10hlAm+U+Jy1n9yfn+oUaHhjUtfd0xmDEWrQaY2CfaSYkmWbGoy2A==
X-Gm-Gg: ASbGncsjpMGzS0czaieFGy1Z+NUe3HKzKYqdYnuK4TWK7DBwBPyt50t121VfCCQqpxb
	SQ9N5y8aMavZq1CQ7ZRjRkFQ4jbmwwlXh48aCxpfvF/EAZbmdkX5cNqz1F+egOOIPBgpC+fMHet
	KlE4+OE5JTZ4lbrELjOgs/ArkqDkjOh1DeFITinrv1tJE7pVk2zTOuy7v9R4iVdA6w133BWJule
	GWdEs/Hx0fPmFq9idhs6xHZXLf0gKHrB77JSE23mlqoCAKe3HXRBVzFhzeN3PqZ8lrONz0iTB1g
	aVe5uyINPfujFk6wgBspRYQx5arvvTrpBp3OYokyWkmdWvg/pxXSySRc9XuHuOQBlxzGnRt2Vbl
	r7WOK8s65+Jz2/P0E80PGOANVbBnawJFdOqQBQmLsWQKLKRAnw0Iv2ZCzAWx6USjAYS5XkV76Ob
	Nbf3XW9ErRUdCpBdIktw==
X-Google-Smtp-Source: AGHT+IFaHAZnOOcY5rl8MEdogFUZt6c2V7/ThmbRH+OrlQgqUct90fjDkshOEy7zneZMkEyHjW4cmw==
X-Received: by 2002:a17:907:9486:b0:af9:8c20:145b with SMTP id a640c23a62f3a-afddc96119cmr325111466b.10.1755620398039;
        Tue, 19 Aug 2025 09:19:58 -0700 (PDT)
Message-ID: <a51426f6-a2c5-4f81-af77-1b6483eb84d7@suse.com>
Date: Tue, 19 Aug 2025 18:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] x86/msr: Implement rdmsr_safe() in C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-2-andrew.cooper3@citrix.com>
 <e3b37ba8-72df-403b-816d-3be9011b8203@suse.com>
 <341a61df-fde2-40a4-bab3-31a0d66a3d0a@citrix.com>
 <a29ecb41-1581-4102-a9ad-6768380484bc@citrix.com>
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
In-Reply-To: <a29ecb41-1581-4102-a9ad-6768380484bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2025 15:35, Andrew Cooper wrote:
> On 19/08/2025 2:28 pm, Andrew Cooper wrote:
>> On 18/08/2025 12:23 pm, Jan Beulich wrote:
>>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>>> ... in preparation to be able to use asm goto.
>>>>
>>>> Notably this mean that the value parameter must be taken by pointer rather
>>>> than by value.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> In principle
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
>>
>>> However, having looked at patch 2 first, ...
>>>
>>>> @@ -879,14 +879,14 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
>>>>      case 0x8f: /* Sapphire Rapids X */
>>>>  
>>>>          if ( (c != &boot_cpu_data && !ppin_msr) ||
>>>> -             rdmsr_safe(MSR_PPIN_CTL, val) )
>>>> +             rdmsr_safe(MSR_PPIN_CTL, &val) )
>>>>              return;
>>> ... with this, wouldn't we be better off using ...
>>>
>>>>          /* If PPIN is disabled, but not locked, try to enable. */
>>>>          if ( !(val & (PPIN_ENABLE | PPIN_LOCKOUT)) )
>>>>          {
>>>>              wrmsr_safe(MSR_PPIN_CTL, val | PPIN_ENABLE);
>>>> -            rdmsr_safe(MSR_PPIN_CTL, val);
>>>> +            rdmsr_safe(MSR_PPIN_CTL, &val);
>>> ... plain rdmsr() here, thus not leaving it open to the behavioral change
>>> patch 2 comes with?
>> Yeah, probably.  At the point we've read it once, and written to it, a
>> subsequent read is not going fail.
>>
>> I'll adjust, although it will have to be a rdmsrl().
> 
> No.  That would introduce a bug, because this path ignores a write error
> too.

Why would there be a bug? Irrespective of the WRMSR, we know the earlier
RDMSR worked.

> There isn't actually a problem even with patch 2, because of the how the
> logic is currently laid out.

Yes, the logic would still be correct, just less obviously so.

Jan

