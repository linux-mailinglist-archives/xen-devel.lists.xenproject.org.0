Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Cl9Bhu0xmmiNgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:45:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F597347A95
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1266001.1556662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6AIe-0001lq-3d; Fri, 27 Mar 2026 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266001.1556662; Fri, 27 Mar 2026 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6AIe-0001jL-0z; Fri, 27 Mar 2026 16:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1266001;
 Fri, 27 Mar 2026 16:44:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w6AIc-0001jA-1X
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:44:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6AIb-00DIVI-Dt
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 17:44:41 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c6b3f6-bab6-0a2a0a5309dd-0a2a4503c388-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:44:41 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c6b3f9-1947-0a2a45030019-d155802ac9ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:44:41 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so22481295e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:44:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270ea4bdsm38450145e9.6.2026.03.27.09.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 09:44:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774629881; x=1775234681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxnK4MKJkXqbZDfJW2Al+wM8TzSUN50cXJDicC5o8nc=;
        b=XeiTUMB5C+WbUtZMxhOvytlMPpP+UQV66cka5X9wiDnfJKba9XcOvlmAteH9Q7HEAV
         NtVU9xVcb8B4SqRlyjxJEFul6WNjYRYFPfymIWw2vPCxgRK2UXyppwmFMlO9+wz1vRRR
         YoBac7ILr1K7AtHBXhwTqIhfV4DsurK55867GMxZNMW1NfBxfxduaG8OVeCR1AgQXcu1
         8cOJ+1P1p+mhunopXUdsVPmsSLcYzyEdjmp3CZ3URsgnPWAxcbqO5tLmjiG523qT7SDK
         4Fhs+vh3MqwXjljU/GKO6QKYa13RMNvT0o3N8Tyrs1rQVPuzbDZIZeI1TwOEXKeMymyY
         2nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629881; x=1775234681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxnK4MKJkXqbZDfJW2Al+wM8TzSUN50cXJDicC5o8nc=;
        b=MkozCOvFjByGyXzXgpoMWCEAMAbOcC2vkx1vtev2N7fFijaexFRNdT1otYSd37WhIg
         BKMcAuD88a/67KcZl7SshQA00hnGZWEzGku2vbD2EK+7pkB2MN+sG6Dbxb6uMCeS37YR
         em2EDE4EyvJISmKCY6dD2Bd3Esi/s9URkL5iwBTI4UxAyI4dh++JE92R+3QjUsXB8hDT
         ksavrqeKbJ717Uq2g955FQT3XcfYtxpehDDSTZdqChQcxMR/brIF5TJLxbjjgB++9q04
         sLtHknTIZSRlZL69mXO9l+1rQWkPSr5HKwmrxhAAqbLw3i/EMjLfMLwJ+wAkwB6mhOST
         E84g==
X-Forwarded-Encrypted: i=1; AJvYcCWQkC6TVbraIr6mc7KBzWgx9BHg/d22haftkBhjTjtXh0rgyODMb1VJLJsW3n40E6bWWn3GgQ5G2CQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi8Tv4kLZ7EBTIPyukVd1x1vcU2mmgUnHwIDS4dPFVnKtY52QP
	36p5C+1LpN0G2rUuWnG29JQr8ntw8jWrfFhVVH+v2kFlpttH6KWli2p/
X-Gm-Gg: ATEYQzzIR5DiLVmHWDSjAFoYZ6oUrOMe8kfSjYRw30fXHX3ky03tCFEw+A5tPZEZrEe
	kZmkK5Aw5bwqNGBBxgEIChLu3JC3bFI6nok0OhkaolCeQqT9EU22xBf0g8+6jcVS+5ZIZWCXk8r
	eQodu+fr50hNL8aAGCmFhl/aVUyGD7PfryzAeCwgyFf8azM1NcboXsLaoJdA5NRD0+bNqjAkGnX
	1nDEwFpjP/FDuLlVdPaxflzyyyEvzH49PxozLQW7xa8cssY4pgFkaUSYn29HMfWdH+zqbCx8eb4
	uEspdGvexpjsS1q/G9t/hP45RZ4XPfqLqrT3RElC86w6ShftvzWVkCBCqCc8SqDbqF+WFG4I5cf
	lZu5MDHhOTdnjNRrR1UJS2Ck+mU0tSKBIEvI8Lx+sJAjTOEsaZZVGTsu+AN/YZAUZ0N9AjEslid
	LC/KzkOSljA4wocmIQhrWMQKbFCcyuVHETkmLRMB6d17eq+Ym8hVUU+vY3Y2j/UDB+xLAZBpjKJ
	sY=
