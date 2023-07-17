Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA92755CA7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564172.881446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXt-0005Ci-BQ; Mon, 17 Jul 2023 07:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564172.881446; Mon, 17 Jul 2023 07:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXt-0005AA-8a; Mon, 17 Jul 2023 07:21:25 +0000
Received: by outflank-mailman (input) for mailman id 564172;
 Mon, 17 Jul 2023 07:21:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXr-0005A3-0Q
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:23 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87e25e77-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:22 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so6584613e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:22 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:20 -0700 (PDT)
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
X-Inumbo-ID: 87e25e77-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578481; x=1692170481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RE6uG9NjzKwawEyJ2gsdMq0MHWGazWEuP8uHbPdmuU=;
        b=zWNOzeXta3SSh8fEY3svaVDiKh1QL/i98lXyuLzVAeqC98dgvekXp17KodV8L8Da+S
         q1SNlq2MlUZgD6uAav71n9zzRrJ285CmxpQ3LKfB9+ne6FnZWLLDIgugOPdkG7QaQKUw
         zxSKS0DNdXJWltjMxbnnnqmj9YrzUGsEXdGHEEC5B4V6X6tT3SxMckY+1EQzfKAqRhjV
         JTbatKQYo2nwq+ZSMcH8s5wdq1veUdownCcSH20KpQXT1DGhyL4bbIxT9pMsQK2jrsAQ
         0cMBniQW9WyNQNzJjZkZTr0NvZo/6wMfAjKhFq1+G2AawUZbabbh8JFUAZZAbPy4tDL/
         4YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578481; x=1692170481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RE6uG9NjzKwawEyJ2gsdMq0MHWGazWEuP8uHbPdmuU=;
        b=GDhKO5VUP06Uo3luVJ5hIKj3YD+6b1RUEgGmv7iF0mZHH4m2Rc3unOXw8R84ZCBXU0
         p1a/uYZKzGFKJ6BC8XFnJMZce55RvrM2+EGP9CKmsvlT44iduYeB9BJqhGZRJf2BBIC9
         Mjq1SKGToCB9VBlrK1xi++AznV8Qs/Gh5JtX0bvbURK/C1xPCSMMkcIFKBQEHs3j0PQQ
         8GzHXOD8zX8eU/44I3Q6SnqSaNCWKlRN/Ok8qxFAEJSJGJi8R7sHuoB4pcr+Ez7pXEm9
         69paC+HMXvB0RaD74Ru5uWXWhetYVvJgNz9iBnNYJhTeWRKVReyKhr2r1zbS+6RGUIDv
         FCBw==
X-Gm-Message-State: ABy/qLaANZnpkfAvT92tVh5apEihWXyDa+eb1ur9059PqHZlwiUY5T3p
	yMycVa+RS1QMsgxZUUUuCJ/YNxXETUNtygFvSas=
X-Google-Smtp-Source: APBJJlGeN3T6Hgojf0g7hw68B554gvcSk/HnHMYLTAMBsluJJgWJmx0JTC5gYyMwfff0qCOyOvzovg==
X-Received: by 2002:a05:6512:2392:b0:4f9:5718:70b3 with SMTP id c18-20020a056512239200b004f9571870b3mr8576528lfv.31.1689578481324;
        Mon, 17 Jul 2023 00:21:21 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [XEN PATCH v10 01/24] xen: Introduce arch_domain_teardown()
Date: Mon, 17 Jul 2023 09:20:44 +0200
Message-Id: <20230717072107.753304-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Plumb it into domain_teardown().  Provide arch_val in the teardown
continuation information for use by arch_domain_teardown().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>

v9 -> v10
- Added Jan's and Bertand's tags
---
 xen/arch/arm/domain.c    | 5 +++++
 xen/arch/x86/domain.c    | 5 +++++
 xen/common/domain.c      | 6 ++++++
 xen/include/xen/domain.h | 1 +
 xen/include/xen/sched.h  | 1 +
 5 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8c18e9207907..15d9709a97d2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -793,6 +793,11 @@ fail:
     return rc;
 }
 
+int arch_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     /* IOMMU page table is shared with P2M, always call
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 39c215316546..5f66c2ae33d7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -888,6 +888,11 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+int arch_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     if ( is_hvm_domain(d) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index caaa40263792..304aa04fa6cb 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -439,6 +439,7 @@ static int domain_teardown(struct domain *d)
             PROG_none,
             PROG_gnttab_mappings,
             PROG_vcpu_teardown,
+            PROG_arch_teardown,
             PROG_done,
         };
 
@@ -459,6 +460,11 @@ static int domain_teardown(struct domain *d)
                 return rc;
         }
 
+    PROGRESS(arch_teardown):
+        rc = arch_domain_teardown(d);
+        if ( rc )
+            return rc;
+
     PROGRESS(done):
         break;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1df8f933d076..d35af348410c 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -81,6 +81,7 @@ int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags);
 
+int arch_domain_teardown(struct domain *d);
 void arch_domain_destroy(struct domain *d);
 
 void arch_domain_shutdown(struct domain *d);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 85242a73d374..854f3e32c00e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -589,6 +589,7 @@ struct domain
      */
     struct {
         unsigned int val;
+        unsigned int arch_val;
         struct vcpu *vcpu;
     } teardown;
 
-- 
2.34.1


