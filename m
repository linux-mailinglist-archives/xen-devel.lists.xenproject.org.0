Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E61793CE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:43:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W9R-0004xX-Mu; Wed, 04 Mar 2020 15:41:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I321=4V=redhat.com=lvivier@srs-us1.protection.inumbo.net>)
 id 1j9W9R-0004xS-5T
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:41:37 +0000
X-Inumbo-ID: a1d3164c-5e2e-11ea-b74d-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a1d3164c-5e2e-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lAdNuAjGjgv4SYnURhSbZNmraG7CFf6sWkfpiNz24Bk=;
 b=DzkP3CtiMZSanryml6PR9t0gtat9khIrWQWMnSZqjixHJLzxW6nL4m91Z/t5HH/SflE5jL
 PPQUm0wMAKN4EhKkPsylyYuQn3/D5Caf72sBGG2WbV1AWusYRvAXqU9g8v5CUBhENeAWbf
 i8DfU/4mXOZdkCgiwyVSoisN6P8Ysxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-9VZBta-_P16OSJWBCocMRQ-1; Wed, 04 Mar 2020 10:41:34 -0500
X-MC-Unique: 9VZBta-_P16OSJWBCocMRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78249800053;
 Wed,  4 Mar 2020 15:41:28 +0000 (UTC)
Received: from [10.36.117.17] (ovpn-117-17.ams2.redhat.com [10.36.117.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4AE227186;
 Wed,  4 Mar 2020 15:41:11 +0000 (UTC)
To: Alexey Kirillov <lekiravi@yandex-team.ru>, Eric Blake
 <eblake@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-5-lekiravi@yandex-team.ru>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <5976574b-8546-dc15-2c79-18c277fb2eff@redhat.com>
Date: Wed, 4 Mar 2020 16:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304130656.16859-5-lekiravi@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v2 4/4] net: Remove field info_str of
 NetClientState
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Pirko <jiri@resnulli.us>,
 yc-core@yandex-team.ru, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAyMCAxNDowNiwgQWxleGV5IEtpcmlsbG92IHdyb3RlOgo+IENvbXBsZXRlbHkg
cmVtb3ZlIHRoZSBpbmZvX3N0ciBmaWVsZCBvZiBzdHJ1Y3QgTmV0Q2xpZW50U3RhdGUgYmVjYXVz
ZQo+IGl0IGlzIG5vIGxvbmdlciByZXF1aXJlZCBkdWUgdG8gdGhlIGFkZGl0aW9uIG9mIHRoZSBR
TVAgcXVlcnktbmV0ZGV2cyBjb21tYW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhleSBLaXJp
bGxvdiA8bGVraXJhdmlAeWFuZGV4LXRlYW0ucnU+Cj4gLS0tCj4gIGh3L25ldC9hbGx3aW5uZXJf
ZW1hYy5jICAgICB8ICAyICstCj4gIGh3L25ldC9kcDgzOTN4LmMgICAgICAgICAgICB8ICAyICst
Cj4gIGh3L25ldC9lMTAwMC5jICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgaHcvbmV0L2UxMDAw
ZS5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L2UxMDAwZV9jb3JlLmMgICAgICAgIHwg
IDIgKy0KPiAgaHcvbmV0L2UxMDAweF9jb21tb24uYyAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L2Vl
cHJvMTAwLmMgICAgICAgICAgIHwgIDUgKysrLS0KPiAgaHcvbmV0L2V0cmF4ZnNfZXRoLmMgICAg
ICAgIHwgIDIgKy0KPiAgaHcvbmV0L2ZzbF9ldHNlYy9ldHNlYy5jICAgIHwgIDIgKy0KPiAgaHcv
bmV0L2Z0Z21hYzEwMC5jICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L2k4MjU5Ni5jICAgICAg
ICAgICAgIHwgIDYgKysrLS0tCj4gIGh3L25ldC9pbXhfZmVjLmMgICAgICAgICAgICB8ICAyICst
Cj4gIGh3L25ldC9sYW45MTE4LmMgICAgICAgICAgICB8ICA0ICsrLS0KPiAgaHcvbmV0L21jZl9m
ZWMuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L21pbGt5bWlzdC1taW5pbWFjMi5jIHwg
IDIgKy0KPiAgaHcvbmV0L21pcHNuZXQuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L25l
MjAwMC1pc2EuYyAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L25lMjAwMC1wY2kuYyAgICAgICAg
IHwgIDIgKy0KPiAgaHcvbmV0L3BjbmV0LmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0
L3JvY2tlci9yb2NrZXJfZnAuYyAgIHwgIDQgKystLQo+ICBody9uZXQvcnRsODEzOS5jICAgICAg
ICAgICAgfCAgNiArKystLS0KPiAgaHcvbmV0L3NtYzkxYzExMS5jICAgICAgICAgIHwgIDIgKy0K
PiAgaHcvbmV0L3NwYXByX2xsYW4uYyAgICAgICAgIHwgIDYgKysrLS0tCj4gIGh3L25ldC9zdGVs
bGFyaXNfZW5ldC5jICAgICB8ICAyICstCj4gIGh3L25ldC9zdW5nZW0uYyAgICAgICAgICAgICB8
ICA0ICsrLS0KPiAgaHcvbmV0L3N1bmhtZS5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0
L3R1bGlwLmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbmV0L3ZpcnRpby1uZXQuYyAgICAg
ICAgIHwgIDggKysrKy0tLS0KPiAgaHcvbmV0L3ZteG5ldDMuYyAgICAgICAgICAgIHwgIDQgKyst
LQo+ICBody9uZXQveGVuX25pYy5jICAgICAgICAgICAgfCAgNCAtLS0tCj4gIGh3L25ldC94Z21h
Yy5jICAgICAgICAgICAgICB8ICAyICstCj4gIGh3L25ldC94aWxpbnhfYXhpZW5ldC5jICAgICB8
ICAyICstCj4gIGh3L25ldC94aWxpbnhfZXRobGl0ZS5jICAgICB8ICAyICstCj4gIGh3L3VzYi9k
ZXYtbmV0d29yay5jICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbmV0L25ldC5oICAgICAgICAg
ICB8ICAzICstLQo+ICBuZXQvbDJ0cHYzLmMgICAgICAgICAgICAgICAgfCAgMyAtLS0KPiAgbmV0
L25ldC5jICAgICAgICAgICAgICAgICAgIHwgIDggKy0tLS0tLS0KPiAgbmV0L3NsaXJwLmMgICAg
ICAgICAgICAgICAgIHwgIDQgLS0tLQo+ICBuZXQvc29ja2V0LmMgICAgICAgICAgICAgICAgfCAy
NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgbmV0L3RhcC5jICAgICAgICAgICAgICAgICAg
IHwgMTIgLS0tLS0tLS0tLS0tCj4gIG5ldC92ZGUuYyAgICAgICAgICAgICAgICAgICB8ICA0IC0t
LS0KPiAgbmV0L3Zob3N0LXVzZXIuYyAgICAgICAgICAgIHwgIDIgLS0KPiAgNDIgZmlsZXMgY2hh
bmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6
IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogTGF1cmVudCBW
aXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
