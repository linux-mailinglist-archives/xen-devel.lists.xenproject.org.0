Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Dw8HRY952no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:02:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E464388B3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288691.1568937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6zb-0005AB-MH; Tue, 21 Apr 2026 09:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288691.1568937; Tue, 21 Apr 2026 09:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6zb-00058S-JL; Tue, 21 Apr 2026 09:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1288691;
 Tue, 21 Apr 2026 09:02:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF6za-00057s-4K
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:02:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6zZ-002zaS-Gj
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:02:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e73d04-2eae-0a2a0a5409dd-0a2a4504c5f4-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:02:01 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e73d05-1dec-0a2a45040019-d155a72bd876-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:01:57 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a525aedb24so2119298e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:01:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41a238563sm3343740e87.55.2026.04.21.02.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:01:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776762117; x=1777366917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KpDf2sze9ofwgyQZbAxaKl3MsrrAfysJEU1wnQ0oSBs=;
        b=rIZ7GK1+GfXUEAtIOh0lZK1wf1+ts28JbOJ4XIJsEbB3R9W7q4PWdvobvLYSdBU8WE
         1vZHrN58VH5+FV4NsS4T0e847e1i71VVO4ENLV9m+HLbB59dn4+fU8VemQKjlP7pGnO7
         JhdQAPp/9IagVd26rWq4e0NzAlpYh/vH7i2nWg2szehDDGvwD8T+aSH9WvM4Tl+tRoe8
         3iF0RReEgf+uKuUwjoLrDQWoUQ31wwqpkQCytelWFau+bZb+XUYqMYWfnqmwiDKIhUSd
         ZwHfmK999FLE7o1VwZ+9+8DARDbfUroyiQFLgXBazJdU1Xpu2pCuvT8sL3UKJ1r2fL7E
         37fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762117; x=1777366917;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpDf2sze9ofwgyQZbAxaKl3MsrrAfysJEU1wnQ0oSBs=;
        b=VT0qqvpWH59OTD1qtHcpmYcKiEIq6XlXXU/XAr8jXOh0r36s55xp+MIqTxBwWLtLxM
         66r8cbT4dA8V+D3gp5V444rYcWbh8NH6kQI1znnTnG42jsd3rlWfrY1Q6eGXIIqxdNki
         FQrM7A7A77cwTfC5qYb6i8gCcJ3EildMTbkLjEmud3p6rkS0EagaQ4z2r9MLNqZz6q4f
         /N0mWazn1Ad3DcAbTqfNcuZQN/tweZ4DrD+QDzeBAKJj2LaiCFGRXL4NJ5rlBl2Hun3h
         iPzn7YLu1zhespDRwkCRKZQqiZhOxV7LyWZ96rxDqsaS4mzJ/mH7fBrB9kh016ExgGcU
         9q+A==
X-Forwarded-Encrypted: i=1; AFNElJ/6dBIlpvbDa7ki0/BoOxM4CUWTAaePeS8dZu5gM32HIj36sg+Ef7xOqexlaNLIm1KsxKugyFOjvmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM2HMagbBBTGfjpwwjIsVoXNRPQpi426cNwGdoiWvcTTijL3zz
	GTn4oRRqtagq3YH2cD1X9E/HeLEPOAYjL3Q2KrLNKBAsBPNFOHz24jls
X-Gm-Gg: AeBDietVYMX+DEemB2QlsEh1zv1x8gLwdafMZlyuboAypvV9aANE4pKCOuXs9Bzg2cp
	6+WFmOIKLg0FpPTrtrLiBdLaQZWaJvIV6D1jlDCdiykKAwYC17VzsuBSrrBaPmQPn/NxVakpWYO
	ShaF8LO1LMYy2pkDA7AltVDopzxuYbvoMEF7v4NkEccv7jgbaWOwhz28o9bxfVtwrjfFxPepzp3
	4AeISOfEkJGIntjsCzThBoW+vZ3KeiBknYr7aQiMR9+f64bIR9bq+BwfJ/Zs5SHBfObIuUclBEI
	zrFFX4wSySBr8ucBppUtMMAKDcLwaemVvNMzbGKupvt3uZOI8LiqYuWjvXrTVehYEt0uUQ+B208
	KRxif3lA6FZmx5Mf1FzuuGF9zP4HFnWpoYU6ukjG9L0dEucJU3mfWDdsTpAYMjF4aJTQR4RNnqJ
	loYz0HFsJexhkDBn9UcEF2/+44QwV6EXG1LI/YQfzO78tw+GHFnz7IeRN2hdGORb8Zw2a3Q82kJ
	Ru1QPcVnXVjwA==
