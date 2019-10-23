Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C87E14F7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCSw-000549-57; Wed, 23 Oct 2019 08:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNCSt-00053e-Ur
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:58:00 +0000
X-Inumbo-ID: 35a1c352-f573-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35a1c352-f573-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571821078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f6qwrnVFhMgV6xDCYccCB5+IBarRltGi0vPRbsotQF8=;
 b=TlvroIjEOknWGu+EiUTiqqrW1XCaWf2bA+DnqVQJJOjKU7QfvsiRZxdM
 yV3xKayAeV/qPdvhtI2rT1mziIVfy2QKtmNeCgLMfw8YQR5+eEVbEfY/n
 zoRsxHpSdOFNzSD29eloj8SQv87rpMa5qtEjJCmZiPIXKZ/RvTuyxGyg7 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qG5taFF1xJGM51qgsCUsijz0INQFVj5uQ14AOtQ6NOXH093WH/pQecbA6sMTRwXlJDV1wl/kZ4
 uZKwvVtwOVmOYb3Z80IulNqpigz6dn0niT02iUZY6Hos8YydwyvMWJG7xkWSSVwCxNt+l6LJD+
 CFK5joF8gO6Adf0efcjmwXqFGEvTznJju2LcT1P6dT9NHXHUTLSNVr2257M2kJNwlkIETVJG1o
 RzWrTbc7Ao8pnEkEnbKNGP1LAjrOmYWm4zI77q/WVgeZnbmoOpvI/JH7qAEXw6DRXvHxmEfgj/
 XA4=
X-SBRS: 2.7
X-MesageID: 7614022
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7614022"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 10:57:39 +0200
Message-ID: <20191023085739.43585-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYSBIVk0vUFZIIGd1ZXN0IHdyaXRlcyB0byBNU1JfSUEzMl9UU0N7X0FESlVTVH0gYW5kIHRo
dXMgY2hhbmdlcwp0aGUgdmFsdWUgb2YgdGhlIHRpbWUgc3RhbXAgY291bnRlciB0aGUgdmNwdSB0
aW1lIGluZm8gbXVzdCBhbHNvIGJlCnVwZGF0ZWQsIG9yIHRoZSB0aW1lIGNhbGN1bGF0ZWQgYnkg
dGhlIGd1ZXN0IHVzaW5nIHRoZSBYZW4gUFYgY2xvY2sKaW50ZXJmYWNlIHdpbGwgYmUgc2tld2Vk
LgoKVXBkYXRlIHRoZSB2Y3B1IHRpbWUgaW5mbyB3aGVuIHRoZSBndWVzdCB3cml0ZXMgdG8gZWl0
aGVyIE1TUl9JQTMyX1RTQwpvciBNU1JfSUEzMl9UU0NfQURKVVNULiBUaGlzIGZpeGVzIGxvY2t1
cHMgc2VlbiB3aGVuIHJ1bm5pbmcgdGhlCnB2LXNoaW0gb24gQU1EIGhhcmR3YXJlLCBzaW5jZSB0
aGUgc2hpbSB3aWxsIGFnZ3Jlc3NpdmVseSB0cnkgdG8ga2VlcApUU0NzIGluIHN5bmMgYnkgcGVy
aW9kaWNhbGx5IHdyaXRpbmcgdG8gTVNSX0lBMzJfVFNDIGlmIHRoZSBUU0MgaXMgbm90CnJlbGlh
YmxlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDYzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9odm0vaHZtLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwppbmRleCA5YWNkMzU5Yzk5Li5lNGMwNDI1MzMwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTQ0Miw2ICs0NDIs
OCBAQCBzdGF0aWMgdm9pZCBodm1fc2V0X2d1ZXN0X3RzY19tc3Ioc3RydWN0IHZjcHUgKnYsIHU2
NCBndWVzdF90c2MpCiAKICAgICBodm1fc2V0X2d1ZXN0X3RzYyh2LCBndWVzdF90c2MpOwogICAg
IHYtPmFyY2guaHZtLm1zcl90c2NfYWRqdXN0ICs9IHYtPmFyY2guaHZtLmNhY2hlX3RzY19vZmZz
ZXQgLSB0c2Nfb2Zmc2V0OworICAgIGlmICggdiA9PSBjdXJyZW50ICkKKyAgICAgICAgdXBkYXRl
X3ZjcHVfc3lzdGVtX3RpbWUodik7CiB9CiAKIHN0YXRpYyB2b2lkIGh2bV9zZXRfZ3Vlc3RfdHNj
X2FkanVzdChzdHJ1Y3QgdmNwdSAqdiwgdTY0IHRzY19hZGp1c3QpCkBAIC00NDksNiArNDUxLDgg
QEAgc3RhdGljIHZvaWQgaHZtX3NldF9ndWVzdF90c2NfYWRqdXN0KHN0cnVjdCB2Y3B1ICp2LCB1
NjQgdHNjX2FkanVzdCkKICAgICB2LT5hcmNoLmh2bS5jYWNoZV90c2Nfb2Zmc2V0ICs9IHRzY19h
ZGp1c3QgLSB2LT5hcmNoLmh2bS5tc3JfdHNjX2FkanVzdDsKICAgICBodm1fc2V0X3RzY19vZmZz
ZXQodiwgdi0+YXJjaC5odm0uY2FjaGVfdHNjX29mZnNldCwgMCk7CiAgICAgdi0+YXJjaC5odm0u
bXNyX3RzY19hZGp1c3QgPSB0c2NfYWRqdXN0OworICAgIGlmICggdiA9PSBjdXJyZW50ICkKKyAg
ICAgICAgdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUodik7CiB9CiAKIHU2NCBodm1fZ2V0X2d1ZXN0
X3RzY19maXhlZChzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgYXRfdHNjKQotLSAKMi4yMy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
