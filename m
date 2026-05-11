Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIypELr/AWppnAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 18:11:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A686A511DB4
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 18:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306319.1578349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMTE2-0002LL-Dx; Mon, 11 May 2026 16:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306319.1578349; Mon, 11 May 2026 16:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMTE2-0002Jn-Au; Mon, 11 May 2026 16:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1306319;
 Mon, 11 May 2026 16:11:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wMTE0-0002Jf-VY
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 16:11:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMTE0-006ykw-1o
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 18:11:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a01ff99-bab6-0a2a0a5309dd-0a2a4504e8f0-28
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 18:11:20 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a01ffa7-1dec-0a2a45040019-d155a730dd6d-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 18:11:19 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a8cb92f26aso1217441e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:11:19 -0700 (PDT)
Received: from [10.17.80.122] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a956606fsm2729763e87.60.2026.05.11.09.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 09:11:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778515879; x=1779120679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sls1bHMvWLGjROEhjj794p0jW0oEgupA7PELvWg6QEo=;
        b=E7+Ldo0P8dunEG3fGto7rH9E4gvzoctBQMNXNPNK/9gDSRrqM9qUHU1Z67kRuZNECF
         5yOHCa3RU4VNG5F2uW/Sbs5oreVx/zMReAF1J/XKK0SSzvbZivtO45iNXkQlDmlo2GNj
         EMFMev5c2GLlGlo3C3jNrEq+s4tMGXERKNynCROeRLs4XKNK72/zM5uoeqKi5y8VPEgD
         MhreLSw9p4JZAqJ5+zagvNRaaOezyOOdJOqe1/xKge3MOhWa3/QIVG85p4PCresFLk2U
         hr99TSKRSi2BYBP5QtNY6NDgK+c+kWLIj/hAjq00TQqDf2Ybh7OB3CFzNVFyG0Xb/Suc
         ArGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515879; x=1779120679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sls1bHMvWLGjROEhjj794p0jW0oEgupA7PELvWg6QEo=;
        b=A0FAAzYs+s9QlIXuynN0+syA1dAKRHCP6orEqZEzQ6Vm++FFYXaUUoa2UlIx2TYTGG
         x641wWWGYmNk4i2BRtcddkYSJZCTcPlgPSnOyG36YWe1zAfhZb5hYsBfYUZxx6eF9dBs
         4/3EcqlERcqXwLwlATXfS0VKmNBF1TD2tFsiVpkxVlwLCRQK0N4vVlmJOrNl0DrvQofL
         akVezXWJogL/YQBpOIPaGRxEtKjBCMGRZZ62uuZZGxdRdg/ev/2l9pqjjZ/oW/hXnq4u
         +wxUKRg8YcsRXJ1ZU5YAfmhy2xcLQP5WEzJgv3xNDQm8ck3cuWjmAH0Yu5lElTl/v8TE
         Xw5g==
X-Forwarded-Encrypted: i=1; AFNElJ/Cm7jE1fNW1seFIlOAjPzlQVVYHB/FcXbRdPx5HaXouvBl9RhFv4IMrwgz6jZXz+sV7SS+UqY6HvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMTqjl5sopHId+c7Zkge/bCSfmDdVF2lkJynRw83T+HIv9yo5S
	NDS/e+N0JnAK7hcCIw6pJ4pDhyKw9ojygxEECfHg4mSA9yJ13Hx/c4aq
X-Gm-Gg: Acq92OEVLaJjUUDyrvr9ksrl2GCCgkb7Pl6mF/mrZNts+O9MvYcj8XvRanTrRaQgv5A
	6fEd+EgwI2P4O4Uyj9jjqlEtS8k7HlfN4ZZbH1aXIEh5ZqzS/hErbHw6/U2Nv0A83XPVLIItI+O
	97dFJAsLpiVZsG2OqlZh1xVdhISlqyaWah+6pE1amzzDj5IW5Cwyh04VSihH3pfb3dAZEP71VzV
	rLFlSJK33PJGx20GsdLhed29AZwJe+bZxsjkf/fUP7OBu9uzHIrQEqk7/CDF/QIqz7WIpv4qAm4
	BM8x7+NKeGujfSTUxZI4yfNpwmT9T6hEV5JajJanwIS271DQVmp12yKj3vY1nJD50XGpoGvESPy
	pue9yj/m1J/gsTXYCyhRK9bZr7wZaSDr7wRfZTK+ChsO4lbIAZbE4uSGaFAhFm3pUZKi0jcnC8l
	rlYhCgAaRLUjSwUysqF0bSiXGhQuWKJnJjgenJcc7H0gjAOf0iSCe+x1Y=
