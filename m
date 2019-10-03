Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E067C9CAF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 12:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFye6-0006j0-Ea; Thu, 03 Oct 2019 10:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAba=X4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFye5-0006iu-LX
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 10:47:41 +0000
X-Inumbo-ID: 38956e90-e5cb-11e9-8c93-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38956e90-e5cb-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570099661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=liEiyw+6y/d0YDdGw8y8kT6b8wWf8DaiEXg7V/pd84c=;
 b=Je9KFhisIwfz7s9msHWIBWCEvsoP869WKr5U6rpr/iCwxBqv7DvCVieg
 WYGJszW3FAAl6QrafByUoFWh8PWoOaGyPnMWgauf23fCtR1cLmiCtP8fW
 IAFZb1m5+mj0frVL06LhPJTXGRMrTJJ8VRX+LlyON6pNsS8IKnSLTq7nf 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wVzKrJekys3VlwPJSc3b7RvE37InacZq8sKtZkVbPQm9sgImNIy2YlMiZSaJg62qhEQsVNLoTd
 8esGE4CyXn7IO5HSsZ0XimH25mluDDy3NiC+aHSM8Dvsbc3q0iqKq5Xeveff8jxmAuKdUER9qQ
 QEKisIg0eOY+0P3ajUfyJSB0Z0uXNtLDfMc9DxEihXdljRbvd7EZecwsheZpdra2rslSKqOxAI
 HTJ/jHaCC0oRwcEQq6D/hJfMJTC+TiaInF99oZE8yIiHatxrSGjlz2yjP3CL9w84zeq6mskONP
 5xo=
X-SBRS: 2.7
X-MesageID: 6482308
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,251,1566878400"; 
   d="scan'208";a="6482308"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 11:47:36 +0100
Message-ID: <20191003104736.32259-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: Fix the use of RDTSCP when it is
 intercepted at L0
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Chris Brannon <cmb@prgmr.com>,
 Jan Beulich <JBeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXggaGFzIHN0YXJ0ZWQgdXNpbmcgUkRUU0NQIGFzIG9mIHY1LjEuICBUaGlzIGhhcyBoaWdo
bGlnaHRlZCBhIGJ1ZyBpbiBYZW4sCndoZXJlIHZpcnR1YWwgdm1leGl0IHNpbXBseSBnaXZlcyB1
cC4KCiAgKFhFTikgZDF2MSBVbmhhbmRsZWQgbmVzdGVkIHZtZXhpdDogcmVhc29uIDUxCiAgKFhF
TikgZG9tYWluX2NyYXNoIGNhbGxlZCBmcm9tIHZ2bXguYzoyNjcxCiAgKFhFTikgRG9tYWluIDEg
KHZjcHUjMSkgY3Jhc2hlZCBvbiBjcHUjMjoKCkhhbmRsZSBSRFRTQ1AgaW4gdGhlIHZpcnR1YWwg
dm1leGl0IGhhbmRlciBpbiB0aGUgc2FtZSB3YXMgYXMgUkRUU0MKaW50ZXJjZXB0cy4KClJlcG9y
dGVkLWJ5OiBTYXJhaCBOZXdtYW4gPHNybkBwcmdtci5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClRlc3RlZC1ieTogQ2hyaXMgQnJh
bm5vbiA8Y21iQHByZ21yLmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+
CkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KClRoaXMgcHJvYmFibHkgd2FudHMgYmFja3BvcnRpbmcgdG8gYWxs
IHN0YWJsZSB0cmVlcywgZXZlbiB0aG91Z2ggbmVzdGVkIHZpcnQKaXNuJ3Qgc3VwcG9ydGVkLCBh
bmQgdGhlcmVmb3JlIG91Z2h0IHRvIHF1YWxpZnkgZm9yIDQuMTMgYXQgdGhpcyBwb2ludC4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBi
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwppbmRleCBmZGY0NDliZmQxLi42Njk2YmQ2MjQw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jCkBAIC0yNDkxLDYgKzI0OTEsNyBAQCBpbnQgbnZteF9uMl92bWV4
aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKICAgICAgICAgICAgIG52Y3B1
LT5udl92bWV4aXRfcGVuZGluZyA9IDE7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgRVhJVF9S
RUFTT05fUkRUU0M6CisgICAgY2FzZSBFWElUX1JFQVNPTl9SRFRTQ1A6CiAgICAgICAgIGN0cmwg
PSBfX24yX2V4ZWNfY29udHJvbCh2KTsKICAgICAgICAgaWYgKCBjdHJsICYgQ1BVX0JBU0VEX1JE
VFNDX0VYSVRJTkcgKQogICAgICAgICAgICAgbnZjcHUtPm52X3ZtZXhpdF9wZW5kaW5nID0gMTsK
QEAgLTI1MDEsNiArMjUwMiw4IEBAIGludCBudm14X24yX3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzLAogICAgICAgICAgICAgICogYXZvaWRpbmcgY2hhbmdpbmcgZ3Vl
c3RfdHNjIGFuZCBtZXNzaW5nIHVwIHRpbWVrZWVwaW5nIGluIEwxCiAgICAgICAgICAgICAgKi8K
ICAgICAgICAgICAgIG1zcl9zcGxpdChyZWdzLCBodm1fZ2V0X2d1ZXN0X3RzYyh2KSArIGdldF92
dm1jcyh2LCBUU0NfT0ZGU0VUKSk7CisgICAgICAgICAgICBpZiAoIGV4aXRfcmVhc29uID09IEVY
SVRfUkVBU09OX1JEVFNDUCApCisgICAgICAgICAgICAgICAgcmVncy0+cmN4ID0gdi0+YXJjaC5t
c3JzLT50c2NfYXV4OwogICAgICAgICAgICAgdXBkYXRlX2d1ZXN0X2VpcCgpOwogCiAgICAgICAg
ICAgICByZXR1cm4gMTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
