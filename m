Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1A3FF142
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177530.323066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTU-00073h-RY; Thu, 02 Sep 2021 16:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177530.323066; Thu, 02 Sep 2021 16:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTU-0006yx-J6; Thu, 02 Sep 2021 16:22:00 +0000
Received: by outflank-mailman (input) for mailman id 177530;
 Thu, 02 Sep 2021 16:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpP6-00029c-QX
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:28 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef57b0c-3db4-49db-ab0a-e88961aeea9d;
 Thu, 02 Sep 2021 16:17:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1756535wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:21 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u26sm2444655wrd.32.2021.09.02.09.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:20 -0700 (PDT)
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
X-Inumbo-ID: 9ef57b0c-3db4-49db-ab0a-e88961aeea9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yI9HNtTgyr1D6LnyMBdjwFDJD3B27ntrVyNfg6pObmA=;
        b=U2uwqAQNdpnlzp+ESr25gYYFRQFiKkwGfbYBdEJEhK8WvNyB3W6SW/d8vS39ShykYt
         KjW8bmI0A51yksjJsztk3PnbWgrojrKVVqZEuWCXsll7maIHDOE+TUvhByg6eVxV2YO4
         Kck+INFoCYRSpbSsv9Whw88dorhpd2Vg3v9+eB5JpbKAbAeW/R5bh44TF5Lf3uEy+zLL
         RGSPDOO8yKxtK+VZKvOfcEExgvyvZTiR2XR3sSyBG6KljCmSQBYEj0d3C/Q4ABoW/H1Q
         /jDgwuiymH/q6Oj2C76+I+aEeA3QCh3LaEPc/5XOWBjjrnq8mhBxG0fKOPLpG6nd3yVW
         dFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yI9HNtTgyr1D6LnyMBdjwFDJD3B27ntrVyNfg6pObmA=;
        b=Xm2kxRf5b4nwVM4gGhWtQqp68SCBHOhTxYxJ8VlHoTytT9r4qqYixLvzReNpDul4Ry
         0boISPHQSzecnaQ+rzvjeR+J0+kn2c4KG3LQWRLoLZtO+VsNAVSY4Bg7/WkcMSuAaDGl
         pjn1ldU4Jlqh64xtbqAwOoU5xjKqzzH9nKReC72Im6YP20DvJ8kl4RimmkihacX7REmV
         WXkI/+5nR4/poz2kX6cSqRdAmMIVf+b6bEsI95kZ2WHuYaV1hSSvcAm0dwCeyOHtyvgW
         OL66QDNw+EcrpFGw7/g+brfC9EU5DLqLgGTIUhP5jKOKoMX6XA4q/nLMMiZM4cnltVC/
         hIkA==
X-Gm-Message-State: AOAM5302pTLxcA5m9/9HpruRKO7jvmNMxMdcrEhqr3iPMGBstRVlvs2/
	KDLvX4jzaQq4b57KpD8uW/w=
X-Google-Smtp-Source: ABdhPJxszMtpghtVMFzBIiCctVAaFhaKkfegWVJMuLYTNpt1RcE+DF7+wgJu132GyNXvqWu6eKFzOQ==
X-Received: by 2002:a05:600c:3397:: with SMTP id o23mr3987673wmp.38.1630599441102;
        Thu, 02 Sep 2021 09:17:21 -0700 (PDT)
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
Subject: [PATCH v3 15/30] target/m68k: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:28 +0200
Message-Id: <20210902161543.417092-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d11895..94b35cb4a50 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
@@ -518,6 +520,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
@@ -535,7 +538,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
-- 
2.31.1


