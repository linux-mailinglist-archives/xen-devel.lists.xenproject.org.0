Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B4994CC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0myc-0001Bu-Tg; Thu, 22 Aug 2019 13:18:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKi2=WS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0myb-0001BY-J7
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 13:18:05 +0000
X-Inumbo-ID: 4619b3da-c4df-11e9-add7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4619b3da-c4df-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n1YD+OOFNmPvGD6PZfLyWOtHg05FIvLB0Iy7GPtxjcU=;
 b=fh6yJdTFsmb66NXHcZTpvJmPBiPlBa/e83kcgezyD3i3BTP81ujcs0bY
 a6jV5j6/BfB40cruYlm4zU3ic23p19EDHE3NdoQIgMrdDUXN7tTEsTQRn
 gsvzfmeSaC9gas9egUCiOvGUFAm9K9x+EPhgXsLPQqIpnNGUYTH0NgHT6 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GcIuFt9r5ZLRP2r6HYqKEGc2cHHVz/XraIynBlMaIJXnDzLH8s5VvwxFNqUSw6azEqiPDeVADf
 n5aowvHQfwAlFX+7LuPl6v96zu6YS8bvlFXrj/ueysl3nmtGmVA5Q2B/uIRXkGRX3Eck/fONWW
 ucHFW8HonKNF+TBlQVos18NtwZI4+Qy8Y9gwpGkHCiXi/5FU6sbM1exa6a5SU4YYjz60jdVh+v
 CQ1/rafLZEWCVx0Kzk1MdjF05aGaabDvZNJ0ej5roOZzExuVkOvZIqEGwMFTkyx18dae7d9Ekn
 MDY=
X-SBRS: 2.7
X-MesageID: 4836255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4836255"
Date: Thu, 22 Aug 2019 14:18:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822124427.GL1289@perard.uk.xensource.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
 <20190822102132.GJ1289@perard.uk.xensource.com>
 <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
 <20190822111730.GK1289@perard.uk.xensource.com>
 <40872481b00f4dbeb82ab540e99121a6@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40872481b00f4dbeb82ab540e99121a6@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTI6MjU6NDRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Cj4gPiBTZW50OiAyMiBBdWd1c3QgMjAxOSAxMjoxOAo+ID4gCj4gPiBPbiBUaHUsIEF1ZyAyMiwg
