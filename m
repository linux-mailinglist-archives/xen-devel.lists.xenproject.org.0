Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3213BB38
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 09:36:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ire6v-0001Ku-NL; Wed, 15 Jan 2020 08:33:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/NXX=3E=amazon.co.uk=prvs=2768d130c=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ire6u-0001Kp-9Q
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 08:33:08 +0000
X-Inumbo-ID: a819e0dc-3771-11ea-a985-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a819e0dc-3771-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579077188; x=1610613188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ocWGvKzT9rHeLGLw56o19WY9tgHhZErb9cLkoBLDMQs=;
 b=cDeGoeDkeJ4/X5LWWcF+I9+w2M9Fr8MVeW/LOID9eWQ8X3yPnSAVAF0o
 hAG4uj94FhQJJ0IMLu8JfycZK9ZmrgHcvJ3egAVWDY5uy/2hjldPTzDFO
 MOlPz3lSpxRYS0ZPl5C5eEmvU6MHdQOx4+0YOJddGyzwHxwzyhxFqZFjT Q=;
IronPort-SDR: wvOOn/x2BXteConQ492U+xceQNdCh5lUsbwyrpFZL4Y3+BfSDXeps520clpjxzNWVPkesNhQqb
 oX1fkcFm18RQ==
X-IronPort-AV: E=Sophos;i="5.70,322,1574121600"; d="scan'208";a="12455655"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 15 Jan 2020 08:33:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id AECA2A1DEB; Wed, 15 Jan 2020 08:33:04 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 15 Jan 2020 08:33:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 15 Jan 2020 08:33:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 15 Jan 2020 08:33:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
 <jandryuk@gmail.com>
Thread-Topic: [Xen-devel] [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
Thread-Index: AQHVykQofKTNIgpPpkmSOKKDUKIMmKfp72EAgABNlACAADjFgIAA8bAw
Date: Wed, 15 Jan 2020 08:33:02 +0000
Message-ID: <ed1ca41d72bd49c59e5e25044a0a85e0@EX13D32EUC003.ant.amazon.com>
References: <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
 <57dc1083d20a469785f05a2e5250a820@AMSPEX02CL02.citrite.net>
 <cd5f1ecc-576f-b7d0-3090-4f3e4faf6148@citrix.com>
 <CAKf6xpt4XYXn2xHJoVY_ibcaHSw-ED10V7ZGNKuDdkiJ93RS0A@mail.gmail.com>
 <20190322030936.fkiajz5ifgaejkd4@MacBook-Air-de-Roger.local>
 <CAKf6xptP_b-+FuscjsTK9G7pMeVS8drvA_t+xb5bdF2zxxmWfA@mail.gmail.com>
 <CAKf6xpscx9Yukphv7mfK2BPM8HoGW0ddt9zbOZxpV+9LzWxz4g@mail.gmail.com>
 <20200114100406.GF11756@Air-de-Roger>
 <CAKf6xpuDo=FGTOJ9ipmk7nY+qs+pKBWESqY0ah6B1vS3kZsT=A@mail.gmail.com>
 <20200114180457.GG11756@Air-de-Roger>
In-Reply-To: <20200114180457.GG11756@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.165]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IAo+ID4gTGludXggUENJIHN1YnN5dGVtIGhh
cyBhbiBvcHRpb24gcmVzb3VyY2VfYWxpZ25tZW50IHRoYXQgY2FuIGJlCj4gPiBhcHBsaWVkIHRv
IGVpdGhlciBhIHNpbmdsZSBkZXZpY2Ugb3IgYWxsIGRldmljZXMuICBCb290aW5nIHdpdGgKPiA+
IHBjaT1yZXNvdXJjZV9hbGlnbWVudD00MDk2IHdpbGwgYWxpZ24gZWFjaCBkZXZpY2UgdG8gYSBw
YWdlLiAgRG8geW91Cj4gPiB0aGluayBwY2liYWNrIHNob3VsZCBmb3JjZSByZXNvdXJjZV9hbGln
bm1lbnQ9NDA5NiBmb3IgZG9tMD8KPgoKVGhhdCBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYS4KIAo+
IElkZWFsbHkgWGVuIHNob3VsZCBrZWVwIHRyYWNrIG9mIHRoZSBCQVJzIHBvc2l0aW9uIGFuZCBz
aXplIGFuZCByZWZ1c2UKPiB0byBwYXNzdGhyb3VnaCBkZXZpY2VzIHRoYXQgaGF2ZSBCQVJzIHNo
YXJpbmcgYSBwYWdlIHdpdGggb3RoZXIKPiBkZXZpY2VzIEJBUnMuCj4gCj4gPiBBcmUKPiA+IHRo
ZXJlIG90aGVyIE1NSU8gcmFuZ2VzIHRvIGJlIGNvbmNlcm5lZCBhYm91dCBhZGphY2VudCB0byBC
QVJzPwo+IAo+IElJUkMgeW91IGNhbiBoYXZlIHR3byBCQVJzIG9mIGRpZmZlcmVudCBkZXZpY2Vz
IGluIHRoZSBzYW1lIDRLIHBhZ2UsCj4gQkFScyBhcmUgb25seSBhbGlnbmVkIHRvIGl0J3Mgc2l6
ZSwgc28gQkFScyBzbWFsbGVyIHRoYW4gNEsgYXJlIG5vdAo+IHJlcXVpcmVkIHRvIGJlIHBhZ2Ug
YWxpZ25lZC4KCklmIHdlIGhhZCBhIG5vdGlvbiBvZiBhc3NpZ25tZW50IGdyb3VwcyBmb3IgdGhp
cywgYXMgd2VsbCBhcyBkZXZpY2VzIHNoYXJpbmcgcmVxdWVzdGVyIGlkLCB0aGVuIFhlbiB3b3Vs
ZCBub3QgbmVlZCB0byByZWZ1c2UgcGFzcy10aHJvdWdoLCBpdCB3b3VsZCBqdXN0IHJlcXVpcmUg
dGhhdCBhbGwgZGV2aWNlcyBzaGFyaW5nIHRoZSBwYWdlIHdlcmUgcGFzc2VkIHRocm91Z2ggYXMg
YSB1bml0LgoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
