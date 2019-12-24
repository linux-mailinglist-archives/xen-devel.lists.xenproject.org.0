Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7212A2F5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:23:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijlyZ-0000LL-4K; Tue, 24 Dec 2019 15:19:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijlyX-0000KI-5Z
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:19:57 +0000
X-Inumbo-ID: cee1058c-2660-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cee1058c-2660-11ea-b6f1-bc764e2007e4;
 Tue, 24 Dec 2019 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577200782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=layIOlvyz2mflWYBoajH7snKfP2ZntD7gry0s6iWE38=;
 b=dToNGyUUmMRAsmThyLSYotPPA/fpKVA3AT1qBFr+jcEbvOiTpdlAdnb1
 YAHC+8j2KCsErBCpWL9lgFtw8RTzczblKRl/JZ1U/cxGm8Y1YqAswpLuk
 flTD+FKVLhXh5At5o+/OOFmKrP2LF3xTukL8NQj3H58nJGnZvsSqg79eG 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gVdPLoh5JAPxHWft0PE0GvK98eY8IkTvw8A4+oJ2PIDfQUdYx1NGRyq1XbaM5xoswfF0h95AE1
 fdjReqh+D2lMil/HZe3eHWNRuF2LAcDD02UCnrnOYjUVse/2l1TlWusaElg8Jjm+U6KhDzY5iU
 zYPDxnZDr/EaOZRgfT2Cia1qooE8f5+LcZ2gH9KyhIX/4pWGapiV+s9T0VSMWOM9ZISmejrAlX
 a62BBMjMx3l8NBMrtDCSEeANmVTXhRiSLEv0lcxpg+GwIx+1wbNQpYK9X5N1TLcqwbN4hpDnQF
 MH0=
