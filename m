Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5351E7C4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:30:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL97o-0005hl-DJ; Mon, 29 Apr 2019 16:27:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL97m-0005hg-KA
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:27:26 +0000
X-Inumbo-ID: ab91d8b9-6a9b-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab91d8b9-6a9b-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:27:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556555244; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ZdrRmBQV2F/pjN7bKQ5ZCluZ9nmI4gv6LIbKr7RDNEA=;
 b=ndgJ9tMpnRxJKSMKzXjUULPOWsvT+iBuD0xrN46JKk1y7/64sph8L7Wl7O1/65wSoIFrf/Qg
 bZ040OOip8KaThLvGMlXkZp8wu+q2+peX/fadFn/6M3PEKekZ6tzLp042pC9d9R3cYJXeM4s
 kqCD1wQx5shcX+Rp6NPUOq3WND4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mxa.mailgun.org with ESMTP id 5cc725eb.7f6e51e2e3f0-smtp-out-n02;
 Mon, 29 Apr 2019 16:27:23 -0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a9so16977351wrp.6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:27:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUtyhS8qR2qQxBGegwFSiNHI23pCu/f5YocOrg9gaVSZNhX5Fet
 ui3mfUp6sDNBPWWYikFImcoy9e/ShpFImsASxpo=
X-Google-Smtp-Source: APXvYqwZPwCvo46PMwap+Ttitm5t9Yi9hMGOLxm0w7WTqezdr+vq93IJPuwFA9/S7/NM20GO3dn/JL5FrG8sLNcEK5Q=
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr1150393wrn.113.1556555242137; 
 Mon, 29 Apr 2019 09:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
 <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
In-Reply-To: <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 10:26:45 -0600
X-Gmail-Original-Message-ID: <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
Message-ID: <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MTQgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAyOS4wNC4xOSBhdCAxODowNSwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1MiBBTSBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IEkgaGF2ZW4n
dCByZS1ncm9ra2VkIHRoZSBjb2RlIGhlcmUsIGJ1dCBhc3N1bWluZyBJIHdhcyBjb3JyZWN0IDIg
d2Vla3MKPiA+PiBhZ28sIGlmIHlvdSBoYXZlIHRoZSBCVUdfT04oKSB0aGVyZSwgeW91IGNhbiBn
ZXQgcmlkIG9mIHRoZSBleHRyYQo+ID4+IHJlZmVyZW5jZXMuCj4gPgo+ID4gU3VyZSwgYnV0IGFn
YWluLCB0aGUgb3ZlcmhlYWQgb2YgaGF2aW5nIHRoZW0gaW4tcGxhY2UgaXMgbmVnbGlnaWJsZSBz
bwo+ID4gbWlnaHQgYXMgd2VsbCBqdXN0IGtlZXAgaXQuCj4KPiBUaGUgb3ZlcmhlYWQgaXMgb25s
eSBvbmUgYXNwZWN0IGhlcmUuIFBlb3BsZSBsb29raW5nIGF0IHRoZSBjb2RlCj4gbWF5IGFsc28g
YmUgbWlzbGVhZCBpbnRvIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoeSB0aGUgaGVjayB0aGlzCj4g
ZXh0cmEgcmVmZXJlbmNlIGdldHMgb2J0YWluZWQuIFBsdXMgc3ViLW9wdGltYWwgY29kZSB0ZW5k
cyB0byBnZXQKPiBjbG9uZWQgLi4uCgpZZWEsIEknbSB3aXRoIHlvdS4uIEFscmlnaHQsIGluIHRo
YXQgY2FzZSBBbmRyZXcgcHVsbGVkIGluIHRoYXQKcHJldmlvdXMgcGF0Y2ggaW50byB4ODYtbmV4
dCBmb3Igbm8gZ29vZCByZWFzb24gYXMgdGhhdCB3aG9sZSB0aGluZyBpcwpnb2luZyB0byBnZXQg
ZHJvcHBlZCBub3cuIEFuZHJldyAtIGlmIHlvdSBjYW4ganVzdCBkcm9wIHRoYXQgcGF0Y2gKZnJv
bSB4ODYtbmV4dCBJJ2xsIHJlYmFzZSBvbiBzdGFnaW5nIGFuZCByZXNlbmQgd2l0aG91dCB0aGF0
IHBhdGNoLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
