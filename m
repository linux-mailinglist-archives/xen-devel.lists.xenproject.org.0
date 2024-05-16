Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A728C74FD
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723150.1127739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YxN-0005my-Ot; Thu, 16 May 2024 11:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723150.1127739; Thu, 16 May 2024 11:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YxN-0005kd-ML; Thu, 16 May 2024 11:07:29 +0000
Received: by outflank-mailman (input) for mailman id 723150;
 Thu, 16 May 2024 11:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7YxM-0005kX-RT
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:07:28 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b51ca98-1374-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:07:28 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so3504245a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:07:28 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdfed0e27sm106366766b.213.2024.05.16.04.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:07:25 -0700 (PDT)
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
X-Inumbo-ID: 7b51ca98-1374-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715857647; x=1716462447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7fw3Uxcr4l9sdB/f+rweJ+gcxrQnNehLShuUNgR3KY=;
        b=hYKUAVZGhcTfSlHSqfWpT0RVbvPxucMxBwe/oOqbyj+IzFwnANQtN8wnBePU+PL5t0
         hDbq9lWB4/OTCi6mYMVlS1q3huqTWtcPiJKmPIbzbQvGlibw32DdoOVRu+nmOf7HpjcT
         TIne7ugE9HPPmkqOD51/VbDnrDyHwUpfe5EKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715857647; x=1716462447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7fw3Uxcr4l9sdB/f+rweJ+gcxrQnNehLShuUNgR3KY=;
        b=vPFz4VDckjPpba2vDn6zMXM1uqMl/QEMJBx0JBO/L14kpv1og+UKzhOtv+XTDJSEE7
         isllG4x5KgBEbgRiiNII8RuFMMLY31fwgWhMM6WRb/AzWo8MXsTNwqaexIFfA/0ksQA0
         +/sdMNycyOSwEeH1EvFpWDjfr1pLuQIdqqgHXhjtfrslulRqf2wJPFrQ1VLJGxKcx1ez
         dR1+RMSVsmjqxXxGe3waTd2XBqrZmFExHUSnE1PFAwwkVTDyMsVfsIan58XUZzA9bcPH
         VOZo4m1DjtEGdVPIqCjvj46VcEAbBpeJWmeCAqmrWkLiVMy7YS1clsR90CC6hgMa8rp6
         63jA==
X-Gm-Message-State: AOJu0YyXuvvodZ7DtOQSyUTtyTFtf2w51hziUQo5mu5ZsBp71iF/P74z
	FDUlxwFFa02cUyeSGaVoLAcbCZatYv8PrWRkQXx5PTwvkO3fnuhjEDGpB0H5Su4LsQj4WzGnreW
	w
X-Google-Smtp-Source: AGHT+IGGpyRYjM6N3YDPwFtNQWX6fJQLi0nnLcNNrEAq2yFSprh1p9QmRUgJo7VZgaeP3HwFjemtcA==
X-Received: by 2002:a17:907:36f:b0:a59:ba18:2fb9 with SMTP id a640c23a62f3a-a5a2d534e9cmr1120447566b.12.1715857645954;
        Thu, 16 May 2024 04:07:25 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH] tools: Add install/uninstall targets to tests/x86_emulator
Date: Thu, 16 May 2024 12:07:10 +0100
Message-Id: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring test_x86_emulator in line with other tests by adding
install/uninstall rules.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/tests/x86_emulator/Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 834b2112e7fe..30edf7e0185d 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -269,8 +269,15 @@ clean:
 .PHONY: distclean
 distclean: clean
 
-.PHONY: install uninstall
-install uninstall:
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
+
 
 .PHONY: run32 clean32
 ifeq ($(XEN_COMPILE_ARCH),x86_64)
-- 
2.34.1


