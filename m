Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7610D721
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahOB-00033x-Q8; Fri, 29 Nov 2019 14:36:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iahOA-00033q-6r
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:36:54 +0000
X-Inumbo-ID: aea5ada5-12b5-11ea-a3e7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aea5ada5-12b5-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575038213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rD99yj0xBD0Q+mDxxnhSv7ljGhRO5+kkVkNSZbLWsEo=;
 b=ZecZu/+RgkR1Ln0O3mczD10GIhytYM9uiGJXKmwQpm5hOY1wSbyYibIs
 O6pNlj9hWIQbsVh5HYWAWW/06rM29J5i5aRL1A3fgtEZl/52T4WD/JHCP
 tm0nEgxfsX3uPTl2Vuw5wYKdGrc238W16KCVt6sdUOy7SDuZV9RPR0MPU o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wUfGZT4SLiK4co4H9AajT6g+fOpnBl4bOSjT4SOeWH1tdy5NWoBoN3hibh0rT2ZtCnokZeFWuz
 kG0nSMSIgVjoLvVbXnXqHai096PKSDgw6f9Q2tuIk8JVFzK2cOZcaepLfGaSwe+low6uS7fVFn
 XhM5HYu8xLwT8Gdi9eJBQjLkUUOQ8myC3A2B6FX89NtzuNsUAqgnD+B4rIK8nqSBLmU6rfzJuU
 RyA8lyUiFfFj3II8mVcT6yV7d/F/7ezljo/qJKI04139+A+8VFLsAbMrkOwbrz7jHSIsn7N26B
 GAE=
