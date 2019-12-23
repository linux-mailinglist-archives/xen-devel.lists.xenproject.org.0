Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E41299DE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 19:26:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijSMp-0006iZ-AT; Mon, 23 Dec 2019 18:23:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I8bJ=2N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ijSMn-0006iU-Un
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 18:23:41 +0000
X-Inumbo-ID: 53c5f056-25b1-11ea-a1e1-bc764e2007e4
Received: from mail-qv1-f67.google.com (unknown [209.85.219.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53c5f056-25b1-11ea-a1e1-bc764e2007e4;
 Mon, 23 Dec 2019 18:23:33 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id l14so6642411qvu.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 10:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nOzPFAK2bTyhT4wJmWJWyqCW1ptomBkZ3swWdCSZW4U=;
 b=PAt+D0mA47kHZevc+AgkOAn5wLU/ACoc/8OUx7ZJeOSte/4nP3gngvxcYQZKpetFdf
 4UnfqrnC6Am1znj8beu0G2Ad5xjT7awAcEAsTUBg8A2yrDXyAixHy3s23buxii0ZwjE5
 1EJxLBhMAHOi97zSbXquDnaw48RvjKnrmTp/20ZVvY6g/a2D6IGBFnb/s+zNoOT8lE8y
 61X0vXronO8+td67qjCvqfwitde5UumCiN4Dyv4MtUYKQAcGTG+jVJ+o+BFG20Y0nttC
 AENqJqmltM9nzjYALY6NIURn0NDQIgkj8yA5+sh5k3e+NgP2bkeytU06vg/Cij6lenIP
 t2KA==
X-Gm-Message-State: APjAAAVmgwOYumMc0z71/lglr70Ao52ba4xjHT8TzqPmplPIHnzBZEKQ
 JiQTns7bCIMxYQaBDENTUMY=
X-Google-Smtp-Source: APXvYqxIvk0BPG57oA/vm2XDLwk29qEIvQpZQsAvWBBoU6cbC/OFXxX8SjJte411rQt0uY4R3po6WA==
X-Received: by 2002:ad4:46c3:: with SMTP id g3mr24477696qvw.60.1577125411549; 
 Mon, 23 Dec 2019 10:23:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id u4sm5918296qkh.59.2019.12.23.10.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 10:23:30 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ccafa7fc-5cd2-2d3f-a62f-0185ff8ca5e1@xen.org>
Date: Mon, 23 Dec 2019 19:23:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191217201550.15864-5-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8xMi8yMDE5IDIxOjE1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IHhjX2RvbV9w
Mm0oKSBhbmQgZG9tLT5wMm1faG9zdFtdIGltcGxlbWVudCBhIGxpbmVhciB0cmFuc2Zvcm0gZm9y
IHRyYW5zbGF0ZWQKPiBkb21haW5zLCBidXQgd2FzdGUgYSBzdWJzdGFudGlhbCBjaHVuayBvZiBS
QU0gZG9pbmcgc28uCj4gCj4gQVJNIGxpdGVyYWxseSBuZXZlciByZWFkcyBkb20tPnAybV9ob3N0
W10gKGJlY2F1c2Ugb2YgdGhlIHhjX2RvbV90cmFuc2xhdGVkKCkKPiBzaG9ydCBjaXJjdWl0IGlu
IHhjX2RvbV9wMm0oKSkuICBEcm9wIGl0IGFsbC4KPiAKPiB4ODYgSFZNIGRvZXMgdXNlIGRvbS0+
cDJtX2hvc3RbXSBmb3IgeGNfZG9tYWluX3BvcHVsYXRlX3BoeXNtYXBfZXhhY3QoKSBjYWxscwo+
IHdoZW4gcG9wdWxhdGluZyA0ayBwYWdlcy4gIFJldXNlIHRoZSBzYW1lIHRhY3RpYyBmcm9tIDJN
LzFHIHJhbmdlcyBhbmQgdXNlIGFuCj4gb24tc3RhY2sgYXJyYXkgaW5zdGVhZC4gIERyb3AgdGhl
IG1lbW9yeSBhbGxvY2F0aW9uLgo+IAo+IHg4NiBQViBndWVzdHMgZG8gdXNlIGRvbS0+cDJtX2hv
c3RbXSBhcyBhIG5vbi1pZGVudGl0eSB0cmFuc2Zvcm0uICBSZW5hbWUgdGhlCj4gZmllbGQgdG8g
cHZfcDJtIHRvIG1ha2UgaXQgY2xlYXIgaXQgaXMgUFYtb25seS4KCk5pY2UgY2xlYW51cCEgVGhp
cyB3aWxsIHByb2JhYmx5IG1ha2Ugc2xpZ2h0bHkgZmFzdGVyIGd1ZXN0IGJvb3QgOikuCgo+IEBA
IC0zNTksNyArMzU2LDYgQEAgc3RhdGljIGludCBwb3B1bGF0ZV9ndWVzdF9tZW1vcnkoc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tLAo+ICAgc3RhdGljIGludCBtZW1pbml0KHN0cnVjdCB4Y19kb21f
aW1hZ2UgKmRvbSkKPiAgIHsKPiAgICAgICBpbnQgaSwgcmM7Cj4gLSAgICB4ZW5fcGZuX3QgcGZu
Owo+ICAgICAgIHVpbnQ2NF90IG1vZGJhc2U7Cj4gICAKPiAgICAgICB1aW50NjRfdCByYW1zaXpl
ID0gKHVpbnQ2NF90KWRvbS0+dG90YWxfcGFnZXMgPDwgWENfUEFHRV9TSElGVDsKPiBAQCAtNDIz
LDExICs0MTksNiBAQCBzdGF0aWMgaW50IG1lbWluaXQoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9t
KQo+ICAgICAgIGFzc2VydChyYW1zaXplID09IDApOyAvKiBUb28gbXVjaCBSQU0gaXMgcmVqZWN0
ZWQgYWJvdmUgKi8KPiAgIAo+ICAgICAgIGRvbS0+cDJtX3NpemUgPSBwMm1fc2l6ZTsKCkRvIHdl
IG5lZWQgdG8ga2VlcCBwMm1fc2l6ZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
