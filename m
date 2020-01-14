Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9013B30D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 20:38:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irRzJ-0004Vf-LW; Tue, 14 Jan 2020 19:36:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bgCx=3D=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irRzH-0004Va-94
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 19:36:27 +0000
X-Inumbo-ID: 26b50114-3705-11ea-8440-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26b50114-3705-11ea-8440-12813bfff9fa;
 Tue, 14 Jan 2020 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579030585;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AB0Pd8o5+d7R1L1sAc/etgHve8cNnPZU9HusSaXdKfk=;
 b=RnCZ5t/fYcu6GL8S1FWZu1X2zeFt2bUBs5On928enoSNsZBKaIgwBIvL
 Ue3pcGdrXUE7T9hIFtlEvPh5OI9LPEvuit+ZqWuhXKZOtlaXTr7s2r/22
 eooBldyupB7QNAdj5PBZB2Rl7BwYSOgXdFG3MFX6DmqRJjp5Hp/Pb02sx w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lD+8Cm8wOuf2tc8jvmP2ouhk8vq2MFWUr32k5wd0hkZNEtEdd96l50UOAZwenOd3MVcLisIKo6
 TawlJleG2+FbuOpbNe9Y7UGRpc31tz0VKPxI1WhH+cBN4pJ+jzhgTjU3jc4fVH/S1WhRzR18V7
 Kg2quwyoKyfxgvfkEsBeqaDltL8MQk3LdNVce1Y01uTMsVIcGqx8WaYpGkxmz47LKEZ9NMbqmO
 RGF/9NMfsgKN4n0cyXMLevql4KeSoUMuSm4QfFP86nWqzxLAn2SHwLKlcW2ydl8LQ6z+5BR+Zj
 9w4=
X-SBRS: 2.7
X-MesageID: 11277150
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,320,1574139600"; d="scan'208";a="11277150"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 Jan 2020 19:36:21 +0000
Message-ID: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from deep
 C-state
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgSVRTQyBpcyBub3QgYXZhaWxhYmxlIG9uIENQVSAoZS5nIGlmIHJ1bm5pbmcgbmVzdGVkIGFz
IFBWIHNoaW0pCnRoZW4gWDg2X0ZFQVRVUkVfTk9OU1RPUF9UU0MgaXMgbm90IGFkdmVydGlzZWQg
aW4gY2VydGFpbiBjYXNlcywgaS5lLgphbGwgQU1EIGFuZCBzb21lIG9sZCBJbnRlbCBwcm9jZXNz
b3JzLiBJbiB3aGljaCBjYXNlIFRTQyB3b3VsZCBuZWVkIHRvCmJlIHJlc3RvcmVkIG9uIENQVSBm
cm9tIHBsYXRmb3JtIHRpbWUgYnkgWGVuIHVwb24gZXhpdGluZyBkZWVwIEMtc3RhdGVzLgoKQXMg
cGxhdGZvcm0gdGltZSBtaWdodCBiZSBiZWhpbmQgdGhlIGxhc3QgVFNDIHN0YW1wIHJlY29yZGVk
IGZvciB0aGUKY3VycmVudCBDUFUsIGludmFyaWFudCBvZiBUU0Mgc3RhbXAgYmVpbmcgYWx3YXlz
IGJlaGluZCBsb2NhbCBUU0MgY291bnRlcgppcyB2aW9sYXRlZC4gVGhpcyBoYXMgYW4gZWZmZWN0
IG9mIGdldF9zX3RpbWUoKSBnb2luZyBuZWdhdGl2ZSByZXN1bHRpbmcKaW4gZXZlbnR1YWwgc3lz
dGVtIGhhbmcgb3IgY3Jhc2guCgpGaXggdGhpcyBpc3N1ZSBieSB1cGRhdGluZyBsb2NhbCBUU0Mg
c3RhbXAgYWxvbmcgd2l0aCBUU0MgY291bnRlciB3cml0ZS4KClNpZ25lZC1vZmYtYnk6IElnb3Ig
RHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KVGhpcyBjYXVzZWQgcmVs
aWFibGUgaGFuZ3Mgb2Ygc2hpbSBkb21haW5zIHdpdGggbXVsdGlwbGUgdkNQVXMgb24gYWxsIEFN
RApzeXN0ZW1zLiBUaGUgcHJvYmxlbSBnb3QgYWxzbyByZXByb2R1Y2VkIG9uIGJhcmUtbWV0YWwg
YnkgYXJ0aWZpY2FsbHkKbWFza2luZyBJVFNDIGZlYXR1cmUgYml0LiBUaGUgcHJvcG9zZWQgZml4
IGhhcyBiZWVuIHZlcmlmaWVkIGZvciBib3RoCmNhc2VzLgotLS0KIHhlbi9hcmNoL3g4Ni90aW1l
LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni90
aW1lLmMKaW5kZXggZTc5Y2I0ZC4uZjZiMjZmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Rp
bWUuYworKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCkBAIC05NTUsMTAgKzk1NSwxNiBAQCB1NjQg
c3RpbWUydHNjKHNfdGltZV90IHN0aW1lKQogCiB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lk
KQogeworICAgIHN0cnVjdCBjcHVfdGltZSAqdCA9ICZ0aGlzX2NwdShjcHVfdGltZSk7CisKICAg
ICBpZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgKQogICAgICAgICBy
ZXR1cm47CiAKLSAgICB3cml0ZV90c2Moc3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVM
TCkpKTsKKyAgICB0LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0aW1lKE5V
TEwpOworICAgIHQtPnN0YW1wLmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0ZXJf
c3RpbWUpOworICAgIHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1l
OworCisgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7CiB9CiAKIC8qKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
