Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE212466A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:04:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihY1B-0004zA-6g; Wed, 18 Dec 2019 12:01:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EAfa=2I=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ihY19-0004z2-In
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:01:27 +0000
X-Inumbo-ID: 1e45c1b2-218e-11ea-9066-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e45c1b2-218e-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576670486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnTOVHuW87Jr/QF5nTyCZsFNBa9WxSkLxkS3rc7V324=;
 b=eVXDmNMqNrvB1pMGEleu/ZM7gl6DbJG69NoRRtu6zL1jsc47kChzu4ddPqaPSeshxUnfGI
 J3WbV933NQ0kI8OyQx6DmRQGmJ5jA7OzbhWSxJzPrK4D40vH37afYqWBnMz9kx0sRhmMeE
 IlS9S2INg1kAAEGNV+a5dLXIt3lQqTo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-Ylw55qynPym2rjhiS-sB9A-1; Wed, 18 Dec 2019 07:01:23 -0500
Received: by mail-wr1-f70.google.com with SMTP id f15so798290wrr.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 04:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vtprSGYHU4j197Ob5MFH6FDAhj99Ty+47OcaF4TZslQ=;
 b=EnRPO9sOLMxQPPWIGL1sJoTaOYyJO72JEIPTlsYcJR38xh6c/ZBUshhInmUMKvKHpn
 WYS/oe1k1f1MvKGHik8iMITfiybMENJBPrEK9qa2aM2VdC3lEmLN0OW4MK7Dxia/VYcf
 w3LMqR8rH+GFgQtiIpzppqEhhpHGJVreAKDpSJtyN2JIxqZEUcj7EnUAzoffwkokxm9M
 zPzaR+WujYoh8Fjjg09pb8MKK/fWN+mGi+dAfvmwgZtT+BYVY8zzcw/h5vidiyw0V/Gs
 HlNCLb1eLdkpBi8eFjIic5FentI2/0BkCs6zWTFVmZZD6Cpsjhad9C8N768ZpnfiJ4Bh
 5zZQ==
X-Gm-Message-State: APjAAAXgLfs2aJKi+Hb7IQ51t7EFMCSyWP+G98yIqp5t90b9cAjF0QW2
 kOlWrencNpxRyA/mc9wh9CMp3yY+hLzf4c4WNCJWUSkipSjrhdPu4oINinR5JY8YGZrn5T+Cfio
 7DfW8mYudVdy/H+IxMNgtnIPRTy8=
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr2402925wrx.145.1576670482296; 
 Wed, 18 Dec 2019 04:01:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzP+Fh3tnwzAq8B8UcmM2mVBYjuJtoDSV8sbDFanUFk2f/c6bgGmh1sUtNsOgYBEFE0wS3EXA==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr2402888wrx.145.1576670482076; 
 Wed, 18 Dec 2019 04:01:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ac09:bce1:1c26:264c?
 ([2001:b07:6468:f312:ac09:bce1:1c26:264c])
 by smtp.gmail.com with ESMTPSA id s8sm2242512wrt.57.2019.12.18.04.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:01:21 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-4-philmd@redhat.com>
 <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
 <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b629cd94-95e9-d351-6e80-23594c2b6245@redhat.com>
Date: Wed, 18 Dec 2019 13:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
Content-Language: en-US
X-MC-Unique: Ylw55qynPym2rjhiS-sB9A-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use
 size_t to iterate over ARRAY_SIZE()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMTkgMTI6NTcsIExhdXJlbnQgVml2aWVyIHdyb3RlOgo+IExlIDA5LzEyLzIwMTkg
w6AgMTE6MDUsIFRob21hcyBIdXRoIGEgw6ljcml0wqA6Cj4+IE9uIDA5LzEyLzIwMTkgMTAuNDks
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4gV2UgZG9uJ3QgZW5mb3JjZSB0aGUg
LVdzaWduLWNvbnZlcnNpb24gQ1BQRkxBRywgYnV0IGl0IGRvZXNuJ3QgaHVydAo+Pj4gdG8gYXZv
aWQgdGhpcyB3YXJuaW5nOgo+Pj4KPj4+ICAgd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBj
aGFuZ2VzIHNpZ25lZG5lc3M6ICdpbnQnIHRvICdzaXplX3QnIChha2EgJ3Vuc2lnbmVkIGxvbmcn
KSBbLVdzaWduLWNvbnZlcnNpb25dCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgaHcvcGNpLWhvc3Qv
aTQ0MGZ4LmMgfCA1ICsrLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMg
Yi9ody9wY2ktaG9zdC9pNDQwZnguYwo+Pj4gaW5kZXggZmJkYzU2MzU5OS4uMGNjODBiMjc2ZCAx
MDA2NDQKPj4+IC0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4+PiArKysgYi9ody9wY2ktaG9z
dC9pNDQwZnguYwo+Pj4gQEAgLTQxOSwxMiArNDE5LDExIEBAIG91dDoKPj4+ICBzdGF0aWMgdm9p
ZCBpZ2RfcHRfaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpwY2lfZGV2LCBFcnJvciAqKmVycnAp
Cj4+PiAgewo+Pj4gICAgICB1aW50MzJfdCB2YWwgPSAwOwo+Pj4gLSAgICBpbnQgaSwgbnVtOwo+
Pj4gKyAgICBzaXplX3QgaTsKPj4+ICAgICAgaW50IHBvcywgbGVuOwo+Pj4gICAgICBFcnJvciAq
bG9jYWxfZXJyID0gTlVMTDsKPj4+ICAKPj4+IC0gICAgbnVtID0gQVJSQVlfU0laRShpZ2RfaG9z
dF9icmlkZ2VfaW5mb3MpOwo+Pj4gLSAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPj4+
ICsgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaWdkX2hvc3RfYnJpZGdlX2luZm9zKTsg
aSsrKSB7Cj4+PiAgICAgICAgICBwb3MgPSBpZ2RfaG9zdF9icmlkZ2VfaW5mb3NbaV0ub2Zmc2V0
Owo+Pj4gICAgICAgICAgbGVuID0gaWdkX2hvc3RfYnJpZGdlX2luZm9zW2ldLmxlbjsKPj4+ICAg
ICAgICAgIGhvc3RfcGNpX2NvbmZpZ19yZWFkKHBvcywgbGVuLCAmdmFsLCAmbG9jYWxfZXJyKTsK
Pj4+Cj4+Cj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KPj4K
Pj4KPiAKPiBBcHBsaWVkIHRvIG15IHRyaXZpYWwtcGF0Y2hlcyBicmFuY2guCgpObyBuZWVkIHRv
LCBJJ3ZlIGFscmVhZHkgcXVldWVkIHRoZSB3aG9sZSBzZXJpZXMuCgpQYW9sbwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
