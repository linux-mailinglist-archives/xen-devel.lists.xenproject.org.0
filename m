Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C688E125878
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 01:30:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihjg9-0000TE-63; Thu, 19 Dec 2019 00:28:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MfxW=2J=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihjg8-0000T9-1S
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 00:28:32 +0000
X-Inumbo-ID: 7c0313a0-21f6-11ea-a1e1-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c0313a0-21f6-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 00:28:31 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id k6so3219923qki.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 16:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmoE3gn2S3hT4Fxyo35oiTw+YBsaJG/5427vHAfA3jg=;
 b=aHrFUhPj5SA0NTR44DDp0NeklB9hEpLfc8EBxU6Q4kLb+bV4g0lPS+YW4KGsh31bxy
 yb/vPP+2nobmgMS6FgKc302whkwQHgdNyFgw2w9ZmiI3qH+u++m9VtkSiMv2dFkHUqSo
 tuBPX9uX+7zwlcx/W/4rmpSWMng9n7Ucw3L+M1F76JweOXo4ZFxbwmbUfYZr9cZQyII4
 R9O03tAq7X7suiKfwr0+59LFxuig9CvHcl0w5Y3XC8oTqgTIErkj1yh9yI2DvyGtzTX2
 oQv9g/1qO0NWhWNqWzzawWCu3TJ/zbzWZ1jTgfXh9f0rnOVw+WEwMsHJnIFYzomlIUL3
 rIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmoE3gn2S3hT4Fxyo35oiTw+YBsaJG/5427vHAfA3jg=;
 b=Tj+Xqh9uLDEkYsJFwpnWb2+pHsdWIuyftjOyCUmXmvKNZJnZynqFCIOx7nLoIFlE/D
 AbMn+oh0t90shwklwldn5ep7X1nvE+hoBCv+yTvDmzwRNhLCe/zEa9+Aj4uwk+LkwU0X
 k5fMwHuLQi3wt6gfV7CixPQQHV207pfQ7O7mj7889kzPZSJw9yaYaLFrNpG9J9CKGs2O
 qG8p+nP/wLocy94y1wLnrPsyPtVVYqdjno6R7yD74BgiGss5Px2PSNGxaVK/XzUaqBq1
 hSjZFCO7kTzc5N/ga8DdMvxu38r9L2oi1jXT34RI4XZ5hbOxVaJaqasqrdEPjHcUfCI2
 sJTQ==
X-Gm-Message-State: APjAAAVjYmxXHxMRUJdhBeLOUr7dqLse47xdbEhfCky1FkULKbBugq/6
 8awTgy3jHZR3iAebX5ln2ErinxB+wSMa7bLUSaUO2w==
X-Google-Smtp-Source: APXvYqxTPKEVW4Bh8q0bheKaYEdFlkbx5clMGBz9yj6cYUUZ7EEHPHYCnAsykqkt0RJLEAJbIub+BRftA6uoZQlxqwI=
X-Received: by 2002:a37:4905:: with SMTP id w5mr5554260qka.267.1576715311110; 
 Wed, 18 Dec 2019 16:28:31 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
