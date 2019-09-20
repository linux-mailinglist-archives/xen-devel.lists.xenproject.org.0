Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5DBB8896
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 02:34:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB6pw-0003iu-7n; Fri, 20 Sep 2019 00:31:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iB6pu-0003ik-PG
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 00:31:46 +0000
X-Inumbo-ID: 06d0761c-db3e-11e9-978d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06d0761c-db3e-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 00:31:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B41820C01;
 Fri, 20 Sep 2019 00:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568939505;
 bh=A7L/ELLVkFwt8pXcQQlF/2s5MOF9uZOZx5w7hCyguYs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OvT1p1akX7Jtn5F43g9ua+TbpkudYnPR2m4RPeYqKkHljpUirXAdLycUiBuK3CUZa
 M83e7KHDGq1UFvpNKmnkSHXWOi2Poivh2eTlhtj9LZcYZxO8dc2YEnbIzpslBaqhVJ
 TnQ/3MV4yN7PUldRXjdpF0oDcIJuHmy5zA4Q2PEE=
Date: Thu, 19 Sep 2019 17:31:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <ccfee255-79e1-43f1-a92b-28c6c3ab6606@gmail.com>
Message-ID: <alpine.DEB.2.21.1909191730070.19418@sstabellini-ThinkPad-T480s>
References: <20190820122255.9864-1-julien.grall@arm.com>
 <ccfee255-79e1-43f1-a92b-28c6c3ab6606@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: iommu: Panic if not all IOMMUs are
 initialized
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMCBBdWcgMjAxOSwgT2xla3NhbmRyIHdyb3RlOgo+IAo+IE9uIDIwLjA4LjE5IDE1
OjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gSGksIEp1bGllbgo+IAo+ID4gICAtICAgIGlv
bW11X3NldHVwKCk7Cj4gPiArICAgIHJjID0gaW9tbXVfc2V0dXAoKTsKPiA+ICsgICAgaWYgKCAh
aW9tbXVfZW5hYmxlZCAmJiByYyAhPSAtRU5PREVWICkKPiA+ICsgICAgICAgIHBhbmljKCJDb3Vs
ZG4ndCBjb25maWd1cmUgY29ycmVjdGx5IGFsbCB0aGUgSU9NTVVzLiIpOwo+ID4gICAKPiAKPiBQ
bGVhc2UgYWRkICJcbiIKPiAKPiAKPiBZb3UgY2FuIGFkZDoKPiAKPiBUZXN0ZWQtYnk6IE9sZWtz
YW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KClJldmlld2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpJIGFkZGVk
IHRoZSAiXG4iLCBmaXhlZCBhIHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBhbmQgY29tbWl0
dGVkIHRoZQpwYXRjaC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
