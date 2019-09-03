Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E1A6DE0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BSG-0001t1-1z; Tue, 03 Sep 2019 16:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BSE-0001si-FH
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:14:50 +0000
X-Inumbo-ID: f4075ac6-ce65-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4075ac6-ce65-11e9-b299-bc764e2007e4;
 Tue, 03 Sep 2019 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyIoOVf7Reu99rVrxn593Kpcww0gx1guOOBYA8so0Is=;
 b=Mni72JewtTnLIja0nO3EHqddf5jkqESWBT6/lvjrdNS+IwiQ0so1mDwb
 CKnR8jNSVKCz+s7oL8wQBBXtDRMPtoFWpPQ55rrMUZRHlcn9Wz1wlbtYX
 qqF5uvbfKmRqqPqZojWbyWByHOXbFKFLrHj3jZQZvYLIC77I1RNOVJVi0 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lKoaOGeDS9SLKwSctYHDq5blWMPtb9wSKaiH9tbvfaECeS5lNTeA56i56YQtowZ+pU6/xNQAae
 u/MTA7YgbGA8Kn7d6u8khggpKZNik5JRL+FLE0UEm/uhkrcRJI62EPt5hAoYsutrikLho1qL+I
 yFW/Fiy0MSjXcPK1qqNR7M41aMYX8k9u0QaC3x4NEo69vi4shiAKu9kRIOgB0OziTfK1LLlu7r
 wuWXiaxWkxqsDXb6UmdlLSLFoE5FhCPgQKyBWCvnhyIbUaJFsvj7EWvlzgsSG+329zfZ/CDYls
 pW4=
