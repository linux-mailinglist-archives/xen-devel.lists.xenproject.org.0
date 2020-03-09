Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499C17E32A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 16:11:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBK17-0003fa-0J; Mon, 09 Mar 2020 15:08:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1ca=42=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jBK15-0003fU-My
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:08:27 +0000
X-Inumbo-ID: d3f60e9e-6217-11ea-8924-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3f60e9e-6217-11ea-8924-bc764e2007e4;
 Mon, 09 Mar 2020 15:08:27 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z65so6466498ede.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCiHmJvEX6uE56nzo0xdgLMCmKgcnQGKsosSMA1X3Ik=;
 b=uMnwV8nAFaSWYewFzTlKJMnln8LLM4Psu3JByvfwI5II/NS01TQrZqcEeLyhVH1OTH
 mLoWhsLVa6PYl1hEl1VMMRs6X9BuWard91+DUGV7d3QEya4enksj/65YCnyCSFbG3Ukc
 bKT68NJYj+SboaZwI1oild5J1hb8E7dGzIf7GMrZT19UlPWfMEki+fe2aL2IxWbbSNsM
 Lwde2vDqEdbXNh7x08BSuZdNvjkZBU9UCoYcRyRbt6nZ6fTPZ2PKY8VCM4v6tqxywxfr
 IStp1wFR/8OvD7wdAmqf39Hh0Rh1AqHqEzhlHOapSOe9xlY/zEMjV433HcTVSZ1WblUG
 L+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCiHmJvEX6uE56nzo0xdgLMCmKgcnQGKsosSMA1X3Ik=;
 b=BGxGEKT2SIri/5AVB/boez5l635nD69ZlA1VrAwgKecMTROURTtjCPJSdThHq8N0z0
 tnAICftUJMz4PSUB3oS6CmWOpRkuSPWij9UrbJQzqeKqD3sFIQMNcZME15gjWtj/nn0Y
 L6xc6m/WnKB3rfSxHXBW8xJfM4GSRJ/vZxbfzrnCNrqs53t9fWaqH0f5BruBvnAlRfn6
 Jxsbwi+JITEq4stcOjG3nsB5ySYfj5PtvaJMjCKh6uoR5aMJT5nJSX7aH/nWJIJS1MSv
 BklTZ7vcY0y/d7FbC+x0QqKO7rG2YxtjIyJdf5ksht98pdgQGu1yg05xGNKdcBdHB68A
 Uxjw==
X-Gm-Message-State: ANhLgQ3LRmPw/avCVAb1KOtYAJ/GyN1yQoO4BDXlU5NA21mDMGZzxf17
 ehezcJ8b1coBo7k2JwJHIKFkq9wd3Lk=
X-Google-Smtp-Source: ADFU+vsCgN87ynK/p80g3Q6O6o9rOHFp9y+4ZtjTPQ9q1uyGZZIy1eDqmYnRbYSyLIct9U5LSprXEA==
X-Received: by 2002:aa7:d2c1:: with SMTP id k1mr18041309edr.29.1583766506306; 
 Mon, 09 Mar 2020 08:08:26 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id t24sm3908306edy.94.2020.03.09.08.08.25
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 08:08:25 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id n8so6317066wmc.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:08:25 -0700 (PDT)
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr4054056wmh.186.1583766505262; 
 Mon, 09 Mar 2020 08:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
In-Reply-To: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Mar 2020 09:07:49 -0600
X-Gmail-Original-Message-ID: <CABfawhnrjsGBsAEOw6p7Je-BuZrtchNSvxTyYJTQXC5G6tMgmQ@mail.gmail.com>
Message-ID: <CABfawhnrjsGBsAEOw6p7Je-BuZrtchNSvxTyYJTQXC5G6tMgmQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCA1OjQ5IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbW9uIGhlYWRlciBkb2Vzbid0IGl0c2VsZiBuZWVkIHRv
IGluY2x1ZGUgcHVibGljL3ZtX2V2ZW50Lmggbm9yCj4gcHVibGljL21lbW9yeS5oLiBEcm9wIHRo
ZWlyIGluY2x1c2lvbi4gVGhpcyByZXF1aXJlcyB1c2luZyB0aGUgbm9uLQo+IHR5cGVkZWYgbmFt
ZXMgaW4gdHdvIHByb3RvdHlwZXMgYW5kIGFuIGlubGluZSBmdW5jdGlvbjsgYnkgbm90IGNoYW5n
aW5nCj4gdGhlIGNhbGxlcnMgYW5kIGZ1bmN0aW9uIGRlZmluaXRpb25zIGF0IHRoZSBzYW1lIHRp
bWUgaXQnbGwgcmVtYWluCj4gY2VydGFpbiB0aGF0IHRoZSBidWlsZCB3b3VsZCBmYWlsIGlmIHRo
ZSB0eXBlZGVmIGl0c2VsZiB3YXMgY2hhbmdlZC4KCkp1c3QgY3VyaW91cywgd2hhdCdzIHRoZSBi
ZW5lZml0IG9mIGRvaW5nIHRoaXM/CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
