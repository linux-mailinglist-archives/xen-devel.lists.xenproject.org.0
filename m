Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8DDB140
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7pu-0004So-M6; Thu, 17 Oct 2019 15:37:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hugR=YK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iL7ps-0004Si-IP
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:37:08 +0000
X-Inumbo-ID: f8ec08aa-f0f3-11e9-93d3-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ec08aa-f0f3-11e9-93d3-12813bfff9fa;
 Thu, 17 Oct 2019 15:37:07 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 595102DA980
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 15:37:06 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id e25so554345wra.9
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZoDnuvieE1vwdFJevEjTqU698vVlleevRIzQBYr+fco=;
 b=RAiATelSIqyJ88v4uzUDTt15vFAuFdCPlwt2IetzQCuJuIgeNr3AgFYYbH6dGe3gD7
 icGRbKUAW0xHesAtvsX+6nF765sisntnCDm9Hlwc0eX2NWDzu/ZkDKHHdeVwr0kAljfJ
 NFwZ9Kmn8wuNyA6Aplioc0SaE+I4+2Yvw8j2RaCV5DHD9RxHOEHqNTpqFt9bKrAAsUv0
 xUc/+YJ+17/xzTotDtMDT4fZRxpp7fvCl18OmbVJAqprhY2mM4p3f8XF06XLESEwOjl2
 qbVdmJXe6YXpQF3o+W8ycQgDXrffOFmIOe1dt8sbSM21XF+AmOGyr2DCnQvbkijnQ4pN
 pt1w==
X-Gm-Message-State: APjAAAWyRNcW/uROgsJ+dw83mkmZPSDOkfFqYJ4qH1fDgyhPiUeVjv9z
 57Mat5YSXsZ6gFhWHACSvKHQuR6T6Yb8KXsnvX9EPHkzi6duAPhpGwLQ94h7n45KA/kWfx8wSsK
 +UEPWCt4d8kOLLWZRLcqYfg19lyE=
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr3546229wml.10.1571326625045; 
 Thu, 17 Oct 2019 08:37:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFByCpFsOPI/D90wmVQpllY3A59GiUvIq918ytgRa2P+GX+b1/cFy2xEF+A9MVn2e0t84JKg==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr3546210wml.10.1571326624845; 
 Thu, 17 Oct 2019 08:37:04 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id c6sm2444560wrm.71.2019.10.17.08.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:37:04 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-22-philmd@redhat.com>
 <CAL1e-=hLUDDqFiV8W1f2PFGYJMomvmZUXmjA55X7WEEYMykjHQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8bcf9189-efbe-1575-7e57-fd7bdd202547@redhat.com>
Date: Thu, 17 Oct 2019 17:37:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hLUDDqFiV8W1f2PFGYJMomvmZUXmjA55X7WEEYMykjHQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 21/32] hw/i386/pc: Reduce gsi_handler scope
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTcvMTkgNToxNiBQTSwgQWxla3NhbmRhciBNYXJrb3ZpYyB3cm90ZToKPiBPbiBUdWVz
ZGF5LCBPY3RvYmVyIDE1LCAyMDE5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJl
ZGhhdC5jb20gCj4gPG1haWx0bzpwaGlsbWRAcmVkaGF0LmNvbT4+IHdyb3RlOgo+IAo+ICAgICBw
Y19nc2lfY3JlYXRlKCkgaXMgdGhlIHNpbmdsZSBmdW5jdGlvbiB0aGF0IHVzZXMgZ3NpX2hhbmRs
ZXIuCj4gICAgIE1ha2UgaXQgYSBzdGF0aWMgdmFyaWFibGUuCj4gCj4gICAgIFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbQo+ICAgICA8bWFp
bHRvOnBoaWxtZEByZWRoYXQuY29tPj4KPiAgICAgLS0tCj4gICAgICDCoGh3L2kzODYvcGMuY8Kg
IMKgIMKgIMKgIMKgfCAyICstCj4gICAgICDCoGluY2x1ZGUvaHcvaTM4Ni9wYy5oIHwgMiAtLQo+
ICAgICAgwqAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+ICAgICBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9wYy5jIGIvaHcvaTM4Ni9wYy5jCj4gICAgIGlu
ZGV4IGE3NTk3YzZjNDQuLjU5ZGUwYzhhMWYgMTAwNjQ0Cj4gICAgIC0tLSBhL2h3L2kzODYvcGMu
Ywo+ICAgICArKysgYi9ody9pMzg2L3BjLmMKPiAgICAgQEAgLTM0Niw3ICszNDYsNyBAQCBHbG9i
YWxQcm9wZXJ0eSBwY19jb21wYXRfMV80W10gPSB7Cj4gICAgICDCoH07Cj4gICAgICDCoGNvbnN0
IHNpemVfdCBwY19jb21wYXRfMV80X2xlbiA9IEdfTl9FTEVNRU5UUyhwY19jb21wYXRfMV80KTsK
PiAKPiAgICAgLXZvaWQgZ3NpX2hhbmRsZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50IGxldmVs
KQo+ICAgICArc3RhdGljIHZvaWQgZ3NpX2hhbmRsZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50
IGxldmVsKQo+ICAgICAgwqB7Cj4gICAgICDCoCDCoCDCoEdTSVN0YXRlICpzID0gb3BhcXVlOwo+
IAo+ICAgICBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3L2kz
ODYvcGMuaAo+ICAgICBpbmRleCBkMGM2YjlkNDY5Li43NWI0NGUxNTZjIDEwMDY0NAo+ICAgICAt
LS0gYS9pbmNsdWRlL2h3L2kzODYvcGMuaAo+ICAgICArKysgYi9pbmNsdWRlL2h3L2kzODYvcGMu
aAo+ICAgICBAQCAtMTcyLDggKzE3Miw2IEBAIHR5cGVkZWYgc3RydWN0IEdTSVN0YXRlIHsKPiAg
ICAgIMKgIMKgIMKgcWVtdV9pcnEgaW9hcGljX2lycVtJT0FQSUNfTlVNX1BJTlNdOwo+ICAgICAg
wqB9IEdTSVN0YXRlOwo+IAo+ICAgICAtdm9pZCBnc2lfaGFuZGxlcih2b2lkICpvcGFxdWUsIGlu
dCBuLCBpbnQgbGV2ZWwpOwo+ICAgICAtCj4gICAgICDCoEdTSVN0YXRlICpwY19nc2lfY3JlYXRl
KHFlbXVfaXJxICoqaXJxcywgYm9vbCBwY2lfZW5hYmxlZCk7Cj4gCj4gCj4gUGhpbGlwcGUsIHRo
aXMgMi1saW5lIGRlbGV0aW9uIHNlZW1zIG5vdCB0byBiZWxvbmcgdG8gdGhpcyBwYXRjaC4gSWYg
Cj4gdHJ1ZSwgcGxlYXNlIHBsYWNlIGl0IGluIGFub3RoZXIgb3IgYSBzZXBhcmF0ZSBwYXRjaC4K
Ckl0IGRvZXMsIHRoaXMgaXMgdGhlIHBvaW50IG9mIHRoZSBjaGFuZ2UsIG1ha2UgaXQgc3RhdGlj
IGFuZCByZW1vdmUgaXRzIApkZWNsYXJhdGlvbiA6KQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
