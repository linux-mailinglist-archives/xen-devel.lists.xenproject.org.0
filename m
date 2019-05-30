Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D62FBA2
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 14:36:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWKEM-0003Rw-F1; Thu, 30 May 2019 12:32:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bSuJ=T6=amazon.com=prvs=0468485c6=anchalag@srs-us1.protection.inumbo.net>)
 id 1hWKEL-0003Rr-0Q
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 12:32:25 +0000
X-Inumbo-ID: f99798d9-82d6-11e9-8980-bc764e045a96
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f99798d9-82d6-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1559219543; x=1590755543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GMk8+adGK5vN4C/6KWIWty74TJ0xOCCRqK6YeRNytCk=;
 b=JIhhh4Z4khZfsXdXiRKts8wunw7srl3g3KBtfT6qyYUoJiZIZb4it4ul
 Z/6g3PUFm2+6YRIR7730PkqJcEfr/fgmetXOwokhMa6swkynOwwP3CJcy
 UykJuDbt+vw8hg0FJiiNDg4EZJLhaRC/2uBLk+NPbGRHmMW8IjsY49HJr Q=;
X-IronPort-AV: E=Sophos;i="5.60,531,1549929600"; d="scan'208";a="398654532"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 May 2019 12:32:21 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9E5B6C5A7B; Thu, 30 May 2019 12:32:20 +0000 (UTC)
Received: from EX13D10UWB004.ant.amazon.com (10.43.161.121) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 May 2019 12:32:20 +0000
Received: from EX13D07UWB001.ant.amazon.com (10.43.161.238) by
 EX13D10UWB004.ant.amazon.com (10.43.161.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 May 2019 12:32:19 +0000
Received: from EX13D07UWB001.ant.amazon.com ([10.43.161.238]) by
 EX13D07UWB001.ant.amazon.com ([10.43.161.238]) with mapi id 15.00.1367.000;
 Thu, 30 May 2019 12:32:19 +0000
From: "Agarwal, Anchal" <anchalag@amazon.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Anchal Agarwal
 <anchalag@amzn.com>, "Oleksandr_Andrushchenko@epam.com"
 <Oleksandr_Andrushchenko@epam.com>
Thread-Topic: [Xen-devel] [PATCH] xen/netfront: Remove unneeded .resume
 callback
Thread-Index: AQHU3XHlCpbiTAsN1kC5I2kNeHI9laYT5R2AgAOYd4CAB5efmIACqUoAgEvnMYCAFfGGgA==
Date: Thu, 30 May 2019 12:32:19 +0000
Message-ID: <F76E91F5-0981-4233-A7F9-072B7026D404@amazon.com>
References: <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
 <ecc825e6-89d3-bbd5-5243-5cc66fa93045@oracle.com>
 <b55d4f90-100c-7a2a-9651-c99c06953465@gmail.com>
 <09afcdca-258f-e5ca-5c31-b7fd079eb213@oracle.com>
 <3e868e7a-4872-e8ab-fd2c-90917ad6d593@arm.com>
 <d709d185-5345-c463-3fd1-e711f954e58a@gmail.com>
 <435369ba-ad3b-1d3a-c2f4-babe8bb6189c@amazon.com>
 <fde362d0-dd48-9c9a-e71a-8fb158909551@epam.com>
 <20190325173011.GA20277@kaos-source-ops-60001.pdx1.amazon.com>
 <f5e824de-da57-9574-3813-2668f2932a6e@gmail.com>
 <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
 <48fedb13-5af2-e7cf-d182-0f2bb385dda2@gmail.com>
In-Reply-To: <48fedb13-5af2-e7cf-d182-0f2bb385dda2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.145]
Content-ID: <1AE9E09634A3B34695C563DBA263885A@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/netfront: Remove unneeded .resume
 callback
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLA0KDQrvu78gICAgSGVsbG8sIEFuY2hhbCENCiAgICANCiAgICBPbiAzLzI5
LzE5IDE6MTkgQU0sIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOg0KICAgIFtzbmlwXQ0KICAgID4+Pj4g
R3JlYXQsIGNvdWxkIHlvdSBwbGVhc2UgbGV0IHVzIGtub3cgd2hhdCBpcyB0aGUgcHJvZ3Jlc3Mg
YW5kIGZ1cnRoZXIgcGxhbnMNCiAgICA+Pj4+IG9uIHRoYXQsIHNvIHdlIGRvIG5vdCB3b3JrIG9u
IHRoZSBzYW1lIGNvZGUgYW5kIGNhbiBjb29yZGluYXRlIG91cg0KICAgID4+Pj4gZWZmb3J0cyBz
b21laG93PyBBbmNoYWwsIGNvdWxkIHlvdSBwbGVhc2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRoaXM/
DQogICAgPj4+IExvb2tzIGxpa2UgbXkgcHJldmlvdXMgZW1haWwgZGlkIG5vdCBtYWtlIGl0IHRv
IG1haWxpbmcgbGlzdC4gTWF5IGJlIHNvbWUgaXNzdWVzIHdpdGggbXkNCiAgICA+Pj4gZW1haWwg
c2VydmVyIHNldHRpbmdzLiBHaXZpbmcgaXQgYW5vdGhlciBzaG90Lg0KICAgID4+PiBZZXMsIEkg
YW0gd29ya2luZyBvbiB0aG9zZSBwYXRjaGVzIGFuZCBwbGFuIHRvIHJlLXBvc3QgdGhlbSBpbiBh
biBlZmZvcnQgdG8gdXBzdHJlYW0uDQogICAgPj4gVGhpcyBpcyByZWFsbHkgZ3JlYXQsIGxvb2tp
bmcgZm9yd2FyZCB0byBpdDogYW55IGRhdGUgaW4geW91ciBtaW5kDQogICAgPj4gd2hlbiB0aGlz
IGNhbiBoYXBwZW4/DQogICAgPiBOb3QgYSBzcGVjaWZpYyBkYXRlIGJ1dCBtYXkgYmUgaW4gZmV3
IHdlZWtzLiBJIGFtIGN1cnJlbnRseSBzd2FtcGVkIGF0IHdvcmsuDQogICAgPg0KICAgIEFueSBw
cm9ncmVzcyBvbiB0aGlzPw0KDQpZZXMsIGJ1dCBhdCBhIHNuYWlsJ3MgcGFjZS4NCiAgICANCiAg
ICBUaGFuayB5b3UsDQogICAgT2xla3NhbmRyDQoNClRoYW5rcywNCkFuY2hhbCAgICANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
