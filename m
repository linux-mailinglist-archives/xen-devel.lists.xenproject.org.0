Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983213A9B17
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142942.263647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1N-0000dI-Bh; Wed, 16 Jun 2021 12:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142942.263647; Wed, 16 Jun 2021 12:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1N-0000WM-56; Wed, 16 Jun 2021 12:51:53 +0000
Received: by outflank-mailman (input) for mailman id 142942;
 Wed, 16 Jun 2021 12:51:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1L-0006lZ-0A
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:51 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43aa6e05-a993-430c-9968-2ac1ce447547;
 Wed, 16 Jun 2021 12:51:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpbtlx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:37 +0200 (CEST)
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
X-Inumbo-ID: 43aa6e05-a993-430c-9968-2ac1ce447547
ARC-Seal: i=1; a=rsa-sha256; t=1623847897; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ODGNr+uLUxhmfATeLKkGIHOLU7hPqdY/15IH6h60god/q+pChYN/+cU/VtTjPuTghE
    jO3D94kvRZV6Ghcif00Qn7nAg5e6aZ24xw5UuRhJneWquP5pzoRrnlrLhyf5ef8fiFM7
    X00POAishpBGFDOoOnR+wLUfUfGm2WO7MbeDjCnwSQL5G9mm5rsYzh3FfUQv5NiBtmUz
    E3j2vwEWDaQlZRVeWPnZXFLDYnib22vpQML1mYppvhx/y6dJuAXSW2Bpizg+dgTJKmZF
    AV8db9yNq6tkbHzr/stXZB7a1DcJYEVGcHxh0E2fhDE6HdRFON18uBiaffB7DKIh3DIR
    m3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847897;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ex4r4d11Mg1k2Zn9qFLItgRI9LdfJn43Y1sVEepvWiU=;
    b=ElVLRXcEYGZ3OxVQGsKXyhDRMLIeRmWr/Lkb/L3jeDK4+X10Bth8quN5EG31PNmK6N
    MT/ImowTtg+rh41UDlCSHPGXI6AMt6Y4dC/zB1xQu5x/nAEg/0SXlxT3c2LfoTDZLSA5
    hD0cTPXB/a0xPaND1wObq1JViiEJTf1647uG+UON/Wd/YtqRXb5AYPgm1L9p7sa2KUXN
    4Cn+UgXWFAxZIGhvAKVkIOVJ5wR6M63A9NXClgqGJ1KYJm/LqrgcbOPUsylFop8qU3ah
    ZeC5i8Qzfd8H6UdET/GYRPRMXR/hbFYy0l6JgKx1+43KGE1PDry4SSMILYrtvgo91F/W
    zR7w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847897;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ex4r4d11Mg1k2Zn9qFLItgRI9LdfJn43Y1sVEepvWiU=;
    b=rdPVMskwM4FKzs88imzG5wXXgdzUPInSgw0NFn1sl+Dzq3JBU3VUXKySfJ6qe2EzVz
    2ZDqzXJOgseB/2eka0fb4Z60lHbMp27kxYSX/UjquR6H8+1xEmwKM1FlI9d4cYQEYCB5
    IYZK6hnWD4msa5fEnx83JgfMkyLHZSDPrGuGW2y0quwR86rL7jztf+w+kb6X8+uE4E1/
    ELJWvIJmzCxcPiBOTeR9pR4nZ15S5JF2HEp057EUeAU/TMhUSrBljTT1wpb8NC7StN9u
    9qYjlaiREmgnFxRnwjvtGuq/LMMcr7FGHcOqx0S20QlqEgdQszkC+65poKZoonPinfQQ
    ocBQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 08/36] tools: use sr_is_known_page_type
Date: Wed, 16 Jun 2021 14:51:01 +0200
Message-Id: <20210616125129.26563-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify pfn type on sending side, also verify incoming batch of pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>

v02:
- use sr_is_known_page_type instead of xc_is_known_page_type
---
 tools/libs/saverestore/restore.c | 3 +--
 tools/libs/saverestore/save.c    | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index be259a1c6b..324b9050e2 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -406,8 +406,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( sr_is_known_page_type(type) == false )
         {
             ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index ae3e8797d0..6f820ea432 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( sr_is_known_page_type(types[i]) == false )
+        {
+            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:

