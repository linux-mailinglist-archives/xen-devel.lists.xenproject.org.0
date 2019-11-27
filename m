Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7F10AEA1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:24:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvPB-0002lH-VP; Wed, 27 Nov 2019 11:22:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZvPA-0002lC-3a
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:22:44 +0000
X-Inumbo-ID: 3a97f150-1108-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a97f150-1108-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574853764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+4YCzJV8PxVVT6kfGRmis4MgK+9dmufaEN9T7tjve6M=;
 b=W9fsw6EK7Gfm5Q0ZREUGftHsOlGxZYx2bjoF8dEbWMQJ/a7yDX9LjwdJ
 USvAfUvqUeGNflFOAzqJg4couj1mnL92xJ9nbkUqod04TyEwI3+uMpYQE
 8WAXs8LbA25CwZDFdwSepgMjPPsWM7Y5f1h6NbM0iF8mUAc4eAvDngcUn Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0vVbEEd9uhk8THtL9breU5RdIArMiZON5PBFPlaaj9m+TiUyJqMyXeizQ1tg8FRrKk+CZtXAVa
 HXBYlAnhLMv4drI+W1Xe7zxGbqq+yVMw0KadX3Mwd4R2ywADY2V1qzvE/WwgvSUTZ36mQkVW0w
 q/LoUmu7NrH9AG9Xfur1Y7LX4Cet7K5yBKZ6AHQj4uuwKJa+ufXPsfWsrK9Vun/lQ1nkGkX+Vq
 XqntBOYblOZ2aFaNyxiOAbsf77O/GN8TIfXS9lPuL2qGwjA6fWml665z4/9pVilWXgLhGa2XK2
 iwg=
X-SBRS: 2.7
X-MesageID: 8904239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="8904239"
Date: Wed, 27 Nov 2019 12:22:36 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127112236.GP980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDU6NTA6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMTEuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9pcnEuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9pcnEu
Ywo+ID4gQEAgLTUxNSw3ICs1MTUsMTEgQEAgdm9pZCBodm1fc2V0X2NhbGxiYWNrX3ZpYShzdHJ1
Y3QgZG9tYWluICpkLCB1aW50NjRfdCB2aWEpCj4gPiAgc3RydWN0IGh2bV9pbnRhY2sgaHZtX3Zj
cHVfaGFzX3BlbmRpbmdfaXJxKHN0cnVjdCB2Y3B1ICp2KQo+ID4gIHsKPiA+ICAgICAgc3RydWN0
IGh2bV9kb21haW4gKnBsYXQgPSAmdi0+ZG9tYWluLT5hcmNoLmh2bTsKPiA+IC0gICAgaW50IHZl
Y3RvcjsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogQWx3YXlzIGNhbGwgdmxhcGljX2hhc19wZW5k
aW5nX2lycSBzbyB0aGF0IFBJUiBpcyBzeW5jZWQgaW50byBJUlIgd2hlbgo+ID4gKyAgICAgKiB1
c2luZyBwb3N0ZWQgaW50ZXJydXB0cy4KPiA+ICsgICAgICovCj4gPiArICAgIGludCB2ZWN0b3Ig
PSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwo+IAo+IERpZCB5b3UgY29uc2lkZXIgZG9pbmcg
dGhpcyBjb25kaXRpb25hbGx5IGVpdGhlciBoZXJlIC4uLgo+IAo+ID4gQEAgLTUzMCw3ICs1MzQs
NiBAQCBzdHJ1Y3QgaHZtX2ludGFjayBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZj
cHUgKnYpCj4gPiAgICAgIGlmICggdmxhcGljX2FjY2VwdF9waWNfaW50cih2KSAmJiBwbGF0LT52
cGljWzBdLmludF9vdXRwdXQgKQo+ID4gICAgICAgICAgcmV0dXJuIGh2bV9pbnRhY2tfcGljKDAp
Owo+ID4gIAo+ID4gLSAgICB2ZWN0b3IgPSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwo+ID4g
ICAgICBpZiAoIHZlY3RvciAhPSAtMSApCj4gPiAgICAgICAgICByZXR1cm4gaHZtX2ludGFja19s
YXBpYyh2ZWN0b3IpOwo+IAo+IC4uLiBvciBoZXJlPwoKSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxv
dy4gVGhlIHdob2xlIHBvaW50IG9mIHRoaXMgY2hhbmdlIGlzIHRvIGVuc3VyZQp2bGFwaWNfaGFz
X3BlbmRpbmdfaXJxIGlzIHVuY29uZGl0aW9uYWxseSBjYWxsZWQgaW4KaHZtX3ZjcHVfaGFzX3Bl
bmRpbmdfaXJxLCBzbyBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSAiZG9pbmcgdGhpcwpj
b25kaXRpb25hbGx5Li4uIi4KCj4gSSBhc2sgbm90IG9ubHkgYmVjYXVzZSB0aGUgZnVuY3Rpb24g
aXNuJ3QgZXhhY3RseQo+IGNoZWFwIHRvIGNhbGwgKGFzIGlpcmMgeW91IGRpZCBhbHNvIG1lbnRp
b24gZHVyaW5nIHRoZSB2Mgo+IGRpc2N1c3Npb24pLCBidXQgYWxzbyBiZWNhdXNlIG9mIGl0cyBp
bnRlcmFjdGlvbiB3aXRoIFZpcmlkaWFuCj4gYW5kIG5lc3RlZCBtb2RlLiBJbiBjYXNlIG9mIHBy
b2JsZW1zIHRoZXJlLCBhdm9pZGluZyB0aGUgdXNlCj4gb2YgaW50ZXJydXB0IHBvc3Rpbmcgd291
bGQgYmUgYSB3b3JrYXJvdW5kIGluIHN1Y2ggY2FzZXMgdGhlbi4KCldvdWxkIHlvdSBsaWtlIG1l
IHRvIGV4cG9ydCBzb21ldGhpbmcgbGlrZSB2bGFwaWNfc3luY19waXJfdG9faXJyIGFuZApjYWxs
IGl0IHVuY29uZGl0aW9uYWxseSBpbnN0ZWFkIG9mIGNhbGxpbmcgdmxhcGljX2hhc19wZW5kaW5n
X2lycT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
