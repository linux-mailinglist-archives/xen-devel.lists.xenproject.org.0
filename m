Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A114A649
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:37:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5Ti-0001Z7-GC; Mon, 27 Jan 2020 14:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5Th-0001Yj-Ql
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:35:01 +0000
X-Inumbo-ID: 2dfb9f2a-4112-11ea-855c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dfb9f2a-4112-11ea-855c-12813bfff9fa;
 Mon, 27 Jan 2020 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JByyWBMzNurByECMS+gx972j/F2ryr/mglT8o9Zi7Sk=;
 b=Q1BcAbqbkDQiX6M3VudAGduva48BAbtkqwJAKdGSgxbMXaMZ7AULERvn
 xBi1a8PnYJIEgz1pWdlyO2EM9WXcgUUroulgsUfHOLY2uNnhUjoH5Zgwr
 6lUY0HEC+6cxZxgaJ5iDPhygA5BJundHAUAjwYkxeEAxQHSbLU2YDz8W+ Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RxV/sk+Mll9oa8Dz0Ubef1VcJsEsH8wLBucBWs7mg+aYr4NLE/08kIcY+XWXCJrO+XbJIrxqIR
 K75hS75gzMh2KsA5T1Iic8ZooABpsFibXyf3BHT0bV+RTIPZZVobZ0UuPAR8YmrKRbqviaYnhb
 b87nszGB/MYYg3cP+XI2VACwOJDNUJo7vUm5Phzot4+dIAlOtAo2p5a2R2XaJ++w3/xvrHJCSa
 NgpKL+TMoQwh8I0ysGm91cQfkXobu6PBPD7CKnGYQ2WJS79BwmOzGCUDdDr7uEeYOO+T0DC357
 cZY=