X-SBRS: 2.7
X-MesageID: 5080354
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5080354"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:21 +0200
Message-ID: <20190903161428.7159-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903161428.7159-1-roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 04/11] ioreq: add fields to allow internal
 ioreq servers
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgcGxhaW4gZnVuY3Rpb24gaGFuZGxlcnMgaW1wbGVt
ZW50ZWQgaW5zaWRlCm9mIHRoZSBoeXBlcnZpc29yLiBOb3RlIHRoYXQgbW9zdCBmaWVsZHMgdXNl
ZCBieSBjdXJyZW50IChleHRlcm5hbCkKaW9yZXEgc2VydmVycyBhcmUgbm90IG5lZWRlZCBmb3Ig
aW50ZXJuYWwgb25lcywgYW5kIGhlbmNlIGhhdmUgYmVlbgpwbGFjZWQgaW5zaWRlIG9mIGEgc3Ry
dWN0IGFuZCBwYWNrZWQgaW4gYW4gdW5pb24gdG9nZXRoZXIgd2l0aCB0aGUKb25seSBpbnRlcm5h
bCBzcGVjaWZpYyBmaWVsZCwgYSBmdW5jdGlvbiBwb2ludGVyIHRvIGEgaGFuZGxlci4KClRoaXMg
aXMgcmVxdWlyZWQgaW4gb3JkZXIgdG8gaGF2ZSBQQ0kgY29uZmlnIGFjY2Vzc2VzIGZvcndhcmRl
ZCB0bwpleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIG9yIHRvIGludGVybmFsIG9uZXMgKGllOiBRRU1V
IGVtdWxhdGVkIGRldmljZXMKdnMgdlBDSSBwYXNzdGhyb3VnaCksIGFuZCBpcyB0aGUgZmlyc3Qg
c3RlcCBpbiBvcmRlciB0byBhbGxvdwp1bnByaXZpbGVnZWQgZG9tYWlucyB0byB1c2UgdlBDSS4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gRG8gbm90IGFkZCBhbiBpbnRlcm5hbCBmaWVsZCB0byB0
aGUgaW9yZXEgc2VydmVyIHN0cnVjdCwgd2hldGhlciBhCiAgIHNlcnZlciBpcyBpbnRlcm5hbCBv
ciBleHRlcm5hbCBjYW4gYWxyZWFkeSBiZSBpbmZlcnJlZCBmcm9tIHRoZSBpZC4KIC0gQWRkIGFu
IGV4dHJhIHBhcmFtZXRlciB0byB0aGUgaW50ZXJuYWwgaGFuZGxlciBpbiBvcmRlciB0byBwYXNz
CiAgIHVzZXItcHJvdmlkZWQgb3BhcXVlIGRhdGEgdG8gdGhlIGhhbmRsZXIuCi0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmggfCAzMCArKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCmluZGV4IGJjYzU2MjE3OTcuLjlmYmU4M2Y0NWEgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCkBAIC01MiwyMSArNTIsMjkgQEAgc3RydWN0IGh2bV9p
b3JlcV92Y3B1IHsKICNkZWZpbmUgTUFYX05SX0lPX1JBTkdFUyAgMjU2CiAKIHN0cnVjdCBodm1f
aW9yZXFfc2VydmVyIHsKLSAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICp0YXJnZXQsICplbXVs
YXRvcjsKLQorICAgIHN0cnVjdCBkb21haW4gICAgICAgICAgKnRhcmdldDsKICAgICAvKiBMb2Nr
IHRvIHNlcmlhbGl6ZSB0b29sc3RhY2sgbW9kaWZpY2F0aW9ucyAqLwogICAgIHNwaW5sb2NrX3Qg
ICAgICAgICAgICAgbG9jazsKLQotICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAgaW9yZXE7Ci0g
ICAgc3RydWN0IGxpc3RfaGVhZCAgICAgICBpb3JlcV92Y3B1X2xpc3Q7Ci0gICAgc3RydWN0IGh2
bV9pb3JlcV9wYWdlICBidWZpb3JlcTsKLQotICAgIC8qIExvY2sgdG8gc2VyaWFsaXplIGFjY2Vz
cyB0byBidWZmZXJlZCBpb3JlcSByaW5nICovCi0gICAgc3BpbmxvY2tfdCAgICAgICAgICAgICBi
dWZpb3JlcV9sb2NrOwotICAgIGV2dGNobl9wb3J0X3QgICAgICAgICAgYnVmaW9yZXFfZXZ0Y2hu
OwogICAgIHN0cnVjdCByYW5nZXNldCAgICAgICAgKnJhbmdlW05SX0lPX1JBTkdFX1RZUEVTXTsK
ICAgICBib29sICAgICAgICAgICAgICAgICAgIGVuYWJsZWQ7Ci0gICAgdWludDhfdCAgICAgICAg
ICAgICAgICBidWZpb3JlcV9oYW5kbGluZzsKKworICAgIHVuaW9uIHsKKyAgICAgICAgc3RydWN0
IHsKKyAgICAgICAgICAgIHN0cnVjdCBkb21haW4gICAgICAgICAgKmVtdWxhdG9yOworICAgICAg
ICAgICAgc3RydWN0IGh2bV9pb3JlcV9wYWdlICBpb3JlcTsKKyAgICAgICAgICAgIHN0cnVjdCBs
aXN0X2hlYWQgICAgICAgaW9yZXFfdmNwdV9saXN0OworICAgICAgICAgICAgc3RydWN0IGh2bV9p
b3JlcV9wYWdlICBidWZpb3JlcTsKKworICAgICAgICAgICAgLyogTG9jayB0byBzZXJpYWxpemUg
YWNjZXNzIHRvIGJ1ZmZlcmVkIGlvcmVxIHJpbmcgKi8KKyAgICAgICAgICAgIHNwaW5sb2NrX3Qg
ICAgICAgICAgICAgYnVmaW9yZXFfbG9jazsKKyAgICAgICAgICAgIGV2dGNobl9wb3J0X3QgICAg
ICAgICAgYnVmaW9yZXFfZXZ0Y2huOworICAgICAgICAgICAgdWludDhfdCAgICAgICAgICAgICAg
ICBidWZpb3JlcV9oYW5kbGluZzsKKyAgICAgICAgfTsKKyAgICAgICAgc3RydWN0IHsKKyAgICAg
ICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgKmRhdGE7CisgICAgICAgICAgICBpbnQgKCpo
YW5kbGVyKShzdHJ1Y3QgdmNwdSAqdiwgaW9yZXFfdCAqLCB2b2lkICopOworICAgICAgICB9Owor
ICAgIH07CiB9OwogCiAvKgotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
