Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C727C3FF138
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177492.322977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpSw-0002oJ-GS; Thu, 02 Sep 2021 16:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177492.322977; Thu, 02 Sep 2021 16:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpSw-0002kp-BQ; Thu, 02 Sep 2021 16:21:26 +0000
Received: by outflank-mailman (input) for mailman id 177492;
 Thu, 02 Sep 2021 16:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpPV-00029c-RN
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:53 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23c4919f-d8ba-48eb-ada9-6b5f71fd8ae6;
 Thu, 02 Sep 2021 16:17:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so3843166wrn.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:49 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s15sm2202811wrb.22.2021.09.02.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:47 -0700 (PDT)
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
X-Inumbo-ID: 23c4919f-d8ba-48eb-ada9-6b5f71fd8ae6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wiJyFwIKRQWjRkbu8SvGMr1PDMKMIYamMV7C3BB8oe8=;
        b=qAtoFIb8zeHmLJ+DXBMGpAdnbrphpEAfuI7XHEPw8NBmRW9/+WQnP+AZelTqnIhAyE
         XWWklQ0ZgUaW+TjGyBKgrmT5Awe/DhMqWt5iYbHcpZayB/1OpJXxLIVgIBvvvx9tbfbe
         MhBhX16/hQ/XQpM8/t7IWpZx8Wn0h5lsCbsMip4ljj1E3unFy90cJy4UzhkEFnhbknkU
         T8DR04fw7m7nWgaHWphfTdeObgKvp0ylXJqEGEN6mGrqmeM1GzS3/abyks0gzOofcGN7
         UjU06l66Hvh9mNoLvBN0ewV7GlShfdvdFlG07p47BqES4xriMHGxYVH/Zf/4POrSSA9s
         8XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wiJyFwIKRQWjRkbu8SvGMr1PDMKMIYamMV7C3BB8oe8=;
        b=TSgR5ffHhrhHIIW0U9o2qek/e8pXK11HMEHIRuYc4W2x67SZpZ2yWAfSR3x/RK4kZq
         EVglVcPm2RoTDG8nPxBCmtJAQ97MxJ0p2Uu/h3CDwC2bB/CkKMQScN+ZZFpyANFQOrG0
         mv3xejdE1URVO+giLkNaLVPKYAn1wgg8D4pHv7afsN62HFb6fX8bpXfOc/5PWe00NX9y
         hGFFTF90NUaPC51XgEmGSYp85kZ/0y4pwjTRZFELtka6PbEgZWq538KBwHL61KvgQ2gg
         gRV47F8SbBmIAGZLbzICiSEfX0orQ4QB03b15ddOa91yLSPWFkbQ4TUby14jmO1moxZj
         KcDw==
X-Gm-Message-State: AOAM533KiT6UL0hOmhezx0HibwF6YCmjW75ODLsITZNb/MlSL8JUWDys
	2M9R03qcdJ4CUI/gmgzQeiw=
X-Google-Smtp-Source: ABdhPJzK4QdOoxXsApVtGRumuSNyT10qkKd9QeSHbbUEQ3zItVBoCovI95FuxXm2STsnpfXGUzb9Vg==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr4776030wrv.71.1630599468354;
        Thu, 02 Sep 2021 09:17:48 -0700 (PDT)
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
Subject: [PATCH v3 19/30] target/openrisc: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:32 +0200
Message-Id: <20210902161543.417092-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f9..6544b549f12 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -205,7 +208,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
-- 
2.31.1


