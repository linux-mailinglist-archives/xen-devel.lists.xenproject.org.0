Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA3A17F57
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 15:02:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875451.1285900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taEpa-00041b-To; Tue, 21 Jan 2025 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875451.1285900; Tue, 21 Jan 2025 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taEpa-0003tf-Oc; Tue, 21 Jan 2025 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 875451;
 Tue, 21 Jan 2025 14:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LsX=UN=kernel.org=frederic@srs-se1.protection.inumbo.net>)
 id 1taEns-0003cS-J2
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 14:00:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff333d8-d800-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 15:00:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23A275C58A7;
 Tue, 21 Jan 2025 13:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C8CC4CEE0;
 Tue, 21 Jan 2025 14:00:22 +0000 (UTC)
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
X-Inumbo-ID: 0ff333d8-d800-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737468023;
	bh=Q5S9rJetTl9cgCroBUGkg7SOjKEl71T4cDyTy00Ssfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXH6cakOFkqIb5zaMucRt18L87yvpwVZGaJxUhREOt4P68rgom62uMZqy68vIiJxY
	 vC1cXMrRMcOwMAfmuxLEZ5bndo3NE4WwazkktDRZnaa3oxsql1H5GUr7t+fwMIx0bz
	 XkAJkUT9nkasLdUoZuBKZrBbotzPsLrjgcHMO3sqMz38POYs+eMlsXPGM73jQ0n8iK
	 MmzoQzjKnN6ACmqf4QPGnpglxf6uAX3/BRM7U3tqtHBoHNE7h6KqKMl22hpV4arvIi
	 4EBHxuw1qzMJUStZM7S/rcVySHrJR+84rbhK+Ss3scFXmd7IzHbUAqqT0NZChxotoD
	 A/lQ8LRjiOvEw==
Date: Tue, 21 Jan 2025 15:00:20 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
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
Subject: Re: [PATCH v4 04/30] rcutorture: Make TREE04 use
 CONFIG_RCU_DYNTICKS_TORTURE
Message-ID: <Z4-odFAImP-_uLV7@localhost.localdomain>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-5-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114175143.81438-5-vschneid@redhat.com>

Le Tue, Jan 14, 2025 at 06:51:17PM +0100, Valentin Schneider a écrit :
> We now have an RCU_EXPERT config for testing small-sized RCU dynticks
> counter:  CONFIG_RCU_DYNTICKS_TORTURE.
> 
> Modify scenario TREE04 to exercise to use this config in order to test a
> ridiculously small counter (2 bits).
> 
> Link: http://lore.kernel.org/r/4c2cb573-168f-4806-b1d9-164e8276e66a@paulmck-laptop
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> ---
>  tools/testing/selftests/rcutorture/configs/rcu/TREE04 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE04 b/tools/testing/selftests/rcutorture/configs/rcu/TREE04
> index dc4985064b3ad..67caf4276bb01 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/TREE04
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE04
> @@ -16,3 +16,4 @@ CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
>  CONFIG_RCU_EXPERT=y
>  CONFIG_RCU_EQS_DEBUG=y
>  CONFIG_RCU_LAZY=y
> +CONFIG_RCU_DYNTICKS_TORTURE=y

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>


> -- 
> 2.43.0
> 
> 

