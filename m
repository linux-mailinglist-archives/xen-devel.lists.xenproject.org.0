Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924F144129
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 17:01:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itvuA-00023G-Fn; Tue, 21 Jan 2020 15:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgZb=3K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itvu9-00023B-5h
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 15:57:25 +0000
X-Inumbo-ID: b19130d0-3c66-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b19130d0-3c66-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579622235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S/XPG+sVUYJXeGtEy24E2fh3mSm6LSrvpUIaf02R1Es=;
 b=fy9HvU9MmyJw7fzGkhQSbfcF4bOLl7fzTwEBEzXjYxYwVfOIghnQtbLm
 Oi96cDcg3mly2s4vZhiiWMj28rONxyfg4hNnpKLjBwW4QeXzRoOeYA2n0
 6fNhZxx4ZWNkMfvEnZDdcJlLQ5l5mMS8qLEAMXmziBbV1BnIBtMu7u10R 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TYROQ+zuDwUsRnqfbaK4ex3gyvcazet6rhchmduxzg0I+QFHKxp5PHsvB24GQrfKTrqGX1rZcM
 Ed6+io5NvCRZXg4I1UVA3F0N4xxBfUMUx3+YFF9ZxX6od3e7KqjEvXc6ZskzVX8Mj6rqD8jDI1
 zuCGKHAFZ3/c/2CmadOhtKHtgq1Eim4mOqeRA3I8I3WGu9WifwVVGwppeJCrt8gVGTwhze0F3X
 iCoMBtPpv1oEmxRwPNzQ1yuulX+30N+aVYrBwZYJvalgzfBpo/TLWlsvYlSOjH0fTv/JsKFlIT
 A6M=
X-SBRS: 2.7
X-MesageID: 11646670
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11646670"
Date: Tue, 21 Jan 2020 15:57:08 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200121155708.GI11756@Air-de-Roger>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTE6NDM6NThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IFNv
IEknbSBub3Qgc3VyZSBob3cgdG8gcHJvZ3Jlc3Mgd2l0aCB0aGlzIHBhdGNoLCBhcmUgd2UgZmlu
ZSB3aXRoCj4gPiB0aG9zZSBsaW1pdGF0aW9ucz8KPiAKPiBJJ20gYWZyYWlkIHRoaXMgZGVwZW5k
cyBvbiAuLi4KPiAKPiA+IEFzIEkgc2FpZCwgWGVuIGhhc24ndCBnb3QgZW5vdWdoIGtub3dsZWRn
ZSB0byBjb3JyZWN0bHkgaXNvbGF0ZSB0aGUKPiA+IEJBUnMsIGFuZCBoZW5jZSB3ZSBoYXZlIHRv
IHJlbHkgb24gZG9tMCBEVFJULiBXZSBjb3VsZCBhZGQgY2hlY2tzIGluCj4gPiBYZW4gdG8gbWFr
ZSBzdXJlIG5vIEJBUnMgc2hhcmUgYSBwYWdlLCBidXQgaXQncyBhIG5vbi10cml2aWFsIGFtb3Vu
dAo+ID4gb2Ygc2Nhbm5pbmcgYW5kIHNpemluZyBlYWNoIHBvc3NpYmxlIEJBUiBvbiB0aGUgc3lz
dGVtLgo+IAo+IC4uLiB3aGV0aGVyIERvbTAgYWN0dWFsbHkgIkRUUlQiLCB3aGljaCBpbiB0dXJu
IGlzIGNvbXBsaWNhdGVkIGJ5IHRoZXJlCj4gbm90IGJlaW5nIGEgc3BlY2lmaWMgRG9tMCBrZXJu
ZWwgaW5jYXJuYXRpb24gdG8gY2hlY2sgYWdhaW5zdC4gUGVyaGFwcwo+IHJhdGhlciB0aGFuIGhh
dmluZyBYZW4gY2hlY2sgX2FsbF8gQkFScywgWGVuIG9yIHRoZSB0b29sIHN0YWNrIGNvdWxkCj4g
Y2hlY2sgQkFScyBvZiBkZXZpY2VzIGFib3V0IHRvIGJlIGhhbmRlZCB0byBhIGd1ZXN0PyBQZXJo
YXBzIHdlIG5lZWQgdG8KPiBwYXNzIGF1eGlsaWFyeSBpbmZvcm1hdGlvbiB0byBodm1sb2FkZXIg
dG8gYmUgYWJsZSB0byBqdWRnZSB3aGV0aGVyIGEKPiBCQVIgc2hhcmVzIGEgcGFnZSB3aXRoIGFu
b3RoZXIgb25lPyBQZXJoYXBzIHRoZXJlIGFsc28gbmVlZHMgdG8gYmUgYQo+IHdheSBmb3IgaHZt
bG9hZGVyIHRvIGtub3cgd2hhdCBvZmZzZXQgaW50byBhIHBhZ2UgaGFzIHRvIGJlIG1haW50YWlu
ZWQKPiBmb3IgYW55IHBhcnRpY3VsYXIgQkFSLCBhcyBmb2xsb3dzIGZyb20gSmFzb24ncyByZWNl
bnQgcmVwbHk/CgpMaW51eCBoYXMgYW4gb3B0aW9uIHRvIGZvcmNlIHJlc291cmNlIGFsaWdubWVu
dCAoYXMgcmVwb3J0ZWQgYnkKSmFzb24pLCBtYXliZSB3ZSBjb3VsZCBmb3JjZSBhbGwgQkFScyB0
byBiZSBhbGlnbmVkIHRvIHBhZ2Ugc2l6ZSBpbgpvcmRlciB0byBiZSBwYXNzZWQgdGhyb3VnaD8K
ClRoYXQgd291bGQgbWFrZSBpdCBlYXNpZXIgdG8gY2hlY2sgKGFzIFhlbi9RZW11IHdvdWxkIG9u
bHkgbmVlZCB0bwphc3NlcnQgdGhhdCB0aGUgQkFSIGFkZHJlc3MgaXMgYWxpZ25lZCksIGFuZCB3
b24ndCByZXF1aXJlIG11Y2ggZXh0cmEKd29yayBpbiBYZW4gYXBhcnQgZnJvbSB0aGUgY2hlY2sg
aXRzZWxmLgoKRG8geW91IHRoaW5rIHRoaXMgd291bGQgYmUgYW4gYWNjZXB0YWJsZSBzb2x1dGlv
bj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
