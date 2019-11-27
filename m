Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D710B69C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 20:21:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia2oy-0006Cp-E9; Wed, 27 Nov 2019 19:17:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ia2ow-0006Ck-Cf
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 19:17:50 +0000
X-Inumbo-ID: 9958b944-114a-11ea-a55d-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9958b944-114a-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 19:17:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j18so5600527wmk.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 11:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrEfn8jTtcUJ7qnmoPH761KI57Ow/lHgDOAIO3+iCWU=;
 b=qhSZnsBwjHII/vrjb8MPS+XVrzzBFnK/KSu0MlK0ZKPMmhqnG/1Qc+gfjSIRLvZ4kn
 ch89qM0fSrzsep2AJliMuhpa0/64nCRd9VP7Q49bkOV9rImm2r2Mq5aoLOENrjiab5e/
 s1OLbrpMbzzGRC5U9z/wvN0Pg51dGa+LWmK6mEHy2E4NZWIZm9ZyCsM58YSkQLQEU2k1
 fHXkU4JvS3u/5K12I5hT68w2NpAouw6jk4qilHWDl8Jkp/smdfaASWbUzIr6Dk3wjY9M
 l6ZbgvNFnEDu7ekpyX4zCqDJy49eaACQbNJsau1SmUombVLYUfv03cguaVQ9HyCYm9YT
 foRQ==
X-Gm-Message-State: APjAAAW53zMMb5omOM4Il4LrCw07aPprXqhXZH6TR7mYLTFCowfR5eIX
 fpBoU9U9fAmq0VdaTbFQX6c=
X-Google-Smtp-Source: APXvYqygFXsgx8A1ZHqnnl4mTnagLsMHsl+vLJv+BqJvB8dg1lqzSxwZJGfBiMYo5JP3dbJhcud1Dg==
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr6243594wma.116.1574882268270; 
 Wed, 27 Nov 2019 11:17:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id b63sm7255459wmb.40.2019.11.27.11.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 11:17:47 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
 <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
 <alpine.DEB.2.21.1911261424540.8205@sstabellini-ThinkPad-T480s>
 <69e077dc-0512-1520-b406-03a7f3059701@xen.org>
 <alpine.DEB.2.21.1911271046190.27669@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <3997a189-7263-9c24-5416-089d92fca666@xen.org>
Date: Wed, 27 Nov 2019 19:17:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911271046190.27669@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8xMS8yMDE5IDE4OjQ4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pgo+
Pj4gWWVzLCBJIHRoaW5rIHRoYXQgaXMgYSBnb29kIHN1Z2dlc3Rpb24uIEkgdGFrZSB0aGF0IHlv
dSBtZWFuIHRoYXQgaW4KPj4+IHZnaWNfZGlzYWJsZV9pcnFzIGZvciBQUElzIHdlIHdvdWxkIG9u
bHkgY2xlYXIgR0lDX0lSUV9HVUVTVF9FTkFCTEVECj4+PiB0aGVuIHJldHVybiBiYXNpY2FsbHks
IHJpZ2h0Pwo+PiBOb3QgcmVhbGx5LCBJIGFtIG9ubHkgc3VnZ2VzdGluZyB0byByZW1vdmUgdGhl
IHBhcnQKPj4KPj4gaWYgKCBkZXNjICE9IE5VTEwgKQo+PiAgICAuLi4KPiAKPiBJIHRoaW5rIHdl
IGFyZSBzYXlpbmcgdGhlIHNhbWUgdGhpbmcKClRoZSBmdW5jdGlvbiBpcyBkb2luZyBhIGJpdCBt
b3JlLCBoZW5jZSB3aHkgSSB3YXNuJ3Qgbm90IHN1cmUgOikuCgo+PiBCdXQgdGhpcyBjaGFuZ2Ug
YWxvbmUgaXMgbm90IGVub3VnaC4gSXQgd291bGQgcmVxdWlyZSBzb21lIG1vZGlmaWNhdGlvbiBp
biB0aGUKPj4gcmVzdCBvZiB0aGUgdkdJQyAoc2VlIG15IHByZXZpb3VzIGUtbWFpbCkgYW5kIGxp
a2VseSBzb21lIGludmVzdGlnYXRpb24gdG8KPj4gdW5kZXJzdGFuZCB0aGUgaW1wbGljYXRpb24g
b2Yga2VlcGluZyB0aGUgaW50ZXJydXB0IGVuYWJsZWQgZnJvbSB0aGUgSFcgKEkgYW0KPj4gYSBi
aXQgd29ycnkgd2UgbWF5IGhhdmUgYmFja2VkIHRoaXMgYXNzdW1wdGlvbiBpbnRvIG90aGVyIHBh
cnQgb2YgdGhlIHZHSUMKPj4gOigpLgo+IAo+IEkgY2FuIHNlZSB0aGF0IGF0IGxlYXN0IHNhdmVf
YW5kX21hc2tfaHdwcGkgYW5kIHJlc3RvcmVfaHdwcGkgd291bGQgbmVlZAo+IHRvIGJlIG1vZGlm
aWVkIHRvIGFjY291bnQgZm9yIHRoZSBmYWN0IHRoYXQgR0lDRF9JU0VOQUJMRVIgd291bGQgc2F5
ICJpdAo+IGlzIGVuYWJsZWQiIGJ1dCBhY3R1YWxseSBHSUNfSVJRX0dVRVNUX0VOQUJMRUQgaXMg
dW5zZXQuCkl0IGRlcGVuZHMgaG93IHdlIGRlY2lkZSB0byBpbXBsZW1lbnQgdGhlIHR3byBmdW5j
dGlvbnMuIFdlIG1heSB3YW50IHRvIApkZWNvdXBsZSB0aGUgR0lDIGNvbXBsZXRlbHkgdGhlIEdJ
QyBzdGF0ZSBmcm9tIHRoZSB2R0lDIHN0YXRlLiBGb3IgCmluc3RhbmNlLCB5b3UgbWF5IHN0aWxs
IHdhbnQgdG8gbWFzayB0aGUgaW50ZXJydXB0IHJlZ2FyZGxlc3Mgb2YgdGhlIAp2R0lDIHN0YXRl
IHdoZW4gdGhlIHZDUFUgaXMgc2NoZWR1bGVkIG91dC4gVGhpcyB3b3VsZCBwcmV2ZW50IGEgCm5v
bi1xdWllc2NlbnQgZGV2aWNlIHRvIGdlbmVyYXRlIGludGVycnVwdCB3aGlsZSB3ZSBjYW4ndCBk
ZWFsIHdpdGggdGhlbS4KCkJ1dCBhcyB3ZSBzZWVtIHRvIGNvbnNpZGVyIHRoZSBkZXZpY2Ugd2ls
bCBiZSBxdWllc2NlbnQgYW5kIGFsc28gY2xlYXIgCnRoZSBwZW5kaW5nIGJpdCwgdGhlbiBJIHRo
aW5rIHdlIGNhbiBjb21wbGV0ZWx5IGF2b2lkIHRvIG1hc2svdW5tYXNrIHRoZSAKaW50ZXJydXB0
LiBUaGlzIHdvdWxkIHNhdmUgYSBjb3VwbGUgb2YgYWNjZXNzIHRvIHRoZSBHSUMgaW50ZXJmYWNl
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
