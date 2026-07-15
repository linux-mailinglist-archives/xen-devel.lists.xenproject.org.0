Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X1KcN9I1V2qgHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 09:25:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917075B67A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 09:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fSes+lcF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362785.1614533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtzC-0004xn-5C; Wed, 15 Jul 2026 07:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362785.1614533; Wed, 15 Jul 2026 07:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtzC-0004w9-22; Wed, 15 Jul 2026 07:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1362785;
 Wed, 15 Jul 2026 07:24:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjtzA-0004w3-Gu
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 07:24:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjtz9-002GcI-Tg
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 09:24:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5735b1-2eae-0a2a0a5409dd-0a2a4503b4cc-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:24:51 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5735c3-fae8-0a2a45030019-d155dd35e48f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:24:51 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-470174001a0so916713f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 00:24:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464d6fa7sm13890315f8f.37.2026.07.15.00.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 00:24:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784100291; x=1784705091; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h8G81wEFX++uMuj4xtPbL7BBy8MBUfXYEBGWYEtIBVY=;
        b=fSes+lcFjTIa36hYi0I1LmoQOLvHJ6YUt/VIkEs9Ml568a/VCkP3m4cyHjipTAIBcr
         MCfgpbBcWsUZoCaexQwi9TPtWHAfcOFWWJ6kUPYL/htPJW/coYKWPKSqT1GYljE1hXob
         gKyJB9tIZUiSsOvYpk3FSMI1cUhQufAPyfkxEsPkf6UEsHkxJCfTu/xp8K/rWZk1NdyT
         lgUIQe1RVulyyTdZxOwxs4IUijP397/LOjroFXvCHTP5wmJENifbDI4lPkuyhfZtYKyp
         AmRWUZq3sk342F/dC+xf4WCPTBiKgYW0tsGGuDl00Ww2q3MXjjaQ3A/ICqEQLfZ7gNlO
         p/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100291; x=1784705091;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8G81wEFX++uMuj4xtPbL7BBy8MBUfXYEBGWYEtIBVY=;
        b=Rmu5Mk9CF2iTPVnxD2wR9q9ax9uhYj7unXtfSjZaZvm7loHC9LWHPC1k+Di7d/O+Tn
         BRdWQ2FP0R/eGi4IWQnnzS9dreX1UsFXBrbQZmRPCWhSOdhnLFKroXXJAoHYxc8ON0EN
         X6TZHK2GMFjV+ll5Srb5pNWbrUzWhqF+MT0Zu3XXdXG6EV3z1c9JJRkHrlH4vgg3KZ0+
         gu4UTfd4fGzwmWNvqk2AXlC/7DSi6+1BgFqqO9Nsb60XpiGY4RAZwAmITUGxLb/4kpEI
         CF62cM5nD03j6HyfYvN78PIipol7v4uGFAABJ2z4ZKy/+pq8Yd7glUm+cHtyNMJYXaAV
         CqZQ==
X-Gm-Message-State: AOJu0YwJrILZI++FJLAXPGMLQsOAwzYlAuHVmkb8BEkuRUQ9V7mSe6J8
	x5QkMJs1ZuhVJg9VR0Rv1r4Ar+S3VQXKCYPDvUkN56axw2fSRvwn7BX2oCrhbg==
X-Gm-Gg: AfdE7cka/nRunfyPFqJzov3no/n6trAsEF7qP+pnQ1wWBD+11ghG2KFyf3Xa+EB14bV
	16/Qj/PCdPZqQFYVOW8Bb1wSbnwVqvrRCga07v3Rl2gi8e1Mq0DNFQvgYT57lT/pHa+uV7gqcKt
	w0EtWfY6srVBZ7X5zgmrpbTf0+cSkA6uLFmG2pW845vl+uDQw9ckOwK0xH/gPLD+oL6egESZRdC
	0AEGdY5eyZ74z2goQz2o8UrjM3OvsJ6ZSW4pOlEGSpwwmf7u9+oAHorrmANcQHp0xSOriefRvPg
	clm7D08LMQoS+tciOOYwq8HgQNljnpm0mpglTa+nKM3OfTYst2xQik8905OU2I0dksGol1BENPw
	2Mol5K+btUuVVcHtj1YzQnKyGgARzFKX+Qb7SscvPCFzxnxfm9fx3OZyno78vxVsm+jyqSaVQeD
	tCwdugKnCKX/5Mb1kWsTxSSYF115oxcUuRFlS4ox5s/OyJ8iGDMs7M734Zv6Okorc+DII=
X-Received: by 2002:a05:6000:471c:b0:479:e6a8:c0f1 with SMTP id ffacd0b85a97d-47f2dc8d79fmr16470155f8f.9.1784100291178;
        Wed, 15 Jul 2026 00:24:51 -0700 (PDT)
Message-ID: <e88d25a6-8d2e-49a6-9cac-702251bb8df2@gmail.com>
Date: Wed, 15 Jul 2026 09:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.22 Release Postponed to 30 July
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784100291-6F4C74E9-95783E1E/10/73395122804
X-purgate-type: spam
X-purgate-size: 431
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 8917075B67A

Hello everyone,

The Xen 4.22 release has been postponed to 30 July.

The reason for the delay is that a set of Xen Security Advisories (XSAs) 
has been pre-disclosed under the standard two-week embargo. To ensure 
that the security fixes are included in the public release and become 
available at the same time the embargo expires, the Xen 4.22 release 
date has been moved accordingly.

Have a good day.

~ Oleksii

