Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D362CC15A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQyA-0004vT-Vi; Fri, 04 Oct 2019 17:02:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T2rb=X5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iGQy8-0004vO-Vy
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:02:17 +0000
X-Inumbo-ID: b774868a-e6c8-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b774868a-e6c8-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570208536;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0pZ5Y8Df9OTLagHKtEtrC9CF4yM1MkSQZIKoIrIf+Ss=;
 b=VINdUBoQWQG3Y8j7+RZecTX+vSC9Ofr4dfYvP7bW0iF1fFLGip9EvBbC
 8H5i9ndMVLda7oAys28kztSRsocaPSJT3MQVtGM/FXu3Y1OM1tZ+Gnwo5
 GBMiD4ORH4JTmUZlL4w0pfgmZNnDkntdTmcnnc09D2mnz8WTT90XNaH1Z k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jydw1SeDe7skxroLgsy9C4/RBLXYes0Kbygg6uU+1ItAsREevka+yXXAjTsCOj1eTjHhrPi6Ia
 9d5/jTIsqeky+H3ig8hYNTczF59Hugvhyn+S1nG2gwG7xOscNrPU2yJwDUgYaBZbjzWheXWt+q
 /Pph+LbaHAGnGurBdpaXJ9kgUAz/zhthVrX5Aq1JZ5amT665CPd/4B6rS5PjbZhh95DsC/VvL4
 fnZ7sygDrazrnscJAiNWM8gWYpFLn5bF3Xq+y6GSu/iB1YGYv3VKFZ/NQ5roQgcD92YYcxMmlY
 Ykk=
X-SBRS: 2.7
X-MesageID: 6485686
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6485686"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
 <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
 <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
 <d2d26eef-521a-02b6-68b1-5477530c8901@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b4258bee-ba9d-80af-93f7-db01db3f2d57@citrix.com>
