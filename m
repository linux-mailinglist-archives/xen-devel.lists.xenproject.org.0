Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F1C146AD1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:06:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iud4w-0008MX-Mb; Thu, 23 Jan 2020 14:03:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iud4u-0008M6-Fp
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 14:03:24 +0000
X-Inumbo-ID: 1ea7d1dc-3de9-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ea7d1dc-3de9-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579788204; x=1611324204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0OSpCkxgbb45Ar9TZuQOtuQ/qndGg9lpGrrowOYrwY=;
 b=nHxXwMMaowiN/8PkEkqz4yJSdwbfVPkCCUpsW3Gg5HOPIR0wM7rcksco
 8NJeJzFTF9i0zd1VXF0kF3uErDM5rfg+WVVDY5EjCem5pvw77CahVoZg7
 Mmp7q36BwNstmBZ5xOZElP/BNXlhayNap5PkD2WhwVpky1XDsEZhmlUlS I=;
IronPort-SDR: PsV36s4T/pw4kIEF6y77C5r+FSd+0JeBWVLTzPEBb3XgkzOOXwSVYxxhGlQUQ5QdMP1/r2uzsI
 G5Xs8bcEqdtA==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="13777640"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 23 Jan 2020 14:03:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 598CD1A0B9C; Thu, 23 Jan 2020 14:03:19 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 14:03:19 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 14:03:18 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 23 Jan 2020 14:03:09 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 14:03:04 +0000
Message-ID: <20200123140305.21050-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123140305.21050-1-pdurrant@amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/3] x86 / hvm: add
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
LS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6
ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBKdW4gTmFrYWpp
bWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KCnYyOgogLSBNYWtlIHRoZSBuZXcgbWV0aG9kIG9wdGlvbmFsIGFuZCBtYWtlIGl0
IGFuIGFsdGVybmF0aXZlX3ZjYWxsCi0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAg
fCAzICsrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0u
YyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggNDcyM2Y1ZDA5Yy4uZTUxYzA3NzI2OSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCkBAIC03MTUsNiArNzE1LDkgQEAgaW50IGh2bV9kb21haW5faW5pdGlhbGlzZShzdHJ1
Y3QgZG9tYWluICpkKQogCiB2b2lkIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3Ry
dWN0IGRvbWFpbiAqZCkKIHsKKyAgICBpZiAoIGh2bV9mdW5jcy5kb21haW5fcmVsaW5xdWlzaF9y
ZXNvdXJjZXMgKQorICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3MuZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzLCBkKTsKKwogICAgIGlmICggaHZtX2Z1bmNzLm5odm1fZG9tYWlu
X3JlbGlucXVpc2hfcmVzb3VyY2VzICkKICAgICAgICAgaHZtX2Z1bmNzLm5odm1fZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzKGQpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9odm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCmluZGV4IDA5NzkzYzEy
ZTkuLjllYWIxZDc0OTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCkBAIC0xMDcsNiArMTA3LDcgQEAg
c3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSB7CiAgICAgICogSW5pdGlhbGlzZS9kZXN0cm95IEhW
TSBkb21haW4vdmNwdSByZXNvdXJjZXMKICAgICAgKi8KICAgICBpbnQgICgqZG9tYWluX2luaXRp
YWxpc2UpKHN0cnVjdCBkb21haW4gKmQpOworICAgIHZvaWQgKCpkb21haW5fcmVsaW5xdWlzaF9y
ZXNvdXJjZXMpKHN0cnVjdCBkb21haW4gKmQpOwogICAgIHZvaWQgKCpkb21haW5fZGVzdHJveSko
c3RydWN0IGRvbWFpbiAqZCk7CiAgICAgaW50ICAoKnZjcHVfaW5pdGlhbGlzZSkoc3RydWN0IHZj
cHUgKnYpOwogICAgIHZvaWQgKCp2Y3B1X2Rlc3Ryb3kpKHN0cnVjdCB2Y3B1ICp2KTsKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
