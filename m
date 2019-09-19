Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB3B7813
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:00:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAu8R-0001Wp-2w; Thu, 19 Sep 2019 10:58:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAu8Q-0001Wk-4M
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:58:02 +0000
X-Inumbo-ID: 589a4e36-dacc-11e9-b299-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 589a4e36-dacc-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 10:58:01 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u3so2004450lfl.10
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jh0lH03BROR6msXJBity/kXe0GyZiSKBfOFq1Be3QF4=;
 b=qnVUMl2xr9eK31Z5HmYLJSljEcBOCih3A/1BcJYbDwDG3qj11C6xpXEV7OcVyedl2X
 p9J2ydFlU783MaET0IsZsHjNiu7+glGO09LBs1WRSGHdSMq6tblzOJjqJjU/rlwsdWrq
 D4CfWyIJbTD99ptt3or10kMR0Z4Co5L+dBe8OedmjBPgpQuMAyZbqDK8zZESlAw50Fef
 MAVl+d8Bv/ukqEedCErlCZoZRyXQ5QhQgXWh4mGlwWoJyuz+e7ZGzzz2GaDSVt1XQVcx
 FeNjKpa//YqE08trdGNqrDsSV5/f8iNYK8FN+edQCqqBSmvDLfngFf4vlgRYlw/nZrFS
 wiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jh0lH03BROR6msXJBity/kXe0GyZiSKBfOFq1Be3QF4=;
 b=tWu6uLHR/4YLv5aXn06GLD0aqmdI23eYMaYbX7ja/N9pOcB1ggeZo0Hhxi9e5HND9p
 JclUc7G/6LH2D0XKkBD5gYnnxTiUMTjvO2NQTm0yipabMrBVZmWRDEIUV6u50LcbVopv
 lbfEM76TEwZ2FSqA7HkJJ/cB+hFN3+lkhjcTXko9odAVGF8WD616/dW/b7DcRIONwJIl
 Qfk8SZwmxhbR3RZTRAV6ho7jKKRpQ5Kim4I0SG/8VvMxqNjtTz2xJPX76YMVchovUHBf
 2Q2aMLmCC3i3ot8HKP8+V33kAOHY4pxEIaKkfwxN/GJTIGtpqV/FeNgXw8ccMrorOpeZ
 GHww==
X-Gm-Message-State: APjAAAWBXXVLod2aOSbA6IEhQubzzFZqe1U1b9dIu5PtrUs5mEpjh/UR
 ElBr5Kt7QyABSydolNn4Iu2I/xJ1Xhg=
X-Google-Smtp-Source: APXvYqz9Xcso8wM1naoX/sTtVHPpaGZx4wXICkDnavqNjohxclo5aQYrUFCGYJJ2T1xfXHKNQuU3dQ==
X-Received: by 2002:a19:3805:: with SMTP id f5mr4616267lfa.173.1568890680017; 
 Thu, 19 Sep 2019 03:58:00 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id j28sm1498734lfh.57.2019.09.19.03.57.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 03:57:59 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
 <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
 <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
 <69614adc-d2fb-ea4f-7659-3f65e40116a3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f17ed0cd-5401-e3d6-86a7-7067edaeec39@gmail.com>
