Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E180163F3F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 09:32:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Kjo-0001k6-VC; Wed, 19 Feb 2020 08:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Kjn-0001k1-Fs
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 08:29:43 +0000
X-Inumbo-ID: fa1684b2-52f1-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa1684b2-52f1-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 08:29:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15EADAD46;
 Wed, 19 Feb 2020 08:29:42 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1617641-2106-cd81-628f-569b1a8cf1f7@suse.com>
Date: Wed, 19 Feb 2020 09:29:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/ioperm: add new paravirt function
 update_io_bitmap
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAwNjozNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOC4wMi4yMCAy
MjowMywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyaXRlczoKPj4+IENvbW1pdCAxMTFlN2IxNWNmMTBmNiAoIng4Ni9pb3Blcm06IEV4
dGVuZCBJT1BMIGNvbmZpZyB0byBjb250cm9sCj4+PiBpb3Blcm0oKSBhcyB3ZWxsIikgcmV3b3Jr
ZWQgdGhlIGlvcGwgc3lzY2FsbCB0byB1c2UgSS9PIGJpdG1hcHMuCj4+Pgo+Pj4gVW5mb3J0dW5h
dGVseSB0aGlzIGJyb2tlIFhlbiBQViBkb21haW5zIHVzaW5nIHRoYXQgc3lzY2FsbCBhcyB0aGVy
ZQo+Pj4gaXMgY3VycmVudGx5IG5vIEkvTyBiaXRtYXAgc3VwcG9ydCBpbiBQViBkb21haW5zLgo+
Pj4KPj4+IEFkZCBJL08gYml0bWFwIHN1cHBvcnQgdmlhIGEgbmV3IHBhcmF2aXJ0IGZ1bmN0aW9u
IHVwZGF0ZV9pb19iaXRtYXAKPj4+IHdoaWNoIFhlbiBQViBkb21haW5zIGNhbiB1c2UgdG8gdXBk
YXRlIHRoZWlyIEkvTyBiaXRtYXBzIHZpYSBhCj4+PiBoeXBlcmNhbGwuCj4+Pgo+Pj4gRml4ZXM6
IDExMWU3YjE1Y2YxMGY2ICgieDg2L2lvcGVybTogRXh0ZW5kIElPUEwgY29uZmlnIHRvIGNvbnRy
b2wgaW9wZXJtKCkgYXMgd2VsbCIpCj4+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuNQo+Pj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFRlc3RlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBEdWgsIHNvcnJ5IGFib3V0IHRoYXQg
YW5kIHRoYW5rcyBmb3IgZml4aW5nIGl0Lgo+Pgo+PiBCVFcsIHdoeSBpc24ndCBzdHVmZiBsaWtl
IHRoaXMgbm90IGNhdGNoZWQgZHVyaW5nIG5leHQgb3IgYXQgbGVhc3QKPj4gYmVmb3JlIHRoZSBm
aW5hbCByZWxlYXNlPyBJcyBub3RoaW5nIHJ1bm5pbmcgQ0kgb24gdXBzdHJlYW0gd2l0aCBhbGwK
Pj4gdGhhdCBYRU4gbXVjayBhY3RpdmU/Cj4gCj4gVGhpcyBwcm9ibGVtIHNob3dlZCB1cCBieSBu
b3QgYmVpbmcgYWJsZSB0byBzdGFydCB0aGUgWCBzZXJ2ZXIgKHByb2JhYmx5Cj4gbm90IHRoZSBm
cmVzaGVzdCBvbmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCgpOb3Qg
dGhlIGZyZXNoZXN0IG9uZSwgeWVzLCBidXQgYWxzbyBvbiBhIHN5c3RlbSB3aGVyZSBLTVMgd291
bGQgbm90CmJlIGF2YWlsYWJsZSAobXkgc3VjY2VzcyByYXRlIHdpdGggS01TIGlzIHJhdGhlciBs
b3cgb3ZlcmFsbCwgYW5kCndpdGggbmV3ZXIgTGludXggSSBzZWUgcmF0aGVyIG1vcmUgc3lzdGVt
cyB0byBzdG9wIHdvcmtpbmcgdGhhbiBvbmVzCnRvIGJlY29tZSB3b3JraW5nLCBidXQgSSBzaW1w
bHkgZG9uJ3QgaGF2ZSB0aGUgdGltZSB0byBpbnZlc3RpZ2F0ZSkuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