X-SBRS: 2.7
X-MesageID: 10540372
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10540372"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:27 +0000
Message-ID: <20191224151932.6304-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 07/12] python/migration: Update validation logic
 to understand a v3 stream
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
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+Ci0tLQogdG9vbHMvcHl0aG9uL3hlbi9taWdyYXRpb24vbGlieGMucHkgfCAy
NiArKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9uL3hlbi9taWdy
YXRpb24vbGlieGMucHkgYi90b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4Yy5weQppbmRl
eCBkMGM0ZjM1MjdkLi41ZmI1MWI1NmFjIDEwMDY0NAotLS0gYS90b29scy9weXRob24veGVuL21p
Z3JhdGlvbi9saWJ4Yy5weQorKysgYi90b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4Yy5w
eQpAQCAtMTE5LDYgKzExOSw3IEBAIGNsYXNzIFZlcmlmeUxpYnhjKFZlcmlmeUJhc2UpOgogICAg
IGRlZiBfX2luaXRfXyhzZWxmLCBpbmZvLCByZWFkKToKICAgICAgICAgVmVyaWZ5QmFzZS5fX2lu
aXRfXyhzZWxmLCBpbmZvLCByZWFkKQogCisgICAgICAgIHNlbGYudmVyc2lvbiA9IDAKICAgICAg
ICAgc2VsZi5zcXVhc2hlZF9wYWdlZGF0YV9yZWNvcmRzID0gMAogCiAKQEAgLTE0NSw5ICsxNDYs
MTIgQEAgZGVmIHZlcmlmeV9paGRyKHNlbGYpOgogICAgICAgICAgICAgcmFpc2UgU3RyZWFtRXJy
b3IoIkJhZCBpbWFnZSBpZDogRXhwZWN0ZWQgMHgleCwgZ290IDB4JXgiICUKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChJSERSX0lERU5ULCBpZGVudCkpCiAKLSAgICAgICAgaWYgdmVy
c2lvbiAhPSAyOgotICAgICAgICAgICAgcmFpc2UgU3RyZWFtRXJyb3IoIlVua25vd24gaW1hZ2Ug
dmVyc2lvbjogRXhwZWN0ZWQgMiwgZ290ICVkIiAlCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodmVyc2lvbiwgKSkKKyAgICAgICAgaWYgbm90ICgyIDw9IHZlcnNpb24gPD0gMyk6Cisg
ICAgICAgICAgICByYWlzZSBTdHJlYW1FcnJvcigKKyAgICAgICAgICAgICAgICAiVW5rbm93biBp
bWFnZSB2ZXJzaW9uOiBFeHBlY3RlZCAyIDw9IHZlciA8PSAzLCBnb3QgJWQiICUKKyAgICAgICAg
ICAgICAgICAodmVyc2lvbiwgKSkKKworICAgICAgICBzZWxmLnZlcnNpb24gPSB2ZXJzaW9uCiAK
ICAgICAgICAgaWYgb3B0aW9ucyAmIElIRFJfT1BUX1JFU1pfTUFTSzoKICAgICAgICAgICAgIHJh
aXNlIFN0cmVhbUVycm9yKCJSZXNlcnZlZCBiaXRzIHNldCBpbiBpbWFnZSBvcHRpb25zIGZpZWxk
OiAweCV4IiAlCkBAIC0xNjQsNyArMTY4LDggQEAgZGVmIHZlcmlmeV9paGRyKHNlbGYpOgogICAg
ICAgICAgICAgICAgICJTdHJlYW0gaXMgbm90IG5hdGl2ZSBlbmRpYW5lc3MgLSB1bmFibGUgdG8g
dmFsaWRhdGUiKQogCiAgICAgICAgIGVuZGlhbiA9IFsibGl0dGxlIiwgImJpZyJdW29wdGlvbnMg
JiBJSERSX09QVF9MRV0KLSAgICAgICAgc2VsZi5pbmZvKCJMaWJ4YyBJbWFnZSBIZWFkZXI6ICVz
IGVuZGlhbiIgJSAoZW5kaWFuLCApKQorICAgICAgICBzZWxmLmluZm8oIkxpYnhjIEltYWdlIEhl
YWRlcjogVmVyc2lvbiAlZCwgJXMgZW5kaWFuIiAlCisgICAgICAgICAgICAgICAgICAodmVyc2lv
biwgZW5kaWFuKSkKIAogCiAgICAgZGVmIHZlcmlmeV9kaGRyKHNlbGYpOgpAQCAtNDI0LDYgKzQy
OSwxNiBAQCBkZWYgdmVyaWZ5X3JlY29yZF9jaGVja3BvaW50X2RpcnR5X3Bmbl9saXN0KHNlbGYs
IGNvbnRlbnQpOgogICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiRm91bmQgY2hlY2twb2ludCBk
aXJ0eSBwZm4gbGlzdCByZWNvcmQgaW4gc3RyZWFtIikKIAogCisgICAgZGVmIHZlcmlmeV9yZWNv
cmRfc3RhdGljX2RhdGFfZW5kKHNlbGYsIGNvbnRlbnQpOgorICAgICAgICAiIiIgc3RhdGljIGRh
dGEgZW5kIHJlY29yZCAiIiIKKworICAgICAgICBpZiBsZW4oY29udGVudCkgIT0gMDoKKyAgICAg
ICAgICAgIHJhaXNlIFJlY29yZEVycm9yKCJFbmQgcmVjb3JkIHdpdGggbm9uLXplcm8gbGVuZ3Ro
IikKKworICAgICAgICBpZiBzZWxmLnZlcnNpb24gPCAzOgorICAgICAgICAgICAgcmFpc2UgUmVj
b3JkRXJyb3IoIlN0YXRpYyBkYXRhIGVuZCByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKKwor
CiByZWNvcmRfdmVyaWZpZXJzID0gewogICAgIFJFQ19UWVBFX2VuZDoKICAgICAgICAgVmVyaWZ5
TGlieGMudmVyaWZ5X3JlY29yZF9lbmQsCkBAIC00NjUsNCArNDgwLDcgQEAgZGVmIHZlcmlmeV9y
ZWNvcmRfY2hlY2twb2ludF9kaXJ0eV9wZm5fbGlzdChzZWxmLCBjb250ZW50KToKICAgICAgICAg
VmVyaWZ5TGlieGMudmVyaWZ5X3JlY29yZF9jaGVja3BvaW50LAogICAgIFJFQ19UWVBFX2NoZWNr
cG9pbnRfZGlydHlfcGZuX2xpc3Q6CiAgICAgICAgIFZlcmlmeUxpYnhjLnZlcmlmeV9yZWNvcmRf
Y2hlY2twb2ludF9kaXJ0eV9wZm5fbGlzdCwKKworICAgIFJFQ19UWVBFX3N0YXRpY19kYXRhX2Vu
ZDoKKyAgICAgICAgVmVyaWZ5TGlieGMudmVyaWZ5X3JlY29yZF9zdGF0aWNfZGF0YV9lbmQsCiAg
ICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
