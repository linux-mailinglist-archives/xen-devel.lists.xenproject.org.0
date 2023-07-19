Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8C7593AF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565765.884240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4xN-0002kL-05; Wed, 19 Jul 2023 11:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565765.884240; Wed, 19 Jul 2023 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4xM-0002ig-TL; Wed, 19 Jul 2023 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 565765;
 Wed, 19 Jul 2023 11:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM4xL-0002ia-IE
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:02:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cded28d3-2623-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 13:02:53 +0200 (CEST)
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
X-Inumbo-ID: cded28d3-2623-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689764573;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QkK8keeBZ42tUpYma4o641af501b1G6fdW+eFxuH8DQ=;
  b=RvOo/MO9vqaxTvGXRy1ldfFb4cKxHX59xdJ7EQCGS+jV+yxHotfoNvfN
   uOGbeFAQh3UwlaT8wjDHl71z6e/lBbjfVkPrHAVu3JtNSAzp69AvHbUxo
   Ii2+QWdT7n3izDRM7zI/IWCFYqWYRu+9sbvKhz2SfQWJhoeAG2L93gy1o
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116013071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0bjzVKIw1e0KBV69FE+R0ZUlxSXFcZb7ZxGr2PjKsXjdYENS0jwAn
 WIWCmyPPa2CYGvzLox1YIm28k9XvJfVy4VjQQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5sIFNg9
 aERJAksZzKKvrmQmIm0bMhj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJsNxx3A+
 TuuE2LRHi8aaMK0+Ry5+X+WpMLqhXzEWtwqPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9Nk4wSy9ZRAc8wtDBqbhoqEr0QfBCH/vg5jHqIg0c0
 wxmvQBn2eVC0pNRh/3mlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9PuU5lykfe/T4mNuhXogjxmOMQZmOivpXwGWKJt9zq1zBhEfV8XZ
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2ddMfA5ScSBhWMmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:l7YGV6ubyalGXCUY/9YiaTJa7skC8IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H6BEDyewKnyXcV2/hbAV7MZniAhILFFuFfBM7ZskXd8k7Fh6RgPM
 VbAs5D4bTLZDAQ56ia3OD7KadY/DDuytHtuQ609QYOcegeUdAF0+4PMHf/LqQZfngkObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUSzpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZfcI5p4dYOxY/ouW3TRYzWTFcRcsnq5zXMISdSUmRgXeR
 /30lUd1opImjbslyqO0GbQMkHboUoTAjnZuBilaDLY0LLEbSN/RtBehZ9Sc3LimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4JguZlFkIP8jgYVq3Psi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwA/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFvxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiIsiYfzQTOdNSSj5uw5zvmWehTNYd3E8LAv26RE
X-Talos-CUID: 9a23:aJe5eWCKwoC90i/6EzJGxmAUR8kpS1zU7n7peGngMmlPabLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ANTnxEQ6tTqJnrlLqrKApF5z/xox03aTyFms9t6k?=
 =?us-ascii?q?NtvOmGAloZAif0gyeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116013071"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: Use const char * for string literals (2)
Date: Wed, 19 Jul 2023 12:02:39 +0100
Message-ID: <20230719110239.4065060-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This hunk was accidentally missing from a previous change.

Fixes: d642c0706678 ("xen/x86: Use const char * for string literals")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This was missed because it was mixed up in cmdline mess in __start_xen().
---
 xen/arch/x86/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4dce..2dbe9857aa60 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -968,7 +968,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
-    char *memmap_type = NULL;
+    const char *memmap_type = NULL;
     char *cmdline, *kextra, *loader;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
-- 
2.30.2


