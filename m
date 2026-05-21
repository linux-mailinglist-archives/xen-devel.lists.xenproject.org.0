Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFz2LIJFD2ptIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB65AA8D1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315655.1585405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VQ-0002GT-2L; Thu, 21 May 2026 17:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315655.1585405; Thu, 21 May 2026 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VP-0002Bd-TO; Thu, 21 May 2026 17:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1315655;
 Thu, 21 May 2026 17:48:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VO-0001v1-GW
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VN-00Bm0f-Sm
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f452f-bab6-0a2a0a5309dd-0a2a4508d226-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:21 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4565-63b5-0a2a45080019-d1558030eda1-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:21 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso83934995e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:21 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779385701; x=1779990501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DakayXl1HcfjZmxzjuOvWT6rEYilW0CjJi4UVOgEk64=;
        b=WgQ1k3oJqUOluzpDSHJTeYHHwEkDmh1rEAdY4EYQ7IA1komQCVtNNZqRZBc08Faoh5
         9DXYJGfHRxu9epkA9qF62IeMQpwE+bBRwjPM9COyece1hQwBzGNYDhp/qbQVlAC0Zh31
         Oubir3oMnZN/314w/H3rAP5XkHXqFu/mQ7nNREJduCHLMjmyJ7lO2F2KRUbrQj+MPcsw
         OiXDyU0Djn3Ta2Z3eH5qEl8sIYtGofAIwYSdqbmq4XkC7bmQvkTJ1iwSTXv/Wj5nP9ST
         Zq2nE1pg3XKbxxGuCg9v4sm+Y+7ojPnUnbvmV8Z2yYcCDXBtU3txi+CKPri3ZZtBgMIF
         nidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385701; x=1779990501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DakayXl1HcfjZmxzjuOvWT6rEYilW0CjJi4UVOgEk64=;
        b=hNDiAyN9+gMlZy4Qvub6BWUe7r35PCwkBrRNB30Xptpd8Mkhk/E8sSUKXc5VsuOoeb
         9whzKWP3WCUwf8uITaWTfdncW/TPHirKu3IwdS40Q/ueKdKHQnWuRCZX1d2puncded+f
         oJ8KBPKadV0tNrBSkRwuv7dRQ3C1xw1WJdK0aityyUQ9g+PT7XsRkBLf3Gfe9tT0/KSF
         1gmIivTKdilewJKMFDhRTfdT6dTbWbCUMD7frZl8jeEUGCb3++Rm+gIUjrPJUZFP5s2k
         L8JCiIXZximvcV0OTEgA33nE+VnT+HTmoJPEWilNVxzDEFuQTHdRNRwMq02mbjRSi+RI
         s+bA==
X-Gm-Message-State: AOJu0Yw6lOdFGuXskcPg8cn9UdFNvykPhKz8kb9fqGB0zktDDejqCZ03
	1Dsc6AdtOP7o8KWDwPK42Qz79iC0gCIKtjdgd4xYMuUFff25c4GneBI1UY0mvdJx
X-Gm-Gg: Acq92OEsaL4Ttx0lC2jTyieY5CR3IxJq/3CAzqrpvB1vE6je/XYd0hmezrPAPsdlfoI
	pBwgjwMbpl+V+HSruwYrZtBKFiV0KOoeviW7kp5W3skJCrJgRlKHaL1IMtkRsPPfcrsfULNoJq2
	58/1aoGABTa/ZYCIjCz+DEkxK0E6J5/sCZwlIog04/aHbsOENu8wWNPSQLGYUacqnllzlKiEuMU
	vL+QYFlBJRkAf7lMFayoO864xHgLn3g1uRt6LNEBngm/sK91NvbtQzNbRnHDOj8RPgdVTVVhYyR
	4KNvyE4+8tjnkLLVTROEz0YhvtjUD9dnVb2qrV5HSinP+pvq1rS+NiCTB5eRpkQMuSITWlkz9ie
	lvn1/zYdpWKDuPLQnzMPwI4YUOUw6X7ysMBOv3exDqfHpABADB+G41dL/iP8wzGYOKoxx7+faBi
	tHL9kvb+NLhBHAjIqwGTjXfw+JrSvu55YaBC1s
X-Received: by 2002:a05:600c:8b34:b0:490:3d27:94f4 with SMTP id 5b1f17b1804b1-4903d2797c3mr35722615e9.7.1779385701258;
        Thu, 21 May 2026 10:48:21 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v10 06/13] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Thu, 21 May 2026 20:45:24 +0300
Message-ID: <455bd8ed7d91adcaa5953003bb2936c69c2fbbe6.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779385701-B7B7CDB1-4BBACC1C/0/0
X-purgate-type: clean
X-purgate-size: 1063
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 57EB65AA8D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

init_tee_secondary() was marked __init and freed after boot. Calling it
from the CPU hotplug/resume path then executed discarded code, which
could crash Xen. Drop __init so the TEE mediator secondary init can run
safely on hotplugged and resumed CPUs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/tee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..00e561fc78 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -128,7 +128,7 @@ static int __init tee_init(void)
 
 presmp_initcall(tee_init);
 
-void __init init_tee_secondary(void)
+void init_tee_secondary(void)
 {
     if ( cur_mediator && cur_mediator->ops->init_secondary )
         cur_mediator->ops->init_secondary();
-- 
2.43.0


