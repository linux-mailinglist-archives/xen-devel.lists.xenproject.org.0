Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF977DE6C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584333.915008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdg-0006vZ-68; Wed, 16 Aug 2023 10:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584333.915008; Wed, 16 Aug 2023 10:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdf-0006cm-GF; Wed, 16 Aug 2023 10:20:31 +0000
Received: by outflank-mailman (input) for mailman id 584333;
 Wed, 16 Aug 2023 10:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdb-0003R9-J4
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:27 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d6d299-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:27 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3196fdb3238so3156202f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:27 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:26 -0700 (PDT)
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
X-Inumbo-ID: 84d6d299-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181226; x=1692786026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71CIAXnuJNquP7IQ8wIQUANRhLDWpZmO0GRxTwExAKA=;
        b=dm4/OyaRQoWbm1hketywopEAk/eCw1Nxb7Uxz2gh4vK00aoPa67P2RMMGbhQdJoe5s
         TWRN3i/qQYNDS2RTwVDpQx+puppHw8dDoWjsu/Fa9ko47v0jPJ8vkCuUqRMrNjffOWGz
         7iPOkJ06QHEqdD4fpuTvNzJHaHlAoMvuL9cAOsANXQKGiZCvvbDqIuSUd0W5QyxqhzZM
         +xJIOWCDDIq7Bx0TpXUGWXtZDYIfHopWoQ/rm4wJHltSLFiMbkrtOaxU6IwSPiZTgtZ7
         mowE213U+jUSsn6mYPONenl8wW6bWOP5LEUV/JlgDKubLcqiisbia1s4SUPmFSKaUWaG
         HXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181226; x=1692786026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71CIAXnuJNquP7IQ8wIQUANRhLDWpZmO0GRxTwExAKA=;
        b=GUkp78JrK3jGaSVobTiSGr0uTSSKsNp4ZErkDDb3nJ2Y3Z+bml1M2n+rcy6ajekcks
         8d7U/lzQnlqdsNUlMiJ8D+U9Pii2JkkkeO8JIbrkpeeqbfmYU+gLS9n/Y769eoSrhhy4
         GffKChnFvbLeXlNwUHsnZuzXpwPshTX12CMChsLUY612iwDupcsAjo4NTLi3giIj6+1+
         X05uYZljiAJL/alxjrwlCZybMc5pGOM5ZFzZBEjPVZ8i/UPXy8qadjqi34d+3Za3JG3q
         eFipI0bQOjm5f+tSrBYud4PIEDCRHejgqrb/Lb6XaIi8Cj8OcO2Vh9Vgcm9Hs9uGgj2z
         +KlQ==
X-Gm-Message-State: AOJu0Yxa3aQNBQSbC5FUivQ3u11Ib441ktgwNunJ+r/jYJ2cGJ6A1iBI
	qTfTUSaL+XvzRDzrAN93X1q7x8pbRkEZHQoP
X-Google-Smtp-Source: AGHT+IGoLs4mnuhcZCbUEjodh3SLx38IQh97kcFi/434hrWmr8vsBniyYdXWlhXX47fVRbKzFP158A==
X-Received: by 2002:a5d:4991:0:b0:317:1911:fd7a with SMTP id r17-20020a5d4991000000b003171911fd7amr1078705wrq.12.1692181226445;
        Wed, 16 Aug 2023 03:20:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 15/57] xen/riscv: introduce asm/mem_access.h
Date: Wed, 16 Aug 2023 13:19:25 +0300
Message-ID: <3313d384bcc4d4f42388cb980d307283f4eeb18c.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mem_access.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mem_access.h

diff --git a/xen/arch/riscv/include/asm/mem_access.h b/xen/arch/riscv/include/asm/mem_access.h
new file mode 100644
index 0000000000..8668c55a4a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mem_access.h
@@ -0,0 +1,4 @@
+#ifndef __ASM_RISCV_MEM_ACCESS
+#define __ASM_RISCV_MEM_ACCESS
+
+#endif
\ No newline at end of file
-- 
2.41.0


