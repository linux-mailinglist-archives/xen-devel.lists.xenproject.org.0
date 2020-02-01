Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7D14F7A8
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 12:48:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixrDG-0002tc-2s; Sat, 01 Feb 2020 11:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=48j7=3V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ixrDE-0002tW-NY
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 11:45:20 +0000
X-Inumbo-ID: 52730c4c-44e8-11ea-8396-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52730c4c-44e8-11ea-8396-bc764e2007e4;
 Sat, 01 Feb 2020 11:45:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so10830060wmj.5
 for <xen-devel@lists.xenproject.org>; Sat, 01 Feb 2020 03:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32vZbOSPY/PeyyvUbEtUvqQdP+0JQ6B4KZvZvFH4nRY=;
 b=IEyeYcSqEFvpBuRE/strdZsFOxAJNZ/QyhzpQggme1oYdWRPBshDe7Y+7rOF/m6PzK
 b/X61HvlMPRDsAeYpbYtucktRqtUVfS6ZQyrBPJOwqtu71kXNUfJU6oEHLNtJfneDO+g
 7QBlmQnbICz+lVViS2/8dWFtSYgmPcmJhkuXIOpFMN7Os4fJWyZB+m/0r7mBr7n2qDar
 JvFLWD8U3HEIPNbEnO0yEwWRRU6zsXe2+7LxHBoKME9ZZn3Nh0Dcw/FyAxYKW1Cbl0Nd
 JH7HTSyc/fcodEwWtGP/+Kv6cYaZsG3WQoe6QGNYaCtKZT3hN0lTgXjCIzQXj2WXH1b1
 FPdA==
X-Gm-Message-State: APjAAAVN37ak7HeXyeTKaZOg4jEgMkIoIfWjadz5Oj2dvw5bT9NouGrJ
 RSNaLav4RqtmoymFO6411RQIooJP1hg=
X-Google-Smtp-Source: APXvYqz1CZRlzeE7z9NTLF9vfV00tgRDJKk1C+qePe0tyhaLU3W61aPHezUAllTzDktfVHv4C4WB+A==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr17993223wme.30.1580557519037; 
 Sat, 01 Feb 2020 03:45:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id e17sm3151522wrn.62.2020.02.01.03.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Feb 2020 03:45:18 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20200131201046.44996-1-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3dc228b7-79a5-b91c-58ee-f13b238dfd86@xen.org>
