Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F2166DF8F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479422.743283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPn-00016J-HW; Tue, 17 Jan 2023 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479422.743283; Tue, 17 Jan 2023 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPn-00012Q-By; Tue, 17 Jan 2023 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 479422;
 Tue, 17 Jan 2023 13:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPm-0000XC-53
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6af839-966e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 14:54:13 +0100 (CET)
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
X-Inumbo-ID: 6c6af839-966e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=UeCGU2douQiNkU5ETGdTRi7QCglzQpQvZz38J5a3SzA=;
  b=WyBH/eqlxAibQyesBemv9euhIM+u2eaOWQke3FQWib9UqTpEEKcOiJ+2
   nGX2KMj82GPVxFtI/Bs2kgwuMtFt2yrqx8woPl/Uu+TDLJjFqZK32yq3q
   +4Q7Gr8XsJPaI0bbPhhLQGM05iY+ifrf+U/H884IQNcdj+Uv0/CBEAk2s
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898369
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:G9Nj6aLVmo4EyW5yFE+RqZUlxSXFcZb7ZxGr2PjKsXjdYENS1TMDn
 2dJWT2EO/aLNmGheI8iPoi+/EsDscfSyoQ3T1BlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tGmNqp
 do4Bgtdf0yDpvqMxZ6kTMxz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbHJUEzh3G9
 woq+UzbKDgBJuat2AOM63n9it7kjyrqVrs7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlyKXO5B2CLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aIzMXCT8kRQE/HRpZ4/j7moQfkRTqUYM2eEKqteEZCQ0c0
 hjT8ndl1u9J1ZFbv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RfHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0MvQnMt7pW5VznPOI+THZuhf8N4omX3SMXFXfoHEGibC4gggBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eZD+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9404OAL2kPHeJq9B7wJJjBSFTOK0aYvd/LoarSjeK0kl6Wpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:Agn956ATYoxs0SPlHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898369"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/6] tools: Introduce a non-truncating xc_xenver_cmdline()
Date: Tue, 17 Jan 2023 13:53:35 +0000
Message-ID: <20230117135336.11662-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Update libxl to match.  No API/ABI change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h      | 1 +
 tools/libs/ctrl/xc_version.c | 5 +++++
 tools/libs/light/libxl.c     | 4 +---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 48dbf3eab75f..fd80a509197d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1611,6 +1611,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
 char *xc_xenver_extraversion(xc_interface *xch);
 char *xc_xenver_capabilities(xc_interface *xch);
 char *xc_xenver_changeset(xc_interface *xch);
+char *xc_xenver_commandline(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 9f2cae03dba8..02f6e9551b57 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -166,3 +166,8 @@ char *xc_xenver_changeset(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_changeset2);
 }
+
+char *xc_xenver_commandline(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_commandline2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 80e763aba944..3f906a47148b 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -583,7 +583,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     union {
         xen_compile_info_t xen_cc;
         xen_platform_parameters_t p_parms;
-        xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
     } u;
     long xen_version;
@@ -613,8 +612,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 
     info->pagesize = xc_version(ctx->xch, XENVER_pagesize, NULL);
 
-    xc_version(ctx->xch, XENVER_commandline, &u.xen_commandline);
-    info->commandline = libxl__strdup(NOGC, u.xen_commandline);
+    info->commandline = xc_xenver_commandline(ctx->xch);
 
     u.build_id.len = sizeof(u) - sizeof(u.build_id);
     r = libxl__xc_version_wrap(gc, info, &u.build_id);
-- 
2.11.0


