Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E7768DF0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572758.896791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNAO-0005an-JJ; Mon, 31 Jul 2023 07:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572758.896791; Mon, 31 Jul 2023 07:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNAO-0005YJ-GL; Mon, 31 Jul 2023 07:18:08 +0000
Received: by outflank-mailman (input) for mailman id 572758;
 Mon, 31 Jul 2023 07:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQN2u-00082R-Uc
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:10:24 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 515b0ea7-2f71-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 09:10:24 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:10:15 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 00:10:14 -0700
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
X-Inumbo-ID: 515b0ea7-2f71-11ee-b254-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690787424; x=1722323424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gEY4ZGGaaQpe3vscglEO/Z/ZNgQa2ejE/Ek77q9vAj0=;
  b=UnFfQfnNJscnWT6RKTRE2tctXo5xUHWP0H+pc6ZuyywJjgV+/VrFyVuU
   3ljOHSVdPG8Zax0j1k2o93t75U31HpW1VlAxqCC759PaAjAElCjZTiRmr
   j77KUko2fnya6nkxyv/PcRWroNtlUUJPIhcIOnoXcAE71Y+VV8Hx6MoXu
   nDim3MZ0Nz08nVaEsXagIGCqhMWf8Aczs1949SE/gN6KJeuBRiBM6IUZr
   S3mQ/PdYh55/4mJc1TyxDWM5syVn6jCUh273vHVrPI9w+JzQHV2pFkEwT
   x0qBU5TnInRLUp25I0Ch4V1XCzwwgelIqRj7LL0n1WVegv1d03VclrMSh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="432750287"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="432750287"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="798157816"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="798157816"
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
	Jiaxi Chen <jiaxi.chen@linux.intel.com>,
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
Subject: [PATCH v9 36/36] x86/fred: Disable FRED by default in its early stage
Date: Sun, 30 Jul 2023 23:41:33 -0700
Message-Id: <20230731064133.3881-7-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731064133.3881-1-xin3.li@intel.com>
References: <20230731064133.3881-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable FRED by default in its early stage.

To enable FRED, a new kernel command line option "fred" needs to be added.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v7:
* Add a log message when FRED is enabled.
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 arch/x86/kernel/cpu/common.c                    | 3 +++
 arch/x86/kernel/fred.c                          | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..cb12decfcdc0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1513,6 +1513,10 @@
 			Warning: use of this parameter will taint the kernel
 			and may cause unknown problems.
 
+	fred
+			Forcefully enable flexible return and event delivery,
+			which is otherwise disabled by default.
+
 	ftrace=[tracer]
 			[FTRACE] will set and start the specified tracer
 			as early as possible in order to facilitate early
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index b34a8a138755..38cf4f64a56e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1451,6 +1451,9 @@ static void __init cpu_parse_early_param(void)
 	char *argptr = arg, *opt;
 	int arglen, taint = 0;
 
+	if (!cmdline_find_option_bool(boot_command_line, "fred"))
+		setup_clear_cpu_cap(X86_FEATURE_FRED);
+
 #ifdef CONFIG_X86_32
 	if (cmdline_find_option_bool(boot_command_line, "no387"))
 #ifdef CONFIG_MATH_EMULATION
diff --git a/arch/x86/kernel/fred.c b/arch/x86/kernel/fred.c
index 7fdf79c964a8..a4a726ea9fc2 100644
--- a/arch/x86/kernel/fred.c
+++ b/arch/x86/kernel/fred.c
@@ -8,6 +8,9 @@
 
 void cpu_init_fred_exceptions(void)
 {
+	/* When FRED is enabled by default, this log message may not needed */
+	pr_info("Initialize FRED on CPU%d\n", smp_processor_id());
+
 	wrmsrl(MSR_IA32_FRED_CONFIG,
 	       /* Reserve for CALL emulation */
 	       FRED_CONFIG_REDZONE |
-- 
2.34.1


