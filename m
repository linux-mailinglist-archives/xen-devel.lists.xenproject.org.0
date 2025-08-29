Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C23B3B496
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100767.1454091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtnE-0007Qu-Uu; Fri, 29 Aug 2025 07:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100767.1454091; Fri, 29 Aug 2025 07:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtnE-0007Nl-Rv; Fri, 29 Aug 2025 07:45:04 +0000
Received: by outflank-mailman (input) for mailman id 1100767;
 Fri, 29 Aug 2025 07:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urtnD-0007Nf-1T
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:45:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11497976-84ac-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 09:45:00 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61d106ce455so53189a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:45:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a8fsm1254516a12.3.2025.08.29.00.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 00:44:59 -0700 (PDT)
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
X-Inumbo-ID: 11497976-84ac-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756453500; x=1757058300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KUQNYHjvq/lfSfmCOxvdyijSCczGChZhaUAQSNqQJ5o=;
        b=QbRXiz3x+h3p0hsPJp617mK83ZIsxc3ZxQu2pU5ZD0e2jAlcqq2S+pD7ZhsMmWfLfO
         /zavWogn1gteLJzVdusQpW6IUQypwTH8xq0LDJhEc9J7gyuWNCAE1nXKnv+ONWuml5ud
         iq37/3Cv0H3AY2xtc0icTiQL7HkvfkpT/hhYPP4BOoa8OZntKq4VloRE8z95EKkx60+x
         GH2fbny/w8MAYWDJu67NZasz2RChm1tq3RsGYHBMibnxh1mKx4TNoQtiVaIkroBFPD8P
         o0Y21q7DD4xdBkeS8bZ9RFeQolWVGV36se8j7rKjGvyALVSJMoaJHwixYnaIhqFAW5xV
         7D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756453500; x=1757058300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUQNYHjvq/lfSfmCOxvdyijSCczGChZhaUAQSNqQJ5o=;
        b=ckLF9rd3f99gkNdIH6V3+negUSBd9da84bzueAioQ8dCR0Wgb9E3Wxt6Eht3zkSqLq
         aNsllGvf6wYKBvEwCUraub86TgnV797U13faVF5bAwa8y8bgn3tjYjnZH4gAOF5768cj
         1KKebwRHL8RU5nS5/w+iaGNaFyrblMbavthPZBckysZz6gxnWHLj1jeV956GMic29SsA
         mj8cPuhK6qJx3z5FRBNm3pqCY+7IT7qe8oNg4lNganUz5mkvjvN3LEcukQXA6zKrVNLp
         tLrstKQpcLXNFRJBwnKZuP+74e29onN+6ojaz5bHQTeMQZesA5gnTk2RT5EtlzKuPBQn
         XstQ==
X-Gm-Message-State: AOJu0Yw820+JhLrtl83UWbP+7zXAV6e7bc9/bfrHEMPn634TgaL2JRD1
	q/zjpg2EtP5pAAt3rqVqtCCQL74ViSrpr0aGRgZ2CloFE4ua6GZs05jbgBrwuhYaww==
X-Gm-Gg: ASbGncvw7+X8j2jKytEv9ELcUReJadRcAqkxhxut8lJYoo2mOBt3c/n45AD8Yd/Zct8
	tUNmxGK14he6NHHh3iCswdqs1bkBFetFDTh6nkEC1qh/bgCyRPvBGS+fxvllOJe+KXprYz4VS2p
	yAxjYstEPfH9w4t0OxjD5adGvnRTOYRj7OciRXP/k2Wm4YYr7L+7eE8r5x/NcsYUPeo+SSyprwi
	HmOcFs2rkdksc+/VBxHJk4xryCggnncQ+yPoyv1wRJPIq2YGWwnr1WX2WtDXU3h/IiuxfqKGyij
	eUqXKj+J6hx+Zgod6vF0Vnj+Y0NeGdJjkWoBxg0QV8Tjbl/EWY1MNzenwJhDQTikdJWYeKeK1Gi
	RmtQLtJWSdE1gMfAMLdTECP8oZE3SuRuYG0wtUF9Toj2fqNd+cNH0SQGJpZPvlsKEAVqHYJT4U1
	2x6geTJT6qNV8isPLojQ==
X-Google-Smtp-Source: AGHT+IGtvMGmt/atoN1U7CXX6irxKhbV7RPuNViV9oNpPBvBWXz9mGzFkUZFnC7zy1tqjNZsVHC2BA==
X-Received: by 2002:a05:6402:210a:b0:618:4a1b:e311 with SMTP id 4fb4d7f45d1cf-61c983b7f5dmr10720109a12.3.1756453500270;
        Fri, 29 Aug 2025 00:45:00 -0700 (PDT)
Message-ID: <a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com>
Date: Fri, 29 Aug 2025 09:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
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
 <87ecsvz9sx.fsf@epam.com>
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
In-Reply-To: <87ecsvz9sx.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 18:32, Volodymyr Babchuk wrote:
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>> @@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain *d)
>>      p2m_domain_creation_finished(d);
>>  }
>>  
>> +int arch_domain_resume(struct domain *d)
>> +{
>> +    int rc;
>> +    typeof(d->arch.resume_ctx) *ctx = &d->arch.resume_ctx;
>> +
>> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>> +    {
>> +        dprintk(XENLOG_WARNING,
>> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
>> +                d, d->is_shutting_down, d->shutdown_code);
>> +        return -EINVAL;
>> +    }
> 
> This check probably can go into common domain_resume() function, as
> there is nothing arch-specific in here. Probably this can be done during
> commit, to save us from v12? If commiters are okay with this.

Seeing this, I'm learning that ->is_shutting_down can actually go from
true to false. Which I think is a problem (not of this series, but a pre-
existing one, see [1]). Code elsewhere assumes this to not be possible,
see e.g. __domain_crash(), but I'm also unconvinced that e.g. the shutdown
deferral logic is prepared to deal with such a case.

Jan

[1] e105919b0120 ("Add resumedomain domctl to resume a domain after checkpoint")

