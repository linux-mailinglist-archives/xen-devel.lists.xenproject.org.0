Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249822085F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGaN-0007xr-99; Thu, 16 May 2019 13:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRGaL-0007xa-Tw
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:38:13 +0000
X-Inumbo-ID: d88814f2-77df-11e9-99c0-6bc4918cf36a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d88814f2-77df-11e9-99c0-6bc4918cf36a;
 Thu, 16 May 2019 13:38:11 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 7Rce/4sVYnFjyAtxIRdWeDXtmnv3zXhlnDHpf7NDUrEEiZY+DkIBaNbQGzOBNwRjk8Mb4EaUwc
 RQrQPKh2+Bb2sGQrZbMl2N4UnFXt6ornoxBxe1aYsC/JJB/f9exDfXW3ATww4u1eKTDxjiiUKT
 Kf0V6tnJqgia3h+M+hx8YM800JyN9OdHOpPjAXOKJLIRiNla9yJu7oqPU6MqIQ9aNKp+GpG2/Q
 pM8x9F1+8P6Nb2GVF2pkhWz6sXHkoAW9kFvfo2Dwx/CZNri+KsjBWrxeAAWHpx9vnCvccS1VQg
 Rc4=
X-SBRS: 2.7
X-MesageID: 504026
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="504026"
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
 <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
 <20190515125530.GB1245@perard.uk.xensource.com>
 <20190516132352.GF2798@zion.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e84450f5-f833-d30c-3233-8ae194e78376@citrix.com>
