Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5C179480
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:08:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WWf-0007m8-B7; Wed, 04 Mar 2020 16:05:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bZrs=4V=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j9WWd-0007m3-Gj
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:05:35 +0000
X-Inumbo-ID: fae07a42-5e31-11ea-b52f-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fae07a42-5e31-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 16:05:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a12so2640509ljj.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 08:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OpuclIP8h9fPOKgWH5zHXgB+yfeXtCBYfgxT0u17rAs=;
 b=ZIkDq/At9EugDmQ/aT3JgGFQ35BVoeFJYPQwz2lddMieRGDfSbivpRiy1hJTXp/Qf8
 sNuwTqBmeJcAW3FWxUFNdq2ke30+ORisXzhlBS7YrcADkf3so/f/1pgOFyYLzqRjG27F
 5gyBWeGzvX+UFPcU3FgEaQ7PoqxdcTUCCUHl3FG5BOhWTgZoTZ5tIdgswM5tDnbJIFpk
 rmcQvoqXKiqWi+nsjcPlhktBVs2rKbsBl3VGflAzZ10rVESqNmSaRCb19e1nwOpBPIUd
 bSaJPte8O+xHk6hyoQaq50aYSY1UYx+FlgEVD0c9BB2OpW1v864+9vXtz1INp4B2P6BS
 VuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpuclIP8h9fPOKgWH5zHXgB+yfeXtCBYfgxT0u17rAs=;
 b=HGqehXFV49ZrfuCDJZYk8AjPmh8POQGzn/PCj7abGEQzybus1kPhZEyrUaw4ncmaA9
 I2tqBvotqxhzgskUGC8N9AoNGRS7nmufXeOjGQ6OR9NyfIdmr+ujMhmAH1h3g2J3zukd
 2H5MTIA6gpCIwYJ9/YFJCpq1JP7o8Utic8yJf1j5sGtPKFFCyHzxtN3LzmXdDwj3ljvz
 cwOJEk5RJzdTDvUlDDttB6q3GqQr92is6trwpWU6WkuZLVaas7aAX0xaJ/qAhcghD2Sf
 5N0PURDiqH+uGdZ/IF5Im5WTvf6B53UwVsKXP0/5zlsFMRHDBHplmuJ7XfSI2WLMIDww
 pfhA==
X-Gm-Message-State: ANhLgQ1qEL26L7MikxZAGioQETrm4/Zz8YpQvSoew3df6cosq7VdDaWd
 gvzDGvveApj38tWBax/be1XVBIK21geJEpBLEGI=
X-Google-Smtp-Source: ADFU+vsput6Fgq6c+OCm/oeZ0vC9XG3amhxGEgfolubAcI5hhjly+4RgPoXecR9y4MEhvPDbIspwnV+63yBO15SvCXM=
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr2273132ljj.253.1583337933877; 
 Wed, 04 Mar 2020 08:05:33 -0800 (PST)
MIME-Version: 1.0
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
In-Reply-To: <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 4 Mar 2020 11:05:22 -0500
Message-ID: <CAKf6xpuRQDvHc6WjrSmaa-NO-++LGVU7Rf+prj0L0DzTjEPh+Q@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Aaron Janse <aaron@ajanse.me>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ID4+PiBPbmUgb3RoZXIgdGhpbmcgdGhhdCBtaWdodCBiZSBub3Rld29ydGh5LiAgTGludXgg
b25seSBwcmludHMgQUNQSSBJUlEwCj4gPiA+Pj4gYW5kIElSUTkgdXNlZCBieSBvdmVycmlkZSB3
aGVyZSBYZW4gbGlzdHMgSVJRIDAsIDIgJiA5Lgo+ID4gPj4gSHVoIC0gdGhpcyBpcyBzdXBwb3Nl
ZCB0byBjb21lIGRpcmVjdGx5IGZyb20gdGhlIEFDUEkgdGFibGVzLCBzbyBMaW51eAo+ID4gPj4g
YW5kIFhlbiBzaG91bGQgYmUgdXNpbmcgdGhlIHNhbWUgc291cmNlIG9mIGluZm9ybWF0aW9uLgoK
Qm90aCBYZW4gYW5kIExpbnV4IG9ubHkgc2VlIHR3byBBQ1BJIG92ZXJyaWRlcyAoMCAmIDkpIGZy
b20gdGhlCnRhYmxlcy4gIEhvd2V2ZXIgdGhlIFhlbiBsb2dpYyBpbiBtcF9jb25maWdfYWNwaV9s
ZWdhY3lfaXJxcygpIHRoaW5rcwpJUlEyIGlzIGFuIG92ZXJyaWRlCmlycSAyOiBpcnEtPm1wY19z
cmNidXMgMCwgaXJxLT5tcGNfc3JjYnVzaXJxIDAsIGlycS0+bXBjX2RzdGFwaWMgMiwKaW50c3Jj
Lm1wY19kc3RhcGljIDIKTWF0Y2hlcwooKGlycS0+bXBjX2RzdGFwaWMgPT0gaW50c3JjLm1wY19k
c3RhcGljKSAmJgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpcnEtPm1wY19kc3Rp
cnEgPT0gaSkpCgppIGlzIDIsIHNvIGlycS0+bXBjX2RzdGlycSBtdXN0IGJlIGFzIHdlbGwuCgpS
ZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
