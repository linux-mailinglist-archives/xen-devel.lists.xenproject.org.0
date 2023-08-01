Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBAD76AB98
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573846.898851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGY-0006bp-R5; Tue, 01 Aug 2023 09:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573846.898851; Tue, 01 Aug 2023 09:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlGY-0006Uz-HG; Tue, 01 Aug 2023 09:02:06 +0000
Received: by outflank-mailman (input) for mailman id 573846;
 Tue, 01 Aug 2023 09:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlGW-0005E5-Cy
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:02:04 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 144f88ca-304a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:02:02 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:01:56 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 02:01:55 -0700
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
X-Inumbo-ID: 144f88ca-304a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880522; x=1722416522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+857ZiZ3kYB9kvyULHXUrCarfExj5Gil+GQ461ib92M=;
  b=Bhy1h6qqrKd+OmXALsrai/YGgiWTzzDS40jbpoRHJA+m8jg/vgxHjnwL
   UtnlVosFoAGcw78zS39r3otzyIc2+rbsVTvuxA50kgHjEwAK0JM8vsNsy
   xiYypTA4w3eXM9cc6WKQggzxhDWhqEXVpMs3Slhec7rlUafQBu8lgfkB2
   iq83vVmrqGPjipG0eTaCjlJStOhNTgGCkbYqxhmiM3e1oC7wpjHprlYK4
   T+D9zk+Qv0hRB2bRpfom7Lri0sbaeYgr54qYA0fUjOCo0JY5pXRfuHAf/
   wUauIm2QfbpIeKAMHdyEbFt0G9sVuLuQiI5j4TerFhKNxBu4SbqwqvATZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433082232"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433082232"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975216976"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975216976"
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
Subject: [PATCH RESEND v9 06/36] x86/objtool: Teach objtool about ERETU and ERETS
Date: Tue,  1 Aug 2023 01:32:48 -0700
Message-Id: <20230801083318.8363-7-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083318.8363-1-xin3.li@intel.com>
References: <20230801083318.8363-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Update the objtool decoder to know about the ERETU and ERETS
instructions (type INSN_CONTEXT_SWITCH).

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 tools/objtool/arch/x86/decode.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 2e1caabecb18..a486485cff20 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -509,11 +509,20 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 		if (op2 == 0x01) {
 
-			if (modrm == 0xca)
-				insn->type = INSN_CLAC;
-			else if (modrm == 0xcb)
-				insn->type = INSN_STAC;
-
+			switch (insn_last_prefix_id(&ins)) {
+			case INAT_PFX_REPE:
+			case INAT_PFX_REPNE:
+				if (modrm == 0xca)
+					/* eretu/erets */
+					insn->type = INSN_CONTEXT_SWITCH;
+				break;
+			default:
+				if (modrm == 0xca)
+					insn->type = INSN_CLAC;
+				else if (modrm == 0xcb)
+					insn->type = INSN_STAC;
+				break;
+			}
 		} else if (op2 >= 0x80 && op2 <= 0x8f) {
 
 			insn->type = INSN_JUMP_CONDITIONAL;
-- 
2.34.1


