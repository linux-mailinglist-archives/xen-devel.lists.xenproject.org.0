Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581A214EF15
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:04:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXnz-0005ve-90; Fri, 31 Jan 2020 15:01:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixXnx-0005vV-QD
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:01:57 +0000
X-Inumbo-ID: a0217ed2-443a-11ea-a933-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0217ed2-443a-11ea-a933-bc764e2007e4;
 Fri, 31 Jan 2020 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580482918; x=1612018918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TsPomRxi83w4jxEEvSxBq4v/vzEYIDZVuW5ccWSULaw=;
 b=TOWgt3Tp4JhdXS6cl5qLSRjHwNfhHTH6PqYLbAhcs2yF78EbH03sEJX0
 tEE7yQ6//2FdObbnn08oTBcNQOdnP7H74w0rmouhquFEeWm75eOv8aZK+
 sEletdDowclLstXt4O9TIE6BQS7pehpqDsfWKfplUCMUEMgCF1m+JLBCP g=;
IronPort-SDR: OLClPYiO6wnkoEG47kHNDxMx2vYEINmz29uOw+9VpgoHu1IOLnzgblP7e5hw6gK7E3ZD8HeVH0
 fhdbECwXeN+A==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="15640778"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 31 Jan 2020 15:01:55 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 53EA2A2470; Fri, 31 Jan 2020 15:01:54 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:01:54 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:01:53 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 31 Jan 2020 15:01:50 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 15:01:42 +0000
Message-ID: <20200131150149.2008-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 0/7] xl/libxl: domid allocation/preservation
 changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICg3KToKICBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YgSU5WQUxJRF9ET01J
RCB0byB0aGUgQVBJCiAgbGlieGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdAog
IGxpYnhsOiBnZW5lcmFsaXNlIGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaygpCiAgbGlieGw6
IGFkZCBpbmZyYXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRzCiAg
bGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5k
b20gZG9taWQKICB4bC5jb25mOiBpbnRyb2R1Y2UgJ2RvbWlkX3BvbGljeScKICB4bDogYWxsb3cg
ZG9taWQgdG8gYmUgcHJlc2VydmVkIG9uIHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCgogZG9jcy9t
YW4veGwuMS5wb2QuaW4gICAgICAgICAgfCAgMTQgKysrCiBkb2NzL21hbi94bC5jb25mLjUucG9k
ICAgICAgICB8ICAxMCArKwogdG9vbHMvZXhhbXBsZXMveGwuY29uZiAgICAgICAgfCAgIDQgKwog
dG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMgfCAgMzAgKysrKysKIHRvb2xzL2xpYnhsL2xp
YnhsLmggICAgICAgICAgIHwgIDE1ICsrLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICAg
fCAxMjUgKysrKysrKysrKysrKystLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgICAg
fCAgIDQgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgIHwgIDEyICstCiB0b29scy9s
aWJ4bC9saWJ4bF9kbS5jICAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMg
ICAgICAgfCAgMTIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jICAgIHwgMjE4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmMgIHwgIDY3ICsrKysrKystLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICB8ICAz
MCArKystLQogdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgICAgICAgfCAgIDggKy0KIHRvb2xzL2xp
YnhsL2xpYnhsX3BjaS5jICAgICAgIHwgICA0ICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwgICB8ICAgMSArCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAgICB8ICAgOCArLQogdG9v
bHMveGwveGwuYyAgICAgICAgICAgICAgICAgfCAgMTAgKysKIHRvb2xzL3hsL3hsLmggICAgICAg
ICAgICAgICAgIHwgICAyICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgIHwgICA2ICst
CiB0b29scy94bC94bF9taWdyYXRlLmMgICAgICAgICB8ICAxNSArKy0KIHRvb2xzL3hsL3hsX3Nh
dmVyZXN0b3JlLmMgICAgIHwgIDE5ICsrLQogdG9vbHMveGwveGxfdXRpbHMuaCAgICAgICAgICAg
fCAgIDIgLQogdG9vbHMveGwveGxfdm1jb250cm9sLmMgICAgICAgfCAgIDMgKwogeGVuL2luY2x1
ZGUvcHVibGljL3hlbi5oICAgICAgfCAgIDMgKwogMjUgZmlsZXMgY2hhbmdlZCwgNTE3IGluc2Vy
dGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+
CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWls
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
