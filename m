Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCrvDteHHmr0kgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:35:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E303C629C25
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324510.1590057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJep-0000r6-EI; Tue, 02 Jun 2026 07:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324510.1590057; Tue, 02 Jun 2026 07:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJep-0000oY-As; Tue, 02 Jun 2026 07:35:27 +0000
Received: by outflank-mailman (input) for mailman id 1324510;
 Tue, 02 Jun 2026 07:35:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUJen-0000oI-VR
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:35:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUJen-002ZcT-5p
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:35:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1e87b7-2eae-0a2a0a5409dd-0a2a450aebba-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:35:25 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1e87bc-56b3-0a2a450a0019-d155802dc805-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:35:25 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so16333585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 00:35:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ae448a67sm25870875e9.24.2026.06.02.00.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 00:35:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780385724; x=1780990524; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLwxPTrikKfaGUG4EwcHtVV1hwDTkV2h0VUQTArE6P4=;
        b=Zyo6rL4rJDCenDT/2iCKCMY80v2QLlSRrmqv0ufYaxddEyqcn0gzVLeKt/agl+mjrO
         YoccESPjJ3RAqSoI1+c4i6s0L2vMMzTbC4XeXPzYcAA5lIq2ez+Ma2K19egEN5sRjqC9
         fluKnhSp+duHaSJ8Lvms83fIPANXEGaPHW6FOlzMISZMeHd0GrDxpHaNilsMeYUpt3EB
         XXxYPTQ/Wn0Hgi64G2sz3EXVMCwBzFPztCbLg2ctxWtnWBBI07ON+jOLCcoERqSYtcTG
         nKl0eIm5xXjKq2z35rOSX4py+1OKOrTyBrOLHVzZgWhic8n6vw1yIMHWXOtCIkK/Thh0
         ttVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385724; x=1780990524;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLwxPTrikKfaGUG4EwcHtVV1hwDTkV2h0VUQTArE6P4=;
        b=Tvco927ymSj1zmsrn+OWlkRJ5WtFxR2S4qc+akyXgHBorejKo4sFjesQ6DA1kAZlzM
         1RFAPXgwU3gnyotAiA7Ggu/2roXo+Y3fd9JpY5ZM4aJC1jExJM/g8zN2f/2Z8ZPuEuWu
         K8CmolvmlQmJkiCXovn6rl96J/zLB7yfvaI97BASPsA6UHd6R+fKI4mRlocO9ILuPlT8
         nbsTvL51Yq62JAlKrSgHbJFoZhjyN4BvmrVwCv3x8xbMbEWYrLulXCtHY6mVppr2FHG/
         vswprrz/wa6gQ41MkM4J71uKV+8dTFKny0FG+qqp63rHuYPw4s3Uog+lp6zflaTNc4as
         mpww==
X-Gm-Message-State: AOJu0YyYhPtsX8IcIFa48iqipKOqAP2fm42BAfJ62pwq2iePvyOXNnr5
	Te6WohbhrF6MEQ8SW/RKcMqWvkeAUjnJI55VL3nESsLKfXO5uJqHf7yyabVCSQ==
X-Gm-Gg: Acq92OGj4OzIZi/5vEfe949vCofl05TXuWNIKIuy71tpDWo1HcjjkEWD84Hghwtkjcc
	nHgHkd2oXJzpOReQKk6ySyg6N46Z89BXmQI8VTrjl+R+7tlkIohMtRWdobZqo0fYWZsi7Uuk0vH
	CY7MT6OBFqpVbvybJ0xUDWp7V7ZDBGN+5jPkaqJ1mRWgbctKD2FZyC0c4NFR8N3FFqiGpiRalR5
	z6Fe7wGr7AKeoKIOmZQIWJvljjNBZqcFuZ0eid6A9Jauh5/+JED/rmDMI908YaMPhSlNybEvhYA
	o32XwEWnDBR+R89vT6SMt1V8ZSUWbesQPQ5M7uBRxM/qjs1bM6h4aeH8q90jBfh9pIKzBX4uQW3
	8l8YqU1OOlkldpEyFhM7Riacye8IXQXs31lk37F9FUxaL21n9doSjaHLc1TglxFli0kx4hqXEEB
	hzydvJBEzh0AG8JOxSTJsfu5MwhpQZ8jOyTU5iAy+E9QdSTsrvUX0NIBZdeAnJX2MbVuot1nLwy
	BmRMIANTzk/ajYjfGPU3TIZXqQ=
X-Received: by 2002:a05:600c:a009:b0:490:ad8e:11bc with SMTP id 5b1f17b1804b1-490ad8e1279mr103370405e9.31.1780385724268;
        Tue, 02 Jun 2026 00:35:24 -0700 (PDT)
Message-ID: <59b3567b-335d-4f66-b79b-79db026d74b7@gmail.com>
Date: Tue, 2 Jun 2026 09:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.22.0-rc1 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780385725-7C07C8B7-2C43ACBD/10/73395122804
X-purgate-type: spam
X-purgate-size: 425
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xen-users@lists.xenproject.org,m:xen-announce@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E303C629C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello everyone,

Xen 4.22 rc1 is tagged. You can check that out from xen.git:
git://xenbits.xen.org/xen.git 4.22.0-rc1

For your convenience there is also a tarball and the signature at:
  
https://downloads.xenproject.org/release/xen/4.22.0-rc1/xen-4.22.0-rc1.tar.gz

And the signature is at:
  
https://downloads.xenproject.org/release/xen/4.22.0-rc1/xen-4.22.0-rc1.tar.gz.sig

Have a nice week!

~ Oleksii