Date: Sat, 1 Feb 2020 11:45:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131201046.44996-1-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Handle unimplemented VGICv3
 dist registers as RAZ/WI
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMS8wMS8yMDIwIDIwOjEwLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFBlciB0aGUg
QVJNIEdlbmVyaWMgSW50ZXJydXB0IENvbnRyb2xsZXIgQXJjaGl0ZWN0dXJlIFNwZWNpZmljYXRp
b24gKEFSTQo+IElISSAwMDY5RSksIHJlc2VydmVkIHJlZ2lzdGVycyBzaG91bGQgZ2VuZXJhbGx5
IGJlIHRyZWF0ZWQgYXMgUkFaL1dJLgo+IFRvIHNpbXBsaWZ5IHRoZSBWR0lDdjMgZGVzaWduIGFu
ZCBpbXByb3ZlIGd1ZXN0IGNvbXBhdGFiaWxpdHksIHRyZWF0IHRoZQoKVHlwbzogY29tcGF0aWJp
bGl0eQoKPiBkZWZhdWx0IGNhc2UgZm9yIEdJQ0QgcmVnaXN0ZXJzIGFzIHJlYWRfYXNfemVyby93
cml0ZV9pZ25vcmUuCgpJIHdvdWxkIHByZWZlciBpZiB3ZSB0cnkgdG8ga2VlcCB0aGUgZW11bGF0
aW9uIG9mIGFsbCB0aGUgcmVnaXN0ZXJzIHRoZSAKc2FtZSB3YXkuIEkuZSBpZiBHSUNEIGRlZmF1
bHQgY2FzZSBpcyBub3cgUkFaL1dJLCB0aGVuIGFsbCB0aGUgb3RoZXIgCnJlZ2lvbnMgKGUuZyBH
SUNSKSBzaG91bGQgZG8gdGhlIHNhbWUuCgpJIHdpbGwgbG9vayB0byB3cml0ZSBhIHBhdGNoIHNp
bWlsYXIgZm9yIEdJQ3YyIGFzIHdlbGwuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplZmYgS3ViYXNj
aWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJt
L3ZnaWMtdjMuYyB8IDEzICsrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92
Z2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4gaW5kZXggNDIyYjk0ZjkwMi4uOGQw
ODU2YWMzMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4gKysrIGIveGVu
L2FyY2gvYXJtL3ZnaWMtdjMuYwo+IEBAIC0xMjUwLDkgKzEyNTAsOSBAQCBzdGF0aWMgaW50IHZn
aWNfdjNfZGlzdHJfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywK
PiAgICAgICAgICAgIGdvdG8gcmVhZF9pbXBsX2RlZmluZWQ7Cj4gICAKPiAgICAgICBkZWZhdWx0
Ogo+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIiVwdjogdkdJQ0Q6IHVuaGFuZGxlZCBy
ZWFkIHIlZCBvZmZzZXQgJSMwOHhcbiIsCj4gLSAgICAgICAgICAgICAgIHYsIGRhYnQucmVnLCBn
aWNkX3JlZyk7Cj4gLSAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgLyogU2luY2UgcmVzZXJ2
ZWQgcmVnaXN0ZXJzIHNob3VsZCBiZSByZWFkLWFzLXplcm8sIG1ha2UgdGhpcyB0aGUKPiArICAg
ICAgICAgKiBkZWZhdWx0IGNhc2UgKi8KClRoaXMgY29tbWVudCBpcyBtaXNsZWFkaW5nIGJlY2F1
c2UgdGhlIGRlZmF1bHQgY2FzZSBkb2Vzbid0IG9ubHkgaGFuZGxlIApyZXNlcnZlZCByZWdpc3Rl
cnMuIEEgZ29vZCBleGFtcGxlIGlzIEdJQ0RfSUdSUE1PRFIgd2lsbCB1c2UgdGhlIGRlZmF1bHQg
CmxhYmVsLiBZZXQgaXQgaXMgbm90IGEgcmVzZXJ2ZWQgcmVnaXN0ZXJzLiBTb21lIG9mIHRoZSBy
ZXNlcnZlZCAKcmVnaXN0ZXJzIG1heSBhbHNvIGJlIGFsbG9jYXRlZCBpbiB0aGUgZnV0dXJlIChp
LmUgd2l0aCBHSUN2NCkuIFNvIEkgCndvdWxkIGRyb3AgdGhlIGNvbW1lbnQgaGVyZS4KCkkgd291
bGQgYWxzbyBsaWtlIHRvIGtlZXAgYSBwcmludCAoYXQgbGVhc3QgaW4gZGVidWcgYnVpbGQpIGFz
IGl0IGNvdWxkIApiZSBoZWxwZnVsIGZvciBhbiBPUyBkZXZlbG9wcGVyIChvciBldmVuIFhlbiBv
bmUpIHRvIGRldGVjdCBhbnkgcmVnaXN0ZXIgCndlIGltcGxlbWVudCBhcyBSQVovV0kgYnV0IHNo
b3VsZCBub3QuCgpBcyBhbiBhc2lkZSwgdGhlIGNvZGluZyBzdHlsZSBmb3IgbXVsdGktbGluZXMg
Y29tbWVudCBvbiBYZW4gaXM6CgovKgogICogRm9vCiAgKiBCYXIKICAqLwoKPiArICAgICAgICBn
b3RvIHJlYWRfYXNfemVybzsKPiAgICAgICB9Cj4gICAKPiAgIGJhZF93aWR0aDoKPiBAQCAtMTQz
NSwxMCArMTQzNSw5IEBAIHN0YXRpYyBpbnQgdmdpY192M19kaXN0cl9tbWlvX3dyaXRlKHN0cnVj
dCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywKPiAgICAgICAgICAgIGdvdG8gd3JpdGVfaW1w
bF9kZWZpbmVkOwo+ICAgCj4gICAgICAgZGVmYXVsdDoKPiAtICAgICAgICBwcmludGsoWEVOTE9H
X0dfRVJSCj4gLSAgICAgICAgICAgICAgICIlcHY6IHZHSUNEOiB1bmhhbmRsZWQgd3JpdGUgciVk
PSUiUFJJcmVnaXN0ZXIiIG9mZnNldCAlIzA4eFxuIiwKPiAtICAgICAgICAgICAgICAgdiwgZGFi
dC5yZWcsIHIsIGdpY2RfcmVnKTsKPiAtICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAvKiBT
aW5jZSByZXNlcnZlZCByZWdpc3RlcnMgc2hvdWxkIGJlIHdyaXRlLWlnbm9yZSwgbWFrZSB0aGlz
IHRoZQo+ICsgICAgICAgICAqIGRlZmF1bHQgY2FzZSAqLwo+ICsgICAgICAgIGdvdG8gd3JpdGVf
aWdub3JlOwoKU2FtZSBjb21tZW50cy4KCj4gICAgICAgfQo+ICAgCj4gICBiYWRfd2lkdGg6Cj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
