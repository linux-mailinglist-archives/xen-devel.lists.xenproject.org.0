Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5438D9D6288
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 17:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841969.1257436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWqN-0002YI-3D; Fri, 22 Nov 2024 16:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841969.1257436; Fri, 22 Nov 2024 16:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWqM-0002Wk-WB; Fri, 22 Nov 2024 16:49:18 +0000
Received: by outflank-mailman (input) for mailman id 841969;
 Fri, 22 Nov 2024 16:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIkc=SR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tEWqM-0002We-1D
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 16:49:18 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3828c50-a8f1-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 17:49:12 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa20944ce8cso617981966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 08:49:12 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d02062428fsm968130a12.40.2024.11.22.08.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:49:10 -0800 (PST)
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
X-Inumbo-ID: b3828c50-a8f1-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIzODI4YzUwLWE4ZjEtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjk0MTUyLjY1MzQ3Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732294151; x=1732898951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrcWAann3R6IDE6zHfTBtKUS+KytYgvo2ehzs9crA9o=;
        b=YJqWJGbYoo7paonbdHpzJCVQnYH7AERXN3/OPXfsqoPjCDdijRu4DkHLgrxp9nUTnm
         5pVug/3BB4KD1KQjy4G9bIZnuVBHV2YFLPN38yvuxDmkfk7eqR4/xoB4fi6y+IJrQHSQ
         Ur3smmeg6dTKgn+3+PbCETG9cCvi3ENcrEgEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294151; x=1732898951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrcWAann3R6IDE6zHfTBtKUS+KytYgvo2ehzs9crA9o=;
        b=WnlFOnJZtA6tw1fsBrBIOMO/Vy04bxYOqYdzqioa1kLGscPtNZ3hmP/6mk2dmqpxA7
         4qIZmBwNtzaM8ICgT1bfLkLsl8MYJqIyeKXW1wmvca52hEJcN2qnnDhYNAquMEy2kI7P
         0fxJAdHdd1jHo0lzdR2oE6qRWBVa5+B0w1OMQ6uI9G5RPMfYLQQ6nO93ljBcB4yf+D6t
         yLFAXNxv2B9KhgQQgxVDoQAeDp3FQzx7jhsnx8TnwHRJKE/ep98Xbole6ytp2IaOcAHT
         98ytM7ClJpSva3KIWD6Bj3+8LyRufCB+MBp8bXDK10zj7QNp/Q9xBO2sW03V86jkHeW9
         K5bQ==
X-Gm-Message-State: AOJu0YwmwlHjiq6dw2Qnf/A4zekM24vXv6tUd/BBccnIS7snB5yrLKOo
	w9Ujhr7e9f0lRzP19bbBRWX+PlIqatBKTOiBCF2v9uyhu8/26tDOdi6av+eEud/m+QgwGj20pzv
	L
X-Gm-Gg: ASbGncvuW4zVDMTBuXxSgVaPqrUOmx8Uoczdqp/O85v7Yho8cZjzekno3Bp1S+E9mhe
	Z/lr4dLT0ZAE9ERc3LO6H+ufq3rPXvWq6IY5slV63/vYFkny2yAN5aSOjU93z2TwQrrgz68gCMJ
	HdUMCV4mEVg0RFqZFjZw1JkUeBTIDLzmE4axqLqiX7rDRXTuU2a2XeCsmK/Qbls783uzK6he72B
	aro46NOqSSl9iz3kMw0ewL56lErYCMTGYtikztiFavLydWR8B3VNEemfKa71ledvLlBnSg/8+dV
X-Google-Smtp-Source: AGHT+IEICu4NjLuTMxk8i0SQ9MTEbyZUOyVgBP3B/GeXRlcEn33f3WcE5wc944/iNHm9QQm9PaAKug==
X-Received: by 2002:a17:907:3685:b0:a9a:6c41:50a8 with SMTP id a640c23a62f3a-aa4efb762ffmr845829166b.17.1732294151459;
        Fri, 22 Nov 2024 08:49:11 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] docs/sphinx: Fix FUSA indexing
Date: Fri, 22 Nov 2024 16:49:08 +0000
Message-Id: <20241122164908.3240056-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx complains:

  docs/fusa/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs'
  docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/market-reqs'
  docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/product-reqs'
  docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/design-reqs/arm64'

  docs/fusa/index.rst: WARNING: document isn't included in any toctree
  docs/fusa/reqs/design-reqs/arm64/generic-timer.rst: WARNING: document isn't included in any toctree
  docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst: WARNING: document isn't included in any toctree
  docs/fusa/reqs/index.rst: WARNING: document isn't included in any toctree
  docs/fusa/reqs/market-reqs/reqs.rst: WARNING: document isn't included in any toctree
  docs/fusa/reqs/product-reqs/arm64/reqs.rst: WARNING: document isn't included in any toctree

Fix the toctrees.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

I'm also going to prioritise getting a docs test in Gitlab CI.
---
 docs/fusa/index.rst      | 2 +-
 docs/fusa/reqs/index.rst | 7 ++++---
 docs/index.rst           | 1 +
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
index 13bf4e8e23f1..5f1e8acfc429 100644
--- a/docs/fusa/index.rst
+++ b/docs/fusa/index.rst
@@ -6,4 +6,4 @@ Functional Safety documentation
 .. toctree::
    :maxdepth: 2
 
-   reqs
+   reqs/index
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 183f183b1f8c..8a4dae6fb249 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -7,6 +7,7 @@ Requirements documentation
    :maxdepth: 2
 
    intro
-   market-reqs
-   product-reqs
-   design-reqs/arm64
+   market-reqs/reqs
+   product-reqs/arm64/reqs
+   design-reqs/arm64/generic-timer
+   design-reqs/arm64/sbsa-uart
diff --git a/docs/index.rst b/docs/index.rst
index ab051a0f3833..1d44796d7296 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -65,6 +65,7 @@ Documents in need of some rearranging.
    designs/launch/hyperlaunch-devicetree
    misc/xen-makefiles/makefiles
    misra/index
+   fusa/index
 
 
 Miscellanea

base-commit: c0bf8816c9e2a4701c925d8b23abfda5990a0087
prerequisite-patch-id: c6d7da051cd408c9f38d32ecdd24807bfbe619d1
-- 
2.39.5


