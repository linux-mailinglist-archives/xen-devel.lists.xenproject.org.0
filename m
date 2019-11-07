Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C2F33C0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:48:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjzg-0000pA-6E; Thu, 07 Nov 2019 15:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/O7A=Y7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iSjzf-0000p4-3C
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:46:43 +0000
X-Inumbo-ID: cb14cef8-0175-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb14cef8-0175-11ea-b678-bc764e2007e4;
 Thu, 07 Nov 2019 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573141603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8fIOgX0aIKp+LUkvubZwKGeIDjaH0t0CDN+9xtNfuiI=;
 b=aQT+aPi26DF4ywQlRmLjJhSTed6/gvMf9ggDB/cDw6r5+6N0jUVNhDaE
 GF2W2w4akF8Ns9kLLeDmbkjOqYbdotT+15wXlxF2ESHvotwhZbSl/cMaC
 ufTS8WpbHfLqzu4E50utgEgN6+sUr2DYwuNq9cd0bYUOnbeRE9/pe1Vta Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2Dp5lLevaP5LTpx+uqtg8Utcr5XWxDSA91kJCWNJrKh9DCRp63XN5ztqB2XAEBoDzvn3tz+Mqh
 ZghqOa4948hlP12YHjmJ3lr9g9oDL2NBUwFsQXly0LcZ+sdQgiXWOrMPjip+o+AfsFdsow30hJ
 CHeHxojcnI8wfqiJx5bRiKYiw/Glw3F545S3XSwuKOytRtyXI9WXlHyODTbgEcAURHeWQRbBPI
 zmlrN7OCHuabmB3qCpC4eUDptWrevKBpXkx/PkzGcxmaGgi7ZIRF/GgvPCMDuOnSEQuyNlWSA8
 A9c=
X-SBRS: 2.7
X-MesageID: 8004222
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8004222"
Date: Thu, 7 Nov 2019 16:46:32 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191107154632.GA17494@Air-de-Roger>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-3-roger.pau@citrix.com>
 <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw
 entry reads/writes in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDQ6Mjg6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMTEuMjAxOSAxNjowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gY2xl
