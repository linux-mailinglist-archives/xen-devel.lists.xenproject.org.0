Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3EF4EC7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 15:56:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT5dK-0003a9-DJ; Fri, 08 Nov 2019 14:53:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SEz/=ZA=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iT5dI-0003a4-JY
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 14:53:04 +0000
X-Inumbo-ID: 7750e2d0-0237-11ea-984a-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7750e2d0-0237-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 14:53:03 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id w11so2268755qvu.13
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KbZhp4AkDu7Xm430isAdIZqP2fKWimvIRojP4EOaH94=;
 b=CnUhcgt/uCiHhFzG5fQwx/7yL/1CG4oXAa5rt7QVxsRyYE9BvjQnSrmpCegteZ6wG6
 UdbIqy2G3VBCdlFsOHxs/+U1RPE3dzDODchlcknxyMkLszr7SBFzpBBLTiddH4Tg08Ht
 mzvu2U3GfPtm+8nhuisFAzAvLGGBD26Rr2qKwRtahR5/cWZ9Dw2546KcysI5+LmkFl4f
 uw4TZt8ZwEN4pTKLcXSMHSPwzQXJJ83lX+Vu0OBNgSn6qsoG5vEKP04ONdCWloYbp4p+
 mbwxr54K0neA//wodYLjyKVnqB2cadeD0Xva/t+JRc+rAwGI6mVj5ESfMeaSIg5DxLSM
 vL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KbZhp4AkDu7Xm430isAdIZqP2fKWimvIRojP4EOaH94=;
 b=EyyRgWayHp3jrhLlODP+BvZtdeHVOzcdbOF+VBEp/gaV/Z5M66eN32zLl9ptywUWie
 zAf5LbzBWitSg313WY9kLwE2O+vWfYL5j+41BNQm+QqgTV/l69x2Ux6qYCYi1svKxGb/
 eCCRsp5VqGxaOYrhbjOKBtmjgO/BD3VywRVmR80eKEGY1f9Su3MFriqPdKznCHKwC8Si
 BVQB6O3lhkQPlNeVixR3zh5hMiBV6potAJDFkP0tFP2BuwDvzAKnG3xcyuI6l4Yek4Vq
 JPoKYJZJplI0PbEe0rR0UvzPF+puAFa4VDgI0DjRE+9dmErS8EOjriS1+lFk0UmfycBC
 qZcA==
X-Gm-Message-State: APjAAAUXL+5yrK4eeQ+/LdPusrKffKAp2t6ZYwV4aW67Ac0MsFUrtdRv
 SxoRLUDJcXKWlTM4FnbgTVUxyw==
X-Google-Smtp-Source: APXvYqxZ049SfJ3c2UO0ME4Y6QYpdzEBI6gXk0X7dNRcV8X3z8aw7kr92ScWfx2YoejxONb2FvDR8w==
X-Received: by 2002:a05:6214:11f2:: with SMTP id
 e18mr10122108qvu.86.1573224783191; 
 Fri, 08 Nov 2019 06:53:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o3sm3732759qta.3.2019.11.08.06.53.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Nov 2019 06:53:02 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iT5dF-0003YQ-V5; Fri, 08 Nov 2019 10:53:01 -0400
Date: Fri, 8 Nov 2019 10:53:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20191108145301.GD10956@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
 <20191105023108.GN22766@mellanox.com>
 <a62e58f6-d98b-1feb-d0ca-fb8210f3e831@oracle.com>
 <20191107203629.GF6730@ziepe.ca>
 <4a68acc6-3ce7-e26b-2c98-774867288410@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a68acc6-3ce7-e26b-2c98-774867288410@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v2 09/15] xen/gntdev: use
 mmu_range_notifier_insert
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
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDU6NTQ6NTJQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDExLzcvMTkgMzozNiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4g
T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTA6MTY6NDZBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+ID4KPiA+Pj4gU28sIEkgc3VwcG9zZSBpdCBjYW4gYmUgcmVsYXhlZCB0byBhIG51
bGwgdGVzdCBhbmQgYSBXQVJOX09OIHRoYXQgaXQKPiA+Pj4gaGFzbid0IGNoYW5nZWQ/Cj4gPj4g
WW91IG1lYW4KPiA+Pgo+ID4+IGlmICh1c2VfcHRlbW9kKSB7Cj4gPj4gwqDCoMKgwqDCoMKgwqAg
V0FSTl9PTihtYXAtPnZtYSAhPSB2bWEpOwo+ID4+IMKgwqDCoMKgwqDCoMKgIC4uLgo+ID4+Cj4g
Pj4KPiA+PiBZZXMsIHRoYXQgc291bmRzIGdvb2QuCj4gPiBJIGFtZW5kZWQgbXkgY29weSBvZiB0
aGUgcGF0Y2ggd2l0aCB0aGUgYWJvdmUsIGhhcyB0aGlzIHJld29yayBzaG93bgo+ID4gc2lnbnMg
b2Ygd29ya2luZz8KPiAKPiBZZXMsIGl0IHdvcmtzIGZpbmUuCj4gCj4gQnV0IHBsZWFzZSBkb24n
dCBmb3JnZXQgbm90aWZpZXIgb3BzIGluaXRpYWxpemF0aW9uLgo+IAo+IFdpdGggdGhvc2UgdHdv
IGNoYW5nZXMsCj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CgpUaGFua3MsIEkgZ290IGJvdGggdGhpbmdzLiBJJ2xsIGZvcndhcmQg
dGhpcyB0b3dhcmQgbGludXgtbmV4dCBhbmQKcmVwb3N0IGEgdjMgCgpKYXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
