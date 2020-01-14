Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ADA13A98A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 13:42:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLTr-0006gV-0H; Tue, 14 Jan 2020 12:39:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZ5I=3D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irLTp-0006gQ-BY
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 12:39:33 +0000
X-Inumbo-ID: e4fc9636-36ca-11ea-b89f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4fc9636-36ca-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579005565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gD0VJ/AMt/FL6VY0z7xElKd25n1D31WdyumHlcJzEX4=;
 b=TnoR10TUbWaFZyQwOUKdh3py72eQQH6yZMuJuHfsyfwar158FBRos+tv
 /f8JqyVJ1ejbsEKb7q1b4KXdMvkO0b1GqJJtAP1snj6rRkbsN1LdCUBHW
 yVtSNGwMTWAi/56+E/oeaOKfQ5BQSA64Jm/BCwx4ZPijc6dF//bo3/PKw 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cE4m9k/zPM5WJf3mhiYs7V1vIfbJXRIS7hzsdgCr8lZX/XKvdSjYcibgbMtwpOHij8q6QMMv5h
 Phy1Q0YuRyNt/1HJqDoi1KDg7yth+x5jI2skMdnhcP07PVJkCDWH4WwOppzFTmYqygsnnBbj6p
 txLmaemHrCAOrsb+tQTclaW+5Vx2ayqiIX798WUoixpIVdMJZxc7DdhV7X8CHoEK6gRTqy270y
 OPdTsxVyGgIZVDLMHynuoOrdtRKDo1QAdH3zQoJjg0CDFPHH2a39OgTmhedQs/cBR0kfacKdYV
 NAc=
