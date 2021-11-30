Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C209746309F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234956.407727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00g-0000Ky-6j; Tue, 30 Nov 2021 10:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234956.407727; Tue, 30 Nov 2021 10:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00f-00006I-Pg; Tue, 30 Nov 2021 10:05:13 +0000
Received: by outflank-mailman (input) for mailman id 234956;
 Tue, 30 Nov 2021 10:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00d-0007QY-4k
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff574a4e-51c4-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 11:05:08 +0100 (CET)
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
X-Inumbo-ID: ff574a4e-51c4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5YA8FSFJ+Ido7sPF/P6KhMxMTP806Xj8+bqrXWoCKI4=;
  b=DjSmmfZbOWAu5hVXi41U8OPipsYG+vFjaE2ceAjCm2q6aZ1eq51BSqFH
   qQ78hfCg/zp/UNMjZq4xcjAY4aj8vpGM3Y2zgP6sMBAr5Sny8JgXDMyiq
   41tKPEhrlsUTajj0jeqEDcl4RggVMG10zmEmjL9Ap3aHnYZ4ia0f+o5Tt
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bIHWVeQHUXz6r0nX5evBqeKl860UzVSAtORugFtAuD+4PLq48heLcB0V0uUAJMeqnVVDT2y1ad
 2Ba/HXs9KvulHtTLbnADi4SIZqTkW2HIFrwRi+tvkul9mff3uvmmAj2nRqUTyBzlFP8MwK5Ohg
 ArfF+iSNjCz+m8fV4YqjnjJ5RpZxmdvHFeRDkUg7vKjAhxDclB016CjO2KCu6Tjxsm5c2qCv/j
 LrJO0UHNGzxABd1qIsKEG/7Zdb4Z9Y6SHoUY+oE6qqx1m1qZ3Y+C4EKpst16zWhBpka9kclLEk
 /VZHCW37IvnFn7sWwAZAALK1
X-SBRS: 5.1
X-MesageID: 58406783
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p61006rlp9t786N76YX40JrEMR9eBmLUYhIvgKrLsJaIsI4StFCzt
 garIBmCP63bMDSmLd9zYdm0pENVsJTcmtBgSgBtqSEzHnkR85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IPhW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaKKWy42EPzgotkQdideCX9UEPB+oIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ppFMWQwPE+ojxtnZ2kzJJ8Ao+WRj1reLn4Ah3mkhLAv/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUE0hOk1YSFzzykC006SCQfQvF7jJcPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHvZ6sz67DFzFtW
 UTofeDFt4ji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1UI2awO
 xSN418LjHO2AJdMRfQsC25WI553pZUM6Py/DqyEBjawSsYZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dJJcA1RcyFkXcueRg4+XrfrHzeK0VoJU5f5qY7NsaQ8w8y5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:5+a6Vahb7SmeiIsQBBZfEEUNrHBQXuAji2hC6mlwRA09TySZ//
 rOoB19726NtN9xYgBYpTnuAtjifZqxz/FICMwqTNOftWrdyQ2VxeNZnOnfKlTbckWUnIMw6U
 4jSdkYNDSZNykAsS+Q2mmF+rgbruVviJrY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58406783"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/8] x86/boot: Drop xen_virt_end
Date: Tue, 30 Nov 2021 10:04:42 +0000
Message-ID: <20211130100445.31156-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The calculation in __start_xen() for xen_virt_end is an opencoding of
ROUNDUP(_end, 2M).  This is __2M_rwdata_end as provided by the linker script.

This corrects the bound calculations in arch_livepatch_init() and
update_xen_mappings() to not enforce 2M alignment when Xen is not compiled
with CONFIG_XEN_ALIGN_2M

Furthermore, since 52975142d154 ("x86/boot: Create the l2_xenmap[] mappings
dynamically"), there have not been extraneous mappings to delete, meaning that
the call to destroy_xen_mappings() has been a no-op.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This effectively reverts d0ae97d4136e ("x86-64: properly handle alias mappings
beyond _end"), because the preconditions for the change are no longer valid.
---
 xen/arch/x86/livepatch.c          | 3 ++-
 xen/arch/x86/mm.c                 | 3 ++-
 xen/arch/x86/setup.c              | 6 ------
 xen/include/asm-x86/x86_64/page.h | 2 --
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 49f0d902e5bb..d056b1ed8b41 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -17,6 +17,7 @@
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
 #include <asm/livepatch.h>
+#include <asm/setup.h>
 
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
 {
@@ -343,7 +344,7 @@ void __init arch_livepatch_init(void)
 {
     void *start, *end;
 
-    start = (void *)xen_virt_end;
+    start = (void *)__2M_rwdata_end;
     end = (void *)(XEN_VIRT_END - FIXADDR_X_SIZE - NR_CPUS * PAGE_SIZE);
 
     BUG_ON(end <= start);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9bd4e5cc1d2f..fdc548a9cb4a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -786,7 +786,8 @@ bool is_iomem_page(mfn_t mfn)
 static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 {
     bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
-         mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
+        mfn < PFN_UP(xen_phys_start + (unsigned long)__2M_rwdata_end -
+                     XEN_VIRT_START);
 
     /*
      * Something is catastrophically broken if someone is trying to change the
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6613e56a2184..0e0e706404a3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -136,8 +136,6 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
-unsigned long __read_mostly xen_virt_end;
-
 char __section(".bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
 
@@ -1573,10 +1571,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     }
 #endif
 
-    xen_virt_end = ((unsigned long)_end + (1UL << L2_PAGETABLE_SHIFT) - 1) &
-                   ~((1UL << L2_PAGETABLE_SHIFT) - 1);
-    destroy_xen_mappings(xen_virt_end, XEN_VIRT_START + BOOTSTRAP_MAP_BASE);
-
     /*
      * If not using 2M mappings to gain suitable pagetable permissions
      * directly from the relocation above, remap the code/data
diff --git a/xen/include/asm-x86/x86_64/page.h b/xen/include/asm-x86/x86_64/page.h
index f9faf7f38348..cb1db107c424 100644
--- a/xen/include/asm-x86/x86_64/page.h
+++ b/xen/include/asm-x86/x86_64/page.h
@@ -23,8 +23,6 @@ static inline unsigned long canonicalise_addr(unsigned long addr)
 
 #include <xen/pdx.h>
 
-extern unsigned long xen_virt_end;
-
 /*
  * Note: These are solely for the use by page_{get,set}_owner(), and
  *       therefore don't need to handle the XEN_VIRT_{START,END} range.
-- 
2.11.0


