Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD904114955
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 23:33:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iczds-0002qj-30; Thu, 05 Dec 2019 22:30:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iczdq-0002pS-Gz
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 22:30:34 +0000
X-Inumbo-ID: cf8a6412-17ae-11ea-b4e9-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf8a6412-17ae-11ea-b4e9-bc764e2007e4;
 Thu, 05 Dec 2019 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575585017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vUKHhWOBBpZPVW0zgr9Sb/Dri4wVVAAbrEofNa5NTc=;
 b=IEbfTClSActxDcqbSkmjTIyrG60H4aV/hJT0ZOOGTOKoAu+8QHk8I6NZ
 PHkxyjXDfRs6mPNexbBa5Ti/HPi7b38xZGWoG80i/1WvruoqlGbzXKtNH
 X6LVSI3F6LCBdBlNwkHp1ogjPjuIFhOvBb7DX2GfktcEimSxm9F6KgAvx 8=;
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
IronPort-SDR: GT3yvoJqp2qzSnxTv1uxH33CLmQnDFdDNO1R0Jj+o/1aMqkKEJg+sq4pBNeTLcTaXvaYbDJwUb
 qLdMab/CTJFlA3CbjK/kUeIiSBqjCDwMH3kQftTWMSSSWUNyXl7QnqGmdEk3GbCoYEnXtB3KDw
 iC8b2p2ZoSfVP1XcM8w6zNY2vA+cQf5F5m2GkvCHic0Qya+/WHKFNMIh5drtybFocm1oi7jnOd
 ER46FaSL0w182pxYzNdAHpdH70hN79UYrC9mTUCILdsy4fpUkKY8VRHvXTCRVvFkz5v+hVV7LO
 nCI=
X-SBRS: 2.7
X-MesageID: 9280004
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9280004"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 22:30:08 +0000
Message-ID: <20191205223008.8623-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191205223008.8623-1-andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/6] x86/smt: Don't use -EBUSY for
 smt_up_down_helper() continuations
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

VGFza2xldCBjb250ZXh0IGlzIG5vdyBjYXBhYmxlIG9mIHVzaW5nIGhhbmRsaW5nIGNvbnRpbnVh
dGlvbnMuICBVc2UgdGhpcwpyYXRoZXIgdGhhbiAtRUJVU1kgYXMgaXQgaXMgYSBtb3JlIGVmZmlj
aWVudCB3YXkgdG8gcmVzdGFydCB0aGUgaHlwZXJjYWxsLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3N5c2N0bC5j
IHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2
L3N5c2N0bC5jCmluZGV4IDRhNzZmMGY0N2YuLjA2OTU1ZmRjM2UgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKQEAgLTg1LDYgKzg1
LDkgQEAgbG9uZyBjcHVfdXBfaGVscGVyKHZvaWQgKmRhdGEpCiAgICAgICAgIC8qIE9uIEVCVVNZ
LCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8KICAgICAgICAgcmN1X2Jh
cnJpZXIoKTsKICAgICAgICAgcmV0ID0gY3B1X3VwKGNwdSk7CisKKyAgICAgICAgaWYgKCByZXQg
PT0gLUVCVVNZICkKKyAgICAgICAgICAgIHJldCA9IC1FUkVTVEFSVDsKICAgICB9CiAKICAgICBp
ZiAoICFyZXQgJiYgIW9wdF9zbXQgJiYKQEAgLTExMCw2ICsxMTMsOSBAQCBsb25nIGNwdV9kb3du
X2hlbHBlcih2b2lkICpkYXRhKQogICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsg
YW5kIGhhdmUgb25lIG1vcmUgZ28uICovCiAgICAgICAgIHJjdV9iYXJyaWVyKCk7CiAgICAgICAg
IHJldCA9IGNwdV9kb3duKGNwdSk7CisKKyAgICAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkKKyAg
ICAgICAgICAgIHJldCA9IC1FUkVTVEFSVDsKICAgICB9CiAgICAgcmV0dXJuIHJldDsKIH0KQEAg
LTE0Myw4ICsxNDksNyBAQCBzdGF0aWMgbG9uZyBzbXRfdXBfZG93bl9oZWxwZXIodm9pZCAqZGF0
YSkKICAgICAgICAgICovCiAgICAgICAgIGlmICggcmV0ICE9IC1FRVhJU1QgJiYgZ2VuZXJhbF9w
cmVlbXB0X2NoZWNrKCkgKQogICAgICAgICB7Ci0gICAgICAgICAgICAvKiBJbiB0YXNrbGV0IGNv
bnRleHQgLSBjYW4ndCBjcmVhdGUgYSBjb250aW5hdGlvbi4gKi8KLSAgICAgICAgICAgIHJldCA9
IC1FQlVTWTsKKyAgICAgICAgICAgIHJldCA9IC1FUkVTVEFSVDsKICAgICAgICAgICAgIGJyZWFr
OwogICAgICAgICB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
