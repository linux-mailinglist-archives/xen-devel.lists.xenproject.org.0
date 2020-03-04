Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480E178E56
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:28:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RDm-0005vf-D6; Wed, 04 Mar 2020 10:25:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9RDl-0005vX-HH
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:25:45 +0000
X-Inumbo-ID: 81476aa8-5e02-11ea-a37e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81476aa8-5e02-11ea-a37e-12813bfff9fa;
 Wed, 04 Mar 2020 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583317544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wVKtIWkWLCbtRg2wHYMZ2QJn1z7XVRpTANX0I+HLkbs=;
 b=iKy8w7VJ6ORtf1PDK+EA2n3DHRAuYjXBVu7prCyKzRsXmvDgvbar0H4/
 RyW4xbRoguX53rfRgKvzgzfQG0ZLPxKWWnwUx9X4rjdn6aFJnCmIeRjSQ
 2r6mpTE5JFJCo8ccXvoI7ewRbrZAukUjyMj80Gy48rlC79WHfxROl5VJS 8=;
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
IronPort-SDR: sowDHIAz8HWRbgdmAvb/4ml+uCpKbtmyinY1p1IX1WXqfytbuIkIXmerQKYOqmjyBQs742ofkU
 OvydMlms1EQ8CBFD5s5fNRbVzWjMjNJV1rqa7Jo5fRYz+OmJSzAQuk22+UhpPaPPHEvbUqmfPW
 RYKd6i6lePLOF9tz9ivOb1tr2djHbI5LFYuHqgssGMaVpsSRG7fmISwYWnLjFZCjhbJLA+7qMG
 ZHQWSsmqRMhnVObR4v3npUUe5GxK6ttZxkmBd69q9pScOEShu1CBqX7Sj/fj7pJtBRyo0hssBx
 8ZE=
