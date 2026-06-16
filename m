Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zk7sGgT6MGqGZwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:23:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCF68CD1A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZRn9JYF8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338731.1599778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO97-0003wR-IP; Tue, 16 Jun 2026 07:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338731.1599778; Tue, 16 Jun 2026 07:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZO97-0003u0-Em; Tue, 16 Jun 2026 07:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1338731;
 Tue, 16 Jun 2026 07:23:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZO96-0003ts-2l
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:23:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZO95-003Skf-Fg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:23:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f9f7-bab6-0a2a0a5309dd-0a2a4509bfe0-22
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:23:39 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f9fb-2497-0a2a45090019-d1558036ede1-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:23:39 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so40316085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:23:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cd6c2sm41875027f8f.30.2026.06.16.00.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:23:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781594619; x=1782199419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkMgoqR8G4vXDVve+8JORkijk7EDfW8/KZR/2bygv88=;
        b=ZRn9JYF8F6TDb9dk81kHgX5vS0y+8QWt9cZaYVWfvW/7MAdWqj+r5pmpi4KM2vFjfO
         Nvyu3AnQ5pFLLOF9KLiS/pv/02WVwWfPT9B9Mk+rPEGSSVF7lX5qyn5hp6aZ8hM8QXDp
         dKnLgV//3OcdNzRoD1vBubVIRE/nEqMOe9KzL2B9ftVdGBb6iudyxD/HkhyRcr4E45UL
         jIOrVJD0zfEcpRwz9NfsUaGyZKIFbwCdEDExRvc4XlcbwJojHepaY479AFWcbac5IAph
         5FH4jdWfyCPv05B2gbPEJBlyTKGU8wNTJPcX4SCLwd0kjsgahj1Q53I8X++ERltHEXar
         JvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594619; x=1782199419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkMgoqR8G4vXDVve+8JORkijk7EDfW8/KZR/2bygv88=;
        b=O7+bFrDsMo+ftAelpqUXLga4hE/BC9GGA9pqaNQQ2QD3kCh1M4Z7wIlSocfBi8dH62
         2oeBYWhoD+OPrHO1vGEP4LXTwDOueB4midyjkXBZebO+RTrXwBSAtNRobuI2JUVcScvb
         7woRAcrIkYgcSC7t8ocAvAYYICR9WUtAC8XxCkO0xMhcSx7hqQkAZ2SEYJ8d2gS1SY7J
         UCLylO9arupl+m8JbkxvCFcQBHGKG6evxbL/GysYr9qTLGhgbPN2vex7SDD8zpsvz4t6
         G2Y5PJ7Vukn9KvP9CVT63hxH79Sntxtg4QIwFDeqdomQ0NtXcZVPajyAcNiD1UGI7ncO
         tbmA==
X-Forwarded-Encrypted: i=1; AFNElJ+zJ5wSFuYi/UBvXTJP5bWTvrWBVxDEFFAt597Yu3zSfbS0Jt8NOPab4GUi8XXa5Ibiv1oM6nMagOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAEwUlxgZtVFiuPP6RxP2/KYYS9ydh73o3/TU9dLlSVpC3jOBn
	6OhJxWzRsVDZzgoTM4U27NcXIv/CiUobGWH9R6W+OARve4Jay7BF4mvv
X-Gm-Gg: Acq92OEOdyRCRFuuPsVS/NiW+YVJSpNqH/+4HtiwbYpLhkAk6KfLaMGKvoqiLiUaoqO
	/j+r7NhfmbQt67DsOSX8QwOeQmr1HPtLkxJ11XLzUN+Bni25az0bIjM4LtJ8ZhawEgcS481Uals
	6yek1ICcVogwabAHCBTN8PhU85P0Xkyo3SNIN/LP4/3EtFPbXwJMWFOgBJEb2z3DuLWSUhfYP+m
	8hXTUZTRxh1tNloyC5V4X0q9qsclMgbP49eEbqclfW3XpR2G0G0zFvdtCMHhsnwfg1Ca7ngsfx3
	ftan8T5BxOeGwb4NHs+YWO8PRvnRKBucjxuT+v7PlEv5+xS0qaoq3ft1JFxcnQUKWC3VmyLwFd+
	90GL7GIw3X69qRnOZ2fRZTwoqw33WpNiQIWE3t3J4Niv3RnGlkuvisUPRfq5bIrfXCGrc3N8Vw/
	SeZpBuO0pMExwdwCvYygI205QzhPd+Q+e480upS4ICwdyrMyD2N4hsR39obL4RYepCkWBNechl5
	O6qtA==
X-Received: by 2002:a05:600c:4e09:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-4922ffb7641mr40303605e9.30.1781594618907;
        Tue, 16 Jun 2026 00:23:38 -0700 (PDT)
Message-ID: <77d83630-585c-4a54-aba9-da18e4afb2ed@gmail.com>
Date: Tue, 16 Jun 2026 09:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 3/9] domctl: rename a label
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <afd71b98-7f25-48af-97ca-4f772551f73e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <afd71b98-7f25-48af-97ca-4f772551f73e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781594619-8A98FA53-27136CBE/10/73395122804
X-purgate-type: spam
X-purgate-size: 334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36CCF68CD1A



On 6/15/26 4:13 PM, Jan Beulich wrote:
> There's no real domain unlocking here, it's merely RCU which is being
> "unlocked".
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleskii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

