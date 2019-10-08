Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6ACF251
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 07:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHiSH-0006xX-2m; Tue, 08 Oct 2019 05:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sSiS=YB=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iHiSG-0006xS-0E
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 05:54:40 +0000
X-Inumbo-ID: 1d9244e2-e990-11e9-80e3-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d9244e2-e990-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 05:54:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r5so23446455qtd.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NONAWbMfWzka5LvTrN//fmV2lGWy4ovlEAolFglwHeM=;
 b=hVTNqvg69yN4yc/qO/Pmbbl9yn11UBt4ciQXIK/+Zl6GLiebrNgOP4uBVHq+mntKsn
 1E3RUrTslI4v4EajtxOjUK2Ftf8FFvEnEBduiB339RttLHLXo3VLZU2JCzGNYKoIduR/
 D41tbeNmnWJ0vhmPnFkMmwJ540vyP9jYfCxkW2+wPCkKTCOfqWA4B3HguGOK+CuU1Qdl
 PKnwbVsV6+fAel96r9EeUnpTVqeARufs73j5zTk+T7g9oW1kR3HhhDbU26vOLVq6uuor
 mpjnpQCSk58HnugYL6wV4UsGVKZAiCfSjZDh9bToX2bmfOBhuXgwN7JKmknUpKpH81dn
 mbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NONAWbMfWzka5LvTrN//fmV2lGWy4ovlEAolFglwHeM=;
 b=kuHzi/V+3AWC0iFG7RG7TFBc57D22FYUKlEFVMYy671HXQhXPF5pqQV6IFfUmHI4uR
 yJ8fxVySS4fXtOEMuwSOomhqNgpvvTdZfm8DEGTyM4mNcNvGXugxlWaLTJ2xzOarhYnA
 2whcjghIfq+WwTKo5w1TofJsmYWkbVlI6wIRl/J4Z14A5L6e3nJi5u0tn9Y2sugge7oo
 84c17T1dQQvkqkBWFsXQSJ3j5K312WGtNQkrJx5HreZJUUNKBjfS4cvEEszrseNC3LkG
 oKpt8l6gtBOaKg++lbyUSphHu0RbSG8HmwjWvzYf/0ATs0x5l7tyiAkI+ogoOxLg3FzS
 XTbw==
X-Gm-Message-State: APjAAAU9HwbFS1R5eTFbg+OOr5GRaaYfILylfHpShHGeLdhH8dmKFWOp
 xkfms5aelA/eiLsjtFfUG6J++mEwQP3bGobd9UkuVQ==
X-Google-Smtp-Source: APXvYqzfHZKEfYzySIq91L8u22tzOnLNQpcve+IP+PlT7kkLQbAVh/eynXClctlcqlVy9OJ1G/3dPQo/dtdQSgFdK+I=
X-Received: by 2002:ac8:6e8b:: with SMTP id c11mr33934234qtv.77.1570514078857; 
 Mon, 07 Oct 2019 22:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
 <CAMmSBy_+uGe1QefqUgmhU48=D8V3+g9EKMM==hV4rkAtR1Dx1w@mail.gmail.com>
 <CAMmSBy_ZXrFRHAsLUpnhpLNag+Szn_L-40wOn_r2Xpjrx+akmA@mail.gmail.com>
 <727fc987-e6a0-dda4-1b73-ef864d2e01e3@suse.com>
In-Reply-To: <727fc987-e6a0-dda4-1b73-ef864d2e01e3@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 7 Oct 2019 22:54:27 -0700
Message-ID: <CAMmSBy_unbtBchkZVu+HHjeLp+w1_is75UTyJzKNYd82ai0mog@mail.gmail.com>
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

