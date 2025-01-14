Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597EA10EDE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 19:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871832.1282833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlF7-0007ss-04; Tue, 14 Jan 2025 18:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871832.1282833; Tue, 14 Jan 2025 18:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlF6-0007pu-T8; Tue, 14 Jan 2025 18:02:20 +0000
Received: by outflank-mailman (input) for mailman id 871832;
 Tue, 14 Jan 2025 18:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Qro=UG=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tXlF5-0007Qx-IE
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 18:02:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e3d60c-d2a1-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 19:02:18 +0100 (CET)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-RjarLQpsMFScdKhdOdyibw-1; Tue,
 14 Jan 2025 13:02:13 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E0C941955DBA; Tue, 14 Jan 2025 18:02:08 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
 with ESMTPS id 61C7C195608A; Tue, 14 Jan 2025 18:01:46 +0000 (UTC)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b0e3d60c-d2a1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNwCh5fgGoJuTFO9fvGqFny78uJkIQRICFisC3zeCIo=;
	b=BLl8kuU2hvNfhc/Roltba9jIH/B2bgETmsKpR3nlSe79cQRz9io6Rdd1iVhHQ4oiJIqlb2
	/g9pANjokos4yKv/cXXWBk6Y6EpgLNlkbW0g47v1g6BgkghdBDPMq/FZ0NxoTYwUAdbTAh
	Z2RCNCni0UNx2fb9tNzYZcNlhJKy3qg=
X-MC-Unique: RjarLQpsMFScdKhdOdyibw-1
X-Mimecast-MFC-AGG-ID: RjarLQpsMFScdKhdOdyibw
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon irq/nmi entry
Date: Tue, 14 Jan 2025 18:51:35 +0100
Message-ID: <20250114175143.81438-23-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn't
modify the actual CT state part context_tracking.state. This means that
upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
transition only happens in ct_idle_exit().

One can note that ct_nmi_enter() can only ever be entered with the CT state
as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in the
CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_exit().

Add/remove CT_STATE_IDLE from the context tracking state as needed in
ct_nmi_{enter, exit}().

Note that this leaves the following window where the CPU is executing code
in kernelspace, but the context tracking state is CT_STATE_IDLE:

  ~> IRQ
  ct_nmi_enter()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

  [...]

  ct_nmi_exit()
    state = state - CT_STATE_KERNEL + CT_STATE_IDLE

  [...] /!\ CT_STATE_IDLE here while we're really in kernelspace! /!\

  ct_cpuidle_exit()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/context_tracking.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a61498a8425e2..15f10ddec8cbe 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -236,7 +236,9 @@ void noinstr ct_nmi_exit(void)
 	instrumentation_end();
 
 	// RCU is watching here ...
-	ct_kernel_exit_state(CT_RCU_WATCHING);
+	ct_kernel_exit_state(CT_RCU_WATCHING -
+			     CT_STATE_KERNEL +
+			     CT_STATE_IDLE);
 	// ... but is no longer watching here.
 
 	if (!in_nmi())
@@ -259,6 +261,7 @@ void noinstr ct_nmi_enter(void)
 {
 	long incby = 2;
 	struct context_tracking *ct = this_cpu_ptr(&context_tracking);
+	int curr_state;
 
 	/* Complain about underflow. */
 	WARN_ON_ONCE(ct_nmi_nesting() < 0);
@@ -271,13 +274,26 @@ void noinstr ct_nmi_enter(void)
 	 * to be in the outermost NMI handler that interrupted an RCU-idle
 	 * period (observation due to Andy Lutomirski).
 	 */
-	if (!rcu_is_watching_curr_cpu()) {
+	curr_state = raw_atomic_read(this_cpu_ptr(&context_tracking.state));
+	if (!(curr_state & CT_RCU_WATCHING)) {
 
 		if (!in_nmi())
 			rcu_task_enter();
 
+		/*
+		 * RCU isn't watching, so we're one of
+		 * CT_STATE_IDLE
+		 * CT_STATE_USER
+		 * CT_STATE_GUEST
+		 * guest/user entry is handled by ct_user_enter(), so this has
+		 * to be idle entry.
+		 */
+		WARN_ON_ONCE((curr_state & CT_STATE_MASK) != CT_STATE_IDLE);
+
 		// RCU is not watching here ...
-		ct_kernel_enter_state(CT_RCU_WATCHING);
+		ct_kernel_enter_state(CT_RCU_WATCHING +
+				      CT_STATE_KERNEL -
+				      CT_STATE_IDLE);
 		// ... but is watching here.
 
 		instrumentation_begin();
-- 
2.43.0


