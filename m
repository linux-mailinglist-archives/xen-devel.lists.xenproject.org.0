Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC211115EC0
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 22:20:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idhRT-0005um-AU; Sat, 07 Dec 2019 21:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idhRR-0005uh-HZ
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 21:16:41 +0000
X-Inumbo-ID: dc24cb0c-1936-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc24cb0c-1936-11ea-b6f1-bc764e2007e4;
 Sat, 07 Dec 2019 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575753400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4NCpEm4Vixmvap6emYnGF0SG/ewK6VB1f2D+wpEBaeI=;
 b=ThOhgJ5NyhSmZLJ3Ch14OfCg3NSUuIBWkPyXMJIHoxiwICoLKP57eDTa
 bvHTUs992evc9jv/ArOp7N/rMfZaGt+wsVMXA1VR1+0z9kkyP/LgTodNT
 i2RxQbPNXbIthDZ2kSoHLak2m4+45ogqzH+Pkjmf/pY3eEUAaVIGS1jPX k=;
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
IronPort-SDR: HgQTDq127mAbocphYKwfGx/OJxwParejFGZDoNEYPD9kffqTHs01+GEng/XV2zaJVWiirwVaEC
 ElPKHkzJf5h7W9Z3mgp7YYT/VN6XfADwfVzZfmypFwTIZP3/0bYqXHxOmtohW4am0SF3LRuu4z
 X8Sy3lZeuulJfJf+Fd7U0VvXi6xUv90thKu7XP7iGwjsSx2c1PxugRtNvMMfv29xJbeFmBZBFK
 cGKhm7ORm6RgBP5aP7zOzUgdpC3I+S1bIbxFfT59bj0W28EY0r0jzLHekxJRKyrFeFvWhlRTXp
 B1U=
