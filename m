Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0736ECD86
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2019 07:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQmVb-0006iJ-Nu; Sat, 02 Nov 2019 06:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g4l3=YZ=nvidia.com=rcampbell@srs-us1.protection.inumbo.net>)
 id 1iQdwX-0003Q4-Ev
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 20:54:49 +0000
X-Inumbo-ID: d7782a68-fce9-11e9-93da-bc764e2007e4
Received: from hqemgate15.nvidia.com (unknown [216.228.121.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7782a68-fce9-11e9-93da-bc764e2007e4;
 Fri, 01 Nov 2019 20:54:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbc9b9d0000>; Fri, 01 Nov 2019 13:54:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 01 Nov 2019 13:54:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 01 Nov 2019 13:54:47 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 1 Nov
 2019 20:54:45 +0000
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Jerome Glisse
 <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 <Felix.Kuehling@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <c2b67afe-cb32-14c9-6513-6cda6cd891d2@nvidia.com>
Date: Fri, 1 Nov 2019 13:54:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572641693; bh=Wuhb/swYP3BT1uv7uflErFPxk1smHbkEatx0EkeJqaU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Gj8TuUXAGqUgpBWWkd1I8rf8UlZHo8q1q32bgYotUpMASt7Hcee+T8VZU0i2EbaOy
 vvUx0qM7JgL9hFDJEJTWobwt0GGyavgQp8OphjX4Gp5CIU6nnVxJJfH9cZNfWnZo40
 0ggn9mDusEwQtT0na93hDn2I7IDYm51TemNvaOfHF8J8cF0JcB484fXjERHWsCuC5S
 kBUjjU/0a+Mfn0xDH/3BeI10iGw/PaqhyIwsFXYAzJukfGg7Nz0F/RMpjW/LIPsyQ1
 7xbSuJm3T7e6dNIuermjhMAIfBGhqO0gxbXcw/EMrMZlA5B7aEoZ0a0t2qeVYUDIvv
 xWjZqujp9IZ+A==
X-Mailman-Approved-At: Sat, 02 Nov 2019 06:03:33 +0000
Subject: Re: [Xen-devel] [PATCH v2 00/15] Consolidate the mmu notifier
 interval_tree and locking
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org, Dennis
 Dalessandro <dennis.dalessandro@intel.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLzI4LzE5IDE6MTAgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBGcm9tOiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gCj4gOCBvZiB0aGUgbW11X25vdGlmaWVy
IHVzaW5nIGRyaXZlcnMgKGk5MTVfZ2VtLCByYWRlb25fbW4sIHVtZW1fb2RwLCBoZmkxLAo+IHNj
aWZfZG1hLCB2aG9zdCwgZ250ZGV2LCBobW0pIGRyaXZlcnMgYXJlIHVzaW5nIGEgY29tbW9uIHBh
dHRlcm4gd2hlcmUKPiB0aGV5IG9ubHkgdXNlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kIGFu
ZCBpbW1lZGlhdGVseSBjaGVjayB0aGUKPiBpbnZhbGlkYXRpbmcgcmFuZ2UgYWdhaW5zdCBzb21l
IGRyaXZlciBkYXRhIHN0cnVjdHVyZSB0byB0ZWxsIGlmIHRoZQo+IGRyaXZlciBpcyBpbnRlcmVz
dGVkLiBIYWxmIG9mIHRoZW0gdXNlIGFuIGludGVydmFsX3RyZWUsIHRoZSBvdGhlcnMgYXJlCj4g
c2ltcGxlIGxpbmVhciBzZWFyY2ggbGlzdHMuCj4gCj4gT2YgdGhlIG9uZXMgSSBjaGVja2VkIHRo
ZXkgbGFyZ2VseSBzZWVtIHRvIGhhdmUgdmFyaW91cyBraW5kcyBvZiByYWNlcywKPiBidWdzIGFu
ZCBwb29yIGltcGxlbWVudGF0aW9uLiBUaGlzIGlzIGEgcmVzdWx0IG9mIHRoZSBjb21wbGV4aXR5
IGluIGhvdwo+IHRoZSBub3RpZmllciBpbnRlcmFjdHMgd2l0aCBnZXRfdXNlcl9wYWdlcygpLiBJ
dCBpcyBleHRyZW1lbHkgZGlmZmljdWx0IHRvCj4gdXNlIGl0IGNvcnJlY3RseS4KPiAKPiBDb25z
b2xpZGF0ZSBhbGwgb2YgdGhpcyBjb2RlIHRvZ2V0aGVyIGludG8gdGhlIGNvcmUgbW11X25vdGlm
aWVyIGFuZAo+IHByb3ZpZGUgYSBsb2NraW5nIHNjaGVtZSBzaW1pbGFyIHRvIGhtbV9taXJyb3Ig
dGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8KPiBzYWZlbHkgdXNlIGdldF91c2VyX3BhZ2VzKCkgYW5k
IHJlbGlhYmx5IGtub3cgaWYgdGhlIHBhZ2UgbGlzdCBzdGlsbAo+IG1hdGNoZXMgdGhlIG1tLgo+
IAo+IFRoaXMgbmV3IGFycmFuZ21lbnQgcGxheXMgbmljZWx5IHdpdGggdGhlICFibG9ja2FibGUg
bW9kZSBmb3IKPiBPT00uIFNjYW5uaW5nIHRoZSBpbnRlcnZhbCB0cmVlIGlzIGRvbmUgc3VjaCB0
aGF0IHRoZSBpbnRlcnNlY3Rpb24gdGVzdAo+IHdpbGwgYWx3YXlzIHN1Y2NlZWQsIGFuZCBzaW5j
ZSB0aGVyZSBpcyBubyBpbnZhbGlkYXRlX3JhbmdlX2VuZCBleHBvc2VkIHRvCj4gZHJpdmVycyB0
aGUgc2NoZW1lIHNhZmVseSBhbGxvd3MgbXVsdGlwbGUgZHJpdmVycyB0byBiZSBzdWJzY3JpYmVk
Lgo+IAo+IEZvdXIgcGxhY2VzIGFyZSBjb252ZXJ0ZWQgYXMgYW4gZXhhbXBsZSBvZiBob3cgdGhl
IG5ldyBBUEkgaXMgdXNlZC4KPiBGb3VyIGFyZSBsZWZ0IGZvciBmdXR1cmUgcGF0Y2hlczoKPiAg
IC0gaTkxNV9nZW0gaGFzIGNvbXBsZXggbG9ja2luZyBhcm91bmQgZGVzdHJ1Y3Rpb24gb2YgYSBy
ZWdpc3RyYXRpb24sCj4gICAgIG5lZWRzIG1vcmUgc3R1ZHkKPiAgIC0gaGZpMSAoMm5kIHVzZXIp
IG5lZWRzIGFjY2VzcyB0byB0aGUgcmJ0cmVlCj4gICAtIHNjaWZfZG1hIGhhcyBhIGNvbXBsaWNh
dGVkIGxvZ2ljIGZsb3cKPiAgIC0gdmhvc3QncyBtbXUgbm90aWZpZXJzIGFyZSBhbHJlYWR5IGJl
aW5nIHJld3JpdHRlbgo+IAo+IFRoaXMgc2VyaWVzLCBhbmQgdGhlIG90aGVyIGNvZGUgaXQgZGVw
ZW5kcyBvbiBpcyBhdmFpbGFibGUgb24gbXkgZ2l0aHViOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvbW11X25vdGlmaWVyCj4gCj4gdjIgY2hhbmdlczoK
PiAtIEFkZCBtbXVfcmFuZ2Vfc2V0X3NlcSgpIHRvIHNldCB0aGUgbXJuIHNlcXVlbmNlIG51bWJl
ciB1bmRlciB0aGUgZHJpdmVyCj4gICAgbG9jayBhbmQgbWFrZSB0aGUgbG9ja2luZyBtb3JlIHVu
ZGVyc3RhbmRhYmxlCj4gLSBBZGQgc29tZSBhZGRpdGlvbmFsIGNvbW1lbnRzIGFyb3VuZCBsb2Nr
aW5nL1JFQURfT05DZQo+IC0gTWFrZSB0aGUgV0FSTl9PTiBmbG93IGluIG1uX2l0cmVlX2ludmFs
aWRhdGUgYSBiaXQgZWFzaWVyIHRvIGZvbGxvdwo+IC0gRml4IHdyb25nIFdBUk5fT04KPiAKPiBK
YXNvbiBHdW50aG9ycGUgKDE1KToKPiAgICBtbS9tbXVfbm90aWZpZXI6IGRlZmluZSB0aGUgaGVh
ZGVyIHByZS1wcm9jZXNzb3IgcGFydHMgZXZlbiBpZgo+ICAgICAgZGlzYWJsZWQKPiAgICBtbS9t
bXVfbm90aWZpZXI6IGFkZCBhbiBpbnRlcnZhbCB0cmVlIG5vdGlmaWVyCj4gICAgbW0vaG1tOiBh
bGxvdyBobW1fcmFuZ2UgdG8gYmUgdXNlZCB3aXRoIGEgbW11X3JhbmdlX25vdGlmaWVyIG9yCj4g
ICAgICBobW1fbWlycm9yCj4gICAgbW0vaG1tOiBkZWZpbmUgdGhlIHByZS1wcm9jZXNzb3IgcmVs
YXRlZCBwYXJ0cyBvZiBobW0uaCBldmVuIGlmCj4gICAgICBkaXNhYmxlZAo+ICAgIFJETUEvb2Rw
OiBVc2UgbW11X3JhbmdlX25vdGlmaWVyX2luc2VydCgpCj4gICAgUkRNQS9oZmkxOiBVc2UgbW11
X3JhbmdlX25vdGlmaWVyX2luc2V0IGZvciB1c2VyX2V4cF9yY3YKPiAgICBkcm0vcmFkZW9uOiB1
c2UgbW11X3JhbmdlX25vdGlmaWVyX2luc2VydAo+ICAgIHhlbi9nbnRkZXY6IFVzZSBzZWxlY3Qg
Zm9yIERNQV9TSEFSRURfQlVGRkVSCj4gICAgeGVuL2dudGRldjogdXNlIG1tdV9yYW5nZV9ub3Rp
Zmllcl9pbnNlcnQKPiAgICBub3V2ZWF1OiB1c2UgbW11X25vdGlmaWVyIGRpcmVjdGx5IGZvciBp
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0Cj4gICAgbm91dmVhdTogdXNlIG1tdV9yYW5nZV9ub3RpZmll
ciBpbnN0ZWFkIG9mIGhtbV9taXJyb3IKPiAgICBkcm0vYW1kZ3B1OiBDYWxsIGZpbmRfdm1hIHVu
ZGVyIG1tYXBfc2VtCj4gICAgZHJtL2FtZGdwdTogVXNlIG1tdV9yYW5nZV9pbnNlcnQgaW5zdGVh
ZCBvZiBobW1fbWlycm9yCj4gICAgZHJtL2FtZGdwdTogVXNlIG1tdV9yYW5nZV9ub3RpZmllciBp
bnN0ZWFkIG9mIGhtbV9taXJyb3IKPiAgICBtbS9obW06IHJlbW92ZSBobW1fbWlycm9yIGFuZCBy
ZWxhdGVkCj4gCj4gICBEb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QgICAgICAgICAgICAgICAgICAg
ICAgfCAxMDUgKy0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAg
ICAgICAgIHwgICAyICsKPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jICB8ICAgOSArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMgICAgICAgIHwgIDE0ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X21uLmMgICAgICAgIHwgNDU3ICsrKy0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X21uLmggICAgICAgIHwgIDUzIC0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggICAgfCAgMTMgKy0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICB8IDExMSArKy0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jICAgICAgICAgfCAyMzEgKysrKystLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmggICAgICAgICAgICAgICB8ICAgOSArLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyAgICAgICAgICAgIHwgMjE5ICsrLS0t
LS0KPiAgIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL2RldmljZS5jICAgICAgICAgICAgICB8ICAg
MSAtCj4gICBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtX29kcC5jICAgICAgICAgICAgfCAy
ODggKy0tLS0tLS0tCj4gICBkcml2ZXJzL2luZmluaWJhbmQvaHcvaGZpMS9maWxlX29wcy5jICAg
ICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL2hmaS5oICAgICAg
ICAgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdXNlcl9leHBf
cmN2LmMgICAgIHwgMTQ2ICsrLS0tCj4gICBkcml2ZXJzL2luZmluaWJhbmQvaHcvaGZpMS91c2Vy
X2V4cF9yY3YuaCAgICAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L21s
eDVfaWIuaCAgICAgICAgICB8ICAgNyArLQo+ICAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDUv
bXIuYyAgICAgICAgICAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4
NS9vZHAuYyAgICAgICAgICAgICAgfCAgNTAgKy0KPiAgIGRyaXZlcnMveGVuL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LWNv
bW1vbi5oICAgICAgICAgICAgICAgICAgIHwgICA4ICstCj4gICBkcml2ZXJzL3hlbi9nbnRkZXYu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxODAgKystLS0tCj4gICBpbmNsdWRlL2xpbnV4
L2htbS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOTUgKy0tLS0tLQo+ICAgaW5jbHVk
ZS9saW51eC9tbXVfbm90aWZpZXIuaCAgICAgICAgICAgICAgICAgIHwgMTQ0ICsrKystCj4gICBp
bmNsdWRlL3JkbWEvaWJfdW1lbV9vZHAuaCAgICAgICAgICAgICAgICAgICAgfCAgNjUgKy0tCj4g
ICBpbmNsdWRlL3JkbWEvaWJfdmVyYnMuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQo+
ICAga2VybmVsL2ZvcmsuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0K
PiAgIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQo+ICAgbW0vaG1tLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjc1
ICstLS0tLS0tLQo+ICAgbW0vbW11X25vdGlmaWVyLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNTQ2ICsrKysrKysrKysrKysrKysrLQo+ICAgMzIgZmlsZXMgY2hhbmdlZCwgMTIyNSBp
bnNlcnRpb25zKCspLCAxOTIyIGRlbGV0aW9ucygtKQo+IAoKWW91IGNhbiBhZGQgbXkgVGVzdGVk
LWJ5IGZvciB0aGUgbW0gYW5kIG5vdXZlYXUgY2hhbmdlcy4KSU9XLCBwYXRjaGVzIDEtNCwgMTAt
MTEsIGFuZCAxNS4KClRlc3RlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
