Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B01312FD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 14:31:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioSRN-0005lo-Fi; Mon, 06 Jan 2020 13:29:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioSRL-0005li-NI
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 13:29:03 +0000
X-Inumbo-ID: 80455483-3088-11ea-ab05-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80455483-3088-11ea-ab05-12813bfff9fa;
 Mon, 06 Jan 2020 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578317343;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=01oSMARpNQcg2T+tOdO47Ycni+oDCjg6CsSqWpukElM=;
 b=cP28wLZ9QKaMXi+Q3E/s2hLyOu/eqFicM5211qaiy6pBJmpkjylI8uz9
 25yV1ijgRu//O7IDRLaJdWFmMS0PEDX0oFDBLu6x5clelLE/UhsMNScly
 VoRagU4KDFrPbJVaRcNxNsR+wa5HGsq2cLRXbzVilmAkdpuCTl+K3shjB E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ndi8RPDQtGV0I0H7bNjNXctu+05f3q+L2Eh9rOMmL+/YHa3qRLdB8TgozLCRAwuILUPDhiN+75
 0lKv4SO35q2yz25QTMiJWnNoJ9ttcGp1pFqMJaEsOGG7lufkLP1IOwBXPWfRmYyOSUidHmtrrd
 b9bHEf5jz5X/jQdjzSNPKvOdYt10LCRdym0GKaPAaNw43JHEpW2VAC1XDALemgbP0v6CtbNC/Z
 rLpJK+MmNBe4eJDk1quZXIrp2WkMp5Wcl0VpvM60972uHtIbP3MlwIsDYvZZMrxYBTL5nC3DTU
 LIE=
X-SBRS: 2.7
X-MesageID: 10480170
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10480170"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 13:28:59 +0000
Message-ID: <20200106132859.25882-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Coverity: Improve model for {,
 un}map_domain_page()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZpcnN0IGF0dGVtcHQgcmVzdWx0ZWQgaW4gc2V2ZXJhbCAiRnJlZSBvZiBhZGRyZXNzLW9m
CmV4cHJlc3Npb24gKEJBRF9GUkVFKSIgaXNzdWVzLCBiZWNhdXNlIG9mIGNvZGUgd2hpY2ggcmVs
aWVzIG9uIHRoZSBmYWN0IHRoYXQKYW55IHBvaW50ZXIgaW4gdGhlIHNhbWUgcGFnZSBpcyBvayB0
byBwYXNzIHRvIHVubWFwX2RvbWFpbl9wYWdlKCkKCk1vZGVsIHRoaXMgcHJvcGVydHkgdG8gcmVt
b3ZlIHRoZSBpc3N1ZXMuCgpDb3Zlcml0eSBJRHM6IDExMzUzNTYgMTEzNTM2ezAsMX0gMTQwMTMw
MCAxNDE4MDl7MCwxfSAxNDM4ODY0ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxh
cEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVr
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkFzIHRoZSBvbmx5IHdheSBvZiB0ZXN0aW5nIGlzIHRv
IHVwbG9hZCBhIG5ldyBtb2RlbCwgdGhpcyBjaGFuZ2UgbWF0Y2hlcyB3aGF0CkkndmUgYWxyZWFk
eSBkb25lIGluIFNuYXBzaG90IDE4MjQzNS4KLS0tCiBtaXNjL2NvdmVyaXR5L21vZGVsLmMgfCAy
MiArKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9taXNjL2NvdmVyaXR5L21vZGVsLmMgYi9t
aXNjL2NvdmVyaXR5L21vZGVsLmMKaW5kZXggYmQ2MjU2NmEwZC4uMWVjM2ZlODY3MyAxMDA2NDQK
LS0tIGEvbWlzYy9jb3Zlcml0eS9tb2RlbC5jCisrKyBiL21pc2MvY292ZXJpdHkvbW9kZWwuYwpA
QCAtODIsMjEgKzgyLDMxIEBAIHZvaWQgeGZyZWUodm9pZCAqdmEpCiAgKiBhbGxvY2F0aW9uIG9m
IGV4YWN0bHkgMSBwYWdlLgogICoKICAqIG1hcF9kb21haW5fcGFnZSgpIG5ldmVyIGZhaWxzLiAo
SXQgd2lsbCBCVUcoKSBiZWZvcmUgcmV0dXJuaW5nIE5VTEwpCi0gKgotICogVE9ETzogd29yayBv
dXQgaG93IHRvIGNvcnJlY3RseSBtb2RlbCB0aGUgYmVoYXZpb3VyIHRoYXQgdGhpcyBmdW5jdGlv
biB3aWxsCi0gKiBvbmx5IGV2ZXIgcmV0dXJuIHBhZ2UgYWxpZ25lZCBwb2ludGVycy4KICAqLwog
dm9pZCAqbWFwX2RvbWFpbl9wYWdlKHVuc2lnbmVkIGxvbmcgbWZuKQogewotICAgIHJldHVybiBf
X2NvdmVyaXR5X2FsbG9jX18oUEFHRV9TSVpFKTsKKyAgICB1bnNpZ25lZCBsb25nIHB0ciA9ICh1
bnNpZ25lZCBsb25nKV9fY292ZXJpdHlfYWxsb2NfXyhQQUdFX1NJWkUpOworCisgICAgLyoKKyAg
ICAgKiBFeHByZXNzaW5nIHRoZSBhbGlnbm1lbnQgb2YgdGhlIG1lbW9yeSBhbGxvY2F0aW9uIGlz
bid0IHBvc3NpYmxlLiAgQXMgYQorICAgICAqIHN1YnN0aXR1dGUsIHRlbGwgQ292ZXJpdHkgdG8g
aWdub3JlIGFueSBwYXRoIHdoZXJlIHB0ciBpc24ndCBwYWdlCisgICAgICogYWxpZ25lZC4KKyAg
ICAgKi8KKyAgICBpZiAoIHB0ciAmIH5QQUdFX01BU0sgKQorICAgICAgICBfX2NvdmVyaXR5X3Bh
bmljX18oKTsKKworICAgIHJldHVybiAodm9pZCAqKXB0cjsKIH0KIAogLyoKLSAqIHVubWFwX2Rv
bWFpbl9wYWdlKCkgd2lsbCB1bm1hcCBhIHBhZ2UuICBNb2RlbCBpdCBhcyBhIGZyZWUoKS4KKyAq
IHVubWFwX2RvbWFpbl9wYWdlKCkgd2lsbCB1bm1hcCBhIHBhZ2UuICBNb2RlbCBpdCBhcyBhIGZy
ZWUoKS4gIEFueSAqdmEKKyAqIHdpdGhpbiB0aGUgcGFnZSBpcyB2YWxpZCB0byBwYXNzLgogICov
CiB2b2lkIHVubWFwX2RvbWFpbl9wYWdlKGNvbnN0IHZvaWQgKnZhKQogewotICAgIF9fY292ZXJp
dHlfZnJlZV9fKHZhKTsKKyAgICB1bnNpZ25lZCBsb25nIHB0ciA9ICh1bnNpZ25lZCBsb25nKXZh
ICYgUEFHRV9NQVNLOworCisgICAgX19jb3Zlcml0eV9mcmVlX18oKHZvaWQgKilwdHIpOwogfQog
CiAvKgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
