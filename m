Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BAC177589
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 12:56:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9673-0001NJ-I9; Tue, 03 Mar 2020 11:53:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9672-0001NE-34
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 11:53:24 +0000
X-Inumbo-ID: 951a7d44-5d45-11ea-a132-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 951a7d44-5d45-11ea-a132-12813bfff9fa;
 Tue, 03 Mar 2020 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583236403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJ2Y4K1/MLP14q3XX9JMCQKA3bXUY1R9HuMcyEsM/RY=;
 b=hCuJQ1JVBDOGugfDozZMdYa1knINMLHyZDHH/vRBLl4oeY19w+vzfoNS
 ruKSoblVJhjQ+HNwwEIDoHqVsqWiXvOiE7X+QFamMJ4WNDCuvZ1yuXIS/
 jT+/+daBCuiB5IDSIT+Noitq6yGTmNEJfagGZZ7kakJSLv5Fs/vktgZu3 o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m2rlbu+djAEFOD7LwoLXS1cuzbQhkfhIL0cPHxNFmIyPIjFYvrAz8L1ZAHPWhdDmio6+YDkCRp
 pA3iB52xIgNYy8dBp516EkoDTrEaXzOtMVbkdYJZoYmexE6ruxy8tY5YbehuRLJ4ok5XFwXwqN
 rOEk6rcTvuKIzdMldw/juS3mJP/0b17n6jir/pQNqJX+gP4zAq+o0aonzSr0q9aVvnawOT8I42
 lyvubj4DiR/9IRN02otspuRQxIh6UqB9gYmOBTrpLXKwwfyUTL5FduO2BZt1yjHQ+WS5PdGyre
 dW0=
