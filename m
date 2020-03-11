Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3D181547
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:50:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxxh-0007SD-W9; Wed, 11 Mar 2020 09:47:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBxxg-0007S8-9w
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:47:36 +0000
X-Inumbo-ID: 55b49c0a-637d-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55b49c0a-637d-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 09:47:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3DCBCAAC2;
 Wed, 11 Mar 2020 09:47:34 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
 <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
 <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
 <55ec66ca-f3ba-a209-695d-4867d0c20429@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b2c0acaa-ca9c-a0f1-7700-66fd25531d4f@suse.com>
Date: Wed, 11 Mar 2020 10:47:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <55ec66ca-f3ba-a209-695d-4867d0c20429@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMTA6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAzLjIwMjAgMTA6
MjcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDExLjAzLjIwIDEwOjI1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjAzLjIwMjAgMDc6MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMTAuMDMuMjAgMTg6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wMy4y
MDIwIDA4OjI4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+Pj4+Pj4gQEAgLTU4Nyw3ICs1ODcsNyBA
QCBzdGF0aWMgdm9pZCBhbWRfZHVtcF9wMm1fdGFibGVfbGV2ZWwoc3RydWN0IHBhZ2VfaW5mbyog
cGcsIGludCBsZXZlbCwKPj4+Pj4+ICAgICAgICAgICAgIHN0cnVjdCBhbWRfaW9tbXVfcHRlICpw
ZGUgPSAmdGFibGVfdmFkZHJbaW5kZXhdOwo+Pj4+Pj4gICAgIAo+Pj4+Pj4gICAgICAgICAgICAg
aWYgKCAhKGluZGV4ICUgMikgKQo+Pj4+Pj4gLSAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19z
b2Z0aXJxcygpOwo+Pj4+Pj4gKyAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19u
b3JjdSgpOwo+Pj4+Pgo+Pj4+PiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzIC0gdGhlIHByb3BlcnR5
IG9mIGhvbGRpbmcgYW4gUkNVIGxvY2sgaXMKPj4+Pj4gZW50aXJlbHkgaW52aXNpYmxlIGhlcmUs
IGFzIGl0J3MgdGhlIGdlbmVyaWMKPj4+Pj4gaW9tbXVfZHVtcF9wMm1fdGFibGUoKSB3aGljaCBh
Y3F1aXJlcyBpdC4gVGhpcyBzdWdnZXN0IHRvIG1lIHRoYXQKPj4+Pj4gZ29pbmcgZm9yd2FyZCBi
cmVha2luZyB0aGlzIGlzIGdvaW5nIHRvIGJlIHZlcnkgbGlrZWx5LiBDb3VsZG4ndAo+Pj4+PiBw
cm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSBleGNsdWRlIFJDVSBoYW5kbGluZyB3aGVuIGZpbmRp
bmcKPj4+Pj4gcHJlZW1wdF9jb3VudCgpIHRvIHJldHVybiBub24temVybz8KPj4+Pgo+Pj4+IFRo
aXMgY2FuIGJlIGRvbmUsIGJ1dCB0aGVuIHRoZSBub24tZGVidWcgYnVpbGQgd291bGQgcmVxdWly
ZSB0byBoYXZlCj4+Pj4gbm9uLWVtcHR5IHJjdSBsb2NrIGZ1bmN0aW9ucy4KPj4+Cj4+PiBJIGd1
ZXNzIEkgZG9uJ3QgdW5kZXJzdGFuZCAtIEkgc2VlIG9ubHkgb25lIHZlcnNpb24gb2YgdGhlbToK
Pj4+Cj4+PiAjZGVmaW5lIHJjdV9yZWFkX2xvY2soeCkgICAgICAgKHsgKCh2b2lkKSh4KSk7IHBy
ZWVtcHRfZGlzYWJsZSgpOyB9KQo+Pj4gI2RlZmluZSByY3VfcmVhZF91bmxvY2soeCkgICAgICh7
ICgodm9pZCkoeCkpOyBwcmVlbXB0X2VuYWJsZSgpOyB9KQo+Pj4KPj4+IFNhbWUgZm9yIHRoZSBw
cmVlbXB0IGNvdW50IGFkanVzdG1lbnQgb3BlcmF0aW9ucy4KPj4KPj4gU2VlIHBhdGNoIDUuCj4g
Cj4gV2hpY2ggSSBoYXZlbid0IGxvb2tlZCBhdCB5ZXQsIGFuZCB3aGljaCBJIGFsc28gc2hvdWxk
bid0IG5lZWQgdG8KPiBsb29rIGF0IHRvIHVuZGVyc3RhbmQgdGhlIHBhdGNoIGhlcmUuIElmIHRo
aXMgaXMgYSBwcmVwYXJhdG9yeQo+IGNoYW5nZSByYXRoZXIgdGhhbiBzb21lIGZvcm0gb2YgZml4
IG9yIGltcHJvdmVtZW50LCB0aGVuIHRoZQo+IGRlc2NyaXB0aW9uIHNob3VsZCBzYXkgc28uCgpU
aGlzIHdhcyBqdXN0IG1lYW50IGFzIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uIHJlZ2FyZGlu
ZyBjb25zaWRlcmluZwpwcmVlbXB0X2NvdW50KCkuIEp1c3QgY2hhbmdpbmcgdGhpcyBwYXRjaCBo
ZXJlIGFuZCB0aGVuIHVuZG9pbmcgdGhlCmNoYW5nZSBhZ2FpbiBpbiBwYXRjaCA1IGlzIG5vIG9w
dGlvbiBJTU8sIHNvIEkgZ2F2ZSBhIGhpbnQgd2h5IHVzaW5nCnByZWVtcHRfY291bnQoKSBtaWdo
dCBiZSBhIGJhZCBpZGVhLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
