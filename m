Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCE165EC7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lrC-0005N3-PW; Thu, 20 Feb 2020 13:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWA0=4I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4lrA-0005My-Rm
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:27:08 +0000
X-Inumbo-ID: b12b1cec-53e4-11ea-b0fd-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12b1cec-53e4-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 13:27:08 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v28so33681088edw.12
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2RAT2T2MlFwj6l2c6S1CK3Y5gWiKACkw/VOnye8qaUg=;
 b=hh8px2Io0SNoHixAjAViauxy37KNLxDpCVd0kG0hRKxaxZm7I96/yEXbxzAvjqKqgF
 6ehLkQFm7Rmd/u1n03TYyqVekZxSaWHpaOSLlB9bvn/XH/rL8pQlIvl2gCdG1mcpEkHe
 D1l1Tr5um+BeDvVgat7idlAHkESmf455X/MNE2U+bj69dPUBBj2Kcw2X8daQhwTje8fv
 m4aWoLN+jUF4Vn0/zsV4hf25g2uoPzbqe7m3Yr5WOK4AzxiWS7GZF6fKF68kv3F1wCOo
 CQoPWy/gKZHLCI7GfmkxLRy6UZ+zHwyglTpBYZI4jnOF9uipuQb8BMp495Pk//4dxvSi
 2hqA==
X-Gm-Message-State: APjAAAVzCvMOyHhCAY18qBXtNKL5V6NO5Lopc+Hho6l8sZsKF6XLz/Rn
 e2XY7op0ZhlrJRidwIv6DKz6YxAAionq6A==
X-Google-Smtp-Source: APXvYqwnBqDWPyM/2z1OkKcn7a57VDsv0tIlOf5sHOLtzazQyREu8IRXEE87S5robMfQ7j1OFjBvbQ==
X-Received: by 2002:a50:d849:: with SMTP id v9mr29265094edj.105.1582205227259; 
 Thu, 20 Feb 2020 05:27:07 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id ch1sm116974edb.64.2020.02.20.05.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:27:06 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c8b337fa-7535-68d3-3ebb-90cd97fdb0c4@xen.org>
Date: Thu, 20 Feb 2020 13:27:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <af374a90-f060-7239-5a02-c98df409819c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMi8yMDIwIDExOjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNy4wMi4y
MDIwIDE5OjA0LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IEBAIC00ODgsNyArNDg4LDggQEAgdm9p
ZCBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHN0cnVj
dCBkb21haW4gKmQsCj4+ICAgCj4+ICAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+PiAg
ICAgICBzbXBfd21iKCk7IC8qIGluc3RhbGwgdmFsaWQgZG9tYWluIHB0ciBiZWZvcmUgdXBkYXRp
bmcgcmVmY250LiAqLwo+PiAtICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVu
X2hlYXApID09IDApOwo+PiArICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVu
X2hlYXApID09IFBHQ19zdGF0ZV9pbnVzZSB8fAo+PiArICAgICAgICAgICAocGFnZS0+Y291bnRf
aW5mbyAmIH5QR0NfeGVuX2hlYXApID09IFBHQ19zdGF0ZV91bmluaXRpYWxpc2VkKTsKPiAKPiBD
YW4gdW5pbml0aWFsaXplZCBwYWdlcyByZWFsbHkgbWFrZSBpdCBoZXJlPwoKSUlSQywgYXJjaF9p
bml0X21lbW9yeSgpIHdpbGwgc2hhcmUgdGhlIGZpcnN0IDFNQiBvZiB0aGUgUkFNIGJ1dCB0aGV5
IAp3ZXJlIG5ldmVyIGdpdmVuIHRvIHRoZSBwYWdlIGFsbG9jYXRvci4KCjAxLDEwICsyMzE2LDEx
IEBAIGludCBhc3NpZ25fcGFnZXMoCj4+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDEgPDwgb3Jk
ZXIpOyBpKysgKQo+PiAgICAgICB7Cj4+ICAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIo
JnBnW2ldKSA9PSBOVUxMKTsKPj4gLSAgICAgICAgQVNTRVJUKCFwZ1tpXS5jb3VudF9pbmZvKTsK
Pj4gKyAgICAgICAgQVNTRVJUKHBnW2ldLmNvdW50X2luZm8gPT0gUEdDX3N0YXRlX2ludXNlIHx8
Cj4+ICsgICAgICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID09IFBHQ19zdGF0ZV91bmluaXRp
YWxpc2VkKTsKPiAKPiBTYW1lIHF1ZXN0aW9uIGhlcmU6IENhbiB1bmluaXRpYWxpemVkIHBhZ2Vz
IG1ha2UgaXQgaGVyZT8KClllcywgaW4gZG9tMF9jb25zdHJ1Y3RfcHYoKSB3aGVuIHRoZSBpbml0
cmQgaXMgYXNzaWduZWQgdG8gdGhlIGd1ZXN0LgoKPiBJZgo+IHNvLCB3b3VsZG4ndCBpdCBiZSBi
ZXR0ZXIgdG8gY29ycmVjdCB0aGlzLCByYXRoZXIgdGhhbiBoYXZpbmcKPiB0aGUgbW9yZSBwZXJt
aXNzaXZlIGFzc2VydGlvbj8KCldlIHdvdWxkIG5lZWQgdG8gcmV3b3JrIGluaXRfaGVhcF9wYWdl
cygpIChvciBjcmVhdGUgYSBuZXcgZnVuY3Rpb24pIHNvIAp0aGUgYWxsb2NhdG9yIGluaXRpYWxp
emUgdGhlIHN0YXRlIGJ1dCBpdCBpcyBtYXJrZWQgYXMgInJlc2VydmVkL3VzZWQiIApyYXRoZXIg
dGhhbiAiZnJlZWQiLgoKTW9zdCBsaWtlbHkgd2Ugd2lsbCBuZWVkIGEgc2ltaWxhciBmdW5jdGlv
biBmb3IgbGl2ZXVwZGF0ZS4gVGhpcyBpcwpiZWNhdXNlIHRoZSBwYWdlcyBiZWxvbmdpbmcgdG8g
Z3Vlc3RzIHNob3VsZCBiZSB1bnRvdWNoZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
