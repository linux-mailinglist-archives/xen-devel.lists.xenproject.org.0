Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7031182EF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:00:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iebKW-0007Iz-8X; Tue, 10 Dec 2019 08:57:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iebKU-0007Is-RA
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:57:14 +0000
X-Inumbo-ID: 0df46994-1b2b-11ea-8908-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0df46994-1b2b-11ea-8908-12813bfff9fa;
 Tue, 10 Dec 2019 08:57:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5E08B361;
 Tue, 10 Dec 2019 08:57:11 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
Date: Tue, 10 Dec 2019 09:57:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAwOToxMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMC4xMi4xOSAw
OTowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEwLjEyLjIwMTkgMDg6MTYsIFRpYW4sIEtl
dmluIHdyb3RlOgo+Pj4gV2hpbGUgdGhlIHF1YXJhbnRpbmUgaWRlYSBzb3VuZHMgZ29vZCBvdmVy
YWxsLCBJJ20gc3RpbGwgbm90IGNvbnZpbmNlZAo+Pj4gdG8gaGF2ZSBpdCB0aGUgb25seSB3YXkg
aW4gcGxhY2UganVzdCBmb3IgaGFuZGxpbmcgc29tZSBrbm93bi1idWdneQo+Pj4gZGV2aWNlLiBJ
dCBraWxscyB0aGUgcG9zc2liaWxpdHkgb2YgaWRlbnRpZnlpbmcgYSBuZXcgYnVnZ3kgZGV2aWNl
IGFuZCB0aGVuCj4+PiBkZWNpZGluZyBub3QgdG8gdXNlIGl0IGluIHRoZSBmaXJzdCBzcGFjZS4u
LiBJIHRob3VnaHQgYWJvdXQgd2hldGhlciBpdAo+Pj4gd2lsbCBnZXQgYmV0dGVyIHdoZW4gZnV0
dXJlIElPTU1VIGltcGxlbWVudHMgQS9EIGJpdCAtIGJ5IGNoZWNraW5nCj4+PiBhY2Nlc3MgYml0
IGJlaW5nIHNldCB0aGVuIHdlJ2xsIGtub3cgc29tZSBidWdneSBkZXZpY2UgZXhpc3RzLCBidXQs
Cj4+PiB0aGUgc2NyYXRjaCBwYWdlIGlzIHNoYXJlZCBieSBhbGwgZGV2aWNlcyB0aGVuIHdlIGNh
bm5vdCByZWx5IG9uIHRoaXMKPj4+IGZlYXR1cmUgdG8gZmluZCBvdXQgdGhlIGFjdHVhbCBidWdn
eSBvbmUuCj4+Cj4+IFRoaW5raW5nIGFib3V0IGl0IC0geWVzLCBJIHRoaW5rIEkgYWdyZWUuIFRo
aXMgKGFzIHdpdGggc28gbWFueQo+PiB3b3JrYXJvdW5kcykgd291bGQgYmV0dGVyIGJlIGFuIG9m
Zi1ieS1kZWZhdWx0IG9uZS4gVGhlIG1haW4gaXNzdWUKPj4gSSB1bmRlcnN0YW5kIHRoaXMgd291
bGQgaGF2ZSBpcyB0aGF0IGJ1Z2d5IHN5c3RlbXMgdGhlbiBtaWdodCBoYW5nCj4+IHdpdGhvdXQg
ZXZlbiBoYXZpbmcgbWFuYWdlZCB0byBnZXQgYSBsb2cgbWVzc2FnZSBvdXQgLSBQYXVsPwo+Pgo+
PiBKw7xyZ2VuIC0gd291bGQgeW91IGJlIGFtZW5hYmxlIHRvIGFuIGFsbW9zdCBsYXN0IG1pbnV0
ZSByZWZpbmVtZW50Cj4+IGhlcmUgKHdvdWxkIHRoZW4gYWxzbyBuZWVkIHRvIHN0aWxsIGJlIGJh
Y2twb3J0ZWQgdG8gNC4xMi4yLCBvcgo+PiB0aGUgb3JpZ2luYWwgYmFja3BvcnQgcmV2ZXJ0ZWQs
IHRvIGF2b2lkIGdpdmluZyB0aGUgaW1wcmVzc2lvbiBvZgo+PiBhIHJlZ3Jlc3Npb24pPwo+IAo+
IFNvIHdoYXQgaXMgeW91ciBzdWdnZXN0aW9uIGhlcmU/IFRvIGhhdmUgYSBib290IG9wdGlvbiAo
ZGVmYXVsdGluZyB0bwo+IG9mZikgZm9yIGVuYWJsaW5nIHRoZSBzY3JhdGNoIHBhZ2U/CgpZZXMg
KGFuZCBkZXNwaXRlIGhhdmluZyBzZWVuIFBhdWwncyByZXBseSkuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
