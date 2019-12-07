Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4399115DE3
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 19:21:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idef8-00084O-Qb; Sat, 07 Dec 2019 18:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idef7-00084G-Dv
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 18:18:37 +0000
X-Inumbo-ID: f9212b57-191d-11ea-85dd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9212b57-191d-11ea-85dd-12813bfff9fa;
 Sat, 07 Dec 2019 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575742712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3520/ESBLK4L06rTyx5p5Mu+JL92QIa+7XDyqJ/WxhM=;
 b=BqCrqtDWGZPVAI/J1WlKUVnLL6qsJe12Ph7m3FLZ4DXe5PpGFYb9JRIm
 bep/jXiz9ZVpKOQotWAAsT/Mm45JP+tLgFLX3y5FnMGxJA5Z5saf1qrMq
 ewWJI91Caec4ejCZ6CcV5cFC0s0Zv9Ov2eNjuJEWvXiKT8dBe7I9I3V3i E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4EoXKo3TshCIOjlsJ0GNW4sYYb2UsLiaxjl0ho916/jL6SpztubvaCE/+bbGadD+Sut0NjHd2W
 I+LzWKLYGt4f0iMsNeZJNM6m7weC4n/GcJrAmhqx3lkGmFiMP+TTXRUF3WkPBhQSx2n2+qxyYJ
 C8ReD29GVZEIYl1Ht6/FHNYgSbdOXCoCXwmXDiydaoBI1NCD8z0Ne38QwzQ3y6o+GvZARt/mzs
 wCuBt7yBTlgXWcg2e0J4IGIiZQ/ei/nrsq7uCcF874k6d7DpQB0axUwB/rlXZ9qTSAE0uJxzAl
 CB8=
