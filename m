Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510A21731
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaMW-0005Dy-0Z; Fri, 17 May 2019 10:45:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaMV-0005Ds-9z
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:45:15 +0000
X-Inumbo-ID: d89850ea-7890-11e9-8a18-83d48ffa0521
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d89850ea-7890-11e9-8a18-83d48ffa0521;
 Fri, 17 May 2019 10:45:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:45:10 -0600
Message-Id: <5CDE90B8020000780023006C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:45:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 02/15] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNsZWFudXAgSVBJIG1heSBnZXQgc2VudCBpbW1lZGlhdGVseSBiZWZvcmUgYSBDUFUgZ2V0
cyByZW1vdmVkIGZyb20KdGhlIG9ubGluZSBtYXAuIEluIHN1Y2ggYSBjYXNlIHRoZSBJUEkgd291
bGQgZ2V0IGhhbmRsZWQgb24gdGhlIENQVQpiZWluZyBvZmZsaW5lZCBubyBlYXJsaWVyIHRoYW4g
aW4gdGhlIGludGVycnVwdHMgZGlzYWJsZWQgd2luZG93IGFmdGVyCmZpeHVwX2lycXMoKScgbWFp
biBsb29wLiBUaGlzIGlzIHRvbyBsYXRlLCBob3dldmVyLCBiZWNhdXNlIGEgcG9zc2libGUKYWZm
aW5pdHkgY2hhbmdlIG1heSBpbmN1ciB0aGUgbmVlZCBmb3IgdmVjdG9yIGFzc2lnbm1lbnQsIHdo
aWNoIHdpbGwKZmFpbCB3aGVuIHRoZSBJUlEncyBtb3ZlIGNsZWFudXAgY291bnQgaXMgc3RpbGwg
bm9uLXplcm8uCgpUbyBmaXggdGhpcwotIHJlY29yZCB0aGUgc2V0IG9mIENQVXMgdGhlIGNsZWFu
dXAgSVBJcyBnZXRzIGFjdHVhbGx5IHNlbnQgdG8gYWxvbmdzaWRlCiAgc2V0dGluZyB0aGVpciBj
b3VudCwKLSBhZGp1c3QgdGhlIGNvdW50IGluIGZpeHVwX2lycXMoKSwgYWNjb3VudGluZyBmb3Ig
YWxsIENQVXMgdGhhdCB0aGUKICBjbGVhbnVwIElQSSB3YXMgc2VudCB0bywgYnV0IHRoYXQgYXJl
IG5vIGxvbmdlciBvbmxpbmUsCi0gYmFpbCBlYXJseSBmcm9tIHRoZSBjbGVhbnVwIElQSSBoYW5k
bGVyIHdoZW4gdGhlIENQVSBpcyBubyBsb25nZXIKICBvbmxpbmUsIHRvIHByZXZlbnQgZG91Ymxl
IGFjY291bnRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTY2
OCw2ICs2NjgsOSBAQCB2b2lkIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KHN0cnVjdCBjCiAg
ICAgYWNrX0FQSUNfaXJxKCk7CiAKICAgICBtZSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKKyAgICBp
ZiAoICFjcHVfb25saW5lKG1lKSApCisgICAgICAgIHJldHVybjsKKwogICAgIGZvciAoIHZlY3Rv
ciA9IEZJUlNUX0RZTkFNSUNfVkVDVE9SOwogICAgICAgICAgIHZlY3RvciA8PSBMQVNUX0hJUFJJ
T1JJVFlfVkVDVE9SOyB2ZWN0b3IrKykKICAgICB7CkBAIC03MjcsMTEgKzczMCwxNCBAQCB1bmxv
Y2s6CiAKIHN0YXRpYyB2b2lkIHNlbmRfY2xlYW51cF92ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpk
ZXNjKQogewotICAgIGNwdW1hc2tfdCBjbGVhbnVwX21hc2s7CisgICAgY3B1bWFza19hbmQoZGVz
Yy0+YXJjaC5vbGRfY3B1X21hc2ssIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLAorICAgICAgICAg
ICAgICAgICZjcHVfb25saW5lX21hcCk7CisgICAgZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291
bnQgPSBjcHVtYXNrX3dlaWdodChkZXNjLT5hcmNoLm9sZF9jcHVfbWFzayk7CiAKLSAgICBjcHVt
YXNrX2FuZCgmY2xlYW51cF9tYXNrLCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgJmNwdV9vbmxp
bmVfbWFwKTsKLSAgICBkZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCA9IGNwdW1hc2tfd2Vp
Z2h0KCZjbGVhbnVwX21hc2spOwotICAgIHNlbmRfSVBJX21hc2soJmNsZWFudXBfbWFzaywgSVJR
X01PVkVfQ0xFQU5VUF9WRUNUT1IpOworICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBf
Y291bnQgKQorICAgICAgICBzZW5kX0lQSV9tYXNrKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCBJ
UlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUik7CisgICAgZWxzZQorICAgICAgICByZWxlYXNlX29sZF92
ZWMoZGVzYyk7CiAKICAgICBkZXNjLT5hcmNoLm1vdmVfaW5fcHJvZ3Jlc3MgPSAwOwogfQpAQCAt
MjQxMCw2ICsyNDE2LDE2IEBAIHZvaWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ss
IGIKICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZFQ1RPUiApCiAgICAg
ICAgICAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLmNwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9t
YXNrLCBtYXNrKTsKIAorICAgICAgICBpZiAoIGRlc2MtPmFyY2gubW92ZV9jbGVhbnVwX2NvdW50
ICkKKyAgICAgICAgeworICAgICAgICAgICAgLyogVGhlIGNsZWFudXAgSVBJIG1heSBoYXZlIGdv
dCBzZW50IHdoaWxlIHdlIHdlcmUgc3RpbGwgb25saW5lLiAqLworICAgICAgICAgICAgY3B1bWFz
a19hbmRub3QoJmFmZmluaXR5LCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZjcHVfb25saW5lX21hcCk7CisgICAgICAgICAgICBkZXNjLT5hcmNo
Lm1vdmVfY2xlYW51cF9jb3VudCAtPSBjcHVtYXNrX3dlaWdodCgmYWZmaW5pdHkpOworICAgICAg
ICAgICAgaWYgKCAhZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgKQorICAgICAgICAgICAg
ICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsKKyAgICAgICAgfQorCiAgICAgICAgIGNwdW1hc2tf
Y29weSgmYWZmaW5pdHksIGRlc2MtPmFmZmluaXR5KTsKICAgICAgICAgaWYgKCAhZGVzYy0+YWN0
aW9uIHx8IGNwdW1hc2tfc3Vic2V0KCZhZmZpbml0eSwgbWFzaykgKQogICAgICAgICB7CgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
