Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A762814E0E2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 19:37:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixEe4-0002z7-W7; Thu, 30 Jan 2020 18:34:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q1Hx=3T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ixEe3-0002z2-Dw
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 18:34:27 +0000
X-Inumbo-ID: 24311f22-438f-11ea-8af6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24311f22-438f-11ea-8af6-12813bfff9fa;
 Thu, 30 Jan 2020 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580409266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AYNLcbfnuvaYX8DKqs5gp1Y0nmkij+zcA4HoK7E7Mr8=;
 b=TQcQFvqcQrZRLEpZFxE5AWEBvIJPrOClXXXfqeNEDkBYRYI6+hpMKUiP
 A7JCnnqRRPfBevXDXlLoY15hQXA1WtVP3QozT9xvjxFupJT+1ILHs4c+6
 WsXH9t2twGcM1zisyNPfoz+Bb0P5L2Ps/FgFVTj5X+AM/PyxOUnG0EmXm g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ofKUVFLa/22WHOuToRPfadXFykKWemztQ7rQdXTEC5iGromd2L2vqq5lLR/V534Rf6SjPjuVHw
 I2jtU2rCju94dNlIhPT1kLkKofjY/f8ayMCaNDWN/C7FwZz2VYJJQKXs8v7H2A78lnAeXyx8qU
 bFbjqsZ52GrNp7vFQbsRL53cbE6rWu7vwV/FJAMrJ4fSkzFK/bFh0G+DjYcRxEanSTD1GrH099
 Y8lNj5U8ZdXipQrmrg+9wWnY9+d6MmafJx3PKV2Fy64UvJfoNU0Q13+pKWYS67MKWlsJvYx6xu
 /BU=
X-SBRS: 2.7
X-MesageID: 11713271
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11713271"
Date: Thu, 30 Jan 2020 18:34:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130183422.GR1288@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-6-anthony.perard@citrix.com>
 <7c16cfcc-0ec5-18f9-e05c-84415fed72c9@suse.com>
 <91397e9b-794d-e59b-cde0-ebfc92ed15f9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91397e9b-794d-e59b-cde0-ebfc92ed15f9@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 05/12] xen/include: remove include of
 Config.mk
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDQ6MzM6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMDEuMjAyMCAxNjoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAxNy4w
MS4yMDIwIDExOjUzLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+PiBJdCBpc24ndCBuZWNlc3Nh
cnkgdG8gaW5jbHVkZSBDb25maWcubWsgaGVyZSBiZWNhdXNlIHRoaXMgTWFrZWZpbGUgaXMKPiA+
PiBvbmx5IHVzZWQgYnkgeGVuL1J1bGVzLm1rIHdoaWNoIGFscmVhZHkgaW5jbHVkZXMgQ29uZmln
Lm1rLgo+ID4gCj4gPiBBbmQgc28gaXMgeGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2VmaWxlIGFmYWlj
cyBmcm9tIGl0cyBwYXJlbnQgZGlyCj4gPiBNYWtlZmlsZS4gV2l0aCB0aGlzIGFsc28gYWRqdXN0
ZWQgKG9yIGl0IGV4cGxhaW5lZCB3aHkgSSdtIHNlZWluZwo+ID4gdGhpbmdzIGluY29ycmVjdGx5
KSAuLi4KPiA+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IAo+IEFuZCBub3cgSSd2ZSBzZWVuIHRoYXQgcGF0Y2ggNiBkb2VzIGp1
c3QgdGhpcy4gSSB0aGluayBzdWNoCj4gY29tbW9uIHRoZW1lIGNoYW5nZXMgYXJlLCB1bmxlc3Mg
cGF0Y2hlcyBhcmUgb3Zlcmx5IGxhcmdlCj4gYWxyZWFkeSwgYmV0dGVyIHB1dCBhbGwgaW4gb24g
cGF0Y2guIEFueXdheSAtIHRoZSBSLWIgdGhlbgo+IGlzIHVuY29uZGl0aW9uYWwuCgpJIGRvbid0
IGxpa2Ugc3F1YXNoaW5nIHVucmVsYXRlZCBjaGFuZ2VzIHRvZ2V0aGVyLiBJIHRob3VnaCBib3Ro
IGNoYW5nZXMKZGVzZXJ2ZWQgdGhlcmUgb3duIGV4cGxhbmF0aW9uIGluIHRoaXMgY2FzZS4gVGhl
eSBkb24ndCB0b3VjaCB0aGUgc2FtZQpzdWJzeXN0ZW0sIHRoZXkgZG9uJ3QgaGF2ZSB0aGUgc2Ft
ZSBzZXQgb2YgbWFpbnRhaW5lcnMuCgo+IEFub3RoZXIgcXVlc3Rpb246IFRoZSBjb3ZlciBsZXR0
ZXIgZG9lc24ndCBzYXkgYW55dGhpbmcgYWJvdXQKPiBzb21lIChvciBtb3N0KSBwYXRjaGVzIGhl
cmUgYmVpbmcgaW5kZXBlbmRlbnQgb2Ygb25lIGFub3RoZXIsCj4gYW5kIGhlbmNlIHRoZSBvcHRp
b24gb2YgdGhlbSBnb2luZyBpbiBvdXQgb2Ygb3JkZXIuIFRoZSBvbmUKPiBoZXJlIGxvb2tzIHRv
IGJlIGVudGlyZWx5IHN0YW5kYWxvbmUsIGZvciBleGFtcGxlLgoKSXQgaXMgZXh0cmEgd29yayB0
byBmaWd1cmUgb3V0IHdoaWNoIHBhdGNoIGNvdWxkIGJlIGFwcGxpZWQgb3V0IG9mCm9yZGVyLiBJ
IHdvdWxkIGhhdmUgaW5kZXBlbmRlbnQgcGF0Y2ggYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2Vy
aWVzLApidXQgaWYgdGhlcmUgYXJlbid0LCBpdCBpcyBwcm9iYWJseSBiZWNhdXNlIEkgaGF2ZW4n
dCB0aG91Z2ggdGhleSB3ZXJlCmltcG9ydGFudCBlbm91Z2ggdG8gdGhpbmsgYWJvdXQgYXBwbHlp
bmcgdGhlbSBpbmRlcGVuZGVudGx5LiBJIG1pZ2h0IHRyeQp0byByZW9yZGVyIHNvbWUgcGF0Y2hl
cyBpbiBsYXRlciB2ZXJzaW9uIG9mIGEgc2VyaWVzIHRvIGhhdmUgdGhlbQphcHBsaWVkIGVhcmxp
ZXIuCgpBcyBmb3IgdGhpcyBzZXJpZXMsIEkgZG8gdGhpbmsgYXBwbHlpbmcgbW9zdCBwYXRjaGVz
IGluIG9yZGVyIGlzCmltcG9ydGFudCwgY2hhbmdpbmcgdGhlIG9yZGVyIG1heSBsZWFkIHRvIHVu
ZXhwZWN0ZWQgYnJlYWthZ2UuIFRoYXQKbWlnaHQgbm90IGJlIHRydWUsIGJ1dCBJIGRvbid0IHdh
bnQgdG8gc3BlbmQgdGltZSBvbiBjaGVja2luZyB0aGF0LgoKQ2hlZXJzLAoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
