Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677CB45F651
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 22:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233496.405174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigp-0007iG-Ju; Fri, 26 Nov 2021 21:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233496.405174; Fri, 26 Nov 2021 21:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigp-0007bR-DA; Fri, 26 Nov 2021 21:23:27 +0000
Received: by outflank-mailman (input) for mailman id 233496;
 Fri, 26 Nov 2021 21:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqign-0006mN-48
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 21:23:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 159e72e1-4eff-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 22:23:23 +0100 (CET)
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
X-Inumbo-ID: 159e72e1-4eff-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637961803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hKzw/5xvyhxl0lgipvVL1e85ARROZwUJRY07zD4G8Ow=;
  b=Nxohs8vqQ50RNHlXXj49u7yBJ4zGo7GjVgDy0QBnJ/zfXPWPPYazGIGy
   1CaXyQv6Nj7qh+hJYasAtCZKTNRy4P468fsMkapnRsm9BBVH7XHsoqN5b
   Mdp7pqitGroDAWNlCsPAv9WJ9PpDFZTVOtZWlFRNdparcr8AYbwxh7Q5T
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 565yRgGU9nN57B+tPBd7vR2CnYMVNxuhYaiS0swu4/lZcTVFJ0PThc4qMk2TVlIMt5TnhcWAKQ
 hO+oby/ZOL9FyixXRrOiL3WYwZ1AqDCqB+kSDRRtep5B5NcB6D0CVBe9WzQM/IitU+CEqACxPu
 8mQQc2c3r98+lnxBYEjZzNYCwYaYiOeahRWXXFtKJSqZ9q37hiamKRUStpUfh9Va+f+pOaYRY4
 LJthDppO1rbYLgOzkFUbAlUnnVRQamXbV+AGJR+Un2nt4T/SesDW4HCL/56Rt88RpoQNo5bUm2
 jjKICdV+vcdLP1rulUODXKtk
X-SBRS: 5.1
X-MesageID: 58217720
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zahAsatqpTMNCJwp3K4ywvMlTOfnVJtZMUV32f8akzHdYApBsoF/q
 tZmKW6GOqmKZzb2Kox0YYTg8ExV6JCAz9dmSQM+rSxjFi8U+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl67G2QAMvDpb3us89bBVlEzhfBIxZ9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5BANmU1NHwsZTVMO2tIUco+p9uig2jOfTFpql/M/YUOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7MX7giJzJrv2CSyJlcIcz5YSeUHq8BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSLhRqjBNzAJrVkg
 JTis5LGhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlVJGa0O
 xWJ51w5CHpv0J2CN/Qfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:sQhGKaxaOg9zAi/FIcMBKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58217720"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] x86/altcall: Optimise away endbr64 instruction where possible
Date: Fri, 26 Nov 2021 21:22:56 +0000
Message-ID: <20211126212258.7550-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126212258.7550-1-andrew.cooper3@citrix.com>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With altcall, we convert indirect branches into direct ones.  With that
complete, none of the potential targets need an endbr64 instruction.

Furthermore, removing the endbr64 instructions is a security defence-in-depth
improvement, because it limits the options available to an attacker who has
managed to hijack a function pointer.

Introduce a new .init.data.cf_clobber section.  Have _apply_alternatives()
walk over the entire section, looking for any pointers into .text, and clobber
an endbr64 instruction if found.  This is some minor structure (ab)use but it
works alarmingly well.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

It would be nice for the printk() to say "optimised away %u of %u", but the
latter number can only feasibly come from post-processing of xen-syms during
the build.
---
 xen/arch/x86/alternative.c | 38 ++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/xen.lds.S     |  5 +++++
 xen/include/xen/init.h     |  2 ++
 3 files changed, 45 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 5ae4c80d5119..65fc8534b97f 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -173,6 +173,9 @@ text_poke(void *addr, const void *opcode, size_t len)
     return memcpy(addr, opcode, len);
 }
 
+extern unsigned long __initdata_cf_clobber_start[];
+extern unsigned long __initdata_cf_clobber_end[];
+
 /*
  * Replace instructions with better alternatives for this CPU type.
  * This runs before SMP is initialized to avoid SMP problems with
@@ -329,6 +332,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
     }
+
+    /*
+     * Clobber endbr64 instructions now that altcall has finished optimised
+     * all indirect branches to direct ones.
+     */
+    if ( force && cpu_has_xen_ibt )
+    {
+        unsigned long *val;
+        unsigned int clobbered = 0;
+
+        /*
+         * This is some minor structure (ab)use.  We walk the entire contents
+         * of .init.data.cf_clobber as if it were an array of pointers.
+         *
+         * If the pointer points into .text, and has an endbr64 instruction,
+         * nop out the endbr64.  This causes the pointer to no longer be a
+         * legal indirect branch target under CET-IBT.  This is a
+         * defence-in-depth measure, to reduce the options available to an
+         * adversary who has managed to hijack a function pointer.
+         */
+        for ( val = __initdata_cf_clobber_start;
+              val < __initdata_cf_clobber_end;
+              val++ )
+        {
+            void *ptr = (void *)*val;
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
index 87e344d4dd97..5b16a98e4df1 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -214,6 +214,11 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       . = ALIGN(POINTER_ALIGN);
+        __initdata_cf_clobber_start = .;
+	*(.init.data.cf_clobber)
+        __initdata_cf_clobber_end = .;
+
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index bfe789e93f6b..66b324892a52 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -18,6 +18,8 @@
 #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
 #define __exit_call       __used_section(".exitcall.exit")
 
+#define __initdata_cf_clobber __section(".init.data.cf_clobber")
+
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this
-- 
2.11.0