Date: Thu, 16 May 2019 14:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516132352.GF2798@zion.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNDoyMywgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIE1heSAxNSwgMjAx
OSBhdCAwMTo1NTozMFBNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4gT24gV2VkLCBN
YXkgMTUsIDIwMTkgYXQgMDE6MDc6MDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
IE9uIDE1LzA1LzIwMTkgMTI6NDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4+IFRoaXMgd2Fz
IHByb2JhYmx5IHVzZWZ1bCB0byBsb2FkIEVMRiBOb3RlLCBidXQgbm93IEVMRiBub3Rlcwo+Pj4+
ICJzaG91bGQgbGl2ZSBpbiBhIFBUX05PVEUgc2VnbWVudCIgKGVsZm5vdGUuaCkuCj4+Pj4KPj4+
PiBXaXRoIG5vdGVzIGxpdmluZyBpbiBzZWdtZW50LCB0aGVyZSBhcmUgbm8gbmVlZCBmb3Igc2Vj
dGlvbnMsIHNvIHRoZXJlCj4+Pj4gaXMgbm90aGluZyB0byBiZSBzdG9yZWQgaW4gdGhlIHNoc3Ry
dGFiLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCB3b3VsZCBhbGxvdyB0byB3cml0ZSBhIHNpbXBsZXIg
RUxGIGhlYWRlciBmb3IgYW4gT1ZNRiBibG9iCj4+Pj4gKHdoaWNoIGlzbid0IGFuIEVMRikgYW5k
IGFsbG93IGl0IHRvIGJlIGxvYWRlZCBhcyBhIFBWSCBrZXJuZWwuIFRoZQo+Pj4+IGhlYWRlciBv
bmx5IG5lZWRzIHRvIGRlY2xhcmUgdHdvIHByb2dyYW0gc2VnbWVudHM6Cj4+Pj4gLSBvbmUgdG8g
dGVsbCBhbiBFTEYgbG9hZGVyIHdoZXJlIHRvIHB1dCB0aGUgYmxvYiwKPj4+PiAtIG9uZSBmb3Ig
YSBYZW4gRUxGTk9URS4KPj4+Pgo+Pj4+IFRoZSBFTEZOT1RFIGlzIHRvIGNvbXBseSB0byB0aGUg
cHZoIGRlc2lnbiB3aGljaCB3YW50cyB0aGUKPj4+PiBYRU5fRUxGTk9URV9QSFlTMzJfRU5UUlkg
dG8gZGVjbGFyZSBhIGJsb2IgYXMgY29tcGFwdGlibGUgd2l0aCB0aGUgUFZICj4+Pj4gYm9vdCBB
QkkuCj4+Pj4KPj4+PiBOb3RlIHRoYXQgd2l0aG91dCB0aGUgRUxGTk9URSwgbGlieGMgd2lsbCBs
b2FkIGFuIEVMRiBidXQgd2l0aAo+Pj4+IHRoZSBwbGFpbiBFTEYgbG9hZGVyLCB3aGljaCBkb2Vz
bid0IGNoZWNrIGZvciBzaHN0cnRhYi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+Pj4+IC0tLQo+Pj4+ICB0b29scy9s
aWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMgfCA5IC0tLS0tLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19k
b21fZWxmbG9hZGVyLmMgYi90b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMKPj4+PiBpbmRl
eCA4MmI1ZjJlZTc5Li5iMzI3ZGIyMTlkIDEwMDY0NAo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hj
X2RvbV9lbGZsb2FkZXIuYwo+Pj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9lbGZsb2FkZXIu
Ywo+Pj4+IEBAIC0xNjUsMTUgKzE2NSw2IEBAIHN0YXRpYyBlbGZfbmVnZXJybm92YWwgeGNfZG9t
X3BhcnNlX2VsZl9rZXJuZWwoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+Pj4+ICAgICAgICAg
IHJldHVybiByYzsKPj4+PiAgICAgIH0KPj4+PiAgCj4+Pj4gLSAgICAvKiBGaW5kIHRoZSBzZWN0
aW9uLWhlYWRlciBzdHJpbmdzIHRhYmxlLiAqLwo+Pj4+IC0gICAgaWYgKCBFTEZfUFRSVkFMX0lO
VkFMSUQoZWxmLT5zZWNfc3RydGFiKSApCj4+Pj4gLSAgICB7Cj4+Pj4gLSAgICAgICAgeGNfZG9t
X3BhbmljKGRvbS0+eGNoLCBYQ19JTlZBTElEX0tFUk5FTCwgIiVzOiBFTEYgaW1hZ2UiCj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICIgaGFzIG5vIHNoc3RydGFiIiwgX19GVU5DVElPTl9fKTsK
Pj4+PiAtICAgICAgICByYyA9IC1FSU5WQUw7Cj4+Pj4gLSAgICAgICAgZ290byBvdXQ7Cj4+Pj4g
LSAgICB9Cj4+PiBUaGlzIG1pZ2h0IGJlIGZpbmUgZm9yIG5ld2VyIGJpbmFyaWVzLCBidXQgeW91
J2xsIGJyZWFrIG9sZGVyIG9uZXMuCj4+Pgo+Pj4gSW5zdGVhZCwgeW91IHNob3VsZCBza2lwIHNl
YXJjaGluZyBmb3Igc3RydGFiIGlmIHdlJ3ZlIGFscmVhZHkgbG9jYXRlZAo+Pj4gdGhlIFhlbiBu
b3Rlcy4KPj4gOi0oLCBtYXliZSBJIHNob3VsZCBoYXZlIGdvbmUgZnV0aGVyIG9uIGV4cGxhaW5p
bmcgd2h5IHRoaXMgY2hlY2sgaXMKPj4gdXNlbGVzcyAoYW5kIHByb2JhYmx5IGF0IHRoZSB3cm9u
ZyBwbGFjZSwgYXQgbGVhc3Qgbm93KS4KPj4KPj4gVGhlIG5leHQgdGhpbmcgdGhhdCdzIGRvbmUg
YWZ0ZXIgdGhhdCBjaGVjayBpczoKPj4gZWxmX3BhcnNlX2JpbmFyeSgpCj4+IGVsZl94ZW5fcGFy
c2UoKQo+PiBUaG9zZSBhcmUgbG9jYXRlZCBpbiAieGVuL2NvbW1vbi9saWJlbGYiLCBhbmQgdGhv
c2UgYXJlIHRoZSBmdW5jdGlvbnMKPj4gdGhhdCBhY3R1YWxseSB0YWtlcyBjYXJlIG9mIGV4dHJh
Y3RpbmcgZGF0YSBmcm9tIHRoZSBlbGYuCj4+Cj4+IGVsZl94ZW5fcGFyc2UoKSBmaXJzdCBsb29r
IGZvciBYZW4gRUxGTk9URSBpbiB0aGUgcHJvZ3JhbSBzZWdtZW50cwo+PiAocGhkciwgUFRfTk9U
RSkgYW5kIHNraXAgcmVhZGluZyBzZWN0aW9uIGFuZCBzdHJ0YWIgaWYgZm91bmQuCj4+Cj4+IFNv
LCBsaWJlbGYgYWxyZWFkeSBkb2VzIHdoYXQgeW91IGFza2VkIGZvciA7LSkuCj4+Cj4+IFRoZSBz
aHN0cnRhYiBhcmUgb25seSB1c2VkIHRvIGxvb2sgZm9yIGxlZ2FjeSBfX3hlbl9ndWVzdCBzZWN0
aW9uIG5hbWVzLgo+PiBTaW5jZSBFTEZOT1RFcyB3YXMgdXNlZCwgdGhlIG5hbWUgb2Ygc2VjdGlv
biBhcmVuJ3QgbG9va2VkIGF0Lgo+Pgo+PiBJIGhvcGUgdGhhdCBoZWxwLgo+Pgo+IEFuZHJldywg
ZG8geW91IHN0aWxsIGhhdmUgY29uY2Vybj8KCklmIGxpYmVsZiBnb2VzIG9uIHRvIERUUlQgdGhl
biBmaW5lLCBidXQgdGhpcyBmdWxsIGV4cGxhbmF0aW9uIG5lZWRzIHRvCmJlIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
