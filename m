Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8326E63F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSn4-0000bu-Io; Fri, 19 Jul 2019 13:19:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVhr=VQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hoSn3-0000bj-DO
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:19:13 +0000
X-Inumbo-ID: cbdd800c-aa27-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbdd800c-aa27-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:19:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h19so23722487wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJkzhqZVEKMa7moNQ32Yx7jXHKc/DZB0PA4oZ7PblaY=;
 b=SyW35oX6UaFeHR2nFiBfvhPSBcHWq26+2CtKSAA+KhbFxSvNK6trSxesS7UCXheG9X
 Crol2vxgYWRxFCHdi7tRirMHFxhBXxZLbpTlyW/Wfegdu+67b01olUE4Lh8Z0fHV2YaE
 U4AQPK1Q1H4xmM+Rrg0jbKmXWtTL9VUdgEgghZwvVGcuZ4HFJaLy1KS9SgxkkfwgIF1B
 0HwP0pE/LNKpdDeEfuT9sYOnRBmvAelWKZe6kWcS6SVTyJibcDvXss1ZfNF4OXtzh53N
 1+Ge9P+j4W0dYlhu6jhDkQO9trfstyBzRVeqUUaER67tGrbvlL3t/DHtZdGstg6nONTX
 eKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJkzhqZVEKMa7moNQ32Yx7jXHKc/DZB0PA4oZ7PblaY=;
 b=aS82lXkaV0kRHv+dDLhqagepGyvKiuf4D0HkLyf3wrDizmsCNCZBqC+555F+cEFbVz
 0dFCV4vXPSfKxx8gAEcuvNQdyjX1xEdqrA0kLwte6Tdd+ol8GzPjD+q2aWu4Mcblo3Zt
 FFZ8l4+pkFje86ZW+8UODVFvVsf2A3vrglyAo8HNdZh+bCSejd7ZLsWmsn1sR/WESx0W
 DFJahG/B8QelMJcDNaVQkWP5Upqh2oD35dMnflcO7RdWTGfFU1n0PzZsKTCoywRH1tU1
 AsSPiZX3YwoNn/B46BBKOurUYLnu5R5sdRqjb7OXedDtVnMohWg0ncAbNdmFUFAwMCnO
 VfWA==
X-Gm-Message-State: APjAAAVzDdfS+G+t2I6fyuoSts9m/fFpWNlBqld/xf7hAz4ccXg9s4rE
 ZIJU2xvabKYzLZA8t4+h4+/fOfhBh12vuWN9bVs=
X-Google-Smtp-Source: APXvYqy3rVudrH2pD1bAX4TSLZX/RYkVzAexlgnOghHibR3zyw2kFjF04uf5hJbBr+ZGbxYLkfqu321hAi1ie0YL2jA=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr48533181wmj.128.1563542350696; 
 Fri, 19 Jul 2019 06:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
 <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
In-Reply-To: <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 19 Jul 2019 07:18:34 -0600
Message-ID: <CABfawhnyhLwjWqGvqtT6vohTYjzcW4+BGpjrEMw1M=yYrzXTPA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2 RESEND] CODING_STYLE: explicitly call
 out label indentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzoxOSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gU2luY2UgdGhlIGJlaGF2aW9yIG9mICJkaWZmIC1wIiB0byB1c2Ug
YW4gdW5pbmRlbnRlZCBsYWJlbCBhcyBjb250ZXh0Cj4gaWRlbnRpZmllciBvZnRlbiBtYWtlcyBp
dCBoYXJkZXIgdG8gcmV2aWV3IHBhdGNoZXMsIG1ha2UgZXhwbGljaXQgdGhlCj4gcmVxdWlyZW1l
bnQgZm9yIGxhYmVscyB0byBiZSBpbmRlbnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoaXMgc3R5bGUgcmVxdWlyZW1lbnQgd291bGRuJ3Qg
cmVhbGx5IHdvcmsgd2l0aCBhc3R5bGUgYXMtaXMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
