Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0517F48EC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 15:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638784.995707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCh-0001DX-4n; Wed, 22 Nov 2023 14:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638784.995707; Wed, 22 Nov 2023 14:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCh-0001Bn-1w; Wed, 22 Nov 2023 14:27:47 +0000
Received: by outflank-mailman (input) for mailman id 638784;
 Wed, 22 Nov 2023 14:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5oCf-0000hs-AK
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 14:27:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c53bd41-8943-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 15:27:43 +0100 (CET)
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
X-Inumbo-ID: 4c53bd41-8943-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700663263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eWMLgFqdH7Iqx1Wkq82bGSFuLQyTpCILNGF4xDEO1u4=;
  b=DBWCxsaPC5lJm579Pz5pRGLAfLMzxAxiLwo3TgX2m5tbzxX1TN3z1ScE
   QW5jTdQIHBc2PWYFxjYdjRoZHwDG3J3jhy8jmsnXu/Bxe6gDccykTWBL+
   Ov3iKD8GlVz70J2+PGO80405Xp6M4k9pZ51oi/WwU/21W6nJGO27NOuIQ
   g=;
X-CSE-ConnectionGUID: FUgGcfvZQFCj8jqu50I/5A==
X-CSE-MsgGUID: hLgLiIS5RtaW7Gp6T0LDYA==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128715171
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:6gJkG6J6jIvPL61EFE+R7ZUlxSXFcZb7ZxGr2PjKsXjdYENS32BVx
 jAXCm3TPvaINGf2KY9zOo/i8UoHvJWEmtRkHgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4mhB5wZkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5ZPG5h/
 vIGGgkjRRLThfurneqaDbRF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQFZoMwx/H/
 woq+Uz5Jh4+Nf2klACZ+03zqfeRoXvfdLM7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaETISJ2IYeShCRwIK5dD5qak5kx3UQ9BsVqWyi7XdHzD7x
 DSD6jYzm68Si88j3bi05l3BjHSnoZ2hZhU04wLRUySv5wd9bZSkYaSi9FfA4PBPao2eSzG8U
 GMswpbEqrpUVNfUyX3LH71l8KyVC+itHgDTrlVhAasY2R+vq3y6YN0IwXYjDRI8WiobQgMFc
 HM/qCsIu8cLYSvwMPAnC79dHfjG2kQJKDgEahw3RoAXCnSJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWXuH7pMiOF2lnlnmQs/oKwXKTz9idJyg1bMGd843KamNLhlvMtoXi2Jm
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMCo9Muu0BsYkxZ/5VAR1VWuVN7EYSd7HxM8im1EfJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:r8OLvKwBVcJSKZ6qGAXwKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:2Q93Tm7BhUCpEmGqxtss2nMbNcsrbE/k4lzSc02hFDsxafrIYArF
X-Talos-MUID: 9a23:NwbsOwZTMpX6guBTtxvjoDBDD5pS/62RV28Vz6len+W1HHkl
X-IronPort-AV: E=Sophos;i="6.04,219,1695700800"; 
   d="scan'208";a="128715171"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>
Subject: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
Date: Wed, 22 Nov 2023 14:27:33 +0000
Message-ID: <20231122142733.1818331-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The differences between inline, __inline and __inline__ keywords are a
vestigial remnant of older C standards, and in Xen we use inline almost
exclusively.

Replace __inline and __inline__ with regular inline, and remove their
exceptions from the MISRA configuration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>

I'm entirely guessing at the Eclair configuration.
---
 .../eclair_analysis/ECLAIR/toolchain.ecl      |  6 +++---
 docs/misra/C-language-toolchain.rst           |  2 +-
 xen/arch/x86/include/asm/apic.h               | 20 +++++++++----------
 xen/include/acpi/cpufreq/cpufreq.h            |  4 ++--
 xen/include/xen/bitops.h                      |  4 ++--
 xen/include/xen/compiler.h                    |  7 +++----
 6 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index e6cd289b5e92..71a1e2cce029 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -15,7 +15,7 @@
     _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
     asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
     __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
-    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
+    __const__ : see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
     typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
     __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and \"6.44 Determining the Alignment of Functions, Types or Variables\" of "GCC_MANUAL".
     __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL".
@@ -23,8 +23,8 @@
     __builtin_va_arg: non-documented GCC extension.
     __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
 "
