Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C18427E6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 15:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb3Wy-0004Ex-J3; Wed, 12 Jun 2019 13:43:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXjY=UL=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hb3Wx-0004Es-5p
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 13:43:11 +0000
X-Inumbo-ID: 03bf6fd0-8d18-11e9-8980-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03bf6fd0-8d18-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 13:43:09 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id q186so11717902oia.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2019 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tHaOTtxTj7yR/f4Obnk0FCokNYjTO8hUVQOpS0utDw=;
 b=jnWhLioKsFjycdGAuxmO15Z9hugTzFY0lWot18j+GftN1pcBE+jhmPRgGhrrhPfE2p
 I6EbdH6+H8ixqXVmC7DE61iqC2xpJogymupktsrMiSAu4cULT+mch/seawUwqrs9/Luo
 RKt8uk9IkQDtUvC3jBc4DNZ5pzGJo1MFg1z09NdMYwjfWie65faXyS1IqphYVjSaOtQC
 J37Bkh8g0LFxqtnzFt5RdLIt4OMlGSmLq9VWtCUuXG9Jiq7fM/A/60USvrnE4XlDM3H9
 CFy+Wz+84nDh6E7FC1YQBhHE8cC7NRQzjtYlvtTo8jAsz3T5ymQY2q5eRPFyGmC2FppC
 pwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tHaOTtxTj7yR/f4Obnk0FCokNYjTO8hUVQOpS0utDw=;
 b=le0CFWnApF5uMzyStOOad/RjiFPz0jv9Upsu8HP6LinmkQ9ZsJc/pdlSTPjn1XzxRl
 uXzjczsIKDcjnC0bIgELKxb0cvO5rl9AaX8WX666qQz7Bx/eryF1+LqxECcK6jR/ZOX5
 IvHb6RjVr/t5L4wzz3hUDLlfwEvkTswNpdkEST3f1Cy9vDqz6ds5GHz2s4efjcP/O/4v
 Q2aDPKnTW+LcFlnNcQAkXuxwXA4So5yte16g0LKGXlr+39XJZ3/L8KnDmZQC3XN9OYmC
 O2pCzH28Zi8tVucbzSklxUaPqHhbT6G3bGayPfWDOl0w/Z6t1gQ6pM/Ll2vFDi9wkH38
 eyhw==
X-Gm-Message-State: APjAAAWDmIDZF8bZXkJbcQhK1K66kkb6uDohz0yjGakubFhcJZrItOa5
 01sKWGuSdr5DRTReyuzefnJroLulJQbR5v8/neA=
X-Google-Smtp-Source: APXvYqwS68x1WlMnjeXUqRLLC8alWXD47943w1hdq7/KI0LPxBRIMKzh3YGCGDXy2zwkyrDNSn6LzZV8TlPQvKQnxaM=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr12474514oii.19.1560346988709; 
 Wed, 12 Jun 2019 06:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560342869.git.tsirakisn@ainfosec.com>
 <7dafb0d7608ca1d245967382da5eb2e6cbe2c5b6.1560342869.git.tsirakisn@ainfosec.com>
 <82cafc94-91c2-bf32-3c73-28ede8d0abb1@citrix.com>
