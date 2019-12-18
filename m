Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2D125691
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 23:20:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihhdN-0005QQ-IX; Wed, 18 Dec 2019 22:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihhdM-0005QK-II
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 22:17:32 +0000
X-Inumbo-ID: 2a656cda-21e4-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a656cda-21e4-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 22:17:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so3595037wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 14:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+LCMZOEgqf/R77AS9BFEDsnMXu99QD48qBSLwGxCaU=;
 b=OB4gCOomJxwjNAcbl887J+kfwkc6+35cL3nrWDwmw9NpcoYTM48PoZKWQd0H7UGr1u
 nPzFlkWe6FBSgK9K/fnqkdQgTi29Mh6rrME9HV2cGkwe5lZN2epMrLcaAIRS1N6BCoUe
 CJRktktSO8fhWOKcEAzC2IiG5bySHE1xJhyatkOj56JAwfh66LVAvf+zWHX/XKA4dEPU
 fMaR+gc5GM7I41B+YtjEp5PJh399ACf87Uk4Taj1YKFe3HsTuk95FkewmTLZJpZn3YCM
 7+ApLeVaO03VRsECxhiQlrzOd/wjkWOxHZbVuF5P1bJnGxyrZL4FJex6R7etk1uq81SE
 OIEA==
X-Gm-Message-State: APjAAAXSDMOdkkZoSnCBq7h6u05dP4vVHDmivE+E5/x5tQKJ9DkyFWaW
 Uhl/oX1J14lDWuiKsNrHbjA=
X-Google-Smtp-Source: APXvYqxtcUSw34keInEH8Ykp2wwz6NQ71ZWyLwDVgTCM1u2dYCaxWGtXBHairwp4erfsTnDh+FPc0A==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr5587336wmb.99.1576707442971;
 Wed, 18 Dec 2019 14:17:22 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id c195sm4350809wmd.45.2019.12.18.14.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 14:17:22 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
Date: Wed, 18 Dec 2019 22:17:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9tYW4sCgpPbiAxOC8xMi8yMDE5IDE3OjAzLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDM6NTAgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6Cj4gU28gLS0gbm90aGluZyBib290cyBkaXJlY3RseSBieSBVRUZJIC0tIGV2
ZXJ5dGhpbmcgZ29lcyB0aHJvdWdoIEdSVUIuCj4gCj4gSG93ZXZlciwgbXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IEdSVUIgd2lsbCBkZXRlY3QgZGV2aWNldHJlZQo+IGluZm9ybWF0aW9uIHByb3Zp
ZGVkIGJ5IFVFRkkgKGV2ZW4gdGhvdWdoIGRldmljZXRyZWUgY29tbWFuZCBpcwo+IHN1cHBvc2Vk
IHRvIGNvbXBsZXRlbHkgcmVwbGFjZSB0aGF0KS4gSGVuY2UgaXQgaXMgcG9zc2libGUgdGhhdCBM
aW51eAo+IHJlbGllcyBvbiBzb21lIHJlc2lkdWFscyBsZWZ0IGluIG1lbW9yeSBieSBHUlVCIHRo
YXQgWGVuIGRvZXNuJ3QgcGF5Cj4gYXR0ZW50aW9uIHRvIChidXQgdGhpcyBpcyBhIHByZXR0eSB3
aWxkIHNwZWN1bGF0aW9uIG9ubHkpLgoKV2hpbGUgaXQgZ29lcyB0aHJvdWdoIEdSVUIsIGl0IGlz
IGEgYm9vdGxvYWRlciBhbmQgd2lsbCBqdXN0IGFjdCBhcyBhIApwcm94eSBmb3IgRUZJLiBTbyBF
RkkgYXBwbGljYXRpb24gc3VjaCBhcyBYZW4vTGludXggY2FuIHN0aWxsIGJlIGxvYWRlZCAKYW5k
IHRha2UgYWR2YW50YWdlIG9mIHJ1bnRpbWUgc2VydmllcyBpZiBwcmVzZW50L2ltcGxlbWVudGVk
LgoKSW4gZmFjdCBtb3N0IG9mIHBlb3BsZSBvbiBBcm0gYXJlIHVzaW5nIEdSVUIgcmF0aGVyIHRo
YW4gRUZJIGRpcmVjdGx5IGFzIAp0aGlzIGlzIG1vcmUgZnJpZW5kbHkgdG8gdXNlLgoKUmVnYXJk
aW5nIHRoZSBkZXZpY2V0cmVlLCBYZW4gYW5kIExpbnV4IHdpbGwgY29tcGxldGVseSBpZ25vcmUg
dGhlIAptZW1vcnkgbm9kZXMgaW4gWGVuIGlmIHVzaW5nIEVGSS4gVGhpcyBiZWNhdXNlIHRoZSBF
RkkgbWVtb3J5IG1hcCB3aWxsIApnaXZlIHlvdSBhbiBvdmVydmlldyBvZiB0aGUgcGxhdGZvcm0g
d2l0aCB0aGUgRUZJIHJlZ2lvbnMgaW5jbHVkZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
