Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08386178F75
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 12:18:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RzP-0002dI-AM; Wed, 04 Mar 2020 11:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nFHQ=4V=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j9RzO-0002d9-M7
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 11:14:58 +0000
X-Inumbo-ID: 61efafce-5e09-11ea-b52f-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 61efafce-5e09-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583320497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSK98NP1FXKbRshKg14Z6I9R093MnlZSyFArmEQhph8=;
 b=jVHxVYDqsIgygnbH0IAylxxviwMJxVk/KprJa4S6uQHHTo/1CD7Bqw5BEaTwSCsA+ucBFt
 BIgwNLQO3MGBbrvHpZnChSPqItNPYgtpjNaJICaZ3c6ckJqcDu/4v4s5QbfqErFMSFR1SZ
 DvAqCINeJL9uscMOlskjq4KIqxqx+nw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-hpsKYO2aMe23KprQjK_6uw-1; Wed, 04 Mar 2020 06:14:56 -0500
X-MC-Unique: hpsKYO2aMe23KprQjK_6uw-1
Received: by mail-wr1-f71.google.com with SMTP id w8so707798wrn.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 03:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AWb2lS/0Q4WHKen5zSqK5CWqt+E1FAZE9sUsehJoDaA=;
 b=LKPweujereKWiAsLwiDPaXvEV8J47GW1mjjFP8StG5qBXLRXRoe7SmzhMIxBFXAMEu
 2gqTZXGpQl+iiyqyU5cg0yr73kGe6/5m76dbXs5U+WWDMmKJjWL9Zyg2r+fHkXsNe5YD
 wX3MEPJWPkQXm6X4JBuNH5/5fKmIbXc05ZJc1wS+urMAfh62Oli5+wbeyUFcKsBEvnGU
 KomRKzW7A+CAOvayAbdqDnTiU0p62VxFcOTydtMyOAYh8PpKE4LXpIq2jA2hMLXZNctw
 LnzpqYRg/4UOympzwk+a2D+5ZtL+8CL9dXkU/gN8zUw62oxXPX/Kz7P/mcaB1uoTJ9/3
 8pLA==
X-Gm-Message-State: ANhLgQ0r063HxCWwnBnTT5pn9O+G6ElgXPnkJfIBfcBOSm0weLXLEgjc
 4EVZp6zxow23353siIpAAZI6UHZ8p/noy85Fx0WpiVwWlBUwm2H2Kd3h8CxO3svY0El3Mr4RTXq
 W3otGXSWGFkELUJ+ChqocMqNyD6E=
X-Received: by 2002:adf:b609:: with SMTP id f9mr3364441wre.380.1583320494959; 
 Wed, 04 Mar 2020 03:14:54 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuhY3YUEefrzO8BOCtqRLYBt54qdDwnDOEIPq+r1gfcWz9xqg2WwOWhIwqFr0RVqL8jYffVNQ==
X-Received: by 2002:adf:b609:: with SMTP id f9mr3364408wre.380.1583320494634; 
 Wed, 04 Mar 2020 03:14:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id i7sm4213331wma.32.2020.03.04.03.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 03:14:53 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <447f74eb-d47e-e03c-5686-ae02a700d040@redhat.com>
