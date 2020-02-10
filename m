Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F181915816E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 18:32:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Crp-0006Y0-Rz; Mon, 10 Feb 2020 17:29:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Cro-0006Xp-LW
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 17:29:04 +0000
X-Inumbo-ID: d18fa032-4c2a-11ea-b4ed-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d18fa032-4c2a-11ea-b4ed-12813bfff9fa;
 Mon, 10 Feb 2020 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581355739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c999TlIig+XlNCfRhttUN5F9FJD5wc7xGftU8hNQO9o=;
 b=Y0MumN6swIxV6T20dZlkzWrCb9TlWf2TCzHNkL8/9tXok2PPdYal+FuG
 R2WNFgvHQAJ5pPUbCsh1NXzleaWdGSqR80qKmr4zERZ7I5KnEOJLFd45b
 nyhXbLtMEQIuWjG4b7BxjuD+Zv1QelJm2w8Gx2Vtsyqc14qY6O2RdSyVT s=;
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
IronPort-SDR: kuMAwwb7tzaIy73hQ15P3oB5uX3k+6ub+VwLR3jC9WeMVrkha1xc8Hqs0DFW0Matflz5u3hUXd
 8/L2Geuj/L5LbQv9PVN6ND2ukCmFaNgB59SpyehoJjhEGi8ujUdaylJEJiDMXnSvEZCkD4q1Gz
 sDcbUhkqTzsUqYK21Q/yvOBwcxPv2Cj5FKbXRtVzzR2bwRIA7ejaxkdR2Pr1oVWIGl8FwGyobs
 KDM0HdWdF3iRLZptYT4t2S08BYNgMdEvt93TJloj7wO2JlncTkttMOUHIxntAuNsyw4/cy/2BS
 ZU8=
