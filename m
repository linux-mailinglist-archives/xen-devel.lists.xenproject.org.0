Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B7964C4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 17:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i06D8-0008PD-Sx; Tue, 20 Aug 2019 15:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9c3=WQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i06D7-0008P8-Lv
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 15:38:13 +0000
X-Inumbo-ID: 83aff735-c360-11e9-adb7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83aff735-c360-11e9-adb7-12813bfff9fa;
 Tue, 20 Aug 2019 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566315492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h3Ez3V9lq8Hc7+lj2Q7W7saYrXfFIYnXS9qxck2i//4=;
 b=ff2Wgi4QwfhuE97jrHgyNZIwrp8jK3anpPyWJ4JmkKOj/wiHJxsYEAXh
 /B0U8GoKHjVlIxw12lm4u0BoT7OfG7aHgIZxSSAuOyT1Rl3k357erw4MT
 bUyEiGGp08ZlnHLEMwAC6TplXxaLBdOvEl8c8Mh3vZThpOdQLvnK/294y 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rgd8xEl9LLmyeFnI+ZpqQ+PNkQjmoHF0E/RejMvuAI4WGFRtOyvvc9MNNpwb7b6Wgn8026jukM
 4CnY45Qm3pawBNZ+tvcVAxL/clt2KDrgU5L1SlzwbU/7EClaZuTSHbzHKDgg9O7MXuTyAkOgK2
 cO1vrLEANQpX8Zcj8G12V6lbq42II5+iG78S7R6iN7CBinmo7Uenj4KxvslxX/SFElbUrQ9y9c
 oxy6ManJuJfrVYO7QsrnBQIAnMFc4nwMW9zUrerDnTCTDKymDQdAsCm+tfLFn8Qsyh9tQr+CHi
 OJY=
X-SBRS: 2.7
X-MesageID: 4530990
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4530990"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 20 Aug 2019 17:37:45 +0200
Message-ID: <20190820153745.40103-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxldmVsIHBhc3NlZCB0byBlcHRfaW52YWxpZGF0ZV9lbXQgY29ycmVzcG9uZHMgdG8gdGhl
IEVQVCBlbnRyeQpwYXNzZWQgYXMgdGhlIG1mbiBwYXJhbWV0ZXIsIHdoaWNoIGlzIGEgcG9pbnRl
ciB0byBhbiBFUFQgcGFnZSB0YWJsZSwKaGVuY2UgdGhlIGVudHJpZXMgaW4gdGhhdCBwYWdlIHRh
YmxlIHdpbGwgaGF2ZSBvbmUgbGV2ZWwgbGVzcyB0aGFuIHRoZQpwYXJlbnQuCgpGaXggdGhlIGNh
bGwgdG8gYXRvbWljX3dyaXRlX2VwdF9lbnRyeSB0byBwYXNzIHRoZSBjb3JyZWN0IGxldmVsLCBp
ZToKb25lIGxldmVsIGxlc3MgdGhhbiB0aGUgcGFyZW50LgoKRml4ZXM6IDUwZmU2ZTczNzA1ICgn
cHZoIGRvbTA6IGFkZCBhbmQgcmVtb3ZlIGZvcmVpZ24gcGFnZXMnKQpTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKdW4gTmFrYWpp
bWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4K
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogU2Vy
Z2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgpDYzogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0t
ZXB0LmMKaW5kZXggNmI4NDY4Yzc5My4uMjNhZTZlOWRhMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS1lcHQuYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCkBAIC0zNjcs
NyArMzY3LDcgQEAgc3RhdGljIGJvb2xfdCBlcHRfaW52YWxpZGF0ZV9lbXQoc3RydWN0IHAybV9k
b21haW4gKnAybSwgbWZuX3QgbWZuLAogICAgICAgICBlLmVtdCA9IE1UUlJfTlVNX1RZUEVTOwog
ICAgICAgICBpZiAoIHJlY2FsYyApCiAgICAgICAgICAgICBlLnJlY2FsYyA9IDE7Ci0gICAgICAg
IHJjID0gYXRvbWljX3dyaXRlX2VwdF9lbnRyeShwMm0sICZlcHRlW2ldLCBlLCBsZXZlbCk7Cisg
ICAgICAgIHJjID0gYXRvbWljX3dyaXRlX2VwdF9lbnRyeShwMm0sICZlcHRlW2ldLCBlLCBsZXZl
bCAtIDEpOwogICAgICAgICBBU1NFUlQocmMgPT0gMCk7CiAgICAgICAgIGNoYW5nZWQgPSAxOwog
ICAgIH0KLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
