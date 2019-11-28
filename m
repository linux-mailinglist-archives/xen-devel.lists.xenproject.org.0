Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64A10C805
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:35:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaI2O-0006Kl-G7; Thu, 28 Nov 2019 11:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaI2N-0006Kf-P1
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:32:43 +0000
X-Inumbo-ID: ca346761-11d2-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca346761-11d2-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 11:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7CE1AD85;
 Thu, 28 Nov 2019 11:32:41 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
Date: Thu, 28 Nov 2019 12:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTI6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjExLjIwMTkgMTg6
MTEsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGlv
bW11X29wIHRvIGZhY2lsaXRhdGUgYSBwZXItaW1wbGVtZW50YXRpb24KPj4gcXVhcmFudGluZSBz
ZXQgdXAsIGFuZCB0aGVuIGZ1cnRoZXIgY29kZSBmb3IgeDg2IGltcGxlbWVudGF0aW9ucwo+PiAo
YW1kIGFuZCB2dGQpIHRvIHNldCB1cCBhIHJlYWQtb25seSBzY3JhdGNoIHBhZ2UgdG8gc2VydmUg
YXMgdGhlIHNvdXJjZQo+PiBmb3IgRE1BIHJlYWRzIHdoaWxzdCBhIGRldmljZSBpcyBhc3NpZ25l
ZCB0byBkb21faW8uIERNQSB3cml0ZXMgd2lsbAo+PiBjb250aW51ZSB0byBmYXVsdCBhcyBiZWZv
cmUuCj4+Cj4+IFRoZSByZWFzb24gZm9yIGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJl
IG1heSBjb250aW51ZSB0byByZS10cnkKPj4gRE1BIChkZXNwaXRlIEZMUikgaW4gdGhlIGV2ZW50
IG9mIGFuIGVycm9yLCBvciBldmVuIEJNRSBiZWluZyBjbGVhcmVkLCBhbmQKPj4gd2lsbCBmYWls
IHRvIGRlYWwgd2l0aCBETUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxseS4gSGF2aW5nIGEgc2NyYXRj
aCBwYWdlCj4+IG1hcHBlZCB3aWxsIGFsbG93IHBlbmRpbmcgRE1BIHJlYWRzIHRvIGNvbXBsZXRl
IGFuZCB0aHVzIHN1Y2ggYnVnZ3kKPj4gaGFyZHdhcmUgd2lsbCBldmVudHVhbGx5IGJlIHF1aWVz
Y2VkLgo+Pgo+PiBOT1RFOiBUaGVzZSBtb2RpZmljYXRpb25zIGFyZSByZXN0cmljdGVkIHRvIHg4
NiBpbXBsZW1lbnRhdGlvbnMgb25seSBhcwo+PiAgICAgICAgdGhlIGJ1Z2d5IGgvdyBJIGFtIGF3
YXJlIG9mIGlzIG9ubHkgdXNlZCB3aXRoIFhlbiBpbiBhbiB4ODYKPj4gICAgICAgIGVudmlyb25t
ZW50LiBBUk0gbWF5IHJlcXVpcmUgc2ltaWxhciBjb2RlIGJ1dCwgc2luY2UgSSBhbSBub3QKPj4g
ICAgICAgIGF3YXJlIG9mIHRoZSBuZWVkLCB0aGlzIHBhdGNoIGRvZXMgbm90IG1vZGlmeSBhbnkg
QVJNIGltcGxlbWVudGF0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAKPj4gVGhlcmUgaXMgc3RpbGwgdGhlIG9wZW4gcXVlc3Rpb24gb2Ygd2hl
dGhlciB1c2Ugb2YgYSBzY3JhdGNoIHBhZ2Ugb3VnaHQKPj4gdG8gYmUgZ2F0ZWQgb24gc29tZXRo
aW5nLCBlaXRoZXIgYXJlIHJ1bi10aW1lIG9yIGNvbXBpbGUtdGltZS4KPiAKPiBJIGhhdmUgbm8g
Y2xlYXIgb3BpbmlvbiBlaXRoZXIgd2F5IGhlcmUuIFRoZSB3b3JrYXJvdW5kIHNlZW1zIGxvdwo+
IG92ZXJoZWFkIGVub3VnaCB0aGF0IHRoZXJlIG1heSBub3QgYmUgYSBuZWVkIHRvIGhhdmUgYW4g
YWRtaW4gKG9yCj4gYnVpbGQgdGltZSkgY29udHJvbCBmb3IgdGhpcy4KPiAKPiBBcyB0byA0LjEz
OiBUaGUgcXVhcmFudGluaW5nIGFzIGEgd2hvbGUgaXMgcHJldHR5IGZyZXNoLiBXaGlsZSBpdAo+
IGhhcyBiZWVuIGJhY2twb3J0ZWQgdG8gc2VjdXJpdHkgbWFpbnRhaW5lZCB0cmVlcywgSSdkIHN0
aWxsIGNvbnNpZGVyCj4gaXQgYSBuZXcgZmVhdHVyZSBpbiA0LjEzLCBhbmQgaGVuY2UgdGhpcyB3
b3JrYXJvdW5kIGF0IGxlYXN0IGVsaWdpYmxlCj4gZm9yIGNvbnNpZGVyYXRpb24uCgpJIGFncmVl
LgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