MjAxOSBhdCAxMTozNjozMkFNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IEJ1dCwg
bm93IEkgbG9vayBhdCB0aGUgY29kZSBhZ2FpbiB3aXRob3V0IHlvdXIgcGF0Y2ggYXBwbGllZCBJ
IGRvbid0IGFjdHVhbGx5IHNlZSB0aGUgcHJvYmxlbSBpdCBpcwo+ID4gdHJ5aW5nIHRvIGZpeC4g
VGhlIGZ1bmN0aW9ucyB4ZW5fZGV2aWNlX1tiYWNrfGZyb250XWVuZF9zZXRfc3RhdGUgcmV0dXJu
IGVhcmx5IGlmIHRoZSBzdGF0ZSBiZWluZyBzZXQKPiA+IG1hdGNoZXMgdGhlIGV4aXN0aW5nIHN0
YXRlIGFuZCBoZW5jZSBuZXZlciBnZXQgdG8gdGhlIGxpbmUgd2hlcmUgdGhlIHN0YXRlIGlzIHdy
aXR0ZW4gdG8geGVuc3RvcmUuCj4gPiAKPiA+IExldCdzIHNlZToKPiA+ICAgICAqIHN0ZXAgMSAo
aW5pdGlhbCBzdGF0ZXMgaW4geGVuc3RvcmUgYW5kIFFFTVUpCj4gPiAgICAgICAgIHhlbnN0b3Jl
L2Zyb250ZW5kL3N0YXRlID0gNAo+ID4gICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlID0g
NAo+ID4gICAgICogc3RlcCAyIChmcm9udGVuZCBjaGFuZ2VzIHN0YXRlIGluIHhlbnN0b3JlKQo+
ID4gICAgICAgICB4ZW5zdG9yZS9mcm9udGVuZC9zdGF0ZSA9IDUKPiA+ICAgICAqIHN0ZXAgMyAo
d2F0Y2ggZXZlbnQgcmVjZWl2ZWQgYnkgUUVNVSkKPiA+ICAgICAgICAgeGVuX2RldmljZV9mcm9u
dGVuZF9jaGFuZ2VkKCkKPiA+ICAgICAgICAgICAgIHN0YXRlID0gcmVhZCh4ZW5zdG9yZS9mcm9u
dGVuZC9zdGF0ZSkgKHN0YXRlPTUpCj4gPiAgICAgICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5k
X3NldF9zdGF0ZShzdGF0ZSkKPiA+ICAgICAgICAgICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0
YXRlICE9IHN0YXRlICAoNCE9NSkKPiA+ICAgICAgICAgICAgICAgICAgICAgeGVuZGV2LT5mcm9u
dGVuZF9zdGF0ZSA9IHN0YXRlCj4gPiAgICAgICAgICAgICAgICAgICAgIHhlbnN0b3JlL2Zyb250
ZW5kL3N0YXRlID0gc3RhdGUKPiA+ICAgICAqIHN0ZXAgNAo+ID4gICAgICAgICAjIHdhdGNoIGV2
ZW50IHRyaWdnZXJzIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpIGFnYWluIGJ1dAo+ID4g
ICAgICAgICAjIHRoaXMgdGltZSB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlID09IHhlbnN0b3JlL2Zy
b250ZW5kX3N0YXRlCj4gPiAKPiA+IFRoaXMgaXMgaG93IFFFTVUgd3JpdGVzIHRvIHhlbnN0b3Jl
IGFuIGlkZW50aWNhbCB2YWx1ZS4KPiA+IAo+ID4gVGhhdCBiZWhhdmlvciBtaWdodCBiZSBhbiBp
c3N1ZSBpZiB0aGUgZnJvbnRlbmQgY2hhbmdlcyB0aGUgdmFsdWUgYWZ0ZXIKPiA+IFFFTVUgaGF2
ZSByZWFkIGl0IGJ1dCBiZWZvcmUgUUVNVSB3cml0ZXMgaXQgYWdhaW4uCj4gCj4gQWgsIG9rLCBz
byB0aGUgcHJvYmxlbSBpcyBhY3R1YWxseSBsaW1pdGVkIHRvIGZyb250ZW5kIHN0YXRlIGJlY2F1
c2UgdGhhdCBpcyB3cml0dGVuIGJ5IGJvdGggZnJvbnRlbmQgYW5kIGJhY2tlbmQsIHNvIHdoZXRo
ZXIgUUVNVSB3cml0ZXMgYW4gdXBkYXRlZCBmcm9udGVuZCBzdGF0ZSB0byB4ZW5zdG9yZSBuZWVk
cyB0byBiZSBjb250cm9sbGVkLiBJdCdzIG9ubHkgY2FsbGVkIGluIHR3byBwbGFjZXMgeGVuX2Rl
dmljZV9mcm9udGVuZF9jaGFuZ2VkKCkgYW5kIHhlbl9kZXZpY2VfcmVhbGl6ZSgpLiBUaGUgd3Jp
dGUgdG8geGVuc3RvcmUgc2hvdWxkIGJlIGF2b2lkZWQgaW4gdGhlIGZvcm1lciBjYXNlLCBidXQg
bm90IHRoZSBsYXR0ZXIuIFNvIGFkZGluZyBhICdwdWJsaXNoJyBib29sZWFuIGFuZCB1c2luZyB0
aGF0IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSB3cml0ZSB0byB4ZW5zdG9yZSBpcyBkb25lIHNl
ZW1zIGxpa2UgdGhlIHJpZ2h0IGFwcHJvYWNoLiBCdXQgSSBkb24ndCB0aGluayBhbnkgY2hhbmdl
IGlzIG5lZWRlZCB0byB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X29ubGluZSgpIG9yIHhlbl9kZXZp
Y2VfYmFja2VuZF9zZXRfc3RhdGUoKSwgaXMgaXQ/CgpJIGd1ZXNzIGl0J3Mgbm90IHRoYXQgbXVj
aCBvZiBhIGlzc3VlIGZvciBiYWNrZW5kX3NldF8qKCksIHRoZSBkb3VibGUKd3JpdGUgd291bGQg
b25seSBoYXBwZW4gd2hlbiB0aGUgdG9vbHN0YWNrIHRyeSB0byB0ZWFyIGRvd24gdGhlIGJhY2tl
bmQsCnNvIGl0IHdvdWxkIGhhcHBlbiBvbmx5IG9uY2UuCgpBbHJpZ2h0LCBJJ2xsIG9ubHkgY2hh
bmdlIGZyb250ZW5kX3NldF9zdGF0ZSgpIGFuZCB1c2UgJ3B1Ymxpc2gnLgoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
