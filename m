Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BB152911
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:25:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHpa-0004zM-5h; Wed, 05 Feb 2020 10:22:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izHpZ-0004zH-A2
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:22:49 +0000
X-Inumbo-ID: 744a4b8e-4801-11ea-90bc-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 744a4b8e-4801-11ea-90bc-12813bfff9fa;
 Wed, 05 Feb 2020 10:22:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so1943260wrx.11
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 02:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQ1Z17oOuLuMcR/vCS7nTFENzkd4U9Ijdz7GEI1J498=;
 b=Fa3lFAzKFyI77Q9ri7ZyjFKmS4nJodxb8x+4qoLVKC9dEodgaUrjswudfh9eLjnsjr
 +LZcV9pykMvKKOQtH5eSTkddpINzSAiATa2TrXYl3Iiw53D4buIS3ETPUY7148qBS7rP
 /IitzWARVY86h4lF5EKQEemDe1CqZjdDG7+lejs1N5juX7kyud8hHxKvshL7HBg4IUwO
 XOw5HQvai4LLyZUgL7r6lnORfaCn9puEDhKFt1O4NMBXH4C+dNleluWcL0WJ5AnF/Qac
 MKBwKhParLJu9S4PY3PiTxvw+KI9SrZ7N80/wowNn1uPkv8x1t/cWNzvcaANHPQ6JnEA
 HbMw==
X-Gm-Message-State: APjAAAXV0mmwxLsMFii2tiBMjqwlx3kFyFz4+PV1tNQHnthl39kkYQuR
 90dxINFIdtjOag2NuUC3334=
X-Google-Smtp-Source: APXvYqwut4VhL7UvIVYu+S3nnYEYfxEi3d4TFSk8eNmGNew+usdGNdadXqYzXR3wo4gSVyMzbzjMSw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr26670831wrq.137.1580898166746; 
 Wed, 05 Feb 2020 02:22:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id m21sm7684125wmi.27.2020.02.05.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 02:22:45 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
 <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
 <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <9d1c6e2b-f155-96f9-deeb-1b1f30c94081@xen.org>
