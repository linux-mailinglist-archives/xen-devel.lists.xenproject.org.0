Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9CEE7EB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:39:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL9Hc-0006nm-Bb; Mon, 29 Apr 2019 16:37:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL9Ha-0006nf-LE
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:37:34 +0000
X-Inumbo-ID: 160d4c20-6a9d-11e9-b1c0-972d3b410dc3
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 160d4c20-6a9d-11e9-b1c0-972d3b410dc3;
 Mon, 29 Apr 2019 16:37:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556555852; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=NVkwKC7XJRU2hb8i2FnmmgkG8oUgz+Onqlp27BnZjqQ=;
 b=J+SxXQnIhNsDW+CAK1keUsafI3Gxyemsi/cve+RooBZULgnVfSsVIYvtD3RaohCZFNu9qPc6
 nAmQZAkvD20D1qBWhyC8puYIiRNC7w/oek1I2fpSbt7xsSTGL6xZZRAU7qkMnj1TvQHbqpwt
 cboWz9070Mal+b/mPcI+SRbRQHM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5cc7284b.7fda625158f0-smtp-out-n01;
 Mon, 29 Apr 2019 16:37:31 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id a12so16983987wrq.10
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:37:30 -0700 (PDT)
X-Gm-Message-State: APjAAAXf1dIUaeCqtu25GQoKF6todPExf7mXx1cO7u6kyp9iNKNeGi8C
 Fmi0tfnHaYfYlUkN8R2UaPw5IolDtVzcd4xe8nI=
X-Google-Smtp-Source: APXvYqx7GPwFoQl6n8y/boMXKmA/iNBrsXo5xebpJt5Xi5r6mAiFvRhDt0yEny9pkXbPWB7u0K2Fe27aYZFh5Gv8zpo=
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr1184268wrn.113.1556555849680; 
 Mon, 29 Apr 2019 09:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
 <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
 <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
 <15941682-d84c-9991-40b7-bff5e0d5cf9b@citrix.com>
In-Reply-To: <15941682-d84c-9991-40b7-bff5e0d5cf9b@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 10:36:52 -0600
X-Gmail-Original-Message-ID: <CABfawhnH1GO54XJrigxBXRPq-15aZT7MQSDXC_LtTaqqT=WFHg@mail.gmail.com>
Message-ID: <CABfawhnH1GO54XJrigxBXRPq-15aZT7MQSDXC_LtTaqqT=WFHg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MjkgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDQvMjkvMTkgNToyNiBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MTQgQU0gSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+Pj4+IE9uIDI5LjA0LjE5
IGF0IDE4OjA1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIE1vbiwgQXBy
IDI5LCAyMDE5IGF0IDk6NTIgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToKPiA+Pj4+IEkgaGF2ZW4ndCByZS1ncm9ra2VkIHRoZSBjb2RlIGhlcmUsIGJ1
dCBhc3N1bWluZyBJIHdhcyBjb3JyZWN0IDIgd2Vla3MKPiA+Pj4+IGFnbywgaWYgeW91IGhhdmUg
dGhlIEJVR19PTigpIHRoZXJlLCB5b3UgY2FuIGdldCByaWQgb2YgdGhlIGV4dHJhCj4gPj4+PiBy
ZWZlcmVuY2VzLgo+ID4+Pgo+ID4+PiBTdXJlLCBidXQgYWdhaW4sIHRoZSBvdmVyaGVhZCBvZiBo
YXZpbmcgdGhlbSBpbi1wbGFjZSBpcyBuZWdsaWdpYmxlIHNvCj4gPj4+IG1pZ2h0IGFzIHdlbGwg
anVzdCBrZWVwIGl0Lgo+ID4+Cj4gPj4gVGhlIG92ZXJoZWFkIGlzIG9ubHkgb25lIGFzcGVjdCBo
ZXJlLiBQZW9wbGUgbG9va2luZyBhdCB0aGUgY29kZQo+ID4+IG1heSBhbHNvIGJlIG1pc2xlYWQg
aW50byB0cnlpbmcgdG8gZmlndXJlIG91dCB3aHkgdGhlIGhlY2sgdGhpcwo+ID4+IGV4dHJhIHJl
ZmVyZW5jZSBnZXRzIG9idGFpbmVkLiBQbHVzIHN1Yi1vcHRpbWFsIGNvZGUgdGVuZHMgdG8gZ2V0
Cj4gPj4gY2xvbmVkIC4uLgo+ID4KPiA+IFllYSwgSSdtIHdpdGggeW91Li4gQWxyaWdodCwgaW4g
dGhhdCBjYXNlIEFuZHJldyBwdWxsZWQgaW4gdGhhdAo+ID4gcHJldmlvdXMgcGF0Y2ggaW50byB4
ODYtbmV4dCBmb3Igbm8gZ29vZCByZWFzb24gYXMgdGhhdCB3aG9sZSB0aGluZyBpcwo+ID4gZ29p
bmcgdG8gZ2V0IGRyb3BwZWQgbm93LiBBbmRyZXcgLSBpZiB5b3UgY2FuIGp1c3QgZHJvcCB0aGF0
IHBhdGNoCj4gPiBmcm9tIHg4Ni1uZXh0IEknbGwgcmViYXNlIG9uIHN0YWdpbmcgYW5kIHJlc2Vu
ZCB3aXRob3V0IHRoYXQgcGF0Y2guCj4KPiBJIGFzc3VtZSBoZSB3YW50cyB0aGF0IGJyYW5jaCB0
byBiZSBmYXN0LWZvcndhcmRpbmc7IGlmIHNvLCBoZSBjYW4ndAo+IHJlYWxseSBwdWxsIGl0IG91
dC4KPgoKWWVhLCBmaWd1cmVkLi4gT2ggd2VsbCwgbm90IHJlYWxseSBhIGJpZyBkZWFsLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
