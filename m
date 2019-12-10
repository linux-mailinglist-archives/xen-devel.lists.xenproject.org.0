Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753111830F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:09:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iebUA-0008HS-Mi; Tue, 10 Dec 2019 09:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iebU9-0008HL-Hr
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:07:13 +0000
X-Inumbo-ID: 73c25514-1b2c-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73c25514-1b2c-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 09:07:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0430AE2C;
 Tue, 10 Dec 2019 09:07:11 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
 <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5ac457ca-46cf-5de3-8bfa-92a754f298fd@suse.com>
Date: Tue, 10 Dec 2019 10:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMDk6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjEyLjIwMTkgMDk6
MTIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEwLjEyLjE5IDA5OjA1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEwLjEyLjIwMTkgMDg6MTYsIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4+
IFdoaWxlIHRoZSBxdWFyYW50aW5lIGlkZWEgc291bmRzIGdvb2Qgb3ZlcmFsbCwgSSdtIHN0aWxs
IG5vdCBjb252aW5jZWQKPj4+PiB0byBoYXZlIGl0IHRoZSBvbmx5IHdheSBpbiBwbGFjZSBqdXN0
IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5Cj4+Pj4gZGV2aWNlLiBJdCBraWxscyB0aGUg
cG9zc2liaWxpdHkgb2YgaWRlbnRpZnlpbmcgYSBuZXcgYnVnZ3kgZGV2aWNlIGFuZCB0aGVuCj4+
Pj4gZGVjaWRpbmcgbm90IHRvIHVzZSBpdCBpbiB0aGUgZmlyc3Qgc3BhY2UuLi4gSSB0aG91Z2h0
IGFib3V0IHdoZXRoZXIgaXQKPj4+PiB3aWxsIGdldCBiZXR0ZXIgd2hlbiBmdXR1cmUgSU9NTVUg
aW1wbGVtZW50cyBBL0QgYml0IC0gYnkgY2hlY2tpbmcKPj4+PiBhY2Nlc3MgYml0IGJlaW5nIHNl
dCB0aGVuIHdlJ2xsIGtub3cgc29tZSBidWdneSBkZXZpY2UgZXhpc3RzLCBidXQsCj4+Pj4gdGhl
IHNjcmF0Y2ggcGFnZSBpcyBzaGFyZWQgYnkgYWxsIGRldmljZXMgdGhlbiB3ZSBjYW5ub3QgcmVs
eSBvbiB0aGlzCj4+Pj4gZmVhdHVyZSB0byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4K
Pj4+Cj4+PiBUaGlua2luZyBhYm91dCBpdCAtIHllcywgSSB0aGluayBJIGFncmVlLiBUaGlzIChh
cyB3aXRoIHNvIG1hbnkKPj4+IHdvcmthcm91bmRzKSB3b3VsZCBiZXR0ZXIgYmUgYW4gb2ZmLWJ5
LWRlZmF1bHQgb25lLiBUaGUgbWFpbiBpc3N1ZQo+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgd291bGQg
aGF2ZSBpcyB0aGF0IGJ1Z2d5IHN5c3RlbXMgdGhlbiBtaWdodCBoYW5nCj4+PiB3aXRob3V0IGV2
ZW4gaGF2aW5nIG1hbmFnZWQgdG8gZ2V0IGEgbG9nIG1lc3NhZ2Ugb3V0IC0gUGF1bD8KPj4+Cj4+
PiBKw7xyZ2VuIC0gd291bGQgeW91IGJlIGFtZW5hYmxlIHRvIGFuIGFsbW9zdCBsYXN0IG1pbnV0
ZSByZWZpbmVtZW50Cj4+PiBoZXJlICh3b3VsZCB0aGVuIGFsc28gbmVlZCB0byBzdGlsbCBiZSBi
YWNrcG9ydGVkIHRvIDQuMTIuMiwgb3IKPj4+IHRoZSBvcmlnaW5hbCBiYWNrcG9ydCByZXZlcnRl
ZCwgdG8gYXZvaWQgZ2l2aW5nIHRoZSBpbXByZXNzaW9uIG9mCj4+PiBhIHJlZ3Jlc3Npb24pPwo+
Pgo+PiBTbyB3aGF0IGlzIHlvdXIgc3VnZ2VzdGlvbiBoZXJlPyBUbyBoYXZlIGEgYm9vdCBvcHRp
b24gKGRlZmF1bHRpbmcgdG8KPj4gb2ZmKSBmb3IgZW5hYmxpbmcgdGhlIHNjcmF0Y2ggcGFnZT8K
PiAKPiBZZXMgKGFuZCBkZXNwaXRlIGhhdmluZyBzZWVuIFBhdWwncyByZXBseSkuCgpJJ2QgcmVs
ZWFzZSBhY2sgc3VjaCBhIHBhdGNoIGluIGNhc2UgeW91IGNvbWUgdG8gYW4gYWdyZWVtZW50IHJl
Z2FyZGluZwp0aGUgZGVmYXVsdCBzb29uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
