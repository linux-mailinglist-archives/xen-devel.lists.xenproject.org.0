Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB91716C5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 13:06:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Ht8-00057E-07; Thu, 27 Feb 2020 12:03:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONkH=4P=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7Ht6-000579-It
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 12:03:32 +0000
X-Inumbo-ID: 2beb6121-5959-11ea-9659-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2beb6121-5959-11ea-9659-12813bfff9fa;
 Thu, 27 Feb 2020 12:03:31 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v28so2912466edw.12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 04:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hD0jBBsthA1w8rbsaBmbl8HpOOmKofSY002fGX4jtP0=;
 b=ZDSzG7Ae9CtB2K5LwfzGBAqdVqw/2ihU6O3PWTTS7I4jplTgGC2GQt1nXm9mfQwXND
 VJZnSpXGTkOH1ivAbZ/QPDfM79FZYD6JdEXyR3x6aHto8aKZ+1mgmmleNTIqu14I0q/c
 I+UnbW5tvNS3TXUCRyi8MeSc1YXFWQFxJr7hK7KBJvB/oiGO1oEZHw7ZpNMvccsAAab5
 GtrQeJNrra/cBrA6Ivbt9TCUd7KHquDcyRjBVO8YdvAGfUDGsLGiWnGvAmisB/qJR0oi
 L1M49pKGsAAyfkqhtzRVPGwo5k/0HhNFmSj67JgnBA6JfxTffRwyToLgSdwNC8it0D1s
 eIMQ==
X-Gm-Message-State: APjAAAX2PfBU3l5kAMr0P4emqym7TftNH0NE254Z5WYu4D5EqfMB1Iv6
 pJPu7xyRf+QYmTqg7LSiv8c=
X-Google-Smtp-Source: APXvYqyMJok2Ii8dXXsmOFMqnTyYjfDNVRuLyeE1Bj9g/zxlB9KGUDF3gvOCMkLtM94ab/7eH/GXvg==
X-Received: by 2002:a17:906:8595:: with SMTP id
 v21mr3904884ejx.28.1582805011022; 
 Thu, 27 Feb 2020 04:03:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id q3sm254617eju.88.2020.02.27.04.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 04:03:29 -0800 (PST)
To: "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
 <d7db8364-e34b-4bf3-c166-70483e46eb97@xen.org>
 <8357a3c2b9aac84339465b5bf87ebc48cc85a558.camel@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b9d43de2-14c0-e9b6-8c9b-e43873b1dd67@xen.org>
Date: Thu, 27 Feb 2020 12:03:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8357a3c2b9aac84339465b5bf87ebc48cc85a558.camel@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: switch to new APIs in
 arch_init_memory
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDI3LzAyLzIwMjAgMTE6NTksIFhpYSwgSG9uZ3lhbiB3cm90ZToKPiBP
biBUaHUsIDIwMjAtMDItMjcgYXQgMTE6NTEgKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgSG9uZ3lhbiwKPj4KPj4gT24gMjcvMDIvMjAyMCAxMDoyNywgSG9uZ3lhbiBYaWEgd3JvdGU6
Cj4+PiAuLi4KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAo+
Pj4gYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAo+Pj4gaW5kZXggMzI2NjlhMzMzOS4u
YmZjM2JmNmFlYiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5o
Cj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAo+Pj4gQEAgLTcyLDQgKzcy
LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZAo+Pj4gdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGNv
bnN0IHZvaWQgKnZhKSB7fTsKPj4+ICAgIAo+Pj4gICAgI2VuZGlmIC8qICFDT05GSUdfRE9NQUlO
X1BBR0UgKi8KPj4+ICAgIAo+Pj4gKyNkZWZpbmUgVU5NQVBfRE9NQUlOX1BBR0UocCkgZG8geyAg
IFwKPj4+ICsgICAgaWYgKCBwICkgeyAgICAgICAgICAgICAgICAgICAgICBcCj4+PiArICAgICAg
ICB1bm1hcF9kb21haW5fcGFnZShwKTsgICAgICAgXAo+Pj4gKyAgICAgICAgKHApID0gTlVMTDsg
ICAgICAgICAgICAgICAgIFwKPj4+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4+PiArfSB3aGlsZSAoIGZhbHNlICkKPj4KPj4gRG8gd2UgbmVlZCB0byBrZWVwIHRoZSBk
byB7fSB3aGlsZSAoKT8KPiAKPiBJIHRoaW5rIHdlIGRvLiBGb3IgZXhhbXBsZToKPiAKPiBpZiAo
IGNvbmQgKQo+ICAgICAgVU5NQVBfRE9NQUlOX1BBR0UocCk7Cj4gZWxzZQo+ICAgICAgYmxhaF9i
bGFoX2JsYWgoKTsKPiAKPiBJZiB3ZSByZW1vdmUgdGhlIGRvLXdoaWxlLCB0aGUgZWxzZSBjbGF1
c2Ugd2lsbCBiZSBwYWlyZWQgd2l0aCB0aGUgaWYKPiBpbiBVTk1BUF9ET01BSU5fUEFHRSgpOwoK
R0NDIHdpbGwgYWN0dWFsbHkgdGhyb3cgYSBjb21waWxlciBlcnJvcjoKCnRlc3QuYzogSW4gZnVu
Y3Rpb24g4oCYZuKAmToKdGVzdC5jOjEzOjU6IGVycm9yOiDigJhlbHNl4oCZIHdpdGhvdXQgYSBw
cmV2aW91cyDigJhpZuKAmQogICAgICBlbHNlCiAgICAgIF5+fn4KCkFueXdheSwgeWVzIHdlIGRv
IG5lZWQgdG8ga2VlcCBkbyB3aGlsZSB7fSB0byBjYXRjaCBhbnkgdXNlIHdpdGhvdXQgdGhlIApz
ZW1pY29sb24uIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
