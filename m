Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7FC87AA0E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692523.1079802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBz-0000nf-9N; Wed, 13 Mar 2024 15:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692523.1079802; Wed, 13 Mar 2024 15:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBz-0000jl-5c; Wed, 13 Mar 2024 15:06:55 +0000
Received: by outflank-mailman (input) for mailman id 692523;
 Wed, 13 Mar 2024 15:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBx-0007E2-1i
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:53 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f6b447-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:51 +0100 (CET)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-690cbf99143so21178816d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:51 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:49 -0700 (PDT)
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
X-Inumbo-ID: 51f6b447-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342410; x=1710947210; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqR8dKNf2s+DB1oba15Jm7Zlu18CJES9pn/IS/ryqIY=;
        b=hKMWjp32zbDDbRUzLQVOmaD7ECertCm6lXOmmi6FBOwsQHJRYypJmcIPkAMjIYGyy/
         6Qs/+ULmuo0S5fapTQASWavQ7rE8RmRHueuOZkr9uEqtn5JXndvMhUMTsVUV9yvR8Itk
         2hdSELXFheaQCwpOlpc4fKNIOr5xyKF6uIB+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342410; x=1710947210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqR8dKNf2s+DB1oba15Jm7Zlu18CJES9pn/IS/ryqIY=;
        b=u7fm9E7mREUAZ9YfcQbtk+EcecKg2wBi944YxPDdpRr3PP9WZhQzu66AUmrBCmYeFf
         VOiRw9mCaX54D2itcqdv90DhVz/mmMoqzlphdQuftyD5yj6j0v3hef5oHjziE+2RzMDB
         moEP8zHiIIWK3xQZ16baj9yxS0wljX53FzBh3mXfJfFhwW4E0kJQLMWAtCZmLrrcl4ur
         zx0WywoNMILlJiZ36G2VcV2IIT2PU7ERDcHWfpdKGybPF9C1O3up6VJBEbsOg0zp7184
         Wt5V8wGIOiCIUpHo3Jkl5VFfuhbT02Y0RXPTujCaYYOxDEf6x+xLD2dljid5RocrjNJv
         IlhA==
X-Gm-Message-State: AOJu0YyCp+yFzFXHqbCVmgNvEJIJ6Kmlbbi+ljcSyZXEUSduYGFKOxQe
	rIh2foQKetdBTqEfTXjY0xea9VmS7032fnGFGoiRUNSbHrQ6vt9vgR2/Pjq5GQ==
X-Google-Smtp-Source: AGHT+IHxT3dfA7sDvc0ZsxxYeT08+PpGu6wmIj3vwZ/i++W2G2MrBTw/4jrp+2lKPO2k1A6hnNmZVQ==
X-Received: by 2002:a0c:ea43:0:b0:690:df46:3949 with SMTP id u3-20020a0cea43000000b00690df463949mr116341qvp.35.1710342410458;
        Wed, 13 Mar 2024 08:06:50 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 7/7] verifiers: Verify after decompression
Date: Wed, 13 Mar 2024 15:07:48 +0000
Message-ID: <20240313150748.791236-8-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is convenient and common to have binaries stored in gzip archives
(e.g. xen.gz). Verification should be run after decompression rather
than before so reorder the file filter list as appropriate.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 include/grub/file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/grub/file.h b/include/grub/file.h
index a5bf3a792d6f..a1ef3582bc7b 100644
--- a/include/grub/file.h
+++ b/include/grub/file.h
@@ -182,10 +182,10 @@ extern grub_disk_read_hook_t EXPORT_VAR(grub_file_progress_hook);
 /* Filters with lower ID are executed first.  */
 typedef enum grub_file_filter_id
   {
-    GRUB_FILE_FILTER_VERIFY,
     GRUB_FILE_FILTER_GZIO,
     GRUB_FILE_FILTER_XZIO,
     GRUB_FILE_FILTER_LZOPIO,
+    GRUB_FILE_FILTER_VERIFY,
     GRUB_FILE_FILTER_MAX,
     GRUB_FILE_FILTER_COMPRESSION_FIRST = GRUB_FILE_FILTER_GZIO,
     GRUB_FILE_FILTER_COMPRESSION_LAST = GRUB_FILE_FILTER_LZOPIO,
-- 
2.43.0


