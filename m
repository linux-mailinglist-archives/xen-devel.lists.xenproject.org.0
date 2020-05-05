Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB81C51DE
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 11:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVtpL-0002Pj-6I; Tue, 05 May 2020 09:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVtpJ-0002PG-EK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 09:25:21 +0000
X-Inumbo-ID: 567332c4-8eb2-11ea-9d9d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 567332c4-8eb2-11ea-9d9d-12813bfff9fa;
 Tue, 05 May 2020 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588670720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+aC6uoM/qymQoZzM91I3BVdkUyiXIlm5H5MQBXrOls=;
 b=MM6v7NuhHd5fT7TqZZPmt5dK93mp0lKjjnRti4568gJlv7FBMl5wqKyp
 5MbT+zaeLkZtZjOvZzy6y9FvrUx7ioBtzyGEm7ZZ+6XdLclY6Y0c/pg3x
 zMPYKZJIzUMa+ROE8TIRL4Xzifw4z8UFpxS2Y0ZxFnFrFGjNbzFo9MR/K k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TxkxxY4pQWtscr4wjKnycYrOsRO5VMlITzvjiod2o8rPEoGSz7tbts61pxx2TkA2SKawCIATGF
 ybKZD/zznx6cnIDX9KyFWLPwc5SBIBxl6Rbf8msFVGLkCYrTNx5arkW/Zh71U7u5/SzsVINnD1
 1ctC+xS0vZXzjnpZcIjwd8b3l87uUie0VW0AOXAo+04y0jRWcqJfg3JHyCT2MBkspZDp9tTTnr
 Q7Y5OMwHpyBxEm8qnHB/u3f3JN6C6hRubG8frgvMTvGJQDUc9xrOr7yGsFX4m3+XmigP+XQs5Y
 6WU=
X-SBRS: 2.7
X-MesageID: 16772808
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="16772808"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/3] tools/libxl: disable clang indentation check for the disk
 parser
Date: Tue, 5 May 2020 11:24:54 +0200
Message-ID: <20200505092454.9161-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505092454.9161-1-roger.pau@citrix.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Clang 10 complains with:

13: error: misleading indentation; statement is not part of the previous 'if'
      [-Werror,-Wmisleading-indentation]
            if ( ! yyg->yy_state_buf )
            ^
libxlu_disk_l.c:1259:9: note: previous statement is here
        if ( ! yyg->yy_state_buf )
        ^

Due to the missing braces in single line statements and the wrong
indentation. Fix this by disabling the warning for that specific file.
I haven't found a way to force flex to add braces around single line
statements in conditional blocks.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Please re-generate libxlu_disk_l.c before committing.
---
 tools/libxl/libxlu_disk_l.l | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/libxl/libxlu_disk_l.l b/tools/libxl/libxlu_disk_l.l
index 97039a2800..7a46f4a30c 100644
--- a/tools/libxl/libxlu_disk_l.l
+++ b/tools/libxl/libxlu_disk_l.l
@@ -36,6 +36,17 @@
 
 #define YY_NO_INPUT
 
+/* The code generated by flex is missing braces in single line expressions and
+ * is not properly indented, which triggers the clang misleading-indentation
+ * check that has been made part of -Wall since clang 10. In order to safely
+ * disable it on clang versions that don't have the diagnostic implemented
+ * also disable the unknown option and pragma warning. */
+#ifdef __clang__
+# pragma clang diagnostic ignored "-Wunknown-pragmas"
+# pragma clang diagnostic ignored "-Wunknown-warning-option"
+# pragma clang diagnostic ignored "-Wmisleading-indentation"
+#endif
+
 /* Some versions of flex have a bug (Fedora bugzilla 612465) which causes
  * it to fail to declare these functions, which it defines.  So declare
  * them ourselves.  Hopefully we won't have to simultaneously support
-- 
2.26.2


