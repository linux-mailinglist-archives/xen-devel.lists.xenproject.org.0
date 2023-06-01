Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B114719FF8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542550.846566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHn-0007sJ-48; Thu, 01 Jun 2023 14:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542550.846566; Thu, 01 Jun 2023 14:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHm-0007ol-UD; Thu, 01 Jun 2023 14:28:18 +0000
Received: by outflank-mailman (input) for mailman id 542550;
 Thu, 01 Jun 2023 14:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHl-00066T-5b
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:17 +0000
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf95890-0088-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:28:16 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ES81Ss
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:28:08 +0200 (CEST)
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
X-Inumbo-ID: 8bf95890-0088-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685629688; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ove1LYdv1F1zZ8/lpMv+lHx1waTDajyudAE3Xrpyk4C2HjAve37r3cRDF98o0ntc0u
    bdXFL8YECsCHmA1IuezW0oDoMPgW065xk+a3adcAeLXimYUVmYP9zsJjP3oQ7bknsyK0
    F144FoHuLno6y9+ZhUqL+pAa4IrV70aRzCvTZZzd+YDliwBH1r5bAfXV+3ifV/X9Ho10
    rQ8aW5cnTjoGryRs9xV7NiShLv6gDE0sjkzOaavHcfMgztDfggWVOYdPC69A893uVlmO
    fnqmQJf/hQpUxh26yqSg1Eshb6xckb3t55VktBMeaMcwqHIXRG4BycsEqUyh/I9VCLfI
    R4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629688;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I9MWc2n55o6vA3siJudYHwyC8auPsBD7aRozeGWe0dM=;
    b=mq/+ErMzu2+6i9NEILZZPJ7nqq7VT6lecnh/JfELPWoo6EVWSQZU7V2xWiputaU61Q
    NgPG8WKD25fVyJ9dhCko0Llt/q3pU/ytTvfaxt8esBZESBBn+bNSpPbgtoomprxJ9QCY
    RqTY2t5JbruDR+QiwO0GcsSPVHTDDdXzN4gvcNYctnI8Yc8+nV93WQWmQfhBSKR2JJRv
    5YlaimMfNxen2cwOnU+e6SqZd+3lVhpElx3g+pAx/icABy0TnlDi/Nw2ZFFPl6Gd1wDK
    XUlJrCV14umHPZt46IUD5Fky+7b07RWaekKdcSf//qWuSE9+MkyNBsGVZ144geqCDjJO
    +yIA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629688;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I9MWc2n55o6vA3siJudYHwyC8auPsBD7aRozeGWe0dM=;
    b=g7vJ6BhztBPcl21ZmU7lSi66ztSigfRoQDag53c4QRS3Oh957a19IJXq+ItyeDLZzg
    upmWrSALfglNvS2fs/oGPx+H5MZT1KN7nbVXAnlez4VYodneFcxbFf3InQc3WC+bc3rN
    9Q8aMeLJrt8Kl47Y9rTTR3NtMa7yrEfaG9clJLyCPMneaCSl7kDBR7yU7sJSBnkio5Z2
    K8sIMPjcxXJMFDewZNqGH3wbraiTmbac4H6crKXMtnHYTHWtubWIFvKbN53qFpx+4d1w
    ozO/bJJHkuPQz3TxhRWP/eGkBY5sdQrhnEJmUKrB2H+d+SF+FHwrkB1NTi6/aYK5/J7H
    FKUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629688;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I9MWc2n55o6vA3siJudYHwyC8auPsBD7aRozeGWe0dM=;
    b=xludnOnizQuRw6Sf+zLW9P6bkBSgGunnb0O7nbaGDdBauEjDLDeCarcfaGOC9ODjo+
    pi0FaES0IxFOq9GqMlAw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 6/7] xenalyze: sync with vmx.h, use EXIT_REASON_MCE_DURING_VMENTRY
Date: Thu,  1 Jun 2023 16:27:41 +0200
Message-Id: <20230601142742.15489-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601142742.15489-1-olaf@aepfle.de>
References: <20230601142742.15489-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 88c3d5f873..9635ff453a 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -479,7 +479,7 @@ struct {
 #define EXIT_REASON_MONITOR_TRAP_FLAG   37
 #define EXIT_REASON_MONITOR_INSTRUCTION 39
 #define EXIT_REASON_PAUSE_INSTRUCTION   40
-#define EXIT_REASON_MACHINE_CHECK       41
+#define EXIT_REASON_MCE_DURING_VMENTRY  41
 #define EXIT_REASON_TPR_BELOW_THRESHOLD 43
 #define EXIT_REASON_APIC_ACCESS         44
 #define EXIT_REASON_ACCESS_GDTR_OR_IDTR 46
@@ -535,7 +535,7 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_MONITOR_TRAP_FLAG]="MONITOR_TRAP_FLAG",
     [EXIT_REASON_MONITOR_INSTRUCTION]="MONITOR_INSTRUCTION",
     [EXIT_REASON_PAUSE_INSTRUCTION]="PAUSE_INSTRUCTION",
-    [EXIT_REASON_MACHINE_CHECK]="MACHINE_CHECK",
+    [EXIT_REASON_MCE_DURING_VMENTRY]="MCE_DURING_VMENTRY",
     [EXIT_REASON_TPR_BELOW_THRESHOLD]="TPR_BELOW_THRESHOLD",
     [EXIT_REASON_APIC_ACCESS]="APIC_ACCESS",
     [EXIT_REASON_EPT_VIOLATION]="EPT_VIOLATION",

