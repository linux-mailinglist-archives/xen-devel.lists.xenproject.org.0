Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCA17A764
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 15:28:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9rRB-0000uq-0W; Thu, 05 Mar 2020 14:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z1IC=4W=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1j9rR9-0000ul-8Y
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 14:25:19 +0000
X-Inumbo-ID: 219e4e32-5eed-11ea-b52f-bc764e2007e4
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 219e4e32-5eed-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 14:25:16 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9AE9B2E154F;
 Thu,  5 Mar 2020 17:25:14 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 z5MNPQhVm2-PBO06DpE; Thu, 05 Mar 2020 17:25:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583418314; bh=YyF2qBT8dm3IZGrfiOfUkAj9l9sxVno25dxtEJYNu9s=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=mclYmM0T5/GYKQWvd06n/AP7uK3ujTwm+rq5ZfUyy7ssRi+6foz4CwBc506ZleAaA
 9Mwe4pQ12xO/Xuiv70sxX/Uu3NNlloZG8VC92BGPknHEYN0TOcYDPSe2h0nM7IOLDJ
 kVh2HZoqnwxdVfYWPpOr9CBpKmZFQB/G+EvpMuZA=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1g.mail.yandex.net (localhost [::1])
 by mxbackcorp1g.mail.yandex.net with LMTP id iUMswpJpt2-EsudiJzi
 for <lekiravi@yandex-team.ru>; Thu, 05 Mar 2020 17:25:01 +0300
Received: by vla1-bfecef18a7a0.qloud-c.yandex.net with HTTP;
 Thu, 05 Mar 2020 17:25:01 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Markus Armbruster <armbru@redhat.com>
In-Reply-To: <274ce4fc-f7ef-791c-7c25-c99b694c1e78@redhat.com>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
 <274ce4fc-f7ef-791c-7c25-c99b694c1e78@redhat.com>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Mar 2020 17:25:11 +0300
