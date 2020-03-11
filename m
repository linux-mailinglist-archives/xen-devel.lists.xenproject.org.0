Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A9181D1F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 17:03:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3mo-0003pW-7I; Wed, 11 Mar 2020 16:00:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC3mm-0003pR-RA
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 16:00:44 +0000
X-Inumbo-ID: 76249cea-63b1-11ea-b005-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76249cea-63b1-11ea-b005-12813bfff9fa;
 Wed, 11 Mar 2020 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583942444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFjqLQm3BVmn2BsTB654WcAz4JV06XDC6+ckYZTxvZk=;
 b=gKetLIh4tBSsZTcABUHznBHa4R3h+Cko/4UC+9OV+aZMcP+YMMBb6wha
 5PdDVKr1AQmdZR98SzAmMR2JejtfeLtwnOww1vNid9etiLUtT9Fl6iFzb
 BPyEXjINeCgxp5Utud9Ux6Rxs1lk/QSv6HYfsnpq4EKPckBVX3k0lMxYU I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZdSMAlfHxww/AkDXLUR/vLgMsJFt9J0sOxPF6jN0iQwYe/VPiNoShu5KX8UTZH7UoWsH6IgZhT
 Loc+b5HjA0f5hD46dTYpM6gOk/jgtDXOtNYjjU51xRmbhP0a/1MkEQngUWEw1arB3H8crbjMyM
 d55W3eKqEaWp8sIRwhNSU+eT2YwgBgqd6JD5TrAmtzJW5qlmtBGBWnou/BHQhQyA2j94n3uHT1
 ujDcqq3E2PESFUqfdn/wXEo5aj9/N1QUltWsVj+6XjNfyRJMjWQi/JJjDWoiatGmOndPELkM9N
 akA=
X-SBRS: 2.7
X-MesageID: 13786955
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13786955"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:00:19 +0100
Message-ID: <20200311160021.6075-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311160021.6075-1-roger.pau@citrix.com>
References: <20200311160021.6075-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v4 2/3] examine: detect IOMMU
 availability and add it as a hostflag
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

