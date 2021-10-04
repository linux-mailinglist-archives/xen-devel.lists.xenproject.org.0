Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C54421135
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201509.356062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOmH-0005be-2T; Mon, 04 Oct 2021 14:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201509.356062; Mon, 04 Oct 2021 14:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOmG-0005ZB-VX; Mon, 04 Oct 2021 14:17:12 +0000
Received: by outflank-mailman (input) for mailman id 201509;
 Mon, 04 Oct 2021 14:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOiP-0008QG-F1
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:13:13 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6cbbff4-ca33-483a-85a9-6b924cb03d70;
 Mon, 04 Oct 2021 14:12:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m3so71516962lfu.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:17 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:08 -0700 (PDT)
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
X-Inumbo-ID: e6cbbff4-ca33-483a-85a9-6b924cb03d70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mt9OWBAhbT//DIBCaDBPG1KX4to8WfBEU/gi6Ti13xs=;
        b=Zo/VaiBmlmMtZhzxzoT0AEknQqXI/pGqOzRD37w9kRaNWip0ilJ9I+DTC3inQe6gVQ
         ydV9F4HqQ30/x1fOg98A3JjKM2O7FrIkUAeD0wv5cZMB/ImlkT+BAuVcfbhCWxl2DFAY
         HxBGYFA2Qn7ny2406U5W8QCXYG/Shb4sBOY1NB/7pEYErmiOf8F63oJ2QdUJTGGcaDam
         tEEIvpAZrj3RSEnuuqJuiyECYW0wKCvtxOcFj8dt7vMkPGPWp4uI91oB3PDW0TwvkD8x
         fMcLaTDHUaFOT+zEjPEa4d9OZZ7HmD/VlTn4vRmYfwOqH2iA52GAsuRGi1iu/m182ufW
         EASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mt9OWBAhbT//DIBCaDBPG1KX4to8WfBEU/gi6Ti13xs=;
        b=PyLJwHno8xFfiRGzx+Z/ZDFc6oRzLDEdHMPuyl8ftnCMpLrELoQvuWIA0A+NWwb8gV
         1Y0etFCsTV1iGCcJpQ3UqveTpiCCNHtjoY3vM3Vri+GeAXdSinkwf/et/cM7v0hqLsym
         4QiDpBdPSt/M1nVMm6IBWZfJkCSTvDb5/+BDgu9jOGzXi/TzR0rvsNzweSCSsHbOIemB
         dpL/cIQZWV5AZEv8ORZxqqY3N2q+G+fadR3UYeOqZJnZqXExW0U6GBogVxknIEDF6RGB
         h5oLPhNSk3LzjdNM1W0L9OizOJgAPdlzeLN8RuNKeDE4h3qk/oNfRpcwDDvLMiL9R52h
         xOag==
X-Gm-Message-State: AOAM53095FaXYS/wQR5EUVDu5dSqB6jAbajQGQx36EaPNg5y50ZdAeVy
	F0lzb3SPjm92sSs56rQO6Si/IXOIBBrlOA==
X-Google-Smtp-Source: ABdhPJzVgJE4NpanPPuA1m9xh0vQ+K01UWveq9p7UsP19uF85d6cp+WkxfT9exshD+EyIpsPzcM74A==
X-Received: by 2002:ac2:5c51:: with SMTP id s17mr7230247lfp.32.1633356728996;
        Mon, 04 Oct 2021 07:12:08 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 11/11] xen/arm: Process pending vPCI map/unmap operations
Date: Mon,  4 Oct 2021 17:11:51 +0300
Message-Id: <20211004141151.132231-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI may map and unmap PCI device memory (BARs) being passed through which
may take a lot of time. For this those operations may be deferred to be
performed later, so that they can be safely preempted.

Currently this deferred processing is happening in common IOREQ code
which doesn't seem to be the right place for x86 and is even more
doubtful because IOREQ may not be enabled for Arm at all.
So, for Arm the pending vPCI work may have no chance to be executed
if the processing is left as is in the common IOREQ code only.
For that reason make vPCI processing happen in arch specific code.

Please be aware that there are a few outstanding TODOs affecting this
code path, see xen/drivers/vpci/header.c:map_range and
xen/drivers/vpci/header.c:vpci_process_pending.

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
[x86 changes]
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Since v2:
 - update commit message with more insight on x86, IOREQ and Arm
 - restored order of invocation for IOREQ and vPCI processing (Jan)
Since v1:
 - Moved the check for pending vpci work from the common IOREQ code
   to hvm_do_resume on x86
 - Re-worked the code for Arm to ensure we don't miss pending vPCI work
---
 xen/arch/arm/traps.c   | 13 +++++++++++++
 xen/arch/x86/hvm/hvm.c |  6 ++++++
 xen/common/ioreq.c     |  9 ---------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fbde..b246f51086e3 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/vpci.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -2304,6 +2305,18 @@ static bool check_for_vcpu_work(void)
     }
 #endif
 
+    if ( has_vpci(v->domain) )
+    {
+        bool pending;
+
+        local_irq_enable();
+        pending = vpci_process_pending(v);
+        local_irq_disable();
+
+        if ( pending )
+            return true;
+    }
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return false;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index aa418a3ca1b7..c491242e4b8b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
 
     pt_restore_timer(v);
 
+    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+    {
+        raise_softirq(SCHEDULE_SOFTIRQ);
+        return;
+    }
+
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index d732dc045df9..689d256544c8 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -25,9 +25,7 @@
 #include <xen/lib.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
-#include <xen/softirq.h>
 #include <xen/trace.h>
-#include <xen/vpci.h>
 
 #include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
@@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 
 bool vcpu_ioreq_handle_completion(struct vcpu *v)
 {
-    struct domain *d = v->domain;
     struct vcpu_io *vio = &v->io;
     struct ioreq_server *s;
     struct ioreq_vcpu *sv;
     enum vio_completion completion;
     bool res = true;
 
-    if ( has_vpci(d) && vpci_process_pending(v) )
-    {
-        raise_softirq(SCHEDULE_SOFTIRQ);
-        return false;
-    }
-
     while ( (sv = get_pending_vcpu(v, &s)) != NULL )
         if ( !wait_for_io(sv, get_ioreq(s, v)) )
             return false;
-- 
2.25.1


