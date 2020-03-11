Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622B181D23
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 17:03:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3nN-0003tQ-Mj; Wed, 11 Mar 2020 16:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC3nM-0003tK-OL
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 16:01:20 +0000
X-Inumbo-ID: 898dff7e-63b1-11ea-b005-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 898dff7e-63b1-11ea-b005-12813bfff9fa;
 Wed, 11 Mar 2020 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583942477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fddvphNVK3C3yyVk96RtN0eGx1+Dvq4tckd/Zs2tqL0=;
 b=Lk0inVvchUrCfMAABS9CU4qOqdzJOWzULB44Y9e/ibx09+e907rvGk4+
 lISW6BNLcd1x0YiGqSejNLfArsIwj2g9nQGmN94a9AQf24IZriYUq9YqV
 sV6tb1Zs+e8EAhuSpzJjPKEjP/218SB7lXd5cg8G5lfc8QUAWEeIhTgjv c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MeoXjyiJpX9QkyeEmcPwKDpczg+c/GPzvkMOIwJwTKr9pHOwHKOOmYt1K+IK5RUoeJ9bk+dmr/
 +ltO7uoRCg/8ZT9crxrAwEsCFqT/RKYeo7oWwdz2uZTrShFKwDv0hohhD8tPCqe/q+JnXxoHAP
 uKAP82lzexAHvFpKiKm7csxYmoPz85QG87UZiohGvdeo7B0pCVIqw/0mliruLqE8JwWzc3tUKw
 MxTf+d8dn4i3v2/2kY4L1C257vz8cZjfXhrCPnb8o3bsfTqV5hB9QT8CuAWxW1H0kfy/vg55n2
 ldM=
X-SBRS: 2.7
X-MesageID: 13761928
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13761928"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:00:18 +0100
Message-ID: <20200311160021.6075-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v4 1/3] host: introduce helpers to
 modify hostflags
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

