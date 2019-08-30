Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A26A2C5B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 03:34:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Vjn-0005eF-B7; Fri, 30 Aug 2019 01:30:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3leF=W2=omnibond.com=hubcap@srs-us1.protection.inumbo.net>)
 id 1i3Vjl-0005Wn-SG
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 01:30:01 +0000
X-Inumbo-ID: af6031ac-cac5-11e9-8980-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af6031ac-cac5-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 01:30:01 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id l79so1834666ywe.11
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 18:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
 b=tRuQF9NGsWriwh9rOUGWV/XnpvxEIfrIBLDnzsNlL2DcXYptI5uYx9v9XRgXG9ikj+
 lAdRFBmN8WWgzpxjYwMBvOBMGH9vQkyzn/bAHiywFTqTy8Rv0zmy7NK3LdyKNjjgvNdr
 mcLlIarH9lbZWT5t7oU7MIVWXKIhgWd4FFEn+XvtJUHOlIO0rItLGA+Zt6tlzfYijXTt
 MmEvGy0xnlwDGgt/OUq/OkC9egtS+p7sT3eJ3BcAb9vNf6OatXnbSWZ0hHXVonsgbMVH
 pMy2zHMasv+EgzYrXDb3idQdrvXUOVYyNS1FKC2EzXUecfAda8U+O/uwCTXSTJ6SOTSm
 T3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
 b=fpdfnn1qPHRXy/5ysfQIqaru4KW53nUfkgKcFQS9mQ3W03Gu0JxXXybTIDMCZlsNz5
 9I8QKNgTPPcYzm6Fvf1KjOYa7v5Fnurs1P2BWPjSyHIjR4tb7SvI7676dTPqnHE+//y+
 Oowytti5jewrpOXm7hzfWdIgAnVUdR3IVOP7bgtKFVjg0HxEVKlyG1xnX+m0kyhLJ7T3
 AnGMSO9ABC7WY7JkwzeYO8xmJkErUcCarDUcq/MNS2DAOzBVlsaKzoA/zDOm45qGTUdl
 yoeUU4bXgR299HHTKe/wf5+iMwoA7mLmiSY6GxhMsJdtOfzxusIylnOHD2op64M9RaGo
 uk6Q==
X-Gm-Message-State: APjAAAV7mcbr7v0888iTKDyKiW8PGAUbR+cQjHtT0wqoJug/CWRmQH2e
 gB2qykICR2bx7287IpWubCiDZr8y8xo+2GhxAZPXgA==
X-Google-Smtp-Source: APXvYqyIDKOrxjb28zWL9kagM4gqNHMvZYp0EWQP/d+eBC6/dEWbXTKwXclpCyHxrYDHzsr0mwrMijbohn/hHGTlziQ=
X-Received: by 2002:a81:3681:: with SMTP id d123mr9802172ywa.348.1567128600919; 
 Thu, 29 Aug 2019 18:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
In-Reply-To: <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:29:50 -0400
Message-ID: <CAOg9mSQKGDywcMde2DE42diUS7J8m74Hdv+xp_PJhC39EXZQuw@mail.gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
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
 dri-devel@lists.freedesktop.org, linux-mm <linux-mm@kvack.org>,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, john.hubbard@gmail.com,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel <ceph-devel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSm9obi4uLgoKSSBhZGRlZCB0aGlzIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgTGludXggNS4z
cmM2IGFuZCByYW4KeGZzdGVzdHMgd2l0aCBubyByZWdyZXNzaW9ucy4uLgoKQWNrZWQtYnk6IE1p
a2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5jb20+CgotTWlrZQoKT24gVHVlLCBBdWcgNiwg
MjAxOSBhdCA5OjUwIFBNIEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gd3JvdGU6
Cj4KPiBPbiA4LzYvMTkgNjozMiBQTSwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPiA+
IEZyb206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiA+IC4uLgo+ID4KPiA+
IEpvaG4gSHViYmFyZCAoMzgpOgo+ID4gICBtbS9ndXA6IGFkZCBtYWtlX2RpcnR5IGFyZyB0byBw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkKPiAuLi4KPiA+ICA1NCBmaWxlcyBjaGFuZ2VkLCAx
OTEgaW5zZXJ0aW9ucygrKSwgMzIzIGRlbGV0aW9ucygtKQo+ID4KPiBhaGVtLCB5ZXMsIGFwcGFy
ZW50bHkgdGhpcyBpcyB3aGF0IGhhcHBlbnMgaWYgSSBhZGQgYSBmZXcgcGF0Y2hlcyB3aGlsZSBl
ZGl0aW5nCj4gdGhlIGNvdmVyIGxldHRlci4uLiA6KQo+Cj4gVGhlIHN1YmplY3QgbGluZSBzaG91
bGQgcmVhZCAiMDAvNDEiLCBhbmQgdGhlIGxpc3Qgb2YgZmlsZXMgYWZmZWN0ZWQgaGVyZSBpcwo+
IHRoZXJlZm9yZSB1bmRlci1yZXBvcnRlZCBpbiB0aGlzIGNvdmVyIGxldHRlci4gSG93ZXZlciwg
dGhlIHBhdGNoIHNlcmllcyBpdHNlbGYgaXMKPiBpbnRhY3QgYW5kIHJlYWR5IGZvciBzdWJtaXNz
aW9uLgo+Cj4gdGhhbmtzLAo+IC0tCj4gSm9obiBIdWJiYXJkCj4gTlZJRElBCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
