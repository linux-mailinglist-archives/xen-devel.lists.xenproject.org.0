Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B6351540
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104459.199789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWy-0005hx-I8; Thu, 01 Apr 2021 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104459.199789; Thu, 01 Apr 2021 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWy-0005hL-Cr; Thu, 01 Apr 2021 13:38:40 +0000
Received: by outflank-mailman (input) for mailman id 104459;
 Thu, 01 Apr 2021 13:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxWx-0005gw-5G
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b86e546-3146-44dc-87e6-bd7edd66feb3;
 Thu, 01 Apr 2021 13:38:38 +0000 (UTC)
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
X-Inumbo-ID: 2b86e546-3146-44dc-87e6-bd7edd66feb3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RENu4VPkq7CZTY2uubkOwUponbB37CjwAPN2tWb3QPQ=;
  b=LOWTcd7HNSrnLbdC1+oJgrFjBT9DhyPnupmV+3nqZPIalpafGIyhC1A0
   Z+EU6A2ZNT2uxWEfFES5n/S/lkhZLjtqHty4a5uXRAbjslks/2aFPMQDr
   Lin1UKqlORPLnStGlwg90wPNWO9b4lfmzp0sQe40V6uxa+6wsHezcFAOk
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QD5jksNdSs0WP/dMFevs60ZrIP/RL8woQd2p9lshtz/hgXw5o3AXyMLBbZJuhOOLezLCzEabp6
 mhjSvGnpmi3w9yArycdmjLmq8/trrFIcjV7gjYZNGhUHs5GcsQKBfeYjI3IhyCRZFaSGIQygO9
 bHW8rgYRBGeNHezsbcwEAu1B6BwtnMuFZ7vU3G/e3goxgSUqP2csU0jBK2DgNtxe4cxieBnWvQ
 J3f0BWcMgdXhBri3Awzc0T/aHQ4EL/Zuzt9BC++lbsT+KXI9U6p6Gj0uKpbd/GnlW1iwYCEHAJ
 ec8=
X-SBRS: 5.1
X-MesageID: 40698206
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:q3kK/ah1vk8FH5Cauu/9cbBHOnBQXyl13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbakvD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShLbOVa4x59GkKnFCRNNWt7LL4YML
 bZ2cZdvTqnfh0sH6OGL10IRfLKqdGOtL+OW29kOzcd5AODjSyl5dfBenD14j4kXzxC2rsk+2
 Te+jaJg5mLiP2n1gTak1ba8pU+orDc4+FeD8+BgNV9EESJti+UYu1aOoGqjXQOj8yErH0rl9
 TNpBlIBbUN11rhOlubjDGo9w3p0DMF42Lvx1mCkRLY0LLEbQN/MeVtr8Z0dQbY9loBsbhHod
 N29lPcjbV7J1fhmznw/NfBXR0CrDvFnVMS1dQ9olYadKl2Us4pkaUvuHl7Pb1FIQfBrKcgK+
 VqBNG03ocqTXqqK0r3k0Mq/MahRR0Ib2+7a3lHgOO5+R5Mkkt0ykMJrfZv4ksoxdYGR55I6/
 +sCNUSqJh+CssfbadKDOwcW8eACmvUXRLWMG6JSG6Xbp06Bw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40698206"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
	"Ian Jackson" <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15 2/7] CHANGELOG.md: xl PCI configuration doc, xenstore MTU entries
Date: Thu, 1 Apr 2021 14:38:22 +0100
Message-ID: <20210401133827.362216-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Paul Durrant <paul@xen.org>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f7ce6682b9..086a0e50d0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Switched MSR accesses to deny by default policy.
  - Intel Processor Trace support (Tech Preview)
  - Named PCI devices for xl/libxl
+ - Improved documentation for xl PCI configuration format
  - Support for zstd-compressed dom0 (x86) and domU kernels
  - Library improvements from NetBSD ports upstreamed
  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
@@ -23,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - x86: Allow domains to use AVX-VNNI instructions
  - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
  - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
-
+ - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
 
 ### Removed / support downgraded
 
-- 
2.30.2


