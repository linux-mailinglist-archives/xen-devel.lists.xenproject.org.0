Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24301F60AD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:57:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjEKS-0002Qt-Dh; Thu, 11 Jun 2020 03:56:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjEKQ-0002Ql-1N
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:56:34 +0000
X-Inumbo-ID: 8a34553a-ab97-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a34553a-ab97-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:56:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g18so3604126qtu.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OU+nObQIvnt6s+yMYrarv+yXbrDKSv9hdHPFd/1lbK0=;
 b=samdq/KNhZ5i1J43ZZi7oKVjiOkQmBKpTdoAvI2HjMqAJ7JWBanrjmbzwYvvGJbtY1
 2fOqudRCcB0NLEPnXTXgYNekmI5WLkX3xO/tQDkEI5XUd4IaGooD42XslZgCj8H0grnD
 7Jzcn8NG7R93cot7pmJ+TdMO5dEXXOMgvX9r5+1sxasO1TkMMjyeRVNx65hS4eAq/26x
 RLSzcgRTVgjKytWyGZ2P1y4e/1jJEErimzdI7G/L+mdiafImruaat3qgRZqIQOqaaIA3
 htTP+Sz8iTSgoKSMQRyS807T78lR08ZS8UN7GS0EdPagwuZtlk1eEAE8+QMWQC9wj95r
 BRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OU+nObQIvnt6s+yMYrarv+yXbrDKSv9hdHPFd/1lbK0=;
 b=DwuV2asfdVrXPD8qZh5obfILFLCGuAZhKru2VNWE+FDjgpGHp3kdGYIsH0ByQQMblX
 0ddItiXq5EfBtxnBpyEGO6QPzZyXwiOMPOzexyr6pEozItaO28KiNtM8zYDdtK6F69kj
 wkN45FIXl4FkEm8VkDSphX/g2ZkNCWr62BhvNNQerF25KCePRvwFloq5J37fVlqSRQvo
 EiHbFKBoZoP1ZsQh/W7v0qlKDK2P3yp2D4/rJecsN9a/fgSc1APLGr3bNDqlKcXKhbah
 wKlsdl1t9i+D+pG18HQcFIb1yBYl1KDaOj/6R22Uvvwxvp5ppRZEh9W/8086TV9cxqUa
 embQ==
X-Gm-Message-State: AOAM5311yjwhFBx9SxKrAOfypdBQlpSzqWo2T7eu4zUEkKBWRDSWsTms
 iZ9Zl68VJusnGD1sRui9CpLujRk/
X-Google-Smtp-Source: ABdhPJz9OjgoZ50jbFCdOhp5uZWr2reTHpFlhMgYHG0o4i85ef6y14huRzVCWDDmdjoxIabDP0R6cA==
X-Received: by 2002:ac8:3808:: with SMTP id q8mr7041438qtb.297.1591847792945; 
 Wed, 10 Jun 2020 20:56:32 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id r77sm1281886qke.6.2020.06.10.20.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:56:32 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] libacpi: Widen TPM detection
Date: Wed, 10 Jun 2020 23:55:18 -0400
Message-Id: <20200611035518.379297-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The hardcoded tpm_signature is too restrictive to detect many TPMs.  For
instance, it doesn't accept a QEMU emulated TPM (VID 0x1014 DID 0x0001).
Make the TPM detection match that in rombios which accepts a wider
range.

With this change, the TPM's TCPA ACPI table is generated and the guest
OS can automatically load the tpm_tis driver.  It also allows seabios to
detect and use the TPM.  However, seabios skips some TPM initialization
when running under Xen, so it will not populate any PCRs unless modified
to run the initialization under Xen.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libacpi/build.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fa7d14e090..a61dd5583a 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -351,7 +351,6 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_waet *waet;
     struct acpi_20_tcpa *tcpa;
     unsigned char *ssdt;
-    static const uint16_t tis_signature[] = {0x0001, 0x0001, 0x0001};
     void *lasa;
 
     /* MADT. */
@@ -413,9 +412,8 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
 
     /* TPM TCPA and SSDT. */
     if ( (config->table_flags & ACPI_HAS_TCPA) &&
-         (config->tis_hdr[0] == tis_signature[0]) &&
-         (config->tis_hdr[1] == tis_signature[1]) &&
-         (config->tis_hdr[2] == tis_signature[2]) )
+         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
+         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
     {
         ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
         if (!ssdt) return -1;
-- 
2.25.1


