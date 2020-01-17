Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9591408AD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:11:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPUV-0006y6-Uo; Fri, 17 Jan 2020 11:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isPUT-0006xx-Lm
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:08:37 +0000
X-Inumbo-ID: b0677c32-3919-11ea-9fd7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0677c32-3919-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579259308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zRgZwAlgCLlHqcyugkjDfGixPQFRcLT1wcxk5jV01xo=;
 b=BfIPosqfnNUIc4jJ8krH9xTFZtv87PD1z4o6+ikJpBXuq6chYVU8bfUM
 DZ//8VfxXvflSwfNtP2GkmgPAGhit6r1HU4EDfv6MpAcUxlLGyVRHpOUL
 56OxKH2p7hmIH1cODkD6hdZgJnJSbClVPeTTJYPNeOcny1xO7Os2PbkJ5 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v+nR0J7QqBkRZeR2M1oQUrGmng8YXVl+mz9kL2l6qFzqO0lr9S5va4C9i6MV7mnBy4OpBaWUI1
 SFKhGE6JSmbZ0g7UOfv86hg575u18W1GF8nYfc3lWYK9L3ju0/v3JsD9LpCydnuQ7H38rpDyvx
 Bgy2Av11IPPIjMybykPUp19yB2ugKQf/wLxqTQnEw1p4S1ogHl1xXF5Ouq6rPEXQ9TgE4nQrUk
 oyHk6wfs01F+dr9M+glNgPE3lU9stQSxOemX5pY0uYiUshlLJU3ULY1smdiz8InjiXZtjgOfV1
 2S0=
