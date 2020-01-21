Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539E7143C78
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:03:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itsCv-0006Nz-LA; Tue, 21 Jan 2020 12:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zZg3=3K=amazon.co.uk=prvs=282bd3163=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itsCu-0006Nm-Fl
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:00:32 +0000
X-Inumbo-ID: 9f72684a-3c45-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f72684a-3c45-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579608032; x=1611144032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZabBX3KiZvi42uIkfPXKZ3Ru9a9qzkCQ51NWgFQVis=;
 b=c1FhXzhzMW2+JF52Nn/SBKVq7cjfMwyJreqvuO7bwwzxSgoCJ043uowk
 jZIVf7LKBX2sGkXKenS/pG09+Hd/3RCYYRbeqAIO/tgB/X49DqC2hQlft
 b3ZBdeHdM8fWVOMCJU1Eq38OOMuvirz39USRYa7dFwjmXahLeA/uab97x U=;
IronPort-SDR: rHcw7/6wG3XXSRUECZVE5fVGqQzR7xyBCvM/bT1biDAWAAp6rZskM8BUBZJPoM9wbRwm1pBOy1
 KYrIE7vAiP6Q==
X-IronPort-AV: E=Sophos;i="5.70,345,1574121600"; d="scan'208";a="11690259"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Jan 2020 12:00:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2E1C2A213A; Tue, 21 Jan 2020 12:00:20 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 12:00:19 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 12:00:18 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 21 Jan 2020 12:00:16 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 12:00:08 +0000
Message-ID: <20200121120009.1767-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121120009.1767-1-pdurrant@amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 2/3] x86 / hvm: add
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
IGZvcm1lciBhbmQgc3R1YiBkZWZpbml0aW9ucyBmb3IgU1ZNIGFuZCBWTVguCgpUaGUgVk1YIG1l
dGhvZCB3aWxsIGJlIHVzZWQgYnkgYSBzdWJzZXF1ZW50IHBhdGNoLgoKU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVs
LmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9odm0vaHZtLmMgICAgICAgIHwgMiArKwogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMg
ICAgfCA1ICsrKysrCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICB8IDUgKysrKysKIHhl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIHwgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYwppbmRleCA0NzIzZjVkMDljLi42NjlkY2U2NzMxIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAg
LTcxNSw2ICs3MTUsOCBAQCBpbnQgaHZtX2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4g
KmQpCiAKIHZvaWQgaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWlu
ICpkKQogeworICAgIGh2bV9mdW5jcy5kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoZCk7CisK
ICAgICBpZiAoIGh2bV9mdW5jcy5uaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyApCiAg
ICAgICAgIGh2bV9mdW5jcy5uaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhkKTsKIApk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYwppbmRleCBiMWMzNzZkNDU1Li4yNDc2OGU4NjgyIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpA
QCAtMTE1NSw2ICsxMTU1LDEwIEBAIHN0YXRpYyBpbnQgc3ZtX2RvbWFpbl9pbml0aWFsaXNlKHN0
cnVjdCBkb21haW4gKmQpCiAgICAgcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIHN2bV9kb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKK3sKK30KKwogc3RhdGlj
IHZvaWQgc3ZtX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpCiB7CiB9CkBAIC0yNDI1
LDYgKzI0MjksNyBAQCBzdGF0aWMgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBfX2luaXRkYXRh
IHN2bV9mdW5jdGlvbl90YWJsZSA9IHsKICAgICAuY3B1X3VwICAgICAgICAgICAgICAgPSBzdm1f
Y3B1X3VwLAogICAgIC5jcHVfZG93biAgICAgICAgICAgICA9IHN2bV9jcHVfZG93biwKICAgICAu
ZG9tYWluX2luaXRpYWxpc2UgICAgPSBzdm1fZG9tYWluX2luaXRpYWxpc2UsCisgICAgLmRvbWFp
bl9yZWxpbnF1aXNoX3Jlc291cmNlcyA9IHN2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMs
CiAgICAgLmRvbWFpbl9kZXN0cm95ICAgICAgID0gc3ZtX2RvbWFpbl9kZXN0cm95LAogICAgIC52
Y3B1X2luaXRpYWxpc2UgICAgICA9IHN2bV92Y3B1X2luaXRpYWxpc2UsCiAgICAgLnZjcHVfZGVz
dHJveSAgICAgICAgID0gc3ZtX3ZjcHVfZGVzdHJveSwKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKaW5kZXggM2Q5MGU2
N2EwNS4uM2ZkM2FjNjFlMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKQEAgLTQyMCw2ICs0MjAsMTAgQEAgc3Rh
dGljIGludCB2bXhfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCkKICAgICByZXR1
cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhz
dHJ1Y3QgZG9tYWluICpkKQoreworfQorCiBzdGF0aWMgdm9pZCB2bXhfZG9tYWluX2Rlc3Ryb3ko
c3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBpZiAoICFoYXNfdmxhcGljKGQpICkKQEAgLTIyNDEs
NiArMjI0NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIF9faW5pdGRhdGEg
dm14X2Z1bmN0aW9uX3RhYmxlID0gewogICAgIC5jcHVfdXBfcHJlcGFyZSAgICAgICA9IHZteF9j
cHVfdXBfcHJlcGFyZSwKICAgICAuY3B1X2RlYWQgICAgICAgICAgICAgPSB2bXhfY3B1X2RlYWQs
CiAgICAgLmRvbWFpbl9pbml0aWFsaXNlICAgID0gdm14X2RvbWFpbl9pbml0aWFsaXNlLAorICAg
IC5kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMgPSB2bXhfZG9tYWluX3JlbGlucXVpc2hfcmVz
b3VyY2VzLAogICAgIC5kb21haW5fZGVzdHJveSAgICAgICA9IHZteF9kb21haW5fZGVzdHJveSwK
ICAgICAudmNwdV9pbml0aWFsaXNlICAgICAgPSB2bXhfdmNwdV9pbml0aWFsaXNlLAogICAgIC52
Y3B1X2Rlc3Ryb3kgICAgICAgICA9IHZteF92Y3B1X2Rlc3Ryb3ksCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
CmluZGV4IDA5NzkzYzEyZTkuLjllYWIxZDc0OTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL2h2bS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCkBAIC0x
MDcsNiArMTA3LDcgQEAgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSB7CiAgICAgICogSW5pdGlh
bGlzZS9kZXN0cm95IEhWTSBkb21haW4vdmNwdSByZXNvdXJjZXMKICAgICAgKi8KICAgICBpbnQg
ICgqZG9tYWluX2luaXRpYWxpc2UpKHN0cnVjdCBkb21haW4gKmQpOworICAgIHZvaWQgKCpkb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMpKHN0cnVjdCBkb21haW4gKmQpOwogICAgIHZvaWQgKCpk
b21haW5fZGVzdHJveSkoc3RydWN0IGRvbWFpbiAqZCk7CiAgICAgaW50ICAoKnZjcHVfaW5pdGlh
bGlzZSkoc3RydWN0IHZjcHUgKnYpOwogICAgIHZvaWQgKCp2Y3B1X2Rlc3Ryb3kpKHN0cnVjdCB2
Y3B1ICp2KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
