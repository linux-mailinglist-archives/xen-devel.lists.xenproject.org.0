Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA3769F8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0eS-0000Rd-J4; Fri, 26 Jul 2019 13:52:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr0eQ-0000Qt-9n
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:52:50 +0000
X-Inumbo-ID: a6a47660-afac-11e9-aceb-0b3c34ba53b5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6a47660-afac-11e9-aceb-0b3c34ba53b5;
 Fri, 26 Jul 2019 13:52:47 +0000 (UTC)
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
IronPort-SDR: iOSrn/nFcBTbU8HOf6X360lgT2BUMpict7o6WCYMW+9h11YmOjlWY9+M3Sa6/kBtwnoKt8j0Uk
 GokGiftqXeSzkp38KZe2tBssESb7kqmo0pF4tdjWg4533Fs8RxxymnrbeOd9ZAH9D3UoC03sk6
 uh/j9tYuwce2hY7/MdlaLzOdQfkmJZMKL9uZBfRjakj2/iL+bA3BlWx+C1h9EKC0ogQJ6m7GGf
 1qB57B3EREaUH6pcrCHj8Jfh+F0mypi07n9698pNHXTOFhMWe0L0vXuDSb1yRoE3yqgusviAHd
 4eI=
X-SBRS: 2.7
X-MesageID: 3474415
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3474415"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 14:52:40 +0100
Message-ID: <20190726135240.21745-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726135240.21745-1-andrew.cooper3@citrix.com>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhQVEkgd29yayByZXN0cmljdGVkIHRoZSB2aXNpYmlsaXR5IG9mIG1vc3Qgb2YgbWVtb3J5
LCBidXQgbWlzc2VkIGEgZmV3CmFzcGVjdHMgd2hlbiBpdCBjYW1lIHRvIHRoZSBUU1MuCgpHaXZl
biB0aGF0IHRoZSBUU1MgaXMganVzdCBhbiBvYmplY3QgaW4gcGVyY3B1IGRhdGEsIHRoZSA0ayBt
YXBwaW5nIGZvciBpdApjcmVhdGVkIGluIHNldHVwX2NwdV9yb290X3BndCgpIG1hcHMgYWRqYWNl
bnQgcGVyY3B1IGRhdGEsIG1ha2luZyBpdCBhbGwKbGVha2FibGUgdmlhIE1lbHRkb3duLCBldmVu
IHdoZW4gWFBUSSBpcyBpbiB1c2UuCgpGdXJ0aGVybW9yZSwgbm8gY2FyZSBpcyB0YWtlbiB0byBj
aGVjayB0aGF0IHRoZSBUU1MgZG9lc24ndCBjcm9zcyBhIHBhZ2UKYm91bmRhcnkuICBBcyBpdCB0
dXJucyBvdXQsIHN0cnVjdCB0c3Nfc3RydWN0IGlzIGFsaWduZWQgb24gaXRzIHNpemUgd2hpY2gK
ZG9lcyBwcmV2ZW50IGl0IHN0cmFkZGxpbmcgYSBwYWdlIGJvdW5kYXJ5LCBidXQgdGhpcyB3aWxs
IGNlYXNlIHRvIGJlIHRydWUKb25jZSBDRVQgYW5kIFNoYWRvdyBTdGFjayBzdXBwb3J0IGlzIGFk
ZGVkIHRvIFhlbi4KCk1vdmUgdGhlIFRTUyBpbnRvIHRoZSBwYWdlIGFsaWduZWQgcGVyY3B1IGFy
ZWEsIHNvIG5vIGFkamFjZW50IGRhdGEgY2FuIGJlCmxlYWtlZC4gIE1vdmUgdGhlIGRlZmluaXRp
b24gZnJvbSBzZXR1cC5jIHRvIHRyYXBzLmMsIHdoaWNoIGlzIGEgbW9yZQphcHByb3ByaWF0ZSBw
bGFjZSBmb3IgaXQgdG8gbGl2ZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgfCAy
IC0tCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICAgIHwgNiArKysrKysKIHhlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMgICAgICAgICAgfCAyICsrCiB4ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nl
c3Nvci5oIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94
ODYvc2V0dXAuYwppbmRleCBkMjAxMTkxMGZhLi4xYTJmZmM0ZGMxIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTAwLDggKzEw
MCw2IEBAIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSB4ZW5fcGh5c19zdGFydDsKIAogdW5z
aWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHhlbl92aXJ0X2VuZDsKIAotREVGSU5FX1BFUl9DUFUo
c3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKLQogY2hhciBfX3NlY3Rpb24oIi5ic3Muc3Rh
Y2tfYWxpZ25lZCIpIF9fYWxpZ25lZChTVEFDS19TSVpFKQogICAgIGNwdTBfc3RhY2tbU1RBQ0tf
U0laRV07CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2
L3RyYXBzLmMKaW5kZXggMzhkMTIwMTNkYi4uZTRiNDU4Nzk1NiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTEwOCw2ICsxMDgs
MTIgQEAgaWR0X2VudHJ5X3QgX19zZWN0aW9uKCIuYnNzLnBhZ2VfYWxpZ25lZCIpIF9fYWxpZ25l
ZChQQUdFX1NJWkUpCiAvKiBQb2ludGVyIHRvIHRoZSBJRFQgb2YgZXZlcnkgQ1BVLiAqLwogaWR0
X2VudHJ5X3QgKmlkdF90YWJsZXNbTlJfQ1BVU10gX19yZWFkX21vc3RseTsKIAorLyoKKyAqIFRo
ZSBUU1MgaXMgc21hbGxlciB0aGFuIGEgcGFnZSwgYnV0IHdlIGdpdmUgaXQgYSBmdWxsIHBhZ2Ug
dG8gYXZvaWQKKyAqIGFkamFjZW50IHBlci1jcHUgZGF0YSBsZWFraW5nIHZpYSBNZWx0ZG93biB3
aGVuIFhQVEkgaXMgaW4gdXNlLgorICovCitERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQoc3Ry
dWN0IF9fYWxpZ25lZChQQUdFX1NJWkUpIHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKKwogYm9vbCAo
KmlvZW11bF9oYW5kbGVfcXVpcmspKAogICAgIHU4IG9wY29kZSwgY2hhciAqaW9fZW11bF9zdHVi
LCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCmluZGV4IGI4YTJlYTQyNTkuLmM4
MmUxZTUwNGEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKKysrIGIveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUwpAQCAtMzY4LDYgKzM2OCw4IEBAIEFTU0VSVChJU19BTElHTkVEKF9f
Mk1fcndkYXRhX2VuZCwgICBTRUNUSU9OX0FMSUdOKSwgIl9fMk1fcndkYXRhX2VuZCBtaXNhbGln
bmVkCiAKIEFTU0VSVChJU19BTElHTkVEKGNwdTBfc3RhY2ssIFNUQUNLX1NJWkUpLCAiY3B1MF9z
dGFjayBtaXNhbGlnbmVkIikKIAorQVNTRVJUKElTX0FMSUdORUQocGVyX2NwdV9faW5pdF90c3Ms
IFBBR0VfU0laRSksICJwZXJfY3B1KGluaXRfdHNzKSBtaXNhbGlnbmVkIikKKwogQVNTRVJUKElT
X0FMSUdORUQoX19pbml0X2JlZ2luLCBQQUdFX1NJWkUpLCAiX19pbml0X2JlZ2luIG1pc2FsaWdu
ZWQiKQogQVNTRVJUKElTX0FMSUdORUQoX19pbml0X2VuZCwgICBQQUdFX1NJWkUpLCAiX19pbml0
X2VuZCBtaXNhbGlnbmVkIikKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9j
ZXNzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKaW5kZXggMjg2MjMyMWVl
ZS4uYjViZWU5NDkzMSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3Iu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCkBAIC00MTEsNyArNDExLDcg
QEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfX213YWl0KHVuc2lnbmVkIGxvbmcgZWF4LCB1
bnNpZ25lZCBsb25nIGVjeCkKICNkZWZpbmUgSU9CTVBfQllURVMgICAgICAgICAgICAgODE5Mgog
I2RlZmluZSBJT0JNUF9JTlZBTElEX09GRlNFVCAgICAweDgwMDAKIAotc3RydWN0IF9fcGFja2Vk
IF9fY2FjaGVsaW5lX2FsaWduZWQgdHNzX3N0cnVjdCB7CitzdHJ1Y3QgX19wYWNrZWQgdHNzX3N0
cnVjdCB7CiAgICAgdWludDMyX3QgOjMyOwogICAgIHVpbnQ2NF90IHJzcDAsIHJzcDEsIHJzcDI7
CiAgICAgdWludDY0X3QgOjY0OwpAQCAtNDI1LDYgKzQyNSw3IEBAIHN0cnVjdCBfX3BhY2tlZCBf
X2NhY2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1Y3QgewogICAgIC8qIFBhZHMgdGhlIFRTUyB0byBi
ZSBjYWNoZWxpbmUtYWxpZ25lZCAodG90YWwgc2l6ZSBpcyAweDgwKS4gKi8KICAgICB1aW50OF90
IF9fY2FjaGVsaW5lX2ZpbGxlclsyNF07CiB9OworREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0c3Nf
c3RydWN0LCBpbml0X3Rzcyk7CiAKICNkZWZpbmUgSVNUX05PTkUgMFVMCiAjZGVmaW5lIElTVF9E
RiAgIDFVTApAQCAtNDYzLDcgKzQ2NCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkaXNhYmxlX2Vh
Y2hfaXN0KGlkdF9lbnRyeV90ICppZHQpCiBleHRlcm4gaWR0X2VudHJ5X3QgaWR0X3RhYmxlW107
CiBleHRlcm4gaWR0X2VudHJ5X3QgKmlkdF90YWJsZXNbXTsKIAotREVDTEFSRV9QRVJfQ1BVKHN0
cnVjdCB0c3Nfc3RydWN0LCBpbml0X3Rzcyk7CiBERUNMQVJFX1BFUl9DUFUocm9vdF9wZ2VudHJ5
X3QgKiwgcm9vdF9wZ3QpOwogCiBleHRlcm4gdm9pZCB3cml0ZV9wdGJhc2Uoc3RydWN0IHZjcHUg
KnYpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
