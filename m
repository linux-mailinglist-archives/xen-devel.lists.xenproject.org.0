Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E78481FE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 14:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcqgL-0008Oh-T3; Mon, 17 Jun 2019 12:24:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmRm=UQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hcqgK-0008Oc-4H
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 12:24:16 +0000
X-Inumbo-ID: d053f84e-90fa-11e9-9a3e-4762f33712c8
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d053f84e-90fa-11e9-9a3e-4762f33712c8;
 Mon, 17 Jun 2019 12:24:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1560774252; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=bfA6yMkLSDAZdV24uSfDx1orvLiuy1KfcfTV3GXl6v4=;
 b=Ob/BatvmKZrL6LI9O6Ge7vYG3kAj1d9Dyb09I6qTrIL1jFNknyTQnRHdxB7YqBfRWi7sScWB
 8lokj1FZsazWeXkwXDM6RO0GpGQBrAgkI+J27NxcRD7Lop7CQ2UpdiwhUIpWm6Sslxr7kguE
 lhZZsIAcQHGzHG9ZFDG+/TrhgM0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5d07866b.7f193d2519b0-smtp-out-n01;
 Mon, 17 Jun 2019 12:24:11 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id s15so8882942wmj.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 05:24:11 -0700 (PDT)
X-Gm-Message-State: APjAAAVJSc9hAC7QEnpLV70CKi8wpl805mhGt2CUolob3QdKj5fK/6Gd
 YDsiHK7xz64W4QE8xseaDoqapDrQI6PCiGx1ME4=
X-Google-Smtp-Source: APXvYqzdUcVqHZL8sOjYNG6zN3IMDyqPZyhG8KT2Lz4pHBitHi4CVnHn5Ln4e85iKvPXAFe7YqQCnAgJjmpuQYUbXJM=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr18854201wmc.169.1560774250277; 
 Mon, 17 Jun 2019 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
In-Reply-To: <20190516213752.1701-1-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 17 Jun 2019 14:23:33 +0200
X-Gmail-Original-Message-ID: <CABfawhkgpRyC95bVTKGhnN0+2GqoRJ7zentgKQud070YCxSb+A@mail.gmail.com>
Message-ID: <CABfawhkgpRyC95bVTKGhnN0+2GqoRJ7zentgKQud070YCxSb+A@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MzggUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPgo+IENhbGxpbmcgX3B1dF9wYWdlX3R5cGUgd2hpbGUgYWxz
byBob2xkaW5nIHRoZSBwYWdlX2xvY2sKPiBmb3IgdGhhdCBwYWdlIGNhbiBjYXVzZSBhIGRlYWRs
b2NrLgo+Cj4gVGhlIGNvbW1lbnQgYmVpbmcgZHJvcHBlZCBpcyBpbmNvcnJlY3Qgc2luY2UgaXQn
cyBub3cgb3V0LW9mLWRhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+CgpQYXRjaCBwaW5nLiBVbmNsZWFyIHdob3NlIEFjayBpcyBzdHJp
Y3RseSBuZWVkZWQgYXMgdGhpcyBpcyBvbmx5CnRvdWNoaW5nIG1lbV9zaGFyaW5nIGNvZGUgYW5k
IG5vdGhpbmcgZWxzZS4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
