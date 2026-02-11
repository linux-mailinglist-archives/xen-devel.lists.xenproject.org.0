Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOP4N6KnjGnVrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:00:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220D125E99
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227885.1534278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCdH-0004b7-Aa; Wed, 11 Feb 2026 16:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227885.1534278; Wed, 11 Feb 2026 16:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCdH-0004Xp-7l; Wed, 11 Feb 2026 16:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1227885;
 Wed, 11 Feb 2026 16:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqCdF-0003uS-Lv
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:00:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a0f76a-0762-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 16:59:59 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43626796202so1851359f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:59:59 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d50f3asm5866202f8f.13.2026.02.11.07.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:59:58 -0800 (PST)
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
X-Inumbo-ID: b7a0f76a-0762-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770825599; x=1771430399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6i4aEP8+oXo63rtwPUnZ7BTesp7/vMVe/CIdHqtLl4=;
        b=CHggza3Gn41KIlXj3Ze4ShCsM6E20DyJ9mNhKNHYvFOzAp/9GiYropBNpz5S3meK89
         IM2HurvKoqBbfcNc0hD0A6qit2f337QXPlInEtsyQN2sGfYKjKeTC3UmTYPB87RGBajX
         5yV8pmMwSctTVLN1SRcKCLNvkHCdzZU4bD/4Q2JObhPFHU2o4+hvRDX0X+tO+D6mYKpe
         LvLqtDoJYTOvIHkr1jPDjHv5P9zSDS4H1q12lJLaVdhaWv8XI9ZL+bM+ogto2gh0gbgk
         5K1lEQlSLnaQKjwmwWy+0SlhbhusRN+HMS5wHdRmgKqpssjy716a3g1mGoq5y2seI+mI
         6I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825599; x=1771430399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6i4aEP8+oXo63rtwPUnZ7BTesp7/vMVe/CIdHqtLl4=;
        b=oYSX74nGJ7TCcjnEUBwgTf97MaSU2VyHcwWoZl+5PXgvfYdiLEeETnARuYtqPWieb/
         wG6xBG3GDDn5kYG15jkNfjLM5WzFzbG17nvMZsW7UGgVTY5YYqA1CtCBPI7Ux2Umu9E0
         klhsoW9SFRuKKlMR2etwANOT6Xkrv+RnVfsiZZMgRF3SHJjWt69wx2TD9ZYC4wNMn0+C
         i79cBuB0anX5eFSoFukZEQyvijlIfrdm0vQ4iZuiRtOTj2a4EVh+l7SDkM6bfjjcNcI/
         UjCpla3yTdPUV7s3viDmbwaPqAVH2Agm4XOnc1bdi4++1nUvZoV4oTOD9Nn9l04oxjq+
         dCHw==
X-Forwarded-Encrypted: i=1; AJvYcCVDIEPvnmnalJk1dzZzeTOLS+OZWBxlxwiOiypl8u3wuzlp3yu6YFHYG8AYskw/W1/iYRaRZSoKOB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztu0DuXsXn8mrNpdMkzi1tO2si93S6l6erm8FBKhfaMOEPRI7P
	9v1K1RHAQhUPJ+ABiLfrsH3gSiumKf0Pptnrs9lTg9t48322x8BhrJRZ
X-Gm-Gg: AZuq6aIfuvHdn4Ys7hwiVmpWT+NAnl8kpfCX6OF3lRiUtklOzYrMNXDIE465LVWo2wW
	WzhjGgXnfHMctLpBY0+4Rk/6OD1b97gmFUReXfB/FcoCP7+f2Y6OR2IzwI159i1NXeUnsjIWuiQ
	MgHvxeJ9HI7ChAAvs9J4t3/OQyOD7Ib1zNjlUJxWprhbpQK+09cAYosrOQh42+IUC26FB20LNpP
	G7H5D3chS/+vWL5egwS4xScrI3E5yuLMkCZUpxyJrViCBB10HXqvzp5QtJqeO135MT6AcppWlva
	4P2I+X/7X3xuoxv4DdP2axWoBHnLZVle6q4UOzCW7isVJf4n3uu45/1CYsDuAKlwdoTQxKoCIxi
	ERg8YUCO8AzaMOEwHbNT/rJYUtScpT0+NLXCtWgxofIxYuCZN5iIguayYs3QdGERYkLTKlj5jFw
	J0N1hrcbsBMMrqDboGgmhcIZQHv18mVWASIXaV3+M2zyPC577knDbC3XmBypHVlU9i1TKPU4Av5
	14=
