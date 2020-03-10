Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23618100B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 06:29:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBtt2-00072w-Qi; Wed, 11 Mar 2020 05:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ISq0=43=kernel.org=song@srs-us1.protection.inumbo.net>)
 id 1jBm4w-0001FD-Gn
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 21:06:18 +0000
X-Inumbo-ID: fb80aca2-6312-11ea-ae4d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb80aca2-6312-11ea-ae4d-12813bfff9fa;
 Tue, 10 Mar 2020 21:06:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23165222C3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583874376;
 bh=vhxZrp2Lx5DeATCenHy71j1LATXknii/r2+vE+Yb5m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VSxML8CZIv6TujbXRjRw9Ndm8hswQ0Iy4czB2jk6b7uVrcoP7w2FT3QpRGHO/Gfw8
 1PAC8sWmIxLgfBwLT0IoBg95GgOQJewHjIgNWqAF9o7XsmOF2nFAtuL0aHnkZz6PQW
 ByM8dtKGpYIidv0mnusE83YjNVcG4UXW3V9qqpcY=
Received: by mail-lf1-f54.google.com with SMTP id j15so12183541lfk.6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 14:06:16 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0w+tD2xEWUWqmV6gooyyTpgdgXQB82RCCKsdypKGJaw3ALkxjZ
 hqebpCBF2JGNT5Ch4bBoj4KMplHaHnFU36/9tpQ=
X-Google-Smtp-Source: ADFU+vudBQrw1oSvW+1z/bikz1NjhAJyNp9q/S1l7eZSBzV8bqzYmhmQtaOP3eZbtp4E2HGJaK7++RE5+JjVfD/y/h8=
X-Received: by 2002:ac2:554d:: with SMTP id l13mr39638lfk.82.1583874374294;
 Tue, 10 Mar 2020 14:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200223165724.23816-1-mcroce@redhat.com>
In-Reply-To: <20200223165724.23816-1-mcroce@redhat.com>
From: Song Liu <song@kernel.org>
Date: Tue, 10 Mar 2020 14:06:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6DOkyvscJhxXPE+KLsw=WH6CQ=8_5uThzf7_pmD3E8JA@mail.gmail.com>
Message-ID: <CAPhsuW6DOkyvscJhxXPE+KLsw=WH6CQ=8_5uThzf7_pmD3E8JA@mail.gmail.com>
To: Matteo Croce <mcroce@redhat.com>
X-Mailman-Approved-At: Wed, 11 Mar 2020 05:26:31 +0000
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
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-mmc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBGZWIgMjMsIDIwMjAgYXQgODo1OCBBTSBNYXR0ZW8gQ3JvY2UgPG1jcm9jZUByZWRo
YXQuY29tPiB3cm90ZToKPgo+IFRoZSBtYWNyb3MgUEFHRV9TRUNUT1JTLCBQQUdFX1NFQ1RPUlNf
U0hJRlQgYW5kIFNFQ1RPUl9NQVNLIGFyZSBkZWZpbmVkCj4gc2V2ZXJhbCB0aW1lcyBpbiBkaWZm
ZXJlbnQgZmxhdm91cnMgYWNyb3NzIHRoZSB3aG9sZSB0cmVlLgo+IERlZmluZSB0aGVtIGp1c3Qg
b25jZSBpbiBhIGNvbW1vbiBoZWFkZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0ZW8gQ3JvY2Ug
PG1jcm9jZUByZWRoYXQuY29tPgo+IC0tLQo+ICBibG9jay9ibGstbGliLmMgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2svYnJkLmMgICAgICAgICAgICAgIHwgIDMgLS0t
Cj4gIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFpbi5jICAgIHwgIDQgLS0tLQo+ICBkcml2ZXJz
L2Jsb2NrL3pyYW0venJhbV9kcnYuYyAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvYmxvY2sv
enJhbS96cmFtX2Rydi5oICAgIHwgIDIgLS0KPiAgZHJpdmVycy9kYXgvc3VwZXIuYyAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21kL2JjYWNoZS91dGlsLmggICAgICAgICB8ICAyIC0t
Cj4gIGRyaXZlcnMvbWQvZG0tYnVmaW8uYyAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZl
cnMvbWQvZG0taW50ZWdyaXR5LmMgICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL21k
L21kLmMgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9tZC9yYWlkMS5jICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21tYy9jb3JlL2hvc3QuYyAgICAgICAgICB8
ICAzICsrLQo+ICBkcml2ZXJzL3Njc2kveGVuLXNjc2lmcm9udC5jICAgICB8ICA0ICsrLS0KPiAg
ZnMvaW9tYXAvYnVmZmVyZWQtaW8uYyAgICAgICAgICAgfCAgMiArLQo+ICBmcy9uZnMvYmxvY2ts
YXlvdXQvYmxvY2tsYXlvdXQuaCB8ICAyIC0tCj4gIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAg
ICAgICAgIHwgIDQgKysrKwo+ICBpbmNsdWRlL2xpbnV4L2RldmljZS1tYXBwZXIuaCAgICB8ICAx
IC0KPiAgMTcgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0p
CgpGb3IgbWQ6CgpBY2tlZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
