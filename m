Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5B1597E1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 19:14:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1a0Q-00068G-A3; Tue, 11 Feb 2020 18:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46st=37=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1a0O-000689-UM
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 18:11:28 +0000
X-Inumbo-ID: ebec1bac-4cf9-11ea-b615-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebec1bac-4cf9-11ea-b615-12813bfff9fa;
 Tue, 11 Feb 2020 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581444688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wSJ3FygEfkLY54oX3jO1X+bU4eoRtdq+7mLxn8KR1dw=;
 b=WSmh+LELKluuoLtX/9Xu91bNmCr3BdnzvecJXF9LMLOac84LOGhZMNvn
 VaByu38AD8B6bBHfWHhmi0Jn1xnwPn0CkY+D8HVJP6YhBILwLPFBZS9W2
 TcWoVqwsCPEVvgUaBA/b5cZqv0ec0dMHZGxD3xi5Qn+7dyG+RVaR/aWfw E=;
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
IronPort-SDR: GoiLsE4xhPlkyNfLa9kSQhtItOEHCQWavGvv7E+8B+7ycBYSuHE7wHujstmrIAIbQIr7OzxOKf
 wah3ejmt0DhVhc9QHTNcHAXxAU8VlMfC+969eUOZEO8DS2qtjZfVC6fTXmjk0AhHrrukrsqZvp
 fSgwM8VQgDCqsYCXXQQ7c+pZtSWIvMrexkHxyZqmxcaid1NZfCsMRh+4djp3HhElzW3oxQWNuq
 /RDQliIJlkcBS2+UPm02xCJCuKqfbnZdFLmjfWAyM0NiJD6FotZIqi8pPa9UQ28X/9hCcBdXvH
 GVQ=
X-SBRS: 2.7
X-MesageID: 12721472
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12721472"
Date: Tue, 11 Feb 2020 19:11:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200211181120.GO4679@Air-de-Roger>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
 <20200211160149.GL4679@Air-de-Roger>
 <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
 <20200211164215.GN4679@Air-de-Roger>
 <975f1878-aab4-caa1-6c2e-67cf3cf70ade@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <975f1878-aab4-caa1-6c2e-67cf3cf70ade@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PV Shim ballooning
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDU6Mjk6MDlQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTEvMDIvMjAyMCAxNjo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDA0OjI5OjM2UE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4+IEFncmVlLiBCdXQgYXMgSSBzYWlkIEknbSBub3QgYXdhcmUgb2YgYW55IGd1
ZXN0IHRoYXQgdmlvbGF0ZXMgdGhlCj4gPj4gaW52YXJpYW50IG9mIGRlY3JlYXNlX3Jlc2VydmF0
aW9uKCkgYmVpbmcgdGhlIGxhc3QgY2FsbC4KPiA+IAo+ID4gTWF5YmUgd2UgY291bGQgcGlnZ3li
YWNrIG9uIHdoZXRoZXIgYSBwYWdlIGlzIHJlbW92ZWQgZnJvbSB0aGUgZG9tYWluCj4gPiBkb21o
ZWFwIGFuZCB1c2UgdGhhdCBhcyBhIHNpZ25hbCB0aGF0IHRoZSBwYWdlIHNob3VsZCBiZSBiYWxs
b29uZWQKPiA+IG91dD8KPiA+IAo+ID4gVGhlcmUncyBhbHJlYWR5IGFuIGFyY2hfZnJlZV9oZWFw
X3BhZ2UgdGhhdCdzIGNhbGxlZCB3aGVuIGEgcGFnZSBpcwo+ID4gcmVtb3ZlZCBmcm9tIGEgZG9t
YWluLCB3aGljaCBtaWdodCBiZSBzdWl0YWJsZSBmb3IgdGhpcy4gSXQgd291bGQKPiA+IGhvd2V2
ZXIgaW1wbHkgbWFraW5nIGFuIGh5cGVyY2FsbCBmb3IgZXZlcnkgcGFnZSB0byBiZSBiYWxsb29u
ZWQgb3V0Lgo+IAo+IEkgdGVzdGVkIHRoYXQgLSBkb2Vzbid0IHdvcmsgLSB0b28gbWFueSBoeXBl
cmNhbGxzIG1ha2UgYmFsbG9vbmluZyB0YWtlCj4gYWdlcy4gVGhpcyBzaW1wbHkgY2Fubm90IGJl
IGRvbmUgb24gcGFnZS1ieS1wYWdlIGJhc2lzLgoKV2h5IG5vdCBwbGFjZSB0aGVtIG9uIGEgbGlz
dCAoaW4gYXJjaF9mcmVlX2hlYXBfcGFnZSkgYW5kIGRvIHRoZSBmbHVzaAplaXRoZXIgYWZ0ZXIg
YSB0aW1lb3V0IG9yIHdoZW4gaXQgZ2V0cyB0byBhIGNlcnRhaW4gbnVtYmVyIG9mCmVsZW1lbnRz
PwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
