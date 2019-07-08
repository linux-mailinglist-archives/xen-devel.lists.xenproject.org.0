Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3E62B5F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 00:18:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkbv4-0004Bq-EK; Mon, 08 Jul 2019 22:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7H6o=VF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hkbv3-0004Bj-Dc
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 22:15:33 +0000
X-Inumbo-ID: e356ed46-a1cd-11e9-9468-4381ec70f449
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e356ed46-a1cd-11e9-9468-4381ec70f449;
 Mon, 08 Jul 2019 22:15:27 +0000 (UTC)
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
IronPort-SDR: RUOcOUU8Jo5a/CCphOFSgBuDOYWbmFjBR6yu/bpeaNINxWa0LWwSGntgQJjJCS6fLuwnEdDsJv
 A9Bi1pqZO+f+JIaweOTg4LW3KW+E87/Ng90xk+upd904+BOWiuXm8A0D5MThvr8EVwPRDAvpui
 mbEwGcQL2nQP7NCAlfvz7VmM7nkVh36VlTflLD0Fwaz/6+L08wlUi3kyfyplos5Nqlh3CfElg7
 ed2htKEhrvLri6AGbpJ219mehcrwKJYq1P85y1t+UppovK4KfeYJhtIXJjQkU9ouqEX1PzXWEA
 05s=
X-SBRS: 2.7
X-MesageID: 2704810
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,468,1557201600"; 
   d="scan'208";a="2704810"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 8 Jul 2019 23:15:22 +0100
Message-ID: <20190708221522.967-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/grant: Use explicit instruction size in
 gnttab_clear_flags()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIE9wZW5TVVNFIExlYXAgY29tcGlsZXJzIGNvbXBsYWluIGFib3V0IGFtYmlndWl0eToKCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBncmFudF90YWJsZS5jOjMzOgpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi4ueGVuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmg6MzA6Ci4uLnhlbi9pbmNsdWRlL2Fz
bS9ncmFudF90YWJsZS5oOjY3OjE5OiBlcnJvcjogYW1iaWd1b3VzIGluc3RydWN0aW9ucyByZXF1
aXJlCmFuIGV4cGxpY2l0IHN1ZmZpeCAoY291bGQgYmUgJ2FuZGInLCAnYW5kdycsICdhbmRsJywg
b3IgJ2FuZHEnKQogICAgYXNtIHZvbGF0aWxlICgibG9jayBhbmQgJTEsJTAiIDogIittIiAoKmFk
ZHIpIDogImlyIiAoKHVpbnQxNl90KX5tYXNrKSk7CiAgICAgICAgICAgICAgICAgIF4KPGlubGlu
ZSBhc20+OjE6Mjogbm90ZTogaW5zdGFudGlhdGVkIGludG8gYXNzZW1ibHkgaGVyZQogICAgICAg
IGxvY2sgYW5kICQtMTcsKCVyc2kpCiAgICAgICAgXgoKRnVsbCBsb2dzOiBodHRwczovL2dpdGxh
Yi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuLy0vam9icy8yNDc2MDAyODQKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ncmFudF90YWJsZS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ncmFudF90YWJsZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ncmFudF90YWJsZS5oCmlu
ZGV4IDU2OGE2YmI1N2MuLjYxYzg4OWIyOTcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3JhbnRfdGFibGUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2dyYW50X3RhYmxlLmgK
QEAgLTY0LDcgKzY0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdudHRhYl9jbGVhcl9mbGFncyhz
dHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgbWFzaywgdWludDE2X3QgKmFkZHIpCiB7CiAgICAgLyogQWNjZXNzIG11c3Qg
YmUgY29uZmluZWQgdG8gdGhlIHNwZWNpZmllZCAyIGJ5dGVzLiAqLwotICAgIGFzbSB2b2xhdGls
ZSAoImxvY2sgYW5kICUxLCUwIiA6ICIrbSIgKCphZGRyKSA6ICJpciIgKCh1aW50MTZfdCl+bWFz
aykpOworICAgIGFzbSB2b2xhdGlsZSAoImxvY2sgYW5kdyAlMSwlMCIgOiAiK20iICgqYWRkcikg
OiAiaXIiICgodWludDE2X3Qpfm1hc2spKTsKIH0KIAogLyogRm9yZWlnbiBtYXBwaW5ncyBvZiBI
Vk0tZ3Vlc3QgcGFnZXMgZG8gbm90IG1vZGlmeSB0aGUgdHlwZSBjb3VudC4gKi8KLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
