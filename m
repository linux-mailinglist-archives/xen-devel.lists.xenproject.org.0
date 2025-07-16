Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284DB07B37
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045504.1415624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc537-0002Mv-4z; Wed, 16 Jul 2025 16:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045504.1415624; Wed, 16 Jul 2025 16:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc537-0002Jt-2B; Wed, 16 Jul 2025 16:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1045504;
 Wed, 16 Jul 2025 16:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc536-0002Jl-FV
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:32:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ec04f0-6262-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:32:02 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso27183f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:32:02 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm18191964f8f.43.2025.07.16.09.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:32:01 -0700 (PDT)
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
X-Inumbo-ID: 66ec04f0-6262-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752683522; x=1753288322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rS9RLx9rTUq9s3fti/avEOdBsnhyZK7iXHPjjxNu2hc=;
        b=g5tV9B2CADrrscYtJAPepXxDefUBDNkZ0gZcgiwEeqP8oHbLg3n1fSIlpkuw6Hz2+L
         o7Nt86TIU/oKCvR9DLnqtHAoGD5vCHyAmHrspt4Mqe1wUMNlFlyfN+6KWUlQnsei/KqM
         K2zdzhMmRdmAP2ku5sx4Q8FKikWvCmr2hlWdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752683522; x=1753288322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS9RLx9rTUq9s3fti/avEOdBsnhyZK7iXHPjjxNu2hc=;
        b=YzBcUYltRRXgGEgSqlpM9sqVSmhQB6mqw2+0bzVelB1cSB3JmtaZuRD6jlsfn1qu50
         UmLbfYlPHT2orhtpe9D7YQsy9/gTPHqThnZ8a2DoAS4KFzJH0Rdb5fx6YNrf1oMUMQTD
         i8y3ClIXfJITSubhsfThEjpH+Q7KcCIBiA+6qHthVFsVLmjGqTUGb/sALsGMePiiminW
         MNRV7g/vnkRUHcMg7nt17+YqP8FCHiLsCjYkoprabDxS0sbv4CYks8lDIO3iM7EG4rpa
         1E1WYmtEmI8BoMVy1qTkwMyct7RnNCgx4jddULbv+1Y4AhBFZG3sIzwRSGqxmaqWZTPn
         ZJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXulCouAaf8SccsT/zr2h19p9cH+JUz4HxbQrOr0QSoPB2cDjB5GytUy8E0hz0U2ZKpM1o44GR80Zo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL1wt23C97ELatbvOd2i91RIxnJ/GAj6pfz8sotmEhqYKQoUn9
	f2hHkQY4o97sV5IaOF0ZAOG7AZJm5NQDmRC2hIyH5oZY9ZY7XIo0VBRooLTvXICfT1Y=
X-Gm-Gg: ASbGnctXn/LpAczJg7/2pROb3TyZpIcpfkq5AUVYH9pH1CsxV4LRmisBfAoheaw26VU
	t8bqTdU1aP+YQBEyHEPJdXWuODXtJ5VlZc3aP4/gMhaHhJ3uxV8V82W3kTibWjGRXS/rSv2rLzO
	hDG2vbsp4vhKOOB4jhvC8k0ZbeSp4rH41AUZCN8sM7+rGA9tBq+jyMzGrmaVr0ZRmJK35yDPQSE
	cf7HReGjbxFpqh/Pub+766QOO3my2NFDZSBV9hkFeSHTUbQoy+NF9gWEgszyQg1p2DfM8jUMEqo
	sOliZARd8/5TkIahZ+6jxUEMddYz95Qxehd474uCTAF7HCE3818YOKSsRiBXrt1h2YV3i7v+WJ3
	Tx+GB+nRRYu0GyFVdneQ8DgRL/qAik5Cu3mQFMmDzdVAT9NPvb9NG7JfHLQFIbSgZ3SEm
