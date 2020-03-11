Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13233181F49
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC526-0002zC-Aa; Wed, 11 Mar 2020 17:20:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC525-0002z7-60
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:20:37 +0000
X-Inumbo-ID: 9ef52f8a-63bc-11ea-a6c1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef52f8a-63bc-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583947236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ull+dy34N/MPjwzwky5Fi1qaIR1ACu8/L8uLhFr4S0k=;
 b=X38EqW4VQyt9HUOQI6pz3EXUGVm8VNe0LJrdigOqoqI4tNu8PfC/5fNB
 ElxssXzL0JWSugEhzkLjQSZ/OofbaIcyxDOdYk2uqbi9AQ/ixmWCt92u4
 EcVjRIzotV+cIMqKL4IaHdIswVs7nEgItD3VC6v8GtYe36kvw6NNwW3J1 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9A5CT1XPAqn22yzNo8yTIgTiJhOA1WuYw0KGmvCc7Q1QM8EUa9OBelPaYuRlJhwWcAylnkiWhk
 5lbMrI5UD/SZgSPW8lCVq1FueAvl4Vo5tlHIih9kaZJQSwfKuY/Yt0P8E6I3XS0mCLyFS3k9VF
 yV3H2/AsOJNss2qSQX56XwDgS+otcTOAf7nkVteQPEelPktKU06yA+OtkUCBSeUZZJCpr4IQS1
 G46U6Y9w5NFG6xhyv2TSkVSNSZzDU2GOD4i3izWGUkYnvmAEpCdcVtYCOeS+rgTO8QMLjwfOSz
 3ss=
X-SBRS: 2.7
X-MesageID: 14418290
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14418290"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:20:07 +0100
Message-ID: <20200311172010.7777-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311172010.7777-1-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v5 3/5] ts-examine-hostprops-save:
 record hostflags also
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

