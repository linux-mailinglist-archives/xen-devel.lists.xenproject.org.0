Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3D12F714
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:21:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKyw-0002ZP-Nt; Fri, 03 Jan 2020 11:19:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inKyv-0002ZG-2I
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:19:05 +0000
X-Inumbo-ID: d9096128-2e1a-11ea-a44e-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9096128-2e1a-11ea-a44e-12813bfff9fa;
 Fri, 03 Jan 2020 11:19:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so42080396wrn.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sjnwm8Ur/cXJYvBaoPxpoEOMkZp7W/evcYXc96UKe0g=;
 b=MAwXLinK+EQS/zMJ818kCWsRcWir1kVH6aiAXmdygnp9NfGyQReN/jFPrNORa1mREa
 B6vYKyKPYS1dIlAFoMQ0F5mopWqYgYyLpBfzFxRhBWxHX5r5+VFWZ0tK9YD6eXQ0vVoZ
 K8qE6deprT7RP6TaM7CMQUoFkYpcDxxEdz7uoqdVUS1d9lNXgiZAVmBz+7rw07BFS3ZV
 88bUJvgP25ADh1xBue+w8ByFevBwWThNrTZT6TpNGeLaOaGHhRLRc+kLn2lPF61ABiKS
 rEEeEAH4PDmQ/WzRrw/dbypu0Lmev5FNa+6GaQBrP9syZGD1vbweiyzvQotVVnJpf1hN
 6fEw==
X-Gm-Message-State: APjAAAXLkj5evhiaKFVfrvLtFX/6F0gkkBY4Yz6m/akGWbWYBXllIGxp
 Sip6dlpuzhvKo9MBK1abiZk=
X-Google-Smtp-Source: APXvYqwzsyPXufMc0icc3ZCWqFDQMZpBrT/LIK5+8bf1gXC2lCusZdogEYw+tpVZrS+LmG+tmLx8iw==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr89377108wrw.193.1578050342949; 
 Fri, 03 Jan 2020 03:19:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id p18sm11793295wmg.4.2020.01.03.03.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 03:19:02 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@gmail.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
 <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
 <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f56f48f-29d3-f5d4-479f-f1ebe5fcf47c@xen.org>
Date: Fri, 3 Jan 2020 11:19:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
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

