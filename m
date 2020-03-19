Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E118BB1B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:28:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEx45-0003N6-Uj; Thu, 19 Mar 2020 15:26:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEx44-0003N1-5W
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:26:32 +0000
X-Inumbo-ID: 023af7f2-69f6-11ea-bec1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 023af7f2-69f6-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584631592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QCGrVYGEjLEO6zVWZL79iMw684v/rwuLqSMN1zEE6Qo=;
 b=BjcOU/XyseZokFWyYZTyjbW1on8KOOJxDRmr2b9Ej4Uwfz/SiSbjodBg
 /dnWbJHYPCLzamgFANbZR0F21sETErXQ0d8kYSSqLMifOFxOeCzvH6Nze
 bSUwb20Bh4g7Qj9M2jLy2uNLTLTJhTZBjVh3QrtbKYB6tT6cYEtnf0BxU 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9QttPkrtMrdeKawQXhq2M4u1trwngHKXPjWEFw3crRdAu+EsQFrz4jQNfp9P5M/3k8XZ0gjDkp
 6hXDbwJqOJXHPu9y4FqzmM/Gd2KqkFQ2gQ8vlYf2hfCTuaFM7Zy6Dc1YBF9K2LzkFvv8bDpxB1
 LF0muTGj2y/gqLDjJTRHZ2lqlT3CaAaWWpxpZ4e2pPz42oiRXBhuDuDTlUwBfk4chQXm7Y78mA
 5uT1pJuDxuAngnVQKS8rs9NadWd2OjGk0kfd1RY7W77trq4oktA/Xy3h1bWVOTbMe7CjUPuE2i
 RPc=
X-SBRS: 2.7
X-MesageID: 14487476
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14487476"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 15:26:16 +0000
Message-ID: <20200319152622.31758-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] x86/ucode: Cleanup - Part 1/n
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBnb3Qgc2FkIGF0IHRoZSBzdGF0ZSBvZiBtaWNyb2NvZGUgaGFuZGxpbmcgd2hpbGUgaW52ZXN0
aWdhdGluZyBhbiBpc3N1ZS4KVGhpcyBpcyBzb21lIHByZWxpbWluYXJ5IGNsZWFudXAsIHdpdGgg
dGhlIG9ubHkgcHJhY3RpY2FsIGNoYW5nZXMgaW4gcGF0Y2ggNC4KCkFuZHJldyBDb29wZXIgKDYp
OgogIHg4Ni91Y29kZTogUmVtb3ZlIGRlY2xhcmF0aW9ucyBmb3Igbm9uLWV4dGVybmFsIGZ1bmN0
aW9ucwogIHg4Ni91Y29kZTogTW92ZSBtaWNyb2NvZGUgaW50byBpdHMgb3duIGRpcmVjdG9yeQog
IHg4Ni91Y29kZTogTW92ZSBpbnRlcmZhY2UgZnJvbSBwcm9jZXNzb3IuaCB0byBtaWNyb2NvZGUu
aAogIHg4Ni91Y29kZTogUmF0aW9uYWxpc2Ugc3RhcnR1cCBhbmQgZmFtaWx5L21vZGVsIGNoZWNr
cwogIHg4Ni91Y29kZTogQWx0ZXIgb3BzLT5mcmVlX3BhdGNoKCkgdG8gZnJlZSB0aGUgZW50aXJl
IHBhdGNoCiAgeDg2L3Vjb2RlOiBNYWtlIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggb3BhcXVlCgog
eGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAt
LQogeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCiB4ZW4vYXJjaC94ODYvY3B1L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL01ha2VmaWxlICAgICAgICAgICAgICAg
IHwgIDMgKysKIC4uLi94ODYve21pY3JvY29kZV9hbWQuYyA9PiBjcHUvbWljcm9jb2RlL2FtZC5j
fSAgIHwgNTQgKysrKysrKystLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L3ttaWNyb2NvZGUuYyA9
PiBjcHUvbWljcm9jb2RlL2NvcmUuY30gfCA2MiArKysrKysrKysrKy0tLS0tLS0tLS0tCiAuLi4v
e21pY3JvY29kZV9pbnRlbC5jID0+IGNwdS9taWNyb2NvZGUvaW50ZWwuY30gICB8IDQ3ICsrKysr
Ky0tLS0tLS0tLS0KIC4uLi94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmh9ICAgICAgICAgICAg
ICAgICAgIHwgMzMgKysrKy0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJj
YWxsLmMgICAgICAgICAgICAgICAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB4ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
bWljcm9jb2RlLmggICAgICAgICAgICAgICAgICAgIHwgMzYgKysrLS0tLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCAgICAgICAgICAgICAgICAgICAgfCAgOSAtLS0tCiAx
NSBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAxNjIgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvTWFrZWZpbGUKIHJlbmFt
ZSB4ZW4vYXJjaC94ODYve21pY3JvY29kZV9hbWQuYyA9PiBjcHUvbWljcm9jb2RlL2FtZC5jfSAo
OTUlKQogcmVuYW1lIHhlbi9hcmNoL3g4Ni97bWljcm9jb2RlLmMgPT4gY3B1L21pY3JvY29kZS9j
b3JlLmN9ICg5NiUpCiByZW5hbWUgeGVuL2FyY2gveDg2L3ttaWNyb2NvZGVfaW50ZWwuYyA9PiBj
cHUvbWljcm9jb2RlL2ludGVsLmN9ICg5MiUpCiBjb3B5IHhlbi97aW5jbHVkZS9hc20teDg2L21p
Y3JvY29kZS5oID0+IGFyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5ofSAoNTclKQoKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
