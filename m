Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507A12997B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 18:37:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijRa0-0002Ez-NG; Mon, 23 Dec 2019 17:33:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I8bJ=2N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ijRZz-0002Et-7F
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 17:33:15 +0000
X-Inumbo-ID: 477bff40-25aa-11ea-a1e1-bc764e2007e4
Received: from mail-qk1-f195.google.com (unknown [209.85.222.195])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 477bff40-25aa-11ea-a1e1-bc764e2007e4;
 Mon, 23 Dec 2019 17:33:06 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r14so14062592qke.13
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 09:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/SkF+R/LJhRxizRs3wjdEpUoUzexjEXhRW4pDSmS/k=;
 b=eOH0CHFUZJLqiolOXV/ASc+alOLmkdXNlmxhElbgNYjNNHuuNcQMqFBiP03SJAqgMx
 YjB+bMbZLvJp+atHSJ5t2F1mflsn/hxBKmlBshGNQeREb3bi1ffbg419okroxDkOB8oj
 2T5sljA1P6BbzWR3iUuft3k5hYKdBLnZFYz6oAApo4j4e4VdgxASW9fyY95Kpcm9B7vZ
 Umt1BCHv/q4XS5OPnN+Q5O3FDpCisfCqXHGCiq7lkZe/lKrga5N8/nW4Bw9dKP0oVibe
 DWQ6rD+e37dlytq/f8GGdWHfNMAPI8tTH3vS+fqjn4MBIitAmFj4Ad19kMTi/w1/LLlW
 jU7Q==
X-Gm-Message-State: APjAAAX1AviLBWH8KwbNgObgJKnscZNIHu8a/49wjbtiSYNHgCZP06Nn
 Q67HBTe3pyAqjQ0PIbsk9Uc=
X-Google-Smtp-Source: APXvYqwAfljd3BYLz6Voz4UKMQvlH9GiURFXsWQWVmszyCrDlyO00mTNXA2eSbH2xdWzLVMWj5k72g==
X-Received: by 2002:a05:620a:2094:: with SMTP id
 e20mr26565239qka.315.1577122385972; 
 Mon, 23 Dec 2019 09:33:05 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id 65sm2588571qtf.95.2019.12.23.09.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 09:33:05 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
Date: Mon, 23 Dec 2019 18:33:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAvMTIvMjAxOSAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUn
cyBiZWVuIGVmZmVjdGl2ZWx5IG5vIHVzZSBvZiB0aGUgZmllbGQgZm9yIEhWTS4KPiAKPiBBbHNv
IHNocmluayB0aGUgZmllbGQgdG8gdW5zaWduZWQgaW50LCBldmVuIGlmIHRoaXMgZG9lc24ndCBp
bW1lZGlhdGVseQo+IHlpZWxkIGFueSBzcGFjZSBiZW5lZml0IGZvciB0aGUgc3RydWN0dXJlIGl0
c2VsZi4gVGhlIHJlc3VsdGluZyAzMi1iaXQKPiBwYWRkaW5nIHNsb3QgY2FuIGV2ZW50dWFsbHkg
YmUgdXNlZCBmb3Igc29tZSBvdGhlciBmaWVsZC4gVGhlIGNoYW5nZSBpbgo+IHNpemUgbWFrZXMg
YWNjZXNzZXMgc2xpZ2h0bHkgbW9yZSBlZmZpY2llbnQgdGhvdWdoLCBhcyBubyBSRVguVyBwcmVm
aXgKPiBpcyBnb2luZyB0byBiZSBuZWVkZWQgYW55bW9yZSBvbiB0aGUgcmVzcGVjdGl2ZSBpbnNu
cy4KPiAKPiBNaXJyb3IgdGhlIEhWTSBzaWRlIGNoYW5nZSBoZXJlIChkcm9wcGluZyBvZiBzZXR0
aW5nIHRoZSBmaWVsZCB0bwo+IFZHQ0Zfb25saW5lKSBhbHNvIHRvIEFybSwgb24gdGhlIGFzc3Vt
cHRpb24gdGhhdCBpdCB3YXMgY2xvbmVkIGxpa2UKPiB0aGlzIG9yaWdpbmFsbHkuIFZHQ0Zfb25s
aW5lIHJlYWxseSBzaG91bGQgc2ltcGx5IGFuZCBjb25zaXN0ZW50bHkgYmUKPiB0aGUgZ3Vlc3Qg
dmlldyBvZiB0aGUgaW52ZXJzZSBvZiBWUEZfZG93biwgYW5kIGhlbmNlIG5lZWRzIHJlcHJlc2Vu
dGluZwo+IG9ubHkgaW4gdGhlIGdldC9zZXQgdkNQVSBjb250ZXh0IGludGVyZmFjZXMuCgpCdXQg
dlBTQ0kgaXMganVzdCBhIHdyYXBwZXIgdG8gZ2V0L3NldCB2Q1BVIGNvbnRleHQgaW50ZXJmYWNl
cy4gWW91ciAKY2hhbmdlcyBiZWxvdyB3aWxsIGNsZWFybHkgYnJlYWsgYnJpbmctdXAgb2Ygc2Vj
b25kYXJ5IHZDUFVzIG9uIEFybS4KClRoaXMgaXMgYmVjYXVzZSBhcmNoX3NldF9ndWVzdF9pbmZv
KCkgd2lsbCByZWx5IG9uIHRoaXMgZmxhZyB0byAKY2xlYXIvc2V0IFZQRl9kb3duIGluIHRoZSBw
YXVzZSBmbGFncy4KClNvIEkgdGhpbmsgdGhlIGxpbmUgaW4gYXJtL3Zwc2NpLmMgc2hvdWxkIGJl
IGxlZnQgYWxvbmUuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBzY2kuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS92cHNjaS5jCj4gQEAgLTc4LDcgKzc4LDYgQEAgc3RhdGljIGludCBkb19jb21tb25fY3B1
X29uKHJlZ2lzdGVyX3QgdAo+ICAgICAgICAgICBjdHh0LT51c2VyX3JlZ3MueDAgPSBjb250ZXh0
X2lkOwo+ICAgICAgIH0KPiAgICNlbmRpZgo+IC0gICAgY3R4dC0+ZmxhZ3MgPSBWR0NGX29ubGlu
ZTsgPgo+ICAgICAgIGRvbWFpbl9sb2NrKGQpOwo+ICAgICAgIHJjID0gYXJjaF9zZXRfaW5mb19n
dWVzdCh2LCBjdHh0KTsKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
