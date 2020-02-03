Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC815060E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:23:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyahY-0007wj-GB; Mon, 03 Feb 2020 12:19:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyahX-0007wJ-Eh
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:19:39 +0000
X-Inumbo-ID: 6f5af14e-467f-11ea-8e54-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f5af14e-467f-11ea-8e54-12813bfff9fa;
 Mon, 03 Feb 2020 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cwqcxcjbNmV5kHDMCXn9CishPL2oIgFCUnW0A+7RXmo=;
 b=HAFW4fYCKk5BFMiDj2YPDvP0Ijr7pOa1qcWkkQEbN5YotslG6GQjwT5A
 xyVawTwhEsNx/5JPbHZGJtpi1RhARLxv3CMP5GqoJe5sF7ryZ2wtbV+i6
 lr8QYXve5VCxM7yj40a4sYHmi3Ugvo7vcLTVrNYsFjqvixfQdNiXVLbGc g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g8lPMXfP71FJSK0mnk4sOAnmHS7WmfPIDdqiYlK9xwwK2YakuUbZ8hgRfuqmq37eg+eJ9Hebrc
 bx7lkcBsFLSe0rMnU2ufSwsDU5rvk07ulQJBcV8zFDrIbtQs2BcN2JWDhjJNmtTJr9iFZN7cGY
 i8GMwBu8R2x2zqPbVLWDZjS1bpcT10QW1Z3qm6/MS/Bqvw0LdQWXJjNAn78wAkViHz3GRku9Lx
 YwbH1uVZMBmyzUR/VKknzC6/aGJ0MaPf1tFC6gumgZ3KcUKQxV1z5Y2Geg+KN0be0BjX4bPBMK
 JgA=
X-SBRS: 2.7
X-MesageID: 12457221
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12457221"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 13:19:18 +0100
Message-ID: <20200203121919.15748-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203121919.15748-1-roger.pau@citrix.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] x86/vvmx: don't enable interrupt window
 when using virt intr delivery
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkgaXMgdXNlZCB0byBpbmplY3QgdGhlIGludGVy
cnVwdCB0byB0aGUKZ3Vlc3QgdGhlIGludGVycnVwdCB3aW5kb3cgc2hvdWxkbid0IGJlIGVuYWJs
ZWQsIGFzIHRoZSBpbnRlcnJ1cHQgaXMKYWxyZWFkeSBpbmplY3RlZCB1c2luZyB0aGUgR1VFU1Rf
SU5UUl9TVEFUVVMgdm1jcyBmaWVsZC4KClJlcG9ydGVkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9u
LgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L2ludHIuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYwppbmRleCAyZWFm
M2Y4ZDM2Li40OWExMjk1ZjA5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRy
LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5jCkBAIC0yMDksNyArMjA5LDcgQEAg
c3RhdGljIGludCBudm14X2ludHJfaW50ZXJjZXB0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgaHZt
X2ludGFjayBpbnRhY2spCiAgICAgICAgICAgICAgICAgaWYgKCB1bmxpa2VseShpbnRhY2suc291
cmNlICE9IGh2bV9pbnRzcmNfbm9uZSkgKQogICAgICAgICAgICAgICAgICAgICB2bXhfZW5hYmxl
X2ludHJfd2luZG93KHYsIGludGFjayk7CiAgICAgICAgICAgICB9Ci0gICAgICAgICAgICBlbHNl
CisgICAgICAgICAgICBlbHNlIGlmICggIWNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVy
eSApCiAgICAgICAgICAgICAgICAgdm14X2VuYWJsZV9pbnRyX3dpbmRvdyh2LCBpbnRhY2spOwog
CiAgICAgICAgICAgICByZXR1cm4gMTsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
