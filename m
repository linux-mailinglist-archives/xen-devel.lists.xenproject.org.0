Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27745A10F14
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 19:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871904.1282902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlI4-00046h-1q; Tue, 14 Jan 2025 18:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871904.1282902; Tue, 14 Jan 2025 18:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlI3-00044d-Ur; Tue, 14 Jan 2025 18:05:23 +0000
Received: by outflank-mailman (input) for mailman id 871904;
 Tue, 14 Jan 2025 18:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Qro=UG=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tXlI2-0002j5-Ka
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 18:05:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e6dd968-d2a2-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 19:05:21 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-8ogZguOiNnCawOG8JxolMw-1; Tue,
 14 Jan 2025 13:05:15 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0F9F1956050; Tue, 14 Jan 2025 18:05:11 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
 with ESMTPS id DFA25195608A; Tue, 14 Jan 2025 18:04:49 +0000 (UTC)
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
X-Inumbo-ID: 1e6dd968-d2a2-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBnzPr+bF01eZ/FcGt3b6YBzs+ceSVKdSHsMFlRMR5E=;
	b=T/Au40gFQxYBonlC4vGKMMsMz3qKg/AlgJUJ/VZiksPljqVurqVg1toKahXVWVejkSSFJL
	9Rp9eGuHVJgw3kjR0WX4Vh7FW1lec6QFV86KFWOb3xNyFuQtEUY9bWL12T9y/YwZw0bdoR
	f05IcEGSy05xRvh4+9egEa0aDcylGjk=
X-MC-Unique: 8ogZguOiNnCawOG8JxolMw-1
X-Mimecast-MFC-AGG-ID: 8ogZguOiNnCawOG8JxolMw
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
Subject: [PATCH v4 30/30] context-tracking: Add a Kconfig to enable IPI deferral for NO_HZ_IDLE
Date: Tue, 14 Jan 2025 18:51:43 +0100
Message-ID: <20250114175143.81438-31-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

With NO_HZ_IDLE, we get CONTEXT_TRACKING_IDLE, so we get these
transitions:

  ct_idle_enter()
    ct_kernel_exit()
      ct_state_inc_clear_work()

  ct_idle_exit()
    ct_kernel_enter()
      ct_work_flush()

With just CONTEXT_TRACKING_IDLE, ct_state_inc_clear_work() is just
ct_state_inc() and ct_work_flush() is a no-op. However, making them be
functional as if under CONTEXT_TRACKING_WORK would allow NO_HZ_IDLE to
leverage IPI deferral to keep idle CPUs idle longer.

Having this enabled for NO_HZ_IDLE is a different argument than for having
it for NO_HZ_FULL (power savings vs latency/performance), but the backing
mechanism is identical.

Add a default-no option to enable IPI deferral with NO_HZ_IDLE.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/time/Kconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7e8106a0d981f..c7398fe5382a0 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -183,9 +183,23 @@ config CONTEXT_TRACKING_USER_FORCE
 
 config CONTEXT_TRACKING_WORK
 	bool
-	depends on HAVE_CONTEXT_TRACKING_WORK && CONTEXT_TRACKING_USER
+	depends on HAVE_CONTEXT_TRACKING_WORK && (CONTEXT_TRACKING_USER || CONTEXT_TRACKING_WORK_IDLE)
 	default y
 
+config CONTEXT_TRACKING_WORK_IDLE
+       bool
+       depends on HAVE_CONTEXT_TRACKING_WORK && CONTEXT_TRACKING_IDLE && !CONTEXT_TRACKING_USER
+       default n
+       help
+	 This option enables deferral of some IPIs when they are targeted at CPUs
+	 that are idle. This can help keep CPUs idle longer, but induces some
+	 extra overhead to idle <-> kernel transitions and to IPI sending.
+
+	 Say Y if the power improvements are worth more to you than the added
+	 overheads.
+
+	 Say N otherwise.
+
 config NO_HZ
 	bool "Old Idle dynticks config"
 	help
-- 
2.43.0


