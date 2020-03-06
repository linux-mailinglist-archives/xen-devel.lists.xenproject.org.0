Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B717BB7C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:19:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAAyv-0005og-GS; Fri, 06 Mar 2020 11:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qyRG=4X=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1jAAyt-0005oW-TB
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:17:27 +0000
X-Inumbo-ID: 0fdf0baa-5f9c-11ea-a7ac-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0fdf0baa-5f9c-11ea-a7ac-12813bfff9fa;
 Fri, 06 Mar 2020 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583493447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2s9JXeDz4EqltLl6mL+qavCzz0ZKxnmqBZNo8uPIpzA=;
 b=Uqz0dG8nMIq/Vg03LKLd/eDsXuYalEKrb8ho1z7p37COXynQuh+XuGhaSAKVotCt9cPoqY
 eyl+eAGqak4ff45ZVG6JN+Yo9Wzc2dGWWYeuWaPJ4OvLrhje1LI0Jg3aVHBapcmQSd28my
 3PP9zPXmX99WPj7Bv2hewQaPLbWYVA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-8KIxNJuBPBm6Gz2RDngudg-1; Fri, 06 Mar 2020 06:17:25 -0500
X-MC-Unique: 8KIxNJuBPBm6Gz2RDngudg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0789F800D50;
 Fri,  6 Mar 2020 11:17:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB76384D90;
 Fri,  6 Mar 2020 11:17:01 +0000 (UTC)
