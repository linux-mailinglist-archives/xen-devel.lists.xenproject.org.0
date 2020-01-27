Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7D14A650
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:38:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5TZ-0001UD-RD; Mon, 27 Jan 2020 14:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5TX-0001Th-Qg
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:34:51 +0000
X-Inumbo-ID: 2cd87208-4112-11ea-855c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cd87208-4112-11ea-855c-12813bfff9fa;
 Mon, 27 Jan 2020 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=pvpzhNbntIVWvF1ywdzId5/B1YA3CMsL8tn8OeeGOE8=;
 b=MC8CEH4J/zlHLjdEp73KW1VNubFIYQtnt8UtmtHVS2bKThHEJ0TelU+9
 Z2Q6m9OPVoWhXxL3TD/2FIa0J84w6cnl0CC6P0/IfpdVjVSPW1UhTqNaF
 7HX20pr5XlLbWieJRWETveMLTpKxLfLjol/MquTQz2lXlRXnj0zvtmbI+ s=;
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
IronPort-SDR: MuAm13dT2XQpxDVZ8uqhfigYFsa5zZU2Y7hU1Pxuv3ZtY6UBjaodLU2rRhBnO9JAkyy5iHFtoW
 k1fKu2zpupGFBFj1wVFYRbdIzEGFUPzzdXyO9bqOs/Xpx6Bji6Y8pIZxpXsLt2IGkHJMcxzUB/
 IN8bQQ+F2x/VZDLDMlKysVLi6mEISw+XgEDFQ32ku58VM06MVmwP5P3dTx3DLztw8wrpobieqc
 iC1oszGtKirtOfc/8QiAlmQFMaA2Y6tJ4Gq8+A5iwMeUIm5IhCTPAgZuxKIzmWOA7KQd6NYjsS
 4zQ=
