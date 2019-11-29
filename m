Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA4E10D694
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaglx-0006cL-Th; Fri, 29 Nov 2019 13:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaglw-0006al-EB
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:57:24 +0000
X-Inumbo-ID: 2b20e7c8-12b0-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b20e7c8-12b0-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 13:57:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00453AC22;
 Fri, 29 Nov 2019 13:57:22 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
 <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
 <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
 <8b7db8ee-8dc8-0390-0d44-f12de573e81a@suse.com>
 <abddefb1-6fac-67d9-c825-43a1b63300c1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <842a384f-3f4b-25bd-527d-178aad21a98b@suse.com>
Date: Fri, 29 Nov 2019 14:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <abddefb1-6fac-67d9-c825-43a1b63300c1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTQ6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjExLjIwMTkgMTQ6
MzcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI5LjExLjE5IDE0OjI2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI5LjExLjIwMTkgMTM6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+
Pj4gT24gMjkvMTEvMjAxOSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI5LjEx
LjIwMTkgMTM6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+PiBPbiAyOS8xMS8yMDE5IDEy
OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyOS4xMS4yMDE5IDEzOjAxLCBJYW4g
SmFja3NvbiB3cm90ZToKPj4+Pj4+Pj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSF0g
Y29uc29sZTogYXZvaWQgYnVmZmVyIG92ZXJmbG93IGluIGd1ZXN0X2NvbnNvbGVfd3JpdGUoKSIp
Ogo+Pj4+Pj4+Pj4gT24gMjkuMTEuMjAxOSAxMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
Pj4+Pj4+PiBJcyBzaXplb2YoYXJyYXlbMF0pIGFsd2F5cyAwLCBvciBpcyB0aGlzIGp1c3QgYSBH
Q0MtaXNtID/CoCBHb2Rib2x0Cj4+Pj4+Pj4+Pj4gc3VnZ2VzdHMgaXMgMCBvbiBhbGwgY29tcGls
ZXIgd2Ugc3VwcG9ydC4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEVpdGhlciB3YXksIGlzbid0IHRo
ZSBtb3JlIGNvbW1vbiBpZGlvbSArIDB1bCA/wqAgUGVyc29uYWxseSwgSSBmZWVsIHRoYXQKPj4+
Pj4+Pj4+PiBpcyBjbGVhcmVyIHRvIGZvbGxvdy4KPj4+Pj4+Pj4+IEkgZGVjaWRlZCBhZ2FpbnN0
ICsgMHVsIG9yIGFsaWtlIGJlY2F1c2UgaW4gcHJpbmNpcGxlIHNpemVfdAo+Pj4+Pj4+Pj4gYW5k
IHVuc2lnbmVkIGxvbmcgYXJlIGRpZmZlcmVudCB0eXBlcy4gSW4gcGFydGljdWxhciAzMi1iaXQK
Pj4+Pj4+Pj4+IHg4NiBnY2MgdXNlcyB1bnNpZ25lZCBpbnQgZm9yIHNpemVfdCwgYW5kIGhlbmNl
IG1pbigpJ3MKPj4+Pj4+Pj4+IHR5cGUgc2FmZXR5IGNoZWNrIHdvdWxkIGNhdXNlIHRoZSBidWls
ZCB0byBmYWlsIHRoZXJlLiBUaGUKPj4+Pj4+Pj4+IHNhbWUgcmlzayBvYnZpb3VzbHkgZXhpc3Rz
IGZvciBhbnkgMzItYml0IGFyY2ggKGUuZy4gQXJtMzIsCj4+Pj4+Pj4+PiBidXQgSSBoYXZlbid0
IGNoZWNrZWQgd2hhdCB0eXBlIGl0IGFjdHVhbGx5IHVzZXMpLgo+Pj4+Pj4+PiBJIGRvbid0IGtu
b3cgd2hhdCBpIHdyb25nIHdpdGgKPj4+Pj4+Pj4gICAgICAoc2l6ZV90KTAKPj4+Pj4+Pj4gd2hp
Y2ggaXMgc2hvcnRlciwgZXZlbiAhCj4+Pj4+Pj4gVHJ1ZS4gWWV0IGl0IGNvbnRhaW5zIGEgY2Fz
dCwgbm8gbWF0dGVyIGhvdyByaXNrLWZyZWUgaXQgbWF5IGJlCj4+Pj4+Pj4gaW4gdGhpcyBjYXNl
LiBXaXRoIGEgY2FzdCwgSSBjb3VsZCBhcyB3ZWxsIGhhdmUgd3JpdHRlbiAoeWV0Cj4+Pj4+Pj4g
c2hvcnRlcikgKHNpemVfdCljb3VudC4KPj4+Pj4+IEdpdmVuIHRoYXQgbWluKCkgaGFzIGEgdmVy
eSBzdHJpY3QgdHlwZWNoZWNrLCBJIHRoaW5rIHdlIHNob3VsZCBwZXJtaXQKPj4+Pj4+IGFueSB1
c2Ugb2YgYW4gZXhwbGljaXQgY2FzdCBpbiBhIHNpbmdsZSBvcGVyYW5kLCBiZWNhdXNlIGl0ICpp
cyogc2FmZXIKPj4+Pj4+IHRoYW4gc3dpdGNoaW5nIHRvIHRoZSBtaW5fdCgpIHJvdXRlIHRvIG1h
a2UgdGhpbmdzIGNvbXBpbGUuCj4+Pj4+IFdlbGwsIEkgY2FuIHN3aXRjaCB0byAoc2l6ZV90KWNv
dW50IGlmIHRoaXMgaXMgbGlrZWQgYmV0dGVyCj4+Pj4+IG92ZXJhbGwuCj4+Pj4KPj4+PiBQZXJz
b25hbGx5LCBJJ2QgcHJlZmVyIHRoaXMgb3B0aW9uIG1vc3Qgb2YgYWxsLgo+Pj4KPj4+IE9rYXks
IEkndmUgc3dpdGNoZWQgdG8gdGhpcywgYnV0IHdoaWxlIGRvaW5nIHNvIEkgc3RhcnRlZCB3b25k
ZXJpbmcKPj4+IHdoeSB3ZSdkIHRoZW4gbm90IHVzZQo+Pj4KPj4+ICAgICAgICAgICBrY291bnQg
PSBtaW4oY291bnQsICh1bnNpZ25lZCBpbnQpc2l6ZW9mKGtidWYpIC0gMSk7Cj4+Pgo+Pj4gd2hp
Y2ggaXMgYW4gKG9mdGVuIHNsaWdodGx5IGNoZWFwZXIpIDMyLWJpdCBvcGVyYXRpb24gKGFuZCB3
aGljaAo+Pj4gaXMgd2hhdCBJIGhhZCBhY3R1YWxseSBzdGFydGVkIGZyb20pLgo+Pgo+PiBXaGls
ZSBtb2RpZnlpbmcgZ3Vlc3RfY29uc29sZV93cml0ZSgpLCB3b3VsZCB5b3UgbWluZCB3cml0aW5n
IGEgJ1wwJwo+PiB0byBrYnVmW2tjb3VudF0/IFRoZXJlIGlzIGEgImNvbnJpbmdfcHV0cyhrYnVm
KTsiIGxhdGVyIGluIHRoaXMKPj4gZnVuY3Rpb24gd2hpY2ggd291bGQgbGlrZSBhIDAgdGVybWlu
YXRlZCBzdHJpbmcgYXMgaW5wdXQuCj4gCj4gVGhhdCdzIG5vdCB0aGUgcmlnaHQgY2hhbmdlIGZv
ciB0aGlzIHByb2JsZW0sIEkgdGhpbmsuIE5vdyB0aGF0Cj4gd2Ugc3VwcG9ydCBlbWJlZGRlZCBu
dWwgY2hhcmFjdGVycywgYSBjb3VudCBzaG91bGQgYmUgcGFzc2VkCj4gaW5zdGVhZC4gSnVsaWVu
Pwo+IAo+IEkgYWxzbyB3b3VsZG4ndCB3YW50IHRvIG1lcmdlIHRoaXMgaW50byB0aGlzIHBhdGNo
OyBJJ20gaGFwcHkgdG8KPiBzZW5kIGEgc2VwYXJhdGUgb25lLgoKWWVhaCwgSSBub3cgcmVhbGl6
ZWQgdGhhdCBpdCBpcyBlYXN5IHRvIGp1c3QgYWRkIGEgY291bnQgcGFyYW1ldGVyIHRvCmNvbnJp
bmdfcHV0cygpIGFzIGl0IGlzIGNhbGxlZCBvbmx5IHR3aWNlIGFuZCBjb3VudCBpcyBhbHJlYWR5
IGtub3duCmF0IHRoZSBjYWxsc2l0ZXMuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
