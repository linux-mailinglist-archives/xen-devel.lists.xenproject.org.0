Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FFC10FAE0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 10:38:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic4bJ-0007rd-81; Tue, 03 Dec 2019 09:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic4bH-0007rY-MW
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 09:36:07 +0000
X-Inumbo-ID: 543e7136-15b0-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 543e7136-15b0-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 09:36:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B831AF47;
 Tue,  3 Dec 2019 09:36:05 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
Date: Tue, 3 Dec 2019 10:36:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMjozMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOC4xMS4xOSAx
MjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI3LjExLjIwMTkgMTg6MTEsIFBhdWwgRHVy
cmFudCB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBpb21tdV9vcCB0byBm
YWNpbGl0YXRlIGEgcGVyLWltcGxlbWVudGF0aW9uCj4+PiBxdWFyYW50aW5lIHNldCB1cCwgYW5k
IHRoZW4gZnVydGhlciBjb2RlIGZvciB4ODYgaW1wbGVtZW50YXRpb25zCj4+PiAoYW1kIGFuZCB2
dGQpIHRvIHNldCB1cCBhIHJlYWQtb25seSBzY3JhdGNoIHBhZ2UgdG8gc2VydmUgYXMgdGhlIHNv
dXJjZQo+Pj4gZm9yIERNQSByZWFkcyB3aGlsc3QgYSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZG9t
X2lvLiBETUEgd3JpdGVzIHdpbGwKPj4+IGNvbnRpbnVlIHRvIGZhdWx0IGFzIGJlZm9yZS4KPj4+
Cj4+PiBUaGUgcmVhc29uIGZvciBkb2luZyB0aGlzIGlzIHRoYXQgc29tZSBoYXJkd2FyZSBtYXkg
Y29udGludWUgdG8gcmUtdHJ5Cj4+PiBETUEgKGRlc3BpdGUgRkxSKSBpbiB0aGUgZXZlbnQgb2Yg
YW4gZXJyb3IsIG9yIGV2ZW4gQk1FIGJlaW5nIGNsZWFyZWQsIGFuZAo+Pj4gd2lsbCBmYWlsIHRv
IGRlYWwgd2l0aCBETUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxseS4gSGF2aW5nIGEgc2NyYXRjaCBw
YWdlCj4+PiBtYXBwZWQgd2lsbCBhbGxvdyBwZW5kaW5nIERNQSByZWFkcyB0byBjb21wbGV0ZSBh
bmQgdGh1cyBzdWNoIGJ1Z2d5Cj4+PiBoYXJkd2FyZSB3aWxsIGV2ZW50dWFsbHkgYmUgcXVpZXNj
ZWQuCj4+Pgo+Pj4gTk9URTogVGhlc2UgbW9kaWZpY2F0aW9ucyBhcmUgcmVzdHJpY3RlZCB0byB4
ODYgaW1wbGVtZW50YXRpb25zIG9ubHkgYXMKPj4+ICAgICAgICB0aGUgYnVnZ3kgaC93IEkgYW0g
YXdhcmUgb2YgaXMgb25seSB1c2VkIHdpdGggWGVuIGluIGFuIHg4Ngo+Pj4gICAgICAgIGVudmly
b25tZW50LiBBUk0gbWF5IHJlcXVpcmUgc2ltaWxhciBjb2RlIGJ1dCwgc2luY2UgSSBhbSBub3QK
Pj4+ICAgICAgICBhd2FyZSBvZiB0aGUgbmVlZCwgdGhpcyBwYXRjaCBkb2VzIG5vdCBtb2RpZnkg
YW55IEFSTSBpbXBsZW1lbnRhdGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+PiBUaGVyZSBpcyBzdGlsbCB0aGUgb3BlbiBxdWVzdGlv
biBvZiB3aGV0aGVyIHVzZSBvZiBhIHNjcmF0Y2ggcGFnZSBvdWdodAo+Pj4gdG8gYmUgZ2F0ZWQg
b24gc29tZXRoaW5nLCBlaXRoZXIgYXJlIHJ1bi10aW1lIG9yIGNvbXBpbGUtdGltZS4KPj4KPj4g
SSBoYXZlIG5vIGNsZWFyIG9waW5pb24gZWl0aGVyIHdheSBoZXJlLiBUaGUgd29ya2Fyb3VuZCBz
ZWVtcyBsb3cKPj4gb3ZlcmhlYWQgZW5vdWdoIHRoYXQgdGhlcmUgbWF5IG5vdCBiZSBhIG5lZWQg
dG8gaGF2ZSBhbiBhZG1pbiAob3IKPj4gYnVpbGQgdGltZSkgY29udHJvbCBmb3IgdGhpcy4KPj4K
Pj4gQXMgdG8gNC4xMzogVGhlIHF1YXJhbnRpbmluZyBhcyBhIHdob2xlIGlzIHByZXR0eSBmcmVz
aC4gV2hpbGUgaXQKPj4gaGFzIGJlZW4gYmFja3BvcnRlZCB0byBzZWN1cml0eSBtYWludGFpbmVk
IHRyZWVzLCBJJ2Qgc3RpbGwgY29uc2lkZXIKPj4gaXQgYSBuZXcgZmVhdHVyZSBpbiA0LjEzLCBh
bmQgaGVuY2UgdGhpcyB3b3JrYXJvdW5kIGF0IGxlYXN0IGVsaWdpYmxlCj4+IGZvciBjb25zaWRl
cmF0aW9uLgo+IAo+IEkgYWdyZWUuCj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKSSBub3RpY2UgdGhpcyBoYXMgYmVlbiBjb21taXR0ZWQgbWVh
bndoaWxlLiBJIGhhZCBzcGVjaWZpY2FsbHkgbm90CmRvbmUgc28gZHVlIHRvIHRoZSBzdGlsbCBt
aXNzaW5nIFZULWQgYWNrLCBzZWVpbmcgdGhhdCB0aGlzIHdhc24ndAphbiBlbnRpcmVseSAidHJp
dmlhbCIgY2hhbmdlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
