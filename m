Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653E19F81
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:46:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6kG-0004Ff-DG; Fri, 10 May 2019 14:43:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=05ro=TK=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hP6kF-0004Fa-Ir
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:43:31 +0000
X-Inumbo-ID: f9c90040-7331-11e9-8980-bc764e045a96
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f9c90040-7331-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 14:43:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n25so7743191wmk.4
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2019 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PhIUei1bNJP/pLmcgrLL8VKdbLa9PDATctXyVFLO3FM=;
 b=LZD8bOw5wvkj1rk/97dDzsqt7jE6yFocYbA69PvNAzBDhJ6a72Ppl3tPKHRX4owFfV
 r8Et8UHfY3qqEx49PaP9CbG5rfsMvOR/HL+j+a+tj3JPMPnfntuaGBi7XYIz24YOkH+x
 Zd4GhkB+cbD7+J22HwJgGpppndIEKyD3i0KijZFRvG0lKUeGL+h4GwPe0fKoc3CODUrO
 VL355zIuQwj5tjZWe9x7lWWf2LSPwTNO7z1IVc5ro+LxFT+UNRcgfZYVb5Fr/ZQtOp36
 FJN8ikwamdN63V7bHSnqGBPixw1SeUbKTzt2Z8t8KDLKlnfmRiIGiupzC06RsjguZyY1
 4jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PhIUei1bNJP/pLmcgrLL8VKdbLa9PDATctXyVFLO3FM=;
 b=C7gSPIzz9Rl4n3V4x8IpZceyp8G2qhUn+FfthHYK5ivRCP9y4Rvm2FYL0fbIEYAwi4
 15Ys3C4e+IciZ9k0IutNY8PfEJlcC3UxmAud2oxDpQfUlETResTr3KQ5qHj73YZ8Lj05
 f66Intrn/pW4HewPR7PiToX+Go63hrAFd5+oLwZOtZ/wG6N/EXQGOQYEbitbACx+ctF0
 NZ2Jw+GM58f2ua58Gt3XGX6RgVxPJOy0FA5w+mWFZlFL8X1PbsWr0TzvwLwQDNhoXEhY
 kEoEGh6KD5PyQ1rALdf2J1WTo8G4u9U3clet46+HV30geJTKhfYoPZ+IYk7jGAQX99F1
 ezrw==
X-Gm-Message-State: APjAAAUP5lWaABzC4xKQSnvvDfIjqnc1qUggzkCEpHgysKgDNnEoazFb
 9ThwnCX1r1cgbVALbJP+9JSnrkBbdwrnizNasp4=
X-Google-Smtp-Source: APXvYqzTBDz+G4YhMFwNvQImlYNxEQ5N2nmyIsDySwdOcXxgLsPyLRYCInB3ClZPZE7cJZq03cCdK9yLTFjObSYWau8=
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr7122719wmu.54.1557499408690; 
 Fri, 10 May 2019 07:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhkp2rODvh1j6AvEEEgc=EheM53sVprRiZWrhHcQ8Ve_+w@mail.gmail.com>
 <3e6ecacc-6dcc-6c0d-2b2d-b5179572cb5b@citrix.com>
