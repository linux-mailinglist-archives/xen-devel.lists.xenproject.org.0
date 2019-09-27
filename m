Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ADBFD33
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 04:32:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDfzq-0001Pw-EC; Fri, 27 Sep 2019 02:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QonF=XW=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iDfzp-0001Pr-CH
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 02:28:37 +0000
X-Inumbo-ID: 820f448a-e0ce-11e9-97fb-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by localhost (Halon) with ESMTPS
 id 820f448a-e0ce-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 02:28:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j31so5430462qta.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 19:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jggFfmhFx11Es+BXhgf6o5vI+y9iS3cpnRRyDVxc864=;
 b=i4HFUgA+NEIIqKyWF0ENX5rIfKp8cyG1BramWtNq8op0X0KeCqd9s/UXV5tT1KhE6T
 u+aTIcMG64i+mOvQ4N75XqvZa9Bcj7WyaCIzH6tlkOjBHAbLwy2sglTPqJzsi/pW4k+p
 8rBAUEf4weEVtOZbVrSxfDh+P6+XvygMW9wEDMgqICdyk8GX9jMqF+joH6km+XTPeYHK
 nQpDs6/e55ZffeJ5dQM8G4QyEtZVZgx9VEOANrtWx4vul6sj7uIZW1ZF8MPCZ1Px4ipX
 VqRLliYBBGA2bhzxPtTnCDggq5q22mE+RtYfnF04vQmOmsXhkCwiBrAK06xzCq1YW/dQ
 bF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jggFfmhFx11Es+BXhgf6o5vI+y9iS3cpnRRyDVxc864=;
 b=ntQejnny108X0exsHe4Hadqv1cgK1xpnJhNxLCQtm9bFVIt73HEICv1JlzFIqG+tA8
 nLN1SXnirpv/URemA8ZIuYvO1NdSbdXpwBSsdbfCMPGMcrPuA8ADSfj170xhpFUBdnjy
 dxGKmNhkL3AgzqukGyrFIEQ4rwuXemMf0Ozsuda4ccI55UGmR1lw8Mv3Btbt8HuIc1Vo
 Wp1zUrGOW9Rp8mPGdGyW9XImRBdC7ja7cefoRQptr6uHp6VTI4AHbuAN0SqihKSl1U1r
 hEPHavvcVeDKW6BhSp00Oz07cPsf9RhZ8Oyjb+njEHIC1dtNUGrWKB2nFIorAZFiSOkG
 fvyA==
X-Gm-Message-State: APjAAAW8P7+sIHd04DP1Ou9CRS0XgRa7ygYLbhAPPDvlPsTTTUpLQ6jV
 PmOJ2oAZ0ZMGs/RbZMTHnofQmGFXyzSxwnS99A3dQQ==
X-Google-Smtp-Source: APXvYqy8xZcgifRb7GjNjxbDxktgV5Ct2v79gWUIuBOj4fZfk/w+zKX999MImv1cHGJEKaFOWUl5rj4aa+FxzWRh+18=
X-Received: by 2002:a05:6214:1369:: with SMTP id
 c9mr6054306qvw.3.1569551315747; 
 Thu, 26 Sep 2019 19:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
