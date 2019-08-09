Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3086F56
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 03:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvtg7-0003o2-NN; Fri, 09 Aug 2019 01:26:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9Y0=WF=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1hvtg6-0003nx-6Q
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 01:26:46 +0000
X-Inumbo-ID: bfbcf691-ba44-11e9-8980-bc764e045a96
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bfbcf691-ba44-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 01:26:45 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4ccbd50000>; Thu, 08 Aug 2019 18:26:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 08 Aug 2019 18:26:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 08 Aug 2019 18:26:43 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Aug
 2019 01:26:42 +0000
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-39-jhubbard@nvidia.com>
 <87k1botdpx.fsf@concordia.ellerman.id.au>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <248c9ab2-93cc-6d8b-606d-d85b83e791e5@nvidia.com>
Date: Thu, 8 Aug 2019 18:26:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k1botdpx.fsf@concordia.ellerman.id.au>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1565314005; bh=mIo2y95DYwpm5TwfN0ChMwsAj72bzfnkFfj+rLdjqVU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=sN/0osHqfMASG3Gn5uYJsmBevNgkDITrwy5z0XhYDRnSVjTtczC6Zn93vXUVACtgl
 zsE5J5OQn1U0e8RQtUv/QuY5iXNoztc7U7xk0b8D/XTbbdQX85oERprBP+FlchEBmH
 cDA/Z0zP30Are5EcBXQtJgaAWOYtGMQytxGRabpoiJwuifLVi+3nH2crRLrU8L/jsz
 NjANrKoFZE22mpOq52s3fZ9ut+mKAUlAXHfdi2WiqPjr5KVieTASv9oPdSZ5QUx628
 sL0qbeXqIPI+CnsO9wdJm+9w+qSRY9+X67MIO8EOa4e3TPJTGVb16/VuBW7YteYrzL
 bdoBRcdIA11ng==
Subject: Re: [Xen-devel] [PATCH v3 38/41] powerpc: convert put_page() to
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDEwOjQyIFBNLCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+IEhpIEpvaG4sCj4g
Cj4gam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cml0ZXM6Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQv
aW9tbXVfYXBpLmMKPj4gaW5kZXggYjA1NmNhZTMzODhiLi5lMTI2MTkzYmEyOTUgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwo+PiArKysgYi9hcmNo
L3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKPj4gQEAgLTIwMyw2ICsyMDIsNyBAQCBz
dGF0aWMgdm9pZCBtbV9pb21tdV91bnBpbihzdHJ1Y3QgbW1faW9tbXVfdGFibGVfZ3JvdXBfbWVt
X3QgKm1lbSkKPj4gIHsKPj4gIAlsb25nIGk7Cj4+ICAJc3RydWN0IHBhZ2UgKnBhZ2UgPSBOVUxM
Owo+PiArCWJvb2wgZGlydHkgPSBmYWxzZTsKPiAKPiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRo
YXQgaW5pdGlhbGlzYXRpb24gZG8geW91Pwo+IAoKTm9wZSwgaXQgY2FuIGdvLiBGaXhlZCBsb2Nh
bGx5LCB0aGFua3MuCgpEaWQgeW91IGdldCBhIGNoYW5jZSB0byBsb29rIGF0IGVub3VnaCBvZiB0
aGUgb3RoZXIgYml0cyB0byBmZWVsIGNvbWZvcnRhYmxlIAp3aXRoIHRoZSBwYXRjaCwgb3ZlcmFs
bD8KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
