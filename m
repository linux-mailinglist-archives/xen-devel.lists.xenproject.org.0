Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AAAE9FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7etB-0007fo-TH; Tue, 10 Sep 2019 12:04:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7etA-0007fJ-3i
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:04:52 +0000
X-Inumbo-ID: 30ca2f80-d3c3-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ca2f80-d3c3-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=99TEzrvLZ+qtL7w7qzh8IxlvbVuaRJGhpkqcHUP0HD4=;
 b=UjCM3LoROgsAxKPOsUZ6xwZCpgci9/eWrChsmtXw8Ykd7FBWJtAOpWj3
 0rYtRt/CnIYvoRPONm4pMF+i8YltfPJuLi8Den0+fvOoQNMqnCQj9yDa+
 8HkOm3dUwo7ohqLynlaMZV8y0hmONzQDTlbljzrB6hjhaMHyRtv7Wyz6T c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YIzsCNqF5oNg0qLavnYTYeHFSIYa+gqknBtIIG4cT8S7DZpN9D3GfUXwRoEHXbaOf0mNqYeUDd
 pKFwXc5WFg7oCAPRcrxzWZLGR1OvtuAMJYEFkF9BcgbLUu9rnDuRW9i/FjfLaI2wgHw15LFSgh
 IkCLnU15yKJZKk3CIXG63cIc5KiYNpV7M5Gscni3U6Pwx1sp2hdcue4mlBbWc81uhSOA0miuIp
 pvcrQtljRm9r3HcD8zFQkpy2RfiaDNi+AqBvlllYnt5XahMYLzEhcGJtP14226hMyxj2Rt6v/I
 Qmc=
