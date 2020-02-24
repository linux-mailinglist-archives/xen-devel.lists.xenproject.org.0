Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25116B3BA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 23:18:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6M0n-0001Av-Az; Mon, 24 Feb 2020 22:15:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzzy=4M=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6M0m-0001Aq-54
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 22:15:36 +0000
X-Inumbo-ID: 2da4ce82-5753-11ea-8cb6-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2da4ce82-5753-11ea-8cb6-bc764e2007e4;
 Mon, 24 Feb 2020 22:15:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p14so13776656edy.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0Khut4nPumIC0dZ57rcHsF9qxE9XJZcNeDCalE4Zuw=;
 b=iSzKj24HdTuvbmma+mh6JRrS5gCB/8EKa4i9XNdzxQuGj+KGp3R1TiolsmkPuLzzGB
 0f12B/rlzvPdEIp4OrvKvNEY9vO09+xLFbiCjEj5CwKKRyK3n30NkJ3XRXRVjZ9ezg6E
 VKfbvt9VZ1JzrZ/aCQN6vZmPWlRq7K6+x5uVOPemVGRPYqKTZansZDqG5T494zon9DB3
 VbfkWFb+p6FywFXgNFgHDMM4nrgg2OBsk8/6QXmcUWMALB2PFvpC7mKrjV96LNERa5xH
 eS/pd7BVTSpSIuOZtNMEAM/TvAJYXrtTA+1yuOz1c/unD2BliM1QI50eerskaRv9X7QE
 WYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0Khut4nPumIC0dZ57rcHsF9qxE9XJZcNeDCalE4Zuw=;
 b=NyMM0ei7NDIYv1xbNxmVbRrMdxMJ6FiqDEF2yTKPreMt9LwHti3zWgxftV3XBtTGoD
 /4qFgsnDfFfJe3gr1v28HhUZUv9JnuP5oKn80U37MpZzlodYHG42bMHl1Fj6ZTeXk6RY
 l9xTic2bRUJmWAv1pTYvljJT8mWm0+M7akiXA2eQ/0kRKWqa9iGhSfGOSlZUttNwaTzm
 DYEDBg2fb85VZaZKxfqDKin4yMN/A7Z8JStGzj1EyYjmqoGoWJbPZne/5INZ2NbHsLok
 bDu6BBkf4xdKM+E1zjL4WgRAGwc66b/lIQodxdAOY1GWDIDL7cuQWeNLgl6O7u5OKRvR
 PhLg==
X-Gm-Message-State: APjAAAXFC9XGf+xVkEwpsunqX6C50r+N3PlEAyQ5A/SgGhm/D7d/YwXL
 KLb+x/gyL/m7L2dtPm83VfEWtQup3Uw=
X-Google-Smtp-Source: APXvYqyd1bFa1RRKnVB52hSpUUT0bRgTtdd8k13mkTyOl5lhvaFa50pX/O18GtceYq/xwHu4uFouMg==
X-Received: by 2002:a17:906:aad0:: with SMTP id
 kt16mr48501177ejb.223.1582582534085; 
 Mon, 24 Feb 2020 14:15:34 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id r23sm1063416edx.24.2020.02.24.14.15.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:15:33 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id t23so958484wmi.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:15:32 -0800 (PST)
X-Received: by 2002:a1c:7315:: with SMTP id d21mr1108314wmb.186.1582582532392; 
 Mon, 24 Feb 2020 14:15:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
In-Reply-To: <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Feb 2020 15:14:56 -0700
X-Gmail-Original-Message-ID: <CABfawhmBdnKj=GCcjwPyL0+_1-5ifYBG_VEwE_YJ8fbPXF1TZQ@mail.gmail.com>
Message-ID: <CABfawhmBdnKj=GCcjwPyL0+_1-5ifYBG_VEwE_YJ8fbPXF1TZQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ID4gK2ludCBtZW1fc2hhcmluZ19mb3JrX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3Qg
Z2ZuLCBib29sIHVuc2hhcmluZykKPiA+ID4gK3sKPiA+ID4gKyAgICBpbnQgcmMgPSAtRU5PRU5U
Owo+ID4gPiArICAgIHNocl9oYW5kbGVfdCBoYW5kbGU7Cj4gPiA+ICsgICAgc3RydWN0IGRvbWFp
biAqcGFyZW50Owo+ID4KPiA+IENhbiB5b3UgY29uc3RpZnkgcGFyZW50LCBJIGFzc3VtZSB0aGVy
ZSBhcmUgbm8gY2hhbmdlcyBtYWRlIHRvIHRoZQo+ID4gcGFyZW50IGRvbWFpbiwganVzdCB0aGUg
Zm9ya2VkIG9uZS4KPgo+IFN1cmUuCgpBY3R1YWxseSwgbm8gY2FuJ3QgZG8uIFRoZSBwYXJlbnQg
Y291bGQgZ2V0IG1vZGlmaWVkIGhlcmUsIHNpbmNlIHdlCmNvdWxkIGVuZCB1cCBtYWtpbmcgdGhl
IHBhcmVudCdzIG1lbW9yeSBpbnRvIHNoYXJlZCBlbnRyaWVzLiBTbyB1c2luZwpjb25zdCBoZXJl
IGlzIG5vdCBqdXN0aWZpZWQgc2luY2UgdGhlIHBhcmVudCBjYW4gYW5kIGRvZXMgZ2V0Cm1vZGlm
aWVkLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
