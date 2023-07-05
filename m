Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C57480F7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558881.873364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyuu-0005jx-Pj; Wed, 05 Jul 2023 09:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558881.873364; Wed, 05 Jul 2023 09:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyuu-0005ed-M9; Wed, 05 Jul 2023 09:35:20 +0000
Received: by outflank-mailman (input) for mailman id 558881;
 Wed, 05 Jul 2023 09:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyut-0005bC-MD
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 406545c0-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:17 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so4765599e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:17 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:16 -0700 (PDT)
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
X-Inumbo-ID: 406545c0-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549716; x=1691141716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am4ipN3ru3xzSJvgYsCfVXNDufmrJ7j+gUVMYasa6R8=;
        b=YRRVF3KTUR2CfX8sPtJGO/1Jng4XNRK/IuXWR5mRgQEIlhCd8cqSgFMhzC/Yndbaqi
         jQQ1qOWBoOL9CdNIwvvesIQ/g4Gzn9BW3GiAQGINWc0nmYau2qH51TRxkRJOP9hDFk95
         JDQAX3XZ7mR81dRnlEXo0nPFWc+N8ASyz3MvXJNIc0t3A0v/77JFbmaHRuH8+zG90zV8
         TNdCkmpNNycLL422jOxbgFTGQLdlD4sq7aLzPrCEJay0ScS0BC8V1hPoDfxkQxFlM+rm
         6/O2BXb1U3lyXm+ZOd1HicIqgEel/nX5OkPQcTeXcUQodA2mZ7X/sxVdz4Yz3xz1a12m
         opeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549716; x=1691141716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am4ipN3ru3xzSJvgYsCfVXNDufmrJ7j+gUVMYasa6R8=;
        b=kWXTHK3YkqqON6c4nHlEwpyC3FTVQlzxmqz1uLeSib1YisPKvzRnFc1o+jO9v9MRjZ
         n1Kgzd2taZd2Zw72xiVOyZp36boCnFALSMPfE9ibSIIIV4z+e+j3xPJ1tiw5rnZqmO4Q
         +dDn5gqZ6Wj+fBZ/8L8kGTKQNqNSTuZM3oDyYpiAqoxo+7pOeO3ckh3KaWeMp1Tzp9Jm
         gzxG0HZdtVAOQ909qIAPtkj2P4S9n3rFApX5hvdJJk5JXXguiF177Vm8fLp+rK40yQ/o
         sO8wnTOoOfeNsejm+IHp9CQjuez84mC6pjtCai8TxxqdzQ7Sc1ci7G741ygTzmjD8hem
         /eYQ==
X-Gm-Message-State: ABy/qLYd/DjYMpvXZU+dvHl82fMrj9eZ7Cwfzjm0PvFxNFZZryAWG6C+
	42yDLyvFJcfd2Wo/P7NwWeFTzTI+iBGDmkaO7cg=
X-Google-Smtp-Source: APBJJlFmHssN6U2jD6Aj2M55oV1Ks3I50SPjEcyFBfIaeIPGLY9rjYKrdzZePpVHlgKBka1r4/s5Ww==
X-Received: by 2002:a2e:8182:0:b0:2b6:cfec:69f7 with SMTP id e2-20020a2e8182000000b002b6cfec69f7mr10183434ljg.1.1688549716784;
        Wed, 05 Jul 2023 02:35:16 -0700 (PDT)
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
	Jan Beulich <JBeulich@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [XEN PATCH v9 01/24] xen: Introduce arch_domain_teardown()
Date: Wed,  5 Jul 2023 11:34:10 +0200
Message-Id: <20230705093433.2514898-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Plumb it into domain_teardown().  Provide arch_val in the teardown
continuation information for use by arch_domain_teardown().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>
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


