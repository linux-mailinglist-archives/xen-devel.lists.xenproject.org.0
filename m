Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8471E797D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:35:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebPX-0002P1-5w; Fri, 29 May 2020 09:34:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jebPV-0002Os-Hm
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:34:41 +0000
X-Inumbo-ID: 9ec03c6a-a18f-11ea-a882-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ec03c6a-a18f-11ea-a882-12813bfff9fa;
 Fri, 29 May 2020 09:34:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77525AC85;
 Fri, 29 May 2020 09:34:39 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
Message-ID: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
Date: Fri, 29 May 2020 11:34:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While the behavior to ignore this option without FLASK support was
properly documented, it is still somewhat surprising to someone using
this option and then still _not_ getting the assumed security. Add a
2nd handler for the command line option for the XSM_FLASK=n case, and
invoke panic() when the option is specified (and not subsequently
overridden by "flask=disabled").

Suggested-by: Ian Jackson <ian.jackson@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -998,8 +998,9 @@ to use the default.
 > Default: `enforcing`
 
 Specify how the FLASK security server should be configured.  This option is only
-available if the hypervisor was compiled with FLASK support.  This can be
-enabled by running either:
+available if the hypervisor was compiled with FLASK support, except that
+`flask=enforcing` will still keep the hypervisor from successfully booting even
+without FLASK support.  FLASK support can be enabled by running either:
 - make -C xen config and enabling XSM and FLASK.
 - make -C xen menuconfig and enabling 'FLux Advanced Security Kernel support' and 'Xen Security Modules support'
 
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -211,7 +211,33 @@ int __init register_xsm(struct xsm_opera
     return 0;
 }
 
-#endif
+#endif /* CONFIG_XSM */
+
+#ifndef CONFIG_XSM_FLASK
+static bool __initdata _flask_enforcing;
+
+static int __init parse_flask_param(const char *s)
+{
+    if ( !strcmp(s, "enforcing") )
+        _flask_enforcing = true;
+    else if ( !strcmp(s, "disabled") )
+        _flask_enforcing = false;
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("flask", parse_flask_param);
+
+static int __init check_flask_enforcing(void)
+{
+    if ( _flask_enforcing )
+        panic("\"flask=enforcing\" specified without FLASK support\n");
+
+    return 0;
+}
+__initcall(check_flask_enforcing);
+#endif /* !CONFIG_XSM_FLASK */
 
 long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {

