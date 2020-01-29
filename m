Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649114CF5A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 18:13:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqrP-0006GY-31; Wed, 29 Jan 2020 17:10:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwqrN-0006GS-S2
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 17:10:37 +0000
X-Inumbo-ID: 44cc5678-42ba-11ea-8926-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44cc5678-42ba-11ea-8926-12813bfff9fa;
 Wed, 29 Jan 2020 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580317838; x=1611853838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v73B9LpfbhEBvaFKv3PmKpX/J9QXYEbG2n9PeUzXXE4=;
 b=qlP2XtxlMxwUmPHYH2JBFLQzy6jxBbi2u4xWf5k0V5+oa7Q42+ztFGY0
 /ZDEb9y9tIPJust6XBLRb6sZnZNZjwGQe10dDz/0AXaG43LjWVD3HnhTF
 8LJsWl0JYOqvn78Vs3pnHWQdbv6jFtUIKsV+ujtE4zJ+ZuGNazN8IrmzY g=;
IronPort-SDR: 2HkoUsvugW+23eouC0VMysudtsgERozIasAvm3bib/1mLFvr2mJydPSBcuRJQSWmmQDUg9rjvL
 1HxdhG5JtNYg==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="14793172"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Jan 2020 17:10:36 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4AB26A2720
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 17:10:35 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 17:10:35 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 17:10:33 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 17:10:31 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 17:10:27 +0000
Message-ID: <20200129171030.1341-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 0/3] purge free_shared_domheap_page()
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

RHJvcCAibW06IG1vZGlmeSBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHRvIGJldHRlciBoYW5k
bGUgYSB6ZXJvCmFkanVzdG1lbnQiLgoKUGF1bCBEdXJyYW50ICgzKToKICB4ODYgLyB2bXg6IG1v
dmUgdGVhcmRvd24gZnJvbSBkb21haW5fZGVzdHJveSgpLi4uCiAgbW06IG1ha2UgcGFnZXMgYWxs
b2NhdGVkIHdpdGggTUVNRl9ub19yZWZjb3VudCBzYWZlIHRvIGFzc2lnbgogIHg4NiAvIHZteDog
dXNlIGEgTUVNRl9ub19yZWZjb3VudCBkb21oZWFwIHBhZ2UgZm9yCiAgICBBUElDX0RFRkFVTFRf
UEhZU19CQVNFCgogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCAyNSArKysrKysrKysrKysr
KystLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICB8IDE1ICsrKystLS0tLS0tLQogeGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oICAgfCAgNSArKystCiB4ZW4vaW5j
bHVkZS9hc20teDg2L21tLmggICB8ICA5ICsrKy0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
ICAgIHwgMTggKysrKysrKy0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygr
KSwgNDEgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
