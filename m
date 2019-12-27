Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C740112B4E4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:42:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikppV-0002Pj-O2; Fri, 27 Dec 2019 13:39:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikppV-0002Pe-67
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:39:01 +0000
X-Inumbo-ID: 37f05538-28ae-11ea-b6f1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37f05538-28ae-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577453932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GCXU2Yyuvbz6RFIhxpRcUmiPImEjBeeQBy4zXJV5RcU=;
 b=OzuP60YiYwL6d0fp5Z4XRa0NMtfAj4XnE0BP4RG2I4oGr5GrXmupiV2b
 cVdFo0TsFD2OP4np015pB3KvpjpdRo8FbLAeLa3uMCMGxMbmRH8Bu6GTv
 QoklEZh3Rf8Nmzna01pQI1zRZhIqgSt0vmOx0lRwce/N6psqhhi9/IgyS w=;
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
IronPort-SDR: VsohBkw9k+r2wF9z1A0329308tu0qm4/iM4uA4u9SqIOZNaAxHXglDABTDKRpTwkOTR5+XkjKn
 b78xbKMw+6tDyRgyj9payOqdzLQBCflO0MY1Ytif15cTfe2KEXqwVXaGLIcahQ36LmRhimJxWg
 FR+i8fIkg+M4Ja/2nxfkvNxd1luWWjxuM4P2OcRKHpgdqk0odB6nieNCx5CWuHsJtDqOSnfjok
 YjH0pyM1ktuPpvF091qkj9JhMIZ1TjtAKQ4K5gNExGw6d1BW8AV7CmkNoqufNb6xESdMt7Srqo
 afY=
X-SBRS: 2.7
X-MesageID: 10179017
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10179017"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 13:38:48 +0000
Message-ID: <20191227133848.9776-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libxc: Fix HVM_PARAM_PAE_ENABLED handling
 in xc_cpuid_apply_policy()
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVzcGl0ZSBhcyBzdWdnZXN0ZWQgaW4gYy9zIDY4NWU5MjJkNmYzLCBub3QgYWxsIEhWTV9QQVJB
TXMgYXJlIGhhbmRsZWQKaW4gdGhlIHNhbWUgd2F5LiAgSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlz
IGEgdG9vbHN0YWNrLW9ubHkgdmFsdWUsIGFuZAp0aGUgeGNfY3B1aWRfYXBwbHlfcG9saWN5KCkg
dXNlZCB0byBiZSB0aGUgb25seSBjb25zdW1lci4KClJlaW5zdGF0ZSB0aGUgb2xkIGJlaGF2aW91
ciAobWFkIGFzIGl0IGlzKSB0byBhdm9pZCByZWdyZXNzaW9ucy4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGNpdHJpeC5jb20+CgpTcG90dGVkIHdoaWxlIHRyeWluZyB0byBjb21lIHVwIHdpdGgg
YSBsZXNzIG1hZCBiZWhhdmlvdXIsIGFuZCB3b25kZXJpbmcKd2hlcmUgdGhlIGNvbnN1bWVyIGhh
ZCBkaXNhcHBhZXJlZCB0by4KClRoaXMgbmVlZHMgYmFja3BvcnRpbmcgdG8gNC4xMy4KCkkgd2Fz
IHRlbXB0ZWQgdG8gbm90IGZpeCBpdCBmb3IgdGhlIGdlbmVyYWwgc2VjdXJpdHkgYmV0dGVybmVz
cyBvZiB0aGUKd29ybGQgKGRpc2FibGluZyBQQUUgZGlzYWJsZXMgTlggYW5kIDY0Yml0KSwgYW5k
IHdoaWxlIEkgY291bGQgcHJvYmFibHkKZ2V0IGF3YXkgd2l0aCBpdCwgaXQgd291bGQgYSBsaXR0
bGUgcnVkZSB0byBkbyBzby4KLS0tCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyB8IDEyICsr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5j
CmluZGV4IDUxOWQ2ZDhiZDAuLjI1NDBhYTFlMWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hj
X2NwdWlkX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCkBAIC01NzksNiAr
NTc5LDggQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWlu
dDMyX3QgZG9taWQsCiAgICAgfQogICAgIGVsc2UKICAgICB7CisgICAgICAgIHVpbnQ2NF90IHZh
bDsKKwogICAgICAgICAvKgogICAgICAgICAgKiBUb3BvbG9neSBmb3IgSFZNIGd1ZXN0cyBpcyBl
bnRpcmVseSBjb250cm9sbGVkIGJ5IFhlbi4gIEZvciBub3csIHdlCiAgICAgICAgICAqIGhhcmRj
b2RlIEFQSUNfSUQgPSB2Y3B1X2lkICogMiB0byBnaXZlIHRoZSBpbGx1c2lvbiBvZiBubyBTTVQu
CkBAIC02MzMsNiArNjM1LDE2IEBAIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJm
YWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICB9CiAKICAgICAgICAgLyoKKyAgICAg
ICAgICogSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIGEgcGFyYW1ldGVyIHRvIHRoaXMgZnVuY3Rp
b24sIHN0YXNoZWQgaW4KKyAgICAgICAgICogWGVuLiAgTm90aGluZyBlbHNlIGhhcyBldmVyIHRh
a2VuIG5vdGljZSBvZiB0aGUgdmFsdWUuCisgICAgICAgICAqLworICAgICAgICByYyA9IHhjX2h2
bV9wYXJhbV9nZXQoeGNoLCBkb21pZCwgSFZNX1BBUkFNX1BBRV9FTkFCTEVELCAmdmFsKTsKKyAg
ICAgICAgaWYgKCByYyApCisgICAgICAgICAgICBnb3RvIG91dDsKKworICAgICAgICBwLT5iYXNp
Yy5wYWUgPSB2YWw7CisKKyAgICAgICAgLyoKICAgICAgICAgICogVGhlc2Ugc2V0dGluZ3MgYXJl
IG5lY2Vzc2FyeSB0byBjYXVzZSBlYXJsaWVyIEhWTV9QQVJBTV9ORVNURURIVk0gLwogICAgICAg
ICAgKiBYRU5fRE9NQ1RMX2Rpc2FibGVfbWlncmF0ZSBzZXR0aW5ncyB0byBiZSByZWZsZWN0ZWQg
Y29ycmVjdGx5IGluCiAgICAgICAgICAqIENQVUlELiAgWGVuIHdpbGwgZGlzY2FyZCB0aGVzZSBi
aXRzIGlmIGNvbmZpZ3VyYXRpb24gaGFzbid0IGJlZW4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
