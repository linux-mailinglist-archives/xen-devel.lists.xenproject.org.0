Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A121512F6D8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKRx-0007hF-FB; Fri, 03 Jan 2020 10:45:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inKRw-0007hA-4w
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:45:00 +0000
X-Inumbo-ID: 11af1342-2e16-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11af1342-2e16-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 10:44:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so41985234wrn.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 02:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cHxAHJG+kS97J+VNth3FzphnYrhU4eXrNtPusPGbF1A=;
 b=EJY59ozp45nEDBl49gQzKgbGXTydWGDZx87xs49TOpxOW8pVAiM2a6JGDY2XCwaCPC
 v7KTfWhGr+6lNLz/IxIx9ZtwcdbM/qNHiE38aZ9qEgOXgR537epVf461P4dUBhFf5kYf
 0z8XckiMgjAVq9vAudb/HnN4MurOJrBOBSkvJqxZtNr9OMR7SDDhYBfIuPDmdsf+7lkd
 4605t1ltiIQYOm9Cv9RPVzjEVdBGYcHsjhj6kcLqvPbOvbF3FpQCx9vtXUic9O9MFSO5
 2MxPFQjqwAHB+fBdCav7j4Uct+PCfO1fH66DgCB9E2gHGrEX/s19JwTXOEkG5mcPR5PP
 jlNw==
X-Gm-Message-State: APjAAAXAkTwvV2WhSCkmUUpZHZASNXMteojxCUjnaGacNW8/dX2joSWN
 tdFSKed/CPEovik/vkekqKE=
X-Google-Smtp-Source: APXvYqxM3aBr6r3WQppEXtL3LTbX8Uj5Dk+XBQ3DwRhP2V53lNo9jWb0qrzEIDzhwAfND14w9UGi8g==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr91804994wrc.203.1578048290498; 
 Fri, 03 Jan 2020 02:44:50 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id x11sm61887687wre.68.2020.01.03.02.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 02:44:49 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
 <ccafa7fc-5cd2-2d3f-a62f-0185ff8ca5e1@xen.org>
 <4fbaff27-eb58-481e-77d0-c6d948004ab0@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6039608a-d1e6-d164-7291-e0af5e65c30c@xen.org>
