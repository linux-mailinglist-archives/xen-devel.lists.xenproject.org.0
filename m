Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A23A5B7C8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907020.1314357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvY-0001nB-LW; Tue, 11 Mar 2025 04:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907020.1314357; Tue, 11 Mar 2025 04:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvY-0001iE-GU; Tue, 11 Mar 2025 04:09:12 +0000
Received: by outflank-mailman (input) for mailman id 907020;
 Tue, 11 Mar 2025 04:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvW-0000fJ-LS
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:10 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94fa46ed-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:10 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224100e9a5cso93337485ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:10 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:06 -0700 (PDT)
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
X-Inumbo-ID: 94fa46ed-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666149; x=1742270949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSQnGpOqRDw3w//OvJparnGxlKjvigYzwQgvxmVvIU4=;
        b=vwhswb70kDtQlFPKC9I++M8tJjjMHilSKefbsKS/dXt2QXnGizMLGQlzi3qY9/6Ec3
         fyEEVD/NtCFPdXL5B+dIOOEpD89vIywTy5pTUXGNuQkzTjmgLFRTV+STn1bTmNP1SbAG
         HvhcSAYTdbvTmQqXN48kGRtZlhO6pEuJoGTTi5fgjNhRSuN5KSnf6wFTbv5YtOQ4iy7a
         dlF542+Er+k7oWD00JNhEz2QoIiX27eZKIn0oAmZpJyZRhygjK/Ds/eq3HAXzJL4ybTT
         ko6nplOiOhoh75JLiT1fmrKEeF4aWBAUbcxsJrlRLOXN9V6R/Zf+SLxVDbb1OOxPkVFW
         KGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666149; x=1742270949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSQnGpOqRDw3w//OvJparnGxlKjvigYzwQgvxmVvIU4=;
        b=otSdoGtHLPy06v6b4RLy1E8iMvKY/r5QelVeJeZdyJq9cSNP8QdtCunkqRuZnYy6pm
         OVFblhK0Bo8f7cwau0K9g4TIDeCZ8Oek1JMJu7Vo7OhpBF7P9Gp/7JuApWRsWXNX4BkO
         FJXySfFC9xmr54u1OaA1G32Bkcxmf8nZycGaItsjpdt2QpXQznfDFkrwabXE12yprs9O
         WdFA3Sd4ZWCnNLXfU+QZBDk+6w5VRQLYx3NSFyAvZ7yUq3W0XbGPJrteLfcdJ6wyvrcb
         5xN6nNd5capu2HH2CUquqf57D3dypv6N9mzWq+WRE1OIAxE27Ex9BmV+zNTMzHTWngNG
         +Aug==
X-Forwarded-Encrypted: i=1; AJvYcCVhj8voQMIEu9zUs6RU2ueEMbDK/vc/T4fFwdF9HpnrVTYEObcgHzVRzCQMke96fu1AGgCQ8qUMNQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4OqS2l88GfufPTYE9LPph0qvo9ZUMeBL03lGDqrCAbKNtT6sH
	3PVTCLzHKT2mlkMefrns/50ZgPS14hvY8L+0dACU0giflWepG/N5xKPrHMT1qa8=
X-Gm-Gg: ASbGncs4YkdcG3wRKKREwvl+tjQIfc0V5DEwEIYWNZtIdDDkr82OjSWili6wZXBtQsK
	sstrWV5WVFN7RXZHA3MaxGqOTcn+pqlKT/EisEYk/WCyQaroogVH26rtnRgsHR7IrjqxYUSpNRf
	+RMxMO0b93wk3XQYKN0q++7c3BnBYCxuhAjacwoNkClH083ej9hk9p3LDbqkiXYL4Iif73RohMA
	YJoL5uooQGUei4bAfDrd/5BAyiDiwyLyL11E9T44mrKX3tbADvGjAMZ//LXhv9Fo7G4CiYzgieS
	Bbn0Ty68gMBxjYRU9r8kioC/0hQZrtSSPiZHcgFlDvy/HpWym2bGeAQ=
X-Google-Smtp-Source: AGHT+IGAtyqJ8JwUWzZUpShXBSvpRNbrwAinE/LFxHiM0RsFVnA1TPY911KWPkY4EkoTDg/0IjRi5A==
X-Received: by 2002:a05:6a00:23cb:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-736e1b3e670mr7549220b3a.24.1741666147270;
        Mon, 10 Mar 2025 21:09:07 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/16] exec/ram_addr: remove dependency on cpu.h
Date: Mon, 10 Mar 2025 21:08:31 -0700
Message-Id: <20250311040838.3937136-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3d8df4edf15..7c011fadd11 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


