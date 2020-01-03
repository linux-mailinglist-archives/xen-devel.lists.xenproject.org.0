Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0612F6EF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:58:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKdL-0000ER-Qf; Fri, 03 Jan 2020 10:56:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inKdK-0000EM-GC
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:56:46 +0000
X-Inumbo-ID: ba971e7c-2e17-11ea-a445-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba971e7c-2e17-11ea-a445-12813bfff9fa;
 Fri, 03 Jan 2020 10:56:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m24so8027148wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 02:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yZXoSEAK/8Qb44KlOs54/TttDjvHbYiqVN7b4gu1Fbw=;
 b=BGgP2P84rABhYwMez7iOl6lYZStjd7X7wtKvkYt8M/Sjw9d5FqnkyNacWISxZ3dYtZ
 gc6wQP02CZfdXx4oAnuacAxuorm0Ij1ern33eq0ZltdG+eT3L7YwgjD+tmJc3Gs8cD6k
 uBapYRm2HA1XBE9jKAAPmcbiofVSo8pi1afaNUL4m7FW+cfuEqQaslEuXRYWHnynTkLJ
 I9RdmxHw8oWFOOPMiCPD+nXZEYn303cM7PHQtWF9rtWQAITihTIOLCofzgHzxrA1lHGC
 zFZz00inarKF9Y3hxneslvumzR9Y4YsrStqK7Zz4kMokYHx7fBeP6jKOxbDzlNZDU0ua
 tM3g==
X-Gm-Message-State: APjAAAVir7ZCjttzccP/DCW2slcqTLrk6a4wS8N0m9i32l/w0rIMS7iX
 mrFQkT3y2p0M+k8Eq1KVJy0=
