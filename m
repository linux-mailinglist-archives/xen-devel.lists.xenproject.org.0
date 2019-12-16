Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0BE120678
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:58:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpur-0006jj-4k; Mon, 16 Dec 2019 12:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igpup-0006jd-Q1
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:55:59 +0000
X-Inumbo-ID: 62ea1c00-2003-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62ea1c00-2003-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576500951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iPtvR2mtdaYu5WIYvyRtZmdLH5HIjbigG9mXpkiO7qo=;
 b=O8IWsafcgSU4YSLuF0qXUqkdXCSE/tuAwGxlDFQEYmAjc2pRjltE0NbR
 6gCmlQDyzwQVHq8+3et3niHczj+UFhjBKjyWFoZVFXUs0Bo3USY8Crypj
 LhZijVpWDth0cU7yVw0+qNWwNAJpr8EWtedbaanrT9Ooe2Vh+zalhj6jc c=;
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
IronPort-SDR: px0LPtEabcj8ZqlkLqcKUIMDncHObeIkEyVySxuzCP9ch10o/lqqPw1BLKfqkCq2O3uD+LxPy3
 cjZKkSjg2WNtG4Bs3lqjx4Y0H22sSwJTIgi+lydigk825gug+bh+REy55gD5kA3IEc9jvrh0se
 Ox8lPNiBW24yD1EeVrvZLembLR9ToNyXFI7KZEVNJCnpwhmOsW9uFd+kQGNTye3Uf7UaQRnitw
 3dMzJjrax0Kiujgj0VEoPcK6mvZZ0Dqn1gGkbR9us5tdxven/NB/smQ4PCv5fnZNjEWqMU3kVh
 HEU=
X-SBRS: 2.7
X-MesageID: 9728428
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; 
   d="scan'208";a="9728428"
Date: Mon, 16 Dec 2019 13:55:43 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191216125543.GO11756@Air-de-Roger>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
 <ccecb779-66e6-57a3-3eb8-e15e4d0e0839@suse.com>
 <20191216123020.GN11756@Air-de-Roger>
 <a69ee32c-02ed-330f-a457-51b1f221ce06@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a69ee32c-02ed-330f-a457-51b1f221ce06@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDE6NDU6MTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMTIuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRGVjIDE2LCAyMDE5IGF0IDEyOjIxOjA5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE2LjEyLjIwMTkgMTE6MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIEZyaSwgRGVjIDEzLCAyMDE5IGF0IDEwOjQ4OjAyUE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4+Pj4gIHVpbnQ2NF90IHB2X3NvZnRfcmR0c2MoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ID4+Pj4gIHsKPiA+Pj4+IC0g
