Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D111371B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 22:34:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iccF5-0000zX-M4; Wed, 04 Dec 2019 21:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3ZI=Z2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iccF4-0000zS-Hz
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 21:31:26 +0000
X-Inumbo-ID: 6c68c210-16dd-11ea-aea8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c68c210-16dd-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575495086;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=rezTkruEAo6SunEuMikDERnfLWWiO86RYZqNf07RmZU=;
 b=A5SBxACdvyySYCtrPCi15p2lwtIH5f+BdciLd3YvmSmHNeQGzXNhmHhK
 pqGTEOci05vGRqoHxg3mXA6TOWtEwKHobCYSdZNR7O0knlZnapj6P0dpd
 oRKd8dJOvH8wcjMK0XUB4Wr8ccaY0VH2AbJEZDWZUX6R2FNF6JYR3i7oe k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wF9mvyGaIv6aAUlkUJZ6isM64UHSVhAfQwZOM7/Q+7fowvJPxkFo1EgR2yaWBtNII2AA8G4PIJ
 KHoe1G+PiFA27fIz7UHXDf93aPamCHs9nYgsYIbdKkI5bqvyxiXeUDVDFwmhAbafhYaTsvFD+R
 n7rWJy5fvmdacEqmpw4xHG2P1GLIgBPMPEwfaS3J1andjxmNxFLw3ULT5f57O4/0yv7CwlB+Th
 rLl5qXV2cn9DAc8ZXfBKFQGrw17cXY45bROb1/LAkMV5i3nY9zXg6yF1EDFTu8AzqL+2/oOXue
 pMs=
X-SBRS: 2.7
X-MesageID: 9217944
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,278,1571716800"; 
   d="scan'208";a="9217944"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 21:31:20 +0000
Message-ID: <1575495080-27656-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] passthrough: add missed pcidevs_unlock
 following c/s cd7dedad820
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
Cc: linux@eikelenboom.it, jbeulich@suse.com,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvY2tpbmcgcmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5nZWQgYW5kIGEgcHJlbWF0dXJl
IGJyZWFrIGluCnRoaXMgc2VjdGlvbiBub3cgY2F1c2VzIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9u
OgoKQXNzZXJ0aW9uICchcHJlZW1wdF9jb3VudCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2CgpS
ZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0t
LQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggY2VkMGMyOC4uMjU5M2ZlNCAx
MDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTE3MDUsNiArMTcwNSw3IEBAIGludCBpb21tdV9kb19w
Y2lfZG9tY3RsKAogICAgICAgICAgICAgICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2
Zm4pLCBQQ0lfRlVOQyhkZXZmbikpOwogICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7CiAg
ICAgICAgICAgICB9CisgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOwogICAgICAgICAgICAg
YnJlYWs7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoICFyZXQgKQotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
