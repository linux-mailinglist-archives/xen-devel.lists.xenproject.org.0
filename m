Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD09B04C2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i88rb-0002zh-E6; Wed, 11 Sep 2019 20:05:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i88rZ-0002zM-PW
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:05:13 +0000
X-Inumbo-ID: 761b2d20-d4cf-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 761b2d20-d4cf-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568232312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Qy6fWZ039WeGD+8IdzKXaFvFd/qR+imJDVwqFqt+T4=;
 b=eAczOgzICp1fq14jdQOsEIcqisEelXM47xXQGk6VXnGEbuOylkElbem0
 gh1HFT/1pvPqoigOh9aKor79k/bQm2LtCaRXRROFfJj2ASJNNbde8jMM7
 9C9iKr9tXgJFL1+WmMmfQ2GJvUhSWMiq8sB6Az87dG67YqyI/DPsaNYQG o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tTtRTWjvKDz+ZurNtGiF2SpOjkw4oN+wk4kaP0jemPOKQ8J3MdZ9Xm/8ZiyB7jKU84Tv0+uoBV
 7iiPd0Q/6YVDJXLf7Yr5o7Konsueu2V/DmyHrvMPonfRc3+hsl81BR7KLoB/S9QXGCscHJ+F4o
 V2CXiKm9HkPWepyT1kRjdAON9zmazkuFnvk2G/97W8I/RzDQDwgrsw5OyNJwCbKi5rSU+160/U
 UPBvIU30oGDyQ7KWlWcOUQa6xl8Osv2UW4PfF305DsN7N7mwRUlac6qx04hnYJVrgVT+X7K5ka
 4u4=
