Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8C12A302
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:43:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijmIi-0003dH-AE; Tue, 24 Dec 2019 15:40:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijmIg-0003dC-MD
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:40:46 +0000
X-Inumbo-ID: bff69df4-2663-11ea-97ed-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bff69df4-2663-11ea-97ed-12813bfff9fa;
 Tue, 24 Dec 2019 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577202045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bXEprMdLnMAsSlQbR/hJu92Hzj+lCqsYWq7oAUAnzeg=;
 b=GyrKAEF2cOjfHBmltjjLj19+tKByqmdHZciP+jCWmwzZCjwWKDgwaiz8
 cuDJkGsiu7aVohtx86UnNu2ij9KNNmuPONKYFVzF1HaZLlk2JKK5qgjCU
 qYXOLCQuPuo59nrzq2VaDY2RqHAqy/N0WGbORdy5hX5CKvQgl6EQJ8LPg s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CpihqIqiA015DtGqXlIOkvsx3U9H9xe397esLnM46fieVEui9AKQgIi23rQIwaQmTniM9Dgh9e
 tMX0M8A7XM37DS3L0i9zbv0myV71ehWvhbLpKZXnyYfFSj6wyT3qrkANnWjWP1TdrYgV8DnmbT
 2yXCyA/e4KKcoOCJ5aXDv0Zx1mcaKMJXp0Fl+msrZkfmt6468rBT9lYHETMW/+hM0j3+A3jepW
 GmoJvq5EwpoUaWqYH9Hxu1b4IXcHdy0WZEfxh71U6Oc7hQwy7Ej07y+f7sQu/bcYDLKApntVsF
 3Po=
