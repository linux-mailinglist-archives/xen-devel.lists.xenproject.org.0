Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAoSGqpJ5mnSuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:43:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC0442E808
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286271.1567369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqmI-0000Dh-KD; Mon, 20 Apr 2026 15:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286271.1567369; Mon, 20 Apr 2026 15:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqmI-0000B8-HA; Mon, 20 Apr 2026 15:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1286271;
 Mon, 20 Apr 2026 15:43:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEqmH-0000B1-6P
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:43:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqmG-00Dxww-Ja
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:43:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e64961-5cb7-0a2a0a5109dd-0a2a4503bb5a-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:43:12 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e64990-672d-0a2a45030019-d155d0b5e841-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:43:12 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-38e7d983f91so35157511fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:43:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e1116sm3057809e87.54.2026.04.20.08.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:43:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776699791; x=1777304591; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo3SSlagsygm7+QLvQ0Jkrr9R/z1fIVartmTOXPMR14=;
        b=MkkcTRDjezX3j8xgi/aUUo0AQsQ5QZPeOavsPw3gKWYfz3fFbZ3cNH+IBpfSVE2+91
         GI1qhn2/iEp4Z3Msbqft9MIHROOQlwl4GaQvZwzJUU/94UDHx5XUfnXo6SlWRfG5m4s6
         eg5HnXET41MkvdJnfKteSDadZhAsB2r1enPuF/lMmknrkpUGL4OIV+H1tg61GalsEauW
         1287We0kclX3yfGN37vNfE94MOmKIqh5WRRu24D6JCoWuXbbp6SqBffr0nHPro6u2EJY
         +Bc30zFzPopv3h0gu3bJBQZ5JabEy3KCUg3/CDsFbE/eui7f8SgbPlMxTBPb1F19hCz9
         cbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699791; x=1777304591;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jo3SSlagsygm7+QLvQ0Jkrr9R/z1fIVartmTOXPMR14=;
        b=jdaEBQUuGQp1yNZns+RaOxfvapQhIx+GZtdhXq+OUImbevBuv7wvvi5ErMcxk+aOMe
         j91tgaJgbTmyZrKfJFNet9W4uk7M0HXlXJYuku3WmjzTJDMErlVzTZ870RVX1Syg1jqs
         puhST5/eczxHo0cZOg07He+bTrPk3ivtPvwoRLm2sbedHjDKtFucHJZMJH5JN5Sci62U
         2WRS6GewE6Nvl4j7/1VBvbE2LLrt1o2MhSTemrsL+zgBHRf6d8Gg+feypQiMZER2HpfU
         mSuPNDqjIYqC3u+dvXSgzGaexSzGtqL/ikZtbBIugEpJeDmaaajLNTZkRVIVHWbObzoz
         3QeA==
X-Gm-Message-State: AOJu0YxceNR/ajiBp50Ff44f10dysxrDjKlemd+I3wFgzd2z4Jqt5rzO
	4jkUkJigvs/S8y3c3uWzI+gVW4XcgrtVI/4RY7OHGbPm3fUcx3QoxmW8K2YUfA==
X-Gm-Gg: AeBDiesi2IXVaa0vbAA6jkrYo83Eaz1UoDUb+m6+H18ShTGvBydOPMfM9FCYa+f3Ct1
	SI/TzpBfXQ2X5rTmHMtakllbFyE/P9CBLIbiHZRejpw9N2wEK6snlIFORUW/dzdLbtue+h7DtL6
	Y4GrSL8XrEGaDLGWpoQH4ABv/3Qe9hJMlnc1SS/hl165pScjsxBGdX+o59YK4Wgbt5txo6I+rCO
	+8GLuVdibvf4LNt79VVR/gg8DfRv4vbpOLLhKaRa+odmqp5iODx/RVd1P+veydSfQT+clta4HPZ
	jCRdFLVidB6VKyteYWvsh/rPZQ9asLnZAD69V1DuEqygy8A9d+HA9aEbq5VW8JrN6QxidXumxI1
	JpiPiSfBvPeox7khqJU6GgRrxLXIrCYM22X26RD3YQTI7FwWMingJ7uSkTYKkRUCGL7iBKy/cyR
	dIpIe+cuHhqIPgYKse3g9SMDawKM+iV2SuWfUjx+oqAaDVGHqhk26Uj1qW/njvNWN23U8EmX8is
	48AXn7NMf+86A==
X-Received: by 2002:a05:6512:1295:b0:5a1:3d7f:8f99 with SMTP id 2adb3069b0e04-5a4172e310emr4540745e87.33.1776699791169;
        Mon, 20 Apr 2026 08:43:11 -0700 (PDT)
Message-ID: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
Date: Mon, 20 Apr 2026 17:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Feature freeze date for Xen 4.22 is Fri May 08, 2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776699792-28B74938-007F27E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 452
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 0FC0442E808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello everyone,

The feature freeze date for Xen 4.22 is Fri May 08, 2026

Patches adding new features must be committed by this date.

Straightforward bug fixes may continue to be accepted by maintainers
beyond this point. They could go without R-Acked.

If you would like your features included in this release, please ensure
they are committed by the deadline.

Thank you in advance, and have a great week!

Best regards,
   Oleksii

