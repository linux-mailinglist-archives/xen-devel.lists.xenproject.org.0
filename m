Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DXWB/deA2qE5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A55257BA
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307279.1579037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcD-00073l-3a; Tue, 12 May 2026 17:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307279.1579037; Tue, 12 May 2026 17:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcC-0006zo-UO; Tue, 12 May 2026 17:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1307279;
 Tue, 12 May 2026 17:09:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcB-0006je-AA
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcA-007RzZ-NY
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ecd-2eae-0a2a0a5409dd-0a2a450cc83c-42
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:50 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ede-62f1-0a2a450c0019-d155802cd561-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:50 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488ba840146so52227225e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:50 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605789; x=1779210589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DakayXl1HcfjZmxzjuOvWT6rEYilW0CjJi4UVOgEk64=;
        b=cAQIIWgAWAGIPmnaZZAS4XIMFuJXfTRMsGWqcwEacYG+636c4ClEYaCqJ8enY7erIQ
         wki+qF17lLkph6PvoVud8mKLdwl2kPCIST2rJLFTKoQqwlbhymFWvjq4Y6R17ZCdh78W
         rj+0Egmbhcs5c+OGDRwKwrn+enmZcFAKPVVnehqiNkq7VB+ICgJLWkwRDecMJfEsL40J
         lAJF0jOIl3FRJ3XLp9m0vk3tnqWuG3pJzjsr93hDEfA5rxUuyY2cnbalTsIvtj8zoM7P
         u8Bc2LECdGECYhgDdZg3MzMhSPy7hMBGMsuK1VMY1Z4vWSUDU8IQNroX0Hl8mdn2FZY/
         fShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605789; x=1779210589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DakayXl1HcfjZmxzjuOvWT6rEYilW0CjJi4UVOgEk64=;
        b=hcNGrQ/ozKXRyXe/rcFSMf30VJQRDfslBkr7jv3MD1gmCFQoDMfZzwrsyGsZKymkko
         Uafu/ckrRbIELzPagxRkWQhTAWiax4BFCoi84ZM92uU11PF9rxUfGx6t9I2NaSIS91GU
         zzF7bnObajHLoLljfoMiH/6aZwWjmLKXQQQm0zL/iwAx9A2FA1EI8wGeLNa6YbQie0NM
         qTbybOojidbxf3Op1jggmmmcEZKyWxmrebV46Usb2og1ndICx+GmNTMn7shtNvk7XxWG
         lB/jOiH8JfI9sIDWp3Q4yd7NRHMuVAKD/o81KkOTbRq3SMDIttEXkvhBCX3YZwRCv6Lb
         trlg==
X-Gm-Message-State: AOJu0YwtMLiGkk/Om7WiUdcOTOMbvWq0YU/XmRFqQorH+evb0xVze5rJ
	1tFetFr19UUqaaE/LmIyLdKZJDzWVi59WQT4GB9qpZrKsk04R3jBdi0rKenuFA==
X-Gm-Gg: Acq92OGejGBwkRi7a7ChsvyNgw9/a3NQYsDiKsv2rEgHqbx4mN0KTZM7AIce+UpjvOF
	xDVR4rmq4KgUMG9QChBkl/FdG23JrWQEwop57DrZuO1dnayzkx931U2+OEYdbMEjwIdLRnCa8kA
	O8L87oGAqtj1xS8Ogiy8LN3nYUtMIqK5rabaVZpDn3gCozC8Ad3VcL3CTVBZChNf4Y/44I2KXrJ
	OnvGReqKOz3ldnfzZCrhBGP+o8gZ7Ix9YMIOO8OrhQUBNQSYboGaHm5dhbhQl3ywfSSnOOHQ92K
	roidLMK/kp/ROmT/re2ADMVmm341SgWLO7P1R+MGRle+wkro5ZPnKB7T/Lv78O6YBgbJr+qhsIO
	ISW1+WzI676sbdZiUjeuGD6a7vKiE8Q3gLD8MpwvwNUD5A/t+Nn2qLdu+KjhM3LxJDhZbdRgM5m
	a5FyvZMDMDol7W4R3Q6+ZtGbHiAQ==
X-Received: by 2002:a05:600c:a11a:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48e8fe018bdmr46019965e9.0.1778605789514;
        Tue, 12 May 2026 10:09:49 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v9 06/13] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Tue, 12 May 2026 20:07:13 +0300
Message-ID: <dc2c77383cdbd1dda524a5c1c4778fa93cb07706.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778605790-DB370CF5-72B238B9/0/0
X-purgate-type: clean
X-purgate-size: 1063
X-Rspamd-Queue-Id: C24A55257BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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


