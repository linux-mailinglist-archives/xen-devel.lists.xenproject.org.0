Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CD1634AB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 22:19:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4AE6-0006hr-Ac; Tue, 18 Feb 2020 21:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SCTr=4G=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1j4AE4-0006hK-N4
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 21:16:16 +0000
X-Inumbo-ID: e5d3f614-5293-11ea-bc8e-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5d3f614-5293-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 21:16:16 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c16so21645507oic.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 13:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DwdjqiT5xXCeSH8GCvUUaCh6zKIsE26WZkiISaavmQQ=;
 b=a6T318AjZJCVcGDnrUMn8RKbfOm+BFwooWt9yUepjSdd4A5pJMTOU/BshW+Ob55ghk
 mcyXNHf8ArDkRNAqM+Q6uvYH0VPnWXxn6HZSCMRQIHjolVPqf0cCA5ic2Ds7KG9yvGnN
 vA/XrmVj0S9Otk6Xxi8nxvrrMPfe+UNSTJ+qmaUVfMmITt6zK9UMH3+EE8zOUQ+UUYTz
 nyen9dGsw7xjnocG0RaVWlGXnkr8heRm7pNrum5OfW5at7bagjdQm+7CbVLBO71e6oXB
 FSWhRVRHrKxOspkKWpzof8gIfAPROqR4zbFejvjwog6eS0A0rwzXGXPFWy74WLh8Hz1z
 3PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DwdjqiT5xXCeSH8GCvUUaCh6zKIsE26WZkiISaavmQQ=;
 b=qMkzm2+HlUUBcT2SBJqhzN28+/yUXlrjek1mIEyWKnB/rmiMtJAFyEgT8LVVywOOmc
 A3aOwbFTxSlvBqDOh2+0SQWSBGPY1WgHRPDA1mSp/YaWoQVgYOnKkfJU2dg6GN8MB7W2
 RJhcPRr/9D5oE0WTWUksALZSuJMEHl894hYIseFIxhmoy+OjghBk7bCWp12ZIZWQqbbp
 0FhbRrinRobX1wLmMGun0x4dG8CzZ59RmHpbymPI0uYEHYG6/2YSIs9VUZ2R0IfE78g8
 qzAK7jEjcS19kVBBmVsSjx4BS9Is1z475Av5b9/5swXG4F0vCEELBfAlnwCI7D9j6VsT
 QiEA==
X-Gm-Message-State: APjAAAVaDnfX2ltYH1E7FqMLJic3q4YE51Q+B7hNnl/js8MfBH6gfFsV
 +O0lgeCSPW1lomwpfuWyam3xEG7C66mQAdPZpWLezA==
X-Google-Smtp-Source: APXvYqxDi0XYyUG/YqOdpuG8+VgzvHc9lVbXhZda2YRalmLRWwVVd/k5iVtAXCHf31koxL1zRhS/pM1ddtGbI7EBv34=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2452185oie.146.1582060575413; 
 Tue, 18 Feb 2020 13:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
 <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
 <af34169f-fccc-da44-7b8e-1b38da4a203c@redhat.com>
In-Reply-To: <af34169f-fccc-da44-7b8e-1b38da4a203c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 21:16:03 +0000
Message-ID: <CAFEAcA-qQpa8mmK+GRx7_kFxdwbULb5edh3RH7dT+3pz66jDkw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBGZWIgMjAyMCBhdCAyMDowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPiB3cm90ZToKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2VsbCBjcHVfcGh5
c2ljYWxfbWVtb3J5KigpLiBBcmVuJ3QgdGhlc2Ugb2Jzb2xldGU/Cj4gVGhleSBjb25mdXNlIG1l
IHdoZW4gdXNpbmcgbXVsdGktY29yZSBDUFVzLgoKVGhleSBzb3J0IG9mIGFyZSwgYnV0IHRoZXJl
IGlzIG5vIHNpbXBsZSBtZWNoYW5pY2FsIHJlcGxhY2VtZW50CmZvciB0aGVtIC0tIHlvdSBuZWVk
IHRvIGxvb2sgYXQgdGhlIGluZGl2aWR1YWwgdXNlIHRvIHNlZSB3aGF0CmFkZHJlc3Mgc3BhY2Ug
aXQgc2hvdWxkIHJlYWxseSBiZSB1c2luZy4gRm9yIGluc3RhbmNlIHRoZSBjYXNlcwppbiBody9k
bWEvIHByb2JhYmx5IHdvdWxkIHJlcXVpcmUgdGhlIGRldmljZSB0byBiZSB1cGRhdGVkIHRvCnRo
ZSBuZXcgcGF0dGVybiB3aGVyZSBpdCB0YWtlcyBhIE1lbW9yeVJlZ2lvbiBkZWZpbmluZyB3aGF0
Cml0IHNob3VsZCBiZSBkb2luZyBETUEgdG8sIGFuZCB0aGVuIGl0IGNhbiBjcmVhdGUgYW4gQWRk
cmVzc1NwYWNlCmFuZCB1c2UgdGhhdCB3aXRoIGFkZHJlc3Nfc3BhY2VfKi4gQnV0IHRoYXQncyBh
IGJ1bmNoIG9mIHdvcmsKb24gb2xkZXIgZGV2aWNlcyB3aGljaCBtb3N0bHkgcGVvcGxlIGRvbid0
IGNhcmUgdmVyeSBtdWNoIGFib3V0LgoKSW4gdGhlb3J5IHdlIGNvdWxkIGRvIGEgdGV4dHVhbCBy
ZXBsYWNlbWVudCBvZiBjcHVfcGh5c2ljYWxfbWVtb3J5Kgp3aXRoIGFkZHJlc3Nfc3BhY2Vfcnco
JmFkZHJlc3Nfc3BhY2VfbWVtb3J5LC4uLikKYnV0IHRoYXQncyB1c3VhbGx5IG5vdCB0aGUgcmln
aHQgYWRkcmVzcyBzcGFjZSwgc28gSSdtIG5vdApzdXJlIHRoYXQgY2h1cm4gaXMgd29ydGh3aGls
ZS4KCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
