Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7A6FF824
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533493.830253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nT-00037W-QI; Thu, 11 May 2023 17:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533493.830253; Thu, 11 May 2023 17:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nT-00035K-M3; Thu, 11 May 2023 17:09:43 +0000
Received: by outflank-mailman (input) for mailman id 533493;
 Thu, 11 May 2023 17:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px9nS-0002Li-24
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:09:42 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc7fa0c-f01e-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 19:09:40 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso95684911fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:09:40 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05651c014900b002aa3cff0529sm2443830ljd.74.2023.05.11.10.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:09:39 -0700 (PDT)
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
X-Inumbo-ID: 9dc7fa0c-f01e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824980; x=1686416980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWsC0H8EDMmSieqZ7gOMXlH4Th+2i/GWuOb1eb4Ax/M=;
        b=RJ+GzWd2+M/UA2GASGdkSGFGLNbF7ILUaarJLuLahmcAmZLwXJBwplyASaKMNJL4wo
         8cy3Jw7hg/5gzdrZKh8iAceEJHbz3qZ7+8jwpX/g6qVBog732QR9JelzCULQm37M06Pm
         h0pE+D6mrelzUAcZFzkXdH1WuNu26DRlR8CaRy1APiDm6/K651UAKmt7EuoZy/YPRnGE
         /mbHWvFMFZdOOu8A2n3RCOWhjeTLABgLlNiOFWh0gGVv9qDV1uSFM6nM0iX2wBVUe5nK
         I6bOtd5P8x0G0D2q4LE/j5uHoElPe5G+bMfabqVDqQk092oFWOomTwtb5SrAK8l9SHsX
         WlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824980; x=1686416980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWsC0H8EDMmSieqZ7gOMXlH4Th+2i/GWuOb1eb4Ax/M=;
        b=HBMXjZ6YlaBdMi8wHZbCHbwYTDdT/A8L/7FTZyVZvJwyD/Xg9rM1N1IG0u+AcbSKJI
         IlFlb/5MCzL+cfVc75E9gNNAfZ89N2nUhtNQUesEON3WC/9UNfxRt/0r15Qe+K9pReD8
         zyGiRMr7KzgBf2O8M6Ij5bdfOa3fXznfXaMc8NzSyx/sWlMXvlZCoet+NRGrBYj2caFJ
         XOZBkQLF79HFBlYAFWBVWAQBjYeqXZLjRRDc7XI/ghjCWvRxRTgh9kXq5defmlELTC/7
         1jBMunerRob/jWPtNqmqqJDoWvyzo8ECbcVq4cJxwe7GIAxOb7O6IduhtEPCi3Jqag17
         HLEw==
X-Gm-Message-State: AC+VfDz55vA1Ze00v/5dxOxoZXN5CkUCvL/O+TacM39/Tk5qBefIj5Bp
	L/xkdI7RCwHOh0+L2OkuGJQTWCuHMsM=
X-Google-Smtp-Source: ACHHUZ5t9Db1MsuXcfjj1l/E9PFrYldTbbi+EUASpKkr9atGawlHMITYeexvQlrD8+JnnfEbd2hQLA==
X-Received: by 2002:a2e:8456:0:b0:2a7:b163:6a40 with SMTP id u22-20020a2e8456000000b002a7b1636a40mr3441558ljh.12.1683824979545;
        Thu, 11 May 2023 10:09:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 3/5] xen/riscv: align __bss_start
Date: Thu, 11 May 2023 20:09:31 +0300
Message-Id: <2e9018989c628a519aadeae150786efe5e8054ab.1683824347.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683824347.git.oleksii.kurochko@gmail.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bss clear cycle requires proper alignment of __bss_start.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 * the patch was introduced in the current patch series.
---
 xen/arch/riscv/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index fe475d096d..f9d89b69b9 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -137,6 +137,7 @@ SECTIONS
     __init_end = .;
 
     .bss : {                     /* BSS */
+        . = ALIGN(POINTER_ALIGN);
         __bss_start = .;
         *(.bss.stack_aligned)
         . = ALIGN(PAGE_SIZE);
-- 
2.40.1


