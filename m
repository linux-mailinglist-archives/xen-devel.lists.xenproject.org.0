Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DE3FF140
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177522.323055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTO-0006JB-FP; Thu, 02 Sep 2021 16:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177522.323055; Thu, 02 Sep 2021 16:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTO-0006Di-7y; Thu, 02 Sep 2021 16:21:54 +0000
Received: by outflank-mailman (input) for mailman id 177522;
 Thu, 02 Sep 2021 16:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpPQ-00029c-RL
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:48 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35337728-37d5-4f15-99e8-bf5d5c0bc7c4;
 Thu, 02 Sep 2021 16:17:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso1752432wmr.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:42 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b10sm2396452wrt.43.2021.09.02.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:41 -0700 (PDT)
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
X-Inumbo-ID: 35337728-37d5-4f15-99e8-bf5d5c0bc7c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZDEgfpsGMQvs/Uf9L14U8iNfhU1RYAtDHEnPo7PYYM=;
        b=GULtcfLvxCYjpD88B1lNFiQq0+Fx5WhxaqykU8SQ2CHcFSQ46Oe+PaWfXkceFQ4mZo
         9SVUhNZ9o3T9wPipJYMj4yipSNtMQdK9k6FheUrkcj3bklOdIm+96woKK1z756yLjsg/
         MhcJnDjB6bDPTEVYbHN4OuhakMfbQHLPwIuQo7fhJI4LnxL+hhUixbbozhsjDk51Ju96
         gEVW+K7GtzvK1ZSbUGOUZzNQwoBSJHeiBUhu/bkunqvaYTW0krBKCnLFihT41xPY7/te
         UIojuKoYb6sy0krnR6uivIpg05XXUq83++TFLX9QNOJMrVv7jBEaRQx/6ic9TCOEtLyT
         HNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zZDEgfpsGMQvs/Uf9L14U8iNfhU1RYAtDHEnPo7PYYM=;
        b=s/ZlfdL2kPbg27cSacwE2l9+XTd6UgsmCFwLHqX5ZQEBOyLQZ/ih5yVl8LVtOJPBgY
         pHw6FDTkAyjPcQeCQcbneLIoxnPrTBswd8JJCWURFMLaFpQKDMlyE4lH6g9okWwlhge1
         PK/9qqBIjHm70UUj8XTCI0Tll+XqFWPHLUonS2d2vGfK9Jh9GR0V6OhPtHSnc2kVYGk4
         ouke6U000KZXsX9cDfD4101o8PlkaBRky+ahJZHOdB53WctZWPGLQIMJHADQtoVqPV0L
         ZC8iZdviq7Rhk1FxI+1BduhFztCxVXKGcWBeN8Nm7JcxgMieyL4ENl0N0dLivNDXWFjV
         oS9A==
X-Gm-Message-State: AOAM532+81vKHQ8Y6U/8zPktKodLsiFSkERZsoIO4SC4OfAr9ikDjtKG
	oJlLu2QMYb9U2hSSP+Eps1s=
X-Google-Smtp-Source: ABdhPJyVfC2B9mnkyBEM+dhp2QSoSDx2mJAJ4q0c4MKaFScZUxxMUDRDRaRsAykGgf3YQuNS/WTfdA==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr3991806wmq.181.1630599461974;
        Thu, 02 Sep 2021 09:17:41 -0700 (PDT)
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
Subject: [PATCH v3 18/30] target/nios2: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:31 +0200
Message-Id: <20210902161543.417092-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1e..f1f976bdad7 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.31.1


