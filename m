Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKm9J49RjGmukgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:53:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305012301F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227145.1533485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6uB-0002sw-OE; Wed, 11 Feb 2026 09:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227145.1533485; Wed, 11 Feb 2026 09:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6uB-0002qj-L6; Wed, 11 Feb 2026 09:53:07 +0000
Received: by outflank-mailman (input) for mailman id 1227145;
 Wed, 11 Feb 2026 09:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vq6u9-0002qb-Rs
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 09:53:05 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 752318d1-072f-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 10:53:03 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so20652565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 01:53:03 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm43207475e9.6.2026.02.11.01.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:53:02 -0800 (PST)
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
X-Inumbo-ID: 752318d1-072f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770803583; x=1771408383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93Gt2K4loBSrYHf5eCVNMdfs11JBUXF7r8yCMW6LFvo=;
        b=fuo6Z77Ho3O/DOw68cL/Sx03AaQCgRXYTUrXxsULncVK3Is3OLK1vhJ77YehYGaNKn
         MxoGAqlsj69Ro8mAgV8b/VAQyfeUoj5KDdfnBn+IRTftrraHkb4kkUsB0Csg/sbExExG
         Pk37t8cbYZ5xC/pGvu3oXUyOEJoIshX0ok0P8c6+wMIdsrytz4g29L/bw2CjYLzD5UiC
         kVldm4Coeu2Upbz9FB6+tzSjMQkmReTGQfK/3Ne/MtSlFWtgtCFC45TqGWCeeEjQk+LX
         4Eij9Ivc5POxq0GtYVBkNklYIz8ELYQhky81zDY4xR7rM0xIpO3ar8kjoI6RvC/TKGf/
         RtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803583; x=1771408383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93Gt2K4loBSrYHf5eCVNMdfs11JBUXF7r8yCMW6LFvo=;
        b=otKfKFH0ZAM7bBsmslnEijQ7BsoURS2KChKT784Z2yomz5avXKUalJRAJDg3KWdqTk
         +NwIdmwuZ0UYS8+V6UhzBxjopP9y2vr4qIbgt5fprFFaJWjVJUWG1l+7iO8sVgteYdxk
         M5rR8JZLs98Wt7TpxwMXog1+zHMsq1iw0txrLSb9JqhMNhEPY7qmP+Xu2OmQ1765igMc
         ElTM/vKoO0UGZ8FAzWuOYuVEJbxDsxTcE7nJMlsAzd/3fsPksvaYwML0rqUJB8vnxdwA
         xyPyTUxj1rpkYzarpF42Uhf6qnMKOAJZeWe9HIWcNgbmaMrStV56PZRWTvD7kr2mJtKF
         CVww==
X-Forwarded-Encrypted: i=1; AJvYcCWZuj/AXiCs0X31hKnZ2Q1T1KMl/hMzNl88itpcRcsjuvCb2RHmc9wuw+zxNwGQ+c/NRQ3bwVabYFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMUtxVtkV+pMTr3NAzUFRd6NmT9ZuWzco7f3i+WqbrT4U9ofde
	cdEhwCXq6ZqI6IgXwVsZ6RoYqSYWvnbQVEXLhdcBS/HjFTFflVqVRc1Zmxl57AS1
X-Gm-Gg: AZuq6aIjlNdqSlMpgYmiywfxFB4olsNYaJndhfD/yrvdgoFGU8Sp+NWmtGxWEv8sd4A
	DV6JsLCUfFDJKx1cWitQyePvjQsZXOx3Ah6857X0IBH7FYY9k8xvjpwlcZROPEBKRRwiIpizFqC
	3vdro8x0Lwo7IYO6FD9hKqNfhr2uTuo+L1c1cxzD+61yJg44lZgG2Wb/Dhnm0x7u1EP3HOuVfC0
	Agz6+qrrvmicSduuyg0yvWrwFZ28FqhWEkPfoc0uy3UpDX4sskoqQTKc7+D2jJB6x7CicEjt4YJ
	19ghHGWNaA3tzJzYmnK6QwUpS7W9XlB2Z+M5nPeTlXxaBIfwy29alPF1wZPKcY8VczVRpa33v3H
	/tX1g6hGXttr1lRJjsbxyVXeVvFO3qXxUVxJUDNpw2+ikguDPlm/+j+uZKzZ3KhXz8FWvIrmN26
	coR2ywPIr+liiAEJTHIMR12+lNxsDh3klu33ZxwM5MY4iGhvgfPeqQC67Dlgi2pqDy5H53D+xq8
	Xkux6eT2ra8Yg==