In-Reply-To: <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 26 Sep 2019 19:28:24 -0700
Message-ID: <CAMmSBy89zdjH=pWrfuOeiHROtxQmZ=ozcnOe_FkjqUVCj+hSMw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NDQgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDI2LjA5LjIwMTkgMDA6MzEsIFJvbWFuIFNoYXBvc2huaWsg
d3JvdGU6Cj4gPiBKYW4sIFJvZ2VyLCB0aGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIGluaXRpYWwg
aWRlYXMuIEkgdHJpZWQgYSBmZXcgb2YKPiA+IHRob3NlIGFuZCBoZXJlJ3Mgd2hlcmUgSSBhbS4K
PiA+Cj4gPiBGaXJzdCBvZiBhbGwsIGl0IGlzIGRlZmluaXRlbHkgcmVsYXRlZCB0byBDUFUgYnJp
bmcgdXAuIEFkZGluZwo+ID4gY3B1aWRsZT0wIHRvIHhlbiBjb21tYW5kIGxpbmUgbWFkZSBYZW4g
Ym9vdC4KPiA+Cj4gPiBUaGVuLCBhIGdvb2QgZnJpZW5kIG9mIG1pbmUgKHdobyB5b3UgbWF5IGtu
b3cgZnJvbSBhbmNpZW50IFhlbiBkYXlzCj4gPiA7LSkpIHN1Z2dlc3RlZCB0aGF0IHRoaXMgY291
bGQgYmUgcmVsYXRlZCB0byB0aGlzOgo+ID4gICAgICBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9YZW5fcG93ZXJfbWFuYWdlbWVudAo+ID4gc28gSSB3ZW50IHRvIHRoZSBCSU9TIHNl
dHRpbmdzIGFuZCBxdWl0ZSB0byBteSBzdXJwcmlzZSBhbGwgb2YgdGhlbQo+ID4gd2VyZSBncmF5
ZWQgb3V0IChub3QgdHdlYWthYmxlKS4KPiA+Cj4gPiBUaGUgb25seSBvbmUgdGhhdCB3YXNuJ3Qg
d2FzIDJ4QVBJQyBzdXBwb3J0LiBTbyBqdXN0IGZvciBraWNrcyAtLSBJCj4gPiBkaXNhYmxlZCB0
aGF0Lgo+ID4KPiA+IFRoYXQsIGluIHR1cm4sIG1hZGUgWGVuIGJvb3QgZXZlbiB3aXRob3V0IGNw
dWlkbGU9MC4gSSdtIGF0dGFjaGluZyB0aGF0IGxvZy4KPgo+IEludGVyZXN0aW5nLCBidXQgdW5m
b3J0dW5hdGVseSB0aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4gZm9yIGlu
dmVzdGlnYXRpb24gb2YgdGhlIGlzc3VlIChvdGhlciB0aGFuIGtub3dpbmcgdGhlIENQVSBtb2Rl
bCkuIEkKPiBhbHNvIG5vdGljZSBpdCdzIGEgNC4xMi4wIGxvZywgd2hlbiB5b3VyIG9yaWdpbmFs
IHJlcG9ydCB3YXMgYWdhaW5zdAo+IGxhdGVzdCBtYXN0ZXIuCgpVbmRlcnN0b29kLiBCdXQgdGhp
cyBicmluZ3MgdXMgYmFjayB0bzogaWYgSSBkb24ndCBnZXQgWGVuIGJvb3RpbmcsCkkgZG9uJ3Qg
dGhpbmsgSSBjYW4gY2FwdHVyZSB0aGUgbG9ncy4gVGhpcyBpcyBhIHJhY2thYmxlIHNlcnZlciB3
aXRob3V0CmFueXRoaW5nIGxpa2UgYSBzZXJpYWwgcG9ydCwgZXRjLgoKSSBzdXBwb3NlIHRoZSBi
ZXN0IEkgY2FuIGRvIGlzIHRvIGNhcHR1cmUgYSB2aWRlbyBvZiBYZW4gZmFpbGluZyB0byBib290
PwoKQW55IG90aGVyIGlkZWFzPwoKPiA+IFNvIEkgZ3Vlc3MgYXQgdGhpcyBwb2ludCwgeW91IGNv
dWxkIHNheSB0aGF0IEkgaGF2ZSBhIGZ1bmN0aW9uYWwKPiA+IHN5c3RlbSwgYnV0IEknbSBjdXJp
b3VzIHdoZXRoZXIgeW91IGd1eXMgd291bGQgYmUgaW50ZXJlc3RlZCB0byBsb29rCj4gPiBpbnRv
IDJ4QVBJQyBzaXR1YXRpb24uCj4KPiBPZiBjb3Vyc2Ugd2UgZG8uIEFzIGEgbmV4dCBzdGVwIEkn
ZCBzdWdnZXN0IHJldmVydGluZyB0aGUgQklPUyBzZXR0aW5ncwo+IGNoYW5nZSB5b3UgZGlkLCBh
bmQgaW5zdGVhZCB1c2luZyB0aGUgIngyYXBpYz0wIiBYZW4gY29tbWFuZCBsaW5lIG9wdGlvbi4K
Pgo+IEFuZCB0aGVuIHdlIG9mIGNvdXJzZSBuZWVkIGEgY29tcGxldGUgYm9vdCBsb2cgKGFzIHJl
cXVlc3RlZCBlYXJsaWVyKSBvZgo+IGEgcHJvYmxlbSBjYXNlLgo+Cj4gRnVydGhlciBJJ2Qgc3Vn
Z2VzdCBtb3ZpbmcgYXdheSBmcm9tIHRoZSBibGFjay1hbmQtd2hpdGUgImNwdWlkbGU9Igo+IG9w
dGlvbiwgYW5kIGluc3RlYWQgbGltaXRpbmcgdXNlIG9mIGRlZXAgQyBzdGF0ZXMgKCJtYXhfY3N0
YXRlPSIpLiBJCj4gd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoaXMgd2FzIHRoZSBpc3N1ZTsg
d2UnZCB0aGVuIGhhdmUgdG8gZmlyc3QKPiBvZiBhbGwgZ28gdGhyb3VnaCBlcnJhdGEgZm9yIHRo
ZSBwYXJ0IHlvdXIgc3lzdGVtIGlzIHVzaW5nLgoKV2lsbCBkbyB0aGVzZSBleHBlcmltZW50cyB0
b21vcnJvdyBhbmQgcmVwb3J0IGJhY2suCgpTdGlsbCAtLSBwbGVhc2UgbGV0IG1lIGtub3cgaG93
IGNhbiBJIGNhcHR1cmUgdGhlIGxvZyB3aXRob3V0IHNlcmlhbCwgZXRjLgoKVGhhbmtzLApSb21h
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
