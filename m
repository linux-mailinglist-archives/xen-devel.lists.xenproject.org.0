Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1708105A09
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:55:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrX6-00071w-Jz; Thu, 21 Nov 2019 18:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72g7=ZN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iXrX5-00071r-2g
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 18:50:23 +0000
X-Inumbo-ID: c4ffcfd4-0c8f-11ea-a340-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4ffcfd4-0c8f-11ea-a340-12813bfff9fa;
 Thu, 21 Nov 2019 18:50:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 884DC206D8;
 Thu, 21 Nov 2019 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574362220;
 bh=aVQmgip1Kl19Q+Vd61klrdF2VoYOyjjh4W01f77p4AI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VAP506UvKjXdpx6SLLvYsPlzS1hK05CSMQenhJULY5RVhbEUCVq298fzdAKu6Vqij
 ZHA8Z79T4ud1rfuze+ioCHfMW+OG26oT914aQLXND0vLgTFasssFCA5gy3rNJWzJ4P
 2KyvpoogBy4axpCWgSuSRh7sDAlALEVMAZ4GcG7Y=
Date: Thu, 21 Nov 2019 10:50:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <7289f75f-1ab2-2d42-cd88-1be5306b3072@xen.org>
Message-ID: <alpine.DEB.2.21.1911211035350.26346@sstabellini-ThinkPad-T480s>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
 <20191112124609.69f2a6a2@donnerap.cambridge.arm.com>
 <7289f75f-1ab2-2d42-cd88-1be5306b3072@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+IAo+
