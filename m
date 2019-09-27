Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5EC0105
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:22:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlRQ-0007hK-QP; Fri, 27 Sep 2019 08:17:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R7hV=XW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDlRQ-0007hF-1H
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:17:28 +0000
X-Inumbo-ID: 3d7d41e2-e0ff-11e9-9670-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 3d7d41e2-e0ff-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569572247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VK0Z2BRtpw/TH0Y8HDEviPokbcjeFHRzRJGkHwL6/+4=;
 b=LITgqJbasbybWbM9jTXN2uWgWYVxfsdkl9XV2kIufg7qpi5xcpEH0X9p
 jkDB07lR43DU58dwZLNR75TxTEwHwVxDG5yZDRSvZ6iCeNBSBDO+ib/tw
 kX+wp6oFqbWHna0lhIDN9Tr2GfjTi8uObnFeLA6oAqQeFGVUe7LOkMiIY Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tLF0ZabUualXnqT3lHRru+IZSR+8MH9nt+2H/zrCu5jjjFdlePV2+AuPRApgn5BX9FYnnRVekk
 80ArTIs0D1OJyR84Pe7pikPfIbnhvBGYai5wI2zbcQHy35HP3VvUCwV1Ogi1Nq2XdJo7xS2Mum
 ySXNvIozvFF0xRolVQeE8iahdXNYP8kWPQRVfKWIchcTaO8hxS05hbiK4CQMRzT79ykwfo+urc
 0NyY4IdKV/BxtS0dLAXRiBtW3h0wWokZTyEHybQrGdW09qm5oG3bkuZfdyC8yFau2irC+rSvFI
 sbo=
X-SBRS: 2.7
X-MesageID: 6163877
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6163877"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2 06/11] ioreq: allow dispatching ioreqs to internal
 servers
Thread-Index: AQHVYnK3hVd65FGo0kCx8kLiNiHgV6c0aIKAgAloFACAACJrgIAACDwAgAAYNoCAAAy/AIABMP1Q
Date: Fri, 27 Sep 2019 08:17:22 +0000
Message-ID: <c546916440f9491c81abf026944011de@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
 <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
 <20190926134644.tcp7pyalzk42hesg@Air-de-Roger>
 <765f32ca-e5f2-fddd-9570-d043596d8948@suse.com>
 <20190926155900.zdenod5qqhjrksff@Air-de-Roger>
