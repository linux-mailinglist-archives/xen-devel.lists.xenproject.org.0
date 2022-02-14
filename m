Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029324B50AA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271501.465964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapd-00042e-IK; Mon, 14 Feb 2022 12:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271501.465964; Mon, 14 Feb 2022 12:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapd-0003zd-DR; Mon, 14 Feb 2022 12:51:53 +0000
Received: by outflank-mailman (input) for mailman id 271501;
 Mon, 14 Feb 2022 12:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapb-0003jk-Lc
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:51:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id defbff4d-8d94-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:51:49 +0100 (CET)
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
X-Inumbo-ID: defbff4d-8d94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=pkih7ZsMQp5X2IhcDlZLwpA1su4gAvfwPCKXwyjRwo8=;
  b=RBu5lWIflALOdDtAcjiIrp27xqBqWk4RURdPc2etHdjNH4hxn1QFQ45b
   e8gDoMK9epKixAl1w4ks6Lm3nwEVFgYDnEnKQsA/qjpn8BccMMYJ/bgER
   zCfFIDGEx8KxBLGk7Nwx1IFPJMaopuYMgY9MMoSFhqvcyJnQ12eApgCtN
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: laa0lK+0JjaWzClqAAaAldTnDTe1D9EinE+gsidtVsx+0tM8A419Q6TNow1WxzBGMUyfgzu709
 423ZM5mSYKngLY7UPC3rY0S5u72Xhg/OwP1p6uA2t0wo9SqDjkRGDH8Cz75WI6PmZ96F0ls3km
 ZHCrJLYCL+CvzsapoCu4dWjVPKbgaGr32tNmLy2DFTMOYbXSHwKSOxMx+xozbCGF/M9dB0NbnJ
 OItCR/WWYkQVPifTChW/nJ6i2zYXBAm9nm9uaslefP9XOEYZZy+h4K1Gp9awtN02dHGcWf0cgQ
 g1JS2YjxOeiAk/TkzowbPPb1
X-SBRS: 5.1
X-MesageID: 63591037
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Mo1cOqoX1Qa+BZ11yenAXQEvu05eBmLNYhIvgKrLsJaIsI4StFCzt
 garIBmGbv2NYmf3et91Ptu3pxsDv5SDmNQyGgo4rnxnE3kXp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnceeGBoVI/HIpM86ShtGHCghP6Fn/KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZFEOGM3N0uojxtnCAk0V70ulcmUt3jYd3pdtlPJmu0Syj2GpOB2+Oe0a4eEEjCQfu1Zhl2dp
 37G123hDwsGKceEzj6Y7nOrgPSJliT+MKoeG7G1+eRjqEGCzWwUThsNXB20pufRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeHhJ7y
 2OUw9fVLht2sqOaQC2f+paQsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2/0/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nQzkRho81XRdlFAspp1xWG3zZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYif2Mv8nPt/pUp9wpUQFKTgCfqqKBuein7ArLFPXlM2QTRL4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLc6q+pIHLrbZemKL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:trI3O6+l3qfOOfUeqKJuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63591037"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH v2 03/70] xen/xsm: Move {do,compat}_flask_op() declarations into a header
Date: Mon, 14 Feb 2022 12:50:20 +0000
Message-ID: <20220214125127.17985-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Declaring sideways like this is unsafe, because the compiler can't check that
the implementaton in flask_op.c still has the same type.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>

v2:
 * Rework in the face of no useful progress on the better fix.
---
 xen/xsm/flask/flask_op.c | 1 +
 xen/xsm/flask/hooks.c    | 4 +---
 xen/xsm/flask/private.h  | 9 +++++++++
 3 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 xen/xsm/flask/private.h

diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 221ff00fd3cc..bb3bebc30e01 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -21,6 +21,7 @@
 #include <avc_ss.h>
 #include <objsec.h>
 #include <conditional.h>
+#include "private.h"
 
 #define ret_t long
 #define _copy_to_guest copy_to_guest
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3b29f7fde372..6ff1be28e4a4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -36,6 +36,7 @@
 #include <avc_ss.h>
 #include <objsec.h>
 #include <conditional.h>
+#include "private.h"
 
 static u32 domain_sid(const struct domain *dom)
 {
@@ -1742,9 +1743,6 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
 
 #endif
 
-long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-
 static const struct xsm_ops __initconstrel flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
diff --git a/xen/xsm/flask/private.h b/xen/xsm/flask/private.h
new file mode 100644
index 000000000000..73b0de87245a
--- /dev/null
+++ b/xen/xsm/flask/private.h
@@ -0,0 +1,9 @@
+#ifndef XSM_FLASK_PRIVATE
+#define XSM_FLASK_PRIVATE
+
+#include <public/xen.h>
+
+long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+
+#endif /* XSM_FLASK_PRIVATE */
-- 
2.11.0


