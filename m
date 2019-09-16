Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE2B370D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:24:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nBm-0002aB-QO; Mon, 16 Sep 2019 09:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9nBm-0002a6-2p
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:20:54 +0000
X-Inumbo-ID: 46f4a409-d863-11e9-95d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46f4a409-d863-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 09:20:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5B55AF2B;
 Mon, 16 Sep 2019 09:20:51 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914064217.4877-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <616613a5-e617-4ada-1339-7a6458e8351c@suse.com>
Date: Mon, 16 Sep 2019 11:20:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914064217.4877-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: rework and rename
 vcpu_force_reschedule()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAwODo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2Y3B1X2ZvcmNlX3Jl
c2NoZWR1bGUoKSBpcyBvbmx5IHVzZWQgZm9yIG1vZGlmeWluZyB0aGUgcGVyaW9kaWMgdGltZXIK
PiBvZiBhIHZjcHUuIEZvcmNpbmcgYSB2Y3B1IHRvIGdpdmUgdXAgdGhlIHBoeXNpY2FsIGNwdSBm
b3IgdGhhdCBwdXJwb3NlCj4gaXMga2luZCBvZiBicnV0YWwuCj4gCj4gU28gaW5zdGVhZCBvZiBk
b2luZyB0aGUgcmVzY2hlZHVsZSBkYW5jZSBqdXN0IG9wZXJhdGUgb24gdGhlIHRpbWVyCj4gZGly
ZWN0bHkuIEJ5IHByb3RlY3RpbmcgcGVyaW9kaWMgdGltZXIgbW9kaWZpY2F0aW9ucyBhZ2FpbnN0
IGNvbmN1cnJlbnQKPiB0aW1lciBhY3RpdmF0aW9uIHZpYSBhIHBlci12Y3B1IGxvY2sgaXQgaXMg
ZXZlbiBubyBsb25nZXIgcmVxdWlyZWQgdG8KPiBib3RoZXIgdGhlIHRhcmdldCB2Y3B1IGF0IGFs
bCBmb3IgdXBkYXRpbmcgaXRzIHRpbWVyLgo+IAo+IFJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gdmNw
dV9zZXRfcGVyaW9kaWNfdGltZXIoKSBhcyB0aGlzIG5vdyByZWZsZWN0cwo+IHRoZSBmdW5jdGlv
bmFsaXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCkkgY29udGludWUgdG8gYmUgdW5oYXBweSBhYm91dCB0aGVyZSBiZWluZyBubyB3b3JkIGF0
IGFsbCBhYm91dCAuLi4KCj4gQEAgLTcyNCwyNCArNzI1LDYgQEAgc3RhdGljIHZvaWQgdmNwdV9t
aWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHZjcHVfd2FrZSh2KTsKPiAgfQo+
ICAKPiAtLyoKPiAtICogRm9yY2UgYSBWQ1BVIHRocm91Z2ggYSBkZXNjaGVkdWxlL3Jlc2NoZWR1
bGUgcGF0aC4KPiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMgd2hlbiBzZXR0aW5nIHRoZSBw
ZXJpb2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+IC0gKiBtb3N0IHBlcmlvZGljLXRpbWVy
IHN0YXRlIG5lZWQgb25seSBiZSB0b3VjaGVkIGZyb20gd2l0aGluIHRoZSBzY2hlZHVsZXIKPiAt
ICogd2hpY2ggY2FuIHRodXMgYmUgZG9uZSB3aXRob3V0IG5lZWQgZm9yIHN5bmNocm9uaXNhdGlv
bi4KPiAtICovCj4gLXZvaWQgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHN0cnVjdCB2Y3B1ICp2KQoK
Li4uIHRoZSBvcmlnaW5hbGx5IGludGVuZGVkIHN5bmNocm9uaXphdGlvbi1mcmVlIGhhbmRsaW5n
LiBGb3JjaW5nCnRoZSB2Q1BVIHRocm91Z2ggdGhlIHNjaGVkdWxlciBtYXkgc2VlbSBoYXJzaCAo
YW5kIHF1aXRlIHNvbWUKb3ZlcmhlYWQpLCB5ZXMsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZSBhYm92
ZSB3YXMgd3JpdHRlbiAoYW5kCmRlY2lkZWQpIHdpdGhvdXQgY29uc2lkZXJhdGlvbi4gT25lIGVm
ZmVjdCBvZiB0aGlzIGNhbiBiZSBzZWVuIGJ5CnlvdSAuLi4KCj4gK3ZvaWQgdmNwdV9zZXRfcGVy
aW9kaWNfdGltZXIoc3RydWN0IHZjcHUgKnYsIHNfdGltZV90IHZhbHVlKQo+ICt7Cj4gKyAgICBz
cGluX2xvY2soJnYtPnBlcmlvZGljX3RpbWVyX2xvY2spOwo+ICsKPiArICAgIHN0b3BfdGltZXIo
JnYtPnBlcmlvZGljX3RpbWVyKTsKCi4uLiBpbnRyb2R1Y2luZyBhIG5ldyBzdG9wX3RpbWVyKCkg
aGVyZSwgaS5lLiB3aGljaCBkb2Vzbid0IHJlcGxhY2UKYW55IGV4aXN0aW5nIG9uZS4gVGhlIGlt
cGxpY2F0aW9uIGlzIHRoYXQgb3RoZXIgdGhhbiBiZWZvcmUgdGhlCnBlcmlvZGljIHRpbWVyIG1h
eSBub3cgbm90IHJ1biAoZm9yIGEgYnJpZWYgbW9tZW50KSBkZXNwaXRlIGl0CmJlaW5nIHN1cHBv
c2VkIHRvIHJ1biAtIGFmdGVyIGFsbCBpdCBoYXMgYmVlbiBhY3RpdmUgc28gZmFyCndoZW5ldmVy
IGEgdkNQVSB3YXMgcnVubmluZy4KClRoZW4gYWdhaW4sIGxvb2tpbmcgYXQgdGhlIGludm9sdmVk
IGNvZGUgcGF0aHMgeWV0IGFnYWluLCBJIHdvbmRlcgp3aGV0aGVyIHRoaXMgaGFzIGJlZW4gd29y
a2luZyByaWdodCBhdCBhbGw6IFRoZXJlJ3MgYW4gZWFybHkgZXhpdApmcm9tIHNjaGVkdWxlKCkg
d2hlbiBwcmV2ID09IG5leHQsIHdoaWNoIGJ5cGFzc2VzCnZjcHVfcGVyaW9kaWNfdGltZXJfd29y
aygpLiBBbmQgSSBjYW4ndCBzZWVtIHRvIGJlIGFibGUgdG8gc3BvdAphbnl0aGluZyBvbiB0aGUg
dmNwdV9mb3JjZV9yZXNjaGVkdWxlKCkgcGF0aCB3aGljaCB3b3VsZCBndWFyYW50ZWUKdGhpcyBz
aG9ydGN1dCB0byBub3QgYmUgdGFrZW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
