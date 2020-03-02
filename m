Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296D175897
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 11:46:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8iYZ-0002W4-IG; Mon, 02 Mar 2020 10:44:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wc/r=4T=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j8iYX-0002VG-Qn
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:44:13 +0000
X-Inumbo-ID: c0c58da4-5c72-11ea-9f35-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0c58da4-5c72-11ea-9f35-12813bfff9fa;
 Mon, 02 Mar 2020 10:44:12 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m13so12716473edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 02:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0YaPGz2sZfnd1r2PnGopz1B/F2/AB31yoLU+EXa1Bg=;
 b=YlSJBmQcjPDuFug6v4d5N1KQFuu3N+3YO5ZoR56keCnX2uJxhdlgytVUwg3bEBISR1
 3oOmgJ0EUBopte1ro2U1ILj2FcJl+doRNzPc0xktHo55vfPuRykxAK7yyFzPXVxpxzui
 a2D3/6A42sAPgwd3BZy2H/OV0Q6sx/NRpGnvae7VThKW9Z+SrvDTrxE4zKOMVvsCcSTq
 mj5zZNxywwR9C/zBbpOkwCuVFEmf18uvpH+vP800qOfQp1TndvddDaKEH0QULUgsUYs2
 bDu+XYUgGsq0jXTxDfNEeLIc7l53lK3L7kZT8bi2G7ofnEBTEfExRDrnJCFL9ZNltEFQ
 vpEA==
X-Gm-Message-State: APjAAAW/xTPLZ8fe8LelThZgFGPixYTo8GHE8HzMsRPrteA/D7ymVf8m
 lCFxtemPoDC0SRZz5tcssYo=
X-Google-Smtp-Source: APXvYqzI1n0iu7NcaULKu6Xy3/0JVVAZaqPuZEbzkX8ITm0p66sXkyIR08XHMd5TyHq3Gvr3BZdQ3A==
X-Received: by 2002:a17:906:a281:: with SMTP id
 i1mr14669896ejz.310.1583145851384; 
 Mon, 02 Mar 2020 02:44:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id cw15sm1153348edb.44.2020.03.02.02.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 02:44:10 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
 <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
 <cf139d45-13ba-668e-f2e9-b88180429db7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d817ac30-c57d-5db0-e48e-b4a6308e7733@xen.org>
Date: Mon, 2 Mar 2020 10:44:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cf139d45-13ba-668e-f2e9-b88180429db7@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/5] IOMMU: iommu_intremap is x86-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMi8wMy8yMDIwIDEwOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyOC4wMi4yMDIw
IDIxOjE2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOC8wMi8yMDIwIDEyOjI2LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IFByb3ZpZGUgYSAjZGVmaW5lIGZvciBvdGhlciBjYXNlczsgaXQg
ZGlkbid0IHNlZW0gd29ydGh3aGlsZSB0byBtZSB0bwo+Pj4gaW50cm9kdWNlIGFuIElPTU1VX0lO
VFJFTUFQIEtjb25maWcgb3B0aW9uIGF0IHRoaXMgcG9pbnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4KPj4+IC0tLSBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jCj4+PiBAQCAtMTI5OSw2ICsxMjk5LDggQEAgYm9vbGVhbiAoZS5nLiBgaW9t
bXU9bm9gKSBjYW4gb3ZlcnJpZGUgdAo+Pj4gICAgICAgZ2VuZXJhdGlvbiBvZiBJT01NVXMgb25s
eSBzdXBwb3J0ZWQgRE1BIHJlbWFwcGluZywgYW5kIEludGVycnVwdCBSZW1hcHBpbmcKPj4+ICAg
ICAgIGFwcGVhcmVkIGluIHRoZSBzZWNvbmQgZ2VuZXJhdGlvbi4KPj4+ICAgCj4+PiArICAgIFRo
aXMgb3B0aW9uIGlzIG5vdCB2YWxpZCBvbiBBcm0uCj4+Cj4+IFRoZSBsb25nZXZpdHkgb2YgdGhp
cyBjb21tZW50IHdvdWxkIGJlIGdyZWF0ZXIgaWYgaXQgd2VyZSBwaHJhc2VkIGFzICJpcwo+PiBv
bmx5IHZhbGlkIG9uIHg4NiIsIGVzcGVjaWFsbHkgZ2l2ZW4gdGhlIFJGQyBSSVNDViBzZXJpZXMg
b24gbGlzdC4KPiAKPiBIb3cgZG8gd2Uga25vdyBob3cgaW50cmVtYXAgaXMgZ29pbmcgdG8gd29y
ayBvbiBmdXR1cmUgcG9ydHM/CgpXZSBkb24ndCAga25vdy4gQnV0LCBmb3IgYSByZXZpZXdlciwg
aXQgaXMgZ29pbmcgdG8gYmUgbXVjaCBlYXNpZXIgdG8gCm5vdGljZSBhIGNvbW1hbmQgbGluZSBv
cHRpb24gaXMgZ29pbmcgdG8gYmUgdXNlZCBhcyB0aGUgcGF0Y2ggd291bGQgCm1vZGlmeSBhIGNh
bGxlci4KClNvIEkgYWdyZWUgd2l0aCBBbmRyZXcgdGhhdCB3ZSB3YW50IHRvIHNheSAib25seSB2
YWxpZCBvbiB4ODYiLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
