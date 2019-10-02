Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41CC4A2A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFaTv-00046x-0W; Wed, 02 Oct 2019 08:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4c3l=X3=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iFaTt-00046s-8r
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:59:33 +0000
X-Inumbo-ID: f2e53da4-e4f2-11e9-8628-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by localhost (Halon) with ESMTPS
 id f2e53da4-e4f2-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 08:59:32 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id u20so6821069plq.4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QeOO5i8EC8GgaQZD8bSjmzFwtibbHuG3bvvW1PRYBNU=;
 b=qQ6ikixWdDdbyeGFYmX9yCusdUTcoGgh/vu8nN/q4Z7Cwf+Hu9cGWz3nJHN66KdNLl
 9xZr5ns8oamuKq27I2mwcY0lpYSRbxACrxhUsKyA2OuPE4R1sfOkZOIZWTOUar3RVzFJ
 DqDoY7oKaP9AWaPELXrEkaILf+CoCTaHeTgb3fVClpDwN+FsAkxZQqNV/27liE7AJ0WF
 i5QNlXw1uPsvlDzD4Y/rw+S1AgetbhTuQD52ct6l+P7+LDymdKsW9EozPefFcYE2EsKK
 Ysf8H/w97aiidEr75LrdqKSYb1JQDKlVJaa/hfm8crLnn3wEAzRTfj64jD1Og5ynFUqg
 nQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QeOO5i8EC8GgaQZD8bSjmzFwtibbHuG3bvvW1PRYBNU=;
 b=IVXx9abKBJlNgyOPMJkpWCOFrhpug5AJOaU8S+nEOyzO3uvSbgnJ8FORqAGw0r1pvf
 /9fh5XrqeI73H9k+J7hHzkQ/2skPreUx4Xb7ifGE4oRjcPUyBvHpiF/VbMNSDU5o906x
 0+KaB1xsXOsfaHf7dKGv+mIxBh1Flo8XoDAJGfL97HCS0Yc8S1RNBsxcbz7SZqZHZ5ha
 fTm1t2syh/0cIpVXhW7kvXdUEr11x4h1a6a1hc1nFlw3exESakezfudkzrYpgneblJdl
 JPr9mrZHAuf9RxX/jFlMqzbLQhKkZ+t/jE0nijj7dorPG6Xm7Zgdih4Kqzm/s07A5PZx
 5wFg==
X-Gm-Message-State: APjAAAUxtVnWMhoavr6hISEbRTdl0WfDxUHyO1wV88EWiHd7wR8ea9xV
 lOnyMdi1Ac5h+3uvdyogAbIqQLCLHAXJkgrfkF4=
X-Google-Smtp-Source: APXvYqzcxVyqWzhnT/uCXFL6hG9Rvs4nRWxavF7wL1B0G0HLr0EJkAn1xWYrGCq6tLsQiRX2BIlb9N+NaAA91jSw6x4=
X-Received: by 2002:a17:902:ba86:: with SMTP id
 k6mr2522923pls.263.1570006771352; 
 Wed, 02 Oct 2019 01:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191001151159.861-1-paul.durrant@citrix.com>
 <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
