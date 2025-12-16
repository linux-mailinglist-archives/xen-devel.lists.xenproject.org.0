Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B7CC44FB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188083.1509345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXya-0001gh-9I; Tue, 16 Dec 2025 16:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188083.1509345; Tue, 16 Dec 2025 16:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXya-0001aX-4H; Tue, 16 Dec 2025 16:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1188083;
 Tue, 16 Dec 2025 16:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVXyZ-0001Pz-8N
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:32:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f8a76a-da9c-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:32:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso31265585e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:32:38 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm12994765e9.7.2025.12.16.08.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:32:37 -0800 (PST)
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
X-Inumbo-ID: d5f8a76a-da9c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765902758; x=1766507558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snhnKxagIbQr19lSVEDCo+bKb0pwUs/EFkhnzt3TEJw=;
        b=JftgUmZIq4XX379CGQfilend91sx/9l2hy4U7Jk71q11prXYucvcq6+BRWUFfIAex0
         sf08Ghr3E33v5xOjBK0t7QUagrPWpgH/whTiHiOI0le/zb9+3BnY611B5sSFFUYZpmro
         wCdTNg/+a8V7nG/b9mRaU6eSyw6vsZQ6xn0f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902758; x=1766507558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snhnKxagIbQr19lSVEDCo+bKb0pwUs/EFkhnzt3TEJw=;
        b=bkxx7Uaiaj4gmA2lS46f15qnnMpwpFgXXM0Hz0IhbB3vOmS0QxbHfbAEyOiCFMLV73
         ZWqkH/nI69eeaAayyiMxklMyxiQidEYAS1FkB/9yO5v93UJZvV4zukMVwD/rUr4/2xTm
         9d9mmXhNlSzIzXwQ0DtN2C1s1QTcmuHFfZ3MUTfwOyzxU2QHBif1iPTSnD+CIw/H5vZn
         LuHNXGho4vssHjj5sldrkYQCuXr56rnGCuFWvyiTAlD+RRMtO7w4YZxCY+UukwKu65I/
         oOqhzKgHIcTbs+eUwiy2dwkbIztzLVoHpgXvPIJaP5JLfioA8GFsFE+/7D3RK6JTEhvd
         ZE6A==
X-Gm-Message-State: AOJu0Yw+DVAhviThKIVyD41kVtZoUaRln4Dneero7R3DKsdh7eXItnO3
	saKrtZEHZS2vRM7u2H7MgvROrDv4wTg7Y77+NC+Jxu7qLJ8ZVxQsdp4py7KZCJKVfkjS8ncT+N4
	+GC7c
X-Gm-Gg: AY/fxX4Sshvjcv34y58gJjSqE7WPELsaRV6NmXVauu3aocxPM4bVcHzlo2LT3lFwJAW
	2PpZHhZlL43U0AKSu2IE2joWq9ObO3SKQXgd3z1W9KYXnLXL9Az/CHmhMNpFqAz4qjnl87O6pSI
	d0B99Go5NrBK3JlwGD8YB8z8zpB//Cz5zVf/K9pKGaRx5Gsk/7sFujK6MzNMFzikC7Q6VZaUgBo
	KlOF+Azioz94h6QqbxRkslnRn3+1riFtdNqt99/aVxWEkelm7UM/TOi3yx2KJBzXhTOP5Nmb/IT
	ePo4irImIZ1TISNs8T5ESyMHMFQ/KnmxQ5dT7vcrDG2fwOHZKoD9gtJ6P0qy1k7XV1FhRhGiUX0
	dqEaZ/CWHK4hGK3wpxC/4vOLGPV/+8Bx3ZwMCCgaVBbxKmGagXgwxC+R4Qok/bu3d65tqX4CLMn
	2oG/WYxofPM7y+b6hHWJH7D9wLnvfzOKunpYsaNJq1B/enPo26cSRmnan51673OQ==
X-Google-Smtp-Source: AGHT+IEbflKNlKyo/6l8Gv/3P7NCIjBvrKq+UBG5fId11wBHJqrSBQTJC4+ks2VcgDEeYEnN86Yi2g==
X-Received: by 2002:a05:600c:8284:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-47a8f90e53cmr151427135e9.30.1765902758134;
        Tue, 16 Dec 2025 08:32:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/4] tools/tests: Sort Makefile
Date: Tue, 16 Dec 2025 16:32:29 +0000
Message-Id: <20251216163230.2768186-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and split the x86 group away from the common group.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/tests/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index ac5737364623..e566bd169952 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -3,17 +3,18 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
 SUBDIRS-y += domid
+SUBDIRS-y += paging-mempool
+SUBDIRS-y += pdx
+SUBDIRS-y += rangeset
 SUBDIRS-y += resource
+SUBDIRS-y += vpci
+SUBDIRS-y += xenstore
+
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += tsx
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
-SUBDIRS-y += xenstore
-SUBDIRS-y += pdx
-SUBDIRS-y += rangeset
-SUBDIRS-y += vpci
-SUBDIRS-y += paging-mempool
 
 .PHONY: all clean install distclean uninstall
 all clean distclean install uninstall: %: subdirs-%
-- 
2.39.5


