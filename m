Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmCPAor4MGrCZgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:17:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A702F68CC3E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aaj476IJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338716.1599760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO2k-00017w-K9; Tue, 16 Jun 2026 07:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338716.1599760; Tue, 16 Jun 2026 07:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO2k-00016g-HU; Tue, 16 Jun 2026 07:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1338716;
 Tue, 16 Jun 2026 07:17:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZO2j-00016N-Pq
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:17:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZO2j-008VSB-6N
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:17:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f866-bab6-0a2a0a5309dd-0a2a450cdbf4-32
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:17:05 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f86f-62f1-0a2a450c0019-d155dd34a88d-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:17:03 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so3096563f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:17:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm474778f8f.9.2026.06.16.00.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:17:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781594223; x=1782199023; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dlpqqTIrE/umxs8iERnMH33cBn/5LUCcuUcwC3Hzq0=;
        b=aaj476IJsshyJer8hiFMQzEMJD530y7AADFGHrA10LJYNTnZ+ouiLwnlfj6ngRp3fS
         NK39D4fVHNG0R9QPfZjlHVSjiUCq20cU7+WELuvGpLfA15Jcq0PRVT8IqFFuL1RHKB9b
         oICxeQVFcorcDI/28Vq9NArKK0VB/hKrsab2fINyVIKc2cD3Tfncc4sr1M6zrv4We5bB
         bHx/dJSdGLf68owNo45agSp+D86ezwS4XQoaHBLrjwsQ2O+EuqC0bQWr+7inRwvtxFwe
         pM4u/WOE5ocIsKT/9F6tsEpfE/+5jkFX/J22saCIj5/ShJzXgXCB27DQ/hYmNHXkAFcB
         SevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594223; x=1782199023;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dlpqqTIrE/umxs8iERnMH33cBn/5LUCcuUcwC3Hzq0=;
        b=nNF48bCg9JMp8kWrRdD1hRdoriMuJ5HgcQEhGrOG2idlHmifTlIQ3R32y32QeWDB+8
         e65h2+EAdGbjRax56TvHIoZf+eVfPkfwAt2GQYoTwHZ8CKa+H5yIREdjMxJsyJfxbahG
         IiFKCdxDhOklBM2d5AwPdL/FsXDU7ZPa9ft2POQAo8cpsmJYkkpmlMU+75MJoUN9Ag/q
         SzjZ89ahj2WBF6Ggmy/DjfASyiJLHKP7gx2L2cD5N3MjxPOrCUHPVbbrrF2kcqQvKv7O
         MkbDMV7zEUjDzVUNNNjk8ka2n8w6IZ9lranOUp4XP22WohhZBiODyXZBJ38SJahhv0rk
         39vA==
X-Gm-Message-State: AOJu0Yydo+KQzBVvE1WA3AQPBEvBBzPAR3BNsReIRSP5uEhqGlToJIsR
	+9XzDAyejjKg181NfhGuZlofedO2KF/xUWCFvxNuACfj/gCV91k0mrMr8EdZyw==
X-Gm-Gg: Acq92OGHpteSJpYngndtXCDGZcUD7/nQD6DM6r2AtWLmIRplAx+1eTJDarQRhf//15g
	ZS4e81zc3sFYXkLRdZ+Whvzfjet/W9uYBMkThyNKeWOABP6AbdLgBp11psHZAlaHNgSvEoOlupN
	IzF7CVc6tnOL1uk6zZ404J+18LMLmkqU/VGkd9NKx7ZSUW0YPxOi0+nmnKWFPV82uGejWEQeICe
	ppF/F/au+89619OI8kqBlHuJxcEDdeIC+d9Z0jF9mS3qbGINwxM25sefC4SIBBB5vbHHCIfTsp8
	ArlbDTdx/WxO21rlIj4SnLz1/cvheZsHfm63YD+j3XMqpGD48PxSc7iZ26qygAqcnNUL+gJrNzm
	P4TvPpt0UL2iZ4Vj6UUwYEwOp6A1se+z6bvVhb9QDcSPKsGzvSsF/5qqo16ybs11lwzvU3Wz2eu
	w3MEpl4xA+o7cf/GN8RUJ3B9A3JNbjBxumqCjrNpTGy5lex2L9Ip/ORcI00y7BfX/WPpVvTE6bl
	cPLZw==
X-Received: by 2002:a5d:5f44:0:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-4619f3082c6mr4226270f8f.16.1781594223156;
        Tue, 16 Jun 2026 00:17:03 -0700 (PDT)
Message-ID: <835bdbbd-d971-4374-a8f7-8b7c5b3c9f16@gmail.com>
Date: Tue, 16 Jun 2026 09:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-announce@lists.xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.22.0-rc2 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781594224-E3171CF5-C81B1363/10/73395122804
X-purgate-type: spam
X-purgate-size: 421
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-announce@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A702F68CC3E

Hello everyone,

Xen 4.22 rc2 is tagged. You can check that out from xen.git:
git://xenbits.xen.org/xen.git 4.22.0-rc2

For your convenience there is also a tarball and the signature at:

https://downloads.xenproject.org/release/xen/4.22.0-rc2/xen-4.22.0-rc2.tar.gz

And the signature is at:

https://downloads.xenproject.org/release/xen/4.22.0-rc2/xen-4.22.0-rc2.tar.gz.sig

Have a nice week!

~ Oleksii

