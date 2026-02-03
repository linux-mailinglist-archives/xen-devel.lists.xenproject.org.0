Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Kw6A8EogmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:56:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C1CDC5C2
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219462.1528345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJhL-0008MA-Ay; Tue, 03 Feb 2026 16:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219462.1528345; Tue, 03 Feb 2026 16:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJhL-0008KR-8A; Tue, 03 Feb 2026 16:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1219462;
 Tue, 03 Feb 2026 16:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAHx=AH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnJhK-0008KJ-3K
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:56:18 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 415a91d8-0121-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 17:56:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso58860425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:56:16 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830eadcdb5sm1594045e9.7.2026.02.03.08.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:56:15 -0800 (PST)
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
X-Inumbo-ID: 415a91d8-0121-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137776; x=1770742576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYwl1e7OMjPmUt30RmtQlnGXKWndyXxF9JyZw3T9FoU=;
        b=Y5nrhEhK0mGFZ1mmI03Vmdd3COfTqMaIpfokfDi+sEhrp6AB9JrASUuFpufzQWqGuN
         FoTjYYO4XXmi867azh2LyZ6pAid0mWRqsQgESTYoJqEPG3X/74tyUDjirtadlbhrVjyF
         Ys9fQ6iqv+d/iKepqGW7m9ppeg25+K3dHjnK2ggPAC92IJ7Kpm8sUqnwunWX6lvomLNS
         1jIulwTFUqBwzKaFVfPdbVWc7WurYdclrnOmfL3WB9Oyo+rtN6D2NySt6GLHWb38a6m+
         ILK3A2lK0H8XxPwhh4MONW0Xbl7DKIKeIpYleD60XDqJLj0JJK7fP5o0pAkAPgz+FLIS
         tlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137776; x=1770742576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYwl1e7OMjPmUt30RmtQlnGXKWndyXxF9JyZw3T9FoU=;
        b=g2aq7lllc11ivXvWgyJ/Joq3JYVK0zmuMVALf6jF89Ne6mbwKhPQtlg/sUffoaK6cy
         NC4ujygzh89uT+Jeu30t6/cbiSWPAKQMw07FDRDwWxR+Ogh6LMhQ/H2RgeaZVNAxDOaC
         Hgb8BmbNSUNVHR6snIbqHQ/aSL1RRtwL5O1YA9S+t/CTTJBdco0SDuAXc0BF5IpAFvJa
         bNyC2hd/G57CpHccvccergdAiuN40kQky3FLtJNrbDpFvdXY4NpJtdfBAxRbzw3K0TF/
         NMmhOfcTxJjiH786UsVuC02BKtNzU8+h4uDjmSsyzLVijL3D8Sk/Q/qDTN+7ErVtkiNM
         T3fA==
X-Forwarded-Encrypted: i=1; AJvYcCViVkxHv7j9gKKaHR3kge+ldK5ncob8PgL24P6Lj4zsWH94Vc3X0PV+KiJ1zDwDBsJr1+PI89TSzGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+s3udl3sOqcGFspB9wBk0aHNCeArWnqbrksyiy69fcfgrYeYX
	hvbD+5prc3B1cEjiy4QGN4VZGH4QYi0sEMpi1pRUhVwqR4uAWFZ82Kbn
X-Gm-Gg: AZuq6aIBsk0cz2hbDNcuY8THYKfDCcntZE4C6UopQcZmquwYxLrtzI7bqC4s1UG1Vxn
	xlJjiOMc3IgFZOnTJ3QlrpXH59i8MPG+ASh8yzk0Uf5PhubWyKsr9G5y/yku0uGDZWQRubnQCbg
	9srXb4ImmceNbuBOyg8j/vtFENGLMtwlR5O7NjeNlvTe3KUr12MCS9g44Q8qhlfe4kfLztAI9HQ
	wk3o0Q8hA3+92r4V5uxRl3qfw6A3aBrGm9LRbpn9mg+bzu2gJKKveoAlBJ+iYi5NDmlW9URoG9w
	qvSMF915UPhQDNDtnixYOsCcLvqBaUsi2yxaIdakBQ2hqlBPa+u2C9bDZ4cpR5sVOV8J0DvC9Cd
	aLak46cp56Mwo9lMVbcg4L0CBPQu0k8tZY7KZ9JbMefes80GoyqFr+orJj4TWOYTpvHIw8vymTv
	gvH5++9waYK3WrG7PsHIdLObBFHniJJLnd8/hIHvcGS6lozqr9ocIqqs0vQP/uM/g=
X-Received: by 2002:a05:600c:1e02:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4830e986031mr3373165e9.29.1770137776124;
        Tue, 03 Feb 2026 08:56:16 -0800 (PST)
Message-ID: <52a25a0a-ca3a-40b7-abdf-da969ede147b@gmail.com>
Date: Tue, 3 Feb 2026 17:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: add vtimer context switch helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <fb6be3d3f576f7b362af69e57d2dfd1da3554439.1769099885.git.oleksii.kurochko@gmail.com>
 <cce29bc5-ae3c-452b-a373-d76323d5f062@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cce29bc5-ae3c-452b-a373-d76323d5f062@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 51C1CDC5C2
X-Rspamd-Action: no action


On 2/3/26 5:43 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> Introduce vtimer_ctx_switch_from() and vtimer_ctx_switch_to() to handle
>> virtual timer state across vCPU context switches.
>>
>> At present, vtimer_ctx_switch_from() is a no-op because the RISC-V SSTC
>> extension, which provides a virtualization-aware timer, is not yet
>> supported. Xen therefore relies the virtual (SBI-based) timer.
>>
>> The virtual timer uses Xen's internal timer infrastructure and must be
>> associated with the pCPU on which the vCPU is currently running so that
>> timer events can be delivered efficiently. As a result, vtimer_ctx_switch_to()
>> migrates the timer to the target pCPU when a vCPU is scheduled in.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> However, ...
>
>> --- a/xen/arch/riscv/include/asm/vtimer.h
>> +++ b/xen/arch/riscv/include/asm/vtimer.h
>> @@ -17,4 +17,7 @@ void vcpu_timer_destroy(struct vcpu *v);
>>   
>>   void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
>>   
>> +void vtimer_ctx_switch_from(struct vcpu *p);
>> +void vtimer_ctx_switch_to(struct vcpu *n);
> ... may I ask that you reconsider naming here? Both Arm and x86 have functions
> where the prefix / infix is "ctxt", not just "ctx". Being able to find all by
> grep-ing for e.g. ctxt_switch_from might be quite nice.

Sure, I will do that, it makes sense.

~ Oleksii