X-SBRS: 2.7
X-MesageID: 13366243
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,513,1574139600"; d="scan'208";a="13366243"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Mar 2020 11:25:23 +0100
Message-ID: <20200304102523.52454-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86/dom0: improve PVH initrd and metadata
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
CkNoYW5nZXMgc2luY2UgdjI6CiAtIFNpbXBsaWZ5IGNoZWNrcyBzaW5jZSB0aGUga2VybmVsIHVz
ZWQgbWVtb3J5IG11c3QgYWx3YXlzIGJlIGEKICAgc3Vic2V0IG9mIGEgUkFNIHJlZ2lvbi4KIC0g
Rml4IGNvbW1lbnQgZ3JhbW1hci4KIC0gQWxpZ24gdGhlIGxvYWRlZCBrZXJuZWwgYXJlYSB0byBw
YWdlIGJvdW5kYXJpZXMuCiAtIEZvciBzYWZldHkgYXNzZXJ0IHRoYXQgYWxsIFJBTSByZWdpb25z
IGluIHRoZSBtZW1vcnkgbWFwIGFyZQogICBwYWdlIGFsaWduZWQuCgpDaGFuZ2VzIHNpbmNlIHYx
OgogLSBDYWxjdWxhdGUgZW5kIG9mIGU4MjAgZW50cnkgZWFybGllci4KIC0gT25seSBjaGVjayBp
ZiB0aGUgZW5kIG9mIHRoZSByZWdpb24gaXMgPCAxTUIuCiAtIENoZWNrIGZvciByYW5nZSBvdmVy
bGFwcyB3aXRoIHRoZSBrZXJuZWwgcmVnaW9uLgogLSBDaGVjayB0aGUgcmVnaW9uIGlzIG9mIHR5
cGUgUkFNLgogLSBGaXggb2ZmLWJ5LW9uZSBjaGVja3MgaW4gcmFuZ2Ugb3ZlcmxhcHMuCiAtIEFk
ZCBhIGNvbW1lbnQgYWJvdXQgd2h5IGluaXRyZCBhbmQgbWV0YWRhdGEgaXMgcGxhY2VkIHRvZ2V0
aGVyLgogLSBBZGQgcGFyZW50aGVzZXMgYXJvdW5kIHNpemUgY2FsY3VsYXRpb25zLgotLS0KIHhl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgYi94ZW4vYXJj
aC94ODYvaHZtL2RvbTBfYnVpbGQuYwppbmRleCBlZGVkODdlYWY1Li5jYzcxOWEwMjA4IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYv
aHZtL2RvbTBfYnVpbGQuYwpAQCAtNDkwLDYgKzQ5MCw0NSBAQCBzdGF0aWMgaW50IF9faW5pdCBw
dmhfcG9wdWxhdGVfcDJtKHN0cnVjdCBkb21haW4gKmQpCiAjdW5kZWYgTUIxX1BBR0VTCiB9CiAK
K3N0YXRpYyBwYWRkcl90IGZpbmRfbWVtb3J5KGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGNvbnN0
IHN0cnVjdCBlbGZfYmluYXJ5ICplbGYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
X3Qgc2l6ZSkKK3sKKyAgICBwYWRkcl90IGtlcm5lbF9zdGFydCA9IChwYWRkcl90KWVsZi0+ZGVz
dF9iYXNlICYgUEFHRV9NQVNLOworICAgIHBhZGRyX3Qga2VybmVsX2VuZCA9IFJPVU5EVVAoKHBh
ZGRyX3QpZWxmLT5kZXN0X2Jhc2UgKyBlbGYtPmRlc3Rfc2l6ZSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBBR0VfU0laRSk7CisgICAgdW5zaWduZWQgaW50IGk7CisKKyAgICAv
KgorICAgICAqIFRoZSBtZW1vcnkgbWFwIGlzIHNvcnRlZCBhbmQgYWxsIFJBTSByZWdpb25zIHN0
YXJ0cyBhbmQgc2l6ZXMgYXJlCisgICAgICogYWxpZ25lZCB0byBwYWdlIGJvdW5kYXJpZXMuCisg
ICAgICovCisgICAgZm9yICggaSA9IDA7IGkgPCBkLT5hcmNoLm5yX2U4MjA7IGkrKyApCisgICAg
eworICAgICAgICBwYWRkcl90IHN0YXJ0LCBlbmQgPSBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQt
PmFyY2guZTgyMFtpXS5zaXplOworCisgICAgICAgIC8qIERvbid0IHVzZSBtZW1vcnkgYmVsb3cg
MU1CLCBhcyBpdCBjb3VsZCBvdmVyd3JpdGUgdGhlIEJEQS9FQkRBLiAqLworICAgICAgICBpZiAo
IGVuZCA8PSBNQigxKSB8fCBkLT5hcmNoLmU4MjBbaV0udHlwZSAhPSBFODIwX1JBTSApCisgICAg
ICAgICAgICBjb250aW51ZTsKKworICAgICAgICBzdGFydCA9IE1BWChST1VORFVQKGQtPmFyY2gu
ZTgyMFtpXS5hZGRyLCBQQUdFX1NJWkUpLCBNQigxKSk7CisKKyAgICAgICAgQVNTRVJUKElTX0FM
SUdORUQoc3RhcnQsIFBBR0VfU0laRSkgJiYgSVNfQUxJR05FRChlbmQsIFBBR0VfU0laRSkpOwor
CisgICAgICAgIGlmICggZW5kIDw9IGtlcm5lbF9zdGFydCB8fCBzdGFydCA+PSBrZXJuZWxfZW5k
ICkKKyAgICAgICAgICAgIDsgLyogTm8gb3ZlcmxhcCwgbm90aGluZyB0byBkby4gKi8KKyAgICAg
ICAgLyogRGVhbCB3aXRoIHRoZSBrZXJuZWwgYWxyZWFkeSBiZWluZyBsb2FkZWQgaW4gdGhlIHJl
Z2lvbi4gKi8KKyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCAtIHN0YXJ0ID4gZW5kIC0g
a2VybmVsX2VuZCApCisgICAgICAgICAgICBlbmQgPSBrZXJuZWxfc3RhcnQ7CisgICAgICAgIGVs
c2UKKyAgICAgICAgICAgIHN0YXJ0ID0ga2VybmVsX2VuZDsKKworICAgICAgICBpZiAoIGVuZCAt
IHN0YXJ0ID49IHNpemUgKQorICAgICAgICAgICAgcmV0dXJuIHN0YXJ0OworICAgIH0KKworICAg
IHJldHVybiBJTlZBTElEX1BBRERSOworfQorCiBzdGF0aWMgaW50IF9faW5pdCBwdmhfbG9hZF9r
ZXJuZWwoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9kdWxlX3QgKmltYWdlLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW1hZ2VfaGVhZHJvb20sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kdWxlX3QgKmluaXRyZCwgdm9pZCAq
aW1hZ2VfYmFzZSwKQEAgLTU0Niw3ICs1ODUsMjQgQEAgc3RhdGljIGludCBfX2luaXQgcHZoX2xv
YWRfa2VybmVsKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IG1vZHVsZV90ICppbWFnZSwKICAgICAg
ICAgcmV0dXJuIHJjOwogICAgIH0KIAotICAgIGxhc3RfYWRkciA9IFJPVU5EVVAocGFybXMudmly
dF9rZW5kIC0gcGFybXMudmlydF9iYXNlLCBQQUdFX1NJWkUpOworICAgIC8qCisgICAgICogRmlu
ZCBhIFJBTSByZWdpb24gYmlnIGVub3VnaCAoYW5kIHRoYXQgZG9lc24ndCBvdmVybGFwIHdpdGgg
dGhlIGxvYWRlZAorICAgICAqIGtlcm5lbCkgaW4gb3JkZXIgdG8gbG9hZCB0aGUgaW5pdHJkIGFu
ZCB0aGUgbWV0YWRhdGEuIE5vdGUgaXQgY291bGQgYmUKKyAgICAgKiBzcGxpdCBpbnRvIHNtYWxs
ZXIgYWxsb2NhdGlvbnMsIGRvbmUgYXMgYSBzaW5nbGUgcmVnaW9uIGluIG9yZGVyIHRvCisgICAg
ICogc2ltcGxpZnkgaXQuCisgICAgICovCisgICAgbGFzdF9hZGRyID0gZmluZF9tZW1vcnkoZCwg
JmVsZiwgc2l6ZW9mKHN0YXJ0X2luZm8pICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
aW5pdHJkID8gUk9VTkRVUChpbml0cmQtPm1vZF9lbmQsIFBBR0VfU0laRSkgKworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YobW9kKQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOiAwKSArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KGNtZGxpbmUgPyBST1VORFVQKHN0cmxlbihjbWRsaW5lKSArIDEsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsZl82NGJpdCgmZWxmKSA/IDggOiA0KQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogMCkpOworICAgIGlmICggbGFz
dF9hZGRyID09IElOVkFMSURfUEFERFIgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCJVbmFibGUg
dG8gZmluZCBhIG1lbW9yeSByZWdpb24gdG8gbG9hZCBpbml0cmQgYW5kIG1ldGFkYXRhXG4iKTsK
KyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgfQogCiAgICAgaWYgKCBpbml0cmQgIT0gTlVM
TCApCiAgICAgewotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