Date: Wed, 5 Feb 2020 10:22:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8wMi8yMDIwIDA5OjUwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gVHVl
LCAyMDIwLTAyLTA0IGF0IDE1OjM3ICswMDAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBBdCB2
ZXJ5IGxlYXN0IGl0J3MgbW9yZSByb2J1c3QgdGhpcyB3YXk7IHRoZSBhbGdvcml0aG0gaXMgYWxz
byBsZXNzCj4+ICJtYWdpYyIuICBXZSBqdXN0IGhhZCBhIGxvbmcgZGlzY3Vzc2lvbiB0aGlzIG1v
cm5pbmcgdHJ5aW5nIHRvIHJlLWNyZWF0ZQo+PiB0aGUgbG9naWMgZm9yIHdoeSAiUmVtb3ZlIE1G
TiAwIiB3YXMgc3VmZmljaWVudCB0byBwcmV2ZW50IHRoaXMgaXNzdWUsCj4+IGFuZCBldmVuIHRo
ZW4gRGF2aWQgd2Fzbid0IHN1cmUgaXQgd2FzIGNvcnJlY3QgYXQgZmlyc3QuCj4gCj4gUmlnaHQu
IFNvIHRoZSByZWFsIHJlYXNvbiBJJ20gc3RhcmluZyBoYXJkIGF0IHRoaXMgaXMgYmVjYXVzZSBJ
IGNhbid0Cj4gY29udmluY2UgbXlzZWxmIHRoZXJlIGFyZW4ndCBwbGFjZXMgd2hlcmUgbWVtb3J5
IGFsbG9jYXRlZCBieSB0aGUgYm9vdAo+IGFsbG9jYXRvciBpcyBsYXRlciBmcmVlZCB3aXRoIGZy
ZWVfeGVuaGVhcF9wYWdlcygpLgo+IAo+IFdlIGhhdmUgYSBmZXcgcGllY2VzIG9mIGNvZGUgd2hp
Y2ggZGVjaWRlIHdoZXRoZXIgdG8gdXNlIHRoZSBib290Cj4gYWxsb2NhdG9yIHZzLiBoZWFwIGJh
c2VkIG9uIHN5c3RlbV9zdGF0ZSA+PSBTWVNfU1RBVEVfYm9vdCwgYW5kICppZioKPiB0aGUgcnVs
ZSBpcyAidGhvdSBzaGFsdCBub3QgYWxsb2NhdGUgd2l0aCBib290IGFsbG9jYXRvciBhbmQgZnJl
ZQo+IGxhdGVyIiB0aGVuIGl0J3MgKmV4dHJlbWVseSogZnJhZ2lsZSBhbmQgcHJvYmFibHkgYmVp
bmcgdmlvbGF0ZWQg4oCUCj4gZXNwZWNpYWxseSBiZWNhdXNlIGl0IGFjdHVhbGx5ICp3b3Jrcyog
bW9zdCBvZiB0aGUgdGltZSwgZXhjZXB0IGluIHNvbWUKPiBlc290ZXJpYyBjb3JuZXIgY2FzZXMg
bGlrZSBNRk4jMCwgYm9vdCBhbGxvY2F0aW9ucyB3aGljaCBjcm9zcwo+IHpvbmVzL3JlZ2lvbnMs
IGV0Yy4KPiAKPiBTbyBiZWNhdXNlIHdlIHdhbnQgdG8gbWFrZSB0aGF0ICptb3JlKiBsaWtlbHkg
YnkgYWxsb3dpbmcgdm1hcCgpIHRvCj4gaGFwcGVuIGVhcmxpZXIsIEknZCBsaWtlIHRvIGNsZWFu
IHRoaW5ncyB1cCBieSBhZGRyZXNzaW5nIHRob3NlIGNvcm5lcgo+IGNhc2VzIGFuZCBtYWtpbmcg
aXQgdW5jb25kaXRpb25hbGx5IE9LIHRvIGZyZWUgYm9vdC1hbGxvY2F0ZWQgcGFnZXMKPiBpbnRv
IHRoZSBoZWFwLgo+IAo+IEkgdGhpbmsgbWlnaHQgYmUgYXMgc2ltcGxlIGFzIGNoZWNraW5nIGZv
ciAoZmlyc3RfcGcpLT5jb3VudF9pbmZvID09IDAKPiBpbiBmcmVlX3hlbmhlYXBfcGFnZXMoKS4g
VGhhdCdzIHF1aWNrIGVub3VnaCwgYW5kIGlmIHRoZSBjb3VudF9pbmZvIGlzCj4gemVybyB0aGVu
IEkgdGhpbmsgaXQgZG9lcyBpbmRpY2F0ZSBhIGJvb3QtYWxsb2NhdGVkIHBhZ2UsIGJlY2F1c2Ug
cGFnZXMKPiBmcm9tIGFsbG9jX3hlbmhlYXBfcGFnZXMoKSB3b3VsZCBoYXZlIFBHQ194ZW5faGVh
cCBzZXQ/Cj4gCj4gSXQgd291bGQgc3VmZmljZSBqdXN0IHRvIHBhc3Mgc3VjaCBwYWdlcyB0byBp
bml0X2hlYXBfcGFnZXMoKSBpbnN0ZWFkCj4gb2YgZGlyZWN0bHkgdG8gZnJlZV9oZWFwX3BhZ2Vz
KCksIEkgdGhpbmsuIEp1bGllbj8KPiAKPiBUaGUgc3RyYXcgbWFuIHZlcnNpb24gb2YgdGhhdCBs
b29rcyBhIGJpdCBsaWtlIHRoaXMuLi4KPiAKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
Ywo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTIzMDQsNiArMjMwNCwxMiBA
QCB2b2lkIGZyZWVfeGVuaGVhcF9wYWdlcyh2b2lkICp2LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4g
ICAKPiAgICAgICBwZyA9IHZpcnRfdG9fcGFnZSh2KTsKPiAgIAo+ICsgICAgLyogUGFnZXMgZnJv
bSB0aGUgYm9vdCBhbGxvY2F0b3IgbmVlZCB0byBwYXNzIHRocm91Z2ggaW5pdF9oZWFwX3BhZ2Vz
KCkgKi8KPiArICAgIGlmICggdW5saWtlbHkoIXBnLT5jb3VudF9pbmZvKSApCgpOb3RlIHRoYXQg
dGhlcmUgaXMgdHdvIHZlcnNpb25zIG9mIGZyZWVfeGVuaGVhcF9wYWdlcygpLiBUaGlzIG9uZSBv
bmx5IApjb3ZlciB0aGUgY2FzZSB3aGVyZSB0aGUgZG9taGVhcCBhbmQgeGVuaGVhcCBhcmUgdGhl
IHNhbWUuCgpCdXQgeW91IGNhbid0IHVzZSB0aGUgc2FtZSB0cmljayB3aGVuIHhlbmhlYXAgaXMg
c2VwYXJhdGVkIChsaWtlIG9uIApBcm0zMikgYmVjYXVzZSBQR0NfeGVuX2hlYXAgaXMgbm90IHNl
dC4gU28geW91IHdvdWxkIGJlIGNhbGxpbmcgCmluaXRfaGVhcF9wYWdlcygpIGV2ZXJ5dGltZS4K
Ckhvd2V2ZXIsIEkgZG9uJ3QgbGlrZSB0aGUgaWRlYSBvZiByZWx5aW5nIG9uIGNvdW50X2luZm8g
PT0gMC4gSW5kZWVkLCAKdGhlcmUgYXJlIHZhbGlkIGNhc2Ugd2hlcmUgY291bnRfaW5mbyA9PSAw
IGJlY2F1c2UgaXQgbWVhbnMgdGhlIHBhZ2UgaXMgCmludXNlIChQQ0Nfc3RhdGVfaW51c2UpLgoK
SXQgbWlnaHQgYmUgYmVzdCBpZiB3ZSBpbnRyb2R1Y2UgYSBuZXcgcGFnZSBzdGF0ZSB0aGF0IHdv
dWxkIGJlIHRoZSAKZGVmYXVsdCB2YWx1ZSBzZXQgaW4gdGhlIGZyYW1ldGFibGUuCgowIG1heSBi
ZSBhbiBvcHRpb24gaWYgd2UgYXNzaWduIGEgZGlmZmVyZW50IHZhbHVlIHRvIFBHQ19zdGF0ZV9p
bnVzZSBidXQgCndlIHdvdWxkIG5lZWQgdG8gY2hlY2sgaWYgdGhlcmUgYXJlIHBsYWNlcyByZWx5
aW5nIG9uIFBHQ19zdGF0ZV9pbnVzZSA9PSAKMC4gSSBrbm93IHRoYXQgYXNzaWduX3BhZ2VzKCkg
ZG9lcyByZWx5IG9uIGl0LCBJIGhhdmUgc2VudCBhIHBhdGNoIGZvciAKaXQgeWVzdGVyZGF5LgoK
QW5vdGhlciBvcHRpb24gaXMgdG8gdXNlIGFuIGFsbCAxcyB2YWx1ZSBhbmQgaW5pdGlhbGl6ZSB0
aGUgZnJhbWV0YWJsZSAKdG8gYWxsIDFzLiBCdXQgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGV0
aGVyIHRoZSBhbGxvY2F0b3Igd291bGQgYmUgCmFibGUgdG8gY29wZSB3aXRoIGl0LgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
