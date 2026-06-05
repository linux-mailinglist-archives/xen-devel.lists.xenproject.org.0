Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RjWOArZ8ImqYYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:37:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98AE6460FE
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s0Gos6gD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329090.1593300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP75-0005uq-Rh; Fri, 05 Jun 2026 07:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329090.1593300; Fri, 05 Jun 2026 07:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP75-0005sG-Ot; Fri, 05 Jun 2026 07:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1329090;
 Fri, 05 Jun 2026 07:37:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVP73-0005sA-NZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:37:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP72-00Cp2f-PZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:37:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227c9b-e002-0a2a0a5209dd-0a2a4506d4a8-32
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:37:04 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227ca0-7371-0a2a45060019-d155802eb9e0-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:37:04 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so12500175e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:37:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2cbb4cbsm20934525e9.0.2026.06.05.00.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:37:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780645024; x=1781249824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UuTHdJ68LDqDTSzGdt/QIrLv7XZ+NPn0k1StmZlx0M=;
        b=s0Gos6gDi+h0ris2tnGsWiXFbtezcFtGlffQPqRJkZxyL+btjN8FQpBzpdaZfiMC+4
         xsBDsEbUITZU3ohkkNkSOhuIVhn+S6JLJAMZb5vwiKrKp9FsLGthMtijB4ojp4onj9ev
         qLrBOoqzbDbtfO+JE9ALyvlRcfp532PRQ14msYIGNq9afDoxQaruJL82EjF3ZrnB6Cuu
         w9o8qTU+6Lr7re/7MjPgwHii0z8aYUsruXnaNtUIsIk7h1OgZfAl4kBMk4AFYbrZRHSK
         RVk5K8AgkDU5aQsj5bCO1RbgnAMqT57pUYKnWy0Shy8Zxk1c9bGQXVZL9RSzMJGipF3S
         zfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645024; x=1781249824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UuTHdJ68LDqDTSzGdt/QIrLv7XZ+NPn0k1StmZlx0M=;
        b=YCrN6s+OlBwRnGQUQ4XOprHSLhGgYO8lCwfD4DtL+oZEh5BbfJlYzJ3sBqoG3Aa4t0
         40aIfBC55/bGOICFSx6JLWMZ0eg/nHeqK6ddmLQXSVyFD4/uOiBx/lKMH3VMxZWu/8BP
         QN1XVT9J2YbbOj426lQX5rs/R7/2t+KT9A1NRN7xWTIH1Xqe2FlFogigurTeWmV+fbk8
         ZIJJm2pRDCJaDPreBvOHWT7ArLPnJsZHPNVpJBSpWGnX6rMDk6Z1hMrksQpPvnEhhQ2v
         kuSmSS2IQZ3bHwGS8TAyzh/kdvyphA6Lkrf7qolAFRRcOCN4YRTU7mSf8pDvmgD5MStx
         g68Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4xi8TIJC4vTq/OmUmIiBTBQb0HhFro8Q8od2i62X7FVHuJkASwibaWZrw+NFaMgbOSfxfcOKVtG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg06u83PtvwVYdWHKdhIfVpdPAuZHKWBAAAgHcKuslfHe+4n2p
	QyQsO3Cbkah0wNY7HAIDdmIfeCIMTU60RXTHhh5pQOFjIIcTUkt1dddjT3vGYQ==
X-Gm-Gg: Acq92OHqI4BzNh8WCITIUYzna1S2wiRK4Cnf+i1v07Oe+AxVAOcKWkXiNQOCMS89Onh
	wzU27cqdfQDEv/Vl3aNiyodHw6b46l8ZCVPfBNzhNpKPuOiKleWpb9QdXiYUAMctR+MzARre6Em
	MgqFqQFqihUfhYxH/JLAP+Em7g33tekCvRasN9XiqLEN9WRANQXOSidoUBtdGLCHLJHbt2iyshQ
	Yo5a/YnfKRO6L/JHwbKDA2uWcvGaes66Iu9Q3xj5pRF0rRl4iZsbhdNaJkub/gcYqwV0Hv25Vlj
	l4irGERqTRXP6HbCJUp6mC+LlgQuDYwouojSKqjcaFJ1vbzjN/d/Rw/1Kg0SXZ2VQAfzZxwmILU
	SJLdpHTO3lQt7EF6Imfx2O+bcw11bJV0iuYCcAi2c/MF2vcMUc3cDed9VtZyWH+Eq2/eqP4lxsF
	qjjCd4vmT48WJ+3o0tbhVsEw+lLwzpLZkeMY1qYZCKxNZPWJgSV65SYhwy977cJQxHoAa5qXxS8
	FwCmLgdlmgEEKrPVDRpgWlpTCg=
X-Received: by 2002:a05:600c:3551:b0:490:4b89:535f with SMTP id 5b1f17b1804b1-490c25c818cmr34326405e9.8.1780645023772;
        Fri, 05 Jun 2026 00:37:03 -0700 (PDT)
Message-ID: <b1493255-429f-463c-9c3f-901417b992e2@gmail.com>
Date: Fri, 5 Jun 2026 09:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add C xenstored and stubdom tests
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260604233328.805829-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604233328.805829-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780645024-7FF7BD75-DB177C36/10/73395122804
X-purgate-type: spam
X-purgate-size: 305
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: A98AE6460FE



On 6/5/26 1:33 AM, Jason Andryuk wrote:
> Expand testing to include C xenstored and xenstore stubdom tests.  OCaml
> oxenstored is run by default.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

