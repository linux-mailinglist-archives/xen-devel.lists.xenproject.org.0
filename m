Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A964D9ABE1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 11:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i16B5-0001Cy-4j; Fri, 23 Aug 2019 09:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i16B3-0001Ct-IH
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 09:48:13 +0000
X-Inumbo-ID: 1dd9f536-c58b-11e9-ade4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dd9f536-c58b-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566553690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wULkaygH2pSOe7EbUd68/LfOUEU9lUNEiboeyVTMhsc=;
 b=TlTNUQ68eoE9cyTSe35otmGGyI5YPMgHmYTB2154j1JUrHZ8v+AZl3C/
 oUEfyzjwoanla1hy20iuZkcIFI7N69MSwsTJP2YR8memfUes8fc9a1pE/
 1ujqk+rxwFdz8kjdNdUQaRmV821beuj3JPzsvd07yflRlao+vVtS+7X98 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sYM71r+wfqcSc+A96iNsBHPvh9b7uW0wlBMktRVyGFWykECE9Hv2xIsBften7Gv0aLXGnSsqBQ
 GiwDUasFGQ9vklWVuD2IeLimtAT4oAlRM7smcY+kPny68TokKh6heR3lpkB1/gm+L8VG+PLzKu
 3qpF4RcISDcRl42om5RAvzBWuxXLj5XvAFw0SlDKnhD5cMo/L9CBMUBVtnSTB0YD/QxLgbVvBU
 NljegzV/UwT9twefcAuqo2cbZNI/j9ZnsyCX/gKwcGZ7071RI40TsVn+ld3BoQ7geX+7OjyLZV
 atg=
X-SBRS: 2.7
X-MesageID: 4846666
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4846666"
Date: Fri, 23 Aug 2019 11:47:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20190823094759.77movqy62jcsgxw4@Air-de-Roger>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDU6NTg6MjlBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNv
bV0KPiA+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMCwgMjAxOSAxMTozOCBQTQo+ID4gCj4gPiBU
aGUgbGV2ZWwgcGFzc2VkIHRvIGVwdF9pbnZhbGlkYXRlX2VtdCBjb3JyZXNwb25kcyB0byB0aGUg
RVBUIGVudHJ5Cj4gPiBwYXNzZWQgYXMgdGhlIG1mbiBwYXJhbWV0ZXIsIHdoaWNoIGlzIGEgcG9p
bnRlciB0byBhbiBFUFQgcGFnZSB0YWJsZSwKPiA+IGhlbmNlIHRoZSBlbnRyaWVzIGluIHRoYXQg
cGFnZSB0YWJsZSB3aWxsIGhhdmUgb25lIGxldmVsIGxlc3MgdGhhbiB0aGUKPiA+IHBhcmVudC4K
PiA+IAo+ID4gRml4IHRoZSBjYWxsIHRvIGF0b21pY193cml0ZV9lcHRfZW50cnkgdG8gcGFzcyB0
aGUgY29ycmVjdCBsZXZlbCwgaWU6Cj4gPiBvbmUgbGV2ZWwgbGVzcyB0aGFuIHRoZSBwYXJlbnQu
Cj4gPiAKPiA+IEZpeGVzOiA1MGZlNmU3MzcwNSAoJ3B2aCBkb20wOiBhZGQgYW5kIHJlbW92ZSBm
b3JlaWduIHBhZ2VzJykKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPgo+ID4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+
ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+
ID4gQ2M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiA+IENjOiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAgeGVuL2Fy
Y2gveDg2L21tL3AybS1lcHQuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCj4gPiBpbmRleCA2Yjg0Njhj
NzkzLi4yM2FlNmU5ZGEzIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQu
Ywo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+ID4gQEAgLTM2Nyw3ICszNjcs
NyBAQCBzdGF0aWMgYm9vbF90IGVwdF9pbnZhbGlkYXRlX2VtdChzdHJ1Y3QgcDJtX2RvbWFpbgo+
ID4gKnAybSwgbWZuX3QgbWZuLAo+ID4gICAgICAgICAgZS5lbXQgPSBNVFJSX05VTV9UWVBFUzsK
PiA+ICAgICAgICAgIGlmICggcmVjYWxjICkKPiA+ICAgICAgICAgICAgICBlLnJlY2FsYyA9IDE7
Cj4gPiAtICAgICAgICByYyA9IGF0b21pY193cml0ZV9lcHRfZW50cnkocDJtLCAmZXB0ZVtpXSwg
ZSwgbGV2ZWwpOwo+ID4gKyAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KHAybSwg
JmVwdGVbaV0sIGUsIGxldmVsIC0gMSk7Cj4gPiAgICAgICAgICBBU1NFUlQocmMgPT0gMCk7Cj4g
PiAgICAgICAgICBjaGFuZ2VkID0gMTsKPiA+ICAgICAgfQo+IAo+IFJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4uCj4gCj4gT25lIHNtYWxsIGNvbW1lbnQgYWJv
dXQgcmVhZGFiaWxpdHkuIFdoYXQgYWJvdXQgcmVuYW1pbmcgJ2xldmVsJwo+IHRvICdwYXJlbnRf
bGV2ZWwnIGluIHRoaXMgZnVuY3Rpb24/CgpTdXJlLCBJIGd1ZXNzIHRoaXMgY2FuIGJlIGRvbmUg
d2hpbGUgY29tbWl0dGluZyBpdCwgb3IgZWxzZSBJIGNhbiBzZW5kCmEgZm9sbG93IHVwLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
