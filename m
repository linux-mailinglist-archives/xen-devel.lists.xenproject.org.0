Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D9B23D6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:07:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8o3O-0005yQ-Bt; Fri, 13 Sep 2019 16:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8o3M-0005xt-Vl
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:04:09 +0000
X-Inumbo-ID: 1d94522d-d640-11e9-95af-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d94522d-d640-11e9-95af-12813bfff9fa;
 Fri, 13 Sep 2019 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568390648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4A+HNagdjd7C0ZlLWbR1RH4Zgt8TyZmLUxawx7aRHvs=;
 b=A1QGtSNGK2M3WqZSj9TqNaVAbi6oxlinMXUxwX2+1ntfJYRjD0Lkb7Hm
 0EFP6Z6r8VNjMHlm/AA/pM3dLoJTnUEiav8N2u97u4AzfqBizMGkHG0rV
 eyRs9XQ5xocw24eUEKOoQAO6QnNImiGlSKR1KGLK1thCVdbQQnpMBrgK5 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V8Whq4PwxjvsCrLNDs8VxqU7qjD2HXxW7xxsEiliYP73ekiJNCDLZ3QxVOa4O5UsRgRj+yV0Cv
 EtxzorddutFpBzwV8J3SOTBK996SDKD9iqZ0PSOh6glk4BeDXguSVg6XUx99p9rPdqezEwVR6V
 RDSSTHwSXnxJS3dhqqMSq8prXfNHTbrOoY1oMINalFP+MayNCi7RPnhMFa6PmICL2SWGzkz2Dl
 W3T+jluWsjZpa925KLmqmASpd0S8bAl64061Ni5NvfZwM/vKp6To3FQ1XJDc+4ygd+WuN5XFNF
 cfs=
X-SBRS: 2.7
X-MesageID: 5543709
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5543709"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 17:04:04 +0100
Message-ID: <20190913160404.495-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL print
 message
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWVzc2FnZSBzdWNoIGFzOgoKICAoWEVOKSBkM3YwIFZJUklESUFOIENSQVNIOiA1MSAxIGZmZmY5
NzAwZTE0NmIwMDAgMTAwMCAyMDQKCmhhdmUgY29uZnVzZWQgbWFueSBwZW9wbGUgaW50byB0aGlu
a2luZyB0aGUgdGhlIHByb2JsZW0gaXMgYSBidWcgaW4gdGhlCnZpcmlkaWFuIGNvZGUuICBUaGUg
cHJlZml4IHdhcyBpbnRlbmRlZCB0byBzaWduaWZ5IHRoZSB1c2Ugb2YgdGhlIHZpcmlkaWFuCmNy
YXNoLXJlcG9ydGluZyBpbnRlcmZhY2UuCgpSZXBsYWNlIHRoZSBWSVJJRElBTiBwcmVmaXggd2l0
aCAncmVwb3J0ZWQnIHRvIHJlZHVjZSB0aGUgY29uZnVzaW9uIHRvCm5vbi14ZW4tZGV2ZWxvcGVy
cyB0cnlpbmcgdG8gaW50ZXJwcmV0IHRoZSBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPgoKVGhpcyB3YW50cyBiYWNrcG9ydGluZyB0byBldmVyeSBzdGFibGUg
dHJlZSB3aGljaCBoYXMgdmlyaWRpYW4gY3Jhc2ggaW50ZXJmYWNlCnN1cHBvcnQuCi0tLQogeGVu
L2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJp
ZGlhbi5jCmluZGV4IDRiMDZiNzhhMjcuLmY5OGM4ZTc3NTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zpcmlk
aWFuL3ZpcmlkaWFuLmMKQEAgLTM1Nyw3ICszNTcsNyBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfdmlyaWRp
YW4oc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQogICAgICAgICBk
LT5zaHV0ZG93bl9jb2RlID0gU0hVVERPV05fY3Jhc2g7CiAgICAgICAgIHNwaW5fdW5sb2NrKCZk
LT5zaHV0ZG93bl9sb2NrKTsKIAotICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiVklS
SURJQU4gQ1JBU0g6ICVseCAlbHggJWx4ICVseCAlbHhcbiIsCisgICAgICAgIGdwcmludGsoWEVO
TE9HX1dBUk5JTkcsICJyZXBvcnRlZCBDUkFTSDogJWx4ICVseCAlbHggJWx4ICVseFxuIiwKICAg
ICAgICAgICAgICAgICB2di0+Y3Jhc2hfcGFyYW1bMF0sIHZ2LT5jcmFzaF9wYXJhbVsxXSwgdnYt
PmNyYXNoX3BhcmFtWzJdLAogICAgICAgICAgICAgICAgIHZ2LT5jcmFzaF9wYXJhbVszXSwgdnYt
PmNyYXNoX3BhcmFtWzRdKTsKICAgICAgICAgYnJlYWs7Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
