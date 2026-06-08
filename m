Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LmjqC6aeJmrRZwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:51:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB5C65554C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C11PE+77;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1331575.1594135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXZQ-00066C-5u; Mon, 08 Jun 2026 10:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331575.1594135; Mon, 08 Jun 2026 10:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXZQ-00063j-3D; Mon, 08 Jun 2026 10:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1331575;
 Mon, 08 Jun 2026 10:51:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXZO-00063d-HD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXZN-003dfJ-UC
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:51:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269e94-e002-0a2a0a5209dd-0a2a45059ace-2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:51:01 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269e95-aaa8-0a2a45050019-d1558030e0a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:51:01 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so53402015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:51:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c183asm388884985e9.6.2026.06.08.03.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:51:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780915861; x=1781520661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/Xqfhlw+w9rTAfqBhZvGTdz1oijNj+H86PttYjTp0c=;
        b=C11PE+77N6jwKUY0MC6LYg41GbnabUtVjxCukLDoCC8eo54QKuqdnblNH9dzka5V6q
         9g/0PQzdSh3WbxYMgqQZBfyLr5HoFnl9GIYAMbropH0Y7i/HCkj5fh6ifOfIAKQuKZ8L
         ByzRx3qbdt3JTsWwor8dmYM326bnPPAX0a1BgmpOCYsy/PpYlVeT5zDBAxsjjTkzTOjY
         uUpf6JvbNDni1s8GkGrfNC+CFlQGR+E7P1jCLtvsEzF0biQp2YXgbfAHU4yIlyIt5g0Z
         ASkHfNCM6eHDw/7Ef04UAMBS2NCL5mmWb2jjeS82CVbDZoBc1e0NkVgsnJwEFBXIRI1O
         3gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915861; x=1781520661;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/Xqfhlw+w9rTAfqBhZvGTdz1oijNj+H86PttYjTp0c=;
        b=J+7E3wRRpnZ7bBIMIOLlEJLMhtK55NOxW90HtKcaMn6gxsG1BWjCs8hHlGsH9a02Cx
         TBPpgSd3ah9J0Ogim+GZi3UpZL6JTdE/zOSp8D1K34ZRQ/k7+RPNw15L5VJI+e2ZuYNf
         UphTiCTiNP1RZMIwO7/kUnfj5opVYK/J+csBluBsAEVUIx6/jAaRMUfHPQmw0o7YvEvC
         n3bwjoYiMIThbVV0SplMEywdkzJEn/CEA6hYPzUgpKR0zp9oKmLXBOgsVtKeUmhhIC3v
         rVBzDu9wmhdKm29tEytfNDaovPLkYXXwQnJpj7xxP2A/BeVhc0eU88URH3ZN4rUl4cg9
         op9w==
X-Forwarded-Encrypted: i=1; AFNElJ/sp5iJFt9cwdifs1uoAcztUtCglWsY5ZPBPMr3P+buF1FzwqTTk+lDxX784vAw6W4fp22FmVqXX4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxswnrZ9bubEQ0MwVQqxSk3cgmtnCJBZ5lsMkOtVumIsUPSDDuU
	c4PHbFpkNaxA2kbtp2cXlSr8S0+DCjPiwRycNBheTSy65WvIEFDwET+mNOa1AA==
X-Gm-Gg: Acq92OEKWS/qqnnoKJI9bmEw4AfmQJiHWqwN+QY+IDd0Oc53broUya787sjramtDimF
	Dtbz8oJNix4RDskPoFVl7DJRAMJFNGhZC8TCtkWhrgfIEVMWIutSee/I6QGMWoG6FdMq5+Q/DqX
	v1nfoGJCznn0pcxgT3urs8tnIDEMijkhQEsVexgNW2cYQw6yWU2fom353f+LXzDkx6IZFNO2UUa
	w1goyBo9Tt4xy1VAZQ9oksbpn5eSjGZGit33BRdzFcfLbLC94oBJFVV01xdI4mr3zCnEPJLKlVL
	2kYCofzAk14nkXI8HyvV/QrOaF9hcA2dFrrNn1v0i8IguBVQaz+sTcyqu17YhMrxcAodL9fBSJO
	ssm16lMU1m1LUtvYK9kT1Y11Od0+kKbHNqmJEPLCCyGj+0WW/cjiC+gTx/TPjgNY/8/wHMgLXCy
	PY9NCjWiavdI2bvkLuHL2dsEzNIVJhzDhsX77TXPAhh7aFa07jEg3e1c3AcuCLAw968Ldsyux6P
	KAez+yusOYUfQ8J
X-Received: by 2002:a05:600c:8183:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490c25b0a60mr226035785e9.17.1780915861004;
        Mon, 08 Jun 2026 03:51:01 -0700 (PDT)
Message-ID: <2e6bc1ba-72d6-4b4d-ba1a-226eb74fab0f@gmail.com>
Date: Mon, 8 Jun 2026 12:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
 <23167e00-685b-4033-aa8c-6c44c705448c@gmail.com>
Content-Language: en-US
In-Reply-To: <23167e00-685b-4033-aa8c-6c44c705448c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780915861-D9F76443-89BE72F4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1404
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEB5C65554C



On 6/3/26 3:01 PM, Oleksii Kurochko wrote:
> 
> 
> On 6/3/26 11:16 AM, Jan Beulich wrote:
>> On 03.06.2026 10:53, Andrew Cooper wrote:
>>> Switch to using the system liblz4.
>>>
>>> This brings libxenguest's lz4 decompression in line all the others, 
>>> rather
>>> than using the unsafe decompressor from Xen (itself a port of Linux's 
>>> unsafe
>>> decompressor).
> 
> Generally, the patch series looks straightforward and low risk, so I am 
> comfortable taking it for this release. Considering that...
> 
>>
>> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"), 
>> there was
>> no shared library available at the time (and on the SLES versions I 
>> worked
>> with). Later a shared library appeared, but the -devel package still 
>> wasn't
>> there. On my main dev system (intentionally a relatively old SLES 
>> version) I
>> therefore wouldn't be able to build/test LZ4 anymore if we went this 
>> route.
>> (FTAOD this isn't an outright objection, as the goal of the series is
>> certainly good. It is mainly a data point to consider.)
> 
> ...does not consider this an outright objection. While this may become 
> an issue sooner or later on older dev systems, if the change is accepted 
> into staging, we could switch to the shared library approach in 4.22.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

