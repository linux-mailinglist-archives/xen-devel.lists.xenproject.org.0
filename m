Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0097DFB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0S5e-0000G4-NA; Wed, 21 Aug 2019 14:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0S5d-0000FF-64
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:59:57 +0000
X-Inumbo-ID: 54cfbbd8-c424-11e9-b95f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54cfbbd8-c424-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566399593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bp6X/anh/MTojJZMBuIvQWLpXlQ3Ni3OlbaxVUsdQgk=;
 b=GsKEGZFoY7DbzorbvPD/nACS1G+cV62eOFrJY9NELKlfQkJjE2C/wEZI
 ACzX4IwTi+1QzT1FoqRlv5HtqAGfKBPuveAO/xMFkQaIi5a7wL8KYTr1D
 4iXiWBy9yEmV4Fm8vK7afW7VmjuV7bdFMlEl6cDHAWuvRjqMWXbzrqNbj g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3ccSUqB6K55uMcL39IRUcroJGMer8rZxxWeV8cAnkD+vXhsqhpSUPho4+jfnufo7Flu/Xv/VxC
 PwuUFlCPzUVzT4qeB/V6dPP9RPa9UVpmE42n0sYfBdnuw+FQimFp1Xqf60+62Zupkz9Ftzma/0
 EEwxjQUBo+rTC2j/FxZ2YDiQCA1MVXhZAe1qsQM+HNJhn6CA1q/+kG9B8yOf0g98etzq27zNc8
 sQSuNxMpxNkL3ydgVSTl3NaGCO7BjlYINIfRgiorAq6+YI6kOAvaJyRWUSq4aSCiHnkhgEm8uI
 r80=
X-SBRS: 2.7
X-MesageID: 4749749
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4749749"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 16:58:59 +0200
Message-ID: <20190821145903.45934-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821145903.45934-1-roger.pau@citrix.com>
References: <20190821145903.45934-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/7] ioreq: allow dispatching ioreqs to internal
 servers
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
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgYWx3YXlzIHByb2Nlc3NlZCBmaXJzdCwgYW5kIGlv
cmVxcyBhcmUKZGlzcGF0Y2hlZCBieSBjYWxsaW5nIHRoZSBoYW5kbGVyIGZ1bmN0aW9uLiBJZiBu
byBpbnRlcm5hbCBzZXJ2ZXJzIGhhdmUKcmVnaXN0ZXJlZCBmb3IgYW4gaW9yZXEgaXQncyB0aGVu
IGZvcndhcmRlZCB0byBleHRlcm5hbCBjYWxsZXJzLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3Jl
cS5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVx
LmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5kZXggMjNlZjliMGMwMi4uM2ZiNmZlOTU4
NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYwpAQCAtMTMwNSw2ICsxMzA1LDcgQEAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2
ZXIgKmh2bV9zZWxlY3RfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsCiAgICAgdWludDhf
dCB0eXBlOwogICAgIHVpbnQ2NF90IGFkZHI7CiAgICAgdW5zaWduZWQgaW50IGlkOworICAgIGJv
b2wgaW50ZXJuYWwgPSB0cnVlOwogCiAgICAgaWYgKCBwLT50eXBlICE9IElPUkVRX1RZUEVfQ09Q
WSAmJiBwLT50eXBlICE9IElPUkVRX1RZUEVfUElPICkKICAgICAgICAgcmV0dXJuIE5VTEw7CkBA
IC0xMzQ1LDExICsxMzQ2LDEyIEBAIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpodm1fc2VsZWN0
X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICBhZGRyID0gcC0+YWRkcjsK
ICAgICB9CiAKKyByZXRyeToKICAgICBGT1JfRUFDSF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpCiAg
ICAgewogICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKnI7CiAKLSAgICAgICAgaWYgKCAhcy0+ZW5h
YmxlZCApCisgICAgICAgIGlmICggIXMtPmVuYWJsZWQgfHwgcy0+aW50ZXJuYWwgIT0gaW50ZXJu
YWwgKQogICAgICAgICAgICAgY29udGludWU7CiAKICAgICAgICAgciA9IHMtPnJhbmdlW3R5cGVd
OwpAQCAtMTM4Nyw2ICsxMzg5LDEyIEBAIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpodm1fc2Vs
ZWN0X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICB9CiAgICAgfQogCisg
ICAgaWYgKCBpbnRlcm5hbCApCisgICAgeworICAgICAgICBpbnRlcm5hbCA9IGZhbHNlOworICAg
ICAgICBnb3RvIHJldHJ5OworICAgIH0KKwogICAgIHJldHVybiBOVUxMOwogfQogCkBAIC0xNDky
LDkgKzE1MDAsMTggQEAgaW50IGh2bV9zZW5kX2lvcmVxKHN0cnVjdCBodm1faW9yZXFfc2VydmVy
ICpzLCBpb3JlcV90ICpwcm90b19wLAogCiAgICAgQVNTRVJUKHMpOwogCisgICAgaWYgKCBzLT5p
bnRlcm5hbCAmJiBidWZmZXJlZCApCisgICAgeworICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOworICAgIH0KKwogICAgIGlm
ICggYnVmZmVyZWQgKQogICAgICAgICByZXR1cm4gaHZtX3NlbmRfYnVmZmVyZWRfaW9yZXEocywg
cHJvdG9fcCk7CiAKKyAgICBpZiAoIHMtPmludGVybmFsICkKKyAgICAgICAgcmV0dXJuIHMtPmhh
bmRsZXIoY3VyciwgcHJvdG9fcCk7CisKICAgICBpZiAoIHVubGlrZWx5KCF2Y3B1X3N0YXJ0X3No
dXRkb3duX2RlZmVycmFsKGN1cnIpKSApCiAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwog
Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
