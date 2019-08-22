Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA39960F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 16:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0nnj-0007W4-GU; Thu, 22 Aug 2019 14:10:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0nni-0007Vz-T6
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 14:10:54 +0000
X-Inumbo-ID: a716e552-c4e6-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a716e552-c4e6-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566483053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R26BF0ZcsbtIzJ5BpYsooMl5UIA1doUkFOjLJPYy3rg=;
 b=E3k+iQmHWIZv+wnf1DYbVfxBGy7piejbactD7i3u9mL8EGPJHnLz/3M6
 aD3gIq/QWP3yZL3lstOT+N8Ix8Ffy2BX9EF4MStNoLXXpAWYUKqnpz4ub
 /8jdm4Vk91QI9ppOqWqwDFAWKEm7su0BAg7e9sYAL58SQicWWLsQhxx74 M=;
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
IronPort-SDR: vBlUPpEM98Z8mNMFkBVV+1lLv34Xjp8weKHgJvdbmgZnIjr6T3jNbA2ouNoKGRI0uSTrmSH+/V
 bp+m+8gOCkKk4ryPFw74qmgVjMvRak4L1XNlbeffuqyRRLDnJM4eOxDlKFwuaY25DmnP7mrQHD
 xOOlzD0vw6i9GMwL58wAOJc3PQP7Ecz8+VGJDNzurbyzQ++HOrAqnXmVnF1VqzeYfZK2/EFE1s
 ucmEvPLtvr3Y2PNfcB2n25yIHpza3pHWgaBls9rrBO2fVahfiganG1xPOLM85dSMO3BQnJ+YXA
 cK4=
