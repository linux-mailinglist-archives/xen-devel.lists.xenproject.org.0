Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C951181F5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:15:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieadA-0003Yb-1C; Tue, 10 Dec 2019 08:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iead8-0003YJ-Mx
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:12:26 +0000
X-Inumbo-ID: cc84e61a-1b24-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc84e61a-1b24-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 08:12:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A454CAF86;
 Tue, 10 Dec 2019 08:12:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Paul Durrant <pdurrant@amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
Date: Tue, 10 Dec 2019 09:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMDk6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjEyLjIwMTkgMDg6
MTYsIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+Pj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywgMjAxOSA1OjM2IFBNCj4+Pgo+
Pj4gT24gMjguMTEuMjAxOSAxMjozMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+PiBPbiAyOC4x
MS4xOSAxMjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI3LjExLjIwMTkgMTg6MTEs
IFBhdWwgRHVycmFudCB3cm90ZToKPj4+Pj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBp
b21tdV9vcCB0byBmYWNpbGl0YXRlIGEgcGVyLQo+Pj4gaW1wbGVtZW50YXRpb24KPj4+Pj4+IHF1
YXJhbnRpbmUgc2V0IHVwLCBhbmQgdGhlbiBmdXJ0aGVyIGNvZGUgZm9yIHg4NiBpbXBsZW1lbnRh
dGlvbnMKPj4+Pj4+IChhbWQgYW5kIHZ0ZCkgdG8gc2V0IHVwIGEgcmVhZC1vbmx5IHNjcmF0Y2gg
cGFnZSB0byBzZXJ2ZSBhcyB0aGUgc291cmNlCj4+Pj4+PiBmb3IgRE1BIHJlYWRzIHdoaWxzdCBh
IGRldmljZSBpcyBhc3NpZ25lZCB0byBkb21faW8uIERNQSB3cml0ZXMgd2lsbAo+Pj4+Pj4gY29u
dGludWUgdG8gZmF1bHQgYXMgYmVmb3JlLgo+Pj4+Pj4KPj4+Pj4+IFRoZSByZWFzb24gZm9yIGRv
aW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJlIG1heSBjb250aW51ZSB0byByZS10cnkKPj4+
Pj4+IERNQSAoZGVzcGl0ZSBGTFIpIGluIHRoZSBldmVudCBvZiBhbiBlcnJvciwgb3IgZXZlbiBC
TUUgYmVpbmcgY2xlYXJlZCwKPj4+IGFuZAo+Pj4+Pj4gd2lsbCBmYWlsIHRvIGRlYWwgd2l0aCBE
TUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxseS4gSGF2aW5nIGEgc2NyYXRjaCBwYWdlCj4+Pj4+PiBt
YXBwZWQgd2lsbCBhbGxvdyBwZW5kaW5nIERNQSByZWFkcyB0byBjb21wbGV0ZSBhbmQgdGh1cyBz
dWNoIGJ1Z2d5Cj4+Pj4+PiBoYXJkd2FyZSB3aWxsIGV2ZW50dWFsbHkgYmUgcXVpZXNjZWQuCj4+
Pj4+Pgo+Pj4+Pj4gTk9URTogVGhlc2UgbW9kaWZpY2F0aW9ucyBhcmUgcmVzdHJpY3RlZCB0byB4
ODYgaW1wbGVtZW50YXRpb25zIG9ubHkgYXMKPj4+Pj4+ICAgICAgICAgdGhlIGJ1Z2d5IGgvdyBJ
IGFtIGF3YXJlIG9mIGlzIG9ubHkgdXNlZCB3aXRoIFhlbiBpbiBhbiB4ODYKPj4+Pj4+ICAgICAg
ICAgZW52aXJvbm1lbnQuIEFSTSBtYXkgcmVxdWlyZSBzaW1pbGFyIGNvZGUgYnV0LCBzaW5jZSBJ
IGFtIG5vdAo+Pj4+Pj4gICAgICAgICBhd2FyZSBvZiB0aGUgbmVlZCwgdGhpcyBwYXRjaCBkb2Vz
IG5vdCBtb2RpZnkgYW55IEFSTQo+Pj4gaW1wbGVtZW50YXRpb24uCj4+Pj4+Pgo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+Pj4+Pgo+Pj4+
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+Pgo+Pj4+
Pj4gVGhlcmUgaXMgc3RpbGwgdGhlIG9wZW4gcXVlc3Rpb24gb2Ygd2hldGhlciB1c2Ugb2YgYSBz
Y3JhdGNoIHBhZ2Ugb3VnaHQKPj4+Pj4+IHRvIGJlIGdhdGVkIG9uIHNvbWV0aGluZywgZWl0aGVy
IGFyZSBydW4tdGltZSBvciBjb21waWxlLXRpbWUuCj4+Pj4+Cj4+Pj4+IEkgaGF2ZSBubyBjbGVh
ciBvcGluaW9uIGVpdGhlciB3YXkgaGVyZS4gVGhlIHdvcmthcm91bmQgc2VlbXMgbG93Cj4+Pj4+
IG92ZXJoZWFkIGVub3VnaCB0aGF0IHRoZXJlIG1heSBub3QgYmUgYSBuZWVkIHRvIGhhdmUgYW4g
YWRtaW4gKG9yCj4+Pj4+IGJ1aWxkIHRpbWUpIGNvbnRyb2wgZm9yIHRoaXMuCj4+Pj4+Cj4+Pj4+
IEFzIHRvIDQuMTM6IFRoZSBxdWFyYW50aW5pbmcgYXMgYSB3aG9sZSBpcyBwcmV0dHkgZnJlc2gu
IFdoaWxlIGl0Cj4+Pj4+IGhhcyBiZWVuIGJhY2twb3J0ZWQgdG8gc2VjdXJpdHkgbWFpbnRhaW5l
ZCB0cmVlcywgSSdkIHN0aWxsIGNvbnNpZGVyCj4+Pj4+IGl0IGEgbmV3IGZlYXR1cmUgaW4gNC4x
MywgYW5kIGhlbmNlIHRoaXMgd29ya2Fyb3VuZCBhdCBsZWFzdCBlbGlnaWJsZQo+Pj4+PiBmb3Ig
Y29uc2lkZXJhdGlvbi4KPj4+Pgo+Pj4+IEkgYWdyZWUuCj4+Pj4KPj4+PiBSZWxlYXNlLWFja2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gSSBub3RpY2UgdGhp
cyBoYXMgYmVlbiBjb21taXR0ZWQgbWVhbndoaWxlLiBJIGhhZCBzcGVjaWZpY2FsbHkgbm90Cj4+
PiBkb25lIHNvIGR1ZSB0byB0aGUgc3RpbGwgbWlzc2luZyBWVC1kIGFjaywgc2VlaW5nIHRoYXQg
dGhpcyB3YXNuJ3QKPj4+IGFuIGVudGlyZWx5ICJ0cml2aWFsIiBjaGFuZ2UuCj4+Pgo+Pgo+PiBX
aGlsZSB0aGUgcXVhcmFudGluZSBpZGVhIHNvdW5kcyBnb29kIG92ZXJhbGwsIEknbSBzdGlsbCBu
b3QgY29udmluY2VkCj4+IHRvIGhhdmUgaXQgdGhlIG9ubHkgd2F5IGluIHBsYWNlIGp1c3QgZm9y
IGhhbmRsaW5nIHNvbWUga25vd24tYnVnZ3kKPj4gZGV2aWNlLiBJdCBraWxscyB0aGUgcG9zc2li
aWxpdHkgb2YgaWRlbnRpZnlpbmcgYSBuZXcgYnVnZ3kgZGV2aWNlIGFuZCB0aGVuCj4+IGRlY2lk
aW5nIG5vdCB0byB1c2UgaXQgaW4gdGhlIGZpcnN0IHNwYWNlLi4uIEkgdGhvdWdodCBhYm91dCB3
aGV0aGVyIGl0Cj4+IHdpbGwgZ2V0IGJldHRlciB3aGVuIGZ1dHVyZSBJT01NVSBpbXBsZW1lbnRz
IEEvRCBiaXQgLSBieSBjaGVja2luZwo+PiBhY2Nlc3MgYml0IGJlaW5nIHNldCB0aGVuIHdlJ2xs
IGtub3cgc29tZSBidWdneSBkZXZpY2UgZXhpc3RzLCBidXQsCj4+IHRoZSBzY3JhdGNoIHBhZ2Ug
aXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzIHRoZW4gd2UgY2Fubm90IHJlbHkgb24gdGhpcwo+PiBm
ZWF0dXJlIHRvIGZpbmQgb3V0IHRoZSBhY3R1YWwgYnVnZ3kgb25lLgo+IAo+IFRoaW5raW5nIGFi
b3V0IGl0IC0geWVzLCBJIHRoaW5rIEkgYWdyZWUuIFRoaXMgKGFzIHdpdGggc28gbWFueQo+IHdv
cmthcm91bmRzKSB3b3VsZCBiZXR0ZXIgYmUgYW4gb2ZmLWJ5LWRlZmF1bHQgb25lLiBUaGUgbWFp
biBpc3N1ZQo+IEkgdW5kZXJzdGFuZCB0aGlzIHdvdWxkIGhhdmUgaXMgdGhhdCBidWdneSBzeXN0
ZW1zIHRoZW4gbWlnaHQgaGFuZwo+IHdpdGhvdXQgZXZlbiBoYXZpbmcgbWFuYWdlZCB0byBnZXQg
YSBsb2cgbWVzc2FnZSBvdXQgLSBQYXVsPwo+IAo+IErDvHJnZW4gLSB3b3VsZCB5b3UgYmUgYW1l
bmFibGUgdG8gYW4gYWxtb3N0IGxhc3QgbWludXRlIHJlZmluZW1lbnQKPiBoZXJlICh3b3VsZCB0
aGVuIGFsc28gbmVlZCB0byBzdGlsbCBiZSBiYWNrcG9ydGVkIHRvIDQuMTIuMiwgb3IKPiB0aGUg
b3JpZ2luYWwgYmFja3BvcnQgcmV2ZXJ0ZWQsIHRvIGF2b2lkIGdpdmluZyB0aGUgaW1wcmVzc2lv
biBvZgo+IGEgcmVncmVzc2lvbik/CgpTbyB3aGF0IGlzIHlvdXIgc3VnZ2VzdGlvbiBoZXJlPyBU
byBoYXZlIGEgYm9vdCBvcHRpb24gKGRlZmF1bHRpbmcgdG8Kb2ZmKSBmb3IgZW5hYmxpbmcgdGhl
IHNjcmF0Y2ggcGFnZT8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
