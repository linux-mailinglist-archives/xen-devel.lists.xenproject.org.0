Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0D148B52
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 16:34:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv0vW-0006mm-K7; Fri, 24 Jan 2020 15:31:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv0vV-0006mh-Gn
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 15:31:17 +0000
X-Inumbo-ID: 9024146c-3ebe-11ea-b833-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9024146c-3ebe-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579879878; x=1611415878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1Frxf5HPTwRUTP+o9zS5og7PNjKmC3n8xlOOMifbFI=;
 b=EQUAlM3/hRzNjVwvK5M3sbPRft6+6XaKLTzAvVDpPmRMpreWEpT51v3f
 T0/B2dxscNjITNdJmzM8EBiWAnnp5jf7bl44cWq9LR4t1xIwoB/bU/F2k
 //3+TrTG4wkKRF1NqnBnzHTaWNXXFs+WcDDZaXq72P7Kf/atDtwjzfino Y=;
IronPort-SDR: WcgEh7Cbza+JJKAP0CIMkQD7/c1vnPcySj+mzXWUfgd2kZ+tXFsITLUV6uVL9aZmnDlocvGYwF
 DkpasRakigyQ==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208";a="13955559"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 24 Jan 2020 15:31:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id A648D221CA8; Fri, 24 Jan 2020 15:31:14 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 15:31:14 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 15:31:13 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 24 Jan 2020 15:31:10 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 Jan 2020 15:30:58 +0000
Message-ID: <20200124153103.18321-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124153103.18321-1-pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 2/7] x86 / hvm: add
 domain_relinquish_resources() method
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIHR3byBmdW5jdGlvbnMgaW4gaHZtLmMgdG8gZGVhbCB3aXRoIHRlYXItZG93biBh
bmQgYSBkb21haW46Cmh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgaHZtX2Rv
bWFpbl9kZXN0cm95KCkuIEhvd2V2ZXIsIG9ubHkKdGhlIGxhdHRlciBoYXMgYW4gYXNzb2NpYXRl
ZCBtZXRob2QgaW4gJ2h2bV9mdW5jcycuIFRoaXMgcGF0Y2ggYWRkcwphIG1ldGhvZCBmb3IgdGhl
IGZvcm1lci4KCkEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGRlZmluZSBhIFZNWCBpbXBsZW1lbnRh
dGlvbi4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBKdW4g
TmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KCnYyOgogLSBNYWtlIHRoZSBuZXcgbWV0aG9kIG9wdGlvbmFsIGFuZCBt
YWtlIGl0IGFuIGFsdGVybmF0aXZlX3ZjYWxsCi0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAg
ICAgICAgfCAzICsrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggZDg5OTU5NDg4OC4uNjMzM2Fl
NmFiYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jCkBAIC03MTYsNiArNzE2LDkgQEAgaW50IGh2bV9kb21haW5faW5pdGlhbGlz
ZShzdHJ1Y3QgZG9tYWluICpkKQogCiB2b2lkIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJj
ZXMoc3RydWN0IGRvbWFpbiAqZCkKIHsKKyAgICBpZiAoIGh2bV9mdW5jcy5kb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMgKQorICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3MuZG9t
YWluX3JlbGlucXVpc2hfcmVzb3VyY2VzLCBkKTsKKwogICAgIGlmICggaHZtX2Z1bmNzLm5odm1f
ZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzICkKICAgICAgICAgaHZtX2Z1bmNzLm5odm1fZG9t
YWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKGQpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9odm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCmluZGV4IDA5
NzkzYzEyZTkuLjllYWIxZDc0OTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L2h2bS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCkBAIC0xMDcsNiArMTA3
LDcgQEAgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSB7CiAgICAgICogSW5pdGlhbGlzZS9kZXN0
cm95IEhWTSBkb21haW4vdmNwdSByZXNvdXJjZXMKICAgICAgKi8KICAgICBpbnQgICgqZG9tYWlu
X2luaXRpYWxpc2UpKHN0cnVjdCBkb21haW4gKmQpOworICAgIHZvaWQgKCpkb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMpKHN0cnVjdCBkb21haW4gKmQpOwogICAgIHZvaWQgKCpkb21haW5fZGVz
dHJveSkoc3RydWN0IGRvbWFpbiAqZCk7CiAgICAgaW50ICAoKnZjcHVfaW5pdGlhbGlzZSkoc3Ry
dWN0IHZjcHUgKnYpOwogICAgIHZvaWQgKCp2Y3B1X2Rlc3Ryb3kpKHN0cnVjdCB2Y3B1ICp2KTsK
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
