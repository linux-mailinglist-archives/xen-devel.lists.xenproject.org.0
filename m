Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F353FF0F5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177413.322835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNn-0002FD-OM; Thu, 02 Sep 2021 16:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177413.322835; Thu, 02 Sep 2021 16:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNn-0002Ce-JQ; Thu, 02 Sep 2021 16:16:07 +0000
Received: by outflank-mailman (input) for mailman id 177413;
 Thu, 02 Sep 2021 16:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpNm-00029c-8F
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:16:06 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a77c98f1-6fdb-4048-93e9-834adadafd23;
 Thu, 02 Sep 2021 16:16:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so1866829wmn.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:16:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p5sm2438468wrd.25.2021.09.02.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:04 -0700 (PDT)
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
X-Inumbo-ID: a77c98f1-6fdb-4048-93e9-834adadafd23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wV14RcZMLIQqRNfbc2l4krY7RhS99j63lxSZtHhlqHE=;
        b=EKqirEKnM17VK0zDlsK2zMeCBYwgcIwGau/nM2ojAXQ1rvdOXkyoVbGuyEtcnzeBcf
         xImFuE98afvxno05q0YdC27nz6NANS7cu771VPDYoClXWYNKBPbXOfx9/ySz5LCrUECJ
         Q4xIJxN/kF3No93cpZwlCIAaJ6XH09BodtAvBDBdkeBdwCBDaphPwkcvpVDIxHiZ6ysU
         O+OUGJNK0KyuMps/0T4ys/RLGMV8UZ8emOYDNmBvg+JTSjUog7qhAQcBWa/t3lzLUf2T
         odXtoH2/j2F/4nd8pGQvQwtB64/pnwk36AxB7fddw33eEJVy5u1yikEgzNZHCoqMgJ3i
         wCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wV14RcZMLIQqRNfbc2l4krY7RhS99j63lxSZtHhlqHE=;
        b=B1/JoJulq2t4OsAb+f+Iwcof8/8nogzJjSsSeYK+ndN9RIbLLv7MqOObXsP3zigJPC
         QT6sZ7X9Gsx60qQjoIvTtzUllSTGwUxnqlXdrAPEJR9qiMNt7ksMXj72JbHAvkG5mIrG
         nfQffqdGhX9vmV+2DCvXd+wwYeUWI+geadKt5ZYlmwm7neBWVeXD40smnHAFotR6Iu8A
         vLWrUsmI/dXI9HAkILlkqCDzZlfemotf4KeC7PfD2izAyKXKnCjsn9dHhtw/epHv/H4J
         TWk/dOeYDrnaGH9JuKv7IwQ6eyb+YrO193FQE1uX/MyyCKhGGQeKW7HEzEbpdBt+wYMA
         kDzw==
X-Gm-Message-State: AOAM533sKL4jzmZ4JRxrrrQHFzUNx67241OAsPzhJ77CsJ9OPCSuNxaA
	TYZkGH9xZmE6gd74e2Htb+k=
X-Google-Smtp-Source: ABdhPJw7/6UEiBwptJyfAbxmtA0JM7jALL+mTrdaJbBQ6pe56ORuZs2k15EQns1EFPDQ4opAGTbfXw==
X-Received: by 2002:a05:600c:2101:: with SMTP id u1mr4147345wml.45.1630599364755;
        Thu, 02 Sep 2021 09:16:04 -0700 (PDT)
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
Subject: [PATCH v3 03/30] hw/core: Un-inline cpu_has_work()
Date: Thu,  2 Sep 2021 18:15:16 +0200
Message-Id: <20210902161543.417092-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221f..e2dd171a13f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -546,13 +546,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 /**
  * cpu_get_phys_page_attrs_debug:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840b..7e2cb2c571b 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,6 +251,14 @@ void cpu_interrupt(CPUState *cpu, int mask)
     }
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 static int do_vm_stop(RunState state, bool send_stop)
 {
     int ret = 0;
-- 
2.31.1


