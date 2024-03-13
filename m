Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79C87AA0B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692522.1079791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBw-0000R7-VB; Wed, 13 Mar 2024 15:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692522.1079791; Wed, 13 Mar 2024 15:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBw-0000Nr-QY; Wed, 13 Mar 2024 15:06:52 +0000
Received: by outflank-mailman (input) for mailman id 692522;
 Wed, 13 Mar 2024 15:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBv-0007E2-IA
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:51 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51169e27-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:50 +0100 (CET)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-690cd7f83cdso8532866d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:50 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:48 -0700 (PDT)
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
X-Inumbo-ID: 51169e27-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342409; x=1710947209; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2qmXAF7kH+Xo7dcYPNWV07zKXcD5akVAYdTNUPm5Ak=;
        b=tVB1GiHpXnQcD2V5b25BTuVUuKyMOyyTq4RDppna8VBmkXhb3uXtaysPMNa+YrYxG4
         dN7nhhA0RMx+epSBl4Djp4B3fbe0cinqAxEPzXvk5n2sA0m2tScKNd0DhagRCptSa7ou
         y2OkTda3cC934cNnUfR+fJLROfrvg4jW0sLk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342409; x=1710947209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2qmXAF7kH+Xo7dcYPNWV07zKXcD5akVAYdTNUPm5Ak=;
        b=FHzoKKNIVhhMb01MeZEFn3BF1DpW4qNyd36xNQLQB922CMmjm0/ISN+HxmBEIVeM1M
         gXE5Nn/qV1yFVmG/zPhjVQKrXJY9He6MWZDtm8u98Vs9YJB5Dae201G+BxvD7rKkBVk8
         dS6EapDPd+Ok4sOtFuzFjvagL6zegya+8m0kFxFswTH2F3Q4fGSDvrbUWOxyM1ewwVun
         qMXcAHjTID3uTdqdG/pMZ2kV7xSAqHKIq83HiRO05ZtdXd3Kt9j2+MgPOtUACL+dB7+n
         AFj4mDDYC0pxYQ0eI+gjzauof3/u65pSKI0Pj30dwYeJWVvRqUnJdNJaTewAeS4Q7MFJ
         yGrg==
X-Gm-Message-State: AOJu0Yz4PIbcoiXHPm8cpWVhDdkg2GdepPEODpLiDUw6HC+aa5CZAuLK
	YnKwCB57v0v9oFwfyq3Txolquvr0s7KESxj2ymKjkhGe0Wv5wZprjkdPXPUHpw==
X-Google-Smtp-Source: AGHT+IGQZ+RUgmwNMglkrjL/bMqOBHmzI4m56/rX8h6MM0HjI4O+cM+TZ42/QjkUrbzW3oCnXKu05Q==
X-Received: by 2002:ad4:4e14:0:b0:690:b40b:8084 with SMTP id dl20-20020ad44e14000000b00690b40b8084mr74464qvb.40.1710342408924;
        Wed, 13 Mar 2024 08:06:48 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 6/7] efi: Allow loading multiboot modules without verification
Date: Wed, 13 Mar 2024 15:07:47 +0000
Message-ID: <20240313150748.791236-7-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GRUB doesn't do anything with multiboot modules except loading them and
passing a pointer to the multiboot kernel. Therefore GRUB itself doesn't
need to verify the module. Multiboot modules may contain code that needs
to be verified. If this is the case, the expectation is that the
multiboot kernel verifies the modules. For example, with Xen, the first
multiboot module contains the dom0 kernel binary and Xen verifies it
before starting it.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 grub-core/kern/efi/sb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
index 8d3e413608bb..f76290d65e9f 100644
--- a/grub-core/kern/efi/sb.c
+++ b/grub-core/kern/efi/sb.c
@@ -171,6 +171,7 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
     case GRUB_FILE_TYPE_LOADENV:
     case GRUB_FILE_TYPE_SAVEENV:
     case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
+    case GRUB_FILE_TYPE_MULTIBOOT_MODULE:
       *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
       return GRUB_ERR_NONE;
 
-- 
2.43.0


