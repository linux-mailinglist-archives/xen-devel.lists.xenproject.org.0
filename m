Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA75177D4E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:23:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BEH-0007Sd-Mq; Tue, 03 Mar 2020 17:21:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9BEG-0007Rb-4W
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:21:12 +0000
X-Inumbo-ID: 5f2e7f86-5d73-11ea-8adc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f2e7f86-5d73-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583256068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MalM86RjrPQUnwY4sBJxSGGZjzP4bL/dwcUV6mQZ1gY=;
 b=BspMrN4XvtwXk9tID8WnbMzy9RtxXfSx/ed6WkSDMW0yYR7w2wsSApK6
 q5e93CC7WUfwQ/j894snWkGsvSyTPLre/+lySgdbYl8nwQHy6atXaMcTs
 wz/Tm7j1Fkqi6m6R8YfPf40ow55HeZ0TqSAuJ8pilNclbg1hk5h9OfOWA A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z7qnXbnv0xLNPw1KJ0v+aObLC/betIvE/+FJpJbG3U2tWRFVfKtMod86yvSBPsJzfWxmPFrDB+
 2pzYa5ciNCyY3VyY09oX2NeMS9PcKnwWV02UuqT3ShTLIZsocA0EQU1bY2RBfDxGBnfzkiaxZn
 KndUTXZ/Tu4iCeMsRoLvi+ATJ9lqbGGbNIQr5eMShGlMZH4aUXlOESMxOdu9ZwIlsIj+cXocfS
 M7v+3GZyT0tK6Cu/jCXpGw6ll5l+k9cU+eMv1MvzD0mJSSr5ZZctUMmWOxi8Sd0slV45OLseLP
 QEk=