X-SBRS: 2.7
X-MesageID: 4803734
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4803734"
Date: Thu, 22 Aug 2019 16:10:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190822141046.wludotavoun4qg6l@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-12-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566177928-19114-12-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 11/15] microcode: unify loading update
 during CPU resuming and AP wakeup
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6MjU6MjRBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gQm90aCBhcmUgbG9hZGluZyB0aGUgY2FjaGVkIHBhdGNoLiBTaW5jZSBBUHMgY2FsbCB0aGUg
dW5pZmllZCBmdW5jdGlvbiwKPiBtaWNyb2NvZGVfdXBkYXRlX29uZSgpLCBkdXJpbmcgd2FrZXVw
LCB0aGUgJ3N0YXJ0X3VwZGF0ZScgcGFyYW1ldGVyCj4gd2hpY2ggb3JpZ2luYWxseSB1c2VkIHRv
IGRpc3Rpbmd1aXNoIEJTUCBhbmQgQVBzIGlzIHJlZHVuZGFudC4gU28gcmVtb3ZlCj4gdGhpcyBw
YXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNv
bT4KPiAtLS0KPiBOb3RlIHRoYXQgaGVyZSBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlOiByZXN1bWlu
ZyBhIENQVSB3b3VsZCBjYWxsCj4gLT5lbmRfdXBkYXRlKCkgbm93IHdoaWxlIHByZXZpb3VzbHkg
aXQgd2Fzbid0LiBOb3QgcXVpdGUgc3VyZQo+IHdoZXRoZXIgaXQgaXMgY29ycmVjdC4KCkkgZ3Vl
c3MgdGhhdCdzIHJlcXVpcmVkIGlmIGl0IGNhbGxlZCBzdGFydF91cGRhdGUgcHJpb3IgdG8gY2Fs
bGluZwplbmRfdXBkYXRlPwoKPiAKPiBDaGFuZ2VzIGluIHY5Ogo+ICAtIHJldHVybiAtRU9QTk9U
U1VQUCByYXRoZXIgdGhhbiAwIGlmIG1pY3JvY29kZV9vcHMgaXMgTlVMTCBpbgo+ICAgIG1pY3Jv
Y29kZV91cGRhdGVfb25lKCkKPiAgLSByZWJhc2UgYW5kIGZpeCBjb25mbGljdHMuCj4gCj4gQ2hh
bmdlcyBpbiB2ODoKPiAgLSBzcGxpdCBvdXQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2gKPiAtLS0K
PiAgeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICB8ICAyICstCj4gIHhlbi9hcmNoL3g4
Ni9taWNyb2NvZGUuYyAgICAgICAgfCA5MCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgIDUgKy0tCj4g
IHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCAgNCArLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDQ0IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+IGlu
ZGV4IDRmMjE5MDMuLjI0Nzk4ZDUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPiBAQCAtMjUzLDcgKzI1Myw3
IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQo+ICAKPiAgICAgIGNvbnNvbGVf
ZW5kX3N5bmMoKTsKPiAgCj4gLSAgICBtaWNyb2NvZGVfcmVzdW1lX2NwdSgpOwo+ICsgICAgbWlj
cm9jb2RlX3VwZGF0ZV9vbmUoKTsKPiAgCj4gICAgICBpZiAoICFyZWNoZWNrX2NwdV9mZWF0dXJl
cygwKSApCj4gICAgICAgICAgcGFuaWMoIk1pc3NpbmcgcHJldmlvdXNseSBhdmFpbGFibGUgZmVh
dHVyZShzKVxuIik7Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyBiL3hl
bi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+IGluZGV4IGEyZmViYzcuLmJkZDljOWYgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jCj4gQEAgLTIwMywyNCArMjAzLDYgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLCB1aW50MzJfdCBsZW4pCj4gICAgICByZXR1
cm4gTlVMTDsKPiAgfQo+ICAKPiAtaW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHZvaWQpCj4gLXsK
PiAtICAgIGludCBlcnI7Cj4gLSAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnRoaXNf
Y3B1KGNwdV9zaWcpOwo+IC0KPiAtICAgIGlmICggIW1pY3JvY29kZV9vcHMgKQo+IC0gICAgICAg
IHJldHVybiAwOwo+IC0KPiAtICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsKPiAtCj4g
LSAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKHNpZyk7Cj4gLSAgICBp
ZiAoIGxpa2VseSghZXJyKSApCj4gLSAgICAgICAgZXJyID0gbWljcm9jb2RlX29wcy0+YXBwbHlf
bWljcm9jb2RlKG1pY3JvY29kZV9jYWNoZSk7Cj4gLSAgICBzcGluX3VubG9jaygmbWljcm9jb2Rl
X211dGV4KTsKPiAtCj4gLSAgICByZXR1cm4gZXJyOwo+IC19Cj4gLQo+ICB2b2lkIG1pY3JvY29k
ZV9mcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXRjaCkKPiAg
ewo+ICAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVfcGF0Y2gtPm1jKTsK
PiBAQCAtMzg0LDExICszNjYsMjkgQEAgc3RhdGljIGludCBfX2luaXQgbWljcm9jb2RlX2luaXQo
dm9pZCkKPiAgfQo+ICBfX2luaXRjYWxsKG1pY3JvY29kZV9pbml0KTsKPiAgCj4gLWludCBfX2lu
aXQgZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUoYm9vbCBzdGFydF91cGRhdGUpCj4gKy8qIExv
YWQgYSBjYWNoZWQgdXBkYXRlIHRvIGN1cnJlbnQgY3B1ICovCj4gK2ludCBtaWNyb2NvZGVfdXBk
YXRlX29uZSh2b2lkKQo+ICt7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAgaWYgKCAhbWljcm9j
b2RlX29wcyApCj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArICAgIHJjID0g
bWljcm9jb2RlX3VwZGF0ZV9jcHUoTlVMTCk7Cj4gKwo+ICsgICAgaWYgKCBtaWNyb2NvZGVfb3Bz
LT5lbmRfdXBkYXRlICkKPiArICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlKCk7CgpE
b24ndCB5b3UgbmVlZCB0byBjYWxsIHN0YXJ0X3VwZGF0ZSBiZWZvcmUgY2FsbGluZwptaWNyb2Nv
ZGVfdXBkYXRlX2NwdT8KCkl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBwYWlyZWQgY2FsbHMgdG8g
c3RhcnRfdXBkYXRlL2VuZF91cGRhdGUgaW4KdGhlIHNhbWUgY29udGV4dCAoaWU6IGZ1bmN0aW9u
KSBvciBlbHNlIHRoaXMgaXMgdmVyeSBoYXJkIHRvIGZvbGxvdywKYW5kIHZlcnkgZWFzeSB0byBn
ZXQgb3V0IG9mIHN5bmMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
