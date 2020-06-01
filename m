Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA781EB08E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 23:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfrXm-0001G7-A4; Mon, 01 Jun 2020 21:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nC3Z=7O=amazon.com=prvs=41453e0bb=anchalag@srs-us1.protection.inumbo.net>)
 id 1jfrXk-0001G2-SY
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 21:00:24 +0000
X-Inumbo-ID: e8a41551-a44a-11ea-ab5b-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8a41551-a44a-11ea-ab5b-12813bfff9fa;
 Mon, 01 Jun 2020 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1591045225; x=1622581225;
 h=from:to:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=fEuvPWQ6mNxmTVIB4fqTSu3W/5TlhO+xWmDT2J2ohHQ=;
 b=rJhyrYOJ8eA47HrUsSOmGLvfJDltVGnKT6jKpF+gH6PfXkAkzPl6oYkg
 xFiWBZMOERts8g1HLmQ3No/WRyUd+5Ts+WwrO4OCjCPKYR/HhylOQ4ij3
 62EmuAahW/hCU1hF4CMY4y77WE7OMm3UQ+Eq+uS3NxTe2xNQqgydyUJNg Q=;
IronPort-SDR: WtI90cVJDGe5zcpw5pT/51BLBinCMfVLKX0OQSPdcY2u3K5rkd3R4wJTG/qwSRtUUaCusIRmae
 LfOE1m7vXruw==
X-IronPort-AV: E=Sophos;i="5.73,462,1583193600"; d="scan'208";a="40694304"
Subject: Re: [PATCH 01/12] xen/manage: keep track of the on-going suspend mode
Thread-Topic: [PATCH 01/12] xen/manage: keep track of the on-going suspend mode
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 01 Jun 2020 21:00:21 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 66F69A2018; Mon,  1 Jun 2020 21:00:18 +0000 (UTC)
Received: from EX13D10UWB002.ant.amazon.com (10.43.161.130) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 1 Jun 2020 21:00:18 +0000
Received: from EX13D07UWB001.ant.amazon.com (10.43.161.238) by
 EX13D10UWB002.ant.amazon.com (10.43.161.130) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 1 Jun 2020 21:00:17 +0000
Received: from EX13D07UWB001.ant.amazon.com ([10.43.161.238]) by
 EX13D07UWB001.ant.amazon.com ([10.43.161.238]) with mapi id 15.00.1497.006;
 Mon, 1 Jun 2020 21:00:17 +0000
From: "Agarwal, Anchal" <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org"
 <x86@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "Kamata, Munehisa" <kamatam@amazon.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "konrad.wilk@oracle.com"
 <konrad.wilk@oracle.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "davem@davemloft.net"
 <davem@davemloft.net>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "len.brown@intel.com" <len.brown@intel.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "peterz@infradead.org" <peterz@infradead.org>, "Valentin, Eduardo"
 <eduval@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "Agarwal, Anchal"
 <anchalag@amazon.com>
Thread-Index: AQHWLjSzN2MZpZQ3bUyG5jE4qL1Bj6jBRlQAgAKXNgA=
Date: Mon, 1 Jun 2020 21:00:17 +0000
Message-ID: <F3C676AB-F983-4AB7-A105-093C931EBC77@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <20200519232451.GA18632@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <d360e97f-1935-89f1-6dab-3b0bc6b1b3e2@oracle.com>
In-Reply-To: <d360e97f-1935-89f1-6dab-3b0bc6b1b3e2@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.208]
Content-Type: text/plain; charset="utf-8"
Content-ID: <55C40EA29EEBB04C9AC8B9FE1ACCA901@amazon.com>
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

