Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDA15C13C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 16:19:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2GDQ-0002ap-2E; Thu, 13 Feb 2020 15:15:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2GDO-0002ak-Ar
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 15:15:42 +0000
X-Inumbo-ID: b26a2196-4e73-11ea-b8c6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b26a2196-4e73-11ea-b8c6-12813bfff9fa;
 Thu, 13 Feb 2020 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581606941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aFsEpdoqHB6NDSmiAY7BGWVHldtHLvfKC09AH9IlmOE=;
 b=Wq/kgTHIdPQN0+2mmqoXAGO8SrMKpdPchfjI4JSckMLt7GZSoq7cpJdZ
 U6iemL+0DdNH/0kZTdjZO+c+LJFNSGf7pZFantFbi3zyw6ME6d+3x9VFF
 PQpNCcwEkOxxTM3HKGxFz22T3WOaQXz7uzE5QNlNwggii+/EmNW47Hs87 A=;
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
IronPort-SDR: u3J/7kxvvsLTC2tbmV+0V5j2ORyKqVqyB9ueBcztntyA+jWj3Cc2L3/LHVlrWkpXUkKCtpjZsi
 xCg6qhw1SQCVofbQoWz9bnybdakEy3Ydzr6mV0jmnIW9d/AGOdET5Uz5Mg6JC33m7vYqEDQjng
 X/l4q7eza24DTBfEGu9TvWQ8/sfKGJu13lfnmSEptAndwLLvRDc3GE2oEwdwnwbWQ/tc8tJ6b1
 VayQljC1C8k7S7FtpErW0r6zPrf+vHxI4tB0Wnvix55npj2K0mTtwCObhKCcJ7ZQIY/19e5dPD
 ibg=
X-SBRS: 2.7
X-MesageID: 12839152
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,437,1574139600"; d="scan'208";a="12839152"
Date: Thu, 13 Feb 2020 16:15:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213151530.GZ4679@Air-de-Roger>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-4-roger.pau@citrix.com>
 <9fc88888-a670-a68e-f1b6-c0d258ab7b6e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fc88888-a670-a68e-f1b6-c0d258ab7b6e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/3] x86: add accessors for scratch cpu mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6MTI6MTJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTIyMyw3ICsyMjMsMTAgQEAgc3RhdGljIHZvaWQgX2NsZWFyX2lycV92ZWN0b3Ioc3RydWN0IGly
