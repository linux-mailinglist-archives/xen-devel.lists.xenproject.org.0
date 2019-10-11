Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E4D3C63
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 11:32:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrBj-0002Ka-QL; Fri, 11 Oct 2019 09:26:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L6yD=YE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iIrBi-0002KV-9t
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 09:26:18 +0000
X-Inumbo-ID: 2d58c38a-ec09-11e9-a531-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d58c38a-ec09-11e9-a531-bc764e2007e4;
 Fri, 11 Oct 2019 09:26:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so9670547wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2019 02:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c+rnKDRpIS0HtwAohpjycRHCsixcyyVZInj7ekU3isA=;
 b=ibFfZ/7Vcb5sf8qxLmLeang/Tyi4hhMLF52KhR08qvxqNq1Hr9r2MNOmQQ41JaRwCP
 I3JpLKUn3eZMMExhj4RZyxxlKrFUilhETXVUOz3obwDRMa7uG58rzqA3XdpjeBK4yJlc
 nXDCAbQ0m5inwEMx5xwd3+JlaFjmJ/yCG0CEX82Ilwsrg7b6IWHZMmluz/0ODp+9qBum
 99sRm1M45IigTKaoVCXrY5XWIp+m+QEhEiaHzbqcDJ91JErhcCoOWXbyVd9956nlZezr
 H3Y08HNkc7xAvpNZcwNfu76ce1jHJq17tJhtta+ly1MHJ47t4LXnLTrsvajP0O79aQtk
 e9Eg==
X-Gm-Message-State: APjAAAXdA5yeQc8Cn1HCsbqlcvRHLDxuvUWwuI3S3bvqY97ZdSG4FqTf
 vyZeGGgk+5OJt8TavfkPXdQ=
X-Google-Smtp-Source: APXvYqyt0m+6Xzq/d72odj6rsxvP8fPBEhYFexQE2nkSq8tE6vmmWR8L5UBCb3+i0PII1jV+R5elMw==
X-Received: by 2002:a1c:1f16:: with SMTP id f22mr2366250wmf.68.1570785976750; 
 Fri, 11 Oct 2019 02:26:16 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id t6sm14336674wmf.8.2019.10.11.02.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 02:26:15 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:26:14 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191011092614.n4d3qygp42kbtfdu@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010151111.22125-10-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDQ6MTE6MTFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTElCWExfUEFTU1RIUk9VR0hfVU5LTk9XTiAoYWthICJFTkFCTEVEIiBpbiBhbiBlYXJs
aWVyIHVuY29tbWl0dGVkCj4gdmVyc2lvbiBvZiB0aGlzIGNvZGUpIGlzIGRvaW5nIGRvdWJsZSBk
dXR5LiAgV2UgYWN0dWFsbHkgbmVlZCBhbGwgb2YKPiB0aGUgZm9sbG93aW5nIHRvIGJlIHNwZWNp
ZmljYWJsZToKPiAgICogZGVmYXVsdCAoInVua25vd24iKTogZW5hYmxlIFBUIGlmZiB3ZSBoYXZl
IGRldmljZXMgdG8KPiAgICAgcGFzcyB0aHJvdWdoIHNwZWNpZmllZCBpbiB0aGUgaW5pdGlhbCBj
b25maWcgZmlsZS4KPiAgICogImVuYWJsZWQiIChhbmQgZmFpbCBpZiB0aGUgcGxhdGZvcm0gZG9l
c24ndCBzdXBwb3J0IGl0KS4KPiAgICogImRpc2FibGVkIiAoYW5kIHJlamVjdCBmdXR1cmUgUFQg
aG90cGx1ZykuCj4gICAqICJzaGFyZV9wdCIvInN5bmNfcHQiOiBlbmFibGUgUFQgYW5kIHNldCBh
IHNwZWNpZmljIFBUIG1vZGUuCj4gCj4gRGVmYXVsdGluZyBhbmQgZXJyb3IgY2hlY2tpbmcgc2hv
dWxkIGJlIGRvbmUgaW4gbGlieGwuICBTbywgd2UgbWFrZQo+IHNldmVyYWwgY2hhbmdlcyBoZXJl
Lgo+IAo+IFdlIGludHJvZHVjZSAiZW5hYmxlZCIuICAoQW5kIHdlIGRvY3VtZW50ICJ1bmtub3du
Ii4pCj4gCj4gV2UgbW92ZSBhbGwgb2YgdGhlIGVycm9yIGNoZWNraW5nIGFuZCBkZWZhdWx0aW5n
IGNvZGUgZnJvbSB4bCBpbnRvCj4gbGlieGwuICBOb3csIGxpYnhsX19kb21haW5fY29uZmlnX3Nl
dGRlZmF1bHQgaGFzIGFsbCBvZiB0aGUgbmVjZXNzYXJ5Cj4gaW5mb3JtYXRpb24gdG8gZ2V0IHRo
aXMgcmlnaHQuICBTbyB3ZSBjYW4gZG8gaXQgYWxsIHRoZXJlLCBpbiBvbmUKPiBwbGFjZS4KPiAK
PiBXZSBjYW4gYWxzbyBhcnJhbmdlIHRvIGhhdmUgb25seSBvbmUgcGxhY2UgZWFjaCB3aGljaCBj
YWxjdWxhdGVzCj4gKGkpIHdoZXRoZXIgcGFzc3Rocm91Z2ggbmVlZHMgdG8gYmUgZW5hYmxlZCBi
ZWNhdXNlIHB0IGRldmljZXMgd2VyZQo+IHNwZWNpZmllZCAoaWkpIHdoZXRoZXIgcHRfc2hhcmUg
Y2FuIGJlIHVzZWQuCj4gCj4geGwgbm93IG9ubHkgaGFzIHRvIHBhcnNlIHRoZSBlbnVtIGluIHRo
ZSBzYW1lIHdheSBhcyBpdCBwYXJzZXMgYWxsCj4gb3RoZXIgZW51bXMuCj4gCj4gVGhpcyBjaGFu
Z2UgZml4ZXMgYSByZWdyZXNzaW9uIGZyb20gZWFybGllciA0LjEzLXByZTogdW50aWwgcmVjZW50
Cj4gY2hhbmdlcywgcGFzc3Rocm91Z2ggd2FzIG9ubHkgZW5hYmxlZCBieSBkZWZhdWx0IGlmIHBh
c3N0aHJvdWdoCj4gZGV2aWNlcyB3ZXJlIHNwZWNpZmllZC4gIFdlIHJlc3RvcmUgdGhpcyBiZWhh
dmlvdXIuCj4gCj4gVGhpcyB3aWxsIGhpZGUsIGZyb20gdGhlIHBvaW50IG9mIHZpZXcgb2YgbGli
dmlydCB0ZXN0cyBpbiBvc3N0ZXN0LCBhCj4gc2VwYXJhdGUgaHlwZXJ2aXNvciByZWdyZXNzaW9u
IHdoaWNoIHByZXZlbnRzIG1pZ3JhdGlvbiBvZiBhIGRvbWFpbgo+IHdpdGggcGFzc3Rocm91Z2gg
ZW5hYmxlZCBidXQgd2l0aG91dCBhY3R1YWwgUFQgZGV2aWNlcy4KCkkgdGhpbmsgSmFuIGNvbW1p
dHRlZCBhIHBhdGNoIHRvIGZpeCB0aGF0LCBzbyB0aGlzIG1heSBuZWVkIGRlbGV0aW5nLgoKSSB3
aWxsIGxldCBKYW4gYW5kIFBhdWwgY29uZmlybSB0aGlzLgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
