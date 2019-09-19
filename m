Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03036B7FDF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:19:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB03c-00012x-FR; Thu, 19 Sep 2019 17:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB03a-00011l-8j
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:17:26 +0000
X-Inumbo-ID: 56b742ba-db01-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56b742ba-db01-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568913441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLuZzJKxFUTuaM0Mdj8VXYdU4QrS/sprJgp1Ee4rYfY=;
 b=iConOlzS6GBhL8CD+ts1StZfVbpo5cL7B3vnXG1g7zQoZkpE1OGHNuM2
 cefqeWRLwaKfOxS2OKOJhb8NE0afMSB/CVvqXo4IbZF48cr88V8dwSOzS
 51y4kgoC937HQhDdqut8GBrfkW+ENrY8PqctsrqnVVCsETADWDzIJ5Z30 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ywRWtLWFYax6Wc8eCuIG42fTGAs7JCVZgm8iVZ6Py8bS5MhfEtyMGB8QK3AntSgj3butS0Y+tf
 G3Fxb9tKwgh5IjMD2wRCDqVZoZcjzilLqxEg0FLnJS40iZGdLIsKhKUtn8TQUlub/95mZU92fl
 HBSSJNC/QMN71IkAnzsW/18Qj3FIdQoC7a4D+snB7AkuACO9QGKPyplclzC7re92I09Bz7uP8T
 553wqUpJJERMET0N2TbfkOzsnxTQgiOFB+79Hzd4rNMAzSCTP9qqAbRse5bUfLQGqyc3HNMZkd
 cG8=
