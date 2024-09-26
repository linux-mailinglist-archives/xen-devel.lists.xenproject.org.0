Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D25986C06
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 07:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804852.1215824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3X-0004v7-Kk; Thu, 26 Sep 2024 05:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804852.1215824; Thu, 26 Sep 2024 05:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3X-0004tc-Hc; Thu, 26 Sep 2024 05:28:47 +0000
Received: by outflank-mailman (input) for mailman id 804852;
 Thu, 26 Sep 2024 05:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sth3W-0004tQ-6Y
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 05:28:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3231dc2c-7bc8-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 07:28:44 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so65688966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 22:28:44 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34086sm304441766b.41.2024.09.25.22.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 22:28:42 -0700 (PDT)
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
X-Inumbo-ID: 3231dc2c-7bc8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727328523; x=1727933323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nUGmIUV501qchlq92s4TPNVUsuzJ6k3GwVFLyKelwY=;
        b=ktSPs/uREcPAX90Z4UjbXvPIlfdqWVEudOczmXL9RJPyPy3wXuoawvJntCAHcObli1
         UjN4IHCPlzXeHgZk8hBTqoR1cu0t6mOKBk9+nDa/PIQSbL/LdwRVOUAHEMWOU2gQzbh/
         KOlt/uHtNj8Az5Ql8+k8zl3Ybi8sV4Skxoggo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727328523; x=1727933323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nUGmIUV501qchlq92s4TPNVUsuzJ6k3GwVFLyKelwY=;
        b=G1U/9mUfKLRtFeczetprIxLMvCh5qjOV2Xt/uGWUtbRGzqSTwp6fRtFpMrcTJdooR/
         QGkcPSXkp2gJ1UkXHaLtsWMBDc746mrTdZWSTzRy2BHK/iFkUk7hm72OmjRFbbLU9J1Q
         gZD4yVtxmYFUUgbFvj1YJWGV4r7QZzViJrz0Yf59NZdwVRHKMIPIZnMo0/YXSdIHB/JE
         iaKOBSiFSDGeAR85n4QHX3BOgjdjFl3o5KzdrbToaY2rQv7LbQGpQOu8rXNdw28Ic/Zp
         xi3HJURnPisiL/7BQvXPlUK+kC8chOQEDw+xQ6xvkAy+HUka2IG1kQXdW9uMGhlJSuis
         WnhQ==
X-Gm-Message-State: AOJu0YyUVOy0w5onvALAh+1e4j2s+fQN0KepdempL+6wOoHMl+OPBFqD
	6r2lnRuB7EF4iUYTWvy+sYxOsq6bH/aL5nKxv85hJTyGsomJAxcajYgieFyMYnMeSGcKttUxGGc
	j
X-Google-Smtp-Source: AGHT+IGsvzIZ0Et2L8CxwMPkOhOXJNt06nCchT7tKEg+Bbsni8KjwyeMQ1Yxp+1Zduo3xqlGDWdRfA==
X-Received: by 2002:a17:907:7e91:b0:a8d:fa3:bb24 with SMTP id a640c23a62f3a-a93a0383db3mr423855366b.23.1727328523042;
        Wed, 25 Sep 2024 22:28:43 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 0/3] x86/boot: Reduce assembly code
Date: Thu, 26 Sep 2024 06:28:30 +0100
Message-Id: <20240926052833.465510-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
First patch rework BIOS/PVH paths to reuse some code.
Second patch rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Changes since v3:
- changed new function name;
- declare efi_multiboot2 in a separate header;
- distinguish entry point from using magic number;
- other minor changes (see commens in commits).

Changes since v4:
- rebase on staging;
- set %fs and %gs as other segment registers;
- style and other changes.

Frediano Ziglio (3):
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S       | 246 +++++++++------------------------
 xen/arch/x86/efi/Makefile      |   1 +
 xen/arch/x86/efi/efi-boot.h    |   6 +-
 xen/arch/x86/efi/parse-mbi2.c  |  66 +++++++++
 xen/arch/x86/efi/stub.c        |   3 +-
 xen/arch/x86/include/asm/efi.h |  18 +++
 6 files changed, 155 insertions(+), 185 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c
 create mode 100644 xen/arch/x86/include/asm/efi.h

-- 
2.34.1


