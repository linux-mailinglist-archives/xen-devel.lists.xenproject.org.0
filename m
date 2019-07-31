Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3AE7CCC4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 21:32:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuIk-0007Rk-67; Wed, 31 Jul 2019 19:30:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=92Dq=V4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsuIi-0007Rf-UN
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 19:30:17 +0000
X-Inumbo-ID: 9f703e04-b3c9-11e9-8980-bc764e045a96
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f703e04-b3c9-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 19:30:15 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v22so50096405qkj.8
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jtXeqVxJmOgwtBt7F3nE6SA54PIQWdW5c0Ckzv02iok=;
 b=OaVKJm49yVyRIbNG42suMmQv/II/6lCYFPZhcy2I7A18JAY+bjhT/HI3Cbi1sEVk96
 rQQk6sw8lRlxG6YXj3VNsxukG9Z5dU+U3tRkfukHQozpAYVSROkPCcyrYM4QQRjyyBl8
 PtxIVRckKcXvorqkmVUiRCmdo26FWXUOt/IL02QswtLPK2wxS/Td7b/pRKZxz6KYBb9Q
 GjDCotW5JUrlhNx4mTy8bPlYyYxP5IusekspNrrbc9vyaIkSMKbmgLBoj1ew2UWvGdPT
 XCkKg13265QfWtqUk3yE3HP1LqucsTpd7YySsoOlDfJyiy5XeJPzccE2w9S9RAwd1Wj8
 riPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jtXeqVxJmOgwtBt7F3nE6SA54PIQWdW5c0Ckzv02iok=;
 b=RBrSUjRwYIbazwZehl+hkTTfBXCkP1QP4KUvznxFThki80M+HFn6YkNRncVk0+DKll
 SWcVOfIWcgkaznJ+az/lSnRgCt3GBJbJlWUhmC8ObkPTDs/4ds4xaDmb2x0BdN5ZxgNd
 WNQoapBitLa8cHiUKHfw/lhToM34+7OwjbTP2OyGlLX5FXnKJiguSWbYoucVjrH917oY
 WFe+qcQ8gHVS8hOmdz/GHDlAweSzH3lK91PhxDp8quHMfK+sashOiKXNs2loStbtrhOZ
 r/A+GnV0iZf/XBHH4CCL/o+KNrshQUbXmSOgqi6+nMBUtKRrv2CrBOFaqbw3ldMB8EMv
 lCSA==
X-Gm-Message-State: APjAAAUdDWWviCY/HQvrIGagu93S3eSR99xe8z7fgjCby1H2OJ25ALxn
 NlM9/KTrswzdwHcZ1MYouCyz78CrSBEeeEKpxkYC/Q==
X-Google-Smtp-Source: APXvYqwrnqgqRXQHO2GyYrW/OM7G8R/WslVKwKWbYxkAulG3hC4ulJcJrR4sBwZtIKoD5qoyzMdpIJReohOlO0PMS/8=
X-Received: by 2002:a37:a40f:: with SMTP id n15mr77232445qke.19.1564601415263; 
 Wed, 31 Jul 2019 12:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
In-Reply-To: <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Jul 2019 12:30:04 -0700
Message-ID: <CAMmSBy85tZjSA7Yd2HG=F4dmK8uzxXPVY20UwAaNGYhJ1LjzKA@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTozNiBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAzMCwgMjAxOSBhdCAxMDo1NToy
NEFNIC0wNzAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gU29ycnkgLS0gZ290IGEgYml0
IGRpc3RyYWN0ZWQgeWVzdGVyZGF5LiBBdHRhY2hlZCBpcyB0aGUgbG9nIHdpdGggb25seQo+ID4g
eW91ciBsYXRlc3QgcGF0Y2ggYXR0YWNoZWQuIEludGVyZXN0aW5nbHkgZW5vdWdoIHRoZSBib3gg
Ym9vdGVkIGZpbmUKPiA+IHdpdGhvdXQgc2NyZWVuIGFydGlmYWN0cy4gU28gSSBndWVzcyB3ZSdy
ZSBnZXR0aW5nIGNsb3Nlci4uLgo+ID4KPiA+IFRoYW5rcyBmb3IgYWxsIHRoZSBoZWxwIQo+Cj4g
VGhhdCdzIHF1aXRlIHdlaXJkLCB0aGVyZSdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBiZXR3ZWVu
IHRoZQo+IHByZXZpb3VzIHBhdGNoZXMgYW5kIHRoaXMgb25lLCB0aGUgb25seSBkaWZmZXJlbmNl
IGlzIHRoYXQgdGhpcyBwYXRjaAo+IGhhcyBtb3JlIHZlcmJvc2Ugb3V0cHV0LgoKVGhhdCdzIHN1
cGVyIHdlaXJkIGluZGVlZC4gSSdtIHJlLXRyeWluZyB5b3VyIHZlcnkgZmlyc3QgcGF0Y2ggcmln
aHQKbm93IHRvIHNlZSBpZiBpdCBtYXkgYmUgYSBwaWxvdCBlcnJvciBvbiBteSBwYXJ0IChob3Bl
IG5vdCkuCgo+IEFyZSB5b3Ugc3VyZSB5b3UgZGlkbid0IGhhdmUgYW55IGxvY2FsIHBhdGNoZXMg
b24gdG9wIG9mIFhlbiB0aGF0Cj4gY291bGQgZXhwbGFpbiB0aGlzIGRpZmZlcmVuY2UgaW4gYmVo
YXZpb3VyPwoKUHJldHR5IHN1cmUgLS0gYnV0IGxldCBtZSBwdXNoIG15IGJyYW5jaCBpbiBFVkUg
YW5kIHNob3cgdG8geW91IGFsbAooeW91IHdpbGwgbmVlZCBEb2NrZXIgaW5zdGFsbGVkIHRvIGJ1
aWxkIFhlbiB0aGUgd2F5IEVWRSBkb2VzKS4KCkJ1dCBpZiB5b3Ugd2FudCB0byBjaGVjayBmb3Ig
eW91cnNlbGY6CiAgICQgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZlLmdpdCAt
YiB4ZW4tYnVnCiAgICQgY2QgZXZlL3BrZy94ZW4KICAgJCBkb2NrZXIgYnVpbGQgIC0tbm8tY2Fj
aGUgIC4KICAgJCBkb2NrZXIgZXhwb3J0ICQoZG9ja2VyIGNyZWF0ZSBYWFggYSkgfCB0YXIgeHZm
IC0gYm9vdAogICAkIGxzIGJvb3QveGVuLmd6CgpUaGFua3MsClJvbWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
