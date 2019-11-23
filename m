Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B8107FAD
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 18:53:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYZZH-0006Hp-No; Sat, 23 Nov 2019 17:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYZZF-0006Hk-Qr
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 17:51:33 +0000
X-Inumbo-ID: e27bb146-0e19-11ea-b4d1-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e27bb146-0e19-11ea-b4d1-bc764e2007e4;
 Sat, 23 Nov 2019 17:51:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 4so9134683wro.7
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 09:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5GaSgPm6djpRO7zZnqD3210i7JU+i7YPNKu0ihA77Us=;
 b=Uoyt4oSkFl/SqSt7MKxRjLl6pYaW5Dmpyiok+P10yltm5Me5eAnyQJRTV6Zq8tZQKs
 SqYXetjVPmmd4uyxD+ZSw3X+X23xays/Wey6Xu84rGgZrnaPDj1PSqPF7ilL75c5zJfJ
 a7Rx00VR5h0XpKevzZXKz6mIAu2SzDJxruxWaqhIkLDJ/VOodwfRqYJMW3hYrA+16OpQ
 pqzfts3bLH/qVhkh25yId/zNtqO10XUq2n7fzDaY5NoH+Xx7aA79Z4mWXCO5/g15QWFZ
 2Zzz7b5ngSlBoDtRR9Y3pLRztTkXQMNru7LVXeXLgnmqWy9aHVkILQTLCmN5uU+4pPGO
 oepw==
X-Gm-Message-State: APjAAAU9saTHn7hPtLXxlfUFq/qCR4rD2mk5aayE7+xHyTosMc3/eYe9
 5xLrYtm7XKvX/h3p8JsQjLvjHQzJC3c=
X-Google-Smtp-Source: APXvYqyuSdiN3mpFDZaaCqN+VFYRzbqUQPyfdpkeHeTpks4Cc28z93fJdlev+QpxbujDQ1m5942LQw==
X-Received: by 2002:a5d:6b51:: with SMTP id x17mr24534634wrw.148.1574531492153; 
 Sat, 23 Nov 2019 09:51:32 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id t134sm2663242wmt.24.2019.11.23.09.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 09:51:31 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
 <76094c14e54b4a0e9ca539797636f060@dornerworks.com>
 <317492a1-f046-8a3b-433a-9ac95e8529dd@xen.org>
 <3963c218-b433-4441-92af-4585176abc99@dornerworks.com>
 <208ea88f-39d6-eb38-0787-7f1cbb1911ff@xen.org>
 <5b299371-ea94-fd69-7940-aa2d3d2e5709@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f7272b34-5fdd-fe71-f8fe-1884a164c6da@xen.org>
