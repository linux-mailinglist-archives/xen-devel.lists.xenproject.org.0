Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0D9B91C5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829113.1244212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWN-00017B-Iw; Fri, 01 Nov 2024 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829113.1244212; Fri, 01 Nov 2024 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWN-00013J-Ch; Fri, 01 Nov 2024 13:16:59 +0000
Received: by outflank-mailman (input) for mailman id 829113;
 Fri, 01 Nov 2024 13:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZeD=R4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6rWL-0000WD-FN
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:16:57 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f57c2a7-9853-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 14:16:52 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so3755774e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:16:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm549745e87.194.2024.11.01.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:16:50 -0700 (PDT)
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
X-Inumbo-ID: 8f57c2a7-9853-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmQiLCJoZWxvIjoibWFpbC1sZjEteDEyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhmNTdjMmE3LTk4NTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDY3MDEyLjc1ODg1Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467012; x=1731071812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0tCjI4kCmIi/dimFkccnAhbpz2v4MkjIHvRt5/LZKc=;
        b=bS/TOcc9eOY6e/oP3zOhDFIK4LC6RNGRKpeTas2rkMEI/UphktQwARA6OP42KxBYL9
         kTo+VQX4hlmSkxI3CiV0tcPQJ9/Z+rridX1LWhGIAIpg9KOKGf/Fqr06/kyPe//xzURF
         4vBa1JdrbHGNOX6u56Js0FN7jGI8ie2cI5eRyhNq0AYS/gxhcZfk7VbmhUg5Prf/sj5i
         1TBOFfdvoziyRbszAMevSImcg/4bhzkYMBsnbTn00LdaGwAXNnSOW0PtOUt0QdGcHMM5
         Dd7w0kzpRblRSd+UdcNeSXM2/nHMPcJxop4BycRKCnJEkWo1+5Q+Oh1JMDZs9oYnPhF+
         Msnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467012; x=1731071812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0tCjI4kCmIi/dimFkccnAhbpz2v4MkjIHvRt5/LZKc=;
        b=rekl324VztLNMgYWjOwEF5mkvFdpJns/Q9sYxmdaEGzUmR2trLuyrl3S8lbMGfP5I0
         eLtetZcqpmAVsj87FT2bxMXo9XS/NfmQvGNFI5jV8xvki9d76GI93m9cXinuesdPHqRy
         NUZwRc9JUL8Ye+js2BYWWZQBSDAQiempEvvlTZoZAxVqEA0KtRWY8Upj7sfne7/ARD+M
         NBXnkMk45+nKIoARgnvXpeXpPl1YYIqX43o3k1gIacbGdTvpX8UYQPZPXf28pzcX3RRs
         PtruFLa+8dsNx9mHZqeNHqtDqW5q0PkhENx/b9dyEZi2G3IrP1xNfyb6IewUFXWmtB1K
         i9xQ==
X-Gm-Message-State: AOJu0YwxQG6Be2DuUjcOzIUUllQVVTOVPzQb786VegNCZR6TXVi+Bs8S
	MOtnTwQ0/FhizRwJ/U4FFWGmrGdupktGNjnrkydD+DK3Jy8zJ2M2gsKYdw==
X-Google-Smtp-Source: AGHT+IFQx18uTeC/Snv59cGLNLIp1Lxw6/5eIE0h/7dXmAj1Y1L+LsPcMbcCgYlU6b4OezBlGLEr5g==
X-Received: by 2002:a05:6512:3d10:b0:539:94f5:bf with SMTP id 2adb3069b0e04-53d65e16d9dmr3248992e87.59.1730467011519;
        Fri, 01 Nov 2024 06:16:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Fri,  1 Nov 2024 14:16:42 +0100
Message-ID: <85a6e3165f4952882b5c430842ccf724650d78d5.1730465154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730465154.git.oleksii.kurochko@gmail.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a call to end_boot_allocator() in start_xen() to finalize the
boot memory allocator, moving free pages to the domain sub-allocator.

After initializing the memory subsystem, update `system_state` from
`SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
early boot phase.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V3:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3652cb056d..9680332fee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -65,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     vm_init();
 
+    end_boot_allocator();
+
+    /*
+     * The memory subsystem has been initialized, we can now switch from
+     * early_boot -> boot.
+     */
+    system_state = SYS_STATE_boot;
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


