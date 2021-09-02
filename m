Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCD3FF13D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177515.323019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTH-0004yO-7A; Thu, 02 Sep 2021 16:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177515.323019; Thu, 02 Sep 2021 16:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpTG-0004s5-UZ; Thu, 02 Sep 2021 16:21:46 +0000
Received: by outflank-mailman (input) for mailman id 177515;
 Thu, 02 Sep 2021 16:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpOw-00029c-Q6
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:18 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8146775-0b3e-4bd6-a71e-55562e409a43;
 Thu, 02 Sep 2021 16:17:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i6so3844396wrv.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:06 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y4sm2068566wmi.22.2021.09.02.09.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
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
X-Inumbo-ID: c8146775-0b3e-4bd6-a71e-55562e409a43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
        b=NaB65rpK4UK7+XbBO28oZxFusXeQWuGTndzQkKqs4x497OOBypBPU5uctaWGbkSibX
         gbzbf0uKBllL7IMK9jeerTaWXdNmmwfHar32fZ/NCC0Cj626RXCkU3d8hlfsPo25otel
         OL/nvXSML0UuV9hTKCtQARxXaxraFStiKn4xGZp+OALpmFXy+6sqXkWFwBJFR6EcXMpL
         +gEhWt3eW2TEXJjoPvyiNmFQPJOj0yOdhR7ZZu+zEVqND+25gS72HJlWm9AWHklxn9DD
         TkIjI2aJpOFpKyf44h+zUsWbE/UTizlwAkVSUgam/bJtjGLksKc8rvZbllkWj5mw988x
         UXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
        b=MCyUV1oJcs5VGlyrKB6nHbQvPEcHLbkgS6FqfKTM07X9tN4LRSXo2L7t/6v08mYZUM
         1zA3wZtlulY5SkwR0bi8iBprxvHtzCEi0PwG3BKJX2isXumCYXpLXFL7pF3riq7jqxCR
         7qe8KB9hfcRi69cKyNWYwiz/99jRvXFqvQP78lBKIBkx4oOI/7f9NlGF/jWfHmMtvGTO
         sFaVIuKwFYythL74Csn0M9z8tdnmVJ9vEKp0zXgrxX9AcGBB0fl/2T66IJVyYlzP0Sox
         bbzAL8tWjKaRifdEK5Xci94JZBU3EN3XMfV8JGQLiJhLh/QYWzbH1yamHuGlKK8feF3R
         QomA==
X-Gm-Message-State: AOAM530gW0JLHBVyXLlcCjTOjML/xnUvFW8hfrITgPcLZzNxU2WxL6vb
	/UggOvOqfQ3++rdP8zQTt+E=
X-Google-Smtp-Source: ABdhPJxJ0WzmriUMp5BLtv/IKodEKm5HtzrJCRMHsGjbOs/WMzY0lZa1I+orMo+J9P/Vgaj+G+An4w==
X-Received: by 2002:adf:f991:: with SMTP id f17mr4751225wrr.56.1630599425756;
        Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
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
Subject: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:26 +0200
Message-Id: <20210902161543.417092-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..cf1f656218f 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


