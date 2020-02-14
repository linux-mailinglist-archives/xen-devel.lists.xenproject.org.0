Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89215FABB
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:40:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kX2-0002iy-F5; Fri, 14 Feb 2020 23:38:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kX0-0002it-HW
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:37:58 +0000
X-Inumbo-ID: 07acf66e-4f83-11ea-bb5b-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07acf66e-4f83-11ea-bb5b-12813bfff9fa;
 Fri, 14 Feb 2020 23:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581723479; x=1613259479;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EQ7DYgwRNfv/wLxL7rAiSYHGXBWj+UpFbImhG+fPeeA=;
 b=qO6/XWfRZie+dRsEEt1BE/HHuSLie96aoJpDpFtqdhiPSS5jilvH9ONV
 9fSomL2A3LfP0UvwhxMqIcZv+EEXzw6gPK4bGgM1n0hmByzo8r30p7lSU
 6OH/rM0f8EZSYUNSMJ22iLyeGKncZfIJHkjmYxyQVppsYi9e5cmIprNrq I=;
IronPort-SDR: Q+WsFLrDc545+uyxEQXx2T1ZRLEWdxxBOun40BWcJP2NUiHjjlq24uaOoUb2DTvjrBMDx/6M8O
 LKQVe6HaWxjw==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="16799280"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 14 Feb 2020 23:37:56 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id C02A6A25F4; Fri, 14 Feb 2020 23:37:48 +0000 (UTC)
Received: from EX13D05UWB001.ant.amazon.com (10.43.161.181) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:37:47 +0000
Received: from EX13D07UWB001.ant.amazon.com (10.43.161.238) by
 EX13D05UWB001.ant.amazon.com (10.43.161.181) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:37:46 +0000
Received: from EX13D07UWB001.ant.amazon.com ([10.43.161.238]) by
 EX13D07UWB001.ant.amazon.com ([10.43.161.238]) with mapi id 15.00.1367.000;
 Fri, 14 Feb 2020 23:37:46 +0000
From: "Agarwal, Anchal" <anchalag@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com"
 <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "jgross@suse.com"
 <jgross@suse.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Kamata, Munehisa"
 <kamatam@amazon.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "roger.pau@citrix.com"
 <roger.pau@citrix.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "davem@davemloft.net" <davem@davemloft.net>, "rjw@rjwysocki.net"
 <rjw@rjwysocki.net>, "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "peterz@infradead.org" <peterz@infradead.org>, 
 "Valentin, Eduardo" <eduval@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>
Thread-Topic: [RFC PATCH v3 00/12] Enable PM hibernation on guest VMs
Thread-Index: AQHV4fPo8eXu12vqTkyMeBw6bIMui6gY9+iAgAHdmAA=
Date: Fri, 14 Feb 2020 23:37:46 +0000
Message-ID: <F2086290-8DF5-4CD5-B142-DA9FD85D27E1@amazon.com>
References: <20200212222935.GA3421@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <87a75m3ftk.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87a75m3ftk.fsf@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.233]
Content-ID: <7EB21256422AE247A547687FA7DB3733@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH v3 00/12] Enable PM hibernation on guest
 VMs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBkaWQgcmVzZW5kIHRoZW0gdG9kYXkuIEFwb2xvZ2llcyBmb3IgZGVsYXkNCmh0dHBzOi8vbGtt
bC5vcmcvbGttbC8yMDIwLzIvMTQvMjc4OQ0KDQpUaGFua3MsDQpBbmNoYWwNCg0K77u/ICAgIEFu
Y2hhLA0KICAgIA0KICAgIEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPiB3cml0
ZXM6DQogICAgDQogICAgPiBIZWxsbywNCiAgICA+IEkgYW0gc2VuZGluZyBvdXQgYSB2MyB2ZXJz
aW9uIG9mIHNlcmllcyBvZiBwYXRjaGVzIHRoYXQgaW1wbGVtZW50cyBndWVzdA0KICAgID4gUE0g
aGliZXJuYXRpb24uDQogICAgDQogICAgY2FuIHlvdSBwcmV0dHkgcGxlYXNlIHRocmVhZCB5b3Vy
IHBhdGNoIHNlcmllcyBzbyB0aGF0IHRoZSAxLW4vbiBtYWlscw0KICAgIGhhdmUgYQ0KICAgIA0K
ICAgICAgUmVmZXJlbmNlczogPG1lc3NhZ2UtaWQtb2YtMC1vZi1uLW1haWxAd2hhdGV2ZXJ5b3Vy
Y2xpZW50cHV0c3RoZXJlPg0KICAgIA0KICAgIGluIHRoZSBoZWFkZXJzPyBnaXQtc2VuZC1lbWFp
bCBkb2VzIHRoYXQgcHJvcGVyIGFzIGRvIG90aGVyIHRvb2xzLg0KICAgIA0KICAgIENvbGxlY3Rp
bmcgdGhlIGluZGl2aWR1YWwgbWFpbHMgaXMgcGFpbmZ1bC4NCiAgICANCiAgICBUaGFua3MsDQog
ICAgDQogICAgICAgICAgICB0Z2x4DQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
