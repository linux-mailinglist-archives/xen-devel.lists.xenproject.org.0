Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E610A49
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 17:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLrXK-0002Xu-G2; Wed, 01 May 2019 15:52:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLrXI-0002Xp-HV
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 15:52:44 +0000
X-Inumbo-ID: 27c52832-6c29-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27c52832-6c29-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 15:52:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556725962; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=WEks031DzrUjfpEIhCRhGf0Nc+sWKXa9wzqHEaV9rr0=;
 b=X1b+rVN+fJD1ZKUJFRX1KD7dDshCTgt89zHqaBHUUTK9QmTQPZAwn/DRoIVdE87DSrhIJCEF
 ra2ExKAWyHCE1DFdmcm6Qfbn2re1AgeBunzGSSN1+AsSeE4zmOiSIhGkOb8wEQgUcXaI50j0
 nJETQcD8tJRhbld9NXSvwh3Idb4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5cc9c0ca.7fcb5acf4d30-smtp-out-n01;
 Wed, 01 May 2019 15:52:42 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a12so25021677wrq.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 08:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAVUSXZbNKwRilb3LfKzYDo5KtjsPr7KrYrCTvSIn5Rq4Rmm+EuJ
 MI58yOB9zKGHS47vyDLR50CvrmGuQSeDOf2YvfQ=
X-Google-Smtp-Source: APXvYqx6ztN+yEbW1LyDCylarZdYfd2JCw/StD9NVZpAaF4CyB8pTJimIRsUrmtbQd6xa2Xuqs90R9hf1h+uyTkIRKM=
X-Received: by 2002:adf:b645:: with SMTP id i5mr17846503wre.272.1556725960561; 
 Wed, 01 May 2019 08:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
 <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
 <CABfawh=Q6iYej3xAEAwwJd=X_HzbU0iLLUTHby=1QDstBZf4QA@mail.gmail.com>
 <CABfawhnMLKb3psg81x4FzVX8UbgGrZYzOJkYXaTxFzABsGoXtg@mail.gmail.com>
 <36354bcd-a0ac-dd52-3609-ed74b909a7b4@bitdefender.com>
