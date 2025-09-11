Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A6B53EFE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120997.1465588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007ME-CF; Thu, 11 Sep 2025 23:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120997.1465588; Thu, 11 Sep 2025 23:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007Gb-8M; Thu, 11 Sep 2025 23:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1120997;
 Thu, 11 Sep 2025 23:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSm-0007EP-7i
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53839d3-8f64-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 01:12:21 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45df656889cso8262925e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:21 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:20 -0700 (PDT)
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
X-Inumbo-ID: c53839d3-8f64-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632341; x=1758237141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moBCqRr5Tce3kLFSshOWPZblWbvo8j34kwNtthkvDIw=;
        b=JBBXRkkWcjYVfxnQ/6qGtRB2Z3WsaQ+C+IkoOzZOsWuiT0N3pczI6iZ5qW2XoYlqwY
         g/A1E1V94FxSn4FYlTsN/FDHUit6FJQzAhEqLFTF9MFhjvrBiarfxChGnxT+t7q+IISc
         9rVu/YlRr20yuaN6Ahqdmyt8FubBtTK5leLqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632341; x=1758237141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moBCqRr5Tce3kLFSshOWPZblWbvo8j34kwNtthkvDIw=;
        b=uems2m06RbvvdRiKK0BUdD48Te4kfozrVXV9bnv45S87Msze2SIEqEh24VegK+DbVd
         beoGQw0LSrG9osAkLynZVJDFKkXjJxqwAj28V2S+zMNz4hFybLgQ6nJuuk60bycSLtKS
         YDnfRZ06JSJseEULgSgJ9evnwquicw1+Sqm5BX3jGpqrb0JqcLqtWKZt1t7P98wtJMNj
         qWn64FT32doWvmfuF7woAP5+42HEOyvHiZDKCh+Kz/9uSP6t/4Gstnho+bu43b8G5yi+
         K1dm7+B4/TH6UQOclmON57dlTugcAkJ9RBRcxjJcvykeWChb5rAekH7Zr7Lh5mhbVX3I
         uY+Q==
X-Gm-Message-State: AOJu0YxSfyrrUJJ9re6FuFwKXJqU/8TMo6CXSgDshz6ndGvptFxj5fBD
	menmF4YGcQibdxMiGFUr/ixQ5WERHyXpbJm8IkJwiEx+OQ7PJUiG4GhzcLSrVVQ/Cc3gI+dMtIX
	BCQxB
X-Gm-Gg: ASbGncu32OAKAjgyXsbcBzrD24ZlYNxD3OFUiY+ONA6qjUHvIRzKG5JkbTfBAQqzMsQ
	OtuGT1MC5oz5jzJx4hz9OcxEw6RkPW9NB+7f/6YCxZSwtlqtdTg0ldphdP7e0G4DDR5L7gigxJI
	GZti0CCAJfENXWzk8x2LiZ7VdWy5Bi/C7GU3+uPNzuLm2prEgn/XDg8teSTezoJz5eFxhJa3huf
	vrG2GMF8fKkzN5Uw0OpbxefFeVNhFyM9eSE/iodJKEp5mmkJzIJMHO6lOCIfYWmIpygOuv7AmG0
	cOyPBuaajKK3tCBZypxyUh4gT0IvEaENldTWbid2t3fOxeA3GuSgs5LmsXhbkYTHxmb+p/5qWC9
	r1yVLK/Osm20zum4fQqyIIQeRY8vyA6fsUtLPwaf5IqhM0bDfOWJOFiMJ/MuIP6H9WQWFlYYZS4
	4URh4q0ZWGV9I=
X-Google-Smtp-Source: AGHT+IFn4eSEVOqBx+EUwg3DPBWka8jtAlLC92oVZkkzviYQMrlbmjdmYHW6UYYgM8Armi+t93ZHxw==
X-Received: by 2002:a05:600c:5798:b0:45d:ddc6:74a9 with SMTP id 5b1f17b1804b1-45f211d5507mr6613845e9.12.1757632340905;
        Thu, 11 Sep 2025 16:12:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v3 1/5] CI: Use the Debian Trixie container for RISC-V test jobs
Date: Fri, 12 Sep 2025 00:12:12 +0100
Message-Id: <20250911231216.1886818-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was missed when introducing Trixie.

Fixes: aad6ebf0596f ("CI: Update riscv64 to use Debian Trixie")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

v3:
 * New
---
 automation/gitlab-ci/test.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 95b883b32bb6..1de68a0fe450 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -77,7 +77,7 @@
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     LOGFILE: qemu-smoke-riscv64.log
   artifacts:
     paths:
-- 
2.39.5


