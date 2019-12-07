Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00F115D9A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 17:58:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iddKK-0001TE-Lz; Sat, 07 Dec 2019 16:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iddKJ-0001T9-2b
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 16:53:03 +0000
X-Inumbo-ID: 0499da52-1912-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0499da52-1912-11ea-a1e1-bc764e2007e4;
 Sat, 07 Dec 2019 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575737577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/FdFJaveInpq0PepbCf79b7l7Jgjsx9OuI5LZga/E60=;
 b=JDw3coQ9/PX+NfcoprAR7uUj9O32WjTg+lJ+8UvCcdNNyU9qL2yYpz4Q
 e7bJ8Z7FebdARlgLBDf7+/EinJ8vJfUbdtO1bVoQQb21+v9dA/UOYNKoc
 VAWnkJL6vjh1HVWRAPuE3dUVHwLZRgG9WoFStIFdIHfFDCkx4GHTdRRj5 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0RN1OxF1NQADeTXIHlMLjI3NtPuR4/hM/AgRkK47OLRRoUnSg2yE4tNrAw9ZrwBKHiCZcqyw47
 Yn4uHBYGLjMdhGicDekgwwKJIL+85v76JTMKNDC9niEq/NpHEvxX/sFmvsXcGfr2lCSLuQ18Sx
 vWtSI3tZnUuKweryLUplzYWZMKuTRvwGBxQaF8mYdcWhhXI9B1z4QNLCJgArJ8X60VUo8X2bwc
 jYOQvVNhDf58hv6cbgCqUhJIzVtt8etb4vUI/1IDLfqUGLoZYHFakWbaJ5eeLRWgoZ2G0vs7ng
 4L4=
X-SBRS: 2.7
X-MesageID: 9704955
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,288,1571716800"; 
   d="scan'208";a="9704955"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 16:52:51 +0000
