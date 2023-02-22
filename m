Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8769F3D6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499403.770589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnj-0002L4-Hj; Wed, 22 Feb 2023 12:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499403.770589; Wed, 22 Feb 2023 12:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnj-0002GG-DJ; Wed, 22 Feb 2023 12:00:47 +0000
Received: by outflank-mailman (input) for mailman id 499403;
 Wed, 22 Feb 2023 12:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnng-0000FF-Mt
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:44 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8883b747-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:43 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id ec43so28829560edb.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:43 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:42 -0800 (PST)
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
X-Inumbo-ID: 8883b747-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKxkFC3sN6rYFx1RlFQZ9txKMSWy7NH5dDU5vh7uVoo=;
        b=J81GmpsXZP2HRFHWTgxdOsCjFZt6sh4CSK0sZBxmDwDPphpUwhC26DPxjU8/7GW0gr
         3XQ814zmWzwrG9g0L1qXQxaXccQAoDig8IFJUeojrZgG5RPbUvTMPnyCwNE8Crm6UYSY
         p+RariflHrAUBLtFNzk0ZEb/0lWJx4zSBGy/0wGqrGCC1BRJKEoWSTyoyRVaEtwy1+O5
         vDJij+1ELHohRVPFd0d89787ovEUPH5lct+h83C2F+t6LrAYTGuDGJkWm64iO1TpuK5r
         Xb1kMzbBARwWZTqbbOOFv9alFzexxtA0QSpB/jtCSewO2AfuwhGmOf7MkrzklSg0IPO3
         nTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKxkFC3sN6rYFx1RlFQZ9txKMSWy7NH5dDU5vh7uVoo=;
        b=OVRRpCgzZ/SGG+ay/wDhVEoZ67U8zeY0XkYtp6tv33nnlXl1xZjqj7+8r4fiEZwhoP
         M72JP3v+Pu824lUcd53BtbTgdE/CcbeTTYhuvYjGW3lZ8hwSxz098oLTusap2+H5BozC
         KJZQKCrJCsRQbfRguxdvS+XktAGezhe14niLZju4Q4GVDFc86kSj6Tb2muRua+FwxYHW
         3F/GLP6xAZ0/EqkqI4djgL9K3uGgKVqCCvhsXuUP/GYKMo6+v0fkl6BVHIEVDB+mi9u3
         8YV2bVetzh2QgLpfmcQrC43Xt4WA+MsaYSmNrl4tg8NuYOGio9ZIerNhZFInPLGSYo4m
         WMEg==
X-Gm-Message-State: AO0yUKWMK5R5lwI8bGVKK5psdCDxFb2NpkX20Ljfwf2rimRHp/qxNp4u
	U2ne3S5aELnazx87sE3SFjXs74qbyks=
X-Google-Smtp-Source: AK7set+YnkscDNljbkWncdvh7jiPZpconVrnLmKRsDczVFSkH1Me8CeCLNUYgI4azccPXUjZuLz3Dg==
X-Received: by 2002:a17:906:5651:b0:884:fd73:8053 with SMTP id v17-20020a170906565100b00884fd738053mr14837658ejr.9.1677067242727;
        Wed, 22 Feb 2023 04:00:42 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 7/9] x86/vmx: remove unused included headers from vmx.c
Date: Wed, 22 Feb 2023 14:00:21 +0200
Message-Id: <20230222120023.3004624-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  asm/hvm/vpic.h
  asm/hvm/vpt.h
  asm/io.h
  asm/mce.h
  asm/mem_sharing.h
  asm/regs.h
  public/arch-x86/cpuid.h
  public/hvm/save.h
because none of the declarations and macro definitions in them is used.
Sort the rest of the headers alphabetically.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  -add a blank line between different types of hesders

 xen/arch/x86/hvm/vmx/vmx.c | 56 +++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a19ece90fc..a6ec0a11fb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -15,52 +15,46 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/trace.h>
+#include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
 #include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <xen/hypercall.h>
-#include <xen/perfc.h>
-#include <asm/current.h>
-#include <asm/io.h>
-#include <asm/iocap.h>
-#include <asm/regs.h>
+#include <xen/trace.h>
+
+#include <asm/altp2m.h>
+#include <asm/apic.h>
 #include <asm/cpufeature.h>
-#include <asm/processor.h>
+#include <asm/current.h>
+#include <asm/gdbsx.h>
 #include <asm/debugreg.h>
-#include <asm/msr.h>
-#include <asm/p2m.h>
-#include <asm/mem_sharing.h>
+#include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/monitor.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/vmx/vmx.h>
+#include <asm/hvm/trace.h>
+#include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmcs.h>
-#include <public/sched.h>
-#include <public/hvm/ioreq.h>
+#include <asm/hvm/vmx/vmx.h>
+#include <asm/iocap.h>
 #include <asm/i387.h>
-#include <asm/hvm/vpic.h>
-#include <asm/hvm/vlapic.h>
-#include <asm/x86_emulate.h>
-#include <asm/hvm/vpt.h>
-#include <public/hvm/save.h>
-#include <asm/hvm/trace.h>
-#include <asm/hvm/monitor.h>
-#include <asm/xenoprof.h>
-#include <asm/gdbsx.h>
-#include <asm/apic.h>
-#include <asm/hvm/nestedhvm.h>
-#include <asm/altp2m.h>
-#include <asm/event.h>
-#include <asm/mce.h>
 #include <asm/monitor.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/prot-key.h>
-#include <public/arch-x86/cpuid.h>
+#include <asm/p2m.h>
+#include <asm/xenoprof.h>
+#include <asm/x86_emulate.h>
+
+#include <public/sched.h>
+#include <public/hvm/ioreq.h>
 
 #include "vmx.h"
 
-- 
2.37.2


