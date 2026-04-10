Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPi4Mnsd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01B3D9E52
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279438.1563935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECd-0001E6-6Z; Fri, 10 Apr 2026 15:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279438.1563935; Fri, 10 Apr 2026 15:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECc-000159-SQ; Fri, 10 Apr 2026 15:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1279438;
 Fri, 10 Apr 2026 15:55:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECb-0000sc-2l
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECa-00Cgsb-Eg
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5d-e002-0a2a0a5209dd-0a2a4508b042-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:24 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d6c-fab6-0a2a45080019-d1558036acec-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:24 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso17205725e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:24 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836524; x=1776441324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=harNJKN/3/ApQ6euFfpXmy5P6ZKtKwJXsuo2nm4shJQ=;
        b=g1sD7/Uo4PcCSc/3eYqqGLtCoyRxAiXEETYpTJ2cis30caJWidGoI69X0eSJJfWo3j
         jPVHS0qwFhhO6dG9skh7rfH9tr+tFbBdAtw5dOEFyjpB0TsPP7qykgA7zYPUkOPAM8Jd
         YUMnPWcAOCa3y1BUywz7PB6QD04jMsDwLHW9mnwSOyDFBQBXl4sKw7F8SbAlmEbI9CrI
         su4P8czBieEaGXYVdZEIaRers5sxmUb5ExekY8zPSpVIWCKntGEOdsj/BarL5yBZWIMF
         qn6Bt/PiqUu2crkb86czStbKHHSftzN7YGbZbNqyjxQVROpxLvO2jyfUKeFIror97ZvR
         1b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836524; x=1776441324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=harNJKN/3/ApQ6euFfpXmy5P6ZKtKwJXsuo2nm4shJQ=;
        b=Zon3tPA35X/Oc8++38i2Bvo1+Hq6KH2109vHSqEhlw3Vdd0IoRpuksNqmttHz2rSWt
         0sVR7USlghABEcEmpnOwu+PKafeCSnh/G349tgjiUFKGQQU+IgMrz+uE7MO58s1m9XVP
         BGS839c+MMRxX9XlJr5Q5KBHvCfsCWqc3Z/tdGwIBH5bMmaDF3qae1oTX7o6i7PU/gZe
         qwh5yCI1hh5T2TNi5P9TEMHRy32/Ccad/Le+ZP/qgYv2QzKukKT58Po+YkICBMxKLfnS
         tKRn1PkGML9Q8xnCNo8eTjNB4rmna0AylTZLs079u7htNHypMHp/yZaKRzcX3r02Ts5A
         tscw==
X-Gm-Message-State: AOJu0YxWpM8XzRuoqiRV1MnWLvpH4G8HkVx2TBOfhDO8TyJrC+h3TRC2
	dCYv25CkvuGX0YVBPKhTNnvdzUg4uta0b26kNmBnjvcTSgjMjtnTofioh7XTxg==
X-Gm-Gg: AeBDievad738q1r/4nwGez8WdW1/NICeZ9SGTU83nSEUPxeIigrKOObP/2+NHBjvlyK
	7XncSEvxsj/0+Xha+GXOIaiBuymb/6gi1nfdubr/pXlET4vJQ8CfHJ1eWXHw20unnLdnLSwWAii
	MwLyx3KHZh1e4/MubphsEX+cdEEcarhXG88Yxhj7X/v0nCGUPWfH7moATH89zVTbKARaxXaJuTA
	cRB6QrLIlqtSedCEudmwBe37Nz67lI+HwELb574ueZXM32BN/YUUnGUgk5Bn+/BAiqvZ8SnGUVa
	Ti0g4K0sY2uPG+xhm8adc88RU2Ov5mcbdb7Mj3bu0jMtxXll5TlmF5Hl/mzTy16poma6w9n1DuD
	XKcgxoXjpntyg85QKGGwqQ96CDu2MEBIjFWbj5HTiVSax9kwBtJ4OH31x1ZfRcejTn7EW6fY+ho
	3yO8sTgoeXV9ilEEF5EubBjOw4QQ7dYHuwWPGXDbLD4nEqyMMzezQyPJAetBLNgwYrmw==
X-Received: by 2002:a05:600c:3b96:b0:488:b098:b653 with SMTP id 5b1f17b1804b1-488d67f0a8amr49856885e9.13.1775836523657;
        Fri, 10 Apr 2026 08:55:23 -0700 (PDT)
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
Subject: [PATCH v3 12/12] xen/riscv: enable DOMAIN_BUILD_HELPERS
Date: Fri, 10 Apr 2026 17:54:58 +0200
Message-ID: <ad7eb62c8953a5dba09f285124251dab2f48cbab.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775836524-F5F52497-48010394/10/73395122804
X-purgate-type: spam
X-purgate-size: 851
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC01B3D9E52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Everything is ready to enable DOMAIN_BUILD_HELPER which are necessary
for dom0less common code. So enable it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move introduction of p2m_ipa_bits to separate patch.
 - Move to separate patch introduction of guest banks constansts.
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
2.53.0


