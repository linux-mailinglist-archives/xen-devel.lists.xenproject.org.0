Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A676BDEF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 21:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574484.899789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvCu-00022f-Im; Tue, 01 Aug 2023 19:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574484.899789; Tue, 01 Aug 2023 19:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvCu-00020L-G1; Tue, 01 Aug 2023 19:39:00 +0000
Received: by outflank-mailman (input) for mailman id 574484;
 Tue, 01 Aug 2023 19:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cbQ=DS=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qQvCq-00020F-C4
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 19:38:59 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c77ad8d-30a3-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 21:38:54 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qQvBp-00Erfk-29; Tue, 01 Aug 2023 19:37:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 01EB0300134;
 Tue,  1 Aug 2023 21:37:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DAE66201BD3C3; Tue,  1 Aug 2023 21:37:50 +0200 (CEST)
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
X-Inumbo-ID: 0c77ad8d-30a3-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XUuRgq2k+Zj7Cps3kG/jmE/mhHsCYkzavBA/LPVkFBs=; b=jllufagrIa/lR21PAk9SYyMhAG
	pQAKupOfSK4Dhh0bm8iu1sQUv9lMhmRfH/zIvVnAM8LOfko59SeoulYg7NALKjJ4L9wG27jLaoCUk
	gVCMqQbB9DVabk0U/daweZJfrGQMpNcCkOCcvsgrPQ4KE5dfmfOj0n2s0xa62dY1PDmFWpMB45jNu
	LOPPbQsrn054suZVnJ1EWOzTD5AT5eORcFhvn29qDMNKwPt8+TQatJHQzhZXvfRyi4ozGOpj7FuWL
	cOM24LcfEIScuEycHMT/AYoj4Clhch0kIau5XVicK1eYoms8Rz55EE4BCNn7jkt3fSY6vPg3byZad
	2AEwkPlg==;
Date: Tue, 1 Aug 2023 21:37:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kim Phillips <kim.phillips@amd.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>, Jim Mattson <jmattson@google.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	Nikunj A Dadhania <nikunj@amd.com>, Brian Gerst <brgerst@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ze Gao <zegao2021@gmail.com>, Fei Li <fei1.li@intel.com>,
	Conghui <conghui.chen@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Jane Malalane <jane.malalane@citrix.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Yantengsi <siyanteng@loongson.cn>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH RESEND v9 33/36] KVM: VMX: Add VMX_DO_FRED_EVENT_IRQOFF
 for IRQ/NMI handling
Message-ID: <20230801193750.GA119080@hirez.programming.kicks-ass.net>
References: <20230801083553.8468-1-xin3.li@intel.com>
 <20230801083553.8468-7-xin3.li@intel.com>
 <ZMlWe5TgS6HM98Mg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMlWe5TgS6HM98Mg@google.com>

On Tue, Aug 01, 2023 at 07:01:15PM +0000, Sean Christopherson wrote:
> The spec I have from May 2022 says the NMI bit colocated with CS, not SS.  And
> the cover letter's suggestion to use a search engine to find the spec ain't
> exactly helpful, that just gives me the same "May 2022 Revision 3.0" spec.  So
> either y'all have a spec that I can't find, or this is wrong.

https://intel.com/sdm

is a useful shorthand I've recently been told about. On that page is
also "Flexible Return and Event Delivery Specification", when clicked it
will gift you a FRED v5.0 PDF.

