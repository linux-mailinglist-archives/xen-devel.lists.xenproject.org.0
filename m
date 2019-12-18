Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98F124628
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:52:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXqy-0003Hn-Mg; Wed, 18 Dec 2019 11:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihXqx-0003Hc-Mb
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:50:55 +0000
X-Inumbo-ID: a0f3f4dc-218c-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0f3f4dc-218c-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 11:50:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so1576935wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 03:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wtezD7PDPm7hhtdKuGNp1A8FsMOcckvI4iF6NSDMX0M=;
 b=f1XROIv9C3q2Hc8f0rXSPdxT+0SdaywBZc9p8ke7gYlMuUgcMkDpKrDbCLPLkMEkim
 wEIbWH85yujaPbWMJuaq4fdZHhiDtxH7w90bVFX0h1+Jt5K3ogpgkxTILGlKuiMTeDaq
 +ZcWgSYlInHOg6NaW0SIzbWwzCa7ZzJFVAz0Wf3wBJxLAZdypMfKCO81dQFrRo/FAM6A
 R6dmcbq+HT/xM6hK6MvWYZC3op4lDbO6gMBcN1e4sXe5Po+ZtaFljlBrWI66HrGD9Jah
 Tnm5cz243VSxCTb4ggyx/aj9j1C1ULNGGomgLVIVd91h62UTXm+G9GbWgEpfJrBNYWTP
 JTWg==
X-Gm-Message-State: APjAAAWD5Q9dryQAOUjSdUCodhb9S60KJRlzgi+uU6FWGedZOwGJ/Smj
 f4rRE5Lyx4WN3/6QXlZqgQ4=
X-Google-Smtp-Source: APXvYqwME3D9n9/N0A2vH0C3ywcotEmFjRjANOngVP2QXWvcSkr+Zb1Z/9mKb+yRy7ts2/mq+GXaQA==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr2700325wmj.39.1576669846476; 
 Wed, 18 Dec 2019 03:50:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id i5sm2232045wml.31.2019.12.18.03.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 03:50:45 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
From: Julien Grall <julien@xen.org>
Message-ID: <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
Date: Wed, 18 Dec 2019 11:50:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8xMi8yMDE5IDA3OjM2LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IE9uIFR1
ZSwgRGVjIDE3LCAyMDE5IGF0IDY6NTYgUE0gUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRh
LmNvbT4gd3JvdGU6Cj4+IEV4YWN0bHkhIFRoYXQncyB0aGUgb3RoZXIgc3VycHJpc2luZyBiaXQg
LS0gSSBub3RpY2VkIHRoYXQgdG9vIC0tIGl0cyBub3QgbGlrZQo+PiBYZW4gZG9lc24ndCBzZWUg
YW55IG9mIHRoZSBtZW1vcnkgYWJvdmUgMUcgLS0gaXQganVzdCBkb2Vzbid0IHNlZSBlbm91Z2gg
b2YgaXQuCj4+Cj4+IFNvIHRoZSBxdWVzdGlvbiBpcyAtLSB3aGF0IGlzIExpbnV4IGRvaW5nIHRo
YXQgWGVuIGRvZXNuJ3Q/Cj4gCj4gQnkgdGhlIHdheSwgc3BlYWtpbmcgb2YgcnVubmluZyBYZW4g
dW5kZXIgQVJNL3FlbXUgLS0gaGVyZSdzIGFuIGludGVyZXN0aW5nCj4gb2JzZXJ2YXRpb246IHdo
ZW4gSSBydW4gcWVtdS1zeXN0ZW0tYWFyY2g2NCB3aXRoIC1tIDQwOTYgb3B0aW9uIGl0IHNlZW1z
Cj4gdGhhdCwgYWdhaW4sIExpbnV4IGtlcm5lbCBpcyBwZXJmZWN0bHkgY29udGVudCB3aXRoIGhh
dmluZyBhY2Nlc3MgdG8gNEcgb2YgUkFNLAo+IHdoaWxlIFhlbiBvbmx5IHNlZXMgYWJvdXQgMkcu
CgpMaW51eCBhbmQgWGVuIHNob3VsZCBzZWUgY2xvc2UgdG8gdGhlIHNhbWUgYW1vdW50IGFzIG1l
bW9yeSBhcyBsb25nIGFzIAp5b3UgYXJlIHVzaW5nIHRoZSBzYW1lIGJvb3Rsb2FkZXIuLi4KCj4g
Cj4gVGhpcyBtYXkgYWN0dWFsbHkgaGF2ZSBzb21ldGhpbmcgdG8gZG8gd2l0aCBVRUZJIEkgZ3Vl
c3MuCgouLi4gIGNvdWxkIHlvdSBjb25maXJtIHdoZXRoZXIgeW91IGFyZSBib290aW5nIExpbnV4
IHVzaW5nIFVFRkkgb3Igbm90PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