YXJfSU9fQVBJQ19waW4gY2FuIGJlIGNhbGxlZCBhZnRlciB0aGUgaW9tbXUgaGFzIGJlZW4gZW5h
YmxlZCwgYW5kCj4gPiB1c2luZyByYXcgZW50cnkgcmVhZHMgYW5kIHdyaXRlcyB3aWxsIHJlc3Vs
dCBpbiBhIG1pc2NvbmZpZ3VyYXRpb24gb2YKPiA+IHRoZSBlbnRyaWVzIGFscmVhZHkgc2V0dXAg
dG8gdXNlIHRoZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlLgo+IAo+IEknbSBhZnJhaWQgSSBk
b24ndCB1bmRlcnN0YW5kIHRoaXM6IFJhdyByZWFkcyBhbmQgd3JpdGVzIGRvbid0IGV2ZW4KPiBn
byB0byB0aGUgSU9NTVUgaW50ZXJydXB0IHJlbWFwcGluZyBjb2RlLCBzbyBob3cgd291bGQgdGhl
IGFzc2VydGlvbgo+IGJlIHRyaWdnZXJlZD8KCkJlY2F1c2UgdGhlIGNvZGUgZG9lcyBzb21ldGhp
bmcgbGlrZToKCm1lbXNldCgmcnRlLCAwLCAuLi4pOwouLi4KX19pb2FwaWNfd3JpdGVfZW50cnko
YXBpYywgcGluLCB0cnVlLCBydGUpOwoKQXQgd2hpY2ggcG9pbnQgeW91IG1pc2NvbmZpZ3VyZSBh
biBpb2FwaWMgZW50cnkgdGhhdCB3YXMgYWxyZWFkeSBzZXR1cAp0byBwb2ludCB0byBhbiBpbnRl
cnJ1cHQgcmVtYXBwaW5nIGVudHJ5LCBhbmQgdGhlIEFNRCBJT01NVSBjb2RlCmNob2tlcyBpbiB0
aGUgYXNzZXJ0IGJlbG93LgoKPiAKPiA+IChYRU4pIFsgICAxMC4wODIxNTRdIEVOQUJMSU5HIElP
LUFQSUMgSVJRcwo+ID4gKFhFTikgWyAgIDEwLjA4Nzc4OV0gIC0+IFVzaW5nIG5ldyBBQ0sgbWV0
aG9kCj4gPiAoWEVOKSBbICAgMTAuMDkzNzM4XSBBc3NlcnRpb24gJ2dldF9ydGVfaW5kZXgocnRl
KSA9PSBvZmZzZXQnIGZhaWxlZCBhdCBpb21tdV9pbnRyLmM6MzI4Cj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+ICJSZXBv
cnRlZC1ieTogU2VyZ2V5IC4uLiIgYWhlYWQgb2YgdGhpcz8KCk9oIHllcy4KCj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4g
PiBAQCAtNTE0LDEzICs1MTQsMTMgQEAgc3RhdGljIHZvaWQgY2xlYXJfSU9fQVBJQ19waW4odW5z
aWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4pCj4gPiAgICAgICAgICBlbnRyeS5tYXNr
ID0gMTsKPiA+ICAgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgZmFsc2Us
IGVudHJ5KTsKPiA+ICAgICAgfQo+ID4gLSAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnko
YXBpYywgcGluLCB0cnVlKTsKPiA+ICsgICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFw
aWMsIHBpbiwgZmFsc2UpOwo+ID4gIAo+ID4gICAgICBpZiAoZW50cnkuaXJyKSB7Cj4gPiAgICAg
ICAgICAvKiBNYWtlIHN1cmUgdGhlIHRyaWdnZXIgbW9kZSBpcyBzZXQgdG8gbGV2ZWwuICovCj4g
PiAgICAgICAgICBpZiAoIWVudHJ5LnRyaWdnZXIpIHsKPiA+ICAgICAgICAgICAgICBlbnRyeS50
cmlnZ2VyID0gMTsKPiA+IC0gICAgICAgICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBw
aW4sIHRydWUsIGVudHJ5KTsKPiA+ICsgICAgICAgICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShh
cGljLCBwaW4sIGZhbHNlLCBlbnRyeSk7Cj4gPiAgICAgICAgICB9Cj4gCj4gQWxsIHdlIGRvIGhl
cmUgaXMgc2V0IHRoZSB0cmlnZ2VyIGJpdC4gTm8gdHJhbnNsYXRpb24gYmFjayBhbmQgZm9ydGgK
PiBvZiB0aGUgUlRFIHNob3VsZCBiZSBuZWVkZWQuCj4gCj4gPiBAQCAtNTMwLDkgKzUzMCw5IEBA
IHN0YXRpYyB2b2lkIGNsZWFyX0lPX0FQSUNfcGluKHVuc2lnbmVkIGludCBhcGljLCB1bnNpZ25l
ZCBpbnQgcGluKQo+ID4gICAgICAgKi8KPiA+ICAgICAgbWVtc2V0KCZlbnRyeSwgMCwgc2l6ZW9m
KGVudHJ5KSk7Cj4gPiAgICAgIGVudHJ5Lm1hc2sgPSAxOwo+ID4gLSAgICBfX2lvYXBpY193cml0
ZV9lbnRyeShhcGljLCBwaW4sIHRydWUsIGVudHJ5KTsKPiA+ICsgICAgX19pb2FwaWNfd3JpdGVf
ZW50cnkoYXBpYywgcGluLCBmYWxzZSwgZW50cnkpOwo+IAo+IEkgbWF5IGJlIGFibGUgdG8gdW5k
ZXJzdGFuZCB3aHkgdGhpcyBvbmUgY2FuJ3QgdXNlIHJhdyBtb2RlLCBidXQgYXMKPiBwZXIgYWJv
dmUgYSBiZXR0ZXIgb3ZlcmFsbCBkZXNjcmlwdGlvbiBpcyBuZWVkZWQuCgpZZXMsIHRoaXMgaXMg
dGhlIG9uZSB0aGF0J3MgYWN0dWFsbHkgaW5jb3JyZWN0LCBidXQgc2VlIG15IHJlYXNvbmluZwpi
ZWxvdy4KCj4gCj4gPiAtICAgIGVudHJ5ID0gX19pb2FwaWNfcmVhZF9lbnRyeShhcGljLCBwaW4s
IHRydWUpOwo+ID4gKyAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGluLCBm
YWxzZSk7Cj4gPiAgICAgIGlmIChlbnRyeS5pcnIpCj4gPiAgICAgICAgICBwcmludGsoS0VSTl9F
UlIgIklPLUFQSUMlMDJ4LSV1OiBVbmFibGUgdG8gcmVzZXQgSVJSXG4iLAo+ID4gICAgICAgICAg
ICAgICAgIElPX0FQSUNfSUQoYXBpYyksIHBpbik7Cj4gCj4gVGhpcyByZWFkIGFnYWluIHNob3Vs
ZG4ndCBuZWVkIGNvbnZlcnNpb24sIGFzIHRoZSBJUlIgYml0IGRvZXNuJ3QKPiBnZXQgdG91Y2hl
ZCAoSSB0aGluaykgYnkgdGhlIGludGVycnVwdCByZW1hcHBpbmcgY29kZSBkdXJpbmcgdGhlCj4g
dHJhbnNsYXRpb24gaXQgZG9lcy4KClRCSCwgSSB0aGluayByYXcgbW9kZSBzaG91bGQgb25seSBi
ZSB1c2VkIGJ5IHRoZSBpb21tdSBjb2RlIGluIG9yZGVyCnRvIHNldHVwIHRoZSBlbnRyaWVzIHRv
IHBvaW50IHRvIHRoZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlLApldmVyeXRoaW5nIGVsc2Ug
c2hvdWxkbid0IGJlIHVzaW5nIHJhdyBtb2RlLiBXaGlsZSBpdCdzIHRydWUgdGhhdCBzb21lCm9m
IHRoZSBjYXNlcyBoZXJlIGFyZSBzYWZlIHRvIHVzZSByYXcgbW9kZSBJIHdvdWxkIGRpc2NvdXJh
Z2UgaXQncwp1c2FnZSBhcyBpdCBjYW4gbGVhZCB0byBpc3N1ZXMsIGFuZCB0aGlzIGlzIG5vdCBh
IHBlcmZvcm1hbmNlIGNyaXRpY2FsCnBhdGggYW55d2F5LgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
