Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHYYFvV5EGrdXwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:44:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FFD5B7175
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317039.1586332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQS2X-0001FQ-Jz; Fri, 22 May 2026 15:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317039.1586332; Fri, 22 May 2026 15:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQS2X-0001Cl-Gv; Fri, 22 May 2026 15:43:57 +0000
Received: by outflank-mailman (input) for mailman id 1317039;
 Fri, 22 May 2026 15:43:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQS2V-0001Cf-5u
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:43:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQS2U-0000aF-I5
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:43:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1079b3-2eae-0a2a0a5409dd-0a2a450bd3ae-2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:43:54 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1079ba-212f-0a2a450b0019-d1558032ad30-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:43:54 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso47678175e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:43:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490456274ebsm47360545e9.15.2026.05.22.08.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 08:43:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779464634; x=1780069434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQPAanHoCJ+rixRh6wLfOeEQLgRNPmkDycVKqJbat50=;
        b=fRqdEBbFUgUiSddwdkzLRRhi8In8MczK/lSUBjAPmhUHIEKAiMPfeycjS+P36XMYFd
         YCvVfKY8HCSVEKoz5FRsVoAHQKOFXY6nNyPf7Tn9he+5DVKDl5yMAeg+vvTNN3IYrm2L
         GxhslE9aM0QEB0zIomWoO6W1xC7mPjb59es1Emb7vAKyScvjufd+dSMGIbNpUcP226yY
         guVHR/8sQN7RhX8GYl/7FCapkjMOow+0DPYOBGlMpmzC9NDwzA6muKvV7J1vVaK2gav6
         4KUnL8l3bh7hoUPn/a2Srsrj3j7ayGH6PxqorocRmO2W1LMXmCnlosBvrQdYY6sc31RP
         J8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464634; x=1780069434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQPAanHoCJ+rixRh6wLfOeEQLgRNPmkDycVKqJbat50=;
        b=gurtTCLuhg0NUqmv8y0KAHS5mWjPPElN4kN3tskh8UY4SH2enpqrkXqbhiX7aWQM7d
         +lpCbrDsipoEb0WnQ25dq59bjqDnwbuy5nJNDx4TQ3YQTcZbDZx8yt+L49KTXa5KIE4A
         kmNvxvqVfV+Rezec9x0TJxNzDsvWM8GiOvH3uGcfFU4b2RhGB5Xja7RxKAe6lOln2x15
         TsR/NhQN2zb064l6DxMEp20nXkhSHyAz/MjQWMSU4wHrvI1axdpGRX1YS0Fy5hKebhFH
         GzKhNwbChsfHp60UtGJLiQEToYfE/QQs4cS6b5OXobvkb/v4yTOZYdr+6BIto90jFZXH
         Q53Q==
X-Forwarded-Encrypted: i=1; AFNElJ/YxkKOGltvu8AjQ4BLT8SK/q9XQc1m6raPHYIJoyRjM+aDymrMJFs4/6XHuyisegPsAevGnE2txz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx/vEkUQyhmlGWVHMtOIGd+bHkG/98duiE2EEJfTwZ0zbLb93A
	gaZVouAtYT/L6pYQg7Xy99Z/ygb+eBkr3cdazJGaRoI1QFKsUcWZCEbL
X-Gm-Gg: Acq92OFM5YoMqPNEgTDmYaQ7Bq/b3JGydRpffiC9k+9kjzhKfXSZ+ZjhNRXYDOgYZ2c
	FekQQ91grVdqUw/xPw3WAQVwAHND+5XFA1loVsiSxpn0DH/tYbV+akrfEC8DzIhNXtHyEykQFyT
	/Q5rGlWj/1b3xq92psPDCn9/7oyQLPPteaXToyza9T5kknz9s3qGWjxj7Wg1AN+iKa9kHE4TrSY
	2aZNDlO1MjiwvjrMxrexjtaBXTUvGdu2kYtnGEBIAXNHkY9936FMwvFgkXI/UJmmgWCi+JsoMFv
	sJWYz5LhOLGpAHCMPVpQoqkV/k1M8fpPXy/3pkolfrW2uzReDgtzJqzQ2a6NpW3DX91utmblW7O
	b3yHdDzJgVOcxHH064gpvtwW9uRb+e4dBN6ujLICW1I4zQmE0NE/NLMhTt3ABq3I0zXLlzeDmao
	LtLSQn5UDGj5RpjzalZ8D/2jEHTisgULGtYbeI8lpn8cHUDJH1/uXp1xA7PkVQMdREXTYd4ZvxP
	pU=
X-Received: by 2002:a05:600c:a101:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-490428c95abmr46215975e9.20.1779464633680;
        Fri, 22 May 2026 08:43:53 -0700 (PDT)