X-SBRS: 2.7
X-MesageID: 9707384
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9707384"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 21:16:33 +0000
Message-ID: <20191207211634.9958-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207211634.9958-1-andrew.cooper3@citrix.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/3] xen/banner: Drop the fig-to-oct.py script
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNjcmlwdCBpcyA2NjQgcmF0aGVyIHRoYW4gNzc1LCBzbyB0aGUgYmFubmVyIGNvbnZlcnNp
b24gZG9lc24ndCBhY3R1YWxseQp3b3JrIGlmICQoUFlUSE9OKSBpcyBlbXB0eToKCiAgL2Jpbi9z
aDogdG9vbHMvZmlnLXRvLW9jdC5weTogUGVybWlzc2lvbiBkZW5pZWQKICBtYWtlWzNdOiAqKiog
W2luY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI2CiAgbWFrZVszXTogTGVhdmluZyBkaXJl
Y3RvcnkgYC9idWlsZHMveGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuL3hlbicKCkZpeGlu
ZyB0aGlzIGlzIGVhc3ksIGJ1dCB1c2luZyBweXRob24gaGVyZSBpcyB3YXN0ZWZ1bC4gIGNvbXBp
bGUuaCBkb2Vzbid0Cm5lZWQgWEVOX0JBTk5FUiByZW5kZXJpbmcgaW4gb2N0YWwsIGFuZCB0ZXh0
IGlzIG11Y2ggbW9yZSBzaW1wbGUgdG8gaGFuZGxlLgpSZXBsYWNlIGZpZy10by1vY3QucHkgd2l0
aCBhIHNtYWxsZXIgc2VkIHNjcmlwdC4gIFRoaXMgY291bGQgYmUgYSBzaGVsbApvbmUtbGluZXIs
IGJ1dCBpdCBpcyBtdWNoIG1vcmUgc2ltcGxlIHRvIGNvbW1lbnQgc2Vuc2libHksIGFuZCBkb2Vz
bid0IG5lZWQgdG8KaW5jbHVkZSB0aGUgYWRkZWQgY29nbmF0aXZlIGxvYWQgb2YgbWFrZWZpbGUg
YW5kIHNoZWxsIGVzY2FwaW5nLgoKV2hpbGUgY2hhbmdpbmcgdGhpcyBsb2dpYywgdGFrZSB0aGUg
b3Bwb3J0dW5pdHkgdG8gb3B0aW1pc2UgdGhlIGJhbm5lcgpzcGFjZSAoYW5kIHRpbWUgb24gdGhl
IHNlcmlhbCBwb3J0KSBieSBkcm9wcGluZyB0cmFpbGluZyB3aGl0ZXNwYWNlLCB3aGljaCBpcwo4
NCBjaGFyYWN0ZXJzIGZvciBjdXJyZW50IHN0YWdpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cgp2MjoKICogTmV3CnYzOgogKiBGaXggZXJyb3I6IGJhY2tzbGFzaC1u
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlIFstV2Vycm9yXQogKiBJbXBsZW1lbnQgYXMgYSBzZWQgc2Ny
aXB0LgoKVGhpcyAodjMpIGlzIGhvdyBoYXBweSBpbiB0aGUgQ0k6CiAgaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi9waXBlbGluZXMvMTAxNDA5OTQ1CgpT
cG90dGVkIGJ5IEdpdGxhYiBDSSwgY2F1c2VkIGJ5IGB3aGljaGAgbm90IGJlaW5nIHByZXNlbnQg
aW4gc29tZSBvZiB0aGUKQ2VudE9TIGNvbnRhaW5lcnMuICBXaGlsZSB0aGlzIGlzIG1vcmUgb2Yg
YSBjb250YWluZXIgYnVnIHRoYW4gYW55dGhpbmcgZWxzZSwKaXQgZG9lcyBoaWdobGlnaHQgdGhh
dCB0aGUgYnVpbGQgb3VnaHQgdG8gY29wZS4KLS0tCiB4ZW4vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHhlbi90b29scy9maWctdG8tb2N0LnB5ICAgICAgfCAxOCAtLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi90b29scy9wcm9jZXNzLWJhbm5lci5zZWQgfCAxNCArKysrKysrKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCB4ZW4vdG9vbHMvZmlnLXRvLW9jdC5weQogY3JlYXRlIG1vZGUgMTAw
NzU1IHhlbi90b29scy9wcm9jZXNzLWJhbm5lci5zZWQKCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZp
bGUgYi94ZW4vTWFrZWZpbGUKaW5kZXggOTk3MDFlMzE2NS4uOTQ5Y2E2ZWIwMyAxMDA2NDQKLS0t
IGEveGVuL01ha2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtMTc2LDcgKzE3Niw3IEBAIGlu
Y2x1ZGUveGVuL2NvbXBpbGUuaDogaW5jbHVkZS94ZW4vY29tcGlsZS5oLmluIC5iYW5uZXIKIAkg
ICAgLWUgJ3MhQEBjaGFuZ2VzZXRAQCEkKHNoZWxsIHRvb2xzL3NjbXZlcnNpb24gJChYRU5fUk9P
VCkgfHwgZWNobyAidW5hdmFpbGFibGUiKSFnJyBcCiAJICAgIDwgaW5jbHVkZS94ZW4vY29tcGls
ZS5oLmluID4gJEAubmV3CiAJQGNhdCAuYmFubmVyCi0JQCQoUFlUSE9OKSB0b29scy9maWctdG8t
b2N0LnB5IDwgLmJhbm5lciA+PiAkQC5uZXcKKwlAc2VkIC1yZiB0b29scy9wcm9jZXNzLWJhbm5l
ci5zZWQgPCAuYmFubmVyID4+ICRALm5ldwogCUBtdiAtZiAkQC5uZXcgJEAKIAogaW5jbHVkZS9h
c20tJChUQVJHRVRfQVJDSCkvYXNtLW9mZnNldHMuaDogYXJjaC8kKFRBUkdFVF9BUkNIKS9hc20t
b2Zmc2V0cy5zCmRpZmYgLS1naXQgYS94ZW4vdG9vbHMvZmlnLXRvLW9jdC5weSBiL3hlbi90b29s
cy9maWctdG8tb2N0LnB5CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkYjRmZDMyMTU5
Li4wMDAwMDAwMDAwCi0tLSBhL3hlbi90b29scy9maWctdG8tb2N0LnB5CisrKyAvZGV2L251bGwK
QEAgLTEsMTggKzAsMCBAQAotIyEvdXNyL2Jpbi9lbnYgcHl0aG9uCi1pbXBvcnQgc3lzCi0KLWNo
YXJzX3Blcl9saW5lID0gMTgKLWNoYXJzX3NvX2ZhciA9IDAKLQotc3lzLnN0ZG91dC53cml0ZSgn
IicpCi0KLWZvciBjaGFyIGluIHN5cy5zdGRpbi5yZWFkKCk6Ci0KLSAgICBzeXMuc3Rkb3V0Lndy
aXRlKCJcXCUwM28iICUgb3JkKGNoYXIpKQotICAgIGNoYXJzX3NvX2ZhciA9IGNoYXJzX3NvX2Zh
ciArIDEKLQotICAgIGlmIGNoYXJzX3NvX2ZhciA9PSBjaGFyc19wZXJfbGluZToKLSAgICAgICAg
Y2hhcnNfc29fZmFyID0gMAotICAgICAgICBzeXMuc3Rkb3V0LndyaXRlKCciIFxcXG4iJykKLQot
c3lzLnN0ZG91dC53cml0ZSgnIlxuJykKZGlmZiAtLWdpdCBhL3hlbi90b29scy9wcm9jZXNzLWJh
bm5lci5zZWQgYi94ZW4vdG9vbHMvcHJvY2Vzcy1iYW5uZXIuc2VkCm5ldyBmaWxlIG1vZGUgMTAw
NzU1CmluZGV4IDAwMDAwMDAwMDAuLjU2Yzc2NTU4YmMKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4v
dG9vbHMvcHJvY2Vzcy1iYW5uZXIuc2VkCkBAIC0wLDAgKzEsMTQgQEAKKyMhL2Jpbi9zZWQgLXJm
CisjIFByb2Nlc3MgYSB0ZXh0IGlucHV0LCB0byB0dXJuIGl0IGludG8gYSBDIHN0cmluZyBmb3Ig
dGhlIFhFTl9CQU5ORVIgbWFjcm8uCisKKyMgU3RyaXAgdHJhaWxpbmcgd2hpdGVzcGFjZS4KK3Nf
ICokX18KKworIyBFc2NhcGUgYmFja3NsYXNoZXMuCitzX1xcX1xcXFxfZworCisjIEVuY2xvc2Ug
dGhlIGxpbmUgaW4gIi4uLlxuIi4KK3NfKC4qKV8iXDFcXG4iXworCisjIFRyYWlsaW5nIFwgb24g
YWxsIGJ1dCB0aGUgZmluYWwgbGluZS4KKyQhc18kXyBcXF8KLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