ICAgc190aW1lX3Qgbm93ID0gZ2V0X3NfdGltZSgpOwo+ID4+Pj4gKyAgICBzX3RpbWVfdCBvbGQs
IG5ldywgbm93ID0gZ2V0X3NfdGltZSgpOwo+ID4+Pj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0g
di0+ZG9tYWluOwo+ID4+Pj4gIAo+ID4+Pj4gLSAgICBzcGluX2xvY2soJmQtPmFyY2gudnRzY19s
b2NrKTsKPiA+Pj4+IC0KPiA+Pj4+IC0gICAgaWYgKCAoaW50NjRfdCkobm93IC0gZC0+YXJjaC52
dHNjX2xhc3QpID4gMCApCj4gPj4+PiAtICAgICAgICBkLT5hcmNoLnZ0c2NfbGFzdCA9IG5vdzsK
PiA+Pj4+IC0gICAgZWxzZQo+ID4+Pj4gLSAgICAgICAgbm93ID0gKytkLT5hcmNoLnZ0c2NfbGFz
dDsKPiA+Pj4+IC0KPiA+Pj4+IC0gICAgc3Bpbl91bmxvY2soJmQtPmFyY2gudnRzY19sb2NrKTsK
PiA+Pj4+ICsgICAgZG8gewo+ID4+Pj4gKyAgICAgICAgb2xkID0gZC0+YXJjaC52dHNjX2xhc3Q7
Cj4gPj4+PiArICAgICAgICBuZXcgPSAoaW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3Qp
ID4gMCA/IG5vdyA6IG9sZCArIDE7Cj4gPj4+Cj4gPj4+IFdoeSBkbyB5b3UgbmVlZCB0byBkbyB0
aGlzIHN1YnRyYWN0aW9uPyBJc24ndCBpdCBlYXNpZXIgdG8ganVzdCBkbzoKPiA+Pj4KPiA+Pj4g
bmV3ID0gbm93ID4gZC0+YXJjaC52dHNjX2xhc3QgPyBub3cgOiBvbGQgKyAxOwo+ID4+Cj4gPj4g
VGhpcyB3b3VsZG4ndCBiZSByZWxpYWJsZSB3aGVuIHRoZSBUU0Mgd3JhcHMuIFJlbWVtYmVyIHRo
YXQgZmlybXdhcmUKPiA+PiBtYXkgc2V0IHRoZSBUU0MsIGFuZCBpdCBoYXMgYmVlbiBzZWVuIHRv
IGJlIHNldCB0byB2ZXJ5IGxhcmdlCj4gPj4gKGVmZmVjdGl2ZWx5IG5lZ2F0aXZlLCBpZiB0aGV5
IHdlcmUgc2lnbmVkIHF1YW50aXRpZXMpIHZhbHVlcywKPiA+IAo+ID4gc190aW1lX3QgaXMgYSBz
aWduZWQgdmFsdWUgQUZBSUNUIChzNjQpLgo+IAo+IE9oLCBJIHNob3VsZCBoYXZlIGxvb2tlZCBh
dCB0eXBlcywgcmF0aGVyIHRoYW4gaW5mZXJyaW5nIHVpbnQ2NF90Cj4gaW4gcGFydGljdWxhciBm
b3Igc29tZXRoaW5nIGxpa2UgdnRzY19sYXN0Lgo+IAo+ID4+IHdoaWNoCj4gPj4gd2lsbCB0aGVu
IGV2ZW50dWFsbHkgd3JhcCAod2hlcmVhcyB3ZSdyZSBub3QgdHlwaWNhbGx5IGNvbmNlcm5lZCBv
Zgo+ID4+IDY0LWJpdCBjb3VudGVycyB3cmFwcGluZyB3aGVuIHRoZXkgc3RhcnQgZnJvbSB6ZXJv
KS4KPiA+IAo+ID4gQnV0IGdldF9zX3RpbWUgcmV0dXJucyB0aGUgc3lzdGVtIHRpbWUgaW4gbnMg
c2luY2UgYm9vdCwgbm90IHRoZSBUU0MKPiA+IHZhbHVlLCBoZW5jZSBpdCB3aWxsIHN0YXJ0IGZy
b20gMCBhbmQgd2Ugc2hvdWxkbid0IGJlIGNvbmNlcm5lZCBhYm91dAo+ID4gd3JhcHM/Cj4gCj4g
R29vZCBwb2ludCwgc2VlaW5nIHRoYXQgYWxsIHBhcnRzIGhlcmUgYXJlIHNfdGltZV90LiBPZiBj
b3Vyc2UKPiB3aXRoIGFsbCBwYXJ0cyBiZWluZyBzbywgdGhlcmUncyBpbmRlZWQgbm8gbmVlZCBm
b3IgdGhlIGNhc3QsCj4gYnV0IGNvbXBhcmluZyBib3RoIHZhbHVlcyBpcyB0aGVuIGVxdWl2YWxl
bnQgdG8gY29tcGFyaW5nIHRoZQo+IGRpZmZlcmVuY2UgYWdhaW5zdCB6ZXJvLgoKUmlnaHQsIEkg
anVzdCB0aGluayBpdCdzIGVhc2llciB0byBjb21wYXJlIGJvdGggdmFsdWVzIGluc3RlYWQgb2YK
Y29tcGFyaW5nIHRoZSBkaWZmZXJlbmNlIGFnYWluc3QgemVybyAoYW5kIGxpa2VseSBsZXNzIGV4
cGVuc2l2ZSBpbgp0ZXJtcyBvZiBwZXJmb3JtYW5jZSkuCgpBbnl3YXksIEkgcHJlZmVyIGNvbXBh
cmluZyBib3RoIHZhbHVlcyBpbnN0ZWFkIG9mIHRoZSBkaWZmZXJlbmNlLCBidXQKdGhhdCdzIGFs
c28gY29ycmVjdCBhbmQgSSB3b3VsZCBiZSBmaW5lIHdpdGggaXQgYXMgbG9uZyBhcyB0aGUgY2Fz
dCBpcwpkcm9wcGVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
