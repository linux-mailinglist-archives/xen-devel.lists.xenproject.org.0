Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D7EC94C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 20:57:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQczq-0006b1-VC; Fri, 01 Nov 2019 19:54:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j5OM=YZ=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iQczo-0006aw-O8
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 19:54:08 +0000
X-Inumbo-ID: 5db7680e-fce1-11e9-b7a7-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5db7680e-fce1-11e9-b7a7-bc764e2007e4;
 Fri, 01 Nov 2019 19:54:08 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c26so14446854qtj.10
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2019 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=YeDYRdeeYeznofBfYHEGTgJUYYibnJM0tHbeYYbzhUa89eqWcwDFuoBvkqzuDcLc2T
 ofUfxex6y2BB77lEIINYfCe3LRDUm2ccatiS5G5es+IEQBkayJMlTpCysQ5WVX1USGCS
 jgTaU5H2sKmYyCCp5OAsj9y1/GibOpmNaDDE7+kpDMj1ch/KbEMGdmr4C8OACqF5MRIR
 AUJyBIqsDG9vpkYNm8vhMLDcsm1loVPhr52oeBb6m4QlAeB/pAlZ5GeOmXDE0INv1FyD
 pucRz+47DC7NbtxxhTdRuHewQn65NgI1RX8osOjLNPQ54S6sL1WB7AFJyClzypTR7d0s
 bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=ONaCfd16H9MbbAdV4lyDlXBw7WD3MBV9E7ic2hWLc5QVy+hljt/KSjcaDh9KuQYkiL
 LtXRE5BJs9XNTal4RX1YT5Oy2drEoW645z6QT2zGSt49yP0lnjvQQGfD50i3TwRYpagX
 Z0sHS5kZz1HUxgfhCN7qCaPvtfsrXGGODHapw1kOAFzp8EmT2dCTYmefKKFtYzaoE13W
 6sutBfNWREG1lpyJGHkC3RN8AzUme56YtiB0XYpThEHxhmMmuWRxPfOWNKnjQttqbFpY
 TY3ybR+H5YcfQgN+cpNJK9VgnhziToZq7kHGYOpD5uPNICIa3xkbgQpbPv/1KyjK9E6t
 z0oQ==
X-Gm-Message-State: APjAAAW1/WaTiaEqTOBbrK00kC1X/42lqH0jzV9xNBm7jqwsM7PJDjmZ
 wKbLT+2DgHTjiuoWqvdDLgvHYw==
X-Google-Smtp-Source: APXvYqwugaF2JaYgADF6rOYRryDEd9+U+cO7L5fZ9F8hMoRL3wZJoN0ghN8hXeUNkkXowjkn9kbsRA==
X-Received: by 2002:a0c:fdcc:: with SMTP id g12mr11930964qvs.104.1572638047703; 
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id a18sm4727748qkc.2.2019.11.01.12.54.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQczm-00025n-Ng; Fri, 01 Nov 2019 16:54:06 -0300
Date: Fri, 1 Nov 2019 16:54:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Message-ID: <20191101195406.GA6732@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v2 00/15] Consolidate the mmu notifier
 interval_tree and locking
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

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDU6MTA6MTdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiA4
IG9mIHRoZSBtbXVfbm90aWZpZXIgdXNpbmcgZHJpdmVycyAoaTkxNV9nZW0sIHJhZGVvbl9tbiwg
dW1lbV9vZHAsIGhmaTEsCj4gc2NpZl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkgZHJpdmVycyBh
cmUgdXNpbmcgYSBjb21tb24gcGF0dGVybiB3aGVyZQo+IHRoZXkgb25seSB1c2UgaW52YWxpZGF0
ZV9yYW5nZV9zdGFydC9lbmQgYW5kIGltbWVkaWF0ZWx5IGNoZWNrIHRoZQo+IGludmFsaWRhdGlu
ZyByYW5nZSBhZ2FpbnN0IHNvbWUgZHJpdmVyIGRhdGEgc3RydWN0dXJlIHRvIHRlbGwgaWYgdGhl
Cj4gZHJpdmVyIGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhlbSB1c2UgYW4gaW50ZXJ2YWxfdHJl
ZSwgdGhlIG90aGVycyBhcmUKPiBzaW1wbGUgbGluZWFyIHNlYXJjaCBsaXN0cy4KCk5vdyB0aGF0
IHdlIGhhdmUgdGhlIG1vc3Qgb2YgdGhlIGRyaXZlciBjaGFuZ2VzIHRlc3RlZCBhbmQgcmV2aWV3
ZWQKSSdtIGdvaW5nIHRvIG1vdmUgdGhpcyBzZXJpZXMgaW50byBsaW51eC1uZXh0IHZpYSB0aGUg
aG1tIHRyZWUsIG1pbnVzCnRoZSB4ZW4gZ250ZGV2IHBhdGNoZXMgYXMgdGhleSBhcmUgbm90IHdv
cmtpbmcgeWV0LgoKSSB3aWxsIGtlZXAgY29sbGVjdGluZyBhY2tzIGFuZCBhbnkgYWRkaXRpb25h
bCBjaGFuZ2VzLgoKVGhhbmtzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
