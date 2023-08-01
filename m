Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816D76AB9F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573845.898833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGX-00064e-AK; Tue, 01 Aug 2023 09:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573845.898833; Tue, 01 Aug 2023 09:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGX-0005yb-2K; Tue, 01 Aug 2023 09:02:05 +0000
Received: by outflank-mailman (input) for mailman id 573845;
 Tue, 01 Aug 2023 09:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlGV-0005CK-HQ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:02:03 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1464ee31-304a-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:02:02 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:01:57 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 02:01:56 -0700
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
X-Inumbo-ID: 1464ee31-304a-11ee-b259-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880522; x=1722416522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ks9fQ3QR6UqRMocjQpLz+yk1iYvQPVTbiFl2BDd8yPg=;
  b=NAPIbyZIKv5DrR7BPINGcZPR/dmN67i6cSKgYGGqixiyqI+NoGjojH9z
   PRn9oAvSZiQjd0NJ+OpU36zPManyXRvKv7UBrX4OjenF2fB2uD2TKUdDo
   5S5sfQEi1QEwDO78xWuj6ZXGQLgsyla6QRO9+w5Ru12vC8cQvLquTebNK
   K2E8CL7KG+aiawEm+W21PestMYHBuWuNBITr8IRzqW/50sFEsuszSeLHT
   /RsjhDHThtV0OLY+LmtWberNvm1JlbVDJyqwVeAjumoqfvs6PeWREF3cb
   /gOMFkSpuevXgmECORWuq2gpAq97W3LQkpKI36ShhzEZ+XGICazpUeXFz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433082268"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433082268"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975216979"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975216979"
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
Subject: [PATCH RESEND v9 07/36] x86/cpu: Add X86_CR4_FRED macro
Date: Tue,  1 Aug 2023 01:32:49 -0700
Message-Id: <20230801083318.8363-8-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083318.8363-1-xin3.li@intel.com>
References: <20230801083318.8363-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add X86_CR4_FRED macro for the FRED bit in %cr4. This bit should be a
pinned bit, not to be changed after initialization.

CR4 macros are defined in arch/x86/include/uapi/asm/processor-flags.h,
which is uapi, and thus cannot depend on CONFIG_X86_64.

Using _BITUL() causes build errors on 32 bits, and there is no
guarantee that user space applications (e.g. something like Qemu)
might not want to use this declaration even when building for i386 or
x32.

However, %cr4 is a machine word (unsigned long), so to avoid build
warnings on 32 bits, explicitly cast the value to unsigned long,
truncating upper 32 bits.

The other alternative would be to use CONFIG_X86_64 around the
definition of cr4_pinned_mask. It is probably not desirable to make
cr4_pinned_mask non-const.

Another option, which may be preferable, to be honest: explicitly
enumerate the CR4 bits which *may* be changed (a whitelist), instead
of the ones that may not. That would be a separate, pre-FRED, patch,
and would automatically resolve this problem as a side effect.

The following flags probably should have been in this set all along,
as they are all controls affecting the kernel runtime environment as
opposed to user space:

X86_CR4_DE, X86_CR4_PAE, X86_CR4_PSE, X86_CR4_MCE, X86_CR4_PGE,
X86_CR4_OSFXSR, X86_CR4_OSXMMEXCPT, X86_CR4_LA57, X86_CR4_PCIDE,
X86_CR4_LAM_SUP

Possibly X86_CR4_VMXE as well, which seems harmless even if KVM is
not loaded; X86_CR4_PKE can be fixed as long as the PKE configuration
registers are at least initialized to disabled.

It is relatively simple to do an audit of which flags are allowed to
be modified at runtime and whitelist only those. There is no reason
why we should allow bits in CR4 to be toggled by default.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/uapi/asm/processor-flags.h | 2 ++
 arch/x86/kernel/cpu/common.c                | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/uapi/asm/processor-flags.h b/arch/x86/include/uapi/asm/processor-flags.h
index d898432947ff..ce08c2ca70b5 100644
--- a/arch/x86/include/uapi/asm/processor-flags.h
+++ b/arch/x86/include/uapi/asm/processor-flags.h
@@ -138,6 +138,8 @@
 #define X86_CR4_CET		_BITUL(X86_CR4_CET_BIT)
 #define X86_CR4_LAM_SUP_BIT	28 /* LAM for supervisor pointers */
 #define X86_CR4_LAM_SUP		_BITUL(X86_CR4_LAM_SUP_BIT)
+#define X86_CR4_FRED_BIT	32 /* enable FRED kernel entry */
+#define X86_CR4_FRED		_BITULL(X86_CR4_FRED_BIT)
 
 /*
  * x86-64 Task Priority Register, CR8
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 0ba1067f4e5f..331b06d19f7f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -402,8 +402,9 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
 
 /* These bits should not change their value after CPU init is finished. */
 static const unsigned long cr4_pinned_mask =
-	X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
-	X86_CR4_FSGSBASE | X86_CR4_CET;
+	(unsigned long)
+	(X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
+	 X86_CR4_FSGSBASE | X86_CR4_CET | X86_CR4_FRED);
 static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
 static unsigned long cr4_pinned_bits __ro_after_init;
 
-- 
2.34.1


