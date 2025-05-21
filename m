Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAFBABF8C3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992036.1375820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl0p-00076q-Ia; Wed, 21 May 2025 15:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992036.1375820; Wed, 21 May 2025 15:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl0p-00074j-G0; Wed, 21 May 2025 15:05:43 +0000
Received: by outflank-mailman (input) for mailman id 992036;
 Wed, 21 May 2025 15:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHl0n-00074d-TC
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:05:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa91340-3655-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:05:41 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so1214204366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:05:41 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06dcafsm932478666b.54.2025.05.21.08.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:05:39 -0700 (PDT)
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
X-Inumbo-ID: 0fa91340-3655-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747839940; x=1748444740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wuPi4LjeIrSrlnLi0ue8bh6SPLZgSeygRov7Xu7hTM=;
        b=gVsmqXnHH75gOfkmBTIfWcz5l64kMAz2gXcjlpAOsylsRH2oSEAMsNr4JNTa7r5VoY
         kAY1NfxPR/9HkZl+oD2WsydfY4UMu0zSK4FFY7q/Qd8VuPiZ4FI55JDkPWbtHmeONbIx
         oPZ3sMy+5FVQfjTCvWm0gDee7Sx1c43jSSx5Ey5gRAnyq239mk6R8AzI/HdmFXfJoZBt
         aTlUvtYzYWypnTufPNMnIjL930qj//0HSiAHx5qCeztLov8pmAg3KICLKaEcSuTj030F
         8PCtRNR09A0rdr+87yGp+UaRIeJbr4HaxB8HffQJ1DG63wItH0oZWOk+jetwb7I37bUs
         kBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839940; x=1748444740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wuPi4LjeIrSrlnLi0ue8bh6SPLZgSeygRov7Xu7hTM=;
        b=JbVnqm8wDcoldhDHK2ueqfoQPnpiAIRrks9cov4bWzeQEYPw3yfKxtcYP3z5iDQ/BM
         vpO0HLolJXxHWhJ3LfB9ZCsSnnWaCfr800vcCbdSSQdOzETyzJDwy/60Q5yol3qgv4s2
         MELmlni8bUumefp4UPwEU5YY/DIP3CjpDqu0o6cqGG/CGTQix4JfAGcjm5RPW86+Yy70
         Vis0ZqBZkeni4YwZuP4eVoGT8JismI7RBQfLbB42EDBqigc+w2SU8XM0566greCZKZ1L
         zFtYVzwxfwu7LcdGlb71q32bp82pYMO7ZLRXoF3QP1jgK2eA62aMjfLV+ehqy221KSZM
         OgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmZbWYWQs1nTt2x3ooSjDHPtAflrHUik6kyVXaMZyWiIOcsayESAulxrMKlcYXiZsuLkDAn0LmuGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRaA8pxGDhSpD7DyGAmSJ0wQYH93K1Br7wAHajsCC/u2bHD+JC
	LVS4VI4EE452Gf0OZ2MX8/NtUgq639KkJbLKHw/qTac65ATMkjEoIjigIbKn1MAigw==
X-Gm-Gg: ASbGnctVoog7qKCuMY9DtXj7/k+8UVJ72+3bFOSL1hCSLSQPcGX/arySdLLZcc/Mg7F
	jmUBDZvWadN7Zgmam1BEgE4/KBqrlPysjpunBKRLNGdlJqRMVBmTub2pdXKGCfyCkFIzyWVuDvu
	Ufgj0pqT6trlGexNanLF2QVynHWfW51g74K4sovZkW4oUbNMXsYKBd1G11I3feBXoG2n0H9rXUq
	Y0nYaB2IhCLrt+KE5bDVse7fQeprYas/H1b+6AjFcyflchUXZGTO4sSWB2ZuYcm2jorAp2L3Iju
	CtE6qnthfKZchao83sYnqiujwqlVuRcFJ4fHclKduuqjvpznGfVPMHgJ1xVcVw==
X-Google-Smtp-Source: AGHT+IEHG2qmB2LmzH3T0Zgn0rsKH84tg2w3jalJkB8NuWD2TTIccKDZvfqK+R3Ygm+t7XDwnb/JPQ==
X-Received: by 2002:a17:907:728e:b0:ad5:5198:b2ad with SMTP id a640c23a62f3a-ad55198bc52mr1558639866b.48.1747839940014;
        Wed, 21 May 2025 08:05:40 -0700 (PDT)
Message-ID: <ebcc5380-b20d-4579-841e-89b66bacf1f6@suse.com>
Date: Wed, 21 May 2025 17:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 16:55, Andrew Cooper wrote:
> On 13/05/2025 6:05 pm, Sergii Dmytruk wrote:
>> +/*
>> + * Always use private space as some of registers are either read-only or not
>> + * present in public space.
>> + */
>> +static inline uint64_t read_txt_reg(int reg_no)
> 
> unsigned int reg
> 
> I'd be tempted to name it simply txt_read().  I don't think the extra
> "_reg" is a helpful suffix, and it makes the APIs consistent with
> txt_reset().  But I expect others may have opinions here.

+1

>> +static inline void txt_reset(uint32_t error)
>> +{
>> +    write_txt_reg(TXTCR_ERRORCODE, error);
>> +    write_txt_reg(TXTCR_CMD_NO_SECRETS, 1);
>> +    write_txt_reg(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
>> +    write_txt_reg(TXTCR_CMD_RESET, 1);
>> +    while (1);
> 
> for ( ;; )
>     cpu_relax();
> 
> please.

With (style nit) another blank between the semicolons.

Jan

