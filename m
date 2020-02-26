Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C402016FE13
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v4C-0003Ax-J4; Wed, 26 Feb 2020 11:41:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v4A-00039k-Ro
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:26 +0000
X-Inumbo-ID: e7acb5a8-588c-11ea-8cb6-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7acb5a8-588c-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xHJSK+ksoK9OQta1FpeZ8S5l79r9MroWvjBMZmZjrxo=;
 b=KAOr+pRP5ZjjbLZw1LfajUoTcM/FRH1e8gt7s+LA8eioZ4oZyVvOSnrb
 hTtolwKoQx07oEzRZ1q4Lp1hpNgnSccq0weRvjsEo8MTKaMnZnqyD04eA
 MC6Ftho4ZAuo1j/YncefY4CNiTuOO9GxXuElbLFgCKpBtFlrE2wIOPbu9 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SipcPua4BGfp/QVTy+Gw23/L45n9qgjdXiXQffCmOYfg7FsVehvwbKR9Rp4N3iywBY3HmIdQ0D
 ymQ0g6oNtUh84EUKn9YZn1z65u2dyUWyCoPT3EXs0R53NX49Xf+vcMHEpN7o5josbihzHVsA4U
 DUSeIcBHURPiH81cOmLTgS46aq8oskmmrX659KxDc07ysoS4jT+FIaU83nNWCOLMtp7O7KEaDO
 oyMBtBOj99/NjxTmlzqZW7sywgt5toLkFpG9oME3lzUcbUtpbLBuQFKfftAHE9G1WY7VCSrJlD
 wb8=
X-SBRS: 2.7
X-MesageID: 13038476
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13038476"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:55 +0000
Message-ID: <20200226113355.2532224-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 23/23] xen/build: use if_changed to build
 guest_%.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIGlmX2NoYW5nZWQgZm9yIGJ1aWxkaW5nIGFsbCBndWVzdF8lLm8gb2JqZWN0cywgYW5kIG1h