X-Received: by 2002:a05:6000:2408:b0:434:2569:275d with SMTP id ffacd0b85a97d-43629237803mr31846208f8f.26.1770825598761;
        Wed, 11 Feb 2026 07:59:58 -0800 (PST)
Message-ID: <af062ca5-ff11-4a09-8602-b6d073663886@gmail.com>
Date: Wed, 11 Feb 2026 16:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 2
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
 <a81d2873c901c825a08f817d962a8cef09167447.1770650552.git.oleksii.kurochko@gmail.com>
 <2f50ee9a-b2f3-4e33-a2a9-fbf066e93f8d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2f50ee9a-b2f3-4e33-a2a9-fbf066e93f8d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
X-Rspamd-Queue-Id: 5220D125E99
X-Rspamd-Action: no action


On 2/11/26 3:26 PM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> This patch is based on Linux kernel 6.16.0.
>>
>> Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
>> interrupt tracking introduced in part 1 (for producers). According, to the
>> design only one consumer is possible, and it is vCPU itself.
>> vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
>> to the lack of functionality) before the hypervisor returns control to the
>> guest.
>>
>> Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
>> irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
>> release semantics).
> Where the release part isn't relevant here, aiui.

Yes, only acquire part is relevant here. release mentioned here as xchg use .aqrl
prefix.


>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -194,3 +194,36 @@ void vcpu_sync_interrupts(struct vcpu *v)
>>   #   error "Update v->arch.vsieh"
>>   #endif
>>   }
>> +
>> +static void vcpu_update_hvip(const struct vcpu *v)
>> +{
>> +    csr_write(CSR_HVIP, v->arch.hvip);
>> +}
>> +
>> +void vcpu_flush_interrupts(struct vcpu *v)
>> +{
>> +    register_t *hvip = &v->arch.hvip;
> Why not in the if()'s scope, when it's used only there?

Missed that during vcpu_update_hvip() inside if().

>
>> +    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>> +    {
>> +        unsigned long mask, val;
>> +
>> +        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>> +        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
> Make these the initializers of the variables?

Good point. I will do that.

>
>> +        *hvip &= ~mask;
>> +        *hvip |= val;
>> +
>> +        /*
>> +         * Flush AIA high interrupts.
>> +         *
>> +         * It is necessary to do only for CONFIG_RISCV_32 which isn't
>> +         * supported now.
>> +         */
>> +#ifdef CONFIG_RISCV_32
>> +        #   error "Update v->arch.hviph"
> Ehem. I really dislike having to give the same comment over and over again.
> Please have the # of a pre-processor directive always in the first column.
>
> Also, isn't this misplaced? The containing if() checks irqs_pending_mask[0],
> yet aiui irqs_pending_mask[1] would be of interest for hviph?

Agree, it would be more correct to have outside if().

>
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -172,6 +172,8 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>   static void check_for_pcpu_work(void)
>>   {
>>       vcpu_sync_interrupts(current);
>> +
>> +    vcpu_flush_interrupts(current);
>>   }
> Ah, okay - here comes a 2nd call from this function. However, please latch
> current into a local variable (already in the earlier patch perhaps); no
> need to fetch it from per-CPU data twice (or yet more times, if further
> stuff was going to appear here).

It makes sense. Ill do that.

Thanks.

~ Oleksii