X-Received: by 2002:a05:600c:3d87:b0:487:2092:b2e0 with SMTP id 5b1f17b1804b1-48727d5a246mr54546515e9.1.1774629880650;
        Fri, 27 Mar 2026 09:44:40 -0700 (PDT)
Message-ID: <3e3e0082-c39b-46d5-9c19-0a85959877d6@gmail.com>
Date: Fri, 27 Mar 2026 17:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/riscv: allow Xen to use SSTC while hiding it
 from guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <0f0849b53625f9f9f939000f29579e264e522fd2.1773419622.git.oleksii.kurochko@gmail.com>
 <4ebe7434-ce4a-421d-b027-f8c110b7b2dc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4ebe7434-ce4a-421d-b027-f8c110b7b2dc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774629881-E989A72C-989B8E63/0/0
X-purgate-type: clean
X-purgate-size: 3476
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
	NEURAL_HAM(-0.00)[-0.954];
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
X-Rspamd-Queue-Id: 7F597347A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 3:32 PM, Jan Beulich wrote:
> On 13.03.2026 17:44, Oleksii Kurochko wrote:
>> OpenSBI currently does not advertise the SSTC extension via the device
>> tree. Additionally, SSTC can no longer be reliably disabled by removing
>> the "sstc" string from riscv,isa, as OpenSBI probes support by attempting
>> to access CSR_STIMECMP.
> 
> Still don't yopu need to remove that string from what guests get to see, ...
> 
>> Introduce a runtime probe in Xen to determine whether SSTC is available.
>> The probe attempts to read CSR_STIMECMP using csr_allowed_read(). If the
>> access succeeds, SSTC is considered available; if a trap occurs, it is
>> treated as unsupported.
>>
>> When SSTC is detected, Xen may use it internally to program timers.
>> However, the extension is not exposed to guests because the required
>> context switch handling for the SSTC CSRs is not yet implemented.
>>
>> To prevent guests from using SSTC, RISCV_ISA_EXT_sstc is cleared from the
>> riscv_isa bitmap. As a result, the corresponding HENVCFG bit is not set
>> and guests fall back to the SBI timer interface. Timer requests are then
>> handled by Xen via the usual SBI interception path.
> 
> ... alongside the riscv_isa adjustment?

Right, I have to mentioned that in the commit message. It will be 
skipped for riscv_isa property here:
  
https://lore.kernel.org/xen-devel/cover.1773157782.git.oleksii.kurochko@gmail.com/T/#m6e45279d24258fe78c6aebf29379fa9135ec9f1c

(what will require to add SSTC extension to guest_unsupp_exts.)

I will add to commit message that except HEVFCFG bit shouldn't be set to 
not let a guest try to access VSTIMECMP register, it should be droppped 
(or not added) from riscv,isa property.

>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -99,6 +99,9 @@ static void vcpu_csr_init(struct vcpu *v)
>>       if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
>>           v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
>>   
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>> +        v->arch.henvcfg |= ENVCFG_STCE & csr_masks.henvcfg;
> 
> Wouldn't this better be part of the (future) patch enabling SSTC for guests?

Probably, it will be better. Lets drop these changes and re-introduce 
later when guests will support SSTC.

> 
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -396,6 +396,8 @@
>>   #define CSR_VSTVAL			0x243
>>   #define CSR_VSIP			0x244
>>   #define CSR_VSATP			0x280
>> +#define CSR_VSTIMECMP		0x24D
>> +#define CSR_VSTIMECMPH		0x25D
> 
> I think it would be nice if throughout the CSR definitions you settled on
> using upper case hex digits uniformly, or all lower case ones (personally
> I'd prefer the latter).
> 
>> --- a/xen/arch/riscv/time.c
>> +++ b/xen/arch/riscv/time.c
>> @@ -13,6 +13,20 @@
>>   unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>   uint64_t __ro_after_init boot_clock_cycles;
>>   
>> +static int cf_check sstc_set_xen_timer(uint64_t deadline)
>> +{
>> +#ifdef CONFIG_RISCV_32
>> +    csr_write(CSR_STIMECMP, deadline & 0xFFFFFFFF);
> 
> The "& 0x..." isn't needed here, is it? I.e. the whole function could be ...

I think you are right, it "& 0x..." could be dropped as it anyway will 
be truncated by (unsigned long) cast inside csr_write().

Thanks.

~ Oleksii

