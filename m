Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF8fBJJE52ls6AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:34:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18832438EBF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288728.1568964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7UD-0003Rj-BB; Tue, 21 Apr 2026 09:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288728.1568964; Tue, 21 Apr 2026 09:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7UD-0003Pd-8E; Tue, 21 Apr 2026 09:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1288728;
 Tue, 21 Apr 2026 09:33:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF7UB-0003PV-Oi
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7UB-0034d9-5V
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:33:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e7446f-5cb7-0a2a0a5109dd-0a2a450b8fe6-16
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:33:39 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e74472-212f-0a2a450b0019-d155a72fa9a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:33:39 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a413f83226so4508397e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:33:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb75b033sm28724821fa.39.2026.04.21.02.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:33:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776764018; x=1777368818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/Q1CCkzG9TmWvXiP1mwHDKExLju5Rm78udlsH+vuLQ=;
        b=g8r55VmN7lhkqeGQrP9lCSbEVkScYECBMS7UX4e1LAqPmNLH5pvcH0B0ReO/a6sSP9
         wHbWqZlFDBwbxygZSKlt16EmZelxg7nKlNQ60RvYqBmdkjwuxf7kPDYWGRMosKHrToBv
         Z/jXkCBG48UeSac0D8ucuCJKnXn51iSdcf2vhoKPkVJQNkhfdcrKsjwvI0t4aIBP+G1Z
         yfnpB9nN6fYm5BplFciMGztA9ItgW9H9gei6RUdTHyO5T24SMRIkLjxUAQ6j9UKoNfV0
         z+wtvo2VC6S6AwuTYFoDWolxcZHC9gXn86LbI0bQZ9XtXas6MA2SU1iKkpRUFr2zq2OT
         Vz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764018; x=1777368818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/Q1CCkzG9TmWvXiP1mwHDKExLju5Rm78udlsH+vuLQ=;
        b=fcGfNsao4jd+tzg13OpmMz8bEqx1HpYqNs/XE38GRh0BOcA8d2D5rJGFFS8kZ7RIYc
         LoXpoasVVtopAYT9PbJIPwNHxM2jrobMZ3AUwejJZNF7y2gCpzHM37sNey/MSKmNvy2g
         QfmyOR/N2khrNoBhuxcJXguJLOvi9hB6wqkC26yTfUgBQb+kWc0k115jocCFQRcrwIWR
         BwGzl3CQ6dcqQO9HR+ew9v9AR+FTiK/Eye/4A2b5LuKXnAnNTKr6jeJhp6NXCObe9D+c
         x5pSYnLouHbzEOW9lfQgfhwXcaR/xY/oILieIyXYyDGa4lkioz46diV+RH86X5s1EEZp
         NPAg==
X-Forwarded-Encrypted: i=1; AFNElJ9qWE2QLGUaPVGXI7QJnyhev2HuYlBX3qvAUJ6A5lxx8vlFXaGqt2VX4OeO+eoXLVNWqJUjpHHsvkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKCQCtb9lUaUXEn1zqLP2gFhRILcwhj5A3sfg4ExZIDVmpm1hs
	1NHwd7oUdskWkCXJ50LNSpU83KFWIZUgkRsVguxrbw2EM3fHdu1tCE4B
X-Gm-Gg: AeBDieuzhTI9N9NR5iQJTqBKAISmzhTBBAHf2FvEsLthDG2mluF7V7x4nCuJ8IAMmaF
	oSNnpHZVJ5N/CpBLb+dNB+P6eLQ24D1ZdyzsuvQVupjFLo73TyBfrv+tFsSammpwo6A0SzYaTNG
	2zgTgzlVVxnhYsqB4FhHGDN796xx5bEClsZS9k1RTcFmWXoqh+xkFYPcCf+b8BBZmtLHcyzwR0K
	dpUAOv/p5RH/07D40gSuxXv2qNmi0cuA5X6ui9VinBR7DhCdX3rDTelbG+GeryBwWvJJ8AHTy47
	1ZlFSB8Gv8pUZGn97rYXBT5Vx4M/cX37bxUxyD8QcCbd8515yH8eGAqJe4UFSoPX/p+FSR0oL6T
	tsLNnbeIKvsZB+kvN36Q2Y/xMnlKo2ASZujFT4x5Epr4+O1w6Omd/p45KnmdMq+PXQzBbX/aBPG
	QNwVehPHuJc72ZGylc3od+AqE7Ux1QHUpjnujLSYcjtqLbsAG/dQoW7BYBrjMjTzmDZBnX9mjrD
	KpsmANTgk6Tkw==
X-Received: by 2002:a05:6512:3095:b0:5a2:b57d:950d with SMTP id 2adb3069b0e04-5a41716da5fmr4985540e87.5.1776764018079;
        Tue, 21 Apr 2026 02:33:38 -0700 (PDT)
