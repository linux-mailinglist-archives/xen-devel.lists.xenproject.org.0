Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F293FF13F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177521.323044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTM-0005y8-VU; Thu, 02 Sep 2021 16:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177521.323044; Thu, 02 Sep 2021 16:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTM-0005um-Nz; Thu, 02 Sep 2021 16:21:52 +0000
Received: by outflank-mailman (input) for mailman id 177521;
 Thu, 02 Sep 2021 16:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpPG-00029c-R3
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:38 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50d9668c-5273-4f42-b2c0-07276964ddd5;
 Thu, 02 Sep 2021 16:17:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1734355wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:28 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f18sm2080257wmc.6.2021.09.02.09.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:26 -0700 (PDT)
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
X-Inumbo-ID: 50d9668c-5273-4f42-b2c0-07276964ddd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
        b=SdUILgJd3l3KkosL5d+GJCCbjxa1kuvIi2eQH+QhbRZsxGZZeyT8B45EfAvb4vDqID
         Hvz12f+uLhG2sxeYjZh1eHobRoGFGmx8Vwc0IlXnnkf2IX5bx+BVhSr1cY3Ej8rlB7KC
         YO8ak4ncoqL6BecyY/e6YiTBs4ooYjlzwmmJGuU0TYXlpRik+gmohfcoQGfINeBVNh7H
         gfydQO5CesTCgYv9jzBSAmfhKaEn9YTmVKuXA9R7D2QLLI+i2p5DKESCrSigkULnbdYP
         q+rTwC0UOLH6fDszBS6ixFPljdENz9/dOQt5v2rlttm82OpvBLF+yYDt5s7Pj/jtLcYS
         Xgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
        b=gscGy/7Izd5tcvChASYjY3Xc46zWncdfnQm4CzL2WrMP8G6U3kt8LJU1buyb08D0Au
         o8ydrhFGgwqZD86ffkp3iiDYfsplKbZ08Kwz7RhnwlBHn9meO0G972QB2nfY7coC5RIV
         aBjm1fn1pjlNQXEEFa+RKEzVVplsquUMFITBrqZWqSNpAI2PnMQZkw1vofyv6AP2fmp6
         qmA8YEtTIIx2SwFiNT7FPpHBRXokMh4MlPMkZwxIfoHt+dEpe9Jv0Pn1647pAB/FRsUn
         PlJQGgiFBIi54r4ilFGJ/xa35iETfHoG6TyUrp9f0pnb8JoENVtmF+VzrCSZztxkZZyd
         DayQ==
X-Gm-Message-State: AOAM533+JKAYooPg94eIiSAwa4nfsMEvvY9UbxGn7aKmYtLGHeECTnhx
	Mj/qOOr1U9TzLJUtnmr8E+0=
X-Google-Smtp-Source: ABdhPJxeXOWsxsq5sHAGX+bjrNwp1kbgUUARJY9Fvv8rdRD0ZNZFO5Z6zZ0qv0LrIPXbrhuPF3RRHw==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr4082621wme.4.1630599447661;
        Thu, 02 Sep 2021 09:17:27 -0700 (PDT)
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
Subject: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:29 +0200
Message-Id: <20210902161543.417092-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..74fbb5d201a 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
+#ifdef CONFIG_TCG
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* CONFIG_TCG */
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +145,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +371,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +390,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1


