Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525393D56E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 16:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765445.1176031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMLa-0006MS-J7; Fri, 26 Jul 2024 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765445.1176031; Fri, 26 Jul 2024 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMLa-0006JY-EJ; Fri, 26 Jul 2024 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 765445;
 Fri, 26 Jul 2024 14:55:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXMLY-0006JS-JM
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 14:55:04 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 095b7ec7-4b5f-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 16:55:02 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso2877584a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 07:55:02 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41462sm180156266b.119.2024.07.26.07.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 07:55:01 -0700 (PDT)
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
X-Inumbo-ID: 095b7ec7-4b5f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722005701; x=1722610501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U04aEBUi0SKv54sVsrAk71ymAOHw5qjFievhU+jTj60=;
        b=R27vc1lfdG2rPhyOfcdOtistsOsMyUcoSHmUSOywc4AUFW32jY7MC5FDhQUXXKmOt3
         ZglxESbZdQX/ws6TPGy7dRyht1E6Vhq27wZ2Tt1QmKvBpqxn+QjfYRqgg1Mu76gSKbL9
         ETcpvhVKVv974dyRQydoNgOe5NATfr4k+1Klo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722005701; x=1722610501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U04aEBUi0SKv54sVsrAk71ymAOHw5qjFievhU+jTj60=;
        b=EejZvdHHLafcPec69gyOf9fZlr2jX0HAueFeJc/j6+sbz6nKFtQWYo8uH9VNk3RTeW
         5Kf+Aut3dThtjRrGc+IZGfeJEC++Lu4Aou7Y8XEcNmr8mpUZAYcL6bevQVnjxiymhoo5
         pd2RX5kjHlZjc7KaNhh4GNHRq71hcA477aLF693EwwuQskegRqbehaGGvj0a3ffrJ98X
         fEu2sSSUyz2+vtBZcUgEj679R1N8mOM2w5ECqgEFT10ZbbMS5MAYZayMviYWW3eh9rBM
         YxVCIYktvhUPPVCY5+KqIHX8IsfSrQBABUKRQhAb+zHhNdTz2e9tjiYuAlvlKJYRRvpY
         Fz1A==
X-Gm-Message-State: AOJu0YzkaskrM1BpbZNJoGESeW4CKRwejdJD8jXolW0jgGXMr1x+gKNI
	myC6foxu3Q+Xhn7bNOjB4vA89QJunrnfMW3CxZQVJFI1jEySFfD+dX4fAz4wu97V956qYTve8Bi
	Q1oM=
X-Google-Smtp-Source: AGHT+IGBbauuT5eMx63qcvKu3h7pvqL2FktMuh7xTChhQ4XelaAUap2b3ZJMn1MhJSHCDPCztpQWfQ==
X-Received: by 2002:a17:906:3bd1:b0:a77:c080:11fa with SMTP id a640c23a62f3a-a7ac5064904mr410935566b.48.1722005701449;
        Fri, 26 Jul 2024 07:55:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/viridian: Clarify some viridian logging strings
Date: Fri, 26 Jul 2024 15:52:00 +0100
Message-ID: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's sadically misleading to show an error without letters and expect
the dmesg reader to understand it's in hex. The patch adds a 0x prefix
to all hex numbers that don't already have it.

On the one instance in which a boolean is printed as an integer, print
it as a decimal integer instead so it's 0/1 in the common case and not
misleading if it's ever not just that due to a bug.

While at it, rename VIRIDIAN CRASH to VIRIDIAN GUEST_CRASH. Every member
of a support team that looks at the message systematically believes
"viridian" crashed, which is absolutely not what goes on. It's the guest
asking the hypervisor for a sudden shutdown because it crashed, and
stating why.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Still going through its Gitlab pipeline

---
 xen/arch/x86/hvm/viridian/synic.c    | 2 +-
 xen/arch/x86/hvm/viridian/viridian.c | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 3375e55e95ca..c3dc573b003d 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -172,7 +172,7 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         vector = new.vector;
         vv->vector_to_sintx[vector] = sintx;
 
-        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, sintx,
+        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %#x\n", v, sintx,
                vector);
 
         *vs = new;
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 0496c52ed5a2..21480d9ee700 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -253,7 +253,7 @@ static void dump_guest_os_id(const struct domain *d)
     goi = &d->arch.hvm.viridian->guest_os_id;
 
     printk(XENLOG_G_INFO
-           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %x os: %x major: %x minor: %x sp: %x build: %x\n",
+           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %#x os: %#x major: %#x minor: %#x sp: %#x build: %#x\n",
            d->domain_id, goi->vendor, goi->os, goi->major, goi->minor,
            goi->service_pack, goi->build_number);
 }
@@ -264,7 +264,7 @@ static void dump_hypercall(const struct domain *d)
 
     hg = &d->arch.hvm.viridian->hypercall_gpa;
 
-    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %x pfn: %lx\n",
+    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %u pfn: %#lx\n",
            d->domain_id,
            hg->enabled, (unsigned long)hg->pfn);
 }
@@ -372,7 +372,8 @@ int guest_wrmsr_viridian(struct vcpu *v, uint32_t idx, uint64_t val)
         d->shutdown_code = SHUTDOWN_crash;
         spin_unlock(&d->shutdown_lock);
 
-        gprintk(XENLOG_WARNING, "VIRIDIAN CRASH: %lx %lx %lx %lx %lx\n",
+        gprintk(XENLOG_WARNING,
+                "VIRIDIAN GUEST_CRASH: %#lx %#lx %#lx %#lx %#lx\n",
                 vv->crash_param[0], vv->crash_param[1], vv->crash_param[2],
                 vv->crash_param[3], vv->crash_param[4]);
         break;
@@ -1056,7 +1057,7 @@ void viridian_dump_guest_page(const struct vcpu *v, const char *name,
     if ( !vp->msr.enabled )
         return;
 
-    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %lx\n",
+    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %#lx\n",
            v, name, (unsigned long)vp->msr.pfn);
 }
 
-- 
2.45.2


