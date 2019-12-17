Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E09122CF6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 14:35:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihCy6-0005vm-5m; Tue, 17 Dec 2019 13:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qn7z=2H=amazon.com=prvs=247c3a56a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihCy4-0005vH-Jd
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:32:52 +0000
X-Inumbo-ID: b49f08e8-20d1-11ea-88e7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b49f08e8-20d1-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576589564; x=1608125564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FAYXJj84UoQTVVBnxHAl8dNCc4arpYx+KqB8fudTUbg=;
 b=TXZ9TKbUj1RFjYS/75pk0n2x5AazjM0YviJfhWWlHEGbACj4jSaIixQN
 GlN6GenVtknKPI0RHSbb5FcS0Uknqs7GRw4zUdrupurolZskPpuIfkDvW
 Lfj9gCu7YFAExmunxYEhW6UzYkOlJEA/LZmH0hgnMltc50AAzmXHUzV2G c=;
IronPort-SDR: FzkCJqPLkG3ZjnmxE5thsvs7TUTJE/iTfT8QiWibj+CfSjnm/tx4FJL13ae/9AZAkjY69DAtnI
 V9tBGVig7/oQ==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="15379907"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Dec 2019 13:32:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B7154281EA1; Tue, 17 Dec 2019 13:32:27 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 13:32:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:32:26 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 17 Dec 2019 13:32:24 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 13:32:17 +0000
Message-ID: <20191217133218.27085-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217133218.27085-1-pdurrant@amazon.com>
References: <20191217133218.27085-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net-next 2/3] xen-netback: switch state to
 InitWait at the end of netback_probe()...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uYXMgdGhlIGNvbW1lbnQgYWJvdmUgdGhlIGZ1bmN0aW9uIHN0YXRlcy4KClRoZSBzd2l0Y2gg
dG8gSW5pdGlhbGlzaW5nIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24gaXMgc29tZXdoYXQg
Ym9ndXMKYXMgdGhlIHRvb2xzdGFjayB3aWxsIGhhdmUgc2V0IHRoYXQgaW5pdGlhbCBzdGF0ZSBh
bnl3YXkuIFRvIGJlaGF2ZQpjb3JyZWN0bHksIGEgYmFja2VuZCBzaG91bGQgc3dpdGNoIHRvIElu
aXRXYWl0IG9uY2UgaXQgaGFzIHNldCB1cCBhbGwKeGVuc3RvcmUgdmFsdWVzIHRoYXQgbWF5IGJl
IHJlcXVpcmVkIGJ5IGEgaW5pdGlhbGlzaW5nIGZyb250ZW5kLiBUaGlzCnBhdGNoIGNhbGxzIGJh
Y2tlbmRfc3dpdGNoX3N0YXRlKCkgdG8gbWFrZSB0aGUgdHJhbnNpdGlvbiBhdCB0aGUKYXBwcm9w
cmlhdGUgcG9pbnQuCgpOT1RFOiBiYWNrZW5kX3N3aXRjaF9zdGF0ZSgpIGlnbm9yZXMgZXJyb3Jz
IGZyb20geGVuYnVzX3N3aXRjaF9zdGF0ZSgpCiAgICAgIGFuZCBzbyB0aGlzIHBhdGNoIHJlbW92
ZXMgYW4gZXJyb3IgcGF0aCBmcm9tIG5ldGJhY2tfcHJvYmUoKS4gVGhpcwogICAgICBtZWFucyBh
IGZhaWx1cmUgdG8gY2hhbmdlIHN0YXRlIGF0IHRoaXMgc3RhZ2UgKGluIHRoZSBhYnNlbmNlIG9m
CiAgICAgIG90aGVyIGZhaWx1cmVzKSB3aWxsIGxlYXZlIHRoZSBkZXZpY2UgaW5zdGFudGlhdGVk
LiBUaGlzIGlzIGhpZ2hseQogICAgICB1bmxpa2xleSB0byBoYXBwZW4gYXMgYSBmYWlsdXJlIHRv
IGNoYW5nZSBzdGF0ZSB3b3VsZCBpbmRpY2F0ZSBhCiAgICAgIGZhaWx1cmUgdG8gd3JpdGUgdG8g
eGVuc3RvcmUsIGFuZCB0aGF0IHdpbGwgdHJpZ2dlciBvdGhlciBlcnJvcgogICAgICBwYXRocy4g
QWxzbywgYSAnc3R1Y2snIGRldmljZSBjYW4gc3RpbGwgYmUgY2xlYW5lZCB1cCB1c2luZyAndW5i
aW5kJwogICAgICBpbiBhbnkgY2FzZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+CkNj
OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQ2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZl
bUBkYXZlbWxvZnQubmV0PgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jIHwg
NyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jIGIvZHJpdmVy
cy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMKaW5kZXggYmI2MTMxNmQ3OWRlLi42ODJlNWUyMDk3
MWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCisrKyBiL2Ry
aXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCkBAIC05OTIsMTEgKzk5Miw2IEBAIHN0YXRp
YyBpbnQgbmV0YmFja19wcm9iZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LAogCWJlLT5kZXYg
PSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRldiwgYmUpOwogCi0JYmUtPnN0YXRlID0g
WGVuYnVzU3RhdGVJbml0aWFsaXNpbmc7Ci0JZXJyID0geGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYs
IFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nKTsKLQlpZiAoZXJyKQotCQlnb3RvIGZhaWw7Ci0KIAlz
ZyA9IDE7CiAKIAlkbyB7CkBAIC0xMDk4LDYgKzEwOTMsOCBAQCBzdGF0aWMgaW50IG5ldGJhY2tf
cHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAlpZiAoZXJyKQogCQlwcl9kZWJ1Zygi
RXJyb3Igd3JpdGluZyBmZWF0dXJlLWN0cmwtcmluZ1xuIik7CiAKKwliYWNrZW5kX3N3aXRjaF9z
dGF0ZShiZSwgWGVuYnVzU3RhdGVJbml0V2FpdCk7CisKIAlzY3JpcHQgPSB4ZW5idXNfcmVhZChY
QlRfTklMLCBkZXYtPm5vZGVuYW1lLCAic2NyaXB0IiwgTlVMTCk7CiAJaWYgKElTX0VSUihzY3Jp
cHQpKSB7CiAJCWVyciA9IFBUUl9FUlIoc2NyaXB0KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
