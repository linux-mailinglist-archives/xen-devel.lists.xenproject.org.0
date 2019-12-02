Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB810E9BA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 12:44:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibk5C-00047y-JM; Mon, 02 Dec 2019 11:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oqAn=ZY=amazon.com=prvs=23249dff4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ibk5B-00047s-Eu
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 11:41:37 +0000
X-Inumbo-ID: b28a7c7a-14f8-11ea-a407-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b28a7c7a-14f8-11ea-a407-12813bfff9fa;
 Mon, 02 Dec 2019 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575286898; x=1606822898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1CNpxHsr04DmQEhNbChHZtBy2La84Ew3uSgqIRYBJfE=;
 b=CgEP29dw0eaAIIJ/Pw8wUHMX1S52Sur96GBmLauf2o5MHZCkuaE4KPtQ
 Va7v+3UlIifQPKh//S5kqLAn0ZX2ER2/PyGkkmqCUlMibgLhti1cYex9v
 3Dxj7cJf3kT1h3LDWnQDwxSeTNiBhsRfHxwVV5kuBeRUv0tGadQcKrMzv 4=;
IronPort-SDR: uYWZRtp/AZXVtP7mb9gFHup7uOaxFm9cE+qY0YoiDnmMSBXM+Vzrru3HCnDP5PGCOXhAgaRv9S
 dTndu2QfCZrQ==
X-IronPort-AV: E=Sophos;i="5.69,268,1571702400"; 
   d="scan'208";a="6617694"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 02 Dec 2019 11:41:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 58C3BA18B7; Mon,  2 Dec 2019 11:41:34 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:33 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:33 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 2 Dec 2019 11:41:30 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
Date: Mon, 2 Dec 2019 11:41:15 +0000
Message-ID: <20191202114117.1264-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/2] allow xen-blkback to be cleanly unloaded
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICgyKToKICB4ZW4veGVuYnVzOiByZWZlcmVuY2UgY291bnQgcmVnaXN0ZXJl
ZCBtb2R1bGVzCiAgeGVuLWJsa2JhY2s6IGFsbG93IG1vZHVsZSB0byBiZSBjbGVhbmx5IHVubG9h
ZGVkCgogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgfCAgOCArKysrKysrKwog
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCAgfCAgMyArKysKIGRyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2sveGVuYnVzLmMgIHwgMTEgKysrKysrKysrKysKIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyAgIHwgMTMgKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2Vk
LCAzNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
