Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5953FF11D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177464.322935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpPy-0007v3-U0; Thu, 02 Sep 2021 16:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177464.322935; Thu, 02 Sep 2021 16:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpPy-0007rK-Oh; Thu, 02 Sep 2021 16:18:22 +0000
Received: by outflank-mailman (input) for mailman id 177464;
 Thu, 02 Sep 2021 16:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpPw-0007of-Iv
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:18:20 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b72cc44c-9d4f-42be-b49a-d342b8f6eda6;
 Thu, 02 Sep 2021 16:18:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id e26so1676496wmk.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:18:19 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l35sm1842816wms.40.2021.09.02.09.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:18:18 -0700 (PDT)
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
X-Inumbo-ID: b72cc44c-9d4f-42be-b49a-d342b8f6eda6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iBR7XZaVDWa3VEAQfJT4KESDdYv2ZsQvbER1+LPZ/aI=;
        b=b3oM2a7kfu59T16h1BQOivDnrY/oITcLEbYMDbyYiQhSRpMPPbkow/DjE+1Ih4EQL/
         DUMVJOdg0XVJbEcJ79XxMVenCZKrXPuNo4lfReSnNPQpSjZ4YOofjjl3erNURKNYsHtL
         HEHPXeiHX0YfdcBowdh8WFKOQbcQAU/wfMDvbfu4iq/jPgfcZfFUIVDjHXKT3CRk6R6M
         vj3MnraM9QYlz2Bf2AIl43yWvEv2b8GLOTUYPYAin5G610qJf8lQsTsudFi4GarHEOkf
         I84tHwdyec/ClmJMz9FqfnRo+aZy5mZWv4eOOqkltbqaFUUFGtiu6tZ9fx/UuTf496te
         WjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iBR7XZaVDWa3VEAQfJT4KESDdYv2ZsQvbER1+LPZ/aI=;
        b=XC7H63v/lhUXbDyNEzU8+md8Q33329MaofzYASS1Mq3uAkryDjopPy10l2SFqURquz
         rypd3uWrS/XI2sdwbefbN5FCw0gPIGnAdQxEACoDsnPFktesRwu/8swgQ9wv/D+abhsA
         a7vPjgFklBktI90f3R7cO4OinSfwdf8yKneHny/iv3NJrH3vQTFlwZ0DfmQ1AM9jdNVX
         b2lpKZ81+bYon/Qa50+OqeAfnfdK4Xf7Eh1ihcaMXF3T/WFvSxIL91TeASmRk/uDpED9
         RAKjrUZG7VEHFcUcthBdGay2ZruJp3G+9HF7tq6RilzRRwdcFmr0mNVQuBA4KqIJkNPK
         OVtQ==
X-Gm-Message-State: AOAM530T+JziSXzZmMQWBcwGHaNGrFP7TX7pNrSZ1rFAZILHHFsNY26y
	p2JcI1tMAU+TxdVidVWyYYY=
X-Google-Smtp-Source: ABdhPJzOyuZQlMcSsHM1l7m0tMnQ7s93BFuzpn/h6Lj/C0+zH4RsxK7hVpmbT/Jm+TQOVSFAinpu2Q==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr4067940wma.168.1630599499125;
        Thu, 02 Sep 2021 09:18:19 -0700 (PDT)
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
Subject: [PATCH v3 24/30] target/rx: Restrict has_work() handler to sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:37 +0200
Message-Id: <20210902161543.417092-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976d..0d0cf6f9028 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.31.1


