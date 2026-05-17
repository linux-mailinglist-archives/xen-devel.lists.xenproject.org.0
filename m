Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Mi/GAD7CWpPvwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 19:29:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B55628AF
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 19:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311323.1581499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOfHo-0000hI-Mo; Sun, 17 May 2026 17:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311323.1581499; Sun, 17 May 2026 17:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOfHo-0000eR-I9; Sun, 17 May 2026 17:28:20 +0000
Received: by outflank-mailman (input) for mailman id 1311323;
 Sun, 17 May 2026 17:28:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wOfHm-0000e3-Ph
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 17:28:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOfHl-000Wbw-HZ
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 19:28:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09fa0e-bab6-0a2a0a5309dd-0a2a4508d522-38
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 19:28:17 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09fab0-63b5-0a2a45080019-d155a732ac14-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 19:28:17 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a8f9841616so1340385e87.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 10:28:17 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a9164bc12asm2792303e87.42.2026.05.17.10.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 10:28:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779038896; x=1779643696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0nZfOiwNgvR4Mbx8ZzVOWKx6v/Kdg4ziHaQGgZUnOE=;
        b=T4tp0G3oCiKTSMnP13gggPQJ7Xiy8H+TWxmRwpBWzLPZ62eknv5zOYH0FmSK8sL4jA
         Dj9cbhJV2EQR0nPXXs0TjpIsh6EvqLD8KEx+HYhZotzTC1BwymhUL9ic7pg6b9L/rqq/
         A5QeHKBWPT+MvfAnKVHoJVhZD2bRiHGuM16WWstjl5Dg4R9td35Nya3jZ43CyExx38u0
         vdjXkP9PubD/a3ROrxevZF9uHsUBigr6Kkv2uQMUbXeNDzhk87CvGeEsiPrM0oWuqWBA
         ysVgcNTIp3eQ2NgKnhsO6ZusTopTPFgUl+OdCzGKUz5gRAqZhNZwFIlqgatL0sTNAQzj
         WhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038896; x=1779643696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0nZfOiwNgvR4Mbx8ZzVOWKx6v/Kdg4ziHaQGgZUnOE=;
        b=mOChkLCTc/KpZZEsIUA0kgZLPCI3aj3Wc/vroms48GJmTP0IySP6x/zciHODgDlkpG
         caAt9M4405XKF9nK+5RxEYfGU1a7nUpy+qN+p4Rj5IW1AcJl794plaQQ0+GUFn1PRK/m
         SuquE38tKZHa2PMbnENxX5OmDIBbGc63qKocg48eZPNu57NWxL7tHhe4bwPV6MBXLwfn
         fAT9Aw1UNqH8dzxWzRUbf4sGjN3zTeQHeidPtEp2c0BmjGCnHPZEsn1SoTJcnndHUalY
         2JfA1Nk4sMtAwh7jY/GHDen1twwpd3Cdkqll0wk49PyCClrdc3KKj5xd61sJEYFKnJ0f
         W1zg==
X-Gm-Message-State: AOJu0Yw0chOMzkClMI+8zzwFsEMa4nREdLvCLIxHbqGOrLNGqs/1N2+p
	MXEFHgqUHGp/J0NvLcLcNF++tyXVj5cED6hX37LywNXKChj2at30IxWO
X-Gm-Gg: Acq92OF7TZKW7j/avk6wfz/SNh2BpgjNqASfN5UtHPa7JaI1XnSrtQzN0KpLNX3rkrA
	A59z2UaOd5AKoJXYYnN0m6cwC+F9exZLEmr7Cc8GUkNUGpY7kPlUpdKEbNfFtFSFY+eELalWtRi
	NQsEiWYG4bNH6cgoSCesdBhAYsGnFK9lNj8us4+6xSF9gf/Qyl0DegY9j7sI1Umf+nJi6ojonHd
	Q0EAxi+q51z2VReE3SmoVEQWk7gycHA2NGVB52XJ9yC2unHvApV4fBlPqaFVMmZJIbdP5Niumzc
	6nuJUo8q2NN/1U6WXJgrj3RH7BdyNtNP3qjKqpXFlVHY8uhViSsN4xebwPyaR6CUM+9MtEZvS6i
	nYk4Kb2q0+X+ItjKe2LghCuBq1HuLPOJMPT9PLIW2UDoo4z8RxtecbkdW0POttYSghxk/GLPq8X
	PeeqhWaNHp7JCPJ92JfYEDMqoy/XUXgp6YMgKZ
