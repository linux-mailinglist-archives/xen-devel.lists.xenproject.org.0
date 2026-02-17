Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLybGvd5lGkfFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:23:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E214D1DA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235079.1538125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLzH-0003Ou-Tw; Tue, 17 Feb 2026 14:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235079.1538125; Tue, 17 Feb 2026 14:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLzH-0003Mh-QZ; Tue, 17 Feb 2026 14:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1235079;
 Tue, 17 Feb 2026 14:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsLzG-0003CN-ID
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:23:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f644c50-0c0c-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 15:23:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso59038675e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:23:36 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371998777sm402436275e9.1.2026.02.17.06.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:23:35 -0800 (PST)
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
X-Inumbo-ID: 3f644c50-0c0c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338216; x=1771943016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11JyZZS+qJmiFN3fNB+Iee1JkfEd9hcyAJUVgAJ0YHw=;
        b=RuHXJUPrXBRc/Gi7UBK91ySzqLmZ98Jy+7SZYHoJIWkBQjKha20NFHXHCTIqisSCbO
         JnRTc8TyHfDCz014x7PNnRyqqc3PmMeqcjptz4EnLjZpKCCfIrEpa+N3LqRWHP32vRd8
         TtTsW5qln/Go82hiVsJ0oSLYFq+PqUp1zeW/oQADe7O5cFhBRxQK+ywHsIwP/KH5+BIs
         FNF10zIDfpWWioibEueiIffi11+adUj7X96W9foQmu+vIQj37LwXB7PBSDWTQjdyOiAW
         4hgNMtgGMTxOSYACa6SPuO2iVvxjHPNSA9QgErwj5cop4JHKmThAlCy941nSJWrAQT+Y
         fGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338216; x=1771943016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11JyZZS+qJmiFN3fNB+Iee1JkfEd9hcyAJUVgAJ0YHw=;
        b=sVRYfQQhbrAf1o4uD1sFjF+fTC07m+xR7bjoJia3YlZeYgrFGbGL/kLQf2FvgIzDR0
         EAmnpwB38O1LoFxc/J4C2cC2PaqdABrGUU3D5UiZqi4qGwXSqCab0xp0N/8DfwXoyVsS
         YuifM6A/fVv91bMFp5FA0hKK2vy5yCS/QZoICICaZ1FiV11lwYshAStIy3cQS35jEhnN
         yL0Hi2bFX6Zea9Jpnk+/HZUBbs4pzorTMZp0mEpjlI/rwkTKzV4tgqVWpR5m8QSSBxF2
         NN4ZWcC9F+hLRkOXbcTvqRONx4E1Owz/60Ksz8Gqc+1cDjmP/KyBwlXacqz87qQkiiTn
         G1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDFBFaIgb1eJS/TyP7JSjPzwqd2D8CYjOWk8inR+DFO9FRKtqU7CwDEImyO6HndNsPLlOdYSa8Sw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxda+aGbxr1YjLV+jqoV2mim62rTEB/gLHJ48a/i9rc2kRZHhsa
	9dRrMylMlpFSr77qsqn9PeEyo9TnBUWJXemzxpnXiUJL3jSQTp+R/Kml
X-Gm-Gg: AZuq6aIHkiFEuqxG6eb3HyKSr5jhJ/5KIf++CZFahlCgEMZnoFBqVHokAYZ2Q5L0MSw
	qtRPrtZjWaJNwlWeq1+98TL1DlGkSu/Wn5q5il5TtSt4/4MYjofk06o2DOv1lozTAkQAsM/yakx
	IZ/29XD8i6KHi/ZMZUp4cfgJtjXMJH/z6p6e8hHyd2J3k5PFYB0sv65HD0KdQd3t5Yw5V5vVGop
	+tvw1iA1jfE3E2AY9a1UKvHMWXdS0R+upi1Ado8rJnqTKU+pdTcP+XVl/ARpV9JBnWRSZDHEptt
	hMHlz1Hfn2O8sZY6rhuB/Mk3rohQG+vpAHodHzZlB2Gi1bHHdAIHCHr8yAQjNjDeNfzHXGdJ5RC
	mOtZ40XQ0QvTTVbUZUGy8ZyX0wjUxAhzJQoeq7+MVBk5uZbdLcRu+e2fHZKrnEU66KtO2zGrxQ+
	+d7Brc/vjs9XqhDA2KkwQkTY1rU41huJyc4soqDF1FDybeu9lnJOjlVUeIBkQpjlX42D9p1/mUB
	D4=
