Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515511AA4B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:55:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0Xh-0003nI-D8; Wed, 11 Dec 2019 11:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qa45=2B=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1if0Xg-0003nD-6k
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:52:32 +0000
X-Inumbo-ID: b65e9de8-1c0c-11ea-a914-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b65e9de8-1c0c-11ea-a914-bc764e2007e4;
 Wed, 11 Dec 2019 11:52:31 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 2so1691324pfg.12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 03:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
 :content-transfer-encoding;
 bh=9TzCrnHA+PZn9B0VHl+C0w3viSNbDpi/JT9IW5C14J8=;
 b=UujeKlbA/oBu+duQfpkaL3iWHAaBqMPrF7H0W7jQ+M/FQL4G8ixiotVWbhuZwA6mje
 Kx9jOIhtvj/I2DcfkoMtR8dyzOO3+OnUz9MaH9Gf+2CTOpM/EmBjjs7i3p5ZuAiLz0Ea
 08BRxmfZ06lHEMLrJFwYdFLInSybAcbbSP79HbIPXp/jNwUqmTJQMhs1kJOSQvz9dPgx
 v8ocNEB/RvbIWTs+3dT10kmLBlKe//mmrJeEhqfBvfJgRwHK7fPPaHlfYEOqaKUYj8A0
 tzby5AOae+q83G01Pk6UoxEzeAAeSK/78cvydpBgx/IpBBS7yMDcDZ6OSN0cTCYKvdkH
 VAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=9TzCrnHA+PZn9B0VHl+C0w3viSNbDpi/JT9IW5C14J8=;
 b=Yxquvt3T535illvsE0Srk0HhgeRI/YvZS8RoVqfMJtVfLoUARE2tsY3KfrTwYTR7d+
 dqT2LVV99bsgooNnpiUJuTm6O1aFgfR/ok95DZp56/jP1MuKLuxUenuYZXXwYPI/3EIh
 4RXwyj3mIL9uaztLU8Z06t+GQZneZ2NaJEVtTeL5FgZEF6R6qPqaK6rhLlYiGQqjlMRc
 fs/1+C9ZViZIi/DfpZWOs/VIBHBR3rYiIfprCicndKKfrd6N4GcXU3hTuiMLTslvLJrn
 bslR0l3ABd0e4V67FOdZc6ai2y5joUrJKUAwFAUVoZO/MsxTmmxsGR6IqWovLi0gezSI
 7qcw==
X-Gm-Message-State: APjAAAXtZYm7TOI41KTsapyhhLLvng2FVn4A87Z1dGp3adG3MBX3PLfQ
 TPeRMo3PTdLMUyB/0NFGiiI=
X-Google-Smtp-Source: APXvYqyNHh8Lss6GwxUzuzRZ0u3f0WdVaw5JqFj3HHSzfVMHuFQva6NtQ4sf40djNyzLYKQO1ZtFJg==
X-Received: by 2002:a63:1c02:: with SMTP id c2mr3589205pgc.175.1576065150783; 
 Wed, 11 Dec 2019 03:52:30 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id g18sm2921000pfi.80.2019.12.11.03.52.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Dec 2019 03:52:30 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Date: Wed, 11 Dec 2019 12:52:08 +0100