IE9uIDEyLzExLzIwMTkgMTI6NDYsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+ID4gT24gTW9uLCAx
MSBOb3YgMjAxOSAxMTowMTowNyAtMDgwMCAoUFNUKQo+ID4gU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24gU2F0LCA5IE5vdiAyMDE5LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gT24gU2F0LCA5IE5vdiAyMDE5LCAwNDoyNyBTdGVm
YW5vIFN0YWJlbGxpbmksIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ID4gPiA+IHdyb3RlOgo+
ID4gPiA+ICAgICAgICBPbiBUaHUsIDcgTm92IDIwMTksIFBlbmcgRmFuIHdyb3RlOgo+ID4gPiA+
ICAgICAgICA+IFRoZSBlbmQgc2hvdWxkIGJlIEdJQ0RfSVNBQ1RJVkVSTiBub3QgR0lDRF9JU0FD
VElWRVIuCj4gPiA+ID4gICAgICAgID4KPiA+ID4gPiAgICAgICAgPiBTaWduZWQtb2ZmLWJ5OiBQ
ZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiA+ID4gPiAKPiA+ID4gPiAgICAgICAgUmV2aWV3
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+ID4g
PiAKPiA+ID4gPiAKPiA+ID4gPiBUbyBiZSBob25lc3QsIEkgYW0gbm90IHN1cmUgdGhlIGNvZGUg
aXMgY29ycmVjdC4gQSByZWFkIHRvIHRob3NlCj4gPiA+ID4gcmVnaXN0ZXJzIHNob3VsZCB0ZWxs
IHlvdSB0aGUgbGlzdCBvZiBpbnRlcnJ1cHRzIGFjdGl2ZS4gQXMgd2UgYWx3YXlzCj4gPiA+ID4g
cmV0dXJuIDAsIHRoaXMgd2lsbCBub3QgcmV0dXJuIHRoZSBjb3JyZWN0IHN0YXRlIG9mIHRoZSBH
SUMuCj4gPiA+ID4gCj4gPiA+ID4gSSBrbm93IHRoYXQgcmV0dXJuaW5nIHRoZSBsaXN0IG9mIGFj
dGl2ZXMgaW50ZXJydXB0cyBpcyBjb21wbGljYXRlZCB3aXRoCj4gPiA+ID4gdGhlIG9sZCB2R0lD
LCBidXQgSSBkb24ndCB0aGluayBzaWxlbnRseSBpZ25vcmluZyBpdCBpcyBhIGdvb2QKPiA+ID4g
PiBpZGVhLgo+ID4gPiA+IFRoZSBxdWVzdGlvbiBoZXJlIGlzIHdoeSB0aGUgZ3Vlc3QgYWNjZXNz
ZWQgdGhvc2UgcmVnaXN0ZXJzPyBXaGF0IGlzIGl0Cj4gPiA+ID4gdHJ5aW5nIHRvIGZpZ3VyZSBv
dXQ/Cj4gPiAKPiA+IEkgc2VlIExpbnV4IHF1ZXJ5aW5nIHRoZSBhY3RpdmUgc3RhdGUgKElSUUNI
SVBfU1RBVEVfQUNUSVZFKSBhdCB0d28gcmVsZXZhbnQKPiA+IHBvaW50cyBmb3IgQVJNOgo+ID4g
LSBJbiBrZXJuZWwvaXJxL21hbmFnZS5jLCBpbiBfX3N5bmNocm9uaXplX2hhcmRpcnEoKS4KPiA+
IC0gSW4gS1ZNJ3MgYXJjaCB0aW1lciBlbXVsYXRpb24gY29kZS4KPiA+IAo+ID4gSSB0aGluayB0
aGUgbGF0dGVyIGlzIG9mIG5vIGNvbmNlcm4gKHlldCksIGJ1dCB0aGUgZmlyc3QgbWlnaHQgYWN0
dWFsbHkKPiA+IHRyaWdnZXIuIEF0IHRoZSBtb21lbnQgaXQncyBiZXlvbmQgbWUgd2hhdCBpdCBh
Y3R1YWxseSBkb2VzLCBidXQgbWF5YmUgc29tZQo+ID4gSVJRIGNoYW5nZXMgKFJULCB0aHJlYWRl
ZCBJUlFzPykgdHJpZ2dlciB0aGlzIG5vdz9cCj4gSXQgaGFwcGVucyBJIGFtIHNpdHRpbmcgcmln
aHQgbmV4dCB0byBNYXJjIG5vdywgc28gSSBoYWQgYSBjaGF0IHdpdGggaGltIGFib3V0Cj4gdGhp
cyA6KS4gTGV0IG1lIHRyeSB0byBzdW1tYXJpemUgdGhlIGRpc2N1c3Npb24gaGVyZS4KPiAKPiBf
X3N5bmNocm9uaXplX2hhcmRpcnEoKSBpcyB1c2VkIHRvIGVuc3VyZSB0aGF0IGFsbCBhY3RpdmUg
aW50ZXJydXB0cyBoYXZlIGJlZW4KPiBoYW5kbGVkIGJlZm9yZSBjb250aW51aW5nLiBXaGVuIHN5
bmNfY2hpcCA9PSBmYWxzZSwgd2Ugb25seSBlbnN1cmUgdGhhdCBhbGwgaW4KPiBwcm9ncmVzcyBp
bnRlcnJ1cHRzIChmcm9tIExpbnV4IFBvVikgYXJlIGhhbmRsZWQgYmVmb3JlIGNvbnRpbnVlLgo+
IAo+IHN5bmNfY2hpcCA9PSB0cnVlIHdpbGwgYWRkaXRpb25hbGx5IGVuc3VyZSB0aGF0IGFueSBp
bnRlcnJ1cHQgdGhhdCB3ZXJlCj4gYWNrbm93bGVkZ2UgYnV0IG5vdCB5ZXQgbWFya2VkIGFzIGlu
IHByb2dyZXNzIGJ5IHRoZSBrZXJuZWwgYXJlIGFsc28gaGFuZGxlZC4KPiBUaGUgYXNzdW1wdGlv
biBpcyB0aGlzIGlzIGNhbGxlZCBhZnRlciB0aGUgaW50ZXJydXB0IGhhcyBiZWVuIG1hc2tlZC9k
aXNhYmxlZC4KPiAKPiBUaGUgY2FsbCB0byBfX3N5bmNocm9uaXplX2hhcmRpcnEoKSBpbiBmcmVl
X2lycSgpIChhcyByZXBvcnRlZCBieSBQZW5nIHN0YWNrCj4gdHJhY2UpIHdhcyBpbnRyb2R1Y2Vk
IHJlY2VudGx5IChzZWUgWzFdKS4gSXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoZXRoZXIKPiB0
aGlzIHdvdWxkIGFmZmVjdCBhbnlvbmUgdXNpbmcgTGludXggNS40IG9yIGp1c3QgYSBsaW1pdGVk
IHN1YnNldCBvZiB1c2Vycy4KPiAKPiBBbnlob3csIHRoaXMgaXMgYSBnZW51aW5lIGJ1ZyBhbmQg
SSB0aGluayByZXR1cm5pbmcgMCBpcyBvbmx5IHBhcGVyaW5nIG92ZXIKPiB0aGUgYnVnIHdpdGgg
bm8gbG9uZy10ZXJtIHJlc29sdXRpb24uIEFzIE1hcmMgcG9pbnRlZCBvdXQsIEV2ZW4gdGhlIG9s
ZCB2R0lDCj4gaW4gS1ZNIHdhcyBub3Qgc3BlYyBjb21wbGlhbnQgYW5kIHRoYW5rZnVsbHkgdGhp
cyB3YXMgZml4ZWQgaW4gdGhlIG5ldyB2R0lDLgo+IAo+IEFzIEkgc2FpZCBpbiBhIGRpZmZlcmVu
dCBzdWItdGhyZWFkLCBJIHdvdWxkIHJlbHVjdGFubHkgYmUgb2sgdG8gc2VlIHJldHVybmluZwo+
IDAgYXMgbG9uZyBhcyB3ZSBoYXZlIGFkZCBhIHdhcm5pbmcgZm9yICpldmVyeSogYWNjZXNzLiBM
b25nLXRlcm0sIHRoZSBjdXJyZW50Cj4gdkdJQyBzaG91bGQgcmVhbGx5IGdldCBraWxsZWQuCgpJ
IGFwcHJlY2lhdGUgeW91ciBpbnRlbnRpb24gb2YgcmFpc2luZyBhd2FyZW5lc3MgYW5kIGdldHRp
bmcgaGVscCBpbgpmaXhpbmcgdGhpbmdzIGluIHRoZSBjb21tdW5pdHksIHdoaWNoIGlzIHRoZSBy
aWdodCB0aGluZyB0byBkby4gSG93ZXZlciwKSSBhbSBkb3VidGZ1bCBvZiB0aGUgdXNlZnVsbmVz
cyBvZiBhIHdhcm5pbmcgdG8gYWNoaWV2ZSB0aGUgZ29hbC4gTWF5YmUKaXQgd291bGQgYmUgYmVz
dCB0byBjdXJhdGUgYW4gIm9wZW4gaXNzdWVzIiBzZWN0aW9uIHNvbWV3aGVyZSwgZXZlbiBqdXN0
CmFzIGFuIGVtYWlsIGFmdGVyIGV2ZXJ5IHJlbGVhc2Ugb3IgYXMgcGFydCBvZiB0aGUgcmVsZWFz
ZSBub3Rlcywgb3IgYXMgYQpqaXJhIHRpY2tldCwgb3IgYSB3aWtpcGFnZSwgb3IgYSBkb2N1bWVu
dCB1bmRlciBkb2NzLy4KCkFjdHVhbGx5LCBhbiAib3BlbiBpc3N1ZXMiIGRvY3VtZW50IHVuZGVy
IGRvY3MvIGNvdWxkIGJlIGEgZ29vZCBpZGVhIGZvcgp0aGlzIGFuZCBvdGhlciBzaW1pbGFyIGl0
ZW1zLgoKQSB3YXJuaW5nIGlzIGEgYmx1bnQgaW5zdHJ1bWVudCB0aGF0IGxhY2tzIHRoZSBzdWJ0
bGV0aWVzIG5lY2Vzc2FyeSB0bwpyYWlzZSB0aGUgYXR0ZW50aW9uIGluIHRoZSByaWdodCB3YXkg
YW5kIGFjaGlldmUgdGhlIGdvYWwgb2YgZ2V0dGluZwpoZWxwIGFuZCBjb250cmlidXRpb25zLiBF
c3BlY2lhbGx5IGl0IGhhcyB0aGUgcmlzayBvZiBjYXVzaW5nIHByb2JsZW1zCmFuZCBjb25mdXNp
b24gd2l0aCBsZXNzIGtub3dsZWRnZWFibGUgdXNlcnMuICBNYXliZSBhIGRwcmludGsgd2Fybmlu
ZwptZXNzYWdlIChvbmx5IERFQlVHIGJ1aWxkcykgY291bGQgYXZvaWQgc29tZSBvZiB0aGUgaXNz
dWVzLCB3aGlsZSBzdGlsbApnYWluaW5nIGF0dGVudGlvbiBvZiBzYXZ2eSBkZXZlbG9wZXJzIHdo
byBjb3VsZCB1bmRlcnN0YW5kIHdoYXQgaXQgbWVhbnMuCkJ1dCBJIHRoaW5rIHRoYXQgdGhlICJv
cGVuIGlzc3VlcyIgZG9jdW1lbnQgd291bGQgYmUgbW9yZSBlZmZlY3RpdmUuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
