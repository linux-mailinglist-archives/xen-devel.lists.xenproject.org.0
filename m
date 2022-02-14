Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F294B50D5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271584.466128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauc-0003Hj-PM; Mon, 14 Feb 2022 12:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271584.466128; Mon, 14 Feb 2022 12:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauc-00039K-Fv; Mon, 14 Feb 2022 12:57:02 +0000
Received: by outflank-mailman (input) for mailman id 271584;
 Mon, 14 Feb 2022 12:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauZ-0001Wb-Tq
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:57:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9606d693-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:55 +0100 (CET)
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
X-Inumbo-ID: 9606d693-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sj4Jt6Qi86GvIWajmlKXBFXybjwDfP/78ikZXyhmmlU=;
  b=Y7kW5HibSl3KdYRQF/fSbJxPwlnAR7oxkFMSUdmTK8B2Tj1b90hRNk5x
   H1g8Oxw3Tv/pljALuFGVhKewwFSVpgUukBMaB/a43dILMV+XSTSiRXc4Z
   eCXmKK2sTj8AUrCqGMig77MbXI57qtYu9xzdSCR0ISj1/RZaaRUzVz5Sz
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T3ZvleISg0fcIDCNoPBSn4fFdiIE5ZN1Of8msHm4HwP9rjDGw3/8kUwHCoppwYbF0NXPTuFYq5
 XhJkEsnmFEEGYNO9VyI7mcZ4v48ItQLf5iusNSmTPTL1/M9swOtapgq5sD8oESsc00fWmN9b8u
 MdC1uWcrcR+NdSFVRh/pXuBxNsxtTaXpr/sBhtMu68CglmfhBurzF9Hf9kKE0xpL/nb0EBEUtK
 5UG8yvsCXqBwupfJTPD+5LuCu60Lrm7AcXxP3pe7e2yBKwC8Qo3bEFt9YCNrBK+uNux9bQozCt
 elKK8j9wMOPYhhewDF00XAxn
X-SBRS: 5.1
X-MesageID: 64148581
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WiQv1Kthah/KGO5iXfWROpuHPufnVGlZMUV32f8akzHdYApBsoF/q
 tZmKT2COaqNN2LzeN5yaY+3oxlTvsSAyoAwS1Fk/igwQXtD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmKybGClqEYT3t6c9XgYDNz4lZJIX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5NFOWc/NXwsZTVKKgdQE4hkp9uNhyX0WGR3uUqlr684tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8AKw1CjiYX92CnaJmUbFRpeM4UZ5dBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZb20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvG4udBo0ap9fI1cFh
 XM/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5rUm00HCrWWj+u+2dd7EG3m5EMTXfjew/G7vMbaSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:0zFgi6rR0SBIdGgg/dQHZPYaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148581"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction where possible
Date: Mon, 14 Feb 2022 12:56:28 +0000
Message-ID: <20220214125632.24563-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With altcall, we convert indirect branches into direct ones.  With that
complete, none of the potential targets need an endbr64 instruction.

Furthermore, removing the endbr64 instructions is a security defence-in-depth
improvement, because it limits the options available to an attacker who has
managed to hijack a function pointer.

Introduce new .init.{ro,}data.cf_clobber sections.  Have _apply_alternatives()
walk over this, looking for any pointers into .text, and clobber an endbr64
instruction if found.  This is some minor structure (ab)use but it works
alarmingly well.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

It would be nice for the printk() to say "optimised away %u of %u", but the
latter number can only feasibly come from post-processing of xen-syms during
the build.

v2:
 * Drop hard tabs
 * Add __initconst_cf_clobber too
 * Change types to reduce casting
---
 xen/arch/x86/alternative.c | 38 ++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/xen.lds.S     |  6 ++++++
 xen/include/xen/init.h     |  3 +++
 3 files changed, 47 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 65537fe1f0bd..dd4609070001 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -173,6 +173,9 @@ text_poke(void *addr, const void *opcode, size_t len)
     return memcpy(addr, opcode, len);
 }
 
+extern void *const __initdata_cf_clobber_start[];
+extern void *const __initdata_cf_clobber_end[];
+
 /*
  * Replace instructions with better alternatives for this CPU type.
  * This runs before SMP is initialized to avoid SMP problems with
@@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
     }
+
+    /*
+     * Clobber endbr64 instructions now that altcall has finished optimising
+     * all indirect branches to direct ones.
+     */
+    if ( force && cpu_has_xen_ibt )
+    {
+        void *const *val;
+        unsigned int clobbered = 0;
+
+        /*
+         * This is some minor structure (ab)use.  We walk the entire contents
+         * of .init.{ro,}data.cf_clobber as if it were an array of pointers.
+         *
+         * If the pointer points into .text, and at an endbr64 instruction,
+         * nop out the endbr64.  This causes the pointer to no longer be a
+         * legal indirect branch target under CET-IBT.  This is a
+         * defence-in-depth measure, to reduce the options available to an
+         * adversary who has managed to hijack a function pointer.
+         */
+        for ( val = __initdata_cf_clobber_start;
+              val < __initdata_cf_clobber_end;
+              val++ )
+        {
+            void *ptr = *val;
+
+            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
+                continue;
+
+            add_nops(ptr, 4);
+            clobbered++;
+        }
+
+        printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
+    }
 }
 
 void init_or_livepatch apply_alternatives(struct alt_instr *start,
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index ca22e984f807..c399178ac123 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -221,6 +221,12 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       . = ALIGN(POINTER_ALIGN);
+       __initdata_cf_clobber_start = .;
+       *(.init.data.cf_clobber)
+       *(.init.rodata.cf_clobber)
+       __initdata_cf_clobber_end = .;
+
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index bfe789e93f6b..0af0e234ec80 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -18,6 +18,9 @@
 #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
 #define __exit_call       __used_section(".exitcall.exit")
 
+#define __initdata_cf_clobber  __section(".init.data.cf_clobber")
+#define __initconst_cf_clobber __section(".init.rodata.cf_clobber")
+
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this
-- 
2.11.0


