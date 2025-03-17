Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1227A64E92
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916726.1321792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9SZ-0005WT-Pu; Mon, 17 Mar 2025 12:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916726.1321792; Mon, 17 Mar 2025 12:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9SZ-0005TL-N8; Mon, 17 Mar 2025 12:20:47 +0000
Received: by outflank-mailman (input) for mailman id 916726;
 Mon, 17 Mar 2025 12:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9Oz-0000kV-MM
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:17:05 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcbbb15f-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:17:05 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff80290debso2943863a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:17:05 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-30153afe386sm6619992a91.23.2025.03.17.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:17:02 -0700 (PDT)
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
X-Inumbo-ID: bcbbb15f-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213823; x=1742818623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExAF3QnqtzCyOB+XNnlCTfh/d/FC0K/Qux+S5c/zFfQ=;
        b=Aj6j67jrz0tnwxX2dqetRl7aBBVUssaXcKX4MkbgnrRQWzfzcZVxmBG0rSSHoHJJxH
         uFXneLO30yZm/tQ7WwaGKt7OoN0FoCfaQlvVMK8qlXAXdCj8/a4xjm+pGtBqgUwmn3P5
         whtr5TA9teqeMfOycFuaPv+dR/ak9uCFUkJ+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213823; x=1742818623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExAF3QnqtzCyOB+XNnlCTfh/d/FC0K/Qux+S5c/zFfQ=;
        b=IVjssv+oIx7aFlkqL8XReBVsPZ//O3XiugPe9gl6oDOJ4DaZSuC3gN26nazu7nQXK4
         Wo+/1aX+TKBbbd+f50xwPkVQZWvwuQnYoyNobA2PMpztYpyJ2UfI+T8+gu+jhiG2yAEA
         fwpxri+ZuX1cfJbkEy3bXVjVQdOq0i0efNhX4SDn+nG08YTANhhocJmJo2/xXhj5zats
         VSOY8eumX5ZyKXID0xcoLO1EVwVSBVLB+JjLDJY4DYv+LrlF+njMetR90gtPzc5dWwm5
         48Luo3oxO88WWtYeUhKd+deA/qymwAzcXlwacbQmBpJ1pJ3xPTTl1u95YzgR3fNbhyFU
         Q3CQ==
X-Gm-Message-State: AOJu0Ywl5F1DV8o0pGF2jgGBIOni/KA/JAN+grCMPM+dB+zmwdovgNca
	1bhY50v5iUQCT9JKwSD3rKYamueLwMSAAqa310LPVV0uNaJn0TT0eajeq+T6G5fxa+YcOqGUxVd
	0
X-Gm-Gg: ASbGncs0l30QBUJOFOax2ZJDl2/lU/kury8/OAL/oN8N4w5ZvS9f8apujwTgkIPkBrB
	iRhmfq4iFc1+P0RP8AGNHnzw35tvrU8r3Bho/JIIAMCEk3U486TNmPmiTOblSsB3PqO64U7oBj/
	+8TRv5SJU3XDuqgulPPfyC8h015S33ADyYC7BhcKDAJPX02Blv7IkoMnWP0EzT58PPreTRdjXNm
	iuZMeE05ycPx9AtdhnmONTkTpmB+EVanDffXwXB02DB04MG4MpJkM8hiS0FXfWgh0W/1ldlSL3x
	t4tsHbZo4wrxvN6VfvtVQKveVxMEn6Hz6rdRdREJxchaPAo+hZtJqmg=
X-Google-Smtp-Source: AGHT+IG9VKBFGpRSjlxMyzHMkXA4I35suEnyblv2xyrab/O0Jwaix+SsdyOLzPLqJNtiEGpC+FCUAA==
X-Received: by 2002:a17:90b:56c5:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-301519cc392mr17495270a91.0.1742213823079;
        Mon, 17 Mar 2025 05:17:03 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 6/8] automation/cirrus-ci: store XTF and Xen build artifacts
Date: Mon, 17 Mar 2025 13:16:14 +0100
Message-ID: <20250317121616.40687-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for adding some smoke tests that will consume those outputs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index d8a322acd54c..c74d5cf6eb9a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -61,6 +61,14 @@ task:
   build_script:
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
+  xen_artifacts:
+    path: xen/xen
+    type: application/octet-stream
+
+  debug_artifacts:
+    path: xen/xen-syms
+    type: application/octet-stream
+
 task:
   name: 'FreeBSD: randconfig build'
 
@@ -106,3 +114,7 @@ task:
     - cc --version
     - git rev-parse HEAD
     - gmake -j`sysctl -n hw.ncpu` LLVM=y
+
+  xtf_artifacts:
+    path: xtf/tests/selftest/test-*-selftest
+    type: application/octet-stream
-- 
2.48.1


