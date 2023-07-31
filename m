Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F4768CE5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572626.896471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvj-0001kb-UC; Mon, 31 Jul 2023 07:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572626.896471; Mon, 31 Jul 2023 07:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvj-0001Xs-N8; Mon, 31 Jul 2023 07:02:59 +0000
Received: by outflank-mailman (input) for mailman id 572626;
 Mon, 31 Jul 2023 07:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQMut-0000iu-99
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:02:07 +0000
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2523ab9f-2f70-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:02:03 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:01:51 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 00:01:52 -0700
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
X-Inumbo-ID: 2523ab9f-2f70-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690786923; x=1722322923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7IEqijDovSKiraXkZB5AveXiayuWDixrga5p5CTJEmM=;
  b=i9EXzr/ww56BPCr/DQJVGab5LZ8bJp/Wn0m1gguF5F8X0hhE8eX5w9BS
   dCZuuTcVLbGZyhkrTbJuSEVlRzJYNBHYvixzs/X8cuwJUDutpLVXdh2a3
   EWHikuA8PSeUNMQI7EoeaQx3/Mu3JYysITLxkITyTq3p0DP9+LL/1Ehga
   quqSTjn+N0eA9seVz/d4f4UZ54P6uSsLcPj1tqAxUK6DUTDAIMkluZ8wp
   eohEwjDXtpRfHc0+eC4GXDzp/4WB/m5HHsH7B2vLHT6tM/q8+0kLhZPb7
   t5shmpULDq3JF9f5+RDou3AHAsRkVSIAnNUvD3QxmBa18jBSuaCDIo8UL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371648631"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371648631"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871543342"
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
Subject: [PATCH v9 02/36] x86/fred: Add Kconfig option for FRED (CONFIG_X86_FRED)
Date: Sun, 30 Jul 2023 23:32:43 -0700
Message-Id: <20230731063317.3720-3-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add the configuration option CONFIG_X86_FRED to enable FRED.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7422db409770..700d94cb8330 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -494,6 +494,15 @@ config X86_CPU_RESCTRL
 
 	  Say N if unsure.
 
+config X86_FRED
+	bool "Flexible Return and Event Delivery"
+	depends on X86_64
+	help
+	  When enabled, try to use Flexible Return and Event Delivery
+	  instead of the legacy SYSCALL/SYSENTER/IDT architecture for
+	  ring transitions and exception/interrupt handling if the
+	  system supports.
+
 if X86_32
 config X86_BIGSMP
 	bool "Support for big SMP systems with more than 8 CPUs"
-- 
2.34.1


