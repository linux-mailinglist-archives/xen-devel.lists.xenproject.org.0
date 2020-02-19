Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2883164BE2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:28:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4T6P-0008Eu-1F; Wed, 19 Feb 2020 17:25:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tz6x=4H=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j4T6M-0008Ep-Va
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:25:35 +0000
X-Inumbo-ID: d59c1de0-533c-11ea-83f1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d59c1de0-533c-11ea-83f1-12813bfff9fa;
 Wed, 19 Feb 2020 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582133133;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=WroCCiRPtp9FjMzqexf2EswxzzUxjsQOvqA6gkNmxcs=;
 b=KwR5nsme3XTLr68TScwYTrS/f2RPnNOW3esiZulDJ0ZdvdAXlmcwN3id
 XgyhkawC7gTuajzdrWQRM9Y4oBYliZ+1QXa0dqdEgc1HW4qzQx0wg7HF8
 3p9Dbjyy4PiWMivZy2OU/fzjtWUIEea3Y23Ddwwetepzo6ikFuLxXgk9a k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3D+XjovEfwAYIeYanAwAAIfSoyOGE2Tftn/6kTGLAtoRkKSqCY3LSfLW7UJL5B12ienmB+lpQd
 COkUxHXWdavE1HKOhHuAnVbdH8KAami5yhjwkBPBbdP4fiW7i8/FUpxgVsJH3dvfH43r6plUbQ
 Qbr25Vr/3/WjFwPUQNZ1QAVSath3bimz1nC64geD3q5QTRH9Vv/LuByfqOamxEwHd/srzVrRHg
 5kBon1Hjoji2jjFuhDby86Nbpw0yMwSbdk4x2uw0eKInTMqACOxzXsFVQIJCqhHo2L9yrzZg8B
 bHM=
X-SBRS: 2.7
X-MesageID: 13136189
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13136189"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 17:25:28 +0000
Message-ID: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU callbacks
 after CPU up/down
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIENQVSBkb3duIG9wZXJhdGlvbiBSQ1UgY2FsbGJhY2tzIGFyZSBzY2hlZHVsZWQgdG8g
ZmluaXNoCm9mZiBzb21lIGFjdGlvbnMgbGF0ZXIgYXMgc29vbiBhcyBDUFUgaXMgZnVsbHkgZGVh
ZCAodGhlIHNhbWUgYXBwbGllcwp0byBDUFUgdXAgb3BlcmF0aW9uIGluIGNhc2UgZXJyb3IgcGF0
aCBpcyB0YWtlbikuIElmIGluIHRoZSBzYW1lIGdyYWNlCnBlcmlvZCBhbm90aGVyIENQVSB1cCBv
cGVyYXRpb24gaXMgcGVyZm9ybWVkIG9uIHRoZSBzYW1lIENQVSwgUkNVIGNhbGxiYWNrCndpbGwg
YmUgY2FsbGVkIGxhdGVyIG9uIGEgQ1BVIGluIGEgcG90ZW50aWFsbHkgd3JvbmcgKGFscmVhZHkg
dXAgYWdhaW4KaW5zdGVhZCBvZiBzdGlsbCBiZWluZyBkb3duKSBzdGF0ZSBsZWFkaW5nIHRvIGV2
ZW50dWFsIHN0YXRlIGluY29uc2lzdGVuY3kKYW5kL29yIGNyYXNoLgoKSW4gb3JkZXIgdG8gYXZv
aWQgaXQgLSBmbHVzaCBSQ1UgY2FsbGJhY2tzIGV4cGxpY2l0bHkgdXBvbiBmaW5pc2hpbmcgb2Zm
CnRoZSBjdXJyZW50IG9wZXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KVGhpcyBnb3QgZGlzY292ZXJlZCB0cnlpbmcg
dG8gcmVzdW1lIFBWIHNoaW0gd2l0aCBtdWx0aXBsZSB2Q1BVcyBvbiBBTUQKbWFjaGluZSAod2hl
cmUgcGFya19vZmZsaW5lX2NwdXMgPT0gMCkuIFJDVSBjYWxsYmFjayByZXNwb25zaWJsZSBmb3IK
ZnJlZWluZyBwZXJjcHUgYXJlYSBvbiBDUFUgb2ZmbGluZSBnb3QgZmluYWxseSBjYWxsZWQgYWZ0
ZXIgQ1BVIHdlbnQKb25saW5lIGFnYWluIGFzIHRoZSBndWVzdCBwZXJmb3JtZWQgcmVndWxhciB2
Q1BVIG9mZmxpbmUvb25saW5lIG9wZXJhdGlvbnMKb24gcmVzdW1lLgoKTm90ZTogdGhpcyBwYXRj
aCByZXF1aXJlcyBSQ1Ugc2VyaWVzIGZyb20gSnVlcmdlbiB0byBiZSBhcHBsaWVkIC0KaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAyL21z
ZzAxMjIxLmh0bWwKCnYyOiBjaGFuZ2VkIHJjdV9iYXJyaWVyKCkgcG9zaXRpb24sIHVwZGF0ZWQg
ZGVzY3JpcHRpb24KLS0tCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgfCAxMSArKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKaW5kZXgg
NGE3NmYwZi4uZGQ1YTI0ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwpAQCAtNzgsOCArNzgsMTEgQEAgc3RhdGljIHZvaWQgbDNf
Y2FjaGVfZ2V0KHZvaWQgKmFyZykKIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQogewog
ICAgIHVuc2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZylkYXRhOwotICAgIGludCByZXQg
PSBjcHVfdXAoY3B1KTsKKyAgICBpbnQgcmV0OwogCisgICAgLyogRmx1c2ggcG90ZW50aWFsbHkg
c2NoZWR1bGVkIFJDVSB3b3JrIGZyb20gcHJlY2VkaW5nIENQVSBvZmZsaW5lICovCisgICAgcmN1
X2JhcnJpZXIoKTsKKyAgICByZXQgPSBjcHVfdXAoY3B1KTsKICAgICBpZiAoIHJldCA9PSAtRUJV
U1kgKQogICAgIHsKICAgICAgICAgLyogT24gRUJVU1ksIGZsdXNoIFJDVSB3b3JrIGFuZCBoYXZl
IG9uZSBtb3JlIGdvLiAqLwpAQCAtMTA0LDcgKzEwNywxMSBAQCBsb25nIGNwdV91cF9oZWxwZXIo
dm9pZCAqZGF0YSkKIGxvbmcgY3B1X2Rvd25faGVscGVyKHZvaWQgKmRhdGEpCiB7CiAgICAgaW50
IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Ci0gICAgaW50IHJldCA9IGNwdV9kb3duKGNwdSk7
CisgICAgaW50IHJldDsKKworICAgIC8qIEZsdXNoIHBvdGVudGlhbGx5IHNjaGVkdWxlZCBSQ1Ug
d29yayBmcm9tIHByZWNlZGluZyBDUFUgb25saW5lICovCisgICAgcmN1X2JhcnJpZXIoKTsKKyAg
ICByZXQgPSBjcHVfZG93bihjcHUpOwogICAgIGlmICggcmV0ID09IC1FQlVTWSApCiAgICAgewog
ICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28u
ICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
