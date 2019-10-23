Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F472E2183
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:13:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK9j-0002ap-1I; Wed, 23 Oct 2019 17:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNK9h-0002a9-Iu
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:10:41 +0000
X-Inumbo-ID: 07c7680c-f5b8-11e9-bbab-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07c7680c-f5b8-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6DwBOQrMxNt1og8JUZZST8JkQc0dcoT2LOmCvNitEp4=;
 b=K0WGfLixgZuT1F3o9HX1ka+Bpr3CSELY5nSsAztobYZdM0Ace2Rnff7q
 ud8A45SvgHJyKO68Kw6uW9oInLKUCrbFhziGze/9iZIxP1ALARPtx1LMr
 3Bi3zIQxBKU3jmGXeWXrKLr9pqnGCnXlTqIrjxZ5Tl7oIOFKqN0gAcTjE Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aDN0t4NhP09v2ZMQ/H814fpWXsziTIH+Ixh4gEfvb9RGEDfbpUo7rrVU3w+i2GCbUoCm4xpnwJ
 jJWjfhy38+KER2xVIrUNBJVRNzT0xqTWZV372cLQwY/9ZpKW/ZDWxz+fOtrtF2VD5MrbUsuPJK
 63gOIBSseGQYRriOUeIv0P2tFg2SsxSf2RKn/iYJ2wDfKil7XWP5i/wTTm579PSh5v/cAFnAv7
 RjFl5SRRQ9QvqlO093OqCZXyq/pUSSrRdXYKzGqGh10KqHS5UaqHesucQjb6n/Mp7h9CGNbMwi
 KQE=
