Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFF3FF13E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177516.323033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTI-0005SL-Ha; Thu, 02 Sep 2021 16:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177516.323033; Thu, 02 Sep 2021 16:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTI-0005M0-Ct; Thu, 02 Sep 2021 16:21:48 +0000
Received: by outflank-mailman (input) for mailman id 177516;
 Thu, 02 Sep 2021 16:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpOh-00029c-Pg
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:03 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 883c0791-ab03-401b-9eb3-be2241ff3bec;
 Thu, 02 Sep 2021 16:16:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v10so3835568wrd.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:16:54 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l35sm1840348wms.40.2021.09.02.09.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:52 -0700 (PDT)
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
X-Inumbo-ID: 883c0791-ab03-401b-9eb3-be2241ff3bec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ealGhID5/ZwlyOxoKUyhT8abP5eBfK+uMSNnBQgE1TY=;
        b=W7wWIRu899u62PiYNAofijA+z0Fl13DLdrj//JnOtB9nuav7HgFA25Nkb7zPP9qx0q
         V+T6UyuHV8lfYhIsfl6T3reP8G73iXnJAJA0ZI5pdqQK3b2QENsciaKQFL/VhPrWDk3o
         V9xTH3D7YAWgG+OE8yKD9gO/syxb0LKTwtCgItyeMl0A+kX7M5ZtD+Rg6R+o7Cnq1P8l
         69E8lhjYEQcYXk+iNCzjjt0R2+v6w/ULq5UCkJupima5EWr+YrbDz2jjvylypCOx3Xrd
         ioW7y8oVW/o1/Fd4QRhzX/tp9G+m2C+2tAs7vFR9FJH4g8+0Rq+iX11ED1zseb/+uUtD
         FA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ealGhID5/ZwlyOxoKUyhT8abP5eBfK+uMSNnBQgE1TY=;
        b=sdqiUu04J8O++JRqkvbqba+MFb5mXzFJUvwx7Yjw2LPEU/mBmB4QCTy5tpYQZTGr5h
         z3o4cUEFHl56rSKVzxPW80yiS83nRqpDV6J6NgJm3cKAhXh9M76GE6wkQqeaF9XUUM0V
         P3roardmwRDG+4ccztiKiu5zkp6jigyMBK7mh3xdCiuZ3pD4QtNoiNrHeY5LcJwM8nBw
         ExFM244J8mbjmXBhXGv+AvHPmRPcRlmLqoNVvjzI017D3wFnIZNe9kZbzf6KgtxM1prE
         AVkcvkTik8axI+iNci3QtK4VWrGjGAS0BZnHkNqkPKodYNEuaXH+U1xmVW3HgYuo2tPi
         0I3w==
X-Gm-Message-State: AOAM532TD803QR+83lQ51rGFrC6Wm2eGNV2BkK5aa/sAmeFG80Z45fzZ
	F+J/sL1sXGupcd8bBlxjhJg=
X-Google-Smtp-Source: ABdhPJw8/hywRF+QG+EoxPvaacbpI8TbV6wFHFx7ujXzHTlr6qNAq926vGsYV8Cac2S8ECAaju7k7A==
X-Received: by 2002:adf:916f:: with SMTP id j102mr4715417wrj.422.1630599413462;
        Thu, 02 Sep 2021 09:16:53 -0700 (PDT)
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
Subject: [PATCH v3 11/30] target/cris: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:24 +0200
Message-Id: <20210902161543.417092-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5bd..d6e486746be 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +297,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.31.1


