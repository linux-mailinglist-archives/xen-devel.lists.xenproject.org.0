Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB76E65D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSue-0001v3-8H; Fri, 19 Jul 2019 13:27:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ucx3=VQ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hoSud-0001uv-4u
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:27:03 +0000
X-Inumbo-ID: e464e162-aa28-11e9-8980-bc764e045a96
Received: from mail-io1-xd29.google.com (unknown [2607:f8b0:4864:20::d29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e464e162-aa28-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:27:02 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id k8so58465984iot.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Db7gbbDJW4HWwmB7tpjnZ8VCTrjOhlE/lGG9VL9ra1g=;
 b=GojHp7pZNIZopoOappGLsD/O8KwTDJGidz1YJqrFvZHlImopAb86hUVIdvlyQULHu/
 q9+tUdsrW7s8VVBl+W9VCiGEpJDzJGbtMe2AH0vfad4C4qZX0qIjVq0yUf7nKHwL2/ZV
 HSAjUPzPyyDRivJAm+tu2NnHcWUC3wqMX9riAHCg/5hvGMHUYJfVs2qjqDFtWF5lTWOC
 5k5WiQeRcYKvCZBd3ChQYjgi3lpD0XfdLjvo6gR0CbC/Xh8YxERoNylKmej7+ISJFsru
 FblZxDtvbRkR/sM/t0qAdne0Unlkl8zZ6hAsFVH6CLkycocLRBdY0Xz3EY6XZuCbru/K
 NpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Db7gbbDJW4HWwmB7tpjnZ8VCTrjOhlE/lGG9VL9ra1g=;
 b=qndUcGTl/LrZcd1VBZ9p8yu3BOdpzHO+ParS8+DKrpg2FmfkvVoodgAE+x4GiZcUBR
 QGpyqpeZCkfMQ+BJYNRur/pVZ2msDhABOgsDuq5qDEpy8Fj53ckh/dGYbQyUg7EyqPtA
 37UYBnMHfMcbX775ofeGr+PPz8nO7Fffsi8B8TeUBYuImhdYDV5WF0bBZYACq/cCXRDd
 qep1Yeb70mdg3BYdOsZeldKgTyvIOkLWNTg8OQITlj/Nv84KjGyn2dE4tFm5OvEydmEw
 Xg+hKjxvWEF6/ZOXcBYVDPyle2kBvCKichz7Xe9eJ7sIIFGwLi4LejjqhOAoq3QmsTOM
 jeQg==
X-Gm-Message-State: APjAAAV3GWl2AbGrnJe7yztK5CCficmGr/0R3lTnrPxmpNwXcc+pMKBV
 VcDUIqKHXSKg/HKy2/rdYiS5h4M4waBcTQ==
X-Google-Smtp-Source: APXvYqyzjosijvmwmqzn+fC6jxEQTYMCyCpYCWwQXwCA46ypsVi5wgS6r0r0Be/qrwkCk+2ubqjAAg==
X-Received: by 2002:a5d:8411:: with SMTP id i17mr18805618ion.83.1563542821428; 
 Fri, 19 Jul 2019 06:27:01 -0700 (PDT)
Received: from [100.64.72.253] ([205.185.206.117])
 by smtp.gmail.com with ESMTPSA id k2sm25005467iom.50.2019.07.19.06.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 06:27:00 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <20190718144317.23307-1-tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 09:26:59 -0400
Message-Id: <1D8F3D58-5AAF-479F-978B-3E58CFBC7678@gmail.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Jeff.Kubascik@dornerworks.com, Tim Deegan <tim@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdWwgMTgsIDIwMTksIGF0IDEwOjQzLCBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+IHdyb3RlOgo+IAo+IFVzaW5nIGFzdHlsZSAoaHR0cDovL2FzdHlsZS5zb3VyY2Vm
b3JnZS5uZXQpIGNhbiBncmVhdGx5IHJlZHVjZSB0aGUgb3ZlcmhlYWQgb2YKPiBtYW51YWxseSBj
aGVja2luZyBhbmQgYXBwbHlpbmcgc3R5bGUtZml4ZXMgdG8gc291cmNlLWNvZGUuIFRoZSBpbmNs
dWRlZAo+IC5hc3R5bGVyYyBpcyB0aGUgY2xvc2VzdCBhcHByb3hpbWF0aW9uIG9mIHRoZSBlc3Rh
Ymxpc2hlZCBYZW4gc3R5bGUgKGluY2x1ZGluZwo+IHN0eWxlcyBub3QgZm9ybWFsbHkgc3BlbGxl
ZCBvdXQgYnkgQ09ESU5HX1NUWUxFIGJ1dCBjb21tb25seSByZXF1ZXN0ZWQpLgo+IAo+IENoZWNr
aW5nIHRoZSBjb21tZW50IHN0eWxlcyBhcmUgbm90IGluY2x1ZGVkIGluIHRoZSBhdXRvbWF0aW9u
Lgo+IAo+IEluY29ycG9yYXRpbmcgWGVuJ3MgZXhjZXB0aW9uIHRvIHRoZSBkby13aGlsZSBzdHls
ZSBpcyBvbmx5IHBhcnRpYWxseSBwb3NzaWJsZSwKPiB0aHVzIGEgY2hhbmdlIGlzIHByb3Bvc2Vk
IHRvIHRoZSBDT0RJTkdfU1RZTEUgb2YgbW92aW5nIHRoZSBicmFjZSBmcm9tICJkbyB7Igo+IHRv
IHRoZSBuZXh0IGxpbmUuCj4gCj4gTW9zdCBvZiBYZW4ncyBjb2RlLWJhc2UgaXMgbm9uLWNvbmZv
cm1pbmcgYXQgdGhlIG1vbWVudDogMjg5IGZpbGVzIHBhc3MKPiB1bmNoYW5nZWQsIDg3NiBoYXZl
IHNvbWUgc3R5bGUgaXNzdWVzLgo+IAo+IElkZWFsbHkgd2UgY2FuIHNsb3dseSBtaWdyYXRlIHRo
ZSBlbnRpcmUgY29kZS1iYXNlIHRvIGJlIGNvbmZvcm1pbmcsIHRodXMKPiBlbGltaW5hdGluZyB0
aGUgbmVlZCBvZiBkaXNjdXNzaW5nIGFuZCBlbmZvcmNpbmcgc3R5bGUgaXNzdWVzIG1hbnVhbGx5
IG9uIHRoZQo+IG1haWxpbmdsaXN0LgoKVGhhbmtzIGZvciB0YWtpbmcgdGhlIGxlYWQgb24gdGhp
cywgVGFtYXMuICBOZXcgWGVuIGNvbnRyaWJ1dG9ycyBhcmUgdW5saWtlbHkgdG8gYmUgYXdhcmUg
b2YgdGhlIHN0eWxlIGFtYmlndWl0aWVzIGRpc2N1c3NlZCBpbiB0aGlzIHRocmVhZC4gQSBmcmVx
dWVudCB0b3BpYyBvbiBYZW4gbW9udGhseSBjYWxscyBpcyB0aGUgbGFjayBvZiB0aW1lIHRvIHBl
cmZvcm0gcGF0Y2ggcmV2aWV3cy4gIEF1dG9tYXRlZCBzdHlsZSBjaGVja2luZyB3aWxsIGluY3Jl
YXNlIHRoZSBTL04gcmF0aW8gb2YgeGVuLWRldmVsLCByZXZpZXdlciBlZmZpY2llbmN5LCBwYXRj
aCBxdWFsaXR5IGZyb20gbmV3IGNvbnRyaWJ1dG9ycywgYW5kIHN0eWxlIGNvbnNpc3RlbmN5IGFj
cm9zcyBYZW4gdHJlZXMuICBUaGlzIGF1dG9tYXRpb24gd2lsbCBjb21wbGVtZW50IHVwY29taW5n
IHN0YXRpYyBhbmFseXNpcyBvZiBYZW4gZm9yIGZ1bmN0aW9uYWwgc2FmZXR5IGNvbXBsaWFuY2Uu
CgpSaWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