Date: Fri, 4 Oct 2019 18:02:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2d26eef-521a-02b6-68b1-5477530c8901@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMi8xOSA5OjExIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMS4xMC4yMDE5IDIy
OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMS8xMC8yMDE5IDA5OjM4LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IE9uIDMwLjA5LjIwMTkgMjE6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+Pj4gQ2xhbmcgaW4gcGFydGljdWxhciBoYXMgYSBoYWJpdCBvZiBvdXQtb2YtbGluaW5nIHRo
ZXNlIGFuZCBjcmVhdGluZyBtdWx0aXBsZQo+Pj4+IGxvY2FsIGNvcGllcyBvZiBfbWZuKCkgYW5k
IG1mbl94KCksIGV0Yy4gIE92ZXJyaWRlIHRoaXMgYmVoYXZpb3VyLgo+Pj4gSXMgc3BlY2lhbCBj
YXNpbmcgdGhlIHR5cGVzYWZlIGhlbHBlcnMgdGhlbiB0aGUgcmlnaHQgYXBwcm9hY2g/IFRoZQo+
Pj4gZnVuZGFtZW50YWwgaWRlYSBhZnRlciBhbGwgaXMgdG8gbGV0IHRoZSBjb21waWxlciBkZWNp
ZGUuIEkgY2VydGFpbmx5Cj4+PiBhZ3JlZSB0aGF0IG5vdCBpbmxpbmluZyBzdWNoIHRyaXZpYWwg
ZnVuY3Rpb25zIGRlc3BpdGUgdGhlIGlubGluZQo+Pj4ga2V5d29yZCBsb29rcyBmYXIgZnJvbSBv
cHRpbWFsLCBidXQgaWYgdGhlcmUncyBzdWNoIGEgZ2VuZXJhbCBpc3N1ZQo+Pj4gd2l0aCBjbGFu
Zywgc2hvdWxkbid0IHdlIG1ha2UgImlubGluZSIgZXhwYW5kIHRvICJhbHdheXNfaW5saW5lIgo+
Pj4gdW5pZm9ybWx5Pwo+Pgo+PiBJbmxpbmUgaGFuZGluZyBpcyBhIG1lc3MuCj4+Cj4+IFdlIGN1
cnJlbnRseSBkZWZpbmUgaW5saW5lIHRvIF9faW5saW5lX18uwqAgVW5kb2luZyB0aGlzIHJlc3Vs
dHMgaW4gYnVpbGQKPj4gZmFpbHVyZXMuCj4+Cj4+IExpbnV4IGN1cnJlbnRseSBkZWZpbmVzIGlu
bGluZSB0byBhbHdheXNfaW5saW5lIGFuZCB0aGV5IGFyZSBkZXNwZXJhdGVseQo+PiB0cnlpbmcg
dG8gdW5kbyB0aGlzIChtaXMpYmVoYXZpb3VyLgo+Pgo+PiBUaGVyZSBhcmUgYSBmZXcgdXNlcyBv
ZiBhbHdheXNfaW5saW5lIGZvciBzYWZldHkgcHVycG9zZXMgKHRoZQo+PiBzcGVjdWxhdGl2ZSBo
ZWxwZXJzKS7CoCBNb3N0IHVzZXMgb2YgYWx3YXlzX2lubGluZSBsb29rIHRvIGJlIHdvcmthcm91
bmRzCj4+IGZvciB0aGUgc2l6ZS1vZi1hc20gYnVnLyhtaXMpZmVhdHVyZS4KPj4KPj4gSW4gYW4g
aWRlYWwgd29ybGQsIHdlIHdvdWxkbid0IG5lZWQgaXQgYXQgYWxsLCBidXQgSSBkZWZpbml0ZWx5
IGRvbid0Cj4+IHRoaW5rIHRoYXQgdGFraW5nIHRoZSBMaW51eCBhcHByb2FjaCBpcyBhIGNsZXZl
ciBtb3ZlLsKgIFdlIGRlZmluaXRlbHkKPj4gaGF2ZSBzb21lIHN0YXRpYyBpbmxpbmVzIHdoaWNo
IHdvdWxkIGJldHRlciBub3QgYmVpbmcgaW5saW5lLgo+IAo+IElPVyB5b3VyIHN1Z2dlc3RlZCBh
cHByb2FjaCAoYXQgbGVhc3QgZm9yIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUpIGlzIHRvCj4gZG8g
d2hhdCB5b3UgZG8gaGVyZSBhbmQgY29udmVydCBpbmxpbmUgdG8gYWx3YXlzX2lubGluZSBhcyB3
ZSBzZWUgZml0Pwo+IElmIHNvLCB3ZSBzaG91bGQgYXQgbGVhc3Qgc2V0dGxlIG9uIHNvbWUgc3Vm
ZmljaWVudGx5IGZpcm0gY3JpdGVyaWEgYnkKPiB3aGljaCBzdWNoIGEgY29udmVyc2lvbiB3b3Vs
ZCBiZSBqdXN0aWZpYWJsZS4KPiAKPiBTZWVpbmcgdGhhdCB0aGlzIGlzIHByaW1hcmlseSB0byBo
ZWxwIGNsYW5nIC0gZGlkIHlvdSBjb25zaWRlcgo+IGludHJvZHVjaW5nIHNvbWV0aGluZyBsaWtl
IGNsYW5nX2lubGluZSwgZXhwYW5kaW5nIHRvIGp1c3QgaW5saW5lIGZvcgo+IGdjYywgYnV0IGFs
d2F5c19pbmxpbmUgZm9yIGNsYW5nPyBUaGlzIHdvdWxkIGF0IGxlYXN0IHByb3ZpZGUgYQo+IHN1
ZmZpY2llbnRseSBlYXN5IHdheSB0byB1bmRvIHRoaXMgaWYgYSBiZXR0ZXIgY2xhbmctc2lkZSBh
cHByb2FjaCBjYW4KPiBiZSBmb3VuZCBkb3duIHRoZSByb2FkLgoKV2hhdCB3b3VsZCBiZSB0aGUg
cG9pbnQgb2YgdGhpcz8gIFRoZSBvbmx5IHJlYXNvbiBhbHdheXNfaW5saW5lIGlzbid0Cm5lY2Vz
c2FyeSBmb3IgZ2NjIChpZiBJJ20gZm9sbG93aW5nIHRoZSBhcmd1bWVudCkgaXMgYmVjYXVzZSBp
dCBzbyBmYXIKaGFzIGFsd2F5cyBpbmxpbmVkIHRoZXNlIGZ1bmN0aW9ucy4gIElmIGl0IHN0b3Bw
ZWQgaW5saW5pbmcgdGhlbSwgd2UnZApuZWVkIHRvIGNoYW5nZSBpdCB0byBhbHdheXNfaW5saW5l
IGFueXdheTsgc28gd2h5IG5vdCBqdXN0IHNheSBzbyB0bwpiZWdpbiB3aXRoPwoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