X-SBRS: 2.7
X-MesageID: 12394557
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12394557"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:28:25 +0100
Message-ID: <20200210172829.43604-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210172829.43604-1-roger.pau@citrix.com>
References: <20200210172829.43604-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/7] x86/hap: improve hypervisor assisted
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
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
ZW4ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MzoKIC0gcy9kb19mbHVzaC9oYW5kbGVfZmx1c2gv
LgogLSBBZGQgY29tbWVudCBhYm91dCBoYW5kbGVfZmx1c2ggdXNhZ2UuCiAtIEZpeCBWUElEIHR5
cG8gaW4gY29tbWVudC4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgNTIgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21t
L2hhcC9oYXAuYyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKaW5kZXggNjg5NGMxYWEzOC4u
ZGJiNjFiZjljNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYworKysgYi94
ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCkBAIC02NjksMzIgKzY2OSwyOCBAQCBzdGF0aWMgdm9p
ZCBoYXBfdXBkYXRlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgaW50IGRvX2xvY2tpbmcsIGJvb2wgbm9m
bHVzaCkKICAgICBodm1fdXBkYXRlX2d1ZXN0X2NyMyh2LCBub2ZsdXNoKTsKIH0KIAorLyoKKyAq
IE5COiBkb2Vzbid0IGFjdHVhbGx5IHBlcmZvcm0gYW55IGZsdXNoLCB1c2VkIGp1c3QgdG8gY2xl
YXIgdGhlIENQVSBmcm9tIHRoZQorICogbWFzayBhbmQgaGVuY2Ugc2lnbmFsIHRoYXQgdGhlIGd1
ZXN0IFRMQiBmbHVzaCBoYXMgYmVlbiBkb25lLgorICovCitzdGF0aWMgdm9pZCBoYW5kbGVfZmx1
c2godm9pZCAqZGF0YSkKK3sKKyAgICBjcHVtYXNrX3QgKm1hc2sgPSBkYXRhOworICAgIHVuc2ln
bmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CisKKyAgICBBU1NFUlQoY3B1bWFza190
ZXN0X2NwdShjcHUsIG1hc2spKTsKKyAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwor
fQorCiBib29sIGhhcF9mbHVzaF90bGIoYm9vbCAoKmZsdXNoX3ZjcHUpKHZvaWQgKmN0eHQsIHN0
cnVjdCB2Y3B1ICp2KSwKICAgICAgICAgICAgICAgICAgICB2b2lkICpjdHh0KQogewogICAgIHN0
YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3QsIGZsdXNoX2NwdW1hc2spOwogICAgIGNwdW1h
c2tfdCAqbWFzayA9ICZ0aGlzX2NwdShmbHVzaF9jcHVtYXNrKTsKICAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gY3VycmVudC0+ZG9tYWluOworICAgIHVuc2lnbmVkIGludCB0aGlzX2NwdSA9IHNtcF9w
cm9jZXNzb3JfaWQoKTsKICAgICBzdHJ1Y3QgdmNwdSAqdjsKIAotICAgIC8qIEF2b2lkIGRlYWRs
b2NrIGlmIG1vcmUgdGhhbiBvbmUgdmNwdSB0cmllcyB0aGlzIGF0IHRoZSBzYW1lIHRpbWUuICov
Ci0gICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpICkK
LSAgICAgICAgcmV0dXJuIGZhbHNlOwotCi0gICAgLyogUGF1c2UgYWxsIG90aGVyIHZjcHVzLiAq
LwotICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKLSAgICAgICAgaWYgKCB2ICE9IGN1cnJlbnQg
JiYgZmx1c2hfdmNwdShjdHh0LCB2KSApCi0gICAgICAgICAgICB2Y3B1X3BhdXNlX25vc3luYyh2
KTsKLQotICAgIC8qIE5vdyB0aGF0IGFsbCBWQ1BVcyBhcmUgc2lnbmFsbGVkIHRvIGRlc2NoZWR1
bGUsIHdlIHdhaXQuLi4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAgICAgIGlm
ICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQotICAgICAgICAgICAgd2hp
bGUgKCAhdmNwdV9ydW5uYWJsZSh2KSAmJiB2LT5pc19ydW5uaW5nICkKLSAgICAgICAgICAgICAg
ICBjcHVfcmVsYXgoKTsKLQotICAgIC8qIEFsbCBvdGhlciB2Y3B1cyBhcmUgcGF1c2VkLCBzYWZl
IHRvIHVubG9jayBub3cuICovCi0gICAgc3Bpbl91bmxvY2soJmQtPmh5cGVyY2FsbF9kZWFkbG9j
a19tdXRleCk7Ci0KICAgICBjcHVtYXNrX2NsZWFyKG1hc2spOwogCiAgICAgLyogRmx1c2ggcGFn
aW5nLW1vZGUgc29mdCBzdGF0ZSAoZS5nLiwgdmEtPmdmbiBjYWNoZTsgUEFFIFBEUEUgY2FjaGUp
LiAqLwpAQCAtNzA1LDIwICs3MDEsMjIgQEAgYm9vbCBoYXBfZmx1c2hfdGxiKGJvb2wgKCpmbHVz
aF92Y3B1KSh2b2lkICpjdHh0LCBzdHJ1Y3QgdmNwdSAqdiksCiAgICAgICAgIGlmICggIWZsdXNo
X3ZjcHUoY3R4dCwgdikgKQogICAgICAgICAgICAgY29udGludWU7CiAKLSAgICAgICAgcGFnaW5n
X3VwZGF0ZV9jcjModiwgZmFsc2UpOworICAgICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwog
CiAgICAgICAgIGNwdSA9IHJlYWRfYXRvbWljKCZ2LT5kaXJ0eV9jcHUpOwotICAgICAgICBpZiAo
IGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQorICAgICAgICBpZiAoIGNwdSAhPSB0aGlzX2NwdSAm
JiBpc192Y3B1X2RpcnR5X2NwdShjcHUpICkKICAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1
KGNwdSwgbWFzayk7CiAgICAgfQogCi0gICAgLyogRmx1c2ggVExCcyBvbiBhbGwgQ1BVcyB3aXRo
IGRpcnR5IHZjcHUgc3RhdGUuICovCi0gICAgZmx1c2hfdGxiX21hc2sobWFzayk7Ci0KLSAgICAv
KiBEb25lLiAqLwotICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKLSAgICAgICAgaWYgKCB2ICE9
IGN1cnJlbnQgJiYgZmx1c2hfdmNwdShjdHh0LCB2KSApCi0gICAgICAgICAgICB2Y3B1X3VucGF1
c2Uodik7CisgICAgLyoKKyAgICAgKiBUcmlnZ2VyIGEgdm1leGl0IG9uIGFsbCBwQ1BVcyB3aXRo
IGRpcnR5IHZDUFUgc3RhdGUgaW4gb3JkZXIgdG8gZm9yY2UgYW4KKyAgICAgKiBBU0lEL1ZQSUQg
Y2hhbmdlIGFuZCBoZW5jZSBhY2NvbXBsaXNoIGEgZ3Vlc3QgVExCIGZsdXNoLiBOb3RlIHRoYXQg
dkNQVXMKKyAgICAgKiBub3QgY3VycmVudGx5IHJ1bm5pbmcgd2lsbCBhbHJlYWR5IGJlIGZsdXNo
ZWQgd2hlbiBzY2hlZHVsZWQgYmVjYXVzZSBvZgorICAgICAqIHRoZSBBU0lEIHRpY2tsZSBkb25l
IGluIHRoZSBsb29wIGFib3ZlLgorICAgICAqLworICAgIG9uX3NlbGVjdGVkX2NwdXMobWFzaywg
aGFuZGxlX2ZsdXNoLCBtYXNrLCAwKTsKKyAgICB3aGlsZSAoICFjcHVtYXNrX2VtcHR5KG1hc2sp
ICkKKyAgICAgICAgY3B1X3JlbGF4KCk7CiAKICAgICByZXR1cm4gdHJ1ZTsKIH0KLS0gCjIuMjUu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