In-Reply-To: <20190926155900.zdenod5qqhjrksff@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjYgU2VwdGVtYmVyIDIwMTkgMTY6NTkKPiBUbzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA2LzExXSBpb3JlcTogYWxsb3cgZGlzcGF0
Y2hpbmcgaW9yZXFzIHRvIGludGVybmFsIHNlcnZlcnMKPiAKPiBPbiBUaHUsIFNlcCAyNiwgMjAx
OSBhdCAwNToxMzoyM1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDI2LjA5LjIw
MTkgMTU6NDYsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiBPbiBUaHUsIFNlcCAyNiwg
MjAxOSBhdCAwMzoxNzoxNVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+IE9uIDI2
LjA5LjIwMTkgMTM6MTQsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPj4+IE9uIEZyaSwg
U2VwIDIwLCAyMDE5IGF0IDAxOjM1OjEzUE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
Pj4+PiBIYXZpbmcgc2FpZCB0aGlzLCBhcyBhIHJlc3VsdCBvZiBoYXZpbmcgbG9va2VkIGF0IHNv
bWUgb2YgdGhlCj4gPiA+Pj4+IGludm9sdmVkIGNvZGUsIGFuZCB3aXRoIHRoZSBjb3ZlciBsZXR0
ZXIgbm90IGNsYXJpZnlpbmcgdGhpcywKPiA+ID4+Pj4gd2hhdCdzIHRoZSByZWFzb24gZm9yIGdv
aW5nIHRoaXMgc2VlbWluZ2x5IG1vcmUgY29tcGxpY2F0ZWQKPiA+ID4+Pj4gcm91dGUsIHJhdGhl
ciB0aGFuIHB1dHRpbmcgdlBDSSBiZWhpbmQgdGhlIGh2bV9pb19pbnRlcmNlcHQoKQo+ID4gPj4+
PiBtYWNoaW5lcnksIGp1c3QgbGlrZSBpcyB0aGUgY2FzZSBmb3Igb3RoZXIgaW50ZXJuYWwgaGFu
ZGxpbmc/Cj4gPiA+Pj4KPiA+ID4+PiBJZiB2UENJIGlzIGhhbmRsZWQgYXQgdGhlIGh2bV9pb19p
bnRlcmNlcHQgbGV2ZWwgKGxpa2UgaXRzIGRvbmUgQVRNKQo+ID4gPj4+IHRoZW4gaXQncyBub3Qg
cG9zc2libGUgdG8gaGF2ZSBib3RoIChleHRlcm5hbCkgaW9yZXEgc2VydmVycyBhbmQgdlBDSQo+
ID4gPj4+IGhhbmRsaW5nIGFjY2Vzc2VzIHRvIGRpZmZlcmVudCBkZXZpY2VzIGluIHRoZSBQQ0kg
Y29uZmlnIHNwYWNlLCBzaW5jZQo+ID4gPj4+IHZQQ0kgd291bGQgdHJhcCBhbGwgYWNjZXNzZXMg
dG8gdGhlIFBDSSBJTyBwb3J0cyBhbmQgdGhlIE1DRkcgcmVnaW9ucwo+ID4gPj4+IGFuZCB0aG9z
ZSB3b3VsZCBuZXZlciByZWFjaCB0aGUgaW9yZXEgcHJvY2Vzc2luZy4KPiA+ID4+Cj4gPiA+PiBX
aHkgd291bGQgdlBDSSAod2FudCB0bykgZG8gdGhhdD8gVGhlIGFjY2VwdCgpIGhhbmRsZXIgc2hv
dWxkCj4gPiA+PiBzdWItY2xhc3MgdGhlIENGOC1DRkYgcG9ydCByYW5nZTsgdGhlcmUgd291bGQg
bGlrZWx5IHdhbnQgdG8KPiA+ID4+IGJlIGFub3RoZXIgc3RydWN0IGh2bV9pb19vcHMgaW5zdGFu
Y2UgZGVhbGluZyB3aXRoIGNvbmZpZwo+ID4gPj4gc3BhY2UgYWNjZXNzZXMgKGFuZCBwZXJoYXBz
IHdpdGggb25lcyB0aHJvdWdoIHBvcnQgSS9PIGFuZAo+ID4gPj4gdGhyb3VnaCBNQ0ZHIGF0IHRo
ZSBzYW1lIHRpbWUpLgo+ID4gPgo+ID4gPiBEbyB5b3UgbWVhbiB0byBleHBhbmQgaHZtX2lvX2hh
bmRsZXIgdG8gYWRkIHNvbWV0aGluZyBsaWtlIGEgcGNpY29uZgo+ID4gPiBzdWItc3RydWN0dXJl
IHRvIHRoZSBleGlzdGluZyB1bmlvbiBvZiBwb3J0aW8gYW5kIG1taW8/Cj4gPgo+ID4gWWVzLCBz
b21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMuCj4gPgo+ID4gPiBUaGF0J3MgaW5kZWVkIGZlYXNp
YmxlLCBidXQgSSdtIG5vdCBzdXJlIHdoeSBpdCdzIGJldHRlciB0aGF0IHRoZQo+ID4gPiBhcHBy
b2FjaCBwcm9wb3NlZCBvbiB0aGlzIHNlcmllcy4gTG9uZyB0ZXJtIEkgdGhpbmsgd2Ugd291bGQg
bGlrZSBhbGwKPiA+ID4gaW50ZXJjZXB0IGhhbmRsZXJzIHRvIHVzZSB0aGUgaW9yZXEgaW5mcmFz
dHJ1Y3R1cmUgYW5kIHJlbW92ZSB0aGUKPiA+ID4gdXNhZ2Ugb2YgaHZtX2lvX2ludGVyY2VwdC4K
PiA+ID4KPiA+ID4+IEluIHRoZSBlbmQgdGhpcyB3b3VsZCBsaWtlbHkKPiA+ID4+IG1vcmUgc2lt
aWxhciB0byBob3cgY2hpcHNldHMgaGFuZGxlIHRoaXMgb24gcmVhbCBoYXJkd2FyZQo+ID4gPj4g
dGhhbiB5b3VyICJpbnRlcm5hbCBzZXJ2ZXIiIHNvbHV0aW9uIChhbGJlaXQgSSBhZ3JlZSB0byBh
Cj4gPiA+PiBkZWdyZWUgaXQncyBpbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgYW55d2F5KS4KPiA+
ID4KPiA+ID4gSSB0aGluayB0aGUgZW5kIGdvYWwgc2hvdWxkIGJlIHRvIHVuaWZ5IHRoZSBpbnRl
cm5hbCBhbmQgZXh0ZXJuYWwKPiA+ID4gaW50ZXJjZXB0cyBpbnRvIGEgc2luZ2xlIHBvaW50LCBh
bmQgdGhlIG9ubHkgZmVhc2libGUgd2F5IHRvIGRvIHRoaXMKPiA+ID4gaXMgdG8gc3dpdGNoIHRo
ZSBpbnRlcm5hbCBpbnRlcmNlcHRzIHRvIHVzZSB0aGUgaW9yZXEgaW5mcmFzdHJ1Y3R1cmUuCj4g
Pgo+ID4gV2VsbCwgSSByZWNhbGwgdGhpcyBoYXZpbmcgYmVlbiBtZW50aW9uZWQgYXMgYW4gb3B0
aW9uOyBJIGRvbid0Cj4gPiByZWNhbGwgdGhpcyBiZWluZyBhIGZpcm0gcGxhbi4gVGhlcmUgYXJl
IGNlcnRhaW5seSBiZW5lZml0cyB0bwo+ID4gc3VjaCBhIG1vZGVsLCBidXQgdGhlcmUncyBhbHNv
IHBvdGVudGlhbGx5IG1vcmUgb3ZlcmhlYWQgKGF0IHRoZQo+ID4gdmVyeSBsZWFzdCB0aGUgaW9y
ZXFfdCB3aWxsIHRoZW4gbmVlZCBzZXR0aW5nIHVwIC8gbWFpbnRhaW5pbmcKPiA+IGV2ZXJ5d2hl
cmUsIHdoZW4gcmlnaHQgbm93IHRoZSBpbnRlcmZhY2VzIGFyZSB1c2luZyBtb3JlCj4gPiBpbW1l
ZGlhdGUgcGFyYW1ldGVycykuCj4gCj4gQUZBSUNUIGZyb20gY29kZSBpbiBodm1lbXVsX2RvX2lv
IHdoaWNoIGRpc3BhdGNoZXMgdG8gYm90aAo+IGh2bV9pb19pbnRlcmNlcHQgYW5kIGlvcmVxIHNl
cnZlcnMgdGhlIGlvcmVxIGlzIGFscmVhZHkgdGhlcmUsIHNvIEknbQo+IG5vdCBzdXJlIHdoeSBt
b3JlIHNldHVwIHdvdWxkIGJlIHJlcXVpcmVkIGluIG9yZGVyIHRvIGhhbmRsZSBpbnRlcm5hbAo+
IGludGVyY2VwdHMgYXMgaW9yZXEgc2VydmVycy4gRm9yIHZQQ0kgYXQgbGVhc3QgSSd2ZSBiZWVu
IGFibGUgdG8gZ2V0Cj4gYXdheSB3aXRob3V0IGhhdmluZyB0byBtb2RpZnkgaHZtZW11bF9kb19p
byBJSVJDLgo+IAo+ID4gQnV0IHllcywgaWYgdGhpcyBfaXNfIHRoZSBwbGFuLCB0aGVuIGdvaW5n
IHRoYXQgcm91dGUgcmlnaHQgYXdheQo+ID4gZm9yIHZQQ0kgaXMgZGVzaXJhYmxlLgo+IAo+IEkg
dGhpbmsgaXQgd291bGQgYmUgZGVzaXJhYmxlIHRvIGhhdmUgYSBzaW5nbGUgcG9pbnQgd2hlcmUg
aW50ZXJjZXB0cwo+IGFyZSBoYW5kbGVkIGluc3RlYWQgb2YgaGF2aW5nIHN1Y2ggZGlmZmVyZW50
IGltcGxlbWVudGF0aW9ucyBmb3IKPiBpbnRlcm5hbCB2cyBleHRlcm5hbCwgYW5kIHRoZSBvbmx5
IHdheSBJIGNhbiBkZXZpc2UgdG8gYWNoaWV2ZSB0aGlzIGlzCj4gYnkgbW92aW5nIGludGVyY2Vw
dHMgdG8gdGhlIGlvcmVxIG1vZGVsLgo+IAoKKzEgZm9yIHRoZSBwbGFuIGZyb20gbWUuLi4gZG9p
bmcgdGhpcyBoYXMgYmVlbiBvbiBteSBvd24gdG8tZG8gbGlzdCBmb3IgYSB3aGlsZS4KClRoZSBs
YWNrIG9mIHJhbmdlLWJhc2VkIHJlZ2lzdHJhdGlvbiBmb3IgaW50ZXJuYWwgZW11bGF0b3JzIGlz
IGF0IGxlYXN0IG9uZSB0aGluZyB0aGF0IHdpbGwgYmUgYWRkcmVzc2VkIGJ5IGdvaW5nIHRoaXMg
cm91dGUsIGFuZCBJJ2QgYWxzbyBleHBlY3Qgc29tZSBkZWdyZWUgb2Ygc2ltcGxpZmljYXRpb24g
dG8gdGhlIGNvZGUgYnkgdW5pZnlpbmcgdGhpbmdzLCBvbmNlIGFsbCB0aGUgZW11bGF0aW9uIGlz
IHBvcnRlZCBvdmVyLgoKPiBJJ20gbm90IGNlcnRhaW5seSBwbGFubmluZyB0byBtb3ZlIGFsbCBp
bnRlcmNlcHRzIHJpZ2h0IG5vdywgYnV0IEkKPiB0aGluayBpdCdzIGEgZ29vZCBmaXJzdCBzdGVw
IGhhdmluZyB0aGUgY29kZSBpbiBwbGFjZSB0byBhbGxvdyB0aGlzLAo+IGFuZCBhdCBsZWFzdCB2
UENJIHVzaW5nIGl0Lgo+IAoKSSB0aGluayBpdCdzIGZpbmUgdG8gZG8gdGhpbmdzIHBpZWNlbWVh
bCBidXQgYWxsIHRoZSBpbnRlcm5hbCBlbXVsYXRvcnMgZG8gbmVlZCB0byBiZSBwb3J0ZWQgb3Zl
ciBhLnMuYS5wLiBJIGNhbiBjZXJ0YWlubHkgdHJ5IHRvIGhlbHAgd2l0aCB0aGlzIG9uY2UgdGhl
IGdyb3VuZHdvcmsgaXMgZG9uZS4KCiAgUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
