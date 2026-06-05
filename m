Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/qTD/N9ImphYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:42:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B2646169
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:42:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SLa3KqF+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329114.1593328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPCF-0000mQ-4i; Fri, 05 Jun 2026 07:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329114.1593328; Fri, 05 Jun 2026 07:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPCF-0000kc-1Z; Fri, 05 Jun 2026 07:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1329114;
 Fri, 05 Jun 2026 07:42:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVPCD-0000ig-FP
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPCC-006bR5-SK
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:42:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227dc4-5cb7-0a2a0a5109dd-0a2a4502b096-46
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:42:24 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227de0-af86-0a2a45020019-d155dd36b90a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:42:24 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so871590f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:42:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm23245333f8f.18.2026.06.05.00.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:42:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780645344; x=1781250144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvryGODgbOzgXS1AfKF5gbmQJHahukzlKpGhtIDkmUo=;
        b=SLa3KqF+aPX2lcAqf9GBnPcah4hhCMLwKQ2cm2kWFNTMElgd9plEjGpR9PT6PRg5+2
         7ZUYE6osiQlHdtPpE6yBG79rEyxctttxNr+CW2ltRU6vhgfjnmpQk0L6R5/HQ753bv03
         rllc0ygvBN3STN0tufQQLBk0uGOMT3t0X8xzjId7iZ1r1lhg6qA538BRYrDsYV3R7G0p
         /JoZlAl2jyApUA6rb2dNBZ9NFXYDPWJxu0Yo609uGl7wOngmT5RRqAcIU2N/mzytU9gs
         i6WxsJsP4CdGTZaqYw8nlNYRIXj164E88ftbXjESJ5RWnzNTRIGzbk7eQ7gwUS0DHsbJ
         YDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645344; x=1781250144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvryGODgbOzgXS1AfKF5gbmQJHahukzlKpGhtIDkmUo=;
        b=heFFthfrpT79tmxjAH6wYgaWI48MteOlN3+dePWcmX8FlUhWen9lsWwQT/vdta5S7l
         eDmpWLnveezPYeXacSM0R9D6ebe8gZnX+v3vGfTpDw+Lp0AKnTB0hU9VQmXhIRPSpgPU
         EkToFvAipRF3YV/kyrvJpNDI3nuQTTjDkbT24AUpmGY78geLGn2m7A0VKmsn1n7ev0Kh
         ZLd2OgIz7gLe+w8XWBq1VfcRZgx63Ey58fNUObHBnfOiz3SPbKNXe6uQXsaGGgVx5LiN
         nKzIKe6QBW84YNQ6koYIND13vjDenirrEsdcYDr0GHuzZx9BVKm1FO2qB6QQ+79fhREe
         du0g==
X-Forwarded-Encrypted: i=1; AFNElJ8iYEcod9GO5rnG/M4YOLJzP/ONALzz4OZem2ldvrAOQfvy5SuCXbwtERDeUYLw9C+nKZHalgjuznE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsyf7taIF6hi4hLmp3qsA8C7RM5J1s8ual6DZb6GfoIV6wLYTy
	meNUZxALSNiUqukvd4At6dBQ2TBE9BJDmtzEtOn42RHMM4oV1RBkhdk+
X-Gm-Gg: Acq92OGdQGBMJ/scPwuEOkmKsS4RKfnieIHu86DuhCGOceatm7Zwym3tnhzyR79LEEd
	pHoF4vy2Jut9jk+6C8hvQwejZA2WGxY6C2XAJsVZGN81NkN8bDfNRs93CjQ4Oj/W0rD4QC3El3y
	niW4CIWKlKZcXThxBZpIckzIIQxZKWw0VFrsIbhCp7Zol2gmghwR08OooiO4DX9SQzVxKliSC7G
	1dKas3dWOPex/bSBnpT268WCj9n3cHa967GojdHFDVixsXqXQIja99HHSumP0F6pRUrQttHSnjw
	OmSH89f1nWWu3WZg96bnEOXvbwcjr0P7G1ANWMKHe4pJio0iJ6QwkeRGbL/C4H0EYJt6dwrpc87
	Z62vbOBuyzyU9+k8wcK0bItiaWh6ManMFBmqGQwVuEynfxXjqFV+URclgaJNmq0NNRW4n9a22FU
	HHCpsB1rRLZSM5FD9i090ufEMfXByFfDprM3MGlT3i36yW4sKuTOl+vmDnyUCaUy7q2g+vKbU5U
	L/KOQQcfoDSOlSz
X-Received: by 2002:adf:f24d:0:b0:45e:ed7f:1d9 with SMTP id ffacd0b85a97d-46030615ab8mr2928224f8f.17.1780645344024;
        Fri, 05 Jun 2026 00:42:24 -0700 (PDT)
Message-ID: <b189d8f2-ef56-483c-a9e9-c0f961d1fdf9@gmail.com>
Date: Fri, 5 Jun 2026 09:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Ocaml maintainers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780645344-8336C161-C8A00473/10/73395122804
X-purgate-type: spam
X-purgate-size: 892
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,citrix.com:email,suse.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0B2646169



On 6/4/26 5:13 PM, Andrew Cooper wrote:
> Christian has just left Citrix, and Dave almost a decade ago.
> 
> Andrii (a XAPI committer) has worked on oxenstored before and has agreed to
> step up as a maintainer, and Guillaume wishes to get involved and learn too.
> In practice I do a lot of the bindings work, so lets make things official.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

