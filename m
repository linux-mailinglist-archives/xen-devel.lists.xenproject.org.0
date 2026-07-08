Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wgGqDJs5TmoyJQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:50:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3B726066
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DGDA+U9D;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356916.1611438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQnR-0007c3-Ss; Wed, 08 Jul 2026 11:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356916.1611438; Wed, 08 Jul 2026 11:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQnR-0007ah-P3; Wed, 08 Jul 2026 11:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1356916;
 Wed, 08 Jul 2026 11:50:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whQnQ-0007aZ-Ib
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:50:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQnP-00HPYL-Dj
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:50:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4e397f-e002-0a2a0a5209dd-0a2a4505b7b2-14
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:50:31 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4e3987-3cb2-0a2a45050019-d155d02aa4e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:50:31 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-698e5859a3cso1316931a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 04:50:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19ce4a60sm7609609a12.8.2026.07.08.04.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 04:50:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783511431; x=1784116231; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euG7uo/bVBWn4gSuVtS7As35eN2qVd7EADroimbjSfU=;
        b=DGDA+U9DjyIcfqH/oYQJ6j79ohQx9QXOOE+Mpr4cHX//5j5qSaPsS8y6ixlRCkbaA3
         D9qrAg0ct0rL0fBsT5KupddUtv/Yi37aihC58GkTbo3C6M2daWVSrI4haM+lSr3IokxJ
         K3g+COFufWpXIDbwhx8h4V6c919NL0DfK7dXk9oCIpJzWanUdpCUL7ViZp8yvtm6vccu
         IfK0HjyfarhxUaORANJ/zJHQS0ttWdfya1dYt0xms4sKQz+kovRT0O47/R4x9ADuaJJi
         4Es98x2Z5fL4GkJ+9ZyG/EBN64VWpNHVnhk3d8tS5xhCZBVLbRnvR5B+/YnokZdwASbX
         v63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511431; x=1784116231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euG7uo/bVBWn4gSuVtS7As35eN2qVd7EADroimbjSfU=;
        b=ilg0iAkdzT9HCiTbolz8v7ml4XIuRIZt1YzrX879+JmfUBeS4hnPyPwKq1rEFnVJZG
         wRghlBPdyW4CwVDYq+aLUCq3aaaxLsmBsefVt7ptDvzPs7Oepzl6XRrhhDJj5cJMlCfm
         tGVfPH4mpsSMBcGe5V6/udh6aWcao2Jrt+3q+2NirA5dxHol3vVoOaI2ykiZbqmHjeh/
         A4PS1HYuccE0yC8I4OGtpkYmKl4f4edbAyblKsV+23MG3u4DXdstrrw+XFmiPFIYvwBW
         w52eqDbg5eEzis31+/CNKPd9q7xJnkACbm6OWmhBvoXZkXui5nfa9veANKm4rH1ebFnJ
         0BzA==
X-Forwarded-Encrypted: i=1; AHgh+RofJariVITgITI2jIqLuBSh3DcRNzh4RTSYMzL2NXN7B1UUZvLyOrJfCXGk/V1QI63aoWK1xCVFCw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5deIkl5lekO8dWGgmCwjorWbBgv9EQ+2+jkPPLFD6Pw0Y/SqY
	VWjr++FPQMzC43Oi2FNcRdZ4tlwYQ9aC5iBZMAyShUvo/fyHksFnVYVU
X-Gm-Gg: AfdE7clW8WL00yrK2jxkpBgIygs14SefFxZ3CPrUihkyLU150C2cDfc4iISFmFn/y1X
	gap44lc6nIWIFZbUmdUaB0PJHDSRev4w2FYxpZC1LYVhw1qTZWMVJH2wlG6XnbT28VRG/bqbkHr
	E3Uy6b01+Vb6tcsH0NIYzTuyiTdkgI1eK9818ecaZnj6jJ8C9ZpqcMO1KMnyQYeD+3VZnpGGtNE
	5B8pohEbxP2bwoz81eXyF/AKJlTyV1LIvVH0XkJjhqdTrwtgWGpfyOVHBud0lZ7/Ut8RJpmUo9D
	45mzaAXc9GfPhLE7NtIKXLL8wBhsusQ4GxWsxhguuSVEF5NcgR1KvkleqEpgtao+H+5r4Rp2slj
	lrpnv/dFXFauSdXbQJXmFgf1qSmbTrkQVD7F7VoY1ESPPvoGmFAyrqvtzr3+v3/wekXcGNhfRDR
	wJhtcxryWsj2GjJzcSxXi0628QcGmTu9NomrpHJvkKouttzBZ6pIfalVSFBwJNmLcnoTqx8xsYx
	nWVdw==
X-Received: by 2002:a05:6402:4285:b0:697:eb97:a4ed with SMTP id 4fb4d7f45d1cf-69ab3bc8f00mr1051664a12.7.1783511430640;
        Wed, 08 Jul 2026 04:50:30 -0700 (PDT)
Message-ID: <d9e923c7-bd91-4034-b9a6-3e0d39b4c710@gmail.com>
Date: Wed, 8 Jul 2026 13:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/26] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <39f6e7414696acad4a1257afaf067a832b165cc4.1783331040.git.oleksii.kurochko@gmail.com>
 <04360a50-4ed9-4d65-ace4-deb302bb2c28@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <04360a50-4ed9-4d65-ace4-deb302bb2c28@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783511431-0DB092B8-11F9FC2B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7F3B726066



On 7/7/26 11:52 AM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -22,6 +22,7 @@ config ARM
>>   	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>>   	select HAS_SHARED_INFO
>>   	select HAS_STACK_PROTECTOR
>> +	select HAS_STATIC_MEMORY
>>   	select HAS_UBSAN
> 
> Both here and ...
> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
>>   config HAS_SHARED_INFO
>>   	bool
>>   
>> +config HAS_STATIC_MEMORY
>> +	bool
>> +
> 
> ... here it is clearly visible from context that this patch is assumed
> to go on top of "xen: introduce CONFIG_HAS_SHARED_INFO for archs without
> a shared page", yet that's not said anywhere. Perhaps that other patch
> would better have been part of this series?

Good point, I think you are right and it would be better to put "xen: 
introduce CONFIG_HAS_SHARED_INFO for archs without a shared page" just 
into this series.
I will do that during preparation of next version of this series.

Thanks.

~ Oleksii

