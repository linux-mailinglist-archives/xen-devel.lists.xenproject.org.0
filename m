Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73CC9F5118
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859436.1271581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVJ-0001o2-Ln; Tue, 17 Dec 2024 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859436.1271581; Tue, 17 Dec 2024 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVJ-0001le-Gt; Tue, 17 Dec 2024 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 859436;
 Tue, 17 Dec 2024 16:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVH-0001JJ-TT
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:32:59 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93adbe3e-bc94-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:32:59 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3035210e2d1so20865321fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:32:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:57 -0800 (PST)
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
X-Inumbo-ID: 93adbe3e-bc94-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453178; x=1735057978; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb3CJxLduaNMAXQ1eELP8V+rqebgsYEz60pn7CFsgqg=;
        b=FpKwOyoLUlok6FAxkP/E7fGiuzF4xcvNYVQTWA2M3mjUOfMxqxIx5FQcKdoeaK10nG
         pw8NdKG0Ut5W8FwpxuD3LnbX77sJIUXR/qPpziKSHJSMHNu5iF6sWJxORMMMyvWz+47l
         gTh9mvq9mavmynSK709DUlOalunRd2Mf7hIe9+rbzIVNJGcXn40zXm3oGoVAk0/VznXv
         KN/yUgivhOr1iXbN+0i7gy0BHzJFQPI9lDmubwRORQEGXETpPYPQQ/c9edLODbrUOS/K
         gSm/Oadwlxm9EQaOIsBgHx6ooPg4hhSIlHHA9TYl5VF6uXp3CdcBYhYYKrYNB1j95sNm
         nnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453178; x=1735057978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb3CJxLduaNMAXQ1eELP8V+rqebgsYEz60pn7CFsgqg=;
        b=DM2TAIwkWbYkF7Erg9N6BMQPSVhQxvmwR7qnBQd73my+WDCuMtUjrY46HODHev8R05
         1oJ6cdo88sg09krLnYLspfxFCSBwDNCOSt1SLwGJb+H/u4qge5k76//ZCRXlF/JNImWE
         zedIwazmO1wsmMSKCNhd/Ma5C7h9ZZUXVHjnin8As5BI1CsRhqMqBuu06V+8ZU5qdydz
         zUhzXzcwuqywtwsT81b+sz4IFnEygyt2/E/6afXfbJztz89o7NRrjDUfNk3wInwTohGW
         kVsXig00EIQOqffZd3fePFkuruGXYnvxpfadaAqEqyNcGmii4jBNpUxIGE40Pfp07a1N
         pwMg==
X-Gm-Message-State: AOJu0YzMkqJ5iiy5QSb8jkAflY99H+COT2MB7OrD7xAOm9jbfxT3LPg3
	oCUzZ4HHwdLGVPDoMsgK30yQbAePPBR3ypwJFqbwxXaP/lW+MXvHveLY3fFe
X-Gm-Gg: ASbGncvq5WGljT/QKYjmB5fDcqrNUbpsvRJjDzFpJtPcFVkeyBA2V9keta6JdzGKT58
	Lr5YrZhv7thY/qt6022FsBSCl8zXCiQkPGgOonwgeRNeBxkcA2qTCUf+u/5lz5n2tNh4ezin4Le
	3S6zr502xv0W4+ZORkHdjPWu83R6Sa9V31OUHFKsU3Odcwn2mtRNfvNK2LSWRJLoswsVVosHAS+
	Co/pQiPZrM6EFFiZSVRMsVi0qUccW1+bVPN9FdtyvgJXIl2AzcvVobWkQ==
X-Google-Smtp-Source: AGHT+IE5d9AkQfD6oIrO10jKiy/DOZJAEQJQmmnmR31lI2oVKyWg+aeEH48bwisUyNXtC+DtvXhYUQ==
X-Received: by 2002:a2e:bc12:0:b0:300:1f12:bbc9 with SMTP id 38308e7fff4ca-302544cbdb2mr65416671fa.34.1734453177798;
        Tue, 17 Dec 2024 08:32:57 -0800 (PST)
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
Subject: [PATCH v3 3/7] xen/riscv: reorder includes in asm/page.h alphabetically
Date: Tue, 17 Dec 2024 17:32:47 +0100
Message-ID: <467649699e9ae70fa1d933d7d44ab24e97f7ecb8.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Nothing changed. Only rebase.
---
Changes in V2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 91b1194b55..bf3f75e85d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -5,8 +5,8 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/const.h>
 #include <xen/bug.h>
+#include <xen/const.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
-- 
2.47.1


