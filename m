Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C597710F85
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539702.840836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cqe-0006DQ-BS; Thu, 25 May 2023 15:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539702.840836; Thu, 25 May 2023 15:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cqe-0006AU-7z; Thu, 25 May 2023 15:25:52 +0000
Received: by outflank-mailman (input) for mailman id 539702;
 Thu, 25 May 2023 15:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5KKD=BO=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2Cqc-0006AI-GW
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:25:50 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6baca182-fb10-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:25:46 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4PFPc4Mb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 25 May 2023 17:25:38 +0200 (CEST)
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
X-Inumbo-ID: 6baca182-fb10-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685028339; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=quzZBMTmydlZ4adhVV6lCqYcLo9rn550c/nfskkxSU6vtao+zyVPA44GHHZRTFN1QZ
    Rw9wEi1qTiFVNKlhAudkE09Ng7RJYzY5BUwEfGDPvD52o/9gzxQyDoXJTNnFswsbSXBu
    wq8mW1BglPkWNSgO7LxRksP66eJwsytbWiGVoo1mTbM2DOvtedY3Ggq4pq2VSoFc5V7W
    ifpIZld6n01OvCYD+QMixP+gXeIg2zgQxlE/pqsfsiKwe9WXzgZ9a3AmPywcj4ZD8Qpa
    4fijOxcpYnT36OOKDsGNlKoCcd5zTau4SM84ReuijslaRsvUpHHtMnG0qMdZAd4sfCBr
    CoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685028339;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6nkcLF5uy3qZOAbDqmnHxK6TWE4JxR4ZFTQLpYrVHLQ=;
    b=dWGz7y+8trXENdoxg8d1slysEgSXH5u23ZnEEcGZsjFl4pQMN7QJeTPFP9E5kTTxQn
    Hx5tt+gNReH+DWE+02pHmnQJOcMXxAob7seEGLE/abd4IRDjOWCR+QjWM58agHOw6MFA
    ZzUnXC/N5fnsU47L8ay8uWDbPRwxR+5eYkHFAGd2u9irakvLPZ2OUB8Fy6XHXYryusZp
    m5Myuje1c8tr7CASwE0tOzDmDMgryTV0DSe8vVhZIZjQ/b4eCy2Fpysy+fF4qdHs/5Ub
    7oVQjR/Y9qTUTXnnyWlHznubXOemYYiRc4bSqtywC7Mwepkp/pXoVbkJJkit4jRNj+TX
    egGQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685028339;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6nkcLF5uy3qZOAbDqmnHxK6TWE4JxR4ZFTQLpYrVHLQ=;
    b=DB/2IH+5VPsCGZ7hqpA66qWDxsVxUoK9ZOaypGXumBTPHQSYkoc2Lngm41UC4nMR2g
    6chu4rYH0biogtOgQqsOfCFTvpe2J3Kggl0EXeEQeuoEX3MsxF6aCUddfeuQYoc1Pdks
    k2/rKhoAcWc+nrjyfmSJQ6fB0wFb7AoQc2WF0WquS2GRnQ/AseOLj4XlzSxrOGMS8784
    Y4/KgkQmfThGuZCYtVLMfPpSrUBCmQn7C9t99TC4WCHYt6nqTq3X6I9rnQHNX6//gyZa
    Sy/PqNNh/Ro8PzqAoo3Lk4eey/pYNuerO0eh36d8Q3+kr7CqLda0xSx/XBDjBseeFXA1
    RKCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685028339;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6nkcLF5uy3qZOAbDqmnHxK6TWE4JxR4ZFTQLpYrVHLQ=;
    b=XAPlsu7v6M5r/PoyiEpkniX21UvWfqXi4eotn5dFvZcRsMxWAnDiPxuKVdh2NPOYJe
    SoIOKjPMBYizpPixD0Bw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] x86/hvm/ioreq: remove empty line after function declaration
Date: Thu, 25 May 2023 17:25:27 +0200
Message-Id: <20230525152527.10281-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Introduced in commit 6ddfaabceeec3c31bc97a7208c46f581de55f71d
("x86/hvm/ioreq: simplify code and use consistent naming").

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/arch/x86/hvm/ioreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 20dbb4c8cf..4eb7a70182 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -169,7 +169,6 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
-
 {
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;

