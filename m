Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Q3DC/L+OGqVlAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 11:22:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDD6AE2B8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 11:22:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PgWWWLr3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1343572.1602846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbarg-0005Ub-DC; Mon, 22 Jun 2026 09:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343572.1602846; Mon, 22 Jun 2026 09:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbarg-0005SJ-AP; Mon, 22 Jun 2026 09:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1343572;
 Mon, 22 Jun 2026 09:22:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbarf-0005SD-CS
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 09:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbare-005NDf-HO
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:22:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a38fee4-bab6-0a2a0a5309dd-0a2a450aa3f4-6
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 11:22:46 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a38fee6-93a5-0a2a450a0019-d1558036b057-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 11:22:46 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49249707788so12687765e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 02:22:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466667881bfsm26027436f8f.22.2026.06.22.02.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 02:22:45 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782120166; x=1782724966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHGCuTHM3Fo15rGbCF3+1Wj282H0ITaQjvEE1XjYawM=;
        b=PgWWWLr39wz4qdoUrp0BJpLFKBK5VWMxQaNZI2bTqroWQwDKGb0HHnXsIOrdBfiV7O
         FJooLqFWaoiBVX++/+yVT/mfF1mai9EkqGc7Z9Cc79XIpeQLBoNRkExhqL5pa9MDeWWl
         CJMVBgCzJzT5z74cbv6et6wiqirC7XNJ9mw5GKl/sehmeeLm8MXBVnpDwLl2OQV6BIXV
         nSovHzFlMEFOx5s/CzQhrTI2pPpYyVeJM+jvbu/rf3BRP3gmm+JDGHhwJI4ZVmunYP72
         y6PMlHLkjMUEXgvbBQxgCXeFZ/cI/+hT3kj0EmBk1FF2lpRTMvYZBl+CSpLx81LvjmhL
         7ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120166; x=1782724966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHGCuTHM3Fo15rGbCF3+1Wj282H0ITaQjvEE1XjYawM=;
        b=FtYd7JtU2cbqwHeQUJv30LIhtGurtRrUpuvRgvYVeSq4bfxtUZDLKg93jI4Uz98ztS
         d83t5szlj3p96i+mTCt/RmkDwdWRtjMnsYX3tHfnjIuiB6x55V63+JsPz9YHV5Qv6Qqo
         nTkHi06m5bfR72mWJnW9BJNQhNJyQBdof20WmY+6LvpL07V9ypPGUOnkHJ9iavt/RLnF
         gLwysLUAQ++6Q/g+WbDNICNKDJvh/2SUXDoW0zJ8+L25GSGTZTP+PJyKyajsJpszOuIw
         ak8zdRQAL4AAgmA96VDw66ZaYRs8h/Kj1ul5Oy1Okitf3JaXkleMNAUahZejKMQStdIJ
         LT2g==
X-Forwarded-Encrypted: i=1; AFNElJ+JzrpniBLEFMljg0uThXevrDul9YZFbuySY//IAucj+3deAupKz1I8f0o79l5gXSebzqMZGBXFqck=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+BgmMaOH2XiD67vavVsJZcDpMmOKcJMfbc3ZhwIeDVaa0qU3U
	6NB886MdVl3CCoZNXpQ7R3gP/NmAdnBs8gI5K24/ZPebTFkHbqTaVtlv
X-Gm-Gg: AfdE7cliaO8hIi2ZYlzu8Gj3J8aanPmWup2Hzo8NfziEPt/SwXkZ3+bpQu5SubaGLoD
	Rp7GijHv3kIKwYu9oKJQd0Wqw93MMl2o+WhWSq2H6ONvrs91ueJ4LRQ57+E7BuE4Du1nrYSH53R
	roAsJZl2YHI7BQ4Ah+2ulTFi2fsob7QxkhNECP51z8OTuZqCok4387tcl3IiFwQOGZDIxclnRkJ
	m+b1dChDeo+SEnAWlwsggpnfzMUKBngdaWsWO9+xFqirNVcSURIRyh6A7zNzc6QswHoenYhRuCR
	MEPVEpaCeQC6uNgKyUtowyCEiH96m9mHjlkLSZBkb9N7BIMwnEN/0eXSAMaWLL97jWfpyhh0SNj
	EXYRuqPKbksOMWFvGJpmGdgKYqQ1AjBSRfQo7GpNI1+kQtxeF8CaqofiD21wtXLR9Kfs5614E1G
	Xf2YLTDbzYfHW05rkVxC3XpdM0/mkimSyvWdvAxgu4v5Ul1+G9iOTgq8OHEC22hbNWJHQuv74B7
	+M4gw==
X-Received: by 2002:a05:600c:6288:b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-492490a7778mr135296925e9.19.1782120165813;
        Mon, 22 Jun 2026 02:22:45 -0700 (PDT)
Message-ID: <e1eb2d3e-589a-475c-9982-0fa1d69e0f4b@gmail.com>
Date: Mon, 22 Jun 2026 11:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] xen/arm: mask debug exceptions in initial
 AArch64 guest state
To: Mykola Kvach <xakep.amatop@gmail.com>, Julien Grall <julien@xen.org>
Cc: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <74e132a5f3dff64be5bd0c04eb82fe78d9c2fe84.1781892316.git.mykola_kvach@epam.com>
 <3c6fe373-8840-4943-abaf-7e7ed13870e2@xen.org>
 <CAGeoDV9c8Mv9vQiqa0TCubZ2VTD=r5ewbZZxwZTbVHh=ubcsUw@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV9c8Mv9vQiqa0TCubZ2VTD=r5ewbZZxwZTbVHh=ubcsUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782120166-B19F2DB8-AC38DB04/10/73395122804
X-purgate-type: spam
X-purgate-size: 1717
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:julien@xen.org,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,xen.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88CDD6AE2B8

Hello Mykola and Julien,

On 6/21/26 4:30 PM, Mykola Kvach wrote:
> Hi Julien,
> 
> Thanks for the review.
> 
> On Sat, Jun 20, 2026 at 12:07 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Mykola,
>>
>> On 19/06/2026 19:37, Mykola Kvach wrote:
>>> PSR_GUEST64_INIT currently masks SError, IRQ and FIQ, but leaves debug
>>> exceptions unmasked. Both the AArch64 Linux boot protocol and PSCI entry
>>> requirements expect PSTATE.DAIF to be masked.
>>>
>>> Add PSR_DBG_MASK to PSR_GUEST64_INIT. This fixes the initial AArch64 guest
>>> entry state as well as virtual PSCI CPU_ON and SYSTEM_SUSPEND resume entry.
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>
>> Reviewed-by: Julien Grall <julien@xen.org>
>>
>> Regarding Xen 4.22, I understand and agree this is technically against
>> the specification. However, AFAIR, we don't expose debug registers to
>> the guest. So there should be no impact.
>>
>> The slight risk with this patch is OS that may have started to rely on
>> Xen behavior (hopefully not here, but I know we had a couple of cases
>> with the timer for instance...).
>>
>> This has been present forever. So unless there is a real issue, I am
>> tempted to suggest to wait until the release is out and backport after.
>>
>> I will leave Oleksii the final decision.
> 
> I agree with your assessment. I am fine with deferring this until after the
> release unless Oleksii decides otherwise.
> 
> The patch is not fixing any known issue and was only intended to align the
> guest entry state with the documented requirements.
If it isn't fixing any known issue then lets defer this patch until 4.22 
will be released.

Thanks.

~ Oleksii