In-Reply-To: <82cafc94-91c2-bf32-3c73-28ede8d0abb1@citrix.com>
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Date: Wed, 12 Jun 2019 09:42:57 -0400
Message-ID: <CAFqpmV+PQZWn6800FQXZg=2bt=0TgwJeEKXqmUQ0CW0G60uXyg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 2/2] argo: correctly report pending
 message length
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgODo0NyBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDEyLzA2LzIwMTkgMTM6MzQsIE5pY2hvbGFz
IFRzaXJha2lzIHdyb3RlOgo+ID4gV2hlbiBhIG1lc3NhZ2UgaXMgcmVxdWV1ZSdkIGluIFhlbidz
IGludGVybmFsIHF1ZXVlLCB0aGUgcXVldWUKPiA+IGVudHJ5IGNvbnRhaW5zIHRoZSBsZW5ndGgg
b2YgdGhlIG1lc3NhZ2Ugc28gdGhhdCBYZW4ga25vd3MgdG8KPiA+IHNlbmQgYSBWSVJRIHRvIHRo
ZSByZXNwZWN0aXZlIGRvbWFpbiB3aGVuIGVub3VnaCBzcGFjZSBmcmVlcyB1cAo+ID4gaW4gdGhl
IHJpbmcuIER1ZSB0byBhIHNtYWxsIGJ1ZywgaG93ZXZlciwgWGVuIGRvZXNuJ3QgcG9wdWxhdGUK
PiA+IHRoZSBsZW5ndGggb2YgdGhlIG1zZyBpZiBhIGdpdmVuIHdyaXRlIGZhaWxzLCBzbyB0aGlz
IGxlbmd0aCBpcwo+ID4gYWx3YXlzIHJlcG9ydGVkIGFzIHplcm8uIFRoaXMgY2F1c2VzIFhlbiB0
byBzcHVycmlvdXNseSB3YWtlIHVwCj4gPiBhIGRvbWFpbiBldmVuIHdoZW4gdGhlIHJpbmcgZG9l
c24ndCBoYXZlIGVub3VnaCBzcGFjZS4KPiA+Cj4gPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgdGhh
dCB0aGUgbXNnIGxlbiBpcyBwcm9wZXJseSByZXBvcnRlZCBieQo+ID4gcG9wdWxhdGluZyBpdCBp
biB0aGUgZXZlbnQgb2YgYSB3cml0ZSBmYWlsdXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5p
Y2hvbGFzIFRzaXJha2lzIDx0c2lyYWtpc25AYWluZm9zZWMuY29tPgo+ID4gLS0tCj4KPiBKdXN0
IGFzIGEgbm90ZSBmb3IgZnV0dXJlIHBhdGNoZXMsIGl0IGlzIGV4cGVjdGVkIHRvIGhhdmUgYSBj
aGFuZ2Vsb2cKPiBoZXJlIHNvIHJldmlld2VycyBjYW4gc2VlIHdoYXQgaGFzIGNoYW5nZWQgZnJv
bSB0aGUgcHJldmlvdXMgdmVyc2lvbi4KPgo+IEFzIHRoaXMgaXMgbWFpbmx5IGJldHdlZW4geW91
IGFuZCBDaHJpcywgaXRzIHByb2JhYmx5IGZpbmUgZm9yIG5vdywgYnV0Cj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA2L21zZzAwNzY1
Lmh0bWwKPiBpcyBhIGdvb2QgcmVjZW50IGV4YW1wbGUuICBJdCBpcyBmcmVlZm9ybSB0ZXh0LCBh
bmQgYXMgbG9uZyBhcyBpdHMgY2xlYXIKPiB0byBmb2xsb3csIGl0IHNob3VsZCBiZSBmaW5lIGhv
d2V2ZXIgeW91IGNob3NlIHRvIGZvcm1hdCBpdC4KPgo+IH5BbmRyZXcKClRoYW5rIHlvdSBmb3Ig
dGhlIGxpbmsuIEkgd2lsbCBtYWtlIHN1cmUgdG8gZG8gc28gaW4gdGhlIGZ1dHVyZS4KCkFkZGlu
ZyB0aGUgY2hhbmdlbG9nIGhlcmUgZm9yIHJlZmVyZW5jZToKdjM6Ci0gT25seSBydW4gcmluZ2J1
Zl9pbnNlcnQoKSBibG9jayBpZiBpb3ZfY291bnQoKSBzdWNjZWVkZWQuIERvIG5vdGhpbmcKb3Ro
ZXJ3aXNlLgoKdjI6Ci0gTW92ZSBpb3ZfY291bnQoKSBvdXQgb2YgcmluZ2J1Zl9pbnNlcnQoKSBh
bmQgaW50byBzZW5kdigpLgotIFBhc3MgbGVuIGZyb20gaW92X2NvdW50KCkgaW50byByaW5nYnVm
X2luc2VydCgpLgotIENoYW5nZSBsZW4gdmFyIGluIHNlbmR2KCkgZnJvbSB1bnNpZ25lZCBsb25n
IHRvIHVuc2lnbmVkIGludC4KCi0tTmlrbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
