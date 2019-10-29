Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D852BE88CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 13:53:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPQyE-000859-NV; Tue, 29 Oct 2019 12:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/gOV=YW=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPQyD-000854-2a
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 12:51:33 +0000
X-Inumbo-ID: d54f3c50-fa4a-11e9-8aca-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d54f3c50-fa4a-11e9-8aca-bc764e2007e4;
 Tue, 29 Oct 2019 12:51:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id l3so9438573qtp.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZF5YLLdkMxOeBnT3AEdovjyBEmTM+OTs+LDLPN0GMI8=;
 b=IHV+AJapDR5k8D6Zafc6ml2K0fa/jgF1PZBiuBMaOa/r+MK0PJ0xNtRtLiwXM8hfUM
 oyGHNxRN/O07FITOaIm5BnO1Box0mj0QkuPEB2wMXMWKVbmYTzXQRMncmXuCTctBu7gC
 91FIwEspUa/0nc1TUQ+oissChI6D4nJBO8DA40LneE6r/MnEh4dPTkicbi1e9mKDMq4W
 wpip0eIgYwCfGlBN5ll9Ug3VTlK7wx3iCECoDUwBIIk+qI/2gjDdaegrEPvi6otVA07c
 HtuIQ3uKH0+5jfdbr9pByZT3cPdoijw2I2FMN1xWV5tXm87jeYeH8MJjI7uCkOjTfH2C
 whzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZF5YLLdkMxOeBnT3AEdovjyBEmTM+OTs+LDLPN0GMI8=;
 b=gZYEl4QCAEqX9MauslRaOIe9ZEmJ8rauVyK1emXV0aHP7u1ug/EEJBshzpxLTuqkhs
 DVIrIfSUA8bQIddTQw9W5exMia2MFlvZqzQ34m8WRuJ4Ov2O6qfko++fmxNRtWz8ytZ6
 DEXYXDuDApMlZrkguehx81itgeH+AsGOlXS8caUBiaOZUib/TOk0QuybbiXkWu5yOaSn
 zBVewXrLoV3989Fzv+dUFh2aj1fdYZ/xhSFFsUwGp1kFmfrfBLA1G0XkC2+yvr94+wZg
 LagnaZscigjnX2ZTea3uQN0lhjutQjpbivy/O7aS2+asaLW/DLX32wnAlxNCbZGuJyku
 6xcQ==
X-Gm-Message-State: APjAAAX8YCCbAK29GJrLcoxDpvlEbfKU6MEXINw3+4z6QFqLiHSVA4uF
 JY9DV/Xbhrt+Vxdq6MNuIIgEJw==
X-Google-Smtp-Source: APXvYqxq0ay2DLP144wUqH2TJqeYs+CM1CzDDTCAEHT8qLG70HSD8wcaxvvKBHRgPHlzCMTknReLGQ==
X-Received: by 2002:ac8:219d:: with SMTP id 29mr4121236qty.280.1572353492189; 
 Tue, 29 Oct 2019 05:51:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id w69sm4027395qkb.26.2019.10.29.05.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 05:51:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPQyB-000522-4r; Tue, 29 Oct 2019 09:51:31 -0300
Date: Tue, 29 Oct 2019 09:51:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <20191029125131.GC6128@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-7-jgg@ziepe.ca>
 <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v2 06/15] RDMA/hfi1: Use
 mmu_range_notifier_inset for user_exp_rcv
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
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDg6MTk6MjBBTSAtMDQwMCwgRGVubmlzIERhbGVzc2Fu
ZHJvIHdyb3RlOgo+IE9uIDEwLzI4LzIwMTkgNDoxMCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Ogo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBU
aGlzIGNvbnZlcnRzIG9uZSBvZiB0aGUgdHdvIHVzZXJzIG9mIG1tdV9ub3RpZmllcnMgdG8gdXNl
IHRoZSBuZXcgQVBJLgo+ID4gVGhlIGNvbnZlcnNpb24gaXMgZmFpcmx5IHN0cmFpZ2h0Zm9yd2Fy
ZCwgaG93ZXZlciB0aGUgZXhpc3RpbmcgdXNlIG9mCj4gPiBub3RpZmllcnMgaGVyZSBzZWVtcyB0
byBiZSByYWNleS4KPiA+IAo+ID4gQ2M6IE1pa2UgTWFyY2luaXN6eW4gPG1pa2UubWFyY2luaXN6
eW5AaW50ZWwuY29tPgo+ID4gQ2M6IERlbm5pcyBEYWxlc3NhbmRybyA8ZGVubmlzLmRhbGVzc2Fu
ZHJvQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KPiAKPiBJIHRlc3RlZCB2MSwgYW5kIHJlcGxpZWQgdG8gaXQgWzFdLiBJIGNh
biByZS10ZXN0IHdpdGggdGhpcyB2ZXJzaW9uIGlmIHlvdQo+IGxpa2UgYXMgd2VsbC4KPiAKPiBb
MV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtcmRtYSZtPTE1NzIzNTEzMDYwNjQxMiZ3PTIK
CkkgdGhpbmsgaXQgaXMgZmluZSwgbm90aGluZyByZWFsbHkgY2hhbmdlZCBpbiB2MiwgdGhhbmtz
CgpKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
