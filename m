Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F396181F42
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:23:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC525-0002z1-24; Wed, 11 Mar 2020 17:20:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC523-0002yw-Fe
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:20:35 +0000
X-Inumbo-ID: 9d7c516a-63bc-11ea-b027-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d7c516a-63bc-11ea-b027-12813bfff9fa;
 Wed, 11 Mar 2020 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583947234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/BjKoiOIXnCoIb8GyzLHLIBG3RMyNlkDODrdMAM2RvA=;
 b=fB9RA6TZASZQ1g00lBnTlch1Dnh+hLeoSRvhUJizC8bHQlolgx4azN6f
 MdX//w2Mhpm+EREl15O0lLbWGQDiD6AavV/sI7Zkf/hUPvglXvreLfQxY
 iQvYOc2HsU2ct57geS04PEgQwkz5iTxw8I58TKmLM6UiPDq32YSvVAS4M c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SrKN8Y1KjoHEREBvJ9hmkGKFH7+0qpETGtNRhnlPEKPI+HVEaL+rZnPgOr0X57UAkVYJ04P54B
 tKCG3rVh2fb40BXpn2qSJQJh1SOED0gc8qDV54xJpuhhCHAa89vS7d4+Y1H8hqVVEd6ZZwe0j9
 Y1XbWGV0R4S2E/xL/1vqCaAvdN2bPjvzx+tH7A4xPSRbRLFaEawj1aZjS+jsnuh5yWIx/Z7x21
 P6dJJAMk0WMY1JXjGoV2j+lsnLN4Uzre2XoGT9STzY7/wy8BuB9ooqwTBH8DWaBkN5FYaRMmzB
 GVE=
X-SBRS: 2.7
X-MesageID: 13794323
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13794323"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:20:05 +0100
Message-ID: <20200311172010.7777-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v5 1/5] host: introduce modify_host
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWJzdHJhY3QgdGhlIHNldF9wcm9wZXJ0eSBjaGVja3MgYW5kIERCIGNhbGwgaW50byBhIGhlbHBl
ci4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpSZXF1ZXN0ZWQgb24gSVJDOgoxNzowOTozMCBE
aXppZXQgQWxzbyBpZiBpdCB3ZXJlIG1lIEkgd291bGQgcHV0IHRoZSBtb2RpZnlfaG9zdCByZWZh
Y3RvcmluZyBpbiBpdHMgb3duIG5mYyBwYXRjaCwKICAgICAgICAgICAgICAgIGJ1dCBJIHdvbid0
IGluc2lzdCBvbiB0aGF0Li4uCi0tLQpjaGFuZ2VzIHNpbmNlIHY0OgogLSBOZXcgaW4gdGhpcyB2
ZXJzaW9uLgotLS0KIE9zc3Rlc3QvSG9zdERCL0V4ZWN1dGl2ZS5wbSB8IDE2ICsrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL09zc3Rlc3QvSG9zdERCL0V4ZWN1dGl2ZS5wbSBiL09zc3Rlc3QvSG9zdERC
L0V4ZWN1dGl2ZS5wbQppbmRleCA3ZmZjYTZjNC4uZDQwMmJjYWMgMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvSG9zdERCL0V4ZWN1dGl2ZS5wbQorKysgYi9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0K
QEAgLTUxLDYgKzUxLDE2IEBAIEVORAogICAgIH0KIH0KIAorc3ViIG1vZGlmeV9ob3N0ICgkJCQp
IHsKKyAgICBteSAoJGhkLCAkaG8sICRxdWVyeSkgPSBAXzsKKyAgICBteSAkYmxlc3NpbmcgPSBp
bnRlbmRlZF9ibGVzc2luZygpOworCisgICAgZGllICJBdHRlbXB0aW5nIHRvIG1vZGlmeSBob3N0
IHdpdGggaW50ZW5kZWQgYmxlc3NpbmcgJGJsZXNzaW5nICE9IHJlYWwiCisgICAgICAgIGlmICRi
bGVzc2luZyBuZSAicmVhbCI7CisKKyAgICBkYl9yZXRyeSgkZGJoX3Rlc3RzLCBbcXcocmVzb3Vy
Y2VzKV0sICRxdWVyeSk7Cit9CisKIHN1YiBzZXRfcHJvcGVydHkoJCQkJCkgewogICAgIG15ICgk
aGQsICRobywgJHByb3AsICR2YWwpID0gQF87CiAgICAgbXkgJHJtcSA9ICRkYmhfdGVzdHMtPnBy
ZXBhcmUoPDxFTkQpOwpAQCAtNjEsMTIgKzcxLDggQEAgRU5ECiAgICAgICAgIElOU0VSVCBJTlRP
IHJlc291cmNlX3Byb3BlcnRpZXMgKHJlc3R5cGUscmVzbmFtZSxuYW1lLHZhbCkKICAgICAgICAg
ICAgICAgIFZBTFVFUyAoJ2hvc3QnLCA/LD8sPykKIEVORAotICAgIG15ICRibGVzc2luZyA9IGlu
dGVuZGVkX2JsZXNzaW5nKCk7Ci0KLSAgICBkaWUgIkF0dGVtcHRpbmcgdG8gbW9kaWZ5IGhvc3Qg
cHJvcHMgd2l0aCBpbnRlbmRlZCBibGVzc2luZyAkYmxlc3NpbmcgIT0gcmVhbCIKLSAgICAgICAg
aWYgJGJsZXNzaW5nIG5lICJyZWFsIjsKIAotICAgIGRiX3JldHJ5KCRkYmhfdGVzdHMsIFtxdyhy
ZXNvdXJjZXMpXSwgc3ViIHsKKyAgICBtb2RpZnlfaG9zdCgkaGQsICRobywgc3ViIHsKICAgICAg
ICAgJHJtcS0+ZXhlY3V0ZSgkaG8tPntOYW1lfSwgJHByb3ApOwogICAgICAgICBpZiAobGVuZ3Ro
ICR2YWwpIHsKICAgICAgICAgICAgICRhZGRxLT5leGVjdXRlKCRoby0+e05hbWV9LCAkcHJvcCwg
JHZhbCk7Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
