Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7536903A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116054.221458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsuB-0006du-KS; Fri, 23 Apr 2021 10:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116054.221458; Fri, 23 Apr 2021 10:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsuB-0006dU-Gn; Fri, 23 Apr 2021 10:19:23 +0000
Received: by outflank-mailman (input) for mailman id 116054;
 Fri, 23 Apr 2021 10:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o87G=JU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZsu9-0006dP-Cg
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:19:21 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d9d7e7-7043-4f1b-ae18-64ca846497f9;
 Fri, 23 Apr 2021 10:19:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.3 DYNA|AUTH)
 with ESMTPSA id g00c91x3NAJEZTL
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 23 Apr 2021 12:19:14 +0200 (CEST)
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
X-Inumbo-ID: 69d9d7e7-7043-4f1b-ae18-64ca846497f9
ARC-Seal: i=1; a=rsa-sha256; t=1619173155; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=X/vZqeQWN4fpmD7u1adhkUP7vIZhU+7ibvrQl+KOw6DmzrcPmvi5L3zxF7padUku72
    AP4zAOCCBNTBERhVf5W5ApYcGI0dtMcBt9Sc46kD8i9wkhMBuEXMyyrAMJS2uePDmDy/
    wQ2rIJd/1Fnl/R7rTR3e5HVTrAg9TQsKzgJzWCbHvXPK0JNE7hJ9hpkkOsRbQ4MIPG1K
    yJEdb12XXw/F+WdNOSvPA9JiUUSFJ9KsBldIdxbfLDeE+NzF1JqJX7vMNOpyQ9wJvifp
    13/d+RcIuySDnuf11v1cPyRtGI6XsmJ5SREoEuj86yu3z9kNIeqHZsMnX5SSVtWukkwe
    4XGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619173155;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1c/59yaGMP0KFR8kh+rw15Nd5hXXcU0KoDro+7g0wT4=;
    b=WVcxtmC0CRoK8qg8VzG6sqInMWcV3Ee8WQnaA2lSBqoKkZjNmDFovnIy0xB8O/amFe
    Vtbx41jUfcK0cMYwTp5OCwGAE3D2kRJ8tbpbIdXlqrDXzKJLdKjlXuNaNcTGYCehI7Hv
    +VxC43P2yNfW2UNgX3sjmJ9rw6qi7KMXrNsFTXHi2bx29CxPa+R0LsEHXIrYhvOtvgqp
    fqDeJWWaI0VEvJ9DhJH3Blb/HQfPcIfgD9vr9TrlNIf+Gseo1+bF/AQFT+whRD+uldQr
    WuOAuO6bSlSTYkRev8Yw7iJAjmmduBsT6WHuTgGBWtmRvCeNIy6Zg7IOYaZoPVBFlUmk
    W1nA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619173155;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1c/59yaGMP0KFR8kh+rw15Nd5hXXcU0KoDro+7g0wT4=;
    b=SUoZsza/XduQ8RiV1xya10EGK3br7yz9Ydtpl1vkIFXNMtg1tu9oycuslPcedDcaWi
    P82LtJMCm+SRmEMWj5PyTsiaFYClq4DZMZNgnebz5Rxs0uEiLP+JFrfjjNXjxFGMua6U
    TpRA0iDvqpE73RlXJk1VKcS99/NnhRM0zb7PF3V8r6S+NZedOfpHaiufqqbAIKSjMoSh
    H2KA0kvb0AcSFAywQ9/JoE+Cdc1VbugOVSJBXtoV6E1YO2ZJK/X+liv1AG++FFKgTmUD
    S0CbeDuk9bW19tsp7MO84omKM0kjDp1Pw5RRv0kOdq6Cl0/AGNJpaoBaBQPcMo2rPJbG
    YJqA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3RdcLGMdqQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools/init-xenstore-domain: fix description of --param
Date: Fri, 23 Apr 2021 12:19:12 +0200
Message-Id: <20210423101912.7073-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The string is for the binary within the domain, not for the domain itself.

Fixes commit 83c365e6395f39c7ff91785b400682173d5e5d04

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/helpers/init-xenstore-domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..8543a5efd6 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -58,7 +58,7 @@ static void usage(void)
 "  --memory <memory size>     size of the domain in MB, mandatory\n"
 "  --flask <flask-label>      optional flask label of the domain\n"
 "  --ramdisk <ramdisk-file>   optional ramdisk file for the domain\n"
-"  --param <cmdline>          optional additional parameters for the domain\n"
+"  --param <cmdline>          optional additional parameters for xenstored\n"
 "  --name <name>              name of the domain (default: Xenstore)\n"
 "  --maxmem <max size>        maximum memory size in the format:\n"
 "                             <MB val>|<a>/<b>|<MB val>:<a>/<b>\n"

