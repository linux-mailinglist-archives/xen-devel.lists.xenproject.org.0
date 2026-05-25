Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DhnJuFBFGo3LQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:34:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9365CA927
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319244.1586938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRUVZ-0001fV-1T; Mon, 25 May 2026 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319244.1586938; Mon, 25 May 2026 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRUVY-0001dD-V5; Mon, 25 May 2026 12:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1319244;
 Mon, 25 May 2026 12:34:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRUVW-0001d7-Uc
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRUVW-000UM1-AW
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 14:34:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144183-bab6-0a2a0a5309dd-0a2a4502ce5a-46
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:34:10 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1441c2-af86-0a2a45020019-d1558030ad0e-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:34:10 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso59159005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 05:34:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9b980sm24572047f8f.3.2026.05.25.05.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 05:34:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779712450; x=1780317250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtOkphMfX6TR5pyMQMgePijKmseksZc4kKw2RdMlj8k=;
        b=G7szZoMEhrTKaFpim04Ahzo2dY9UMzrg17lQoxAy6uFZly0zJde6uRDb+2flPHB6dV
         7GdE5LQcl+u9emTf+0zLLP9v6YrR1rhdbnDpJOiCgSJsiNM/rPQWLce3bRksJo6CSRxX
         mAxSIodMiwaV4xcAe2jlti3a/vjOnQrOpZvWtty1V7Wr72EzhfvtTFYxu/seHXlvqCjE
         OazIDrbG/MqwISjyF4legM4rtrqTeuLGmAsjqHRPtkWmXOkcCSYqkFDmUEV/Lca6ubvc
         DP9TNTB++KniejoidsxbIm2I1/RmtwAyDfw+ADCBky4rEuojdjM1WR6VnK8Yf4TQTJYp
         nbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712450; x=1780317250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtOkphMfX6TR5pyMQMgePijKmseksZc4kKw2RdMlj8k=;
        b=jXZZYx2u4OgOEMFx1V7YbNqOYFUxFp34khutQ6uWvNBOLa85KT5WMCemQVeZroMjGa
         RqpDB+OSwfhk5w06NSsAfyRiNkD+Z52U+xB041fCinzYF9iGl5CiP7/zOi9jOqE4OM6K
         fbnKq2LFa9LwLXx0qAqW+u5YciPZU8oC9jir4R07+RRPcBhj8f2PSmh5Ss8ctGiXrz+X
         AUE9DE1JJcTxkHohLEjgzCWfteaPhWA+O83SeHH7S98YY6IsZsH26iX3AFJsAbS6Jo03
         jTJ5uos9wel2WIk2AHMyNP2o4Pafd+8USfwIMTQyT/4DvhtvioUYWxqf0QLdaNsjach3
         hv1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Tq3JfWGpo+jXhs/ATs+2xoXt4joXwQUYws50TPE05vUXlU+0EWFtBGA+f1OykQf5ZggQBYsXqlKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFcS9M63abfx2tvwHpU8o7wjUlgoiBPrl7nQK+9wyXE8k9j2Fp
	uLBe3o0e+EmELqekyG9DA5PkJ1AS2VUY8d4k3eRadJpmXWIepPmSZJZ7A8Y24Kcl
X-Gm-Gg: Acq92OHi3H/E7fNPYEAj00rddPHdRb+DgWxmvWhbze8mINwBmNqy9kVkR/IWJtapgL5
	jkQ/pwZNXOOvh/jWNiQcP24NoG5hzz1CfMxml1Kuto7LT8W34Gr4nCwi4NQ/x0De6NziYf9kFj2
	6ZrLDwGU+2SX11fxeyIpd8LippjpVXB2cBF/g8fo/X9gj8FqXgX6pZZivobIgGmp5NPTJKH6dqf
	3haMWG1zk32g25UrK0Frx/ztxojeSOdgVo/zMMw0/jp27XAdYQ8m1qEwagWaTjnBaASy/w1M3VI
	X153wme3DcimLS77rESRvEx1WlTg0dDs5u1cI5VQPjPqmBDDl2OTtKEU67Z3uHLvXzRnLkyRCql
	cL/a0wVtaRCVttLUKC8LsEqFUj0WloodUlVnbbkvk6qbSkzwrRxTxb7iDzCswNynQDP5+EsqI8h
	Whp83GLKf5FvD/l8yNaynfz7IXhdy4TI9F/aPmbQTzLfprbp4ZruzwmT0v8cyY769tRt+ELUKeS
	j8iH8ZuS7XT9KeNY88+N6Md
X-Received: by 2002:a05:600c:8b86:b0:490:58f4:ba2f with SMTP id 5b1f17b1804b1-49058f4bb2fmr128821105e9.23.1779712449270;
        Mon, 25 May 2026 05:34:09 -0700 (PDT)
Message-ID: <43b1050a-24fe-40ec-ba9a-9fcce498b51d@gmail.com>
Date: Mon, 25 May 2026 14:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Preserve ARE_NS when disabling the
 distributor
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
 <f784f8f5-e0b7-424e-82c1-c98cdf070cd3@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f784f8f5-e0b7-424e-82c1-c98cdf070cd3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779712450-AAF6E161-B90EC5F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1185
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:luca.fancellu@arm.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.948];
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
X-Rspamd-Queue-Id: 3A9365CA927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/26 12:18 PM, Orzel, Michal wrote:
> 
> On 19-May-26 16:31, Mykola Kvach wrote:
>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> gicv3_dist_init() disables the distributor before reprogramming the
>> global interrupt state. It used to do this by writing 0 to GICD_CTLR.
>>
>> On a system where firmware has already enabled Non-secure affinity
>> routing, a zero write clears the Non-secure view's GICD_CTLR.ARE_NS bit.
>> Arm IHI 0069H.b, section 2.3.3 ("Changing affinity routing enables"),
>> states that changing GICD_CTLR.ARE_NS from 1 to 0 is UNPREDICTABLE. The
>> GICD_CTLR register description in section 12.9.4 carries the same rule
>> for the ARE_NS field.
>>
>> Preserve ARE_NS while clearing the group enable bits. If firmware left
>> ARE_NS clear, the value written is still 0, preserving the existing
>> initialization flow.
>>
>> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> @Oleksii, can we ask for a release ack here?

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