X-SBRS: 2.7
X-MesageID: 13305173
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13305173"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 12:52:53 +0100
Message-ID: <20200303115253.47449-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/dom0: improve PVH initrd and metadata
 placement
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYXNzdW1lIHRoZXJlJ3MgZ29pbmcgdG8gYmUgZW5vdWdoIHNwYWNlIGF0IHRoZSB0YWls
IG9mIHRoZQpsb2FkZWQga2VybmVsIGFuZCBpbnN0ZWFkIHRyeSB0byBmaW5kIGEgc3VpdGFibGUg
bWVtb3J5IGFyZWEgd2hlcmUgdGhlCmluaXRyZCBhbmQgbWV0YWRhdGEgY2FuIGJlIGxvYWRlZC4K
ClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0t
CkNoYW5nZXMgc2luY2UgdjE6CiAtIENhbGN1bGF0ZSBlbmQgb2YgZTgyMCBlbnRyeSBlYXJsaWVy
LgogLSBPbmx5IGNoZWNrIGlmIHRoZSBlbmQgb2YgdGhlIHJlZ2lvbiBpcyA8IDFNQi4KIC0gQ2hl
Y2sgZm9yIHJhbmdlIG92ZXJsYXBzIHdpdGggdGhlIGtlcm5lbCByZWdpb24uCiAtIENoZWNrIHRo
ZSByZWdpb24gaXMgb2YgdHlwZSBSQU0uCiAtIEZpeCBvZmYtYnktb25lIGNoZWNrcyBpbiByYW5n
ZSBvdmVybGFwcy4KIC0gQWRkIGEgY29tbWVudCBhYm91dCB3aHkgaW5pdHJkIGFuZCBtZXRhZGF0
YSBpcyBwbGFjZWQgdG9nZXRoZXIuCiAtIEFkZCBwYXJlbnRoZXNlcyBhcm91bmQgc2l6ZSBjYWxj
dWxhdGlvbnMuCi0tLQogeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgfCA1OCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBf
YnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCmluZGV4IGVkZWQ4N2VhZjUu
LjMzNTIwZWMxYmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCkBAIC00OTAsNiArNDkwLDQ1IEBAIHN0
YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9wMm0oc3RydWN0IGRvbWFpbiAqZCkKICN1bmRl
ZiBNQjFfUEFHRVMKIH0KIAorc3RhdGljIHBhZGRyX3QgZmluZF9tZW1vcnkoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGVsZl9iaW5hcnkgKmVsZiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVfdCBzaXplKQoreworICAgIHBhZGRyX3Qga2VybmVsX3N0YXJ0ID0g
KHBhZGRyX3QpZWxmLT5kZXN0X2Jhc2U7CisgICAgcGFkZHJfdCBrZXJuZWxfZW5kID0gKHBhZGRy
X3QpKGVsZi0+ZGVzdF9iYXNlICsgZWxmLT5kZXN0X3NpemUpOworICAgIHVuc2lnbmVkIGludCBp
OworCisgICAgZm9yICggaSA9IDA7IGkgPCBkLT5hcmNoLm5yX2U4MjA7IGkrKyApCisgICAgewor
ICAgICAgICBwYWRkcl90IHN0YXJ0LCBlbmQgPSBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQtPmFy
Y2guZTgyMFtpXS5zaXplOworCisgICAgICAgIC8qIERvbid0IHVzZSBtZW1vcnkgYmVsb3cgMU1C
LCBhcyBpdCBjb3VsZCBvdmVyd3JpdGUgdGhlIEJEQS9FQkRBLiAqLworICAgICAgICBpZiAoIGVu
ZCA8PSBNQigxKSB8fCBkLT5hcmNoLmU4MjBbaV0udHlwZSAhPSBFODIwX1JBTSApCisgICAgICAg
ICAgICBjb250aW51ZTsKKworICAgICAgICBzdGFydCA9IE1BWChST1VORFVQKGQtPmFyY2guZTgy
MFtpXS5hZGRyLCBQQUdFX1NJWkUpLCBNQigxKSk7CisKKyAgICAgICAgaWYgKCBlbmQgPD0ga2Vy
bmVsX3N0YXJ0IHx8IHN0YXJ0ID49IGtlcm5lbF9lbmQgKQorICAgICAgICAgICAgOyAvKiBObyBv
dmVybGFwLCBub3RoaW5nIHRvIGRvLiAqLworICAgICAgICAvKiBEZWFsIHdpdGggdGhlIGtlcm5l
bCBhbHJlYWR5IGJlaW5nIGxvYWRlZCBpbiB0aGUgcmVnaW9uLiAqLworICAgICAgICBlbHNlIGlm
ICgga2VybmVsX3N0YXJ0IDw9IHN0YXJ0ICYmIGtlcm5lbF9lbmQgPiBzdGFydCApCisgICAgICAg
ICAgICAvKiBUcnVuY2F0ZSB0aGUgc3RhcnQgb2YgdGhlIHJlZ2lvbi4gKi8KKyAgICAgICAgICAg
IHN0YXJ0ID0gUk9VTkRVUChrZXJuZWxfZW5kLCBQQUdFX1NJWkUpOworICAgICAgICBlbHNlIGlm
ICgga2VybmVsX3N0YXJ0IDw9IGVuZCAmJiBrZXJuZWxfZW5kID4gZW5kICkKKyAgICAgICAgICAg
IC8qIFRydW5jYXRlIHRoZSBlbmQgb2YgdGhlIHJlZ2lvbi4gKi8KKyAgICAgICAgICAgIGVuZCA9
IGtlcm5lbF9zdGFydDsKKyAgICAgICAgLyogUGljayB0aGUgYmlnZ2VzdCBvZiB0aGUgc3BsaXQg
cmVnaW9ucy4gKi8KKyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCAtIHN0YXJ0ID4gZW5k
IC0ga2VybmVsX2VuZCApCisgICAgICAgICAgICBlbmQgPSBrZXJuZWxfc3RhcnQ7CisgICAgICAg
IGVsc2UKKyAgICAgICAgICAgIHN0YXJ0ID0gUk9VTkRVUChrZXJuZWxfZW5kLCBQQUdFX1NJWkUp
OworCisgICAgICAgIGlmICggZW5kIC0gc3RhcnQgPj0gc2l6ZSApCisgICAgICAgICAgICByZXR1
cm4gc3RhcnQ7CisgICAgfQorCisgICAgcmV0dXJuIElOVkFMSURfUEFERFI7Cit9CisKIHN0YXRp
YyBpbnQgX19pbml0IHB2aF9sb2FkX2tlcm5lbChzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBtb2R1
bGVfdCAqaW1hZ2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBpbWFnZV9oZWFkcm9vbSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
b2R1bGVfdCAqaW5pdHJkLCB2b2lkICppbWFnZV9iYXNlLApAQCAtNTQ2LDcgKzU4NSwyNCBAQCBz
dGF0aWMgaW50IF9faW5pdCBwdmhfbG9hZF9rZXJuZWwoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qg
bW9kdWxlX3QgKmltYWdlLAogICAgICAgICByZXR1cm4gcmM7CiAgICAgfQogCi0gICAgbGFzdF9h
ZGRyID0gUk9VTkRVUChwYXJtcy52aXJ0X2tlbmQgLSBwYXJtcy52aXJ0X2Jhc2UsIFBBR0VfU0la
RSk7CisgICAgLyoKKyAgICAgKiBGaW5kIGEgUkFNIHJlZ2lvbiBiaWcgZW5vdWdoIChhbmQgdGhh
dCBkb2Vzbid0IG92ZXJsYXAgd2l0aCB0aGUgbG9hZGVkCisgICAgICoga2VybmVsKSBpbiBvcmRl
ciB0byBsb2FkIHRoZSBpbml0cmQgYW5kIHRoZSBtZXRhZGF0YS4gTm90ZSBpdCBjb3VsZCBiZQor
ICAgICAqIHNwbGl0IGludG8gc21hbGxlciBhbGxvY2F0aW9ucywgZG9uZSBpdCBhcyBhIHNpbmds
ZSByZWdpb24gaW4gb3JkZXIgdG8KKyAgICAgKiBzaW1wbGlmeSBpdC4KKyAgICAgKi8KKyAgICBs
YXN0X2FkZHIgPSBmaW5kX21lbW9yeShkLCAmZWxmLCBzaXplb2Yoc3RhcnRfaW5mbykgKworICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChpbml0cmQgPyBST1VORFVQKGluaXRyZC0+bW9kX2Vu
ZCwgUEFHRV9TSVpFKSArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZihtb2QpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IDApICsKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoY21kbGluZSA/IFJPVU5EVVAoc3RybGVuKGNtZGxp
bmUpICsgMSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZWxmXzY0Yml0KCZlbGYpID8gOCA6IDQpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiAwKSk7CisgICAgaWYgKCBsYXN0X2FkZHIgPT0gSU5WQUxJRF9QQUREUiApCisgICAg
eworICAgICAgICBwcmludGsoIlVuYWJsZSB0byBmaW5kIGEgbWVtb3J5IHJlZ2lvbiB0byBsb2Fk
IGluaXRyZCBhbmQgbWV0YWRhdGFcbiIpOworICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICB9
CiAKICAgICBpZiAoIGluaXRyZCAhPSBOVUxMICkKICAgICB7Ci0tIAoyLjI1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
