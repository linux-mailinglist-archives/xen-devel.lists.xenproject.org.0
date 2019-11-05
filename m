Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FDF0635
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 20:45:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS4jk-0005gB-Ms; Tue, 05 Nov 2019 19:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iS4ji-0005fx-Sf
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 19:43:30 +0000
X-Inumbo-ID: 8968c4af-0004-11ea-a1a3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8968c4af-0004-11ea-a1a3-12813bfff9fa;
 Tue, 05 Nov 2019 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572983009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bx0lExUD9fBFDqbAmNJm2UTwuYSsKtayzfXxzytuzI8=;
 b=WmTxM6Ng82+VQF3ap1kmCXYI21d1SQXwPDLEC7+K/p6hDwY7obJP27qf
 r2y4G9zpLhkKJAgdRSyiu9nLjZvT9R/be/y/QyfO2yv8GieiV3etVpdWq
 ovHuRRpkE31sNZGkamuJD3MztaFGOcXXpPMOiIxuY69if+k0qzloHPbgd o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IOHiIJT/l/vnNIgBs2E54RNTIOmyTejalYFL0mqjb7m68sjHDEpMqKwThfxjDFEHXT8+D8Hv2M
 8QFCdNptQeAeKV3zvOWK6VHBw4EhJ+HOvr+degrBnis4Pqd/35EgnqNvoL1inzM9Mfbdk/GS4p
 zItKmb130xJ4ynj7sJeFav1Vle+dhv36LVJoAQ3PtYZKBnGw8a4843TyH/RXUT9TfGMdvyoE03
 z57giyuuRo5HqqBRjtkO7ZyIss/4YowwJGaZ6aZMAcQ4U32smb4wTcaYjmvmqQg6irSqwjfHsE
 vng=
X-SBRS: 2.7
X-MesageID: 8392411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,271,1569297600"; 
   d="scan'208";a="8392411"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 19:43:17 +0000
