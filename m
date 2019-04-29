Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC2EBE2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 23:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLDLF-0001e9-Rg; Mon, 29 Apr 2019 20:57:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kVn5=S7=amazon.de=prvs=015f510af=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLDLD-0001e4-MU
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 20:57:35 +0000
X-Inumbo-ID: 6805d8ca-6ac1-11e9-8035-1306767f0f54
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6805d8ca-6ac1-11e9-8035-1306767f0f54;
 Mon, 29 Apr 2019 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556571451; x=1588107451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=S5lZV+wUfhxX09VziLizB+efBwml5bSJ26ApHAbqCRY=;
 b=MOUP/YFcqIjuagwS7VtkPUNdKdJC0hYG/znKRa2vtaaS8Bbu7TEfhR+w
 8Xjc/bnOnyX/EbmRfE573OYRStIjhOJA77mRlwfWYt2rACjVKgKW/ro6K
 GpaDhbnBOYE5XNFmC7eW8zH84dzoe/fzyGtd+b9Nt414Gz6CoL5zioi5k M=;
X-IronPort-AV: E=Sophos;i="5.60,411,1549929600"; d="scan'208";a="400123470"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Apr 2019 16:00:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3TFwv0Z059317
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 29 Apr 2019 15:59:00 GMT
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:58:59 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:58:58 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 29 Apr 2019 15:58:57 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part2 2/6] common: Add
 is_referenced_section() helper function
Thread-Index: AQHU9Ez7yVEu6YDhIkOlhyFQITycO6ZTU8aAgAAMh4A=
Date: Mon, 29 Apr 2019 15:58:57 +0000
Message-ID: <B21FF504-6479-45A6-B615-C20E4C818B43@amazon.com>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-2-wipawel@amazon.de>
 <3dc69ca8-6c12-65ab-074c-b635bd5bdaeb@citrix.com>
In-Reply-To: <3dc69ca8-6c12-65ab-074c-b635bd5bdaeb@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.17]
Content-ID: <9D78AC2DE6583041AE2AF5A691E7C04B@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part2 2/6] common: Add
 is_referenced_section() helper function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMjkuIEFwciAyMDE5LCBhdCAxNzoxNCwgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIDQvMTYvMTkgMTowNyBQTSwgUGF3ZWwgV2ll
Y3pvcmtpZXdpY3ogd3JvdGU6Cj4+IFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIGdpdmVuIHNlY3Rp
b24gaGFzIGFuIGluY2x1ZGVkIGNvcnJlc3BvbmRpbmcKPj4gUkVMQSBzZWN0aW9uIGFuZC9vciBh
bnkgb2YgdGhlIHN5bWJvbHMgdGFibGUgc3ltYm9scyByZWZlcmVuY2VzIHRoZQo+PiBzZWN0aW9u
LiBTZWN0aW9uIGFzc29jaWF0ZWQgc3ltYm9scyBhcmUgaWdub3JlZCBoZXJlIGFzIHRoZXJlIGlz
Cj4+IGFsd2F5cyBzdWNoIGEgc3ltYm9sIGZvciBldmVyeSBzZWN0aW9uLgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4+IFJldmlld2Vk
LWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4+IFJldmll
d2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+PiBSZXZpZXdlZC1ieTog
Tm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4+IC0tLQo+PiAgY29tbW9uLmMg
fCAyMiArKysrKysrKysrKysrKysrKysrKystCj4+ICBjb21tb24uaCB8ICAxICsKPj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiBkaWZmIC0tZ2l0
IGEvY29tbW9uLmMgYi9jb21tb24uYwo+PiBpbmRleCAxZmIwN2NiLi5jOTY4Mjk5IDEwMDY0NAo+
PiAtLS0gYS9jb21tb24uYwo+PiArKysgYi9jb21tb24uYwo+PiBAQCAtMTUsNyArMTUsNyBAQAo+
PiAgICBpbnQgaXNfcmVsYV9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCj4+ICB7Cj4+IC0J
cmV0dXJuIChzZWMtPnNoLnNoX3R5cGUgPT0gU0hUX1JFTEEpOwo+PiArCXJldHVybiBzZWMgJiYg
KHNlYy0+c2guc2hfdHlwZSA9PSBTSFRfUkVMQSk7Cj4+ICB9Cj4+ICAgIGludCBpc19sb2NhbF9z
eW0oc3RydWN0IHN5bWJvbCAqc3ltKQo+PiBAQCAtMjcwLDYgKzI3MCwyNiBAQCBpbnQgaXNfc3Rh
bmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQo+PiAgCX0KPj4gIH0KPj4gICtpbnQg
aXNfcmVmZXJlbmNlZF9zZWN0aW9uKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMsIGNvbnN0IHN0
cnVjdCBrcGF0Y2hfZWxmICprZWxmKQo+IAo+IExldCdzIGtlZXAgdG8gODAgY2hhcnMgd2hlcmUg
cHJhY3RpY2FsIChhbmQgdGhyb3VnaG91dCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcykuCgpBQ0su
IFdpbGwgZml4LiBBbHRob3VnaCwgc29tZXRpbWVzIGl0IG1ha2VzIHRoZSBjb2RlIHByZXR0eSB1
bnJlYWRhYmxlLgoKPiAKPj4gK3sKPj4gKwlzdHJ1Y3Qgc3ltYm9sICpzeW07Cj4+ICsKPj4gKwlp
ZiAoaXNfcmVsYV9zZWN0aW9uKHNlYy0+cmVsYSkgJiYgc2VjLT5yZWxhLT5pbmNsdWRlKQo+PiAr
CQlyZXR1cm4gdHJ1ZTsKPj4gKwo+PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoc3ltLCAma2VsZi0+
c3ltYm9scywgbGlzdCkgewo+PiArCQlpZiAoIXN5bS0+aW5jbHVkZSB8fCAhc3ltLT5zZWMpCj4+
ICsJCQljb250aW51ZTsKPj4gKwkJLyogSWdub3JlIHNlY3Rpb24gYXNzb2NpYXRlZCBzZWN0aW9u
cyAqLwo+PiArCQlpZiAoc3ltLT50eXBlID09IFNUVF9TRUNUSU9OKQo+PiArCQkJY29udGludWU7
Cj4+ICsJCWlmIChzeW0tPnNlYy0+aW5kZXggPT0gc2VjLT5pbmRleCkKPj4gKwkJCXJldHVybiB0
cnVlOwo+IAo+IFlvdSBjYW4gc2ltcGxpZnkgdGhpcyBjaGVjayB0byBgc3ltLT5zZWMgPT0gc2Vj
YCBsaWtlIHRoZSByZXN0IG9mIHRoZSBjb2RlIGRvZXMuCgpNaWdodCBiZSBteSBwYXJhbm9pYSBh
Z2FpbiAob3IgSSBhbSBzaW1wbHkgbWlzc2luZyBzb21lIG9idmlvdXMgYXNzdW1wdGlvbnMvaW52
YXJpYW50cyksCmJ1dCBJIGV4cGxpY2l0bHkgd2FudGVkIHRvIGNoZWNrIHdoZXRoZXIgZ2l2ZW4g
c2VjdGlvbi9zeW1ib2wgaXMgcmVmZXJlbmNlZCB1c2luZyBvdGhlciBtZWFucwp0aGFuIGFkZHJl
c3Nlcy4KCj4gCj4gLS0gCj4gUm9zcyBMYWdlcndhbGwKCgpCZXN0IFJlZ2FyZHMsClBhd2VsIFdp
ZWN6b3JraWV3aWN6CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNj
aGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2Vu
IGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
