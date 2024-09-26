Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D29877E8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805753.1216976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlD-0002CV-Lz; Thu, 26 Sep 2024 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805753.1216976; Thu, 26 Sep 2024 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlD-00029f-JC; Thu, 26 Sep 2024 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 805753;
 Thu, 26 Sep 2024 16:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlC-0001SU-8l
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0177dac0-7c28-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:54:33 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so144818666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:32 -0700 (PDT)
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
X-Inumbo-ID: 0177dac0-7c28-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369673; x=1727974473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8YXz3xJwYM5w/OK9x2qBPOxlg0qWTOKPTFvzRr9UJQ=;
        b=c3U7QNUYwulNiwGULAsdw62j+14V2Kk7H1VOQmmT/qefxVfykQzFysm+l+QQGO2Vak
         OHkD/UrvnxTJ5PYU8mmzOph2YTw2b3EBehhaX1vDyMJ807+Wrl1ER1GAN8RuyXzukyGX
         MSPSf0jlZu/zF+bA5JzNXB65mOwoNkc5TNasBQ9H12ITXq3uWfVikM7oNfpZ0lL2kCTW
         QQ23L1xjqpIB4Vu6IakeOQeE0B/uRWcSGhupxYpXLGzaWWGBzRPFMFOliMNNcfYPzT2a
         oXAJrrp/iU+crY3/CEovw8WFWM3DWu30xnLaQ9ejNrujxmRRGiWtMWfnyZBYN5JRaJR3
         8A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369673; x=1727974473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8YXz3xJwYM5w/OK9x2qBPOxlg0qWTOKPTFvzRr9UJQ=;
        b=TtSYbOpATz9FYBnEyFpoMOtzqVwQkRnz47nSxdKGvgcDG8RMdy3cURaP9xyQHdP0T7
         nGcYs2WzG7KLLmHrcRTuRiIL4ITCN4dYR38IwJtIC3D1VD3SkO3kgViPSqk2/u9Wq6cE
         6uLE8ajurjChkyZgGMqQyj/tAly6URJuLo/n7LgQT8ec3M2Jpd9uwylCyGgGexFB0OeZ
         kopy3ddYUuDJj7fn6Bqp9XM1x5fZQZQNnQDka/XsqWUL+m9GPc+K1CsJa5kVW4iv/pzF
         w+cQJquMbGgImLMJ9nbekdnlVZXjIrbZKnojkifUnWK/IOq706qnzrIK9SbM5DXUOfw8
         LZkQ==
X-Gm-Message-State: AOJu0YxECusFIXcrdKkJoM399bOGwPDx+Dw6x9rSjgL5UPOLRoVimtZa
	CQBXaJtiRhXWSsmZ63J2LsOSH8OytIJ8MATS/sRNNRFlokf6RZOY4uHBnA==
X-Google-Smtp-Source: AGHT+IG71GkEna8nM0+z+CEjm6upP/tl2YVZJMZaqlC6YXrPp3VrSAb4t7N9sXbJcbYv1Npz0OEzHA==
X-Received: by 2002:a17:906:7946:b0:a8a:7897:c043 with SMTP id a640c23a62f3a-a93c4ae12c7mr11871366b.43.1727369672851;
        Thu, 26 Sep 2024 09:54:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 4/6] xen/ppc: add section for device information in linker script
Date: Thu, 26 Sep 2024 18:54:23 +0200
Message-ID: <dfb4adc54a19173741f28040e928226718327cee.1727365854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727365854.git.oleksii.kurochko@gmail.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the PPC linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V4:
 - use newly refactored DT_DEV_INFO
---
Changes in V3:
 - use refactored DT_DEV_INFO macros.
 - Add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 0c4b94814b..9222213484 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -94,6 +94,8 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    DT_DEV_INFO(.dev.info)            /* Devicetree based device info */
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     DECL_SECTION(.init.text) {
-- 
2.46.1


