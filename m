Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35AB55210
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122095.1466051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux510-0006I9-Sm; Fri, 12 Sep 2025 14:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122095.1466051; Fri, 12 Sep 2025 14:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux510-0006DR-Mr; Fri, 12 Sep 2025 14:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1122095;
 Fri, 12 Sep 2025 14:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50z-0004JZ-6X
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:41 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02be5f71-8fe7-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 16:44:39 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b9814efbcso19519135e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:39 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:38 -0700 (PDT)
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
X-Inumbo-ID: 02be5f71-8fe7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688279; x=1758293079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEVGh+hBiy0tcYl95EH1DJJNtCx14TTBNUGE0bJJUpQ=;
        b=WyP6a/ulZBhazQu9MuUso7Kb8WSJBlyVuz1sTMw7z9TR5RXfJpLSxc9XnrNEW+DBiT
         Qunr7ejzEiyO9Fnj2UPOm9Kvhy8UDdfsM+c/KMmnS2i0Mt29yjNui1ztHR1d/xV2Glo0
         uDWvz9KtiM2RM/ImnDFFbH6tNfLmXwFLI0irw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688279; x=1758293079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEVGh+hBiy0tcYl95EH1DJJNtCx14TTBNUGE0bJJUpQ=;
        b=HDGtrmbDXA33LgrQd4dLf86WcP3ke4rziRQ2kOk72Gno/GYfNxgUYJaKge3zVvBDAH
         460s+1DBWjclRs2p85iS0BNjVyA+3q7ulxlidAfZvQ8zcSVUzDZDZAHQRu7pFZvBI8vi
         eleu1NnZmnP8uiR9J/IE60HOTT52K1sS8h4T80SyyFed5YIxGcYauo6wYPS5KejWCx8i
         PD3ShztYiP5txHzrL1iwjLY9Uu/14ryS7v73fcMx9POqm2+cV/NSPsu1XmR2gS9zXUVg
         DZKscdk4LRJTdqd9C6ftqGo0i2VknJ0/LeSI1o13iN0cVJKrX7qpq5ulggS0MTo/4vKx
         G2lQ==
X-Gm-Message-State: AOJu0YxGW5hQO/9RVNkBDiO0hY1mja8qMvVE8Re9PRH6qBvrQ+PiOJja
	WAyf/kWFTsZcQ0a+PEUjzs/Wd7XgtqFQIFbCsj7tLcpQwMy5dG6rUHISQYQU0g4pskWvsMzTm4P
	RsbGv
X-Gm-Gg: ASbGncvoBJNxpgE175qZbvGD2eWbhMZKeZG9GTE1JWpnZ6fOp6Y3+3zvAl4KoIrbcQt
	y5sqSBO+uto4QV7dsu14YS4w7lrqfQ1RUEPG6PSC9H6FZg4wZblzVIVcl3pj48xIy30b2+pfHml
	OBbiSUaFQ6cVqGap1E7FzcAAaWFlJ1x/2ZS1izuWjRWLFlz5N7Aw2Js+P5zzoJNqn/9T9SkE9u3
	V+HHXwlytNBCm06foOmSQieRvFBYVQOBULWBiSpvFs1RFNTbjE0f8ITKHk/UYXrJPM8vOguv6Hh
	erDIn3r8oYQBgbE33z+obgKH6zZT047wRbcNa0qLybuFxS1DlvxVzHCBYGq8ISuFGR99+/NP6kN
	UyNU1FVBBpILeC4c7UmA5vTBx/B2gLp7jBmsMY6+f7wC6S3byRRNFatjReqtcfZp9WBewftr1Uv
	wBPbV0VZtLWdw=
X-Google-Smtp-Source: AGHT+IHbTNMNvOgl9nb7GA+1YNnbAV3yQpRDlAuoAvo8j6kYhG8i+CyDFWOLgim1UcuhTXGEWTEPOQ==
X-Received: by 2002:a05:600c:8886:b0:45c:b642:87a6 with SMTP id 5b1f17b1804b1-45dfd54ac60mr57713025e9.0.1757688278699;
        Fri, 12 Sep 2025 07:44:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 8/8] CHANGELOG: Notes about distro changes in CI
Date: Fri, 12 Sep 2025 15:44:27 +0100
Message-Id: <20250912144427.1905141-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also state the RISC-V baseline now it's been set, as it's the reason why
RISC-V Bullseye got dropped.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * New
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7bd96ac09d14..ca1b43b940d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+   - For RISC-V, GCC 12.2 and Binutils 2.39
+ - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
+   to the baseline change.
  - Linux based device model stubdomains are now fully supported.
 
  - On x86:
-- 
2.39.5


