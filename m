Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAC9953FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813297.1226169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCg8-0006uZ-Kj; Tue, 08 Oct 2024 16:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813297.1226169; Tue, 08 Oct 2024 16:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCg8-0006sh-Hy; Tue, 08 Oct 2024 16:03:16 +0000
Received: by outflank-mailman (input) for mailman id 813297;
 Tue, 08 Oct 2024 16:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syCg7-0006rp-TI
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:03:15 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d369670a-858e-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:03:15 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fac275471dso56972201fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 09:03:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b24642sm12287761fa.82.2024.10.08.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:03:13 -0700 (PDT)
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
X-Inumbo-ID: d369670a-858e-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728403394; x=1729008194; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gr3jfdjN2IAATYfVe7H/52XJ9irHMNf7CDGnxXUGKes=;
        b=efW4EUHB5KQM47xKqfDarQFUmyC0/ewY+3N3COv7TxI87fzfiChMm485zAPPT9t+gZ
         EqkgZrNkItfgXdpL7zLtp3HNzudMG3/1JR1rj8vJc/V+yBlewx7H3UEYihOXuO7ReLRo
         VuicAUlTPZr3Ht63a9ssHVhkPqp4Cr79j30oBjjZ4RtuZDS/NFxcaTsqnPd8HZ6n+Rhj
         fFbatYe7cSdcsD5mk9AteqLaiJlfproxwuLc7yXhBPZ9prf3bQI4b9k9GiX2qLj6NUUB
         N7WmAU3Ajaief51/F8C+ktmSGDyHDiPYk4M4Xt5HLSy3NPgZQWy3Sfx/FoVeeiukoxL+
         Ub7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728403394; x=1729008194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gr3jfdjN2IAATYfVe7H/52XJ9irHMNf7CDGnxXUGKes=;
        b=BDyWl/X+0/pToq4SK8QBaJAnoVCPBfL3r2S3I836Kp2e5l6AAOTv3YYp+XNu/nF70R
         Tj6qG7GkYmryBy3RirEsMvOk4edrdUgFNTSlviWpaMK6hIFwG2EJFvkaqDhEuQdUrXVf
         Ip5+b63E93CaUY1PE6y0GpQKaPck91t748PbliGy4LlkzYPX649nDS9ZMvCQId8rG9dE
         YUoM6fb7f+2Lh84CDW9OPz7XcZ5ZDMS6otrFb5GgfsmTiCajrR4bJux06P+vM8h5zjLD
         +K3aIfqGBNmpoQs7J89GdJoaXbJGPFTAPDLuErImkLG1xggrLgcO93L3p5P0NZIcCGa4
         IsvQ==
X-Gm-Message-State: AOJu0YyJYk2OVRUzT58NvuF03mQjbgUWZY0R+/NYN/7eotqm8puMMJqb
	WRp2n+W5Rju0gHzlHOFLj+0eVO5xwProbCn/vUv6EVUMzazULGnmOir+FA==
X-Google-Smtp-Source: AGHT+IHS3PfMzfAFSOAmiLLvuEiZ63nmFUW5Ld5RzH9RCmUdAY2uTn7QoDIlcUpxEZt5UjnqNDPQ/w==
X-Received: by 2002:a2e:6119:0:b0:2f7:5ca2:6d10 with SMTP id 38308e7fff4ca-2fb16048f13mr1819121fa.15.1728403393967;
        Tue, 08 Oct 2024 09:03:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for RISC-V
Date: Tue,  8 Oct 2024 18:03:08 +0200
Message-ID: <20241008160309.78329-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As an active contributor to Xen's RISC-V port, so add myself
to the list of reviewers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0ebf0939..6b0b5654d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -485,6 +485,7 @@ RISCV
 R:	Alistair Francis <alistair.francis@wdc.com>
 R:	Bob Eshleman <bobbyeshleman@gmail.com>
 R:	Connor Davis <connojdavis@gmail.com>
+R:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
 S:	Supported
 F:	config/riscv64.mk
 F:	xen/arch/riscv/
-- 
2.46.2


