Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E714CCA7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:41:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoUZ-0005sa-Ty; Wed, 29 Jan 2020 14:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwoUY-0005sC-I3
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:38:54 +0000
X-Inumbo-ID: 108ec0ae-42a5-11ea-8396-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 108ec0ae-42a5-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580308731; x=1611844731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jsomELOSxk2oJ5M+b81/XAuyo+7NXuUKfvG4j96Pg1o=;
 b=fHHIWC3ak0f/MwK8PWgg0pPKm5VFyRy45A2qyBXsGHGRoNJxtseLRbyq
 qxiJTQtnc7zXvyL6I/vGnwydJxT0pjBCvpezyq/68BuDLdETWMWvjo6ET
 0KjaOxeOMcYjbYMywIVn7ldN2AiogA6jqd4dMc8CrYOJ+f3yy8uAnQzCB 4=;
IronPort-SDR: ttIF6g94i3VSY0nXcI+QpzdhmXQvpqHPjXVV1W5AcsSc5C/8c5xL87mJ6IdPZKyzvZ/DfyTeuA
 I5tEMqkMRugA==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="13406310"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jan 2020 14:38:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id C477EA2AFF
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 14:38:37 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 14:38:37 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 14:38:36 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 14:38:34 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 14:38:27 +0000
Message-ID: <20200129143831.1369-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 0/4] purge free_shared_domheap_page()
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

UGF1bCBEdXJyYW50ICg0KToKICB4ODYgLyB2bXg6IG1vdmUgdGVhcmRvd24gZnJvbSBkb21haW5f
ZGVzdHJveSgpLi4uCiAgbW06IG1vZGlmeSBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHRvIGJl
dHRlciBoYW5kbGUgYSB6ZXJvCiAgICBhZGp1c3RtZW50CiAgbW06IG1ha2UgTUVNRl9ub19yZWZj
b3VudCBwYWdlcyBzYWZlIHRvIGFzc2lnbgogIHg4NiAvIHZteDogdXNlIGEgTUVNRl9ub19yZWZj
b3VudCBkb21oZWFwIHBhZ2UgZm9yCiAgICBBUElDX0RFRkFVTFRfUEhZU19CQVNFCgogeGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgICB8IDEwIC0tLS0tLS0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAg
ICAgICAgfCAgMyArLS0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgIHwgNDMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAg
IHwgIDUgKysrKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgIHwgIDkgKysrKy0tLS0KIDYg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