SGksCgpPbiAwMy8wMS8yMDIwIDExOjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMy4wMS4y
MDIwIDExOjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyNy8xMi8yMDE5
IDEyOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDI3LjEyLjIwMTkgMTI6MjcsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+PiBIaSBKYW4sCj4+Pj4KPj4+PiBPbiBGcmksIDI3IERlYyAyMDE5
LCAwOToyMiBKYW4gQmV1bGljaCwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pgo+Pj4+
PiBPbiAyMy4xMi4yMDE5IDE4OjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+PiBIaSBKYW4s
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAvMTIvMjAxOSAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4gVGhlcmUncyBiZWVuIGVmZmVjdGl2ZWx5IG5vIHVzZSBvZiB0aGUgZmllbGQgZm9yIEhW
TS4KPj4+Pj4+Pgo+Pj4+Pj4+IEFsc28gc2hyaW5rIHRoZSBmaWVsZCB0byB1bnNpZ25lZCBpbnQs
IGV2ZW4gaWYgdGhpcyBkb2Vzbid0IGltbWVkaWF0ZWx5Cj4+Pj4+Pj4geWllbGQgYW55IHNwYWNl
IGJlbmVmaXQgZm9yIHRoZSBzdHJ1Y3R1cmUgaXRzZWxmLiBUaGUgcmVzdWx0aW5nIDMyLWJpdAo+
Pj4+Pj4+IHBhZGRpbmcgc2xvdCBjYW4gZXZlbnR1YWxseSBiZSB1c2VkIGZvciBzb21lIG90aGVy
IGZpZWxkLiBUaGUgY2hhbmdlIGluCj4+Pj4+Pj4gc2l6ZSBtYWtlcyBhY2Nlc3NlcyBzbGlnaHRs
eSBtb3JlIGVmZmljaWVudCB0aG91Z2gsIGFzIG5vIFJFWC5XIHByZWZpeAo+Pj4+Pj4+IGlzIGdv
aW5nIHRvIGJlIG5lZWRlZCBhbnltb3JlIG9uIHRoZSByZXNwZWN0aXZlIGluc25zLgo+Pj4+Pj4+
Cj4+Pj4+Pj4gTWlycm9yIHRoZSBIVk0gc2lkZSBjaGFuZ2UgaGVyZSAoZHJvcHBpbmcgb2Ygc2V0
dGluZyB0aGUgZmllbGQgdG8KPj4+Pj4+PiBWR0NGX29ubGluZSkgYWxzbyB0byBBcm0sIG9uIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgaXQgd2FzIGNsb25lZCBsaWtlCj4+Pj4+Pj4gdGhpcyBvcmlnaW5h
bGx5LiBWR0NGX29ubGluZSByZWFsbHkgc2hvdWxkIHNpbXBseSBhbmQgY29uc2lzdGVudGx5IGJl
Cj4+Pj4+Pj4gdGhlIGd1ZXN0IHZpZXcgb2YgdGhlIGludmVyc2Ugb2YgVlBGX2Rvd24sIGFuZCBo
ZW5jZSBuZWVkcyByZXByZXNlbnRpbmcKPj4+Pj4+PiBvbmx5IGluIHRoZSBnZXQvc2V0IHZDUFUg
Y29udGV4dCBpbnRlcmZhY2VzLgo+Pj4+Pj4KPj4+Pj4+IEJ1dCB2UFNDSSBpcyBqdXN0IGEgd3Jh
cHBlciB0byBnZXQvc2V0IHZDUFUgY29udGV4dCBpbnRlcmZhY2VzLiBZb3VyCj4+Pj4+PiBjaGFu
Z2VzIGJlbG93IHdpbGwgY2xlYXJseSBicmVhayBicmluZy11cCBvZiBzZWNvbmRhcnkgdkNQVXMg
b24gQXJtLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgaXMgYmVjYXVzZSBhcmNoX3NldF9ndWVzdF9pbmZv
KCkgd2lsbCByZWx5IG9uIHRoaXMgZmxhZyB0bwo+Pj4+Pj4gY2xlYXIvc2V0IFZQRl9kb3duIGlu
IHRoZSBwYXVzZSBmbGFncy4KPj4+Pj4+Cj4+Pj4+PiBTbyBJIHRoaW5rIHRoZSBsaW5lIGluIGFy
bS92cHNjaS5jIHNob3VsZCBiZSBsZWZ0IGFsb25lLgo+Pj4+Pgo+Pj4+PiBPaCwgSSBzZWUgLSBJ
IGRpZG4ndCBub3RpY2UgdGhpcyAoYWIpdXNlIGRlc3BpdGUgLi4uCj4+Pj4+Cj4+Pj4KPj4+PiBP
dXQgb2YgSW50ZXJlc3QsIHdoeSBkbyB5b3UgdGhpbmsgaXQgaXMgYW4gYWJ1c2UgaGVyZSBhbmQg
bm90IGluIHRoZQo+Pj4+IHRvb2xzdGFjaz8KPj4+Pgo+Pj4+IEhvdyBkbyB5b3Ugc3VnZ2VzdCB0
byBpbXByb3ZlIGl0PyBJIGNhbiBhZGQgaXQgaW4gbXkgaW1wcm92ZW1lbnQgbGlzdCBmb3IKPj4+
PiBBcm0uCj4+Pgo+Pj4gT2gsICJhYnVzZSIgd2FzIGFib3V0IHRoZSBhcmNoX3NldF9ndWVzdF9p
bmZvKCkgdXNlLCBub3QgdGhlIHVzZSBvZgo+Pj4gdGhlIGZsYWcgYnkgdGhlIHRvb2wgc3RhY2su
Cj4+Cj4+IEkgbWF5IGhhdmUgcmVhZCBpbmNvcnJlY3RseSB5b3VyIGUtbWFpbCwgYWx0aG91Z2gg
SSB0aGluayBteSBxdWVzdGlvbnMKPj4gYWJvdXQgd2h5IHRoaXMgaXMgYW4gYWJ1c2UgYW5kIGhv
dyBkbyB5b3Ugc3VnZ2VzdCB0byBpbXByb3ZlIGFyZSBzdGlsbAo+PiByZWxldmFudC4KPiAKPiBh
cmNoX3NldF9pbmZvX2d1ZXN0KCkgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBmb3IgZXhhY3RseSBv
bmUgcHVycG9zZQo+IC0gdkNQVSBjb250ZXh0IGluaXRpYWxpemF0aW9uIHZpYSBoeXBlcmNhbGwu
IFdpdGggdGhpcywgYW5kIF93aXRob3V0Xwo+IG1lIGtub3dpbmcgYW55dGhpbmcgYWJvdXQgUFND
SSwgaXQgX2xvb2tzXyB0byBtZSB0byBiZSBhbiBhYnVzZS4gCgpQU0NJIChQb3dlciBTdGF0ZSBD
b29yZGluYXRpb24gSW50ZXJmYWNlKSBpcyBhIGdlbmVyaWMgd2F5IHRvIG1hbmFnZSB0aGUgCnBv
d2VyIG9uIHlvdXIgcGxhcmZvcm0gKGUuZyBDUFUgYnJpbmctdXApLgoKVGhlIENQVV9PTiBjYWxs
IHdpbGwgYWN0dWFsbHkgaW5pdGlhbGl6ZSB0aGUgdkNQVSBjb250ZXh0IGFuZCB0aGVuIHN0YXJ0
IAp0aGUgdkNQVS4KCldoaWxzdCwgdGhpcyBpcyBub3QgYSBYZW4gc3BlY2lmaWMgaW50ZXJmYWNl
LCB0aGV5IGFyZSBzdGlsbCBoeXBlcmNhbGwgCmJhc2VkLgoKPiBJJ2QKPiBleHBlY3QgdGhlcmUg
dG8gYmUgc29tZXRoaW5nIGluIHg4NiB0aGF0IGNvdWxkIGJlIHVzZWQgZm9yCj4gY29tcGFyaXNv
biwgYW5kIHdoYXRldmVyIHRoYXQgaXMgLSBpdCBkb2Vzbid0IG5lZWQgYSBzaW1pbGFyIGV4dHJh
Cj4gdXNlIG9mIGFyY2hfc2V0X2luZm9fZ3Vlc3QoKS4KCkhvdyBkbyB5b3UgbWFuYWdlIHNlY29u
ZGFyeSBDUFVzIG9uIEhWTS9QVkggZ3Vlc3Q/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
