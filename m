Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F018582EEA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 19:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376389.609127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkgX-00068F-25; Wed, 27 Jul 2022 17:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376389.609127; Wed, 27 Jul 2022 17:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkgW-00065h-VS; Wed, 27 Jul 2022 17:19:00 +0000
Received: by outflank-mailman (input) for mailman id 376389;
 Wed, 27 Jul 2022 17:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGkgV-000656-Vo
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 17:18:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3389cc29-0dd0-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 19:18:58 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id e15so22338044edj.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 10:18:58 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 k14-20020a170906578e00b0072f03d10fa0sm7826551ejq.207.2022.07.27.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 10:18:57 -0700 (PDT)
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
X-Inumbo-ID: 3389cc29-0dd0-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xnvVfEqmjRjBCDFSJi6lf9ny0uz/eCXL5W95bOdHMNI=;
        b=DGsBaG4xMJe+ddRa1N2bJw9VnBLwbm/L9aGKv0ks+WcxlHdTCuF2qgq69KGHAQMYC9
         5iePU7cOcNmGGN75wtNrHN3QIJfUdEqyKrR++ZCAwr6M4566tD2q0cTPoVUuVxMjmOAa
         CaDtuDLr83G/S6YgM56QKyJnIjRhIF0zb2favD8IwPR8ZiUwYGMpM2uZxxUw9nG8pvJ5
         9UjIAMHhDKb5R+3etzRj/Bur5qrNb5pTTDz4FGx0WD6hF7RSu211pWdeTt2ZXetU3aAu
         UoTmjEKfN8yqODI/HYFV/Giwom7Wlw+gIV0BzrmH2X2L7RI45Evu70Im9OMPbo+ccwpP
         edag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xnvVfEqmjRjBCDFSJi6lf9ny0uz/eCXL5W95bOdHMNI=;
        b=IF6X19KZHa05zDWFv4tqgQrdqR1gJK8xfPK0+ok5rWV67ppK5QAcd5ubYpxumr1q7U
         btpyysUAHWNreZ4CXENoQOy7f+c3tA0hhi5f0YcxwxXqn+8Qo0m13VbvHXUJUfN183vo
         wpZRBd2XOoxZYLBGUX+MJDYu0OcNO4WutQz8Wo4zaBJC+eeBErjOPB2uJJWt/Hl3clzN
         NUQPul+aaxbjvWcT8fkqevn6hJTqab8Icd/eD8aPt4s2MAKf1pS1UshRPWYxNF+DdJgC
         rMtZ1HOtMccJ2zlD+QVii0+VDaUJykyNUMDXTKCKuEKUIZx9Jk7N60WqDwkAghaCVK6f
         Slbg==
X-Gm-Message-State: AJIora+AoQyf34BryGx+qaljOump6kqRqT0Nxr7FFi6/I6fQX3whnUpx
	gv3GURAT0tWJNqPXhydVaDKS6qkt1yE=
X-Google-Smtp-Source: AGRyM1vn7nqAOUUi+fkgDrp93OtyZL9CGKqBf/LuYHdTgy7AMla4pcV2+H7eEJwimLaA5SK6GajvQA==
X-Received: by 2002:a05:6402:4390:b0:43b:e9d9:f9e4 with SMTP id o16-20020a056402439000b0043be9d9f9e4mr18768578edc.361.1658942337935;
        Wed, 27 Jul 2022 10:18:57 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/1] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7 violation
Date: Wed, 27 Jul 2022 20:18:41 +0300
Message-Id: <20220727171841.1163075-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727171841.1163075-1-burzalodowa@gmail.com>
References: <20220727171841.1163075-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro parameter 'p' is used as an expression and needs to be enclosed in
parentheses.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- remove parentheses in the cases that p is not used as an expression that is
  when it is used as a function argument

 xen/arch/arm/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index ac2798d095..1f60c28b1b 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -123,15 +123,15 @@ static always_inline void write_atomic_size(volatile void *p,
 }
 
 #define read_atomic(p) ({                                               \
-    union { typeof(*p) val; char c[0]; } x_;                            \
-    read_atomic_size(p, x_.c, sizeof(*p));                              \
+    union { typeof(*(p)) val; char c[0]; } x_;                          \
+    read_atomic_size(p, x_.c, sizeof(*(p)));                            \
     x_.val;                                                             \
 })
 
 #define write_atomic(p, x)                                              \
     do {                                                                \
-        typeof(*p) x_ = (x);                                            \
-        write_atomic_size(p, &x_, sizeof(*p));                          \
+        typeof(*(p)) x_ = (x);                                          \
+        write_atomic_size(p, &x_, sizeof(*(p)));                        \
     } while ( false )
 
 #define add_sized(p, x) ({                                              \
-- 
2.34.1


