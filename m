Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F844800F1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 21:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htdCW-00085X-FQ; Fri, 02 Aug 2019 19:26:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FB0v=V6=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1htdCV-00085S-HL
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 19:26:51 +0000
X-Inumbo-ID: 73ecc2ae-b55b-11e9-9edd-4782ea6b1ebb
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73ecc2ae-b55b-11e9-9edd-4782ea6b1ebb;
 Fri, 02 Aug 2019 19:26:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d448e710000>; Fri, 02 Aug 2019 12:26:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 12:26:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 12:26:39 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 19:26:39 +0000
To: "Weiny, Ira" <ira.weiny@intel.com>, Juergen Gross <jgross@suse.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
 <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
 <d4931311-db01-e8c3-0f8c-d64685dc2143@suse.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79E66216@CRSMSX101.amr.corp.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <746b2412-f48a-9722-2763-253a1b9c899d@nvidia.com>
Date: Fri, 2 Aug 2019 12:25:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79E66216@CRSMSX101.amr.corp.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564774001; bh=rRhheBqnK3+cjDjuz6CHnpsz5YflbO5z8PXp1A2YK5w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=byi/JLB7CNtV06561y8XoJ3SAPfLWvMAReG7pbHQL4vyYMWIeKNh0N7pvRnXFQG1L
 qdrcKeqyYLdfyHlBvNt3iltX04f4l9yslTmpDdtWvq1t3b7bkuO+rrbkZHys+WsmhV
 6Aa9W+8qQAz5X83c7tyDcDc6Mg36wKOuzq27pabbfn+69ez0SBMHEuaNtlKh20Fcaj
 gTip6LdymKj+uFDjnVTxb7sYVNWRS9rebCu5gBiFOf/CT8TUXKtD/8+Sk9b10OKO7l
 1Y0kk6maXEh1JdSy6qqRDc1JYyIdeVQu9Kdnt4cKXn6PzYq3IXSks/FI+pwJb3dRVj
 9ZhtT6T5hfRNQ==
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams, Dan
 J" <dan.j.williams@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yLzE5IDk6MDkgQU0sIFdlaW55LCBJcmEgd3JvdGU6Cj4+Cj4+IE9uIDAyLjA4LjE5IDA3
OjQ4LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+PiBPbiA4LzEvMTkgOTozNiBQTSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+PiBPbiAwMi4wOC4xOSAwNDoxOSwgam9obi5odWJiYXJkQGdtYWlsLmNv
bSB3cm90ZToKPj4+Pj4gRnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+
Pj4gLi4uCj4+PiBJZiB0aGF0J3Mgbm90IHRoZSBjYXNlIChib3RoIGhlcmUsIGFuZCBpbiAzIG9y
IDQgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzCj4+PiBzZXJpZXMsIHRoZW4gYXMgeW91IHNhaWQsIEkg
c2hvdWxkIGFkZCBOVUxMIGNoZWNrcyB0byBwdXRfdXNlcl9wYWdlcygpCj4+PiBhbmQgcHV0X3Vz
ZXJfcGFnZXNfZGlydHlfbG9jaygpLgo+Pgo+PiBJbiB0aGlzIGNhc2UgaXQgaXMgbm90IGNvcnJl
Y3QsIGJ1dCBjYW4gZWFzaWx5IGJlIGhhbmRsZWQuIFRoZSBOVUxMIGNhc2UgY2FuCj4+IG9jY3Vy
IG9ubHkgaW4gYW4gZXJyb3IgY2FzZSB3aXRoIHRoZSBwYWdlcyBhcnJheSBmaWxsZWQgcGFydGlh
bGx5IG9yIG5vdCBhdCBhbGwuCj4+Cj4+IEknZCBwcmVmZXIgc29tZXRoaW5nIGxpa2UgdGhlIGF0
dGFjaGVkIHBhdGNoIGhlcmUuCj4gCj4gSSdtIG5vdCBhbiBleHBlcnQgaW4gdGhpcyBjb2RlIGFu
ZCBoYXZlIG5vdCBsb29rZWQgYXQgaXQgY2FyZWZ1bGx5IGJ1dCB0aGF0IHBhdGNoIGRvZXMgc2Vl
bSB0byBiZSB0aGUgYmV0dGVyIGZpeCB0aGFuIGZvcmNpbmcgTlVMTCBjaGVja3Mgb24gZXZlcnlv
bmUuCj4gCgpPSywgSSdsbCB1c2UgSnVlcmdlbidzIGFwcHJvYWNoLCBhbmQgYWxzbyBjaGVjayBm
b3IgdGhhdCBwYXR0ZXJuIGluIHRoZQpvdGhlciBwYXRjaGVzLgoKCnRoYW5rcywKLS0gCkpvaG4g
SHViYmFyZApOVklESUEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
