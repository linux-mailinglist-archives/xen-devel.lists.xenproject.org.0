Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DFAC9084
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001150.1381398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05Q-00052v-9p; Fri, 30 May 2025 13:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001150.1381398; Fri, 30 May 2025 13:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05Q-0004zU-5N; Fri, 30 May 2025 13:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1001150;
 Fri, 30 May 2025 13:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05O-0003es-N2
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:50 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf3b013-3d5c-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:47:49 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54d6f933152so3098325e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:49 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a1289sm709009e87.91.2025.05.30.06.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:47 -0700 (PDT)
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
X-Inumbo-ID: acf3b013-3d5c-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612868; x=1749217668; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=HDii7KYGqw9Rc5nHuCNKq4JkNVz+3iaq67aZDddv6lYIdQwPGMamQsynMKo/N1RH6K
         wlc9ppawY1PETmWXG90VgkKkVaDLxu4/SxyTzzzlS8XeeuBHAThAuT9oml53+dCYBCRH
         yFLI8MiIY0VLaR0XD0v10BnU91nNZthvKyMJxbARiMonPputxP1x0IKDfa2jJawXt+9E
         joYslhLwkukLA18HbFDs1KMh+gE/A3RP0rjv24cp8zV4OnY8GtO+Fo8m/MGV0LHEp904
         d+JvuIr2KJNYNqBOetbJp2hrwueJPZO5OgJr4kASLv36nPB8VdXCIt+ApJNVF9MO70N0
         4gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612868; x=1749217668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=kytHy8OET73HtvLcD9QSrXf5UpNZojDkhvhfwMLsp5UcbXppZdGA0YIS+26gc+tbn+
         eklOhRb+ABRcSQ1FLaC5BA+5HSN6tPjhfKqzByLn+O9kdLSjQThw3EMe4iHaxS4mF/B3
         ac8ZJ7LJuw2FOpK3zy8tZOvk3e43otx1BMHZoQBKkHm0pcY6+QdMJYUhfiylDVBPalyb
         4ofoVagQeMs/GwwyRW90sZSFHqBqAUnxgnPc89SYEMmbbMs1M+1DI8mIUuBTeNYxZqjD
         m8g6UpxRHtDmVUzL0S1w9VKGwgln5NLT0hDT2za5YNragu3Wb7alZudvdfU7eG+MP0rh
         p3nA==
X-Gm-Message-State: AOJu0YwKJcUcLK+YKnVR8xRac2SLJ4zwL7dFBW3HiymcOqB6kVDjsBWF
	So5DBXlqwnnYX2Ehgr01UVEl32A0KxWk6JFg9LTysicWYenyVHrLMqrNqkz4q4iSf4Y=
X-Gm-Gg: ASbGncuEQ4uk7WWxkLwIMYciKKV6QlCeRY0YANaCY4exJIZvIsG1We/3oB0KDKH0USD
	tEO2UM1kwTh9Km0rKmiCrmRXHzZIYvFWOHowm6utMUFPpW+LuYLvHf2cCw4cPB24eON+HGb6ut9
	St7Jldartp74/Z2FPhrzDG5JKpDZDE301BYRmpCEyjIhQA7vO0koPyDLxspsTmM9Aq+bflEn35O
	zjJaKB8/2MA/0dVPi8pGzJJlAGDA7L4sJFnBVRb6VjH18y8uGbSFD9N9Qd2qDO6j31kHCF6Wl3y
	K9HrABd52upzY/ql17oCVjV2ZtNaiWWDgqzwxbDwA7p8OhCUs8FPggSVErMyOMDe7gC/vfJy3Vw
	U6aL2g5KrQntY1AszVwO6dAc=
X-Google-Smtp-Source: AGHT+IGVA5bzYPh2ADeFZH8z6EWHptuztxYvga4b8OcKYgpiNbmuvFvfvnJ6lIkQYGjdJf5MOmgj6Q==
X-Received: by 2002:a05:6512:3d88:b0:553:202e:a41c with SMTP id 2adb3069b0e04-5533d1aba19mr871799e87.28.1748612868136;
        Fri, 30 May 2025 06:47:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 5/5] tools/golang: Regenerate bindings for trap_unmapped_accesses
Date: Fri, 30 May 2025 15:45:59 +0200
Message-ID: <20250530134559.1434255-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/golang/xenlight/helpers.gen.go | 6 ++++++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 90846ea8e8..191be87297 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1170,6 +1170,9 @@ x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
+}
+if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
+return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 
  return nil}
@@ -1695,6 +1698,9 @@ xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
+}
+if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
+return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 
  return nil
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e7667f1ce3..656933c6c9 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -606,6 +606,7 @@ MsrRelaxed Defbool
 Altp2M Altp2MMode
 VmtraceBufKb int
 Vpmu Defbool
+TrapUnmappedAccesses Defbool
 }
 
 type DomainBuildInfoTypeUnion interface {
-- 
2.43.0


