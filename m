Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA276ABB9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573857.898941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGl-00010F-EZ; Tue, 01 Aug 2023 09:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573857.898941; Tue, 01 Aug 2023 09:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGk-0000ff-3r; Tue, 01 Aug 2023 09:02:18 +0000
Received: by outflank-mailman (input) for mailman id 573857;
 Tue, 01 Aug 2023 09:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlGd-0005E5-FH
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:02:11 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 187f4a42-304a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:02:09 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:02:07 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 02:02:06 -0700
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
X-Inumbo-ID: 187f4a42-304a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880529; x=1722416529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1h9fTPNcW28O8bu/nclSFH4GxPR5CW0Rl9/PbASKNuY=;
  b=B/5TJEGb5N9Rz832QXoRF6k0AltwEf+rz1bdXMvotOzbLPZF4cOY1Jz1
   8pKtxnJjDs8lHbGjLdxv32BZ17kGlObkUqRAt6UAlsmoLKEoFwfkYhiCl
   nM7bi0vblRGfRtkmrmfW9A0cHlZ/YD1xXHeFSGwNiwQw836EtvZ2yzjHt
   OFxN1Y4Nwy+AcVl3R0cnPgFG0NX6fAdiKhBdZ2G+vzCY40nlhyZJWHTiU
   qdnvKjJFBWtJ5TAJMSZvewiw53a8zBdKhl7UgpdElHtU6VF9NDjNmxa0D
   r+vLCF12nJphny0QnH1iIq1/GXu3uLxh6MjO/fO/8Vphzio0LfA58nW3H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433082610"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433082610"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975217056"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975217056"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kim Phillips <kim.phillips@amd.com>,
	Xin Li <xin3.li@intel.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@Oracle.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Jim Mattson <jmattson@google.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Brian Gerst <brgerst@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ze Gao <zegao2021@gmail.com>,
	Fei Li <fei1.li@intel.com>,
	Conghui <conghui.chen@intel.com>,
	Ashok Raj <ashok.raj@intel.com>,
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
Subject: [PATCH RESEND v9 17/36] x86/fred: Define a common function type fred_handler
Date: Tue,  1 Aug 2023 01:32:59 -0700
Message-Id: <20230801083318.8363-18-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083318.8363-1-xin3.li@intel.com>
References: <20230801083318.8363-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FRED event delivery establishes a full supervisor context by saving
the essential information about an event to a FRED stack frame, e.g.,
the faulting linear address of a #PF is saved as event data of a FRED
stack frame. Thus a struct pt_regs has all the needed data to handle
an event and it's the only input argument of a FRED event handler.

Define fred_handler, a common function type used in the FRED event
dispatch framework, which makes it easier to find the entry points
(via grep), allows the prototype to change if necessary without
requiring changing changes everywhere, and makes sure that all the
entry points have the proper decorations (currently noinstr, but
could change in the future.)

Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/fred.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index d76e681a806f..b45c1bea5b7f 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -68,6 +68,19 @@
 #define FRED_SSX_64_BIT_MODE_BIT	57
 #define FRED_SSX_64_BIT_MODE		_BITUL(FRED_SSX_64_BIT_MODE_BIT)
 
+/*
+ * FRED event delivery establishes a full supervisor context by
+ * saving the essential information about an event to a FRED
+ * stack frame, e.g., the faulting linear address of a #PF is
+ * saved as event data of a FRED #PF stack frame. Thus a struct
+ * pt_regs has all the needed data to handle an event and it's
+ * the only input argument of a FRED event handler.
+ *
+ * FRED handlers need to be placed in the noinstr text section.
+ */
+#define DECLARE_FRED_HANDLER(f) void f (struct pt_regs *regs)
+#define DEFINE_FRED_HANDLER(f) noinstr DECLARE_FRED_HANDLER(f)
+
 #ifdef CONFIG_X86_FRED
 
 #ifndef __ASSEMBLY__
@@ -97,6 +110,8 @@ static __always_inline unsigned long fred_event_data(struct pt_regs *regs)
 	return fred_info(regs)->edata;
 }
 
+typedef DECLARE_FRED_HANDLER((*fred_handler));
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* CONFIG_X86_FRED */
-- 
2.34.1