X-SBRS: 2.7
X-MesageID: 5800422
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5800422"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:23 +0100
Message-ID: <20190919171656.899649-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 03/35] libxl: Make libxl_set_vcpuonline async
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYmVjYXVzZSBpdCBtYWtlcyBRTVAgY2FsbHMgd2hpY2ggYXJlIGdvaW5nIHRvIGJlIGFzeW5j
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICB8IDE1ICsrKysrKysrKysrKysrLQogdG9vbHMv
bGlieGwvbGlieGxfZG9tYWluLmMgfCAxMiArKysrKysrKy0tLS0KIHRvb2xzL3hsL3hsX2NwdXBv
b2wuYyAgICAgIHwgIDIgKy0KIHRvb2xzL3hsL3hsX3ZjcHUuYyAgICAgICAgIHwgIDIgKy0KIDQg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGlieGwuaAppbmRleCA0MzAx
MjMyNzQ5NjQuLmZkNjllOTIxNjZiOCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAor
KysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBAIC0xMjIwLDYgKzEyMjAsNyBAQCB2b2lkIGxpYnhs
X21hY19jb3B5KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9tYWMgKmRzdCwgY29uc3QgbGlieGxfbWFj
ICpzcmMpOwogICogICBsaWJ4bF9kb21haW5fcGF1c2UoKQogICogICBsaWJ4bF9kb21haW5fdW5w
YXVzZSgpCiAgKiAgIGxpYnhsX3NlbmRfdHJpZ2dlcigpCisgKiAgIGxpYnhsX3NldF92Y3B1b25s
aW5lKCkKICAqLwogI2RlZmluZSBMSUJYTF9IQVZFX0ZOX1VTSU5HX1FNUF9BU1lOQyAxCiAKQEAg
LTIzMTgsNyArMjMxOSwxOSBAQCBpbnQgbGlieGxfZG9tYWluX3NldF9ub2RlYWZmaW5pdHkobGli
eGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYnhsX2JpdG1hcCAqbm9kZW1hcCk7CiBpbnQgbGlieGxfZG9tYWluX2dldF9ub2Rl
YWZmaW5pdHkobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX2JpdG1hcCAqbm9kZW1hcCk7Ci1pbnQgbGlieGxfc2V0
X3ZjcHVvbmxpbmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9iaXRtYXAg
KmNwdW1hcCk7CitpbnQgbGlieGxfc2V0X3ZjcHVvbmxpbmUobGlieGxfY3R4ICpjdHgsIHVpbnQz
Ml90IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2JpdG1hcCAqY3B1bWFw
LAorICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19o
b3cpCisgICAgICAgICAgICAgICAgICAgICAgICAgTElCWExfRVhURVJOQUxfQ0FMTEVSU19PTkxZ
OworI2lmIGRlZmluZWQoTElCWExfQVBJX1ZFUlNJT04pICYmIExJQlhMX0FQSV9WRVJTSU9OIDwg
MHgwNDEzMDAKK3N0YXRpYyBpbmxpbmUgaW50IGxpYnhsX3NldF92Y3B1b25saW5lXzB4MDQxMjAw
KGxpYnhsX2N0eCAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgZG9taWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsaWJ4bF9iaXRtYXAgKmNwdW1hcCkKK3sKKyAgICByZXR1cm4gbGli
eGxfc2V0X3ZjcHVvbmxpbmUoY3R4LCBkb21pZCwgY3B1bWFwLCBOVUxMKTsKK30KKyNkZWZpbmUg
bGlieGxfc2V0X3ZjcHVvbmxpbmUgbGlieGxfc2V0X3ZjcHVvbmxpbmVfMHgwNDEyMDAKKyNlbmRp
ZgogCiAvKiBBIHJldHVybiB2YWx1ZSBsZXNzIHRoYW4gMCBzaG91bGQgYmUgaW50ZXJwcmV0ZWQg
YXMgYSBsaWJ4bF9lcnJvciwgd2hpbGUgYQogICogcmV0dXJuIHZhbHVlIGdyZWF0ZXIgdGhhbiBv
ciBlcXVhbCB0byAwIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBhCmRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4
IDg2Y2RkYzA1YTk0NC4uNjBjM2Y3YTM0YjRjIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9kb21haW4uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwpAQCAtMTM4Niw5ICsx
Mzg2LDExIEBAIHN0YXRpYyBpbnQgbGlieGxfX3NldF92Y3B1b25saW5lX3FtcChsaWJ4bF9fZ2Mg
KmdjLCB1aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gcmM7CiB9CiAKLWludCBsaWJ4bF9zZXRf
dmNwdW9ubGluZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIGxpYnhsX2JpdG1hcCAq
Y3B1bWFwKQoraW50IGxpYnhsX3NldF92Y3B1b25saW5lKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJf
dCBkb21pZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9iaXRtYXAgKmNwdW1hcCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93
KQogewotICAgIEdDX0lOSVQoY3R4KTsKKyAgICBBT19DUkVBVEUoY3R4LCBkb21pZCwgYW9faG93
KTsKICAgICBpbnQgcmMsIG1heGNwdXM7CiAgICAgbGlieGxfZG9taW5mbyBpbmZvOwogCkBAIC0x
NDM5LDggKzE0NDEsMTAgQEAgaW50IGxpYnhsX3NldF92Y3B1b25saW5lKGxpYnhsX2N0eCAqY3R4
LCB1aW50MzJfdCBkb21pZCwgbGlieGxfYml0bWFwICpjcHVtYXApCiAKIG91dDoKICAgICBsaWJ4
bF9kb21pbmZvX2Rpc3Bvc2UoJmluZm8pOwotICAgIEdDX0ZSRUU7Ci0gICAgcmV0dXJuIHJjOwor
ICAgIGlmIChyYykKKyAgICAgICAgcmV0dXJuIEFPX0NSRUFURV9GQUlMKHJjKTsKKyAgICBsaWJ4
bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOworICAgIHJldHVybiBBT19JTlBST0dSRVNTOwog
fQogCiBzdGF0aWMgaW50IGxpYnhsX19kb21haW5fczNfcmVzdW1lKGxpYnhsX19nYyAqZ2MsIGlu
dCBkb21pZCkKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX2NwdXBvb2wuYyBiL3Rvb2xzL3hsL3hs
X2NwdXBvb2wuYwppbmRleCAyNzM4MTFiNjYzNjYuLmNmZmU4N2UwYzdjYyAxMDA2NDQKLS0tIGEv
dG9vbHMveGwveGxfY3B1cG9vbC5jCisrKyBiL3Rvb2xzL3hsL3hsX2NwdXBvb2wuYwpAQCAtNTQ2
LDcgKzU0Niw3IEBAIGludCBtYWluX2NwdXBvb2xudW1hc3BsaXQoaW50IGFyZ2MsIGNoYXIgKiph
cmd2KQogICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImVycm9yIG9uIGdldHRpbmcgaW5mbyBmb3Ig
RG9tYWluLTBcbiIpOwogICAgICAgICBnb3RvIG91dDsKICAgICB9Ci0gICAgaWYgKGluZm8udmNw
dV9vbmxpbmUgPiBuICYmIGxpYnhsX3NldF92Y3B1b25saW5lKGN0eCwgMCwgJmNwdW1hcCkpIHsK
KyAgICBpZiAoaW5mby52Y3B1X29ubGluZSA+IG4gJiYgbGlieGxfc2V0X3ZjcHVvbmxpbmUoY3R4
LCAwLCAmY3B1bWFwLCBOVUxMKSkgewogICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImVycm9yIG9u
IHJlbW92aW5nIHZjcHVzIGZvciBEb21haW4tMFxuIik7CiAgICAgICAgIGdvdG8gb3V0OwogICAg
IH0KZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZjcHUuYyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwpp
bmRleCAzMjk1MTJlYWFmNzkuLjlmZjUzNTRmNzQ5YiAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxf
dmNwdS5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwpAQCAtMzY5LDcgKzM2OSw3IEBAIHN0YXRp
YyBpbnQgdmNwdXNldCh1aW50MzJfdCBkb21pZCwgY29uc3QgY2hhciogbnJfdmNwdXMsIGludCBj
aGVja19ob3N0KQogICAgIGZvciAoaSA9IDA7IGkgPCBtYXhfdmNwdXM7IGkrKykKICAgICAgICAg
bGlieGxfYml0bWFwX3NldCgmY3B1bWFwLCBpKTsKIAotICAgIHJjID0gbGlieGxfc2V0X3ZjcHVv
bmxpbmUoY3R4LCBkb21pZCwgJmNwdW1hcCk7CisgICAgcmMgPSBsaWJ4bF9zZXRfdmNwdW9ubGlu
ZShjdHgsIGRvbWlkLCAmY3B1bWFwLCBOVUxMKTsKICAgICBpZiAocmMgPT0gRVJST1JfRE9NQUlO
X05PVEZPVU5EKQogICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkRvbWFpbiAldSBkb2VzIG5vdCBl
eGlzdC5cbiIsIGRvbWlkKTsKICAgICBlbHNlIGlmIChyYykKLS0gCkFudGhvbnkgUEVSQVJECgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
