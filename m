Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F65719FF3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542547.846556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHf-0007Mb-MH; Thu, 01 Jun 2023 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542547.846556; Thu, 01 Jun 2023 14:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHf-0007Jr-J3; Thu, 01 Jun 2023 14:28:11 +0000
Received: by outflank-mailman (input) for mailman id 542547;
 Thu, 01 Jun 2023 14:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHd-0006Od-FO
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:09 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8706b633-0088-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:28:07 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ES31Sp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:28:03 +0200 (CEST)
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
X-Inumbo-ID: 8706b633-0088-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685629683; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=V2AqSPRTo2ADTBlHivIVmoTl6fbKn6rALIEKD0CK1dgvAg5Eym3dYkbWjRJXmvg4ZQ
    3lpQuVHF8f5/wOufxMZ9gcH4Kk2fZaQW1hPrAycUd2m2pE3ihewnB1PizLVnzz9YXhNE
    +L74NdAkQln/4Nt4W6ESDQeO1ZsvJMTAnGaTtPHiZlUduY7C5iTiK2te5fCpU3HkJn2J
    KhLf+lM1CeWE7T26SGAZ9Sm9dDO3LP8OGpGPHtTFW58TsXPgvwkWWHuWwfO3nVCNbG24
    0CqRMhT5Emn+SD1x+8Klghz+0doOIPFxL0576CLTlJVsZXN3b0si9al26gReeUbtRdq0
    oYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629683;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xbEvrUB85PE48j/FXd9UoILkjnq6sVytJsciS71Vlqk=;
    b=aAZILsivoofiPA8eOXvwifi1Qtilm4q5oGH1VeuW/rS7lsfklpZBCKbXw4r0l53X9N
    AcmfmPztGQgZKaUB29h2QfgvN426qUO6oEFsLQaJAybU7UDhPJOmTXJDpZmLd7KXyWQC
    hi40pvhocxOrG5hQAxbs9TQUcBErT0YaKjRcw54VNP4MQbTKQpK5jcf6zQ15yr5Zn3NP
    Pc4l9dDN0YvwnG0ANYBHJ75Ayu1Ee43MRvMH3d6tlAdU3W1cQGIOhqEeD6QYx8HckEXX
    flEuSVm4pA8pvTjjtNl1Ac0EkfYtaIl3WC9BA25+N3SD3jX3W+26DGTrTfu02ll7vinB
    tCAQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629683;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xbEvrUB85PE48j/FXd9UoILkjnq6sVytJsciS71Vlqk=;
    b=Vy38Eq7x8yzBr6kdTpvniKyWwah/aYicFwoiOz4B/PEZ/Rtsdr/e9Kl2/auVpXXmnJ
    WzgVcsY+iWBH2GNvYUOzzpPzT1QxQImcMfxr9YwTkU6bffB+6O0oPGS4jl3dXY19zZHM
    g76kX+eBCbEhyC8lJldCHMe0oVSP7+7JKno0sFVOYzDW7PUgLeiUO9arnPwLM0Q5rCRW
    i74z0nqGeNiK4MIczK7UjiTPnoFmEQUfiHetkEmmYNiF+Vb0uLQqm4p7sKLB5hDt9h7m
    nJ6eh1ftIOJ5me7RigoKrQrYnlgh7gONyDvsPKmBMK32L2f+W3dnrpCMnA1gY1vAl2NW
    ReMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629683;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xbEvrUB85PE48j/FXd9UoILkjnq6sVytJsciS71Vlqk=;
    b=Hs4rrx8I/RUD3nHSaz4jwvkmnxPToiqLb3RE+rmgtd9E3E3/6FbO9v16KJA7hqOStc
    ptaaTYlPfqpkfBqWK5BQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 4/7] xenalyze: sync with vmx.h, use EXIT_REASON_VMXOFF
Date: Thu,  1 Jun 2023 16:27:39 +0200
Message-Id: <20230601142742.15489-5-olaf@aepfle.de>
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
index 1cae055ef4..d2e6c77590 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -466,7 +466,7 @@ struct {
 #define EXIT_REASON_VMREAD              23
 #define EXIT_REASON_VMRESUME            24
 #define EXIT_REASON_VMWRITE             25
-#define EXIT_REASON_VMOFF               26
+#define EXIT_REASON_VMXOFF              26
 #define EXIT_REASON_VMON                27
 #define EXIT_REASON_CR_ACCESS           28
 #define EXIT_REASON_DR_ACCESS           29
@@ -522,7 +522,7 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_VMREAD]="VMREAD",
     [EXIT_REASON_VMRESUME]="VMRESUME",
     [EXIT_REASON_VMWRITE]="VMWRITE",
-    [EXIT_REASON_VMOFF]="VMOFF",
+    [EXIT_REASON_VMXOFF]="VMXOFF",
     [EXIT_REASON_VMON]="VMON",
     [EXIT_REASON_CR_ACCESS]="CR_ACCESS",
     [EXIT_REASON_DR_ACCESS]="DR_ACCESS",

