Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BA15650E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 16:22:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0RtZ-0003x6-Eq; Sat, 08 Feb 2020 15:19:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=liCr=34=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j0RtY-0003x1-Nn
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2020 15:19:44 +0000
X-Inumbo-ID: 6e912e2e-4a86-11ea-b319-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e912e2e-4a86-11ea-b319-12813bfff9fa;
 Sat, 08 Feb 2020 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581175184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HcblYZz7MUwVQtM4xzoEyF52IucTPJqP19UFGTQYrx0=;
 b=FZC8AL1pnql6sypV+Tz4nnG8BiaemJklHu9S1d0ckeqPAyWTITMpgr1y
 dPpFy1rMU00BF2ZZxPbcZNAnkXwm0gkdhm0KeyYJyUbkSqOamGowT9I6H
 ap4/JO63wPFPzuhdBXGN9JplyFA7f+HXW+nQAU83CMW7QsFtTNJ922ToG 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kdlWRpSHR7ZJqqmToMDjwrygQ1XmRozDFiSqhNpdVw70Y/HjBN/UjUQ0Mg8CaGRlvhLWG3izfM
 edSJHhjkp3k4FN5Cr3ZlSivgXjzWJdj2T55ixXsFDaGbclxyCZJl3jFLkFKplU8goeIUPSOh6b
 bk+5dttII/KiXIkKovphRrGHHVyjbEGgULXScvHm6aDON7gaQ4adgogE2lAP3/s6AFQn1K+mkr
 Mi92NCFusmJ6ISwwPGxdsCCwinmR9w5QFboSSfdCYifTBEaY4sk2+G5d1IGRF0vav6pPQwxguj
 qAA=
