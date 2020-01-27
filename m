Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE114A985
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:14:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8rN-0007xd-6F; Mon, 27 Jan 2020 18:11:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw8rM-0007wq-0a
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:11:40 +0000
X-Inumbo-ID: 72812a2a-4130-11ea-8590-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72812a2a-4130-11ea-8590-12813bfff9fa;
 Mon, 27 Jan 2020 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580148693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkLC2Wic1LLly2lQ0NYeFp34sD8LcMJxN6HuaR2sHis=;
 b=F3LmrDSqQtgquxDe0r6stT5wBbwTcfKH5kZGcw7digce6UECJJRjiy0i
 eNP6CuBttqVwz6SMFKVCw/z/8HWqgdIrdKryMsAiIkducNOnHNV5WweqG
 uyECPaB0lG74BbjWqQ8+B6Ei0VszaVHhiPv+FmAWryTW11oi9o/BpfGKe I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wct6E3hRolCflhxLTpIzD7eZh/JTESwHevpiJV6QvSLqUd2Jz3nvTgNbLn77nDiJBUVNoOBxMR
 Vk/4O0BVl3vPf5q8kTvakBJ0ADsx2m9MkR1qYC+H6QT2xgDN8IsmDkHDqpwrSAoppqhcvGZT2F
 MED4VcFl3Fjp/ugw3TjQYmPRmW9b1SxmZcQod2/lJXe9Aj7lVittkcMaujhIo4sxPNPxQJRwpg
 Z7ROa86X92LfrHlMWJQqBzSOGsKmImByVaGmRvHKGU8sjFjja6wtXnjYP9X0U92z6qTgyon53Z
 4A8=
