Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884861791AA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:46:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UKE-0007vv-2I; Wed, 04 Mar 2020 13:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nFHQ=4V=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j9UKC-0007vp-2O
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:44:36 +0000
X-Inumbo-ID: 4901fe6c-5e1e-11ea-b52f-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4901fe6c-5e1e-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583329475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1KhDTV6bVBYBYHnWDxWWNOY+j5WAiV2buvrkHO4Q18=;
 b=hKR/pg6aSaiulg+OYtWSs0T6OGAfrqVujCk+uuGFAlvAAh7mJ58wSTj8umnN1ypND1b39d
 rQjM2ZaWERTMdeAwRDZowOZWJxtmw4FEn0OtDUD8hY4eDPKboJdl/YjHchquCFebs+Xp5g
 Sjl/mo/N8r18qOIgk6pjikbu7MEy3iA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-D5J35vD8NbqH3hoprcmZMA-1; Wed, 04 Mar 2020 08:44:33 -0500
X-MC-Unique: D5J35vD8NbqH3hoprcmZMA-1
Received: by mail-wr1-f72.google.com with SMTP id x14so289341wrv.23
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 05:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwtpJISE4+PKDpLucCLSKmtD6ahPfpNV5KVXN5QcR7Q=;
 b=M7JBFyfUdMG2ZZVZJ0TODmoVFMCTs3iSovnoccDPdYxSRXB31jDzO7LIY9ltRHIvbc
 1+MfEeARKC0saRxCFYETaS77GUZLAoskOaRLBjvntWu2alxgzRcvNrGCBh4nSaK7g85r
 XMcbVe3Y2FmLZmRLlL3yWPPzFWKF4yoR4KMcsb8l+aQg9nli+/rcBm5kAL4ByhzAoZiF
 /vmV7JSzsQQKGB9LZ7qYpofa5oy/9yC1/NzmZGaaDANVyzjjFEhpE06kKtewAIr1xUV2
 XntjF+6gHp2u5dL1/efxtGbxILQOhHu1goz6Q7rYIU/7tzsvUlnO/yqzbzy5534bG6cR
 VXkw==
X-Gm-Message-State: ANhLgQ2o1FfydVZwAOx56+8M7nRaWp9K0ayyODv9xUxnxQSVvfaRwsbS
 7aCDod9QyKUyJp9y7wb4yVgbfup5Axp84OmQbDbJpB2eHf/oVTTz/McAda3nc/nckla+8/of7Vd
 /wI8Pi05xrHhjjQ8fI+MPVCZIQ5E=
X-Received: by 2002:a5d:6891:: with SMTP id h17mr4104441wru.259.1583329472403; 
 Wed, 04 Mar 2020 05:44:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt48cc8TTtIxgopyFld/NbXqNf525YLj9hGfthKiXB03jbieosY3tH7tKEB4JJ+vTQjVf6FYA==
X-Received: by 2002:a5d:6891:: with SMTP id h17mr4104420wru.259.1583329472179; 
 Wed, 04 Mar 2020 05:44:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id h20sm18051714wrc.47.2020.03.04.05.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:44:31 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
Date: Wed, 4 Mar 2020 14:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 1/2] misc: Replace zero-length arrays with
 flexible array member (automatic)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAgMTQ6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IAo+IGh3
L3Njc2kvc3BhcHJfdnNjc2kuYzo2OToyOTogZXJyb3I6IGZpZWxkICdpdScgd2l0aCB2YXJpYWJs
ZSBzaXplZCB0eXBlCj4gJ3VuaW9uIHZpb3NycF9pdScgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1
Y3Qgb3IgY2xhc3MgaXMgYSBHTlUgZXh0ZW5zaW9uCj4gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUt
c2l6ZWQtdHlwZS1ub3QtYXQtZW5kXQo+IMKgwqDCoCB1bmlvbiB2aW9zcnBfaXXCoMKgwqDCoMKg
wqDCoMKgIGl1Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBeCj4gCj4gWWF5IHdlIGZvdW5kIGEgYnVnISBUaGFua3MgR3VzdGF2byA6KQo+
IAo+IHVuaW9uIHNycF9pdSB7Cj4gwqDCoMKgIHN0cnVjdCBzcnBfbG9naW5fcmVxIGxvZ2luX3Jl
cTsKPiDCoMKgwqAgc3RydWN0IHNycF9sb2dpbl9yc3AgbG9naW5fcnNwOwo+IMKgwqDCoCBzdHJ1
Y3Qgc3JwX2xvZ2luX3JlaiBsb2dpbl9yZWo7Cj4gwqDCoMKgIHN0cnVjdCBzcnBfaV9sb2dvdXQg
aV9sb2dvdXQ7Cj4gwqDCoMKgIHN0cnVjdCBzcnBfdF9sb2dvdXQgdF9sb2dvdXQ7Cj4gwqDCoMKg
IHN0cnVjdCBzcnBfdHNrX21nbXQgdHNrX21nbXQ7Cj4gwqDCoMKgIHN0cnVjdCBzcnBfY21kIGNt
ZDsKPiDCoMKgwqAgc3RydWN0IHNycF9yc3AgcnNwOwo+IMKgwqDCoCB1aW50OF90IHJlc2VydmVk
W1NSUF9NQVhfSVVfTEVOXTsKPiB9OwoKSXQncyB2YXJpYWJsZS1zaXplZCBidXQgaXQncyBva2F5
IGFzIGxvbmcgYXMgdGhlIHRvdGFsIHNpemUgZG9lc24ndApleGNlZWQgU1JQX01BWF9JVV9MRU4u
ICBTbyBpdCdzIG5vdCBhIGJ1ZywgYnV0IEkgYWdyZWUgaXQncyBhIHRpbWUgYm9tYi4KIE1vdmlu
ZyB0aGUgZmllbGQgbGFzdCBzaG91bGQgd29yaywgYnV0IGl0IHdvdWxkIHN0aWxsIGJlIHF1aXRl
CmRhbmdlcm91cyBjb2RlLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
