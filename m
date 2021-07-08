Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0043C1589
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153194.283032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VSS-0004Rc-7g; Thu, 08 Jul 2021 14:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153194.283032; Thu, 08 Jul 2021 14:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VSS-0004Pk-3J; Thu, 08 Jul 2021 14:56:56 +0000
Received: by outflank-mailman (input) for mailman id 153194;
 Thu, 08 Jul 2021 14:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1VSQ-0004OF-Qv
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:56:54 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 264e25f5-6f9d-40c3-919f-3c030941e29c;
 Thu, 08 Jul 2021 14:56:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68Eupb39
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 16:56:51 +0200 (CEST)
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
X-Inumbo-ID: 264e25f5-6f9d-40c3-919f-3c030941e29c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625756212;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=as8CzECp3VUH0KQhsm3sCfDW5/hNDE73Qf/G7ueUrrU=;
    b=Agnn9Oib4ufeF1ACHY9GeRPMgCZmth5gLwWF9O1sTxZn3qf4RRdTYNpbdRTmidbXOC
    zGvHgEg27m5s4JYjg+15Ich7P0gqcNd8iaIG8O381rDOxbqHke63ISHVp7Gd8SC+d6U0
    j8UUg+Q61P5NDntyoiQ8x75HBKWQGwYvBt/U274i00Q4ehhZvjBfawvmVJc8euOwbu6c
    W0KByl49E9AaRCglfd2qyn+8F1OPJ4lyuXIvxFJpXMC49ya9v75eMDvXnsFMKEKQx5Ic
    WywUo5f5ctLcd0MnCAWk++jcxTXN/bIFgAADzeHutu2riuGhMGbvGiY6+JyApierA3Pr
    CHeA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: avoid globbering the docker run args
Date: Thu,  8 Jul 2021 16:56:49 +0200
Message-Id: <20210708145650.8961-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

containerize bash -c './configure && make' fails due to shell expansion.

Collect all arguments for the script and pass them verbatim to the
docker run command.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/scripts/containerize | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 59edf0ba40..7682ccd347 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -47,10 +47,10 @@ case "_${CONTAINER_UID0}" in
 esac
 
 # Save the commands for future use
-cmd=$@
+cmd=("$@")
 
 # If no command was specified, just drop us into a shell if we're interactive
-[ $# -eq 0 ] && tty -s && cmd="/bin/bash"
+[ $# -eq 0 ] && tty -s && cmd=("/bin/bash")
 
 # Are we in an interactive terminal?
 tty -s && termint=t
@@ -104,4 +104,4 @@ exec ${docker_cmd} run \
     ${CONTAINER_ARGS} \
     -${termint}i --rm -- \
     ${CONTAINER} \
-    ${cmd}
+    "${cmd[@]}"

