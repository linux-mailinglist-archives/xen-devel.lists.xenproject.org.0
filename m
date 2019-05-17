Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B921DEF
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 21:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRi4B-0007og-RT; Fri, 17 May 2019 18:58:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRi49-0007oQ-FW
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 18:58:49 +0000
X-Inumbo-ID: cdc4c896-78d5-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cdc4c896-78d5-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 18:58:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: jWuVb1mIMAqumwxXhw8nFRTMV2vn+HbjQj9JDbG5/7zlKcxebI9rnS86Ux7GgCMG5IxXKMsVxP
 NEPl25Oa+AlUk/T11csYvIJGmvorFSLYjxmZjlwiKCejfzsvRFRtjyFGVPgWki9tAZVdeQacux
 UAZDwaXSo+uXjQNd+UW6Gqe8ilizOsxgyjl0sMPfhWo/e7ScfcoCfHAMAlyIgBFREkF/gyjLY4
 RVDYZ2wW9qPR4jh9i2P2IDTvsWpmS1OXxDEo8RKvCdHvXrp75C2vT74Lw7p9Nh1rJX4ilFc9Y0
 eO8=
X-SBRS: 2.7
X-MesageID: 593811
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,481,1549947600"; 
   d="scan'208";a="593811"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 19:58:44 +0100
Message-ID: <1558119524-318-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/mpparse: Don't print "limit reached"
 for every subsequent processor
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB5b3UgYm9vdCBYZW4gd2l0aCB0aGUgZGVmYXVsdCAyNTYgTlJfQ1BVUywgb24gYSBib3gg
d2l0aCByYXRoZXIgbW9yZQpwcm9jZXNzb3JzLCB0aGUgcmVzdWx0aW5nIHNwZXcgaXMgdW5uZWNl
c3NlcmlseSB2ZXJib3NlLiAgSW5zdGVhZCwgcHJpbnQgdGhlCm1lc3NhZ2Ugb25jZSwgZS5nOgoK
IChYRU4pIEFDUEk6IFgyQVBJQyAoYXBpY19pZFsweDExNV0gdWlkWzB4MTE1XSBlbmFibGVkKQog
KFhFTikgV0FSTklORzogTlJfQ1BVUyBsaW1pdCBvZiAyNTYgcmVhY2hlZCAtIGlnbm9yaW5nIGZ1
cnRoZXIgcHJvY2Vzc29ycwogKFhFTikgQUNQSTogWDJBUElDIChhcGljX2lkWzB4MTE5XSB1aWRb
MHgxMTldIGVuYWJsZWQpCiAoWEVOKSBBQ1BJOiBYMkFQSUMgKGFwaWNfaWRbMHgxMWRdIHVpZFsw
eDExZF0gZW5hYmxlZCkKIChYRU4pIEFDUEk6IFgyQVBJQyAoYXBpY19pZFsweDEyMV0gdWlkWzB4
MTIxXSBlbmFibGVkKQoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21wcGFyc2UuYyB8IDkgKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tcHBhcnNlLmMgYi94ZW4vYXJjaC94ODYvbXBwYXJzZS5j
CmluZGV4IDE2YzkzYTkuLmYwNTdkOTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tcHBhcnNl
LmMKKysrIGIveGVuL2FyY2gveDg2L21wcGFyc2UuYwpAQCAtMTU3LDE1ICsxNTcsMTYgQEAgc3Rh
dGljIGludCBNUF9wcm9jZXNzb3JfaW5mb194KHN0cnVjdCBtcGNfY29uZmlnX3Byb2Nlc3NvciAq
bSwKIAlzZXRfYXBpY2lkKGFwaWNpZCwgJnBoeXNfY3B1X3ByZXNlbnRfbWFwKTsKIAogCWlmIChu
dW1fcHJvY2Vzc29ycyA+PSBucl9jcHVfaWRzKSB7Ci0JCXByaW50ayhLRVJOX1dBUk5JTkcgIldB
Uk5JTkc6IE5SX0NQVVMgbGltaXQgb2YgJXUgcmVhY2hlZC4iCi0JCQkiICBQcm9jZXNzb3IgaWdu
b3JlZC5cbiIsIG5yX2NwdV9pZHMpOworCQlwcmludGtfb25jZShYRU5MT0dfV0FSTklORworCQkJ
ICAgICJXQVJOSU5HOiBOUl9DUFVTIGxpbWl0IG9mICV1IHJlYWNoZWQgLSBpZ25vcmluZyBmdXJ0
aGVyIHByb2Nlc3NvcnNcbiIsCisJCQkgICAgbnJfY3B1X2lkcyk7CiAJCXJldHVybiAtRU5PU1BD
OwogCX0KIAogCWlmIChudW1fcHJvY2Vzc29ycyA+PSA4ICYmIGhvdHBsdWcKIAkgICAgJiYgZ2Vu
YXBpYy5uYW1lID09IGFwaWNfZGVmYXVsdC5uYW1lKSB7Ci0JCXByaW50ayhLRVJOX1dBUk5JTkcg
IldBUk5JTkc6IENQVXMgbGltaXQgb2YgOCByZWFjaGVkLiIKLQkJCSIgUHJvY2Vzc29yIGlnbm9y
ZWQuXG4iKTsKKwkJcHJpbnRrX29uY2UoWEVOTE9HX1dBUk5JTkcKKwkJCSAgICAiV0FSTklORzog
Q1BVcyBsaW1pdCBvZiA4IHJlYWNoZWQgLSBpZ25vcmluZyBmdXRoZXIgcHJvY2Vzc29yc1xuIik7
CiAJCXJldHVybiAtRU5PU1BDOwogCX0KIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
