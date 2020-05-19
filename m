Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322951DA589
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:29:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBg7-0006Cd-TO; Tue, 19 May 2020 23:29:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgSX=7B=amazon.com=prvs=401c57c8a=sblbir@srs-us1.protection.inumbo.net>)
 id 1jbBg6-0006CK-H0
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:29:42 +0000
X-Inumbo-ID: 9d683f66-9a28-11ea-b9cf-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d683f66-9a28-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930982; x=1621466982;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8yZoMAyXrRYJVt5Iyc8YC1zGknZc8xmhubY/BGGSFCw=;
 b=CWOUD2QVMZ0N7mOBIcUZN45QnIPX0rPuhHJgdHnu95RELwFSaOKNsw24
 AAQtoNz/iQbTZ41WI55PTJSNUw7s+jZg7mlupEYxX6HYz6JXouf/dpjxK
 +GtDdlUudDBeWcZChyOphyk3FTrGQ9eMXXOYsNW1iidtT3kuOHicRemfh M=;
IronPort-SDR: hykFHVKUxK6DZ14+U9SJdTDE56dr5hWCBRiFClMEcEe84C8zjyl5L9RuS+Y8800ogb50L6wed6
 oshAh/tPsu7w==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="31067168"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 19 May 2020 23:29:28 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 91F4CA1E08; Tue, 19 May 2020 23:29:26 +0000 (UTC)
Received: from EX13D10UWB001.ant.amazon.com (10.43.161.111) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:29:26 +0000
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13D10UWB001.ant.amazon.com (10.43.161.111) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:29:25 +0000
Received: from EX13D01UWB002.ant.amazon.com ([10.43.161.136]) by
 EX13d01UWB002.ant.amazon.com ([10.43.161.136]) with mapi id 15.00.1497.006;
 Tue, 19 May 2020 23:29:25 +0000
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
Subject: Re: [PATCH 05/12] genirq: Shutdown irq chips in suspend/resume during
 hibernation
Thread-Topic: [PATCH 05/12] genirq: Shutdown irq chips in suspend/resume
 during hibernation
Thread-Index: AQHWLjTykqjazEodhU6xyc4OZjlkO6iwDkCA
Date: Tue, 19 May 2020 23:29:25 +0000
Message-ID: <d489ede4d70ae22a601ee0afc92bda936baa8b11.camel@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <fce013fc1348f02b8e4ec61e7a631093c72f993c.1589926004.git.anchalag@amazon.com>
In-Reply-To: <fce013fc1348f02b8e4ec61e7a631093c72f993c.1589926004.git.anchalag@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9AD7F83A1AFE949822D37CF84235DA3@amazon.com>
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

T24gVHVlLCAyMDIwLTA1LTE5IGF0IDIzOjI2ICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90ZToN
Cj4gU2lnbmVkLW9mZi0tYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0K
DQpUaGUgU2lnbmVkLW9mZi1ieSBsaW5lIG5lZWRzIHRvIGJlIGZpeGVkIChoaW50OiB5b3UgaGF2
ZSAtLSkNCg0KQmFsYmlyIFNpbmdoDQoNCg==

