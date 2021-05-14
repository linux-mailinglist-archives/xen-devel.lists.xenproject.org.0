Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E33381220
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127564.239773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheow-0004o0-9u; Fri, 14 May 2021 20:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127564.239773; Fri, 14 May 2021 20:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheow-0004m7-6L; Fri, 14 May 2021 20:54:06 +0000
Received: by outflank-mailman (input) for mailman id 127564;
 Fri, 14 May 2021 20:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lheou-0004lD-Sd
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:54:04 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaebd173-a53f-4e78-aea0-ac41d5c5eed3;
 Fri, 14 May 2021 20:54:04 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025180253480.449466746447;
 Fri, 14 May 2021 13:46:20 -0700 (PDT)
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
X-Inumbo-ID: aaebd173-a53f-4e78-aea0-ac41d5c5eed3
ARC-Seal: i=1; a=rsa-sha256; t=1621025182; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QuCdde0fjdutlAxwM9kKB3t1vix6ZO9ja6ftxUtFU5PTT+mT01BepUJAImFtZCt1PrMoirZz80AKjsuHzpdb3g5dXTbfKHDtqm+X9YH5fg66O3drFSAe41e3b9MjK1YKftTx0uIfsygNCvsszhYvCcLZ8REen/Tx301dL3rI248=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025182; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QnVrpx/J4fkxlMFtNOziXCA6XJRJeUiOyN6q0Hwhw5Y=; 
	b=mD3QR+YjAK+wBBbeNj7yqMc0JdpX1RSKSBnABjgO5mdIQfu6f109cN/xOO3dT/wZB72rDh6lxdXr/cg7V5qRtzlA+F8WXTHMH7tW8qbHr7f+TzdfU9w2nPRFwK0/8R3F4DaoJ11kl2WeM3OoHrTDGb+jk160aMgWfV1pbXVgUGo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025182;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QnVrpx/J4fkxlMFtNOziXCA6XJRJeUiOyN6q0Hwhw5Y=;
	b=OHUkE+EjKAUhjRrr16m1dNfPBDZuczmiVIPCBOQd4fBdiNf1T8RHWU64o7CjW1Cb
	lXZv4C0cc7mtXkTc2FKYwLKKEKZ/2U/PZVES/le8LSIf/9ZCxI7u8QmpIt3AqW9bSyq
	N8qwFz1yc3ixvKLLbzcxb6vMDQBAUEaJqimkOD0k=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 09/10] xsm-flask: clean up for domain roles conversion
Date: Fri, 14 May 2021 16:54:36 -0400
Message-Id: <20210514205437.13661-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The domain roles approach changed the idea of how the default XSM policy module
is configured. This makes the minor adjustment for that change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/flask_op.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 01e52138a1..63c263ebed 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -244,7 +244,7 @@ static int flask_disable(void)
     flask_disabled = 1;
 
     /* Reset xsm_ops to the original module. */
-    xsm_ops = &dummy_xsm_ops;
+    xsm_ops = NULL;
 
     return 0;
 }
-- 
2.20.1


