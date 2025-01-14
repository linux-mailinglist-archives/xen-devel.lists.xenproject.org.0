Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4953A10EDD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 19:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871828.1282823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlF0-0007Ut-P9; Tue, 14 Jan 2025 18:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871828.1282823; Tue, 14 Jan 2025 18:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXlF0-0007TJ-L5; Tue, 14 Jan 2025 18:02:14 +0000
Received: by outflank-mailman (input) for mailman id 871828;
 Tue, 14 Jan 2025 18:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Qro=UG=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tXlEy-0007Qx-NJ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 18:02:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7e49a9-d2a1-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 19:02:10 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-cs0jRgydMTW_3xbdYVeS2w-1; Tue,
 14 Jan 2025 13:02:03 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E1CD319772CA; Tue, 14 Jan 2025 18:01:45 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
 with ESMTPS id 8F01A195E3EA; Tue, 14 Jan 2025 18:01:23 +0000 (UTC)
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
X-Inumbo-ID: ac7e49a9-d2a1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KdPtt6PQsN+ylVvy58F0NcuUnOqkUWc+oSjD61c8P1k=;
	b=NHQka2a3xWLe7fk7zsz/YQF3jNUinioLx76Cc3vh6FmHptDDS2rAlgLqsHANha/cQvzRzc
	akq+cE32FvV/nM+ZwL8hrQ4efJ9Kkjr5IJAzN1dmu6DHkzp3vXZAwy6Ssowh5eD76SFdEr
	sljkwS6ozl1Xmw10SjBxP8JWIGwSh8E=
X-MC-Unique: cs0jRgydMTW_3xbdYVeS2w-1
X-Mimecast-MFC-AGG-ID: cs0jRgydMTW_3xbdYVeS2w
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
Subject: [PATCH v4 21/30] context_tracking: Explicitely use CT_STATE_KERNEL where it is missing
Date: Tue, 14 Jan 2025 18:51:34 +0100
Message-ID: <20250114175143.81438-22-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

CT_STATE_KERNEL being zero means it can be (and is) omitted in a handful of
places. A later patch will change CT_STATE_KERNEL into a non-zero value,
prepare that by using it where it should be:

o In the initial CT state
o At kernel entry / exit

No change in functionality intended.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/context_tracking.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 938c48952d265..a61498a8425e2 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -31,7 +31,7 @@ DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
 	.nesting = 1,
 	.nmi_nesting = CT_NESTING_IRQ_NONIDLE,
 #endif
-	.state = ATOMIC_INIT(CT_RCU_WATCHING),
+	.state = ATOMIC_INIT(CT_RCU_WATCHING | CT_STATE_KERNEL),
 };
 EXPORT_SYMBOL_GPL(context_tracking);
 
@@ -147,7 +147,7 @@ static void noinstr ct_kernel_exit(bool user, int offset)
 	instrumentation_end();
 	WRITE_ONCE(ct->nesting, 0); /* Avoid irq-access tearing. */
 	// RCU is watching here ...
-	ct_kernel_exit_state(offset);
+	ct_kernel_exit_state(offset - CT_STATE_KERNEL);
 	// ... but is no longer watching here.
 	rcu_task_exit();
 }
@@ -175,7 +175,7 @@ static void noinstr ct_kernel_enter(bool user, int offset)
 	}
 	rcu_task_enter();
 	// RCU is not watching here ...
-	ct_kernel_enter_state(offset);
+	ct_kernel_enter_state(offset + CT_STATE_KERNEL);
 	// ... but is watching here.
 	instrumentation_begin();
 
@@ -537,7 +537,7 @@ void noinstr __ct_user_enter(enum ctx_state state)
 				 * RCU only requires CT_RCU_WATCHING increments to be fully
 				 * ordered.
 				 */
-				raw_atomic_add(state, &ct->state);
+				raw_atomic_add(state - CT_STATE_KERNEL, &ct->state);
 			}
 		}
 	}
@@ -647,7 +647,7 @@ void noinstr __ct_user_exit(enum ctx_state state)
 				 * RCU only requires CT_RCU_WATCHING increments to be fully
 				 * ordered.
 				 */
-				raw_atomic_sub(state, &ct->state);
+				raw_atomic_sub(state - CT_STATE_KERNEL, &ct->state);
 			}
 		}
 	}
-- 
2.43.0


