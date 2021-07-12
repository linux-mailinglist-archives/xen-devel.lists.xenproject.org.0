Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A03C64EF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154766.285893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32Wd-0000Ly-Q1; Mon, 12 Jul 2021 20:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154766.285893; Mon, 12 Jul 2021 20:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32Wd-0000J8-Lt; Mon, 12 Jul 2021 20:27:35 +0000
Received: by outflank-mailman (input) for mailman id 154766;
 Mon, 12 Jul 2021 20:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32Wc-0000G7-8D
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:27:34 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94fe06b5-e34f-11eb-8706-12813bfff9fa;
 Mon, 12 Jul 2021 20:27:32 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121626885671.5433375318461;
 Mon, 12 Jul 2021 13:27:06 -0700 (PDT)
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
X-Inumbo-ID: 94fe06b5-e34f-11eb-8706-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CPvP9wgoNh6e900cWHvPfPJAqIhFY/wuJyLEBOu8t9t9WRfyXknfQETgfOIlgNPUZop5fkKHKbtaIy+QadstSZhxt7fu8art7m/Zo2ult0YPOMBWJKAEGk8yipZD2alZz9brtAhicKUfu27Ayf8uJoOnIVuzI1nPBIn9hVKnaVs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121629; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=d8fvO/Y/tL6tNfEYDxIkBWTObzNZmpuF9LQtKCVWxKw=; 
	b=cjS+iWNY2hiV2AfL9+jkkvK8QqDbE2aZxk7TU6K7UxyJhWjq5GJobc3V5X7fREi0rcGY/bjr33dpOYI+R12eUViRrwsWL4dGsW+TRTJM1k0yhxzog9aokK+nfytrgYYcFXtP+KTjWNaz4DlRQn/9TW8zLq5AogiSO2G+7b3ATw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121629;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=d8fvO/Y/tL6tNfEYDxIkBWTObzNZmpuF9LQtKCVWxKw=;
	b=qth+65wrriwEHe5ifQ45PT8aEiUOHvNw5rTEkNvGHsrz6u7y6I5MwScUdXBi/ne4
	YzRXIKJInl7kMDbZz1/1RXeV3U7dzv65zW+kQ1VWIj43qvpXXbATsmLp4RQgMfvX502
	nUEmnxBZHxcMkG4PN/mhr0OF+QQpSZsbc6q4ha3g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v2 03/10] xsm: remove the ability to disable flask
Date: Mon, 12 Jul 2021 16:32:26 -0400
Message-Id: <20210712203233.20289-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The flask XSM module provided the ability to switch from flask back to
the dummy XSM module during runtime. With this removal the only way to
switch between XSM modules is at boot time.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/flask_op.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 32e079d676..f41c025391 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -223,34 +223,6 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 
 #ifndef COMPAT
 
-static int flask_disable(void)
-{
-    static int flask_disabled = 0;
-    struct xsm_operations default_ops;
-
-    if ( ss_initialized )
-    {
-        /* Not permitted after initial policy load. */
-        return -EINVAL;
-    }
-
-    if ( flask_disabled )
-    {
-        /* Only do this once. */
-        return -EINVAL;
-    }
-
-    printk("Flask:  Disabled at runtime.\n");
-
-    flask_disabled = 1;
-
-    /* Reset xsm_ops to the original module. */
-    xsm_fixup_ops(&default_ops);
-    xsm_ops = default_ops;
-
-    return 0;
-}
-
 static int flask_security_setavc_threshold(struct xen_flask_setavc_threshold *arg)
 {
     int rv = 0;
@@ -700,10 +672,6 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op)
         rv = flask_mls_enabled;
         break;    
 
-    case FLASK_DISABLE:
-        rv = flask_disable();
-        break;
-
     case FLASK_GETAVC_THRESHOLD:
         rv = avc_cache_threshold;
         break;
-- 
2.20.1


