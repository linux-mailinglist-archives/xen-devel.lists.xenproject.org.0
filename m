Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFD1492E1
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 03:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivAjJ-0007LG-7g; Sat, 25 Jan 2020 01:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i6Vi=3O=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1ivAjI-0007LB-98
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 01:59:20 +0000
X-Inumbo-ID: 4cb1cd98-3f16-11ea-9fd7-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cb1cd98-3f16-11ea-9fd7-bc764e2007e4;
 Sat, 25 Jan 2020 01:59:19 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id i190so1856470ywc.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 17:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BC3s8/kD2UXs+/aZ3epr78+0+JODzS5rwhvrr8VmaA0=;
 b=ibK8rs0CUXuk/brKuCMBd+VWim8CaxlDTww7+LWHIcEOYP9CkQIOpioBbcyxJHF5hW
 3isbzcELzGGrhTynX43gDeEPwWMG0dUHwzrLT1MoTX4yeazOi2m9RDw5zdevNsG9+22X
 nlOpJboZC/GC0QqnZPOXUryZrhY8X5Lg9j9DJrjrHgLbV0UZZ0ZrSe4oCeiggm8pDogz
 crLmNlCkDghZrs0WwQRdg4y4z1TA/psz1nYpvzY7OL/KQFiYxrfmEVezQjNCXFpgs/+e
 6iLrRtc7rv+N4bMujP+tPvE8M2nwrAzLf8J1LmwbTf9rwvRl02ND72VtXyMZ7u8gWOh4
 MDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BC3s8/kD2UXs+/aZ3epr78+0+JODzS5rwhvrr8VmaA0=;
 b=p2Snah0pLdOWpCNfz9dUKWg/nbrhBLxM4gs9xVgkjr+MnBl/Wf+dEHnUZYTJxeXGSk
 sUnZpx0ff+kUkHLsyrpMKX+Js41hG6i8DuPAta6T8jmAOQu0ruBubX2O4Q8NY8094Srf
 4kWc9mqjwU7+r8In9QCJQqAEyMOO39ZM/vA9Jdm/uut/gxwR8R4RoSCoCzwbGXYzFbe7
 FTLPr/pR7DOIMCn5OABButhl8+Yo8e6zD6yv51UHG/Qru2rOH3XqchJIoGwGcFkG2tHv
 TCFnCaXTpA5HxG7sQkhJnNmBPNFcAZF9WhpVmHdEqctHWL+Aj+KaQdJwmZzelj23prJl
 OKbQ==
X-Gm-Message-State: APjAAAUZMFPVUAszXpi2KJgTcCQPqK5UROg5ZJNGnsvU2kM9jMMmixlL
 lmt6LJhyf2ecuZ8vdQXbbIU=
X-Google-Smtp-Source: APXvYqy0AP7klkkb3bRSUjLkpLnnCtWklffex6zKjwnclpny/MoxBLhApaOctgLr2M33m9nspL5tVw==
X-Received: by 2002:a81:9bc2:: with SMTP id s185mr4383686ywg.55.1579917559352; 
 Fri, 24 Jan 2020 17:59:19 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id z2sm2933722ywb.13.2020.01.24.17.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 17:59:18 -0800 (PST)
Date: Fri, 24 Jan 2020 19:59:15 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Message-ID: <20200125015915.GB11702@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
 <052081D4-2F9F-401A-A6F6-8A9CDC1069AC@xenproject.org>
 <20200123053136.GC6612@bobbye-pc>
 <C265D0DF-EFAD-4415-9578-1B992A2CC473@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C265D0DF-EFAD-4415-9578-1B992A2CC473@gmail.com>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTE6NDQ6MDJQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBJZiB5b3UgYWRkIHlvdXIgbmFtZS9lbWFpbCBhZGRyZXNzIHRvIGh0dHBzOi8vY3J5cHRw
YWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9lNlJGUHowc1JDZisvIDxodHRwczov
L2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZSRlB6MHNSQ2YrLz4g
SSB3aWxsIENDIHlvdSBvbiB0aGUgbmV4dCBpbnZpdGUKPiBUaGV5IGFyZSB1c3VhbGx5IHRoZSAx
c3QgVGh1cnNkYXkgb2YgZWFjaCBtb250aCAKPiBQYXN0IG1pbnV0ZXMgY2FuIGJlIGZvdW5kIGF0
IGh0dHBzOi8vY3J5cHRwYWQuZnIvZHJpdmUvIy8yL2RyaXZlL2VkaXQvdVoxVWpZeElDanNlK1hs
SnJYckl3WlhOLwo+IExhcnMKCkRvbmUhICBUaGFua3MuCgotQm9iYnkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
