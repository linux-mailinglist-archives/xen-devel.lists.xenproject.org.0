Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gFE9N39BNWoQqQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:17:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391796A606B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PmMLwtSB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342319.1602560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZ6F-0002IR-1D; Fri, 19 Jun 2026 13:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342319.1602560; Fri, 19 Jun 2026 13:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZ6E-0002Fe-UR; Fri, 19 Jun 2026 13:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1342319;
 Fri, 19 Jun 2026 13:17:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1waZ6D-0002EH-JZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:17:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waZ6D-001G53-0R
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:17:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a354155-bab6-0a2a0a5309dd-0a2a45049732-48
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:17:32 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a35416c-5f9f-0a2a45040019-d155dd30e441-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:17:32 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso1530860f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:17:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc429a1sm7834093f8f.30.2026.06.19.06.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 06:17:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781875052; x=1782479852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btEfb8vfetbnAZC2sOM7Pkpu8f2YVh0fdWWVei8ika8=;
        b=PmMLwtSBpOvEZDlw9XdwSurVweLTo6LAdp4Glm0a9u72kUAkLeEp5q2EbKSoKVJsnK
         b0pjxAGVlkg+ZkatLSexx6ol6wRfugagHaFkTivspsfr9akUEFI9J+SXTao58K0qmPsV
         SrOOZcbkjoNndCUp6fSD8tXX8PziB/KMua1MD97muo0Vw79hb4fhGptJmD+FGoI9JLdt
         0ex0muPC4nBEPLaNHFVLABc04qDVTxYfMNPxZOzNDwzgIqS/inTbtM397e8ml5ys87Nz
         xxqo2dS/vuHsS6UkubbhdHFNp+GpT6jNsBpGoMYljwWiGUZinA+M00DQE3VWO8itGunq
         2UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875052; x=1782479852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btEfb8vfetbnAZC2sOM7Pkpu8f2YVh0fdWWVei8ika8=;
        b=qt5CdlHCINg8LzT0F3FXZzZ0IDVMO1EFtQA0Hc7TuWnvguyBz2S68FofBWJwlBIQMc
         WXT11tGgz5wvpz8zYsi13tTPsT5Xgr7pf6v9JuKRCO+PfbMADTPlHD1nIkJT7mxnlFPs
         Dhq1cvgI99fLHHbsXiKopX9KXt9MxCxhvtxlekS1DjjS2A/uFF/DTbGJa1dzVfo3lFb1
         kHkuIReMdaHE2agzyIx8ERtA82S6VqUWfHV7KFJcaPstNnFio5Mc2DhRcwf3gqdAZdsE
         VNueZS2aj5J/z4Mfhnk71lsLqqIWmUZoYM6UviyrHwtwF1dwOyLoJV87ALimbPCDHi/3
         ou1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kWKVvSJEIqbAPo+UGQIn/lVckDi/OkK5hRBUik4sEK5f2fFItOhMvJxrdPA4SWhoCRNy50kue1CU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFYX5WOhLPaGAL22PcIPME+5NthKjL8poFlW5JIIiVEWtgf3W+
	sGLGnnLOeVIJOqJL8d/opzOZwa5uwEajml/aVE8auGXQ/DqhHmVgk4+5Vd9UyQ==
X-Gm-Gg: AfdE7cmja5SGNG8jtgNpbVoc0p12GjmJU1QaWT1UXbNszUAnkJJiV+nJiFo9ajPTdTq
	5sf2uClAKDVCrUEfzYES7632BP5iElNc3xQUGo26zNIQuh6j0dVK1UYMRhduLp7q9HmlefgZKac
	sfiUu6EAwdnUi9JB0zXko29kwF+hPM5n7bUT4A5E2BzF3MCe3ZJljYY9ocudHINbjfFiCGs+4k8
	dW+PdtqtnsxoJTCtc2Y62glcRof/+zx1EyqTyWRqsIZS9ShscQNlO8BsXt7kHS6rIuL0tDfSs/D
	RXC/XHmrA1fSh9ktEkI1ly349aFYA/xd+a96uf35K/P8Y8U5EEejylqnNEGCiOq/T3HDgICsIPX
	f97jSxrLje3kJiQ6Y5GnP5EBNrW2pIeSfut5hAUGRn1UTertCKKzUOTGNLB3vjtfRI7Rz3lWyrz
	O7SQdf1W2zEnZgtzUHBjS6MzsB6DWIU9rDCESOvIT748Pn9M4OMhcfjp/o6DDNcmeSqznnNuoph
	DwiTg==
X-Received: by 2002:a5d:4b51:0:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-465077bfbe4mr4644374f8f.11.1781875052040;
        Fri, 19 Jun 2026 06:17:32 -0700 (PDT)
Message-ID: <6f154afa-38b0-4193-be42-585f4ce72fc8@gmail.com>
Date: Fri, 19 Jun 2026 15:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Mykola Kvach
 <xakep.amatop@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
 <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
 <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
 <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781875052-9D5CC141-7D91473E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1373
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:michal.orzel@amd.com,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,epam.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 391796A606B



On 6/19/26 1:52 PM, Julien Grall wrote:
> 
> 
> On 19/06/2026 12:34, Orzel, Michal wrote:
>>
>>
>> On 19-Jun-26 13:23, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 19/06/2026 10:48, Orzel, Michal wrote:
>>>> @Oleksii, can we ask for a release ack here?
>>>
>>> Can you explain the pros/cons of introducing this patch quite late?
>> The advantage is that it fixes the broken LPIs on affected hardware.
> 
>  > The disadvantage is the reordering risk but I don't think there is 
> any issue.
> 
> See more below.
>>>
>>> One of the risk here is that we are now initializing the LPIs *after*
>>> the ITSes. I understand this is because we want to know the workaround.
>>> However, I vaguely recall that there was a dependency in the
>>> configuration. So are we confident the new ordering will not bring other
>>> issues? Ideally this should have been explained in the commit message.
>> gic-v3-its.c never references host LPI state, so ITS init has no 
>> dependency on LPIs.
> 
> My concern is at the HW level. The ITS is using LPIs. But we will 
> configure the ITS first and then the LPIs.
> 
> What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem 
> to allocate memory. This is a bit fragile though.

Julien, do you think that a fix should be done differently and this one 
isn't really acceptable?

~ Oleksii

