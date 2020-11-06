Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D003B2A96A9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 14:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20774.46781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1Qn-0004d8-As; Fri, 06 Nov 2020 13:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20774.46781; Fri, 06 Nov 2020 13:05:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1Qn-0004cj-7S; Fri, 06 Nov 2020 13:05:29 +0000
Received: by outflank-mailman (input) for mailman id 20774;
 Fri, 06 Nov 2020 13:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4TK=EM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kb1Qm-0004ce-DH
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:05:28 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d5c6d0-433b-42da-b27e-375e982e9011;
 Fri, 06 Nov 2020 13:05:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
 with ESMTPSA id j03b7dwA6D5K1wx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 6 Nov 2020 14:05:20 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b4TK=EM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kb1Qm-0004ce-DH
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:05:28 +0000
X-Inumbo-ID: 12d5c6d0-433b-42da-b27e-375e982e9011
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 12d5c6d0-433b-42da-b27e-375e982e9011;
	Fri, 06 Nov 2020 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604667926;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=x1mPxd7+pCC+FxKPAKYcJaRSD0WYNhmvTrFlDWW4z0o=;
	b=DZyQCVXjH/4zUDCspEDAS8vnQiaGWKSdPQJbjvN/Vwxq7vS+6sEUWy8CI3STqSiIb8
	yNTe67ErzJasHop2kcwwugl4pTgI7w5ynZjcteaN9nwsDr1lB7CElLQxiFu0+QD7TokG
	TSzYepg+3+/9iE7/RstDmm2Up9QmCY//KJbGIGjZYaw9ZrXPLq1SQpzGAdPfxIbP16Aa
	9iZ/GMyrGcRYSgeAlKIZr2psISnpOJNvXzUunPBznSliNTa/R05qyxMl4vo8dhPi+dXs
	37Dx2aDNWcy+ZbQ1pUxMwdNejPi/+UD+HZ5BQHtjtYWoU1Y6xNfVd6RtsRnaR3fzGlxP
	c12A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GhJjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
	with ESMTPSA id j03b7dwA6D5K1wx
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Fri, 6 Nov 2020 14:05:20 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] docs/xl: fix cpupool-cpu-remove
Date: Fri,  6 Nov 2020 14:05:17 +0100
Message-Id: <20201106130518.26875-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpu-pool must be specified.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index d0f50f0b4a..2f576a25e3 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1357,7 +1357,7 @@ All the specified CPUs that can be added to the cpupool will be added
 to it. If some CPU can't (e.g., because they're already part of another
 cpupool), an error is reported about each one of them.
 
-=item B<cpupool-cpu-remove> I<cpus|node:nodes>
+=item B<cpupool-cpu-remove> I<cpu-pool> I<cpus|node:nodes>
 
 Removes one or more CPUs or NUMA nodes from I<cpu-pool>. CPUs and NUMA
 nodes can be specified as single CPU/node IDs or as ranges, using the

