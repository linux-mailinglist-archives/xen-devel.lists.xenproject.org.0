Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B06351344
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104284.199285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuQY-0000ke-K7; Thu, 01 Apr 2021 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104284.199285; Thu, 01 Apr 2021 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuQY-0000kD-Gl; Thu, 01 Apr 2021 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 104284;
 Thu, 01 Apr 2021 10:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuQW-0000k1-GV
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:19:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac7ed814-87d3-4e11-827f-e838f7f435b3;
 Thu, 01 Apr 2021 10:19:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0B5DAEAE;
 Thu,  1 Apr 2021 10:19:46 +0000 (UTC)
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
X-Inumbo-ID: ac7ed814-87d3-4e11-827f-e838f7f435b3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQq09dPyj92+Q29K/+2WpJlVyL1zFTQmPSHsHxroQCM=;
	b=asLWaYr+GzD+ctulBCqcr5J1Pe6NlJBNsZZSHGyEMskY7CGokeFC6ereCgztYhN+LJS5L3
	iqA17xOzmzD6PcwQkMoN6dtghYvW8jzyEIXEpbYh67YB99mimu85p+6KWTfPEUHTI6Li/s
	7EL87fAUJW/u9aIMMBtOnW+gEv4oo4k=
Subject: [PATCH 02/23] lib: move 64-bit div/mod compiler helpers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <0fec827f-bb0b-4ea1-7757-9c27e9138be7@suse.com>
Date: Thu, 1 Apr 2021 12:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These were built for 32-bit architectures only (the same code could,
with some tweaking, sensibly be used to provide TI-mode helpers on
64-bit arch-es) - retain this property, while still avoiding to have
a CU without any contents at all. For this, Arm's CONFIG_64BIT gets
generalized.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/Kconfig                   |  2 ++
 xen/arch/arm/Kconfig               | 12 +++---------
 xen/arch/x86/Kconfig               |  1 +
 xen/common/Makefile                |  1 -
 xen/lib/Makefile                   |  4 ++++
 xen/{common/lib.c => lib/divmod.c} |  2 --
 6 files changed, 10 insertions(+), 12 deletions(-)
 rename xen/{common/lib.c => lib/divmod.c} (99%)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index d144d4c8d3ee..f16eb0df43af 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,3 +1,5 @@
+config 64BIT
+	bool
 
 config NR_CPUS
 	int "Maximum number of CPUs"
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 330bbf6232d4..ecfa6822e4d3 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,17 +1,11 @@
-config 64BIT
-	bool
-	default "$(ARCH)" != "arm32"
-	help
-	  Say yes to build a 64-bit Xen
-	  Say no to build a 32-bit Xen
-
 config ARM_32
 	def_bool y
-	depends on !64BIT
+	depends on "$(ARCH)" = "arm32"
 
 config ARM_64
 	def_bool y
-	depends on 64BIT
+	depends on !ARM_32
+	select 64BIT
 	select HAS_FAST_MULTIPLY
 
 config ARM
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index f79e6634db3f..4d6911ffa467 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -1,5 +1,6 @@
 config X86_64
 	def_bool y
+	select 64BIT
 
 config X86
 	def_bool y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 71c1d466bd8f..e2a7e62d14bf 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -21,7 +21,6 @@ obj-y += kernel.o
 obj-y += keyhandler.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
-obj-y += lib.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 0b274583ef0b..a5dc1442a422 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -10,3 +10,7 @@ lib-y += rbtree.o
 lib-y += sort.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
+
+lib32-y := divmod.o
+lib32-$(CONFIG_64BIT) :=
+lib-y += $(lib32-y)
diff --git a/xen/common/lib.c b/xen/lib/divmod.c
similarity index 99%
rename from xen/common/lib.c
rename to xen/lib/divmod.c
index 5b8f49153dad..0be6ccc70096 100644
--- a/xen/common/lib.c
+++ b/xen/lib/divmod.c
@@ -40,7 +40,6 @@
  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  * SUCH DAMAGE.
  */
-#if BITS_PER_LONG == 32
 
 /*
  * Depending on the desired operation, we view a `long long' (aka quad_t) in
@@ -391,7 +390,6 @@ s64 __ldivmod_helper(s64 a, s64 b, s64 *r)
     else
         return quot;
 }
-#endif /* BITS_PER_LONG == 32 */
 
 /*
  * Local variables:


