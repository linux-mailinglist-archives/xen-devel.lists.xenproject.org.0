Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E789942B63
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 12:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768412.1179195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ67v-0002ml-7H; Wed, 31 Jul 2024 10:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768412.1179195; Wed, 31 Jul 2024 10:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ67v-0002jb-4c; Wed, 31 Jul 2024 10:00:11 +0000
Received: by outflank-mailman (input) for mailman id 768412;
 Wed, 31 Jul 2024 10:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZ67t-0002jV-3b
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 10:00:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aacf9467-4f23-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 12:00:08 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a8e73b29cso429553066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 03:00:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9104csm743557166b.157.2024.07.31.03.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 03:00:06 -0700 (PDT)
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
X-Inumbo-ID: aacf9467-4f23-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722420007; x=1723024807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=csPwqZFUDIbIq7pJu++5710iiX0xYNXRduInit1JAV8=;
        b=hupgXDgrUqLZaHAoEOm/G0uqvlbfhLZ00k49XRt9gxxy60kLkkr9TFAv3rKQyGezKz
         yoQxfN5R4NvLtRGnd9E/z7axQPgHk7uAk6XHIIaVmlZJTXpocISxAnv+JxBpKxXQh6KJ
         ofSVG4VO+4MQQBEWmxTdLkAqx4kw9CX6QMSuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420007; x=1723024807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csPwqZFUDIbIq7pJu++5710iiX0xYNXRduInit1JAV8=;
        b=cI0L5Pg3Hg6Rh1gMWbTD8BnzibEjRKmDRcnr+vd/V2c4ojHgKk8D9HzI8uBablt8V0
         yp9b/9HnjfAxDrF6jE31LZpUeP52lddvZqB3UrpTIHCnUFlA0XkbqbLvt25mXbVSoFy4
         a/I04OCvfx61CBs70iseByA3kjZtB3anOothcNFj1MZhoyWsTkDRCyZn0Zd4IhelW2MM
         ElM7Ng8Y9Ak6ayHogoNgCGXA93dBwv8cxYaM/9Ja8LtywdudYU1R+VkXpvQvxkB5Ogw8
         UdgojEAjDvQrQpVkVJWLPIkkuBreqJPNCMBMaoz1b3ZEC6C+lQK2/hodjjdpyj7s4NcP
         rLWA==
X-Gm-Message-State: AOJu0YwmmL7SS9u191i+9AcP5hCNaapd8rVrPno97BnsebIuce+R9ETN
	k6oVzjUDXdkalpqZptk58q0IUywPgiWrNr3Tmodp+NDUsyUnCaUIdgQNKCSUIAw=
X-Google-Smtp-Source: AGHT+IHBUTFJrU+ck3zXCHktqcoBbuDNrnCZ1z4a57j4U8TKDtP4AREhXf6P8nX19ehq5KdW/V+tIA==
X-Received: by 2002:a17:907:72ce:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7d3ffa3052mr1051313466b.21.1722420007412;
        Wed, 31 Jul 2024 03:00:07 -0700 (PDT)
Message-ID: <c65c17c4-f003-415d-b69e-fc1ec82c038d@citrix.com>
Date: Wed, 31 Jul 2024 11:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/domain: Implement arch_init_idle_domain()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
 <20240718215744.3892072-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2407301639090.4857@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2407301639090.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 12:44 am, Stefano Stabellini wrote:
> On Thu, 18 Jul 2024, Andrew Cooper wrote:
>> The idle domain needs d->arch.ctxt_switch initialised on x86.  Implement the
>> new arch_init_idle_domain() in order to do this.
>>
>> Right now this double-initalises the ctxt_switch pointer, but it's safe and
>> will stop happening when domain_create() is cleaned up as a consequence.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  xen/arch/x86/domain.c             | 19 ++++++++++++-------
>>  xen/arch/x86/include/asm/domain.h |  3 +++
>>  2 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index ccadfe0c9e70..eff905c6c6e5 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -768,6 +768,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>      return true;
>>  }
>>  
>> +void __init arch_init_idle_domain(struct domain *d)
>> +{
>> +    static const struct arch_csw idle_csw = {
>> +        .from = paravirt_ctxt_switch_from,
>> +        .to   = paravirt_ctxt_switch_to,
>> +        .tail = idle_loop,
>> +    };
>> +
>> +    d->arch.ctxt_switch = &idle_csw;
>> +}
>> +
>>  int arch_domain_create(struct domain *d,
>>                         struct xen_domctl_createdomain *config,
>>                         unsigned int flags)
>> @@ -783,13 +794,7 @@ int arch_domain_create(struct domain *d,
>>      /* Minimal initialisation for the idle domain. */
>>      if ( unlikely(is_idle_domain(d)) )
>>      {
>> -        static const struct arch_csw idle_csw = {
>> -            .from = paravirt_ctxt_switch_from,
>> -            .to   = paravirt_ctxt_switch_to,
>> -            .tail = idle_loop,
>> -        };
>> -
>> -        d->arch.ctxt_switch = &idle_csw;
>> +        arch_init_idle_domain(d);
> I don't understand why you need this call to arch_init_idle_domain(d)
> here given the other call to arch_init_idle_domain added by patch #1.

It's stale from an older version of the series.  I'll drop it, which
will reduce the churn in this as well as patch 4.

> Also I am not sure why you didn't move the line below (cpu_policy =
> ZERO_BLOCK_PTR) to arch_init_idle_domain as well but I admit I don't
> know this code.

See the thread on patch 4 with Jan.  It's intentional.

This was a safety check which is dubious (it's not special enough to
warrant it on its own), and has never tripped.

I'll note it's intentional omission in the commit message.

~Andrew

