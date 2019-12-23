Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F81298CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:41:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQjN-0005Ub-9x; Mon, 23 Dec 2019 16:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a8pi=2N=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ijQjL-0005UW-Hk
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:38:51 +0000
X-Inumbo-ID: ae58c9da-25a2-11ea-a914-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae58c9da-25a2-11ea-a914-bc764e2007e4;
 Mon, 23 Dec 2019 16:38:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577119123; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=KGB0wgjg+GqPT6cRP2IW6CQc0pRwRKq4pF0rTYW9/PI=;
 b=G8TbnU1QqwPYD3UEX7wSmIIU1IWVEcWtYUKG7qlRIIBv6ucy9BG3qJq1+bYrubtZzKrAiW0K
 aPdQwcd30tq3Tuj5pRY9bOeMQzR9aJx3duqUFZufSJ99eISaQ5jFX3dweHNHWlc+0DaSrO7O
 AuT3t5c66dsYQNuTwBsqfP2wXUo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5e00ed92.7fc92ba49ab0-smtp-out-n02;
 Mon, 23 Dec 2019 16:38:42 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d16so17183200wre.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 08:38:41 -0800 (PST)
X-Gm-Message-State: APjAAAXxEyGgJsdfhxA1YLMI/9MIxjZKAa04J6z0L0bar5Co1Ne4oOKi
 2WS6NFKELVXrx7uXRJi2me7ghxbDoUrm6CWrizs=
X-Google-Smtp-Source: APXvYqxwUBqhK+sl1jd8vE5qWvXtLOLsZZFsiETyPzEaoBcQ5iVKJxEBbFjLE3l4C9lfvDslvAjYaTLFhdUp+Sa9+Ag=
X-Received: by 2002:adf:f586:: with SMTP id f6mr29878911wro.46.1577119120395; 
 Mon, 23 Dec 2019 08:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20191223140409.32449-1-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 23 Dec 2019 09:38:04 -0700
X-Gmail-Original-Message-ID: <CABfawh=D44L8MWwow3COrcHvtyN3yKreC-woFkkVh81E+yobmQ@mail.gmail.com>
Message-ID: <CABfawh=D44L8MWwow3COrcHvtyN3yKreC-woFkkVh81E+yobmQ@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgNzowNCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhaW1zIHRvIHNh
bml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3ZpZGVkCj4gdmFsdWVzLCBmb3Ig
YWx0cDJtX2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4KPgo+IFJlcXVlc3RlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgoKRm9yIHRoZSBtZW1fYWNjZXNzIGJp
dHM6CkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
