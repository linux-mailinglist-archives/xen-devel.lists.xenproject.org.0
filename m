Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D623F1DDCC6
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 03:45:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbwjB-0004Sm-3p; Fri, 22 May 2020 01:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mxxc=7E=amazon.com=prvs=40441b980=sblbir@srs-us1.protection.inumbo.net>)
 id 1jbwj9-0004Sh-H9
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 01:43:59 +0000
X-Inumbo-ID: b49481bc-9bcd-11ea-b07b-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b49481bc-9bcd-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1590111840; x=1621647840;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=n/q9AlKaX0CH8H7SaLZwpolAQTXmIBZYGWFCXorwbbQ=;
 b=CwtmrhpQPU7Cvs03uzOHy/+EZjA8PmkyQo/M7u8XakiFxZxOmRDiDVpN
 KqO//tjbD8rZZh4t9Zc7MSt6/RckzaMab7YvSEFpu+sahGaYZokVHk1Oz
 wh77U3kSmYFkKje2xBB8rliaRMTOCx1x/jOFHk+KT7tNk0dzS0kJtWuhR 4=;
IronPort-SDR: 10RDmI1c2uqp4SDgqcSm7g8lCY0lagez6ZlQ+gRsxTPsmKfrlLAe2ZGpTRamKe9T1KvVjxsLMt
 9gULPZ8gXQeQ==
X-IronPort-AV: E=Sophos;i="5.73,419,1583193600"; d="scan'208";a="31753098"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 22 May 2020 01:43:47 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 119F7A2193; Fri, 22 May 2020 01:43:39 +0000 (UTC)
Received: from EX13D10UWB004.ant.amazon.com (10.43.161.121) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 01:43:39 +0000
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13D10UWB004.ant.amazon.com (10.43.161.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 01:43:39 +0000
Received: from EX13D01UWB002.ant.amazon.com ([10.43.161.136]) by
 EX13d01UWB002.ant.amazon.com ([10.43.161.136]) with mapi id 15.00.1497.006;
 Fri, 22 May 2020 01:43:39 +0000
From: "Singh, Balbir" <sblbir@amazon.com>
To: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "peterz@infradead.org" <peterz@infradead.org>, 
 "Woodhouse, David" <dwmw@amazon.co.uk>, "vkuznets@redhat.com"
 <vkuznets@redhat.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "Valentin, Eduardo" <eduval@amazon.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "jgross@suse.com"
 <jgross@suse.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "x86@kernel.org" <x86@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "mingo@redhat.com"
 <mingo@redhat.com>, "Kamata, Munehisa" <kamatam@amazon.com>, "pavel@ucw.cz"
 <pavel@ucw.cz>, "bp@alien8.de" <bp@alien8.de>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation
Thread-Topic: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation
Thread-Index: AQHWLjUeTCtt92OWtESWVO30imQxZaizODaAgAAgMwA=
Date: Fri, 22 May 2020 01:43:38 +0000
Message-ID: <eea5ebc9adcd46b368c8d856e865a411b946f364.camel@amazon.com>
References: <ad580b4d5b76c18fe2fe409704f25622e01af361.1589926004.git.anchalag@amazon.com>
 <20200521234823.GA2131@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
In-Reply-To: <20200521234823.GA2131@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.175]
Content-Type: text/plain; charset="utf-8"
Content-ID: <415874684795E24488089E35061B3040@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBAQCAtMTA1Nyw3ICsxMDYzLDcgQEAgc3RhdGljIGludCB4ZW5fdHJhbnNsYXRlX3ZkZXYoaW50
IHZkZXZpY2UsIGludCAqbWlub3IsIHVuc2lnbmVkIGludCAqb2Zmc2V0KQ0KPiAgCQljYXNlIFhF
Tl9TQ1NJX0RJU0s1X01BSk9SOg0KPiAgCQljYXNlIFhFTl9TQ1NJX0RJU0s2X01BSk9SOg0KPiAg
CQljYXNlIFhFTl9TQ1NJX0RJU0s3X01BSk9SOg0KPiAtCQkJKm9mZnNldCA9ICgqbWlub3IgLyBQ
QVJUU19QRVJfRElTSykgKyANCj4gKwkJCSpvZmZzZXQgPSAoKm1pbm9yIC8gUEFSVFNfUEVSX0RJ
U0spICsNCj4gIAkJCQkoKG1ham9yIC0gWEVOX1NDU0lfRElTSzFfTUFKT1IgKyAxKSAqIDE2KSAr
DQo+ICAJCQkJRU1VTEFURURfU0RfRElTS19OQU1FX09GRlNFVDsNCj4gIAkJCSptaW5vciA9ICpt
aW5vciArDQo+IEBAIC0xMDcyLDcgKzEwNzgsNyBAQCBzdGF0aWMgaW50IHhlbl90cmFuc2xhdGVf
dmRldihpbnQgdmRldmljZSwgaW50ICptaW5vciwgdW5zaWduZWQgaW50ICpvZmZzZXQpDQo+ICAJ
CWNhc2UgWEVOX1NDU0lfRElTSzEzX01BSk9SOg0KPiAgCQljYXNlIFhFTl9TQ1NJX0RJU0sxNF9N
QUpPUjoNCj4gIAkJY2FzZSBYRU5fU0NTSV9ESVNLMTVfTUFKT1I6DQo+IC0JCQkqb2Zmc2V0ID0g
KCptaW5vciAvIFBBUlRTX1BFUl9ESVNLKSArIA0KPiArCQkJKm9mZnNldCA9ICgqbWlub3IgLyBQ
QVJUU19QRVJfRElTSykgKw0KPiAgCQkJCSgobWFqb3IgLSBYRU5fU0NTSV9ESVNLOF9NQUpPUiAr
IDgpICogMTYpICsNCj4gIAkJCQlFTVVMQVRFRF9TRF9ESVNLX05BTUVfT0ZGU0VUOw0KPiAgCQkJ
Km1pbm9yID0gKm1pbm9yICsNCg0KVGhlc2Ugc2VlbSBsaWtlIHdoaXRlc3BhY2UgZml4ZXM/IElm
IHNvLCB0aGV5IHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoDQoNCkJhbGJpcg0KDQo=

