Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31764B3BAED
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 14:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101245.1454381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxx7-0006u6-N0; Fri, 29 Aug 2025 12:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101245.1454381; Fri, 29 Aug 2025 12:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxx7-0006rc-KM; Fri, 29 Aug 2025 12:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1101245;
 Fri, 29 Aug 2025 12:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urxx6-0006rW-G5
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 12:11:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b43682b-84d1-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 14:11:29 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afe9f6caf9eso300354966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 05:11:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e5229sm1636830a12.39.2025.08.29.05.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 05:11:26 -0700 (PDT)
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
X-Inumbo-ID: 4b43682b-84d1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756469489; x=1757074289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vDm1CrIr0MdAZ1nv+oQz8h9/AkcotB42eLWwtP2yc/I=;
        b=VI4jqK9iaoufApMlpvWFrL4atvmYP6IqEarAlKc0DpBusB+nz0uuQV8RF7lAgZSv5p
         t67LhYdfD4TUX5p5rANnwH5q017DvlxVFMcfC5dJuWtvUZx3NaHg6KBHPfYswe2Za6x7
         Ja7w0og2mM2NyUQYLCPhEEP27WbPK0RrPK+73ztRQOVd9LVZDbvs3J5LyHfQRKOminNR
         cSV3lrsGU75GgGbqdzt6HOk57ny3pmCMGkgER4nQFUKj//IeJ5bTNrKrnsqo/+gANLvn
         TRyhUsvrCHu1X5j2KjKksYHg04Jig0dS1bc2hmSAzn//KG/HMSSDcSVvM2j4vMTTA5lv
         9mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756469489; x=1757074289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDm1CrIr0MdAZ1nv+oQz8h9/AkcotB42eLWwtP2yc/I=;
        b=RDsZ++Al9NeDiRCb2oDG1JhMIQ6ksWpi1e1RQByENBxboP2bwWDgtAQWwXpC03+8OB
         GlY9lt5woLAvjQI4wjhEFzbDCvE3+c0eIIRraqDC5HRRRWYT2TNYMh3svYUHKM+d5/bU
         MlEAMDaXAmKXjmfUueIsRIImI8cPcscxlzodWNQRhCtxhFCW4K6phyV9Xuws8T+8Kr5T
         HaPlm/tVlhdS/PR/CB9Z1ucNq0G4Azo9FaNqAdCYEmsykMQiuuAStQmWpNcZCd2pFIeF
         k37jZF9+HsIg2AiwcWqszizRakcybtA9F1Fhs4kobUz4EGxfjRnmdCYo6Binvm7hygyI
         +B+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeFJn9djMwpgAJDBoCmsA7ZA/dh92jFVIpwEVlzZWqhr1bAA+8TCaD0SkFo1hQRpj62dqdskU2arc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc1s5IzjedLto+LW/rhK3NWacRwWKGfZF3F8w8pmIfmMTyg5Qy
	8bnGb4G5UT4TaM293DrMfkgnpacs6lo2Q7PBPsB0vJHUw3D1jsJJbeKFDNDN2P7MTA==
X-Gm-Gg: ASbGncu5NvG0eyz62DMizTYjc63xeuLVfXu0i6acTFg8QBcFEUdt2UPSAwMyk7NAMIG
	bn8SwhsIsrXmOBbbbZfgQkZsRDiK2NZYMp8uqpXMb/APnAaOMJltWUdX8wCo1rYPDY4zZsorsH2
	PSH1Q87QhYg8SpkVpT0GRIrzroyED/rXgkRdy4Eiu90rDOMxmOHzu5IXap16cbB0ZpC2YnqO3FE
	X/Cr+DOuhU0WR7KqKLLVJazM/BD2Afz0Gy3IR11UFzaFLsE0VsvaExNuq2KWbK+AAJfT+7okGny
	C11hfITRVUQ9bXeX8rILj8u5UmGPtO4QkFPiH/KWDRPOPv05a8fHgbZciP+nslksa7f+JF7H37b
	qJ8RzUEsYi8DKh/wErJYVvr4OrAbESnWjWMbaURmXlYgTHxy/+0uaNYv+nNN/+CZHaDBGdxCWs6
	6gWU/SX1JoNVLLq3yG+w==
X-Google-Smtp-Source: AGHT+IE1pjQO50I+KqBOhwHjFmDcQtzwYgXzGuUJym3g2aYrRfSMJ2/IYyv76A3M+oJHGhezasqVNA==
X-Received: by 2002:a17:907:980d:b0:afd:d994:7d19 with SMTP id a640c23a62f3a-afe29709ccbmr2433690366b.62.1756469487179;
        Fri, 29 Aug 2025 05:11:27 -0700 (PDT)
Message-ID: <28e4ea6b-fb38-4484-8d08-9ba8ee653d0b@suse.com>
Date: Fri, 29 Aug 2025 14:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <Mykola_Kvach@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
 <bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
 <87ecsvz9sx.fsf@epam.com> <a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com>
 <CAGeoDV8Jz6gEh-uHuWb0sM_XNTOayAxqRW=Z4GajpP-eMRA4kw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8Jz6gEh-uHuWb0sM_XNTOayAxqRW=Z4GajpP-eMRA4kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 13:04, Mykola Kvach wrote:
> On Fri, Aug 29, 2025 at 10:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.08.2025 18:32, Volodymyr Babchuk wrote:
>>> Mykola Kvach <xakep.amatop@gmail.com> writes:
>>>> @@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain *d)
>>>>      p2m_domain_creation_finished(d);
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    int rc;
>>>> +    typeof(d->arch.resume_ctx) *ctx = &d->arch.resume_ctx;
>>>> +
>>>> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>>>> +    {
>>>> +        dprintk(XENLOG_WARNING,
>>>> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
>>>> +                d, d->is_shutting_down, d->shutdown_code);
>>>> +        return -EINVAL;
>>>> +    }
>>>
>>> This check probably can go into common domain_resume() function, as
>>> there is nothing arch-specific in here. Probably this can be done during
>>> commit, to save us from v12? If commiters are okay with this.
>>
>> Seeing this, I'm learning that ->is_shutting_down can actually go from
>> true to false. Which I think is a problem (not of this series, but a pre-
>> existing one, see [1]). Code elsewhere assumes this to not be possible,
>> see e.g. __domain_crash(), but I'm also unconvinced that e.g. the shutdown
>> deferral logic is prepared to deal with such a case.
> 
> Should I add an extra patch to this series just for fixing this issue,
> or can I do it within the scope of this one?

I'm happy to see you fix this (I don't even see how we could easily do so),
but definitely in a separate patch (and possibly even independent of this
series). My remark wasn't meant to get in the way of your work, it was just
something I noticed and thought would be relevant to call out.

Jan