X-SBRS: 2.7
X-MesageID: 10897368
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,432,1571716800"; d="scan'208";a="10897368"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 14 Jan 2020 12:39:21 +0000
Message-ID: <20200114123921.30850-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libxc: Construct 32bit PV guests with L3
 A/D bits set
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCB0aGUgMzIgUEFFIGJ1aWxkIG9mIFhlbiBnb25lLCAzMmJpdCBQViBndWVzdHMnIHRvcCBs
ZXZlbCBwYWdldGFibGVzIG5vCmxvbmdlciBiZWhhdmUgZXhhY3RseSBsaWtlIFBBRSBpbiBoYXJk
d2FyZS4KClRoZXkgc2hvdWxkIGhhdmUgQS9EIGJpdHMgc2V0LCBmb3IgdGhlIHNhbWUgcGVyZm9y
bWFuY2UgcmVhc29ucyBhcyBhcHBseSB0bwpvdGhlciBsZXZlbHMuICBUaGlzIGJyaW5ncyB0aGUg
ZG9tYWluIGJ1aWxkZXIgaW4gbGluZSB3aXRoIGhvdyBYZW4gY29uc3RydWN0cwphIDMyYml0IGRv
bTAuCgpBcyBhIHB1cmVseSBjb2RlIGltcHJvdmVtZW50LCBtYWtlIHVzZSBvZiByYW5nZSBub3Rh
dGlvbiB0byBpbml0aWFsaXNlCmlkZW50aWNhbCB2YWx1ZXMgaW4gYWRqYWNlbnQgYXJyYXkgZWxl
bWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgoKSXQgdHVybnMgb3V0
IHRoYXQgbmVpdGhlciBYZW4gbm9yIGxpYnhjIHNldHMgZGlydHkgYml0cyBvbiBMMSBwYWdldGFi
bGVzLCBidXQKSSBjYW4ndCBzcG90IGFueSBkb2N1bWVudGVkIHJlYXNvbiBmb3IgdGhpcy4gIE15
IGJlc3QgZ3Vlc3MgaXMgdG8gYXZvaWQgaGF2aW5nCkQvUk8gbWFwcGluZ3Mgb2YgcGFnZXRhYmxl
cywgYnV0IHRoaXMgaXNuJ3QgZ29pbmcgdG8gdHJpcCB1cCBhIFBWIGd1ZXN0IHRvCmJlZ2luIHdp
dGguICBUaG91Z2h0cyBvbiByZWR1Y2luZyB0aGUgcGVyZm9ybWFuY2UgY29zdCB0aGVyZSBhcyB3
ZWxsPwotLS0KIHRvb2xzL2xpYnhjL3hjX2RvbV94ODYuYyB8IDkgKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX2RvbV94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYwppbmRleCAx
ODk3ZGVjZWRiLi40MjViMTI5MTQ2IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19kb21feDg2
LmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jCkBAIC0yNzcsOCArMjc3LDggQEAgc3Rh
dGljIGludCBhbGxvY19wZ3RhYmxlc194ODZfMzJfcGFlKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRv
bSkKICAgICAgICAgLmxldmVscyA9IFBHVEJMX0xFVkVMU19JMzg2LAogICAgICAgICAudmFkZHJf
bWFzayA9IGJpdHNfdG9fbWFzayhWSVJUX0JJVFNfSTM4NiksCiAgICAgICAgIC5sdmxfcHJvdFsw
XSA9IF9QQUdFX1BSRVNFTlR8X1BBR0VfUld8X1BBR0VfQUNDRVNTRUQsCi0gICAgICAgIC5sdmxf
cHJvdFsxXSA9IF9QQUdFX1BSRVNFTlR8X1BBR0VfUld8X1BBR0VfQUNDRVNTRUR8X1BBR0VfRElS
VFl8X1BBR0VfVVNFUiwKLSAgICAgICAgLmx2bF9wcm90WzJdID0gX1BBR0VfUFJFU0VOVCwKKyAg
ICAgICAgLmx2bF9wcm90WzEgLi4uIDJdID0KKyAgICAgICAgICAgIF9QQUdFX1BSRVNFTlR8X1BB
R0VfUld8X1BBR0VfQUNDRVNTRUR8X1BBR0VfRElSVFl8X1BBR0VfVVNFUiwKICAgICB9OwogICAg
IHN0cnVjdCB4Y19kb21faW1hZ2VfeDg2ICpkb214ODYgPSBkb20tPmFyY2hfcHJpdmF0ZTsKIApA
QCAtNDg4LDkgKzQ4OCw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfcGd0YWJsZXNfeDg2XzY0KHN0cnVj
dCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICAgICAgLmxldmVscyA9IFBHVEJMX0xFVkVMU19YODZf
NjQsCiAgICAgICAgIC52YWRkcl9tYXNrID0gYml0c190b19tYXNrKFZJUlRfQklUU19YODZfNjQp
LAogICAgICAgICAubHZsX3Byb3RbMF0gPSBfUEFHRV9QUkVTRU5UfF9QQUdFX1JXfF9QQUdFX0FD
Q0VTU0VELAotICAgICAgICAubHZsX3Byb3RbMV0gPSBfUEFHRV9QUkVTRU5UfF9QQUdFX1JXfF9Q
QUdFX0FDQ0VTU0VEfF9QQUdFX0RJUlRZfF9QQUdFX1VTRVIsCi0gICAgICAgIC5sdmxfcHJvdFsy
XSA9IF9QQUdFX1BSRVNFTlR8X1BBR0VfUld8X1BBR0VfQUNDRVNTRUR8X1BBR0VfRElSVFl8X1BB
R0VfVVNFUiwKLSAgICAgICAgLmx2bF9wcm90WzNdID0gX1BBR0VfUFJFU0VOVHxfUEFHRV9SV3xf
UEFHRV9BQ0NFU1NFRHxfUEFHRV9ESVJUWXxfUEFHRV9VU0VSLAorICAgICAgICAubHZsX3Byb3Rb
MSAuLi4gM10gPQorICAgICAgICAgICAgX1BBR0VfUFJFU0VOVHxfUEFHRV9SV3xfUEFHRV9BQ0NF
U1NFRHxfUEFHRV9ESVJUWXxfUEFHRV9VU0VSLAogICAgIH07CiAgICAgc3RydWN0IHhjX2RvbV9p
bWFnZV94ODYgKmRvbXg4NiA9IGRvbS0+YXJjaF9wcml2YXRlOwogCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