In-Reply-To: <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 2 Oct 2019 09:59:18 +0100
Message-ID: <CACCGGhBHZgObmuP9UJrHGgp3=BKMot55qJ61Cx0+Tr_L_kV1mQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5IGF0IDA5OjQyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gT24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
ID4gTm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9N
TVUgbWFwcGluZ3MgZm9yIGEKPiA+IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5
IHZldG9lZCBkdWUgdG8gdGhlIGNoZWNrIG9mCj4gPiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFn
aW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4KPiA+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8g
cHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzCj4gPiBkZXZpY2VzIGFy
ZSBhc3NpZ25lZCB0byBhIGRvbWFpbiBhbmQgdGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFw
cGluZ3MKPiA+IHdpdGggdGhlIElPTU1VIChpbiB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBw
ZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+ID4gY2F1c2UgRE1BIGZhdWx0cykuIEl0IGlzIHF1
aXRlIHBvc3NpYmxlIHRoYXQgc29tZSBhc3NpZ25lZCBkZXZpY2VzIG1heQo+ID4gcHJvdmlkZSBp
bmZvcm1hdGlvbiBhYm91dCB3aGljaCBwYWdlcyBtYXkgaGF2ZSBiZWVuIGRpcnRpZWQgYnkgRE1B
IHZpYQo+ID4gYW4gQVBJIGV4cG9ydGVkIGJ5IHRoZWlyIG1hbmFnaW5nIGVtdWxhdG9yLiBUaHVz
IFhlbidzIGxvZ2RpcnR5IG1hcCBpcyBvbmx5Cj4gPiBvbmUgc291cmNlIG9mIGluZm9ybWF0aW9u
IHRoYXQgbWF5IGJlIGF2YWlsYWJsZSB0byB0aGUgdG9vbHN0YWNrIHdoZW4KPiA+IHBlcmZvcm1p
bmcgYSBtaWdyYXRpb24gYW5kIGhlbmNlIGl0IGlzIHRoZSB0b29sc3RhY2sgdGhhdCBpcyBiZXN0
IHBsYWNlZAo+ID4gdG8gZGVjaWRlIHVuZGVyIHdoYXQgY2lyY3Vtc3RhbmNlcyBpdCBjYW4gYmUg
cGVyZm9ybWVkLCBub3QgdGhlIGh5cGVydmlzb3IuCj4KPiBXaGlsZSBJJ20gaGFwcHkgYWJvdXQg
dGhlIGV4dGVuZGVkIGRlc2NyaXB0aW9uLCBpdCdzIHN0aWxsIHdyaXR0ZW4gaW4KPiBhIHdheSBz
dWdnZXN0aW5nIHRoYXQgdGhpcyBpcyB0aGUgb25seSBwb3NzaWJsZSB3YXkgb2Ygdmlld2luZyB0
aGluZ3MuCj4gQXMgZXhwcmVzc2VkIGJ5IEdlb3JnZSBhbmQgbWUsIHB1dHRpbmcgdGhlIGh5cGVy
dmlzb3IgaW4gYSBwb3NpdGlvbiB0bwo+IGJlIGFibGUgdG8ganVkZ2UgaXMgYXQgbGVhc3QgYW4g
YWx0ZXJuYXRpdmUgd29ydGggY29uc2lkZXJpbmcuCj4KClRoaXMgaXMgYSBzbWFsbCBwYXRjaCBh
bmQgaXQgZG9lcyBub3QgY2xvc2UgdGhlIGRvb3Igb24gYmVpbmcgYWJsZSB0bwphZGQgc3VjaCBh
biBpbnRlcmZhY2UgbGF0ZXIuIEknbSBub3Qgc2F5aW5nIHRoYXQgSSBkaXNsaWtlIHRoYXQKYWx0
ZXJuYXRpdmUsIGJ1dCBpdCB3aWxsIGluZXZpdGFibHkgYmUgcXVpdGUgYSBsb3QgbW9yZSBjb2Rl
IGFuZCBJJ20Kbm90IHN1cmUgaXQgcmVhbGx5IGJ1eXMgYW55dGhpbmcuCgo+IFdoYXQncyB3b3Jz
ZSB0aG91Z2ggLSB5b3UgZG9uJ3QgZ28gYWxsIHRoZSB3YXkgdG8gdGhlIGVuZCBvZiB3aGF0IHlv
dXIKPiBhcmd1bWVudGF0aW9uIHdvdWxkIGxlYWQgdG86IFRoZXJlJ3Mgbm8gcmVhc29uIGZvciBY
ZW4gdG8gdmV0byB0aGUKPiByZXF1ZXN0IHRoZW4gZXZlbiBpbiB0aGUgc2hhcmVkIHBhZ2UgdGFi
bGUgY2FzZS4KCldlbGwsIEkgYWRkcmVzcyB0aGF0IGluIHRoZSBjb21taXQgY29tbWVudC4KCj4g
VGhlIG9ubHkgZGV2aWNlCj4gYXNzaWduZWQgdG8gYSBndWVzdCBpbiBxdWVzdGlvbiBtYXkgYmUg
ZG9pbmcgRE1BIHJlYWRzIG9ubHkuIEZvbGxvd2luZwo+IHlvdXIgcmVhc29uaW5nLCBYZW4gc2hv
dWxkbid0IGJlIGdldHRpbmcgaW4gdGhlIHdheSB0aGVuIGVpdGhlci4gT25jZQo+IGFnYWluIHRo
ZSBzaXR1YXRpb24gY291bGQgYmUgdGFrZW4gY2FyZSBvZiBieSBpbmZvcm1pbmcgWGVuIGFib3V0
IHRoaXMKPiBwcm9wZXJ0eSBvZiBhIGRldmljZSAoYXNzdW1pbmcgaXQgY2FuJ3QgdGVsbCBhbGwg
YnkgaXRzZWxmKS4KCkkgYW0gbm90IGF3YXJlIG9mIGEgbWVjaGFuc2ltIHRvIGNvbmZpZ3VyZSBl
dmVuIGEgUENJIGV4cHJlc3MgZGV2aWNlCnRvIG9ubHkgYWxsb3cgcmVhZCBUTFBzIGFuZCB0aHVz
IHdlIG11c3QgYXNzdW1lIHRoYXQgYW55IGRldmljZSB3aXRoCmJ1cyBtYXN0ZXJpbmcgZW5hYmxl
ZCBtYXkgYXR0ZW1wdCB0byBpc3N1ZSBhIHdyaXRlIFRMUC4gVGh1cyBJIHRoaW5rCml0IGlzIHJl
YXNvbmFibGUgZm9yIFhlbiB0byB2ZXRvIGxvZ2RpcnR5IGluIHRoZSBjYXNlIG9mIHNoYXJlZCBF
UFQKYmVjYXVzZSBhIHNpZGUgZWZmZWN0IG9mIFhlbidzIGJlaGF2aW91ciBtYXkgaGF2ZSBkZXRy
aW1lbnRhbCBhZmZlY3QKb24gZGV2aWNlIGZ1bmN0aW9uYWxpdHksIGFuZCBjYXVzZSBidXMgZXJy
b3JzIHRvIGJlIHJlcG9ydGVkLiBJIGd1ZXNzCml0IHdvdWxkIGJlIHJlYXNvbmFibGUgdG8gY2hl
Y2sgYWxsIGFzc2lnbmVkIGRldmljZXMnIEJNRSBiaXQgYW5kIG9ubHkKdmV0byBpZiBhbnkgYXJl
IHNldCB0aG91Z2guIEkgd291bGQgcHJlZmVyIHRoYXQgYmUgYW4gaW5jcmVtZW50YWwKcGF0Y2gg
dGhvdWdoLgoKICBQYXVsCgo+Cj4gSmFuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
