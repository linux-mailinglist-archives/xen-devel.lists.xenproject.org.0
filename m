Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57EB407C5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106777.1457426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSLb-0007oB-Vn; Tue, 02 Sep 2025 14:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106777.1457426; Tue, 02 Sep 2025 14:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSLb-0007ik-Qh; Tue, 02 Sep 2025 14:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1106777;
 Tue, 02 Sep 2025 14:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utSKQ-0002MQ-N3
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:49:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa61ff6-880c-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 16:49:43 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso37904145e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:49:43 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9431sm19919809f8f.44.2025.09.02.07.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:49:42 -0700 (PDT)
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
X-Inumbo-ID: 0fa61ff6-880c-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756824582; x=1757429382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtZ7c0T5fMSKg4BzhqMTADQxM87Ecx0Up5U2mRA5ChQ=;
        b=ID5ufqhGhYq2w1fHR0vQXAYke8WX7eE+PTnoBiNHxvok0x34uM4DsdfnClICup7u3M
         a/gmtOwZukh5We+McxOPpxhhNc+kJLBfuestkkrE5DG2co+DVbXEr9X2Uf02Pxr70c60
         sLS74xK+hdicLxKmGhd/8smn7hiQWonDK8D+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824582; x=1757429382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtZ7c0T5fMSKg4BzhqMTADQxM87Ecx0Up5U2mRA5ChQ=;
        b=A2j7e25TOsek4tKBsV4weS8+N15UZ2+tkRGGB0rb0E3XeXuOeKeh6gi/4d5lPBN7Cp
         yrTGTTQZmyOZ5Y+n5Q9+goWdJukDRo+NrkBDYV1l5xRYHngHDliTvMTY+3Ag5+Jatgif
         GTpCL6Bge06up2l8D9ETSgkoUz8ctvxxN3p+mkgrxucPtu6rn/jBpyHifSmccHxNwyMH
         Kpt7epU8DWJM0vAWHpRYGs3hQKHwekw/rHsY0iqlSZeBH8iGdWq1Y9szJ3ORN5jWp9nR
         H+QyP5lrP5iU5gegMnsvupD9vNAoL/wS17vAr8DXBEiCi25nQfNao+kJoAYN3agdUzry
         Nbmg==
X-Gm-Message-State: AOJu0YyZkleHiuA8p2PLjABz3jhP6gXzKer15t91Fd+dRTPVeUp6YczD
	c/pqikEn2WbwLPF/POze4vvzUSFLBuduxHKQvXvKMlPmjaAJE3QefY8q3aPZBrYc351NmdQ6yW2
	BbYLS
X-Gm-Gg: ASbGncvuEGZlK5gnxupMaT14bppE1h2ZtBDhqv/XAhq6cHWvomseZJNqYGGpAzY29Gx
	a/NdYkgmwN/g5XlzpVBjN2GWgPv892GFZkbNh9CNbL/fxs0818ap06o1JhBliIjMR5+eb92kWL/
	8d6dot5k5ZpHuijbC4d836yk+u6kpzRqjkQRwfZhtH97PPkXL0S9r5QSyMO7Dtp6l6HEHBvhGSR
	gnlSy9vKOQLa9oUtDdHzX7m2Z9S7taqYwkyNW6WzQk0Umbv2Dl1+Xifw9B6zRjp/7ju84pEfS5q
	d+GFmuR6W9C9yfnhQ1cAKcpxtZoTE4rvj/0CyIHGKpjRJvUV265d64mRKjOvXVnD20WnrMGKL+K
	1cKegEp3tUoN6rbGKhAxvAxja3a951L1y965we1WbvRKU56j18Gyiukc5FiosAXakJ9wvScOXQb
	tB
X-Google-Smtp-Source: AGHT+IGIn8CTVoBnFgfWrk0uTKOhN2jQz02u0B5Lx2Hhy3eX5vzQYybySn5vFq7YTf5gONJMoNYNTg==
X-Received: by 2002:a05:600c:19d3:b0:45b:8ac2:9761 with SMTP id 5b1f17b1804b1-45b8ac299a1mr80312755e9.13.1756824582367;
        Tue, 02 Sep 2025 07:49:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] tools/misc: Move ignores into local .gitignore
Date: Tue,  2 Sep 2025 15:49:37 +0100
Message-Id: <20250902144937.1414411-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
References: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... instead of having them split across multiple.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
---
 .gitignore            | 15 ---------------
 tools/misc/.gitignore | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/.gitignore b/.gitignore
index 84a01e8afe6a..d83427aba8cb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -137,15 +137,6 @@ tools/include/_libxl*.h
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/misc/xen-cpuid
-tools/misc/xen-detect
-tools/misc/xen-diag
-tools/misc/xen-livepatch
-tools/misc/xenperf
-tools/misc/xenpm
-tools/misc/xen-hvmctx
-tools/misc/xenlockprof
-tools/misc/xencov
 tools/pkg-config/*
 tools/qemu-xen-build
 tools/xentrace/xenalyze
@@ -253,14 +244,8 @@ tools/include/xen-foreign/x86_64.h
 tools/include/xen-foreign/arm32.h
 tools/include/xen-foreign/arm64.h
 
-tools/misc/xen-hptool
-tools/misc/xen-mfndump
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
-tools/misc/xenhypfs
-tools/misc/xenwatchdogd
-tools/misc/xen-hvmcrash
-tools/misc/xen-lowmemd
 tools/vchan/vchan-node[12]
 tools/vchan/vchan-socket-proxy
 tools/debugger/kdd/kdd
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index 73ce95e6d77e..28af46280fa0 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1,5 +1,20 @@
 xen-access
+xen-cpuid
+xen-detect
+xen-diag
+xen-hptool
+xen-hvmcrash
+xen-hvmctx
+xen-livepatch
+xen-lowmemd
 xen-mceinj
 xen-memshare
+xen-mfndump
 xen-ucode
 xen-vmtrace
+xencov
+xenhypfs
+xenlockprof
+xenperf
+xenpm
+xenwatchdogd
-- 
2.39.5


