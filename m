Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9PYqEJBtQ2oOYQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:17:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AC6E1084
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:17:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=L7VJs5Be;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348394.1606182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSij-0001Jk-7X; Tue, 30 Jun 2026 07:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348394.1606182; Tue, 30 Jun 2026 07:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSij-0001HS-4B; Tue, 30 Jun 2026 07:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1348394;
 Tue, 30 Jun 2026 07:17:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weSii-0001HH-Ds
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSih-004etx-Qu
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:17:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a436d7a-bab6-0a2a0a5309dd-0a2a450ac65c-34
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:17:23 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a436d83-e40e-0a2a450a0019-d155a72fd9fc-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:17:23 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5aeb2df5cc1so1868866e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:17:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aebe4a027csm338865e87.63.2026.06.30.00.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:17:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782803843; x=1783408643; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGeGHvmNAYVbdeIY74NCQeit3LvXqS0zsNlfZgsG46M=;
        b=L7VJs5Be3cjzFSu9TbIwVTC8qq5UcQtJIE2ec7NpPZejVgwZoYriAX93TcrRwM8vQy
         jF14z3vrkrCfOR7J9VI7ds6MYK09sZmkTiaLpcZ+so6ielS3Z+K8gwKs7p+EzwWZVYQU
         pEua/iUsTHUqZpr/ZcAKaC3Pp4oMPKP9nYDCfu1i2Sf/LE5alrT/lFVwVxOcMlbJ28ia
         knTfik3vR+sLv45btvol7ZE2RZShy6vl3k8WeBOVBiAERzf3iB6gkbzbwLF6o93sMWww
         WlAIWjL6wPw0s+0fDr9MXKF2DPdGHubipTj5lieMI4Xe78t1e2tSKC5jtQScHpzqxIwR
         FEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803843; x=1783408643;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGeGHvmNAYVbdeIY74NCQeit3LvXqS0zsNlfZgsG46M=;
        b=PeiaJ2pVhzkqs4Tz9R6o+mp3hn+xYev7qMCOOr+2lB+4pAFYRCdrJKlbZDqzv52Pe3
         neHuQ+m6QuqJlSTOZ+AoN3sQ6//lBwRGatyIESvpdWqN4/ACnJId8Nd5w0wZulw7fe3t
         nAP6QBRwgeVpRXXV5tMFdWbTjIcTSt1Y5kjrVZs07A3zrct3Hq8WlqcxQWJ0vu0Te2Hr
         KFSXwAAyzWCsgVcRfi86uJoGok+ogUhhjWZd8ZV1X1Y4+RAN+crDgiVOPiTUF6EnQauf
         +r4CiJgI1aTCTt6sbct20a3Rjc+lz25pq9/zekkIGCDq85B16OeCE1DWnDXr9FdGrrj6
         WpVQ==
X-Gm-Message-State: AOJu0Yw/DN+CHo+vNDdVgdnKUe0PMu9AO8Mjd/dhu2IwGfdTwiBkBrFX
	/iGvC9TfQSCZoOs/MjUOXF/vQA9QSULToACLCB2y5rIEltj2yCrVRKU+NETGaw==
X-Gm-Gg: AfdE7ckntyjCxrW0GAV/Pn+tT8htOV1ctnoKupt6pAN8a771heajmmyh7UrA5phOumN
	ijir88WW5QRhLJcui6SaKTFgkzHM3kAKreVJloASlnIR/dNujJVKfQHWGN1iOoZgQppffQ1kjTX
	27qnxMXWChg/m4okd6rFbZJFnT0hcKO7B1FxJf8ZQWoyIvzc5edh0p5XGkGvoUKz3IvdnTfUlvE
	Agy5a4JUkcRYY82Ykx4AnzTPS4CChodK969+nn2ahVF5k4tk+ABeBmeRT3BYhxulaRSvATluNHz
	0JLFl8BzV0zVJIP/hCJoeGsO8TfzFLtaOJovrwlyoQ5eoFUyi4tsRC6xfEePkJTYhAWsRnVG0s6
	O7oKVBnOWjqOD9pE02RDpVAAR2j3Z1sorrJui/NLbPDQ7E+MBGnJ0KSVzC7AGXvW3E+TA9yCrqv
	wZAS1FnnTvTiSbQpxV3Fw71lv0CkKRMl+H50GsQL/g2bbB2L8MnaM5ETV+JWZmfxq4XpI=
X-Received: by 2002:a05:6512:2c96:b0:5ae:bbaa:513c with SMTP id 2adb3069b0e04-5aebdb9729bmr487181e87.7.1782803842780;
        Tue, 30 Jun 2026 00:17:22 -0700 (PDT)
Message-ID: <22819752-5c78-4ccc-b9a6-c940f4bce113@gmail.com>
Date: Tue, 30 Jun 2026 09:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-announce@lists.xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.22.0-rc3 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782803843-3E806DDE-FDC104E5/10/73395122804
X-purgate-type: spam
X-purgate-size: 420
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: DC0AC6E1084

Hello everyone,

Xen 4.22 rc3 is tagged. You can check that out from xen.git:
git://xenbits.xen.org/xen.git 4.22.0-rc3

For your convenience there is also a tarball and the signature at:

https://downloads.xenproject.org/release/xen/4.22.0-rc3/xen-4.22.0-rc3.tar.gz

And the signature is at:

https://downloads.xenproject.org/release/xen/4.22.0-rc3/xen-4.22.0-rc3.tar.gz.sig

Have a nice day!

~ Oleksii

