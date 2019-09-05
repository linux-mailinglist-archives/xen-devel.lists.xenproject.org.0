Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44167AAAA5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 20:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5w9P-0005P8-OF; Thu, 05 Sep 2019 18:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r/de=XA=gmail.com=konrad.r.wilk@srs-us1.protection.inumbo.net>)
 id 1i5w9N-0005Ou-CS
 for xen-devel@lists.xen.org; Thu, 05 Sep 2019 18:06:29 +0000
X-Inumbo-ID: e1c91a68-d007-11e9-b299-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c91a68-d007-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 18:06:28 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id f4so6105922ion.2
 for <xen-devel@lists.xen.org>; Thu, 05 Sep 2019 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O+optk3xZ+hPdHSwshMI4LrVQawxtvBCZjR/56UMsNE=;
 b=d+Mw38CQ7ZkEtcq2Q1Nf0MyU3XgPQI47bApbAsFpUkWq36Sey+QwnBu5KDfQwP85K9
 MYBCFMME/hE3NIWvbKoagNHJgNtG7ZSjsKjbWYjkf03UlBVt4bSYFOVjqE51UIY1eGqg
 KtPTmE1G8qE2IfVTEXSv4CH065N0+bMjQO3w2Bat4TA580r+tYmSaHuZSZGNrn9sDXoo
 eBkXv/M72t7ea7lbGjWbxDINjmydWialiLHO3Yu1+YgHQ2aOeS8/yzMOWaEp4w4uaNvR
 J8MnZQQfzA1lW10vmCTm/eXwDOuh68Lz7FGMFn/ynlom/3jRJ/qRnzjzo87banmRpsxm
 r+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=O+optk3xZ+hPdHSwshMI4LrVQawxtvBCZjR/56UMsNE=;
 b=et/8xcprNubNuIILjYliEYqV7NHJqA4w3ZKTbo1EBwlTG1F1xyNAJtXTwLVVdy44PT
 hBXsCX95LpkZsDtZFq1vSS//Xk/B2wSxC83CMOhoU9WKCnLoNl2LqMcj6ZR1eejJNDJ1
 yu93MGPZoUJidHwOcB16zhqwJweklTtRqqyNp9iit7HfoSkG6srHlNoQbmjJ38WkO7Od
 NbWLTwGtrEePn+I44/zAj6xUypm940K2liI/uAGlQdJpgtNoAUjEyXHvk7TSyEUk5AZL
 V64YFo9T/hiufkKzJXRGFUh9oGnJmxbvmI+iUkJTQWH9dtaCCiQzeyxXGlI4kTfVNe/T
 BZFA==
X-Gm-Message-State: APjAAAUEMYpOvvz5oMJ4e2xN4eg0LwKxZRfP378r3OQbqShbjuF1rbxs
 qQHF0w1C+Gqn/yBAjmLDQ+c=
X-Google-Smtp-Source: APXvYqx+sSGe6J8/M6LUDyunaof6rBApHpJ600kdcuo4ql7buXPE3j0+AvTdiyVp8xOJ5glYL65BpA==
X-Received: by 2002:a5e:8407:: with SMTP id h7mr5618736ioj.47.1567706787853;
 Thu, 05 Sep 2019 11:06:27 -0700 (PDT)
Received: from localhost-live.lan
 (209-6-36-129.s6527.c3-0.smr-cbr2.sbo-smr.ma.cable.rcncustomer.com.
 [209.6.36.129])
 by smtp.gmail.com with ESMTPSA id d9sm2961112ioo.15.2019.09.05.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 11:06:26 -0700 (PDT)
Date: Thu, 5 Sep 2019 14:05:53 -0400
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190905180553.GA21466@localhost-live.lan>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-9-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827084624.116917-9-wipawel@amazon.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MgYi9kb2NzL21pc2MvbGl2
ZXBhdGNoLnBhbmRvYwo+IGluZGV4IDZhYjdmNGMyZDIuLjkyYTQyNGU5MTggMTAwNjQ0Cj4gLS0t
IGEvZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MKPiArKysgYi9kb2NzL21pc2MvbGl2ZXBhdGNo
LnBhbmRvYwo+IEBAIC0zMDAsNiArMzAwLDcgQEAgd2hpY2ggZGVzY3JpYmUgdGhlIGZ1bmN0aW9u
cyB0byBiZSBwYXRjaGVkOgo+ICAgICAgICAgIC8qIEFkZGVkIHRvIGxpdmVwYXRjaCBwYXlsb2Fk
IHZlcnNpb24gMjogKi8KPiAgICAgICAgICB1aW50OF90IGFwcGxpZWQ7Cj4gICAgICAgICAgdWlu
dDhfdCBfcGFkWzddOwo+ICsgICAgICAgIGxpdmVwYXRjaF9leHBlY3RhdGlvbl90IGV4cGVjdDsK
PiAgICAgIH07Cj4gIAo+ICBUaGUgc2l6ZSBvZiB0aGUgc3RydWN0dXJlIGlzIDY0IGJ5dGVzIG9u
IDY0LWJpdCBoeXBlcnZpc29ycy4gSXQgd2lsbCBiZQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5eCkkgYWxzbyB1cGRhdGVkIHRoaXMgdG8gYmUgMTA0IGFuZCA5MiAoZm9yIDMyLWJp
dCkuCgpBbmQgYWRkZWQ6Cj4gQEAgLTMzNiw2ICszMzcsMjYgQEAgVGhlIHZlcnNpb24gMiBvZiB0
aGUgcGF5bG9hZCBhZGRzIHRoZSBmb2xsb3dpbmcgZmllbGRzIHRvIHRoZSBzdHJ1Y3R1cmU6Cj4g
ICAgKiBgYXBwbGllZGAgdHJhY2tzIGZ1bmN0aW9uJ3MgYXBwbGllZC9yZXZlcnRlZCBzdGF0ZS4g
SXQgaGFzIGEgYm9vbGVhbiB0eXBlCj4gICAgICBlaXRoZXIgTElWRVBBVENIX0ZVTkNfTk9UX0FQ
UExJRUQgb3IgTElWRVBBVENIX0ZVTkNfQVBQTElFRC4KPiAgICAqIGBfcGFkWzddYCBhZGRzIHBh
ZGRpbmcgdG8gYWxpZ24gdG8gOCBieXRlcy4KPiArICAqIGBleHBlY3RgIGlzIGFuIG9wdGlvbmFs
IHN0cnVjdHVyZSBjb250YWluaW5nIGV4cGVjdGVkIHRvLWJlLXJlcGxhY2VkIGRhdGEKPiArICAg
IChtb3N0bHkgZm9yIGlubGluZSBhc20gcGF0Y2hpbmcpLiBUaGUgYGV4cGVjdGAgc3RydWN0dXJl
IGZvcm1hdCBpczoKPiArCj4gKyAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2V4cGVjdGF0aW9uIHsKPiAr
ICAgICAgICB1aW50OF90IGVuYWJsZWQgOiAxOwo+ICsgICAgICAgIHVpbnQ4X3QgbGVuIDogNTsK
CnVpbnQ4X3QgcnN2IDogMjsKClRvIG1ha2UgaXQgY2xlYXIgd2hhdCB0aGUgZXh0cmEgdHdvIGJp
dHMgaW4gdGhlIGJpdC1maWVsZCBzaG91bGQgaGF2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
