Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7287351548
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104472.199860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXO-0006Ay-FM; Thu, 01 Apr 2021 13:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104472.199860; Thu, 01 Apr 2021 13:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXO-0006AK-95; Thu, 01 Apr 2021 13:39:06 +0000
Received: by outflank-mailman (input) for mailman id 104472;
 Thu, 01 Apr 2021 13:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxXM-0005gw-4G
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:39:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74176d82-3484-4845-a7aa-d68fb9f381eb;
 Thu, 01 Apr 2021 13:38:40 +0000 (UTC)
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
X-Inumbo-ID: 74176d82-3484-4845-a7aa-d68fb9f381eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Cwda7hvpLKLiOQOMp9r6kfCTOsPTlqzOoOijVd/CF0=;
  b=B11ehphShE4o05dLLS8u2gojF28Y3e4T1PuLZs91UmV/nT/Vnwd3dYrX
   /HoxOL4BFDSCgdj2IGSMbJoD6apXUSo1r+nOQ/L7+5pz/NVzmqID4//T1
   H9n1BN0f+Kw659Y9jiZBnX92yetVun9frBSVnQME3oMjI7IRwS4s+mhms
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2gFl06xf/DpDln0vux+wr1cKad4T7roFUaDLtEu+RG8dauZt8CqKby0tz5+BoqGPsWyX0kcQ3C
 mjwsweqFqrH3yuAvq90tMZR0WgF8GoGRlG+63AzjL09qHO6y3Ki9kyWTeH8/fDiJ3DsIEs3B0A
 vzg1OB3GOnbf5mVYIo9yCFyXGf/yqwVyAo+wqxaq/I3PO8dvcQL20BAxgxr74ZmrBFZNrFXVUz
 cBLi6bsip/2xbeSzpoLBFLMHE+QAUBiiy7pGUyChKb/LsIWKDg9q4NwLkBcaiWtUw5djHVfRi0
 cgU=
X-SBRS: 5.1
X-MesageID: 40698211
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bH7E96h9uW3o+1PC2DFnize3nHBQXyl13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbakvD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShLbOVa4x59GkKnFCRNNWt7LL4YML
 bZ2cZdvTqnfh0sH6OGL10IRfLKqdGOtL+OW29kOzcd5AODjSyl5dfBenD14j4kXzxC2rsk+2
 Te+jaJg5mLiP2n1gTak1ba8pU+orDc4+FeD8+BgNV9EESJti+UYu1aOoGqjXQOj8yErH0rl9
 TNpBlIBbUN11rhOlubjDGo9w3p0DMF42Lvx1mCkRLY0LLEbQN/MeVtr8Z0dQbY9loBsbhHod
 N29lPcjbV7J1fhmznw/NfBXR0CrDvFnVMS1dQ9olYadKl2Us4pkaUvuHl7Pb1FIQfBrKcgK+
 VqBNG03ocqTXqqK0r3k0Mq/MahRR0Ib2+7a3lHgOO5+R5Mkkt0ykMJrfZv4ksoxdYGR55I6/
 +sCNUSqJh+CssfbadKDOwcW8eACmvUXRLWMG6JSG6Xbp06Bw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40698211"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>
Subject: [PATCH for-4.15 4/7] CHANGELOG.md: Mention various ARM errata
Date: Thu, 1 Apr 2021 14:38:24 +0100
Message-ID: <20210401133827.362216-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index a12dab1c33..b3325a8371 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
  - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
  - Some additional affordances in various xl subcommands.
+ - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522
 
 ### Removed / support downgraded
 
-- 
2.30.2


