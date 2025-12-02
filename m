Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04199C9BFE5
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 16:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176222.1500740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQSTm-000672-IH; Tue, 02 Dec 2025 15:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176222.1500740; Tue, 02 Dec 2025 15:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQSTm-00064M-EK; Tue, 02 Dec 2025 15:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1176222;
 Tue, 02 Dec 2025 15:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQSTl-00064G-56
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 15:39:49 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cfe56a6-cf95-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 16:39:39 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477770019e4so47399755e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 07:39:39 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a2easm34569012f8f.23.2025.12.02.07.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 07:39:38 -0800 (PST)
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
X-Inumbo-ID: 1cfe56a6-cf95-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764689978; x=1765294778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gd7SKQqJeiPzFQHeyode4k2RLn3minZyG1g3bOwqujM=;
        b=Q2Lb8j1fQV17WmARcRbnP83phqWpCIqAacnnjTP8JHnnzoUi90oOONo43U4N9LvSNt
         PA8NpDMPK0BvE0CuMrZVHrDtQFZRxDORQ5uv1kyktyLdfI2e96oUn7CuWPBHSS9XoXQ3
         Ak0iJWNheD4erNebPT+0tio1J5XKvb3Yw+vug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764689978; x=1765294778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd7SKQqJeiPzFQHeyode4k2RLn3minZyG1g3bOwqujM=;
        b=d6PG0OzgvcWHUtVqVmEzRdhOFUjmkG8XGa9gZSvogedX4Ttu8BHbRsR5tqJOiIPew3
         31zS/IllGUACMmpxha3f2nezbWwZEr4si8JUt/N/GovImy6VFHXP1kCaM2IEqCqPmhHd
         dwRfLHnh6S47mb9XXv0WISEAJUDhJX78yM/ZWaGzU/UZ4/iMz3Uv/3VMigz4fZtkCFVf
         yE86zYNujcPbo4+86pbawOYBPXgtTBe65vOqysFAbJre+ntCB4GqB02eoyzKZnPAB/00
         CNrAw4CPABvJRWCrG37CMUBjpLb3ONbXC5DIHparcoA0qzKl958DI7oXk0XD6BDyaxfz
         SWMA==
X-Gm-Message-State: AOJu0YyZccI6/IiDomJmjiZ0NbSknK9DzTAAeODFL1PS05getYSWpEgU
	O4/83FiH5ukRVTExc/a23/jz/1I27557GXYsPuxuAjRjkIxpV4OPJGHUvZB1WYG4upGnE6WypQ1
	HyTBV
X-Gm-Gg: ASbGncsTIucm0WsqVPZ9M+xG6zLs/Nou/h24egjlY3WoNafIqtpA9x+GF1m6rp3568y
	J1UI0KBf8dyDYc7gFR2brU51Z6qRVb1Mhdz5KjEJCmkkMzsTvjSEgX6+d+lcCDrl3YWoExTunc8
	WQ89j6zy5lROHVxzXd18ZrQM3dVrfR6+Q+IQ6P5APmsl7SIQD+DVP16KoRgvPKtCusPNaDlBiws
	zbV14Y2p+fWX4oPK7+CI+YqJuud3nNfaL0mkGPHVtgL8xut2+4XYYUthbXHUtrvuIM/mLXgJrtk
	Yc+aaytvYiAun+rf/BenOHvG54S14gmEO7k/mcCYeeMZQgGatAt/8CYSgL3CT1Nn62SS4HDkPSU
	UszWnk/wrvNhCGGY1mXHvm1jISZ9793IaWSPpMUukjq3yo03jR+12sgat1hdHkrZEDngGvwWBDg
	89o8KrKRqkvmdBjgogDerQ1W0UuXDTVvbjsa9v5ZwBA/WPsB2jti8hDPebF9gheg==
X-Google-Smtp-Source: AGHT+IEHotpsBF97dO3Z0JcaFaB7so4jccVxDZYK+wHnIwdEuLKkXmhAM2gFXi7FP7HujWm3lBjdIQ==
X-Received: by 2002:a05:600c:1f0f:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-47904b1b27bmr329540405e9.17.1764689978450;
        Tue, 02 Dec 2025 07:39:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Feature names for Granite Rapids
Date: Tue,  2 Dec 2025 15:39:35 +0000
Message-Id: <20251202153935.1476414-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Slightly surprisingly, AVX10 is the only unnamed feature right now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Hunk borrowed from the AVX10 series.
---
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cd778586f10..714ac7fcc4a6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -361,6 +361,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */

base-commit: d0c75dc4c028bc32fd9cf1d4358973929548de54
-- 
2.39.5