cV9kZXNjICpkZXNjKQo+ID4gICAgICB0cmFjZV9pcnFfbWFzayhUUkNfSFdfSVJRX0NMRUFSX1ZF
Q1RPUiwgaXJxLCB2ZWN0b3IsIHRtcF9tYXNrKTsKPiA+ICAKPiA+ICAgICAgaWYgKCBsaWtlbHko
IWRlc2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcykgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICBw
dXRfc2NyYXRjaF9jcHVtYXNrKCk7Cj4gPiAgICAgICAgICByZXR1cm47Cj4gPiArICAgIH0KPiAK
PiBJJ20gbm90IG92ZXJseSBoYXBweSB0byBzZWUgYSBuZWVkIGludHJvZHVjZWQgdG8gZG8gY2xl
YW51cCBsaWtlCj4gdGhpcyBvbmUsIGJ1dCBhdCBsZWFzdCBtaXNzaW5nIGEgcGF0aCBpcyBhIGRl
YnVnLWJ1aWxkIHByb2JsZW0KPiBvbmx5Lgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJv
b3QuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gQEAgLTU3LDYgKzU3LDMw
IEBAIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9jb3JlX21h
c2spOwo+ID4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIHNjcmF0
Y2hfY3B1bWFzayk7Cj4gPiAgc3RhdGljIGNwdW1hc2tfdCBzY3JhdGNoX2NwdTBtYXNrOwo+ID4g
IAo+ID4gKyNpZm5kZWYgTkRFQlVHCj4gPiArY3B1bWFza190ICpzY3JhdGNoX2NwdW1hc2soY29u
c3QgY2hhciAqZm4pCj4gCj4gUGxlYXNlIGRvbid0IHBhc3MgYW4gYXJndW1lbnQgdGhhdCB5b3Ug
Y2FuIGRlZHVjZSwgYW5kIHRoZW4KPiBwcm92aWRlIGV2ZW4gbW9yZSBtZWFuaW5nZnVsIGRhdGE6
Cj4gCj4gPiArewo+ID4gKyAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY29uc3QgY2hhciAqLCBz
Y3JhdGNoX2NwdW1hc2tfdXNlKTsKPiA+ICsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogU2NyYXRj
aCBjcHVtYXNrIGNhbm5vdCBiZSB1c2VkIGluIElSUSBjb250ZXh0LCBvciBlbHNlIHdlIHdvdWxk
IGhhdmUgdG8KPiA+ICsgICAgICogbWFrZSBzdXJlIGFsbCB1c2VycyBoYXZlIGludGVycnVwdHMg
ZGlzYWJsZWQgd2hpbGUgdXNpbmcgdGhlIHNjcmF0Y2gKPiA+ICsgICAgICogbWFzay4KPiA+ICsg
ICAgICovCj4gPiArICAgIEJVR19PTihpbl9pcnEoKSk7Cj4gPiArCj4gPiArICAgIGlmICggZm4g
JiYgdW5saWtlbHkodGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrX3VzZSkpICkKPiA+ICsgICAgewo+
ID4gKyAgICAgICAgcHJpbnRrKCIlczogc2NyYXRjaCBDUFUgbWFzayBhbHJlYWR5IGluIHVzZSBi
eSAlc1xuIiwKPiA+ICsgICAgICAgICAgICAgIGZuLCB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tf
dXNlKSk7Cj4gCj4gVXNlIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSBoZXJlLCB3aGljaCB3
aWxsIGFsbG93Cj4gaWRlbnRpZnlpbmcgd2hpY2ggb2YgcGVyaGFwcyBtdWx0aXBsZSB1c2VzIGlu
IGEgZnVuY3Rpb24gaXMKPiB0aGUgb2ZmZW5kaW5nIG9uZS4KCldpbGwgY2hhbmdlLgoKPiAKPiBB
bHNvLCB3aHkgaW4gc21wYm9vdC5jIGluc3RlYWQgb2YgaW4gc21wLmM/IFRoaXMgaXNuJ3QgYQo+
IGJvb3Qgb3IgQ1BVLWhvdC1vbmxpbmUgcmVsYXRlZCBmdW5jdGlvbiBhZmFpY3QuCgpJJ3ZlIGFk
ZGVkIGl0IHRvIHNtcGJvb3QuYyBiZWNhdXNlIHRoYXQncyB3aGVyZSBzY3JhdGNoX2NwdW1hc2sg
aXMKZGVmaW5lZC4gSSBjb3VsZCBtb3ZlIGl0IHRvIHNtcC5jLCBidXQgSSB3b3VsZCBwcmVmZXIg
dG8ga2VlcCB0aGUKYWNjZXNzb3IgYXMgY2xvc2UgYXMgcG9zc2libGUgdG8gdGhlIGRlY2xhcmF0
aW9uLgoKPiAKPiBGaW5hbGx5LCBpdCB3b3VsZCBzZWVtIG5pY2UgaWYgbXVsdGlwbGUgdXNlcyBi
eSB0aGUgc2FtZSBjYWxsZXIKPiBjb3VsZCBiZSBwZXJtaXR0ZWQ6Cj4gCj4gICAgIGZvciAoIC4u
LiApCj4gICAgIHsKPiAgICAgICAgIGlmICggLi4uICkKPiAgICAgICAgIHsKPiAgICAgICAgICAg
ICBtYXNrID0gZ2V0X3NjcmF0Y2hfY3B1bWFzaygpOwo+ICAgICAgICAgICAgIC4uLgo+ICAgICAg
ICAgfQo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgewo+ICAgICAgICAgICAgIC8qIG5vIHVzZSBv
ZiBnZXRfc2NyYXRjaF9jcHVtYXNrKCkgKi8KPiAgICAgICAgICAgICAuLi4KPiAgICAgICAgIH0K
PiAgICAgfQo+IAo+ICAgICBwdXRfc2NyYXRjaF9jcHVtYXNrKCk7CgpJIGhhdmUgdG8gYWRtaXQg
SSBkb24ndCByZWFsbHkgbGlrZSB0aGlzIGtpbmRzIG9mIGFzeW1tZXRyaWMKY29uc3RydWN0aW9u
cywgd2hhdCB5b3Ugc3VnZ2VzdCBmb3IgZXhhbXBsZSB3b24ndCBiZSB2YWxpZCBpZgpnZXRfc2Ny
YXRjaF9jcHVtYXNrIHRvb2sgc29tZSBraW5kIG9mIGxvY2suCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
