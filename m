Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQ7jMOvWUGp36AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:26:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFC73A3A7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:26:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PqBU14Q9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359168.1612888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9NF-0006Ap-5h; Fri, 10 Jul 2026 11:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359168.1612888; Fri, 10 Jul 2026 11:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9NF-000682-2n; Fri, 10 Jul 2026 11:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1359168;
 Fri, 10 Jul 2026 11:26:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi9ND-00067Y-CN
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi9NC-006pqH-Pb
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:26:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50d6da-bab6-0a2a0a5309dd-0a2a450adc80-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:26:26 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50d6e2-ec7d-0a2a450a0019-d155dd36ec62-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:26:26 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1070384f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 04:26:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d905sm61582537f8f.2.2026.07.10.04.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 04:26:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783682786; x=1784287586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roHfoKY7HntEv0Nol7JJSWwvaHOCTXiLMWYh7AxYHmU=;
        b=PqBU14Q98WRq0nf9GuzTo51vnVTKsyXrp5C7veUpVlGY9jCoTS9F9l6mkYZ36MULJ/
         fkXsQBx9ircQK/MgI8WWZ/s2ZfMg8DNZK1+VOGs5GkDqsPOm8sAOJdQLG6v7UR1HcMR5
         VEd/hrHfiPcu63rmpnn1jxp+Von+0C5y4rkrFV49AeGqn2yOeZh3LALn37P3Ocstpeqn
         bICgIHiU4205tHVlj9Z08eK/1cWqfyqUSNhW9ZIbtbFsFAKjnwvpjcvJZ871nbI3n8bB
         ZNwyt1qAHlFkszGuEq5RIJMee+hwikp1JaDbEzQPxEAZpbmQaFeD2aOXSJzKld52vZrU
         /j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682786; x=1784287586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roHfoKY7HntEv0Nol7JJSWwvaHOCTXiLMWYh7AxYHmU=;
        b=GcZA0pyGG3JN2Ear5VlD6+EbpasSFMujfpXsu+6pLmJPi5/xTUHWtx3IoEWAp+YXvk
         mfyP2Rh7ifFzHG5fO+4uLUbbghPXaY7yxRY2lTjLdRAYLpF6RITJVrWArg0QPxsRRtLs
         ezArxXZS7tZr6m3l1dB0/1FWpXmNkd89K+TEmVhoei1WHUj5amByMtAo6/Dv+mBjwclV
         ffgbrL2f5UeNARbMx6nb3XT+PQJYW9SVwQTOD952yrYtqofG7G0A3gORcSAekC9Tz3rT
         VSn2BHQCamkw5pB9Cyf8U0syOkfsJ4qTUgpg2eCxpaYmViWMqcABbGo4KdWJPHHJ6qJ6
         1cxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3tsdKT2lU6NlCSlYlBGDHvIZnXva2jOpECoKZYBaEJ9asp40idraUKYKZfM6Ac375ev3OOmnNW4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKQoJ2EWuf2UkZtWEJ8RiOntPICv1GoGblvPoaN8n0ugpf4RPL
	5777HfpQXmOjNNCtBAfEZTViOLsChY4wJ/7TZlOlY2Huk45ewfYy5RCx
X-Gm-Gg: AfdE7ck/1Qy8kXGhtBxnBqLe/Ne4N57x8qCMKsAbHvDA6YpufxhwsQkvKKKJx28EtoB
	gRSQKFVc8/hzQtbjfcJJUKI/d/sHUeVFERpmIa7GeB4x8HkpPj8sGy0C0pm/adGWnfNsgWT4i9j
	u8JLvwWU3otnCoGg65ejE1B5iQPKO7rKmmk0C9hoTMNkMTY8cmjzLByHNwq2jUE8IvJJOLAFPZB
	DZasmZu6u23DReW2wRWVq9jIaRxPmeQ8wQ58eXm1xzbjt6xxhbLtCWRdCQY0cZe8oVrnGKOIJC7
	fMtWXalqtwipqVtItxARiAUakw8gKUPtqBDp2zkj5qucIBgt2LzDEBsSr8I2j/pNE3tAVJpAy4T
	7lCrrJowThW5mHTfS8PTrpcXYRErmUhNzns3JOuhcxAvYO2HtudnrMiiMmCn56Xt0XSmRHR0M7l
	d2SaS0hYMbHHA5zDxJWW5VnejzzmWFHwO5/MrVFWTdcaDot4KkNmiEEuOx5VJ951UJ3vI=
X-Received: by 2002:a05:6000:2586:b0:470:390c:1e73 with SMTP id ffacd0b85a97d-47df071eabemr12540466f8f.18.1783682786105;
        Fri, 10 Jul 2026 04:26:26 -0700 (PDT)
Message-ID: <8fbec12c-1151-477e-aed7-4718edee0ec1@gmail.com>
Date: Fri, 10 Jul 2026 13:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
 <64a5b0c9-7cd1-4017-91b6-fabe6321da9f@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <64a5b0c9-7cd1-4017-91b6-fabe6321da9f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783682786-AC34D248-B557C207/10/73395122804
X-purgate-type: spam
X-purgate-size: 988
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57BFC73A3A7



On 7/10/26 12:16 PM, Orzel, Michal wrote:
> 
> 
> On 10-Jul-26 11:45, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   CHANGELOG.md | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 356be88351a9..c6f1fcf5aeec 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - On Arm:
>>      - Support for guest suspend and resume to/from RAM via vPSCI.
>>        Applies only to non-hardware domain guests.
>> +   - Armv8-r MPU support.
> It reads as if we completed the support which we didn't. We are just progressing
> towards that. Maybe something like "Continued Armv8-R MPU enablement".
> 
>> +   - Drop ThumbEE support.
>> +   - FF-A v1.2 Support.
> s/Support/support/ to match above.
> 

I will apply all the suggestions.

Thanks!

~ Oleksii

