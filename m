Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825BFEC878
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 19:28:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQbcl-0006rj-JB; Fri, 01 Nov 2019 18:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j5OM=YZ=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iQbck-0006rd-J4
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 18:26:14 +0000
X-Inumbo-ID: 16021466-fcd5-11e9-862d-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16021466-fcd5-11e9-862d-bc764e2007e4;
 Fri, 01 Nov 2019 18:26:13 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o11so9024892qtr.11
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2019 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gf48vjpUJOI371bNO6wuyPSeEKQoVC5o/vcfCQf27GI=;
 b=JWQs9dhnB75sOXYZXe00Sx8Ycjn6wXVLJb4bA4loebrzhAwONRCd3M5hdaM0XcPXz1
 0pyWtlLrDj1njuvPs0zQ0ulMeEyYu9AvLupxmw9YV4Vil+0G3KASfmA7bMmkBjsVbLm0
 NwKPrT73FZLPw9yxM2LsvyNjyyW57QaAakB9IZRdrjquWCFH5qzR698e9e1ojGeAZOIU
 KBToGNUChheA/LNzlqzqO22UYmvZ00/yxcgviEIwglK7aIkeobtD5FAioyP3loLN1pgO
 xAWVbCdTVv2/yYYX7qXzDiZnl3pkn6y+wuJtS5dp5Cn2pGV9z3geaSwd6yE4+Biq0CTg
 qgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gf48vjpUJOI371bNO6wuyPSeEKQoVC5o/vcfCQf27GI=;
 b=n1BG5yLCXk8F0Fqd1KBNeedAKmrtK73q6QhZS0MD33VZQy66KggvQGXyOJSaM1QpUq
 2k3/bRyrtirv22SnkVMHjA3qN0ABXKRQtEoayNY3MSwi6v1B0NnVVeh0/TYghMMwY1+D
 Oi9V0lz9bqNR4HTCdZVBZcw4852JVXZHnx02SaTXxW9ELpaz1PmPa8Rsz59K7RR7ifW3
 slzL63x+QKIHSHqDjaca/M5jCDd+KpRm0ONq3okC2L/rUCgGcEKtD4bZmSTEy1s1vEot
 I/VAvdoXumGSQPSLAQPUMvZpu9Iio00qinrOhidH8f8HX/DzlPe17NssbF7r0gn6tSTj
 5miw==
X-Gm-Message-State: APjAAAXbjv4coswUqv/REZ31PXEDgCBfX83kpt2/SwyZW495DEQKZZuh
 9x5yH5G/2YJjF+KaiZKERpkQXA==
X-Google-Smtp-Source: APXvYqxlEpFiUQP9ickqdfrdsM0skeumHMpJp062tTi17mtiKR8bSsZEkpehUJ8EZgMrejKnz1agZQ==
X-Received: by 2002:a0c:8884:: with SMTP id 4mr11433684qvn.248.1572632773480; 
 Fri, 01 Nov 2019 11:26:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id x10sm5932634qtj.25.2019.11.01.11.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 11:26:12 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQbci-0008HC-0J; Fri, 01 Nov 2019 15:26:12 -0300
Date: Fri, 1 Nov 2019 15:26:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Message-ID: <20191101182611.GA31478@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-9-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028201032.6352-9-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v2 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDU6MTA6MjVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBE
TUFfU0hBUkVEX0JVRkZFUiBjYW4gbm90IGJlIGVuYWJsZWQgYnkgdGhlIHVzZXIgKGl0IHJlcHJl
c2VudHMgYSBsaWJyYXJ5Cj4gc2V0IGluIHRoZSBrZXJuZWwpLiBUaGUga2NvbmZpZyBjb252ZW50
aW9uIGlzIHRvIHVzZSBzZWxlY3QgZm9yIHN1Y2gKPiBzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5l
ZCBvbiBpbXBsaWNpdGx5IHdoZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcKPiB0aGF0IG5l
ZWRzIHRoZW0uCj4gCj4gT3RoZXJ3aXNlIHRoZSBYRU5fR05UREVWX0RNQUJVRiBrY29uZmlnIGlz
IG92ZXJseSBkaWZmaWN1bHQgdG8gZW5hYmxlLgo+IAo+IEZpeGVzOiA5MzJkNjU2MjE3OWUgKCJ4
ZW4vZ250ZGV2OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBkbWEtYnVmIFVBUEkiKQo+IENjOiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJl
dmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMyArKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKSnVlcmdlbi9PbGVrc2FuZHIv
WGVuIE1haW50YWluZXJzOgoKV291bGQgeW91IHRha2UgdGhpcyBwYXRjaCB0aHJvdWdoIGEgeGVu
IHJlbGF0ZWQgdHJlZT8gVGhlIG9ubHkgcmVhc29uCkkgaGFkIGluIHRoaXMgc2VyaWVzIGlzIHRv
IG1ha2UgaXQgZWFzaWVyIHRvIGNvbXBpbGUtdGVzdCB0aGUgZ250ZGV2CmNoYW5nZXMuCgpTaW5j
ZSBpdCBpcyBsb29raW5nIGxpa2UgdGhlIGdudGRldiByZXdvcmsgbWlnaHQgbm90IG1ha2UgaXQg
dGhpcwpjeWNsZSBpdCBpcyBwcm9iYWJseSBiZXN0IGZvciB5b3UgdG8gdGFrZSBpdC4KClRoYW5r
cywKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