Message-ID: <20191207165252.1045-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207165252.1045-1-andrew.cooper3@citrix.com>
References: <20191207165252.1045-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/flask: Fix Python 3 problems with
 gen-policy.py
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNjcmlwdCBpcyBQeXRob24gMiBzcGVjaWZpYywgYW5kIGZhaWxzIHdpdGggc3RyaW5nL2Jp
bmFyeSBpc3N1ZXMgd2l0aApQeXRob24gMzoKCiAgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOgogICAgRmlsZSAiZ2VuLXBvbGljeS5weSIsIGxpbmUgMTQsIGluIDxtb2R1bGU+CiAg
ICAgIGZvciBjaGFyIGluIHN5cy5zdGRpbi5yZWFkKCk6CiAgICBGaWxlICIvdXNyL2xpYi9weXRo
b24zLjUvY29kZWNzLnB5IiwgbGluZSAzMjEsIGluIGRlY29kZQogICAgICAocmVzdWx0LCBjb25z
dW1lZCkgPSBzZWxmLl9idWZmZXJfZGVjb2RlKGRhdGEsIHNlbGYuZXJyb3JzLCBmaW5hbCkKICBV
bmljb2RlRGVjb2RlRXJyb3I6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg4YyBp
biBwb3NpdGlvbiAwOiBpbnZhbGlkIHN0YXJ0IGJ5dGUKCkZpeGluZyB0aGUgc2NyaXB0IHRvIGJl
IGNvbXBhdGlibGUgaXNuJ3QgaGFyZCwgYnV0IHVzaW5nIHB5dGhvbiBoZXJlIGlzCndhc3RlZnVs
LiAgRHJvcCB0aGUgc2NyaXB0IGVudGlyZWx5LCBhbmQgd3JpdGUgYSBzaG9ydCBmbGFzay1wb2xp
Y3kuUyBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNh
Lmdvdj4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkZvciA0LjEzLiAgVGhp
cyBpcyBhIGJsb2NrZXIgdG8gb3VyIGludGVudCB0byBieSBQeTMtY2xlYW4gaW4gdGhpcyByZWxl
YXNlCgpEaXNjb3ZlcmVkIGVudGlyZWx5IGFjY2lkZW50bHkgd2hlbiB0ZXN0aW5nIHRoZSBmb2xs
b3dpbmcgcGF0Y2guCi0tLQogeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAgICAgICB8ICA2ICsrLS0t
LQogeGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUyB8IDIwICsrKysrKysrKysrKysrKysrKysr
CiB4ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkgIHwgMjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUwogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHhlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQoKZGlmZiAtLWdpdCBhL3hlbi94
c20vZmxhc2svTWFrZWZpbGUgYi94ZW4veHNtL2ZsYXNrL01ha2VmaWxlCmluZGV4IGY1ZmZhYjEy
MjYuLjdjM2YzODEyODcgMTAwNjQ0Ci0tLSBhL3hlbi94c20vZmxhc2svTWFrZWZpbGUKKysrIGIv
eGVuL3hzbS9mbGFzay9NYWtlZmlsZQpAQCAtMjcsNyArMjcsOCBAQCAkKEZMQVNLX0hfRklMRVMp
OiAkKEZMQVNLX0hfREVQRU5EKQogJChBVl9IX0ZJTEVTKTogJChBVl9IX0RFUEVORCkKIAkkKENP
TkZJR19TSEVMTCkgcG9saWN5L21rYWNjZXNzX3ZlY3Rvci5zaCAkKEFXSykgJChBVl9IX0RFUEVO
RCkKIAotb2JqLSQoQ09ORklHX1hTTV9GTEFTS19QT0xJQ1kpICs9IHBvbGljeS5vCitvYmotYmlu
LSQoQ09ORklHX1hTTV9GTEFTS19QT0xJQ1kpICs9IGZsYXNrLXBvbGljeS5vCitmbGFzay1wb2xp
Y3kubzogcG9saWN5LmJpbgogCiBGTEFTS19CVUlMRF9ESVIgOj0gJChDVVJESVIpCiBQT0xJQ1lf
U1JDIDo9ICQoRkxBU0tfQlVJTERfRElSKS94ZW5wb2xpY3ktJChYRU5fRlVMTFZFUlNJT04pCkBA
IC0zNiw5ICszNyw2IEBAIHBvbGljeS5iaW46IEZPUkNFCiAJJChNQUtFKSAtZiAkKFhFTl9ST09U
KS90b29scy9mbGFzay9wb2xpY3kvTWFrZWZpbGUuY29tbW9uIC1DICQoWEVOX1JPT1QpL3Rvb2xz
L2ZsYXNrL3BvbGljeSBGTEFTS19CVUlMRF9ESVI9JChGTEFTS19CVUlMRF9ESVIpCiAJY21wIC1z
ICQoUE9MSUNZX1NSQykgJEAgfHwgY3AgJChQT0xJQ1lfU1JDKSAkQAogCi1wb2xpY3kuYzogcG9s
aWN5LmJpbiBnZW4tcG9saWN5LnB5Ci0JJChQWVRIT04pIGdlbi1wb2xpY3kucHkgPCAkPCA+ICRA
Ci0KIC5QSE9OWTogY2xlYW4KIGNsZWFuOjoKIAlybSAtZiAkKEFMTF9IX0ZJTEVTKSAqLm8gJChE
RVBTX1JNKSBwb2xpY3kuKiAkKFBPTElDWV9TUkMpCmRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNr
L2ZsYXNrLXBvbGljeS5TIGIveGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kNzhjZTc3ZmQ2Ci0tLSAvZGV2L251bGwKKysr
IGIveGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUwpAQCAtMCwwICsxLDIwIEBACisgICAgICAg
IC5zZWN0aW9uIC5pbml0LnJvZGF0YSwgImEiLCBAcHJvZ2JpdHMKKworLyogY29uc3QgdW5zaWdu
ZWQgY2hhciB4c21fZmxhc2tfaW5pdF9wb2xpY3lbXSBfX2luaXRjb25zdCAqLworCS5hbGlnbiA0
CisgICAgICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5Cit4c21fZmxhc2tfaW5pdF9w
b2xpY3k6CisgICAgICAgIC5pbmNiaW4gInBvbGljeS5iaW4iCisuTGVuZDoKKworICAgICAgICAu
dHlwZSB4c21fZmxhc2tfaW5pdF9wb2xpY3ksIEBvYmplY3QKKyAgICAgICAgLnNpemUgeHNtX2Zs
YXNrX2luaXRfcG9saWN5LCAuIC0geHNtX2ZsYXNrX2luaXRfcG9saWN5CisKKy8qIGNvbnN0IHVu
c2lnbmVkIGludCBfX2luaXRjb25zdCB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSAqLworCS5h
bGlnbiA0CisgICAgICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5X3NpemUKK3hzbV9m
bGFza19pbml0X3BvbGljeV9zaXplOgorICAgICAgICAubG9uZyAuTGVuZCAtIHhzbV9mbGFza19p
bml0X3BvbGljeQorCisgICAgICAgIC50eXBlIHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplLCBA
b2JqZWN0CisgICAgICAgIC5zaXplIHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplLCAuIC0geHNt
X2ZsYXNrX2luaXRfcG9saWN5X3NpemUKZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svZ2VuLXBv
bGljeS5weSBiL3hlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQpkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggYzc1MDFlNDYxNC4uMDAwMDAwMDAwMAotLS0gYS94ZW4veHNtL2ZsYXNrL2dl
bi1wb2xpY3kucHkKKysrIC9kZXYvbnVsbApAQCAtMSwyMyArMCwwIEBACi0jIS91c3IvYmluL2Vu
diBweXRob24KLWltcG9ydCBzeXMKLQotcG9saWN5X3NpemUgPSAwCi0KLXN5cy5zdGRvdXQud3Jp
dGUoIiIiCi0vKiBUaGlzIGZpbGUgaXMgYXV0b2dlbmVyYXRlZCBieSBnZW5fcG9saWN5LnB5ICov
Ci0jaW5jbHVkZSA8eGVuL2luaXQuaD4KLSNpbmNsdWRlIDx4c20veHNtLmg+Ci0KLWNvbnN0IHVu
c2lnbmVkIGNoYXIgeHNtX2ZsYXNrX2luaXRfcG9saWN5W10gX19pbml0Y29uc3QgPSB7Ci0iIiIp
Ci0KLWZvciBjaGFyIGluIHN5cy5zdGRpbi5yZWFkKCk6Ci0gICAgc3lzLnN0ZG91dC53cml0ZSgi
IDB4JTAyeCwiICUgb3JkKGNoYXIpKQotICAgIHBvbGljeV9zaXplID0gcG9saWN5X3NpemUgKyAx
Ci0gICAgaWYgcG9saWN5X3NpemUgJSAxMyA9PSAwOgotICAgICAgICBzeXMuc3Rkb3V0LndyaXRl
KCJcbiIpCi0KLXN5cy5zdGRvdXQud3JpdGUoIiIiCi19OwotY29uc3QgdW5zaWduZWQgaW50IF9f
aW5pdGNvbnN0IHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplID0gJWQ7Ci0iIiIgJSBwb2xpY3lf
c2l6ZSkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
