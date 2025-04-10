Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F8A84206
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945328.1343554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNE-0004Bd-US; Thu, 10 Apr 2025 11:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945328.1343554; Thu, 10 Apr 2025 11:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNE-0004A9-Oo; Thu, 10 Apr 2025 11:47:12 +0000
Received: by outflank-mailman (input) for mailman id 945328;
 Thu, 10 Apr 2025 11:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qNC-0003hP-Sk
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 880e98f1-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:08 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so461252f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:07 -0700 (PDT)
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
X-Inumbo-ID: 880e98f1-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285627; x=1744890427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4Z3kIHuhnklBdlhCOBG5oTaOo1JbFmkMLZhiqPUPak=;
        b=eFp45YLJ/uq++N4gZbCnq1JVSlI3G5/GTtqKYu5NpKeL1duAH4/FBUnWHBHWFXu+Fv
         RyOTmUnsWXUVdlhpRNg05a3mTEis0JaxVJcO4kx24wbPxHADNK38ZoDdjysaNcEfFIcb
         3GQQhozMiybmz1ZGnqddkElFzsChjfRNfDRz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285627; x=1744890427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4Z3kIHuhnklBdlhCOBG5oTaOo1JbFmkMLZhiqPUPak=;
        b=hJ3sDQO7CFsh0EsXnmGQVTDohC6IsSpcxo9i4nnPne+UFg1hWhxcCSzY8liVKYJbcR
         9ze0UhMf+MzL484hYfZXOeQoY69Mu4LlpOMtOJC/CVEGIO+B02mJyxDLI6GAcDHlRbDd
         P2wlCy14Kth2o92zHm7Uwl7SZ9YibBJ5+H2BtEt0oAcVRtXF+V5qAzRsDzsUVbC5B0oW
         h8+h006+u9FFaBenAG8ctH7BwjopkTRH7T3mRs3zYA8PhyzaJZKbq5qegT6Ia7WzwPeC
         uZQYQjMnhiocVN9qYxasTH/nmsZsHUGQR/5jvjlOWQpNPDch1Cg0jjbFD7tBqd8YpFmi
         iqBA==
X-Gm-Message-State: AOJu0Yz4303vNElnUQC0hOkv+imFYEqJO3yyiAwi+ewCvsrb0IrESdP1
	B++tlAVUUcQiZ/yiSyP60GU7f0hbaZeCgfjOZuTH8mLBUMTB5gMnSk4q2ht3igcnnQt6mTcl00a
	QPjE=
X-Gm-Gg: ASbGnct9m6m304Z4p96BildYB/2VYOsOjtP+zNAvr17WW0H2zE/TIiigdzFy+bLNnXs
	XIH1vlewdIWBRd3ersyr6PUaZcwh1RSYFsdwXScM7C7177pC25HZuCfdP0EDBtRv8v5+b9OBYOL
	y/zluD91aeZjhgm5HXPe4Rmrem54KPvMX0o3hJEkND72tCCtxtfHN7y/Vtdjol+qo32KnGm8Mt4
	o3Hs7E53LlODixsOT9XZgBKKAbN1wHwJJUdV4/erqYhh79pPRE91sUo9mn6u+bihlLzyOC1PdD7
	qxzFHoPKEeYeaCH3qZ9NGFyUqyGNv3BlNc6Lb5M0N/jS3lbcZAn6HojIDsp4FhUZNE/z1ylepDW
	LpmtVWmFAx118lQ==
X-Google-Smtp-Source: AGHT+IFo0dsiWLK8PK4pbqdkf6C7kBzISX9YV7JBCkAkIEdHG7SOFQo4Cdh311PwZPkDMbyUO0B9MQ==
X-Received: by 2002:a05:6000:40c9:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39d8f4d3a7cmr2053029f8f.46.1744285627573;
        Thu, 10 Apr 2025 04:47:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/6] Adjust Linux build script to work with other major versions
Date: Thu, 10 Apr 2025 12:46:25 +0100
Message-Id: <20250410114628.2060072-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simply the tar expression, as 'tar xf' can figure out the compression
automatically.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

v2:
 * Use 'tar xf'
---
 scripts/x86_64-kernel-linux.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux.sh
index 2a816f0b3204..5ed5608628bc 100755
--- a/scripts/x86_64-kernel-linux.sh
+++ b/scripts/x86_64-kernel-linux.sh
@@ -11,9 +11,10 @@ WORKDIR="${PWD}"
 COPYDIR="${WORKDIR}/binaries/"
 
 # Build Linux
+MAJOR=${LINUX_VERSION%%.*}
 curl -fsSLO \
-    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
-tar xJf linux-"${LINUX_VERSION}".tar.xz
+    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
+tar xf linux-"${LINUX_VERSION}".tar.xz
 cd linux-"${LINUX_VERSION}"
 make ARCH=x86 defconfig
 make ARCH=x86 xen.config
-- 
2.39.5