U29ycnkgLS0gd2FzIHRyYXZlbGluZyBsYXN0IHdlZWssIGJ1dCBJJ20gc3RpbGwgdmVyeSBjdXJp
b3VzIHRvIGdldCB0bwp0aGUgYm90dG9tIG9mIHRoaXM6CgpPbiBUdWUsIE9jdCAxLCAyMDE5IGF0
IDE6MjUgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPgo+IE9uIDAx
LjEwLjIwMTkgMDA6MzgsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiBCdHcsIGZvcmdvdCB0
byBhdHRhY2ggdGhlIHBhdGNoIHdpdGggbWF4Y3B1cz0yIC0tIGludGVyZXN0aW5nbHkgZW5vdWdo
Cj4gPiBYZW4gc2VlbXMgdG8gaGFuZyBtdWNoIGZ1cnRoZXIgZG93biB0aGFuIGJlZm9yZSAoYmFz
aWNhbGx5IGFmdGVyCj4gPiBhdHRlbXB0aW5nIHRvIGJ1aWxkIG91dCBEb20wKQo+Cj4gQWxsIDMg
bG9ncyBjb250YWluCj4KPiAoWEVOKSBUU0NfREVBRExJTkUgZGlzYWJsZWQgZHVlIHRvIEVycmF0
YTsgcGxlYXNlIHVwZGF0ZSBtaWNyb2NvZGUgdG8gdmVyc2lvbiAweDUyIChvciBsYXRlcikKCk9r
LiBUaGlzIG1ha2VzIHNvbWUgc2Vuc2UuIEJ0dywgaW4gYSBzaXR1YXRpb24gbGlrZSB0aGlzLCBk
byB3ZSBleHBlY3QKWGVuIHRvIGNvcGUgd2l0aCBhIGJyb2tlbiBtaWNyb2NvZGUgb3Igd2UgYWx3
YXlzIGV4cGVjdCBtaWNyb2NvZGUgdG8KYmUgdXBkYXRlZD8KCj4gUGxlYXNlIGxvYWQgdXAtdG8t
ZGF0ZSBtaWNyb2NvZGUgb24gdGhlIHN5c3RlbSBhbmQsCgpJIGNvdWxkbid0IGZpbmQgYW55IGtp
bmQgb2YgSFAgZ3VpZGUgb24gaG93IHRvIGRvIHRoaXMgb24gdGhpcyBib3guCkFueSBjaGFuY2Ug
c29tZW9uZSBoZXJlIG1heSBoYXZlIGEgcG9pbnRlciBmb3IgbWU/Cgo+IHByZWZlcmFibHkgd2l0
aCBBbmRyZXcncyBzdWdnZXN0aW9ucyBhbHNvIGFwcGxpZWQsIHJlLXBvc3QgdGhlIGxvZ3MuIEkg
bm90aWNlIHRoYXQKPiBldmVuIGxvZ3MgMSBhbmQgMiBoYXZlICJCcm91Z2h0IHVwIDQgQ1BVcyIs
IG90aGVyIHRoYW4geW91J3ZlCj4gaW5kaWNhdGVkIGluIHlvdXIgaW5pdGlhbCByZXBvcnQuIFRo
aXMgc3VnZ2VzdHMgc29tZXRoaW5nJ3MgYnJva2VuCj4gX2FmdGVyXyBicmluZ3VwIG9mIHNlY29u
ZGFyeSBDUFVzLCBub3Qgd2hpbGUgYnJpbmdpbmcgdGhlbSB1cC4gTG9nCj4gMyBlZmZlY3RpdmVs
eSBzZWVtcyB0byBjb25maXJtIHRoaXMuCj4KPiBTZWVpbmcgdGhhdCAibWF4X2NzdGF0ZT0xIiBk
aWQgaGVscCwgYXMgYW5vdGhlciBuZXh0IHN0ZXAgY291bGQgeW91Cj4gdHJ5IHdoZXRoZXIgIm13
YWl0LWlkbGU9MCIgbWFrZXMgZW5vdWdoIG9mIGEgZGlmZmVyZW5jZSAoaXQnbGwKPiBsaWtlbHkg
bWFrZSBhIGRpZmZlcmVuY2UgaW5pdGlhbGx5LCBhcyBpdCBtYWtlcyB0aGUgc3lzdGVtCj4gZWZm
ZWN0aXZlbHkgc3RheSBpbiBhICJtYXhfY3N0YXRlPTEiLWxpa2UgbW9kZSB1bnRpbCBEb20wIGhh
cyBib290ZWQKPiB1cCBmYXIgZW5vdWdoOyB0aGUgcXVlc3Rpb24gdGhpcyBpcyBnb2luZyB0byBi
ZSB3aGV0aGVyIGEgaGFuZyBzdGlsbAo+IG9jY3VycyBvbmUgRG9tMCBoYXMgdXBsb2FkZWQgQy1z
dGF0ZSBkYXRhKT8KCk9rLiBXaWxsIGRvIGFsbCB0aGVzZSBleHBlcmltZW50cyB0b21vcnJvdy4K
Ck15IHBsYW4gaXMgdG8gdXNlIGxhdGVzdCBYZW4gbWFzdGVyICsgYnVpbGQgaXQgd2l0aCBleHRy
YSBkZWJ1ZyBpbmZvCmFzIHdhcyBzdWdnZXN0ZWQgZWFybGllciBpbiB0aGlzIHRocmVhZC4KClRo
YW5rcywKUm9tYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