Message-Id: <20191211115208.14583-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
In-Reply-To: <20191211105112.GK980@Air-de-Roger> (raw)
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBEZWMgMjAxOSAxMTo1MToxMiArMDEwMCAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKCj4gPiBPbiBUdWUsIDEwIERlYyAyMDE5IDExOjE2
OjM1ICswMTAwICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVu
L3hlbmJ1cy5oCj4gPiA+ID4gaW5kZXggODY5YzgxNmQ1ZjhjLi5jZGIwNzVlNDE4MmYgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiA+ID4gPiArKysgYi9pbmNsdWRl
L3hlbi94ZW5idXMuaAo+ID4gPiA+IEBAIC0xMDQsNiArMTA0LDcgQEAgc3RydWN0IHhlbmJ1c19k
cml2ZXIgewo+ID4gPiA+ICAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwo+ID4gPiA+ICAJ
aW50ICgqcmVhZF9vdGhlcmVuZF9kZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsK
PiA+ID4gPiAgCWludCAoKmlzX3JlYWR5KShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKPiA+
ID4gPiArCXVuc2lnbmVkICgqcmVjbGFpbSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7Cj4g
PiA+IAo+ID4gPiAuLi4gaGVuY2UgSSB3b25kZXIgd2h5IGl0J3MgcmV0dXJuaW5nIGFuIHVuc2ln
bmVkIHdoZW4gaXQncyBqdXN0Cj4gPiA+IGlnbm9yZWQuCj4gPiA+IAo+ID4gPiBJTU8gaXQgc2hv
dWxkIHJldHVybiBhbiBpbnQgdG8gc2lnbmFsIGVycm9ycywgYW5kIHRoZSByZXR1cm4gc2hvdWxk
IGJlCj4gPiA+IGlnbm9yZWQuCj4gPiAKPiA+IEkgZmlyc3QgdGhvdWdodCBzaW1pbGFybHkgYW5k
IHNldCB0aGUgY2FsbGJhY2sgdG8gcmV0dXJuIHNvbWV0aGluZy4gIEhvd2V2ZXIsCj4gPiBhcyB0
aGlzIGNhbGxiYWNrIGlzIGNhbGxlZCB0byBzaW1wbHkgbm90aWZ5IHRoZSBtZW1vcnkgcHJlc3N1
cmUgYW5kIGFzayB0aGUKPiA+IGRyaXZlciB0byBmcmVlIGl0cyBtZW1vcnkgYXMgbWFueSBhcyBw
b3NzaWJsZSwgSSBjb3VsZG4ndCBlYXNpbHkgaW1hZ2luZSB3aGF0Cj4gPiBraW5kIG9mIGVycm9y
cyB0aGF0IG5lZWQgdG8gYmUgaGFuZGxlZCBieSBpdHMgY2FsbGVyIGNhbiBvY2N1ciBpbiB0aGUg
Y2FsbGJhY2ssCj4gPiBlc3BlY2lhbGx5IGJlY2F1c2UgY3VycmVudCBibGtiYWNrJ3MgY2FsbGJh
Y2sgaW1wbGVtZW50YXRpb24gaGFzIG5vIHN1Y2ggZXJyb3IuCj4gPiBTbywgaWYgeW91IGFuZCBv
dGhlcnMgYWdyZWUsIEkgd291bGQgbGlrZSB0byBzaW1wbHkgc2V0IHRoZSByZXR1cm4gdHlwZSB0
bwo+ID4gJ3ZvaWQnIGZvciBub3cgYW5kIGRlZmVyIHRoZSBlcnJvciBoYW5kbGluZyB0byBhIGZ1
dHVyZSBjaGFuZ2UuCj4gCj4gWWVzLCBJIGFsc28gd29uZGVyZWQgdGhlIHNhbWUsIGJ1dCBzZWVp
bmcgeW91IHJldHVybmVkIGFuIGludGVnZXIgSQo+IGFzc3VtZWQgdGhlcmUgd2FzIGludGVyZXN0
IGluIHJldHVybmluZyBzb21lIGtpbmQgb2YgdmFsdWUuIElmIHRoZXJlJ3MKPiBub3RoaW5nIHRv
IHJldHVybiBsZXQncyBqdXN0IG1ha2UgaXQgdm9pZC4KPiAKPiA+ID4gCj4gPiA+IEFsc28sIEkg
dGhpbmsgaXQgd291bGQgcHJlZmVyYWJsZSBmb3IgdGhpcyBmdW5jdGlvbiB0byB0YWtlIGFuIGV4
dHJhCj4gPiA+IHBhcmFtZXRlciB0byBkZXNjcmliZSB0aGUgcmVzb3VyY2UgdGhlIGRyaXZlciBz
aG91bGQgYXR0ZW1wdCB0byBmcmVlCj4gPiA+IChpZTogbWVtb3J5IG9yIGludGVycnVwdHMgZm9y
IGV4YW1wbGUpLiBJJ20gaG93ZXZlciBub3QgYWJsZSB0byBmaW5kCj4gPiA+IGFueSBleGlzdGlu
ZyBMaW51eCB0eXBlIHRvIGRlc2NyaWJlIHN1Y2ggcmVzb3VyY2VzLgo+ID4gCj4gPiBZZXMsIHN1
Y2ggZXh0ZW50aW9uIHdvdWxkIGJlIHRoZSByaWdodCBkaXJlY3Rpb24uICBIb3dldmVyLCBiZWNh
dXNlIHRoZXJlIGlzIG5vCj4gPiBleGlzdGluZyBMaW51eCB0eXBlIHRvIGRlc2NyaWJlIHRoZSB0
eXBlIG9mIHJlc291cmNlcyB0byByZWNsYWltIGFzIHlvdSBhbHNvCj4gPiBtZW50aW9uZWQsIHRo
ZXJlIGNvdWxkIGJlIG1hbnkgZGlmZmVyZW50IG9waW5pb25zIGFib3V0IGl0cyBpbXBsZW1lbnRh
dGlvbgo+ID4gZGV0YWlsLiAgSW4gbXkgb3BpbmlvbiwgaXQgY291bGQgYmUgYWxzbyBwb3NzaWJs
ZSB0byBzaW1wbHkgYWRkIGFub3RoZXIKPiA+IGNhbGxiYWNrIGZvciBhbm90aGVyIHJlc291cmNl
IHR5cGUuICBUaGF0IHNhaWQsIGJlY2F1c2UgY3VycmVudGx5IHdlIGhhdmUgYW4KPiA+IHVzZSBj
YXNlIGFuZCBhbiBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlIG1lbW9yeSBwcmVzc3VyZSBvbmx5LCBJ
IHdvdWxkIGxpa2UgdG8KPiA+IGxldCBpdCBhcyBpcyBmb3Igbm93IGFuZCBkZWZlciB0aGUgZXh0
ZW5zaW9uIGFzIGEgZnV0dXJlIHdvcmssIGlmIHlvdSBhbmQKPiA+IG90aGVycyBoYXZlIG5vIG9i
amVjdGlvbi4KPiAKPiBBY2ssIGNhbiBJIHBsZWFzZSBhc2sgdGhlIGNhbGxiYWNrIHRvIGJlIG5h
bWVkIHJlY2xhaW1fbWVtb3J5IG9yIHNvbWUKPiBzdWNoIHRoZW4/CgpZZXMsIEkgd2lsbCBjaGFu
Z2UgdGhlIG5hbWUuCgoKVGhhbmtzLApTZW9uZ0phZSBQYXJrCgo+IAo+IFRoYW5rcywgUm9nZXIu
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
