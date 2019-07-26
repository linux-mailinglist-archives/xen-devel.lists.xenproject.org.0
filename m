Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F176B7C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr163-0003Nc-36; Fri, 26 Jul 2019 14:21:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxDH=VX=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hr161-0003NV-QB
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:21:21 +0000
X-Inumbo-ID: a331684d-afb0-11e9-8980-bc764e045a96
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a331684d-afb0-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:21:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so43743600wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZAk9BcjDfEVnEJFG7g2pFq6AkcytgbDZUQRbUIq7t1Y=;
 b=YE6VaNAOsfcWY6Ce3qEytBfRKx0XQXM9+H9lDDOI9rN2f1B0J8xXaCBIKS/5n5ABmB
 Y/Bbq0+RAdAakWoQy1+iWbsfVTJAJX2NBKICC7RW8+BQpAQCaAp9EZEj1rjOGWUIacY6
 eoaSAmqDpYRMFoFjSSltxUWxu7wsW6xW8tbqmVPY6ZJhTAI4zyPoOsIx4yZg6OahuPNn
 P298Ep5rkKC8NTHMa/bYQGcvH3jwoiLX51P+uCDUHv+p//QZOUKPzjK2g8q6JexV90Al
 aZMI6dTV0aWHk/DksmCdJ1emAvECYIIbxc9OIWuqlgd1EDZn78pAwMuaor+398RwHSlG
 PNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZAk9BcjDfEVnEJFG7g2pFq6AkcytgbDZUQRbUIq7t1Y=;
 b=T/E1N9jV7V8QBdmCFXj4Uy7BblXv1TEy0ZlQN0BrZgaNKVnchhnVGUl6T8YjWVh2O6
 qzQhdinDHKfgC7AtDF3DJGnvrxDvetak0B7ARfBX8L9aw5TEaBIC/EuCNtH/7VdGW8wo
 +Q4ef03E612oGjPifaQgUOEfxcR0+rOWiGptbTQ4uC9yY11u4Uv52ubbO67Dsm1S6hnI
 fQc0v/OP6KOhdIa0OrLGw+Ks0uqCPZtwK6LdC1JNJUvME00vVceF6qT1bvMQdDPw8OEL
 GAd/S8McVahsjecgysSROav4KRj2Gozt67DyOx6zaZqZ7fdOP2V1aB3bnswrDh78uP9E
 QJPg==
X-Gm-Message-State: APjAAAXl9yBuKo1ZiJGyVwhuXPrmdRzL2U7hwOwR1yyd72RhxgTM7xRM
 nbin4loDDlroBbr09iYaGec=
X-Google-Smtp-Source: APXvYqwjPF13NQG5U0QHpz4frSm0/1XF3+2b7iEHKdGq6GjhS/+jv+HHM18q58kNWoQOFJIk+xjirQ==
X-Received: by 2002:a1c:d108:: with SMTP id i8mr89659268wmg.28.1564150878806; 
 Fri, 26 Jul 2019 07:21:18 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:1d44:aeab:d929:303?
 ([2a02:c7f:ac18:da00:1d44:aeab:d929:303])
 by smtp.gmail.com with ESMTPSA id c3sm56425650wrx.19.2019.07.26.07.21.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:21:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <CAOcoXZbHJxuDfGQK4mPBGvcPgZhgO6SwsQwwTBc=4z+=C3yfyw@mail.gmail.com>
Date: Fri, 26 Jul 2019 15:21:16 +0100
Message-Id: <C896AE1B-C639-4235-9157-AB92225842DE@gmail.com>
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <CAOcoXZbXPys+LjzhwP5f75rcKSXKatmPSaiA+MvVVm0_FWK7GA@mail.gmail.com>
 <D8A1ACAC-5830-4C1A-8A85-A86C5B05246D@gmail.com>
 <CAOcoXZbHJxuDfGQK4mPBGvcPgZhgO6SwsQwwTBc=4z+=C3yfyw@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDI2IEp1bCAyMDE5LCBhdCAxNToxNywgVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4u
MTlAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCA0OjUyIFBN
IExhcnMgS3VydGggPGxhcnMua3VydGgueGVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gdGhhbmsg
eW91IGZvciBwdXR0aW5nIHRoaXMgbWFpbCB0b2dldGhlciBhbmQgZHJpdmluZyB0aGlzIGZvcndh
cmQuIEkgYWRkZWQgY29tbWl0dGVyc0AgYXMgd2VsbCBhcyBEb3VnLiBJIGFtIGdvaW5nIHRvIGxl
dCBvdGhlcnMgcmVzcG9uZCBmaXJzdC4KPj4+PiBJIGFtIGFzc3VtaW5nIHdlIGFyZSBsb29raW5n
IGZvciBzb21lIHRlc3Rpbmc/Cj4+PiAKPj4+IFllcywgeW91IGFyZSByaWdodC4KPj4+IFRoZSBp
bXBsZW1lbnRhdGlvbiBoYXMgYmVlbiB1cGRhdGVkIGFuZCByZXRlc3RlZCB3aXRoIG5ld2VyIHZl
cnNpb25zCj4+PiBvZiBjbGFuZyBjb2RlLgo+Pj4gV2UgYXJlIGxvb2tpbmcgZm9yIHNvbWUgdGVz
dGluZyBhbmQgZmVlZGJhY2sgdG8gbW92ZSBmb3J3YXJkLgo+Pj4gCj4+Pj4gSXMgdGhlcmUgYSBz
aW1wbGUgc2V0IG9mIGluc3RydWN0aW9ucyB0byBnZXQgc3RhcnRlZCBhbmQgdGVzdCB0aGUgdG9v
bD8KPj4+IAo+Pj4gWWVzLCBob3dldmVyLCBzaW5jZSB0aGUgY2hhbmdlcyBhcmUgbm90IGludGVn
cmF0ZWQgaW50byBjbGFuZy1mb3JtYXQKPj4+IG1haW5saW5lIHlldCwKPj4+IHRvIHRlc3QgdGhl
IHRvb2wgaXQgbmVlZHMgdG8gY29tcGlsZSBjbGFuZy1mb3JtYXQgdG9vbCB3aXRoIHRoZSBwYXRj
aCBmaXJzdC4KPj4gCj4+IE9LCj4+IElzIHRoZXJlIGEgZ2l0IHJlcG8gd2hpY2ggaW5jbHVkZXMg
dGhlIHBhdGNoPyBUaGF0IHdvdWxkIG1ha2UgdGhpbmdzIGEgbGl0dGxlIGVhc2llcgo+IAo+IFRo
ZXJlIGlzIG5vIGxsdm0gcmVwbyB3aXRoIHRoZSBwYXRjaCBzaW5jZSB3ZSBjaGVja2VkIHZhcmlv
dXMgcmVsZWFzZXMKPiBvZiBjbGFuZyB3aXRoIGl0Li4uLgo+IEhvd2V2ZXIsIGl0IGlzIGEgZ29v
ZCBpZGVhIHRvIHByZXBhcmUgc3VjaCBhIHJlcG8gdG8gc2ltcGxpZnkgdGhlCj4gYnVpbGQgb2Yg
dGhlIHRvb2wuCj4gV2Ugd2lsbCBwcmVwYXJlIHRoZSByZXBvIGZvciBpdC4KClRoYW5rIHlvdSEg
VGhhdCBtYWtlcyB0aGluZ3MgZWFzaWVyLiBJIHdpbGwgcHJvYmFibHkgYmUgdGVzdGluZyB0aGlz
IG9uIGEgTWFjCgo+Pj4gVGhlcmUgYXJlIHR3byB1c2UtY2FzZXMgd2l0aCBpdDoKPj4+IC0gY2xh
bmctZm9ybWF0IGJpbmFyeSBjYW4gYmUgdXNlZCBhcy1pcyB0byBjaGVjayBnaXZlbiBmaWxlIG9y
IG1hbnkgZmlsZXMuCj4+PiBGb3IgZXhhbXBsZSwgdGhlIG5leHQgY29tbWFuZCBmb3JtYXRzIGFs
bCB4ZW4gKi5jIGZpbGVzIHdpdGggaXQuCj4+PiBmaW5kIH4vdy94ZW4veGVuIC1uYW1lICcqLmMn
IC1wcmludDAgfCB4YXJncyAtMCAtbiAxIC1QIDEyCj4+PiB+L3cvbGx2bS1wcm9qZWN0L2Jpbi9j
bGFuZy1mb3JtYXQgLWkgLXN0eWxlPXhlbgo+Pj4gCj4+PiBTZWUgb3V0cHV0IGV4YW1wbGUgaW46
Cj4+PiBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vdmlrdG9yLW1pdGluL3hlbi1j
bGFuZy1mb3JtYXQtZXhhbXBsZS9tYXN0ZXIvMDAwMS1jbGFuZy1mb3JtYXQtY2hlY2twYXRjaC1v
dXRwdXQtZXhhbXBsZS5wYXRjaAo+Pj4gCj4+PiAtIGFub3RoZXIgdXNlLWNhc2UgaXMgdG8gcnVu
IGl0IHdpdGggY2xhbmctZm9ybWF0IGRpZmYgY2hlY2tlciwKPj4+IEZvciBleGFtcGxlLCB0aGUg
bmV4dCBjb21tYW5kIGxpbmUgY2hlY2tzIHRoZSBsYXRlc3QgY29tbWl0IGluIGNhc2Ugb2YgZ2l0
Ogo+Pj4gZ2l0IGRpZmYgLVUwIC0tbm8tY29sb3IgSEVBRF4gfCBjbGFuZy1mb3JtYXQtZGlmZiAt
cDEKPj4gCj4+IERvZXMgdGhpcyByZXF1aXJlIHRvIGNvcHkgdGhlIG1vZGlmaWVkIGNsYW5nLWZv
cm1hdC1kaWZmLnB5ICh3aGljaCBpcyBtZW50aW9uZWQgaW4gdGhlIG1haWwpIHNvbWV3aGVyZQo+
IAo+IE5vdCByZWFsbHksIG1lYW4gaXQgZG9lcyBub3QgcmVxdWlyZSB0byBjb3B5IHRoZSBtb2Rp
ZmllZAo+IGNsYW5nLWZvcm1hdC1kaWZmLnB5LiBUaGUgb25seSBmZWF0dXJlIG1vZGlmaWVkIGNs
YW5nLWZvcm1hdC1kaWZmLnB5Cj4gcHJvdmlkZXMgaXMgY292ZXJpbmcgY29kZSBmaWxlIHRvIGNv
ZGUgc3R5bGUgbWFwcGluZ3MuCj4gVGhpcyBpcyBhIG1pbm9yIGZlYXR1cmUsIGFuZCBpdCBpcyBu
b3QgcmVsZXZhbnQgZm9yIHRoZSBYZW4gY29kZSBzdHlsZQo+IHBhdGNoZXMgdGVzdGluZy4gSXQg
aGFzIGJlZW4gZGVjaWRlZCBub3QgdG8gbW9kaWZ5IHB5dGhvbiB0b29sIGZvcgo+IG5vdy4uLgo+
IFNvIGl0IGlzIHBvc3NpYmxlIHRvIHVzZSBub3QgbW9kaWZpZWQgdmVyc2lvbiBvZiBjbGFuZy1m
b3JtYXQtZGlmZgo+IHRvb2wgZm9yIHRoZSBwYXRjaGVzIGNoZWNrcy4KCkNvb2whIAoKUmVnYXRk
cwpMYXJzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
