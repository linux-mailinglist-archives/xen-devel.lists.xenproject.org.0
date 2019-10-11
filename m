Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF03D43C9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwRY-0002go-Pb; Fri, 11 Oct 2019 15:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8hDA=YE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iIwRW-0002gj-Ne
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:02:58 +0000
X-Inumbo-ID: 3563e0a8-ec38-11e9-933b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3563e0a8-ec38-11e9-933b-12813bfff9fa;
 Fri, 11 Oct 2019 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570806177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hnNOStA6qcYhE562odRCC01tuIlteEXw84G1woRvxAs=;
 b=R6vRsctIKqDhPkKDcy/6AVDHYVX7k14cL+7S4xLJkP3jbTX7EsuL7EhA
 b67rs2OfPCnrAsUM3Ssuu/lCvgRQogXHzlcQ/mnLqm3Z+SDflrBO7WKLH
 SdrT6zuH1EuUTi650/VRDwVi5fMYjI+6ELi+ZfzT0fQKekufJwCWN0jvM U=;
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
IronPort-SDR: UHLjV1Rk2D0ISCadyO5k4BAxOdpvdcVzRqTrDQfV5FMrbI8MsgJOrJofjvalb2bmIg6rP8Q2mL
 epeHAvp42hjs8CSSsZZP9fQZ3qTvKSg5wVgXtfM3AGgZRNOBboVMIWPzmBEYl+S5odpJA9unvW
 x4R2BY9+e/jfRFnWeI3t4IrMmlbh3xnsN0VSzgrn6TYBFmksLm6uqwqB7P+nktTKamU6rhVf4v
 ipAWrg+zq1dSbhAnEoUQkaFOcy9BIGOIk0rjY3lm5R8P+UqAzCzn6PYtTUjxW9tFC7dv9heDkZ
 dog=
X-SBRS: 2.7
X-MesageID: 6772780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6772780"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 11 Oct 2019 16:02:53 +0100
Message-ID: <20191011150253.29457-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/VT-d: Drop unhelpful information
 in diagnostics
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
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgYmFzZSBvZiB0aGUgSU9NTVUncyByZWdzdGVycyBp
cyBub3QgdXNlZnVsIGZvcgpkaWFnbm9zdGljIHB1cnBvc2VzLCBhbmQgaXMgcXVpdGUgdm9sdW1p
bm91cy4gIFRoZSBQQ0kgY29vcmRpbmF0ZXMgaXMgYnkgZmFyCnRoZSBtb3N0IHVzZWZ1bCBwaWVj
ZSBvZiBpZGVudGlmeWluZyBpbmZvcm1hdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPgpDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNDOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpTdXJyb3VuZGluZyBwcmludGsoKXMgYWxzbyBp
ZGVudGlmeSB0aGUgSU9NTVUgYnkgWGVuJ3MgaW50ZXJuYWwgSUQsIGJ1dCB0aGF0CmlzIGFsc28g
cHJldHR5IHVzZWxlc3MgaW5mb3JtYXRpb24gd2hlbiBkaWFnbm9zaW5nIHByb2JsZW1zLgoKUkZD
IGZvci00LjEzLiAgVGhpcyBpcyBhIG5pY2UgdG8gaGF2ZSBzdHlsaXN0aWMgaW1wcm92ZW1lbnQu
Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgfCAxMiArKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwppbmRleCBmMDhlZWMwNzBkLi4wNTIyZWNkM2JjIDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtODQyLDI2ICs4NDIsMjYgQEAgc3Rh
dGljIGludCBpb21tdV9wYWdlX2ZhdWx0X2RvX29uZShzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSwg
aW50IHR5cGUsCiAgICAgY2FzZSBETUFfUkVNQVA6CiAgICAgICAgIHByaW50ayhYRU5MT0dfR19X
QVJOSU5HIFZURFBSRUZJWAogICAgICAgICAgICAgICAgIkRNQVI6WyVzXSBSZXF1ZXN0IGRldmlj
ZSBbJTA0eDolMDJ4OiUwMnguJXVdICIKLSAgICAgICAgICAgICAgICJmYXVsdCBhZGRyICUiUFJJ
eDY0IiwgaW9tbXUgcmVnID0gJXBcbiIsCisgICAgICAgICAgICAgICAiZmF1bHQgYWRkciAlIlBS
SXg2NCJcbiIsCiAgICAgICAgICAgICAgICAodHlwZSA/ICJETUEgUmVhZCIgOiAiRE1BIFdyaXRl
IiksCiAgICAgICAgICAgICAgICBzZWcsIFBDSV9CVVMoc291cmNlX2lkKSwgUENJX1NMT1Qoc291
cmNlX2lkKSwKLSAgICAgICAgICAgICAgIFBDSV9GVU5DKHNvdXJjZV9pZCksIGFkZHIsIGlvbW11
LT5yZWcpOworICAgICAgICAgICAgICAgUENJX0ZVTkMoc291cmNlX2lkKSwgYWRkcik7CiAgICAg
ICAgIGtpbmQgPSAiRE1BUiI7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgSU5UUl9SRU1BUDoK
ICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgVlREUFJFRklYCiAgICAgICAgICAgICAg
ICAiSU5UUi1SRU1BUDogUmVxdWVzdCBkZXZpY2UgWyUwNHg6JTAyeDolMDJ4LiV1XSAiCi0gICAg
ICAgICAgICAgICAiZmF1bHQgaW5kZXggJSJQUkl4NjQiLCBpb21tdSByZWcgPSAlcFxuIiwKKyAg
ICAgICAgICAgICAgICJmYXVsdCBpbmRleCAlIlBSSXg2NCJcbiIsCiAgICAgICAgICAgICAgICBz
ZWcsIFBDSV9CVVMoc291cmNlX2lkKSwgUENJX1NMT1Qoc291cmNlX2lkKSwKLSAgICAgICAgICAg
ICAgIFBDSV9GVU5DKHNvdXJjZV9pZCksIGFkZHIgPj4gNDgsIGlvbW11LT5yZWcpOworICAgICAg
ICAgICAgICAgUENJX0ZVTkMoc291cmNlX2lkKSwgYWRkciA+PiA0OCk7CiAgICAgICAgIGtpbmQg
PSAiSU5UUi1SRU1BUCI7CiAgICAgICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6CiAgICAgICAgIHBy
aW50ayhYRU5MT0dfR19XQVJOSU5HIFZURFBSRUZJWAogICAgICAgICAgICAgICAgIlVOS05PV046
IFJlcXVlc3QgZGV2aWNlIFslMDR4OiUwMng6JTAyeC4ldV0gIgotICAgICAgICAgICAgICAgImZh
dWx0IGFkZHIgJSJQUkl4NjQiLCBpb21tdSByZWcgPSAlcFxuIiwKKyAgICAgICAgICAgICAgICJm
YXVsdCBhZGRyICUiUFJJeDY0IlxuIiwKICAgICAgICAgICAgICAgIHNlZywgUENJX0JVUyhzb3Vy
Y2VfaWQpLCBQQ0lfU0xPVChzb3VyY2VfaWQpLAotICAgICAgICAgICAgICAgUENJX0ZVTkMoc291
cmNlX2lkKSwgYWRkciwgaW9tbXUtPnJlZyk7CisgICAgICAgICAgICAgICBQQ0lfRlVOQyhzb3Vy
Y2VfaWQpLCBhZGRyKTsKICAgICAgICAga2luZCA9ICJVTktOT1dOIjsKICAgICAgICAgYnJlYWs7
CiAgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
