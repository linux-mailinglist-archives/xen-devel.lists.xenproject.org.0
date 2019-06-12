Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BD4221A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb0H2-0008Rz-FH; Wed, 12 Jun 2019 10:14:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hb0H1-0008Ru-HS
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 10:14:31 +0000
X-Inumbo-ID: dc29a244-8cfa-11e9-a7ef-23654ddd7306
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc29a244-8cfa-11e9-a7ef-23654ddd7306;
 Wed, 12 Jun 2019 10:14:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 04:14:26 -0600
Message-Id: <5D00D07F020000780023768C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 04:14:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Dario Faggioli" <dfaggioli@suse.com>
References: <20190528103313.13431jgross@suse.com>
 <20190528103313.13434jgross@suse.com>
 <afe9fd8d36b5e946208436bf8f7dcaba@citrix.com>
 <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
 <5D00C6960200007800237622@suse.com>
 <0889f51d8aed0c95ecfcd038678f945abf2ca42a.camel@suse.com>
In-Reply-To: <0889f51d8aed0c95ecfcd038678f945abf2ca42a.camel@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDExOjU2LCA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKPiBP
biBXZWQsIDIwMTktMDYtMTIgYXQgMTA6MzIgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+
ID4gPiBPbiAxMi4wNi4xOSBhdCAxMDoxOSwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+ID4g
T24gMTIuMDYuMTkgMTA6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+ID4gPiBPbiAyOC8wNS8y
MDE5IDExOjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiA+ID4gPiAKPj4gPiA+ID4gKyAgICBw
ZXJfY3B1KHNjaGVkdWxlciwgY3B1KSA9IG5ld19vcHM7Cj4+ID4gPiA+ICsgICAgc2QtPnNjaGVk
X3ByaXYgPSBwcHJpdjsKPj4gPiA+ID4gKwo+PiA+ID4gPiArICAgIC8qCj4+ID4gPiA+ICsgICAg
ICogKFJlPylyb3V0ZSB0aGUgbG9jayB0byB0aGUgcGVyIHBDUFUgbG9jayBhcyAvbGFzdC8KPj4g
PiA+ID4gdGhpbmcuIEluIGZhY3QsCj4+ID4gPiA+ICsgICAgICogaWYgaXQgaXMgZnJlZSAoYW5k
IGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0Cj4+ID4gPiA+IG1hbmFnZXMKPj4g
PiA+ID4gKyAgICAgKiB0YWtpbmcgaXQsIGZpbmRzIGFsbCB0aGUgaW5pdGlhbGl6YXRpb25zIHdl
J3ZlIGRvbmUKPj4gPiA+ID4gYWJvdmUgaW4gcGxhY2UuCj4+ID4gPiA+ICsgICAgICovCj4+ID4g
PiA+ICsgICAgc21wX21iKCk7Cj4+ID4gPiAKPj4gPiA+IEEgZnVsbCBtZW1vcnkgYmFycmllciBp
cyBhIG1hc3NpdmUgb3ZlcmhlYWQgZm9yIHdoYXQgc2hvdWxkIGJlCj4+ID4gPiBzbXBfd21iKCku
ICBUaGUgbWF0Y2hpbmcgYmFycmllciBpcyBhY3R1YWxseSBoaWRkZW4gaW4gdGhlCj4+ID4gPiBp
bXBsaWNpdAo+PiA+ID4gc2VtYW50aWNzIG9mIG1hbmFnaW5nIHRvIGxvY2sgc2QtPnNjaGVkdWxl
X2xvY2sgKHdoaWNoIGlzIHRyaWFsCj4+ID4gPiBhbiBlcnJvcgo+PiA+ID4gYW55d2F5KSwgYnV0
IHRoZSBvbmx5IHRoaW5nIHRoYXQgbWF0dGVycyBoZXJlIGlzIHRoYXQgYWxsIG90aGVyCj4+ID4g
PiB3cml0dGVuCj4+ID4gPiBkYXRhIGlzIGluIHBsYWNlIGZpcnN0Lgo+PiA+ID4gCj4+ID4gTm90
IHRoYXQgaXQgd291bGQgcmVhbGx5IG1hdHRlciBmb3IgcGVyZm9ybWFuY2UgKHN3aXRjaGluZyBj
cHVzCj4+ID4gYmV0d2Vlbgo+PiA+IGNwdXBvb2xzIGlzIGEgX3ZlcnlfIHJhcmUgb3BlcmF0aW9u
KSwgSSdtIGZpbmUgdHJhbnNmb3JtaW5nIHRoZQo+PiA+IGJhcnJpZXIKPj4gPiBpbnRvIHNtcF93
bWIoKS4KPj4gCj4+IFRoaXMgYWdhaW4gaXMgYSBjaGFuZ2UgZWFzeSBlbm91Z2ggdG8gbWFrZSB3
aGlsZSBjb21taXR0aW5nLiBJJ20KPj4gcmVjb3JkaW5nIHRoZSBhYm92ZSBpbiBjYXNlIEkgZW5k
IHVwIGJlaW5nIHRoZSBjb21taXR0ZXIuCj4+IAo+IEknbSBmaW5lIChpLmUuLCBteSBSZXYtYnk6
IHJlbWFpbnMgdmFsaWQpIHdpdGggdGhpcyBiZWluZyB0dXJuZWQgaW50byBhCj4gd21iKCksIGFu
ZCBpdCBiZWluZyBkb25lIHVwb24gY29tbWl0ICh0aGFua3MgSmFuIGZvciB0aGUgb2ZmZXIgdG8g
ZG8KPiB0aGF0ISkuCj4gCj4gSWYgd2UgZG8gaXQsIGhvd2V2ZXIsIEkgdGhpbmsgdGhlIGNvbW1l
bnQgbmVlZHMgdG8gYmUgYWRqdXN0ZWQgdG9vLCBhbmQKPiB0aGUgY29tbWl0IG1lc3NhZ2UgbmVl
ZHMgdG8gYnJpZWZseSBtZW50aW9uIHRoaXMgbmV3IGNoYW5nZSB3ZSdyZQo+IGRvaW5nLgo+IAo+
IE1heWJlLCBmb3IgdGhlIGNvbW1lbnQsIGFkZCBzb21ldGhpbmcgbGlrZToKPiAKPiAiVGhlIHNt
cF93bWIoKSBjb3JyZXNwb25kcyB0byB0aGUgYmFycmllciBpbXBsaWNpdCBpbiBzdWNjZXNzZnVs
bHkKPiB0YWtpbmcgdGhlIGxvY2suIgoKSSdtIG5vdCBlbnRpcmVseSBoYXBweSB3aXRoIHRoaXMg
b25lOiBUYWtpbmcgYSBsb2NrIGlzIGFuIGltcGxpY2l0IGZ1bGwKYmFycmllciwgc28gY2Fubm90
IGFsb25lIGJlIHVzZWQgdG8gcmVhc29uIHdoeSBhIHdyaXRlIGJhcnJpZXIgaXMKc3VmZmljaWVu
dCBoZXJlLgoKPiBBbmQsIGZvciB0aGUgY2hhbmdlbG9nLCBhZGQ6Cj4gCj4gIldoaWxlIHRoZXJl
LCB0dXJuIHRoZSBmdWxsIGJhcnJpZXIsIHdoaWNoIHdhcyBvdmVya2lsbCwgaW50byBhbgo+IHNt
cF93bWIoKSwgbWF0Y2hpbmcgd2l0aCB0aGUgb25lIGltcGxpY2l0IGluIG1hbmFnaW5nIHRvIHRh
a2UgdGhlCj4gbG9jay4iCgpUaGlzIG9uZSByZWFkcyBmaW5lIHRvIG1lLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
