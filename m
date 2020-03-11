Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494911816EB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 12:36:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBzcF-0000ng-FV; Wed, 11 Mar 2020 11:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBzcD-0000nZ-6Z
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 11:33:33 +0000
X-Inumbo-ID: 22cfeea2-638c-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22cfeea2-638c-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 11:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 46B49B276;
 Wed, 11 Mar 2020 11:33:31 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
 <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
 <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
 <55ec66ca-f3ba-a209-695d-4867d0c20429@suse.com>
 <b2c0acaa-ca9c-a0f1-7700-66fd25531d4f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0c30b74-4d7a-452d-84ce-2aa9c3be7ab5@suse.com>
Date: Wed, 11 Mar 2020 12:33:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b2c0acaa-ca9c-a0f1-7700-66fd25531d4f@suse.com>
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

T24gMTEuMDMuMjAyMCAxMDo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMS4wMy4yMCAx
MDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjAzLjIwMjAgMTA6MjcsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMS4wMy4yMCAxMDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTEuMDMuMjAyMCAwNzowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMTAu
MDMuMjAgMTg6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDMuMjAyMCAwODoy
OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+Pj4+Pj4+IEBAIC01ODcsNyArNTg3LDcgQEAgc3Rh
dGljIHZvaWQgYW1kX2R1bXBfcDJtX3RhYmxlX2xldmVsKHN0cnVjdCBwYWdlX2luZm8qIHBnLCBp
bnQgbGV2ZWwsCj4+Pj4+Pj4gICAgICAgICAgICAgc3RydWN0IGFtZF9pb21tdV9wdGUgKnBkZSA9
ICZ0YWJsZV92YWRkcltpbmRleF07Cj4+Pj4+Pj4gICAgIAo+Pj4+Pj4+ICAgICAgICAgICAgIGlm
ICggIShpbmRleCAlIDIpICkKPj4+Pj4+PiAtICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCk7Cj4+Pj4+Pj4gKyAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19u
b3JjdSgpOwo+Pj4+Pj4KPj4+Pj4+IEF0IHRoZSBleGFtcGxlIG9mIHRoaXMgLSB0aGUgcHJvcGVy
dHkgb2YgaG9sZGluZyBhbiBSQ1UgbG9jayBpcwo+Pj4+Pj4gZW50aXJlbHkgaW52aXNpYmxlIGhl
cmUsIGFzIGl0J3MgdGhlIGdlbmVyaWMKPj4+Pj4+IGlvbW11X2R1bXBfcDJtX3RhYmxlKCkgd2hp
Y2ggYWNxdWlyZXMgaXQuIFRoaXMgc3VnZ2VzdCB0byBtZSB0aGF0Cj4+Pj4+PiBnb2luZyBmb3J3
YXJkIGJyZWFraW5nIHRoaXMgaXMgZ29pbmcgdG8gYmUgdmVyeSBsaWtlbHkuIENvdWxkbid0Cj4+
Pj4+PiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSBleGNsdWRlIFJDVSBoYW5kbGluZyB3aGVu
IGZpbmRpbmcKPj4+Pj4+IHByZWVtcHRfY291bnQoKSB0byByZXR1cm4gbm9uLXplcm8/Cj4+Pj4+
Cj4+Pj4+IFRoaXMgY2FuIGJlIGRvbmUsIGJ1dCB0aGVuIHRoZSBub24tZGVidWcgYnVpbGQgd291
bGQgcmVxdWlyZSB0byBoYXZlCj4+Pj4+IG5vbi1lbXB0eSByY3UgbG9jayBmdW5jdGlvbnMuCj4+
Pj4KPj4+PiBJIGd1ZXNzIEkgZG9uJ3QgdW5kZXJzdGFuZCAtIEkgc2VlIG9ubHkgb25lIHZlcnNp
b24gb2YgdGhlbToKPj4+Pgo+Pj4+ICNkZWZpbmUgcmN1X3JlYWRfbG9jayh4KSAgICAgICAoeyAo
KHZvaWQpKHgpKTsgcHJlZW1wdF9kaXNhYmxlKCk7IH0pCj4+Pj4gI2RlZmluZSByY3VfcmVhZF91
bmxvY2soeCkgICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2VuYWJsZSgpOyB9KQo+Pj4+Cj4+
Pj4gU2FtZSBmb3IgdGhlIHByZWVtcHQgY291bnQgYWRqdXN0bWVudCBvcGVyYXRpb25zLgo+Pj4K
Pj4+IFNlZSBwYXRjaCA1Lgo+Pgo+PiBXaGljaCBJIGhhdmVuJ3QgbG9va2VkIGF0IHlldCwgYW5k
IHdoaWNoIEkgYWxzbyBzaG91bGRuJ3QgbmVlZCB0bwo+PiBsb29rIGF0IHRvIHVuZGVyc3RhbmQg
dGhlIHBhdGNoIGhlcmUuIElmIHRoaXMgaXMgYSBwcmVwYXJhdG9yeQo+PiBjaGFuZ2UgcmF0aGVy
IHRoYW4gc29tZSBmb3JtIG9mIGZpeCBvciBpbXByb3ZlbWVudCwgdGhlbiB0aGUKPj4gZGVzY3Jp
cHRpb24gc2hvdWxkIHNheSBzby4KPiAKPiBUaGlzIHdhcyBqdXN0IG1lYW50IGFzIGFuIGFuc3dl
ciB0byB5b3VyIHF1ZXN0aW9uIHJlZ2FyZGluZyBjb25zaWRlcmluZwo+IHByZWVtcHRfY291bnQo
KS4gSnVzdCBjaGFuZ2luZyB0aGlzIHBhdGNoIGhlcmUgYW5kIHRoZW4gdW5kb2luZyB0aGUKPiBj
aGFuZ2UgYWdhaW4gaW4gcGF0Y2ggNSBpcyBubyBvcHRpb24gSU1PLCBzbyBJIGdhdmUgYSBoaW50
IHdoeSB1c2luZwo+IHByZWVtcHRfY291bnQoKSBtaWdodCBiZSBhIGJhZCBpZGVhLgoKSSd2ZSBi
cmllZmx5IGxvb2tlZCBhdCBwYXRjaCA1LCBhbmQgSSBkb24ndCBzZWUgd2h5IHRoZSBjb3VudGVy
IHlvdQppbnRyb2R1Y2UgdGhlcmUgY291bGRuJ3QgYWxzbyBiZSBtYWludGFpbmVkIGluIG5vbi1k
ZWJ1ZyBidWlsZHMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
