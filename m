Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED63FF13C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177513.323012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTG-0004pN-Gy; Thu, 02 Sep 2021 16:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177513.323012; Thu, 02 Sep 2021 16:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTG-0004lW-AN; Thu, 02 Sep 2021 16:21:46 +0000
Received: by outflank-mailman (input) for mailman id 177513;
 Thu, 02 Sep 2021 16:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpOc-00029c-PS
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:16:58 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3adcf5b9-68b6-4973-9aaf-67106bde2e85;
 Thu, 02 Sep 2021 16:16:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1424714wmh.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:16:48 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y24sm2479386wma.9.2021.09.02.09.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:46 -0700 (PDT)
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
X-Inumbo-ID: 3adcf5b9-68b6-4973-9aaf-67106bde2e85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1uiIX4B4XnBDTSuiPfQ6TXqVM80IFaG7yss59sugPek=;
        b=KqzWIKJ7D2fRmpGndmFmFNuwslKTxikjGxDMGA2xsPlBUegPAHynuzDusdrr5XjA+x
         UCJbwBQeZPJQtXG0Xtu7RxwzPdlThK6RVv2DMQ/DDE16jxbu2MLTQ+EKf6s/CZXPXeN6
         nzJIGn8UESvClj1N6xIA9j+rSpvqLJiMXVoYewPiMa355LZW9o2GW/afajWJc0/NEar0
         Q8DpjYGYUJuF0UC+706nFPlDCV62j7IN2KHM9wzg02+ZUE7+nf9cE7ogevav/S8CwMh4
         Jx4C3Bwaygo71B9Uga55OA34fqh3F6hfjdQCFZRtq0AWQ50+fnYTHxBfr074WpLdgF+1
         YThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1uiIX4B4XnBDTSuiPfQ6TXqVM80IFaG7yss59sugPek=;
        b=OcR6OYbN3d3+2/g4T4hIfhIUOPuSgrlIYkvMrSCCKVcwHrOzkhyTj27/29v92exeyX
         7JPELEhrW92u2JkyyYxEM+0T2A74FrU0I6kwO2v9goJHE4rl8EijW/t/W80Gz8+5ffe5
         XL/6yRk1dxlLX8JjN6Hx2z3MVNokbW2k64OTHcgMfPOWhpGvBvjuTOOTEX+RJH0WRYER
         gFrToV5q5PaGzh7O7eQ6O/M8sjhff6HLSeyLgHLgDjajIsfVPS4/uGqZQu+6Jt8qfK0E
         b4L8hjAofmc4J7d5ie3NpV5R5y+1fFb4sG+0JxUDgGhwIVcqmWrP8HqKjIwYdf+HJ5ep
         K7vw==
X-Gm-Message-State: AOAM530wdLK2ToSAzMr/x8CGIs4lvGpJNhADcJQV71/gfrit0Y9X73os
	IgPLuecZ3K8CHNnkONAn/jA=
X-Google-Smtp-Source: ABdhPJw3pSsMq4kZKK4hbVaJZjnjyoQFK4vJQiZ4XHFwYg2jDsiLD33cM2YA1HEu8cnvL7L44Mu7XQ==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr4089427wma.9.1630599407288;
        Thu, 02 Sep 2021 09:16:47 -0700 (PDT)
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
Subject: [PATCH v3 10/30] target/avr: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:23 +0200
Message-Id: <20210902161543.417092-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index e9fa54c9777..6267cc6d530 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -32,6 +32,7 @@ static void avr_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc_w = value / 2; /* internally PC points to words */
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool avr_cpu_has_work(CPUState *cs)
 {
     AVRCPU *cpu = AVR_CPU(cs);
@@ -40,6 +41,7 @@ static bool avr_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET))
             && cpu_interrupts_enabled(env);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void avr_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
@@ -198,6 +200,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
     .tlb_fill = avr_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .do_interrupt = avr_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -214,7 +217,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


