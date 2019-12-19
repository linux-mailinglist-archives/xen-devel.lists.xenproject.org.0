Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABED126E1F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 20:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii1e0-0000mn-JF; Thu, 19 Dec 2019 19:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8Kc=2J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ii1dy-0000mi-VG
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:39:31 +0000
X-Inumbo-ID: 45ff4214-2297-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45ff4214-2297-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 19:39:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q10so7162985wrm.11
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 11:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrfmSE7bVmvrC4ogv8ue1x7y11GhDwZFzCAW5SoXKok=;
 b=efmnEhS+h7+ghwgvmyaabpuTgxG+4vnXzRB1nO2+lx7CZVrBFytEF/Dfv8uXdBeIYk
 iqUgTb1uQjMQnwdIIEUC2I1RZvQF6ipz4Sjj2/leufz/ZqoQMbBRhJmMbmvnDFAq46Mc
 EQG9EBINgxlnaDOlplCCzUJbfC02FkU4Q7IqFer4GgOZvgee/sVPQoORODxCYTsbQPS+
 2mG08G91eDdZ5dZNvIwE/CGD/WWlMzhdH5T64A0Kddjx80AjwdhMd/gDeQJQFgrJLrBj
 kb8UCPpb8N08hiKsXQ31boRJT7ZeXV3Za42ttsQaaNYwe5kwgogrAPiGjczNfy6F4xft
 QVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrfmSE7bVmvrC4ogv8ue1x7y11GhDwZFzCAW5SoXKok=;
 b=eX0lEHJvOSvs1zkkFkOGnwy83XK01sLL/VrQuZu6Ru+SIO+XmrymlYkyiF5f2Lk+D8
 mXePwjt5m8+bmsC+EuQbqjyTp47+tE8QAipGLTuApPCaxpfip2W+F6mj9v2PPw8mOWWS
 LgyEAcJwbW8B8iGf4eA5p+ckxcJhuD1x/YYwT7Jm7X5Wvru4e+hEuHjnL19TNhKS6xv2
 lTZ3ImV+LUZnnGa5t0/96IFiLD2iy4UCAbdh/eUpLJEAzFU1sq3yCEkyBBhst3ZX6YsJ
 YUiV+BTqzX1bZ0O2qnkgGbaIDnaJ1GiUOruPYhopePSGI5joXZi9WsSaXxSwBEj64M4s
 sRig==
X-Gm-Message-State: APjAAAVGcAVkvBjxT7IrfHCggF959YGhedzjEdI0M5AIvIsElaMauhrh
 PQrJlrL0boZvMQ7wRwgYBdFYukNf5RorwtT21HM=
X-Google-Smtp-Source: APXvYqyuCf/jyVFLobJRVwLWUVpiiNWJYBhUBBGA7z6cNeAiRTYHCxKul7QKevQV229pyBo3pKFPA82iBG65M3gydSY=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10621417wre.372.1576784369422; 
 Thu, 19 Dec 2019 11:39:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
In-Reply-To: <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 19 Dec 2019 12:38:53 -0700
Message-ID: <CABfawhkaLMX9aM0dFP1M7foRUa9fi7ZaoQwXpw0ZXAcjVmYsuw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9odm0uaAo+ID4gQEAgLTMzNSw2ICszMzUsMTAgQEAgdW5zaWduZWQg
bG9uZyBodm1fY3I0X2d1ZXN0X3ZhbGlkX2JpdHMoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgYm9v
bCByZXN0b3JlKTsKPiA+ICBib29sIGh2bV9mbHVzaF92Y3B1X3RsYihib29sICgqZmx1c2hfdmNw
dSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmN0eHQpOwo+ID4KPiA+ICsvKiBDYWxsZXIgbXVzdCBob2xkIGRvbWFpbiBsb2Nr
cyAqLwo+Cj4gSG93IGFib3V0IGFzc2VydGluZyBzbz8KCkFGQUlDVCB0aGVyZSBpcyBubyAiZG9t
YWluX2xvY2tlZF9ieV9tZSIgZnVuY3Rpb24sIG9ubHkKcGFnaW5nL3AybS9nZm5fbG9ja2VkX2J5
X21lLiBTbyBhbnkgc3VnZ2VzdGlvbiBvbiBob3cgdG8gYWNoaWV2ZSB0aGF0PwoKVGhhbmtzIQpU
YW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
