Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D16CF65
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:03:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6xK-0004Hl-Qj; Thu, 18 Jul 2019 14:00:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho6xJ-0004Hb-IG
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:00:21 +0000
X-Inumbo-ID: 60d1c2a8-a964-11e9-a31b-37b0a6efc604
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60d1c2a8-a964-11e9-a31b-37b0a6efc604;
 Thu, 18 Jul 2019 14:00:20 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NXeg2DL2sWQPMGGv1m1QWJtz2avXaQVGEXHs88Y2kC8quljXKPTDtdnYobQWh36bfjnwspGU68
 51Vzx/qhj0D5yInrZ+45yGO0laBQelVwsUxi32ZeUH0GcWst/YKJ0RXsJidBeQN05m4nvqwCLv
 OAgimqQNNT4NPhnDVJXEN+V+Qi1nRmW6QOZdm6kANDC2Onfjd/Snbx1u1VYctw2fbd+qF9moTZ
 o34p7cBqy6v5QzX6QfW2XjVZLyZeuryk3bCLnFvxXyyETBh7BIjYqdKmu1fMnHFFT+NEaKaJ6U
 m5E=
X-SBRS: 2.7
X-MesageID: 3233437
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3233437"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 18 Jul 2019 15:00:09 +0100
Message-ID: <20190718140009.16021-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/trace: Adjust types in trace_var()
 declarations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIGJvb2wgcmF0aGVyIHRoYW4gaW50L2Jvb2xfdCBmb3IgJ2N5Y2xlcycgdG8gbWF0Y2ggdGhl
ICFDT05GSUdfVFJBQ0VCVUZGRVIKdmVyc2lvbiwgYW5kIHVzZSB1bnNpZ25lZCBpbnQgcmF0aGVy
IHRoYW4gaW50IGZvciAnZXh0cmEnIHRvIG1hdGNoIHRoZQpmdW5jdGlvbiBpdCBpcyBmb3J3YXJk
ZWQgdG8uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vdHJhY2UuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdHJh
Y2UuaCBiL3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oCmluZGV4IGU2YTRlZjkzY2MuLjkwZmZjYzY4
YzcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oCisrKyBiL3hlbi9pbmNsdWRl
L3hlbi90cmFjZS5oCkBAIC00MSw5ICs0MSw5IEBAIGludCB0Yl9jb250cm9sKHN0cnVjdCB4ZW5f
c3lzY3RsX3RidWZfb3AgKnRiYyk7CiAKIGludCB0cmFjZV93aWxsX3RyYWNlX2V2ZW50KHUzMiBl
dmVudCk7CiAKLXZvaWQgX190cmFjZV92YXIodTMyIGV2ZW50LCBib29sX3QgY3ljbGVzLCB1bnNp
Z25lZCBpbnQgZXh0cmEsIGNvbnN0IHZvaWQgKik7Cit2b2lkIF9fdHJhY2VfdmFyKHUzMiBldmVu
dCwgYm9vbCBjeWNsZXMsIHVuc2lnbmVkIGludCBleHRyYSwgY29uc3Qgdm9pZCAqKTsKIAotc3Rh
dGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIgZXZlbnQsIGludCBjeWNsZXMsIGludCBleHRy
YSwKK3N0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIodTMyIGV2ZW50LCBib29sIGN5Y2xlcywg
dW5zaWduZWQgaW50IGV4dHJhLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2
b2lkICpleHRyYV9kYXRhKQogewogICAgIGlmICggdW5saWtlbHkodGJfaW5pdF9kb25lKSApCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
