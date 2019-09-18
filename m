Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8078B629D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 14:00:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYaq-0000Na-Q0; Wed, 18 Sep 2019 11:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAYap-0000Ms-0h
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:57:55 +0000
X-Inumbo-ID: 88a12ddc-da0b-11e9-962f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88a12ddc-da0b-11e9-962f-12813bfff9fa;
 Wed, 18 Sep 2019 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568807868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aPsmKiHtye2Xrg7pQcqeyGPyIVJnXtNBUKlRejZK/IQ=;
 b=a3gm0PVE62wsMaNUlLIz+W6aNIsKQBxBAtb8zm7sgUOx165CaPXy67Qj
 DC7LmvBndRpuc9NaZlDq7wGDnZuX1XbWilOeqV2PXPXlLR/+FLGmEqi4n
 RlB/400FVS3arkV2NRqx+hGb0evLgqSbS/7kmFhpuJDHKy9kciuFqMzRg 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: irxgnCJQB21rk51r5OjEcjMnOjAkol6pP/3RKTGsPDLYXV1Ekd1b4JXRnVoG18Z7W6gzRBpV7U
 D9gkkd7EP9bpitJAFRlXpxV1ZjQuQLGoxH+XxW6Uv5FJwTdlhV+QVN6jRHw0X6t9PqihhzVM9O
 jFTN3kEtbDEHHqYI8FAdLHG3+zq3+LQK2+caBdL3H6A0FrNzRRtFzLJ/mcMbj/pBRlib/IsfWh
 rN9cGPscvrQyUGSIF8xXyIAcUn7zxzm+pqvn1MyHwO+aRBKovpYJH6M8/y5ZCJ2HQ8x+mSk2O2
 PNA=
