Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC2B53EFF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120996.1465583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007GW-29; Thu, 11 Sep 2025 23:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120996.1465583; Thu, 11 Sep 2025 23:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSn-0007F1-V6; Thu, 11 Sep 2025 23:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1120996;
 Thu, 11 Sep 2025 23:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSm-00070m-2u
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65b8f9e-8f64-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 01:12:23 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45df656889cso8263005e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:23 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:22 -0700 (PDT)
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
X-Inumbo-ID: c65b8f9e-8f64-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632343; x=1758237143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOUALOCpdFsqmHA3SRQn/svniHSJ57I695EoNza7NlM=;
        b=MUI6PdIuZSQwZZMRWrZwrstYq0fVYL1+zd8vsYGrglwvQY2jUHzusSIY7htb3gPmJW
         4OcFAC5RGYtQwdu/MemjiprY3pBbHgBCdFFrrGniE1hLX6eOrFS9fCHIH/x5mUf9DFIg
         RrSW5OVdUE9PJTd2T/lc30UUsuFeAdCvcfdRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632343; x=1758237143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOUALOCpdFsqmHA3SRQn/svniHSJ57I695EoNza7NlM=;
        b=iNMS+BqYluYAWY0dNeXNn6YliuhHZ5eRxA7JOe3DZDhk5jiVdgPz7dHAD9QgJD8rOX
         DHAH+0H45raOJyn0hxNEhWLCEougxBrfUcm+8SHLphMXhBLjRVOruadDa0MkZZGxuuZn
         YT017Oei1o3ycrORaFDYhyeg8VgPiqUr04NzV81RG/JXeh61b/wGb7avtZExnF189KoM
         GkhFB0cjCddR5ItEQyXPSy6EMVHlSwLun1NTJyM7zQdyeUrfyjIhLKqS3d9+1igV2hzc
         HL9xULRqPFxNIuFBuKPUv/4eVe+Qi3cMkhX76ay6ons0dRd9jROOxrZmSI+3vgmNzcuY
         baYA==
X-Gm-Message-State: AOJu0Yxf9gw6pCEaIYRucH/zkAtv+q1J2TEvfjpcxEW6WS+Ti3ZKckGw
	mDpU3CuoM2SUYFFtMH38aLMru+qNO1E0HsHukoUwlQT2X4z7wG35xl1AUFC1V7ML/USH9RJV74i
	C9nld
X-Gm-Gg: ASbGncs2+2LwIHVNNCyAsKxayCjK3k+um/kdyrwXgTEOex7lTLiYLSWkcnz9NgpMbWn
	iby6oYR2OeMz8xhDHU3S0yBPMx2Q9J8Ve+bk/PTwx8kELxuQUFluRGz9+x8wjr1YkqqBRf7o0sN
	4ZBJUvWCDUAEs6P4wuutFwTIv8wh438ZWMI25joC8OXRVv0tj+SisYDActerfgTTb3fbzo+m5eW
	SpSuhqPUobf7CQGXCq6ecRSJwqhWq0o+1Ft0mM6yfTQ4Nc+xZpwzEa3p/YA0vT2Gz/A/akqoOA/
	ry2qf/Y/o4efzCdnccgUwvnyPSB7SQs7+Fp+2AbIMxf25LRtv/n6Nx9S5Q1IbIfwSW3vTe9ESlg
	Ww3cCkcpEfUa+7GVcS4kTO3F0qdv4pVaXhi0D2e4GoG7yKVXsRGU1C/9IgL4NpjR0cKHNmWfaKz
	LiTCTV0P2BOrQ=
X-Google-Smtp-Source: AGHT+IFii9WBqjjp8HnC++x+cmQBqZl+SrBHhgF01zlr0HQzxmRj6ziAFyPoy1JLsfQ0HAaZLrJHgw==
X-Received: by 2002:a05:6000:2008:b0:3e1:2d70:674e with SMTP id ffacd0b85a97d-3e7659f3c6cmr624555f8f.47.1757632342864;
        Thu, 11 Sep 2025 16:12:22 -0700 (PDT)
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
Subject: [PATCH v3 3/5] CI: Merge categories in debian/12-x86_64.dockerfile
Date: Fri, 12 Sep 2025 00:12:14 +0100
Message-Id: <20250911231216.1886818-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpio needs to be in Tools (general) now that it's used by the general build
script.  Merge the rest of the test phase jobs into one group, to avoid being
overly fine-grain.

No functional change.

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

Prep for making a Debian Trixie derivative.

v3:
 * New
---
 automation/build/debian/12-x86_64.dockerfile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index 3cf99c730b61..4e533ee879fd 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -23,6 +23,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         pkg-config
         wget
@@ -52,19 +53,14 @@ RUN <<EOF
         ocaml-nox
         ocaml-findlib
 
-        # for test phase, qemu-smoke-* jobs
+        # for test phase, qemu-* jobs
+        busybox-static
         expect
+        ovmf
         qemu-system-x86
 
         # for build-each-commit-gcc
         ccache
-
-        # for qemu-alpine-x86_64-gcc
-        busybox-static
-        cpio
-
-        # For *-efi jobs
-        ovmf
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
-- 
2.39.5