X-SBRS: 2.7
X-MesageID: 11681870
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11681870"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 19:11:12 +0100
Message-ID: <20200127181115.82709-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200127181115.82709-1-roger.pau@citrix.com>
References: <20200127181115.82709-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIGh5cGVydmlzb3IgYXNzaXN0ZWQgZmx1
c2ggZm9yIEhBUCBpcwpleHRyZW1lbHkgaW5lZmZpY2llbnQuCgpGaXJzdCBvZiBhbGwgdGhlcmUn
cyBubyBuZWVkIHRvIGNhbGwgcGFnaW5nX3VwZGF0ZV9jcjMsIGFzIHRoZSBvbmx5CnJlbGV2YW50
IHBhcnQgb2YgdGhhdCBmdW5jdGlvbiB3aGVuIGRvaW5nIGEgZmx1c2ggaXMgdGhlIEFTSUQgdkNQ
VQpmbHVzaCwgc28ganVzdCBjYWxsIHRoYXQgZnVuY3Rpb24gZGlyZWN0bHkuCgpTaW5jZSBodm1f
YXNpZF9mbHVzaF92Y3B1IGlzIHByb3RlY3RlZCBhZ2FpbnN0IGNvbmN1cnJlbnQgY2FsbGVycyBi
eQp1c2luZyBhdG9taWMgb3BlcmF0aW9ucyB0aGVyZSdzIG5vIG5lZWQgYW55bW9yZSB0byBwYXVz
ZSB0aGUgYWZmZWN0ZWQKdkNQVXMuCgpGaW5hbGx5IHRoZSBnbG9iYWwgVExCIGZsdXNoIHBlcmZv
cm1lZCBieSBmbHVzaF90bGJfbWFzayBpcyBhbHNvIG5vdApuZWNlc3NhcnksIHNpbmNlIHdlIG9u
bHkgd2FudCB0byBmbHVzaCB0aGUgZ3Vlc3QgVExCIHN0YXRlIGl0J3MgZW5vdWdoCnRvIHRyaWdn
ZXIgYSB2bWV4aXQgb24gdGhlIHBDUFVzIGN1cnJlbnRseSBob2xkaW5nIGFueSB2Q1BVIHN0YXRl
LCBhcwpzdWNoIHZtZXhpdCB3aWxsIGFscmVhZHkgcGVyZm9ybSBhbiBBU0lEL1ZQSUQgdXBkYXRl
LCBhbmQgdGh1cyBjbGVhcgp0aGUgZ3Vlc3QgVExCLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL2hhcC9o
YXAuYyB8IDQ4ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCmlu
ZGV4IDY4OTRjMWFhMzguLjQwMWVhZjgwMjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9o
YXAvaGFwLmMKKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwpAQCAtNjY5LDMyICs2Njks
MjQgQEAgc3RhdGljIHZvaWQgaGFwX3VwZGF0ZV9jcjMoc3RydWN0IHZjcHUgKnYsIGludCBkb19s
b2NraW5nLCBib29sIG5vZmx1c2gpCiAgICAgaHZtX3VwZGF0ZV9ndWVzdF9jcjModiwgbm9mbHVz
aCk7CiB9CiAKK3N0YXRpYyB2b2lkIGRvX2ZsdXNoKHZvaWQgKmRhdGEpCit7CisgICAgY3B1bWFz
a190ICptYXNrID0gZGF0YTsKKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9p
ZCgpOworCisgICAgQVNTRVJUKGNwdW1hc2tfdGVzdF9jcHUoY3B1LCBtYXNrKSk7CisgICAgY3B1
bWFza19jbGVhcl9jcHUoY3B1LCBtYXNrKTsKK30KKwogYm9vbCBoYXBfZmx1c2hfdGxiKGJvb2wg
KCpmbHVzaF92Y3B1KSh2b2lkICpjdHh0LCBzdHJ1Y3QgdmNwdSAqdiksCiAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqY3R4dCkKIHsKICAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza190
LCBmbHVzaF9jcHVtYXNrKTsKICAgICBjcHVtYXNrX3QgKm1hc2sgPSAmdGhpc19jcHUoZmx1c2hf
Y3B1bWFzayk7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsKKyAgICB1
bnNpZ25lZCBpbnQgdGhpc19jcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAgICAgc3RydWN0IHZj
cHUgKnY7CiAKLSAgICAvKiBBdm9pZCBkZWFkbG9jayBpZiBtb3JlIHRoYW4gb25lIHZjcHUgdHJp
ZXMgdGhpcyBhdCB0aGUgc2FtZSB0aW1lLiAqLwotICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+
aHlwZXJjYWxsX2RlYWRsb2NrX211dGV4KSApCi0gICAgICAgIHJldHVybiBmYWxzZTsKLQotICAg
IC8qIFBhdXNlIGFsbCBvdGhlciB2Y3B1cy4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiAp
Ci0gICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQotICAg
ICAgICAgICAgdmNwdV9wYXVzZV9ub3N5bmModik7Ci0KLSAgICAvKiBOb3cgdGhhdCBhbGwgVkNQ
VXMgYXJlIHNpZ25hbGxlZCB0byBkZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCi0gICAgZm9yX2Vh
Y2hfdmNwdSAoIGQsIHYgKQotICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1
KGN0eHQsIHYpICkKLSAgICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUodikgJiYgdi0+
aXNfcnVubmluZyApCi0gICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Ci0KLSAgICAvKiBBbGwg
b3RoZXIgdmNwdXMgYXJlIHBhdXNlZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLwotICAgIHNwaW5f
dW5sb2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpOwotCiAgICAgY3B1bWFza19jbGVh
cihtYXNrKTsKIAogICAgIC8qIEZsdXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUgKGUuZy4sIHZh
LT5nZm4gY2FjaGU7IFBBRSBQRFBFIGNhY2hlKS4gKi8KQEAgLTcwNSwyMCArNjk3LDIyIEBAIGJv
b2wgaGFwX2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZj
cHUgKnYpLAogICAgICAgICBpZiAoICFmbHVzaF92Y3B1KGN0eHQsIHYpICkKICAgICAgICAgICAg
IGNvbnRpbnVlOwogCi0gICAgICAgIHBhZ2luZ191cGRhdGVfY3IzKHYsIGZhbHNlKTsKKyAgICAg
ICAgaHZtX2FzaWRfZmx1c2hfdmNwdSh2KTsKIAogICAgICAgICBjcHUgPSByZWFkX2F0b21pYygm
di0+ZGlydHlfY3B1KTsKLSAgICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2NwdShjcHUpICkKKyAg
ICAgICAgaWYgKCBjcHUgIT0gdGhpc19jcHUgJiYgaXNfdmNwdV9kaXJ0eV9jcHUoY3B1KSApCiAg
ICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsIG1hc2spOwogICAgIH0KIAotICAgIC8q
IEZsdXNoIFRMQnMgb24gYWxsIENQVXMgd2l0aCBkaXJ0eSB2Y3B1IHN0YXRlLiAqLwotICAgIGZs
dXNoX3RsYl9tYXNrKG1hc2spOwotCi0gICAgLyogRG9uZS4gKi8KLSAgICBmb3JfZWFjaF92Y3B1
ICggZCwgdiApCi0gICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwg
dikgKQotICAgICAgICAgICAgdmNwdV91bnBhdXNlKHYpOworICAgIC8qCisgICAgICogVHJpZ2dl
ciBhIHZtZXhpdCBvbiBhbGwgcENQVXMgd2l0aCBkaXJ0eSB2Q1BVIHN0YXRlIGluIG9yZGVyIHRv
IGZvcmNlIGFuCisgICAgICogQVNJRC9WUElUIGNoYW5nZSBhbmQgaGVuY2UgYWNjb21wbGlzaCBh
IGd1ZXN0IFRMQiBmbHVzaC4gTm90ZSB0aGF0IHZDUFVzCisgICAgICogbm90IGN1cnJlbnRseSBy
dW5uaW5nIHdpbGwgYWxyZWFkeSBiZSBmbHVzaGVkIHdoZW4gc2NoZWR1bGVkIGJlY2F1c2Ugb2YK
KyAgICAgKiB0aGUgQVNJRCB0aWNrbGUgZG9uZSBpbiB0aGUgbG9vcCBhYm92ZS4KKyAgICAgKi8K
KyAgICBvbl9zZWxlY3RlZF9jcHVzKG1hc2ssIGRvX2ZsdXNoLCBtYXNrLCAwKTsKKyAgICB3aGls
ZSAoICFjcHVtYXNrX2VtcHR5KG1hc2spICkKKyAgICAgICAgY3B1X3JlbGF4KCk7CiAKICAgICBy
ZXR1cm4gdHJ1ZTsKIH0KLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
