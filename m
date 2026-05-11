Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB7aAgijAWpKhAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:36:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB07C50B04D
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305916.1578030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN3Q-00075A-RK; Mon, 11 May 2026 09:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305916.1578030; Mon, 11 May 2026 09:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN3Q-00071s-OY; Mon, 11 May 2026 09:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1305916;
 Mon, 11 May 2026 09:35:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMN3P-00070M-57
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:35:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMN3O-00ACdq-I7
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:35:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01a2f3-2eae-0a2a0a5409dd-0a2a4509caf0-26
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:35:58 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01a2fe-2497-0a2a45090019-d155dd2cd4c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:35:58 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso2286058f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 02:35:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6c221sm25032697f8f.13.2026.05.11.02.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 02:35:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778492157; x=1779096957; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsTmKpDELRBTxsrDy0RJiIm7lTKfkE3CaovSEAq1Zvc=;
        b=b3SW6mzbxy6p34NQ1XQxJJP5Ie8iVrc2Q6Vv9XX5rxPeiQX9RqiDQChZFptQovdsSL
         PL9CzGQIbq1vMmnPruzEiKw4rBLSXyGQnu5jLhD25Nsj3TxbNfQgeEDocAPnY2h7Frk3
         Ll7LNezNt8AStxrHmiHs3XyJiYXxswQEKFHNAJUM3E2fYthxKA9fNlaK0BbXkH5b69eo
         3g+VRfA0ce2/DRjWcbsv4O8B5VVeAK6954VhmybtKSkl+Mcdyw/N3getpa8IFeCK5u5n
         jPMkcK/Dh4Jigto0IluGyCt6q+mqky0Oq0m+g+N6V1o1Sa8wHZ/fzXoKHF4Moe//wGtm
         5gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492157; x=1779096957;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsTmKpDELRBTxsrDy0RJiIm7lTKfkE3CaovSEAq1Zvc=;
        b=KHIJcS+fB2aymJXlNdbNZEIN4wMCDHBLbO6CRgem0PeWDWiWVj2FLrys3FFaWFSiNu
         z8L//sqbSj5SQwkW8SAig7hcHDpb4PATeIMFVh0+cGo0X3qa65z73vm9b1qsYZ4+c+zg
         NEcRF/r57SF6dwDXomyuNnP+vJGibTFsnu+vGe1Pa2N6LE0X7vNmZNTUxC6pZNixNSMv
         DZ3zhTOqrS8x6dI6xWmm50LCh5gAj8WsT8oCvBIUjCSqksqNSy5KL2Tmv9gCgId3GJ5Z
         5Tnb2suRxvE/3C0G+DNzFYziayFdH2TmgzjAr5D4Gfa3RXZoJ5HDCnuq0RyY7qnfmHDD
         THZA==
X-Gm-Message-State: AOJu0YxP/ACoqpbL6lLgPW1iit/5ergflAIomEpts8McPLAIFzQ9N7M4
	V7aVJSLmSt71/ohPK1a2qhzjLhetwm1XiL33iwyMIUwvnAxI6vrb08ubDDiV+w==
X-Gm-Gg: Acq92OFjXZ4ZVIxznHpPoij/pp5g40Wv+DTiNnAxiHIY7pbmDXTweTy5r+dcHTwpatD
	Wf2eHbb8+RVExMb4oPq4McZixxuqHJBRy/UZJimn7qCvkA79PFEb5q7ZjP01s0rmtYM7wZRw3jE
	1CPxGWox5z1YOkTdBPhiuqDvj5sIf7zaA89fcsTLDBvBh7ZNehbsXswsHA4Z5rndqXY5rfTt583
	ll5BAb7iKpaud9QF4xkGk8K0ZdKBkbgX7do4UzQ6CZmIRLpuydqMhFoIFwm25/N5EXcNwKU5BOo
	rMWGiKnyDobdlGHENHcx2+95HiP3fXflQdisFGyjU5Qgx1ASQtwyfQ33RK1klm2abVTGwg0D+Ns
	Zu9JOuh3R0pAjCBbN4WG3eEu8WnbOK67CVhZUbRWJQXTE2EViJH7IoQpvsQyHiyTzjyr6uOiw9T
	8W641udoBFSVnVO8V2ghyMiGm9d7R20IWIc+oP0hD1Qd9a4GtV6WBhZ0rrp8Nj+f1KLX3mni9+m
	YwbylZbzlTk7g==
X-Received: by 2002:a5d:5f47:0:b0:449:c1e8:7655 with SMTP id ffacd0b85a97d-4515cf125bbmr37422969f8f.27.1778492156913;
        Mon, 11 May 2026 02:35:56 -0700 (PDT)
Message-ID: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
Date: Mon, 11 May 2026 11:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Code freeze for 4.22 started on May 11, 2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1778492158-8AB8EA53-54B3D33D/10/73395122804
X-purgate-type: spam
X-purgate-size: 278
X-Rspamd-Queue-Id: EB07C50B04D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hello everyone,

I would like to inform you that Code freeze period is started and will 
be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).

Bugfixes may continue to be accepted by maintainers without R-Ack.

Thanks in advance. Have a good week.

~ Oleksii



