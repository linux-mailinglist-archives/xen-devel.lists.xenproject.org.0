Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BAE165042
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 21:51:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4WHD-0003BR-TJ; Wed, 19 Feb 2020 20:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y0Hs=4H=redhat.com=peterx@srs-us1.protection.inumbo.net>)
 id 1j4WHB-0003BM-WA
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 20:48:58 +0000
X-Inumbo-ID: 3f82d980-5359-11ea-aa99-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3f82d980-5359-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582145337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCbBkvQFTAuFW033ur9ejLImFbYe/zfXviaYTrwULKI=;
 b=h0Mh8Q3DlRMKj63H6Bl8md5XAcm7ZA/F/cwA/hnijqF5FoxyroKwTP4zRAnnFslMzXg4ri
 NiaeEL/4HnULj0mSJDuu4DYnWcMHE9ZOsupty64ygTC9IlG/T9iBRhoQF3K8xXmNBNCMLU
 utROy0ssa86vRSmMUUlmZm1OdFgCG30=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29--5l3esV0MC-g4BQYRqZ-lA-1; Wed, 19 Feb 2020 15:48:52 -0500
X-MC-Unique: -5l3esV0MC-g4BQYRqZ-lA-1
Received: by mail-qk1-f198.google.com with SMTP id i11so1150389qki.12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 12:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4heDx3IADhxIaA05zIzt6Oj44HcZ6fmRDFRSIivC0yI=;
 b=BnzOVUkO6dIvKlyWuN9jVsECNJ8aG55FL3m4Anv+4OFWg0b3Uhbfws80BdojXSoAAl
 P4y1tsE8g76p+Scb9lVTQRqMy0As5+sMEMvWekNyiv3AQ6oht6Zus5UD/tySo1BrO2ZA
 dnF/XiDrLl9zWbQ67A72cg9g4gtn9pZvdZAF1KwpJzyesVfjjQJero4IBa1wbpKkEGHM
 l6+CbX8pCl1B372Wz5INGMcK1CKIDxrbXqpIuHyrwBBiu0fqg4g8iMg+ONSUNS50bWYV
 uxKolEbpgoOD8P1l5b5pSlyIRe2J7w8hF5Rv70tjWSKxlFPxtLGoAI2dv3pXXdD8RgRo
 AjCg==
X-Gm-Message-State: APjAAAWwT3OjPMGtIFrTINPRihO8CJ7tBeZ/dOcPDg5XAHNsVRmoaaiy
 qkXDhcK71VquLKdkO3qdNV3AZmtBd9+kl53T3ZefdbE+so3ijswTgyDS42B0JtbGrwDJxe1fxhA
 Ee6rYsy/CjpHPyBBHTqfIC6aHi8Q=
X-Received: by 2002:ac8:104:: with SMTP id e4mr23413685qtg.37.1582145332479;
 Wed, 19 Feb 2020 12:48:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9qXw94Rkjkq4drpJmapyH6qExoqCgQYbQHS/kJUb5VULS9U4dUz6XTa9hpEbqxiNLeJVBNw==
X-Received: by 2002:ac8:104:: with SMTP id e4mr23413671qtg.37.1582145332268;
 Wed, 19 Feb 2020 12:48:52 -0800 (PST)
Received: from xz-x1 ([104.156.64.75])
 by smtp.gmail.com with ESMTPSA id j127sm459417qkc.36.2020.02.19.12.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 12:48:51 -0800 (PST)
Date: Wed, 19 Feb 2020 15:48:50 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20200219204850.GE37550@xz-x1>
References: <20200219161725.115218-1-david@redhat.com>
 <20200219161725.115218-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200219161725.115218-4-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1 03/13] numa: Teach ram block notifiers
 about resizeable ram blocks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDU6MTc6MTVQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gUmFtIGJsb2NrIG5vdGlmaWVycyBhcmUgY3VycmVudGx5IG5vdCBhd2FyZSBv
ZiByZXNpemVzLiBFc3BlY2lhbGx5IHRvCj4gaGFuZGxlIHJlc2l6ZXMgZHVyaW5nIG1pZ3JhdGlv
biwgYnV0IGFsc28gdG8gaW1wbGVtZW50IGFjdHVhbGx5IHJlc2l6ZWFibGUKPiByYW0gYmxvY2tz
IChtYWtlIGV2ZXJ5dGhpbmcgYmV0d2VlbiB1c2VkX2xlbmd0aCBhbmQgbWF4X2xlbmd0aAo+IGlu
YWNjZXNzaWJsZSksIHdlIHdhbnQgdG8gdGVhY2ggcmFtIGJsb2NrIG5vdGlmaWVycyBhYm91dCBy
ZXNpemVhYmxlCj4gcmFtLgo+IAo+IEludHJvZHVjZSB0aGUgYmFzaWMgaW5mcmFzdHJ1Y3R1cmUg
YnV0IGtlZXAgdXNpbmcgbWF4X3NpemUgaW4gdGhlCj4gZXhpc3Rpbmcgbm90aWZpZXJzLiBTdXBw
bHkgdGhlIG1heF9zaXplIHdoZW4gYWRkaW5nIGFuZCByZW1vdmluZyByYW0KPiBibG9ja3MuIEFs
c28sIG5vdGlmeSBvbiByZXNpemVzLgo+IAo+IEFja2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4KPiBDYzogUmljaGFyZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxlLm5ldD4KPiBDYzog
UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDYzogIkRyLiBEYXZpZCBBbGFu
IEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPgo+IENjOiBFZHVhcmRvIEhhYmtvc3QgPGVo
YWJrb3N0QHJlZGhhdC5jb20+Cj4gQ2M6IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJh
dW1AZ21haWwuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Cj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+
IENjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiBDYzogIk1pY2hhZWwgUy4gVHNpcmtp
biIgPG1zdEByZWRoYXQuY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBDYzogSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBQZXRl
ciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+CgotLSAKUGV0ZXIgWHUKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