Message-Id: <1039831583412539@myt4-457577cc370d.qloud-c.yandex.net>
Subject: Re: [Xen-devel] [PATCH v2 1/4] qapi: net: Add query-netdevs command
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Pirko <jiri@resnulli.us>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgowNC4wMy4yMDIwLCAxODo1NywgIkxhdXJlbnQgVml2aWVyIiA8bHZpdmllckByZWRoYXQuY29t
PjoKPiBPbiAwNC8wMy8yMDIwIDE0OjA2LCBBbGV4ZXkgS2lyaWxsb3Ygd3JvdGU6Cj4+IMKgQWRk
IGEgcW1wIGNvbW1hbmQgdGhhdCBwcm92aWRlcyBpbmZvcm1hdGlvbiBhYm91dCBjdXJyZW50bHkg
YXR0YWNoZWQKPj4gwqBuZXR3b3JrIGRldmljZXMgYW5kIHRoZWlyIGNvbmZpZ3VyYXRpb24uCj4+
Cj4+IMKgU2lnbmVkLW9mZi1ieTogQWxleGV5IEtpcmlsbG92IDxsZWtpcmF2aUB5YW5kZXgtdGVh
bS5ydT4KPj4gwqAtLS0KPj4gwqDCoGluY2x1ZGUvbmV0L25ldC5oIHwgMSArCj4+IMKgwqBuZXQv
aHViLmMgfCA4ICsrKwo+PiDCoMKgbmV0L2wydHB2My5jIHwgMTkgKysrKysrKwo+PiDCoMKgbmV0
L25ldC5jIHwgOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgwqBuZXQv
bmV0bWFwLmMgfCAxMyArKysrKwo+PiDCoMKgbmV0L3NsaXJwLmMgfCAxMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoMKgbmV0L3NvY2tldC5jIHwg
NzEgKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqDCoG5ldC90YXAtd2luMzIuYyB8IDkg
KysrKwo+PiDCoMKgbmV0L3RhcC5jIHwgMTAzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KPj4gwqDCoG5ldC92ZGUuYyB8IDI2ICsrKysrKysrKysKPj4gwqDCoG5ldC92aG9z
dC11c2VyLmMgfCAxOCArKysrKy0tCj4+IMKgwqBxYXBpL25ldC5qc29uIHwgODkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPj4gwqDCoDEyIGZpbGVzIGNoYW5nZWQsIDU2NiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gLi4uCj4+IMKgZGlmZiAtLWdpdCBhL25ldC9u
ZXQuYyBiL25ldC9uZXQuYwo+PiDCoGluZGV4IDllOTNjM2Y4YTEuLjAxZTA1NDgyOTUgMTAwNjQ0
Cj4+IMKgLS0tIGEvbmV0L25ldC5jCj4+IMKgKysrIGIvbmV0L25ldC5jCj4+IMKgQEAgLTU0LDYg
KzU0LDcgQEAKPj4gwqDCoCNpbmNsdWRlICJzeXNlbXUvc3lzZW11LmgiCj4+IMKgwqAjaW5jbHVk
ZSAibmV0L2ZpbHRlci5oIgo+PiDCoMKgI2luY2x1ZGUgInFhcGkvc3RyaW5nLW91dHB1dC12aXNp
dG9yLmgiCj4+IMKgKyNpbmNsdWRlICJxYXBpL2Nsb25lLXZpc2l0b3IuaCIKPj4KPj4gwqDCoC8q
IE5ldCBicmlkZ2UgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgZm9yIFczMi4gKi8KPj4gwqDC
oCNpZiAhZGVmaW5lZChfV0lOMzIpCj4+IMKgQEAgLTEyOCw2ICsxMjksMTIgQEAgY2hhciAqcWVt
dV9tYWNfc3RyZHVwX3ByaW50Zihjb25zdCB1aW50OF90ICptYWNhZGRyKQo+Pgo+PiDCoMKgdm9p
ZCBxZW11X2Zvcm1hdF9uaWNfaW5mb19zdHIoTmV0Q2xpZW50U3RhdGUgKm5jLCB1aW50OF90IG1h
Y2FkZHJbNl0pCj4+IMKgwqB7Cj4+IMKgKyBnX2Fzc2VydChuYy0+c3RvcmVkX2NvbmZpZyk7Cj4+
IMKgKwo+PiDCoCsgZ19mcmVlKG5jLT5zdG9yZWRfY29uZmlnLT51Lm5pYy5tYWNhZGRyKTsKPj4g
wqArIG5jLT5zdG9yZWRfY29uZmlnLT51Lm5pYy5tYWNhZGRyID0gZ19zdHJkdXBfcHJpbnRmKE1B
Q19GTVQsCj4+IMKgKyBNQUNfQVJHKG1hY2FkZHIpKTsKPj4gwqArCj4KPiBXaHkgZG8geW91IHVz
ZSB0aGlzIHJhdGhlciB0aGFuIHRoZSBxZW11X21hY19zdHJkdXBfcHJpbnRmKCkgZnVuY3Rpb24K
PiBkZWZpbmVkIGFib3ZlPwo+Cj4gcWVtdV9tYWNfc3RyZHVwX3ByaW50ZigpOgo+IMKgwqA4OTBl
ZTZhYmIzODUgKCJuZXQ6IGFkZCBNQUMgYWRkcmVzcyBzdHJpbmcgcHJpbnRlciIpCj4KPiBNQUNf
Rk1UL01BQ19BUkc6Cj4gwqDCoDZkMWQ0OTM5YTY0NyAoIm5ldDogQWRkIG1hY3JvcyBmb3IgTUFD
IGFkZHJlc3MgdHJhY2luZyIpCj4KPiBNQUNfRk1UL01BQ19BUkcgc2VlbXMgdG8gYmUgcmVzZXJ2
ZWQgZm9yIHRyYWNpbmcuCj4KPiBUaGFua3MsCj4gTGF1cmVudAoKU29tZWhvdywgSSBtYW5hZ2Vk
IG5vdCB0byBub3RpY2UgdGhpcyBmZWF0dXJlLgpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMg
b3V0LCBJIHdpbGwgZGVmaW5pdGVseSBmaXggdGhpcyBwbGFjZS4KCi0twqAKQWxleGV5IEtpcmls
bG92CllhbmRleC5DbG91ZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
