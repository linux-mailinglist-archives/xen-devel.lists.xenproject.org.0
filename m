Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46667F60F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 13:33:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htVlx-0008J5-68; Fri, 02 Aug 2019 11:30:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y9bT=V6=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htVlv-0008J0-J6
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 11:30:55 +0000
X-Inumbo-ID: fcd87d9c-b518-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fcd87d9c-b518-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 11:30:53 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s7so151253337iob.11
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9PJDQkirJayb7A64Ui4++YR1Ig5gjJr6aZK846dhfc=;
 b=Ae1wm+Q+owUDNdJHVwv+PfqxhjIH7LmfABJiC5ApyUc0FRiXvYwPNYpmwkzSD74NP7
 CUTVNllCUbxsnc4Se/9z2iM2Kgx3V3MLP86y1Y1V5MLzbghP1IGeXcdD/j/JBRMBufDD
 hZ/wzMrIT3zh8vkpR7zBG8TBOfFLUTljNjYLN8C1SB/I6Icqh6AdVW7a9Dh+76O+2AlP
 +11h0UhfKLN7pdO6QRc6y9HWdMiYFMIdbefCneRojf2LZt1pQMsYjSLfbUNpxnniAVn1
 0J638YQqx0yie7VxuhuJuip0JmBQZ12WETOqilyXKr1Go+i/HdhdK6suZlw9XgEqQHSm
 embA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9PJDQkirJayb7A64Ui4++YR1Ig5gjJr6aZK846dhfc=;
 b=kiPRTXFTm2iEoFWDx5NS6IeStwGS6WD7hZfw9zWgmuOLXxdEHf8NVWlZjIaR3Uhq7S
 6erus2sX2SRaPukNoKk1A9ylgZCfXf5cUg6O45IOg7RvVv3CDh30T/hVYYHHhSKNUe9i
 K36ty/n8aNeRaPGHlKNKsa/yzxNvGfT2FPc+59J5tosRd9fnWjqHRB+u/6sKwMjFhROy
 Xe1Fqt9Gi+a819dNpJDeyj0jG4FA2Oyyokvn5HUVYwsMUpVqqPJdb5VxnRs0dj4PCJGe
 gvzbB3AQADIudU8hubnv/9OoRXjolzkBo6pt5WRKjNBRhN/0+5MR10lewqIJltrmmqK3
 c7SA==
X-Gm-Message-State: APjAAAWdKxx3qlJDIlfscdFlNzKFEVN70zdoEGpHVxo8m/XTWE/EVpB9
 5lVr+LZmITTqg6JNIKXWLwoxDcbJUdfOn1dSRW8=
X-Google-Smtp-Source: APXvYqwQ8fGWv2Ank6alhmMLAZw8STyDWXbZFcbJ4xG9LKC8q2DEEH8soaaj6oSS6RhWW8hcX72DUUz00GkgChQUMBI=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr20687042iof.147.1564745453408; 
 Fri, 02 Aug 2019 04:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
 <43ea6ddd-5f48-865d-c25d-6d0b13845275@arm.com>
 <CAOcoXZbdDiJWfXDxVvZ-tMw-iAZJakB7iw6vpqEdqiHMjxU0DA@mail.gmail.com>
 <e751b9a0-2b35-9a52-f3dd-32b9e850de08@arm.com>
In-Reply-To: <e751b9a0-2b35-9a52-f3dd-32b9e850de08@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 2 Aug 2019 14:30:41 +0300
Message-ID: <CAOcoXZZKZiNpK17KqDfuGzMSF2B2CAE2Lf6EcWPTCQ+vt=0vyg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMjo0MSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBXZWxsLCBJIGFkZHJlc3MgZWFjaCBvZiB0aGUgY29t
bWVudHMgb3Igd3JpdGUgYWJvdXQgaXQgZXhwbGljaXRseSBpbgo+ID4gb3RoZXIgY2FzZXMuCj4g
PiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgSSdkIGFkZGVkICAnLTEnLCBidXQgbGF0ZXIgZGlk
IG5vdCBtZXJnZSBpdAo+ID4gZHVlIHRvIG1pc3Rha2UuCj4gPiBTbyBpdCBzdXBwb3NlZCB0byBi
ZSB0aGUgbmV4dDoKPiA+ICsgICAgdW5zaWduZWQgaW50IGlycVtNQVhfVElNRVJfUFBJLTFdCj4K
PiBQbGVhc2Ugbm8gJy0xJywgaXQgaXMgd29yc3QgdGhhbiBoYXJkY29kaW5nIHZhbHVlLiBJbiB0
aGUgY29kZSB5b3UgYXJlIHVzaW5nIGFuCj4gZWxlbWVudCBvZiBhbiBlbnVtIHRvIGFjY2VzcyB0
aGUgYXJyYXkuIFRoZXJlIGFyZSBubyBndWFyYW50ZWUgdGhlIGxhc3QgZWxlbWVudAo+IGlzIGFj
dHVhbGx5IHRoZSBvbmUgeW91IHdhbnQgdG8gZHJvcCBhbmQgdGhlcmVmb3JlIHlvdSByaXNrIHRv
IG92ZXJmbG93IGl0IGlmCj4gbWlzdGFrZW5seSB1c2VkLgo+CkkgYWdyZWUgdGhhdCB1c2luZyAt
MSBpcyBub3QgdGhlIGJlc3QgaWRlYS4gSXQgd291bGQgYmUgYmV0dGVyIHRvCmludHJvZHVjZSBh
IG5ldyBlbnVtIGZvciB0aGF0LiBIb3dldmVyLCBzaW5jZSB3ZSBhbHJlYWR5IGhhdmUgdGhlIGVu
dW0Kd2l0aCA0IGl0ZW1zIGZvciB0aGF0LCBpdCBpcyBiZXR0ZXIgdG8gdXNlIGl0IGFzIGlzLgoK
PiBUaGUgcmlzayBpcyBub3Qgd29ydGggY29tcGFyZSB0byBzYXZpbmcganVzdCA0LWJ5dGUgb24g
dGhlIHN0YWNrLgoKQ29tcGxldGVseSBhZ3JlZSBhYm91dCBpdCwgc28gSSB3aWxsIHVzZSBNQVhf
VElNRVJfUFBJKGFzIGl0IGlzIGRvbmUKbm93KSBpbiB0aGUgbmV4dCBwYXRjaCBzZXJpZXMgdmVy
c2lvbiwKClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
