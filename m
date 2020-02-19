Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D0164785
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 15:55:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Qiz-0007ac-CN; Wed, 19 Feb 2020 14:53:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bYhU=4H=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j4Qix-0007aX-TG
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 14:53:15 +0000
X-Inumbo-ID: 8e2b7b78-5327-11ea-b0fd-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e2b7b78-5327-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 14:53:14 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4Qiu-00063u-0H; Wed, 19 Feb 2020 15:53:12 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 9D842103A05; Wed, 19 Feb 2020 15:53:11 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
In-Reply-To: <8808612b-11c2-f7b8-f027-7ff92e992c50@suse.com>
References: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
 <8808612b-11c2-f7b8-f027-7ff92e992c50@suse.com>
Date: Wed, 19 Feb 2020 15:53:11 +0100
Message-ID: <87h7zmpr1k.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: Enable interrupts when calling
 _cond_resched()
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cgo+IE9uIDE5LjAyLjIwIDEy
OjAxLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+IHhlbl9tYXliZV9wcmVlbXB0X2hjYWxsKCkg
aXMgY2FsbGVkIGZyb20gdGhlIGV4Y2VwdGlvbiBlbnRyeSBwb2ludAo+PiB4ZW5fZG9faHlwZXJ2
aXNvcl9jYWxsYmFjayB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4+IAo+PiBfY29uZF9yZXNj
aGVkKCkgZXZhZGVzIHRoZSBtaWdodF9zbGVlcCgpIGNoZWNrIGluIGNvbmRfcmVzY2hlZCgpIHdo
aWNoCj4+IHdvdWxkIGhhdmUgY2F1Z2h0IHRoYXQgYW5kIHNjaGVkdWxlX2RlYnVnKCkgdW5mb3J0
dW5hdGVseSBsYWNrcyBhIGNoZWNrCj4+IGZvciBpcnFzX2Rpc2FibGVkKCkuCj4+IAo+PiBFbmFi
bGUgaW50ZXJydXB0cyBhcm91bmQgdGhlIGNhbGwgYW5kIHVzZSBjb25kX3Jlc2NoZWQoKSB0byBj
YXRjaCBmdXR1cmUKPj4gaXNzdWVzLgo+PiAKPj4gRml4ZXM6IGZkZmQ4MTFkZGRlMyAoIng4Ni94
ZW46IGFsbG93IHByaXZjbWQgaHlwZXJjYWxscyB0byBiZSBwcmVlbXB0ZWQiKQo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4gLS0tCj4+ICAg
ZHJpdmVycy94ZW4vcHJlZW1wdC5jIHwgICAgNCArKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gLS0tIGEvZHJpdmVycy94ZW4vcHJl
ZW1wdC5jCj4+ICsrKyBiL2RyaXZlcnMveGVuL3ByZWVtcHQuYwo+PiBAQCAtMzMsOCArMzMsMTAg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCB4ZW5fbWF5YmVfcHJlZQo+PiAgIAkJICogY3B1
Lgo+PiAgIAkJICovCj4+ICAgCQlfX3RoaXNfY3B1X3dyaXRlKHhlbl9pbl9wcmVlbXB0aWJsZV9o
Y2FsbCwgZmFsc2UpOwo+PiAtCQlfY29uZF9yZXNjaGVkKCk7Cj4+ICsJCWxvY2FsX2lycV9lbmFi
bGUoKTsKPj4gKwkJY29uZF9yZXNjaGVkKCk7Cj4+ICAgCQlfX3RoaXNfY3B1X3dyaXRlKHhlbl9p
bl9wcmVlbXB0aWJsZV9oY2FsbCwgdHJ1ZSk7Cj4+ICsJCWxvY2FsX2lycV9kaXNhYmxlKCk7Cj4K
PiBDb3VsZCB5b3UgcGxlYXNlIHB1dCB0aGUgY2FsbCBvZiBsb2NhbF9pcnFfZGlzYWJsZSgpIGRp
cmVjdGx5IGFmdGVyIHRoZQo+IGNvbmRfcmVzY2hlZCgpIGNhbGwgdG8gbWFrZSB0aGUgcmVzdWx0
IHN5bW1ldHJpYyByZWdhcmRpbmcgd3JpdGluZyBvZgo+IHhlbl9pbl9wcmVlbXB0aWJsZV9oY2Fs
bCBhbmQgaXJxIGVuYWJsZS9kaXNhYmxlPwoKRGFybi4gT2YgY291cnNlIGRvZXMgdGhpcyBuZWVk
IHRvIGJlIHRoZXJlLiBTdHVwaWQgbWUsIGxldCBtZSByZXNlbmQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
