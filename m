Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AF3FF108
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177435.322879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpOF-0004h5-7W; Thu, 02 Sep 2021 16:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177435.322879; Thu, 02 Sep 2021 16:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpOF-0004dr-1z; Thu, 02 Sep 2021 16:16:35 +0000
Received: by outflank-mailman (input) for mailman id 177435;
 Thu, 02 Sep 2021 16:16:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpOD-00029c-Op
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:16:33 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ab99782-1fbd-4846-a155-7ff202366422;
 Thu, 02 Sep 2021 16:16:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t15so3835538wrg.7
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:16:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g138sm2059442wmg.34.2021.09.02.09.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:28 -0700 (PDT)
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
X-Inumbo-ID: 5ab99782-1fbd-4846-a155-7ff202366422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gBDJiXTHT9IuEk9FfrTxtULybQQn9dfnXif9nUI7YC4=;
        b=LsbNjaXg9ZfDPBy35BgL3iTqoeboaHkvnknRwyAU2+xh3Y/GU5flK162rFrVD6PusK
         Zqye8j5GUtb9gwLuuAwBTaOPWqvSsNMI+LA1B5XlyhQj2OVug2mbnYS/clkuPBIuFEym
         pP4NuPbllHtklBm3Yk0D0W9rgb1jh68G001/gVtLBxzuFMcKbp53adEKS/t8pLvhfvjr
         /zEon0LvHHXUsmhiO9rLMnilC4Arm5Crf6gVF6CvpbMBshlkL+4jtharx5Q/STsgQBAC
         MvKjTe/KtyoK/YH9U42tNMwUXpXFN7GCzVSMFrxoghGcQKddKIXW2rcVsMa4qI3qYUFC
         llIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gBDJiXTHT9IuEk9FfrTxtULybQQn9dfnXif9nUI7YC4=;
        b=kEv3BmFnyeHc6i4NdKXd76NahA4ttP4lhASayAo6lutF9BCJJ2V23iaZEmew8wfarp
         s2DrZZK6lVinQI6C35XXWmpK8V5SsSBdFz09xsRefLkeXGPOpTd+a1c4ep8VjrnN4K8v
         qiNWddsx1e2jcsXdgSbXLPIhKCzH0ItGOOPyRNNs0XqgzeEdAaI+gsaMFm5MnUC1OvHY
         Qyup9znmWkNl/Wm5B05iP1UF+JX6QruPuO/Us1w8yGkZGdtnt++FuGFLdeYfBqo4KZJT
         09GHANxeUiXjPnkNbPQU0txQXO/pcEUlPB11dgaGLPfKlKKjk/HgR0sMFIQ9CER1/k1L
         W00g==
X-Gm-Message-State: AOAM532lCxNXmb4vukUiuODmdi3Ztj03b8FOeqTYm7vn+4N0i8GvHLrM
	AJWr3zKYiNFpsphcvBf6NbI=
X-Google-Smtp-Source: ABdhPJxj90aNQOBb3bG354GuN1ofupsCwK8r7Qe99fRLxGQ8aaew/tNKGnIR32ntB4hlx8/hSq93OA==
X-Received: by 2002:a05:6000:36e:: with SMTP id f14mr4867472wrf.196.1630599389049;
        Thu, 02 Sep 2021 09:16:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	haxm-team@intel.com,
	Kamil Rytarowski <kamil@netbsd.org>,
	qemu-ppc@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Cameron Esfahani <dirty@apple.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Wenchao Wang <wenchao.wang@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	xen-devel@lists.xenproject.org,
	Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Colin Xu <colin.xu@intel.com>,
	Claudio Fontana <cfontana@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Stafford Horne <shorne@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	kvm@vger.kernel.org
Subject: [PATCH v3 07/30] accel/tcg: Implement AccelOpsClass::has_work() as stub
Date: Thu,  2 Sep 2021 18:15:20 +0200
Message-Id: <20210902161543.417092-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add TCG target-specific has_work() handler in TCGCPUOps,
and add tcg_cpu_has_work() as AccelOpsClass has_work()
implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index bbec7760f48..919d9006e24 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -66,6 +66,10 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd6..ed4ebe735fe 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -73,6 +74,16 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->tcg_ops->has_work) {
+        return false;
+    }
+    return cc->tcg_ops->has_work(cpu);
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +119,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


