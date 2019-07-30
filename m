Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7B7AF05
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVbU-0005pM-FP; Tue, 30 Jul 2019 17:08:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsVbT-0005pD-25
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:07:59 +0000
X-Inumbo-ID: 93f61b1d-b2ec-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 93f61b1d-b2ec-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:07:58 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Eu9lTdh8oL8sgPwZ5t1tg0a3YEcqBKTlwcdtXUC2JcpdAztkumz55e74YFevu4Nhqhjz8WwJ0m
 YJinNJLi1u7rReSyuUmEgQIDQwl+XqxhZIFFmu65A1syXAYlT6MG7UN+iH9bHoNTieB7lh6hN6
 6ACfuJ1Ed7R8seU/DOFqOeN2k5qsNMbI05AOnJPke0i8F1wS5ZzjMOFOMI8PFIzR19VU8xlwkh
 +1DklWRw1lBqjxH5IGx8aS/eJy1Oy7L2FoaRAPMT7xT1pOt0Jyh6T1TGMZbhofvfv3KOPQ6EUg
 9Ys=
X-SBRS: 2.7
X-MesageID: 3626812
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3626812"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 18:07:54 +0100
Message-ID: <20190730170754.31389-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Fix build dependenices for reloc.c
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
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIDIwMWY4NTJlYWYgYWRkZWQgc3RhcnRfaW5mby5oIGFuZCBrY29uZmlnLmggdG8gcmVsb2Mu
YywgYnV0IG9ubHkgdXBkYXRlZApzdGFydF9pbmZvLmggaW4gUkVMT0NfREVQUy4KClRoaXMgY2F1
c2VzIHJlbG9jLmMgdG8gbm90IGJlIHJlZ2VuZXJhdGVkIHdoZW4gS2NvbmZpZyBjaGFuZ2VzLiAg
SXQgaXMgbW9zdApub3RpY2VhYmxlIHdoZW4gZW5hYmxpbmcgQ09ORklHX1BWSCBhbmQgZmluZGlu
ZyB0aGUgcmVzdWx0aW5nIGJpbmFyeSBjcmFzaAplYXJseSB3aXRoOgoKICAoZDkpIChYRU4pCiAg
KGQ5KSAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKGQ5
KSAoWEVOKSBQYW5pYyBvbiBDUFUgMDoKICAoZDkpIChYRU4pIE1hZ2ljIHZhbHVlIGlzIHdyb25n
OiBjMmMyYzJjMgogIChkOSkgKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgogIChkOSkgKFhFTikKICAoZDkpIChYRU4pIFJlYm9vdCBpbiBmaXZlIHNlY29uZHMu
Li4KICAoWEVOKSBkOXYwIFRyaXBsZSBmYXVsdCAtIGludm9raW5nIEhWTSBzaHV0ZG93biBhY3Rp
b24gMQoKUmVwb3J0ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
Ym9vdC9NYWtlZmlsZSB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9NYWtlZmlsZSBi
L3hlbi9hcmNoL3g4Ni9ib290L01ha2VmaWxlCmluZGV4IGUxMDM4ODI4MmYuLjliMzFiZmNiZmIg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L01ha2VmaWxlCkBAIC00LDcgKzQsMTAgQEAgREVGU19IX0RFUFMgPSBkZWZzLmggJChC
QVNFRElSKS9pbmNsdWRlL3hlbi9zdGRib29sLmgKIAogQ01ETElORV9ERVBTID0gJChERUZTX0hf
REVQUykgdmlkZW8uaAogCi1SRUxPQ19ERVBTID0gJChERUZTX0hfREVQUykgJChCQVNFRElSKS9p
bmNsdWRlL3hlbi9tdWx0aWJvb3QuaCBcCitSRUxPQ19ERVBTID0gJChERUZTX0hfREVQUykgXAor
CSAgICAgJChCQVNFRElSKS9pbmNsdWRlL2dlbmVyYXRlZC9hdXRvY29uZi5oIFwKKwkgICAgICQo
QkFTRURJUikvaW5jbHVkZS94ZW4va2NvbmZpZy5oIFwKKwkgICAgICQoQkFTRURJUikvaW5jbHVk
ZS94ZW4vbXVsdGlib290LmggXAogCSAgICAgJChCQVNFRElSKS9pbmNsdWRlL3hlbi9tdWx0aWJv
b3QyLmggXAogCSAgICAgJChCQVNFRElSKS9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc3Rh
cnRfaW5mby5oCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
