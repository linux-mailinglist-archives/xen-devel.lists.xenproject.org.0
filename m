Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEx+CYcUDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:43:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8415794DC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312498.1582591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF6H-0007aB-3z; Tue, 19 May 2026 07:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312498.1582591; Tue, 19 May 2026 07:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF6H-0007XU-1O; Tue, 19 May 2026 07:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1312498;
 Tue, 19 May 2026 07:42:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPF6F-0007XO-91
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPF6E-008MlH-He
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:42:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c1472-5cb7-0a2a0a5109dd-0a2a45018dd8-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:42:46 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c1476-c1f2-0a2a45010019-d155802ba838-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:42:46 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so22515305e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:42:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fffb9aac4sm351862365e9.9.2026.05.19.00.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 00:42:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779176566; x=1779781366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxE2l2DTSq4VLsZsXteYhl4kO9URI3X7sspxnSaUzCU=;
        b=C5gmeNp2hiKoB2Rvq/nOfmdQTnp3fhG6zl8z/ZISbNLReCtnBo0dQOZzzH7yQHDXe2
         xiZq2TnNtZvQqmFIp3NQ2wFxMYbAgrwXlnYfV+MLwS41TMw3rNlt2IAV5KN0A8Z2kyxx
         SJLjRY/UsfyP2W81C6fI967TPtvtLmcq8RbX4th/qEMF7zbajvOxEavVYltXvpzxgDNV
         fcUI4BxLH2c8EsSyWyh9fMI+M4I45T7qeqiScJSQUE0cKZyDQpDHci5ZtCcSc4flMNDI
         8YyZsBjaluCnfVmQ2Uw0dZS1uLxTZoNTYC2VkkjSyu5Cs1M0pDAzExaL/iX1dowak62Q
         kzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176566; x=1779781366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxE2l2DTSq4VLsZsXteYhl4kO9URI3X7sspxnSaUzCU=;
        b=DnE1IV+Ra1K8Qu2sftHHBPZ5KgMSQo+xII/NQrdT/0VP5pMQnRK7gdDkee30hr69RG
         nhMmgLpsO1sYS/S3JKeVpitsq/sqYrXth4B6Q24nAbV1Ja7Z6f+CR/fBgeyS6q58uQIf
         dziiFY/PiAq2XnN/s6bPEsNZXFrFWrgSbmI2HG4l5N25raT7y70auLV+9EIAvvNaw9Mh
         w2lL18OPZG+HNKR6BKJqpu5tqyd30N/T4TrqvWS8tuDuEDjT/BDyLo1bOmD9E7wSHpW+
         hxVDQOeAIpqv6n1mwSiZ5gn7Vi6s/RTbxXvzFYX3XgD+HuoH9naELbBl41A9KU4oP0FO
         NxEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/i+1yOSUfDmyb7/jkIBy9sIFHqCFboxUVDgBfxByskC+OMyH30ajCj6ZAQflmJCpk9YDpPk9+fy30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjUTfPF40V/SyIkZSax7Yrj7pXWgcByXmTbUkZnZjKIB95wtTT
	SwFz+3mmeQL8qCbfuuQRLzSyG7FUmtUSD9dXU6ggFpnLjr0Qs/haipuY
X-Gm-Gg: Acq92OFx8V6gWTlPyj4quLMscSDUIZf6+3fbpCcbPEXZXmMagq/zcT305dMsxIeUJdT
	0eHAIcgnVeQ5DHtVcjYXREO11zfK1NnZPnQkXqa09euiPIaGX8kpp37tn3cXpGs6F0LoqqKDnOE
	vtXfyp64WDF/qFAvwz1OTpHTUCUJDFPnn+Jjb6gWn7r104kAUCleXQCsgFsl/eMpdu/MBoLIW4l
	qWf0CqYhkzDpZ+dAllpCw+DKvuHefv+3NjeJULoQwLiMSTM9dsIebGO6d5sLgXT8dkJeV/cWhq8
	BC9mmO3jJR46sx55ozKr4e87bFfwjp+I/NOvtIBZPx6BhrRnXDtSqV1fkUFc2bLXCbC5neehwLi
	g9tNhzUA4/4FUi2SpNnf4UqxmtF/xgYnY4cmj2KwX5lzJDsjakUBFhGn+ZxU6Dy1snkjkW4TgzO
	vvILJeTZsMhAH4nOWXXDiM/QhD+QxjbCDlorFKnEXeZhiT/jAJ0Y6QasR2gnsRF0XuYO7SQ8Lrr
	Fk=
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb70mr4494115e9.9.1779176565600;
        Tue, 19 May 2026 00:42:45 -0700 (PDT)
Message-ID: <0386a521-5a26-430c-9143-e70e77c8d452@gmail.com>
Date: Tue, 19 May 2026 09:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/gicv3: Detect normal NC ITS command queues
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Mykola Kvach <xakep.amatop@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
 <05997446-AB81-433D-84D9-48A5FBE1D62D@arm.com>
 <alpine.DEB.2.22.394.2605151434470.52999@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2605151434470.52999@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779176566-AC055FF4-76400CB3/10/73395122804
X-purgate-type: spam
X-purgate-size: 2029
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
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,xen.org,arm.com,amd.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8B8415794DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/15/26 11:35 PM, Stefano Stabellini wrote:
> Oleksii, can we have a release ack on this fix?

Sure, fixes could go until Hard Code freeze is started.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> 
> On Fri, 15 May 2026, Luca Fancellu wrote:
>> Hi Mykola,
>>
>>> On 15 May 2026, at 10:40, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> GITS_CBASER.InnerCache uses the GIC BASER cacheability encoding.
>>> Both 0b000 (Device-nGnRnE) and 0b001 (Normal Inner
>>> Non-cacheable) describe non-cacheable accesses to the command queue.
>>>
>>> its_map_cbaser() only checked whether the shifted field was zero,
>>> so an ITS that reports Normal Inner Non-cacheable would not set
>>> HOST_ITS_FLUSH_CMD_QUEUE. Decode the field before comparing it with
>>> the unshifted enum value, matching the handling of ITS BASER tables
>>> and GICR_PROPBASER.
>>>
>>> Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> xen/arch/arm/gic-v3-its.c | 3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
>>> index 9005ce8ce5..7560d46c6d 100644
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
>>>       * If the command queue memory is mapped as uncached, we need to flush
>>>       * it on every access.
>>>       */
>>> -    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
>>> +    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=
>>> +         GIC_BASER_CACHE_nC )
>>>      {
>>>          its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
>>>          printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
>>> -- 
>>> 2.43.0
>>>
>>>
>>
>> Looks ok to me
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 