In-Reply-To: <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 18 Dec 2019 16:28:19 -0800
Message-ID: <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuISBGaXJzdCBvZiBhbGwgLS0gdGhhbmsgeW91IHNvIG11Y2ggZm9yIGRldGFpbGVk
IGV4cGxhbmF0aW9ucwotLSB0aGlzIGlzIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4KCkEgZmV3IHF1
ZXN0aW9ucyBzdGlsbCAoaWYgeW91IGRvbid0IG1pbmQpOgoKT24gV2VkLCBEZWMgMTgsIDIwMTkg
YXQgMjoxNyBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPgo+IEhpIFJv
bWFuLAo+Cj4gT24gMTgvMTIvMjAxOSAxNzowMywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDM6NTAgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6Cj4gPiBTbyAtLSBub3RoaW5nIGJvb3RzIGRpcmVjdGx5IGJ5IFVFRkkgLS0g
ZXZlcnl0aGluZyBnb2VzIHRocm91Z2ggR1JVQi4KPiA+Cj4gPiBIb3dldmVyLCBteSB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQgR1JVQiB3aWxsIGRldGVjdCBkZXZpY2V0cmVlCj4gPiBpbmZvcm1hdGlv
biBwcm92aWRlZCBieSBVRUZJIChldmVuIHRob3VnaCBkZXZpY2V0cmVlIGNvbW1hbmQgaXMKPiA+
IHN1cHBvc2VkIHRvIGNvbXBsZXRlbHkgcmVwbGFjZSB0aGF0KS4gSGVuY2UgaXQgaXMgcG9zc2li
bGUgdGhhdCBMaW51eAo+ID4gcmVsaWVzIG9uIHNvbWUgcmVzaWR1YWxzIGxlZnQgaW4gbWVtb3J5
IGJ5IEdSVUIgdGhhdCBYZW4gZG9lc24ndCBwYXkKPiA+IGF0dGVudGlvbiB0byAoYnV0IHRoaXMg
aXMgYSBwcmV0dHkgd2lsZCBzcGVjdWxhdGlvbiBvbmx5KS4KPgo+IFdoaWxlIGl0IGdvZXMgdGhy
b3VnaCBHUlVCLCBpdCBpcyBhIGJvb3Rsb2FkZXIgYW5kIHdpbGwganVzdCBhY3QgYXMgYQo+IHBy
b3h5IGZvciBFRkkuIFNvIEVGSSBhcHBsaWNhdGlvbiBzdWNoIGFzIFhlbi9MaW51eCBjYW4gc3Rp
bGwgYmUgbG9hZGVkCj4gYW5kIHRha2UgYWR2YW50YWdlIG9mIHJ1bnRpbWUgc2VydmllcyBpZiBw
cmVzZW50L2ltcGxlbWVudGVkLgoKQWhhISBTbyB0aGVuIGl0IGRlcGVuZHMgb24gWGVuIGFjdHVh
bGx5IHVzaW5nIHRob3NlIEVGSSBzZXJ2aWNlcy4gV2hpY2gKbGVhZHMgdG8gbXkgZmlyc3QgcXVl
c3Rpb246CiAgIDEuIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHN0YXkgY29tcGxldGVseSB3aXRo
IGp1c3QgZGV2aWNldHJlZXMgaW5mb3JtYXRpb24KICAgICAgIGJ5IHBhc3NpbmcgZWZpPW5vLXJz
IHRvIFhlbj8KCj4gSW4gZmFjdCBtb3N0IG9mIHBlb3BsZSBvbiBBcm0gYXJlIHVzaW5nIEdSVUIg
cmF0aGVyIHRoYW4gRUZJIGRpcmVjdGx5IGFzCj4gdGhpcyBpcyBtb3JlIGZyaWVuZGx5IHRvIHVz
ZS4KPgo+IFJlZ2FyZGluZyB0aGUgZGV2aWNldHJlZSwgWGVuIGFuZCBMaW51eCB3aWxsIGNvbXBs
ZXRlbHkgaWdub3JlIHRoZQo+IG1lbW9yeSBub2RlcyBpbiBYZW4gaWYgdXNpbmcgRUZJLiBUaGlz
IGJlY2F1c2UgdGhlIEVGSSBtZW1vcnkgbWFwIHdpbGwKPiBnaXZlIHlvdSBhbiBvdmVydmlldyBv
ZiB0aGUgcGxhdGZvcm0gd2l0aCB0aGUgRUZJIHJlZ2lvbnMgaW5jbHVkZWQuCgpBaGEhIFNvIGlu
IHRoYXQgc2Vuc2UgaXQgaXMgYSBidWcgaW4gWGVuIGFmdGVyIGFsbCwgcmlnaHQ/ICh0aGF0J3Mg
d2hhdCB5b3UncmUKcmVmZXJyaW5nIHRvIHdoZW4geW91IHNheSB5b3Ugbm93IHVuZGVyc3RhbmQg
d2hhdCBuZWVkcyB0byBnZXQgZml4ZWQpLgoKVGhhbmtzLApSb21hbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
