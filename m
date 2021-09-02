Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4363E3FF0F3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177410.322812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNc-0001SG-0Z; Thu, 02 Sep 2021 16:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177410.322812; Thu, 02 Sep 2021 16:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNb-0001On-T8; Thu, 02 Sep 2021 16:15:55 +0000
Received: by outflank-mailman (input) for mailman id 177410;
 Thu, 02 Sep 2021 16:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpNa-0001O1-ER
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:15:54 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23b39658-0c63-477d-af8b-3222810181c7;
 Thu, 02 Sep 2021 16:15:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so3826952wrr.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:15:53 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm2187403wrh.67.2021.09.02.09.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:15:52 -0700 (PDT)
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
X-Inumbo-ID: 23b39658-0c63-477d-af8b-3222810181c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/9vCQQZfSaTpKBQMegFXjFo179Y+24zi0HZDvs7SgMU=;
        b=nvF/c2Wc4Z15cqg2fwhp1NDrfdcdFXpuAmJa1KWBtzQQ/EXWFrb73xtrx8OZfbtAYH
         +ID89t8hrTCsxgu2Z9TktIv56PS86hvs5RilCbo/0PLhtchmK7Btfa7sZb3B2zUVbiHv
         /HU6lzJWGffGyztr061l6mMVTzRO0XEqa1r0BVkwLvpIuHEZFGdUMQyYCTDsiXNgmkvC
         mzGCP4B8dDeCO3p+Tu6JIdorMuA2pmQP2RRlgrSmz9a3spLyNyj6mRRUHHOVQRLc9UFi
         tO8C8CpGWtVF4XqV+ujfpe9fj5HRkBRHkHwyv6P8VevMMXH157Vbk0qwXp550NWCjx06
         CBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/9vCQQZfSaTpKBQMegFXjFo179Y+24zi0HZDvs7SgMU=;
        b=WL3BQx8x1N6N3//lKXNlq44llQPFA0y0sZtxbi1fmBnxXbUDjLIEgJINkdGIkSwOwX
         3kjySHcaFGGzF8WA/XcdJD0LdyfYFoMQgX1Ysn7IkUwk9/MXQxGf3gDMR6m3e4qUCm4t
         V5cVeV4WwY4zplXWk503JP05jSo1F6bCe/LEVS7GFn+ibUK5uVug5XqHzZvYtCaAHryt
         nA9taw61VwhQwkSNP6CxwquPmCOFd9DQnohy+gjzHL+HOzox1hjzspTsF/wF0jUjNXQJ
         Gy46xURJvwYxfCrErFBZkPQuYQHYTTi7O7GI77ayGenfNAzruqMFd9FnyTv142SsgMyk
         REOQ==
X-Gm-Message-State: AOAM533DWCk/Kz9hxbV9Zt/ADqILugl7KLDKz+/gK44zXFXWnYzj3ltP
	48d6crHEjBiKdzK2Ms1AThU=
X-Google-Smtp-Source: ABdhPJxxdNDVWzqPqP9AvO+fc8KPo1qKTWTpE1Z3SovcisiYMadm8391Ql4b1VZQyA/+Rjg0YRdLPg==
X-Received: by 2002:a05:6000:186:: with SMTP id p6mr4881125wrx.210.1630599352772;
        Thu, 02 Sep 2021 09:15:52 -0700 (PDT)
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
Subject: [PATCH v3 01/30] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Thu,  2 Sep 2021 18:15:14 +0200
Message-Id: <20210902161543.417092-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 372579427a5 ("tcg: enable thread-per-vCPU") added the following
comment describing EXCP_HALTED in qemu_tcg_cpu_thread_fn():

    case EXCP_HALTED:
         /* during start-up the vCPU is reset and the thread is
          * kicked several times. If we don't ensure we go back
          * to sleep in the halted state we won't cleanly
          * start-up when the vCPU is enabled.
          *
          * cpu->halted should ensure we sleep in wait_io_event
          */
         g_assert(cpu->halted);
         break;

qemu_wait_io_event() is sysemu-specific, so we can restrict the
cpu_handle_halt() call in cpu_exec() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7a6dd9049f0..6b61262b151 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -586,10 +586,11 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
     return;
 }
 
+#ifndef CONFIG_USER_ONLY
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
-#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
+#if defined(TARGET_I386)
         if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
             X86CPU *x86_cpu = X86_CPU(cpu);
             qemu_mutex_lock_iothread();
@@ -597,7 +598,7 @@ static inline bool cpu_handle_halt(CPUState *cpu)
             cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
             qemu_mutex_unlock_iothread();
         }
-#endif
+#endif /* TARGET_I386 */
         if (!cpu_has_work(cpu)) {
             return true;
         }
@@ -607,6 +608,7 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 
     return false;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
@@ -865,9 +867,11 @@ int cpu_exec(CPUState *cpu)
     /* replay_interrupt may need current_cpu */
     current_cpu = cpu;
 
+#ifndef CONFIG_USER_ONLY
     if (cpu_handle_halt(cpu)) {
         return EXCP_HALTED;
     }
+#endif
 
     rcu_read_lock();
 
-- 
2.31.1