X-SBRS: 2.7
X-MesageID: 12328351
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,417,1574139600"; d="scan'208";a="12328351"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 8 Feb 2020 15:19:39 +0000
Message-ID: <20200208151939.31691-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHdyaXR0ZW4gQUJJIHN0YXRlcyB0aGF0ICVlcyB3aWxsIGJlIHNldCB1cCwgYnV0IGxpYnhj
IGRvZXNuJ3QgZG8gc28uICBJbgpwcmFjdGljZSwgaXQgYnJlYWtzIGByZXAgbW92c2AgaW5zaWRl
IGd1ZXN0cyBiZWZvcmUgdGhleSByZWxvYWQgJWVzLgoKVGhlIHdyaXR0ZW4gQUJJIGRvZXNuJ3Qg
bWVudGlvbiAlc3MsIGJ1dCBsaWJ4YyBkb2VzIHNldCBpdCB1cC4gIEhhdmluZyAlZHMKZGlmZmVy
ZW50IHRvICVzcyBpcyBvYm5veG91cyB0byB3b3JrIHdpdGgsIGFzIGRpZmZlcmVudCByZWdpc3Rl
cnMgaGF2ZQpkaWZmZXJlbnQgaW1wbGljaXQgc2VnbWVudHMuCgpNb2RpZnkgdGhlIHNwZWMgdG8g
c3RhdGUgdGhhdCAlc3MgaXMgc2V0IHVwIGFzIGEgZmxhdCByZWFkL3dyaXRlIHNlZ21lbnQuClRo
aXMgYSkgbWF0Y2hlcyB0aGUgTXVsdGlib290IDEgc3BlYywgYikgbWF0Y2hlcyB3aGF0IGlzIHNl
dCB1cCBpbiBwcmFjdGljZSwKYW5kIGMpIGlzIHRoZSBtb3JlIHNhbmUgYmVoYXZpb3VyIGZvciBn
dWVzdHMgdG8gdXNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KClRoaXMg
d2FudHMgYmFja3BvcnRpbmcuCi0tLQogZG9jcy9taXNjL3B2aC5wYW5kb2MgICAgIHwgMiArLQog
dG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3B2aC5wYW5k
b2MgYi9kb2NzL21pc2MvcHZoLnBhbmRvYwppbmRleCBmODkyZTZlNjQxLi5jY2YxYzhmZTY5IDEw
MDY0NAotLS0gYS9kb2NzL21pc2MvcHZoLnBhbmRvYworKysgYi9kb2NzL21pc2MvcHZoLnBhbmRv
YwpAQCAtMjMsNyArMjMsNyBAQCBmb2xsb3dpbmcgbWFjaGluZSBzdGF0ZToKICAqIGBjc2A6IG11
c3QgYmUgYSAzMi1iaXQgcmVhZC9leGVjdXRlIGNvZGUgc2VnbWVudCB3aXRoIGEgYmFzZSBvZiDi
gJgw4oCZCiAgICBhbmQgYSBsaW1pdCBvZiDigJgweEZGRkZGRkZG4oCZLiBUaGUgc2VsZWN0b3Ig
dmFsdWUgaXMgdW5zcGVjaWZpZWQuCiAKLSAqIGBkc2AsIGBlc2A6IG11c3QgYmUgYSAzMi1iaXQg
cmVhZC93cml0ZSBkYXRhIHNlZ21lbnQgd2l0aCBhIGJhc2Ugb2YKKyAqIGBkc2AsIGBlc2AsIGBz
c2A6IG11c3QgYmUgYSAzMi1iaXQgcmVhZC93cml0ZSBkYXRhIHNlZ21lbnQgd2l0aCBhIGJhc2Ug
b2YKICAgIOKAmDDigJkgYW5kIGEgbGltaXQgb2Yg4oCYMHhGRkZGRkZGRuKAmS4gVGhlIHNlbGVj
dG9yIHZhbHVlcyBhcmUgYWxsIHVuc3BlY2lmaWVkLgogCiAgKiBgdHJgOiBtdXN0IGJlIGEgMzIt
Yml0IFRTUyAoYWN0aXZlKSB3aXRoIGEgYmFzZSBvZiAnMCcgYW5kIGEgbGltaXQgb2YgJzB4Njcn
LgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNf
ZG9tX3g4Ni5jCmluZGV4IDE1NWVmNjkwMzcuLjk0Mzk4MDVlYWEgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhjL3hjX2RvbV94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19kb21feDg2LmMKQEAgLTEw
NTMsMTQgKzEwNTMsMTcgQEAgc3RhdGljIGludCB2Y3B1X2h2bShzdHJ1Y3QgeGNfZG9tX2ltYWdl
ICpkb20pCiAgICAgLyogU2V0IHRoZSBjYWNoZWQgcGFydCBvZiB0aGUgcmVsZXZhbnQgc2VnbWVu
dCByZWdpc3RlcnMuICovCiAgICAgYnNwX2N0eC5jcHUuY3NfYmFzZSA9IDA7CiAgICAgYnNwX2N0
eC5jcHUuZHNfYmFzZSA9IDA7CisgICAgYnNwX2N0eC5jcHUuZXNfYmFzZSA9IDA7CiAgICAgYnNw
X2N0eC5jcHUuc3NfYmFzZSA9IDA7CiAgICAgYnNwX2N0eC5jcHUudHJfYmFzZSA9IDA7CiAgICAg
YnNwX2N0eC5jcHUuY3NfbGltaXQgPSB+MHU7CiAgICAgYnNwX2N0eC5jcHUuZHNfbGltaXQgPSB+
MHU7CisgICAgYnNwX2N0eC5jcHUuZXNfbGltaXQgPSB+MHU7CiAgICAgYnNwX2N0eC5jcHUuc3Nf
bGltaXQgPSB+MHU7CiAgICAgYnNwX2N0eC5jcHUudHJfbGltaXQgPSAweDY3OwogICAgIGJzcF9j
dHguY3B1LmNzX2FyYnl0ZXMgPSAweGM5YjsKICAgICBic3BfY3R4LmNwdS5kc19hcmJ5dGVzID0g
MHhjOTM7CisgICAgYnNwX2N0eC5jcHUuZXNfYXJieXRlcyA9IDB4YzkzOwogICAgIGJzcF9jdHgu
Y3B1LnNzX2FyYnl0ZXMgPSAweGM5MzsKICAgICBic3BfY3R4LmNwdS50cl9hcmJ5dGVzID0gMHg4
YjsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
