Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7FC38F5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFK21-0007rH-Rs; Tue, 01 Oct 2019 15:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYZ1=X2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iFK20-0007rC-13
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:25:40 +0000
X-Inumbo-ID: b8da964c-e45f-11e9-b588-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by localhost (Halon) with ESMTPS
 id b8da964c-e45f-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 15:25:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d1so13801071ljl.13
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Oau+8Ud/Xn5xQ1qeg28uhmXQ1ooczSFTyAgCvxQMkME=;
 b=K0pulDLnsIMS9ck6GUdtgDoSF00gKlLQVpBl8m6/6mWc/bR7ulkF6SjByCYZR4LNoG
 kc6bR+UGEd+IaXH8Nd4+2oLORiXlAEuWRa485jiYRD5CG7SeBmneNqP99DoY2BJMtpr/
 ssaPgcKCfoo4WivXkzc7NQkJo2b1XIivSpqdVTcSxYhh1i9ghsdQY+22wuw8kplLNGLJ
 +SokpPnMCQb4LbJWXyWbUhb2Z5L5OdYjJKLeX73d6su3/9XC6RqdYXugzl8gdepV03Wi
 Yi4WG9K9Yj940JKmxfLGHv67EyWp6MWmpCT9dJm3Ik/bb954iWr1ydxZJz5I7Ph0R4X5
 BGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Oau+8Ud/Xn5xQ1qeg28uhmXQ1ooczSFTyAgCvxQMkME=;
 b=K+itGbiUVkIbM5w1ByyxUjbXNf7xsoqFrSfPYM5IEw8xARtwXOMer/0Z+T0hURmPTz
 sCPefTT8k5v9zdT9Pdlm65vyT5JhPVfx5ncDQLkHsAjG6zSojSxTC0JUkqj8Vd6UV2H9
 Pi4dJCNwNmdVQNNvmZOIajJ9Hv2bZRvN43SEf/Gn59AvAqxsPUQGL7QgeTPEBNklvGHc
 1qU7300UGTzL5w7zCSuCugojtIwUVFIAAh0vxEpqhMjdwK/Jbmk+8rOGpBLJj/QuAjvW
 LoMr31pOd2Obj8EGAW2L0LrulLwumCrPuc9gVDzFx5PJ1UaY61QhlMdXU1KCKbTfbEfP
 SPNA==
X-Gm-Message-State: APjAAAXtSXPvHewtxQVU1CyI6pE+yw6/aD+x9aIb4VhAW4aCW3ft172m
 QGtz9iuamncDupavpvH9TuE=
X-Google-Smtp-Source: APXvYqyMq87S6+tXTnhcenv/0QiJ4e3V4wf39/WCsHIik9RrH7/9Qm+R69CC0ZHcCOOLQ8OxtqZikg==
X-Received: by 2002:a2e:96d8:: with SMTP id d24mr4954534ljj.138.1569943538057; 
 Tue, 01 Oct 2019 08:25:38 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m15sm4212505ljg.97.2019.10.01.08.25.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 08:25:37 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
Date: Tue, 1 Oct 2019 18:25:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjEwLjE5IDE4OjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gSSBhbSByZXZpdmluZyB0aGUgdGhyZWFkLiBJIHRoaW5rIHdlIG5lZWQgYSBwYXRjaCBz
aW1pbGFyIHRvIHRoaXMgb25lIAo+IGZvciBYZW4gNC4xMy4gVGhpcyBpcyBiZWNhdXNlIGdlbmVy
aWMgYXJlIG5vdyB1c2VkIGJ5IFhlbiBzbyB0aGV5IAo+IHNob3VsZCBiZSBoaWRkZW4gZnJvbSB0
aGUgaGFyZHdhcmUgZG9tYWluLgo+Cj4gQW5kcmlpLCBPbGVrc2FuZHIsIGNhbiBvbmUgb2YgeW91
IGxvb2sgYXQgaXQ/CgpJIHdpbGwgYmUgYWJsZSB0byBsb29rIGF0IGl0IHByb2JhYmx5IGF0IHRo
ZSBlbmQgb2YgdGhlIHdlZWsgaWYgdGhlcmUgaXMgCm5vIHVyZ2VuY3kuCgoKPgo+IENoZWVycywK
Pgo+IE9uIDIxLzAxLzIwMTkgMTc6MDQsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IEZyb206IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4KPj4g
V2UgZG9uJ3QgcGFzc3Rocm91Z2ggSU9NTVUgZGV2aWNlIHRvIERPTTAgZXZlbiBpZiBpdCBpcyBu
b3QgdXNlZCBieQo+PiBYZW4uIFRoZXJlZm9yZSBleHBvc2luZyB0aGUgcHJvcGVydGllcyB0aGF0
IGRlc2NyaWJlIHJlbGF0aW9uc2hpcAo+PiBiZXR3ZWVuIG1hc3RlciBkZXZpY2VzIGFuZCBJT01N
VXMgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UuCj4+Cj4+IEFjY29yZGluZyB0byB0aGU6Cj4+IDEu
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50eHQKPj4gMi4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2ktaW9tbXUudHh0Cj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMCArKysrKysr
KysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMKPj4gaW5kZXggZDJjNjNhOC4uMTVhMDhkNiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+
PiBAQCAtNTQwLDYgKzU0MCwxNiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVz
KHN0cnVjdCBkb21haW4gCj4+ICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4gwqAgK8KgwqDCoMKgwqDCoMKgIC8qIERvbid0IGV4cG9zZSBJT01NVSBzcGVjaWZpYyBwcm9w
ZXJ0aWVzIHRvIHRoZSBndWVzdCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBkdF9wcm9wZXJ0
eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdXMiKSApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGR0X3Byb3BlcnR5X25h
bWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1hcCIpICkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICggZHRfcHJvcGVydHlfbmFt
ZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwLW1hc2siKSApCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXMgPSBmZHRfcHJv
cGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFtZSwgcHJvcF9kYXRhLCAKPj4gcHJvcF9sZW4pOwo+
PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQo+Pgo+Ckp1bGllbiwgYXJlIHlvdSBo
YXBweSB0byBzZWUgdGhpcyBwYXRjaCBhcyBpcywgb3IgZG8geW91IGhhdmUgc29tZSAKY29tbWVu
dHMgcmVnYXJkaW5nIGl0PwoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
