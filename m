Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B9B14E57
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062694.1428427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkMC-0004uh-Bi; Tue, 29 Jul 2025 13:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062694.1428427; Tue, 29 Jul 2025 13:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkMC-0004sc-8l; Tue, 29 Jul 2025 13:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1062694;
 Tue, 29 Jul 2025 13:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugkMA-0004sW-V7
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:27:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ac2023-6c7f-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 15:27:01 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so1789352f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 06:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e66376377sm12137471a91.28.2025.07.29.06.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:27:00 -0700 (PDT)
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
X-Inumbo-ID: b5ac2023-6c7f-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753795621; x=1754400421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tXftFdjSsjBD7pcyPGz8CSem6U/EuzbpjMNAVajVeHk=;
        b=QlKVh22klkuqnb+wlXhXjXOt6vgToQQ3DpZjefokcmB4Nl6Df+Vo/xH0+2MVIZyAZD
         5flbbz/0TQReIggifbWw+YqVIN8EUefB2xhrmyrOtcmVXA4eQ6eI9kowF38XNTDXzrF1
         FuPe6mvkXnKDNmvwDoY8timlDFjwRSEef5n56x2r6t8RfOs+eV8vy4+tg7YL8faLDSPg
         YZIdtFLHTYAIqLFQ5cuaWIAkm6ScJ7fMS1NUVHLjHyRLB+txomkid3PDxiw1Sf9FW2p6
         sptkw59WzLSHOD4FSa7gRgpX8LYYBMttixlm9tcQfdUSCdvKQdF7wyiyQ6Ms2cEP6lE2
         xPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795621; x=1754400421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXftFdjSsjBD7pcyPGz8CSem6U/EuzbpjMNAVajVeHk=;
        b=fnWPoBLDE7rJWj7JfIOWwqKCx2y4lC9CjikCi3qY+GMuogbRPaAYLSitEeXDqGVfqp
         gv5E41yhUC7mhZmrptMxNW0ToLkoNVoFJdSnsbEA5ouFehgpPwNKjlhYqY3oJZhUn+ov
         oVjG0R+NwStor8n7qVYU/rDEWPVlQe8onGpNYDeai2HaAMepN/n0wEb9p+0Hni8ye8kW
         Qv5lAg+pSB7Pma8Mv+EQJYPEAQ1tsjk64Z65nGQ8dCA+ovtKlJ4zCgffwxRHz10oD1Xj
         nucGCV5ny2BBIycvt3r/hnCiDLYvxze1f60LuTcSmMwHZBxOSONeEyi2yamikVkh8P54
         15tw==
X-Forwarded-Encrypted: i=1; AJvYcCUqJHd1LdIhrae3Ui2aWr2pTm/td+Y4jmLNbHHOv3koTXqXKDpThwuTG1CvVLDD68QI2GXsFssdH2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTcd/gBL2WfR38lNPHTCP4snRAy/6c0cDvaCouPtpGKrhaAKUV
	QwCY9wKN8igHXD2vgl88ta6Pm5w9q57WOq3l+EY7DD5V9Z8ZICQGt6YeKqADDBYq9Q==
X-Gm-Gg: ASbGncttAURrwdQQtEHvyl91L1KBWhqv5eOx7sduGi7FZ3DaFxsZNGmb2aZcyibtpP/
	tkvFcvii0fynuWy5muLFJP+uTuJ3uUmzodl5nT0nbNn7n85W0zYMswPmu0tqO7jnK26I6gfXRJ7
	AxzBveD6m1/nD4/2aipWHdpKNC4n0Ae1XbIic11mJS3gLeW9XzFHkhamKYpxLEHpSvRU/+KOqUH
	dOgTh5ey40pq9aKa7tY3wSVqozr1MeBtOMxnPtbHRLwUcgj/Sp2t5tporpe2O+fh+OnebQps+WT
	02KUvWgWBy4VIyTqHQKQhBUEITlZksnnDFLK7O2/rdSTGV8e5DKYg1+D+CiU6zMlvxoa0cbyCTq
	pKC8C1+hrXrhkXIoDEaOanAgT/zPPO3OmUYhza7RmJwxxBr+/SA7fD6GpR32MiBjqLnceiwmodw
	eJ5tN6b9wFHo0u4SyzZg==
X-Google-Smtp-Source: AGHT+IFMBnZWuZ1ps9AA4ht5CZYW4HWuHkgLuDCZnBVyff3+lC4qJY3KSauhMh31QWFdmix+kTerUA==
X-Received: by 2002:a05:6000:250f:b0:3b7:9339:794f with SMTP id ffacd0b85a97d-3b793397ff1mr1500390f8f.48.1753795620827;
        Tue, 29 Jul 2025 06:27:00 -0700 (PDT)
Message-ID: <056fd41d-47c9-4570-9cd9-fc121c9d44b7@suse.com>
Date: Tue, 29 Jul 2025 15:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
 <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
 <029ca331fd380a855aff95ae9cae799e@bugseng.com>
 <f94586c9-fdf8-4d04-8490-1a9b1a57bcc2@suse.com>
 <df2d021f8b50989cf77ec226a6a5a9b4@bugseng.com>
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
In-Reply-To: <df2d021f8b50989cf77ec226a6a5a9b4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 15:16, Nicola Vetrini wrote:
> On 2025-07-29 15:09, Jan Beulich wrote:
>> On 29.07.2025 15:02, Nicola Vetrini wrote:
>>> On 2025-07-29 14:39, Jan Beulich wrote:
>>>> On 29.07.2025 14:21, Dmytro Prokopchuk1 wrote:
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -367,6 +367,13 @@ constant expressions are required.\""
>>>>>  }
>>>>>  -doc_end
>>>>>
>>>>> +-doc_begin="The conversion from 'void noreturn (*)(void *)' to 
>>>>> 'void
>>>>> (*)(void *)' is safe
>>>>> +because the semantics of the 'noreturn' attribute do not alter the
>>>>> calling convention or behavior of the resulting code."
>>>>> +-config=MC3A2.R11.1,casts+={safe,
>>>>> +
>>>>> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1,
>>>>> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
>>>>> +   ref(property(noreturn)))))"}
>>>>> +-doc_end
>>>>
>>>> As I understand it, this is about any function, not just void (void 
>>>> *)
>>>> ones.
>>>> Hence throughout anything textual in this patch, may I ask that this 
>>>> be
>>>> made
>>>> explicit by inserting e.g. "e.g." everywhere?
>>>
>>> Technically yes, in practice other implicit function pointer 
>>> conversions
>>> would be caught by -Wincompatible-pointer-types and similar flags so
>>> they don't even come into play. However I agree that adding that is
>>> clearer.
>>
>> Perhaps a misunderstanding: With "any" I meant any which has a noreturn
>> attribute, when converted to one with otherwise the same signature. But
>> irrespective of the particular return type or parameter types (i.e.
>> specifically not just void (void *) ones).
> 
> Ah, sorry, I misunderstood. We check the destination type of the 
> conversion with 
> "to(type(pointer(inner(return(builtin(void))&&all_param(1, 
> pointer(builtin(void)))))))". In principle it could be avoided but I 
> think that at the moment it's ok as it is, then if it needs to be 
> extended when more cases emerge I can do that.

Oh, then my comment to Dmytro (still in context above) was wrong. But
why would we limit things as much? For noreturn functions a return type
of other than void is surely not to be expected, so that part is fine.
Yet any kinds of parameters would want to be permitted.

Jan

