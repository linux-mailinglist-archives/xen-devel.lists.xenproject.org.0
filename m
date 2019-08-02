Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148A7F069
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTnF-0007VU-4N; Fri, 02 Aug 2019 09:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7E5P=V6=linux.intel.com=joonas.lahtinen@srs-us1.protection.inumbo.net>)
 id 1htTis-0006mG-VK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:19:38 +0000
X-Inumbo-ID: a41d6672-b506-11e9-ab74-13a3fba383f0
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a41d6672-b506-11e9-ab74-13a3fba383f0;
 Fri, 02 Aug 2019 09:19:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 02:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; d="scan'208";a="178105348"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.3.11])
 by orsmga006.jf.intel.com with ESMTP; 02 Aug 2019 02:19:23 -0700
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>, john.hubbard@gmail.com
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190802022005.5117-7-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-7-jhubbard@nvidia.com>
Message-ID: <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Date: Fri, 02 Aug 2019 12:19:22 +0300
X-Mailman-Approved-At: Fri, 02 Aug 2019 09:24:08 +0000
Subject: Re: [Xen-devel] [PATCH 06/34] drm/i915: convert put_page() to
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-block@vger.kernel.org,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UXVvdGluZyBqb2huLmh1YmJhcmRAZ21haWwuY29tICgyMDE5LTA4LTAyIDA1OjE5OjM3KQo+IEZy
b206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBGb3IgcGFnZXMgdGhh
dCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFzZSB0aG9zZSBwYWdl
cwo+IHZpYSB0aGUgbmV3IHB1dF91c2VyX3BhZ2UqKCkgcm91dGluZXMsIGluc3RlYWQgb2Ygdmlh
IHB1dF9wYWdlKCkgb3IKPiByZWxlYXNlX3BhZ2VzKCkuCj4gCj4gVGhpcyBpcyBwYXJ0IGEgdHJl
ZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4g
KCJtbTogaW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIiku
Cj4gCj4gTm90ZSB0aGF0IHRoaXMgZWZmZWN0aXZlbHkgY2hhbmdlcyB0aGUgY29kZSdzIGJlaGF2
aW9yIGluCj4gaTkxNV9nZW1fdXNlcnB0cl9wdXRfcGFnZXMoKTogaXQgbm93IGNhbGxzIHNldF9w
YWdlX2RpcnR5X2xvY2soKSwKPiBpbnN0ZWFkIG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMg
cHJvYmFibHkgbW9yZSBhY2N1cmF0ZS4KCldlJ3ZlIGFscmVhZHkgZml4ZWQgdGhpcyBpbiBkcm0t
dGlwIHdoZXJlIHRoZSBjdXJyZW50IGNvZGUgdXNlcwpzZXRfcGFnZV9kaXJ0eV9sb2NrKCkuCgpU
aGlzIHdvdWxkIGNvbmZsaWN0IHdpdGggb3VyIHRyZWUuIFJvZHJpZ28gaXMgaGFuZGxpbmcKZHJt
LWludGVsLW5leHQgZm9yIDUuNCwgc28geW91IGd1eXMgd2FudCB0byBjb29yZGluYXRlIGhvdwp0
byBtZXJnZS4KClJlZ2FyZHMsIEpvb25hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
