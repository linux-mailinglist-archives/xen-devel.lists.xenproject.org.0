Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76967FC6D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 16:41:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htYh4-0006Iq-In; Fri, 02 Aug 2019 14:38:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TZme=V6=intel.com=keith.busch@srs-us1.protection.inumbo.net>)
 id 1htYS3-0005Se-6y
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 14:22:35 +0000
X-Inumbo-ID: f7cc8799-b530-11e9-8980-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7cc8799-b530-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 14:22:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 07:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="167245949"
Received: from unknown (HELO localhost.localdomain) ([10.232.112.69])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2019 07:22:29 -0700
Date: Fri, 2 Aug 2019 08:19:52 -0600
From: Keith Busch <keith.busch@intel.com>
To: john.hubbard@gmail.com
Message-ID: <20190802141952.GA18214@localhost.localdomain>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-27-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-27-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Mailman-Approved-At: Fri, 02 Aug 2019 14:38:05 +0000
Subject: Re: [Xen-devel] [PATCH 26/34] mm/gup_benchmark.c: convert
 put_page() to put_user_page*()
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, YueHaibing <yuehaibing@huawei.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDc6MTk6NTdQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCks
IHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRp
bmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+
IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29t
bWl0IGZjMWQ4ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFj
ZWhvbGRlciB2ZXJzaW9ucyIpLgo+IAo+IENjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gQ2M6IEtlaXRoIEJ1c2NoIDxrZWl0aC5idXNjaEBpbnRlbC5jb20+Cj4gQ2M6
IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbT4KPiBD
YzogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiBDYzogWXVlSGFpYmluZyA8
eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KCkxvb2tzIGZpbmUuCgpSZXZpZXdlZC1ieTogS2VpdGggQnVzY2gg
PGtlaXRoLmJ1c2NoQGludGVsLmNvbT4KCj4gIG1tL2d1cF9iZW5jaG1hcmsuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL21tL2d1cF9iZW5jaG1hcmsuYyBiL21tL2d1cF9iZW5jaG1hcmsuYwo+IGluZGV4IDdk
ZDYwMmQ3ZjhkYi4uNTE1YWM4ZWViNmVlIDEwMDY0NAo+IC0tLSBhL21tL2d1cF9iZW5jaG1hcmsu
Ywo+ICsrKyBiL21tL2d1cF9iZW5jaG1hcmsuYwo+IEBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBp
bnQgX19ndXBfYmVuY2htYXJrX2lvY3RsKHVuc2lnbmVkIGludCBjbWQsCj4gIAlmb3IgKGkgPSAw
OyBpIDwgbnJfcGFnZXM7IGkrKykgewo+ICAJCWlmICghcGFnZXNbaV0pCj4gIAkJCWJyZWFrOwo+
IC0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKPiArCQlwdXRfdXNlcl9wYWdlKHBhZ2VzW2ldKTsKPiAg
CX0KPiAgCWVuZF90aW1lID0ga3RpbWVfZ2V0KCk7Cj4gIAlndXAtPnB1dF9kZWx0YV91c2VjID0g
a3RpbWVfdXNfZGVsdGEoZW5kX3RpbWUsIHN0YXJ0X3RpbWUpOwo+IC0tIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