X-SBRS: 2.7
X-MesageID: 9350459
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9350459"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 18:18:11 +0000
Message-ID: <20191207181813.30176-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207181813.30176-1-andrew.cooper3@citrix.com>
References: <20191207181813.30176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] xen/flask: Drop the gen-policy.py script
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
Lmdvdj4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCnYyOgogKiBGaXggdGFi
cyB2cyBzcGFjZXMgaXNzdWVzCgpGb3IgNC4xMy4gIFRoaXMgaXMgYSBibG9ja2VyIHRvIG91ciBp
bnRlbnQgdG8gYnkgUHkzLWNsZWFuIGluIHRoaXMgcmVsZWFzZS4KCkRpc2NvdmVyZWQgZW50aXJl
bHkgYWNjaWRlbnRseSB3aGVuIHRlc3RpbmcgdGhlIGZpbmFsIHBhdGNoLgotLS0KIHhlbi94c20v
Zmxhc2svTWFrZWZpbGUgICAgICAgfCAgNiArKy0tLS0KIHhlbi94c20vZmxhc2svZmxhc2stcG9s
aWN5LlMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogeGVuL3hzbS9mbGFzay9nZW4tcG9saWN5
LnB5ICB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi94c20v
Zmxhc2svZmxhc2stcG9saWN5LlMKIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4veHNtL2ZsYXNrL2dl
bi1wb2xpY3kucHkKCmRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNrL01ha2VmaWxlIGIveGVuL3hz
bS9mbGFzay9NYWtlZmlsZQppbmRleCBmNWZmYWIxMjI2Li43YzNmMzgxMjg3IDEwMDY0NAotLS0g
YS94ZW4veHNtL2ZsYXNrL01ha2VmaWxlCisrKyBiL3hlbi94c20vZmxhc2svTWFrZWZpbGUKQEAg
LTI3LDcgKzI3LDggQEAgJChGTEFTS19IX0ZJTEVTKTogJChGTEFTS19IX0RFUEVORCkKICQoQVZf
SF9GSUxFUyk6ICQoQVZfSF9ERVBFTkQpCiAJJChDT05GSUdfU0hFTEwpIHBvbGljeS9ta2FjY2Vz
c192ZWN0b3Iuc2ggJChBV0spICQoQVZfSF9ERVBFTkQpCiAKLW9iai0kKENPTkZJR19YU01fRkxB
U0tfUE9MSUNZKSArPSBwb2xpY3kubworb2JqLWJpbi0kKENPTkZJR19YU01fRkxBU0tfUE9MSUNZ
KSArPSBmbGFzay1wb2xpY3kubworZmxhc2stcG9saWN5Lm86IHBvbGljeS5iaW4KIAogRkxBU0tf
QlVJTERfRElSIDo9ICQoQ1VSRElSKQogUE9MSUNZX1NSQyA6PSAkKEZMQVNLX0JVSUxEX0RJUikv
eGVucG9saWN5LSQoWEVOX0ZVTExWRVJTSU9OKQpAQCAtMzYsOSArMzcsNiBAQCBwb2xpY3kuYmlu
OiBGT1JDRQogCSQoTUFLRSkgLWYgJChYRU5fUk9PVCkvdG9vbHMvZmxhc2svcG9saWN5L01ha2Vm
aWxlLmNvbW1vbiAtQyAkKFhFTl9ST09UKS90b29scy9mbGFzay9wb2xpY3kgRkxBU0tfQlVJTERf
RElSPSQoRkxBU0tfQlVJTERfRElSKQogCWNtcCAtcyAkKFBPTElDWV9TUkMpICRAIHx8IGNwICQo
UE9MSUNZX1NSQykgJEAKIAotcG9saWN5LmM6IHBvbGljeS5iaW4gZ2VuLXBvbGljeS5weQotCSQo
UFlUSE9OKSBnZW4tcG9saWN5LnB5IDwgJDwgPiAkQAotCiAuUEhPTlk6IGNsZWFuCiBjbGVhbjo6
CiAJcm0gLWYgJChBTExfSF9GSUxFUykgKi5vICQoREVQU19STSkgcG9saWN5LiogJChQT0xJQ1lf
U1JDKQpkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUyBiL3hlbi94c20v
Zmxhc2svZmxhc2stcG9saWN5LlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uYjYzYTE0ODUxZAotLS0gL2Rldi9udWxsCisrKyBiL3hlbi94c20vZmxhc2svZmxhc2stcG9s
aWN5LlMKQEAgLTAsMCArMSwyMCBAQAorICAgICAgICAuc2VjdGlvbiAuaW5pdC5yb2RhdGEsICJh
IiwgQHByb2diaXRzCisKKy8qIGNvbnN0IHVuc2lnbmVkIGNoYXIgeHNtX2ZsYXNrX2luaXRfcG9s
aWN5W10gX19pbml0Y29uc3QgKi8KKyAgICAgICAgLmFsaWduIDQKKyAgICAgICAgLmdsb2JhbCB4
c21fZmxhc2tfaW5pdF9wb2xpY3kKK3hzbV9mbGFza19pbml0X3BvbGljeToKKyAgICAgICAgLmlu
Y2JpbiAicG9saWN5LmJpbiIKKy5MZW5kOgorCisgICAgICAgIC50eXBlIHhzbV9mbGFza19pbml0
X3BvbGljeSwgQG9iamVjdAorICAgICAgICAuc2l6ZSB4c21fZmxhc2tfaW5pdF9wb2xpY3ksIC4g
LSB4c21fZmxhc2tfaW5pdF9wb2xpY3kKKworLyogY29uc3QgdW5zaWduZWQgaW50IF9faW5pdGNv
bnN0IHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplICovCisgICAgICAgIC5hbGlnbiA0CisgICAg
ICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5X3NpemUKK3hzbV9mbGFza19pbml0X3Bv
bGljeV9zaXplOgorICAgICAgICAubG9uZyAuTGVuZCAtIHhzbV9mbGFza19pbml0X3BvbGljeQor
CisgICAgICAgIC50eXBlIHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplLCBAb2JqZWN0CisgICAg
ICAgIC5zaXplIHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplLCAuIC0geHNtX2ZsYXNrX2luaXRf
cG9saWN5X3NpemUKZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weSBiL3hl
bi94c20vZmxhc2svZ2VuLXBvbGljeS5weQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
Yzc1MDFlNDYxNC4uMDAwMDAwMDAwMAotLS0gYS94ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkK
KysrIC9kZXYvbnVsbApAQCAtMSwyMyArMCwwIEBACi0jIS91c3IvYmluL2VudiBweXRob24KLWlt
cG9ydCBzeXMKLQotcG9saWN5X3NpemUgPSAwCi0KLXN5cy5zdGRvdXQud3JpdGUoIiIiCi0vKiBU
aGlzIGZpbGUgaXMgYXV0b2dlbmVyYXRlZCBieSBnZW5fcG9saWN5LnB5ICovCi0jaW5jbHVkZSA8
eGVuL2luaXQuaD4KLSNpbmNsdWRlIDx4c20veHNtLmg+Ci0KLWNvbnN0IHVuc2lnbmVkIGNoYXIg
eHNtX2ZsYXNrX2luaXRfcG9saWN5W10gX19pbml0Y29uc3QgPSB7Ci0iIiIpCi0KLWZvciBjaGFy
IGluIHN5cy5zdGRpbi5yZWFkKCk6Ci0gICAgc3lzLnN0ZG91dC53cml0ZSgiIDB4JTAyeCwiICUg
b3JkKGNoYXIpKQotICAgIHBvbGljeV9zaXplID0gcG9saWN5X3NpemUgKyAxCi0gICAgaWYgcG9s
aWN5X3NpemUgJSAxMyA9PSAwOgotICAgICAgICBzeXMuc3Rkb3V0LndyaXRlKCJcbiIpCi0KLXN5
cy5zdGRvdXQud3JpdGUoIiIiCi19OwotY29uc3QgdW5zaWduZWQgaW50IF9faW5pdGNvbnN0IHhz
bV9mbGFza19pbml0X3BvbGljeV9zaXplID0gJWQ7Ci0iIiIgJSBwb2xpY3lfc2l6ZSkKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
