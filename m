Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793DBB2402
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:23:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oJA-0007eb-Pn; Fri, 13 Sep 2019 16:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8oJ8-0007eU-R3
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:20:26 +0000
X-Inumbo-ID: 6447bfea-d642-11e9-95af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6447bfea-d642-11e9-95af-12813bfff9fa;
 Fri, 13 Sep 2019 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568391626;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Vs8jextvbTqcQh/NkdQfvsElfYfr2aJSQ2QtGTtzVxw=;
 b=GnAGDjYecrN7+/APe8SKTGcIQHnzpkM9SQi5stp9aUKcEyPGKATEfIYX
 RWc+ZPYPXSUySeZMZxkMRI5Z2/0SCJUIDrpilKulV2do2nHjmXaIYDOyL
 NzF66IatvaicXa1gfnA7NkUO6NNX4sisWkhbZMbt+ywBuucjXPPLgoXCD s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 48UjLFRDoUjys98vfXB3bxqkqL8QcSLRlJdxfwL8/Qba2ZvvykvHu7JzsDuOFblJKmQNP6lBoG
 KgomZ93jcXhufW5W9G+hONNp17rEbHEteGbPZCmb6LM5L1TfZ3j3NJrB0J5o0GsONSI5hBegEz
 fpS43jUOlFGYsSrfzGwgSddWyoqLn6eNa5UqVdCMaUKUrk5sAPzGT4VjTeST3xnXSEbS4SrPK0
 6MCQMILMc53rA0WlSOis3zZXOON9bBo9eUCLuoUDY1dUYIbvg6JktNJQSq2TCDab8HHQdCiAU0
 wos=
X-SBRS: 2.7
X-MesageID: 5547347
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5547347"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 17:20:21 +0100
Message-ID: <20190913162021.23329-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] drivers/acpi: Drop "ERST table was not found"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RVJTVCBpc24ndCBhIG1hbmRhdG9yeSB0YWJsZSwgYW5kIGFsc28gaXNuJ3QgdmVyeSBjb21tb24g
dG8gZmluZC4gIFRoZSBtZXNzYWdlCmlzIHVubmVjZXNzYXJ5IG5vaXNlIGR1cmluZyBib290LiAg
RnVydGhlcm1vcmUsIGl0IGlzIHJlZHVuZGFudCB3aXRoIHRoZSBsaXN0Cm9mIGZvdW5kIEFDUEkg
dGFibGVzIHByaW50ZWQganVzdCBhaGVhZC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgotLS0KIHhlbi9kcml2ZXJzL2FjcGkvYXBlaS9lcnN0LmMgfCA1ICsrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL2FjcGkvYXBlaS9lcnN0LmMgYi94ZW4vZHJpdmVycy9hY3BpL2FwZWkv
ZXJzdC5jCmluZGV4IDIzYTRlODIyZTcuLmM1ZGY1MTJiOTggMTAwNjQ0Ci0tLSBhL3hlbi9kcml2
ZXJzL2FjcGkvYXBlaS9lcnN0LmMKKysrIGIveGVuL2RyaXZlcnMvYWNwaS9hcGVpL2Vyc3QuYwpA
QCAtNzkxLDEwICs3OTEsOSBAQCBpbnQgX19pbml0IGVyc3RfaW5pdCh2b2lkKQogCQlyZXR1cm4g
LUVOT0RFVjsKIAogCXN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlX3BoeXMoQUNQSV9TSUdfRVJTVCwg
MCwgJmVyc3RfYWRkciwgJmVyc3RfbGVuKTsKLQlpZiAoc3RhdHVzID09IEFFX05PVF9GT1VORCkg
ewotCQlwcmludGsoS0VSTl9JTkZPICJFUlNUIHRhYmxlIHdhcyBub3QgZm91bmRcbiIpOworCWlm
IChzdGF0dXMgPT0gQUVfTk9UX0ZPVU5EKQogCQlyZXR1cm4gLUVOT0RFVjsKLQl9CisKIAlpZiAo
QUNQSV9GQUlMVVJFKHN0YXR1cykpIHsKIAkJY29uc3QgY2hhciAqbXNnID0gYWNwaV9mb3JtYXRf
ZXhjZXB0aW9uKHN0YXR1cyk7CiAJCXByaW50ayhLRVJOX1dBUk5JTkcgIkZhaWxlZCB0byBnZXQg
RVJTVCB0YWJsZTogJXNcbiIsIG1zZyk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
