Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8029B16A9C2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:16:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6FPp-000463-HK; Mon, 24 Feb 2020 15:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6FPn-00045y-TZ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:12:59 +0000
X-Inumbo-ID: 2424e486-5718-11ea-a490-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2424e486-5718-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582557180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dhqT7mTEPWFlIN2R7xNc1I3MiadYIRtNh1pZjSCGW9o=;
 b=Hv/Nn27vlsJetKus+GOX3M+OARFO4SXruEmLnNyuEoSRu1b3hK60F2A9
 zKvJPRYk1t8CHxtNIk+KredXVPrHjeCn6BL/RCRsqkFjtSXWfNE8DOrmr
 GaoxAhKtUWeQkIn/7DlfOZUcFZOsBRuh4AwWebYFENvqkyOy/v0II3vnX E=;
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
IronPort-SDR: xaRrm5AspCO107qXxFBBng9KP6OzFVLw4cPPM+RJM/JPHD4id7f2g9NyGDD6yqiB553og5jdGV
 wowDkGf42ITYo/PARzLKov2S+wJLjgUFRArDmaS54B8VP3pP8eDAyKfiKT4nVT2bPy9yzDO0m1
 t4JRS42BnE04LoqLPubb6HrWH1JrRICkxjciXWkkNMiq7WsoPcjGBQ1oCMnuoe9t5D6UbUDKao
 Eg5A9ZTc+tAfgxXyXWGAUswjuaFRlW2FhoD5KSuKUY1mMI52+osQ5tO+WZVjqDPTNenCnRzQWc
 YKY=