Date: Fri, 6 Mar 2020 12:16:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20200306121659.5365e50b@redhat.com>
In-Reply-To: <20200304153601.23423-1-philmd@redhat.com>
References: <20200304153601.23423-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 0/2] misc: Replace zero-length arrays with
 flexible array member
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAgNCBNYXIgMjAyMCAxNjozNTo1OSArMDEwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgoKPiB2MjoKPiAtIGRvIG5vdCBtb2RpZnkgcWVk
LmggKHN0cnVjdHVyZSB3aXRoIHNpbmdsZSBtZW1iZXIpCj4gLSBiYXNlZCBvbiBody9zY3NpL3Nw
YXByX3ZzY3NpIGZpeCBzZXJpZXMKPiAKPiBUaGlzIGlzIGEgdHJlZS13aWRlIGNsZWFudXAgaW5z
cGlyZWQgYnkgYSBMaW51eCBrZXJuZWwgY29tbWl0Cj4gKGZyb20gR3VzdGF2byBBLiBSLiBTaWx2
YSkuCj4gCj4gLS12LS0gZGVzY3JpcHRpb24gc3RhcnQgLS12LS0KPiAKPiAgIFRoZSBjdXJyZW50
IGNvZGViYXNlIG1ha2VzIHVzZSBvZiB0aGUgemVyby1sZW5ndGggYXJyYXkgbGFuZ3VhZ2UKPiAg
IGV4dGVuc2lvbiB0byB0aGUgQzkwIHN0YW5kYXJkLCBidXQgdGhlIHByZWZlcnJlZCBtZWNoYW5p
c20gdG8KPiAgIGRlY2xhcmUgdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ugb25l
cyBpcyBhIGZsZXhpYmxlCj4gICBhcnJheSBtZW1iZXIgWzFdLCBpbnRyb2R1Y2VkIGluIEM5OToK
PiAKPiAgIHN0cnVjdCBmb28gewo+ICAgICAgIGludCBzdHVmZjsKPiAgICAgICBzdHJ1Y3QgYm9v
IGFycmF5W107Cj4gICB9Owo+IAo+ICAgQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFi
b3ZlLCB3ZSB3aWxsIGdldCBhIGNvbXBpbGVyCj4gICB3YXJuaW5nIGluIGNhc2UgdGhlIGZsZXhp
YmxlIGFycmF5IGRvZXMgbm90IG9jY3VyIGxhc3QgaW4gdGhlCj4gICBzdHJ1Y3R1cmUsIHdoaWNo
IHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQKPiAgIGJlaGF2aW9y
IGJ1Z3MgZnJvbSBiZWluZyB1bmFkdmVydGVubHkgaW50cm9kdWNlZCBbMl0gdG8gdGhlCj4gICBM
aW51eCBjb2RlYmFzZSBmcm9tIG5vdyBvbi4KPiAKPiAtLV4tLSBkZXNjcmlwdGlvbiBlbmQgLS1e
LS0KPiAKPiBEbyB0aGUgc2ltaWxhciBob3VzZWtlZXBpbmcgaW4gdGhlIFFFTVUgY29kZWJhc2Ug
KHdoaWNoIHVzZXMKPiBDOTkgc2luY2UgY29tbWl0IDdiZTQxNjc1ZjdjYikuCj4gCj4gVGhlIGZp
cnN0IHBhdGNoIGlzIGRvbmUgd2l0aCB0aGUgaGVscCBvZiBhIGNvY2NpbmVsbGUgc2VtYW50aWMK
PiBwYXRjaC4gSG93ZXZlciBDb2NjaW5lbGxlIGRvZXMgbm90IHJlY29nbml6ZToKPiAKPiAgIHN0
cnVjdCBmb28gewo+ICAgICAgIGludCBzdHVmZjsKPiAgICAgICBzdHJ1Y3QgYm9vIGFycmF5W107
Cj4gICB9IFFFTVVfUEFDS0VEOwo+IAo+IGJ1dCBkb2VzIHJlY29nbml6ZToKPiAKPiAgIHN0cnVj
dCBRRU1VX1BBQ0tFRCBmb28gewo+ICAgICAgIGludCBzdHVmZjsKPiAgICAgICBzdHJ1Y3QgYm9v
IGFycmF5W107Cj4gICB9Owo+IAo+IEknbSBub3Qgc3VyZSB3aHksIG5laXRoZXIgaXQgaXMgd29y
dGggcmVmYWN0b3JpbmcgYWxsIFFFTVUKPiBzdHJ1Y3R1cmVzIHRvIHVzZSB0aGUgYXR0cmlidXRl
cyBiZWZvcmUgdGhlIHN0cnVjdHVyZSBuYW1lLAo+IHNvIEkgZGlkIHRoZSAybmQgcGF0Y2ggbWFu
dWFsbHkuCj4gCj4gQW55d2F5IHRoaXMgaXMgYW5ub3lpbmcsIGJlY2F1c2UgbWFueSBzdHJ1Y3R1
cmVzIGFyZSBub3QgaGFuZGxlZAo+IGJ5IGNvY2NpbmVsbGUuIE1heWJlIHRoaXMgbmVlZHMgdG8g
YmUgcmVwb3J0ZWQgdG8gdXBzdHJlYW0KPiBjb2NjaW5lbGxlPwo+IAo+IEkgdXNlZCBzcGF0Y2gg
MS4wLjggd2l0aDoKPiAKPiAgIC1JIGluY2x1ZGUgLS1pbmNsdWRlLWhlYWRlcnMgXAo+ICAgLS1t
YWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8tZmlsZS5oIFwKPiAgIC0ta2VlcC1jb21tZW50
cyAtLWluZGVudCA0Cj4gCj4gUmVnYXJkcywKPiAKPiBQaGlsLgo+IAo+IEJhc2VkLW9uOiA8MjAy
MDAzMDQxNTMzMTEuMjI5NTktMS1waGlsbWRAcmVkaGF0LmNvbT4KPiBTdXBlcnNlZGVzOiA8MjAy
MDAzMDQwMDUxMDUuMjc0NTQtMS1waGlsbWRAcmVkaGF0LmNvbT4KCkZvciBhY3BpIHBhcnRzCkFj
a2VkLWJ5OiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPgoKPiAKPiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSAoMik6Cj4gICBtaXNjOiBSZXBsYWNlIHplcm8tbGVuZ3RoIGFycmF5
cyB3aXRoIGZsZXhpYmxlIGFycmF5IG1lbWJlcgo+ICAgICAoYXV0b21hdGljKQo+ICAgbWlzYzog
UmVwbGFjZSB6ZXJvLWxlbmd0aCBhcnJheXMgd2l0aCBmbGV4aWJsZSBhcnJheSBtZW1iZXIgKG1h
bnVhbCkKPiAKPiAgZG9jcy9pbnRlcm9wL3Zob3N0LXVzZXIucnN0ICAgICAgICAgICB8ICA0ICsr
LS0KPiAgYnNkLXVzZXIvcWVtdS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGNv
bnRyaWIvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmggfCAgMiArLQo+ICBody9tNjhrL2Jv
b3RpbmZvLmggICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvc2NzaS9zcnAuaCAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBody94ZW4veGVuX3B0LmggICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oICAg
ICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgaW5jbHVkZS9ody9hcm0vc21tdS1jb21t
b24uaCAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvaHcvYm9hcmRzLmggICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBpbmNsdWRlL2h3L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgICAgIHwg
IDMgKystCj4gIGluY2x1ZGUvaHcvczM5MHgvZXZlbnQtZmFjaWxpdHkuaCAgICAgfCAgMiArLQo+
ICBpbmNsdWRlL2h3L3MzOTB4L3NjbHAuaCAgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAg
aW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWlvbW11LmggICAgICB8ICAyICstCj4gIGluY2x1ZGUv
c3lzZW11L2NyeXB0b2Rldi5oICAgICAgICAgICAgfCAgMiArLQo+ICBpbmNsdWRlL3RjZy90Y2cu
aCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgcGMtYmlvcy9zMzkwLWNjdy9ib290bWFw
LmggICAgICAgICAgICB8ICAyICstCj4gIHBjLWJpb3MvczM5MC1jY3cvc2NscC5oICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICB0ZXN0cy9xdGVzdC9saWJxb3MvYWhjaS5oICAgICAgICAgICAgIHwg
IDIgKy0KPiAgYmxvY2svbGludXgtYWlvLmMgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGJsb2NrL3ZtZGsuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody9hY3Bp
L252ZGltbS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGh3L2NoYXIvc2Ns
cGNvbnNvbGUtbG0uYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBody9jaGFyL3NjbHBjb25zb2xl
LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvZG1hL3NvY19kbWEuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGh3L2kzODYveDg2LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICBody9taXNjL29tYXBfbDQuYyAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgaHcvbnZyYW0vZWVwcm9tOTN4eC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGh3
L3JkbWEvdm13L3B2cmRtYV9xcF9vcHMuYyAgICAgICAgICAgfCAgNCArKy0tCj4gIGh3L3MzOTB4
L3ZpcnRpby1jY3cuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody91c2IvZGV2LW5ldHdv
cmsuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVh
ZGVyLmMgICAgICAgICB8ICA0ICsrLS0KPiAgaHcvdmlydGlvL3ZpcnRpby5jICAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KPiAgbmV0L3F1ZXVlLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gIHRhcmdldC9zMzkweC9pb2luc3QuYyAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICAzNCBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