In-Reply-To: <3e6ecacc-6dcc-6c0d-2b2d-b5179572cb5b@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 10 May 2019 08:42:51 -0600
Message-ID: <CABfawh=tD8DKDCVTKAtsYi3yRWiq_d-oxGOMnEgJn7BiT6dZ1w@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] Altp2m use with PML can deadlock Xen
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCAxMDoxOSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDA5LzA1LzIwMTkgMTQ6MzgsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IEhpIGFsbCwKPiA+IEknbSBpbnZlc3RpZ2F0aW5nIGFuIGlzc3Vl
IHdpdGggYWx0cDJtIHRoYXQgY2FuIGVhc2lseSBiZSByZXByb2R1Y2VkCj4gPiBhbmQgbGVhZHMg
dG8gYSBoeXBlcnZpc29yIGRlYWRsb2NrIHdoZW4gUE1MIGlzIGF2YWlsYWJsZSBpbiBoYXJkd2Fy
ZS4KPiA+IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gdHJhY2UgZG93biB3aGVyZSB0aGUgYWN0dWFs
IGRlYWRsb2NrIG9jY3Vycy4KPiA+Cj4gPiBUaGUgcHJvYmxlbSBzZWVtIHRvIHN0ZW0gZnJvbSBo
dm0vdm14L3ZtY3MuYzp2bXhfdmNwdV9mbHVzaF9wbWxfYnVmZmVyCj4gPiB0aGF0IGNhbGxzIHAy
bV9jaGFuZ2VfdHlwZV9vbmUgb24gYWxsIGdmbnMgdGhhdCB3ZXJlIHJlY29yZGVkIHRoZSBQTUwK
PiA+IGJ1ZmZlci4gVGhlIHByb2JsZW0gb2NjdXJzIHdoZW4gdGhlIFBNTCBidWZmZXIgZnVsbCB2
bWV4aXQgaGFwcGVucwo+ID4gd2hpbGUgdGhlIGFjdGl2ZSBwMm0gaXMgYW4gYWx0cDJtLiBTd2l0
Y2hpbmcgIHAybV9jaGFuZ2VfdHlwZV9vbmUgdG8KPiA+IHdvcmsgd2l0aCB0aGUgYWx0cDJtIGlu
c3RlYWQgb2YgdGhlIGhvc3RwMm0gaG93ZXZlciByZXN1bHRzIGluIEVQVAo+ID4gbWlzY29uZmln
dXJhdGlvbiBjcmFzaGVzLgo+ID4KPiA+IEFkZGluZyB0byB0aGUgaXNzdWUgaXMgdGhhdCBpdCBz
ZWVtIHRvIG9ubHkgb2NjdXIgd2hlbiB0aGUgYWx0cDJtIGhhcwo+ID4gcmVtYXBwZWQgR0ZOcy4g
U2luY2UgUE1MIHJlY29yZHMgZW50cmllcyBiYXNlZCBvbiBHRk4gbGVhZHMgbWUgdG8KPiA+IHF1
ZXN0aW9uIHdoZXRoZXIgaXQgaXMgc2FmZSBhdCBhbGwgdG8gdXNlIFBNTCB3aGVuIGFsdHAybSBp
cyB1c2VkIHdpdGgKPiA+IEdGTiByZW1hcHBpbmcuIEhvd2V2ZXIsIEFGQUlDVCB0aGUgR0ZOcyBp
biB0aGUgUE1MIGJ1ZmZlciBhcmUgbm90IHRoZQo+ID4gcmVtYXBwZWQgR0ZOcyBhbmQgbXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IGl0IHNob3VsZCBiZSBzYWZlIGFzIGxvbmcKPiA+IGFzIHRoZSBH
Rk5zIGJlaW5nIHRyYWNrZWQgYnkgUE1MIGFyZSBuZXZlciB0aGUgcmVtYXBwZWQgR0ZOcy4KPiA+
Cj4gPiBCb290aW5nIFhlbiB3aXRoIGVwdD1wbWw9MCByZXNvbHZlcyB0aGUgaXNzdWUuCj4gPgo+
ID4gSWYgYW55b25lIGhhcyBhbnkgaW5zaWdodCBpbnRvIHdoYXQgbWlnaHQgYmUgaGFwcGVuaW5n
LCBwbGVhc2UgbGV0IG1lIGtub3cuCj4KPgo+IEkgY291bGQgaGF2ZSBzd29ybiB0aGF0IEdlb3Jn
ZSBzcG90dGVkIGEgcHJvYmxlbSBoZXJlIGFuZCBmaXhlZCBpdC4gIEkKPiBzaG91bGRuJ3QgYmUg
c3VycHJpc2VkIGlmIHdlIGhhdmUgbW9yZS4KPgo+IFRoZSBwcm9ibGVtIHRoYXQgUE1MIGludHJv
ZHVjZWQgKGFuZCB0aGlzIGlzIG1vc3RseSBteSBmYXVsdCwgYXMgSQo+IHN1Z2dlc3RlZCB0aGUg
YnVnZ3kgc29sdXRpb24pIGlzIHRoYXQgdGhlIHZtZXhpdCBoYW5kbGVyIGZyb20gb25lIHZjcHUK
PiBwYXVzZXMgb3RoZXJzIHRvIGRyYWluIHRoZSBQTUwgcXVldWUgaW50byB0aGUgZGlydHkgYml0
bWFwLiAgT3ZlcmFsbCBJCj4gd2Fzbid0IGhhcHB5IHdpdGggdGhlIGRlc2lnbiBhbmQgSSd2ZSBn
b3Qgc29tZSBpZGVhcyB0byBpbXByb3ZlIGl0LCBidXQKPiB3aXRoaW4gdGhlIHNjb3BlIG9mIGhv
dyBhbHRwMm0gd2FzIGVuZ2luZWVyZWQsIEkgcHJvcG9zZWQKPiBkb21haW5fcGF1c2VfZXhjZXB0
X3NlbGYoKS4KPgo+IEFzIGl0IHR1cm5zIG91dCwgdGhhdCBpcyB2dWxuZXJhYmxlIHRvIGRlYWRs
b2NrcyB3aGVuIHlvdSBnZXQgdHdvIHZjcHVzCj4gdHJ5aW5nIHRvIHBhdXNlIGVhY2ggb3RoZXIg
YW5kIHdhaXRpbmcgZm9yIGVhY2ggb3RoZXIgdG8gYmVjb21lCj4gZGUtc2NoZWR1bGVkLgoKTWFr
ZXMgc2Vuc2UuCgo+Cj4gSSBzZWUgdGhpcyBoYXMgYmVlbiByZXVzZWQgYnkgdGhlIGFsdHAybSBj
b2RlLCBidXQgaXQgKnNob3VsZCogYmUgc2FmZQo+IHRvIGRlYWRsb2NrcyBub3cgdGhhdCBpdCB0
YWtlcyB0aGUgaHlwZXJjYWxsX2RlYWRsb2NrX211dGV4dC4KCklzIHRoYXQgYWxyZWFkeSBpbiBz
dGFnaW5nIG9yIHlvdXIgeDg2LW5leHQgYnJhbmNoPyBJIHdvdWxkIGxpa2UgdG8KdmVyaWZ5IHRo
YXQgdGhlIHByb2JsZW0gaXMgc3RpbGwgcHJlc2VudCBvciBub3Qgd2l0aCB0aGF0IGNoYW5nZS4g
SQp0ZXN0ZWQgd2l0aCBYZW4gNC4xMiByZWxlYXNlIGFuZCB0aGF0IGRlZmluaXRlbHkgc3RpbGwg
ZGVhZGxvY2tzLgoKPiBBbnl3YXkgLSBzb3JyeSBmb3Igbm90IGJlaW5nIG1vcmUgaGVscCwgYnV0
IEkgYmV0IHRoZSBwcm9ibGVtIGlzIGdvaW5nCj4gdG8gYmUgc29tZXdoZXJlIGFyb3VuZCB2Y3B1
IHBhdXNpbmcuCgpObyBwcm9ibGVtLCBJIGFwcHJlY2lhdGUgdGhlIGhlbHAuCgpUaGFua3MsClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
