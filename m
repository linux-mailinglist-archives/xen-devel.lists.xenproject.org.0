Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E198FECB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810091.1222780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVK-0007Ht-2U; Fri, 04 Oct 2024 08:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810091.1222780; Fri, 04 Oct 2024 08:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVJ-00078s-LK; Fri, 04 Oct 2024 08:17:37 +0000
Received: by outflank-mailman (input) for mailman id 810091;
 Fri, 04 Oct 2024 08:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVH-0005Kj-6A
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b58f1cd-8229-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 10:17:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so274599466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:33 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:32 -0700 (PDT)
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
X-Inumbo-ID: 1b58f1cd-8229-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029853; x=1728634653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=fUdSVRleNXiOSgZPPyLZVRRsi/e+Zvy0Q00x5Ct5lOW5XtISjkX3g+nbLxIHn6/a4K
         zc759zL3Y5DZJRt+PuefwY0izNQxkxCIOxf2TXcifZsH5NSI86JbKmmXLTBWE/OSvyit
         4PcaiLD6fA1aaS/o/eKV9efHV+KKMuxKCy6uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029853; x=1728634653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=A9aTvn1Qj7oNGBQohW/c8oVcqlraFKNf9ScWylWtRpZY6w1XbW8wW1LpqooLIhOfqf
         rEqhqvGOh2sKDypzsNAxQF5LV2Bt3ggxH58B7OtnRoD7myBrH7ILczXZCheqO3PTxU2A
         SubMveaJhapB9dtDKy7oqxNiXI1aUwZdfWLnOuwqqIa2AqKezkv5PgDU81jGMVEEnoCh
         Vzv4I6QUYupd3Ybs9vzFmzpYe9OQ2rt2hPUmTtsUMYzyMxIyUBtm2RwCO4z7Ezi8wUwY
         zd75eC0fUo2Pai9JU8EQkgnmhVhT276nr3zwZWgAequvSevjsqLOue74cFYxDuB7X0Ta
         Yjhg==
X-Gm-Message-State: AOJu0YzMRvrcVgTvFXtpK+wrez0Vmwxbvf2oqVhQyrN6Kr9bIcO7fVlQ
	l5/AF7dNjn4zXssT0xMSw9xkUyFSFyRi7WTWg1tGjCthjD42WYofvuriQmW8pqwtEVuw2DjQkH/
	H
X-Google-Smtp-Source: AGHT+IEvdAwVwClZB1xoco8svnU+S8ZotrlHbi1mfqqVzDY+tUdMOy+qCvZXRnXmyV4Nrov7NjLFbA==
X-Received: by 2002:a17:907:3e05:b0:a93:d5d3:be4 with SMTP id a640c23a62f3a-a991bd16c3fmr161144166b.13.1728029852928;
        Fri, 04 Oct 2024 01:17:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 09/19] xen: Update header guards - Intel TXT
Date: Fri,  4 Oct 2024 09:17:03 +0100
Message-Id: <20241004081713.749031-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to Intel trusted execution technology.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/tboot.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/tboot.h b/xen/arch/x86/include/asm/tboot.h
index 818d5fa451..15479fe80e 100644
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -34,8 +34,8 @@
  *
  */
 
-#ifndef __TBOOT_H__
-#define __TBOOT_H__
+#ifndef ASM__X86__TBOOT_H
+#define ASM__X86__TBOOT_H
 
 #include <xen/acpi.h>
 
@@ -147,7 +147,7 @@ static inline int tboot_wake_ap(int apicid, unsigned long sipi_vec)
 }
 #endif /* CONFIG_TBOOT */
 
-#endif /* __TBOOT_H__ */
+#endif /* ASM__X86__TBOOT_H */
 
 /*
  * Local variables:
-- 
2.34.1


