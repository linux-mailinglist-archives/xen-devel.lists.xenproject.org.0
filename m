Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA326A21E6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501504.773282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdIC-0001fw-DV; Fri, 24 Feb 2023 18:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501504.773282; Fri, 24 Feb 2023 18:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdIC-0001do-Am; Fri, 24 Feb 2023 18:59:40 +0000
Received: by outflank-mailman (input) for mailman id 501504;
 Fri, 24 Feb 2023 18:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9O-0001Wv-Sn
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e68e05c-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:33 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id ec43so997289edb.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:33 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:33 -0800 (PST)
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
X-Inumbo-ID: 1e68e05c-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=528hQ/puYwtMp7ly/Urv37WROfXxwGzhdab+4MGW6p4=;
        b=GqnIbgqjaApSOWWbCN7NXw6lsDgDIHTa/wlKQFJSpx/YudssltgsBQXGtlHhx0ZOyv
         D17vsOg7oRMOUE/fGafJ4i9P6z7phv/zSJryNyr4RZuBL+Dolq05a+bms716ktN/9/La
         GN9RHYA3PzUQLUQs22WDBqA9uDHkN9EFcjMQUxvNpcocS9cjR5WgxoEXgEn2Vm70MIRh
         etuPBC/YlQntawSjVEiixWJR1yhwwHpZcYvr/MVHhe2NCqATLirGGNODqDSH3TIM3BEJ
         zRz1oRYPkx1g/kZ2EbW1k/Bv0cPFWOIN4+26BAlqZ7LVLUsjydpA7hnx5jF4gOg2Il/z
         N38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=528hQ/puYwtMp7ly/Urv37WROfXxwGzhdab+4MGW6p4=;
        b=xUPE3N6ViAKD9FgKv9OAxdHogp5hMrfDbviqFwhRiVi/Vn9DjR/Mp3ap0rmz+jX6qv
         h246nVZedzJru51n9WFTPyrX/49fZX/aN4MLCidzLYK2e7H9uvgsQxLTRPd0z/r/6PiD
         bqNAf+4Othhra12Ro4kGEwOAHsz2DRG2hOaRLjTcxvll6QyzgIVurjIVKhvwir2JSDIf
         QhKRrxOS4gYPo4Ge90gclSH8IRjqhMvy2badCvLFsWDTC++NMYODPdckdapUVWDjKDpF
         c3ykynlGDZYC2T5u/ete4VkK3BIf5IWU0KIaatDzeqL8Dl2vrl5eqdTjLPPW8C7Cnkrt
         NabA==
X-Gm-Message-State: AO0yUKV/ngNQnrW5p4QjAQ5GObmMyRVSc9mpaXsAsU5b6l0wnUH55WPA
	ZTo50Ag96tw/w2A/DfI0gjLGgFwylZE=
X-Google-Smtp-Source: AK7set/BvteQN6Ufz1XBNK/qBrZCrW5hJyuGBhGDJthGJhHYKkgYiXxHiNEv0huAJaBUSFy9Pb4oZQ==
X-Received: by 2002:a17:906:1d45:b0:884:930:b014 with SMTP id o5-20020a1709061d4500b008840930b014mr22660008ejh.6.1677264633304;
        Fri, 24 Feb 2023 10:50:33 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 11/14] x86/vmx: remove unused included headers from vmx.c
Date: Fri, 24 Feb 2023 20:50:07 +0200
Message-Id: <20230224185010.3692754-12-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
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

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - none

 xen/arch/x86/hvm/vmx/vmx.c | 56 +++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cb8b133ed5..9b009ebcef 100644
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
 
 #include "pi.h"
 #include "vmx.h"
-- 
2.37.2