Date: Wed, 4 Mar 2020 12:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304005105.27454-1-philmd@redhat.com>
Content-Language: en-US
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAgMDE6NTEsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFRoaXMg
aXMgYSB0cmVlLXdpZGUgY2xlYW51cCBpbnNwaXJlZCBieSBhIExpbnV4IGtlcm5lbCBjb21taXQK
PiAoZnJvbSBHdXN0YXZvIEEuIFIuIFNpbHZhKS4KPiAKPiAtLXYtLSBkZXNjcmlwdGlvbiBzdGFy
dCAtLXYtLQo+IAo+ICAgVGhlIGN1cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJv
LWxlbmd0aCBhcnJheSBsYW5ndWFnZQo+ICAgZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQs
IGJ1dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0bwo+ICAgZGVjbGFyZSB2YXJpYWJsZS1sZW5n
dGggdHlwZXMgc3VjaCBhcyB0aGVzZSBvbmVzIGlzIGEgZmxleGlibGUKPiAgIGFycmF5IG1lbWJl
ciBbMV0sIGludHJvZHVjZWQgaW4gQzk5Ogo+IAo+ICAgc3RydWN0IGZvbyB7Cj4gICAgICAgaW50
IHN0dWZmOwo+ICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiAgIH07Cj4gCj4gICBCeSBtYWtp
bmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwgZ2V0IGEgY29tcGlsZXIKPiAg
IHdhcm5pbmcgaW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBp
biB0aGUKPiAgIHN0cnVjdHVyZSwgd2hpY2ggd2lsbCBoZWxwIHVzIHByZXZlbnQgc29tZSBraW5k
IG9mIHVuZGVmaW5lZAo+ICAgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nIHVuYWR2ZXJ0ZW5seSBp
bnRyb2R1Y2VkIFsyXSB0byB0aGUKPiAgIExpbnV4IGNvZGViYXNlIGZyb20gbm93IG9uLgo+IAo+
IC0tXi0tIGRlc2NyaXB0aW9uIGVuZCAtLV4tLQo+IAo+IERvIHRoZSBzaW1pbGFyIGhvdXNla2Vl
cGluZyBpbiB0aGUgUUVNVSBjb2RlYmFzZSAod2hpY2ggdXNlcwo+IEM5OSBzaW5jZSBjb21taXQg
N2JlNDE2NzVmN2NiKS4KPiAKPiBUaGUgZmlyc3QgcGF0Y2ggaXMgZG9uZSB3aXRoIHRoZSBoZWxw
IG9mIGEgY29jY2luZWxsZSBzZW1hbnRpYwo+IHBhdGNoLiBIb3dldmVyIENvY2NpbmVsbGUgZG9l
cyBub3QgcmVjb2duaXplOgo+IAo+ICAgc3RydWN0IGZvbyB7Cj4gICAgICAgaW50IHN0dWZmOwo+
ICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiAgIH0gUUVNVV9QQUNLRUQ7Cj4gCj4gYnV0IGRv
ZXMgcmVjb2duaXplOgo+IAo+ICAgc3RydWN0IFFFTVVfUEFDS0VEIGZvbyB7Cj4gICAgICAgaW50
IHN0dWZmOwo+ICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiAgIH07Cj4gCj4gSSdtIG5vdCBz
dXJlIHdoeSwgbmVpdGhlciBpdCBpcyB3b3J0aCByZWZhY3RvcmluZyBhbGwgUUVNVQo+IHN0cnVj
dHVyZXMgdG8gdXNlIHRoZSBhdHRyaWJ1dGVzIGJlZm9yZSB0aGUgc3RydWN0dXJlIG5hbWUsCj4g
c28gSSBkaWQgdGhlIDJuZCBwYXRjaCBtYW51YWxseS4KPiAKPiBBbnl3YXkgdGhpcyBpcyBhbm5v
eWluZywgYmVjYXVzZSBtYW55IHN0cnVjdHVyZXMgYXJlIG5vdCBoYW5kbGVkCj4gYnkgY29jY2lu
ZWxsZS4gTWF5YmUgdGhpcyBuZWVkcyB0byBiZSByZXBvcnRlZCB0byB1cHN0cmVhbQo+IGNvY2Np
bmVsbGU/Cj4gCj4gSSB1c2VkIHNwYXRjaCAxLjAuOCB3aXRoOgo+IAo+ICAgLUkgaW5jbHVkZSAt
LWluY2x1ZGUtaGVhZGVycyBcCj4gICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1m
aWxlLmggXAo+ICAgLS1rZWVwLWNvbW1lbnRzIC0taW5kZW50IDQKPiAKPiBSZWdhcmRzLAo+IAo+
IFBoaWwuCj4gCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDIpOgo+ICAgbWlzYzogUmVwbGFj
ZSB6ZXJvLWxlbmd0aCBhcnJheXMgd2l0aCBmbGV4aWJsZSBhcnJheSBtZW1iZXIKPiAgICAgKGF1
dG9tYXRpYykKPiAgIG1pc2M6IFJlcGxhY2UgemVyby1sZW5ndGggYXJyYXlzIHdpdGggZmxleGli
bGUgYXJyYXkgbWVtYmVyIChtYW51YWwpCj4gCj4gIGRvY3MvaW50ZXJvcC92aG9zdC11c2VyLnJz
dCAgICAgICAgICAgfCAgNCArKy0tCj4gIGJsb2NrL3FlZC5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBic2QtdXNlci9xZW11LmggICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgY29udHJpYi9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIuaCB8ICAyICstCj4g
IGh3L202OGsvYm9vdGluZm8uaCAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody9zY3Np
L3NycC5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGh3L3hlbi94ZW5f
cHQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBpbmNsdWRlL2h3L2FjcGkvYWNw
aS1kZWZzLmggICAgICAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQo+ICBpbmNsdWRlL2h3L2Fy
bS9zbW11LWNvbW1vbi5oICAgICAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9ody9ib2FyZHMuaCAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvaHcvaTM4Ni9pbnRlbF9pb21tdS5o
ICAgICAgICAgfCAgMyArKy0KPiAgaW5jbHVkZS9ody9zMzkweC9ldmVudC1mYWNpbGl0eS5oICAg
ICB8ICAyICstCj4gIGluY2x1ZGUvaHcvczM5MHgvc2NscC5oICAgICAgICAgICAgICAgfCAgOCAr
KysrLS0tLQo+ICBpbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8taW9tbXUuaCAgICAgIHwgIDIgKy0K
PiAgaW5jbHVkZS9zeXNlbXUvY3J5cHRvZGV2LmggICAgICAgICAgICB8ICAyICstCj4gIGluY2x1
ZGUvdGNnL3RjZy5oICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBwYy1iaW9zL3MzOTAt
Y2N3L2Jvb3RtYXAuaCAgICAgICAgICAgIHwgIDIgKy0KPiAgcGMtYmlvcy9zMzkwLWNjdy9zY2xw
LmggICAgICAgICAgICAgICB8ICAyICstCj4gIHRlc3RzL3F0ZXN0L2xpYnFvcy9haGNpLmggICAg
ICAgICAgICAgfCAgMiArLQo+ICBibG9jay9saW51eC1haW8uYyAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgYmxvY2svdm1kay5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGh3L2FjcGkvbnZkaW1tLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAg
aHcvY2hhci9zY2xwY29uc29sZS1sbS5jICAgICAgICAgICAgICB8ICAyICstCj4gIGh3L2NoYXIv
c2NscGNvbnNvbGUuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody9kbWEvc29jX2RtYS5j
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvaTM4Ni94ODYuYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIGh3L21pc2Mvb21hcF9sNC5jICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBody9udnJhbS9lZXByb205M3h4LmMgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgaHcvcmRtYS92bXcvcHZyZG1hX3FwX29wcy5jICAgICAgICAgICB8ICA0ICsrLS0K
PiAgaHcvczM5MHgvdmlydGlvLWNjdy5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGh3L3Vz
Yi9kZXYtbmV0d29yay5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody91c2IvZGV2LXNt
YXJ0Y2FyZC1yZWFkZXIuYyAgICAgICAgIHwgIDQgKystLQo+ICBody92aXJ0aW8vdmlydGlvLmMg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBuZXQvcXVldWUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPiAgdGFyZ2V0L3MzOTB4L2lvaW5zdC5jICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIDM1IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDUzIGRl
bGV0aW9ucygtKQo+IAoKUXVldWVkIChtaW51cyB0aGUgcWVkIHBhcnQpLgoKUGFvbG8KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
