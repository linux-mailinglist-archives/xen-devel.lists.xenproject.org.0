Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF43FF0F4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177411.322824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNh-0001n7-Fc; Thu, 02 Sep 2021 16:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177411.322824; Thu, 02 Sep 2021 16:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNh-0001kK-BD; Thu, 02 Sep 2021 16:16:01 +0000
Received: by outflank-mailman (input) for mailman id 177411;
 Thu, 02 Sep 2021 16:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpNg-0001jd-F9
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:16:00 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e79055f-777a-4214-9dcd-58dbc5b4c0b9;
 Thu, 02 Sep 2021 16:15:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so3827438wrr.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:15:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x9sm1939663wmi.30.2021.09.02.09.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:15:58 -0700 (PDT)
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
X-Inumbo-ID: 3e79055f-777a-4214-9dcd-58dbc5b4c0b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IALuJS79v15vDPvWp0gEXOFVB8QcuCBujL3iQm4WVXc=;
        b=lyX2iDyZ4fZxIDfBFZ3tyjvTVxQHi5/DKPStvMf8XLdWBZf2Z4YEuBxLZ6HKfP2S0S
         9fzfqOWFn0kWTui3s6TURapTU3z+GQ8v8hJn1LfoSFOHPkdm35vCxTfT+cYkW1nrugty
         mCqdxM8mrNR5MLebQDolGLEo/7Lkgdj2gwYMGjuH7g4aAADt1Bq23c52IZGz+2AB+NL8
         GZ3E3+ftKA9QL43iXqO6Ak9f9Icd3LYBSFwdaV1YhiiVZy5M0xyjWQ/L7Ym3RUz2AJov
         QL67c+ediBlqlyYZ/UNrRKxOjNTuB98lMijtK7yEZi/9rGhzXp+Rvgvey6qwTDyAgy4I
         6qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IALuJS79v15vDPvWp0gEXOFVB8QcuCBujL3iQm4WVXc=;
        b=jA6rkLNq5onNhK18PKg4Jguw3KjL+xa4I351/p9hYDsaONywvLh2DiMpzoFfqfspym
         OdHGO7ValOFLZLWo2NdolFakqBxgmXArNPRqupE4g6hXetyFbh8Wzx7Bv35Un/P85jDi
         Mdpaa+ZLRS0f1ChnINBKNhyP5Zz9Djv9S5ucAocSSdnHLASAxURT8x0CDnzRRd6Tn2JP
         nh9DEE3HMgj2D8pBYQetxXaQewemPAeGfIYEGdGWe8yNdWYGROhe2NlnFVVsM83bY7Kf
         m8ybWyQ6BpgbbqwF5vypNql3QBVtm6Jw1+gZasaTQ6pHTSVjg0i8t/O43+CmhZpfu2P0
         LuBw==
X-Gm-Message-State: AOAM532dP8BsRnishddRUrFIICPTR4zitj2XbhoyxCUtU5ivcuarChxc
	dSLI/oa3b9uFpPsACSka9QNn9ub3IvE=
X-Google-Smtp-Source: ABdhPJy7JEkr/3dMu4L49Lw+gPGY8gHw7yAaZhdIf87oRC7v/4j/f/YWrayp4BQC2KvwiDQbjRMXEg==
X-Received: by 2002:adf:dbd0:: with SMTP id e16mr4727843wrj.402.1630599358916;
        Thu, 02 Sep 2021 09:15:58 -0700 (PDT)
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
Subject: [PATCH v3 02/30] hw/core: Restrict cpu_has_work() to sysemu
Date: Thu,  2 Sep 2021 18:15:15 +0200
Message-Id: <20210902161543.417092-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_has_work() is only called from system emulation code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564cee..2bd563e221f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -538,6 +538,22 @@ enum CPUDumpFlags {
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
 #ifndef CONFIG_USER_ONLY
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 /**
  * cpu_get_phys_page_attrs_debug:
  * @cpu: The CPU to obtain the physical page address for.
@@ -636,22 +652,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.31.1


