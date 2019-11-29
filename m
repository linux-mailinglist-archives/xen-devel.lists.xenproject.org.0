Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB810D635
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:41:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagSu-0003yR-2e; Fri, 29 Nov 2019 13:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iagSs-0003yM-FJ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:37:42 +0000
X-Inumbo-ID: 6a0eeae6-12ad-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a0eeae6-12ad-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 13:37:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04D49ADF0;
 Fri, 29 Nov 2019 13:37:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
 <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
 <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8b7db8ee-8dc8-0390-0d44-f12de573e81a@suse.com>
Date: Fri, 29 Nov 2019 14:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjExLjIwMTkgMTM6
MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI5LzExLzIwMTkgMTI6MTksIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjkuMTEuMjAxOSAxMzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAyOS8xMS8yMDE5IDEyOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjku
MTEuMjAxOSAxMzowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+Pj4+PiBKYW4gQmV1bGljaCB3cml0
ZXMgKCJSZTogW1BBVENIXSBjb25zb2xlOiBhdm9pZCBidWZmZXIgb3ZlcmZsb3cgaW4gZ3Vlc3Rf
Y29uc29sZV93cml0ZSgpIik6Cj4+Pj4+Pj4gT24gMjkuMTEuMjAxOSAxMToyMiwgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+Pj4+Pj4gSXMgc2l6ZW9mKGFycmF5WzBdKSBhbHdheXMgMCwgb3IgaXMg
dGhpcyBqdXN0IGEgR0NDLWlzbSA/wqAgR29kYm9sdAo+Pj4+Pj4+PiBzdWdnZXN0cyBpcyAwIG9u
IGFsbCBjb21waWxlciB3ZSBzdXBwb3J0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBFaXRoZXIgd2F5LCBp
c24ndCB0aGUgbW9yZSBjb21tb24gaWRpb20gKyAwdWwgP8KgIFBlcnNvbmFsbHksIEkgZmVlbCB0
aGF0Cj4+Pj4+Pj4+IGlzIGNsZWFyZXIgdG8gZm9sbG93Lgo+Pj4+Pj4+IEkgZGVjaWRlZCBhZ2Fp
bnN0ICsgMHVsIG9yIGFsaWtlIGJlY2F1c2UgaW4gcHJpbmNpcGxlIHNpemVfdAo+Pj4+Pj4+IGFu
ZCB1bnNpZ25lZCBsb25nIGFyZSBkaWZmZXJlbnQgdHlwZXMuIEluIHBhcnRpY3VsYXIgMzItYml0
Cj4+Pj4+Pj4geDg2IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQgaGVuY2Ug
bWluKCkncwo+Pj4+Pj4+IHR5cGUgc2FmZXR5IGNoZWNrIHdvdWxkIGNhdXNlIHRoZSBidWlsZCB0
byBmYWlsIHRoZXJlLiBUaGUKPj4+Pj4+PiBzYW1lIHJpc2sgb2J2aW91c2x5IGV4aXN0cyBmb3Ig
YW55IDMyLWJpdCBhcmNoIChlLmcuIEFybTMyLAo+Pj4+Pj4+IGJ1dCBJIGhhdmVuJ3QgY2hlY2tl
ZCB3aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCj4+Pj4+PiBJIGRvbid0IGtub3cgd2hhdCBp
IHdyb25nIHdpdGgKPj4+Pj4+ICAgICAoc2l6ZV90KTAKPj4+Pj4+IHdoaWNoIGlzIHNob3J0ZXIs
IGV2ZW4gIQo+Pj4+PiBUcnVlLiBZZXQgaXQgY29udGFpbnMgYSBjYXN0LCBubyBtYXR0ZXIgaG93
IHJpc2stZnJlZSBpdCBtYXkgYmUKPj4+Pj4gaW4gdGhpcyBjYXNlLiBXaXRoIGEgY2FzdCwgSSBj
b3VsZCBhcyB3ZWxsIGhhdmUgd3JpdHRlbiAoeWV0Cj4+Pj4+IHNob3J0ZXIpIChzaXplX3QpY291
bnQuCj4+Pj4gR2l2ZW4gdGhhdCBtaW4oKSBoYXMgYSB2ZXJ5IHN0cmljdCB0eXBlY2hlY2ssIEkg
dGhpbmsgd2Ugc2hvdWxkIHBlcm1pdAo+Pj4+IGFueSB1c2Ugb2YgYW4gZXhwbGljaXQgY2FzdCBp
biBhIHNpbmdsZSBvcGVyYW5kLCBiZWNhdXNlIGl0ICppcyogc2FmZXIKPj4+PiB0aGFuIHN3aXRj
aGluZyB0byB0aGUgbWluX3QoKSByb3V0ZSB0byBtYWtlIHRoaW5ncyBjb21waWxlLgo+Pj4gV2Vs
bCwgSSBjYW4gc3dpdGNoIHRvIChzaXplX3QpY291bnQgaWYgdGhpcyBpcyBsaWtlZCBiZXR0ZXIK
Pj4+IG92ZXJhbGwuCj4+Cj4+IFBlcnNvbmFsbHksIEknZCBwcmVmZXIgdGhpcyBvcHRpb24gbW9z
dCBvZiBhbGwuCj4gCj4gT2theSwgSSd2ZSBzd2l0Y2hlZCB0byB0aGlzLCBidXQgd2hpbGUgZG9p
bmcgc28gSSBzdGFydGVkIHdvbmRlcmluZwo+IHdoeSB3ZSdkIHRoZW4gbm90IHVzZQo+IAo+ICAg
ICAgICAgIGtjb3VudCA9IG1pbihjb3VudCwgKHVuc2lnbmVkIGludClzaXplb2Yoa2J1ZikgLSAx
KTsKPiAKPiB3aGljaCBpcyBhbiAob2Z0ZW4gc2xpZ2h0bHkgY2hlYXBlcikgMzItYml0IG9wZXJh
dGlvbiAoYW5kIHdoaWNoCj4gaXMgd2hhdCBJIGhhZCBhY3R1YWxseSBzdGFydGVkIGZyb20pLgoK
V2hpbGUgbW9kaWZ5aW5nIGd1ZXN0X2NvbnNvbGVfd3JpdGUoKSwgd291bGQgeW91IG1pbmQgd3Jp
dGluZyBhICdcMCcKdG8ga2J1ZltrY291bnRdPyBUaGVyZSBpcyBhICJjb25yaW5nX3B1dHMoa2J1
Zik7IiBsYXRlciBpbiB0aGlzCmZ1bmN0aW9uIHdoaWNoIHdvdWxkIGxpa2UgYSAwIHRlcm1pbmF0
ZWQgc3RyaW5nIGFzIGlucHV0LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
