Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHikOX9SsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E081B255641
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250581.1548097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jJ-0006wm-Kb; Tue, 10 Mar 2026 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250581.1548097; Tue, 10 Mar 2026 17:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jJ-0006q6-Fc; Tue, 10 Mar 2026 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1250581;
 Tue, 10 Mar 2026 17:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aV-0001QA-Az
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec7c6818-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:39 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852e9ca034so34286755e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:39 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:38 -0700 (PDT)
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
X-Inumbo-ID: ec7c6818-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162579; x=1773767379; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mamu5j19p2jm+2KOEiHejDQrsNBfFkQPRRGxNqr1KWg=;
        b=jP8xG9Vp437cBtyvZ9JKQYRtm98WzA7SlDh1p+BbXOoTov03KSwS6WfnKcSF5uawJt
         aMWUqvixp3wHXgQfekpv0x0Xcm3wVbgnNgX1QGmZFEpq0W9SfvioCnytkgmXIbcDojgZ
         SypIPwOI502WWqvdreXt3zRzn0F3qeCtmw2LUs/13/7AmVyynlcvw4Gfxb+ACY3+UoZc
         OrTMMukT45e3pxvfboh/p1rLCl/bBh7dFYNeWH27WBUBa4lj/NC58xrEayubR8hD3agW
         XavDV9G6sGEK1g02xBIRVJ2VsDt5bzDmxmVXhoTQX5wmgzGd+dH7C4df9jdqaAo9LhM7
         tEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162579; x=1773767379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mamu5j19p2jm+2KOEiHejDQrsNBfFkQPRRGxNqr1KWg=;
        b=NnBG4TGMWBGpHjnHJUBifj133Lij6I46x7OnPkKa3YAU3tDwMV6MiLb2MdBHSGVqzX
         A5hBVTlY3yO97InO6o69rv+Y8+UpqaRGmINbhpa852jfipoV/1mKHVCpUkaqBG4Q9XtD
         2Va6pXFj5M4ib36YV+6U1zZ2VsCB7BVwb/hNyCVkY2G+btpCxzRFBsKmf6rqcEUXqAaV
         UeaDngROXaGxdmZ/TpRnHLocES2E17ixNfjOECKwIo3NMKipbgzpIDQKSqa3CgZBm0zv
         oVRMd8NMTvdTRvroR9kYl1lVnLPPtA/1Dld4EoO5oLWB87IyCXePDF8qDU8E7FTCqKk/
         LHzw==
X-Gm-Message-State: AOJu0YxUQeKT9Ejkf13B8vDI2jYKn+pezQIpSJWHnZKpeXgG8ioQAhfq
	3IQV8uIPQaHP0+pKtmgCKTefAOPrRoebxLHHGq8havPMazNIBtz3L2Q5VZ7QEP2s
X-Gm-Gg: ATEYQzzvqUs1oJbbDe1h84Ou28aP5yeurGtb9cSxusggKVSDraaaEtEieypHlwyEHu4
	dxzgqw2j0vEMQREUQeaT+0aIzZPPXGXYjrMg9mfu8seu03nzQQvwhVcOX9+VfMUGKHhr00tbsHm
	PRuYFvQMYxBvRGZ7Eqj6dOJhVpLg2UKSdwmsMA3yhsQ6Pk6oppelv5r3wzCX0ux7kz8/hwwyiWG
	fJj6Yq2U9PLBrw80n6BCNftw3klAGWNo8Z/dKnC0mPaMW/mw2boQk02z1QPlwBqbR5tcc4o5QSe
	Mr5KAm+OKaCO2XExn/vA31WbkTpcznDeWCkVO7+JbMR03eLpCWp7PdRr1T+hsg24BEJkOV7JEOt
	IHx6G8vDcnalWzD+ADlO8Rzo7Nxe0jj0NLKqeAI3CZCaK9KarIjpeVYKp8MAug5oIwJ+HovTpo0
	8VVsO4lLIxje97cETKJRpj/ioDdRuqytwOg3wSIon79aUfpKNWS2o6IQLn3bP0kCCZWA==
X-Received: by 2002:a05:600c:4443:b0:485:410c:119b with SMTP id 5b1f17b1804b1-485410c1bfemr84140865e9.13.1773162578900;
        Tue, 10 Mar 2026 10:09:38 -0700 (PDT)
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
Subject: [PATCH v1 25/27] xen/riscv: setup system domains
Date: Tue, 10 Mar 2026 18:08:58 +0100
Message-ID: <4474cdb8e326c486a806e07d65ad6bdb9e7b9541.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E081B255641
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3e337bf611fb..5bc34e41fe55 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,6 +6,7 @@
 #include <xen/compile.h>
 #include <xen/console.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
@@ -157,6 +158,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     rcu_init();
 
+    setup_system_domains();
+
     local_irq_enable();
 
     console_init_postirq();
-- 
2.53.0