X-Received: by 2002:a05:600c:c165:b0:483:722c:a3d1 with SMTP id 5b1f17b1804b1-48378da52a1mr193686835e9.16.1771338216091;
        Tue, 17 Feb 2026 06:23:36 -0800 (PST)
Message-ID: <974f0b55-3ead-4892-92c0-707be1303834@gmail.com>
Date: Tue, 17 Feb 2026 15:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <06c3b8f88803039a3d900c8cb2f1fd9d05f44e3e.1770999383.git.oleksii.kurochko@gmail.com>
 <fd7c8adf-d8cf-482e-8c8b-55187ea6dabf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fd7c8adf-d8cf-482e-8c8b-55187ea6dabf@suse.com>
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
X-Rspamd-Queue-Id: C84E214D1DA
X-Rspamd-Action: no action


On 2/17/26 12:37 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
>> Some hypervisor CSRs expose optional functionality and may not implement
>> all architectural bits. Writing unsupported bits can either be ignored
>> or raise an exception depending on the platform.
>>
>> Detect the set of writable bits for selected hypervisor CSRs at boot and
>> store the resulting masks for later use. This allows safely programming
>> these CSRs during vCPU context switching and avoids relying on hardcoded
>> architectural assumptions.
>>
>> Note that csr_set() is used instead of csr_write() to write all ones to
>> the mask, as the CSRRS instruction, according to the RISC-V specification,
>> sets only those bits that are writable (note that the quote consider only
>> non-read-only CSRs as writing to read-only CSRs according to the spec.
>> will raise an exception):
>>      Any bit that is high in rs1 will cause the corresponding bit to be set
>>      in the CSR, if that CSR bit is writable.
>> In contrast, the CSRRW instruction does not take CSR bit writability into
>> account, which could lead to unintended side effects when writing all ones
>> to a CSR.
>>
>> Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
>> hstateen0 registers as only them are going to be used in the follow up
>> patch.
>>
>> If the Smstateen extension is not implemented, hstateen0 cannot be read
>> because the register is considered non-existent. Instructions that attempt
>> to access a CSR that is not implemented or not visible in the current mode
>> are reserved and will raise an illegal-instruction exception.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in V4:
>>   - Move csr_masks defintion to domain.c. Make it static as at the moment
>>     it is going to be used only in domain.c.
> Except that ...
>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -2,9 +2,14 @@
>>   
>>   #include <xen/init.h>
>>   #include <xen/mm.h>
>> +#include <xen/sections.h>
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/setup.h>
>> +
>> +struct csr_masks __ro_after_init csr_masks;
> ... it's not static here and even has ...
>
>> --- a/xen/arch/riscv/include/asm/setup.h
>> +++ b/xen/arch/riscv/include/asm/setup.h
>> @@ -5,6 +5,15 @@
>>   
>>   #include <xen/types.h>
>>   
>> +struct csr_masks {
>> +    register_t hedeleg;
>> +    register_t henvcfg;
>> +    register_t hideleg;
>> +    register_t hstateen0;
>> +};
>> +
>> +extern struct csr_masks csr_masks;
> ... a declaration here. If you want to keep it non-static, it (and the struct
> decl) likely wants moving elsewhere. Whereas if you truly want it to be static,
> the struct decl would want moving to domain.c as well.

Wrong patch version. I made it static so csr_masks declaration and struct csr_masks
were in domain.c. Also, init_csr_masks() was moved to domain.c too.

I will update the patch version next time.

>
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -70,6 +70,25 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>>       return fdt;
>>   }
>>   
>> +void __init init_csr_masks(void)
>> +{
>> +    register_t old;
> As indicated before, this would better be ...
>
>> +#define INIT_CSR_MASK(csr, field) do { \
>> +        old = csr_read(CSR_##csr); \
>> +        csr_set(CSR_##csr, ULONG_MAX); \
>> +        csr_masks.field = csr_read(CSR_##csr); \
>> +        csr_write(CSR_##csr, old); \
>> +} while (0)
> ... local to the scope the macro introduces. IOW with both this and the
> earlier remark, let's try to strive to have scope and exposure of variables
> as narrow as possible (unless of course there are clear reasons not to).
>
> And btw, wouldn't you again better use csr_swap() here?

It makes sense, I'll use csr_swap() instead of pair csr_read() and csr_write().

Thanks.

~ Oleksii