X-SBRS: 2.7
X-MesageID: 9537930
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9537930"
Date: Fri, 29 Nov 2019 15:36:46 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Message-ID: <20191129143646.GY980@Air-de-Roger>
References: <20191125172213.1904-1-roger.pau@citrix.com>
 <20191125172213.1904-3-roger.pau@citrix.com>
 <8f77f970-9b3b-2878-f1e7-6b87c9dfa25e@suse.com>
 <6954ab5e-3c40-e1ed-4610-1d336f50331a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6954ab5e-3c40-e1ed-4610-1d336f50331a@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/pvshim: do not enable global pages
 in shim mode
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTI6MTI6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOS8xMS8yMDE5IDEyOjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDI1
LjExLjIwMTkgMTg6MjIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+PiBXaGVuIHVzaW5nIGds
b2JhbCBwYWdlcyBhIGZ1bGwgdGxiIGZsdXNoIGNhbiBvbmx5IGJlIHBlcmZvcm1lZCBieQo+ID4+
IHRvZ2dsaW5nIHRoZSBQR0UgYml0IGluIENSNCwgd2hpY2ggaXMgdXN1YWxseSBxdWl0ZSBleHBl
bnNpdmUgaW4gdGVybXMKPiA+PiBvZiBwZXJmb3JtYW5jZSB3aGVuIHJ1bm5pbmcgdmlydHVhbGl6
ZWQuIFRoaXMgaXMgc3BlY2lhbGx5IHJlbGV2YW50IG9uCj4gPj4gQU1EIGhhcmR3YXJlLCB3aGlj
aCBkb2Vzbid0IGhhdmUgdGhlIGFiaWxpdHkgdG8gZG8gc2VsZWN0aXZlIENSNAo+ID4+IHRyYXBw
aW5nLCBidXQgY2FuIGFsc28gYmUgcmVsZXZhbnQgb24gSW50ZWwgaWYgdGhlIHVuZGVybHlpbmcK
PiA+PiBoeXBlcnZpc29yIGFsc28gdHJhcHMgb24gYWNjZXNzZXMgdG8gdGhlIFBHRSBDUjQgYml0
Lgo+ID4+Cj4gPj4gSW4gb3JkZXIgdG8gYXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBk
byBub3QgdXNlIGdsb2JhbCBwYWdlcwo+ID4+IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUuIE5v
dGUgdGhpcyBpcyBkb25lIHdoZW4gcnVubmluZyBvbiBib3RoCj4gPj4gSW50ZWwgb3IgQU1EIGhh
cmR3YXJlLCBzaW5jZSBvbGRlciB2ZXJzaW9ucyBvZiBYZW4gY2FwYWJsZSBvZiBydW5uaW5nCj4g
Pj4gdGhlIHNoaW0gZG9uJ3QgbWFrZSB1c2Ugb2YgSW50ZWwgc2VsZWN0aXZlIENSNCB0cmFwcGlu
ZyBmZWF0dXJlIGFuZAo+ID4+IHdpbGwgdm1leGl0IG9uIGV2ZXJ5IGFjY2VzcyB0byBDUjQuCj4g
PiBTbyBoZXJlIHlvdSBzYXkgeW91IGRvIHRoaXMgdW5pZm9ybWx5IGJlY2F1c2Ugb2Ygb2xkZXIg
WGVuLgo+ID4gV2hhdCBhYm91dCBuZXdlciBYZW4/IElzIHRoaXMgc3RpbGwgYSB3aW4gKG9yIGF0
IGxlYXN0IG5vdCBhCj4gPiBsb3NzKSB0aGVyZT8gSW5kZXBlbmRlbnQgb2YgdW5kZXJseWluZyBo
YXJkd2FyZT8KClNvIG9uIEludGVsIGh3IHRoYXQgZG9uJ3QgdHJhcCBDUjQgUEdFIGFjY2Vzc2Vz
IGRpc2FibGluZyBQR0Ugc2VlbXMgdG8KbWFrZSBwZXJmb3JtYW5jZSBzbGlnaHRseSB3b3JzZSB3
aGVuIGRvaW5nIGEgYG1ha2UgLWo4IHhlbmAgb24gYSA4IHZDUFUKcHYtc2hpbSBndWVzdDoKCkNS
NCBQR0UgZW5hYmxlZDoKcmVhbAkybTQwLjg4OXMKcmVhbAkybTQxLjcwMHMKcmVhbAkybTQwLjQ1
M3MKCkNSNCBQR0UgZGlzYWJsZWQ6CnJlYWwJMm00My4xOTdzCnJlYWwJMm00MS45NDBzCnJlYWwJ
Mm00Mi43MjdzCgo+ID4gSW4gY2FzZSBvZgo+ID4gYW55IGtpbmQgb2YgZG91YnQgSSB0aGluayB0
aGlzIHdvdWxkIHdhbnQgdG8gYmUgY29tbWFuZCBsaW5lCj4gPiBjb250cm9sbGFibGUuCj4gCj4g
T2xkZXIgWGVuIGhhcyBWTUV4aXRzIGZvciBhbGwgQ1I0LlBHRSBmbGlwcy4KPiAKPiBOZXdlciBY
ZW4gKHNpbmNlIDQuMTA/IGlpcmMpIG9uIEludGVsIGhhcmR3YXJlICh3aXRoIEhBUCkgYXJyYW5n
ZWQgZm9yCj4gQ1I0LlBHRSBmbGlwcyBub3QgdG8gdm1leGl0Lgo+IAo+IFRoZXJlIGlzIG5vIGFi
aWxpdHkgdG8gY2F1c2UgQ1I0LlBHRSBmbGlwcyB0byBub3Qgdm1leGl0IG9uIEFNRCwgb3RoZXIK
PiB0aGFuIHRvIGdpdmUgdGhlIGd1ZXN0IGZ1bGwgY29udHJvbCBvZiBDUjQgd2hpY2ggaXMgYSBC
YWRUaGluZyh0bSkuCj4gCj4gSSBhZ3JlZSB0aGF0IHRoaXMgd2FudHMgYSBjb21tYW5kIGxpbmUg
Y29udHJvbCwgYnV0IGl0IHdhbnRzIHRvIGJlCj4gZW5hYmxlZCBieSBkZWZhdWx0IGFueSB0aW1l
IHdlIGZpbmQgb3Vyc2VsdmVzIG5lc3RlZCBvbiBBTUQgaGFyZHdhcmUsCj4gbm90IGp1c3QgaW4g
c2hpbS4KCk9ubHkgb24gQU1EIGhhcmR3YXJlPyBOZXdlciB2ZXJzaW9ucyBvZiBYZW4gZG9uJ3Qg
dHJhcCBDUjQgUEdFIHdyaXRlcywKYnV0IHdoYXQgYWJvdXQgb3RoZXIgaHlwZXJ2aXNvcnM/CgpJ
IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBhdm9pZCB1c2luZyBQR0Ugd2hlbiB0aGUgaHlw
ZXJ2aXNvcgpDUFVJRCBiaXQgaXMgc2V0LCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIGhhcmR3
YXJlIGlzIEFNRCBvciBub3QuClRoZSBwZXJmb3JtYW5jZSBwZW5hbHR5IGRvZXNuJ3Qgc2VlbSB0
aGF0IGJhZCwgdGFraW5nIGludG8gYWNjb3VudAp0aGF0IHVzaW5nIFBHRSB3aGVuIENSNCBpcyB0
cmFwcGVkIGlzIG11Y2ggd29yc2UuIEFsdGVybmF0aXZlbHkgd2UKY291bGQgdHJ5IHRvIGRldGVj
dCBob3cgc2xvdyBhIGZsdXNoIGZyb20gQ1I0IGlzIGFuZCBhY3QgYWNjb3JkaW5nbHksCmJ1dCB0
aGF0IHNlZW1zIHRyaWNreS4KCkkgY2FuIGFkZCBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gZm9y
Y2Ugb3IgcHJldmVudCB0aGUgdXNhZ2Ugb2YgUEdFLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
