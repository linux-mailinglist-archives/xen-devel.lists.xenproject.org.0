Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C95134181
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:19:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAG3-00011J-Gk; Wed, 08 Jan 2020 12:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipAG2-00011E-7r
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:16:18 +0000
X-Inumbo-ID: a71552ae-3210-11ea-b263-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a71552ae-3210-11ea-b263-bc764e2007e4;
 Wed, 08 Jan 2020 12:16:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so2258611wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 04:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mky1kYA0Zn0Ry0cWUyxDRxc7+Xq53N5HLXVIWKTWAIY=;
 b=YcvJYZclqp3oXJn9uF+DXIZVALeOkHM2lA4+/TI1P7b+GjzjJ/+wQLT2bzY4JTZytM
 pBOR0FFO7JeDDBIap0PVZ4Mj/1zHWqjNs/f5ylUecZW+Vkcz6NEgFqj7JNR9JSCNcwnx
 IQbSDH6loMGDzjA6R2BaxONIBASmTGgRzjgmMYTXe492DMNeJl6sWmav5PsCAoSTKTHq
 FRwTC9CthHhwwvzsvOYMC9Q619nKxVfwEeAjJgNL5M9TEQ2HTmVjxWePWWw/iyIAN+IJ
 LR4FDr0snB2zMgEhKy2ssTt4h/VXelBeFw4UVhwejm3TC4J7tfY6ksImVxJQrftigMJX
 2fdw==
X-Gm-Message-State: APjAAAU5nhkHgix8JA/d6kBTxeaz52X18TZue3Z4cf4P90vBNhqvXqIZ
 zDFvBC1gmAkOHHJjEZH8weo=
X-Google-Smtp-Source: APXvYqwrImGCqawP9Lt8Ch33m6SdpsYn7yZWz0bIjm62rI/rx/hcaxhzApSodR2i7vWz7o1xlKN08Q==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr3567844wmm.97.1578485768878; 
 Wed, 08 Jan 2020 04:16:08 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id k8sm3980289wrl.3.2020.01.08.04.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:16:08 -0800 (PST)
Date: Wed, 8 Jan 2020 12:16:06 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200108121606.yr25b27mrnawu6um@debian>
References: <20200108110148.18988-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108110148.18988-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTI6MDE6NDhQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBjcHVfc21wYm9vdF9mcmVlKCkgcmVtb3ZlcyB0aGUgc3R1YnMgZm9yIHRoZSBjcHUg
Z29pbmcgb2ZmbGluZSwgYnV0IGl0Cj4gaXNuJ3QgY2xlYXJpbmcgdGhlIHJlbGF0ZWQgcGVyY3B1
IHZhcmlhYmxlcy4gVGhpcyB3aWxsIHJlc3VsdCBpbgo+IGNyYXNoZXMgd2hlbiBhIHN0dWIgcGFn
ZSBpcyByZWxlYXNlZCBkdWUgdG8gYWxsIHJlbGF0ZWQgY3B1cyBnb25lCj4gb2ZmbGluZSBhbmQg
b25lIG9mIHRob3NlIGNwdXMgZ29pbmcgb25saW5lIGxhdGVyLgo+IAo+IEZpeCB0aGF0IGJ5IGNs
ZWFyaW5nIHN0dWJzLmFkZHIgYW5kIHN0dWJzLm1mbiBpbiBvcmRlciB0byBhbGxvY2F0ZSBhCj4g
bmV3IHN0dWIgcGFnZSB3aGVuIG5lZWRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiBpbmRleCA3
ZTI5NzA0MDgwLi40NmMwNzI5MjE0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gQEAgLTk0NSw2ICs5NDUsOCBAQCBz
dGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsIGJvb2wgcmVtb3Zl
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChwZXJfY3B1KHN0dWJzLmFkZHIsIGNw
dSkgfCB+UEFHRV9NQVNLKSArIDEpOwo+ICAgICAgICAgIGlmICggaSA9PSBTVFVCU19QRVJfUEFH
RSApCj4gICAgICAgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKG1mbikpOwo+
ICsgICAgICAgIHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSA9IDA7Cj4gKyAgICAgICAgcGVyX2Nw
dShzdHVicy5tZm4sIGNwdSkgPSAwOwoKU2hvdWxkbid0IHRoZSBtZm4gYmUgc2V0IHRvIElOVkFM
SURfTUZOIGluc3RlYWQ/CgpXZWkuCgo+ICAgICAgfQo+ICAKPiAgICAgIEZSRUVfWEVOSEVBUF9Q
QUdFKHBlcl9jcHUoY29tcGF0X2dkdCwgY3B1KSk7Cj4gLS0gCj4gMi4xNi40Cj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
