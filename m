Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FF10A354
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:27:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZebD-0003Hq-Tj; Tue, 26 Nov 2019 17:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D0sf=ZS=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iZebD-0003Hk-6E
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:26:03 +0000
X-Inumbo-ID: d1de236e-1071-11ea-b155-bc764e2007e4
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1de236e-1071-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 17:26:02 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id w47so18138419qtk.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 09:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NZy+tINSeQMKpWsRE+yjbOnqQExOvPKvY/WmPOPzO3A=;
 b=D59isuJBqAg4Q45nQtGpQ9GJFPvvYPhZnLAGqz71SRBqJZF4tlHAY+W9FwqxCQixkH
 Pf3EFZUeL+Tlb9sg5riLh5hxEbAyROHJfqT188NXISy/Zbn2ILIzbDOvBAiJD0V6EDN8
 ezL4MOKGpvC9wLeghNS3jabK35P66zQ82cf+7MCseZsb0vOir5IoOkfVbYuWRAsEzY4i
 LgycvwMxulaZ8YM2PrtFRvnlKfOxmSJv9/8MGV1Nkgh6oxLvadCKUA20NplwmKx18ILD
 a4txIL026J8+kLCCKnXHRmJxKhnxlRu55AZQMAoJdzzePDtXeCEuISWrBuQZmrkpYkdR
 crHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NZy+tINSeQMKpWsRE+yjbOnqQExOvPKvY/WmPOPzO3A=;
 b=apj2qgm0zIdItBVrWaP0dj7NmkpxvaQHXNPpJtXom22kgSb3cNTb8m7p7J0fkuL7mR
 V6QSpt0JEhXTjaNooTWytywmx6/PbuS0kJ7oMMx0bM+5ryqztsTwGdwG8W1CMnUOvNJL
 Sd+ZscWG2qxIuM3tVnTM3pVNmnGaGUvx89npCDpDN+TvHRaLAPwXr/CSV64FyOmBtt/n
 bZj1bxGIpgigkt7w3OBAJBANvXR1V0njdWPCjeDDneHaZvIjlKnqy+OIMjADzInPV2Qw
 +LQYoWRTsDyQ6CNUOvg+4p2Af0rVOR81K4cx84jQgvypWHGHloKzl6yLQ+4QUOCczHXJ
 o5cg==
X-Gm-Message-State: APjAAAVpYB0NFMXBVcEcWqBI9GFDy56TfAr0kvTsWrX9Hg0FhsiJNAjQ
 wo5YWg0yJ4u8wUG0aEae/p+XfsQt2HAeQrqdm2f9kg==
X-Google-Smtp-Source: APXvYqzNBnDZO1P8xwNGw7Y7h++tozw09CsmIcrSL0ro+eUTbyJBqyZ3kl/X8/+K0PDmtdfWes08J+HQrsb+J5C8mmA=
X-Received: by 2002:ac8:74c3:: with SMTP id j3mr35548027qtr.113.1574789162290; 
 Tue, 26 Nov 2019 09:26:02 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
 <954a7a27-88f9-8c17-6df6-79ff144b3c96@suse.com>
In-Reply-To: <954a7a27-88f9-8c17-6df6-79ff144b3c96@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 26 Nov 2019 09:25:50 -0800
Message-ID: <CAMmSBy9X69zUhRyMjP4AiO88egJZ0b=ykoW1GF3EffdYmFkeng@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] UEFI support on Dell boxes
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTI6MzEgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDI2LjExLjIwMTkgMDg6MDIsIFJvbWFuIFNoYXBvc2huaWsg
d3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAyNSwgMjAxOSBhdCA3OjU1IFBNIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraQo+ID4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3Rl
Ogo+ID4+IE9uIE1vbiwgTm92IDI1LCAyMDE5IGF0IDA3OjQ0OjAzUE0gLTA4MDAsIFJvbWFuIFNo
YXBvc2huaWsgd3JvdGU6Cj4gPj4+IChYRU4pICAwMDAwMGZmOTAwMDAwLTAwMDAwZmZmZmZmZmYg
dHlwZT0xMSBhdHRyPTgwMDAwMDAwMDAwMDAwMDAKPiA+Pj4gKFhFTikgVW5rbm93biBjYWNoYWJp
bGl0eSBmb3IgTUZOcyAweGZmOTAwLTB4ZmZmZmYKPiA+Pgo+ID4+IFRoZSBmYXVsdGluZyBhZGRy
ZXNzIGlzIGluIHRoaXMgcmFuZ2UuIEFuZCBiZWNhdXNlIG9mIHVua25vd24KPiA+PiBjYWNoYWJp
bGl0eSwgaXQgaXNuJ3QgbWFwcGVkLiBUcnkgYWRkaW5nICdlZmk9YXR0cj11YycgdG8gdGhlIFhl
bgo+ID4+IGNtZGxpbmUuCj4gPgo+ID4gRmVlbHMgbGlrZSB3ZSdyZSBnZXR0aW5nIGV4YWN0bHkg
dGhlIHNhbWUgZmFpbHVyZS4gTG9nIGF0dGFjaGVkLgo+Cj4gQ2xlYXJseSB0aGUgb3B0aW9uIGhh
c24ndCBiZWVuIHRha2luZyBlZmZlY3QuIENvdWxkIHlvdSBwbGVhc2UKPiByZXRyeSB3aXRoIHRo
aXMgZml4Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTExL21zZzAxNDk0Lmh0bWwKPiBpbiBwbGFjZT8KClRoaXMgd29ya3MgdmVyeSB3
ZWxsIGluZGVlZCEgSSBhY2tlZCBpdCBpbiB0aGUgcGF0Y2ggdGhyZWFkLgoKVGhhbmtzLApSb21h
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
