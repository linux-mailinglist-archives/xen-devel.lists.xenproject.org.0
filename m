Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EDC302D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEQM-0005nD-Ve; Tue, 01 Oct 2019 09:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEQL-0005mw-Te
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:26:25 +0000
X-Inumbo-ID: 88f8ecda-e42d-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 88f8ecda-e42d-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 09:26:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 166941000;
 Tue,  1 Oct 2019 02:26:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142E23F739;
 Tue,  1 Oct 2019 02:26:21 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
 <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
 <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
 <3c901636-732f-446e-8a64-94149939d175@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a00e52df-6475-31a8-bfac-844de29b9c72@arm.com>
Date: Tue, 1 Oct 2019 10:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3c901636-732f-446e-8a64-94149939d175@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDEvMTAvMjAxOSAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEu
MTAuMjAxOSAxMToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAwMS8xMC8yMDE5IDAwOjIx
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMzAvMDkvMjAxOSAyMToxNywgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+Pj4+IE15IHdvcnJ5IGlzIHRoaXMgZ2F0ZSBjb25maWcgZ2F0ZSBub3RoaW5n
IG9uIEFybSBzbyB0aGUgdXNlciBtYXkgaGF2ZQo+Pj4+IGEgZmFsc2Ugc2Vuc2UgdGhhdCBpdCBj
YW4gYmUgdXNlZCAoZXZlbiB0aG91Z2ggaXQgaXMgY2xlYXJseSBCUk9LRU4pLgo+Pj4+Cj4+Pj4g
QWxzbyB0aGUgbmFtZSBpcyBxdWl0ZSBjbG9zZSB0byB0aGUgQ09ORklHX0hBUkRFTl9QUkVESUNU
T1Igb24gQXJtIGFuZAo+Pj4+IG1heSBjb25mdXNlIHVzZXIuIEFsdGhvdWdoLCBJIGRvbid0IGhh
dmUgYSBiZXR0ZXIgbmFtZSBzbyBmYXIgOi8KPj4+Cj4+PiBUaGUgImRlcGVuZHMgb24gQlJPS0VO
IiBtZWFucyBpdCB3aWxsIG5ldmVyIHNob3cgdXAgdG8gYSB1c2VyIGluCj4+PiBtZW51Y29uZmln
LCB3aGljaCBpcyB3aHkgaXQgd2FzIG9ubHkgQ0MgdG8geDg2LCBhbmQgbm90IHRvIHJlc3QuCj4+
Cj4+IFdoYXQncyB0aGUgbG9uZyB0ZXJtIHBsYW4gZm9yIHRoaXMgb3B0aW9uPyBBcmUgeW91IHBs
YW5uaW5nIHRvIHJlbW92ZSBpdAo+PiBjb21wbGV0ZWx5IG9yIGp1c3QgdGhlIGRlcGVuZGVuY2ll
cyBvbiBCUk9LRU4/Cj4+Cj4+IE15IGNvbmNlcm4gaXMgaWYgdGhpcyBvcHRpb24gd2lsbCBldmVy
IGJlY29tZSBzZWxlY3RhYmxlIHRoZW4gaXQgd2lsbCBub3QgZG9pbmcKPj4gd2hhdCdzIGV4cGVj
dGVkIG9uIEFybS4KPj4KPj4gU28sIGV2ZW4gaWYgaW4gcHJpbmNpcGxlIGl0IGlzIGFyY2ggYWdu
b3N0aWMsIGl0IGZlZWxzIHRvIG1lIHRoaXMgb3B0aW9uIHNob3VsZAo+PiBiZXR0ZXIgYmUgaW1w
bGVtZW50ZWQgaW4geDg2L0tjb25maWcuCj4gCj4gSSBkb24ndCB0aGluayBzbywgbm8uIFdoZW4g
QlJPS0VOIGlzIHRvIGJlIHJlbW92ZWQsIGl0IG91Z2h0IHRvIGJlCj4gcmVwbGFjZWQgYnkgYSBz
dWl0YWJsZSAiZGVwZW5kcyBvbiBIQVZFXyoiLCB3aGljaCBBcm0gY291bGQgY2hvb3NlCj4gdG8g
bm90IHNlbGVjdC4KClNvIHRoZXJlIGFyZSBhbiBleHBlY3RhdGlvbiB0aGlzIG9wdGlvbiB3aWxs
IGJlIHVzZWQgYnkgY29tbW9uIGNvZGUgaW4gdGhlIGZ1dHVyZT8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
