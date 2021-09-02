Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B883FF13B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177497.323000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpT3-0003hC-40; Thu, 02 Sep 2021 16:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177497.323000; Thu, 02 Sep 2021 16:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpT3-0003eS-0P; Thu, 02 Sep 2021 16:21:33 +0000
Received: by outflank-mailman (input) for mailman id 177497;
 Thu, 02 Sep 2021 16:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpPa-00029c-Ra
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:58 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d35fc3-694e-4ea9-a48e-20ca3fdb9051;
 Thu, 02 Sep 2021 16:17:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1747123wml.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f7sm2089431wmh.20.2021.09.02.09.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:53 -0700 (PDT)
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
X-Inumbo-ID: 59d35fc3-694e-4ea9-a48e-20ca3fdb9051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KB6w4zAa3ScKbWvcSeRs6nml5mmvjgABbPo/s2Hl9mE=;
        b=KudZd4akeMvkEQWUbX6szQOXRBHrwcFxsejJsDwXAwrTkhmJGlULM7aiBntpU6DlLD
         x1G792oH76CFsyLlbuYcUF0GY8rXRo+VR9Hu/GBgHJyiVzTP3OvIC53DxbyFxm7deDsy
         jywij08/HNg0mFST30fvOpvMZOkJgu6uZtVjcnTVWcKz4cejoxRKoHPRUUanT/GYimTW
         BuEEvjzL5rlc0uwntqWn8CT2tidHHSSa+1LvLL/36Uq3AShOfMPK6XKiF4/niGHWKMJq
         4jkolFQjzFn6TC5LBuIhdKNpLtstdk7EfVBatQiEEjt66rdtDDU/Oqn47gGLe726oHXk
         a0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KB6w4zAa3ScKbWvcSeRs6nml5mmvjgABbPo/s2Hl9mE=;
        b=S+ZBgS6+rjjUm7iKZGdfQttyEEVGsKTgcmP2G+1h5fdQB5HhKZfHB+j+3vV74V0vQk
         CvT3QJabTN8cQxBH6ON5N+1/PgJ9OKQSuHVUvGYkkUENfxm3VN/K7kbi/+q2xIEZh3O6
         /AMbcrs1VvKnZbrhLrlMM21JMIZMu7/dzDJcC3Z0v3irj411l+WtgJCVstR87xn2sTnT
         8JjisYxcBCIOy9wDWmygwTcLrEUYISYHyUidblw0b7Hpm9WVmjFuF2dChSrus8bWB3tA
         M0FeD6Su/CH89yvztpsIMcIn81BFMtfE8VTvzlHm4DHPpVvqPjXobS2adkGLM+XN8sfR
         oIjw==
X-Gm-Message-State: AOAM530lRcx6VXovEkQJ9D9jhQBlfovd6E+E1Sa8FAGoYtk5SA2rQY0X
	vPfvzM14WeSknC2C5DXX0dE=
X-Google-Smtp-Source: ABdhPJx3cFt1jrbYXnlPCjqrJf+8cwfXAXn4EeP6vsDC0dCbWo+FdkLPkzBtWW3nLTZkBTFw2ib2sw==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr3994398wmh.8.1630599474350;
        Thu, 02 Sep 2021 09:17:54 -0700 (PDT)
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
Subject: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:33 +0200
Message-Id: <20210902161543.417092-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3a..e2e721c2b81 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8790,6 +8790,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool ppc_cpu_has_work(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8797,6 +8798,7 @@ static bool ppc_cpu_has_work(CPUState *cs)
 
     return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void ppc_cpu_reset(DeviceState *dev)
 {
@@ -9017,6 +9019,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .has_work = ppc_cpu_has_work,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
@@ -9042,7 +9045,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
-- 
2.31.1


