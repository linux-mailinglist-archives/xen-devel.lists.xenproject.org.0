Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60E69B207
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 18:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497215.768126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qf-0003Nm-58; Fri, 17 Feb 2023 17:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497215.768126; Fri, 17 Feb 2023 17:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qf-0003Ls-27; Fri, 17 Feb 2023 17:48:41 +0000
Received: by outflank-mailman (input) for mailman id 497215;
 Fri, 17 Feb 2023 17:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pT4qd-0002rh-0E
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 17:48:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e7c8e8c-aeeb-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 18:48:37 +0100 (CET)
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
X-Inumbo-ID: 4e7c8e8c-aeeb-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676656117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p5sxvZxuV8RUOamp6LgQhbUMlW7vsrfgFydE9dC8HYM=;
  b=btB9RcRxg60efDRlyKVErHhgzTCGlP5BFc44jbBG8mHrOjYVvvHdHR52
   oiAnBt6QGpNd7FA3tD/2l0KL2K6DwfXmAa1QA/tthZUlQr6IzMWqNOYhK
   Q+GKCuOnpSATlsHRShyd1JWs4AyvJgIFRsO0O5J9MFIqfPqZTfD9Ha8rN
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96897981
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:yAfCsqKg0l3I1J+gFE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS02FWn
 2EeCmuDPq7bN2L9KYglbd+1phlS7cCAz9Q3HQJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c54Dl1q7
 fBIdwsdcw6h2e2xg+ybWNFj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbG5UEwRfI/
 woq+Uz0P0snG/m61QbYyWLymPHMhirkAYkdQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAaIlMmfSNUEjAV/sfB/o40zUzvXO5sRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSLLkWN4umsWyKJV3iEsIGaBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuKlLYpn02NRXLjwgBdXTAdollZ
 P+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/LbLSfFM2QDt6VJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AGXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:mm60zqFOjei4Jq6+pLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.97,306,1669093200"; 
   d="scan'208";a="96897981"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/kexec: Drop compatibility_mode_far
Date: Fri, 17 Feb 2023 17:48:12 +0000
Message-ID: <20230217174814.1006961-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ljmp is (famously?) incompatible between Intel and AMD CPUs, and while we're
using one of the compatible forms, we've got a good stack and lret is the far
more common way of doing this.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index f4842025eb56..035164e96f38 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -86,12 +86,11 @@ ENTRY(kexec_reloc)
         movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
         lgdt    compat_mode_gdt_desc(%rip)
 
-        /* Relocate compatibility mode entry point address. */
-        leal    compatibility_mode(%rip), %eax
-        movl    %eax, compatibility_mode_far(%rip)
-
         /* Enter compatibility mode. */
-        ljmp    *compatibility_mode_far(%rip)
+        lea     compatibility_mode(%rip), %rax
+        push    $0x10
+        push    %rax
+        lretq
 
 relocate_pages:
         /* %rdi - indirection page maddr */
@@ -171,13 +170,6 @@ compatibility_mode:
         ud2
 
         .align 4
-compatibility_mode_far:
-        .long 0x00000000             /* set in call_32_bit above */
-        .word 0x0010
-
-        .type compatibility_mode_far, @object
-        .size compatibility_mode_far, . - compatibility_mode_far
-
 compat_mode_gdt_desc:
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
-- 
2.30.2