Date: Fri, 3 Jan 2020 10:44:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <4fbaff27-eb58-481e-77d0-c6d948004ab0@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDIvMDEvMjAyMCAxNzo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyMy8xMi8yMDE5IDE4OjIzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAx
Ny8xMi8yMDE5IDIxOjE1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4geGNfZG9tX3AybSgpIGFu
ZCBkb20tPnAybV9ob3N0W10gaW1wbGVtZW50IGEgbGluZWFyIHRyYW5zZm9ybSBmb3IKPj4+IHRy
YW5zbGF0ZWQKPj4+IGRvbWFpbnMsIGJ1dCB3YXN0ZSBhIHN1YnN0YW50aWFsIGNodW5rIG9mIFJB
TSBkb2luZyBzby4KPj4+Cj4+PiBBUk0gbGl0ZXJhbGx5IG5ldmVyIHJlYWRzIGRvbS0+cDJtX2hv
c3RbXSAoYmVjYXVzZSBvZiB0aGUKPj4+IHhjX2RvbV90cmFuc2xhdGVkKCkKPj4+IHNob3J0IGNp
cmN1aXQgaW4geGNfZG9tX3AybSgpKS7CoCBEcm9wIGl0IGFsbC4KPj4+Cj4+PiB4ODYgSFZNIGRv
ZXMgdXNlIGRvbS0+cDJtX2hvc3RbXSBmb3IKPj4+IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFw
X2V4YWN0KCkgY2FsbHMKPj4+IHdoZW4gcG9wdWxhdGluZyA0ayBwYWdlcy7CoCBSZXVzZSB0aGUg
c2FtZSB0YWN0aWMgZnJvbSAyTS8xRyByYW5nZXMKPj4+IGFuZCB1c2UgYW4KPj4+IG9uLXN0YWNr
IGFycmF5IGluc3RlYWQuwqAgRHJvcCB0aGUgbWVtb3J5IGFsbG9jYXRpb24uCj4+Pgo+Pj4geDg2
IFBWIGd1ZXN0cyBkbyB1c2UgZG9tLT5wMm1faG9zdFtdIGFzIGEgbm9uLWlkZW50aXR5IHRyYW5z
Zm9ybS4KPj4+IFJlbmFtZSB0aGUKPj4+IGZpZWxkIHRvIHB2X3AybSB0byBtYWtlIGl0IGNsZWFy
IGl0IGlzIFBWLW9ubHkuCj4+Cj4+IE5pY2UgY2xlYW51cCEgVGhpcyB3aWxsIHByb2JhYmx5IG1h
a2Ugc2xpZ2h0bHkgZmFzdGVyIGd1ZXN0IGJvb3QgOikuCj4+Cj4+PiBAQCAtMzU5LDcgKzM1Niw2
IEBAIHN0YXRpYyBpbnQgcG9wdWxhdGVfZ3Vlc3RfbWVtb3J5KHN0cnVjdAo+Pj4geGNfZG9tX2lt
YWdlICpkb20sCj4+PiAgwqAgc3RhdGljIGludCBtZW1pbml0KHN0cnVjdCB4Y19kb21faW1hZ2Ug
KmRvbSkKPj4+ICDCoCB7Cj4+PiAgwqDCoMKgwqDCoCBpbnQgaSwgcmM7Cj4+PiAtwqDCoMKgIHhl
bl9wZm5fdCBwZm47Cj4+PiAgwqDCoMKgwqDCoCB1aW50NjRfdCBtb2RiYXNlOwo+Pj4gIMKgIMKg
wqDCoMKgwqAgdWludDY0X3QgcmFtc2l6ZSA9ICh1aW50NjRfdClkb20tPnRvdGFsX3BhZ2VzIDw8
IFhDX1BBR0VfU0hJRlQ7Cj4+PiBAQCAtNDIzLDExICs0MTksNiBAQCBzdGF0aWMgaW50IG1lbWlu
aXQoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+Pj4gIMKgwqDCoMKgwqAgYXNzZXJ0KHJhbXNp
emUgPT0gMCk7IC8qIFRvbyBtdWNoIFJBTSBpcyByZWplY3RlZCBhYm92ZSAqLwo+Pj4gIMKgIMKg
wqDCoMKgwqAgZG9tLT5wMm1fc2l6ZSA9IHAybV9zaXplOwo+Pgo+PiBEbyB3ZSBuZWVkIHRvIGtl
ZXAgcDJtX3NpemU/Cj4gCj4gWWVzLCBJIHRoaW5rIHNvLgo+IAo+IFRoZXJlIGFyZSBzb21lIGNv
bW1vbiBjaGVja3Mgd2hpY2ggd291bGQgZmFpbCBpZiBpdCBiZWNvbWVzIDAsIGFuZAo+IGltcG9y
dGFudGx5LCBpdCBpcyB1c2VkIHRvIGxvY2F0ZSBzYWZlIGdmbnMgZm9yIHRlbXBvcmFyeSBwaHlz
bWFwIG1hcHBpbmdzLgoKRG8geW91IG1lYW4gdGhlIHNjcmF0Y2ggcGFnZT8gSWYgc28sIG9uIEFy
bSB3ZSB1c2UgYSBmaXggYWRkcmVzcyBpbiB0aGUgCm1lbW9yeSBtYXAgcmF0aGVyIHRoYW4gcDJt
X3NpemUuCgpJIGhhdmUgbG9va2VkIGF0IHRoZSB1c2FnZSBvZiB0aGUgcDJtX3NpemUgaW4gdGhl
IGNvbW1vbiBjb2RlIGFuZCBJIApkaWRuJ3Qgc3BvdCBhbnkgcGF0aCB0aGF0IGNhbiBiZSB1c2Vk
IGJ5IEFybSBhbmQgdXNpbmcgcDJtX3NpemUuCgpBbHNvLCBJIGRvbid0IHRoaW5rIHAybV9zaXpl
IGlzIGNhbGN1bGF0ZWQgY29ycmVjdGx5IG9uIEFybS4gSXQgb25seSAKZW5nbG9iZSB0aGUgUkFN
IGFuZCBkb2Vzbid0IHRha2UgaW50byBhY2NvdW50IHRoZSByZXN0IG9mIHRoZSBtYXBwaW5ncyAK
KGUuZyBNTUlPLi4uKS4gU28gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBjb3VsZCBiZSB1c2VkIGlu
IGNvbW1vbiBjb2RlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
