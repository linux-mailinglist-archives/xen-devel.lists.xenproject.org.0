Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC1206A2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:05:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRF5c-0006Ef-Vr; Thu, 16 May 2019 12:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRF5b-0006Ea-Ve
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:02:24 +0000
X-Inumbo-ID: 75ddb8dc-77d2-11e9-ac43-5b06917ed8f8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75ddb8dc-77d2-11e9-ac43-5b06917ed8f8;
 Thu, 16 May 2019 12:02:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 06:02:20 -0600
Message-Id: <5CDD5147020000780022F9F2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 06:02:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
 <20190516113728.wnjbezwtaq45ijfb@Air-de-Roger>
In-Reply-To: <20190516113728.wnjbezwtaq45ijfb@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] x86/IRQ: bail early from
 irq_guest_eoi_timer_fn() when nothing is in flight
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDEzOjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA2OjQ2OjUxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGVyZSdzIG5vIHBvaW50IGVudGVyaW5nIHRoZSBsb29wIGluIHRoZSBmdW5jdGlv
biBpbiB0aGlzIGNhc2UuIEluc3RlYWQKPj4gdGhlcmUgc3RpbGwgYmVpbmcgc29tZXRoaW5nIGlu
IGZsaWdodCBfYWZ0ZXJfIHRoZSBsb29wIHdvdWxkIGJlIGFuCj4+IGFjdHVhbCBwcm9ibGVtOiBO
byB0aW1lciB3b3VsZCBiZSBydW5uaW5nIGFueW1vcmUgZm9yIGlzc3VpbmcgdGhlIEVPSQo+PiBl
dmVudHVhbGx5LCBhbmQgaGVuY2UgdGhpcyBJUlEgKGFuZCBwb3NzaWJseSBsb3dlciBwcmlvcml0
eSBvbmVzKSB3b3VsZAo+PiBiZSBibG9ja2VkLCBwZXJoYXBzIGluZGVmaW5pdGVseS4KPj4gCj4+
IElzc3VlIGEgd2FybmluZyBpbnN0ZWFkIGFuZCBwcmVmZXIgYnJlYWtpbmcgc29tZSAocHJlc3Vt
YWJseQo+PiBtaXNiZWhhdmluZykgZ3Vlc3Qgb3ZlciBzdGFsbGluZyBwZXJoYXBzIHRoZSBlbnRp
cmUgc3lzdGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+IAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPj4gKysrIGIveGVuL2FyY2gv
eDg2L2lycS5jCj4+IEBAIC0xMTE1LDcgKzExMTUsNyBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3Rf
ZW9pX3RpbWVyX2ZuKHZvaWQKPj4gIAo+PiAgICAgIGFjdGlvbiA9IChpcnFfZ3Vlc3RfYWN0aW9u
X3QgKilkZXNjLT5hY3Rpb247Cj4+ICAKPj4gLSAgICBpZiAoIHRpbWVyX2lzX2FjdGl2ZSgmYWN0
aW9uLT5lb2lfdGltZXIpICkKPj4gKyAgICBpZiAoICFhY3Rpb24tPmluX2ZsaWdodCB8fCB0aW1l
cl9pc19hY3RpdmUoJmFjdGlvbi0+ZW9pX3RpbWVyKSApCj4+ICAgICAgICAgIGdvdG8gb3V0Owo+
PiAgCj4+ICAgICAgaWYgKCBhY3Rpb24tPmFja190eXBlICE9IEFDS1RZUEVfTk9ORSApCj4+IEBA
IC0xMTMwLDggKzExMzAsMTAgQEAgc3RhdGljIHZvaWQgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbih2
b2lkCj4+ICAgICAgICAgIH0KPj4gICAgICB9Cj4+ICAKPj4gLSAgICBpZiAoIGFjdGlvbi0+aW5f
ZmxpZ2h0ICE9IDAgKQo+PiAtICAgICAgICBnb3RvIG91dDsKPj4gKyAgICBpZiAoIGFjdGlvbi0+
aW5fZmxpZ2h0ICkKPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcKPj4gKyAgICAg
ICAgICAgICAgICJJUlElZDogJWQgaGFuZGxlcnMgc3RpbGwgaW4gZmxpZ2h0IGF0IGZvcmNlZCBF
T0lcbiIsCj4+ICsgICAgICAgICAgICAgICBkZXNjLT5pcnEsIGFjdGlvbi0+aW5fZmxpZ2h0KTsK
PiAKPiBBRkFJQ1QgYWN0aW9uLT5pbl9mbGlnaHQgc2hvdWxkIGNvbnRhaW4gdGhlIG51bWJlciBv
ZiBndWVzdHMgcGlycXMKPiB0aGF0IGhhdmUgdGhlIHBpcnEgbWFza2VkIChwaXJxLT5tYXNrZWQg
PT0gdHJ1ZSksIGJlY2F1c2UgaW5fZmxpZ2h0IGlzCj4gb25seSBpbmNyZWFzZWQgYnkgX19kb19J
UlFfZ3Vlc3Qgd2hlbiB0aGUgcGlycSBpcyBub3QgYWxyZWFkeSBtYXNrZWQuCj4gQXQgZ3Vlc3Qg
RU9JIChkZXNjX2d1ZXN0X2VvaSkgdGhlIGluX2ZsaWdodCBjb3VudCBpcyBhbHNvIG9ubHkKPiBk
ZWNyZWFzZWQgaWYgdGhlIHBpcnEgaXMgdW5tYXNrZWQuCj4gCj4gSGVuY2UgSSB0aGluayB0aGlz
IGNvbmRpdGlvbiBjb3VsZCBiZSB0dXJuZWQgaW50byBhbiBBU1NFUlQsIGJ1dCBJJ20KPiBsaWtl
bHkgbWlzc2luZyBzb21ldGhpbmcuCgpJIGRvbid0IHRoaW5rIHlvdSBhcmUuIEdvaW5nIGZyb20g
aWYoKSBzdHJhaWdodCB0byBBU1NFUlQoKSBzaW1wbHkKc2VlbWVkIHRvbyBoYXJzaCB0byBtZSwg
dGhlIG1vcmUgaW4gYSBzdWJzeXN0ZW0gd2hlcmUgSSBjb3VsZAplYXNpbHkgaGF2ZSBvdmVybG9v
a2VkIHNvbWUgY29ybmVyIGNhc2UsIGR1ZSB0byBob3cgY29udm9sdXRlZApzb21lIG9mIHRoZSBp
bXBsZW1lbnRhdGlvbiBpcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
