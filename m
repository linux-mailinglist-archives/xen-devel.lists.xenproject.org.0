Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17B7C87F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 18:23:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrKu-0001cs-UD; Wed, 31 Jul 2019 16:20:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXbA=V4=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hsrKs-0001cn-FX
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:20:18 +0000
X-Inumbo-ID: 15498cd2-b3af-11e9-8980-bc764e045a96
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 15498cd2-b3af-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 16:20:17 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id j5so133419394ioj.8
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NzsYVHwtdZw81IodXfTdeN5AreLVw9cq0ht0QoISio=;
 b=qdsP3bTMKcX25JDML+3jJjQMUssn+ww8H43m8YiXUOD/PCBWeIuoEQCcw5g1L+ByLe
 hKgaRFsn3RLnoYN2/2wgyS61hGlSxEqXIDh398nKswNzoE27UFiHz3u5NSn/3t6O9poM
 U/GixdeOOhvQ7yxUj9BgdtFckW4Sd8quzTlu2fZWjFbBPd1ITqblcynG5OcVSfcAixom
 Ucu04fZQGrCXS/7zlNRaRG+nSfuakbRJzIlSl/o26wZ4+523yRtOaiAGzTR4MVMactqS
 e5XGbm5gqz+NpKB4+7vxJDMfNS5WLLpDzg9UXN9EOtnfHAOQhF/0eqKdkGBqEnhOYTPB
 +LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NzsYVHwtdZw81IodXfTdeN5AreLVw9cq0ht0QoISio=;
 b=KHXvwuHZ74SYpfxSkM84uV11kApMFGYfAsH5KxDvja4AVlTUjtX93wPMOnR+e+kFsQ
 +lwwuI8bhT1IUCfO5r+RzreWHQzqgYGMv6SErGFh8KDfz7xEXCYrMHVPoodbepPI6WGn
 YYoTXM0uc0gP4kNoeMN2L7MH9CzjVC/+Ozlyg3ypVmJzSodbPi/1Nd8iQJVIHzvuSCE0
 GoZOMhXdauvyMRlBqNygA+T5TZxn5lv/mOmxVuKfrW+x6c5bbOoqVU8EOFDk7rNCH++t
 VPbjNIYLc0o40HC4zYHfBQltyufPUpdD2l0ZFux6xKxLw/ykA/F/OLtwzdn5i7xv/Kln
 4vdA==
X-Gm-Message-State: APjAAAWKjSB9xfgsUQ/87KdfNbO5nDSCsP4aaUPl5atMaxk7EPF4WCD9
 ynquzZZqvcuttTJAGz+IPXhkLApTvfIHafiNMhU=
X-Google-Smtp-Source: APXvYqwL/feWljEjgx5r6khqZfxlvDcUYrCDd//DxIfuX8/9n78KAIrVGWQywJI4kqKNzbwWwW+uluZmvu1BZX3pfZ0=
X-Received: by 2002:a02:b016:: with SMTP id p22mr41674936jah.121.1564590016511; 
 Wed, 31 Jul 2019 09:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
In-Reply-To: <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Wed, 31 Jul 2019 19:20:04 +0300
Message-ID: <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgNDoyMSBQTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgoKPiA+Pj4+ICAgICAgLSBMaW5lIDY3OiBJIGJlbGlldmUg
SmFuIHJlcXVlc3QgdGhlIHNwYWNlIGJlZm9yZSBsYWJlbAo+ID4+PiBTZWVtcyBhZ3JlZWQgbm90
IHRvIGFkZCB0aGUgc3BhY2VzIGJlZm9yZSBsYWJlbC4gUmlnaHQ/Cj4gPj4KPiA+PiBDZXJ0YWlu
bHkgbm90LCBhZmFpYS4gSSB3aWxsIG9iamVjdCB0byBhbnkgd3JpdHRlbiBkb3duIHJ1bGUgZGlz
YWxsb3dpbmcKPiA+PiBsZWFkaW5nIGJsYW5rKHMpIGFsdG9nZXRoZXIuIEkgd2lsbCBhcmd1ZSBm
b3IgbWFraW5nIG1hbmRhdG9yeSBhdCBsZWFzdAo+ID4+IG9uZSBibGFuayBvZiBpbmRlbnRhdGlv
bi4KPiA+Cj4gPiBDb2Rpbmcgc3R5bGUgYXJlIGEgbWF0dGVyIG9mIHRhc3RlLiBJZiBldmVyeW9u
ZSBpcyBnb2luZyB0byBzYXkgIkkgd2FudAo+ID4gdGhpcyBpbiB0aGUgY29kaW5nIHN0eWxlIiwg
dGhlbiB3ZSBhcmUgZ29pbmcgdG8gc3BlbmQgY291bnRsZXNzIG9mIGhvdXJzCj4gPiBiaWtlLXNo
ZWRkaW5nLiBUaGlzIGlzIG5vdCBob3cgd2Ugc2hvdWxkIHVzZSBvdXIgYWxyZWFkeSBsaW1pdGVk
IHRpbWUuCj4KPiBJIGFncmVlIHdpdGggd2hhdCB5b3Ugc2F5IGluIGdlbmVyYWwsIGJ1dCBub3Qg
aW4gdGhpcyBzcGVjaWZpYyBjYXNlOiBJJ3ZlCj4gZXhwbGFpbmVkIHdoeSB0aGUgbGVhZGluZyBi
bGFuayhzKSBhcmUgd2FudGVkIGhlcmUuIFRoaXMgaXMgbm90IGJlY2F1c2Ugb2YKPiBteSB0YXN0
ZSwgYnV0IGJlY2F1c2Ugb2YgaGVscGluZyB3aXRoIHBhdGNoIHJldmlldy4KCgpJJ3ZlIGNoZWNr
ZWQgYWxsIHRoZSBzdHlsZXMgc3VwcG9ydGVkIGJ5IGNsYW5nLWZvcm1hdCBhdCB0aGUgbW9tZW50
OgpMTFZNLCBHb29nbGUsIENocm9taXVtLCBNb3ppbGxhLCBXZWJLaXQsIE1pY3Jvc29mdC4gTm9u
ZSBvZiB0aGVtIHVzZXMKc3BhY2VzIGJlZm9yZSBsYWJlbHMuIEl0IHNlZW1zIExpbnV4IGNvZGlu
ZyBzdHlsZSBkb2VzIG5vdCB1c2UgaXQgYXMKd2VsbC4gUGxlYXNlIHNlZSB0aGUgcXVlc3Rpb25z
IGJlbG93OgoKSG93IGFsbCB0aG9zZSBwcm9qZWN0cyBsaXZlIHdpdGhvdXQgdGhpcyBpc3N1ZT8K
V2hhdCBpcyB0aGUgcmVhc29uIG5vdCB0byBmaXggJ2RpZmYgLXAnPyBJcyBpdCBub3QgcG9zc2li
bGUgYXQgYWxsPwpDb3VsZCB5b3UgcGxlYXNlIHNoYXJlIG1vcmUgZGV0YWlscyBhYm91dCB0aGUg
YmFja2dyb3VuZCBvZiB0aGUgaXNzdWUKYW5kIGV4YW1wbGVzPwoKVGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
