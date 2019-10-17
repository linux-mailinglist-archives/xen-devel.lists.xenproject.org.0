Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B990DB12B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7ks-00048p-J9; Thu, 17 Oct 2019 15:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hugR=YK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iL7kr-00048k-0M
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:31:57 +0000
X-Inumbo-ID: 40272486-f0f3-11e9-a531-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40272486-f0f3-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 15:31:55 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C7C973A6C
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 15:31:55 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id p8so1130699wrj.8
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2F49FEDc7LzFngXJgzRZqW78fRDnmjAzCNR79FZigrE=;
 b=H/ljjTebgOUStgUWZ177FsUeobzaOgcVsSq9h3zZY40s5WOmo8A5QbjZUzoS+0QCCI
 601Ic81H65goPh2UMEMmEtBecM9ciU9s9cfDxr1oUFM+jJPXaTFFpOM/cOx3lhzR3OxE
 wFaCU65H1658PkqghBpfidmlsK0BwIPiZOclnw51ZEB9Bm4ryj9Kor6CUhZVsDVD5CJa
 wZVfGwjOJ/r8LQlQe5IER32Qt3sLl4xuGN0npjyPthk7T6XkXCCg5m9/TzgsrRNn0APJ
 +gI3ztwyOTD0Cnw8jLa5ObsiJE9maoNfJ34RLpEkVUy7kLGA2jOoGm0eyXwdfLSvx3sn
 1tqg==
X-Gm-Message-State: APjAAAXgwmn5KNtnD+82YFVU5sf5beIj4nMnA5HQQUBFEsGrSR1RAF1p
 Uv7bv9pRqM2WpN06Q4n81GkiOG3z1ShIgtPBVASJSZ9e2B7d9SihRGykwLSKTCiBGLL+ENf7l8C
 dY6EsWwfNoXwXjhp6m1svqE5lmyY=
X-Received: by 2002:a5d:4644:: with SMTP id j4mr2879857wrs.355.1571326312473; 
 Thu, 17 Oct 2019 08:31:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoIjP3X5/5M57pPiqoVb4QqAFAlZi3TJe2flVh04t5Rg9ZUsN3ciAgDSe7HR76Hc+W9yzeqA==
X-Received: by 2002:a5d:4644:: with SMTP id j4mr2879827wrs.355.1571326312297; 
 Thu, 17 Oct 2019 08:31:52 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id g1sm2872055wrv.68.2019.10.17.08.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:31:51 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-3-philmd@redhat.com>
 <1e8c724b-8846-255a-eace-6bf135471566@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e1bffc6-a7cc-5beb-3f9f-da8e644c8d4b@redhat.com>
Date: Thu, 17 Oct 2019 17:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1e8c724b-8846-255a-eace-6bf135471566@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/32] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTcvMTkgNTowNCBQTSwgVGhvbWFzIEh1dGggd3JvdGU6Cj4gT24gMTUvMTAvMjAxOSAx
OC4yNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+IE1vdmUgdGhlIEtWTS1yZWxh
dGVkIGNhbGwgdG8gInN5c2VtdS9rdm0uaCIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgaW5jbHVkZS9o
dy9pMzg2L3BjLmggfCAxIC0KPj4gICBpbmNsdWRlL3N5c2VtdS9rdm0uaCB8IDEgKwo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKPj4gaW5k
ZXggNmRmNGY0YjZmYi4uMDllNzRlNzc2NCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9ody9pMzg2
L3BjLmgKPj4gKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKPj4gQEAgLTE1OCw3ICsxNTgsNiBA
QCB0eXBlZGVmIHN0cnVjdCBQQ01hY2hpbmVDbGFzcyB7Cj4+ICAgCj4+ICAgZXh0ZXJuIERldmlj
ZVN0YXRlICppc2FfcGljOwo+PiAgIHFlbXVfaXJxICppODI1OV9pbml0KElTQUJ1cyAqYnVzLCBx
ZW11X2lycSBwYXJlbnRfaXJxKTsKPj4gLXFlbXVfaXJxICprdm1faTgyNTlfaW5pdChJU0FCdXMg
KmJ1cyk7Cj4+ICAgaW50IHBpY19yZWFkX2lycShEZXZpY2VTdGF0ZSAqZCk7Cj4+ICAgaW50IHBp
Y19nZXRfb3V0cHV0KERldmljZVN0YXRlICpkKTsKPj4gICAKPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc3lzZW11L2t2bS5oIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPj4gaW5kZXggOWQxNDMyODJi
Yy4uZGE4YWE5ZjVhOCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPj4gKysr
IGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPj4gQEAgLTUxMyw2ICs1MTMsNyBAQCB2b2lkIGt2bV9p
cnFjaGlwX3NldF9xZW11aXJxX2dzaShLVk1TdGF0ZSAqcywgcWVtdV9pcnEgaXJxLCBpbnQgZ3Np
KTsKPj4gICB2b2lkIGt2bV9wY19nc2lfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQg
bGV2ZWwpOwo+PiAgIHZvaWQga3ZtX3BjX3NldHVwX2lycV9yb3V0aW5nKGJvb2wgcGNpX2VuYWJs
ZWQpOwo+PiAgIHZvaWQga3ZtX2luaXRfaXJxX3JvdXRpbmcoS1ZNU3RhdGUgKnMpOwo+PiArcWVt
dV9pcnEgKmt2bV9pODI1OV9pbml0KElTQUJ1cyAqYnVzKTsKPiAKPiBXaHk/IFRoZSBmdW5jdGlv
biBpcyBkZWZpbmVkIGluIGh3L2kzODYva3ZtLyAtIHNvIG1vdmluZyBpdHMgcHJvdG90eXBlCj4g
dG8gYSBnZW5lcmljIGhlYWRlciBzb3VuZHMgd3JvbmcgdG8gbWUuCgpUaGlzIGZ1bmN0aW9uIGlz
IGRlY2xhcmVkIHdoZW4gY29tcGlsaW5nIHdpdGhvdXQgS1ZNLCBhbmQgaXMgYXZhaWxhYmxlIApv
biB0aGUgQWxwaGEvSFBQQS9NSVBTIHdoaWNoIGRvbid0IGhhdmUgaXQuCgpZb3UnZCByYXRoZXIg
bW92ZSB0aGUga3ZtX3BjXyogZGVjbGFyYXRpb25zIHRvIGh3L2kzODYva3ZtLz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