X-SBRS: 2.7
X-MesageID: 12894324
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12894324"
Date: Mon, 24 Feb 2020 16:12:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200224151250.GR4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6MjJBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEltcGxlbWVudCBoeXBlcmNhbGwgdGhhdCBhbGxvd3MgYSBmb3JrIHRvIHNoZWQg
YWxsIG1lbW9yeSB0aGF0IGdvdCBhbGxvY2F0ZWQKPiBmb3IgaXQgZHVyaW5nIGl0cyBleGVjdXRp
b24gYW5kIHJlLWxvYWQgaXRzIHZDUFUgY29udGV4dCBmcm9tIHRoZSBwYXJlbnQgVk0uCj4gVGhp
cyBhbGxvd3MgdGhlIGZvcmtlZCBWTSB0byByZXNldCBpbnRvIHRoZSBzYW1lIHN0YXRlIHRoZSBw
YXJlbnQgVk0gaXMgaW4gYQo+IGZhc3RlciB3YXkgdGhlbiBjcmVhdGluZyBhIG5ldyBmb3JrIHdv
dWxkIGJlLiBNZWFzdXJlbWVudHMgc2hvdyBhYm91dCBhIDJ4Cj4gc3BlZWR1cCBkdXJpbmcgbm9y
bWFsIGZ1enppbmcgb3BlcmF0aW9ucy4gUGVyZm9ybWFuY2UgbWF5IHZhcnkgZGVwZW5kaW5nIGhv
dwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4gb24KPiBtdWNoIG1lbW9yeSBnb3QgYWxsb2NhdGVkIGZvciB0
aGUgZm9ya2VkIFZNLiBJZiBpdCBoYXMgYmVlbiBjb21wbGV0ZWx5Cj4gZGVkdXBsaWNhdGVkIGZy
b20gdGhlIHBhcmVudCBWTSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsgd291bGQgbGlrZWx5IGJl
IG1vcmUKPiBwZXJmb3JtYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2lu
Y2x1ZGUvcHVibGljL21lbW9yeS5oICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzcgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcu
YyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gaW5kZXggYWQ1ZGI5ZDhkNS4uZmI2
ODkyYWFhNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gQEAgLTE2MzYsNiArMTYzNiw1OSBA
QCBzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRv
bWFpbiAqY2QpCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIFRoZSBmb3Jr
IHJlc2V0IG9wZXJhdGlvbiBpcyBpbnRlbmRlZCB0byBiZSB1c2VkIG9uIHNob3J0LWxpdmVkIGZv
cmtzIG9ubHkuCj4gKyAqIFRoZXJlIGlzIG5vIGh5cGVyY2FsbCBjb250aW51YXRpb24gb3BlcmF0
aW9uIGltcGxlbWVudGVkIGZvciB0aGlzIHJlYXNvbi4KPiArICogRm9yIGZvcmtzIHRoYXQgb2J0
YWluIGEgbGFyZ2VyIG1lbW9yeSBmb290cHJpbnQgaXQgaXMgbGlrZWx5IGdvaW5nIHRvIGJlCj4g
KyAqIG1vcmUgcGVyZm9ybWFudCB0byBjcmVhdGUgYSBuZXcgZm9yayBpbnN0ZWFkIG9mIHJlc2V0
dGluZyBhbiBleGlzdGluZyBvbmUuCj4gKyAqCj4gKyAqIFRPRE86IEluIGNhc2UgdGhpcyBoeXBl
cmNhbGwgd291bGQgYmVjb21lIHVzZWZ1bCBvbiBmb3JrcyB3aXRoIGxhcmdlciBtZW1vcnkKPiAr
ICogZm9vdHByaW50cyB0aGUgaHlwZXJjYWxsIGNvbnRpbnVhdGlvbiBzaG91bGQgYmUgaW1wbGVt
ZW50ZWQuCgpJJ20gYWZyYWlkIHRoaXMgaXMgbm90IHNhZmUsIGFzIHVzZXJzIGRvbid0IGhhdmUg
YW4gZWFzeSB3YXkgdG8ga25vdwp3aGV0aGVyIGEgZm9yayB3aWxsIGhhdmUgYSBsYXJnZSBtZW1v
cnkgZm9vdHByaW50IG9yIG5vdC4KCklNTyB5b3UgZWl0aGVyIG5lZWQgc29tZSBraW5kIG9mIGNo
ZWNrIHRoYXQgcHJldmVudHMgdGhpcyBmdW5jdGlvbgpmcm9tIGJlaW5nIGV4ZWN1dGVkIHdoZW4g
dGhlIGRvbWFpbiBhcyB0b28gbXVjaCBtZW1vcnkgYXNzaWduZWQsIG9yCnlvdSBuZWVkIHRvIGlt
cGxlbWVudCBjb250aW51YXRpb25zLgoKT3IgZWxzZSB0aGlzIGlzIHZlcnkgbGlrZWx5IHRvIHRy
aXAgb3ZlciB0aGUgd2F0Y2hkb2cuCgo+ICsgKi8KPiArc3RhdGljIGludCBtZW1fc2hhcmluZ19m
b3JrX3Jlc2V0KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQoKTm8gbmVlZCBm
b3IgdGhlIG1lbV9zaGFyaW5nIHByZWZpeCwgYXMgaXQncyBhIHN0YXRpYyBmdW5jdGlvbi4KCj4g
K3sKPiArICAgIGludCByYzsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluKiBwMm0gPSBwMm1fZ2V0
X2hvc3RwMm0oY2QpOwo+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgKnRtcDsKPiArCj4g
KyAgICBkb21haW5fcGF1c2UoY2QpOwo+ICsKPiArICAgIHBhZ2VfbGlzdF9mb3JfZWFjaF9zYWZl
KHBhZ2UsIHRtcCwgJmNkLT5wYWdlX2xpc3QpCgpZb3UgY2FuIHVzZSBzb21ldGhpbmcgbGlrZToK
CndoaWxlICggKHBhZ2UgPSBwYWdlX2xpc3RfcmVtb3ZlX2hlYWQoJmNkLT5wYWdlX2xpc3QpICE9
IE5VTEwgKQp7CiAgICAuLi4KfQoKQW5kIGF2b2lkIHRoZSAqdG1wIGxvY2FsIHZhcmlhYmxlLgoK
PiArICAgIHsKPiArICAgICAgICBwMm1fdHlwZV90IHAybXQ7Cj4gKyAgICAgICAgcDJtX2FjY2Vz
c190IHAybWE7Cj4gKyAgICAgICAgZ2ZuX3QgZ2ZuOwo+ICsgICAgICAgIG1mbl90IG1mbiA9IHBh
Z2VfdG9fbWZuKHBhZ2UpOwo+ICsKPiArICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCj4g
KyAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICBnZm4gPSBtZm5fdG9fZ2ZuKGNk
LCBtZm4pOwo+ICsgICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbl94
KGdmbiksICZwMm10LCAmcDJtYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMCwgTlVMTCwgZmFsc2UpOwo+ICsKPiArICAgICAgICBpZiAoICFwMm1faXNfcmFtKHAybXQp
IHx8IHAybV9pc19zaGFyZWQocDJtdCkgKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4g
KyAgICAgICAgLyogdGFrZSBhbiBleHRyYSByZWZlcmVuY2UgKi8KPiArICAgICAgICBpZiAoICFn
ZXRfcGFnZShwYWdlLCBjZCkgKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAg
ICAgcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIGdmbiwgSU5WQUxJRF9NRk4sIFBBR0VfT1JERVJf
NEssCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1faW52YWxpZCwgcDJtX2FjY2Vz
c19yd3gsIC0xKTsKPiArICAgICAgICBBU1NFUlQoIXJjKTsKCkNhbiB5b3UgaGFuZGxlIHRoaXMg
Z3JhY2VmdWxseT8KCj4gKwo+ICsgICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsKPiAr
ICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiArICAgIH0KPiArCj4gKyAgICBpZiAoICEocmMgPSBo
dm1fY29weV9jb250ZXh0X2FuZF9wYXJhbXMoY2QsIGQpKSApCj4gKyAgICAgICAgZm9ya190c2Mo
Y2QsIGQpOwo+ICsKPiArICAgIGRvbWFpbl91bnBhdXNlKGNkKTsKPiArICAgIHJldHVybiByYzsK
PiArfQo+ICsKPiAgaW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
eGVuX21lbV9zaGFyaW5nX29wX3QpIGFyZykKPiAgewo+ICAgICAgaW50IHJjOwo+IEBAIC0xOTIw
LDYgKzE5NzMsMjkgQEAgaW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0oeGVuX21lbV9zaGFyaW5nX29wX3QpIGFyZykKPiAgICAgICAgICBicmVhazsKPiAgICAgIH0K
PiAgCj4gKyAgICBjYXNlIFhFTk1FTV9zaGFyaW5nX29wX2ZvcmtfcmVzZXQ6Cj4gKyAgICB7Cj4g
KyAgICAgICAgc3RydWN0IGRvbWFpbiAqcGQ7Cj4gKwo+ICsgICAgICAgIHJjID0gLUVJTlZBTDsK
PiArICAgICAgICBpZiAoIG1zby51LmZvcmsuX3BhZFswXSB8fCBtc28udS5mb3JrLl9wYWRbMV0g
fHwKPiArICAgICAgICAgICAgIG1zby51LmZvcmsuX3BhZFsyXSApCj4gKyAgICAgICAgICAgIGdv
dG8gb3V0Owo+ICsKPiArICAgICAgICByYyA9IC1FTk9TWVM7Cj4gKyAgICAgICAgaWYgKCAhZC0+
cGFyZW50ICkKCldoeSBub3QgdXNlIG1lbV9zaGFyaW5nX2lzX2Zvcms/CgpBbHNvIEkgdGhpbmsg
RUlOVkFMIHdvdWxkIGJlIG1vcmUgc3VpdGFibGUgaGVyZSwgYXMgdGhlIHBhc3NlZCBkb21pZApk
b2Vzbid0IGJlbG9uZyB0byBhIGZvcms/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
