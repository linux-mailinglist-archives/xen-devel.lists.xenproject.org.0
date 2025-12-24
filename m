Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC4CDCE96
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192951.1511985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH1-0003iq-RW; Wed, 24 Dec 2025 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192951.1511985; Wed, 24 Dec 2025 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH1-0003gu-M8; Wed, 24 Dec 2025 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1192951;
 Wed, 24 Dec 2025 17:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH0-0003CV-Ph
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc64ca4-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:42 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso8317203a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:42 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:40 -0800 (PST)
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
X-Inumbo-ID: 7fc64ca4-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595821; x=1767200621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3trXYiveaHvhlgyXDqsatKIS2roH4Y0Sc6KIceNuMI=;
        b=NuV3PMpskygdAPgT8ca6gM4FGYNEOL3TKCj404/GxHKDeiH6+xIRwXBQonRl2KmNx3
         cyn/dK4qp4TM/pGn8xV+Fnj6e58zaKbCmdZBklcW0jPeAff0NSsytKajO2uHM3YEhyMp
         RFWeAdPLWAkK1amuVZZ0F0X3d1DzSiYQuJJ806f6Cl0EpC2ayISMxMPa1T972+h8J9Yr
         ANnHmhVPJwnjAEoBGvxqEM5QhWvFEp8uJU2wtsOHoSusE2hG8gJCwuF8EVtiRCit/tfm
         QklVcf9jT1C1zgL+P+5nZCdqZYJjsz0wQ14/ecYTEA3Hk1GQfUNLotK+DKUy/jN0KgTI
         L2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595821; x=1767200621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3trXYiveaHvhlgyXDqsatKIS2roH4Y0Sc6KIceNuMI=;
        b=u3h2bllInSCYIRgZujb4p94MrP7v7KRY6oUiQDjKUxL96HC+H4sMBF+pFyeAphI2+i
         sLTp2zJKW18yWz50zaXAJQQiNTZ5QI7JQorUgAP/tY9Pt4otmNKbY945xOtF7+gkEr42
         o10NFUVS6Ggm3bt+CEPXZ8CCZzkIVFHBLavERGiqisYawnu8aMo1PbeY9TeWkDTIbZs/
         6Syz77KgORnATAVP0pESXTCJRrQxQmsdxSNbMAzNzTUgVCFR9m8Hr2f2a6/mNPxbg+DY
         AKyp/ngEhk1rjilt/sU5G5tCVQG/dopeUIBXP5MfAbLfsGxkWCMOROZ9iqfImz47NXH9
         8PyQ==
X-Gm-Message-State: AOJu0YwOgzV6Msd1pURVVK1eQIGkjDZ/FHgv40h6cS+6IojoxcJjoHwh
	sgKKRFdJ6it0loI0MykIGp1CM15nVcscA9luYYC824wQf0BWAXPX4qL3Kaclmg==
X-Gm-Gg: AY/fxX7jeHF3KC/p+nekFjV6mGaP/+PjxB/aPJFwYJlQlfYHqioZ9WhGQGJXo22LAo0
	lbzH6AWrew0BlvDRHBsj6R5sApqqnw/Nsf2fbukGuKqx8Vd5QDfNHd88mP17cz5HyM5o61sK9w5
	pQjVdJdCdOfdL9oi6oeX65o/OC607sGn8N0hQS7KPh8ZabPxZ+40yVNp39tIVHfMeY3tFBMMA8z
	HzxIVf2InEF1CGRG61I6lWvLoIccG6WF6BiJJF5EE4sWwNNAICOTLbCq9wtzuopTigoQp6/zPT1
	JRQuh0KoigQFqbQP2HJhpEB+XCW0jM+VhV+vV5M9DwkwGBLtxvTpKNavZo4RfuALpVegzDu7+Gc
	U6tsJHvLAGvEXFjbOvskEaiI8u4GtWOG4mOgfpSI1pXkSNj7YoUYNJKqUvT06Y7y5iNBYwBOO5D
	2UWztLxc1MO0XaBP+oVaTjGHAtcEAPl1yY+UYpnz6nBz2bfscf3vcvITA=
X-Google-Smtp-Source: AGHT+IF9OfLAnUg/4nt8QKZLGFjhUX1TmmbLlZPfFQKnsGxPFkAGTeLHlwNnhCdhFUm6gHPgOXbSRA==
X-Received: by 2002:a17:907:1de2:b0:b80:4117:b6b3 with SMTP id a640c23a62f3a-b804117f48bmr1194562666b.10.1766595821194;
        Wed, 24 Dec 2025 09:03:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 05/15] xen/riscv: implement stub for smp_send_event_check_mask()
Date: Wed, 24 Dec 2025 18:03:18 +0100
Message-ID: <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since SMP is not yet supported, it is acceptable to implement
smp_send_event_check_mask() as a stub.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/smp.c   | 8 ++++++++
 xen/arch/riscv/stubs.c | 5 -----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
index 4ca6a4e89200..e727fdb09612 100644
--- a/xen/arch/riscv/smp.c
+++ b/xen/arch/riscv/smp.c
@@ -1,3 +1,4 @@
+#include <xen/cpumask.h>
 #include <xen/smp.h>
 
 /*
@@ -13,3 +14,10 @@
 struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
     .processor_id = NR_CPUS,
 }};
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+#if CONFIG_NR_CPUS > 1
+# error "smp_send_event_check_mask() unimplemented"
+#endif
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index eab826e8c3ae..6ebb5139de69 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,11 +65,6 @@ int arch_monitor_domctl_event(struct domain *d,
 
 /* smp.c */
 
-void smp_send_event_check_mask(const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void smp_send_call_function_mask(const cpumask_t *mask)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


