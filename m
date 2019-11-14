Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A2FC385
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 11:02:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVBum-0006M5-Nr; Thu, 14 Nov 2019 09:59:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwvT=ZG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVBul-0006Ly-4R
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 09:59:47 +0000
X-Inumbo-ID: 7c36cfde-06c5-11ea-a247-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c36cfde-06c5-11ea-a247-12813bfff9fa;
 Thu, 14 Nov 2019 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573725586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t9GV1NujlAmBFeTzafCMRyHB6hkDZoHx2Wt5XiKh5UQ=;
 b=E7RMNb6YIpK2hxtMRxbUbyTfJpcB265jHoWaHQU67nVrwNsPK1VhZ56K
 84/otJLNu3o60jZcz3MkUbFganxwCR7lnmpknOJCa/FP+S3DYesd/UAaJ
 0qn9GtFqXljSMzDIhRngCnmoalTg62d9g2FbfbITbPto/3e6KqCSYP6c7 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hHYFKP4hFIE493L4ZFvEWze0Et6jHDjMrNRyN0BdUSmEFNzjz+i/JMkH3GlAluHe0WL8jeRf2Q
 eTn1JQ4T6HSDF7GIke3bnEmNs3zyuL3Bex1Yu8IakTit1RYL9j3VTapYItXFDxgeJGx8qj3N+o
 8FTpTM7qRxLzHUbPBPZXPzbUC/xkFHyzEKmbY+NGqaYJNIqPcYKhq7v1VXb0e+ITkYFNmzmZ73
 TE6CpxpmPM/cd9LfFwZLytpModJycbocPerAJapMnch7MNOMS9aqWFXBSFZkciVKgDmmZkdZ4J
 tq0=
X-SBRS: 2.7
X-MesageID: 8427495
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8427495"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 14 Nov 2019 10:59:27 +0100
Message-ID: <20191114095927.83723-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/clang: move and fix .skip check
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LnNraXAgaXMgb25seSB1c2VkIGJ5IHg4NiBjb2RlLCBzbyBwbGFjZSB0aGUgY2xhbmcgLnNraXAg
d2l0aCBsYWJlbHMKY2hlY2sgaW4geDg2L1J1bGVzLm1rIGluc3RlYWQgb2YgdGhlIHRvcCBsZXZl
bCBSdWxlcy5tay4gV2hpbGUgdGhlcmUKYWxzbyBmaXggYW4gaXNzdWUgd2l0aCBpdCBieSByZW1v
dmluZyB0aGUgJ1xuJyB3aGljaCB0cmlnZ2VycyB0aGUKZm9sbG93aW5nIGVycm9yOgoKPHN0ZGlu
PjoxOjMxOiBlcnJvcjogbWlzc2luZyB0ZXJtaW5hdGluZyAnIicgY2hhcmFjdGVyIFstV2Vycm9y
LC1XaW52YWxpZC1wcC10b2tlbl0Kdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggIi5MMDoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo8c3RkaW4+OjE6MzE6IGVycm9yOiBleHBl
Y3RlZCBzdHJpbmcgbGl0ZXJhbCBpbiAnYXNtJwo8c3RkaW4+OjM6MTg6IGVycm9yOiBtaXNzaW5n
IHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3IsLVdpbnZhbGlkLXBwLXRva2VuXQou
c2tpcCAoLkwxIC0gLkwwKSIgKTsgfQogICAgICAgICAgICAgICAgIF4KPHN0ZGluPjozOjI0OiBl
cnJvcjogZXhwZWN0ZWQgJyknCi5za2lwICguTDEgLSAuTDApIiApOyB9CiAgICAgICAgICAgICAg
ICAgICAgICAgXgo8c3RkaW4+OjE6Mjk6IG5vdGU6IHRvIG1hdGNoIHRoaXMgJygnCnZvaWQgXyh2
b2lkKSB7IGFzbSB2b2xhdGlsZSAoICIuTDA6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
CjxzdGRpbj46MzoyNDogZXJyb3I6IGV4cGVjdGVkICd9Jwouc2tpcCAoLkwxIC0gLkwwKSIgKTsg
fQogICAgICAgICAgICAgICAgICAgICAgIF4KPHN0ZGluPjoxOjE0OiBub3RlOiB0byBtYXRjaCB0
aGlzICd7Jwp2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAiLkwwOgogICAgICAgICAgICAg
Xgo1IGVycm9ycyBnZW5lcmF0ZWQuCgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KTkI6
IHdpbGwgbmVlZCByZWJhc2luZyBvbiB0b3Agb2YgSmFuJ3MgcGF0Y2ggKG9yIHRoZSBvdGhlciB3
YXkKYXJvdW5kKS4KLS0tCiB4ZW4vUnVsZXMubWsgICAgICAgICAgfCA3IC0tLS0tLS0KIHhlbi9h
cmNoL3g4Ni9SdWxlcy5tayB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxl
cy5tawppbmRleCAzMDkwZWE3ODI4Li5kMWMwNjBjM2NmIDEwMDY0NAotLS0gYS94ZW4vUnVsZXMu
bWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC03NiwxMyArNzYsNiBAQCBlbmRpZgogCiBBRkxBR1Mt
eSAgICAgICAgICAgICAgICArPSAtRF9fQVNTRU1CTFlfXwogCi0jIE9sZGVyIGNsYW5nJ3MgYnVp
bHQtaW4gYXNzZW1ibGVyIGRvZXNuJ3QgdW5kZXJzdGFuZCAuc2tpcCB3aXRoIGxhYmVsczoKLSMg
aHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0yNzM2OQotaWZlcSAoJChjbGFu
ZykseSkKLSQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLkwwOlxuLkwxOlxuLnNraXAg
KC5MMSAtIC5MMCkiLCxcCi0gICAgICAgICAgICAgICAgICAgICAtbm8taW50ZWdyYXRlZC1hcykK
LWVuZGlmCi0KIEFMTF9PQkpTIDo9ICQoQUxMX09CSlMteSkKIAogIyBHZXQgZ2NjIHRvIGdlbmVy
YXRlIHRoZSBkZXBlbmRlbmNpZXMgZm9yIHVzLgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L1J1
bGVzLm1rIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCmluZGV4IDY1OWFjM2Q4M2UuLjMyOGJiZmVh
OWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4vYXJjaC94ODYv
UnVsZXMubWsKQEAgLTgzLDQgKzgzLDkgQEAgJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLEND
LCIuaW5jbHVkZSBcImFzbS9pbmRpcmVjdF90aHVua19hc20uaFwiIiwsXAogJChjYWxsIGFzLW9w
dGlvbi1hZGQsQ0ZMQUdTLENDLFwKICAgICAgICAgICAgICAgICAgICAgICIubWFjcm8gRk9PXG4u
ZW5kbVwiKTsgYXNtIHZvbGF0aWxlIChcIi5tYWNybyBGT09cbi5lbmRtIixcCiAgICAgICAgICAg
ICAgICAgICAgICAtbm8taW50ZWdyYXRlZC1hcykKKworIyBPbGRlciBjbGFuZydzIGJ1aWx0LWlu
IGFzc2VtYmxlciBkb2Vzbid0IHVuZGVyc3RhbmQgLnNraXAgd2l0aCBsYWJlbHM6CisjIGh0dHBz
Oi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjczNjkKKyQoY2FsbCBhcy1vcHRpb24t
YWRkLENGTEFHUyxDQywiLkwwOiAuTDE6IC5za2lwICguTDEgLSAuTDApIiwsXAorICAgICAgICAg
ICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCiBlbmRpZgotLSAKMi4yNC4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
