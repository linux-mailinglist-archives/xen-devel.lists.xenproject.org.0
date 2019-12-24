Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729E12A1BA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijkD3-0007c3-Vs; Tue, 24 Dec 2019 13:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijkD2-0007bx-Dd
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:26:48 +0000
X-Inumbo-ID: 01d479fc-2651-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01d479fc-2651-11ea-a1e1-bc764e2007e4;
 Tue, 24 Dec 2019 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577193995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ILxDEKri0JABc13Mus7DeHu3fI8SI/vl6MDDKTElL6k=;
 b=BzIaSZro3BFtsPyVodMlO9xXxbkqMvtCF+RiSEpjTWUeGKCs48PFDAsD
 zTSwDh+R8LA1I+g4l0qZONhb2OJ8BsMB7JPiflWj3l5wyp8oS8OjLX3Hj
 oqPe9cqOu5I0Z3H0l4SM2NNqsRcawD90JVpuuJTJQnTLQVex1pmB8cMov k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9BhStHHStYFRC7DMPum2rsiCs9YMpQtSOLoolAH+fbviWDlZmDuEsyVthidANrzCwhQY816dsa
 mFDGEjkXaPPj6xBmrUb5yqB6Lw5Z78e+V73pvEeqbQKhIgYpbUHDpZwR5OcKTnmxU2dZldac4+
 XtsFOLoEQHNS7AE4tvqaRXuu/K4Vd812hvNnXjpfkgdsLCn9cMR2EInY+jIj2XrGkPM4oQFrC0
 DsGqQnrvkROxGrMe8DDZUUkt9Ad6wMZ0I8hHnVb4+qC0KwDGgdzWm48l90Q3FRuAoC/hAKPB3u
 R48=
