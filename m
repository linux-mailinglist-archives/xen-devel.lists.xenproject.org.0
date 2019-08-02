Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A07EB98
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htPJL-0002pP-NR; Fri, 02 Aug 2019 04:36:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htPJJ-0002pK-SF
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 04:36:57 +0000
X-Inumbo-ID: 277c960a-b4df-11e9-871f-cf091fc46fe5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 277c960a-b4df-11e9-871f-cf091fc46fe5;
 Fri, 02 Aug 2019 04:36:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56E85AD2B;
 Fri,  2 Aug 2019 04:36:53 +0000 (UTC)
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
Date: Fri, 2 Aug 2019 06:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802022005.5117-21-jhubbard@nvidia.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 20/34] xen: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMTkgMDQ6MTksIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IAo+IEZvciBwYWdlcyB0aGF0IHdl
cmUgcmV0YWluZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpLCByZWxlYXNlIHRob3NlIHBhZ2VzCj4g
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgo+IHJlbGVhc2VfcGFnZXMoKS4KPiAKPiBUaGlzIGlzIHBhcnQgYSB0cmVlLXdp
ZGUgY29udmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKPiAoIm1t
OiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KPiAK
PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgfCA1ICstLS0tCj4gICBkcml2
ZXJzL3hlbi9wcml2Y21kLmMgfCA3ICstLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
Z250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwo+IGluZGV4IDRjMzM5YzdlNjZlNS4uMjU4
NmIzZGYyYmI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi5jCj4gKysrIGIvZHJp
dmVycy94ZW4vZ250ZGV2LmMKPiBAQCAtODY0LDEwICs4NjQsNyBAQCBzdGF0aWMgaW50IGdudGRl
dl9nZXRfcGFnZShzdHJ1Y3QgZ250ZGV2X2NvcHlfYmF0Y2ggKmJhdGNoLCB2b2lkIF9fdXNlciAq
dmlydCwKPiAgIAo+ICAgc3RhdGljIHZvaWQgZ250ZGV2X3B1dF9wYWdlcyhzdHJ1Y3QgZ250ZGV2
X2NvcHlfYmF0Y2ggKmJhdGNoKQo+ICAgewo+IC0JdW5zaWduZWQgaW50IGk7Cj4gLQo+IC0JZm9y
IChpID0gMDsgaSA8IGJhdGNoLT5ucl9wYWdlczsgaSsrKQo+IC0JCXB1dF9wYWdlKGJhdGNoLT5w
YWdlc1tpXSk7Cj4gKwlwdXRfdXNlcl9wYWdlcyhiYXRjaC0+cGFnZXMsIGJhdGNoLT5ucl9wYWdl
cyk7Cj4gICAJYmF0Y2gtPm5yX3BhZ2VzID0gMDsKPiAgIH0KPiAgIAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBpbmRleCAyZjVj
ZTcyMzBhNDMuLjI5ZTQ2MWRiZWUyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21k
LmMKPiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBAQCAtNjExLDE1ICs2MTEsMTAgQEAg
c3RhdGljIGludCBsb2NrX3BhZ2VzKAo+ICAgCj4gICBzdGF0aWMgdm9pZCB1bmxvY2tfcGFnZXMo
c3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVkIGludCBucl9wYWdlcykKPiAgIHsKPiAtCXVu
c2lnbmVkIGludCBpOwo+IC0KPiAgIAlpZiAoIXBhZ2VzKQo+ICAgCQlyZXR1cm47Cj4gICAKPiAt
CWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7Cj4gLQkJaWYgKHBhZ2VzW2ldKQo+IC0J
CQlwdXRfcGFnZShwYWdlc1tpXSk7Cj4gLQl9Cj4gKwlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnJf
cGFnZXMpOwoKWW91IGFyZSBub3QgaGFuZGxpbmcgdGhlIGNhc2Ugd2hlcmUgcGFnZXNbaV0gaXMg
TlVMTCBoZXJlLiBPciBhbSBJCm1pc3NpbmcgYSBwZW5kaW5nIHBhdGNoIHRvIHB1dF91c2VyX3Bh
Z2VzKCkgaGVyZT8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