X-Google-Smtp-Source: AGHT+IFPoNwxWt8tSwYaZ5mYCuQvAnzfDHtbnGaXSrt0hNP+VJ4cOt+2WZWNnHs9/xoKl4Lmc2aAfQ==
X-Received: by 2002:a5d:63d1:0:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3b60dd87ee1mr2500298f8f.41.1752683521615;
        Wed, 16 Jul 2025 09:32:01 -0700 (PDT)
Message-ID: <d751f86a-ba75-472e-b021-b6cf5297cf86@citrix.com>
Date: Wed, 16 Jul 2025 17:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/intel-family: Resync with Linux
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-3-andrew.cooper3@citrix.com>
 <f8808232-dc06-4ecc-85bb-e05d8f948d00@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f8808232-dc06-4ecc-85bb-e05d8f948d00@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/07/2025 2:56 pm, Jan Beulich wrote:
> On 16.07.2025 15:28, Andrew Cooper wrote:
>> This snapshot is prior to Linux commit db4001f9cc32 ("x86/cpu/vfm: Delete all
>> the *_FAM6_ CPU #defines") at the end of their conversion phase.
>>
>> In addition to non-FAM6 infixed names, defines are added for the Pentium Pro,
>> ArrowLake U, and reintroduced the PHI defines which were incorrectly deleted
>> in the past.
>>
>> In cpufeature.h, provide VFM_* macros to transform constants to/from the
>> cpuinfo_x86 representation.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I meant to object to deleting PHI at the time, but was too late.  Just because
>> Xen has stopped supporting the PHI doesn't mean the model numbers have ceased
>> existing.
> I don't mind their re-introduction, yet I wonder what value their presence has
> when we don't use them anywhere.

I spend a lot of time cross-checking tables in the speculative papers. 
Knowing which were the released CPUs is important for finding typos.  No
comment on how many tables were correct on their first revision...

That said, there's SoFIA which is not included in intel-family, and for
which we have partial coverage owing to early speculative tables.  IIRC,
it was a custom chip for a mobile base-station, and runs an entirely
custom software stack.

>> --- a/xen/arch/x86/include/asm/intel-family.h
>> +++ b/xen/arch/x86/include/asm/intel-family.h
>> @@ -13,8 +13,8 @@
>>   *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
>>   * where:
>>   * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
>> - *		is assumed to be "_CORE" (and should be omitted). The other
>> - *		value currently in use is _ATOM.
>> + *		is assumed to be "_CORE" (and should be omitted). Other values
>> + *		currently in use are _ATOM and _XEON_PHI
> Nit: You lost the full stop.

That seems to be missing in Linux, even at master.

I've got an outstanding task in Linux's intel-family.  I'll try to
remember to fix it upstream.

>
>> @@ -40,131 +40,223 @@
>>   * their own names :-(
>>   */
>>  
>> +#define IFM(_fam, _model)	VFM_MAKE(X86_VENDOR_INTEL, _fam, _model)
>> +
>>  /* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
>>  #define INTEL_FAM6_ANY			X86_MODEL_ANY
>> +/* Wildcard match for FAM6 so X86_MATCH_VFM(ANY) works */
>> +#define INTEL_ANY			IFM(X86_FAMILY_ANY, X86_MODEL_ANY)
>> +
>> +#define INTEL_PENTIUM_PRO		IFM(6, 0x01)
>>  
>>  #define INTEL_FAM6_CORE_YONAH		0x0E
>> +#define INTEL_CORE_YONAH		IFM(6, 0x0E)
> Here and below I assume it is deliberate that you use a raw number again,
> rather than making use of the immediately preceding #define? Perhaps for
> the sake of brevity?

Because it's transient.

All the FAM* constants get deleted in db4001f9cc32 ("x86/cpu/vfm: Delete all
the *_FAM6_ CPU #defines") and I've got another resync in my local
branch, but it obviously doesn't compile in Xen yet.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

