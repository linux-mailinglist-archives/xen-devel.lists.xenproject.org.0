Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E1179C75
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 00:28:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9dOA-0002T1-9r; Wed, 04 Mar 2020 23:25:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gER/=4V=redhat.com=mcroce@srs-us1.protection.inumbo.net>)
 id 1j9dO8-0002Sw-4w
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 23:25:16 +0000
X-Inumbo-ID: 670b6c76-5e6f-11ea-a4d9-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 670b6c76-5e6f-11ea-a4d9-12813bfff9fa;
 Wed, 04 Mar 2020 23:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583364315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kINxwd1M5ISm+eKGguIdVf+iBkibSVPYpAF7V50yuvE=;
 b=hdBFO/oEOTQ5qt78t3YrJGktO+Hwqb/UYQFJWGzeioGIaK9n+2HxZJoE1Wpg/nNeD7IEEz
 Mh7WK+3xdD0hVIxftVImkKkQRyDSre8XgEeFzAXV4bJoD2tVaByNdzm4T2A+kmm9raFrvJ
 O2ikNdRvPLRahxOAe5Q1nw1IQkqUMYc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-elVcLLRaORexUSZXM9mYJA-1; Wed, 04 Mar 2020 18:25:13 -0500
X-MC-Unique: elVcLLRaORexUSZXM9mYJA-1
Received: by mail-ed1-f72.google.com with SMTP id g11so2828223edu.10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 15:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8juafuY9nBxbQdXTOkQQGLh3mRvbcDsJuPyMUd6LN0=;
 b=Z53b3UPA7yJYQEjbX94GzMNfPsVDu0hPpEHl+A1lXO2sGUH5Yu1VMKYqR2WQhoYAgI
 Nwk+KH33a/Gq2NU1G5ovPlwPCnD9m3In07zLcZbvX8ZHqPer1UM07j8fGoeBK8UGU8Dv
 vDAlMyYRzqFmrm/qZIECwVlkOYmda2pFplRNoxqP3TCEdaN8RpWwmxoArQSrkcB97iCI
 s4d37YxpmEmUCXmAuKKSjCKhvcOytkh4uXB2MwBpPVTakCjqcJKg8HLtAomLFaMjYt7p
 gX9Kgz9riflubP+WvBfqPDS4cT8yVOu/euWVHQtldwGHYqpTpsH8QrvCuF2CWvnd66HF
 G/Gw==
X-Gm-Message-State: ANhLgQ3fZSiYKTNA4/0R89SASdJXX2UOJ5MKMaRKeAJZpfncPzA1spC+
 vIRo/ySU023CsbLGBY+dtF7q/7GRrBcaO1IQhp9RWygMT8ffrGKwsl6uIOxVhMPTJKTyiMk7LPK
 B1vShj1ptUX8TKgpu4wNx/k/phFxojbQoiaSc90WGq7c=
X-Received: by 2002:aa7:cac4:: with SMTP id l4mr5308680edt.367.1583364311868; 
 Wed, 04 Mar 2020 15:25:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtRn9VC83shY8XHTDzRhsN1U3qcWCfB7uMojQH5bbSmIYgKzcRcKNB9bk5ZyS5m8JegYhUQLyH/6undXUq6ODg=
X-Received: by 2002:aa7:cac4:: with SMTP id l4mr5308663edt.367.1583364311594; 
 Wed, 04 Mar 2020 15:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20200223165724.23816-1-mcroce@redhat.com>
 <CAPcyv4ijKqVhHixsp42kZL4p7uReJ67p3XoPyw5ojM-ZsOOUOg@mail.gmail.com>
In-Reply-To: <CAPcyv4ijKqVhHixsp42kZL4p7uReJ67p3XoPyw5ojM-ZsOOUOg@mail.gmail.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Thu, 5 Mar 2020 00:24:35 +0100
Message-ID: <CAGnkfhxAHctB9MHD0LzSk8uh4tEoF-hw+iwYAEdfeY_=g3NT2A@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
 linux-nfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgNCwgMjAyMCBhdCA5OjU3IFBNIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlh
bXNAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgRmViIDIzLCAyMDIwIGF0IDk6MDQgQU0g
TWF0dGVvIENyb2NlIDxtY3JvY2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIG1hY3Jv
cyBQQUdFX1NFQ1RPUlMsIFBBR0VfU0VDVE9SU19TSElGVCBhbmQgU0VDVE9SX01BU0sgYXJlIGRl
ZmluZWQKPiA+IHNldmVyYWwgdGltZXMgaW4gZGlmZmVyZW50IGZsYXZvdXJzIGFjcm9zcyB0aGUg
d2hvbGUgdHJlZS4KPiA+IERlZmluZSB0aGVtIGp1c3Qgb25jZSBpbiBhIGNvbW1vbiBoZWFkZXIu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGVvIENyb2NlIDxtY3JvY2VAcmVkaGF0LmNvbT4K
PiA+IC0tLQo+ID4gIGJsb2NrL2Jsay1saWIuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+
ICBkcml2ZXJzL2Jsb2NrL2JyZC5jICAgICAgICAgICAgICB8ICAzIC0tLQo+ID4gIGRyaXZlcnMv
YmxvY2svbnVsbF9ibGtfbWFpbi5jICAgIHwgIDQgLS0tLQo+ID4gIGRyaXZlcnMvYmxvY2svenJh
bS96cmFtX2Rydi5jICAgIHwgIDggKysrKy0tLS0KPiA+ICBkcml2ZXJzL2Jsb2NrL3pyYW0venJh
bV9kcnYuaCAgICB8ICAyIC0tCj4gPiAgZHJpdmVycy9kYXgvc3VwZXIuYyAgICAgICAgICAgICAg
fCAgMiArLQo+Cj4gRm9yIHRoZSBkYXggY2hhbmdlOgo+Cj4gQWNrZWQtYnk6IERhbiBXaWxsaWFt
cyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+Cj4gSG93ZXZlci4uLgo+Cj4gWy4uXQo+ID4g
IGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICAgIHwgIDQgKysrKwo+IFsuLl0KPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oIGIvaW5jbHVkZS9saW51eC9ibGtkZXYu
aAo+ID4gaW5kZXggMDUzZWE0YjUxOTg4Li5iM2M5YmU2OTA2YTAgMTAwNjQ0Cj4gPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2Jsa2Rldi5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCj4g
PiBAQCAtOTEwLDYgKzkxMCwxMCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpiZGV2X2dldF9xdWV1ZShzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+ID4gICNkZWZpbmUg
U0VDVE9SX1NJWkUgKDEgPDwgU0VDVE9SX1NISUZUKQo+ID4gICNlbmRpZgo+ID4KPiA+ICsjZGVm
aW5lIFBBR0VfU0VDVE9SU19TSElGVCAgICAgKFBBR0VfU0hJRlQgLSBTRUNUT1JfU0hJRlQpCj4g
PiArI2RlZmluZSBQQUdFX1NFQ1RPUlMgICAgICAgICAgICgxIDw8IFBBR0VfU0VDVE9SU19TSElG
VCkKPiA+ICsjZGVmaW5lIFNFQ1RPUl9NQVNLICAgICAgICAgICAgKFBBR0VfU0VDVE9SUyAtIDEp
Cj4gPiArCj4KPiAuLi5JIHRoaW5rIFNFQ1RPUl9NQVNLIGlzIG1pc25hbWVkIGdpdmVuIGl0IGNv
bnNpZGVycyBwYWdlcywgYW5kCj4gc2hvdWxkIHByb2JhYmx5IG1hdGNoIHRoZSBwb2xhcml0eSBv
ZiBQQUdFX01BU0ssIGkuZS4KPgo+ICNkZWZpbmUgUEFHRV9TRUNUT1JTX01BU0sgICAgICAgICAg
ICAofihQQUdFX1NFQ1RPUlMgLSAxKSkKPgoKTWFrZXMgc2Vuc2UuIEkganVzdCBrZXB0IHRoZSBz
YW1lIHZhbHVlIGFzIGluIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFpbi5jCgotLSAKTWF0dGVv
IENyb2NlCnBlciBhc3BlcmEgYWQgdXBzdHJlYW0KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
