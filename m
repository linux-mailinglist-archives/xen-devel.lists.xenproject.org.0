Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6111E5D7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:48:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmBX-0006WJ-NY; Fri, 13 Dec 2019 14:44:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifmBV-0006WE-Qk
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:44:49 +0000
X-Inumbo-ID: 175d0b2e-1db7-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 175d0b2e-1db7-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 14:44:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55E82B1A8;
 Fri, 13 Dec 2019 14:44:39 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
 <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a37ad5d9-6961-a087-c111-bf525e00c1e4@suse.com>
Date: Fri, 13 Dec 2019 15:45:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
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

T24gMTMuMTIuMjAxOSAxNToyNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
NToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTQ6NDYsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMy4xMi4xOSAxNDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTMuMTIuMjAxOSAxNDozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gTWF5YmUg
SSBoYXZlIG1pc3VuZGVyc3Rvb2QgdGhlIGN1cnJlbnQgc3RhdGUsIGJ1dCBJIHRob3VnaHQgdGhh
dCBpdAo+Pj4+PiB3b3VsZCBqdXN0IHNpbGVudGx5IGhpZGUgcXVpcmt5IGRldmljZXMgd2l0aG91
dCBpbXBvc2luZyBhIHNlY3VyaXR5Cj4+Pj4+IHJpc2suIFdlIHdvdWxkIG5vdCBsZWFybiB3aGlj
aCBkZXZpY2VzIGFyZSBxdWlya3ksIGJ1dCBPVE9IIEkgZG91YnQKPj4+Pj4gd2UnZCBnZXQgbWFu
eSByZXBvcnRzIGFib3V0IHRob3NlIGluIGNhc2UgeW91ciBwYXRjaCBnb2VzIGluLgo+Pj4+Cj4+
Pj4gV2UgZG9uJ3Qgd2FudCBvciBuZWVkIHN1Y2ggcmVwb3J0cywgdGhhdCdzIG5vdCB0aGUgcG9p
bnQuIFRoZQo+Pj4+IHNlY3VyaXR5IHJpc2sgY29tZXMgZnJvbSB0aGUgcXVpcmtpbmVzcyBvZiB0
aGUgZGV2aWNlcyAtIGFkbWlucwo+Pj4+IG1heSB3cm9uZ2x5IHRoaW5rIGFsbCBpcyB3ZWxsIGFu
ZCBleHBvc2UgcXVpcmt5IGRldmljZXMgdG8gbm90Cj4+Pj4gc3VmZmljaWVudGx5IHRydXN0ZWQg
Z3Vlc3RzLiAoSSBzYXkgdGhpcyBmdWxseSByZWFsaXppbmcgdGhhdAo+Pj4+IGV4cG9zaW5nIGRl
dmljZXMgdG8gdW50cnVzdGVkIGd1ZXN0cyBpcyBhbG1vc3QgYWx3YXlzIGEgY2VydGFpbgo+Pj4+
IGxldmVsIG9mIHJpc2suKQo+Pj4KPj4+IERvIHdlIF9rbm93XyB0aG9zZSBkZXZpY2VzIGFyZSBw
cm9ibGVtYXRpYyBmcm9tIHNlY3VyaXR5IHN0YW5kcG9pbnQ/Cj4+PiBOb3JtYWxseSB0aGUgSU9N
TVUgc2hvdWxkIGRvIHRoZSBpc29sYXRpb24ganVzdCBmaW5lLiBJZiBpdCBkb2Vzbid0Cj4+PiB0
aGVuIGl0cyBub3QgdGhlIHF1aXJreSBkZXZpY2Ugd2hpY2ggaXMgcHJvYmxlbWF0aWMsIGJ1dCB0
aGUgSU9NTVUuCj4+Pgo+Pj4gSSB0aG91Z2h0IHRoZSBwcm9ibGVtIHdhcyB0aGF0IHRoZSBxdWly
a3kgZGV2aWNlcyB3b3VsZCBub3Qgc3RvcCBhbGwKPj4+IChyZWFkKSBETUEgZXZlbiB3aGVuIGJl
aW5nIHVuYXNzaWduZWQgZnJvbSB0aGUgZ3Vlc3QgcmVzdWx0aW5nIGluCj4+PiBmYXRhbCBJT01N
VSBmYXVsdHMuIFRoZSBkdW1teSBwYWdlIHNob3VsZCBzdG9wIHRob3NlIGZhdWx0cyB0byBoYXBw
ZW4KPj4+IHJlc3VsdGluZyBpbiBhIG1vcmUgc3RhYmxlIHN5c3RlbS4KPj4KPj4gSU9NTVUgZmF1
bHRzIGJ5IHRoZW1zZWx2ZXMgYXJlIG5vdCBpbXBhY3Rpbmcgc3RhYmlsaXR5ICh0aGV5IHdpbGwK
Pj4gYWRkIHByb2Nlc3Npbmcgb3ZlcmhlYWQsIHllcykuIFRoZSBwcm9ibGVtLCBhY2NvcmRpbmcg
dG8gUGF1bCdzCj4+IGRlc2NyaXB0aW9uLCBpcyB0aGF0IHRoZSBvY2N1cnJlbmNlIG9mIGF0IGxl
YXN0IHNvbWUgZm9ybXMgb2YgSU9NTVUKPj4gZmF1bHRzIChub3QgcHJlc2VudCBvbmVzIGFzIGl0
IHNlZW1zLCBhcyBvcHBvc2VkIHRvIHBlcm1pc3Npb24KPj4gdmlvbGF0aW9uIG9uZXMpIGlzIGZh
dGFsIHRvIGNlcnRhaW4gc3lzdGVtcy4gSXJyZXNwZWN0aXZlIG9mIHRoZQo+PiBzaW5rIHBhZ2Ug
dXNlZCBhZnRlciBkZS1hc3NpZ25tZW50IGEgZ3Vlc3QgY2FuIGFycmFuZ2UgZm9yIElPTU1VCj4+
IGZhdWx0cyB0byBvY2N1ciBldmVuIHdoaWxlIGl0IHN0aWxsIGhhcyB0aGUgZGV2aWNlIGFzc2ln
bmVkLiBIZW5jZQo+PiBpdCBpcyBpbXBvcnRhbnQgZm9yIHRoZSBhZG1pbiB0byBrbm93IHRoYXQg
dGhlaXIgc3lzdGVtIChub3QgdGhlCj4+IHRoZSBwYXJ0aWN1bGFyIGRldmljZSkgYmVoYXZlcyBp
biB0aGlzIHVuZGVzaXJhYmxlIHdheS4KPiAKPiBTbyBob3cgZG9lcyB0aGUgYWRtaW4gbGVhcm4g
dGhpcz8gSXRzIG5vdCBhcyBpZiB5b3VyIHBhdGNoIHdvdWxkIHJlc3VsdAo+IGluIGEgc3lzdGVt
IGNyYXNoIG9yIGhhbmcgYWxsIHRoZSB0aW1lLCByaWdodD8gVGhpcyB3b3VsZCBiZSB0aGUgY2Fz
ZQo+IG9ubHkgaWYgdGhlcmUgZWl0aGVyIGlzIGEgbWFsaWNpb3VzIChvbiBwdXJwb3NlIG9yIGR1
ZSB0byBhIGJ1ZykgZ3Vlc3QKPiB3aGljaCBnZXRzIHRoZSBkZXZpY2UgYXNzaWduZWQsIG9yIGlm
IHRoZXJlIGhhcHBlbnMgdG8gYmUgYSBwZW5kaW5nIERNQQo+IG9wZXJhdGlvbiB3aGVuIHRoZSBk
ZXZpY2UgZ2V0cyB1bmFzc2lnbmVkLgoKSSBkaWRuJ3QgY2xhaW0gdGhlIGNoYW5nZSB3b3VsZCBj
b3ZlciBhbGwgY2FzZXMuIEFsbCBJIGFtIGNsYWltaW5nCmlzIHRoYXQgaXQgaW5jcmVhc2VzIHRo
ZSBjaGFuY2VzIG9mIGFkbWlucyBiZWNvbWluZyBhd2FyZSBvZiByZWFzb25zCm5vdCB0byBwYXNz
IHRocm91Z2ggZGV2aWNlcyB0byBjZXJ0YWluIGd1ZXN0cy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
