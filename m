Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B05714B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDBa-0000IY-V4; Wed, 26 Jun 2019 19:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=udJa=UZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgDBZ-0000IS-Vp
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:02:26 +0000
X-Inumbo-ID: ed9ae9c0-9844-11e9-b8a5-1346b420ee50
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed9ae9c0-9844-11e9-b8a5-1346b420ee50;
 Wed, 26 Jun 2019 19:02:22 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qoR3x2ifMBGzOD03s1bLIloyyIW3mb0qm/QL1St/CFo6DDlFY6Mg8k2Anm0BFBwY0UfMwTi+Mp
 vrgKixH8BZh09o28DR8vbURos1YIMHfKcsk4qEBKQfaTr1ryXNu1JYV8IJjUvfHazX9dvTP7vl
 p9FxAuKdr9HVb7p8GrQjWd+hJRrf2dM0NoRPJoPFV9VS9eEIqSe5SgX8O0ZmQGrjOEe1u3V0KZ
 z/6ukSNDaulaN1rLohvhaPpARoZTzt6vhPgQo0Uc7UWy/JmWgfVNCsA75dlHbCwAwvTkDFEGRK
 NTc=
X-SBRS: 2.7
X-MesageID: 2280607
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2280607"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 20:02:12 +0100
Message-ID: <20190626190212.15365-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: set CR4 before CR0
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKT3RoZXJ3aXNl
IGh2bV9zZXRfY3IwKCkgd2lsbCBjaGVjayB0aGUgd3JvbmcgQ1I0IGJpdHMgKEwxIGluc3RlYWQg
b2YgTDIKYW5kIHZpY2UtdmVyc2EpLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2Vy
Z2V5LmR5YXNsaUBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+
CkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCkkgZm91bmQgdGhpcyBwYXRj
aCBsYW5ndWlzaGluZyBpbiB0aGUgWGVuU2VydmVyIHBhdGNocXVldWUsIGFuZCBTZXJnZXkgaXMg
T29PCnNvIEknbSBzdWJtaXR0aW5nIGl0IG9uIGhpcyBiZWhhbGYuCgpXaXRob3V0IHRoaXMgY2hh
bmdlLCBuZXN0ZWQgdmlydCBpcyBicm9rZW4gd2hlbiBMMSBhbmQgTDIgZGlmZmVyIGluIHRoZWly
IHVzZQpvZiBQQ0lELgoKVGhpcyBpcyBvbmx5IGEgc3RvcGdhcCBzb2x1dGlvbiAtIGl0IHJlc29s
dmVzIHRoZSBQQ0lEIGlzc3VlIHdpdGhvdXQKaW50cm9kdWNpbmcgb3RoZXIgaXNzdWVzLCBidXQg
dGhlIHByb3BlciBmaXggbmVlZHMgdG8gY29uc2lkZXIgYWxsIGNvbnRyb2wKYml0cyBhdCBvbmNl
LCByYXRoZXIgdGhhbiBjb25zaWRlcmluZyBhIHZtZW50cnkvZXhpdCBhcyBhIHNlcXVlbmNlIG9m
IGNoYW5nZXMKb2YgZGlzY3JldGUgcmVnaXN0ZXJzLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14
L3Z2bXguYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIv
eGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCmluZGV4IDdiY2E1NzJkODguLjMzMjYyM2QwMDYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMKQEAgLTEwMjQsMTEgKzEwMjQsMTEgQEAgc3RhdGljIHZvaWQgbG9h
ZF9zaGFkb3dfZ3Vlc3Rfc3RhdGUoc3RydWN0IHZjcHUgKnYpCiAgICAgbnZjcHUtPmd1ZXN0X2Ny
WzBdID0gZ2V0X3Z2bWNzKHYsIENSMF9SRUFEX1NIQURPVyk7CiAgICAgbnZjcHUtPmd1ZXN0X2Ny
WzRdID0gZ2V0X3Z2bWNzKHYsIENSNF9SRUFEX1NIQURPVyk7CiAKLSAgICByYyA9IGh2bV9zZXRf
Y3IwKGdldF92dm1jcyh2LCBHVUVTVF9DUjApLCB0cnVlKTsKKyAgICByYyA9IGh2bV9zZXRfY3I0
KGdldF92dm1jcyh2LCBHVUVTVF9DUjQpLCB0cnVlKTsKICAgICBpZiAoIHJjID09IFg4NkVNVUxf
RVhDRVBUSU9OICkKICAgICAgICAgaHZtX2luamVjdF9od19leGNlcHRpb24oVFJBUF9ncF9mYXVs
dCwgMCk7CiAKLSAgICByYyA9IGh2bV9zZXRfY3I0KGdldF92dm1jcyh2LCBHVUVTVF9DUjQpLCB0
cnVlKTsKKyAgICByYyA9IGh2bV9zZXRfY3IwKGdldF92dm1jcyh2LCBHVUVTVF9DUjApLCB0cnVl
KTsKICAgICBpZiAoIHJjID09IFg4NkVNVUxfRVhDRVBUSU9OICkKICAgICAgICAgaHZtX2luamVj
dF9od19leGNlcHRpb24oVFJBUF9ncF9mYXVsdCwgMCk7CiAKQEAgLTEyMzgsMTEgKzEyMzgsMTEg
QEAgc3RhdGljIHZvaWQgbG9hZF92dm1jc19ob3N0X3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQogICAg
ICAgICBfX3Ztd3JpdGUodm1jc19oMmdfZmllbGRbaV0uZ3Vlc3RfZmllbGQsIHIpOwogICAgIH0K
IAotICAgIHJjID0gaHZtX3NldF9jcjAoZ2V0X3Z2bWNzKHYsIEhPU1RfQ1IwKSwgdHJ1ZSk7Cisg
ICAgcmMgPSBodm1fc2V0X2NyNChnZXRfdnZtY3ModiwgSE9TVF9DUjQpLCB0cnVlKTsKICAgICBp
ZiAoIHJjID09IFg4NkVNVUxfRVhDRVBUSU9OICkKICAgICAgICAgaHZtX2luamVjdF9od19leGNl
cHRpb24oVFJBUF9ncF9mYXVsdCwgMCk7CiAKLSAgICByYyA9IGh2bV9zZXRfY3I0KGdldF92dm1j
cyh2LCBIT1NUX0NSNCksIHRydWUpOworICAgIHJjID0gaHZtX3NldF9jcjAoZ2V0X3Z2bWNzKHYs
IEhPU1RfQ1IwKSwgdHJ1ZSk7CiAgICAgaWYgKCByYyA9PSBYODZFTVVMX0VYQ0VQVElPTiApCiAg
ICAgICAgIGh2bV9pbmplY3RfaHdfZXhjZXB0aW9uKFRSQVBfZ3BfZmF1bHQsIDApOwogCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
