Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D7719FEF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542544.846526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHY-0006RB-Qa; Thu, 01 Jun 2023 14:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542544.846526; Thu, 01 Jun 2023 14:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHY-0006PX-Kn; Thu, 01 Jun 2023 14:28:04 +0000
Received: by outflank-mailman (input) for mailman id 542544;
 Thu, 01 Jun 2023 14:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHX-0006Od-6m
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:03 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8354966e-0088-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:28:01 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ERr1Sk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:27:53 +0200 (CEST)
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
X-Inumbo-ID: 8354966e-0088-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685629673; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sJriocoYi7qieJcktu3vYQ1uYhv59B5RhT5eGihspvpS/Qr5KvXZbJEqpbPt9+dHOb
    11WkBJhC8ta5pyMFYj5o5VM/EpUNAgXlVGo2e0P+y76vOrHTGkNCdNuL9mWQ2TdOHnyo
    xHIDVoMAdBbM0OKN3LZEXsHGIsaLCEfZLUyeLKEFoOf1qn3qIKhlFfrkBYoL6P41RfQG
    +BMbVPkizCipYeXhQkr1bzsbKSMn54iJT2GAFgyc840XldxA1HC7tKl1qZ7Sw3BOfw4N
    SFe986SMN3qmJ51xSOPGRGBeK6+xD6m9JLRaB03u6eU0J6KpDdokGcGw9fp3RPhXweFg
    KPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629673;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yHH/K7mLKUIuVEhep20I7pu3fZbR52QQbMM0Cljd+e4=;
    b=XRgIqSKsXdDVi8I6JweiJyqIEj5kEPp6r3FYeyOEJgzmYm9wj6faBbNmN0ongQPcO2
    eBUwRLsjjEDQfQaFPfBHfOmHsV14RI3KXfFBgV7mEQF0JfLFjcMoiBLELc09MSqV3EFq
    6kFa0PP7W9hhy6X7jIgwIq3ppxN9J0QvGdMDMwL4XnXEeoHyrzxIixD9Igkbx0uqKbZi
    dvuSg/syyYQeWWF6glmcTXOd3ZhXqeVl45bd6roVKOAIROVCLAE+eFaY+JidoRSpyQ/e
    EJtSPmWck1275GOhltziklOa9adsGDLnYx7OklcjZKFnsYOxf9e/DES59bdXHh/hRNo2
    782w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629673;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yHH/K7mLKUIuVEhep20I7pu3fZbR52QQbMM0Cljd+e4=;
    b=NUxyFsZvRq9KzWZcs8dNGLUTBfCJ2RkB0lnGJy/vAsTmmvBd0yoMnFOhQmebo1k1Ow
    LDJc520CDRnGGAGv1Yb3dmx8TUtGaKTI9sn1rMY4jMMQxhEfHyiC22ob6AlUoAZkX9La
    iXeqQe76DmQCNUOw+SWeKxsAlhjE19s6YWBTPDY9C6sDTEoQCXhhmyYjXVpWTbn8T5bI
    fhm56mL6C7lfoVzqrT+yw9uOJRmQDAsllONOXi1oUiSffhqPg037Fd1iRSEYHQGZspAc
    mkTZlSRiWg2q6e8SWd78Dky8XosBL8ta9cyGmtLQNPiKdUthNY1AYBZ/FAn7AO+cvl+n
    UmtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629673;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yHH/K7mLKUIuVEhep20I7pu3fZbR52QQbMM0Cljd+e4=;
    b=7S/bqvTDfDoEkI4pHVWxU2Ga0h711EvwcxLawl/g9cxzTxAEA0DenCl77W6Ej0mBaE
    rR4oUUQORzhqpn0azACg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 1/7] xentrace: remove unimplemented option from man page
Date: Thu,  1 Jun 2023 16:27:36 +0200
Message-Id: <20230601142742.15489-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601142742.15489-1-olaf@aepfle.de>
References: <20230601142742.15489-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The documented option --usage worked because every unknown option
showed the help.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xentrace.8.pod | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/man/xentrace.8.pod b/docs/man/xentrace.8.pod
index 69aef05f65..4c174a84c0 100644
--- a/docs/man/xentrace.8.pod
+++ b/docs/man/xentrace.8.pod
@@ -69,10 +69,6 @@ set event capture mask. If not specified the TRC_ALL will be used.
 
 =item B<-?>, B<--help>
 
-Give this help list
-
-=item B<--usage>
-
 Give a short usage message
 
 =item B<-V>, B<--version>

