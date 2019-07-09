Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822463A1B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 19:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hktp7-0004hR-Al; Tue, 09 Jul 2019 17:22:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hktp5-0004hM-Jf
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 17:22:35 +0000
X-Inumbo-ID: 23d26d98-a26e-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23d26d98-a26e-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 17:22:34 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k8so44940139iot.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kPBGyQYvKYn492m/WJ9n1GR/f9CtdLmulTHSYSnDzU=;
 b=FztsdDcKO4FcL6y7XlCAeAG3wOEDseUitcM7OpVO6Q9lYUd6tgkGTrf/iVhTMcnp9H
 Qk3hsnWJX7t+IT8awicz0l0V5gUwERTbDVf1KVIkZZng9iRzPF1X4iwzctE6ci3s93n3
 i5ca/K6fknPlJqNmciIGTHXYv7m8nBIzXgwb16/V9mySYnREt7lSY0e26+xgBbCvvHYo
 fjOSPFYc3bhweP9Z/hxWDBv84FXxSQ6//3awRgHUFl0kUES34xdegV4CGAsX2fbidcrZ
 BdRL/cFcwy4zcXE6mezYXhWGZun5JVkSsfNjbWrauP98ATX3fffXq9j5K1drvMAxc2lU
 Ovnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kPBGyQYvKYn492m/WJ9n1GR/f9CtdLmulTHSYSnDzU=;
 b=O6SRLNa7N7i1/SfFwAtkf4N8IB7sWMNeoO2l7st5d4v+n0NXPqXKicm+2L555I55BT
 M7+G1+d8mfvLZ0vL21t7IpoagMiKIsArVR5Fc6o4895k535VHuLJ79DZtMOyiMMaQyGK
 lgkpbxeEynb+M6Vpx8Sh/QhE+zgLgdCc+j/cnaTooVroEXUvwBe9yVyBtPcGHbez1sDD
 EzrWAxFnmbIx/FOthuBYn3ckIXDOJ35dzmnwz6Wb/lNsfT6qDAGyFqelrTnjTIH1Ii3F
 1w2foaS7wqNeFP4QVzL6erXwdunwadRY0Ttz0o2oK8EQaRrOPaiH3aUlU6d911T70TCY
 Ae6A==
X-Gm-Message-State: APjAAAWHNZuXqEZC6H7XmB/ZqsHnw4QuijffstGrZDYiCHjF7g2howVA
 25a1Dcc1LKHpmU0F0fIQXiwFpD9ihCbCy8VnOUw=
X-Google-Smtp-Source: APXvYqyLEIg3Z18WbbAR/AK6/cI2DVWwhj74a5mFtzuLx25wB4wIeMxUV+a41NiYzdEcP7FTGT2oN3FtEATGXm5CQU0=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr1755492jah.140.1562692953982; 
 Tue, 09 Jul 2019 10:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190709074903.8042-1-viktor.mitin.19@gmail.com>
 <9223e633-74b1-954b-3d46-e48e84f892a8@arm.com>
In-Reply-To: <9223e633-74b1-954b-3d46-e48e84f892a8@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Tue, 9 Jul 2019 20:22:22 +0300
Message-ID: <CAOcoXZZRnV44ZvVMZMTVtn96+7YPqbYyV63Voj-tMvvSpEf6GA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: change DomU memory property size
 from u64 to u32
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gVHVlLCBKdWwgOSwgMjAxOSBhdCAzOjI5IFBNIEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgVmlrdG9yLAo+Cj4gT24gNy85LzE5
IDg6NDkgQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiA+IFdoaWxlIGNoZWNraW5nIHhlbiBkb20w
bGVzcyBkb2N1bWVudGF0aW9uIGl0IGhhcyBiZWVuIGZvdW5kCj4gPiB0aGF0IGRvbVUgbWVtb3J5
IHByb3BlcnR5IHJlcXVpcmVzIGV4dHJhIDB4MCBpbiBjYXNlIG9mIGFybTY0Lgo+Cj4gQW5kIHRo
aXMgbWF0Y2hlcyB0aGUgYmluZGluZyBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0IHdoaWNoCj4gcmVxdWlyZXMgYSA2NC1iaXQgdmFsdWUuCj4KPiA+Cj4gPiBUaGVyZSBpcyBu
byBuZWVkIHRvIGtlZXAgbWVtb3J5IHNpemUgaW4gdTY0LCAzMiBiaXRzIGlzCj4gPiBlbm91Z2gg
Zm9yIGRvbVUgbWVtb3J5IHNpemUuCj4gRGVmaW5pdGVseSBub3QuIFRoZSBtZW1vcnkgaXMgZ2l2
ZW4gaW4gS0Igc28gMzItYml0cyBvbmx5IGFsbG93cyB0bwo+IGNvdmVyIDRUQi4gV2hpbGUgSSBh
Z3JlZSB0aGF0IG5vbmUgb2YgdGhlIERvbVUgY3JlYXRlZCBieSBYZW4gd2lsbCBiZQo+IGJpZ2dl
ciB0aGFuIGEgZmV3IGdpZ2FieXRlcyB0b2RheSwgdXNlciBleHBvc2VkIGludGVyZmFjZXMgc2hv
dWxkIGFsd2F5cwo+IGNhdGVyIGZvciB0aGUgZnV0dXJlLgo+Cj4gSW4gYW55IGNhc2UsIHRoZSBp
bnRlcmZhY2UgY2hhbmdlcyB5b3Ugc3VnZ2VzdCBpcyBnb2luZyB0byBicmVhayB1c2VyCj4gcHJv
cGVybHkgdXNpbmcgdGhlIGJpbmRpbmdzLgo+CgpZb3UgYXJlIHJpZ2h0LiBQbGVhc2UgaWdub3Jl
IHRoaXMgcGF0Y2guCkkgd2lsbCBhZGQgZXh0cmEgMHgwIHRvIGRvbTBsZXNzIGRvY3VtZW50YXRp
b24gaW5zdGVhZC4KClRoYW5rcwoKPiBSZWdhcmRzLAo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