Message-ID: <20191105194317.16232-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191105194317.16232-1-andrew.cooper3@citrix.com>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/livepatch: Prevent patching with active
 waitqueues
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNhZmV0eSBvZiBsaXZlcGF0Y2hpbmcgZGVwZW5kcyBvbiBldmVyeSBzdGFjayBoYXZpbmcg
YmVlbiB1bndvdW5kLCBidXQKdGhlcmUgaXMgb25lIGNvcm5lciBjYXNlIHdoZXJlIHRoaXMgaXMg
bm90IHRydWUuICBUaGUgU2hhcmluZy9QYWdpbmcvTW9uaXRvcgppbmZyYXN0cnVjdHVyZSBtYXkg
dXNlIHdhaXRxdWV1ZXMsIHdoaWNoIGNvcHkgdGhlIHN0YWNrIGZyYW1lIHNpZGV3YXlzIGFuZAps
b25nam1wKCkgdG8gYSBkaWZmZXJlbnQgdmNwdS4KClRoaXMgY2FzZSBpcyByYXJlLCBhbmQgY2Fu
IGJlIHdvcmtlZCBhcm91bmQgYnkgcGF1c2luZyB0aGUgb2ZmZW5kaW5nCmRvbWFpbihzKSwgd2Fp
dGluZyBmb3IgdGhlaXIgcmluZ3MgdG8gZHJhaW4sIHRoZW4gcGVyZm9ybWluZyBhIGxpdmVwYXRj
aC4KCkluIHRoZSBjYXNlIHRoYXQgdGhlcmUgaXMgYW4gYWN0aXZlIHdhaXRxdWV1ZSwgZmFpbCB0
aGUgbGl2ZXBhdGNoIGF0dGVtcHQgd2l0aAotRUJVU1ksIHdoaWNoIGlzIHByZWZvcmFibGUgdG8g
dGhlIGZpcmV3b3JrcyB3aGljaCBvY2N1ciBmcm9tIHRyeWluZyB0byB1bndpbmQKdGhlIG9sZCBz
dGFjayBmcmFtZSBhdCBhIGxhdGVyIHBvaW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRo
aXMgZml4IHdhbnRzIGJhY2twb3J0aW5nLCBhbmQgaXMgbG9uZyBvdmVyZHVlIGZvciBwb3N0aW5n
IHVwc3RyZWFtLgotLS0KIHhlbi9hcmNoL2FybS9saXZlcGF0Y2guYyAgICB8ICA1ICsrKysrCiB4
ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICB8ICA3ICsrKysrKysK
IHhlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaCB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgNTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9saXZlcGF0Y2guYyBiL3hl
bi9hcmNoL2FybS9saXZlcGF0Y2guYwppbmRleCAwMGM1ZTJiYzQ1Li45MTVlOWQ5MjZhIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKKysrIGIveGVuL2FyY2gvYXJtL2xpdmVw
YXRjaC5jCkBAIC0xOCw2ICsxOCwxMSBAQAogCiB2b2lkICp2bWFwX29mX3hlbl90ZXh0OwogCitp
bnQgYXJjaF9saXZlcGF0Y2hfc2FmZXR5X2NoZWNrKHZvaWQpCit7CisgICAgcmV0dXJuIDA7Cit9
CisKIGludCBhcmNoX2xpdmVwYXRjaF9xdWllc2NlKHZvaWQpCiB7CiAgICAgbWZuX3QgdGV4dF9t
Zm47CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMgYi94ZW4vYXJjaC94ODYv
bGl2ZXBhdGNoLmMKaW5kZXggYzgyY2Y1M2I5ZS4uMGYxMjlmYTZiMiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2xpdmVwYXRjaC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYwpAQCAt
MTQsNiArMTQsNDUgQEAKICNpbmNsdWRlIDxhc20vbm1pLmg+CiAjaW5jbHVkZSA8YXNtL2xpdmVw
YXRjaC5oPgogCitzdGF0aWMgYm9vbCBoYXNfYWN0aXZlX3dhaXRxdWV1ZShjb25zdCBzdHJ1Y3Qg
dm1fZXZlbnRfZG9tYWluICp2ZWQpCit7CisgICAgLyogdmVkIG1heSBiZSB4emFsbG9jKCknZCB3
aXRob3V0IElOSVRfTElTVF9IRUFEKCkgeWV0LiAqLworICAgIHJldHVybiAodmVkICYmICFsaXN0
X2hlYWRfaXNfbnVsbCgmdmVkLT53cS5saXN0KSAmJgorICAgICAgICAgICAgIWxpc3RfZW1wdHko
JnZlZC0+d3EubGlzdCkpOworfQorCisvKgorICogeDg2J3MgaW1wbGVtZW50YXRpb24gb2Ygd2Fp
dHF1ZXVlIHZpb2xhdGVzIHRoZSBsaXZlcGF0Y2hpbmcgc2FmZXkgcHJpbmNpcGxlCisgKiBvZiBo
YXZpbmcgdW53b3VuZCBldmVyeSBDUFVzIHN0YWNrIGJlZm9yZSBtb2RpZnlpbmcgbGl2ZSBjb250
ZW50LgorICoKKyAqIFNlYXJjaCB0aHJvdWdoIGV2ZXJ5IGRvbWFpbiBhbmQgY2hlY2sgdGhhdCBu
byB2Q1BVcyBoYXZlIGFuIGFjdGl2ZQorICogd2FpdHF1ZXVlLgorICovCitpbnQgYXJjaF9saXZl
cGF0Y2hfc2FmZXR5X2NoZWNrKHZvaWQpOworeworICAgIHN0cnVjdCBkb21haW4gKmQ7CisKKyAg
ICBmb3JfZWFjaF9kb21haW4gKCBkICkKKyAgICB7CisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5H
CisgICAgICAgIGlmICggaGFzX2FjdGl2ZV93YWl0cXVldWUoZC0+dm1fZXZlbnRfc2hhcmUpICkK
KyAgICAgICAgICAgIGdvdG8gZmFpbDsKKyNlbmRpZgorI2lmZGVmIENPTkZJR19NRU1fUEFHSU5H
CisgICAgICAgIGlmICggaGFzX2FjdGl2ZV93YWl0cXVldWUoZC0+dm1fZXZlbnRfcGFnaW5nKSAp
CisgICAgICAgICAgICBnb3RvIGZhaWw7CisjZW5kaWYKKyAgICAgICAgaWYgKCBoYXNfYWN0aXZl
X3dhaXRxdWV1ZShkLT52bV9ldmVudF9tb25pdG9yKSApCisgICAgICAgICAgICBnb3RvIGZhaWw7
CisgICAgfQorCisgICAgcmV0dXJuIDA7CisKKyBmYWlsOgorICAgIHByaW50ayhYRU5MT0dfRVJS
IExJVkVQQVRDSCAiJXBkIGZvdW5kIHdpdGggYWN0aXZlIHdhaXRxdWV1ZVxuIiwgZCk7CisgICAg
cmV0dXJuIC1FQlVTWTsKK30KKwogaW50IGFyY2hfbGl2ZXBhdGNoX3F1aWVzY2Uodm9pZCkKIHsK
ICAgICAvKiBEaXNhYmxlIFdQIHRvIGFsbG93IGNoYW5nZXMgdG8gcmVhZC1vbmx5IHBhZ2VzLiAq
LwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBh
dGNoLmMKaW5kZXggOTYyNjQ3NjE2YS4uMjdlZTViZGViNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9saXZlcGF0Y2guYworKysgYi94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC0xMDYwLDYgKzEw
NjAsMTMgQEAgc3RhdGljIGludCBhcHBseV9wYXlsb2FkKHN0cnVjdCBwYXlsb2FkICpkYXRhKQog
ICAgIHVuc2lnbmVkIGludCBpOwogICAgIGludCByYzsKIAorICAgIHJjID0gYXBwbHlfc2FmZXR5
X2NoZWNrcygpOworICAgIGlmICggcmMgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgTElWRVBBVENIICIlczogU2FmZXR5IGNoZWNrcyBmYWlsZWRcbiIsIGRhdGEtPm5hbWUpOwor
ICAgICAgICByZXR1cm4gcmM7CisgICAgfQorCiAgICAgcHJpbnRrKFhFTkxPR19JTkZPIExJVkVQ
QVRDSCAiJXM6IEFwcGx5aW5nICV1IGZ1bmN0aW9uc1xuIiwKICAgICAgICAgICAgIGRhdGEtPm5h
bWUsIGRhdGEtPm5mdW5jcyk7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0
Y2guaCBiL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAppbmRleCAxYjE4MTdjYTBkLi42OWVk
ZTc1ZDIwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKKysrIGIveGVu
L2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCkBAIC0xMDQsNiArMTA0LDcgQEAgc3RhdGljIGlubGlu
ZSBpbnQgbGl2ZXBhdGNoX3ZlcmlmeV9kaXN0YW5jZShjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1
bmMgKmZ1bmMpCiAgKiBUaGVzZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBhcm91bmQgdGhlIGNyaXRp
Y2FsIHJlZ2lvbiBwYXRjaGluZyBsaXZlIGNvZGUsCiAgKiBmb3IgYW4gYXJjaGl0ZWN0dXJlIHRv
IHRha2UgbWFrZSBhcHByb3ByYXRpZSBnbG9iYWwgc3RhdGUgYWRqdXN0bWVudHMuCiAgKi8KK2lu
dCBhcmNoX2xpdmVwYXRjaF9zYWZldHlfY2hlY2sodm9pZCk7CiBpbnQgYXJjaF9saXZlcGF0Y2hf
cXVpZXNjZSh2b2lkKTsKIHZvaWQgYXJjaF9saXZlcGF0Y2hfcmV2aXZlKHZvaWQpOwogCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
