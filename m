Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC68494F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJ0j-0003VZ-Ea; Wed, 07 Aug 2019 10:17:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvJ0h-0003VT-T2
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:17:35 +0000
X-Inumbo-ID: 91ec38a8-b8fc-11e9-a82a-8760b14da972
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91ec38a8-b8fc-11e9-a82a-8760b14da972;
 Wed, 07 Aug 2019 10:17:33 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q7cYP5QOmJ7b6GQJaw90k8ekWd1c678HWwr3NlG6Zp/M18FKhKqQ7uLi8xW4OuxTpRGPmbWaGm
 VXRg+X0krkiebB1/ICdFhgPngCUAMhdX9DjV8+9sn8i8x2dWMMPPRduVKKQCP7lEenRCipvx6/
 P2ZWWvNrIaUkN3sK05w3ljDKPedxlnpZ/wszT4Atz3dq/a4uSe8bpNPlEnzbgr8PuyI8weythp
 6DfRMwN9/Jtm4wtN2dTOEZB/flyDuzjyD8PHC7LKIjMkrJzEHl9ye591TfL2Sry4RYPL0Lfakm
 ZQU=
X-SBRS: 2.7
X-MesageID: 4144062
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4144062"
Date: Wed, 7 Aug 2019 12:17:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190807101720.cgzaqv23yhexwzov@Air-de-Roger>
References: <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
 <8a68c4c0-4f50-4e04-786c-7426fdc10db9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a68c4c0-4f50-4e04-786c-7426fdc10db9@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6MzE6NDBBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDguMjAxOSAwOTozNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMjo0ODo1MVBNIC0wNzAwLCBSb21hbiBTaGFwb3Nobmlr
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0IDk6MTggQU0gUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IE9uIEZy
aSwgQXVnIDAyLCAyMDE5IGF0IDEwOjA1OjQwQU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAxMToyNTowNEFNIC0wNzAwLCBS
b21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGNvbXBsZXRlbHkg
Zml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lIQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhhbmtz
IFJvZ2VyISBJJ2QgbG92ZSB0byBzZWUgdGhpcyBpbiBYZW4gNC4xMwo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBUaGFua3MgZm9yIHRlc3RpbmchCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEl0J3Mgc3RpbGwg
bm90IGNsZWFyIHRvIG1lIHdoeSB0aGUgcHJldmlvdXMgYXBwcm9hY2ggZGlkbid0IHdvcmssIGJ1
dAo+ID4gPiA+ID4gSSB0aGluayB0aGlzIHBhdGNoIGlzIGJldHRlciBiZWNhdXNlIGl0IHJlbW92
ZXMgdGhlIHVzYWdlIG9mCj4gPiA+ID4gPiB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkg
ZnJvbSBQViBkb21haW5zLiBJIHdpbGwgc3VibWl0IHRoaXMKPiA+ID4gPiA+IGZvcm1hbGx5IG5v
dy4KPiA+ID4gPiAKPiA+ID4gPiBTb3JyeSB0byBib3RoZXIgYWdhaW4sIGJ1dCBzaW5jZSB3ZSBz
dGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGUKPiA+ID4gPiBwcmV2aW91cyBmaXggZGlkbid0
IHdvcmsgZm9yIHlvdSwgYW5kIEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBteQo+ID4gPiA+
IGhhcmR3YXJlLCBjb3VsZCB5b3UgZ2l2ZSB0aGUgYXR0YWNoZWQgcGF0Y2ggYSB0cnk/Cj4gPiA+
IAo+ID4gPiBObyB3b3JyaWVzIC0tIGFuZCB0aGFua3MgZm9yIGhlbHBpbmcgdG8gZ2V0IGl0IG92
ZXIgdGhlIGZpbmlzaCBsaW5lIC0tCj4gPiA+IHRoaXMgaXMgbXVjaCBhcHByZWNpYXRlZCEKPiA+
ID4gCj4gPiA+IEknbSBoYXBweSB0byBzYXkgdGhhdCB0aGlzIGxhdGVzdCBwYXRjaCBpcyBhbHNv
IHdvcmtpbmcganVzdCBmaW5lLiBTbwo+ID4gPiBJIGd1ZXNzIHRoaXMgaXMgdGhlIG9uZSB0aGF0
J3MgZ29pbmcgdG8gbGFuZCBpbiBYZW4gNC4xMz8KPiA+IAo+ID4gTm8sIG5vdCByZWFsbHksIHNv
cnJ5IHRoaXMgd2FzIHN0aWxsIGEgZGVidWcgcGF0Y2guCj4gPiAKPiA+IFNvIEkgdGhpbmsgdGhl
IGJlaGF2aW91ciB5b3UgYXJlIHNlZWluZyBjYW4gb25seSBiZSBleHBsYWluZWQgaWYgdGhlCj4g
PiBJT01NVSBpcyBhbHJlYWR5IGVuYWJsZWQgYnkgdGhlIGZpcm13YXJlIHdoZW4gYm9vdGluZyBp
bnRvIFhlbiwgY2FuCj4gPiB0aGlzIGJlIHRoZSBjYXNlPwo+IAo+IEV2ZW4gdGhlbiAtIHdoeSB3
b3VsZCB0aGUgZXhpc3RpbmcgZmx1c2ggbm90IHN1ZmZpY2UgaW4gdGhpcyBjYXNlPwoKSXQgc2hv
dWxkIGluZGVlZCwgSSdtIGp1c3QgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCdzIGRpZmZlcmVu
dCBpbgpoaXMgc2V0dXAuCgpBbHNvIEknbSBub3Qgc3VyZSB0aGUgaW9tbXUgaW5pdCBjb2RlIHdh
cyBkZXNpZ25lZCB0YWtpbmcgaW50byBhY2NvdW50CnRoYXQgdGhlIGlvbW11IERNQSB0cmFuc2xh
dGlvbiBtaWdodCBhbHJlYWR5IGJlIGVuYWJsZWQgYnkgdGhlCmZpcm13YXJlLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
