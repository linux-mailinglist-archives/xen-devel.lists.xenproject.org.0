Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0212677E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihz5c-0002c6-8c; Thu, 19 Dec 2019 16:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihz5a-0002c1-DU
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 16:55:50 +0000
X-Inumbo-ID: 631d8958-2280-11ea-b6f1-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 631d8958-2280-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 16:55:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576774542; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=wIdMtPAe3XTZToNFb1uVrv7PYbvKiOFsKhh/kPoYm7g=;
 b=maPUDsI/Kec+BCEFTQU+YlxdpfsJaUgUzs63HdRFge9W17h/2H4Ae30ZXdipOhXh7w+M05Le
 kLTdkSN92z2imD+2swVbOf5NgcxsvqEL5ljFTQHia728U3Ti7wFDewcOllv/SIli27RAQAXu
 wxB7kj3CcOLTp1q75Oi7khpspQ0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5dfba211.7ff5e72d0530-smtp-out-n02;
 Thu, 19 Dec 2019 16:15:13 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w15so6582962wru.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:15:12 -0800 (PST)
X-Gm-Message-State: APjAAAXy2JAGmIOiXN89gKbmK4K9//6bjSs/m7IgakeyG9ZziW8WRdIN
 Qvnini9suVm8tTO5OTiClPVwd8yUaRo23gRb3S0=
X-Google-Smtp-Source: APXvYqyKxRQmRBCImEM/n8+qYdaQgR/jn410MdZdCMtDNY4kVuoDitoZbmcjQ/IqEp6OwLucOfUv65PqzLyOFPBQIWI=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr9746788wre.372.1576772111033; 
 Thu, 19 Dec 2019 08:15:11 -0800 (PST)
MIME-Version: 1.0
References: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
In-Reply-To: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:14:34 -0700
X-Gmail-Original-Message-ID: <CABfawhmwKeh6t-O4a3R9rbs=ZSQ=nFFvDAt-pwSd1tNSgpD+4g@mail.gmail.com>
Message-ID: <CABfawhmwKeh6t-O4a3R9rbs=ZSQ=nFFvDAt-pwSd1tNSgpD+4g@mail.gmail.com>
To: Sergey Kovalev <valor@list.ru>
Subject: Re: [Xen-devel] [XEN PATCH v4] x86/vm_event: add short-circuit for
 breakpoints (aka "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgODo0NyBBTSBTZXJnZXkgS292YWxldiA8dmFsb3JAbGlz
dC5ydT4gd3JvdGU6Cj4KPiBXaGVuIHVzaW5nIERSQUtWVUYgKG9yIGFub3RoZXIgc3lzdGVtIHVz
aW5nIGFsdHAybSB3aXRoIHNoYWRvdyBwYWdlcyBzaW1pbGFyCj4gdG8gd2hhdCBpcyBkZXNjcmli
ZWQgaW4KPiBodHRwczovL3hlbnByb2plY3Qub3JnLzIwMTYvMDQvMTMvc3RlYWx0aHktbW9uaXRv
cmluZy13aXRoLXhlbi1hbHRwMm0pLAo+IGFmdGVyIGEgYnJlYWtwb2ludCBpcyBoaXQgdGhlIHN5
c3RlbSBzd2l0Y2hlcyB0byB0aGUgZGVmYXVsdAo+IHVucmVzdHJpY3RlZCBhbHRwMm0gdmlldyB3
aXRoIHNpbmdsZXN0ZXAgZW5hYmxlZC4gV2hlbiB0aGUgc2luZ2xlc3RlcAo+IHRyYXBzIHRvIFhl
biBhbm90aGVyIHZtX2V2ZW50IGlzIHNlbnQgdG8gdGhlIG1vbml0b3IgYWdlbnQsIHdoaWNoIHRo
ZW4KPiBub3JtYWxseSBkaXNhYmxlcyBzaW5nbGVzdGVwcGluZyBhbmQgc3dpdGNoZXMgdGhlIGFs
dHAybSB2aWV3IGJhY2sgdG8KPiB0aGUgcmVzdHJpY3RlZCB2aWV3Lgo+Cj4gVGhpcyBwYXRjaCBz
aG9ydC1jaXJjdWl0aW5nIHRoYXQgbGFzdCBwYXJ0IHNvIHRoYXQgaXQgZG9lc24ndCBuZWVkIHRv
IHNlbmQgdGhlCj4gdm1fZXZlbnQgb3V0IGZvciB0aGUgc2luZ2xlc3RlcCBldmVudCBhbmQgc2hv
dWxkIHN3aXRjaCBiYWNrIHRvIHRoZSByZXN0cmljdGVkCj4gdmlldyBpbiBYZW4gYXV0b21hdGlj
YWxseS4KPgo+IFRoaXMgb3B0aW1pemF0aW9uIGdhaW5zIGFib3V0IDM1JSBzcGVlZC11cC4KPgo+
IFdhcyB0ZXN0ZWQgb24gRGViaWFuIGJyYW5jaCBvZiBYZW4gNC4xMi4gU2VlIGF0Ogo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90cmVlL2RlYmlhbi9rbm9ycmllLzQuMTIvZmFzdC1zaW5n
bGVzdGVwCj4KPiBSZWJhc2VkIG9uIG1hc3RlcjoKPiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94
ZW4vdHJlZS9mYXN0LXNpbmdsZXN0ZXAKPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2
IDx2YWxvckBsaXN0LnJ1PgoKQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