X-Received: by 2002:a05:6512:3d88:b0:5a4:1798:31ba with SMTP id 2adb3069b0e04-5aa0e7321e5mr4498476e87.21.1779038896127;
        Sun, 17 May 2026 10:28:16 -0700 (PDT)
Message-ID: <a99d4c20-446c-4c5c-b95c-8b317eb1a0c2@gmail.com>
Date: Sun, 17 May 2026 20:28:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <46bbc9e008a65dd86fb2b368e4751eb7d2014afa.1778605274.git.mykola_kvach@epam.com>
 <7254EEC1-315F-41EB-B623-5CACAD7255E9@arm.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <7254EEC1-315F-41EB-B623-5CACAD7255E9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779038897-B6975DB1-D2455346/0/0
X-purgate-type: clean
X-purgate-size: 3168
X-Rspamd-Queue-Id: BC0B55628AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[arm.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.938];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/14/26 20:20, Luca Fancellu wrote:
> Hi Mykola,

Hello Mykola and Luca

Mykola, I have no further comments on this patch, but I think Luca has 
raised a valid point. Once that is resolved (or clarified why no change 
is needed), feel free to add my:
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

see below

> 
>>
>> +#ifdef CONFIG_SYSTEM_SUSPEND
>> +/*
>> + * int prepare_resume_ctx(void)
>> + *
>> + * CPU context saved here will be restored on resume in hyp_resume function.
>> + * prepare_resume_ctx shall return a non-zero value. Upon restoring context
>> + * hyp_resume shall return value zero instead. From C code that invokes
>> + * prepare_resume_ctx, the return value is interpreted to determine whether
>> + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
>> + */
>> +FUNC(prepare_resume_ctx)
>> +        ldr   x0, =resume_cpu_context
>> +
>> +        /* Store callee-saved registers */
>> +        stp   x19, x20, [x0, #RESUME_CTX_X19]
>> +        stp   x21, x22, [x0, #RESUME_CTX_X21]
>> +        stp   x23, x24, [x0, #RESUME_CTX_X23]
>> +        stp   x25, x26, [x0, #RESUME_CTX_X25]
>> +        stp   x27, x28, [x0, #RESUME_CTX_X27]
>> +        stp   x29, lr, [x0, #RESUME_CTX_X29]
>> +
>> +        /* Store stack-pointer */
>> +        mov   x2, sp
>> +        str   x2, [x0, #RESUME_CTX_SP]
>> +
>> +        /* Store system control registers */
>> +        mrs   x2, VBAR_EL2
>> +        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
>> +        mrs   x2, VTCR_EL2
>> +        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
>> +        mrs   x2, VTTBR_EL2
>> +        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
>> +        mrs   x2, TPIDR_EL2
>> +        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
>> +        mrs   x2, MDCR_EL2
>> +        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
>> +        mrs   x2, HSTR_EL2
>> +        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
>> +        mrs   x2, CPTR_EL2
>> +        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
>> +        mrs   x2, HCR_EL2
>> +        str   x2, [x0, #RESUME_CTX_HCR_EL2]
> 
> Do you think we should save also CNTHCTL_EL2? Apologies it escaped my first review,
> but I see we program it in the boot cpu path + secondary cpu path: init_timer_interrupt().


Yes, CNTHCTL_EL2 is programmed by init_timer_interrupt() during the 
initialization of both boot and secondary CPUs. Whether it needs to be 
saved here depends on the resume path:

  - If the resume handler (after prepare_resume_ctx() returns 0) 
re-invokes timer initialization, it is already covered.
  - If not, CNTHCTL_EL2 should be added to struct resume_cpu_context and 
included in the save/restore assembly.

If I understand the current flow correctly:
  - Secondary CPUs wake up via hotplug, so they execute 
start_secondary()->init_timer_interrupt() and configure CNTHCTL_EL2.
  - The boot CPU wakes up via hyp_resume() and jumps straight back to C 
code, which appears to bypass init_timer_interrupt() call. At least I 
have not spotted where system_suspend() would re-invoke it.


> 
> The rest looks ok.
> 
> Cheers,
> Luca
> 
> 