SW50cm9kdWNlIGEgbmV3IHRlc3QgdG8gY2hlY2sgZm9yIGlvbW11IGF2YWlsYWJpbGl0eSBhbmQg
YWRkIGl0IGFzIGEKaG9zdGZsYWcgaWYgZm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6CiAtIEZh
aWwgaWYgYHhsIGluZm9gIGNvbW1hbmQgZmFpbHMuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBBbGxv
dyBmbGFncyB0byBiZSByZW1vdmVkLgogLSBGaXggc2V0X2ZsYWcgYWRkaXRpb24gdG8gSG9zdEJE
L1N0YXRpYy5wbS4KLS0tCiBzZy1ydW4tam9iICAgICAgICAgICAgICAgIHwgIDEgKwogdHMtZXhh
bWluZS1ob3N0cHJvcHMtc2F2ZSB8IDI4ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KIHRz
LWV4YW1pbmUtaW9tbXUgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNzU1IHRzLWV4YW1pbmUtaW9tbXUKCmRpZmYgLS1naXQgYS9zZy1ydW4t
am9iIGIvc2ctcnVuLWpvYgppbmRleCA3YzU4ZDRiYS4uZjZiZmRmZDUgMTAwNzU1Ci0tLSBhL3Nn
LXJ1bi1qb2IKKysrIGIvc2ctcnVuLWpvYgpAQCAtNjc5LDYgKzY3OSw3IEBAIHByb2MgZXhhbWlu
ZS1ob3N0LWV4YW1pbmUge2luc3RhbGx9IHsKICAgICBpZiB7JG9rfSB7CiAJcnVuLXRzIC0uICA9
ICAgICAgICAgICB0cy1leGFtaW5lLXNlcmlhbC1wb3N0ICsgaG9zdAogCXJ1bi10cyAuICAgPSAg
ICAgICAgICAgdHMtZXhhbWluZS1sb2dzLXNhdmUgICArIGhvc3QKKwlydW4tdHMgLiAgID0gICAg
ICAgICAgIHRzLWV4YW1pbmUtaW9tbXUgICAgICAgKyBob3N0CiAJcnVuLXRzIC4gICA9ICAgICAg
ICAgICB0cy1leGFtaW5lLWhvc3Rwcm9wcy1zYXZlCiAgICAgfQogfQpkaWZmIC0tZ2l0IGEvdHMt
ZXhhbWluZS1ob3N0cHJvcHMtc2F2ZSBiL3RzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUKaW5kZXgg
NTVkMjMzOTIuLmIxYzhkZTZkIDEwMDc1NQotLS0gYS90cy1leGFtaW5lLWhvc3Rwcm9wcy1zYXZl
CisrKyBiL3RzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUKQEAgLTI3LDIwICsyNywzMCBAQCB0c3Jl
YWRjb25maWcoKTsKIAogb3VyICRibGVzc2luZyA9IGludGVuZGVkX2JsZXNzaW5nKCk7CiAKLWxv
Z20oInNldHRpbmcgaG9zdCBwcm9wZXJ0aWVzIik7Citsb2dtKCJzZXR0aW5nIGhvc3QgcHJvcGVy
dGllcyBhbmQgZmxhZ3MiKTsKIAogIyBOQjogaW4gb3JkZXIgdG8gYWlkIGRlYnVnIG9ubHkgYXR0
ZW1wdCB0byBzYXZlIHRoZSBob3N0IHByb3BzIG9uIGZsaWdodHMKICMgd2l0aCBpbnRlbmRlZCBy
ZWFsIGJsZXNzaW5nLCBmb3IgdGhlIHJlc3QganVzdCBkbyBhIGRyeSBydW4uCiBvdXIgJGRyeV9y
dW4gPSAkYmxlc3NpbmcgbmUgInJlYWwiOwotbG9nbSgibm90IHNhdmluZyBob3N0IHByb3BzIHdp
dGggaW50ZW5kZWQgYmxlc3NpbmcgJGJsZXNzaW5nICE9IHJlYWwiKQorbG9nbSgibm90IHNhdmlu
ZyBob3N0IHByb3BzL2ZsYWdzIHdpdGggaW50ZW5kZWQgYmxlc3NpbmcgJGJsZXNzaW5nICE9IHJl
YWwiKQogICAgIGlmICRkcnlfcnVuOwogCiBmb3JlYWNoIG15ICRrIChzb3J0IGtleXMgJXIpIHsK
LSAgICBuZXh0IHVubGVzcyAkayA9fiBtL15ob3N0cHJvcFwvKFteXC9dKilcLyhbXlwvXSopJC87
Ci0gICAgbXkgJGhvID0gc2VsZWN0aG9zdCgkMSk7Ci0gICAgbXkgJHByb3AgPSAkMjsKLQotICAg
IGxvZ20oInJlY29yZGluZyBmb3IgJGhvLT57TmFtZX0gJHByb3A9JHJ7JGt9Iik7Ci0KLSAgICBz
ZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICRwcm9wLCAkcnska30pIGlmICEkZHJ5X3J1bjsKKyAgICBu
ZXh0IHVubGVzcyAkayA9fiBtL15ob3N0KHByb3B8ZmxhZylcLyhbXlwvXSopXC8oW15cL10qKSQv
OworICAgIG15ICR0eXBlID0gJDE7CisgICAgbXkgJGhvID0gc2VsZWN0aG9zdCgkMik7CisgICAg
bXkgJHByb3AgPSAkMzsKKworICAgIGlmICgkdHlwZSBlcSAiZmxhZyIpIHsKKyAgICAgICAgaWYg
KCRyeyRrfSAmJiAhJGRyeV9ydW4pIHsKKyAgICAgICAgICAgIGxvZ20oInJlY29yZGluZyBmbGFn
ICRwcm9wIGZvciAkaG8tPntOYW1lfSIpOworICAgICAgICAgICAgc2V0X2hvc3RfZmxhZygkaG8s
ICRwcm9wKTsKKyAgICAgICAgfSBlbHNpZiAoISRkcnlfcnVuKSB7CisgICAgICAgICAgICBsb2dt
KCJyZW1vdmluZyBmbGFnICRwcm9wIGZvciAkaG8tPntOYW1lfSIpOworICAgICAgICAgICAgcmVt
b3ZlX2hvc3RfZmxhZygkaG8sICRwcm9wKTsKKyAgICAgICAgfQorICAgIH0gZWxzZSB7CisgICAg
ICAgIGxvZ20oInJlY29yZGluZyBwcm9wIGZvciAkaG8tPntOYW1lfSAkcHJvcD0kcnska30iKTsK
KyAgICAgICAgc2V0X2hvc3RfcHJvcGVydHkoJGhvLCAkcHJvcCwgJHJ7JGt9KSBpZiAhJGRyeV9y
dW47CisgICAgfQogfQpkaWZmIC0tZ2l0IGEvdHMtZXhhbWluZS1pb21tdSBiL3RzLWV4YW1pbmUt
aW9tbXUKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAuLjA5OWQ0YmU1Ci0tLSAv
ZGV2L251bGwKKysrIGIvdHMtZXhhbWluZS1pb21tdQpAQCAtMCwwICsxLDMyIEBACisjIS91c3Iv
YmluL3BlcmwgLXcKKyMgVGhpcyBpcyBwYXJ0IG9mICJvc3N0ZXN0IiwgYW4gYXV0b21hdGVkIHRl
c3RpbmcgZnJhbWV3b3JrIGZvciBYZW4uCisjIENvcHlyaWdodCAoQykgMjAwOS0yMDIwIENpdHJp
eCBJbmMuCisjCisjIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorIyB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBlaXRoZXIgdmVyc2lvbiAzIG9mIHRoZSBMaWNlbnNlLCBv
cgorIyAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIworIyBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMg
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKKyMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZQorIyBHTlUgQWZmZXJvIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KKyMKKyMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjIGFsb25nIHdpdGggdGhpcyBwcm9n
cmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorCit1c2Ug
c3RyaWN0IHF3KHZhcnMpOworQkVHSU4geyB1bnNoaWZ0IEBJTkMsIHF3KC4pOyB9Cit1c2UgT3Nz
dGVzdDsKK3VzZSBPc3N0ZXN0OjpUZXN0U3VwcG9ydDsKKwordHNyZWFkY29uZmlnKCk7CisKK291
ciAoJHdoaG9zdCkgPSBAQVJHVjsKKyR3aGhvc3QgfHw9ICdob3N0JzsKK291ciAkaG89IHNlbGVj
dGhvc3QoJHdoaG9zdCk7CitvdXIgJGluZm8gPSB0YXJnZXRfY21kX291dHB1dF9yb290KCRobywg
J3hsIGluZm8nLCAxMCk7CitvdXIgJGhhc19pb21tdSA9ICRpbmZvID1+IC9kaXJlY3Rpby87CisK
K2xvZ20oIiRoby0+e0lkZW50fSBpb21tdTogJGhhc19pb21tdSIpOworaG9zdGZsYWdfcHV0YXRp
dmVfcmVjb3JkKCRobywgImlvbW11IiwgJGhhc19pb21tdSk7Ci0tIAoyLjI1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
