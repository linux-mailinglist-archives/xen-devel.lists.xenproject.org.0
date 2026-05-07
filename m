Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GZQJHFU/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7294E5611
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302347.1576375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZm-00051J-Vb; Thu, 07 May 2026 08:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302347.1576375; Thu, 07 May 2026 08:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZm-0004tg-ID; Thu, 07 May 2026 08:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1302347;
 Thu, 07 May 2026 08:59:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZk-0004Yz-NS
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZk-00CM51-3n
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545c-5cb7-0a2a0a5109dd-0a2a4507c4c0-32
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:20 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5467-229c-0a2a45070019-d155da2bac29-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:20 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bc264a50e7fso115628866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:19 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144359; x=1778749159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH2tI1zdc95RHRTl/e+FRWBkxeCQsomrrdcbdqDhv6w=;
        b=Kmg59Z7NYwjfk0BcYV1oCU1rHGF0tbMLkGA4BmM1QqI4SjGRT5MS8zpAVIGIoDdaAi
         QxiIet1S+VAiUy41AzljQ7lbhrP9mjqGA1ddsHtzjsomnE6OGHk7tNJvzfaUpmbaA2GK
         rnJWsilIrRbzJKyG3AAO4pJXJdBbuognIHGdIbqmE7QVTutRw75eU7Mvc/Md1e+iE/ML
         KbiNTz1F/sJ4nMioHIAkx/Q2SWRlgSQfYfjr6LYTVKdRnEpqqT8lPUn1GSuCoIdCgTD6
         50EpP2pqPCQGrLleyYNoRe8ZZIVFFocRbD0ao9Fz6Yfq/Pr1G3182NqYAuvX6yDROhYn
         TjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144359; x=1778749159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZH2tI1zdc95RHRTl/e+FRWBkxeCQsomrrdcbdqDhv6w=;
        b=Sg9vhZ5tTDxl6cDg4gDHVd0dsD5wKVfeOme3ffuW89X9PN7PBkiFtw0e9kA47UNRiR
         oEbf0POPiVONY9G/RoC5JAfRQuu5S9bQ/UTF1k4St1ELc8d/Ck0C4B2qTXHNxwDgCiYS
         htkvXhG6knQwJQ2RlmvCHBCBrcNtzGVc1T91mP8oyHSQ3994lgcNIPsvDvvcSc7PKrTr
         ZM/IhS6P7zsK1gkM6CCLAyLYYlJqjR+0mBjmEnSXXu5mizgjqTNXzh//p8RW17vqt5rb
         iXSt+TTJV8saoOlsfEM29pf8fjHJlMdLmeHs1Ngkhv9tg97nEh3c3YoiID8kDdaiHCz6
         6VoA==
X-Gm-Message-State: AOJu0YzT+ePsTvgFyNBwzG5hh3UuymL7br3YhHB4FYZ5ZG+mq/RTtMpJ
	wrhByrsbpjLIgJvXgI/FY+HKfYqlYacj5/O4kXSHfMqP/eBBVPqAUspwnjJq7w==
X-Gm-Gg: AeBDiesO/zTrrbelNO3qssTU95XZIPhh0C06tFbiIJAhhx1DN5Qdou1q/zRCpGObx85
	l9mxeyjBlool0oQn+4W3EHXdyhzOZEq9O7iF8J6lvty2mQW82T80zHX2vlOiYlx1mBCwPwNeD5c
	vBPD9rXv3OZjt/kxMTD9+kb9PDR9JFGg4LmMku3T4XiqEX8vhlEi1Ccx05vpveOXqvSRpwHjdOK
	HcGRMqBl5bVfbGWyEZ+XwtDypgkYvsQ+55bCCGeHZYsIhNvsL99RRQgKZpbKJ/sJb8R0SMrmCl4
	+oauQ5Q8tE1h9TOyXMucP6qq9XUghfsCiiC6Cvzn/ru3m/cXlktJanTI2Zq3aPjJiqheWQD0dlb
	iawcIdZBseGr8qYWDzEVAo00+ZBDVshFj6rQMWuPciVf6XCx0qvkH/yGBomYozC3YTtowVQoymH
	PEo+X5lHkMHwtG02+S1ov2+wyjtMLjCgwIaCu2oIedZlXSmcTMjR69HKPxq7Rt1onOgzkBauM7p
	mvO
X-Received: by 2002:a17:907:25cd:b0:bc6:78eb:dbc0 with SMTP id a640c23a62f3a-bc678ebdc7bmr211967766b.4.1778144358983;
        Thu, 07 May 2026 01:59:18 -0700 (PDT)
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
Subject: [PATCH v5 11/11] xen/riscv: enable DOMAIN_BUILD_HELPERS
Date: Thu,  7 May 2026 10:58:50 +0200
Message-ID: <4e9025c3f299f56664e25db5e5f6d198f74177b3.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778144360-28678C48-83882A4E/10/73395122804
X-purgate-type: spam
X-purgate-size: 914
X-Rspamd-Queue-Id: 8A7294E5611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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

Everything is ready to enable DOMAIN_BUILD_HELPER which are necessary
for dom0less common code. So enable it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v5:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move introduction of p2m_ipa_bits to separate patch.
 - Move to separate patch introduction of guest banks constansts.
---
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index a5e87c1757f7..41426c205292 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
-- 
2.54.0