X-SBRS: 2.7
X-MesageID: 10541027
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10541027"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:30 +0000
Message-ID: <20191224151932.6304-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgdHdvIHJlY29yZHMgbW92ZSBibG9icyBmcm9tIHRoZSBYRU5fRE9NQ1RMX3tnZXQsc2V0
fV9jcHVfcG9saWN5Cmh5cGVyY2FsbC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5j
b20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgpDQzogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0
aGluZ3NsYWIuY29tPgotLS0KIGRvY3Mvc3BlY3MvbGlieGMtbWlncmF0aW9uLXN0cmVhbS5wYW5k
b2MgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4Yy94Y19z
cl9jb21tb24uYyAgICAgICAgICAgICAgIHwgIDIgKysKIHRvb2xzL2xpYnhjL3hjX3NyX3N0cmVh
bV9mb3JtYXQuaCAgICAgICAgfCAgMiArKwogdG9vbHMvcHl0aG9uL3hlbi9taWdyYXRpb24vbGli
eGMucHkgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL2xpYnhj
LW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9zcGVjcy9saWJ4Yy1taWdyYXRpb24tc3Ry
ZWFtLnBhbmRvYwppbmRleCAyMmZmMzA2ZTBiLi4zYTA5MTViNzk1IDEwMDY0NAotLS0gYS9kb2Nz
L3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jCisrKyBiL2RvY3Mvc3BlY3MvbGli
eGMtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKQEAgLTYzNCw2ICs2MzQsNDYgQEAgVGhlIGVuZCBy
ZWNvcmQgY29udGFpbnMgbm8gZmllbGRzOyBpdHMgYm9keV9sZW5ndGggaXMgMC4KIAogXGNsZWFy
cGFnZQogCitYODZfQ1BVSURfUE9MSUNZCistLS0tLS0tLS0tLS0tLS0tCisKK0NQVUlEIHBvbGlj
eSBjb250ZW50LCBhcyBhY2Nlc3NlZCBieSB0aGUgWEVOX0RPTUNUTF97Z2V0LHNldH1fY3B1X3Bv
bGljeQoraHlwZXJjYWxsIHN1Yi1vcHMuCisKKyAgICAgMCAgICAgMSAgICAgMiAgICAgMyAgICAg
NCAgICAgNSAgICAgNiAgICAgNyBvY3RldAorICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKworICAgIHwgQ1BVSURfcG9saWN5ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfAorICAgIC4uLgorICAgICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKworCistLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorRmllbGQg
ICAgICAgICAgICBEZXNjcmlwdGlvbgorLS0tLS0tLS0tLS0tICAgICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KK0NQVUlEX3BvbGljeSAgICAgQXJy
YXkgb2YgeGVuX2NwdWlkX2xlYWZfdFtdJ3MKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1xjbGVhcnBhZ2UKKwor
WDg2X01TUl9QT0xJQ1kKKy0tLS0tLS0tLS0tLS0tCisKK01TUiBwb2xpY3kgY29udGVudCwgYXMg
YWNjZXNzZWQgYnkgdGhlIFhFTl9ET01DVExfe2dldCxzZXR9X2NwdV9wb2xpY3kKK2h5cGVyY2Fs
bCBzdWItb3BzLgorCisgICAgIDAgICAgIDEgICAgIDIgICAgIDMgICAgIDQgICAgIDUgICAgIDYg
ICAgIDcgb2N0ZXQKKyAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsKKyAgICB8IE1TUl9wb2xpY3kgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKKyAgICAuLi4KKyAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsKKworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KK0ZpZWxkICAgICAgICAgICAgRGVz
Y3JpcHRpb24KKy0tLS0tLS0tLS0gICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCitNU1JfcG9saWN5ICAgICAgIEFycmF5IG9mIHhlbl9tc3Jf
ZW50cnlfdFtdJ3MKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1xjbGVhcnBhZ2UKKwogCiBMYXlvdXQKID09PT09
PQpAQCAtNjU2LDYgKzY5Niw3IEBAIEEgdHlwaWNhbCBzYXZlIHJlY29yZCBmb3IgYW4geDg2IFBW
IGd1ZXN0IGltYWdlIHdvdWxkIGxvb2sgbGlrZToKICogRG9tYWluIGhlYWRlcgogKiBTdGF0aWMg
ZGF0YSByZWNvcmRzOgogICAgICogWDg2X1BWX0lORk8gcmVjb3JkCisgICAgKiBYODZfe0NQVUlE
LE1TUn1fUE9MSUNZCiAgICAgKiBTVEFUSUNfREFUQV9FTkQKICogWDg2X1BWX1AyTV9GUkFNRVMg
cmVjb3JkCiAqIE1hbnkgUEFHRV9EQVRBIHJlY29yZHMKQEAgLTY4NSw2ICs3MjYsNyBAQCBBIHR5
cGljYWwgc2F2ZSByZWNvcmQgZm9yIGFuIHg4NiBIVk0gZ3Vlc3QgaW1hZ2Ugd291bGQgbG9vayBs
aWtlOgogKiBJbWFnZSBoZWFkZXIKICogRG9tYWluIGhlYWRlcgogKiBTdGF0aWMgZGF0YSByZWNv
cmRzOgorICAgICogWDg2X3tDUFVJRCxNU1J9X1BPTElDWQogICAgICogU1RBVElDX0RBVEFfRU5E
CiAqIE1hbnkgUEFHRV9EQVRBIHJlY29yZHMKICogWDg2X1RTQ19JTkZPCmRpZmYgLS1naXQgYS90
b29scy9saWJ4Yy94Y19zcl9jb21tb24uYyBiL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbi5jCmlu
ZGV4IDdmMjJjZjAzNjUuLjdjNTRiMDM0MTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3Ny
X2NvbW1vbi5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbi5jCkBAIC0zNyw2ICszNyw4
IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBtYW5kYXRvcnlfcmVjX3R5cGVzW10gPQogICAg
IFtSRUNfVFlQRV9DSEVDS1BPSU5UXSAgICAgICAgICAgICAgICAgICA9ICJDaGVja3BvaW50IiwK
ICAgICBbUkVDX1RZUEVfQ0hFQ0tQT0lOVF9ESVJUWV9QRk5fTElTVF0gICAgPSAiQ2hlY2twb2lu
dCBkaXJ0eSBwZm4gbGlzdCIsCiAgICAgW1JFQ19UWVBFX1NUQVRJQ19EQVRBX0VORF0gICAgICAg
ICAgICAgID0gIlN0YXRpYyBkYXRhIGVuZCIsCisgICAgW1JFQ19UWVBFX1g4Nl9DUFVJRF9QT0xJ
Q1ldICAgICAgICAgICAgID0gIng4NiBDUFVJRCBwb2xpY3kiLAorICAgIFtSRUNfVFlQRV9YODZf
TVNSX1BPTElDWV0gICAgICAgICAgICAgICA9ICJ4ODYgTVNSIHBvbGljeSIsCiB9OwogCiBjb25z
dCBjaGFyICpyZWNfdHlwZV90b19zdHIodWludDMyX3QgdHlwZSkKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhjL3hjX3NyX3N0cmVhbV9mb3JtYXQuaCBiL3Rvb2xzL2xpYnhjL3hjX3NyX3N0cmVhbV9m
b3JtYXQuaAppbmRleCA4MWM5NzY1YjBhLi44YTBkYTI2Zjc1IDEwMDY0NAotLS0gYS90b29scy9s
aWJ4Yy94Y19zcl9zdHJlYW1fZm9ybWF0LmgKKysrIGIvdG9vbHMvbGlieGMveGNfc3Jfc3RyZWFt
X2Zvcm1hdC5oCkBAIC03NCw2ICs3NCw4IEBAIHN0cnVjdCB4Y19zcl9yaGRyCiAjZGVmaW5lIFJF
Q19UWVBFX0NIRUNLUE9JTlQgICAgICAgICAgICAgICAgIDB4MDAwMDAwMGVVCiAjZGVmaW5lIFJF
Q19UWVBFX0NIRUNLUE9JTlRfRElSVFlfUEZOX0xJU1QgIDB4MDAwMDAwMGZVCiAjZGVmaW5lIFJF
Q19UWVBFX1NUQVRJQ19EQVRBX0VORCAgICAgICAgICAgIDB4MDAwMDAwMTBVCisjZGVmaW5lIFJF
Q19UWVBFX1g4Nl9DUFVJRF9QT0xJQ1kgICAgICAgICAgIDB4MDAwMDAwMTFVCisjZGVmaW5lIFJF
Q19UWVBFX1g4Nl9NU1JfUE9MSUNZICAgICAgICAgICAgIDB4MDAwMDAwMTJVCiAKICNkZWZpbmUg
UkVDX1RZUEVfT1BUSU9OQUwgICAgICAgICAgICAgMHg4MDAwMDAwMFUKIApkaWZmIC0tZ2l0IGEv
dG9vbHMvcHl0aG9uL3hlbi9taWdyYXRpb24vbGlieGMucHkgYi90b29scy9weXRob24veGVuL21p
Z3JhdGlvbi9saWJ4Yy5weQppbmRleCA1ZmI1MWI1NmFjLi45ODgxZjVjZWQ0IDEwMDY0NAotLS0g
YS90b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4Yy5weQorKysgYi90b29scy9weXRob24v
eGVuL21pZ3JhdGlvbi9saWJ4Yy5weQpAQCAtNTcsNiArNTcsOCBAQAogUkVDX1RZUEVfY2hlY2tw
b2ludCAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDBlCiBSRUNfVFlQRV9jaGVja3BvaW50X2Rp
cnR5X3Bmbl9saXN0ICA9IDB4MDAwMDAwMGYKIFJFQ19UWVBFX3N0YXRpY19kYXRhX2VuZCAgICAg
ICAgICAgID0gMHgwMDAwMDAxMAorUkVDX1RZUEVfeDg2X2NwdWlkX3BvbGljeSAgICAgICAgICAg
PSAweDAwMDAwMDExCitSRUNfVFlQRV94ODZfbXNyX3BvbGljeSAgICAgICAgICAgICA9IDB4MDAw
MDAwMTIKIAogcmVjX3R5cGVfdG9fc3RyID0gewogICAgIFJFQ19UWVBFX2VuZCAgICAgICAgICAg
ICAgICAgICAgICAgIDogIkVuZCIsCkBAIC03Niw2ICs3OCw4IEBACiAgICAgUkVDX1RZUEVfY2hl
Y2twb2ludCAgICAgICAgICAgICAgICAgOiAiQ2hlY2twb2ludCIsCiAgICAgUkVDX1RZUEVfY2hl
Y2twb2ludF9kaXJ0eV9wZm5fbGlzdCAgOiAiQ2hlY2twb2ludCBkaXJ0eSBwZm4gbGlzdCIsCiAg
ICAgUkVDX1RZUEVfc3RhdGljX2RhdGFfZW5kICAgICAgICAgICAgOiAiU3RhdGljIGRhdGEgZW5k
IiwKKyAgICBSRUNfVFlQRV94ODZfY3B1aWRfcG9saWN5ICAgICAgICAgICA6ICJ4ODYgQ1BVSUQg
cG9saWN5IiwKKyAgICBSRUNfVFlQRV94ODZfbXNyX3BvbGljeSAgICAgICAgICAgICA6ICJ4ODYg
TVNSIHBvbGljeSIsCiB9CiAKICMgcGFnZV9kYXRhCkBAIC0xMTMsNiArMTE3LDEyIEBACiBIVk1f
UEFSQU1TX0VOVFJZX0ZPUk1BVCAgID0gIlFRIgogSFZNX1BBUkFNU19GT1JNQVQgICAgICAgICA9
ICJJSSIKIAorIyB4ODZfY3B1aWRfcG9saWN5ID0+IHhlbl9jcHVpZF9sZWFmX3RbXQorWDg2X0NQ
VUlEX1BPTElDWV9GT1JNQVQgICA9ICJJSUlJSUkiCisKKyMgeDg2X21zcl9wb2xpY3kgPT4geGVu
X21zcl9lbnRyeV90W10KK1g4Nl9NU1JfUE9MSUNZX0ZPUk1BVCAgICAgPSAiUUlJIgorCiBjbGFz
cyBWZXJpZnlMaWJ4YyhWZXJpZnlCYXNlKToKICAgICAiIiIgVmVyaWZ5IGEgTGlieGMgdjIgKG9y
IGxhdGVyKSBzdHJlYW0gIiIiCiAKQEAgLTQzOSw2ICs0NDksMzQgQEAgZGVmIHZlcmlmeV9yZWNv
cmRfc3RhdGljX2RhdGFfZW5kKHNlbGYsIGNvbnRlbnQpOgogICAgICAgICAgICAgcmFpc2UgUmVj
b3JkRXJyb3IoIlN0YXRpYyBkYXRhIGVuZCByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKIAog
CisgICAgZGVmIHZlcmlmeV9yZWNvcmRfeDg2X2NwdWlkX3BvbGljeShzZWxmLCBjb250ZW50KToK
KyAgICAgICAgIiIiIHg4NiBDUFVJRCBwb2xpY3kgcmVjb3JkICIiIgorCisgICAgICAgIGlmIHNl
bGYudmVyc2lvbiA8IDM6CisgICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigieDg2IENQVUlE
IHBvbGljeSByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKKworICAgICAgICBzeiA9IGNhbGNz
aXplKFg4Nl9DUFVJRF9QT0xJQ1lfRk9STUFUKQorICAgICAgICBjb250ZW50c3ogPSBsZW4oY29u
dGVudCkKKworICAgICAgICBpZiBjb250ZW50c3ogPCBzeiBvciAoY29udGVudHN6ICUgc3opICE9
IDA6CisgICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiUmVjb3JkIGxlbmd0aCAldSwgZXhw
ZWN0ZWQgbXVsdGlwbGUgb2YgJXUiICUKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChj
b250ZW50c3osIHN6KSkKKworCisgICAgZGVmIHZlcmlmeV9yZWNvcmRfeDg2X21zcl9wb2xpY3ko
c2VsZiwgY29udGVudCk6CisgICAgICAgICIiIiB4ODYgTVNSIHBvbGljeSByZWNvcmQgIiIiCisK
KyAgICAgICAgaWYgc2VsZi52ZXJzaW9uIDwgMzoKKyAgICAgICAgICAgIHJhaXNlIFJlY29yZEVy
cm9yKCJ4ODYgTVNSIHBvbGljeSByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKKworICAgICAg
ICBzeiA9IGNhbGNzaXplKFg4Nl9NU1JfUE9MSUNZX0ZPUk1BVCkKKyAgICAgICAgY29udGVudHN6
ID0gbGVuKGNvbnRlbnQpCisKKyAgICAgICAgaWYgY29udGVudHN6IDwgc3ogb3IgKGNvbnRlbnRz
eiAlIHN6KSAhPSAwOgorICAgICAgICAgICAgcmFpc2UgUmVjb3JkRXJyb3IoIlJlY29yZCBsZW5n
dGggJXUsIGV4cGVjdGVkIG11bHRpcGxlIG9mICV1IiAlCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoY29udGVudHN6LCBzeikpCisKKwogcmVjb3JkX3ZlcmlmaWVycyA9IHsKICAgICBS
RUNfVFlQRV9lbmQ6CiAgICAgICAgIFZlcmlmeUxpYnhjLnZlcmlmeV9yZWNvcmRfZW5kLApAQCAt
NDgzLDQgKzUyMSw5IEBAIGRlZiB2ZXJpZnlfcmVjb3JkX3N0YXRpY19kYXRhX2VuZChzZWxmLCBj
b250ZW50KToKIAogICAgIFJFQ19UWVBFX3N0YXRpY19kYXRhX2VuZDoKICAgICAgICAgVmVyaWZ5
TGlieGMudmVyaWZ5X3JlY29yZF9zdGF0aWNfZGF0YV9lbmQsCisKKyAgICBSRUNfVFlQRV94ODZf
Y3B1aWRfcG9saWN5OgorICAgICAgICBWZXJpZnlMaWJ4Yy52ZXJpZnlfcmVjb3JkX3g4Nl9jcHVp
ZF9wb2xpY3ksCisgICAgUkVDX1RZUEVfeDg2X21zcl9wb2xpY3k6CisgICAgICAgIFZlcmlmeUxp
YnhjLnZlcmlmeV9yZWNvcmRfeDg2X21zcl9wb2xpY3ksCiAgICAgfQotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