X-SBRS: 2.7
X-MesageID: 5370573
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5370573"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:02 +0100
Message-ID: <20190910120207.10358-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 07/12] tools/ocaml: abi-check: Improve output
 and error messages
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhlIGdlbmVyYXRlZCBDLCBhZGQgc29tZSBjb21tZW50cyBzYXlpbmcgd2hlcmUgd2UgZm91
bmQgdGhlIG9jYW1sCnR5cGUuICBUaGlzIGhlbHBzIHdpdGggZGVidWdnaW5nLiAgKEkgY29uc2lk
ZXJlZCBlbWl0dGluZyAjbGluZQpkaXJlY3RpdmVzIGJ1dCBkZWNpZGVkIHRoaXMgd291bGQgYmUg
bW9yZSBjb25mdXNpbmcgdGhhbiBoZWxwZnVsLikKCkltcHJvdmUgdHdvIGRpZXMuCgpVc2UgYmV0
dGVyLW5hbWVkIGZpbGVoYW5kbGVzIChwZXJsIHByaW50cyB0aGllciBuYW1lcyB3aGVuIGl0IGRp
ZXMpLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Ci0tLQogdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sgfCAxNCArKysrKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayBiL3Rvb2xzL29jYW1sL2xpYnMv
eGMvYWJpLWNoZWNrCmluZGV4IGE0NzBjMDVlMGIuLjk0NTA2NzY0MjkgMTAwNzU1Ci0tLSBhL3Rv
b2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJp
LWNoZWNrCkBAIC0xNSw3ICsxNSw3IEBAIG91ciAlZW51bXM7CiBAQVJHViA9PSAyIG9yIGRpZTsK
IG91ciAoJGMsICRvKSA9IEBBUkdWOwogCi1vcGVuIFNURElOLCAiPCIsICRjIG9yIGRpZSAkITsK
K29wZW4gQ19GSUxFLCAiPCIsICRjIG9yIGRpZSAkITsKIAogb3VyICRjbGluZSA9IC0xOwogb3Vy
ICRlaTsKQEAgLTI5LDcgKzI5LDcgQEAgb3VyICRlaTsKICMgICAvKiAhIENQcmVmaXggQ0ZpbmFs
IENGaW5hbEhvdyAqLwogIwogIyBUaGUgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdXNlIC8qICEgKi8g
d2hpY2ggc2ltcGx5IHNraXBzIHRoYXQgaW5zdGFuY2UuCi13aGlsZSAoPD4pIHsKK3doaWxlICg8
Q19GSUxFPikgewogICAgIGlmICgkY2xpbmUgPT0gLTEpIHsKICAgICAgICAgaWYgKG0vY19iaXRt
YXBfdG9fb2NhbWxfbGlzdHxvY2FtbF9saXN0X3RvX2NfYml0bWFwLykgewogICAgICAgICAgICAg
JGNsaW5lID0gMDsKQEAgLTM3LDcgKzM3LDggQEAgd2hpbGUgKDw+KSB7CiAgICAgICAgIH0KICAg
ICB9IGVsc2UgewogICAgICAgICAkY2xpbmUrKzsKLSAgICAgICAgbXteXHMrL1wqIFxzKyAhIFxz
KyAoLio/KSBccyogXCovXHMqJH14IG9yIGRpZSAiJGNsaW5lICRfID8iOworICAgICAgICBte15c
cysvXCogXHMrICEgXHMrICguKj8pIFxzKiBcKi9ccyokfXggb3IKKyAgICAgICAgICAgIGRpZSAi
YXQgbGluZSAkY2xpbmUgb2YgYW5ub3RhdGlvbiwgZGlkIG5vdCBleHBlY3QgJF8gPyI7CiAgICAg
ICAgIG15IEB2YWxzID0gc3BsaXQgL1xzKy8sICQxOwogICAgICAgICBpZiAoJGNsaW5lID09IDEg
JiYgIUB2YWxzKSB7CiAgICAgICAgICAgICAkY2xpbmUgPSAtMTsKQEAgLTQ1LDcgKzQ2LDcgQEAg
d2hpbGUgKDw+KSB7CiAgICAgICAgICAgICAkZWktPnskX30gPSBzaGlmdCBAdmFscyBmb3JlYWNo
IHF3KE9UeXBlIE9QcmVmaXggTWFuZ2xlKTsKICAgICAgICAgfSBlbHNpZiAoJGNsaW5lID09IDIg
JiYgQHZhbHMgPT0gMykgewogICAgICAgICAgICAgJGVpLT57JF99ID0gc2hpZnQgQHZhbHMgZm9y
ZWFjaCBxdyhDUHJlZml4IENGaW5hbCBDRmluYWxIb3cpOwotICAgICAgICAgICAgZGllIGlmICRl
bnVtc3sgJGVpLT57T1R5cGV9IH07CisgICAgICAgICAgICBkaWUgInJlZGVmaW5pbmcgT1R5cGUg
JGVpLT57T1R5cGV9IiBpZiAkZW51bXN7ICRlaS0+e09UeXBlfSB9OwogICAgICAgICAgICAgJGVu
dW1zeyAkZWktPntPVHlwZX0gfSA9ICRlaTsKICAgICAgICAgICAgICRjbGluZSA9IC0xOwogICAg
ICAgICB9IGVsc2UgewpAQCAtNTgsMTMgKzU5LDE0IEBAIHN1YiBleHBlY3QgKCQkKSB7CiAgICAg
cHJpbnRmICJCVUlMRF9CVUdfT04oICUtMzBzICE9ICUtMTBzICk7XG4iLCBAXyBvciBkaWUgJCE7
CiB9CiAKLW9wZW4gU1RESU4sICI8IiwgJG8gb3IgZGllICQhOworb3BlbiBPQ0FNTF9GSUxFLCAi
PCIsICRvIG9yIGRpZSAkITsKIG15ICRjdmFsOwogJGVpID0gdW5kZWY7CiBteSAkYml0bnVtID0g
MDsKLXdoaWxlICg8Pikgeword2hpbGUgKDxPQ0FNTF9GSUxFPikgewogICAgIGlmICghJGVpKSB7
CiAgICAgICAgIGlmIChte150eXBlIFxzKyAoXHcrKSBccyogXD0gXHMqICQvfXggJiYgJGVudW1z
eyQxfSkgeworICAgICAgICAgICAgcHJpbnQgIi8vIGZvdW5kIG9jYW1sIHR5cGUgJDEgYXQgJG86
JC5cbiIgb3IgZGllICQhOwogICAgICAgICAgICAgJGVpID0gJGVudW1zeyQxfTsKICAgICAgICAg
ICAgICRjdmFsID0gJyc7CiAgICAgICAgICAgICAkYml0bnVtID0gMDsKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
