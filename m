Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F835159261
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 15:58:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Wws-0003va-Dq; Tue, 11 Feb 2020 14:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1Wwr-0003vQ-2v
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 14:55:37 +0000
X-Inumbo-ID: 8e77c915-4cde-11ea-b5b7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e77c915-4cde-11ea-b5b7-12813bfff9fa;
 Tue, 11 Feb 2020 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581432936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5lOEChwSSUJucPQfj4x6xluW+gXhKNGScDrNhE+2n+o=;
 b=MMZwLBPrr1xdZs0PUq2GtWYcyWSaW2JTyCmMsN4Q5ORn8rWhK2cNvHxN
 456+6Gdsd9AZPOC4aV5fgvuK0dn8T7r/gmsWy97HCLwhPTGjrYI1t/gAQ
 F1Af5zMMgpiWfDNmB+RBvOexJBfbcYTo+MavsdtqVPPkGoLlguGWs6z31 w=;
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
IronPort-SDR: pWddnAwGx8wvnUgPeylGanxzQUG1pnLcWrcNxKb1BGSAvUwa1jVMqhPPiHbf8lYORK2lIVCep3
 LshUqVwoJ4p3Y80rEDO68BTm+ZRXg5g4Vf0sW4sxGyudFOSrEs/jL4ZNC4IebMlAZQVhhH+3oi
 VjBOhVPEM4s5hqT8XBeU2rws4uIyTHt8zfzauub3bD4VRWS6NGIdFPbA4/zwa5lERo8CGoSrkW
 NGjRJhSti6fRqyzCa2fvuahVS2V89VFfzu3st4c8yQW+tovqw1vDJwLWXWS2atXUn7DaL59coF
 mak=
X-SBRS: 2.7
X-MesageID: 12267470
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12267470"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 11 Feb 2020 14:55:26 +0000
Message-ID: <20200211145526.8371-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] AMD/IOMMU: Remove unused iommu_get_addr_{lo,
 hi}_from_cmd() helpers
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

VGhlc2Ugd2VyZSBpbnRyb2R1Y2VkIGluIDI2MmJiMjI3YTQgaW4gMjAxMiwgYW5kIGhhdmUgbmV2
ZXIgaGFkIGFueSB1c2Vycy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS1kZWZz
LmggfCAgNSAtLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmggICAgICB8
IDEzIC0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LWRlZnMuaCBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS1kZWZzLmgKaW5kZXggNTA2MTNjYTE1MC4uNWVi
N2ZjN2ZmYiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LWRl
ZnMuaAorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5oCkBAIC00
ODUsMTEgKzQ4NSw2IEBAIHN0cnVjdCBhbWRfaW9tbXVfcHRlIHsKICNkZWZpbmUgSU9NTVVfQ01E
X0RFVklDRV9JRF9NQVNLICAgICAgICAgICAgICAgICAgICAweDAwMDBGRkZGCiAjZGVmaW5lIElP
TU1VX0NNRF9ERVZJQ0VfSURfU0hJRlQgICAgICAgICAgICAgICAgICAgMAogCi0jZGVmaW5lIElP
TU1VX0NNRF9BRERSX0xPV19NQVNLICAgICAgICAgICAgICAgICAgICAgMHhGRkZGRjAwMAotI2Rl
ZmluZSBJT01NVV9DTURfQUREUl9MT1dfU0hJRlQgICAgICAgICAgICAgICAgICAgIDEyCi0jZGVm
aW5lIElPTU1VX0NNRF9BRERSX0hJR0hfTUFTSyAgICAgICAgICAgICAgICAgICAgMHhGRkZGRkZG
RgotI2RlZmluZSBJT01NVV9DTURfQUREUl9ISUdIX1NISUZUICAgICAgICAgICAgICAgICAgIDAK
LQogI2RlZmluZSBJT01NVV9SRUdfQkFTRV9BRERSX0xPV19NQVNLICAgICAgICAgICAgICAgIDB4
RkZGRkYwMDAKICNkZWZpbmUgSU9NTVVfUkVHX0JBU0VfQUREUl9MT1dfU0hJRlQgICAgICAgICAg
ICAgICAxMgogI2RlZmluZSBJT01NVV9SRUdfQkFTRV9BRERSX0hJR0hfTUFTSyAgICAgICAgICAg
ICAgIDB4MDAwRkZGRkYKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdS5oIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmgKaW5kZXggMWFiZmRj
Njg1YS4uMjI5N2FjOGU3MyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11LmgKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmgKQEAgLTM5
MSwxOSArMzkxLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGlvbW11X3NldF9kZXZpZF90b19jbWQo
dWludDMyX3QgKmNtZCwgdWludDE2X3QgaWQpCiAgICAgICAgICAgICAgICAgICAgICAgICAgSU9N
TVVfQ01EX0RFVklDRV9JRF9TSElGVCwgY21kKTsKIH0KIAotLyogYWNjZXNzIGFkZHJlc3MgZmll
bGQgZnJvbSBpb21tdSBjbWQgKi8KLXN0YXRpYyBpbmxpbmUgdWludDMyX3QgaW9tbXVfZ2V0X2Fk
ZHJfbG9fZnJvbV9jbWQodWludDMyX3QgY21kKQotewotICAgIHJldHVybiBnZXRfZmllbGRfZnJv
bV9yZWdfdTMyKGNtZCwgSU9NTVVfQ01EX0FERFJfTE9XX01BU0ssCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU9NTVVfQ01EX0FERFJfTE9XX1NISUZUKTsKLX0KLQotc3RhdGlj
IGlubGluZSB1aW50MzJfdCBpb21tdV9nZXRfYWRkcl9oaV9mcm9tX2NtZCh1aW50MzJfdCBjbWQp
Ci17Ci0gICAgcmV0dXJuIGdldF9maWVsZF9mcm9tX3JlZ191MzIoY21kLCBJT01NVV9DTURfQURE
Ul9MT1dfTUFTSywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9DTURf
QUREUl9ISUdIX1NISUZUKTsKLX0KLQogLyogYWNjZXNzIGlvbW11IGJhc2UgYWRkcmVzc2VzIGZp
ZWxkIGZyb20gbW1pbyByZWdzICovCiBzdGF0aWMgaW5saW5lIHZvaWQgaW9tbXVfc2V0X2FkZHJf
bG9fdG9fcmVnKHVpbnQzMl90ICpyZWcsIHVpbnQzMl90IGFkZHIpCiB7Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
