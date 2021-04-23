Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AC3696CF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116541.222442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyZZ-0001cx-Tb; Fri, 23 Apr 2021 16:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116541.222442; Fri, 23 Apr 2021 16:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyZZ-0001cc-QD; Fri, 23 Apr 2021 16:22:29 +0000
Received: by outflank-mailman (input) for mailman id 116541;
 Fri, 23 Apr 2021 16:22:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o87G=JU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZyZX-0001cG-Ux
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:22:27 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::7])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca4c08f0-d1cc-43ba-876f-760dc91c0f09;
 Fri, 23 Apr 2021 16:22:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.4 DYNA|AUTH)
 with ESMTPSA id e071aex3NGMM0id
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 23 Apr 2021 18:22:22 +0200 (CEST)
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
X-Inumbo-ID: ca4c08f0-d1cc-43ba-876f-760dc91c0f09
ARC-Seal: i=1; a=rsa-sha256; t=1619194942; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lx7n1RXA36amjui9NQdOB9/q62gPdls584peNsYK5HwtbpQl4yVcQwxdW1m+qObDjw
    EECXeY6NcJM33dHirZFBOLK3CMaolvHGDX9MqKyxf9S2d6L+FufGuxx6476QZJkvWpKp
    upt1LZp2tW7nj79sZ4rEC+OU03lul5I/Fsy7unBDLS76pLSXgf9f+naykhCwvnBpOXRY
    wDbMRTcP11dH53rRvbWMlHTqDZ2o+ynkMISjjj8jIhv+H+NFkHIVnXzxfLlf7W1zak3d
    N5NO8QeWHFZ/KSrISrz/gHw8NHLevcGOwcXzJ7ll0vPnq0BMKYOVcvgCZ0fW+w8UUu9O
    Y/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619194942;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mNKIMqULF7kR8MrcG2bGI6z6DdGHqTagxazENcRLhu0=;
    b=VZobgJX2Ndo1tPN1OvUIveHJrxKwR7QUvP7un2M/emQghwW0Ll2bw5L0y/vHAmN0SQ
    pns1uRkhFqv2SWN3kFhnaHC4YESOG9kjy6isXbAcPoFmmMyo2ikfnbgCPr57ryg5YO+H
    Grfy9rJ1qnUVRplHF0dHfqcCauMF4jUjxYlf7XWR3mr8bPVToFMMES5C4mzCoPgOVcRa
    HwL07TPANQSIkZ1DQj/RZJ/iRcn3y0GIuCGNwxO2PfbU0dUZvNquEUh/+9q1sz+EZTfj
    xmtIG1R/vsD2u9WfrkJQXdr0vED466LixPwtzwUlM39GMA6D/akFdVwZupHV9L56PuA5
    JF+A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619194942;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mNKIMqULF7kR8MrcG2bGI6z6DdGHqTagxazENcRLhu0=;
    b=OUpNAwECq7hnovO0cvG/jANKu6osftrbj53TLI373ER9NQXCioKfwQWeqQJqcv2sCa
    5jnB8gvYiRmJ1VxmPuTFBSsVRfb+UvkAbr1cKXjipOm2oic78k+5MT5pFPfhilE90Qj8
    fYFDV/XTqRBVuCMAWWenSMEjdp7RFL4zQ/wBgAD2NALDkkYUxnlowJEr51Qkqjwi+bk2
    226FAzUsEwIKFzublau2fT0q68VxqjFa0BOHtqsQRSC2zz3ib9DogSxtA6kFqqyMW29l
    0TEZpzaAPFeBIQnYJ9xwXptChtQ6KCO2ihJF1aR2ykyuLnnYe0S61ebYs8My9bXicb8I
    AkoA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3RdcLGMdqQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: remove unused XENSTORED_ROOTDIR from Linux launch-xenstore
Date: Fri, 23 Apr 2021 18:22:19 +0200
Message-Id: <20210423162219.16744-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysconfig variable XENSTORED_ROOTDIR is not used anymore.
It used to point to a directory with tdb files, which is now a tmpfs.

Fixes commit 2ef6ace428dec4795b8b0a67fff6949e817013de

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 7 -------
 tools/hotplug/Linux/launch-xenstore.in             | 1 -
 2 files changed, 8 deletions(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index b059a2910d..00cf7f91d4 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -48,13 +48,6 @@ XENSTORED_ARGS=
 # Only evaluated if XENSTORETYPE is "daemon".
 #XENSTORED_TRACE=[yes|on|1]
 
-## Type: string
-## Default: "@XEN_LIB_STORED@"
-#
-# Running xenstored on XENSTORED_ROOTDIR
-# Only evaluated if XENSTORETYPE is "daemon".
-#XENSTORED_ROOTDIR=@XEN_LIB_STORED@
-
 ## Type: string
 ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 3c30010e3c..bc3c13931d 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -65,7 +65,6 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 [ "$XENSTORETYPE" = "" ] && XENSTORETYPE=daemon
 
 [ "$XENSTORETYPE" = "daemon" ] && {
-	[ -z "$XENSTORED_ROOTDIR" ] && XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {

