Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7378D7BC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 18:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593175.926130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVK-0003Sr-Aq; Wed, 30 Aug 2023 16:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593175.926130; Wed, 30 Aug 2023 16:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVK-0003Pu-6F; Wed, 30 Aug 2023 16:57:18 +0000
Received: by outflank-mailman (input) for mailman id 593175;
 Wed, 30 Aug 2023 16:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FTw=EP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbOVI-00035r-ER
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 16:57:16 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44d41e3a-4756-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 18:57:14 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-500913779f5so67857e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 09:57:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 er7-20020a05651248c700b004fd36c89c3csm2458240lfb.43.2023.08.30.09.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 09:57:13 -0700 (PDT)
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
X-Inumbo-ID: 44d41e3a-4756-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693414633; x=1694019433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfGWl5i1i+V0kmRFz/WihmIFA6/gIVVvFug4WIVFmIQ=;
        b=WkcR6kfkjoj+KFy2dJPmD3UipK82DB36g6kwb6+ZgD2ogmMrkMrUaEf1AqACZW1y57
         l/Vps/JLvE4SxOZHrGyqgJndfkm3w59vr9Ed7aiI+mT28tXIz4ugFEcoMYoWozEM0EsL
         JIZNrjnXkKFK7s/Szz4JyNXKC5Ss749360fzeVcg2hKonrEZ4UyiiI+dNtywlRLeuWx0
         L4uMTwuFouD0oAlEBsD48M4/axSRZEcYf0cUeUXPpKcKTNXi0E429AtNMebjoInYLam0
         H2ZtTFboSCiuB5Cp+w0t4WxuQhVRLwhzHyQxxh5PTb3S/IY8I1OelRAhFA8AdnRvfd2n
         uTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414633; x=1694019433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfGWl5i1i+V0kmRFz/WihmIFA6/gIVVvFug4WIVFmIQ=;
        b=FZ0zTjth0qRpMTYYSUNQ/GYzoyuBOoUj6RgrO0dRaaR3pFgr4AIJ8nU0B4TwfCebdW
         8E2LapYgiIH+nlaTp8W3TS+v2VO/Z/OC/wBuDCEG5G5ukffQAUREfbkp1W6pIJrQXSn8
         URaqjAoViOjOcAdIi4YB9Z5bbuZ0Hkanwhp+uBEZuXcgS5FpldAIYVD9ijxFb7Gr0VNQ
         WKuS7GFtYBJVXcsiEIiTY2XZsMprGC63zg1CU4AZPvMAEr1TokV5LEAeQYkDIZNMX+L5
         lwRKj90ZPpRZlIRqWPX3Myb43pLLbT+9Z4OWppShF/TrRPdh+AWa1jCm8THF9/FhRLjj
         gL3A==
X-Gm-Message-State: AOJu0YxhRQPGtzB0FKKz6q07jTNmoNAw+e8N8Qp8xaGJ5TTzTb9WzGQc
	A4QmU9t6gAp7OqdzeFcRjScAOqsFRAw=
X-Google-Smtp-Source: AGHT+IEu//FLboMeXYU0xaF3cdZPGiMSN30bWXXC0fyJlHr7uJUxjztq3m9nZL1Tx3lWTPrH3DtM2Q==
X-Received: by 2002:a19:7608:0:b0:500:8249:161a with SMTP id c8-20020a197608000000b005008249161amr2023692lff.19.1693414633506;
        Wed, 30 Aug 2023 09:57:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] xen: add asm-generic dir to include path
Date: Wed, 30 Aug 2023 19:57:06 +0300
Message-ID: <3c54acf593ce4d9248603079133d930d081bad40.1693414172.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693414172.git.oleksii.kurochko@gmail.com>
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm-generic dir will contain empty/stubs generic for all architectures.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Rename stubs dir to asm-generic
---
Changes in V2:
 - Nothing changed.
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index f57e5a596c..5482c86080 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(srctree)/include/asm-generic
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
-- 
2.41.0