X-Received: by 2002:a05:600c:3b83:b0:483:4a95:66da with SMTP id 5b1f17b1804b1-4834a956702mr102820995e9.13.1770803582984;
        Wed, 11 Feb 2026 01:53:02 -0800 (PST)
Message-ID: <e7475d33-a7ca-4095-9483-e23a8587850f@gmail.com>
Date: Wed, 11 Feb 2026 10:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <212accf20032cc9cbe6c33752fa45de1c1284e3c.1770650552.git.oleksii.kurochko@gmail.com>
 <fa58fd77-b513-4704-8598-1209b55226a3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fa58fd77-b513-4704-8598-1209b55226a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1305012301F
X-Rspamd-Action: no action


On 2/11/26 10:44 AM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -5,6 +5,72 @@
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/riscv_encoding.h>
>> +#include <asm/setup.h>
>> +
>> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
>> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
>> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
>> +                         BIT(CAUSE_BREAKPOINT, U) | \
>> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
>> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
>> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
>> +                         BIT(CAUSE_STORE_ACCESS, U) | \
>> +                         BIT(CAUSE_USER_ECALL, U) | \
>> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
>> +
>> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
>> +
>> +static void vcpu_csr_init(struct vcpu *v)
>> +{
>> +    register_t hstateen0;
> There not being an initializer here, ...
>
>> +    v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +
>> +    v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
>> +
>> +    /*
>> +     * VS should access only the time counter directly.
>> +     * Everything else should trap.
>> +     */
>> +    v->arch.hcounteren = HCOUNTEREN_TM;
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
>> +        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +         if (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia))
> (Nit: Style.)
>
>> +            /*
>> +             * If the hypervisor extension is implemented, the same three
>> +             * bitsare defined also in hypervisor CSR hstateen0 but concern
> (Nit: "bits are")
>
>> +             * only the state potentially accessible to a virtual machine
>> +             * executing in privilege modes VS and VU:
>> +             *      bit 60 CSRs siselect and sireg (really vsiselect and
>> +             *             vsireg)
>> +             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really
>> +             *             vsiph, vsieh, and vstopi)
>> +             *      bit 58 all state of IMSIC guest interrupt files, including
>> +             *             CSR stopei (really vstopei)
>> +             * If one of these bits is zero in hstateen0, and the same bit is
>> +             * one in mstateen0, then an attempt to access the corresponding
>> +             * state from VS or VU-mode raises a virtual instruction exception.
>> +             */
>> +            hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
>> +
>> +        /* Allow guest to access CSR_ENVCFG */
>> +        hstateen0 |= SMSTATEEN0_HSENVCFG;
> ... doesn't the compiler complain about the use of a possibly uninitialized
> variable? The variable also wants to move to the more narrow scope.

Hmm, for some reason it doesn't. Anyway, I agree that it would be better to move
it to a narrower scope, since `hstateen0` exists only when RISCV_ISA_EXT_smstateen
is supported.


>
>> @@ -32,6 +98,8 @@ int arch_vcpu_create(struct vcpu *v)
>>       v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>>       v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>>   
>> +    vcpu_csr_init(v);
>> +
>>       /* Idle VCPUs don't need the rest of this setup */
>>       if ( is_idle_vcpu(v) )
>>           return rc;
> Do idle vCPU-s really need to have vcpu_csr_init() called for them?

Agree, there is no any sense. I will move the call of vcpu_csr_init() after
is_idle_vcpu() check.

Thanks.

~ Oleksii


