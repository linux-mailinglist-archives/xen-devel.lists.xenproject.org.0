Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88911E562
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:14:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflfM-0002jd-9N; Fri, 13 Dec 2019 14:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iflfL-0002jY-K2
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:11:35 +0000
X-Inumbo-ID: 7280c770-1db2-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7280c770-1db2-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 14:11:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84568AD00;
 Fri, 13 Dec 2019 14:11:24 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
Date: Fri, 13 Dec 2019 15:11:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDo0NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
NDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTQ6MzEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBNYXliZSBJIGhhdmUgbWlzdW5kZXJzdG9vZCB0aGUgY3VycmVudCBz
dGF0ZSwgYnV0IEkgdGhvdWdodCB0aGF0IGl0Cj4+PiB3b3VsZCBqdXN0IHNpbGVudGx5IGhpZGUg
cXVpcmt5IGRldmljZXMgd2l0aG91dCBpbXBvc2luZyBhIHNlY3VyaXR5Cj4+PiByaXNrLiBXZSB3
b3VsZCBub3QgbGVhcm4gd2hpY2ggZGV2aWNlcyBhcmUgcXVpcmt5LCBidXQgT1RPSCBJIGRvdWJ0
Cj4+PiB3ZSdkIGdldCBtYW55IHJlcG9ydHMgYWJvdXQgdGhvc2UgaW4gY2FzZSB5b3VyIHBhdGNo
IGdvZXMgaW4uCj4+Cj4+IFdlIGRvbid0IHdhbnQgb3IgbmVlZCBzdWNoIHJlcG9ydHMsIHRoYXQn
cyBub3QgdGhlIHBvaW50LiBUaGUKPj4gc2VjdXJpdHkgcmlzayBjb21lcyBmcm9tIHRoZSBxdWly
a2luZXNzIG9mIHRoZSBkZXZpY2VzIC0gYWRtaW5zCj4+IG1heSB3cm9uZ2x5IHRoaW5rIGFsbCBp
cyB3ZWxsIGFuZCBleHBvc2UgcXVpcmt5IGRldmljZXMgdG8gbm90Cj4+IHN1ZmZpY2llbnRseSB0
cnVzdGVkIGd1ZXN0cy4gKEkgc2F5IHRoaXMgZnVsbHkgcmVhbGl6aW5nIHRoYXQKPj4gZXhwb3Np
bmcgZGV2aWNlcyB0byB1bnRydXN0ZWQgZ3Vlc3RzIGlzIGFsbW9zdCBhbHdheXMgYSBjZXJ0YWlu
Cj4+IGxldmVsIG9mIHJpc2suKQo+IAo+IERvIHdlIF9rbm93XyB0aG9zZSBkZXZpY2VzIGFyZSBw
cm9ibGVtYXRpYyBmcm9tIHNlY3VyaXR5IHN0YW5kcG9pbnQ/Cj4gTm9ybWFsbHkgdGhlIElPTU1V
IHNob3VsZCBkbyB0aGUgaXNvbGF0aW9uIGp1c3QgZmluZS4gSWYgaXQgZG9lc24ndAo+IHRoZW4g
aXRzIG5vdCB0aGUgcXVpcmt5IGRldmljZSB3aGljaCBpcyBwcm9ibGVtYXRpYywgYnV0IHRoZSBJ
T01NVS4KPiAKPiBJIHRob3VnaHQgdGhlIHByb2JsZW0gd2FzIHRoYXQgdGhlIHF1aXJreSBkZXZp
Y2VzIHdvdWxkIG5vdCBzdG9wIGFsbAo+IChyZWFkKSBETUEgZXZlbiB3aGVuIGJlaW5nIHVuYXNz
aWduZWQgZnJvbSB0aGUgZ3Vlc3QgcmVzdWx0aW5nIGluCj4gZmF0YWwgSU9NTVUgZmF1bHRzLiBU
aGUgZHVtbXkgcGFnZSBzaG91bGQgc3RvcCB0aG9zZSBmYXVsdHMgdG8gaGFwcGVuCj4gcmVzdWx0
aW5nIGluIGEgbW9yZSBzdGFibGUgc3lzdGVtLgoKSU9NTVUgZmF1bHRzIGJ5IHRoZW1zZWx2ZXMg
YXJlIG5vdCBpbXBhY3Rpbmcgc3RhYmlsaXR5ICh0aGV5IHdpbGwKYWRkIHByb2Nlc3Npbmcgb3Zl
cmhlYWQsIHllcykuIFRoZSBwcm9ibGVtLCBhY2NvcmRpbmcgdG8gUGF1bCdzCmRlc2NyaXB0aW9u
LCBpcyB0aGF0IHRoZSBvY2N1cnJlbmNlIG9mIGF0IGxlYXN0IHNvbWUgZm9ybXMgb2YgSU9NTVUK
ZmF1bHRzIChub3QgcHJlc2VudCBvbmVzIGFzIGl0IHNlZW1zLCBhcyBvcHBvc2VkIHRvIHBlcm1p
c3Npb24KdmlvbGF0aW9uIG9uZXMpIGlzIGZhdGFsIHRvIGNlcnRhaW4gc3lzdGVtcy4gSXJyZXNw
ZWN0aXZlIG9mIHRoZQpzaW5rIHBhZ2UgdXNlZCBhZnRlciBkZS1hc3NpZ25tZW50IGEgZ3Vlc3Qg
Y2FuIGFycmFuZ2UgZm9yIElPTU1VCmZhdWx0cyB0byBvY2N1ciBldmVuIHdoaWxlIGl0IHN0aWxs
IGhhcyB0aGUgZGV2aWNlIGFzc2lnbmVkLiBIZW5jZQppdCBpcyBpbXBvcnRhbnQgZm9yIHRoZSBh
ZG1pbiB0byBrbm93IHRoYXQgdGhlaXIgc3lzdGVtIChub3QgdGhlCnRoZSBwYXJ0aWN1bGFyIGRl
dmljZSkgYmVoYXZlcyBpbiB0aGlzIHVuZGVzaXJhYmxlIHdheS4KCj4gU28gd2hhdCBhcmUgdGhl
IHNlY3VyaXR5IHByb2JsZW1zIHdoaWNoIGFyZSBhZGRlZCBieSB0aGlzIGJlaGF2aW9yPwoKVGhl
cmUgYXJlIG5vIHByb2JsZW1zIGFkZGVkOyB0aGVyZSBhcmUgcHJvYmxlbXMgaGlkZGVuIGZyb20g
YWRtaW5zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
