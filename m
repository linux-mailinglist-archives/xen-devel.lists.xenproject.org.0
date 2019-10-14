Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC811D66E8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:11:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK2r6-0002Ec-IJ; Mon, 14 Oct 2019 16:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iK2r4-0002Dj-Ks
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:05:54 +0000
X-Inumbo-ID: 7f45d152-ee9c-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f45d152-ee9c-11e9-beca-bc764e2007e4;
 Mon, 14 Oct 2019 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571069153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=28QcIxOB5qmx1gfXpVd2uddRW2GybeqxYtT4MzYkBrc=;
 b=XKk+yRxzaqUcztWYfdE1w0rJKImtXjEkR4zOqlhUeJdDe0+SW3QWhVWK
 TCgzlLCITufrt3ZxMu3WcBv5mp8LdVEpOvZjKttxUi1LqM2WDCx6aHXd5
 Nd/AJNR2VzG7iYBMslH0Ux/PZJYs8xxmklLLxy7jIEjk5QWuNgkvoSbNe s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w5rru48wqsTVhTUJVTjR0HmcI9wP0i/+ePu+rtfAFpcfWm3ZA2mtjcLpt8xzVtoZjh72WS8jdW
 pykxSit41OCfbyjJNNY6qSgLvdAlkAoLhXLZbUovv60kMvd4mIqbqsTBHbSbnNDUtU2hM3JGkH
 +tDWi5D8b5oYnMS0S4GbsfZSBBoFhMtZGisViFG8L/lbVL7jLkXtRHgaZ93F12AHdu36YRdec6
 2H+kNKj0ipGTXaCROnpZcVxR3/y6tzkRcsv759s8eKydHluXrrBYXfpcjrj7E8ro0/10RH9igz
 wqM=
