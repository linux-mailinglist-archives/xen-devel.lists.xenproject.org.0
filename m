Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDwNKHVRj2nnPgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20F138080
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231312.1536507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2e-0005wX-Uh; Fri, 13 Feb 2026 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231312.1536507; Fri, 13 Feb 2026 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2e-0005oF-OL; Fri, 13 Feb 2026 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1231312;
 Fri, 13 Feb 2026 16:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2d-0005Ws-8z
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 226660c8-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:14 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso9262185e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:14 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:13 -0800 (PST)
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
X-Inumbo-ID: 226660c8-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000154; x=1771604954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xayJDkaSPO2aBUbsoQhFpwQ2/yxRUvX1GYhVq8xOEcM=;
        b=cM7JmWEYRKysxi+TTaAIuaCeaMegx1gxAcfk9gFIF3bzAHeEqjS/6fCKfkyc3vlw6N
         3eLfw3rjQ73uOwmq6aB2ogh4r3AjZ1t0DaAAzswOgVBfF/+FVvOyzKpohvww+wWLRpDr
         jJiyP6vYaEMPhfhYlv5bJPk5mqfCLHZWQs1pPXlC0ydodeIhmk6dbjUvNqrCAa0TwWRN
         sQ3pnUh5GUwBiJ4I6DA6EEwKRRyuUQbvDjLw1mx0NH0797kH9IeNmi+x2MqGtDgqvbys
         n3gKsDwUee/3hHKvszn3ePHnRR7EzQf1frnmkWANbzVkNZc2hIqnbbOJho5fC5ZU2WsA
         MSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000154; x=1771604954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xayJDkaSPO2aBUbsoQhFpwQ2/yxRUvX1GYhVq8xOEcM=;
        b=YpGE4tBdd65/zA+/d4T1W2eRbqc7yagzZxKX66/O72FDSjd7/KiRZUfb2NsA7uczw1
         5LWUhP6Vv+v0RWMPbyEsWjT5xHhqctAf/3MS3tWMiSl4z3UuTuNriZow66ekDmtJvHzT
         mqZ1+knbj1ru4zBA5L4rC/goGa9I0og1UONsPTBwBxsB1AjtLHWrFnWXIwJPpCE7JSwc
         yOw9EYCo/dJ0BwReavpZiwfkQaGr2bLXWT6YLFTdfdU9GW2/fWISkkRQ+B3ja2INo8i8
         vewOMiQO9Z7WD0+Oj2Tr0v7M9bI8N2+i+oy2Qs8Jhy16d/k1cjOOL/cil14xjYEx0xXV
         tEmQ==
X-Gm-Message-State: AOJu0Yz4nrOTvCMXb7s82nUKieRNrZtFLSokcbdH2yY+m/HgWNKAg/Lf
	33W+81gDuC0A1ufUhCPBriwQI9l46o28crq5M3FGhe9T5aLni5/AsDoKzvXNPzxi
X-Gm-Gg: AZuq6aLtKHC3e+GF8fOSKP6U88/UR+aXm5psnKVCAH3K15Cz6hrouJj5wYN3ww9lnop
	xioTpFvrpThe+OaMEbdI9xxPoz4nJxnLiCY3zuNljJ2O/0I8NMdVXd0izOo2RNss1/+i7rAINkn
	6qdbiX3nZIFPAzjOd8ItySZ5DrCtagtdD0qjpSsCAacVMVSnMyae3oSg5X/G3saak7caJx9OdrX
	iPvlKQzLWGmvpH3h+85w3xdNj80ZEfJ+raseytE8jblnHnLqpXVhJDcM36YRSxtY8MucpwBEBuu
	2WMmQm+Am9PK9Ajctp5iguck9uGPF86UBnreFCNRpVtPmB11SW5on6lnogapgiaUdNrmECArwiV
	7xaRA/KwV+3XHrmCiKKGveiz3C5z5jFoEfczJ+m8wGsLyLFIzB4CRzfMniWFcIFE4+Z54J0Yiyw
	vqbb+Q/6HweovyYzha+FQAAnc6fyOnLShEA37so5H09mgfL+dsjlx02EURGk4ziPtbgw==
X-Received: by 2002:a05:600c:1909:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-48373a7438bmr36959985e9.27.1771000153375;
        Fri, 13 Feb 2026 08:29:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 03/16] xen/riscv: build setup code as .init
Date: Fri, 13 Feb 2026 17:28:49 +0100
Message-ID: <d2fcbb9248ea1659aa953e9c8a8bde1c4a2282c0.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9B20F138080
X-Rspamd-Action: no action

At the moment, all code and data in setup.c are marked with
__init or __init_data, so leverage this by using setup.init.o
instead of setup.o in Makefile.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - New patch.
---
 xen/arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index caa1aac5b2f6..bc47e83b26d7 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -12,7 +12,7 @@ obj-y += paging.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
-obj-y += setup.o
+obj-y += setup.init.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-- 
2.52.0


