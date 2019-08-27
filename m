Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186249E337
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:54:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XC7-0005ZA-LV; Tue, 27 Aug 2019 08:51:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2XC5-0005Z5-Ta
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 08:51:13 +0000
X-Inumbo-ID: d2626456-c8a7-11e9-ae2f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2626456-c8a7-11e9-ae2f-12813bfff9fa;
 Tue, 27 Aug 2019 08:51:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29389AFBE;
 Tue, 27 Aug 2019 08:51:12 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <759652afb52a3258f0da44de61ed28d0875774f8.camel@infradead.org>
 <6a051513-e462-e93a-3118-b722fa5ccdaa@suse.com>
 <35a8cd053ddf7129808c9e2755c4e7fe0d1a5c60.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69fad9d8-dd8f-0982-3b87-de83be5b2ae2@suse.com>
Date: Tue, 27 Aug 2019 10:51:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35a8cd053ddf7129808c9e2755c4e7fe0d1a5c60.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/boot: Rename trampoline_{start,
 end} to boot_trampoline_{start, end}
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNzoyNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OS0wOC0xMiBhdCAxMTo1NSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIw
MTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEZyb206IERhdmlkIFdvb2Rob3Vz
ZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4+Pgo+Pj4gSW4gcHJlcGFyYXRpb24gZm9yIHNwbGl0dGlu
ZyB0aGUgYm9vdCBhbmQgcGVybWFuZW50IHRyYW1wb2xpbmVzIGZyb20KPj4+IGVhY2ggb3RoZXIu
IFNvbWUgb2YgdGhlc2Ugd2lsbCBjaGFuZ2UgYmFjaywgYnV0IG1vc3QgYXJlIGJvb3Qgc28gZG8g
dGhlCj4+PiBwbGFpbiBzZWFyY2gvcmVwbGFjZSB0aGF0IHdheSBmaXJzdCwgdGhlbiBhIHN1YnNl
cXVlbnQgcGF0Y2ggd2lsbCBleHRyYWN0Cj4+PiB0aGUgcGVybWFuZW50IHRyYW1wb2xpbmUgY29k
ZS4KPj4KPj4gVG8gYmUgaG9uZXN0IEkgZG9uJ3QgdmlldyBpdCBhcyBoZWxwZnVsIHRvIGRvIHRo
aW5ncyBpbiB0aGlzIG9yZGVyLgo+PiBJZiB5b3UgZmlyc3QgcmUtYXJyYW5nZWQgdGhlIG9yZGVy
aW5nIG9mIGl0ZW1zIHdpdGhpbiB0aGUgdHJhbXBvbGluZSwKPj4gd2UnZCB0aGVuIG5vdCBlbmQg
dXAgd2l0aCBhbiBpbnRlcm1lZGlhdGUgc3RhdGUgd2hlcmUgdGhlIGxhYmVscyBhcmUKPj4gbWlz
bGVhZGluZy4gSXMgdGhlcmUgYSByZWFzb24gdGhpbmdzIGNhbid0IHNlbnNpYmx5IGJlIGRvbmUg
dGhlIG90aGVyCj4+IHdheSBhcm91bmQ/Cj4gCj4gT2J2aW91c2x5IEkgZGlkIGFsbCB0aGlzIGlu
IGEgd29ya2luZyB0cmVlIGZpcnN0LCBzd29yZSBhdCBpdCBhIGxvdCBhbmQKPiBmaW5hbGx5IGdv
dCBpdCB3b3JraW5nLCB0aGVuIGF0dGVtcHRlZCB0byBzcGxpdCBpdCB1cCBpbnRvIHNlcGFyYXRl
Cj4gbWVhbmluZ2Z1bCBjb21taXRzIHdoaWNoIGluZGl2aWR1YWxseSBtYWRlIHNlbnNlLiBUaGVy
ZSBpcyBwbGVudHkgb2YKPiByb29tIGZvciBzdWJqZWN0aXZpdHkgaW4gdGhlIGNob2ljZXMgSSBt
YWRlIGluIHRoYXQgbGFzdCBzdGVwLgo+IAo+IEknbSBub3Qgc3VyZSBJIHF1aXRlIHNlZSB3aHkg
eW91IHNheSB0aGUgbGFiZWxzIGFyZSBtaXNsZWFkaW5nLiBNeQo+IGludGVudCB3YXMgdG8gYXBw
bHkgbGFiZWxzIGJhc2VkIG9uIHdoYXQgZWFjaCBvYmplY3QgaXMgKnVzZWQqIGZvciwKPiBkZXNw
aXRlIHRoZSBmYWN0IHRoYXQgdG8gc3RhcnQgd2l0aCB0aGV5J3JlIGFsbCBhY3R1YWxseSBpbiB0
aGUgc2FtZQo+IHBsYWNlLiBBbmQgdGhlbiB0byBhY3R1YWxseSBtb3ZlIGVhY2ggZGlmZmVyZW50
IHR5cGUgb2Ygc3ltYm9sIGludG8gaXRzCj4gc2VwYXJhdGUgc2VjdGlvbi9sb2NhdGlvbiB0byBj
bGVhbiB0aGluZ3MgdXAuCj4gCj4gSXMgaXQganVzdCB0aGUgY29kZSBjb21tZW50cyBhdCB0aGUg
c3RhcnQgb2YgdHJhbXBvbGluZS5TIHRoYXQgeW91IGZpbmQKPiBtaXNsZWFkaW5nIGluIHRoZSBp
bnRlcmltIHN0YWdlPyBCZWNhdXNlIHRob3NlICpkb24ndCogcHVyZWx5IHRhbGsKPiBhYm91dCB3
aGF0IGJvb3RzeW0vYm9vdGRhdGFzeW0vdHJhbXBzeW0vdHJhbXAzMnN5bSBhcmUgdXNlZCBmb3I7
IHRoZXkKPiBkbyBzYXkgaG93IHRoZXkgYXJlIChldmVudHVhbGx5KSByZWxvY2F0ZWQuIEkgc3Vw
cG9zZSBJIGNvdWxkIHJpcCB0aGF0Cj4gY29kZSBjb21tZW50IG91dCBvZiBwYXRjaCAjMyBjb21w
bGV0ZWx5IGFuZCBhZGQgaXQgYWdhaW4gaW4gYSBsYXRlcgo+IGNvbW1pdC4uLiBvciBqdXN0IGp1
c3QgYWRkIGl0IGFnYWluLiBJIHdyaXRlIGNvZGUgY29tbWVudHMgaW4gYW4KPiBhdHRlbXB0IHRv
IGJlIGhlbHBmdWwgdG8gdGhvc2Ugd2hvIGNvbWUgYWZ0ZXIgbWUgKGVzcGVjaWFsbHkgd2hlbgo+
IHRoYXQncyBhY3R1YWxseSBteXNlbGYpIGJ1dCBpZiB0aGV5J3JlIGdvaW5nIHRvIGNhdXNlIHBy
b2JsZW1zLCB0aGVuCj4gbWF5YmUgdGhleSdyZSBtb3JlIGhhc3NsZSB0aGFuIHRoZXkncmUgd29y
dGg/CgpObywgaXQncyBhY3R1YWxseSB0aGUgbGFiZWwgbmFtZXM6IFRoZSAiYm9vdCIgdGhhdCB0
aGlzIHBhdGNoIHByZWZpeGVzCnRvIHRoZW0gaXNuJ3QgY29ycmVjdCB1bnRpbCBhbGwgcG9zdC1i
b290IChpLmUuIEFQIGJyaW5ndXApIHBhcnRzCmhhdmUgYmVlbiBtb3ZlZCBvdXQgb2YgdGhlIGZy
YW1lZCBibG9jayBvZiBjb2RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
