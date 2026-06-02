Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4J8FDWktH2qyiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:22:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD06315EA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:22:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XA1zcVyR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325387.1590872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUgX-0003W2-64; Tue, 02 Jun 2026 19:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325387.1590872; Tue, 02 Jun 2026 19:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUgX-0003TE-3O; Tue, 02 Jun 2026 19:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1325387;
 Tue, 02 Jun 2026 19:21:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUUgV-0003T8-IM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUgU-004X5A-S6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:21:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2d2a-5cb7-0a2a0a5109dd-0a2a450ace04-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:21:54 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2d52-56b3-0a2a450a0019-d155dd34e03a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:21:54 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso1775540f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:21:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm1416682f8f.33.2026.06.02.12.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 12:21:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780428114; x=1781032914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dW/JdpSkmYJ8o+HCqZK1Bdu3oOZlTDFNLL6JBTzcd34=;
        b=XA1zcVyR9HW21NkNR6sjYaKxhkoL+tHy52V9GLvI0TwPZq59IywcjeHGRUeB1QOY7y
         2VOZNWzOSFE5ZYUPSz343SRXNMDGXMA+8RsqDdM5YdYiQzxbuf0sRcHflB7l2eO7vme+
         LwofFYSVWaFpo8ot1yBmQfZ4okxByelU3xYXAjm5eBcuGvxE3itbcA5zCNMfvc2xbWaj
         GFOpHuBm2+D2WX+Vejmt8wJ4QsQRxCM5spzvzQ2H5T1VSB+OiKbWIjNDvpcImuojgoeH
         0kE1AvpVqD6eldxCRS+WhWARVnp4znyVWoSSLwbCDkgHyCk66gwY4yFcITTUIuzVtEUa
         q6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428114; x=1781032914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW/JdpSkmYJ8o+HCqZK1Bdu3oOZlTDFNLL6JBTzcd34=;
        b=p4GU2lKGlRcx2PqR3FhmP2ovQTIXN15bgGHBdB9y+Hq4Lq7bXVXFjxAoP5mGRmYR2C
         BcxZbAf1MkxixWs7Ovcez+hDjkmKRIAkO8/nOKV7N9fZsFlN+V2zXFCXkeu8UiWGeVXO
         +g4srTFlsFAOzJYM2EB06OZ+Vok9n6NEnpIAG5dz9JFr1NFGZyhg+3nnH6NPZm4XJFNT
         1oXYGMaUJyVQwGItSj19GqkXbhO5jI24Zr6e8V+mAK80UK2k5ZvbcctAFnh/cyiHvQNI
         EXioSm3WHtIA9Sh3IhtCLydxwfMZMbHean9CrJb7ikUG2WfsHkhlHcCHS+8Ju1IW372e
         eu5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Ed+cqMG3o74O+IyareP61sPnN2sx/ViV1D1wHtdZN/+3U/Nrzm3LBjHfTTNr8eRZ74h7E0w7zXOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ1lBy83ioO2rxZO5BwpEhXR2HwlbrxsPbSgVE5DrIu4mSzdB3
	FRtD6IPPyu97E2GWfOkOHLB2ymQL/8nG+iNlWQMobv33lWq+YVe8EFMssg22eA==
X-Gm-Gg: Acq92OGIHfplaglb5hD442nA+4SGgBBlVuEVNMczXeNZ54EbuSRRSk7rQ1xnSYHqjJi
	WWZhvAM4/8FBpWaCcm3vwCwluKmeyOeNSRP17fCaNV2sMAaahb9OzYzKiAgmpnWpyWTuc+13YL/
	pGZeAzSRJ6RF7dupMFLbYMu39gb0j8rzNH/EkQu2CpMWbGIWF2qvolyEAgfiw0i+7TBxhhE+aCy
	T4ow+Kc8hwl3VA+DzZ6TVn2zVqxaQf3aC/LzsN9QZ9K6/xkHfuNO4h+4reECQfbkt1DvPd5Ctcg
	xM6CbZkArAE6C+ba/4gmbdb/7vlldSTyu8FEZ3z9eEY+KhEfYM0irI1/VLFyXgOfPUIIdmOi2O1
	RAsPlsxr4sCLIQwVbfBUal8gOeCbke0/E08EK6jGJseHaGnU3S/In5/T153k0Wtw9hrIcq6HMUX
	UC2pRkc6tVgKGJF19vyuGqwVnz18pUPG+JREbBf5WgiZ5JMu4mX2+hAJ2cYiyo9iV+eyVba0q6g
	i2F8sZLSJKrD9gf
X-Received: by 2002:a5d:670c:0:b0:45e:f5bf:6c25 with SMTP id ffacd0b85a97d-4601f62c38dmr652287f8f.32.1780428114125;
        Tue, 02 Jun 2026 12:21:54 -0700 (PDT)
Message-ID: <17af7606-c388-4d82-b219-cd45d2c19827@gmail.com>
Date: Tue, 2 Jun 2026 21:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780428114-713638B7-F755C7B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2BD06315EA



On 6/2/26 6:45 PM, Andrew Cooper wrote:
> FRED is now believed to be complete for AMD systems, and has had its tyres
> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
> systems (Zen6 and later).
> 
> Support on Intel is still not yet complete.  Leave it as tech preview and not
> security supported.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

> 
> The issue on Intel is to do with virtualisation of MSR_SPEC_CTRL for PV
> guests, and is waiting on the resolution of a question I've asked Intel.
> ---
>   docs/misc/xen-command-line.pandoc | 6 +++---
>   xen/arch/x86/traps-setup.c        | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 

Don't we want than add that to CHANGELOG.md that FRED is now enabled by 
default?

Thanks.

~ Oleksii