DQrvu78gICAgQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCg0KDQoNCiAgICBPbiA1LzE5LzIwIDc6MjQgUE0sIEFuY2hhbCBBZ2Fyd2FsIHdyb3Rl
Og0KICAgID4NCiAgICA+ICtlbnVtIHN1c3BlbmRfbW9kZXMgew0KICAgID4gKyAgICAgTk9fU1VT
UEVORCA9IDAsDQogICAgPiArICAgICBYRU5fU1VTUEVORCwNCiAgICA+ICsgICAgIFBNX1NVU1BF
TkQsDQogICAgPiArICAgICBQTV9ISUJFUk5BVElPTiwNCiAgICA+ICt9Ow0KICAgID4gKw0KICAg
ID4gKy8qIFByb3RlY3RlZCBieSBwbV9tdXRleCAqLw0KICAgID4gK3N0YXRpYyBlbnVtIHN1c3Bl
bmRfbW9kZXMgc3VzcGVuZF9tb2RlID0gTk9fU1VTUEVORDsNCiAgICA+ICsNCiAgICA+ICtib29s
IHhlbl9zdXNwZW5kX21vZGVfaXNfeGVuX3N1c3BlbmQodm9pZCkNCiAgICA+ICt7DQogICAgPiAr
ICAgICByZXR1cm4gc3VzcGVuZF9tb2RlID09IFhFTl9TVVNQRU5EOw0KICAgID4gK30NCiAgICA+
ICsNCiAgICA+ICtib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1fc3VzcGVuZCh2b2lkKQ0KICAg
ID4gK3sNCiAgICA+ICsgICAgIHJldHVybiBzdXNwZW5kX21vZGUgPT0gUE1fU1VTUEVORDsNCiAg
ICA+ICt9DQogICAgPiArDQogICAgPiArYm9vbCB4ZW5fc3VzcGVuZF9tb2RlX2lzX3BtX2hpYmVy
bmF0aW9uKHZvaWQpDQogICAgPiArew0KICAgID4gKyAgICAgcmV0dXJuIHN1c3BlbmRfbW9kZSA9
PSBQTV9ISUJFUk5BVElPTjsNCiAgICA+ICt9DQogICAgPiArDQoNCg0KICAgIEkgZG9uJ3Qgc2Vl
IHRoZXNlIGxhc3QgdHdvIHVzZWQgYW55d2hlcmUuIEFyZSB5b3UsIGluIGZhY3QsDQogICAgZGlz
dGluZ3Vpc2hpbmcgYmV0d2VlbiBQTSBzdXNwZW5kIGFuZCBoaWJlcm5hdGlvbj8NCg0KWWVzLCBJ
IGFtLiBVbmxlc3MgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IHRvIGRpc3Rpbmd1aXNoIGF0IHJ1bnRp
bWUgd2hpY2ggSSBoYXZlbid0IGZpZ3VyZWQgb3V0IHlldC4NClRoZSBpbml0aWFsIGRlc2lnbiB3
YXMgdG8gaGF2ZSBzZXBhcmF0ZSBzdGF0ZXMgZm9yIHNlcGFyYXRlIG1vZGVzLiBDdXJyZW50bHks
IFBNX0hJQkVSTkFUSU9OIGlzIGhhbmRsZWQgDQpieSAheGVuX3N1c3BlbmQgLiBIb3dldmVyLCBp
ZiBhbnkgY2FzZSBhcmlzZXMgd2hlcmUgd2UgbmVlZCB0byBzZXQgdGhlIHN1c3BlbmRfbW9kZSwg
aXRzIGF2YWlsYWJsZSB2aWEgDQp0aGlzIGludGVyZmFjZS4gVGhpcyBpcyBiYXNpY2FsbHkgdG8g
c3VwcG9ydCBQTSogb3BzIHZpYSBBQ1BJIHBhdGguIFNpbmNlLCBQTV9TVVNQRU5EIGlzIG5vdCBo
YW5kbGVkIGJ5IHRoZSBzZXJpZXMNCnRoZSBjb2RlIHBpZWNlIGNhbiBiZSByZW1vdmVkIGFuZCBh
ZGRlZCBsYXRlci4gQW55IGNvbW1lbnRzPw0KDQoNCiAgICAoSSB3b3VsZCBhbHNvIHByb2JhYmx5
IHNob3J0ZW4gdGhlIG5hbWUgYSBiaXQsIHBlcmhhcHMNCiAgICB4ZW5faXNfcHYvcG1fc3VzcGVu
ZCgpPykNCg0KU3VyZS4gV2lsbCBmaXggaW4gbXkgbmV4dCByb3VuZCBvZiBwb3N0Lg0KICAgIC1i
b3Jpcw0KDQpUaGFua3MsDQpBbmNoYWwNCg0KDQoNCg0K

