Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB21206C2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:14:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqAK-0000M9-LC; Mon, 16 Dec 2019 13:12:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igqAJ-0000Lk-4U
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:11:59 +0000
X-Inumbo-ID: a3b38301-2005-11ea-93a1-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a3b38301-2005-11ea-93a1-12813bfff9fa;
 Mon, 16 Dec 2019 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IPkGhoQaMyuuMxfZ22vfywDxIiWsIX0Gx3A5XKdmDs=;
 b=WewY0kIl/P9l4Lj/x3E2GSNO2xDB2/UH6EpjZ0HIiIar0xCLE9+sCh3WHIDp8HgLDgKkgC
 KW/OwQ090UZNkK8eKtld5U/32hnwK7HBoZu38ALVT8ldrrvbpTr8nABLa7ueq8hXJNFh+5
 uaVF+duGEOYFigwi7rBJvTzU7ljD40Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-1WQju3ZhM3uWMlQnu4F-NQ-1; Mon, 16 Dec 2019 08:11:56 -0500
Received: by mail-wm1-f71.google.com with SMTP id t4so1023103wmf.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OVZ8qCkz+iSuAIxbiMtdabWP4u3zkLCvZUfHLBEZANg=;
 b=QupvbPvQjChXmc/BjsWvGGFexYa3upSbbAEScj0FM/tXmOFytrBWQCZ7PZZwRkkAkj
 HzLJlrtqYC5z3/BapOfrLk5pO1zv1Ldi1sEmxdCowC+Hhhwto6/q/6ppzUx7YSGwtZ9g
 Os08M53bgQCXMSkI00qGPmznJ97tHYM0gtyk1aOUDOkfjoQBwBwNJbDS9exwI831Pz50
 /EHHWeVM82LwkaF5TttUaf2swnh94SYb5X0+3gFSZeCJreJV86OxdQHcllKmyRBhSPvt
 pOHh2fcBXT+o7gnOvMFf5GnDosMlMHcsQqdFgbjCBmaD15f03nv1tW/vF7G+DYkbXbC7
 lM2g==
X-Gm-Message-State: APjAAAVAcrGKk86G+XvF2NjXWPPhiu2H2Zpbgw4r4pmwS9lfOE0RiMMK
 jHPz/1CW2+yiTu6NoYZJWc2+lverW3XNE3pWIdlzs7GJaIUdtQ4teCncwRCm1WeUGA1xL/sv/OH
 dXRbffixTFhCNBl4NDDi0mXMs2D8=
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr29515758wrm.210.1576501915280; 
 Mon, 16 Dec 2019 05:11:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2vtXsGXckWOealAxKsd8xz8B6EZdGgNEAj2cPIngxIU6E4STQELcYok94Tp665k14zzg/Fg==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr29515741wrm.210.1576501915086; 
 Mon, 16 Dec 2019 05:11:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id o16sm6585832wmc.18.2019.12.16.05.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:54 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-10-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <340e7a8b-b7c6-3f61-3646-c311c7c33f60@redhat.com>
Date: Mon, 16 Dec 2019 14:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-10-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 1WQju3ZhM3uWMlQnu4F-NQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 09/12] hw/intc/ioapic: Make
 ioapic_print_redtbl() static
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFNpbmNl
IGNvbW1pdCAwYzg0NjU0NDAgdGhlIGlvYXBpY19wcmludF9yZWR0YmwoKSBmdW5jdGlvbiBpcyBu
b3QKPiB1c2VkIG91dHNpZGUgb2YgaW9hcGljX2NvbW1vbi5jLCBtYWtlIGl0IHN0YXRpYywgYW5k
IHJlbW92ZSBpdHMKPiBwcm90b3R5cGUgZGVjbGFyYXRpb24gaW4gImlvYXBpY19pbnRlcm5hbC5o
Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJl
ZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvaTM4Ni9pb2FwaWNfaW50ZXJuYWwuaCB8IDEg
LQo+ICBody9pbnRjL2lvYXBpY19jb21tb24uYyAgICAgICAgICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvaHcvaTM4Ni9pb2FwaWNfaW50ZXJuYWwuaCBiL2luY2x1ZGUvaHcvaTM4Ni9pb2Fw
aWNfaW50ZXJuYWwuaAo+IGluZGV4IGQ0NmM4N2M1MTAuLjhiNzQzYWVlZDAgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9ody9pMzg2L2lvYXBpY19pbnRlcm5hbC5oCj4gKysrIGIvaW5jbHVkZS9ody9p
Mzg2L2lvYXBpY19pbnRlcm5hbC5oCj4gQEAgLTExOCw3ICsxMTgsNiBAQCBzdHJ1Y3QgSU9BUElD
Q29tbW9uU3RhdGUgewo+ICAKPiAgdm9pZCBpb2FwaWNfcmVzZXRfY29tbW9uKERldmljZVN0YXRl
ICpkZXYpOwo+ICAKPiAtdm9pZCBpb2FwaWNfcHJpbnRfcmVkdGJsKE1vbml0b3IgKm1vbiwgSU9B
UElDQ29tbW9uU3RhdGUgKnMpOwo+ICB2b2lkIGlvYXBpY19zdGF0X3VwZGF0ZV9pcnEoSU9BUElD
Q29tbW9uU3RhdGUgKnMsIGludCBpcnEsIGludCBsZXZlbCk7Cj4gIAo+ICAjZW5kaWYgLyogUUVN
VV9JT0FQSUNfSU5URVJOQUxfSCAqLwo+IGRpZmYgLS1naXQgYS9ody9pbnRjL2lvYXBpY19jb21t
b24uYyBiL2h3L2ludGMvaW9hcGljX2NvbW1vbi5jCj4gaW5kZXggNTUzOGI1Yjg2ZS4uNzJlYTk0
NTM3NyAxMDA2NDQKPiAtLS0gYS9ody9pbnRjL2lvYXBpY19jb21tb24uYwo+ICsrKyBiL2h3L2lu
dGMvaW9hcGljX2NvbW1vbi5jCj4gQEAgLTc2LDcgKzc2LDcgQEAgc3RhdGljIHZvaWQgaW9hcGlj
X2lycl9kdW1wKE1vbml0b3IgKm1vbiwgY29uc3QgY2hhciAqbmFtZSwgdWludDMyX3QgYml0bWFw
KQo+ICAgICAgbW9uaXRvcl9wcmludGYobW9uLCAiXG4iKTsKPiAgfQo+ICAKPiAtdm9pZCBpb2Fw
aWNfcHJpbnRfcmVkdGJsKE1vbml0b3IgKm1vbiwgSU9BUElDQ29tbW9uU3RhdGUgKnMpCj4gK3N0
YXRpYyB2b2lkIGlvYXBpY19wcmludF9yZWR0YmwoTW9uaXRvciAqbW9uLCBJT0FQSUNDb21tb25T
dGF0ZSAqcykKPiAgewo+ICAgICAgc3RhdGljIGNvbnN0IGNoYXIgKmRlbG1fc3RyW10gPSB7Cj4g
ICAgICAgICAgImZpeGVkIiwgImxvd2VzdCIsICJTTUkiLCAiLi4uIiwgIk5NSSIsICJJTklUIiwg
Ii4uLiIsICJleHRJTlQifTsKPiAKClF1ZXVlZCwgdGhhbmtzLgoKUGFvbG8KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
