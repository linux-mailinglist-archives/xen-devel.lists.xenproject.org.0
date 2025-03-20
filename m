Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC2A6A9F9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922635.1326540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt4-0000wD-A5; Thu, 20 Mar 2025 15:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922635.1326540; Thu, 20 Mar 2025 15:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt4-0000u0-6O; Thu, 20 Mar 2025 15:32:50 +0000
Received: by outflank-mailman (input) for mailman id 922635;
 Thu, 20 Mar 2025 15:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvHt2-0007l8-F3
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:32:48 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9302670e-05a0-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:32:46 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso8952875e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:32:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556afsm51545035e9.19.2025.03.20.08.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:32:45 -0700 (PDT)
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
X-Inumbo-ID: 9302670e-05a0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484766; x=1743089566; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqKr1+6WMiT6VQWQ8sqIJpeUTlqKAraO1MHdveiEfFc=;
        b=mrj3gf/rARh9sNyGXpPpKeGsuupceqDXd4xyr6wlj/WxHpYlo03SZN+cpn6oxY+hgA
         9cU2uKJk56EPRTwOzgDycd6yE+qwm7s/BEZXNrRYE3ZyUDKQL3BrIw/oXSyZP32VrUxz
         F5+/zLpvaXJzWMQNfR5Tcb0ARLtdzMtiH5p0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484766; x=1743089566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqKr1+6WMiT6VQWQ8sqIJpeUTlqKAraO1MHdveiEfFc=;
        b=fQKaI9d8Bcae+qYterRxrKQ0ziELiVBZehe/6jWeUQ6FLPJeIuElaDkHp07UQuwTxt
         Oi6Qz9+mWcsqLpdp9lydeyQiROMU8h8Sn+IEhsr76cTVn+aouf2ZjTzMKZEaqrAAfJxA
         VZzN2l4stRo4x7nqlL8CMz2Uy+JNP0okgzscc+lJtg4H9wgMlGVWg5Vp0OfBuh9rlxSe
         F9XnMgvzb1CNsVqE6Lngy3sqtO1viQtII8iAoS3a+upiyWwuUJ8YpXXe5xfI8ECe5tlY
         aASO03KzMXBRxF9mq9JnS5eQCJxdQGK1pE+aYEPTKr4VqLgp/WD/w2pBZR4x3GabFwVo
         2VbQ==
X-Gm-Message-State: AOJu0YwSKcX+IlenPDtlE97q70Iw3Ayrj7htFcv4jefU9pa+y3VI4eHZ
	bGzUb9SjqPjbW0asFE4j2HDDBz7dugKbdlr+JkAPU9P2BMOpcBclxzHDpw03yKeyGBc+e7f9F7Q
	1
X-Gm-Gg: ASbGnct3YB75VGYIoBppbgzgIpR6KIydVWD+G8BIfGim0XRgRZXvFWEz69dNsqcXIBA
	X4OwII3qOyBrX54W0mJ9KypJq/ckmCxhLHlkVXXIGp2l78vngcxD84jrLIf1yLjt+emk4F1wqMx
	W4j57i0Drpkdn/emMwcftwlq5ZvhlW4zoPXjKrpT1OSdvvIDKa0ny7DQbI+ysXySIUifM5EohUA
	qraVJrjkwtczAAezfjvHLqCUZcghy/CygXWTVIzlJoHt7LgFEskeLvhlaL4wP/wC0IzrxvL1a1E
	+ZJlpSALa4P7FGWPY+izFNJjO3PnwxBley3urUgJ/oJvCCIf+8RjbRQgZtnMto6U9x2fu2Ev+Jz
	8UtMo8wecAIbS4j4BRQ==
X-Google-Smtp-Source: AGHT+IHfoBbaCCxdI8yHMiHhbhLKOfnQWPGOYv+M3jOdtq0f5Y9MgdU6fu395yPSzUthejz+DIsrHw==
X-Received: by 2002:a5d:588b:0:b0:391:3f64:ecfe with SMTP id ffacd0b85a97d-399795a4f89mr3323649f8f.10.1742484766010;
        Thu, 20 Mar 2025 08:32:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
Date: Thu, 20 Mar 2025 15:32:41 +0000
Message-Id: <20250320153241.43809-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320153241.43809-1-andrew.cooper3@citrix.com>
References: <20250320153241.43809-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d43..4e333e608a96 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have been increased to either:
+   - GCC 5.1 and Binutils 2.25, or
+   - Clang/LLVM 11
 
 ### Added
  - On x86:
-- 
2.39.5


