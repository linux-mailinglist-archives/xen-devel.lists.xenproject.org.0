Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B2719526
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542301.845989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dRF-0000lX-T8; Thu, 01 Jun 2023 08:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542301.845989; Thu, 01 Jun 2023 08:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dRF-0000iu-Pj; Thu, 01 Jun 2023 08:13:41 +0000
Received: by outflank-mailman (input) for mailman id 542301;
 Thu, 01 Jun 2023 08:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4dRE-0000io-Im
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:13:40 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36b1cd6b-0054-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:13:39 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz518DYQIb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 10:13:34 +0200 (CEST)
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
X-Inumbo-ID: 36b1cd6b-0054-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685607214; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BFEwmTcCjMVWPPh/EmYB3zUW0Gk3/LFlibDOuLovCFmkNzz1KYv6sFENoiu1y2PF/z
    F/rMqcq9Zq3PKEEABHpCyKw/jN2/6G+DJVZJT9/gSfazQIgDiov/n0X3jm30DPvfZasg
    RbEETt+fzreiQnp9BA0NaLHyHir+KXk9OdWfcZ4WHLQpha4IIeh+Bql5/090hJMw3fRj
    a83WWzcC9hiz/N3jI6sF5yScUIxJQmxwGLi3+8vQWSaQtMkV6YfMvKy3vqau2Selu3wA
    L013MVDK9hP5jbPjfGuBPh1eCFcCl0bve2TlokwhoUaCkacjNTH6hWzZzrOEckpvP5nZ
    Ia+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685607214;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jfSB96xZmQTSX9f93eRmhAN9QA0aTbS2WwLrDEw5fHE=;
    b=HFUmJAIRCnyJ+BRkJMfR2kEVbqUYbgRKUQdalYCd8Fdyl+NiU4V16ueK7M4QHKtSqQ
    bHOAoTkaXVYdB4zJanUTsOHRL1lKOZDJGhYlJzqTFf17Ucng8scYhDqezz1r6va5gu97
    H77SOg6C2XsJWWYpFR8fyDCznQTEw90EqSbigWjHwXgGSjR+BgLS1l/yhNBlxpS+bVED
    qsGxRQChSdEc5DXaUH/cVmnukF/PMPFwi6bJcV3jd4HNYblZeTsaT4Cd7NgLG22D9l14
    VnqmwKN8uaMNvy970XDBEXFrURWpJNcLJJe0FhINDbY943Bbans7gmuf5fEoIW/VH5o8
    OaRA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685607214;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jfSB96xZmQTSX9f93eRmhAN9QA0aTbS2WwLrDEw5fHE=;
    b=XWaEWnu+hejeIutyjp13IjgWgiOJ92MamLeCOZ93yWWLnMa4ZNwbCWsXmx82NDtYyd
    J3SdeG+ytYtpPWRp2ZoyUdtoR8Fql/mhCBb8swkbK/dmweHlFXrBuNakm0exCBbEgHJp
    PUMgMCbvKMo1A9R8HgmU1c9njuMzn1/Y9mnFxHkBWth7IOVqwq3GcJweBEU7ibBeKgvA
    l6d4oKoqduNhc1gI/cQ8w7J/cjpYfQx0P+Eh5/vw31D9jpX49k7xhdwshQWe/ZFhuKXn
    aB5hdqXUohhh56gr+vANA7DpshJWaQdmX621PHvKjCfo6Moi7dj/nXtf9Y6cfoS/ECt7
    9vSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685607214;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jfSB96xZmQTSX9f93eRmhAN9QA0aTbS2WwLrDEw5fHE=;
    b=LM/XQlG9JEHP7Zl2w0SBFDGleHs5a4MA3DWkdRydWjNf+2yLMaIQ1eIpKl/aEb+vS5
    M6dJq5UnLpMQvsIWxuCA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xenalyze: remove unused defines
Date: Thu,  1 Jun 2023 10:13:31 +0200
Message-Id: <20230601081331.436-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

These defines are not used by xenalyze.
NR_CPUS will not match what was used for building Xen itself.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/analyze.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/tools/xentrace/analyze.h b/tools/xentrace/analyze.h
index 6fefa19639..89217026a7 100644
--- a/tools/xentrace/analyze.h
+++ b/tools/xentrace/analyze.h
@@ -16,19 +16,6 @@
 
 #define TRC_LOST_RECORDS_END    (TRC_GEN + 50)
 
-#define NR_CPUS 128
-#if __x86_64__
-# define BITS_PER_LONG 64
-#else
-# define BITS_PER_LONG 32
-#endif
-
-#define BITS_TO_LONGS(bits) \
-    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
-#define DECLARE_BITMAP(name,bits) \
-    unsigned long name[BITS_TO_LONGS(bits)]
-typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
-
 enum {
     TRCE_SFLAG_SET_AD,
     TRCE_SFLAG_SET_A,

