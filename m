Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA6557E9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 21:40:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfrFe-0002RN-7c; Tue, 25 Jun 2019 19:37:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TDZb=UY=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hfrFd-0002RG-5d
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 19:37:09 +0000
X-Inumbo-ID: 9dec7124-9780-11e9-8980-bc764e045a96
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9dec7124-9780-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 19:37:07 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k8so336783iot.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:mime-version:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UxMN4FOSXmOgh1o5+4Io6m86pHDJRyvlaDiNN7o23cQ=;
 b=fFtVa8xSmGpn8+LdjmGqeEG1NaXPwcjw+fY3V6jfVpiO17GYfXvLit9cEcNsH8kd5H
 WdDkkabDlfuqk+uozhBisRu97bAaXBfaMsMsv9VqtYETgqccTzUITp9zkidoJg9AdU+l
 Hcre+GaRiD/n1A36e/P01JJypycVx43UXfNo72W2GrVakBuH5iS/iEbuSCB2TZZWqdmw
 KS1qO+RdRFOWbkI7+GXTeOn+0QFrYVa0dPsvePXlC8IYh5QfkkF/KO0y1HeddlPAp/3e
 LEHeJxf5c6QU13c1UtPEDTFN5kO1fiVI7HB7TW7rsjPpzAtXwdk0KHNQFHCorQ8yiC3q
 JgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UxMN4FOSXmOgh1o5+4Io6m86pHDJRyvlaDiNN7o23cQ=;
 b=IjaLl8+s4Qv5+07iAKgopFsP0R8JI6MRPYkAmUmEYn15h6xYYSu+XdHfcYNECRtsYq
 JOjpSfURc1MOmRPe7N3JzLVpBu0e8MTt9zsq7DrpGjBKMUcoxTKUi3FA3pAz7y3MkzxJ
 l9DgpN7skamcxpItVoqX6drYm3yrIG2KR9A6L+7+zPU7Vw3QtYUz9ACuB5Zkgo+gm+DA
 di0sSt4jCzTX0IIWsu3KETdnsqxNRz31GDFTjwCvIeQgMh90bGV5abHLo/dFGL8wSj7c
 Ln2kcbgFgF98kljMbLBN4fB3QfpJL30mbhQ0jWfb2s9zv+ls5dKDAvqDigahcnW6Rr4B
 IVwA==
X-Gm-Message-State: APjAAAXZl0as47fmiX0ypStmIA7958YmzRVXuH209FJ1BbIgdOIOeHgx
 nCF8jjN89G7ktngPP3FwDOI=
X-Google-Smtp-Source: APXvYqxp2dHY9yl4kLenq5L2Vn7d38frsSI32RU+mHmtdfoHwBl40vg708+KuaaQENB9j08WN7evWg==
X-Received: by 2002:a6b:cd86:: with SMTP id d128mr345337iog.234.1561491426952; 
 Tue, 25 Jun 2019 12:37:06 -0700 (PDT)
