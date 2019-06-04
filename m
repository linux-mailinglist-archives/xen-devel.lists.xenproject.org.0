Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C965D34D28
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCBl-0000ww-4A; Tue, 04 Jun 2019 16:21:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYCBi-0000wI-RP
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:21:26 +0000
X-Inumbo-ID: cc048c30-86e4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc048c30-86e4-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:21:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 10:21:24 -0600
Message-Id: <5CF69A800200007800235346@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 10:21:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-10-julien.grall@arm.com>
In-Reply-To: <20190603160350.29806-10-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 09/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvbW0uaAo+IEBAIC00NDIsNiArNDQyLDggQEAgaW50IGNoZWNrX2Rlc2NyaXB0b3IoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgc2VnX2Rlc2NfdCAqZGVzYyk7Cj4gIAo+ICBleHRlcm4gcGFkZHJf
dCBtZW1faG90cGx1ZzsKPiAgCj4gK2V4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9t
X2lvLCAqZG9tX2NvdzsJLyogZm9yIHZtY29yZWluZm8gKi8KCkFoLCBub3cgSSBzZWUgd2hhdCBB
bmRyZXcgd2FzIHRhbGtpbmcgYWJvdXQuIEluIG15IHBhdGNoLCBJJ2xsIG1vdmUKdGhlIGRlY2xh
cmF0aW9ucyBhaGVhZCBvZiB0aGUgYXNtL21tLmggaW5jbHVzaW9uIHBvaW50IHRoZW4uCgo+IEBA
IC00ODMsMjQgKzQ4NSwyNSBAQCBleHRlcm4gcGFkZHJfdCBtZW1faG90cGx1ZzsKPiAgI2RlZmlu
ZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPiAg
Cj4gICNkZWZpbmUgY29tcGF0X21hY2hpbmVfdG9fcGh5c19tYXBwaW5nICgodW5zaWduZWQgaW50
IAo+ICopUkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RBUlQpCj4gLSNkZWZpbmUgX3NldF9ncGZuX2Zy
b21fbWZuKG1mbiwgcGZuKSAoeyAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgIHN0cnVj
dCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihtZm5fdG9fcGFnZShfbWZuKG1mbikpKTsgXAo+
IC0gICAgdW5zaWduZWQgbG9uZyBlbnRyeSA9IChkICYmIChkID09IGRvbV9jb3cpKSA/ICAgICAg
ICAgICAgICBcCj4gLSAgICAgICAgU0hBUkVEX00yUF9FTlRSWSA6IChwZm4pOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICgodm9pZCkoKG1mbikgPj0gKFJEV1JfQ09NUEFU
X01QVF9WSVJUX0VORCAtIFJEV1JfQ09NUEFUX01QVF9WSVJUX1NUQVJUKSAvIDQgfHwgXAo+IC0g
ICAgICAgICAgICAoY29tcGF0X21hY2hpbmVfdG9fcGh5c19tYXBwaW5nWyhtZm4pXSA9ICh1bnNp
Z25lZCBpbnQpKGVudHJ5KSkpLCBcCj4gLSAgICAgbWFjaGluZV90b19waHlzX21hcHBpbmdbKG1m
bildID0gKGVudHJ5KSk7ICAgICAgICAgICAgICAgIFwKPiAtICAgIH0pCj4gIAo+ICAvKgo+ICAg
KiBEaXNhYmxlIHNvbWUgdXNlcnMgb2Ygc2V0X2dwZm5fZnJvbV9tZm4oKSAoZS5nLiwgZnJlZV9o
ZWFwX3BhZ2VzKCkpIHVudGlsCj4gICAqIHRoZSBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZyBpcyBh
Y3R1YWxseSBzZXQgdXAuCj4gICAqLwo+ICBleHRlcm4gYm9vbCBtYWNoaW5lX3RvX3BoeXNfbWFw
cGluZ192YWxpZDsKPiAtI2RlZmluZSBzZXRfZ3Bmbl9mcm9tX21mbihtZm4sIHBmbikgZG8geyAg
ICAgICAgXAo+IC0gICAgaWYgKCBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZ192YWxpZCApICAgICAg
ICBcCj4gLSAgICAgICAgX3NldF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKTsgICAgICAgICAgIFwK
PiAtfSB3aGlsZSAoMCkKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfZ3Bmbl9mcm9tX21m
bih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pCj4gK3sKPiArICAgIHN0cnVj
dCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihtZm5fdG9fcGFnZShfbWZuKG1mbikpKTsKCmNv
bnN0PyBBbmQgd2l0aCB0aGF0IHRoZW4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