X-SBRS: 2.7
X-MesageID: 10478268
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10478268"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 14:26:15 +0100
Message-ID: <20191224132616.47441-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224132616.47441-1-roger.pau@citrix.com>
References: <20191224132616.47441-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/hvm: improve performance of
 HVMOP_flush_tlbs
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIHRvIGNhbGwgcGFnaW5nX3VwZGF0ZV9jcjMgdW5sZXNzIENSMyB0cmFw
cGluZyBpcwplbmFibGVkLCBhbmQgdGhhdCdzIG9ubHkgdGhlIGNhc2Ugd2hlbiB1c2luZyBzaGFk
b3cgcGFnaW5nIG9yIHdoZW4KcmVxdWVzdGVkIGZvciBpbnRyb3NwZWN0aW9uIHB1cnBvc2VzLCBv
dGhlcndpc2UgdGhlcmUncyBubyBuZWVkIHRvCnBhdXNlIGFsbCB0aGUgdkNQVXMgb2YgdGhlIGRv
bWFpbiBpbiBvcmRlciB0byBwZXJmb3JtIHRoZSBmbHVzaC4KCkNoZWNrIHdoZXRoZXIgQ1IzIHRy
YXBwaW5nIGlzIGN1cnJlbnRseSBpbiB1c2UgaW4gb3JkZXIgdG8gZGVjaWRlCndoZXRoZXIgdGhl
IHZDUFVzIHNob3VsZCBiZSBwYXVzZWQsIG90aGVyd2lzZSBqdXN0IHBlcmZvcm0gdGhlIGZsdXNo
LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4v
YXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDRkZmFmMzU1NjYuLjdkY2MxNmFmYzYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpA
QCAtMzk4NSwyNSArMzk4NSwzNiBAQCBib29sIGh2bV9mbHVzaF92Y3B1X3RsYihib29sICgqZmx1
c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAogICAgIHN0YXRpYyBERUZJTkVf
UEVSX0NQVShjcHVtYXNrX3QsIGZsdXNoX2NwdW1hc2spOwogICAgIGNwdW1hc2tfdCAqbWFzayA9
ICZ0aGlzX2NwdShmbHVzaF9jcHVtYXNrKTsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVu
dC0+ZG9tYWluOworICAgIC8qCisgICAgICogQ1IzIHRyYXBwaW5nIGlzIG9ubHkgZW5hYmxlZCB3
aGVuIHJ1bm5pbmcgd2l0aCBzaGFkb3cgcGFnaW5nIG9yIHdoZW4KKyAgICAgKiByZXF1ZXN0ZWQg
Zm9yIGludHJvc3BlY3Rpb24gcHVycG9zZXMsIG90aGVyd2lzZSB0aGVyZSdzIG5vIG5lZWQgdG8g
Y2FsbAorICAgICAqIHBhZ2luZ191cGRhdGVfY3IzIGFuZCBoZW5jZSBwYXVzZSBhbGwgdkNQVXMu
CisgICAgICovCisgICAgYm9vbCB0cmFwX2NyMyA9ICFwYWdpbmdfbW9kZV9oYXAoZCkgfHwKKyAg
ICAgICAgICAgICAgICAgICAgKGQtPmFyY2gubW9uaXRvci53cml0ZV9jdHJscmVnX2VuYWJsZWQg
JgorICAgICAgICAgICAgICAgICAgICBtb25pdG9yX2N0cmxyZWdfYml0bWFzayhWTV9FVkVOVF9Y
ODZfQ1IzKSk7CiAgICAgc3RydWN0IHZjcHUgKnY7CiAKLSAgICAvKiBBdm9pZCBkZWFkbG9jayBp
ZiBtb3JlIHRoYW4gb25lIHZjcHUgdHJpZXMgdGhpcyBhdCB0aGUgc2FtZSB0aW1lLiAqLwotICAg
IGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJjYWxsX2RlYWRsb2NrX211dGV4KSApCi0gICAg
ICAgIHJldHVybiBmYWxzZTsKKyAgICBpZiAoIHRyYXBfY3IzICkKKyAgICB7CisgICAgICAgIC8q
IEF2b2lkIGRlYWRsb2NrIGlmIG1vcmUgdGhhbiBvbmUgdmNwdSB0cmllcyB0aGlzIGF0IHRoZSBz
YW1lIHRpbWUuICovCisgICAgICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJjYWxsX2Rl
YWRsb2NrX211dGV4KSApCisgICAgICAgICAgICByZXR1cm4gZmFsc2U7CiAKLSAgICAvKiBQYXVz
ZSBhbGwgb3RoZXIgdmNwdXMuICovCi0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQotICAgICAg
ICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKLSAgICAgICAgICAg
IHZjcHVfcGF1c2Vfbm9zeW5jKHYpOworICAgICAgICAvKiBQYXVzZSBhbGwgb3RoZXIgdmNwdXMu
ICovCisgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKKyAgICAgICAgICAgIGlmICggdiAh
PSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQorICAgICAgICAgICAgICAgIHZjcHVf
cGF1c2Vfbm9zeW5jKHYpOwogCi0gICAgLyogTm93IHRoYXQgYWxsIFZDUFVzIGFyZSBzaWduYWxs
ZWQgdG8gZGVzY2hlZHVsZSwgd2Ugd2FpdC4uLiAqLwotICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2
ICkKLSAgICAgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgZmx1c2hfdmNwdShjdHh0LCB2KSApCi0g
ICAgICAgICAgICB3aGlsZSAoICF2Y3B1X3J1bm5hYmxlKHYpICYmIHYtPmlzX3J1bm5pbmcgKQot
ICAgICAgICAgICAgICAgIGNwdV9yZWxheCgpOworICAgICAgICAvKiBOb3cgdGhhdCBhbGwgVkNQ
VXMgYXJlIHNpZ25hbGxlZCB0byBkZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCisgICAgICAgIGZv
cl9lYWNoX3ZjcHUgKCBkLCB2ICkKKyAgICAgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZs
dXNoX3ZjcHUoY3R4dCwgdikgKQorICAgICAgICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFi
bGUodikgJiYgdi0+aXNfcnVubmluZyApCisgICAgICAgICAgICAgICAgICAgIGNwdV9yZWxheCgp
OwogCi0gICAgLyogQWxsIG90aGVyIHZjcHVzIGFyZSBwYXVzZWQsIHNhZmUgdG8gdW5sb2NrIG5v
dy4gKi8KLSAgICBzcGluX3VubG9jaygmZC0+aHlwZXJjYWxsX2RlYWRsb2NrX211dGV4KTsKKyAg
ICAgICAgLyogQWxsIG90aGVyIHZjcHVzIGFyZSBwYXVzZWQsIHNhZmUgdG8gdW5sb2NrIG5vdy4g
Ki8KKyAgICAgICAgc3Bpbl91bmxvY2soJmQtPmh5cGVyY2FsbF9kZWFkbG9ja19tdXRleCk7Cisg
ICAgfQogCiAgICAgY3B1bWFza19jbGVhcihtYXNrKTsKIApAQCAtNDAxNSw4ICs0MDI2LDE1IEBA
IGJvb2wgaHZtX2ZsdXNoX3ZjcHVfdGxiKGJvb2wgKCpmbHVzaF92Y3B1KSh2b2lkICpjdHh0LCBz
dHJ1Y3QgdmNwdSAqdiksCiAgICAgICAgIGlmICggIWZsdXNoX3ZjcHUoY3R4dCwgdikgKQogICAg
ICAgICAgICAgY29udGludWU7CiAKLSAgICAgICAgcGFnaW5nX3VwZGF0ZV9jcjModiwgZmFsc2Up
OworICAgICAgICBpZiAoIHRyYXBfY3IzICkKKyAgICAgICAgICAgIHBhZ2luZ191cGRhdGVfY3Iz
KHYsIGZhbHNlKTsKIAorICAgICAgICAvKgorICAgICAgICAgKiBJdCdzIGNvcnJlY3QgdG8gZG8g
dGhpcyBmbHVzaCB3aXRob3V0IHBhdXNpbmcgdGhlIHZDUFVzOiBhbnkgdkNQVQorICAgICAgICAg
KiBjb250ZXh0IHN3aXRjaCB3aWxsIGFscmVhZHkgZmx1c2ggdGhlIHRsYiBhbmQgdGhlIHdvcnNl
IHRoYXQgY291bGQKKyAgICAgICAgICogaGFwcGVuIGlzIHRoYXQgWGVuIGVuZHMgdXAgcGVyZm9y
bWluZyBmbHVzaGVzIG9uIHBDUFVzIHRoYXQgYXJlIG5vCisgICAgICAgICAqIGxvbmdlciBydW5u
aW5nIHRoZSB0YXJnZXQgdkNQVXMuCisgICAgICAgICAqLwogICAgICAgICBjcHUgPSByZWFkX2F0
b21pYygmdi0+ZGlydHlfY3B1KTsKICAgICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2NwdShjcHUp
ICkKICAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwgbWFzayk7CkBAIC00MDI2LDkg
KzQwNDQsMTAgQEAgYm9vbCBodm1fZmx1c2hfdmNwdV90bGIoYm9vbCAoKmZsdXNoX3ZjcHUpKHZv
aWQgKmN0eHQsIHN0cnVjdCB2Y3B1ICp2KSwKICAgICBmbHVzaF90bGJfbWFzayhtYXNrKTsKIAog
ICAgIC8qIERvbmUuICovCi0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQotICAgICAgICBpZiAo
IHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKLSAgICAgICAgICAgIHZjcHVf
dW5wYXVzZSh2KTsKKyAgICBpZiAoIHRyYXBfY3IzICkKKyAgICAgICAgZm9yX2VhY2hfdmNwdSAo
IGQsIHYgKQorICAgICAgICAgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgZmx1c2hfdmNwdShjdHh0
LCB2KSApCisgICAgICAgICAgICAgICAgdmNwdV91bnBhdXNlKHYpOwogCiAgICAgcmV0dXJuIHRy
dWU7CiB9Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
