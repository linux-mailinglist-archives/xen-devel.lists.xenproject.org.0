Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005881181BD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:08:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaWM-0002KK-1p; Tue, 10 Dec 2019 08:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieaWJ-0002KF-Tm
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:05:23 +0000
X-Inumbo-ID: d06fc4b2-1b23-11ea-8902-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d06fc4b2-1b23-11ea-8902-12813bfff9fa;
 Tue, 10 Dec 2019 08:05:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B33D7AD9F;
 Tue, 10 Dec 2019 08:05:21 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
Date: Tue, 10 Dec 2019 09:05:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAwODoxNiwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywgMjAx
OSA1OjM2IFBNCj4+Cj4+IE9uIDI4LjExLjIwMTkgMTI6MzIsIErDvHJnZW4gR3Jvw58gd3JvdGU6
Cj4+PiBPbiAyOC4xMS4xOSAxMjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMTEu
MjAxOSAxODoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+PiBUaGlzIHBhdGNoIGludHJvZHVj
ZXMgYSBuZXcgaW9tbXVfb3AgdG8gZmFjaWxpdGF0ZSBhIHBlci0KPj4gaW1wbGVtZW50YXRpb24K
Pj4+Pj4gcXVhcmFudGluZSBzZXQgdXAsIGFuZCB0aGVuIGZ1cnRoZXIgY29kZSBmb3IgeDg2IGlt
cGxlbWVudGF0aW9ucwo+Pj4+PiAoYW1kIGFuZCB2dGQpIHRvIHNldCB1cCBhIHJlYWQtb25seSBz
Y3JhdGNoIHBhZ2UgdG8gc2VydmUgYXMgdGhlIHNvdXJjZQo+Pj4+PiBmb3IgRE1BIHJlYWRzIHdo
aWxzdCBhIGRldmljZSBpcyBhc3NpZ25lZCB0byBkb21faW8uIERNQSB3cml0ZXMgd2lsbAo+Pj4+
PiBjb250aW51ZSB0byBmYXVsdCBhcyBiZWZvcmUuCj4+Pj4+Cj4+Pj4+IFRoZSByZWFzb24gZm9y
IGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJlIG1heSBjb250aW51ZSB0byByZS10cnkK
Pj4+Pj4gRE1BIChkZXNwaXRlIEZMUikgaW4gdGhlIGV2ZW50IG9mIGFuIGVycm9yLCBvciBldmVu
IEJNRSBiZWluZyBjbGVhcmVkLAo+PiBhbmQKPj4+Pj4gd2lsbCBmYWlsIHRvIGRlYWwgd2l0aCBE
TUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxseS4gSGF2aW5nIGEgc2NyYXRjaCBwYWdlCj4+Pj4+IG1h
cHBlZCB3aWxsIGFsbG93IHBlbmRpbmcgRE1BIHJlYWRzIHRvIGNvbXBsZXRlIGFuZCB0aHVzIHN1
Y2ggYnVnZ3kKPj4+Pj4gaGFyZHdhcmUgd2lsbCBldmVudHVhbGx5IGJlIHF1aWVzY2VkLgo+Pj4+
Pgo+Pj4+PiBOT1RFOiBUaGVzZSBtb2RpZmljYXRpb25zIGFyZSByZXN0cmljdGVkIHRvIHg4NiBp
bXBsZW1lbnRhdGlvbnMgb25seSBhcwo+Pj4+PiAgICAgICAgdGhlIGJ1Z2d5IGgvdyBJIGFtIGF3
YXJlIG9mIGlzIG9ubHkgdXNlZCB3aXRoIFhlbiBpbiBhbiB4ODYKPj4+Pj4gICAgICAgIGVudmly
b25tZW50LiBBUk0gbWF5IHJlcXVpcmUgc2ltaWxhciBjb2RlIGJ1dCwgc2luY2UgSSBhbSBub3QK
Pj4+Pj4gICAgICAgIGF3YXJlIG9mIHRoZSBuZWVkLCB0aGlzIHBhdGNoIGRvZXMgbm90IG1vZGlm
eSBhbnkgQVJNCj4+IGltcGxlbWVudGF0aW9uLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+Pj4KPj4+PiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+Cj4+Pj4+IFRoZXJlIGlzIHN0aWxs
IHRoZSBvcGVuIHF1ZXN0aW9uIG9mIHdoZXRoZXIgdXNlIG9mIGEgc2NyYXRjaCBwYWdlIG91Z2h0
Cj4+Pj4+IHRvIGJlIGdhdGVkIG9uIHNvbWV0aGluZywgZWl0aGVyIGFyZSBydW4tdGltZSBvciBj
b21waWxlLXRpbWUuCj4+Pj4KPj4+PiBJIGhhdmUgbm8gY2xlYXIgb3BpbmlvbiBlaXRoZXIgd2F5
IGhlcmUuIFRoZSB3b3JrYXJvdW5kIHNlZW1zIGxvdwo+Pj4+IG92ZXJoZWFkIGVub3VnaCB0aGF0
IHRoZXJlIG1heSBub3QgYmUgYSBuZWVkIHRvIGhhdmUgYW4gYWRtaW4gKG9yCj4+Pj4gYnVpbGQg
dGltZSkgY29udHJvbCBmb3IgdGhpcy4KPj4+Pgo+Pj4+IEFzIHRvIDQuMTM6IFRoZSBxdWFyYW50
aW5pbmcgYXMgYSB3aG9sZSBpcyBwcmV0dHkgZnJlc2guIFdoaWxlIGl0Cj4+Pj4gaGFzIGJlZW4g
YmFja3BvcnRlZCB0byBzZWN1cml0eSBtYWludGFpbmVkIHRyZWVzLCBJJ2Qgc3RpbGwgY29uc2lk
ZXIKPj4+PiBpdCBhIG5ldyBmZWF0dXJlIGluIDQuMTMsIGFuZCBoZW5jZSB0aGlzIHdvcmthcm91
bmQgYXQgbGVhc3QgZWxpZ2libGUKPj4+PiBmb3IgY29uc2lkZXJhdGlvbi4KPj4+Cj4+PiBJIGFn
cmVlLgo+Pj4KPj4+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4KPj4gSSBub3RpY2UgdGhpcyBoYXMgYmVlbiBjb21taXR0ZWQgbWVhbndoaWxlLiBJ
IGhhZCBzcGVjaWZpY2FsbHkgbm90Cj4+IGRvbmUgc28gZHVlIHRvIHRoZSBzdGlsbCBtaXNzaW5n
IFZULWQgYWNrLCBzZWVpbmcgdGhhdCB0aGlzIHdhc24ndAo+PiBhbiBlbnRpcmVseSAidHJpdmlh
bCIgY2hhbmdlLgo+Pgo+IAo+IFdoaWxlIHRoZSBxdWFyYW50aW5lIGlkZWEgc291bmRzIGdvb2Qg
b3ZlcmFsbCwgSSdtIHN0aWxsIG5vdCBjb252aW5jZWQKPiB0byBoYXZlIGl0IHRoZSBvbmx5IHdh
eSBpbiBwbGFjZSBqdXN0IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5Cj4gZGV2aWNlLiBJ
dCBraWxscyB0aGUgcG9zc2liaWxpdHkgb2YgaWRlbnRpZnlpbmcgYSBuZXcgYnVnZ3kgZGV2aWNl
IGFuZCB0aGVuIAo+IGRlY2lkaW5nIG5vdCB0byB1c2UgaXQgaW4gdGhlIGZpcnN0IHNwYWNlLi4u
IEkgdGhvdWdodCBhYm91dCB3aGV0aGVyIGl0Cj4gd2lsbCBnZXQgYmV0dGVyIHdoZW4gZnV0dXJl
IElPTU1VIGltcGxlbWVudHMgQS9EIGJpdCAtIGJ5IGNoZWNraW5nCj4gYWNjZXNzIGJpdCBiZWlu
ZyBzZXQgdGhlbiB3ZSdsbCBrbm93IHNvbWUgYnVnZ3kgZGV2aWNlIGV4aXN0cywgYnV0LCAKPiB0
aGUgc2NyYXRjaCBwYWdlIGlzIHNoYXJlZCBieSBhbGwgZGV2aWNlcyB0aGVuIHdlIGNhbm5vdCBy
ZWx5IG9uIHRoaXMgCj4gZmVhdHVyZSB0byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4K
ClRoaW5raW5nIGFib3V0IGl0IC0geWVzLCBJIHRoaW5rIEkgYWdyZWUuIFRoaXMgKGFzIHdpdGgg
c28gbWFueQp3b3JrYXJvdW5kcykgd291bGQgYmV0dGVyIGJlIGFuIG9mZi1ieS1kZWZhdWx0IG9u
ZS4gVGhlIG1haW4gaXNzdWUKSSB1bmRlcnN0YW5kIHRoaXMgd291bGQgaGF2ZSBpcyB0aGF0IGJ1
Z2d5IHN5c3RlbXMgdGhlbiBtaWdodCBoYW5nCndpdGhvdXQgZXZlbiBoYXZpbmcgbWFuYWdlZCB0
byBnZXQgYSBsb2cgbWVzc2FnZSBvdXQgLSBQYXVsPwoKSsO8cmdlbiAtIHdvdWxkIHlvdSBiZSBh
bWVuYWJsZSB0byBhbiBhbG1vc3QgbGFzdCBtaW51dGUgcmVmaW5lbWVudApoZXJlICh3b3VsZCB0
aGVuIGFsc28gbmVlZCB0byBzdGlsbCBiZSBiYWNrcG9ydGVkIHRvIDQuMTIuMiwgb3IKdGhlIG9y
aWdpbmFsIGJhY2twb3J0IHJldmVydGVkLCB0byBhdm9pZCBnaXZpbmcgdGhlIGltcHJlc3Npb24g
b2YKYSByZWdyZXNzaW9uKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