X-SBRS: 2.7
X-MesageID: 7642018
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7642018"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:24 +0100
Message-ID: <20191023164837.2700240-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 10/23] xen,Kbuild: Handle __OBJECT_*__
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVmaW5lIF9fT0JKRUNUX0ZJTEVfXyBhbmQgX19PQkpFQ1RfTEFCRUxfXyBhcyBpdCBpcyBkb25l
IGluCmFyY2gveDg2L1J1bGVzLm1rLgoKVGhvc2UgZGVmaW5lcyB3b3VsZCBhbHNvIGJlIGNyZWF0
ZWQgd2hlbiBkb2luZyBhbiBBUk0gYnVpbGQsIHdoZW4KS2J1aWxkIHdpbGwgYmUgdXNlZCB0byBi
dWlsZCB4ZW4uCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vc2NyaXB0cy9NYWtlZmlsZS5saWIgfCAyNiArKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL3NjcmlwdHMvTWFrZWZpbGUubGliIGIveGVuL3Nj
cmlwdHMvTWFrZWZpbGUubGliCmluZGV4IDE5NjQxZTgzNmRjMy4uN2JhM2NmMDM0Yzk4IDEwMDY0
NAotLS0gYS94ZW4vc2NyaXB0cy9NYWtlZmlsZS5saWIKKysrIGIveGVuL3NjcmlwdHMvTWFrZWZp
bGUubGliCkBAIC05NywyMCArOTcsMTIgQEAgcmVhbC1vYmotbQk6PSAkKGFkZHByZWZpeCAkKG9i
aikvLCQocmVhbC1vYmotbSkpCiBtdWx0aS11c2VkLW0JOj0gJChhZGRwcmVmaXggJChvYmopLywk
KG11bHRpLXVzZWQtbSkpCiBzdWJkaXIteW0JOj0gJChhZGRwcmVmaXggJChvYmopLywkKHN1YmRp
ci15bSkpCiAKLSMgRmluZHMgdGhlIG11bHRpLXBhcnQgb2JqZWN0IHRoZSBjdXJyZW50IG9iamVj
dCB3aWxsIGJlIGxpbmtlZCBpbnRvLgotIyBJZiB0aGUgb2JqZWN0IGJlbG9uZ3MgdG8gdHdvIG9y
IG1vcmUgbXVsdGktcGFydCBvYmplY3RzLCBhbGwgb2YgdGhlbSBhcmUKLSMgY29uY2F0ZW5hdGVk
IHdpdGggYSBjb2xvbiBzZXBhcmF0b3IuCi1tb2RuYW1lLW11bHRpID0gJChzdWJzdCAkKHNwYWNl
KSw6LCQoc29ydCAkKGZvcmVhY2ggbSwkKG11bHRpLXVzZWQpLFwKLQkJJChpZiAkKGZpbHRlciAk
Ki5vLCAkKCQobToubz0tb2JqcykpICQoJChtOi5vPS15KSkgJCgkKG06Lm89LW0pKSksJChtOi5v
PSkpKSkpCi0KLW1vZG5hbWUgPSAkKGlmICQobW9kbmFtZS1tdWx0aSksJChtb2RuYW1lLW11bHRp
KSwkKGJhc2V0YXJnZXQpKQotCi0jIFRoZXNlIGZsYWdzIGFyZSBuZWVkZWQgZm9yIG1vZHZlcnNp
b25zIGFuZCBjb21waWxpbmcsIHNvIHdlIGRlZmluZSB0aGVtIGhlcmUKLSMgJChtb2RuYW1lX2Zs
YWdzKSBkZWZpbmVzIEtCVUlMRF9NT0ROQU1FIGFzIHRoZSBuYW1lIG9mIHRoZSBtb2R1bGUgaXQg
d2lsbAotIyBlbmQgdXAgaW4gKG9yIHdvdWxkLCBpZiBpdCBnZXRzIGNvbXBpbGVkIGluKQotbmFt
ZS1maXggPSAkKHNxdW90ZSkkKHF1b3RlKSQoc3Vic3QgJChjb21tYSksXywkKHN1YnN0IC0sXywk
MSkpJChxdW90ZSkkKHNxdW90ZSkKLWJhc2VuYW1lX2ZsYWdzID0gLURLQlVJTERfQkFTRU5BTUU9
JChjYWxsIG5hbWUtZml4LCQoYmFzZXRhcmdldCkpCi1tb2RuYW1lX2ZsYWdzICA9IC1ES0JVSUxE
X01PRE5BTUU9JChjYWxsIG5hbWUtZml4LCQobW9kbmFtZSkpCitvYmplY3RfZmlsZV9mbGFncyAg
PSAnLURfX09CSkVDVF9GSUxFX189IiQoc3Vic3QgJChvYmopLywsJEApIicKK2lmZXEgKCQoZmlu
ZHN0cmluZyAtREhBVkVfQVNfUVVPVEVEX1NZTSwkKEtCVUlMRF9DRkxBR1MpKSwpCitvYmplY3Rf
ZmlsZV9mbGFncyArPSAnLURfX09CSkVDVF9MQUJFTF9fPSQoc3Vic3QgLywkJCwkKHN1YnN0IC0s
XywkKEApKSknCitlbHNlCitvYmplY3RfZmlsZV9mbGFncyArPSAnLURfX09CSkVDVF9MQUJFTF9f
PSQoc3Vic3QgLSxfLCQoQCkpJworZW5kaWYKIAogIyBTZWUgY29tbWVudCBhYm91dCBJTklUX1NF
Q1RJT05TX09OTFkgaW4gaW5jbHVkZS94ZW4vY29tcGlsZXIuaAogJChmaWx0ZXIgJS5pbml0Lm8s
JChyZWFsLW9iai15KSAkKGV4dHJhLXkpKTogY2NmbGFncy15ICs9IC1ESU5JVF9TRUNUSU9OU19P
TkxZCkBAIC0xNjgsMTMgKzE2MCwxMyBAQCBlbmRpZgogCiBjX2ZsYWdzICAgICAgICA9IC1XcCwt
TUQsJChkZXBmaWxlKSAkKE5PU1RESU5DX0ZMQUdTKSAkKExJTlVYSU5DTFVERSkgICAgIFwKIAkJ
ICQoX2NfZmxhZ3MpICQobW9ka2Vybl9jZmxhZ3MpICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAotCQkgJChiYXNlbmFtZV9mbGFncykgJChtb2RuYW1lX2ZsYWdzKQorCQkgJChvYmplY3RfZmls
ZV9mbGFncykKIAogYV9mbGFncyAgICAgICAgPSAtV3AsLU1ELCQoZGVwZmlsZSkgJChOT1NURElO
Q19GTEFHUykgJChMSU5VWElOQ0xVREUpICAgICBcCi0JCSAkKF9hX2ZsYWdzKSAkKG1vZGtlcm5f
YWZsYWdzKQorCQkgJChvYmplY3RfZmlsZV9mbGFncykgJChfYV9mbGFncykKIAogY3BwX2ZsYWdz
ICAgICAgPSAtV3AsLU1ELCQoZGVwZmlsZSkgJChOT1NURElOQ19GTEFHUykgJChMSU5VWElOQ0xV
REUpICAgICBcCi0JCSAkKF9jcHBfZmxhZ3MpCisJCSAkKG9iamVjdF9maWxlX2ZsYWdzKSAkKF9j
cHBfZmxhZ3MpCiAKIGxkX2ZsYWdzICAgICAgID0gJChLQlVJTERfTERGTEFHUykgJChsZGZsYWdz
LXkpICQoTERGTEFHU18kKEBGKSkKIAotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