X-SBRS: 2.7
X-MesageID: 5695040
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5695040"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 21:04:58 +0100
Message-ID: <20190911200504.5693-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-1-andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/8] x86/cpuid: Split update_domain_cpuid_info()
 in half
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkgY3VycmVudGx5IHNlcnZlcyB0d28gcHVycG9zZXMu
ICBGaXJzdCB0byBtZXJnZSBuZXcKQ1BVSUQgZGF0YSBmcm9tIHRoZSB0b29sc3RhY2ssIGFuZCBz
ZWNvbmQsIHRvIHBlcmZvcm0gYW55IG5lY2Vzc2FyeSB1cGRhdGluZwpvZiBkZXJpdmVkIGRvbWFp
bi92Y3B1IHNldHRpbmdzLgoKVGhlIGZpcnN0IHBhcnQgb2YgdGhpcyBpcyBnb2luZyB0byBiZSBz
dXBlcnNlZGVkIGJ5IGEgbmV3IGFuZCBzdWJzdGFudGlhbGx5Cm1vcmUgZWZmaWNpZW50IGh5cGVy
Y2FsbC4KCkNhcnZlIHRoZSBzZWNvbmQgcGFydCBvdXQgaW50byBhIG5ldyBkb21haW5fY3B1X3Bv
bGljeV9jaGFuZ2VkKCkgaGVscGVyLCBhbmQKY2FsbCB0aGlzIGZyb20gdGhlIHJlbWFpbnMgb2Yg
dXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkuCgpUaGlzIGRvZXMgZHJvcCB0aGUgY2FsbF9wb2xp
Y3lfY2hhbmdlZCwgYnV0IHdpdGggdGhlIG5ldyBoeXBlcmNhbGwgaHlwZXJjYWxsCmluIHBsYWNl
LCB0aGUgY29tbW9uIGNhc2Ugd2lsbCBiZSBhIHNpbmdsZSBjYWxsIHBlciBkb21haW4uICBEcm9w
cGluZyB0aGUKb3B0aW1pc2F0aW9uIGhlcmUgYWxsb3dzIGZvciBhIGNsZWFuZXIgc2V0IG9mIGZv
bGxvd2luZyBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2RvbWN0bC5jIHwgMjQ1ICsrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OTkgaW5zZXJ0aW9ucygrKSwgMTQ2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwppbmRleCBhNzQ0Njk2YzZiLi5k
MTVhZTA2NmMzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2RvbWN0bC5jCkBAIC00NiwxMDEgKzQ2LDE0IEBAIHN0YXRpYyBpbnQgZ2Ric3hfZ3Vl
c3RfbWVtX2lvKGRvbWlkX3QgZG9taWQsIHN0cnVjdCB4ZW5fZG9tY3RsX2dkYnN4X21lbWlvICpp
b3ApCiAgICAgcmV0dXJuIGlvcC0+cmVtYWluID8gLUVGQVVMVCA6IDA7CiB9CiAKLXN0YXRpYyBp
bnQgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKHN0cnVjdCBkb21haW4gKmQsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcHVpZCAq
Y3RsKQorc3RhdGljIHZvaWQgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWlu
ICpkKQogewotICAgIHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBkLT5hcmNoLmNwdWlkOwotICAg
IGNvbnN0IHN0cnVjdCBjcHVpZF9sZWFmIGxlYWYgPSB7IGN0bC0+ZWF4LCBjdGwtPmVieCwgY3Rs
LT5lY3gsIGN0bC0+ZWR4IH07Ci0gICAgaW50IG9sZF92ZW5kb3IgPSBwLT54ODZfdmVuZG9yOwot
ICAgIHVuc2lnbmVkIGludCBvbGRfN2QwID0gcC0+ZmVhdC5yYXdbMF0uZCwgb2xkX2U4YiA9IHAt
PmV4dGQucmF3WzhdLmI7Ci0gICAgYm9vbCBjYWxsX3BvbGljeV9jaGFuZ2VkID0gZmFsc2U7IC8q
IEF2b2lkIGZvcl9lYWNoX3ZjcHUoKSB1bm5lY2Vzc2FyaWx5ICovCi0KLSAgICAvKgotICAgICAq
IFNraXAgdXBkYXRlIGZvciBsZWF2ZXMgd2UgZG9uJ3QgY2FyZSBhYm91dCwgdG8gYXZvaWQgdGhl
IG92ZXJoZWFkIG9mCi0gICAgICogcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KCkuCi0gICAgICov
Ci0gICAgc3dpdGNoICggY3RsLT5pbnB1dFswXSApCi0gICAgewotICAgIGNhc2UgMHgwMDAwMDAw
MCAuLi4gQVJSQVlfU0laRShwLT5iYXNpYy5yYXcpIC0gMToKLSAgICAgICAgaWYgKCBjdGwtPmlu
cHV0WzBdID09IDQgJiYKLSAgICAgICAgICAgICBjdGwtPmlucHV0WzFdID49IEFSUkFZX1NJWkUo
cC0+Y2FjaGUucmF3KSApCi0gICAgICAgICAgICByZXR1cm4gMDsKLQotICAgICAgICBpZiAoIGN0
bC0+aW5wdXRbMF0gPT0gNyAmJgotICAgICAgICAgICAgIGN0bC0+aW5wdXRbMV0gPj0gQVJSQVlf
U0laRShwLT5mZWF0LnJhdykgKQotICAgICAgICAgICAgcmV0dXJuIDA7Ci0KLSAgICAgICAgaWYg
KCBjdGwtPmlucHV0WzBdID09IDB4YiAmJgotICAgICAgICAgICAgIGN0bC0+aW5wdXRbMV0gPj0g
QVJSQVlfU0laRShwLT50b3BvLnJhdykgKQotICAgICAgICAgICAgcmV0dXJuIDA7Ci0KLSAgICAg
ICAgQlVJTERfQlVHX09OKEFSUkFZX1NJWkUocC0+eHN0YXRlLnJhdykgPCAyKTsKLSAgICAgICAg
aWYgKCBjdGwtPmlucHV0WzBdID09IFhTVEFURV9DUFVJRCAmJgotICAgICAgICAgICAgIGN0bC0+
aW5wdXRbMV0gIT0gMSApIC8qIEV2ZXJ5dGhpbmcgZWxzZSBhdXRvbWF0aWNhbGx5IGNhbGN1bGF0
ZWQuICovCi0gICAgICAgICAgICByZXR1cm4gMDsKLSAgICAgICAgYnJlYWs7Ci0KLSAgICBjYXNl
IDB4NDAwMDAwMDA6IGNhc2UgMHg0MDAwMDEwMDoKLSAgICAgICAgLyogT25seSBjYXJlIGFib3V0
IHRoZSBtYXhfbGVhZiBsaW1pdC4gKi8KLQotICAgIGNhc2UgMHg4MDAwMDAwMCAuLi4gMHg4MDAw
MDAwMCArIEFSUkFZX1NJWkUocC0+ZXh0ZC5yYXcpIC0gMToKLSAgICAgICAgYnJlYWs7Ci0KLSAg
ICBkZWZhdWx0OgotICAgICAgICByZXR1cm4gMDsKLSAgICB9Ci0KLSAgICAvKiBJbnNlcnQgY3Rs
IGRhdGEgaW50byBjcHVpZF9wb2xpY3kuICovCi0gICAgc3dpdGNoICggY3RsLT5pbnB1dFswXSAp
Ci0gICAgewotICAgIGNhc2UgMHgwMDAwMDAwMCAuLi4gQVJSQVlfU0laRShwLT5iYXNpYy5yYXcp
IC0gMToKLSAgICAgICAgc3dpdGNoICggY3RsLT5pbnB1dFswXSApCi0gICAgICAgIHsKLSAgICAg
ICAgY2FzZSA0OgotICAgICAgICAgICAgcC0+Y2FjaGUucmF3W2N0bC0+aW5wdXRbMV1dID0gbGVh
ZjsKLSAgICAgICAgICAgIGJyZWFrOwotCi0gICAgICAgIGNhc2UgNzoKLSAgICAgICAgICAgIHAt
PmZlYXQucmF3W2N0bC0+aW5wdXRbMV1dID0gbGVhZjsKLSAgICAgICAgICAgIGJyZWFrOwotCi0g
ICAgICAgIGNhc2UgMHhiOgotICAgICAgICAgICAgcC0+dG9wby5yYXdbY3RsLT5pbnB1dFsxXV0g
PSBsZWFmOwotICAgICAgICAgICAgYnJlYWs7Ci0KLSAgICAgICAgY2FzZSBYU1RBVEVfQ1BVSUQ6
Ci0gICAgICAgICAgICBwLT54c3RhdGUucmF3W2N0bC0+aW5wdXRbMV1dID0gbGVhZjsKLSAgICAg
ICAgICAgIGJyZWFrOwotCi0gICAgICAgIGRlZmF1bHQ6Ci0gICAgICAgICAgICBwLT5iYXNpYy5y
YXdbY3RsLT5pbnB1dFswXV0gPSBsZWFmOwotICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgIH0K
LSAgICAgICAgYnJlYWs7Ci0KLSAgICBjYXNlIDB4NDAwMDAwMDA6Ci0gICAgICAgIHAtPmh2X2xp
bWl0ID0gY3RsLT5lYXg7Ci0gICAgICAgIGJyZWFrOworICAgIGNvbnN0IHN0cnVjdCBjcHVpZF9w
b2xpY3kgKnAgPSBkLT5hcmNoLmNwdWlkOworICAgIHN0cnVjdCB2Y3B1ICp2OwogCi0gICAgY2Fz
ZSAweDQwMDAwMTAwOgotICAgICAgICBwLT5odjJfbGltaXQgPSBjdGwtPmVheDsKLSAgICAgICAg
YnJlYWs7Ci0KLSAgICBjYXNlIDB4ODAwMDAwMDAgLi4uIDB4ODAwMDAwMDAgKyBBUlJBWV9TSVpF
KHAtPmV4dGQucmF3KSAtIDE6Ci0gICAgICAgIHAtPmV4dGQucmF3W2N0bC0+aW5wdXRbMF0gLSAw
eDgwMDAwMDAwXSA9IGxlYWY7Ci0gICAgICAgIGJyZWFrOwotICAgIH0KLQotICAgIHJlY2FsY3Vs
YXRlX2NwdWlkX3BvbGljeShkKTsKLQotICAgIHN3aXRjaCAoIGN0bC0+aW5wdXRbMF0gKQorICAg
IGlmICggaXNfcHZfZG9tYWluKGQpICkKICAgICB7Ci0gICAgY2FzZSAwOgotICAgICAgICBjYWxs
X3BvbGljeV9jaGFuZ2VkID0gKHAtPng4Nl92ZW5kb3IgIT0gb2xkX3ZlbmRvcik7Ci0gICAgICAg
IGJyZWFrOwotCi0gICAgY2FzZSAxOgotICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAo
KGxldmVsbGluZ19jYXBzICYgTENBUF8xY2QpID09IExDQVBfMWNkKSApCisgICAgICAgIGlmICgg
KChsZXZlbGxpbmdfY2FwcyAmIExDQVBfMWNkKSA9PSBMQ0FQXzFjZCkgKQogICAgICAgICB7CiAg
ICAgICAgICAgICB1aW50NjRfdCBtYXNrID0gY3B1aWRtYXNrX2RlZmF1bHRzLl8xY2Q7CiAgICAg
ICAgICAgICB1aW50MzJfdCBlY3ggPSBwLT5iYXNpYy5fMWM7CkBAIC0xOTcsMjUgKzExMCwxOCBA
QCBzdGF0aWMgaW50IHVwZGF0ZV9kb21haW5fY3B1aWRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkLAog
CiAgICAgICAgICAgICBkLT5hcmNoLnB2LmNwdWlkbWFza3MtPl8xY2QgPSBtYXNrOwogICAgICAg
ICB9Ci0gICAgICAgIGJyZWFrOwogCi0gICAgY2FzZSA2OgotICAgICAgICBpZiAoIGlzX3B2X2Rv
bWFpbihkKSAmJiAoKGxldmVsbGluZ19jYXBzICYgTENBUF82YykgPT0gTENBUF82YykgKQorICAg
ICAgICBpZiAoICgobGV2ZWxsaW5nX2NhcHMgJiBMQ0FQXzZjKSA9PSBMQ0FQXzZjKSApCiAgICAg
ICAgIHsKICAgICAgICAgICAgIHVpbnQ2NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzZj
OwogCiAgICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVO
RE9SX0FNRCApCi0gICAgICAgICAgICAgICAgbWFzayAmPSAofjBVTEwgPDwgMzIpIHwgY3RsLT5l
Y3g7CisgICAgICAgICAgICAgICAgbWFzayAmPSAofjBVTEwgPDwgMzIpIHwgcC0+YmFzaWMucmF3
WzZdLmM7CiAKICAgICAgICAgICAgIGQtPmFyY2gucHYuY3B1aWRtYXNrcy0+XzZjID0gbWFzazsK
ICAgICAgICAgfQotICAgICAgICBicmVhazsKLQotICAgIGNhc2UgNzoKLSAgICAgICAgaWYgKCBj
dGwtPmlucHV0WzFdICE9IDAgKQotICAgICAgICAgICAgYnJlYWs7CiAKLSAgICAgICAgaWYgKCBp
c19wdl9kb21haW4oZCkgJiYgKChsZXZlbGxpbmdfY2FwcyAmIExDQVBfN2FiMCkgPT0gTENBUF83
YWIwKSApCisgICAgICAgIGlmICggKChsZXZlbGxpbmdfY2FwcyAmIExDQVBfN2FiMCkgPT0gTENB
UF83YWIwKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHVpbnQ2NF90IG1hc2sgPSBjcHVpZG1h
c2tfZGVmYXVsdHMuXzdhYjA7CiAKQEAgLTIzMiwzNSArMTM4LDcgQEAgc3RhdGljIGludCB1cGRh
dGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgIGQtPmFy
Y2gucHYuY3B1aWRtYXNrcy0+XzdhYjAgPSBtYXNrOwogICAgICAgICB9CiAKLSAgICAgICAgLyoK
LSAgICAgICAgICogSWYgdGhlIElCUlMvSUJQQiBwb2xpY3kgaGFzIGNoYW5nZWQsIHdlIG5lZWQg
dG8gcmVjYWxjdWxhdGUgdGhlIE1TUgotICAgICAgICAgKiBpbnRlcmNlcHRpb24gYml0bWFwcy4K
LSAgICAgICAgICovCi0gICAgICAgIGNhbGxfcG9saWN5X2NoYW5nZWQgPSAoaXNfaHZtX2RvbWFp
bihkKSAmJgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgob2xkXzdkMCBeIHAtPmZl
YXQucmF3WzBdLmQpICYKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGNwdWZlYXRf
bWFzayhYODZfRkVBVFVSRV9JQlJTQikgfAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0wxRF9GTFVTSCkpKSk7Ci0gICAgICAgIGJyZWFr
OwotCi0gICAgY2FzZSAweGE6Ci0gICAgICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICE9IFg4Nl9WRU5ET1JfSU5URUwgKQotICAgICAgICAgICAgYnJlYWs7Ci0KLSAgICAgICAgLyog
SWYgUE1VIHZlcnNpb24gaXMgemVybyB0aGVuIHRoZSBndWVzdCBkb2Vzbid0IGhhdmUgVlBNVSAq
LwotICAgICAgICBpZiAoIHAtPmJhc2ljLnBtdV92ZXJzaW9uID09IDAgKQotICAgICAgICB7Ci0g
ICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsKLQotICAgICAgICAgICAgZm9yX2VhY2hfdmNwdSAo
IGQsIHYgKQotICAgICAgICAgICAgICAgIHZwbXVfZGVzdHJveSh2KTsKLSAgICAgICAgfQotICAg
ICAgICBicmVhazsKLQotICAgIGNhc2UgMHhkOgotICAgICAgICBpZiAoIGN0bC0+aW5wdXRbMV0g
IT0gMSApCi0gICAgICAgICAgICBicmVhazsKLQotICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihk
KSAmJiAoKGxldmVsbGluZ19jYXBzICYgTENBUF9EYTEpID09IExDQVBfRGExKSApCisgICAgICAg
IGlmICggKChsZXZlbGxpbmdfY2FwcyAmIExDQVBfRGExKSA9PSBMQ0FQX0RhMSkgKQogICAgICAg
ICB7CiAgICAgICAgICAgICB1aW50NjRfdCBtYXNrID0gY3B1aWRtYXNrX2RlZmF1bHRzLkRhMTsK
ICAgICAgICAgICAgIHVpbnQzMl90IGVheCA9IHAtPnhzdGF0ZS5EYTE7CkBAIC0yNzAsMTAgKzE0
OCw4IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKHN0cnVjdCBkb21haW4g
KmQsCiAKICAgICAgICAgICAgIGQtPmFyY2gucHYuY3B1aWRtYXNrcy0+RGExID0gbWFzazsKICAg
ICAgICAgfQotICAgICAgICBicmVhazsKIAotICAgIGNhc2UgMHg4MDAwMDAwMToKLSAgICAgICAg
aWYgKCBpc19wdl9kb21haW4oZCkgJiYgKChsZXZlbGxpbmdfY2FwcyAmIExDQVBfZTFjZCkgPT0g
TENBUF9lMWNkKSApCisgICAgICAgIGlmICggKChsZXZlbGxpbmdfY2FwcyAmIExDQVBfZTFjZCkg
PT0gTENBUF9lMWNkKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHVpbnQ2NF90IG1hc2sgPSBj
cHVpZG1hc2tfZGVmYXVsdHMuZTFjZDsKICAgICAgICAgICAgIHVpbnQzMl90IGVjeCA9IHAtPmV4
dGQuZTFjOwpAQCAtMzE3LDI3ICsxOTMsMTA0IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2RvbWFpbl9j
cHVpZF9pbmZvKHN0cnVjdCBkb21haW4gKmQsCiAKICAgICAgICAgICAgIGQtPmFyY2gucHYuY3B1
aWRtYXNrcy0+ZTFjZCA9IG1hc2s7CiAgICAgICAgIH0KKyAgICB9CisKKyAgICBmb3JfZWFjaF92
Y3B1KCBkLCB2ICkKKyAgICB7CisgICAgICAgIGNwdWlkX3BvbGljeV91cGRhdGVkKHYpOworCisg
ICAgICAgIC8qIElmIFBNVSB2ZXJzaW9uIGlzIHplcm8gdGhlbiB0aGUgZ3Vlc3QgZG9lc24ndCBo
YXZlIFZQTVUgKi8KKyAgICAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2
X1ZFTkRPUl9JTlRFTCAmJgorICAgICAgICAgICAgIHAtPmJhc2ljLnBtdV92ZXJzaW9uID09IDAg
KQorICAgICAgICAgICAgdnBtdV9kZXN0cm95KHYpOworICAgIH0KK30KKworc3RhdGljIGludCB1
cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB4ZW5fZG9tY3RsX2NwdWlkICpjdGwp
Cit7CisgICAgc3RydWN0IGNwdWlkX3BvbGljeSAqcCA9IGQtPmFyY2guY3B1aWQ7CisgICAgY29u
c3Qgc3RydWN0IGNwdWlkX2xlYWYgbGVhZiA9IHsgY3RsLT5lYXgsIGN0bC0+ZWJ4LCBjdGwtPmVj
eCwgY3RsLT5lZHggfTsKKworICAgIC8qCisgICAgICogU2tpcCB1cGRhdGUgZm9yIGxlYXZlcyB3
ZSBkb24ndCBjYXJlIGFib3V0LCB0byBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YKKyAgICAgKiByZWNh
bGN1bGF0ZV9jcHVpZF9wb2xpY3koKS4KKyAgICAgKi8KKyAgICBzd2l0Y2ggKCBjdGwtPmlucHV0
WzBdICkKKyAgICB7CisgICAgY2FzZSAweDAwMDAwMDAwIC4uLiBBUlJBWV9TSVpFKHAtPmJhc2lj
LnJhdykgLSAxOgorICAgICAgICBpZiAoIGN0bC0+aW5wdXRbMF0gPT0gNCAmJgorICAgICAgICAg
ICAgIGN0bC0+aW5wdXRbMV0gPj0gQVJSQVlfU0laRShwLT5jYWNoZS5yYXcpICkKKyAgICAgICAg
ICAgIHJldHVybiAwOworCisgICAgICAgIGlmICggY3RsLT5pbnB1dFswXSA9PSA3ICYmCisgICAg
ICAgICAgICAgY3RsLT5pbnB1dFsxXSA+PSBBUlJBWV9TSVpFKHAtPmZlYXQucmF3KSApCisgICAg
ICAgICAgICByZXR1cm4gMDsKKworICAgICAgICBpZiAoIGN0bC0+aW5wdXRbMF0gPT0gMHhiICYm
CisgICAgICAgICAgICAgY3RsLT5pbnB1dFsxXSA+PSBBUlJBWV9TSVpFKHAtPnRvcG8ucmF3KSAp
CisgICAgICAgICAgICByZXR1cm4gMDsKKworICAgICAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0la
RShwLT54c3RhdGUucmF3KSA8IDIpOworICAgICAgICBpZiAoIGN0bC0+aW5wdXRbMF0gPT0gWFNU
QVRFX0NQVUlEICYmCisgICAgICAgICAgICAgY3RsLT5pbnB1dFsxXSAhPSAxICkgLyogRXZlcnl0
aGluZyBlbHNlIGF1dG9tYXRpY2FsbHkgY2FsY3VsYXRlZC4gKi8KKyAgICAgICAgICAgIHJldHVy
biAwOwogICAgICAgICBicmVhazsKIAotICAgIGNhc2UgMHg4MDAwMDAwODoKLSAgICAgICAgLyoK
LSAgICAgICAgICogSWYgdGhlIElCUEIgcG9saWN5IGhhcyBjaGFuZ2VkLCB3ZSBuZWVkIHRvIHJl
Y2FsY3VsYXRlIHRoZSBNU1IKLSAgICAgICAgICogaW50ZXJjZXB0aW9uIGJpdG1hcHMuCi0gICAg
ICAgICAqLwotICAgICAgICBjYWxsX3BvbGljeV9jaGFuZ2VkID0gKGlzX2h2bV9kb21haW4oZCkg
JiYKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKG9sZF9lOGIgXiBwLT5leHRkLnJh
d1s4XS5iKSAmCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdWZlYXRfbWFzayhY
ODZfRkVBVFVSRV9JQlBCKSkpOworICAgIGNhc2UgMHg0MDAwMDAwMDogY2FzZSAweDQwMDAwMTAw
OgorICAgICAgICAvKiBPbmx5IGNhcmUgYWJvdXQgdGhlIG1heF9sZWFmIGxpbWl0LiAqLworCisg
ICAgY2FzZSAweDgwMDAwMDAwIC4uLiAweDgwMDAwMDAwICsgQVJSQVlfU0laRShwLT5leHRkLnJh
dykgLSAxOgogICAgICAgICBicmVhazsKKworICAgIGRlZmF1bHQ6CisgICAgICAgIHJldHVybiAw
OwogICAgIH0KIAotICAgIGlmICggY2FsbF9wb2xpY3lfY2hhbmdlZCApCisgICAgLyogSW5zZXJ0
IGN0bCBkYXRhIGludG8gY3B1aWRfcG9saWN5LiAqLworICAgIHN3aXRjaCAoIGN0bC0+aW5wdXRb
MF0gKQogICAgIHsKLSAgICAgICAgc3RydWN0IHZjcHUgKnY7CisgICAgY2FzZSAweDAwMDAwMDAw
IC4uLiBBUlJBWV9TSVpFKHAtPmJhc2ljLnJhdykgLSAxOgorICAgICAgICBzd2l0Y2ggKCBjdGwt
PmlucHV0WzBdICkKKyAgICAgICAgeworICAgICAgICBjYXNlIDQ6CisgICAgICAgICAgICBwLT5j
YWNoZS5yYXdbY3RsLT5pbnB1dFsxXV0gPSBsZWFmOworICAgICAgICAgICAgYnJlYWs7CisKKyAg
ICAgICAgY2FzZSA3OgorICAgICAgICAgICAgcC0+ZmVhdC5yYXdbY3RsLT5pbnB1dFsxXV0gPSBs
ZWFmOworICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSAweGI6CisgICAgICAgICAg
ICBwLT50b3BvLnJhd1tjdGwtPmlucHV0WzFdXSA9IGxlYWY7CisgICAgICAgICAgICBicmVhazsK
IAotICAgICAgICBmb3JfZWFjaF92Y3B1KCBkLCB2ICkKLSAgICAgICAgICAgIGNwdWlkX3BvbGlj
eV91cGRhdGVkKHYpOworICAgICAgICBjYXNlIFhTVEFURV9DUFVJRDoKKyAgICAgICAgICAgIHAt
PnhzdGF0ZS5yYXdbY3RsLT5pbnB1dFsxXV0gPSBsZWFmOworICAgICAgICAgICAgYnJlYWs7CisK
KyAgICAgICAgZGVmYXVsdDoKKyAgICAgICAgICAgIHAtPmJhc2ljLnJhd1tjdGwtPmlucHV0WzBd
XSA9IGxlYWY7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorICAgICAgICBicmVhazsK
KworICAgIGNhc2UgMHg0MDAwMDAwMDoKKyAgICAgICAgcC0+aHZfbGltaXQgPSBjdGwtPmVheDsK
KyAgICAgICAgYnJlYWs7CisKKyAgICBjYXNlIDB4NDAwMDAxMDA6CisgICAgICAgIHAtPmh2Ml9s
aW1pdCA9IGN0bC0+ZWF4OworICAgICAgICBicmVhazsKKworICAgIGNhc2UgMHg4MDAwMDAwMCAu
Li4gMHg4MDAwMDAwMCArIEFSUkFZX1NJWkUocC0+ZXh0ZC5yYXcpIC0gMToKKyAgICAgICAgcC0+
ZXh0ZC5yYXdbY3RsLT5pbnB1dFswXSAtIDB4ODAwMDAwMDBdID0gbGVhZjsKKyAgICAgICAgYnJl
YWs7CiAgICAgfQogCisgICAgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KGQpOworICAgIGRvbWFp
bl9jcHVfcG9saWN5X2NoYW5nZWQoZCk7CisKICAgICByZXR1cm4gMDsKIH0KIAotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
