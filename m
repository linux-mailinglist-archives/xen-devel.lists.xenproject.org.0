Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AC8010F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 21:37:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htdKJ-0000Nd-Bl; Fri, 02 Aug 2019 19:34:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FB0v=V6=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1htdKI-0000NY-BP
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 19:34:54 +0000
X-Inumbo-ID: 992805b8-b55c-11e9-8980-bc764e045a96
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 992805b8-b55c-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 19:34:52 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d44905c0000>; Fri, 02 Aug 2019 12:34:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 12:34:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 12:34:51 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 19:34:50 +0000
To: Peter Zijlstra <peterz@infradead.org>, <john.hubbard@gmail.com>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
 <20190802080554.GD2332@hirez.programming.kicks-ass.net>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8968c928-5712-03a9-68df-051f5b58fdbc@nvidia.com>
Date: Fri, 2 Aug 2019 12:33:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802080554.GD2332@hirez.programming.kicks-ass.net>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564774492; bh=+4YFr8hVqt3rnBZzpE/CDXaE3u2NtyGgeA2+CHyqUUg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=pA8QugcwnL1HNNctuTXTMAa7CrBYZtv2cc2QzVDHg2S/Xz0x5cf9O8eGtP0C46aN6
 a197cn16D9E9xYsYwbovYwvjP0hTnTIrSK10+fiYfbToCUN0I9g4iXpjbE6kGTwrAp
 ncKdQLJTA/SOQtWLtiZt5vxeEAtfkDytTOFqyC79V99rQnUwNH1zBFEyzb+BV4yCcg
 0Lb+HCJur/Jv3WTiflqOcCteevFh1AJi/C8c1Ka1hIgLd+uE9NAbY1wcjbuQJmv03/
 F2ke8dbjLXpL5/tEd8euZ6kSYJfMWxVRqMIbW34EAHrZytttzmbzNNCLzf8Qy6VEOi
 6Ny99XF1JiDWQ==
Subject: Re: [Xen-devel] [PATCH 00/34] put_user_pages(): miscellaneous call
 sites
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yLzE5IDE6MDUgQU0sIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIFRodSwgQXVnIDAx
LCAyMDE5IGF0IDA3OjE2OjE5UE0gLTA3MDAsIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6
Cj4gCj4+IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQg
aW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAo+PiAoIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSoo
KSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4gVGhhdCBjb21taXQKPj4gaGFzIGFuIGV4dGVuc2l2
ZSBkZXNjcmlwdGlvbiBvZiB0aGUgcHJvYmxlbSBhbmQgdGhlIHBsYW5uZWQgc3RlcHMgdG8KPj4g
c29sdmUgaXQsIGJ1dCB0aGUgaGlnaGxpdGVzIGFyZToKPiAKPiBUaGF0IGlzIG9uZSBob3JyaWRs
eSBtYW5nbGVkIENoYW5nZWxvZyB0aGVyZSA6LS8gSXQgbG9va3MgbGlrZSBpdCdzCj4gcGFydGlh
bGx5IGR1cGxpY2F0ZWQuCgpZZWFoLiBJdCB0b29rIHNvIGxvbmcgdG8gbWVyZ2UgdGhhdCBJIHRo
aW5rIEkgd2FzIG5vIGxvbmdlciBhYmxlIHRvCmFjdHVhbGx5IHNlZSB0aGUgY29tbWl0IGRlc2Ny
aXB0aW9uLCBhZnRlciBOIHJlYWRpbmdzLiBzaWdoCgo+IAo+IEFueXdheTsgbm8gb2JqZWN0aW9u
cyB0byBhbnkgb2YgdGhhdCwgYnV0IEkganVzdCB3YW50ZWQgdG8gbWVudGlvbiB0aGF0Cj4gdGhl
cmUgYXJlIG90aGVyIHByb2JsZW1zIHdpdGggbG9uZyB0ZXJtIHBpbm5pbmcgdGhhdCBoYXZlbid0
IGJlZW4KPiBtZW50aW9uZWQsIG5vdGFibHkgdGhleSBpbmhpYml0IGNvbXBhY3Rpb24uCj4gCj4g
QSBsb25nIHRpbWUgYWdvIEkgcHJvcG9zZWQgYW4gaW50ZXJmYWNlIHRvIG1hcmsgcGFnZXMgYXMg
cGlubmVkLCBzdWNoCj4gdGhhdCB3ZSBjb3VsZCBydW4gY29tcGFjdGlvbiBiZWZvcmUgd2UgYWN0
dWFsbHkgZGlkIHRoZSBwaW5uaW5nLgo+IAoKVGhpcyBpcyBhbGwgaGVhZGluZyB0b3dhcmQgbWFy
a2luZyBwYWdlcyBhcyBwaW5uZWQsIHNvIHdlIHNob3VsZCBmaW5hbGx5CmdldCB0aGVyZS4gIEkn
bGwgcG9zdCB0aGUgUkZDIGZvciB0cmFja2luZyBwaW5uZWQgcGFnZXMgc2hvcnRseS4KCgp0aGFu
a3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
