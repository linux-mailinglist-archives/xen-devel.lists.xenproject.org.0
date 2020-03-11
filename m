Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637BE18151A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:39:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxmZ-0006Ja-KB; Wed, 11 Mar 2020 09:36:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBxmX-0006JV-Dg
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:36:05 +0000
X-Inumbo-ID: ba3ee5b0-637b-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba3ee5b0-637b-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 09:36:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D774AB3D;
 Wed, 11 Mar 2020 09:36:03 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
 <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
 <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <55ec66ca-f3ba-a209-695d-4867d0c20429@suse.com>
Date: Wed, 11 Mar 2020 10:36:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxMDoyNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMS4wMy4yMCAx
MDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjAzLjIwMjAgMDc6MDcsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMC4wMy4yMCAxODowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTAuMDMuMjAyMCAwODoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+Pj4+PiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4+Pj4+IEBAIC01ODcs
NyArNTg3LDcgQEAgc3RhdGljIHZvaWQgYW1kX2R1bXBfcDJtX3RhYmxlX2xldmVsKHN0cnVjdCBw
YWdlX2luZm8qIHBnLCBpbnQgbGV2ZWwsCj4+Pj4+ICAgICAgICAgICAgc3RydWN0IGFtZF9pb21t
dV9wdGUgKnBkZSA9ICZ0YWJsZV92YWRkcltpbmRleF07Cj4+Pj4+ICAgIAo+Pj4+PiAgICAgICAg
ICAgIGlmICggIShpbmRleCAlIDIpICkKPj4+Pj4gLSAgICAgICAgICAgIHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcygpOwo+Pj4+PiArICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFz
X25vcmN1KCk7Cj4+Pj4KPj4+PiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzIC0gdGhlIHByb3BlcnR5
IG9mIGhvbGRpbmcgYW4gUkNVIGxvY2sgaXMKPj4+PiBlbnRpcmVseSBpbnZpc2libGUgaGVyZSwg
YXMgaXQncyB0aGUgZ2VuZXJpYwo+Pj4+IGlvbW11X2R1bXBfcDJtX3RhYmxlKCkgd2hpY2ggYWNx
dWlyZXMgaXQuIFRoaXMgc3VnZ2VzdCB0byBtZSB0aGF0Cj4+Pj4gZ29pbmcgZm9yd2FyZCBicmVh
a2luZyB0aGlzIGlzIGdvaW5nIHRvIGJlIHZlcnkgbGlrZWx5LiBDb3VsZG4ndAo+Pj4+IHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpIGV4Y2x1ZGUgUkNVIGhhbmRsaW5nIHdoZW4gZmluZGluZwo+
Pj4+IHByZWVtcHRfY291bnQoKSB0byByZXR1cm4gbm9uLXplcm8/Cj4+Pgo+Pj4gVGhpcyBjYW4g
YmUgZG9uZSwgYnV0IHRoZW4gdGhlIG5vbi1kZWJ1ZyBidWlsZCB3b3VsZCByZXF1aXJlIHRvIGhh
dmUKPj4+IG5vbi1lbXB0eSByY3UgbG9jayBmdW5jdGlvbnMuCj4+Cj4+IEkgZ3Vlc3MgSSBkb24n
dCB1bmRlcnN0YW5kIC0gSSBzZWUgb25seSBvbmUgdmVyc2lvbiBvZiB0aGVtOgo+Pgo+PiAjZGVm
aW5lIHJjdV9yZWFkX2xvY2soeCkgICAgICAgKHsgKCh2b2lkKSh4KSk7IHByZWVtcHRfZGlzYWJs
ZSgpOyB9KQo+PiAjZGVmaW5lIHJjdV9yZWFkX3VubG9jayh4KSAgICAgKHsgKCh2b2lkKSh4KSk7
IHByZWVtcHRfZW5hYmxlKCk7IH0pCj4+Cj4+IFNhbWUgZm9yIHRoZSBwcmVlbXB0IGNvdW50IGFk
anVzdG1lbnQgb3BlcmF0aW9ucy4KPiAKPiBTZWUgcGF0Y2ggNS4KCldoaWNoIEkgaGF2ZW4ndCBs
b29rZWQgYXQgeWV0LCBhbmQgd2hpY2ggSSBhbHNvIHNob3VsZG4ndCBuZWVkIHRvCmxvb2sgYXQg
dG8gdW5kZXJzdGFuZCB0aGUgcGF0Y2ggaGVyZS4gSWYgdGhpcyBpcyBhIHByZXBhcmF0b3J5CmNo
YW5nZSByYXRoZXIgdGhhbiBzb21lIGZvcm0gb2YgZml4IG9yIGltcHJvdmVtZW50LCB0aGVuIHRo
ZQpkZXNjcmlwdGlvbiBzaG91bGQgc2F5IHNvLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