Date: Thu, 19 Sep 2019 13:57:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <69614adc-d2fb-ea4f-7659-3f65e40116a3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBhbGwuCgoKPj4+Pj4+PiArc3RydWN0IGlvbW11X2Z3c3BlYyB7Cj4+Pj4+Pj4gK8KgwqDC
oCAvKiB0aGlzIGRldmljZSdzIElPTU1VICovCj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICppb21tdV9kZXY7Cj4+Pj4+Pj4gK8KgwqDCoCAvKiBJT01NVSBkcml2ZXIgcHJpdmF0ZSBkYXRh
IGZvciB0aGlzIGRldmljZSAqLwo+Pj4+Pj4+ICvCoMKgwqAgdm9pZCAqaW9tbXVfcHJpdjsKPj4+
Pj4+PiArwqDCoMKgIC8qIG51bWJlciBvZiBhc3NvY2lhdGVkIGRldmljZSBJRHMgKi8KPj4+Pj4+
PiArwqDCoMKgIHVuc2lnbmVkIGludCBudW1faWRzOwo+Pj4+Pj4+ICvCoMKgwqAgLyogSURzIHdo
aWNoIHRoaXMgZGV2aWNlIG1heSBwcmVzZW50IHRvIHRoZSBJT01NVSAqLwo+Pj4+Pj4+ICvCoMKg
wqAgdWludDMyX3QgaWRzWzFdOwo+Pj4+Pj4+ICt9Owo+Pj4+Pj4gTm90ZSB0aGF0IHlvdSBhYnVz
ZSB4cmVhbGxvY19mbGV4X3N0cnVjdCgpIHdoZW4gdXNpbmcgaXQgd2l0aCBzdWNoCj4+Pj4+PiBh
IHR5cGU6IFRoZSBsYXN0IGZpZWxkIGlzIF9ub3RfIGEgZmxleGlibGUgYXJyYXkgbWVtYmVyLiBD
b21waWxlcnMKPj4+Pj4+IG1pZ2h0IGxlZ2l0aW1hdGVseSB3YXJuIGlmIHRoZXkgY2FuIHByb3Zl
IHRoYXQgeW91IGFjY2Vzcwo+Pj4+Pj4gcC0+aWRzWzFdIGFueXdoZXJlLCBkZXNwaXRlIHlvdSAo
cHJlc3VtYWJseSkgaGF2aW5nIGFsbG9jYXRlZCBlbm91Z2gKPj4+Pj4+IHNwYWNlLiAoSSBoYXZl
bid0IGJlZW4gYWJsZSB0byB0aGluayBvZiBhIHdheSBmb3IgdGhlIG1hY3JvIHRvCj4+Pj4+PiBh
Y3R1YWxseSBkZXRlY3QgYW5kIGhlbmNlIHJlZnVzZSBzdWNoIHdyb25nIHVzZXMuKQo+Pj4+PiBJ
bmRlZWQsIHlvdSBhcmUgcmlnaHQuIEkgYW0gaW4gZG91YnQsIHdoZXRoZXIgdG8gcmV0YWluIHBv
cnRlZCBmcm9tCj4+Pj4+IExpbnV4IGNvZGUgKGlkc1sxXSkKPj4+Pj4KPj4+Pj4gYW5kIG1lbnRp
b24gYWJvdXQgc3VjaCBhYnVzZSBvciBjaGFuZ2UgaXQgdG8gZGVhbCB3aXRoIHJlYWwgZmxleGli
bGUKPj4+Pj4gYXJyYXkgbWVtYmVyIChpZHNbXSkuIEFueSB0aG91Z2h0cz8KPj4+PiBJJ20gb2Yg
dGhlIHN0cm9uZyBvcGluaW9uIHRoYXQgeW91IHNob3VsZCBzd2l0Y2ggdG8gW10gKG9yIGF0Cj4+
Pj4gbGVhc3QgWzBdKSBub3RhdGlvbi4KPj4+IEkgZ290IGl0LiBXZWxsLCB3aWxsIHN3aXRjaCB0
byBpZHNbXSBpZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucy4KPj4gSSBzdXNwZWN0IHRoZSByYXRp
b25hbGUgdG8gdXNlIDEgcmF0aGVyIHRoYW4gMCBpcyB0byBhdm9pZCB0aGUgcmUtYWxsb2NhdGlv
biBpbgo+PiB0aGUgY29tbW9uIGNhc2Ugd2hlcmUgYSBkZXZpY2UgaGFzIGEgc2luZ2xlIElELgo+
Pgo+PiBJIHdvdWxkIGxpa2UgdG8gcmV0YWluIHRoZSBzaW1pbGFyIGJlaGF2aW9yLiBUaGUgaWRz
WzFdIGlzIHByb2JhYmx5IHRoZSBtb3N0Cj4+IHByZXR0eSB3YXkgdG8gZG8gaXQuCj4+Cj4+IEFu
b3RoZXIgc29sdXRpb24gd291bGQgdG8gdXNlIHhtYWxsb2NfYnl0ZXMoKSBmb3IgdGhlIGluaXRp
YWwgYWxsb2NhdGlvbiBvZgo+PiB4bWFsbG9jX2J5dGVzKCkuCj4gV2h5IG5vdCB1c2UgeG1hbGxv
Y19mbGV4Xzx3aGF0ZXZlcj4oKSBvbiB0aGUgZmlyc3QgYWxsb2NhdGlvbiwgdG9vPwpIbW0sIHdo
eSBub3Q/IExvb2tzIGxpa2UgdGhlIHhtYWxsb2NfZmxleF9zdHJ1Y3QgZml0cyBoZXJlLgoKVGhl
IGZpcnN0IGFsbG9jYXRpb24gd291bGQgYmU6Cgpmd3NwZWMgPSB4bWFsbG9jX2ZsZXhfc3RydWN0
KHN0cnVjdCBpb21tdV9md3NwZWMswqAgaWRzLCAxKTsKCgpUaGUgcmUtYWxsb2NhdGlvbiBmb3Ig
dGhlIGRldmljZXMgd2l0aCBzaW5nbGUgSUQgd291bGQgZG8gZWZmZWN0aXZlbHkgCm5vdGhpbmcg
KGFzc3VtaW5nIHRoYXQgX3hyZWFsbG9jIHdpbGwgcmVjb2duaXplIHRoYXQgc2l6ZSBpcyB0aGUg
c2FtZSk6Cgpmd3NwZWMgPSB4cmVhbGxvY19mbGV4X3N0cnVjdChmd3NwZWMsIGlkcywgZndzcGVj
LT5udW1faWRzICsgbnVtX2lkcyk7CgoKSnVsaWVuLCB3aGF0IGRvIHlvdSB0aGluaz8KCgotLSAK
UmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