X-SBRS: 2.7
X-MesageID: 11432894
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432894"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 12:08:11 +0100
Message-ID: <20200117110811.43321-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size to 4K
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBwbGFjaW5nIG1lbW9yeSBCQVJzIHdpdGggc2l6ZXMgc21hbGxlciB0aGFuIDRLIG11bHRp
cGxlIG1lbW9yeQpCQVJzIGNhbiBlbmQgdXAgbWFwcGVkIHRvIHRoZSBzYW1lIGd1ZXN0IHBoeXNp
Y2FsIGFkZHJlc3MsIGFuZCB0aHVzCndvbid0IHdvcmsgY29ycmVjdGx5LgoKUm91bmQgdXAgYWxs
IG1lbW9yeSBCQVIgc2l6ZXMgdG8gYmUgYXQgbGVhc3QgNEssIHNvIHRoYXQgdGhleSBhcmUKbmF0
dXJhbGx5IGFsaWduZWQgdG8gYSBwYWdlIHNpemUgYW5kIHRodXMgZG9uJ3QgZW5kIHVwIHNoYXJp
bmcgYSBwYWdlLgpBbHNvIGFkZCBhIGNvdXBsZSBvZiBhc3NlcnRzIHRvIHRoZSBjdXJyZW50IGNv
ZGUgdG8gbWFrZSBzdXJlIHRoZSBNTUlPCmhvbGUgaXMgcHJvcGVybHkgc2l6ZWQgYW5kIGFsaWdu
ZWQuCgpOb3RlIHRoYXQgdGhlIGd1ZXN0IGNhbiBzdGlsbCBtb3ZlIHRoZSBCQVJzIGFyb3VuZCBh
bmQgY3JlYXRlIHRoaXMKY29sbGlzaW9ucywgYW5kIHRoYXQgQkFScyBub3QgZmlsbGluZyB1cCBh
IHBoeXNpY2FsIHBhZ2UgbWlnaHQgbGVhawphY2Nlc3MgdG8gb3RoZXIgTU1JTyByZWdpb25zIHBs
YWNlZCBpbiB0aGUgc2FtZSBob3N0IHBoeXNpY2FsIHBhZ2UuCgpUaGlzIGlzIGhvd2V2ZXIgbm8g
d29yc2UgdGhhbiB3aGF0J3MgY3VycmVudGx5IGRvbmUsIGFuZCBoZW5jZSBzaG91bGQKYmUgY29u
c2lkZXJlZCBhbiBpbXByb3ZlbWVudCBvdmVyIHRoZSBjdXJyZW50IHN0YXRlLgoKUmVwb3J0ZWQt
Ynk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFzb24gQW5kcnl1
ayA8amFuZHJ5dWtAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gRG8gdGhlIHJv
dW5kIHVwIHdoZW4gc2l6aW5nIHRoZSBCQVJzLCBzbyB0aGF0IHRoZSBNTUlPIGhvbGUgaXMKICAg
Y29ycmVjdGx5IHNpemVkLgogLSBBZGQgc29tZSBhc3NlcnRzIHRoYXQgdGhlIGhvbGUgaXMgcHJv
cGVybHkgc2l6ZWQgYW5kIHNpemUtYWxpZ25lZC4KIC0gRHJvcHBlZCBKYXNvbiBUZXN0ZWQtYnkg
c2luY2UgdGhlIGNvZGUgaGFzIGNoYW5nZWQuCi0tLQpKYXNvbiwgY2FuIHlvdSBnaXZlIHRoaXMg
YSBzcGluPyBUaGFua3MuCi0tLQogdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jICB8IDEy
ICsrKysrKysrKysrKwogdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuaCB8ICAzICsrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL3BjaS5jIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jCmlu
ZGV4IDBiNzA4YmY1NzguLmFjNGZiNWFhODIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci9wY2kuYworKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvcGNpLmMKQEAgLTI1
Myw2ICsyNTMsMTUgQEAgdm9pZCBwY2lfc2V0dXAodm9pZCkKICAgICAgICAgICAgIGlmICggYmFy
X3N6ID09IDAgKQogICAgICAgICAgICAgICAgIGNvbnRpbnVlOwogCisgICAgICAgICAgICBpZiAo
ICgoYmFyX2RhdGEgJiBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFKSA9PQorICAgICAgICAgICAgICAg
ICAgUENJX0JBU0VfQUREUkVTU19TUEFDRV9NRU1PUlkpIHx8CisgICAgICAgICAgICAgICAgIChi
YXJfcmVnID09IFBDSV9ST01fQUREUkVTUykgKQorICAgICAgICAgICAgICAgIC8qCisgICAgICAg
ICAgICAgICAgICogQWx3YXlzIHJvdW5kdXAgbWVtb3J5IEJBUiBzaXplcyB0byB0aGUgc2l6ZSBv
ZiBhIHBhZ2UgaW4KKyAgICAgICAgICAgICAgICAgKiBvcmRlciB0byBwcmV2ZW50IEJBUnMgYmVp
bmcgcGxhY2VkIGluIHRoZSBzYW1lIHBhZ2UuCisgICAgICAgICAgICAgICAgICovCisgICAgICAg
ICAgICAgICAgYmFyX3N6ID0gUk9VTkRVUChiYXJfc3osIFBBR0VfU0laRSk7CisKICAgICAgICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfYmFyczsgaSsrICkKICAgICAgICAgICAgICAgICBpZiAo
IGJhcnNbaV0uYmFyX3N6IDwgYmFyX3N6ICkKICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CkBA
IC0yOTUsNiArMzA0LDggQEAgdm9pZCBwY2lfc2V0dXAodm9pZCkKICAgICAgICAgcGNpX3dyaXRl
dyhkZXZmbiwgUENJX0NPTU1BTkQsIGNtZCk7CiAgICAgfQogCisgICAgQVNTRVJUKElTX0FMSUdO
RUQobW1pb190b3RhbCwgUEFHRV9TSVpFKSk7CisKICAgICBpZiAoIG1taW9faG9sZV9zaXplICkK
ICAgICB7CiAgICAgICAgIHVpbnQ2NF90IG1heF9yYW1fYmVsb3dfNGcgPSBHQig0KSAtIG1taW9f
aG9sZV9zaXplOwpAQCAtNDQ4LDYgKzQ1OSw3IEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpCiAgICAg
ICAgICAgICAgICAgcmVzb3VyY2UgPSAmbWVtX3Jlc291cmNlOwogICAgICAgICAgICAgICAgIGJh
cl9kYXRhICY9IH5QQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOwogICAgICAgICAgICAgfQorICAg
ICAgICAgICAgQVNTRVJUKGJhcl9zeiA8PSBtbWlvX3RvdGFsKTsKICAgICAgICAgICAgIG1taW9f
dG90YWwgLT0gYmFyX3N6OwogICAgICAgICB9CiAgICAgICAgIGVsc2UKZGlmZiAtLWdpdCBhL3Rv
b2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmggYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIv
dXRpbC5oCmluZGV4IDdiY2E2NDE4ZDIuLmUxZWJmZDY2NDcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zp
cm13YXJlL2h2bWxvYWRlci91dGlsLmgKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0
aWwuaApAQCAtNTEsNiArNTEsOSBAQCB2b2lkIF9fYnVnKGNoYXIgKmZpbGUsIGludCBsaW5lKSBf
X2F0dHJpYnV0ZV9fKChub3JldHVybikpOwogI2RlZmluZSBNQihtYikgKG1iIyNVTEwgPDwgMjAp
CiAjZGVmaW5lIEdCKGdiKSAoZ2IjI1VMTCA8PCAzMCkKIAorI2RlZmluZSBST1VORFVQKHgsIGEp
ICgoKHgpICsgKGEpIC0gMSkgJiB+KChhKSAtIDEpKQorI2RlZmluZSBJU19BTElHTkVEKHZhbCwg
YWxpZ24pICgoKHZhbCkgJiAoKGFsaWduKSAtIDEpKSA9PSAwKQorCiBzdGF0aWMgaW5saW5lIGlu
dCB0ZXN0X2JpdCh1bnNpZ25lZCBpbnQgYiwgY29uc3Qgdm9pZCAqcCkKIHsKICAgICByZXR1cm4g
ISEoKChjb25zdCB1aW50OF90ICopcClbYj4+M10gJiAoMXU8PChiJjcpKSk7Ci0tIAoyLjI1LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
