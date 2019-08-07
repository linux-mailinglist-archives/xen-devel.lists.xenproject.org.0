Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24359841F8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvB5T-0005H5-S1; Wed, 07 Aug 2019 01:49:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wKeN=WD=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1hvB5S-0005H0-Di
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:49:58 +0000
X-Inumbo-ID: a8b453d1-b8b5-11e9-8980-bc764e045a96
Received: from hqemgate15.nvidia.com (unknown [216.228.121.64])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8b453d1-b8b5-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:49:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4a2e4e0000>; Tue, 06 Aug 2019 18:50:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 06 Aug 2019 18:49:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 06 Aug 2019 18:49:56 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Aug
 2019 01:49:55 +0000
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
Date: Tue, 6 Aug 2019 18:49:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1565142606; bh=Dn5BKjZ7JEBRqWgfa18GnM7OhUXy8yDZwMN3JIIxlGw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ikr1Z0QmiSe2izYZJH1uqOSC6icnToC0RNMEpxuB23chpfLBCzP3w/AieqLXvDTl5
 WiAJO8Q4P7LqaICg9w9tXQj3/iPr6N76Dc9IbqJMajQoyinrqFfwgCWwW9UnKbczaL
 GaLoALYFsFwWv8Sy+VSzQYK1xKYCINe6tMld2WSk4jzjh2UDaUm/4PS/zoETIOvAHY
 Cv7DiogcZErrjHQstqfLwjbbIS2N4ESoffKtD4ugOTExuz4uGt5TgMT8y01S0TheeO
 6qVWyeW6YYVimOARtYB9SW21zJJlrmRpt7UH+8pXV98uEPUBYTW77sxtUkB504xqpb
 D9OLrQ7tTourQ==
Subject: Re: [Xen-devel] [PATCH v3 00/39] put_user_pages(): miscellaneous
 call sites
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
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC82LzE5IDY6MzIgUE0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC4uLgo+IAo+IEpvaG4gSHViYmFy
ZCAoMzgpOgo+ICAgbW0vZ3VwOiBhZGQgbWFrZV9kaXJ0eSBhcmcgdG8gcHV0X3VzZXJfcGFnZXNf
ZGlydHlfbG9jaygpCi4uLgo+ICA1NCBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwg
MzIzIGRlbGV0aW9ucygtKQo+IAphaGVtLCB5ZXMsIGFwcGFyZW50bHkgdGhpcyBpcyB3aGF0IGhh
cHBlbnMgaWYgSSBhZGQgYSBmZXcgcGF0Y2hlcyB3aGlsZSBlZGl0aW5nCnRoZSBjb3ZlciBsZXR0
ZXIuLi4gOikgCgpUaGUgc3ViamVjdCBsaW5lIHNob3VsZCByZWFkICIwMC80MSIsIGFuZCB0aGUg
bGlzdCBvZiBmaWxlcyBhZmZlY3RlZCBoZXJlIGlzCnRoZXJlZm9yZSB1bmRlci1yZXBvcnRlZCBp
biB0aGlzIGNvdmVyIGxldHRlci4gSG93ZXZlciwgdGhlIHBhdGNoIHNlcmllcyBpdHNlbGYgaXMg
CmludGFjdCBhbmQgcmVhZHkgZm9yIHN1Ym1pc3Npb24uCgp0aGFua3MsCi0tIApKb2huIEh1YmJh
cmQKTlZJRElBCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