X-Received: by 2002:a05:6512:3d20:b0:5a2:b0ba:7169 with SMTP id 2adb3069b0e04-5a4172e2901mr6141302e87.38.1776762116288;
        Tue, 21 Apr 2026 02:01:56 -0700 (PDT)
Message-ID: <a64c0c52-fe42-42bb-b93c-470ab9c25413@gmail.com>
Date: Tue, 21 Apr 2026 11:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
 <405b5653-4df9-4ee0-b6e2-ba7c4a5efbba@suse.com>
Content-Language: en-US
In-Reply-To: <405b5653-4df9-4ee0-b6e2-ba7c4a5efbba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776762117-291763FF-EEAEDB64/10/73395122804
X-purgate-type: spam
X-purgate-size: 3327
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 50E464388B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 9:56 AM, Jan Beulich wrote:
> On 17.04.2026 09:24, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -32,6 +32,20 @@
>>                              : "memory" );                        \
>>   })
>>   
>> +#ifdef CONFIG_RISCV_32
>> +# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
>> +#else
>> +# define __csr_write32h(csr, val) ((void)(csr), (void)(val))
> 
> In order to be able to spot issues in 64-bit builds, how about
> 
> # define __csr_write32h(csr, val) ((void)csr ## H, (void)(val))
> 
> ?

But this will cause a build issue in 64-bit builds.

csr_write64(CSR_STIMECMP, ...)
   └─ __csr_write32h(csr, _v)   ← csr is NOT ##-adjacent here
                                   so preprocessor expands it FIRST
                                   CSR_STIMECMP → 0x14D
        └─ (void)csr ## H       ← csr is already 0x14D here
                                   0x14D ## H → 0x14DH  ERROR

Probably, it would be better to do in the following way:

#ifdef CONFIG_RISCV_32
#define csr_write64(csr, val)       \
({                                  \
     uint64_t v_ = (val);            \
     csr_write(csr, v_);             \
     csr_write(csr ## H, v_ >> 32);  \
})
#else
#define csr_write64(csr, val)       \
({                                  \
     uint64_t v_ = (val);            \
     csr_write(csr, v_);             \
})
#endif

Am I missing something?

> 
> Apart from this, no matter that it was Andrew to suggest this, I'd like to
> (once again) point out that identifiers starting with two underscores are
> reserved. I don't see why a single underscore wouldn't do here. Or
> alternatively csr__write32h().

I will apply your suggestion.

> 
>> @@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>>       return sbi_err_map_xen_errno(ret.error);
>>   }
>>   
>> -int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
>> -
>>   int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>                             size_t size)
>>   {
>> @@ -360,10 +378,9 @@ int __init sbi_init(void)
>>           }
>>   
>>           if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>> -        {
>> -            sbi_set_timer = sbi_set_timer_v02;
>> -            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
>> -        }
>> +            set_xen_timer = sbi_set_timer_v02;
>> +        else
>> +            set_xen_timer = sbi_set_timer_v01;
>>       }
> 
> Sadly this isn't quite equivalent to sbi_set_timer having had an initializer.
> I would have wanted to suggest to use a constructor function, but we call
> init_constructors() even later than do_initcalls() on both Arm and x86 (we
> don't call the latter at all on RISC-V so far). Might it be necessary to
> introduce sbi_early_init(), called very early during boot? Else how do you
> guarantee no accidental use of the variable before it is first set?

I thought about an introduction of sbi_early_init() but then decided 
that set_xen_timer() won't be used earlier than at lest timer_init() + 
local_irq_enable().
Also, sbi_init() is executed pretty early.

Thanks.


~ Oleksii