--config=STD.tokenext,behavior+={c99, GCC_ARM64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
--config=STD.tokenext,behavior+={c99, GCC_X86_64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|__inline|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
+-config=STD.tokenext,behavior+={c99, GCC_ARM64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
+-config=STD.tokenext,behavior+={c99, GCC_X86_64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
 -doc_end
 
 -doc_begin="Non-documented GCC extension."
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 2866cb191b1a..b7c2000992ac 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -84,7 +84,7 @@ The table columns are as follows:
           see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
        __volatile__:
           see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
-       __const__, __inline__, __inline:
+       __const__:
           see Section "6.48 Alternate Keywords" of GCC_MANUAL.
        typeof, __typeof__:
           see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 486d689478b2..b20fae7ebc6a 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -49,12 +49,12 @@ const struct genapic *apic_x2apic_probe(void);
  * Basic functions accessing APICs.
  */
 
-static __inline void apic_mem_write(unsigned long reg, u32 v)
+static inline void apic_mem_write(unsigned long reg, u32 v)
 {
 	*((volatile u32 *)(APIC_BASE+reg)) = v;
 }
 
-static __inline u32 apic_mem_read(unsigned long reg)
+static inline u32 apic_mem_read(unsigned long reg)
 {
 	return *((volatile u32 *)(APIC_BASE+reg));
 }
@@ -63,7 +63,7 @@ static __inline u32 apic_mem_read(unsigned long reg)
  * access the 64-bit ICR register.
  */
 
-static __inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
+static inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
 {
     if (reg == APIC_DFR || reg == APIC_ID || reg == APIC_LDR ||
         reg == APIC_LVR)
@@ -72,7 +72,7 @@ static __inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
     wrmsrl(MSR_X2APIC_FIRST + (reg >> 4), msr_content);
 }
 
-static __inline uint64_t apic_rdmsr(unsigned long reg)
+static inline uint64_t apic_rdmsr(unsigned long reg)
 {
     uint64_t msr_content;
 
@@ -83,7 +83,7 @@ static __inline uint64_t apic_rdmsr(unsigned long reg)
     return msr_content;
 }
 
-static __inline void apic_write(unsigned long reg, u32 v)
+static inline void apic_write(unsigned long reg, u32 v)
 {
 
     if ( x2apic_enabled )
@@ -92,7 +92,7 @@ static __inline void apic_write(unsigned long reg, u32 v)
         apic_mem_write(reg, v);
 }
 
-static __inline u32 apic_read(unsigned long reg)
+static inline u32 apic_read(unsigned long reg)
 {
     if ( x2apic_enabled )
         return apic_rdmsr(reg);
@@ -100,7 +100,7 @@ static __inline u32 apic_read(unsigned long reg)
         return apic_mem_read(reg);
 }
 
-static __inline u64 apic_icr_read(void)
+static inline u64 apic_icr_read(void)
 {
     u32 lo, hi;
 
@@ -115,7 +115,7 @@ static __inline u64 apic_icr_read(void)
     return ((u64)lo) | (((u64)hi) << 32);
 }
 
-static __inline void apic_icr_write(u32 low, u32 dest)
+static inline void apic_icr_write(u32 low, u32 dest)
 {
     if ( x2apic_enabled )
         apic_wrmsr(APIC_ICR, low | ((uint64_t)dest << 32));
@@ -126,13 +126,13 @@ static __inline void apic_icr_write(u32 low, u32 dest)
     }
 }
 
-static __inline bool apic_isr_read(uint8_t vector)
+static inline bool apic_isr_read(uint8_t vector)
 {
     return (apic_read(APIC_ISR + ((vector & ~0x1f) >> 1)) >>
             (vector & 0x1f)) & 1;
 }
 
-static __inline u32 get_apic_id(void) /* Get the physical APIC id */
+static inline u32 get_apic_id(void)
 {
     u32 id = apic_read(APIC_ID);
     return x2apic_enabled ? id : GET_xAPIC_ID(id);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index b0c860f0ec21..3456d4c95f98 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -148,7 +148,7 @@ extern int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag);
 extern int cpufreq_update_turbo(int cpuid, int new_state);
 extern int cpufreq_get_turbo_status(int cpuid);
 
-static __inline__ int 
+static inline int
 __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
     return policy->governor->governor(policy, event);
@@ -179,7 +179,7 @@ extern struct cpufreq_driver cpufreq_driver;
 
 int cpufreq_register_driver(const struct cpufreq_driver *);
 
-static __inline__
+static inline
 void cpufreq_verify_within_limits(struct cpufreq_policy *policy,
                                   unsigned int min, unsigned int max)
 {
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index edd6817d5356..a88d45475c40 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -127,7 +127,7 @@ static inline int generic_fls64(__u64 x)
 # endif
 #endif
 
-static __inline__ int get_bitmask_order(unsigned int count)
+static inline int get_bitmask_order(unsigned int count)
 {
     int order;
     
@@ -135,7 +135,7 @@ static __inline__ int get_bitmask_order(unsigned int count)
     return order;   /* We could be slightly more clever with -1 here... */
 }
 
-static __inline__ int get_count_order(unsigned int count)
+static inline int get_count_order(unsigned int count)
 {
     int order;
 
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 04b8bc18df0e..16d554f2a593 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -20,9 +20,8 @@
 #define likely(x)     __builtin_expect(!!(x),1)
 #define unlikely(x)   __builtin_expect(!!(x),0)
 
-#define inline        __inline__
-#define always_inline __inline__ __attribute__ ((__always_inline__))
-#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
+#define always_inline inline __attribute__((__always_inline__))
+#define gnu_inline    inline __attribute__((__gnu_inline__))
 #define noinline      __attribute__((__noinline__))
 
 #define noreturn      __attribute__((__noreturn__))
@@ -83,7 +82,7 @@
  * inline functions not expanded inline get placed in .init.text.
  */
 #include <xen/init.h>
-#define __inline__ __inline__ __init
+#define inline inline __init
 #endif
 
 #define __attribute_pure__  __attribute__((__pure__))
-- 
2.30.2


