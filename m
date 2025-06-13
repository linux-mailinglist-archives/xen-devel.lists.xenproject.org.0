Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73CAD9217
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014704.1392850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6lr-0006Ln-F1; Fri, 13 Jun 2025 15:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014704.1392850; Fri, 13 Jun 2025 15:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6lr-0006IL-9j; Fri, 13 Jun 2025 15:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1014704;
 Fri, 13 Jun 2025 15:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6lp-0006Ge-Kq
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:56:45 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008a3eab-486f-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:56:43 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso4227443a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:56:43 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a93b03sm1357883a12.54.2025.06.13.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:56:42 -0700 (PDT)
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
X-Inumbo-ID: 008a3eab-486f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830203; x=1750435003; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBkHTslrkdQm/XhjgO6ug1lELXFf148eDSnYyMvV87A=;
        b=XvFGKq4hQFNfH2ERKQ/n6wKCv0tI23/f39vtPWWMEvFI1oouE9o1ANFSe2zTVusGv3
         eEtEKLaaRPVWxooHNECO8EORUlscIing/JDUso/WN0HR1z9yT/ycDCVeuuJZqbiqm0zq
         GUZn4VM1nFJLPpC3p5QvvLGnJrO/Hqm7k+ZEnrKU4pbR/Q/yxl+y1MtgrkhVQ4up+D6y
         oyL7JF/pMPw8Eeqk4jEhyU4hfo4J7NXZxvYSOu2ldMJL6cAevUYlhLhhAXKz1MzxRJ72
         oKnW70A0yXPUcr+1y68GQm60EsaohN6iRLbVNs8R5qlURigMep6usX6XSJpP7EzOfOdi
         rXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830203; x=1750435003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBkHTslrkdQm/XhjgO6ug1lELXFf148eDSnYyMvV87A=;
        b=M9+vEbldGzvXouvA35EWiUYULjipcZvdKtEe9yymJMPenJJqKULJ4Fh++1SCA1gH9x
         hhxDZK0ImdOLxB3tCmDrpdrxfWdHKebW4NtruR084044esh08E/z9xDO8esh9aWyWSxv
         ACpyL/uYuslDCn4/H9Z9QzAJyjENGRX+Gy6cIqunqsS95HkOh3exVyr4z26RJ74kvTd7
         K+Uj10pzKA9E/DHHNjF6jDoCjog9EMU1xomWV3TxzzB9LUiOgW11vw0Ak3icpXqegJtU
         MkY0nq4QQ9ThD1xI8p1e23ygJUMp40871ESh1sdXXeEKpxaF3gpqjyii90xnz2Ex47Nf
         QDXQ==
X-Gm-Message-State: AOJu0YxkbvvChJCsh9kZpj90TlCLbN2UgTfATU5opcGpT9bHO8deP7Jp
	nvElBEzuj5DL7GxVmijtR88cGfTKyn906SOX731X/g/fQedM8nKFPl7o65F5Xw==
X-Gm-Gg: ASbGncsgYsDNKysDJHLe4ACUtnfmuWGoqycafKbm8FlL/AQndEELK8p3LihRlmuUL19
	9kfRC8cT31qIFMcBOIQulPNgqf1gxs7Efwlg93ywjbIvMbDGxZf8kuos+aqFhqylR0V0f/ExwdF
	E6QrqoWE3QBpX0gnYd2HJ5ThgL1Fy02kfddVE62y3ixWBskN7tjdMOAktkOouiKVqTRwmOVaFrS
	KlSaUMehTLR8llL8e2LwEgGqSP6dp/H8CRcn0d1orPRI9dgC9s0JXLnz+g2bMxeFbXu4mlAfRwt
	emOzE8AJUr+Hoca19saWZMk2nf2AYBsZ8wDEik9x61MMJMVMyajDrsmOfzlMTE0csoo+2LKf8sy
	onI0Fwhpk52MrV60hVZ9hJ2OWIcZt
X-Google-Smtp-Source: AGHT+IFc/KLR1BzJIRacmaOsU4mrBKrO7Fs3Y8ikB2f0saA3ZsckBb22OGO4cGnpnPlrkqrMJxQHFw==
X-Received: by 2002:a05:6402:270d:b0:607:7aed:feef with SMTP id 4fb4d7f45d1cf-608b49fc0aamr3189540a12.34.1749830202560;
        Fri, 13 Jun 2025 08:56:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v1 2/2] xen/domain: introduce generic weak function for domain struct allocation
Date: Fri, 13 Jun 2025 17:56:36 +0200
Message-ID: <c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749829230.git.oleksii.kurochko@gmail.com>
References: <cover.1749829230.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

x86 has specific requirements about the allocation of the domain structure,
but that's not the case for ARM or likely other architectures.

Introduce a generic weak function that can be overwritten with an
architecture specific implementation if required.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes:
 - Add Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>.
 - Add empty line before last return in alloc_domain_struct().
---
 xen/arch/arm/domain.c  | 12 ------------
 xen/arch/ppc/stubs.c   |  5 -----
 xen/arch/riscv/stubs.c |  5 -----
 xen/common/domain.c    | 14 ++++++++++++++
 4 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddc..29588f869c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -479,18 +479,6 @@ void startup_cpu_idle_loop(void)
     reset_stack_and_jump(idle_loop);
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    struct domain *d;
-    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
-    d = alloc_xenheap_pages(0, 0);
-    if ( d == NULL )
-        return NULL;
-
-    clear_page(d);
-    return d;
-}
-
 void free_domain_struct(struct domain *d)
 {
     free_xenheap_page(d);
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 671e71aa0a..d999d22718 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -294,11 +294,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    BUG_ON("unimplemented");
-}
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index e396b67cd3..155e5a7f58 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -268,11 +268,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    BUG_ON("unimplemented");
-}
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     BUG_ON("unimplemented");
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e566a18747..c134868e95 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -785,6 +785,20 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
+struct domain *__weak alloc_domain_struct(void)
+{
+    struct domain *d = alloc_xenheap_pages(0, 0);
+
+    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
+
+    if ( !d )
+        return NULL;
+
+    clear_page(d);
+
+    return d;
+}
+
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags)
-- 
2.49.0