a2UgdXNlIG9mCmNvbW1hbmQgdGhhdCBhbHJlYWR5IGV4aXN0LgoKVGhpcyBwYXRjaCBhbHNvIGlu
dHJvZHVjZXMgQ0ZMQUdTXyRALCBpdCBpcyB1c2VkIHNvIHRoYXQgZmxhZ3MgYXJlCmFwcGxpZWQg
dG8gYWxsIC5vIC5pIGFuZCAucyB0YXJnZXRzLgoKVGhpcyBwYXRjaCBtYWtlIGEgY2hhbmdlIHRv
IHRoZSB3YXkgZ3Vlc3RfJS5vIGZpbGVzIGFyZSBidWlsdCwgYW5kIG5vdwpydW4gdGhlIHNhbWUg
Y29tbWFuZHMgdGhhdCBlbmZvcmNlIHVuaXF1ZSBzeW1ib2xzLiBCdXQgd2l0aCBwYXRjaAoieGVu
LHN5bWJvbHM6IHJld29yayBmaWxlIHN5bWJvbHMgc2VsZWN0aW9uIiwgc3ltYm9scyBzaG91bGQg
c3RpbGwKc2VsZWN0IHRoZSBmaWxlIHN5bWJvbHMgZGlyZWN0aXZlIGludGVuZGVkIHRvIGJlIHVz
ZWQgZm9yIGd1ZXN0XyUubwpvYmplY3RzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rICAgICAgICAgICAg
ICAgICAgICB8ICA1ICsrKystCiB4ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUgICAgICAgIHwgMTUg
KysrKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vaGFwL01ha2VmaWxlICAgIHwgMTUgKysr
KysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L01ha2VmaWxlIHwgMTUgKysrKysr
KysrLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCAwMmNk
MzdkMDQwNTQuLjFmZmIwMmY0MjkxNCAxMDA2NDQKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hl
bi9SdWxlcy5tawpAQCAtMTE1LDYgKzExNSw5IEBAIGVuZGlmCiAjIEZJWE1FIExUTyBicm9rZW4s
IGJ1dCB3ZSB3b3VsZCBuZWVkIGEgZGlmZmVyZW50IHdheSB0byBmaWx0ZXIgLWZsdG8gb3V0CiAj
ICQob2JqLWJpbi15KTogQ0ZMQUdTIDo9ICQoZmlsdGVyLW91dCAtZmx0bywkKENGTEFHUykpCiAK
KyMgdGFyZ2V0IHdpdGggaXRzIHN1ZmZpeCBzdHJpcHBlZAordGFyZ2V0LXN0ZW0gPSAkKGJhc2Vu
YW1lICRAKQorCiAjIENhbGN1bGF0aW9uIG9mIGZsYWdzLCBmaXJzdCB0aGUgZ2VuZXJpYyBmbGFn
cywgdGhlbiB0aGUgYXJjaCBzcGVjaWZpYyBmbGFncywKICMgYW5kIGxhc3QgdGhlIGZsYWdzIG1v
ZGlmaWVkIGZvciBhIHRhcmdldCBvciBhIGRpcmVjdG9yeS4KIApAQCAtMTIzLDcgKzEyNiw3IEBA
IGFfZmxhZ3MgPSAtTU1EIC1NRiAkKEBEKS8uJChARikuZCAkKFhFTl9BRkxBR1MpCiAKIGluY2x1
ZGUgJChCQVNFRElSKS9hcmNoLyQoVEFSR0VUX0FSQ0gpL1J1bGVzLm1rCiAKLWNfZmxhZ3MgKz0g
JChDRkxBR1MteSkKK2NfZmxhZ3MgKz0gJChDRkxBR1MteSkgJChDRkxBR1NfJCh0YXJnZXQtc3Rl
bSkubykKIGFfZmxhZ3MgKz0gJChDRkxBR1MteSkgJChBRkxBR1MteSkKIAogcXVpZXRfY21kX2xk
X2J1aWx0aW4gPSBMRCAgICAgICRACmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vTWFrZWZp
bGUgYi94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKaW5kZXggYTI0MzFmZGU2YmI0Li40NzUwYmZh
MGZmOTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQorKysgYi94ZW4vYXJj
aC94ODYvbW0vTWFrZWZpbGUKQEAgLTExLDExICsxMSwxNCBAQCBvYmoteSArPSBwMm0ubyBwMm0t
cHQubwogb2JqLSQoQ09ORklHX0hWTSkgKz0gcDJtLWVwdC5vIHAybS1wb2Qubwogb2JqLXkgKz0g
cGFnaW5nLm8KIAotZ3Vlc3Rfd2Fsa18lLm86IGd1ZXN0X3dhbGsuYyBNYWtlZmlsZQotCSQoQ0Mp
ICQoY19mbGFncykgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1jICQ8IC1vICRACiskKGZvcmVh
Y2ggZ3csJChmaWx0ZXIgZ3Vlc3Rfd2Fsa18lLm8sJChvYmoteSkpLFwKKyAgICAkKGV2YWwgQ0ZM
QUdTXyQoZ3cpID0gLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQkKikpCiAKLWd1ZXN0X3dhbGtfJS5p
OiBndWVzdF93YWxrLmMgTWFrZWZpbGUKLQkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEp
JSwkKGNfZmxhZ3MpKSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCogLWMgJDwgLW8gJEAKK2d1ZXN0
X3dhbGtfJS5vOiBndWVzdF93YWxrLmMgRk9SQ0UKKwkkKGNhbGwgaWZfY2hhbmdlZF9ydWxlLGNj
X29fYykKIAotZ3Vlc3Rfd2Fsa18lLnM6IGd1ZXN0X3dhbGsuYyBNYWtlZmlsZQotCSQoQ0MpICQo
ZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUsJChjX2ZsYWdzKSkgLURHVUVTVF9QQUdJTkdfTEVWRUxT
PSQqIC1TICQ8IC1vICRACitndWVzdF93YWxrXyUuaTogZ3Vlc3Rfd2Fsay5jIEZPUkNFCisJJChj
YWxsIGlmX2NoYW5nZWQsY3BwX2lfYykKKworZ3Vlc3Rfd2Fsa18lLnM6IGd1ZXN0X3dhbGsuYyBG
T1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkLGNjX3NfYykKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvbW0vaGFwL01ha2VmaWxlCmluZGV4IDIy
ZTdhZDU0YmQzMy4uOGNkMzFlOWNkYzVlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFw
L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvTWFrZWZpbGUKQEAgLTUsMTEgKzUs
MTQgQEAgb2JqLXkgKz0gZ3Vlc3Rfd2Fsa180bGV2ZWwubwogb2JqLXkgKz0gbmVzdGVkX2hhcC5v
CiBvYmoteSArPSBuZXN0ZWRfZXB0Lm8KIAotZ3Vlc3Rfd2Fsa18lbGV2ZWwubzogZ3Vlc3Rfd2Fs
ay5jIE1ha2VmaWxlCi0JJChDQykgJChjX2ZsYWdzKSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCog
LWMgJDwgLW8gJEAKKyQoZm9yZWFjaCBndywkKGZpbHRlciBndWVzdF93YWxrXyVsZXZlbC5vLCQo
b2JqLXkpKSxcCisgICAgJChldmFsIENGTEFHU18kKGd3KSA9IC1ER1VFU1RfUEFHSU5HX0xFVkVM
Uz0kJCopKQogCi1ndWVzdF93YWxrXyVsZXZlbC5pOiBndWVzdF93YWxrLmMgTWFrZWZpbGUKLQkk
KENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKGNfZmxhZ3MpKSAtREdVRVNUX1BBR0lO
R19MRVZFTFM9JCogLWMgJDwgLW8gJEAKK2d1ZXN0X3dhbGtfJWxldmVsLm86IGd1ZXN0X3dhbGsu
YyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkX3J1bGUsY2Nfb19jKQogCi1ndWVzdF93YWxrXyVs
ZXZlbC5zOiBndWVzdF93YWxrLmMgTWFrZWZpbGUKLQkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChj
b21tYSklLCQoY19mbGFncykpIC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKiAtUyAkPCAtbyAkQAor
Z3Vlc3Rfd2Fsa18lbGV2ZWwuaTogZ3Vlc3Rfd2Fsay5jIEZPUkNFCisJJChjYWxsIGlmX2NoYW5n
ZWQsY3BwX2lfYykKKworZ3Vlc3Rfd2Fsa18lbGV2ZWwuczogZ3Vlc3Rfd2Fsay5jIEZPUkNFCisJ
JChjYWxsIGlmX2NoYW5nZWQsY2Nfc19jKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3No
YWRvdy9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvTWFrZWZpbGUKaW5kZXggMjNk
M2ZmMTA4MDJjLi5kMTFlOWUyZmFjMDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9NYWtlZmlsZQpAQCAtNiwx
MSArNiwxNCBAQCBlbHNlCiBvYmoteSArPSBub25lLm8KIGVuZGlmCiAKLWd1ZXN0XyUubzogbXVs
dGkuYyBNYWtlZmlsZQotCSQoQ0MpICQoY19mbGFncykgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQq
IC1jICQ8IC1vICRACiskKGZvcmVhY2ggZ3csJChmaWx0ZXIgZ3Vlc3RfJS5vLCQob2JqLXkpKSxc
CisgICAgJChldmFsIENGTEFHU18kKGd3KSA9IC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kJCopKQog
Ci1ndWVzdF8lLmk6IG11bHRpLmMgTWFrZWZpbGUKLQkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQo
Y29tbWEpJSwkKGNfZmxhZ3MpKSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCogLWMgJDwgLW8gJEAK
K2d1ZXN0XyUubzogbXVsdGkuYyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkX3J1bGUsY2Nfb19j
KQogCi1ndWVzdF8lLnM6IG11bHRpLmMgTWFrZWZpbGUKLQkkKENDKSAkKGZpbHRlci1vdXQgLVdh
JChjb21tYSklLCQoY19mbGFncykpIC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKiAtUyAkPCAtbyAk
QAorZ3Vlc3RfJS5pOiBtdWx0aS5jIEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWQsY3BwX2lfYykK
KworZ3Vlc3RfJS5zOiBtdWx0aS5jIEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWQsY2Nfc19jKQot
LSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