X-Google-Smtp-Source: APXvYqwqMpE83U3MdTsm1L1NDBy5UqNBrvE/TfU6hy7eMCULQLEmc52j9kDXUYot41oLzZdTlkmDMQ==
X-Received: by 2002:a1c:49c2:: with SMTP id
 w185mr18405394wma.138.1578049003456; 
 Fri, 03 Jan 2020 02:56:43 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id t25sm11506503wmj.19.2020.01.03.02.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 02:56:42 -0800 (PST)
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@gmail.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
Date: Fri, 3 Jan 2020 10:56:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8xMi8yMDE5IDEyOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNy4xMi4y
MDE5IDEyOjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4gT24gRnJpLCAy
NyBEZWMgMjAxOSwgMDk6MjIgSmFuIEJldWxpY2gsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4+Cj4+PiBPbiAyMy4xMi4yMDE5IDE4OjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGkg
SmFuLAo+Pj4+Cj4+Pj4gT24gMjAvMTIvMjAxOSAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+IFRoZXJlJ3MgYmVlbiBlZmZlY3RpdmVseSBubyB1c2Ugb2YgdGhlIGZpZWxkIGZvciBIVk0u
Cj4+Pj4+Cj4+Pj4+IEFsc28gc2hyaW5rIHRoZSBmaWVsZCB0byB1bnNpZ25lZCBpbnQsIGV2ZW4g
aWYgdGhpcyBkb2Vzbid0IGltbWVkaWF0ZWx5Cj4+Pj4+IHlpZWxkIGFueSBzcGFjZSBiZW5lZml0
IGZvciB0aGUgc3RydWN0dXJlIGl0c2VsZi4gVGhlIHJlc3VsdGluZyAzMi1iaXQKPj4+Pj4gcGFk
ZGluZyBzbG90IGNhbiBldmVudHVhbGx5IGJlIHVzZWQgZm9yIHNvbWUgb3RoZXIgZmllbGQuIFRo
ZSBjaGFuZ2UgaW4KPj4+Pj4gc2l6ZSBtYWtlcyBhY2Nlc3NlcyBzbGlnaHRseSBtb3JlIGVmZmlj
aWVudCB0aG91Z2gsIGFzIG5vIFJFWC5XIHByZWZpeAo+Pj4+PiBpcyBnb2luZyB0byBiZSBuZWVk
ZWQgYW55bW9yZSBvbiB0aGUgcmVzcGVjdGl2ZSBpbnNucy4KPj4+Pj4KPj4+Pj4gTWlycm9yIHRo
ZSBIVk0gc2lkZSBjaGFuZ2UgaGVyZSAoZHJvcHBpbmcgb2Ygc2V0dGluZyB0aGUgZmllbGQgdG8K
Pj4+Pj4gVkdDRl9vbmxpbmUpIGFsc28gdG8gQXJtLCBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGl0
IHdhcyBjbG9uZWQgbGlrZQo+Pj4+PiB0aGlzIG9yaWdpbmFsbHkuIFZHQ0Zfb25saW5lIHJlYWxs
eSBzaG91bGQgc2ltcGx5IGFuZCBjb25zaXN0ZW50bHkgYmUKPj4+Pj4gdGhlIGd1ZXN0IHZpZXcg
b2YgdGhlIGludmVyc2Ugb2YgVlBGX2Rvd24sIGFuZCBoZW5jZSBuZWVkcyByZXByZXNlbnRpbmcK
Pj4+Pj4gb25seSBpbiB0aGUgZ2V0L3NldCB2Q1BVIGNvbnRleHQgaW50ZXJmYWNlcy4KPj4+Pgo+
Pj4+IEJ1dCB2UFNDSSBpcyBqdXN0IGEgd3JhcHBlciB0byBnZXQvc2V0IHZDUFUgY29udGV4dCBp
bnRlcmZhY2VzLiBZb3VyCj4+Pj4gY2hhbmdlcyBiZWxvdyB3aWxsIGNsZWFybHkgYnJlYWsgYnJp
bmctdXAgb2Ygc2Vjb25kYXJ5IHZDUFVzIG9uIEFybS4KPj4+Pgo+Pj4+IFRoaXMgaXMgYmVjYXVz
ZSBhcmNoX3NldF9ndWVzdF9pbmZvKCkgd2lsbCByZWx5IG9uIHRoaXMgZmxhZyB0bwo+Pj4+IGNs
ZWFyL3NldCBWUEZfZG93biBpbiB0aGUgcGF1c2UgZmxhZ3MuCj4+Pj4KPj4+PiBTbyBJIHRoaW5r
IHRoZSBsaW5lIGluIGFybS92cHNjaS5jIHNob3VsZCBiZSBsZWZ0IGFsb25lLgo+Pj4KPj4+IE9o
LCBJIHNlZSAtIEkgZGlkbid0IG5vdGljZSB0aGlzIChhYil1c2UgZGVzcGl0ZSAuLi4KPj4+Cj4+
Cj4+IE91dCBvZiBJbnRlcmVzdCwgd2h5IGRvIHlvdSB0aGluayBpdCBpcyBhbiBhYnVzZSBoZXJl
IGFuZCBub3QgaW4gdGhlCj4+IHRvb2xzdGFjaz8KPj4KPj4gSG93IGRvIHlvdSBzdWdnZXN0IHRv
IGltcHJvdmUgaXQ/IEkgY2FuIGFkZCBpdCBpbiBteSBpbXByb3ZlbWVudCBsaXN0IGZvcgo+PiBB
cm0uCj4gCj4gT2gsICJhYnVzZSIgd2FzIGFib3V0IHRoZSBhcmNoX3NldF9ndWVzdF9pbmZvKCkg
dXNlLCBub3QgdGhlIHVzZSBvZgo+IHRoZSBmbGFnIGJ5IHRoZSB0b29sIHN0YWNrLgoKSSBtYXkg
aGF2ZSByZWFkIGluY29ycmVjdGx5IHlvdXIgZS1tYWlsLCBhbHRob3VnaCBJIHRoaW5rIG15IHF1
ZXN0aW9ucyAKYWJvdXQgd2h5IHRoaXMgaXMgYW4gYWJ1c2UgYW5kIGhvdyBkbyB5b3Ugc3VnZ2Vz
dCB0byBpbXByb3ZlIGFyZSBzdGlsbCAKcmVsZXZhbnQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