Q29tbWl0IHB1dGF0aXZlIGhvdGZsYWdzIGludG8gdGhlIGRhdGFiYXNlIGlmIHByZXNlbnQgb24g
dGhlIHJ1bnZhcnMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjQ6CiAtIE5ldyBpbiB0aGlzIHZlcnNpb24u
Ci0tLQpSZXF1ZXN0ZWQgYnkgSWFuIG9uIElSQzoKMTc6MDg6NTggRGl6aWV0IHJveWdlcjogSSB0
aGluayB5b3VyIHRzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUgaHVuayBpbiAyLyBiZWxvbmdzIGlu
IDEvID8gIChPciBpbgogICAgICAgICAgICAgICAgYSBzZXBhcmF0ZSAxLjUvIGFsb25nIHdpdGgg
aG9zdGZsYWdfcHV0YXRpdmVfcmVjb3JkLikKLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtICAg
IHwgIDggKysrKysrKy0KIHRzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUgfCAyMyArKysrKysrKysr
KysrKy0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbQppbmRleCBjZWI2YmI3Yi4uMWMxM2UyYWYgMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtODYsNyAr
ODYsNyBAQCBCRUdJTiB7CiAgICAgICAgICAgICAgICAgICAgICAgcG93ZXJfc3RhdGUgcG93ZXJf
Y3ljbGUgcG93ZXJfcmVib290X2F0dGVtcHRzCiAgICAgICAgICAgICAgICAgICAgICAgc2VyaWFs
X2ZldGNoX2xvZ3Mgc2V0X2hvc3RfcHJvcGVydHkgbW9kaWZ5X2hvc3RfZmxhZwogICAgICAgICAg
ICAgICAgICAgICAgIHByb3BuYW1lX21hc3NhZ2UgcHJvcG5hbWVfY2hlY2sKLSAgICAgICAgICAg
ICAgICAgICAgICBob3N0cHJvcF9wdXRhdGl2ZV9yZWNvcmQKKyAgICAgICAgICAgICAgICAgICAg
ICBob3N0cHJvcF9wdXRhdGl2ZV9yZWNvcmQgaG9zdGZsYWdfcHV0YXRpdmVfcmVjb3JkCiAgICAg
ICAgICAKICAgICAgICAgICAgICAgICAgICAgICBnZXRfc3Rhc2hlZCBvcGVuX3VuaXF1ZV9zdGFz
aGZpbGUgY29tcHJlc3Nfc3Rhc2hlZAogICAgICAgICAgICAgICAgICAgICAgIGRpcl9pZGVudGlm
eV92Y3MKQEAgLTE0MTcsNiArMTQxNywxMiBAQCBzdWIgbW9kaWZ5X2hvc3RfZmxhZyAoJCQkKSB7
CiAgICAgJG1ob3N0ZGItPm1vZGlmeV9mbGFnKCRobywgJGZsYWcsICRzZXQpOwogfQogCitzdWIg
aG9zdGZsYWdfcHV0YXRpdmVfcmVjb3JkICgkJCQpIHsKKyAgICBteSAoJGhvLCAkcHJvcCwgJHNl
dCkgPSBAXzsKKworICAgIHN0b3JlX3J1bnZhcigiaG9zdGZsYWcvJGhvLT57SWRlbnR9LyRwcm9w
IiwgISEkc2V0KTsKK30KKwogc3ViIGdldF90YXJnZXRfcHJvcGVydHkgKCQkOyQpOwogc3ViIGdl
dF90YXJnZXRfcHJvcGVydHkgKCQkOyQpIHsKICAgICBteSAoJGhvLCAkcHJvcCwgJGRlZnZhbCkg
PSBAXzsKZGlmZiAtLWdpdCBhL3RzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUgYi90cy1leGFtaW5l
LWhvc3Rwcm9wcy1zYXZlCmluZGV4IDU1ZDIzMzkyLi5lNTBlYTdmYiAxMDA3NTUKLS0tIGEvdHMt
ZXhhbWluZS1ob3N0cHJvcHMtc2F2ZQorKysgYi90cy1leGFtaW5lLWhvc3Rwcm9wcy1zYXZlCkBA
IC0yNywyMCArMjcsMjUgQEAgdHNyZWFkY29uZmlnKCk7CiAKIG91ciAkYmxlc3NpbmcgPSBpbnRl
bmRlZF9ibGVzc2luZygpOwogCi1sb2dtKCJzZXR0aW5nIGhvc3QgcHJvcGVydGllcyIpOworbG9n
bSgic2V0dGluZyBob3N0IHByb3BlcnRpZXMgYW5kIGZsYWdzIik7CiAKICMgTkI6IGluIG9yZGVy
IHRvIGFpZCBkZWJ1ZyBvbmx5IGF0dGVtcHQgdG8gc2F2ZSB0aGUgaG9zdCBwcm9wcyBvbiBmbGln
aHRzCiAjIHdpdGggaW50ZW5kZWQgcmVhbCBibGVzc2luZywgZm9yIHRoZSByZXN0IGp1c3QgZG8g
YSBkcnkgcnVuLgogb3VyICRkcnlfcnVuID0gJGJsZXNzaW5nIG5lICJyZWFsIjsKLWxvZ20oIm5v
dCBzYXZpbmcgaG9zdCBwcm9wcyB3aXRoIGludGVuZGVkIGJsZXNzaW5nICRibGVzc2luZyAhPSBy
ZWFsIikKK2xvZ20oIm5vdCBzYXZpbmcgaG9zdCBwcm9wcy9mbGFncyB3aXRoIGludGVuZGVkIGJs
ZXNzaW5nICRibGVzc2luZyAhPSByZWFsIikKICAgICBpZiAkZHJ5X3J1bjsKIAogZm9yZWFjaCBt
eSAkayAoc29ydCBrZXlzICVyKSB7Ci0gICAgbmV4dCB1bmxlc3MgJGsgPX4gbS9eaG9zdHByb3Bc
LyhbXlwvXSopXC8oW15cL10qKSQvOwotICAgIG15ICRobyA9IHNlbGVjdGhvc3QoJDEpOwotICAg
IG15ICRwcm9wID0gJDI7Ci0KLSAgICBsb2dtKCJyZWNvcmRpbmcgZm9yICRoby0+e05hbWV9ICRw
cm9wPSRyeyRrfSIpOwotCi0gICAgc2V0X2hvc3RfcHJvcGVydHkoJGhvLCAkcHJvcCwgJHJ7JGt9
KSBpZiAhJGRyeV9ydW47CisgICAgbmV4dCB1bmxlc3MgJGsgPX4gbS9eaG9zdChwcm9wfGZsYWcp
XC8oW15cL10qKVwvKFteXC9dKikkLzsKKyAgICBteSAkdHlwZSA9ICQxOworICAgIG15ICRobyA9
IHNlbGVjdGhvc3QoJDIpOworICAgIG15ICRwcm9wID0gJDM7CisKKyAgICBpZiAoJHR5cGUgZXEg
ImZsYWciKSB7CisgICAgICAgIGxvZ20oInJlY29yZGluZyBmbGFnICRwcm9wIHNldDogJHJ7JGt9
IGZvciAkaG8tPntOYW1lfSIpOworICAgICAgICBtb2RpZnlfaG9zdF9mbGFnKCRobywgJHByb3As
ICEhJHJ7JGt9KSBpZiAhJGRyeV9ydW47CisgICAgfSBlbHNlIHsKKyAgICAgICAgbG9nbSgicmVj
b3JkaW5nIHByb3AgZm9yICRoby0+e05hbWV9ICRwcm9wPSRyeyRrfSIpOworICAgICAgICBzZXRf
aG9zdF9wcm9wZXJ0eSgkaG8sICRwcm9wLCAkcnska30pIGlmICEkZHJ5X3J1bjsKKyAgICB9CiB9
Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
