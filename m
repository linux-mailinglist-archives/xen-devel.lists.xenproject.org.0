Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353F3498F3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 19:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101509.194258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPUN3-00084H-Tw; Thu, 25 Mar 2021 18:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101509.194258; Thu, 25 Mar 2021 18:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPUN3-00083s-Qr; Thu, 25 Mar 2021 18:06:13 +0000
Received: by outflank-mailman (input) for mailman id 101509;
 Thu, 25 Mar 2021 18:06:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPUN2-00083n-B3
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 18:06:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPUN1-0001K7-5H; Thu, 25 Mar 2021 18:06:11 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPUN0-0007BL-MF; Thu, 25 Mar 2021 18:06:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=qRNFWzZA5VgpVn9HQse1rowwm85yesvKUlr0ASDLAfU=; b=jFVTTcOfMI1HxtnCk/3SII8Ysi
	CnHOTAjC/jTOXea+ihRTtvxpDgAzw24zZjdb0OJP0LPyGv+rPXfT+Yrg/qVttMixkDIhpR1dNt11Q
	7Gazvnq9YUhGIo1uqbR/kavzxXVRIzGMr8WUd4QEqN26EhT+gb162g9m82J0gym2Emo0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	raphning@gmail.com,
	jgross@suse.com,
	paul@xen.org
Subject: [PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the documentation for XS_RESUME
Date: Thu, 25 Mar 2021 18:06:06 +0000
Message-Id: <20210325180607.13158-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit 13dd372834a4 removed the documentation for XS_RESUME, however
this command is still implemented (at least in C Xenstored) and used by
libxl when resuming a domain.

So re-instate the documentation for the XS_RESUME. Take the opportunity
to update it as there is a user of the command.

Fixes: 13dd372834a4 ("docs/designs: re-work the xenstore migration document...")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: raphning@gmail.com
Cc: jgross@suse.com
Cc: paul@xen.org

Ian, would you still consider documentation update for 4.15?

I looked at the implementation of domain_resume() in Xen, it doesn't
look like we can get away with XS_RESUME because Xen will not send
VIRQ_DOM_EXC on resume.
---
 docs/misc/xenstore.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 148074233001..334dc8b6fdf5 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -294,6 +294,22 @@ IS_DOMAIN_INTRODUCED	<domid>|		T| or F|
 	ie, if INTRODUCE for the domain has not yet been followed by
 	domain destruction or explicit RELEASE.
 
+RESUME			<domid>|
+
+	Arranges that @releaseDomain events will once more be
+	generated when the domain becomes shut down.  This might have
+	to be used if a domain were to be shut down (generating one
+	@releaseDomain) and then subsequently restarted, since the
+	state-sensitive algorithm in xenstored will not otherwise send
+	further watch event notifications if the domain were to be
+	shut down again.
+
+	This command will be issued in place such as resume because
+	Xen will "shutdown" the domain on suspend.
+
+	xenstored prevents the use of RESUME other than by dom0.
+
+
 SET_TARGET		<domid>|<tdomid>|
 	Notifies xenstored that domain <domid> is targeting domain
 	<tdomid>. This grants domain <domid> full access to paths
-- 
2.17.1