X-SBRS: 2.7
X-MesageID: 7171458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="7171458"
Date: Mon, 14 Oct 2019 17:05:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191014160550.GA1138@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-7-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011165549.21639-7-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTU6NDlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTElCWExfUEFTU1RIUk9VR0hfVU5LTk9XTiAoYWthICJFTkFCTEVEIiBpbiBhbiBlYXJs
aWVyIHVuY29tbWl0dGVkCgpJIGd1ZXNzIHRoYXQncyBub3cgTElCWExfUEFTU1RIUk9VR0hfVU5T
UEVDSUZJRUQuCgo+IHZlcnNpb24gb2YgdGhpcyBjb2RlKSBpcyBkb2luZyBkb3VibGUgZHV0eS4g
IFdlIGFjdHVhbGx5IG5lZWQgYWxsIG9mCj4gdGhlIGZvbGxvd2luZyB0byBiZSBzcGVjaWZpY2Fi
bGU6Cj4gICAqIGRlZmF1bHQgKCJ1bnNwZWNpZmllZCIpOiBlbmFibGUgUFQgaWZmIHdlIGhhdmUg
ZGV2aWNlcyB0bwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5pZgoK
PiAgICAgcGFzcyB0aHJvdWdoIHNwZWNpZmllZCBpbiB0aGUgaW5pdGlhbCBjb25maWcgZmlsZS4K
PiAgICogImVuYWJsZWQiIChhbmQgZmFpbCBpZiB0aGUgcGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0
IGl0KS4KPiAgICogImRpc2FibGVkIiAoYW5kIHJlamVjdCBmdXR1cmUgUFQgaG90cGx1ZykuCj4g
ICAqICJzaGFyZV9wdCIvInN5bmNfcHQiOiBlbmFibGUgUFQgYW5kIHNldCBhIHNwZWNpZmljIFBU
IG1vZGUuCj4gCj4gRGVmYXVsdGluZyBhbmQgZXJyb3IgY2hlY2tpbmcgc2hvdWxkIGJlIGRvbmUg
aW4gbGlieGwuICBTbywgd2UgbWFrZQo+IHNldmVyYWwgY2hhbmdlcyBoZXJlLgo+IAo+IFdlIGlu
dHJvZHVjZSAiZW5hYmxlZCIuICAoQW5kIHdlIGRvY3VtZW50ICJ1bnNwZWNpZmllZCIuKQo+IAo+
IFdlIG1vdmUgYWxsIG9mIHRoZSBlcnJvciBjaGVja2luZyBhbmQgZGVmYXVsdGluZyBjb2RlIGZy
b20geGwgaW50bwo+IGxpYnhsLiAgTm93LCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0
IGhhcyBhbGwgb2YgdGhlIG5lY2Vzc2FyeQo+IGluZm9ybWF0aW9uIHRvIGdldCB0aGlzIHJpZ2h0
LiAgU28gd2UgY2FuIGRvIGl0IGFsbCB0aGVyZS4gIENob29zaW5nCj4gdGhlIHNwZWNpZmljIG1v
ZGUgaXMgYXJjaC1zcGVjaWZpYy4KPiAKPiBXZSBjYW4gYWxzbyBhcnJhbmdlIHRvIGhhdmUgb25s
eSBvbmUgcGxhY2UgZWFjaCB3aGljaCBjYWxjdWxhdGVzCj4gKGkpIHdoZXRoZXIgcGFzc3Rocm91
Z2ggbmVlZHMgdG8gYmUgZW5hYmxlZCBiZWNhdXNlIHB0IGRldmljZXMgd2VyZQo+IHNwZWNpZmll
ZCAoaWkpIHdoZXRoZXIgcHRfc2hhcmUgY2FuIGJlIHVzZWQgKGZvciBlYWNoIGFyY2gpLgo+IAo+
IHhsIG5vdyBvbmx5IGhhcyB0byBwYXJzZSB0aGUgZW51bSBpbiB0aGUgc2FtZSB3YXkgYXMgaXQg
cGFyc2VzIGFsbAo+IG90aGVyIGVudW1zLgo+IAo+IFRoaXMgY2hhbmdlIGZpeGVzIGEgcmVncmVz
c2lvbiBmcm9tIGVhcmxpZXIgNC4xMy1wcmU6IHVudGlsIHJlY2VudAo+IGNoYW5nZXMsIHBhc3N0
aHJvdWdoIHdhcyBvbmx5IGVuYWJsZWQgYnkgZGVmYXVsdCBpZiBwYXNzdGhyb3VnaAo+IGRldmlj
ZXMgd2VyZSBzcGVjaWZpZWQuICBXZSByZXN0b3JlIHRoaXMgYmVoYXZpb3VyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IC0t
LQo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF94ODYuYyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX3g4Ni5jCj4gaW5kZXggYzBmODhhN2VhYS4uMjI2YjcxMmNiZCAxMDA2NDQKPiAtLS0gYS90
b29scy9saWJ4bC9saWJ4bF94ODYuYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3g4Ni5jCj4g
QEAgLTYzMSw2ICs2MzEsNDcgQEAgdm9pZCBsaWJ4bF9fYXJjaF9kb21haW5fYnVpbGRfaW5mb19z
ZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCj4gICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQo
JmJfaW5mby0+YWNwaSwgdHJ1ZSk7Cj4gIH0KPiAgCj4gK2ludCBsaWJ4bF9fYXJjaF9wYXNzdGhy
b3VnaF9tb2RlX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2Nv
bmZpZywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBsaWJ4bF9waHlzaW5mbyAqcGh5c2luZm8pCj4gK3sKClsuLi5dCgo+ICt9Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKClRoZXJlIGFyZSA0MCB0cmFpbGluZyB3
aGl0ZSBzcGFjZSBoZXJlLCBhbnkgcmVhc29uPyA6LSkuCgpCZXNpZGUgYSBmZXcgdHlwb3MsIHRo
ZSBwYXRjaCBsb29rcyBmaW5lIHRvIG1lOgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