X-Received: by 2002:a05:6512:3188:b0:5a3:f2ed:87cd with SMTP id 2adb3069b0e04-5a887adfccemr9511589e87.10.1778515878947;
        Mon, 11 May 2026 09:11:18 -0700 (PDT)
Message-ID: <aa86b867-417c-4dbb-a5ac-aea9910369ce@gmail.com>
Date: Mon, 11 May 2026 19:11:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
To: Mykola Kvach <xakep.amatop@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
 <873402ub63.fsf@epam.com>
 <CAGeoDV8KppmniGEtRzCeHMLuVdXD-2bRXa_CeOPh8P9xPjiCTg@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV8KppmniGEtRzCeHMLuVdXD-2bRXa_CeOPh8P9xPjiCTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778515879-42F653FF-4178308E/0/0
X-purgate-type: clean
X-purgate-size: 2925
X-Rspamd-Queue-Id: A686A511DB4
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/8/26 23:59, Mykola Kvach wrote:

Hello Mykola

> Hi Volodymyr,
> 
> Thank you for the feedback.
> 
> On Fri, May 8, 2026 at 1:06 AM Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com> wrote:
>>
>> Hi Mykola,
>>
>> Mykola Kvach <xakep.amatop@gmail.com> writes:
>>
>>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>>
>>> The MMU must be enabled during the resume path before restoring context,
>>> as virtual addresses are used to access the saved context data.
>>>
>>
>> I agree with Luca, this patch does not makes sense as is. I don't see
>> why it should be separated from the rest of the resume path that is
>> added in the next patch
> 
> Ack. I'll combine this with the next patch in v9.
> 
> Best regards,
> Mykola
> 
>>
>>> This patch adds MMU setup during resume by reusing the existing
>>> enable_secondary_cpu_mm function, which enables data cache and the MMU.
>>> Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
>>> to init_ttbr (page tables used at runtime).
>>>
>>> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>>> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in v7:
>>> - no functional changes, just moved commit
>>> ---
>>>   xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 72c7b24498..596e960152 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -561,6 +561,30 @@ END(efi_xen_start)
>>>
>>>   #endif /* CONFIG_ARM_EFI */
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +FUNC(hyp_resume)
>>> +        /* Initialize the UART if earlyprintk has been enabled. */
>>> +#ifdef CONFIG_EARLY_PRINTK
>>> +        bl    init_uart
>>> +#endif
>>> +        PRINT_ID("- Xen resuming -\r\n")
>>> +
>>> +        bl    check_cpu_mode
>>> +        bl    cpu_init
>>> +
>>> +        ldr   x0, =start
>>> +        adr   x20, start             /* x20 := paddr (start) */
>>> +        sub   x20, x20, x0           /* x20 := phys-offset */
>>> +        ldr   lr, =mmu_resumed
>>> +        b     enable_secondary_cpu_mm
>>> +
>>> +mmu_resumed:
>>> +        b .

I also think this patch would be better squashed with the next one, as 
they are tightly coupled.

During the review of patch 11, I had to switch between patches 10 and 11 
several times to understand the full context—patch 10 sets up hyp_resume 
with a placeholder (b .), and patch 11 immediately fills in the actual 
context restore.


>>> +END(hyp_resume)
>>> +
>>> +#endif /* CONFIG_SYSTEM_SUSPEND */
>>> +
>>>   /*
>>>    * Local variables:
>>>    * mode: ASM
>>
>> --
>> WBR, Volodymyr
> 


