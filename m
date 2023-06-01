Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D3719FF5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542551.846573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHn-0007wr-Kl; Thu, 01 Jun 2023 14:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542551.846573; Thu, 01 Jun 2023 14:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHn-0007sQ-9T; Thu, 01 Jun 2023 14:28:19 +0000
Received: by outflank-mailman (input) for mailman id 542551;
 Thu, 01 Jun 2023 14:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHm-00066T-48
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:18 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be95341-0088-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:28:16 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ES51Sr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:28:05 +0200 (CEST)
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
X-Inumbo-ID: 8be95341-0088-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685629685; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SIOUw3EQmua1o2yYjwPMmZJASr8qKyB18adecfXyJTcidVR5teLqazBGF7tfTPWRCc
    ukgfcn2V5Q3ywavto+O4Br7if/vxBYUeh2MvFzzXTT6diYInabhG8d5qNjNUEZETN0ae
    qrxG1DkmFsHg9WRN9+lxN+6UxGZ6IBbljCCC7a9FIRcF5WUF2x4zMW+p/py7KokbxHNI
    E9JFGSS7APuuemkE6rXhWay6CBGLDF8S+1iN632dvMvL2NQ/x0ttb29QfCzFGH6mH+1U
    djVnGtw2lCSwoFFkLt804D65dvg52datdUbXnk+gJU/KYu1F088AauA44PnFDFFwG7g9
    Zgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629685;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sEjTVHfAtskHvr19kdJi/74vu4hsTpqgsbMYJvEi80s=;
    b=hBziwFjJ1c9zxmW61CjU+NHyP9ICF3LDN4/Xlo8yc/tQNWV8ysN6ZIPJFyXGPPV6ry
    617XZfslMvpSgDdi5ykSeF1l/Hto/HT58y2QW3A+VqAcibxJz5WmftOAeBWgYOm80NND
    vmL7EEDxxt/omdoU8uAuGAAnaM4kmxe+Z4NrFhjD5SIURzjRe0xhJXMaVcF0ouiUBhAW
    ChV6TSWt8K6xK711Sz6rKk8MUx1mo4fO1xbmi2iQVgH0zuolUPb/0CZwkJJPA/0GUu/b
    inCNtgsxAvVLf1EpMoYPdqM1tZBtCtMcblt9Ft9osoXiNJq3FGpBR1SCGofRdABmz86q
    Jb/w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629685;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sEjTVHfAtskHvr19kdJi/74vu4hsTpqgsbMYJvEi80s=;
    b=pMDxacqZHLaasY15wAueKT5OUZfIcZFvAp/ugSYRXXJmoyHChGM90QDbqPM+KxDGeA
    NWf29QfrGqCCZCkG8Z2D2amnxx37jcE1/3E1cljR3MfMJCn1jtebbZJNAYh4tQRLirEy
    5EMW+C5YcTkLLEVQOTGWYC3svm2q9Vz1ZlHSUr5o08ps+nnpmRqkSx05mDkmqyQlj61z
    tsmRqxT38J1EDRRMx10VL8Ykahs4klBKMtkCgyr0HcBYcyiG1vzRiUAmw/JmFuLfBxCm
    kjRFrUUCUXmkk5fboN6DP+uGQfmyksQV4C2z62mr8wRJYmms7eBKLmlX6jdBGkL/aWBV
    CL8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629685;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sEjTVHfAtskHvr19kdJi/74vu4hsTpqgsbMYJvEi80s=;
    b=JgS/g5VBquZoEB8kWoy9QgyeV88159RDKDae9L7Wu1jJ7QTw7bkEXRCsAts8ZzK2Qi
    JgSlEuQqoD5MMygOYfDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 5/7] xenalyze: sync with vmx.h, use EXIT_REASON_VMXON
Date: Thu,  1 Jun 2023 16:27:40 +0200
Message-Id: <20230601142742.15489-6-olaf@aepfle.de>
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
index d2e6c77590..88c3d5f873 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -467,7 +467,7 @@ struct {
 #define EXIT_REASON_VMRESUME            24
 #define EXIT_REASON_VMWRITE             25
 #define EXIT_REASON_VMXOFF              26
-#define EXIT_REASON_VMON                27
+#define EXIT_REASON_VMXON               27
 #define EXIT_REASON_CR_ACCESS           28
 #define EXIT_REASON_DR_ACCESS           29
 #define EXIT_REASON_IO_INSTRUCTION      30
@@ -523,7 +523,7 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_VMRESUME]="VMRESUME",
     [EXIT_REASON_VMWRITE]="VMWRITE",
     [EXIT_REASON_VMXOFF]="VMXOFF",
-    [EXIT_REASON_VMON]="VMON",
+    [EXIT_REASON_VMXON]="VMXON",
     [EXIT_REASON_CR_ACCESS]="CR_ACCESS",
     [EXIT_REASON_DR_ACCESS]="DR_ACCESS",
     [EXIT_REASON_IO_INSTRUCTION]="IO_INSTRUCTION",