Message-ID: <1b9c082f-6eba-4b95-b056-fa6185c61b84@gmail.com>
Date: Fri, 22 May 2026 17:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/26] xen/riscv: add basic VGEIN management for AIA
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
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <61291bec7664e780f122ccf438091dfc1aba99e3.1778250616.git.oleksii.kurochko@gmail.com>
 <45fb6481-ea0e-455e-a0cc-c5ba0caabdf7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <45fb6481-ea0e-455e-a0cc-c5ba0caabdf7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779464634-1BB78F3B-EBE352F5/10/73395122804
X-purgate-type: spam
X-purgate-size: 5094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: C3FFD5B7175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 5:11 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -1,11 +1,33 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bitmap.h>
>> +#include <xen/cpu.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
>> +#include <xen/spinlock.h>
>>   #include <xen/types.h>
>> +#include <xen/xvmalloc.h>
>>   
>> +#include <asm/aia.h>
>>   #include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/current.h>
>> +
>> +struct vgein_ctrl {
>> +    unsigned long bmp;
>> +    spinlock_t lock;
>> +    struct vcpu **owners;
>> +    /* The least-significant bits are implemented first, apart from bit 0 */
>> +    unsigned int geilen;
>> +};
>> +
>> +/*
>> + * Bitmap for each physical cpus to detect which VS (guest)
>> + * interrupt file id was used.
>> + */
>> +static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
> 
> Why "Bitmap" in the comment?

Hmm, good question. Looks like rudiment from initial implementation.

I will rephrase it to:
/*
  * VGEIN control structure for each physical CPU to track which VS (guest)
  * interrupt file IDs are in use.
  */

>> +
>> +unsigned int vgein_assign(struct vcpu *v)
>> +{
>> +    unsigned int vgein_id;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>> +    unsigned long *bmp = &vgein->bmp;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +    /*
>> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
>> +     * external interrupt source is selected for VS-level external interrupts
>> +     * according to RISC-V priviliged spec:
>> +     *   Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
>> +     *
>> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
>> +     *   a guest external interrupt source for VS-level external interrupts.
>> +     *   VGEIN is a WLRL field that must be able to hold values between zero
>> +     *   and the maximum guest external interrupt number (known as GEILEN),
>> +     *   inclusive.
>> +     *   When VGEIN=0, no guest external interrupt source is selected for
>> +     *   VS-level external interrupts.
>> +     *
>> +     * So start to search from bit number 1.
>> +     */
>> +    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
>> +
>> +    if ( vgein_id > vgein->geilen )
>> +        vgein_id = 0;
>> +    else
>> +        __set_bit(vgein_id, bmp);
>> +
>> +    spin_unlock_irqrestore(&vgein->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
>> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
>> +           __func__, v, vgein_id, v->processor, *bmp);
> 
> %d vs unsigned int again (and then yet again further down).
> 
>> +#endif
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
> 
> Is this needed when vgein_release() also does it?

Considering how ->hstatus is initialized I agree that we don't need that 
here.

> 
>> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
>> +        MASK_INSR(vgein_id, HSTATUS_VGEIN);
>> +
>> +    return vgein_id;
>> +}
>> +
>> +void vgein_release(struct vcpu *v, unsigned int vgen_id)
>> +{
>> +    unsigned long flags;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>> +
>> +    if ( !vgen_id )
>> +        return;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +     __clear_bit(vgen_id, &vgein->bmp);
>> +    spin_unlock_irqrestore(&vgein->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
>> +    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
>> +           __func__, vgen_id, v->processor, vgein->bmp);
>> +#endif
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
>>   }
> 
> Overall: How is one to review these two functions, when it's entirely
> unclear where they're going to be called from? Among other aspects it
> doesn't become clear what the behavior is going to be when
> vgein_assign() doesn't find an available ID. I've therefore only
> commented on mechanical aspects I noticed.

It is used in "[PATCH v2 14/26] xen/riscv: add very early virtual APLIC 
(vAPLIC) initialization support" from this patch series. I realize that 
was not obvious, sorry for the omission.

That said, I am planning to move all AIA-related logic out of 
vcpu_vaplic_init() and into continue_new_vcpu(), because some 
IMSIC-related operations require knowing which physical CPU the vCPU 
will be scheduled on, and moving the work there avoids redundant 
recalculation. As a result, vgein_assign() would no longer be called 
from vcpu_vaplic_init(), so I could drop this patch from the series 
entirely and reintroduce it when it is actually needed.

Alternatively, I can keep the patch and extend the commit message to 
explain the intended call site and how the return value will be handled.

Thanks.

~ Oleksii