Message-ID: <8f93b170-da98-4105-ba83-a0f8421e672b@gmail.com>
Date: Tue, 21 Apr 2026 11:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <a64c0c52-fe42-42bb-b93c-470ab9c25413@gmail.com>
 <306c8133-0bee-4d07-be34-5d201a232b04@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <306c8133-0bee-4d07-be34-5d201a232b04@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776764019-7CD67F3B-12857635/10/73395122804
X-purgate-type: spam
X-purgate-size: 4993
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 18832438EBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 11:10 AM, Jan Beulich wrote:
> On 21.04.2026 11:01, Oleksii Kurochko wrote:
>> On 4/20/26 9:56 AM, Jan Beulich wrote:
>>> On 17.04.2026 09:24, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/csr.h
>>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>>> @@ -32,6 +32,20 @@
>>>>                               : "memory" );                        \
>>>>    })
>>>>    
>>>> +#ifdef CONFIG_RISCV_32
>>>> +# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
> 
> In my reply I followed this. If this compiled, then ...
> 
>>>> +#else
>>>> +# define __csr_write32h(csr, val) ((void)(csr), (void)(val))
>>>
>>> In order to be able to spot issues in 64-bit builds, how about
>>>
>>> # define __csr_write32h(csr, val) ((void)csr ## H, (void)(val))
>>>
>>> ?
> 
> ... aiui this would compile as well. Looks like the RV32 case then is in
> need of adjustment as well.
> 
>> But this will cause a build issue in 64-bit builds.
>>
>> csr_write64(CSR_STIMECMP, ...)
>>     └─ __csr_write32h(csr, _v)   ← csr is NOT ##-adjacent here
>>                                     so preprocessor expands it FIRST
>>                                     CSR_STIMECMP → 0x14D
>>          └─ (void)csr ## H       ← csr is already 0x14D here
>>                                     0x14D ## H → 0x14DH  ERROR
>>
>> Probably, it would be better to do in the following way:
>>
>> #ifdef CONFIG_RISCV_32
>> #define csr_write64(csr, val)       \
>> ({                                  \
>>       uint64_t v_ = (val);            \
>>       csr_write(csr, v_);             \
>>       csr_write(csr ## H, v_ >> 32);  \
>> })
>> #else
>> #define csr_write64(csr, val)       \
>> ({                                  \
>>       uint64_t v_ = (val);            \
>>       csr_write(csr, v_);             \
>> })
>> #endif
> 
> E.g. like this, albeit in the RV64 case the local v_ isn't needed. Instead,
> again to be able to spot issues in RV64 builds, (void)csr ## H may want
> adding.
> 
> A clear downside to all of this is that this helper can only be used with
> CSR_* constants, not with runtime-calculated CSR numbers.

Yes, but it isn't critical downside as I don't see cases where it will 
be useful to have runtime-calculated CSR numbers.

> 
>>>> @@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>>>>        return sbi_err_map_xen_errno(ret.error);
>>>>    }
>>>>    
>>>> -int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
>>>> -
>>>>    int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>>>                              size_t size)
>>>>    {
>>>> @@ -360,10 +378,9 @@ int __init sbi_init(void)
>>>>            }
>>>>    
>>>>            if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>>>> -        {
>>>> -            sbi_set_timer = sbi_set_timer_v02;
>>>> -            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
>>>> -        }
>>>> +            set_xen_timer = sbi_set_timer_v02;
>>>> +        else
>>>> +            set_xen_timer = sbi_set_timer_v01;
>>>>        }
>>>
>>> Sadly this isn't quite equivalent to sbi_set_timer having had an initializer.
>>> I would have wanted to suggest to use a constructor function, but we call
>>> init_constructors() even later than do_initcalls() on both Arm and x86 (we
>>> don't call the latter at all on RISC-V so far). Might it be necessary to
>>> introduce sbi_early_init(), called very early during boot? Else how do you
>>> guarantee no accidental use of the variable before it is first set?
>>
>> I thought about an introduction of sbi_early_init() but then decided
>> that set_xen_timer() won't be used earlier than at lest timer_init() +
>> local_irq_enable().
>> Also, sbi_init() is executed pretty early.
> 
> Many more additions to setup.c are to be expected. Are you sure hardly any will
> go ahead of the call to sbi_init()?

Looking at the current state, I don't see something new what will added 
before sbi_init() except percpu_init_areas().

I am okay to introduce sbi_early_init() if it will be really better:

--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -387,3 +387,8 @@ int __init sbi_init(void)

      return 0;
  }
+
+void __init sbi_early_init(void)
+{
+    set_xen_timer = sbi_set_timer_v01;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 56a0907a855f..b187a84cd28d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -78,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
      const char *cmdline;
      size_t fdt_size;

+    sbi_early_init();

But it looks to me that is fine to have what we have now as even someone 
will try to use set_xen_timer earlier a trap will occur and thereby it 
will be need to put the code which start to use set_xen_timer after 
sbi_init().

Best regards,
  Oleksii

