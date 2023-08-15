Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1477D4D4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584055.914496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fv-0005gc-J5; Tue, 15 Aug 2023 21:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584055.914496; Tue, 15 Aug 2023 21:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fv-0005av-Bi; Tue, 15 Aug 2023 21:07:11 +0000
Received: by outflank-mailman (input) for mailman id 584055;
 Tue, 15 Aug 2023 21:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Ft-0004qk-Kq
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0d4e002-3baf-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 23:07:07 +0200 (CEST)
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
X-Inumbo-ID: b0d4e002-3baf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qzXigZ6hXPFsDOHOuxIekBwLTryZ1iaTCSKXT6kUlnI=;
  b=LOAthxilyAE/ata8/q8UqQ02quS/uUyvPCQP/wOLxZKNaJEnJc+uH0Fd
   sX+FxojshNljcR56wB/muu3gBh4MPYUWf17mhZNzVruekIh6ZdPO5TghS
   1RmA1T5YlR6DI7QnlHn6ay0ON+HquTAOPCEiZLb4msBv9P0FpiD+TiPVQ
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119588440
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8jSiAqJ4shr4rEbhFE+RTZUlxSXFcZb7ZxGr2PjKsXjdYENS1jMPz
 TBOXGjUaayLNGCge9x2bIS/8hkPv8LSytMyQAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UG1lQy
 OIoCwkHRQqaquSv8KudEuJj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJQIzhbE+
 jquE2LRBj1FGe2x5zm5zVGGiMrFwQDWVokLPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kbgh3DQ9l5GYapn9b1Hnf22
 DnMoy8g750fldUO1rm71Vnfjiiwu4PSSQoo+gTQWHnj5QR8DKanboqk80nG7t5PKY+YSh+Ku
 31ss+iT6vofS66EkiOlSf8IWrqu4p643Cb02AA1WcN7rnL0piDlJNoLiN1jGKt3GuUeQSHUf
 n/wgAl6/oZ+OmKadIkvaI3kXqzG0pPcPdjiU/nVaP9HbZ5waBKL8UlSWKKA44z+uBNyyP9iY
 P93Ze7pVC9HUvo/kFJaUs9HidcWKjYCKXQ/rHwR5zCuyvKgaXGcUt/p23PeP7livMtoTOg4m
 uuz1vdmKT0FDYUSgQGNq+b/yGzmylBiXPjLRzR/LLLrH+afMDhJ5wXt6b0gYZd5uK9ei/3F+
 HqwMmcBlgul3CebdVTVOikzAF8KYXqYhShnVRHAwH7ygyRzCWpRxPZ3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxEBaQRWLdKLUzx7SrXZnrNXdTKV8I4L+A/0oO+L1SHGehnJnbfiPbSV
 JX7i16GHcJZGVs6ZCsUAdr2p26MUbEmsLoadyP1zhN7IS0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:Wm07g6xZ8HR7p8MaK0beKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:Ny2t0G43/rFL4S2LZ9ss11QsBP07Ql7kxlzKOmK+EFZwbuWeRgrF
X-Talos-MUID: 9a23:7q7u5AUW1BcUaY7q/DvA2xxTGulr35uNIk4om8kllsePLAUlbg==
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119588440"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, "Jason
 Andryuk" <jandryuk@gmail.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 04/10] xen/version: Misc style fixes
Date: Tue, 15 Aug 2023 22:06:44 +0100
Message-ID: <20230815210650.2735671-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 xen/common/kernel.c  | 11 +++++------
 xen/common/version.c |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 4a051be1cbe0..24e778a44f7b 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -1,6 +1,6 @@
 /******************************************************************************
  * kernel.c
- * 
+ *
  * Copyright (c) 2002-2005 K A Fraser
  */
 
@@ -568,7 +568,7 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
+    bool deny = xsm_xen_version(XSM_OTHER, cmd);
 
     switch ( cmd )
     {
@@ -612,7 +612,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -EFAULT;
         return 0;
     }
-    
+
     case XENVER_platform_parameters:
     {
         const struct vcpu *curr = current;
@@ -651,9 +651,8 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         }
 
         return 0;
-        
     }
-    
+
     case XENVER_changeset:
     {
         xen_changeset_info_t chgset;
@@ -680,7 +679,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( VM_ASSIST(d, pae_extended_cr3) )
                 fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
-                fi.submap |= 
+                fi.submap |=
                     (1U << XENFEAT_writable_page_tables) |
                     (1U << XENFEAT_auto_translated_physmap);
             if ( is_hardware_domain(d) )
diff --git a/xen/common/version.c b/xen/common/version.c
index d32013520863..8e738672debe 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -209,11 +209,11 @@ void __init xen_build_init(void)
             }
         }
     }
-#endif
+#endif /* CONFIG_X86 */
     if ( !rc )
         printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
 }
-#endif
+#endif /* BUILD_ID */
 /*
  * Local variables:
  * mode: C
-- 
2.30.2