X-SBRS: 2.7
X-MesageID: 13775852
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13775852"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 18:20:43 +0100
Message-ID: <20200303172046.50569-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200303172046.50569-1-roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 3/6] x86/hap: improve hypervisor assisted
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
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
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2NToKIC0gUmVtb3ZlIGN1c3RvbSBzeW5jaHJvbml6
YXRpb24gYXMgb25fc2VsZWN0ZWRfY3B1cyBhbHJlYWR5IHRha2UgY2FyZQogICBvZiBpdC4KIC0g
cy9oYW5kbGVfZmx1c2gvZHVtbXlfZmx1c2gvLgogLSBVcGRhdGUgY29tbWVudCBvbiBkdW1teV9m
bHVzaCBoZWxwZXIuCgpDaGFuZ2VzIHNpbmNlIHYzOgogLSBzL2RvX2ZsdXNoL2hhbmRsZV9mbHVz
aC8uCiAtIEFkZCBjb21tZW50IGFib3V0IGhhbmRsZV9mbHVzaCB1c2FnZS4KIC0gRml4IFZQSUQg
dHlwbyBpbiBjb21tZW50LgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgfCA0NiArKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0vaGFwL2hhcC5jIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwppbmRleCA1NjE2MjM1YmQ4
Li44ZGJiY2MzNjc2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKQEAgLTY2OSwzMiArNjY5LDI0IEBAIHN0YXRpYyB2
b2lkIGhhcF91cGRhdGVfY3IzKHN0cnVjdCB2Y3B1ICp2LCBpbnQgZG9fbG9ja2luZywgYm9vbCBu
b2ZsdXNoKQogICAgIGh2bV91cGRhdGVfZ3Vlc3RfY3IzKHYsIG5vZmx1c2gpOwogfQogCisvKgor
ICogRHVtbXkgZnVuY3Rpb24gdG8gdXNlIHdpdGggb25fc2VsZWN0ZWRfY3B1cyBpbiBvcmRlciB0
byB0cmlnZ2VyIGEgdm1leGl0IG9uCisgKiBzZWxlY3RlZCBwQ1BVcy4gV2hlbiB0aGUgVk0gcmVz
dW1lcyBleGVjdXRpb24gaXQgd2lsbCBnZXQgYSBuZXcgQVNJRC9WUElECisgKiBhbmQgdGh1cyBh
IGNsZWFuIFRMQi4KKyAqLworc3RhdGljIHZvaWQgZHVtbXlfZmx1c2godm9pZCAqZGF0YSkKK3sK
K30KKwogc3RhdGljIGJvb2wgZmx1c2hfdGxiKGJvb2wgKCpmbHVzaF92Y3B1KSh2b2lkICpjdHh0
LCBzdHJ1Y3QgdmNwdSAqdiksCiAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqY3R4dCkKIHsK
ICAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBmbHVzaF9jcHVtYXNrKTsKICAg
ICBjcHVtYXNrX3QgKm1hc2sgPSAmdGhpc19jcHUoZmx1c2hfY3B1bWFzayk7CiAgICAgc3RydWN0
IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsKKyAgICB1bnNpZ25lZCBpbnQgdGhpc19jcHUg
PSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAgICAgc3RydWN0IHZjcHUgKnY7CiAKLSAgICAvKiBBdm9p
ZCBkZWFkbG9jayBpZiBtb3JlIHRoYW4gb25lIHZjcHUgdHJpZXMgdGhpcyBhdCB0aGUgc2FtZSB0
aW1lLiAqLwotICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJjYWxsX2RlYWRsb2NrX211
dGV4KSApCi0gICAgICAgIHJldHVybiBmYWxzZTsKLQotICAgIC8qIFBhdXNlIGFsbCBvdGhlciB2
Y3B1cy4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAgICAgIGlmICggdiAhPSBj
dXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQotICAgICAgICAgICAgdmNwdV9wYXVzZV9u
b3N5bmModik7Ci0KLSAgICAvKiBOb3cgdGhhdCBhbGwgVkNQVXMgYXJlIHNpZ25hbGxlZCB0byBk
ZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCi0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQotICAg
ICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKLSAgICAgICAg
ICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUodikgJiYgdi0+aXNfcnVubmluZyApCi0gICAgICAg
ICAgICAgICAgY3B1X3JlbGF4KCk7Ci0KLSAgICAvKiBBbGwgb3RoZXIgdmNwdXMgYXJlIHBhdXNl
ZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLwotICAgIHNwaW5fdW5sb2NrKCZkLT5oeXBlcmNhbGxf
ZGVhZGxvY2tfbXV0ZXgpOwotCiAgICAgY3B1bWFza19jbGVhcihtYXNrKTsKIAogICAgIC8qIEZs
dXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUgKGUuZy4sIHZhLT5nZm4gY2FjaGU7IFBBRSBQRFBF
IGNhY2hlKS4gKi8KQEAgLTcwNSwyMCArNjk3LDIwIEBAIHN0YXRpYyBib29sIGZsdXNoX3RsYihi
b29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAogICAgICAgICBp
ZiAoICFmbHVzaF92Y3B1KGN0eHQsIHYpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogCi0gICAg
ICAgIHBhZ2luZ191cGRhdGVfY3IzKHYsIGZhbHNlKTsKKyAgICAgICAgaHZtX2FzaWRfZmx1c2hf
dmNwdSh2KTsKIAogICAgICAgICBjcHUgPSByZWFkX2F0b21pYygmdi0+ZGlydHlfY3B1KTsKLSAg
ICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2NwdShjcHUpICkKKyAgICAgICAgaWYgKCBjcHUgIT0g
dGhpc19jcHUgJiYgaXNfdmNwdV9kaXJ0eV9jcHUoY3B1KSApCiAgICAgICAgICAgICBfX2NwdW1h
c2tfc2V0X2NwdShjcHUsIG1hc2spOwogICAgIH0KIAotICAgIC8qIEZsdXNoIFRMQnMgb24gYWxs
IENQVXMgd2l0aCBkaXJ0eSB2Y3B1IHN0YXRlLiAqLwotICAgIGZsdXNoX3RsYl9tYXNrKG1hc2sp
OwotCi0gICAgLyogRG9uZS4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAgICAg
IGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQotICAgICAgICAgICAg
dmNwdV91bnBhdXNlKHYpOworICAgIC8qCisgICAgICogVHJpZ2dlciBhIHZtZXhpdCBvbiBhbGwg
cENQVXMgd2l0aCBkaXJ0eSB2Q1BVIHN0YXRlIGluIG9yZGVyIHRvIGZvcmNlIGFuCisgICAgICog
QVNJRC9WUElEIGNoYW5nZSBhbmQgaGVuY2UgYWNjb21wbGlzaCBhIGd1ZXN0IFRMQiBmbHVzaC4g
Tm90ZSB0aGF0IHZDUFVzCisgICAgICogbm90IGN1cnJlbnRseSBydW5uaW5nIHdpbGwgYWxyZWFk
eSBiZSBmbHVzaGVkIHdoZW4gc2NoZWR1bGVkIGJlY2F1c2Ugb2YKKyAgICAgKiB0aGUgQVNJRCB0
aWNrbGUgZG9uZSBpbiB0aGUgbG9vcCBhYm92ZS4KKyAgICAgKi8KKyAgICBvbl9zZWxlY3RlZF9j
cHVzKG1hc2ssIGR1bW15X2ZsdXNoLCBtYXNrLCAwKTsKIAogICAgIHJldHVybiB0cnVlOwogfQot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