Received: from [100.64.73.93] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id b20sm12615554ios.44.2019.06.25.12.37.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 12:37:06 -0700 (PDT)
Mime-Version: 1.0 (1.0)
X-Mailer: iPad Mail (16F203)
From: Rich Persaud <persaur@gmail.com>
In-Reply-To: <C115C70A-4B61-41FC-BBF4-398C9F1A2CCC@citrix.com>
Date: Tue, 25 Jun 2019 15:37:04 -0400
Received: from [100.64.73.93] ([205.185.206.113]) by smtp.gmail.com with
 ESMTPSA id k5sm15852807ioj.47.2019.06.25.12.35.20 (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 12:35:21 -0700 (PDT)
Message-Id: <D3888A0E-F9AE-46F8-A5AA-F2722BAC4BB7@gmail.com>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
 <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
 <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
 <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
 <b0d228cd-e01a-4437-7103-2a9f23c9af31@citrix.com>
 <C115C70A-4B61-41FC-BBF4-398C9F1A2CCC@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdW4gMjUsIDIwMTksIGF0IDEyOjM0LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+IAo+IO+7v09uIDI1LzA2LzIwMTksIDE0OjQ3LCAiQW5kcmV3IENvb3Bl
ciIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+PiAgIE9uIDI1LzA2LzIw
MTkgMTM6MTUsIExhcnMgS3VydGggd3JvdGU6Cj4+IE9uIDI1LzA2LzIwMTksIDEwOjAzLCAiSnVs
aWVuIEdyYWxsIiA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAKPj4+Pj4gVGhlIHBv
aW50IGhlcmUgaXMgdGhhdCB3ZSBjYW4gYmUgZmxleGlibGUgYW5kIGNyZWF0aXZlIGFib3V0IHRo
ZSB3YXkgdG8KPj4+Pj4gbWFpbnRhaW4gdGhlIGRvY3Mgb24geGVuLmdpdC4gQnV0IGFzIGEgdGVj
aG5vbG9neSBpcyBjZXJ0YWlubHkgYmV0dGVyCj4+Pj4+IHRoYW4gdGhlIHdpa2k6IHdlIGRvbid0
IGhhdmUgdG8ga2VlcCB0aGVtIGFsbCB1cC10by1kYXRlIHdpdGggdGhlIGNvZGUsCj4+Pj4+IGJ1
dCBhdCBsZWFzdCB0aGlzIHdheSB3ZSBoYXZlIGEgY2hhbmNlIChpZiB3ZSB3YW50IHRvKS4gSWYg
d2UgbGVhdmUgdGhlbQo+Pj4+PiBvbiB0aGUgd2lraSwgdGhlcmUgaXMgbm8gY2hhbmNlLgo+Pj4+
IAo+Pj4+IEkgY2FuJ3Qgc2VlIGhvdyB4ZW4uZ2l0IGlzIGdvaW5nIHRvIGJlIGJldHRlciBpZiAi
d2UgZG9uJ3QgaGF2ZSB0byBrZWVwIHRoZW0KPj4+PiBhbGwgdXAtdG8tZGF0ZSIuCj4+PiAKPj4+
IFRoYXQncyBiZWNhdXNlIGEgY29udHJpYnV0b3IgY291bGQgYWRkIGEgcGF0Y2ggYXQgdGhlIGVu
ZCBvZiBhIHNlcmllcyB0bwo+Pj4gdXBkYXRlIG9uZSBvZiB0aGUgZG9jcywgZXZlbiBpZiB0aGUg
ZG9jIGluIHF1ZXN0aW9uIGNvbWVzIHdpdGggbm8KPj4+IHByb21pc2VzIG9mIGJlaW5nIHVwLXRv
LWRhdGUuCj4+IAo+PiAgIEkgdGhpbmsgdGhpcyBpcyBnb2luZyB0aGUgd3JvbmcgZGlyZWN0aW9u
LiBUaGUgZ29hbCBvZiB1c2luZyB4ZW4uZ2l0IGlzIHRvIHRyeSAKPj4gICB0byBrZWVwIHRoZSBk
b2N1bWVudGF0aW9uIHVwLXRvLWRhdGUuCj4+IAo+PiBJIGFncmVlIHdpdGggSnVsaWVuIGFuZCB0
aGlzIHdhcyBhbHNvIG5vdCBteSBpbnRlbnRpb24uIFRoZSByZWFzb24gd2h5IEkgYnJvdWdodCB0
aGlzIHVwIG5vdyBpcyB0aGF0IHRoZSBpbi10cmVlIGRvY3MgYXJlIHByZXR0eSBtdWNoIGEgbWVz
cyB0b2RheSBhbmQgYXJlIHN0YWxlIGluIG1hbnkgd2F5cy4gQW5kIHRoZXkgbG9vayBURVJSSUJM
RSBhbmQgYXJlIG5vdCBlYXNpbHkgc2VhcmNoYWJsZS4gSG93ZXZlciwgQW5keSdzIGxhdGVzdCBz
ZXQgb2YgcGF0Y2hlcyBwcm92aWRlIGFuIG9wcG9ydHVuaXR5IHRvIGNvbnNvbGlkYXRlIHNvbWUg
b2YgdGhlIGluLXRyZWUgZG9jcyBpbiBhIG5pY2VseSByZW5kZXJlZCBhbmQgc2VhcmNoYWJsZSBm
b3JtYXQuCj4gCj4gICBTbyB0aGUgcGxhbiBoZXJlIGlzIHRvIGdldCBhIGNvbnNpc3RlbnQgYW5k
IHVuaWZvcm0gc2V0IG9mIGhpZ2ggcXVhbGl0eQo+ICAgZG9jcy4KPiAKPiAgIEFzIGZhaXIgd2Fy
bmluZywgSSdtIGludGVuZGluZyB0byBiZSBmYWlybHkgc3RyaWN0IHdpdGggd2hhdCBnb2VzIGlu
Cj4gICAocXVhbGl0eSB3aXNlKSwgYmVjYXVzZSBJJ20gZ29pbmcgdG8gZG8gbXkgYmVzdCB0byBl
bnN1cmUgdGhhdCB0aGUKPiAgIHNwaGlueCBkb2N1bWVudGF0aW9uIGRvZXNuJ3QgZGV2b2x2ZSBp
bnRvIHRoZSBtZXNzIHRoYXQgd2lraSBvciB0aGUKPiAgIG1ham9yaXR5IG9mIGRvY3MvIGN1cnJl
bnRseSBpcy4KPiAKPiBJIHdob2xlaGVhcnRlZGx5IGFncmVlCj4gCj4+IEkgaGF2ZSBiZWVuIGZv
Y3Vzc2luZyBvbiBwcm9jZXNzIHJlbGF0ZWQgYW5kIGtleSBkZXZlbG9wZXIgcmVsYXRlZCBkb2Nz
LCBiZWNhdXNlIHdobyBtYWludGFpbnMgdGhlbSBpcyBub3QgYWN0dWFsbHkgYW4gaXNzdWUgaW4g
dGhlb3J5LiBFdmVyeW9uZSByZWFsbHkgb3VnaHQgdG8gY2FyZSwgYmVjYXVzZSBldmVyeW9uZSBp
cyBpbXBhY3RlZCBieSB0aGVzZS4KPiAKPiAgIFRoZSBrZXkgcG9pbnQgaXMgZm9yIG1haW50YWlu
ZXJzL3Jldmlld2VycyB0byBiZSBhd2FyZSBvZiB3aGV0aGVyCj4gICBkb2N1bWVudGF0aW9uIGV4
aXN0cyBmb3IgdGhlIGFyZWEgb2YgY29kZSBiZWluZyBtb2RpZmllZCwgYW5kIGlmIHNvLAo+ICAg
d2hldGhlciB0aGUgc3VibWl0dGVkIHBhdGNoIHNob3VsZCBhbHNvIHBhdGNoIHRoZSBkb2N1bWVu
dGF0aW9uLgo+IAo+IEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgdGhpcyBpcyBzb21ldGhpbmcgd2hp
Y2ggY291bGQgYmUgYWRkcmVzc2VkLiBPbmUgcG9zc2liaWxpdHkgbWF5IGJlIHRvIGhhdmUgU1VQ
UE9SVC5tZCBwb2ludCB0byBkb2N1bWVudGF0aW9uLiBCdXQgdGhhdCBpcyBraW5kIG9mIGFzc3Vt
aW5nIHRoYXQgU1VQUE9SVC5tZCB3b3JrcyBhbmQgaXMgd2lkZWx5IHVzZWQuIFRoZXJlIG1heSBi
ZSBiZXR0ZXIgb3Igb3J0aG9nb25hbCB3YXlzIHRvIHBvaW50IHRvIHJlbGV2YW50IGRvY3MgKGUu
Zy4gYnkgcG9pbnRpbmcgdG8gZG9jcyBpbiBoZWFkZXIgZmlsZXMgYW5kIG90aGVyIHNvdXJjZSBm
aWxlcykuIAo+IAo+ICAgUmV2aWV3ZXJzIHRlbmQgdG8gYmUgZmFpcmx5IGdvb2QgYXQgbm90aWNp
bmcgcGF0Y2hlcyB3aGljaCBhbHNvIG5lZWQgdG8KPiAgIHBhdGNoIGRvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYyAoc3VibWl0dGVycywgbGVzcyBzbyksIGJ1dCB0aGlzCj4gICBhcHBy
b2FjaCBuZWVkcyBleHRlbmRpbmcgdG8gdGhlIHdob2xlIG9mIHRoZSBzcGhpbnggZG9jcyAod2hp
Y2ggaW4gdHVybgo+ICAgcmVxdWlyZXMgdGhlIGRvY3MgdG8gc3RheSBoaWdoIHF1YWxpdHkgc28g
aXRzIGVhc3kgZm9yIG1haW50YWluZXJzIHRvCj4gICBrbm93IHdoYXQgaXMgd2hlcmUpLgo+IAo+
IEFsdGhvdWdoIHRoaXMgZG9lcyBub3QgYXBwbHkgaW4gbXkgcHJvcG9zYWwsIEkgdGhpbmsgdGhl
IGtleSBpc3N1ZSBoYXMgYmVlbiB0aGF0IHJldmlld2VycyBhbmQgc3VibWl0dGVycyBvZiBjb2Rl
IG9mdGVuIGRvbid0IHVzZSBvdXIgZG9jdW1lbnRhdGlvbi4gVGhlIHdpa2kgaXMgc2VlbiBhcyBh
IHNlcGFyYXRlIHRoaW5nIGFuZCBhbHNvIGhhcyB0aGUgZGlzYWR2YW50YWdlIHRoYXQgaXQgZG9l
c24ndCBsZW5kIGl0c2VsZiB0byBzdXBwb3J0aW5nIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBYZW4u
IEFuZCBtb3N0IG9mIHRoZSB0aW1lLCBkZXZlbG9wZXJzIGRvIG5vdCB1c2UgaXQgYW5kIG5laXRo
ZXIgY29udHJpYnV0ZSB0byBpdC4KPiAKPiBNeSBob3BlIHdhcyB0aGF0IGJ5IGhvc3RpbmcgZG9j
dW1lbnRhdGlvbiByZWxhdGVkIHRvIGNvbnRyaWJ1dGlvbiB3b3JrZmxvdyBhbmQgb3RoZXIgZXNz
ZW50aWFsIHRhc2tzIGNsb3NlIHRvIG90aGVyIHVzZWZ1bCBkb2N1bWVudGF0aW9uIHRoaXMgd291
bGQgZW5hYmxlIGNoYW5nZS4KPiAKPiBAQW5keSBhbmQgb3RoZXJzOiBJIG5lZWQgdG8ga25vdyB3
aGV0aGVyIHlvdSBhZ3JlZSB3aXRoIG15IHByb3Bvc2FsIGFuZCB3aGV0aGVyIGFueW9uZSBoYXMg
b3RoZXIgc3VnZ2VzdGlvbnMuCgpJZiBub3QgYWxyZWFkeSBwcmVzZW50IGluIHRoZSByZWxlYXNl
IG1hbmFnZXIgcHJvY2VzcyBjaGVja2xpc3QsIHdlIGNvdWxkIHNwZWNpZnkgZG9jdW1lbnRhdGlv
bi1yZWxhdGVkIHVwZGF0ZXMgZm9yIGVhY2ggcmVsZWFzZSwgZS5nLiBtaW5pbXVtIHRleHQgZm9y
IG5ldyBmZWF0dXJlcywgcmV2aXNpb25zIHRvIG1vZGlmaWVkIGZlYXR1cmVzLCBTVVBQT1JULm1k
IHVwZGF0ZXMuCgpSaWNoCgoocmVzZW5kIHdpdGggbm9uLWJ1bGttYWlsIGFkZHJlc3MpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
