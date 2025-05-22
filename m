Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A671AC1232
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 19:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994480.1377461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qa-0003fm-5f; Thu, 22 May 2025 17:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994480.1377461; Thu, 22 May 2025 17:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qa-0003bB-1z; Thu, 22 May 2025 17:36:48 +0000
Received: by outflank-mailman (input) for mailman id 994480;
 Thu, 22 May 2025 17:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI9qY-0003Za-Km
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 17:36:46 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54a20982-3733-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 19:36:45 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-601aa0cb92eso7322829a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:36:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm1116063366b.103.2025.05.22.10.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 10:36:43 -0700 (PDT)
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
X-Inumbo-ID: 54a20982-3733-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747935404; x=1748540204; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTQLVGcychOhPHjn+s3ORj8cl5Yx5oWPYxlLPQZX4qE=;
        b=a63EIgYNicZo4Xeey+MhEaGzhbKmCrmU7QZUjp0KZqbVL0TrLSo9zoejsMQjpqh8r5
         QR4Cxb7jGH4YiirEqWWeONUYCH8O+3I952YEfuw0zJh2CXtjL/A5mMoyvMqm3tHnaWTJ
         TNF4+KjLAStzOcGwEnHHBhH4EiEvQRzvNvf/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935404; x=1748540204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTQLVGcychOhPHjn+s3ORj8cl5Yx5oWPYxlLPQZX4qE=;
        b=b5wtsZ9ZGZ9N6073C7fk3twkucO+5hha/0hWjMNtSduv0QfefpacuZSrJmsv4/ELTb
         DAwF+5YB048O6YxCMnO/i55RYOConmOBolAuVOOdFwwDMvTQGvLW6emZpLbNjDdqJJkI
         AnM3LLnmS6E7ZyLAzb2b/mly0K5CoJpar0s0So3V9rvbUaEUlVYifMS+Z34d/fIXLjmZ
         BRKMQcV62zgxVMXuD3WDlB9TYjuVqKFc2R3+sbelDgyB0Ktta5gRZpNpMvh+dFrFe87W
         5xACaCIKPzAw+vn+T4D+HruizMRWZqsRXSuD+sbHEGQkKOznALQ2Bh9g0C5c9B7IOyqO
         GocA==
X-Gm-Message-State: AOJu0Yz8a7IzUv55aPGfngxnE/wB86rNioXi+O1slJ1KwceJkA7i8rZO
	XfSMxzJCHfdLg82WFjFbRS1wELrOw/lyZOnIQB9Hl654ttTkwybgz963TMpKM90q5ZsXL8ABVQr
	4Clkh
X-Gm-Gg: ASbGncvjOjAQesvxpZSCC5owtVS1o3AGXxPSvYQXy6Yf4Uy37OKuuZjVFKJFpzP3Xek
	S8FTPT33SDC68j0Pf2QpFkGEpeTffSZWTwR1m2tgXEOLKcRNimvsFiboCVtBK3EI36Htm4DeY46
	9PkTMhQpfzQj/jae4ZjSLX/3/j+e0q76zjMWOZI9Pz9jDXlnMckamhOPBUUsSE3u6SXm4CvaItz
	pNhvMGWbjirA7koedcKN69vrDysKNlIO8+UbmtJcgMCNqG3n9wXnP9v0e8yzrDlprPiN7SBA9KT
	npDDC6hie3ckLZqG+RWtUmrQrYPK5dQndoHgqh5Ju5yzSgmEyYdNg38qWKr/5utbgzj8VeYEyyT
	cdh6GF52nNM3H8gx1RK0rSDlb
X-Google-Smtp-Source: AGHT+IG6wD0gHXecI2/fRDvo/BDNeQHU4TT47xd98TYkH6tVgsPoTHFYWe7u6nAGRyWoez+AnoAwGQ==
X-Received: by 2002:a17:906:c408:b0:ad5:4919:6317 with SMTP id a640c23a62f3a-ad549196826mr1543346166b.49.1747935404325;
        Thu, 22 May 2025 10:36:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/3] CI/qubes: Deduplicate the handling of ${dom0_check}
Date: Thu, 22 May 2025 18:36:38 +0100
Message-Id: <20250522173640.575452-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522173640.575452-1-andrew.cooper3@citrix.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it clear that ${dom0_check} is unconditional.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index bfdd2ceb99ba..10af274a0ba7 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -221,12 +221,11 @@ if [ -n "$domU_check" ]; then
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
 xl -vvv create /etc/xen/domU.cfg
-${dom0_check}
 " >> etc/local.d/xen.start
-else
-    echo "${dom0_check}" >> etc/local.d/xen.start
 fi
 
+echo "${dom0_check}" >> etc/local.d/xen.start
+
 chmod +x etc/local.d/xen.start
 mkdir -p etc/xen
 echo "$domU_config" > etc/xen/domU.cfg
-- 
2.39.5