X-SBRS: 2.7
X-MesageID: 11664977
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11664977"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:33 +0000
Message-ID: <20200127143444.25538-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/17] libxc/restore: Support v3 streams and
 handle STATIC_DATA_END
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
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlnaGVyIGxldmVsIHRvb2xzdGFja3MgbWF5IHdpc2ggdG8ga25vdyB3aGVuIHRoZSBzdGF0aWMg
ZGF0YSBpcyBjb21wbGV0ZSwgc28KaW50cm9kdWNlIGEgcmVzdG9yZV9jYWxsYmFjayBmb3IgdGhl
IHB1cnBvc2UuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKdjI6CiAqIFNw
bGl0L3JlYXJyYW5nZWQgZnJvbSB2MQotLS0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuZ3Vlc3Qu
aCB8ICAzICsrKwogdG9vbHMvbGlieGMveGNfc3JfY29tbW9uLmggICAgIHwgIDMgKysrCiB0b29s
cy9saWJ4Yy94Y19zcl9yZXN0b3JlLmMgICAgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysr
KystLQogMyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuZ3Vlc3QuaCBiL3Rvb2xzL2xpYnhj
L2luY2x1ZGUveGVuZ3Vlc3QuaAppbmRleCAxOWQ4MjhhN2YyLi5lZmQ5MGIwZDQyIDEwMDY0NAot
LS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmd1ZXN0LmgKKysrIGIvdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5ndWVzdC5oCkBAIC0xMzksNiArMTM5LDkgQEAgaW50IHhjX2RvbWFpbl9zYXZlKHhj
X2ludGVyZmFjZSAqeGNoLCBpbnQgaW9fZmQsIHVpbnQzMl90IGRvbSwKIAogLyogY2FsbGJhY2tz
IHByb3ZpZGVkIGJ5IHhjX2RvbWFpbl9yZXN0b3JlICovCiBzdHJ1Y3QgcmVzdG9yZV9jYWxsYmFj
a3MgeworICAgIC8qIENhbGxlZCBvbmNlIHRoZSBTVEFUSUNfREFUQV9FTkQgcmVjb3JkIGhhcyBi
ZWVuIHJlY2VpdmVkLiAqLworICAgIGludCAoKnN0YXRpY19kYXRhX2RvbmUpKHZvaWQgKmRhdGEp
OworCiAgICAgLyogQ2FsbGVkIGFmdGVyIGEgbmV3IGNoZWNrcG9pbnQgdG8gc3VzcGVuZCB0aGUg
Z3Vlc3QuICovCiAgICAgaW50ICgqc3VzcGVuZCkodm9pZCAqZGF0YSk7CiAKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbi5oIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uLmgK
aW5kZXggNWRkNTFjY2IxNS4uYWUwYWI3MGY3NiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNf
c3JfY29tbW9uLmgKKysrIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uLmgKQEAgLTI1Myw2ICsy
NTMsOSBAQCBzdHJ1Y3QgeGNfc3JfY29udGV4dAogICAgICAgICAgICAgLyogQ3VycmVudGx5IGJ1
ZmZlcmluZyByZWNvcmRzIGJldHdlZW4gYSBjaGVja3BvaW50ICovCiAgICAgICAgICAgICBib29s
IGJ1ZmZlcl9hbGxfcmVjb3JkczsKIAorICAgICAgICAgICAgLyogV2hldGhlciBhIFNUQVRJQ19E
QVRBX0VORCByZWNvcmQgaGFzIGJlZW4gc2Vlbi4gKi8KKyAgICAgICAgICAgIGJvb2wgc2Vlbl9z
dGF0aWNfZGF0YV9lbmQ7CisKIC8qCiAgKiBXaXRoIFJlbXVzL0NPTE8sIHdlIGJ1ZmZlciB0aGUg
cmVjb3JkcyBzZW50IGJ5IHRoZSBwcmltYXJ5IGF0IGNoZWNrcG9pbnQsCiAgKiBpbiBjYXNlIHRo
ZSBwcmltYXJ5IHdpbGwgZmFpbCwgd2UgY2FuIHJlY292ZXIgZnJvbSB0aGUgbGFzdApkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZS5jIGIvdG9vbHMvbGlieGMveGNfc3JfcmVz
dG9yZS5jCmluZGV4IGRjMmZmY2Y4NTUuLjljOTI0Mzg3YWUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhjL3hjX3NyX3Jlc3RvcmUuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlLmMKQEAg
LTM1LDkgKzM1LDkgQEAgc3RhdGljIGludCByZWFkX2hlYWRlcnMoc3RydWN0IHhjX3NyX2NvbnRl
eHQgKmN0eCkKICAgICAgICAgcmV0dXJuIC0xOwogICAgIH0KIAotICAgIGlmICggaWhkci52ZXJz
aW9uICE9IDIgKQorICAgIGlmICggaWhkci52ZXJzaW9uIDwgMiB8fCBpaGRyLnZlcnNpb24gPiAz
ICkKICAgICB7Ci0gICAgICAgIEVSUk9SKCJJbnZhbGlkIFZlcnNpb246IEV4cGVjdGVkIDIsIEdv
dCAlZCIsCisgICAgICAgIEVSUk9SKCJJbnZhbGlkIFZlcnNpb246IEV4cGVjdGVkIDIgPD0gdmVy
IDw9IDMsIEdvdCAlZCIsCiAgICAgICAgICAgICAgIGloZHIudmVyc2lvbik7CiAgICAgICAgIHJl
dHVybiAtMTsKICAgICB9CkBAIC02MzEsNiArNjMxLDI3IEBAIHN0YXRpYyBpbnQgYnVmZmVyX3Jl
Y29yZChzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMp
CiAgICAgcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxlX3N0YXRpY19kYXRhX2VuZChz
dHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQoreworICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4
LT54Y2g7CisgICAgaW50IHJjID0gMDsKKworICAgIGlmICggY3R4LT5yZXN0b3JlLnNlZW5fc3Rh
dGljX2RhdGFfZW5kICkKKyAgICB7CisgICAgICAgIEVSUk9SKCJNdWx0aXBsZSBTVEFUSUNfREFU
QV9FTkQgcmVjb3JkcyBmb3VuZCIpOworICAgICAgICByZXR1cm4gLTE7CisgICAgfQorCisgICAg
Y3R4LT5yZXN0b3JlLnNlZW5fc3RhdGljX2RhdGFfZW5kID0gdHJ1ZTsKKworICAgIGlmICggY3R4
LT5yZXN0b3JlLmNhbGxiYWNrcy0+c3RhdGljX2RhdGFfZG9uZSAmJgorICAgICAgICAgKHJjID0g
Y3R4LT5yZXN0b3JlLmNhbGxiYWNrcy0+c3RhdGljX2RhdGFfZG9uZSgKKyAgICAgICAgICAgICBj
dHgtPnJlc3RvcmUuY2FsbGJhY2tzLT5kYXRhKSAhPSAwKSApCisgICAgICAgIEVSUk9SKCJzdGF0
aWNfZGF0YV9kb25lKCkgY2FsbGJhY2sgZmFpbGVkOiAlZFxuIiwgcmMpOworCisgICAgcmV0dXJu
IHJjOworfQorCiBzdGF0aWMgaW50IHByb2Nlc3NfcmVjb3JkKHN0cnVjdCB4Y19zcl9jb250ZXh0
ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYykKIHsKICAgICB4Y19pbnRlcmZhY2UgKnhj
aCA9IGN0eC0+eGNoOwpAQCAtNjU0LDYgKzY3NSwxMCBAQCBzdGF0aWMgaW50IHByb2Nlc3NfcmVj
b3JkKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYykK
ICAgICAgICAgcmMgPSBoYW5kbGVfY2hlY2twb2ludChjdHgpOwogICAgICAgICBicmVhazsKIAor
ICAgIGNhc2UgUkVDX1RZUEVfU1RBVElDX0RBVEFfRU5EOgorICAgICAgICByYyA9IGhhbmRsZV9z
dGF0aWNfZGF0YV9lbmQoY3R4KTsKKyAgICAgICAgYnJlYWs7CisKICAgICBkZWZhdWx0OgogICAg
ICAgICByYyA9IGN0eC0+cmVzdG9yZS5vcHMucHJvY2Vzc19yZWNvcmQoY3R4LCByZWMpOwogICAg
ICAgICBicmVhazsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
