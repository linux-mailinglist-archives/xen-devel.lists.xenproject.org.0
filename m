Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4372DFE2F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57450.100510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOOk-000104-Tc; Mon, 21 Dec 2020 16:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57450.100510; Mon, 21 Dec 2020 16:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOOk-0000zg-P4; Mon, 21 Dec 2020 16:51:02 +0000
Received: by outflank-mailman (input) for mailman id 57450;
 Mon, 21 Dec 2020 16:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krOOj-0000zT-Ji
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:51:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bf484a2-9655-435e-ac0f-9f6c64cc40a8;
 Mon, 21 Dec 2020 16:51:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EECF4AD2B;
 Mon, 21 Dec 2020 16:50:59 +0000 (UTC)
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
X-Inumbo-ID: 6bf484a2-9655-435e-ac0f-9f6c64cc40a8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608569460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z33w4NnckJIjEIg6P5/FDLUWP2vj8GC6Nipm75K0hVo=;
	b=vA9IDJMYYmlHzBQf8tPr9ymbupTHpMKii+Smyh/ienwTecOtiUYcpICKZG3dv5x0oF/k7G
	zoxxDV/HtWLtvgP6ZWJ2ib8z9QpBlnsZPy9pcNqidiYdBGkPHat/OEEdSg2oeIcdQGlYVF
	ItR+vfgXNFF7Lp3FXucLnNZtqrCZKz0=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib: drop debug_build()
Message-ID: <143333c9-154b-77c3-a66a-6b81696ecded@suse.com>
Date: Mon, 21 Dec 2020 17:50:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Its expansion shouldn't be tied to NDEBUG - down the road we may want to
allow enabling assertions independently of CONFIG_DEBUG. Replace the few
uses by IS_ENABLED(CONFIG_DEBUG).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder whether we shouldn't further abstract this into, say, a
xen_build_info() helper, seeing that all use sites want "debug=[yn]".
This could then also include gcov_string right away.

--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -182,7 +182,7 @@ static void print_xen_info(void)
 #else
            "arm64",
 #endif
-           debug_build() ? 'y' : 'n', print_tainted(taint_str));
+           IS_ENABLED(CONFIG_DEBUG) ? 'y' : 'n', print_tainted(taint_str));
 }
 
 #ifdef CONFIG_ARM_32
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -31,7 +31,7 @@ static void print_xen_info(void)
 
     printk("----[ Xen-%d.%d%s  x86_64  debug=%c " gcov_string "  %s ]----\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
-           debug_build() ? 'y' : 'n', print_tainted(taint_str));
+           IS_ENABLED(CONFIG_DEBUG) ? 'y' : 'n', print_tainted(taint_str));
 }
 
 enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1004,8 +1004,8 @@ void __init console_init_preirq(void)
     spin_unlock(&console_lock);
     printk("Xen version %d.%d%s (%s@%s) (%s) debug=%c " gcov_string " %s\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_compile_by(), xen_compile_domain(),
-           xen_compiler(), debug_build() ? 'y' : 'n', xen_compile_date());
+           xen_compile_by(), xen_compile_domain(), xen_compiler(),
+           IS_ENABLED(CONFIG_DEBUG) ? 'y' : 'n', xen_compile_date());
     printk("Latest ChangeSet: %s\n", xen_changeset());
 
     /* Locate and print the buildid, if applicable. */
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -52,11 +52,9 @@
 #define ASSERT(p) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
-#define debug_build() 1
 #else
 #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
 #define ASSERT_UNREACHABLE() do { } while (0)
-#define debug_build() 0
 #endif
 
 #define ABS(_x) ({                              \

