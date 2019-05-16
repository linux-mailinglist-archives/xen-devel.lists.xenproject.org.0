Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4223208AC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:55:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGo1-0001kg-4A; Thu, 16 May 2019 13:52:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRGnz-0001kS-1N
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:52:19 +0000
X-Inumbo-ID: d1b7f198-77e1-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1b7f198-77e1-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:52:18 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 8FmOuVxg0aTKwdBh3UjJkO0BaXpcxmjbg7v7IuGJZ92fFTNad2r3iwnxZSePegUr+1Ek8upJpC
 7Qv6+B8esdNjRhdIfyqrxempHmjLSq4KzHRe1jOC8T9RJC54BVcen6Hyt0MMzE+Zx9JB0ztsGU
 mRuP5Lj+kDPQLT9YRVtQ/O/P+iZ8xMnA3SCSSgiNaxcpJTILHI6/hUhEpHLWd0R3nSVaOMqizi
 OqONYY1wvt/VdUaZh6rlsqVAlp8TTJozx+0+fUs5sv4a1ygapKxaa/y4QzDdFJEzSXi0jyeOLD
 RJ0=
X-SBRS: 2.7
X-MesageID: 522325
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="522325"
Date: Thu, 16 May 2019 15:52:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516135208.h4njprgd477gfww2@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] x86/IRQ: ACKTYPE_NONE cannot make it
 into irq_guest_eoi_timer_fn()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDg6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gYWN0aW9uLT5hY2tfdHlwZSBpcyBzZXQgb25jZSBiZWZvcmUgdGhlIHRpbWVyIGV2ZW4g
Z2V0cyBpbml0aWFsaXplZCwgYW5kCj4gaXMgbmV2ZXIgY2hhbmdlZCBsYXRlci4gVGhlIHRpbWVy
IGdldHMgYWN0aXZhdGVkIG9ubHkgZm9yIEVPSSBhbmQgVU5NQVNLCj4gdHlwZXMuIEhlbmNlIHRo
ZXJlJ3Mgbm8gbmVlZCB0byBoYXZlIGEgcmVzcGVjdGl2ZSBpZigpIGluIHRoZXJlLiBSZXBsYWNl
Cj4gaXQgYnkgYW4gQVNTRVJUKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKSnVzdCBvbmUgY29tbWVudCBiZWxvdyB3aGljaCBJJ20gbm90IG92ZXJs
eSBmdXNzZWQgYWJvdXQuCgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0xMTAzLDcgKzExMDMsNyBAQCBzdGF0aWMgdm9pZCBzZXRf
ZW9pX3JlYWR5KHZvaWQgKmRhdGEpOwo+ICBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVy
X2ZuKHZvaWQgKmRhdGEpCj4gIHsKPiAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGRhdGE7
Cj4gLSAgICB1bnNpZ25lZCBpbnQgaXJxID0gZGVzYyAtIGlycV9kZXNjOwo+ICsgICAgdW5zaWdu
ZWQgaW50IGksIGlycSA9IGRlc2MgLSBpcnFfZGVzYzsKPiAgICAgIGlycV9ndWVzdF9hY3Rpb25f
dCAqYWN0aW9uOwo+ICAgICAgY3B1bWFza190IGNwdV9lb2lfbWFwOwo+ICAKPiBAQCAtMTExNCwx
OSArMTExNCwxOCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQKPiAg
Cj4gICAgICBhY3Rpb24gPSAoaXJxX2d1ZXN0X2FjdGlvbl90ICopZGVzYy0+YWN0aW9uOwo+ICAK
PiArICAgIEFTU0VSVChhY3Rpb24tPmFja190eXBlICE9IEFDS1RZUEVfTk9ORSk7Cj4gKwo+ICAg
ICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVv
aV90aW1lcikgKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAtICAgIGlmICggYWN0aW9uLT5h
Y2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBhY3Rpb24t
Pm5yX2d1ZXN0czsgaSsrICkKPiAgICAgIHsKPiAtICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiAt
ICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzOyBpKysgKQo+IC0gICAg
ICAgIHsKPiAtICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGFjdGlvbi0+Z3Vlc3RbaV07
CgpJIHRoaW5rIHlvdSBjb3VsZCBjb25zdGlmeSBkIGhlcmUuCgpUaGFua3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
