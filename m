Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9BA12F7C3
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:50:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inLRK-0005KX-3X; Fri, 03 Jan 2020 11:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inLRI-0005KQ-6a
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:48:24 +0000
X-Inumbo-ID: ed2d906c-2e1e-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed2d906c-2e1e-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 11:48:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so42160686wro.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3KaEOU+S7K9cRp+AUCUhxC0wqjUAdWmz5oOspr73xW4=;
 b=bc6pJ8f+MekZ0trGQzSCzVy9S2IKcQj9WV7AedMbMrgp1uJ95417D6p+ukS5n91H/H
 BX87h3lSf3FEcknoIrg2ErLMPRwhkZjCFjwYaWwGPfzWvQE6r7tPhsEFZkIZFdAduGko
 8s/30uCXDid6X7WecvL0b9Fkkkr+VrDeiPsoyMZXBIef6WFSXP1VtUXoBFZ0XqNbfYD1
 fzkzcFi+sHIFdzjoXKrWruihwqcUv5AzfZ4cCfU5BdOLmMVfwDN+uK2qL8KuNvvAKxz+
 LhdoDqVo16/kunNMoLt9U8QD+12uiQ/cOqXq41IZgQE4w08cufsnQw/+nF4RsvYcMrKq
 A1kg==
X-Gm-Message-State: APjAAAXeJPjniEAwOD5uSGPJLPueHEOnqhc7JeigFnKggncCRkysKnNm
 anU3gPkgMg2L4Rn6yLeJtxI=
X-Google-Smtp-Source: APXvYqzh8FCocX3je+C2icF3RG7UWPZDdgFHOl0bRfQxkFR3NjdlGAqGD73cqZun2CD3Z+douDoYvQ==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr84652941wra.36.1578052094774; 
 Fri, 03 Jan 2020 03:48:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id s19sm11679637wmj.33.2020.01.03.03.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 03:48:14 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
 <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
 <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
 <5f56f48f-29d3-f5d4-479f-f1ebe5fcf47c@xen.org>
 <96678d3a-1b2f-9ff5-6b92-1ce1ae51e23b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <022e3f4e-3b59-5648-1147-eed045b90f81@xen.org>
Date: Fri, 3 Jan 2020 11:48:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <96678d3a-1b2f-9ff5-6b92-1ce1ae51e23b@suse.com>
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
 Julien Grall <julien.grall@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKVGhhbmsgeW91IGZvciB0aGUgaW5mb3JtYXRpb24uCgpPbiAwMy8wMS8yMDIwIDEx
OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMy4wMS4yMDIwIDEyOjE5LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+IEhvdyBkbyB5b3UgbWFuYWdlIHNlY29uZGFyeSBDUFVzIG9uIEhWTS9QVkgg
Z3Vlc3Q/Cj4gCj4gU2Vjb25kYXJ5IENQVXMgaGF2ZSBhcmNoaXRlY3R1cmFsIHN0YXRlIHRoZXkg
c3RhcnQgd2l0aCwgYW5kCj4gdGhlcmUncyB2ZXJ5IGxpdHRsZSBjb250cm9sIGFuIE9TIGhhcyBv
dmVyIGluaXRpYWwgcmVnaXN0ZXIKPiBzdGF0ZTogVGhlcmUncyBqdXN0IGFuIDgtYml0IHZhbHVl
IHNwZWNpZnlpbmcgKHBhcnQgb2YpIHRoZQo+IGFkZHJlc3MgdGhlIENQVSBzaG91bGQgc3RhcnQg
ZXhlY3V0aW5nIGZyb20uIEFsbCBvdGhlcgo+IHJlZ2lzdGVycyBnZXQgc2V0IHRvIGhhcmQgY29k
ZWQgdmFsdWVzLiBBbmQgdGhhdCA4LWJpdCB2YWx1ZQo+IGlzIHBhcnQgb2YgdGhlIElQSSBtZXNz
YWdlIHRoZSBwcmltYXJ5IENQVSBzZW5kcyB0byB0aGUgQVAKPiB0byBiZSBicm91Z2h0IHVwIChp
LmUuIHRoZXJlJ3Mgbm8gaHlwZXJjYWxsIGludm9sdmVkIGhlcmUpLgoKRG8geW91IGhhdmUgYW55
IHBvaW50ZXIgdG8gdGhpcyBjb2RlPyBDYW4gYSBDUFUgYmUgdHVybmVkIG9mZiBhZnRlcndhcmRz
IAphbmQgdGhlbiBib290IGFnYWluPwoKPiAKPiBGb3IgUFZILCBhIHZhcmlhbnQgb2YgdGhlIG5v
cm1hbCBQViBtb2RlbCBvZiBzdGFydGluZyB2Q1BVLXMKPiBnZXRzIHVzZWQsIGkuZS4gdmlhIFZD
UFVPUF9pbml0aWFsaXNlLgoKSW4gdGhlIGNhc2Ugb2YgUFNDSSwgSSB0aGluayBpdCBpcyBiZXR3
ZWVuIHRoZSB0d28uIFdlIGFyZSB1c2luZyBhIApnZW5lcmljIGh5cGVyY2FsbCwgeWV0IG1vc3Qg
b2YgdGhlIHN0YXRlIGlzIGZpeGVkLgoKQnV0IGFzIHRoZSBndWVzdCBPUyBtYXkgcnVuIGEgQ1BV
IGZvciBhIHdoaWxlLCB0dXJuaW5nIG9mZiBhbmQgdGhlbiBib290IAphZ2Fpbiwgd2UgbmVlZCB0
byBiZSBhYmxlIHRvIHNldCB0aGUgc3RhdGUgYWdhaW4uIEhlbmNlLCB0aGUgCmFyY2hfc2V0X2d1
ZXN0X2luZm8oKSBpcyBxdWl0ZSBjb252ZW5pZW50IHRvIHVzZSB0byByZXNldCB0aGUgQ1BVIHN0
YXRlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
