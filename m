Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHG/KPY/32kxRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 09:36:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0AA4016C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 09:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282190.1564844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCumQ-0005Fw-4r; Wed, 15 Apr 2026 07:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282190.1564844; Wed, 15 Apr 2026 07:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCumQ-0005DB-1c; Wed, 15 Apr 2026 07:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1282190;
 Wed, 15 Apr 2026 07:35:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCumO-0005D5-Jc
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 07:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCumN-008Pcn-6Y
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 09:35:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df3fb1-e002-0a2a0a5209dd-0a2a450bca50-38
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 09:35:19 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df3fb7-bca8-0a2a450b0019-d155dd2ec489-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 09:35:19 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43cfac48bc7so4446557f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 00:35:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d518sm2955315f8f.6.2026.04.15.00.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 00:35:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776238518; x=1776843318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHEDNAm0auYUBYZibOP5HqlZhcFEDb2kjI8zEAv+1+c=;
        b=qQlZtOjUvDbMgM1DQXqc4ODrfi5N91RhtrhGkyMN5TM3OfwWwm6x4bIiNal3/U6hlo
         FuVAUeEqllnxenXKJs3oZGdTdx2BCyS5RwQOVVS6lB15RhH7YEmAdsvHxPCylFNlZP20
         XhjBZ+pdFyvGwniEBahI3/tSkFjh5rkH/u+cHACOr4VRz3knlP/YBAr3JCrEzypvjZRG
         NLAGHO/BGcsnWI/onc1erh7jepnWaK+WftZ8L94ZKMWcLLie2UhqgZ8y/ZEhnb4vwDsv
         VIoKjtftQN3E7LCWsA54uEaaAwpJ+gqoAyUUQLr2nHd/2QPSbI9TGVa2Rtbx1AFhdDTL
         Bb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776238518; x=1776843318;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHEDNAm0auYUBYZibOP5HqlZhcFEDb2kjI8zEAv+1+c=;
        b=Ysn8OrHA0775yDMs+VwSrm6/sW3jp/KJn7/fKHCO931RD6Sq/wdnCeZNdvx3jdENVj
         op7Lp4c6+4DRIYnG9uSFnBZ08CLFhuqJiCK1Dqyyu4S04xZ3Zg93HxE9X3P6JNK/V2Wn
         U6ENGgvCBE7nhTm0g9ThoCK5dAuBTtQUV1Ge0J+zKmKUtuaP7sQe/VrGS4gd3aIMN3s0
         aKL2jFq+EXkVX7HQsJmMENbOuKiNgMMfaiqp+eXYo5ANgw/uXnpBZBhwMkXcte4r7OX+
         KZ2STl8iGnfzP+92VhruXNpGwDufROCpooNwDsc4HoXFM8JPBCsQX6NrRTGXDQPaBNKz
         5/9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8E/d/NZiy7BbK3b4ke8f8RnZAXvRWHCU76cpHYsSd03BzA6wK6m/etEmaQLD7IAWirQdebA7vU7uM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWapHE0wSNZQBBNmeEJkgBNcMg5TrGv/ZxoQs/GpJ01Nkagh6f
	hSLfN7rxVifH4TQzed/F170MSsuKEb7NEpV65OkrI9bxmbHmRnf60E75
X-Gm-Gg: AeBDies/wkcUjy+TDQAY+cBL99uKU8hvdlWJiv+AkAHNJrXLx2JZBVJQX9SrsY4O1Wg
	w0uflrEea8QJMj+Xoclm70TfXeaVlx8YyUB3hFcu7xUalhm8xjuXAk6N5R3+CL2XBj0DlKqgZqj
	kmfTBZbf1UusEHk9tGO+xJv9Jzma/2PM0gsPQz3ilO0Iiufm0KOgjkWFnmFWH4fkfL04svmWyM4
	3ggmOp+0wBSKn7mBlzTEXygHYapuhvLXjh97WraDqpkefJF1m5jAUJ57MvnNvZPx4UWldmNzmm5
	qa6IVF7C9LXRQVECHXipfiVCUUZSxFHJmh+57W8p6w53lCBRmgQwtd9v+jmAk7wUqaajL772/J6
	/uVp2U3aGN3HHUiaDxdX9zs1bDe3WGSXQJP9u9SItihGvEBsO+gjPsa8G0oAVxS4Brm5rtbMIbS
	2naNu1uvGu3pkjODJDx26hAxGnWq403wLNvyHbmM1bcTmZrpDY5mHLFt/ZqVlXfJu//PJEn4FKV
	pycfBfMNkY95A==
X-Received: by 2002:a5d:5f44:0:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43d6428a2a2mr29032519f8f.17.1776238518407;
        Wed, 15 Apr 2026 00:35:18 -0700 (PDT)
Message-ID: <b3468705-a05e-4a45-bafb-de395dbfad4f@gmail.com>
Date: Wed, 15 Apr 2026 09:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/27] xen/riscv: add vaplic access check
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
 <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
 <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
Content-Language: en-US
In-Reply-To: <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776238519-EEB482A1-8FD15938/10/73395122804
X-purgate-type: spam
X-purgate-size: 955
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C0AA4016C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/26 1:45 PM, Oleksii Kurochko wrote:
>>> +static int cf_check vaplic_is_access(const struct vcpu *vcpu,
>>> +                                     const unsigned long addr)
>>> +{
>>> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>> +    const struct aplic_priv *priv = vaplic->base.info->private;
>>> +    const paddr_t paddr_end = priv->paddr_start + priv->size;
>>> +
>>> +    /* check if it is an APLIC access */
>>> +    if ( priv->paddr_start <= addr && addr < paddr_end )
>>
>> ... use that here? Or asked differently, again: Where's the 
>> virtualization,
>> i.e. the abstraction away from host properties?
> 
> With the current use case it was easier to choose such approach then 
> provide the full abstraction.

BUt specifically here even with the current approach there is no too 
much sense to check MMIO of real APLIC.

~ Oleksii

