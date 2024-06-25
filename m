Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3705916971
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747738.1155269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6af-0008UN-G1; Tue, 25 Jun 2024 13:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747738.1155269; Tue, 25 Jun 2024 13:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6af-0008Pk-8r; Tue, 25 Jun 2024 13:52:09 +0000
Received: by outflank-mailman (input) for mailman id 747738;
 Tue, 25 Jun 2024 13:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6ad-00086j-Og
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:07 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b303187-32fa-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 15:52:05 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee6eso9550674a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:03 -0700 (PDT)
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
X-Inumbo-ID: 1b303187-32fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323524; x=1719928324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSkiIZsfofGLVpyJX0+MYwmop/9bun+99VlWirx1I7g=;
        b=Yjc+VTH8D7g1VxX3/ymoyLnYx9qMXTecSLQ2pCbCh6sh9gPFuRpwHYBNAai4sM9oWl
         fYyUCOPRTLnwH3VPltxATdF2jo3geTTc2kE1CQh4R7ivXCS2HJdk42lW4FjjLRgOaC7M
         SAqo1104u+EeHJ+Mfl3I2Q5CiNU2xdDJAuKPJtKby9nJDUBexKLhuF48WWcuqQ4AJqJD
         0NI3nPZllRBsux9wWfnwWqKzfhUThet4SayByjcX/aXacrwYeDEdgl+ulL/NKPFpUjfu
         4coesx74ctn9aGWP4axAytHeGOcys18asBIW5m/0VVaw7zGQLeliLvbMG3Lwcg3GG++2
         5aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323524; x=1719928324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSkiIZsfofGLVpyJX0+MYwmop/9bun+99VlWirx1I7g=;
        b=kb+RPPJhTR0PL0o0J5e6+CD3LpvqJJbwyGMUF76dR8aRRkONim/JWSqstEVPwT/YTf
         LRjCwCa9IkMbpk8UDou/cv2N3gxhopR7qNEiL+2WqIJAsTupNrN+KF59B1xXRG2PqbVw
         Zio0GzRfnxbCrlZyhD6Y+wopSohO7Ta200OVgjw+W8/fs4KMbHAW/qdVK5dTF3aQATmT
         PADFd0Gu6taWuKWa9nbs7Xjiciuklsxgnn+5FTalxd08xYt8Vg50sQKBPXg43TWymvfB
         yisasJvPrVzRSlvMQUaYkgyJt3jNM8DyHqS0nELdch0uu4FBagVO5MvU13dMvHT6mro8
         TWgg==
X-Gm-Message-State: AOJu0Yy/G6Be0/3D8Uh/4ZVXxpj2g7qpDzdnsnzGquPjFyB7ICBcarIT
	8/UWdufkkM39s2aeHhDlpgejsc0h0yX86A2qGGcnIqA+K2aX4gGwdv3qP3pG
X-Google-Smtp-Source: AGHT+IFMs0Omxeew+4X0r3cEV7F/MLardqkDFHQTtF7JJ4AaL2aAQ5uPbtmfBLPxuLRRkEgSg04izw==
X-Received: by 2002:a17:906:3acd:b0:a6e:f540:8b5f with SMTP id a640c23a62f3a-a6ffe3ccd2emr585829766b.19.1719323524014;
        Tue, 25 Jun 2024 06:52:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 06/10] xen/README: add compiler and binutils versions for RISC-V64
Date: Tue, 25 Jun 2024 15:51:48 +0200
Message-ID: <9ad0bd3d2920ae6bf9ff81beaca9b4d899f65d9a.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes in V13:
 - drop the line "Older GCC and GNU Binutils would work, but this is not a guarantee."
   in README
 - add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes in V5-V12:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index c8a108449e..9a898125e1 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.45.2