Date: Sat, 23 Nov 2019 17:51:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5b299371-ea94-fd69-7940-aa2d3d2e5709@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] arm/vtimer: Physical timer emulation and the
 physical counter
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmVmZiwKCk9uIDIxLzExLzIwMTkgMTU6NDcsIEplZmYgS3ViYXNjaWsgd3JvdGU6Cj4gT24g
MTEvMjEvMjAxOSAxMDowNiBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOj4gSGksCj4+Cj4+IE9uIDIx
LzExLzIwMTkgMTQ6MzEsIEplZmYgS3ViYXNjaWsgd3JvdGU6Cj4+PiBPbiAxMS8xOS8yMDE5IDc6
NDggQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBTbyBJIHRoaW5rIHdlIGNhbiBoYW5kbGUg
dGhlIHBoeXNpY2FsIHRpbWVyIGluIHNpbWlsYXIgZmFzaGlvbiB0byB0aGUKPj4+PiB2aXJ0dWFs
IHRpbWVyLiBUaGlzIHNob3VsZCBsaWtlbHkgaW1wcm92ZSBwZXJmb3JtYW5jZSBmb3IgT1Mgc3Rp
bGwgdXNpbmcKPj4+PiB0aGUgcGh5c2NpYWwgdGltZXIgKEFGQUlLIGxpbnV4IGFybTY0IHdpbGwg
dXNlIHRoZSB2aXJ0IHRpbWVyIGJ5IGRlZmF1bHQpLgo+Pj4KPj4+IE9uZSBjYXZlYXQgaXMgdGhl
IHZpcnR1YWwgdGltZXIgY3VycmVudGx5IG1hc2tzIGl0c2VsZiB3aGVuIGl0IGZpcmVzLiBUaGlz
Cj4+PiByZXF1aXJlcyB0aGUgZ3Vlc3QgdG8gdW5tYXNrIGl0IGV2ZXJ5IHRpbWUgaW4gdGhlIGlu
dGVycnVwdCBoYW5kbGVyLCB3aGljaCBpcyBhCj4+PiBkZXZpYXRpb24gZnJvbSBub3JtYWwgQVJN
djggYmVoYXZpb3IuIEV2ZXJ5IFJUT1MgcG9ydCB0byBYZW4gSSBoYXZlIHdvcmtlZCB3aXRoCj4+
PiByZXF1aXJlcyB0aGlzIG1vZGlmaWNhdGlvbiBmb3IgdGhlIHN5c3RlbSB0aWNrIHRvIHdvcmsg
Y29ycmVjdGx5LiBXZSBtYXkgbmVlZCB0bwo+Pj4gY29weSB0aGlzIGJlaGF2aW9yIGZvciB0aGUg
cGh5c2ljYWwgdGltZXIgYXMgd2VsbC4KPj4KPj4gVGhhdCdzIGEgZ29vZCBwb2ludC4gVGhpcyBz
aG91bGQgYmUgc29sdmVkIGJ5IFN0ZXdhcnQncyBzZXJpZXMgKEkKPj4gaGF2ZW4ndCB5ZXQgcmV2
aWV3ZWQgaXQpLgo+IAo+IFRoYXQgd291bGQgYmUgZ3JlYXQgaWYgd2UgY291bGQgZml4IHRoaXMg
ZGV2aWF0aW9uIGluIFhlbiAtIGl0IHdvdWxkIGJlIG9uZSBsZXNzCj4gcHJvYmxlbSB0byBkZWFs
IHdpdGggd2hlbiBwb3J0aW5nIGd1ZXN0cy4KPiAKPj4gV2hpbGUgd2FpdGluZyBvbiB0aGUgc2Vy
aWVzLCB3ZSBzaG91bGQgc3RpbGwgZml4IHRoZSBwcm9ibGVtLiBCdXQgSQo+PiB3b3VsZCBsaWtl
IHRvIGF2b2lkIHRyYXBwaW5nIHRoZSBwaHlzaWNhbCB0aW1lciBjb3VudGVyIHJlZ2lzdGVyLiBT
byBJCj4+IHdvdWxkIHN1Z2dlc3QgdG8gYWRhcHQgdGhlIGVtdWxhdGlvbiBvZiB0aGUgQ1ZBTCAm
IGNvLgo+IAo+IEkgd291bGQgcHJvcG9zZSByZW1vdmluZyBwaHlzX3RpbWVyX2Jhc2Uub2Zmc2V0
IGFuZCBqdXN0IG1ha2UgdGhlIG9mZnNldCB6ZXJvCj4gZm9yIHRoZSBwaHlzaWNhbCB0aW1lciB0
cmFwcy4gSSBjYW4gcHV0IHRvZ2V0aGVyIGEgcGF0Y2ggZm9yIHRoaXMuCgpJIHRoaW5rIGl0IHNo
b3VsZCBiZSBmaW5lIHRvIHJlbW92ZSBwaHlzX3RpbWVyX2Jhc2Uub2Zmc2V0IGNvbXBsZXRlbHku
CgpMb29raW5nIGZvcndhcmQgdG8gcmV2aWV3IHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
