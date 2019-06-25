Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DC552C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:01:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmty-0004GQ-Hi; Tue, 25 Jun 2019 14:58:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfmtx-0004GL-0h
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:58:29 +0000
X-Inumbo-ID: aff776a3-9759-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aff776a3-9759-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 14:58:27 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DzvAelj4n+h43jA4j0B7rABQjUoixDYL20gdqWreUao6lSml24KfvJizOpkvFj9eEd93AfIGW5
 cxtD2/ojmFw+QEIlRT5w8BriSj3xdDWxjRsUbE6rOnP4yk2dCQF2CU5vT2YLeIUjsz9sIBsvFF
 2m3DMyOWZmMhcIeE9nuEGbcXZu7kOhP/OsBOsNT3Dr81PdLIHQLbRSJ6Ve4H7vOr0ncfDBlFTP
 E3Jvl/QQuOrfV5llPn4hi4nJTnUMg9UcnzmVH7u21kqgG91NGpg+4aTjF4ejlyBggP1WOxKm22
 D/A=
X-SBRS: 2.7
X-MesageID: 2205519
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2205519"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2019 15:58:23 +0100
Message-ID: <20190625145823.17544-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625144350.6176-1-andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/3] nodemask: Don't opencode cycle_node()
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L251bWEuYyAgICAgfCA0ICstLS0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgNyArKy0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbnVtYS5jIGIveGVuL2FyY2gveDg2L251bWEuYwppbmRleCBj
MzZjNjllODQyLi5mN2QzMjBmMjA3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbnVtYS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9udW1hLmMKQEAgLTE5Miw5ICsxOTIsNyBAQCB2b2lkIF9faW5pdCBu
dW1hX2luaXRfYXJyYXkodm9pZCkKICAgICAgICAgaWYgKCBjcHVfdG9fbm9kZVtpXSAhPSBOVU1B
X05PX05PREUgKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIG51bWFfc2V0X25vZGUo
aSwgcnIpOwotICAgICAgICByciA9IG5leHRfbm9kZShyciwgJm5vZGVfb25saW5lX21hcCk7Ci0g
ICAgICAgIGlmICggcnIgPT0gTUFYX05VTU5PREVTICkKLSAgICAgICAgICAgIHJyID0gZmlyc3Rf
bm9kZSgmbm9kZV9vbmxpbmVfbWFwKTsKKyAgICAgICAgcnIgPSBjeWNsZV9ub2RlKHJyLCAmbm9k
ZV9vbmxpbmVfbWFwKTsKICAgICB9CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKaW5kZXggZmUxMTU5YjM1Mi4uODg1ODc2
NmM5NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMKQEAgLTgyMywxMSArODIzLDggQEAgc3RhdGljIHN0cnVjdCBwYWdlX2lu
Zm8gKmdldF9mcmVlX2J1ZGR5KHVuc2lnbmVkIGludCB6b25lX2xvLAogICAgIGlmICggbm9kZSA9
PSBOVU1BX05PX05PREUgKQogICAgIHsKICAgICAgICAgaWYgKCBkICE9IE5VTEwgKQotICAgICAg
ICB7Ci0gICAgICAgICAgICBub2RlID0gbmV4dF9ub2RlKGQtPmxhc3RfYWxsb2Nfbm9kZSwgJm5v
ZGVtYXNrKTsKLSAgICAgICAgICAgIGlmICggbm9kZSA+PSBNQVhfTlVNTk9ERVMgKQotICAgICAg
ICAgICAgICAgIG5vZGUgPSBmaXJzdF9ub2RlKCZub2RlbWFzayk7Ci0gICAgICAgIH0KKyAgICAg
ICAgICAgIG5vZGUgPSBjeWNsZV9ub2RlKGQtPmxhc3RfYWxsb2Nfbm9kZSwgJm5vZGVtYXNrKTsK
KwogICAgICAgICBpZiAoIG5vZGUgPj0gTUFYX05VTU5PREVTICkKICAgICAgICAgICAgIG5vZGUg
PSBjcHVfdG9fbm9kZShzbXBfcHJvY2Vzc29yX2lkKCkpOwogICAgIH0KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