In-Reply-To: <36354bcd-a0ac-dd52-3609-ed74b909a7b4@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 1 May 2019 09:52:03 -0600
X-Gmail-Original-Message-ID: <CABfawhkAGX8Pr7dCpfJu-XcYSh83Gbk5eWoMrLBzDFMwK4LN+A@mail.gmail.com>
Message-ID: <CABfawhkAGX8Pr7dCpfJu-XcYSh83Gbk5eWoMrLBzDFMwK4LN+A@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCA5OjQ0IEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzEvMTkgNjowMSBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMSwgMjAxOSBhdCA4OjUzIEFNIFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBXZWQsIE1h
eSAxLCAyMDE5IGF0IDg6MjAgQU0gUmF6dmFuIENvam9jYXJ1Cj4gPj4gPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiA1LzEvMTkgNDo1OCBQTSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+PiBJdCBtaWdodCBiZSB3b3J0aCBpbnRyb2R1Y2luZyBh
ICJzeW5jIHN0YXRlIGZyb20gaHciIGhvb2sgd2hpY2ggY29sbGVjdHMKPiA+Pj4+Pj4gYWxsIHRo
ZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0aW9uIGFnZW50Lgo+ID4+
Pj4+Cj4gPj4+Pj4gWW91IG1lYW4gYWRkaW5nIGFub3RoZXIgaHZtIGhvb2s/Cj4gPj4+Pgo+ID4+
Pj4gQWN0dWFsbHksIGluc3RlYWQgb2YgYW5vdGhlciBob29rIEkgdGhpbmsgd2hhdCB3b3VsZCBt
YWtlIHNlbnNlIGl0IHRvCj4gPj4+PiBqdXN0IHVwZGF0ZSB2bXhfc2F2ZV92bWNzX2N0eHQgdG8g
YXV0b21hdGljYWxseSByZWZyZXNoIHRoZSBjYWNoZWQKPiA+Pj4+IHJlZ2lzdGVyIHZhbHVlcyB3
aGVuIGl0J3MgY2FsbGVkIHdpdGggInYgPT0gY3VycmVudCIuIFRob3VnaHRzPwo+ID4+Pgo+ID4+
PiBUaGF0J3MgcHJvYmFibHkgdGhlIGJldHRlciB3YXkgdG8gZ28gYWJvdXQgaXQsIHNpbmNlIG90
aGVyd2lzZSB0aGUKPiA+Pj4geGNfaHZtX2dldGNvbnRleHRfcGFydGlhbCgpIGh5cGVyY2FsbCB3
aWxsIHN1ZmZlciBmcm9tIHRoZSBzYW1lIHByb2JsZW0uCj4gPj4+ICh0aGVyZSBhcmUgdHdvIHdh
eXMgb2YgZ2V0dGluZyBndWVzdCBzdGF0ZTogb25lIGlzIHZpYSB0aGUgdm1fZXZlbnQKPiA+Pj4g
Y2FjaGVkIHZhbHVlcywgdGhlIG90aGVyIGlzIHZpYSB0aGUgYWZvcmVtZW50aW9uZWQgaHlwZXJj
YWxsKS4KPiA+Pgo+ID4+IFRydWUsIGFsdGhvdWdoIGlzc3VpbmcgdGhlIGh5cGVyY2FsbCBpbiB0
aGUgdm1fZXZlbnQgY2FsbGJhY2sgaXMKPiA+PiBhY3R1YWxseSBmaW5lIC0gdGhhdCdzIGhvdyBJ
IGZvdW5kIHRoZSBpc3N1ZSB0byBiZWdpbiB3aXRoLCBzaW5jZSB0aGUKPiA+PiB2Q1BVIHdpbGwg
YmUgc2NoZWR1bGVkIG91dCB3aXRoIHRoZSBjYWNoZWQgcmVnaXN0ZXJzIHJlZnJlc2hlZCBhbmQK
PiA+PiB0aHVzIGJlIGRpZmZlcmVudCB0aGVuIHdoYXQgdGhlIHZtX2V2ZW50IGl0c2VsZiBoYWQu
IEJ1dCBvdGhlciBjYWxsZXJzCj4gPj4gb2YgdGhlIGh5cGVyY2FsbCBjYW4gcnVuIGludG8gdGhl
IHByb2JsZW0gaWYgdGhlIGd1ZXN0L3ZjcHUgaXMgbm90Cj4gPj4gcGF1c2VkLgo+ID4KPiA+IEFj
dHVhbGx5LCBkb2luZyB0aGUgInYgPT0gY3VycmVudCIgY2hlY2sgd291bGRuJ3QgcmVhbGx5IGRv
IGFueXRoaW5nCj4gPiBmb3IgdGhlIGh5cGVyY2FsbCBzaW5jZSBpdCdzIG5vdCB0aGUgZG9tYWlu
IGlzc3VpbmcgdGhlIGh5cGVyY2FsbCBvbgo+ID4gaXRzZWxmLiBUaGUgb25seSB3YXkgdG8gZW5z
dXJlIHRoYXQgaHlwZXJjYWxsIGlzIHJldHVybmluZyBjb3JyZWN0Cj4gPiB2YWx1ZXMgd291bGQg
YmUgdG8gcGF1c2UgdGhlIHZDUFUuCj4KPiBJJ3ZlIGRpc2N1c3NlZCB0aGlzIHdpdGggQW5kcmV3
IGluIHRoZSBtZWFudGltZSBhbmQgaGUncyBraW5kbHkgcG9pbnRlZAo+IG91dCB0aGF0IGZvciB0
aGUgaHlwZXJjYWxsIHdlIHBhdXNlIGZyb20gcmVtb3RlIGNvbnRleHQsIHdoaWNoIGZvcmNlcyBh
Cj4gZGUtc2NoZWR1bGUuIFNvIHRoZSBoeXBlcmNhbGwgX3Nob3VsZF8gYmUgZmluZS4gQnV0IHdl
IHdyaXRlIGRhdGEgdG8gdGhlCj4gdm1fZXZlbnQgcmluZyBmcm9tIHRoZSBjdXJyZW50IGNvbnRl
eHQsIHdoZXJlIHN0YXRlIG1pZ2h0IGFjdHVhbGx5IGJlIGluCj4gaGFyZHdhcmUuCgpDb3JyZWN0
LCBJJ3ZlIHdlbnQgdGhyb3VnaCB0aGUgaHlwZXJjYWxsIGNvZGUgYW5kIGl0IGRvZXMgcGF1c2Ug
dGhlCnZDUFUuIFNvIHJpZ2h0IG5vdyBJIGRvbid0IHRoaW5rIHdlIG5lZWQgYW55dGhpbmcgZWxz
ZSB0aGVuIHdoYXQncwphbHJlYWR5IGluIHRoaXMgcGF0Y2guCgpUYW1hcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