X-SBRS: 2.7
X-MesageID: 11664971
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11664971"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:29 +0000
Message-ID: <20200127143444.25538-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/17] tools/libxl: Simplify callback
 handling in libxl-save-helper
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHtzYXZlLHJlc3RvcmV9X2NhbGxiYWNrIGhlbHBlcnMgY2FuIGhhdmUgdGhlaXIgc2NvcGUg
cmVkdWNlZCB2YXN0bHksIGFuZApoZWxwZXJfc2V0Y2FsbGJhY2tzX3tzYXZlLHJlc3RvcmV9KCkg
ZG9lc24ndCBuZWVkIHRvIHVzZSBhIHRlcm5hcnkgb3BlcmF0b3IgdG8Kd3JpdGUgMCAobWVhbmlu
ZyBOVUxMKSBpbnRvIGFuIGFscmVhZHkgemVyb2VkIHN0cnVjdHVyZS4KCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9zYXZlX2hlbHBlci5jICAgIHwgMTYg
KysrKysrLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9tc2dzX2dlbi5wbCB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9oZWxwZXIuYyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX3NhdmVfaGVscGVyLmMKaW5kZXggMDE3YzdjZDk4OC4uNjVkZmYzODliZiAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9oZWxwZXIuYworKysgYi90b29scy9saWJ4bC9s
aWJ4bF9zYXZlX2hlbHBlci5jCkBAIC0yMTcsOCArMjE3LDYgQEAgaW50IGhlbHBlcl9nZXRyZXBs
eSh2b2lkICp1c2VyKQogCiAvKi0tLS0tIG90aGVyIGNhbGxiYWNrcyAtLS0tLSovCiAKLXN0YXRp
YyBzdHJ1Y3Qgc2F2ZV9jYWxsYmFja3MgaGVscGVyX3NhdmVfY2FsbGJhY2tzOwotCiBzdGF0aWMg
dm9pZCBzdGFydHVwKGNvbnN0IGNoYXIgKm9wKSB7CiAgICAgeHRsX2xvZygmbG9nZ2VyLFhUTF9E
RUJVRywwLHByb2dyYW0sInN0YXJ0aW5nICVzIixvcCk7CiAKQEAgLTIzNCw4ICsyMzIsNiBAQCBz
dGF0aWMgdm9pZCBjb21wbGV0ZShpbnQgcmV0dmFsKSB7CiAgICAgZXhpdCgwKTsKIH0KIAotc3Rh
dGljIHN0cnVjdCByZXN0b3JlX2NhbGxiYWNrcyBoZWxwZXJfcmVzdG9yZV9jYWxsYmFja3M7Ci0K
IGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIHsKICAgICBpbnQgcjsKQEAgLTI0Nyw2
ICsyNDMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgICAgYXNzZXJ0KG1v
ZGUpOwogCiAgICAgaWYgKCFzdHJjbXAobW9kZSwiLS1zYXZlLWRvbWFpbiIpKSB7CisgICAgICAg
IHN0YXRpYyBzdHJ1Y3Qgc2F2ZV9jYWxsYmFja3MgY2I7CiAKICAgICAgICAgaW9fZmQgPSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYXRvaShORVhUQVJHKTsKICAgICAgICAgcmVjdl9mZCA9
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYXRvaShORVhUQVJHKTsKQEAgLTI1NiwxNiArMjUz
LDE2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICAgICAgeGNfc3RyZWFt
X3R5cGVfdCBzdHJlYW1fdHlwZSA9ICAgICAgc3RydG91bChORVhUQVJHLDAsMTApOwogICAgICAg
ICBhc3NlcnQoISorK2FyZ3YpOwogCi0gICAgICAgIGhlbHBlcl9zZXRjYWxsYmFja3Nfc2F2ZSgm
aGVscGVyX3NhdmVfY2FsbGJhY2tzLCBjYmZsYWdzKTsKKyAgICAgICAgaGVscGVyX3NldGNhbGxi
YWNrc19zYXZlKCZjYiwgY2JmbGFncyk7CiAKICAgICAgICAgc3RhcnR1cCgic2F2ZSIpOwogICAg
ICAgICBzZXR1cF9zaWduYWxzKHNhdmVfc2lnbmFsX2hhbmRsZXIpOwogCi0gICAgICAgIHIgPSB4
Y19kb21haW5fc2F2ZSh4Y2gsIGlvX2ZkLCBkb20sIGZsYWdzLCAmaGVscGVyX3NhdmVfY2FsbGJh
Y2tzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyZWFtX3R5cGUsIHJlY3ZfZmQpOwor
ICAgICAgICByID0geGNfZG9tYWluX3NhdmUoeGNoLCBpb19mZCwgZG9tLCBmbGFncywgJmNiLCBz
dHJlYW1fdHlwZSwgcmVjdl9mZCk7CiAgICAgICAgIGNvbXBsZXRlKHIpOwogCiAgICAgfSBlbHNl
IGlmICghc3RyY21wKG1vZGUsIi0tcmVzdG9yZS1kb21haW4iKSkgeworICAgICAgICBzdGF0aWMg
c3RydWN0IHJlc3RvcmVfY2FsbGJhY2tzIGNiOwogCiAgICAgICAgIGlvX2ZkID0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGF0b2koTkVYVEFSRyk7CiAgICAgICAgIHNlbmRfYmFja19mZCA9
ICAgICAgICAgICAgICAgICAgICAgIGF0b2koTkVYVEFSRyk7CkBAIC0yNzgsNyArMjc1LDcgQEAg
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICB4Y19zdHJlYW1fdHlwZV90
IHN0cmVhbV90eXBlID0gICAgICBzdHJ0b3VsKE5FWFRBUkcsMCwxMCk7CiAgICAgICAgIGFzc2Vy
dCghKisrYXJndik7CiAKLSAgICAgICAgaGVscGVyX3NldGNhbGxiYWNrc19yZXN0b3JlKCZoZWxw
ZXJfcmVzdG9yZV9jYWxsYmFja3MsIGNiZmxhZ3MpOworICAgICAgICBoZWxwZXJfc2V0Y2FsbGJh
Y2tzX3Jlc3RvcmUoJmNiLCBjYmZsYWdzKTsKIAogICAgICAgICB1bnNpZ25lZCBsb25nIHN0b3Jl
X21mbiA9IDA7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgY29uc29sZV9tZm4gPSAwOwpAQCAtMjg4
LDggKzI4NSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAogICAgICAgICBy
ID0geGNfZG9tYWluX3Jlc3RvcmUoeGNoLCBpb19mZCwgZG9tLCBzdG9yZV9ldnRjaG4sICZzdG9y
ZV9tZm4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdG9yZV9kb21pZCwgY29uc29s
ZV9ldnRjaG4sICZjb25zb2xlX21mbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnNvbGVfZG9taWQsIHN0cmVhbV90eXBlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JmhlbHBlcl9yZXN0b3JlX2NhbGxiYWNrcywgc2VuZF9iYWNrX2ZkKTsKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnNvbGVfZG9taWQsIHN0cmVhbV90eXBlLCAmY2IsIHNlbmRfYmFj
a19mZCk7CiAgICAgICAgIGhlbHBlcl9zdHViX3Jlc3RvcmVfcmVzdWx0cyhzdG9yZV9tZm4sY29u
c29sZV9tZm4sMCk7CiAgICAgICAgIGNvbXBsZXRlKHIpOwogCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsIGIvdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9tc2dz
X2dlbi5wbAppbmRleCA2ZjFkNzlmODIxLi44MzFhMTVlMGJiIDEwMDc1NQotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3NhdmVf
bXNnc19nZW4ucGwKQEAgLTMzMyw3ICszMzMsNyBAQCBFTkRfQUxXQVlTCiAgICAgICAgIG15ICRj
X3YgPSAiKDF1PDwkbXNnbnVtKSI7CiAgICAgICAgIG15ICRjX2NiID0gImNicy0+JG5hbWUiOwog
ICAgICAgICAkZl9tb3JlX3NyLT4oIiAgICBpZiAoJGNfY2IpIGNiZmxhZ3MgfD0gJGNfdjtcbiIs
ICRlbnVtY2FsbGJhY2tzKTsKLSAgICAgICAgJGZfbW9yZV9zci0+KCIgICAgJGNfY2IgPSAoY2Jm
bGFncyAmICRjX3YpID8gJHtlbmNvZGV9XyR7bmFtZX0gOiAwO1xuIiwKKyAgICAgICAgJGZfbW9y
ZV9zci0+KCIgICAgaWYgKGNiZmxhZ3MgJiAkY192KSAkY19jYiA9ICR7ZW5jb2RlfV8ke25hbWV9
O1xuIiwKICAgICAgICAgICAgICAgICAgICAgICRzZXRjYWxsYmFja3MpOwogICAgIH0KICAgICAk
Zl9tb3JlX3NyLT4oIiAgICAgICAgcmV0dXJuIDE7XG4gICAgfVxuXG4iKTsKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