X-SBRS: 2.7
X-MesageID: 5924842
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5924842"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
Date: Wed, 18 Sep 2019 12:57:44 +0100
Message-ID: <20190918115745.39006-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen-bus: only set the xen device frontend state
 if it is missing
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Mark Syms <mark.syms@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KClNvbWUgdG9vbHN0YWNrIGlt
cGxlbWVudGF0aW9ucyB3aWxsIHNldCB0aGUgZnJvbnRlbmQgeGVuc3RvcmUKa2V5cyB0byBJbml0
aWFsaXNpbmcgd2hpY2ggd2lsbCB0aGVuIHRyaWdnZXIgdGhlIGluIGd1ZXN0IFBWCmRyaXZlcnMg
dG8gYmVnaW4gaW5pdGlhbGlzaW5nIGFuZCBzb21lIGltcGxlbWVudGF0aW9ucyB3aWxsCnRoZW4g
c2V0IHRoZWlyIHN0YXRlIHRvIENsb3NpbmcuIElmIHRoaXMgaGFzIG9jY3VycmVkIHRoZW4KZGV2
aWNlIHJlYWxpemUgbXVzdCBub3Qgb3ZlcndyaXRlIHRoZSBmcm9udGVuZCBrZXlzIGFzIHRoZW4K
dGhlIGhhbmRzaGFrZSB3aWxsIHN0YWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyayBTeW1zIDxtYXJr
LnN5bXNAY2l0cml4LmNvbT4KCkFsc28gYXZvaWQgY3JlYXRpbmcgdGhlIGZyb250ZW5kIGFyZWEg
aWYgaXQgYWxyZWFkeSBleGlzdHMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgotLS0KIGh3L3hlbi94ZW4tYnVzLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4v
eGVuLWJ1cy5jCmluZGV4IDU1YzE1NzM5M2QuLmMyYWQyMmE0MmQgMTAwNjQ0Ci0tLSBhL2h3L3hl
bi94ZW4tYnVzLmMKKysrIGIvaHcveGVuL3hlbi1idXMuYwpAQCAtODU3LDYgKzg1NywxMyBAQCBz
dGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2Zyb250ZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQogICAg
IH0KIH0KIAorc3RhdGljIGJvb2wgeGVuX2RldmljZV9mcm9udGVuZF9leGlzdHMoWGVuRGV2aWNl
ICp4ZW5kZXYpCit7CisgICAgZW51bSB4ZW5idXNfc3RhdGUgc3RhdGU7CisKKyAgICByZXR1cm4g
KHhlbl9kZXZpY2VfZnJvbnRlbmRfc2NhbmYoeGVuZGV2LCAic3RhdGUiLCAiJXUiLCAmc3RhdGUp
ID09IDEpOworfQorCiBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2Zyb250ZW5kX2NyZWF0ZShYZW5E
ZXZpY2UgKnhlbmRldiwgRXJyb3IgKiplcnJwKQogewogICAgIFhlbkJ1cyAqeGVuYnVzID0gWEVO
X0JVUyhxZGV2X2dldF9wYXJlbnRfYnVzKERFVklDRSh4ZW5kZXYpKSk7CkBAIC04NjUsMTkgKzg3
MiwyNSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2Zyb250ZW5kX2NyZWF0ZShYZW5EZXZpY2Ug
KnhlbmRldiwgRXJyb3IgKiplcnJwKQogCiAgICAgeGVuZGV2LT5mcm9udGVuZF9wYXRoID0geGVu
X2RldmljZV9nZXRfZnJvbnRlbmRfcGF0aCh4ZW5kZXYpOwogCi0gICAgcGVybXNbMF0uaWQgPSB4
ZW5kZXYtPmZyb250ZW5kX2lkOwotICAgIHBlcm1zWzBdLnBlcm1zID0gWFNfUEVSTV9OT05FOwot
ICAgIHBlcm1zWzFdLmlkID0geGVuYnVzLT5iYWNrZW5kX2lkOwotICAgIHBlcm1zWzFdLnBlcm1z
ID0gWFNfUEVSTV9SRUFEIHwgWFNfUEVSTV9XUklURTsKKyAgICAvKgorICAgICAqIFRoZSBmcm9u
dGVuZCBhcmVhIG1heSBoYXZlIGFscmVhZHkgYmVlbiBjcmVhdGVkIGJ5IGEgbGVnYWN5CisgICAg
ICogdG9vbHN0YWNrLgorICAgICAqLworICAgIGlmICgheGVuX2RldmljZV9mcm9udGVuZF9leGlz
dHMoeGVuZGV2KSkgeworICAgICAgICBwZXJtc1swXS5pZCA9IHhlbmRldi0+ZnJvbnRlbmRfaWQ7
CisgICAgICAgIHBlcm1zWzBdLnBlcm1zID0gWFNfUEVSTV9OT05FOworICAgICAgICBwZXJtc1sx
XS5pZCA9IHhlbmJ1cy0+YmFja2VuZF9pZDsKKyAgICAgICAgcGVybXNbMV0ucGVybXMgPSBYU19Q
RVJNX1JFQUQgfCBYU19QRVJNX1dSSVRFOwogCi0gICAgZ19hc3NlcnQoeGVuYnVzLT54c2gpOwor
ICAgICAgICBnX2Fzc2VydCh4ZW5idXMtPnhzaCk7CiAKLSAgICB4c19ub2RlX2NyZWF0ZSh4ZW5i
dXMtPnhzaCwgWEJUX05VTEwsIHhlbmRldi0+ZnJvbnRlbmRfcGF0aCwgcGVybXMsCi0gICAgICAg
ICAgICAgICAgICAgQVJSQVlfU0laRShwZXJtcyksICZsb2NhbF9lcnIpOwotICAgIGlmIChsb2Nh
bF9lcnIpIHsKLSAgICAgICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJycCwgbG9jYWxfZXJy
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGNyZWF0ZSBmcm9u
dGVuZDogIik7Ci0gICAgICAgIHJldHVybjsKKyAgICAgICAgeHNfbm9kZV9jcmVhdGUoeGVuYnVz
LT54c2gsIFhCVF9OVUxMLCB4ZW5kZXYtPmZyb250ZW5kX3BhdGgsIHBlcm1zLAorICAgICAgICAg
ICAgICAgICAgICAgICBBUlJBWV9TSVpFKHBlcm1zKSwgJmxvY2FsX2Vycik7CisgICAgICAgIGlm
IChsb2NhbF9lcnIpIHsKKyAgICAgICAgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAs
IGxvY2FsX2VyciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQg
dG8gY3JlYXRlIGZyb250ZW5kOiAiKTsKKyAgICAgICAgICAgIHJldHVybjsKKyAgICAgICAgfQog
ICAgIH0KIAogICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGVfd2F0Y2ggPQpAQCAtMTI5MCwxMiAr
MTMwMywxNCBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRl
diwgRXJyb3IgKiplcnJwKQogICAgIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfb25saW5lKHhlbmRl
diwgdHJ1ZSk7CiAgICAgeGVuX2RldmljZV9iYWNrZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIFhlbmJ1
c1N0YXRlSW5pdFdhaXQpOwogCi0gICAgeGVuX2RldmljZV9mcm9udGVuZF9wcmludGYoeGVuZGV2
LCAiYmFja2VuZCIsICIlcyIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuZGV2
LT5iYWNrZW5kX3BhdGgpOwotICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKHhlbmRldiwg
ImJhY2tlbmQtaWQiLCAiJXUiLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbmJ1
cy0+YmFja2VuZF9pZCk7CisgICAgaWYgKCF4ZW5fZGV2aWNlX2Zyb250ZW5kX2V4aXN0cyh4ZW5k
ZXYpKSB7CisgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKHhlbmRldiwgImJhY2tl
bmQiLCAiJXMiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5kZXYtPmJh
Y2tlbmRfcGF0aCk7CisgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKHhlbmRldiwg
ImJhY2tlbmQtaWQiLCAiJXUiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4
ZW5idXMtPmJhY2tlbmRfaWQpOwogCi0gICAgeGVuX2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUo
eGVuZGV2LCBYZW5idXNTdGF0ZUluaXRpYWxpc2luZywgdHJ1ZSk7CisgICAgICAgIHhlbl9kZXZp
Y2VfZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcsIHRy
dWUpOworICAgIH0KIAogICAgIHhlbmRldi0+ZXhpdC5ub3RpZnkgPSB4ZW5fZGV2aWNlX2V4aXQ7
CiAgICAgcWVtdV9hZGRfZXhpdF9ub3RpZmllcigmeGVuZGV2LT5leGl0KTsKLS0gCjIuMjAuMS4y
LmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