QWRkIGEgZ2VuZXJpYyBmdW5jdGlvbiB0byBwZXJmb3JtIGRhdGFiYXNlIGNoYW5nZXMgcmVsYXRl
ZCB0byBhIGhvc3QKYW5kIHVzZSBpdCB0byBpbXBsZW1lbnQgc2V0X3Byb3BlcnR5IGFuZCBhbmQg
e3NldC9yZW1vdmV9X2ZsYWcuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6CiAtIEludHJvZHVjZSBtb2Rp
ZnlfZmxhZyBpbnN0ZWFkIG9mIHtzZXQvcmVtb3ZlfV9mbGFnLgogLSBJbnRyb2R1Y2UgYSBnZW5l
cmljIG1vZGlmeV9ob3N0IGhlbHBlci4KIC0gU3BsaXQgZnJvbSBwYXRjaCAxLgotLS0KIE9zc3Rl
c3QvSG9zdERCL0V4ZWN1dGl2ZS5wbSB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQogT3NzdGVzdC9Ib3N0REIvU3RhdGljLnBtICAgIHwgIDcgKysrKysrKwogT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbSAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKystCiAzIGZpbGVzIGNo
YW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3Nz
dGVzdC9Ib3N0REIvRXhlY3V0aXZlLnBtIGIvT3NzdGVzdC9Ib3N0REIvRXhlY3V0aXZlLnBtCmlu
ZGV4IDdmZmNhNmM0Li5hNmRjNDQ2MiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9Ib3N0REIvRXhlY3V0
aXZlLnBtCisrKyBiL09zc3Rlc3QvSG9zdERCL0V4ZWN1dGl2ZS5wbQpAQCAtNTEsNiArNTEsMTYg
QEAgRU5ECiAgICAgfQogfQogCitzdWIgbW9kaWZ5X2hvc3QgKCQkJCkgeworICAgIG15ICgkaGQs
ICRobywgJHF1ZXJ5KSA9IEBfOworICAgIG15ICRibGVzc2luZyA9IGludGVuZGVkX2JsZXNzaW5n
KCk7CisKKyAgICBkaWUgIkF0dGVtcHRpbmcgdG8gbW9kaWZ5IGhvc3Qgd2l0aCBpbnRlbmRlZCBi
bGVzc2luZyAkYmxlc3NpbmcgIT0gcmVhbCIKKyAgICAgICAgaWYgJGJsZXNzaW5nIG5lICJyZWFs
IjsKKworICAgIGRiX3JldHJ5KCRkYmhfdGVzdHMsIFtxdyhyZXNvdXJjZXMpXSwgJHF1ZXJ5KTsK
K30KKwogc3ViIHNldF9wcm9wZXJ0eSgkJCQkKSB7CiAgICAgbXkgKCRoZCwgJGhvLCAkcHJvcCwg
JHZhbCkgPSBAXzsKICAgICBteSAkcm1xID0gJGRiaF90ZXN0cy0+cHJlcGFyZSg8PEVORCk7CkBA
IC02MSwxMiArNzEsOCBAQCBFTkQKICAgICAgICAgSU5TRVJUIElOVE8gcmVzb3VyY2VfcHJvcGVy
dGllcyAocmVzdHlwZSxyZXNuYW1lLG5hbWUsdmFsKQogICAgICAgICAgICAgICAgVkFMVUVTICgn
aG9zdCcsID8sPyw/KQogRU5ECi0gICAgbXkgJGJsZXNzaW5nID0gaW50ZW5kZWRfYmxlc3Npbmco
KTsKLQotICAgIGRpZSAiQXR0ZW1wdGluZyB0byBtb2RpZnkgaG9zdCBwcm9wcyB3aXRoIGludGVu
ZGVkIGJsZXNzaW5nICRibGVzc2luZyAhPSByZWFsIgotICAgICAgICBpZiAkYmxlc3NpbmcgbmUg
InJlYWwiOwogCi0gICAgZGJfcmV0cnkoJGRiaF90ZXN0cywgW3F3KHJlc291cmNlcyldLCBzdWIg
eworICAgIG1vZGlmeV9ob3N0KCRoZCwgJGhvLCBzdWIgewogICAgICAgICAkcm1xLT5leGVjdXRl
KCRoby0+e05hbWV9LCAkcHJvcCk7CiAgICAgICAgIGlmIChsZW5ndGggJHZhbCkgewogICAgICAg
ICAgICAgJGFkZHEtPmV4ZWN1dGUoJGhvLT57TmFtZX0sICRwcm9wLCAkdmFsKTsKQEAgLTkwLDYg
Kzk2LDIzIEBAIEVORAogICAgIHJldHVybiAkZmxhZ3M7CiB9CiAKK3N1YiBtb2RpZnlfZmxhZyAo
JCQkJCkgeworICAgIG15ICgkaGQsICRobywgJGZsYWcsICRzZXQpID0gQF87CisgICAgbXkgJHJt
cSA9ICRkYmhfdGVzdHMtPnByZXBhcmUoPDxFTkQpOworICAgICAgICBERUxFVEUgRlJPTSBob3N0
ZmxhZ3MgV0hFUkUgaG9zdG5hbWU9PyBBTkQgaG9zdGZsYWc9PworRU5ECisgICAgbXkgJGFkZHEg
PSAkZGJoX3Rlc3RzLT5wcmVwYXJlKDw8RU5EKTsKKyAgICAgICAgSU5TRVJUIElOVE8gaG9zdGZs
YWdzIChob3N0bmFtZSxob3N0ZmxhZykgVkFMVUVTICg/LD8pCitFTkQKKworICAgIG1vZGlmeV9o
b3N0KCRoZCwgJGhvLCBzdWIgeworICAgICAgICAkcm1xLT5leGVjdXRlKCRoby0+e05hbWV9LCAk
ZmxhZyk7CisgICAgICAgIGlmICgkc2V0KSB7CisgICAgICAgICAgICAkYWRkcS0+ZXhlY3V0ZSgk
aG8tPntOYW1lfSwgJGZsYWcpOworICAgICAgICB9CisgICAgfSk7Cit9CisKIHN1YiBnZXRfYXJj
aF9wbGF0Zm9ybXMgKCQkJCkgewogICAgIG15ICgkaGQsICRibGVzc2luZywgJGFyY2gsICRzdWl0
ZSkgPSBAXzsKIApkaWZmIC0tZ2l0IGEvT3NzdGVzdC9Ib3N0REIvU3RhdGljLnBtIGIvT3NzdGVz
dC9Ib3N0REIvU3RhdGljLnBtCmluZGV4IDBjNmJlM2VlLi5kMDY2OWZiMiAxMDA2NDQKLS0tIGEv
T3NzdGVzdC9Ib3N0REIvU3RhdGljLnBtCisrKyBiL09zc3Rlc3QvSG9zdERCL1N0YXRpYy5wbQpA
QCAtNzIsNiArNzIsMTMgQEAgc3ViIGdldF9mbGFncyAoJCQpIHsgI21ldGhvZAogICAgIHJldHVy
biAkZmxhZ3M7CiB9CiAKK3N1YiBtb2RpZnlfZmxhZyAoJCQkJCkgeworICAgIG15ICgkaGQsICRo
bywgJGZsYWcsICRzZXQpID0gQF87CisKKyAgICBkaWUKKyAgICAiQ2Fubm90IG1vZGlmeSBmbGFn
cyBpbiBzdGFuZGFsb25lIG1vZGUgZm9yICRoby0+e05hbWV9ICRmbGFnIHNldDogJHNldFxuIjsK
K30KKwogc3ViIGdldF9hcmNoX3BsYXRmb3JtcyAoJCQkKSB7CiAgICAgbXkgKCRoZCwgJGJsZXNz
aW5nLCAkYXJjaCwgJHN1aXRlKSA9IEBfOwogCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBw
b3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCBmNDllZDUyOS4uYjgwZTg5YmMg
MTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbQpAQCAtODUsOCArODUsOSBAQCBCRUdJTiB7CiAgICAgICAgICAgICAgICAgICAgICAg
aG9zdG5hbWVwYXRoIGhvc3RuYW1lcGF0aF9saXN0IHNldF9ydW50aW1lX2hvc3RmbGFnCiAgICAg
ICAgICAgICAgICAgICAgICAgcG93ZXJfc3RhdGUgcG93ZXJfY3ljbGUgcG93ZXJfcmVib290X2F0
dGVtcHRzCiAgICAgICAgICAgICAgICAgICAgICAgc2VyaWFsX2ZldGNoX2xvZ3Mgc2V0X2hvc3Rf
cHJvcGVydHkKKyAgICAgICAgICAgICAgICAgICAgICBzZXRfaG9zdF9mbGFnIHJlbW92ZV9ob3N0
X2ZsYWcKICAgICAgICAgICAgICAgICAgICAgICBwcm9wbmFtZV9tYXNzYWdlIHByb3BuYW1lX2No
ZWNrCi0gICAgICAgICAgICAgICAgICAgICAgaG9zdHByb3BfcHV0YXRpdmVfcmVjb3JkCisgICAg
ICAgICAgICAgICAgICAgICAgaG9zdHByb3BfcHV0YXRpdmVfcmVjb3JkIGhvc3RmbGFnX3B1dGF0
aXZlX3JlY29yZAogICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3N0YXNoZWQg
b3Blbl91bmlxdWVfc3Rhc2hmaWxlIGNvbXByZXNzX3N0YXNoZWQKICAgICAgICAgICAgICAgICAg
ICAgICBkaXJfaWRlbnRpZnlfdmNzCkBAIC0xNDExLDYgKzE0MTIsMjQgQEAgc3ViIGhvc3Rwcm9w
X3B1dGF0aXZlX3JlY29yZCAoJCQkKSB7CiAgICAgc3RvcmVfcnVudmFyKCJob3N0cHJvcC8kaG8t
PntJZGVudH0vJHByb3AiLCAkdmFsKTsKIH0KIAorc3ViIHNldF9ob3N0X2ZsYWcgKCQkKSB7Cisg
ICAgbXkgKCRobywkZmxhZykgPSBAXzsKKworICAgICRtaG9zdGRiLT5tb2RpZnlfZmxhZygkaG8s
ICRmbGFnLCAxKTsKK30KKworc3ViIHJlbW92ZV9ob3N0X2ZsYWcgKCQkKSB7CisgICAgbXkgKCRo
bywkZmxhZykgPSBAXzsKKworICAgICRtaG9zdGRiLT5tb2RpZnlfZmxhZygkaG8sICRmbGFnLCAw
KTsKK30KKworc3ViIGhvc3RmbGFnX3B1dGF0aXZlX3JlY29yZCAoJCQkKSB7CisgICAgbXkgKCRo
bywgJHByb3AsICRzZXQpID0gQF87CisKKyAgICBzdG9yZV9ydW52YXIoImhvc3RmbGFnLyRoby0+
e0lkZW50fS8kcHJvcCIsICEhJHNldCk7Cit9CisKIHN1YiBnZXRfdGFyZ2V0X3Byb3BlcnR5ICgk
JDskKTsKIHN1YiBnZXRfdGFyZ2V0X3Byb3BlcnR5ICgkJDskKSB7CiAgICAgbXkgKCRobywgJHBy
b3AsICRkZWZ2YWwpID0gQF87Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
