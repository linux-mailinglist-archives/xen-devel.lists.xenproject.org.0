Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D431405E2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:14:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNf8-00043g-O4; Fri, 17 Jan 2020 09:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZlyK=3G=amazon.co.uk=prvs=278c75273=pdurrant@srs-us1.protection.inumbo.net>)
 id 1isNf6-00043Y-LF
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:11:28 +0000
X-Inumbo-ID: 5639c11c-3909-11ea-888e-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5639c11c-3909-11ea-888e-12813bfff9fa;
 Fri, 17 Jan 2020 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579252285; x=1610788285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cCYDRmPVsr0ClJPNSgdSw1ReQagAOP18t3zgXnIrLG0=;
 b=Abg0imWOb7+SKTHtAuLpEVlarepXmHnNC806xNlzMCwadKyytK/M9jxT
 ugEu27DupHh5RWTbtY5a7dpSOhRjphODBaRUjLfpr7dMhEEno4527TNUy
 /LwBx0IJcz9pFyiFLx26f6cerZJCgrpqz9oCDReTHOyVCsaLZy+XkB40J 8=;
IronPort-SDR: UtGmjOCpP3csvpcJ8eKCwAiofrVDknO5RMlEf3QQr79csZCwN0pMHtRNmky7lDE+feI2fgWu11
 ENr6VrT+Qz7g==
X-IronPort-AV: E=Sophos;i="5.70,329,1574121600"; d="scan'208";a="11941678"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 17 Jan 2020 09:11:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4C645A2DB9; Fri, 17 Jan 2020 09:11:20 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 09:11:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 09:11:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 17 Jan 2020 09:11:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v3 0/6] xl/libxl: domid allocation/preservation changes
Thread-Index: AQHVzFBiSfITtGYxfU2pLx/eKiR6C6ftoQsAgADwXZA=
Date: Fri, 17 Jan 2020 09:11:19 +0000
Message-ID: <f460a9d83f094eaba5b5072c12848d7e@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <24096.44750.716272.872008@mariner.uk.xensource.com>
In-Reply-To: <24096.44750.716272.872008@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.74]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 0/6] xl/libxl: domid
 allocation/preservation changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "jandryuk@gmail.com" <jandryuk@gmail.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE2IEphbnVhcnkgMjAyMCAxOTo0Mwo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Owo+IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT47Cj4gamFuZHJ5dWtAZ21haWwuY29tOyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkKPiBMaXUgPHds
QHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzZdIHhsL2xpYnhsOiBkb21pZCBh
bGxvY2F0aW9uL3ByZXNlcnZhdGlvbgo+IGNoYW5nZXMKPiAKPiBQYXVsIER1cnJhbnQgd3JpdGVz
ICgiW1BBVENIIHYzIDAvNl0geGwvbGlieGw6IGRvbWlkCj4gYWxsb2NhdGlvbi9wcmVzZXJ2YXRp
b24gY2hhbmdlcyIpOgo+ID4gVGhpcyBzZXJpZXMgd2FzIHByZXZpb3VzbHkgbmFtZWQgInhsL2xp
YnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zCj4gd2l0aAo+ID4gYSBzcGVjaWZpZWQgZG9t
aWQiLgo+IAo+IFRoYW5rcy4gIEkgdGhpbmsgQW50aG9ueSBvdWdodCB0byBoYXZlIGJlZW4gbWFk
ZSBhIG1haW50YWluZXIgb2YKPiB0b29scy94bCBhdCB0aGUgc2FtZSB0aW1lIGFzIG9mIHRvb2xz
L2xpYnhsLiAgQnV0IHRoYXQgaXNuJ3Qgc28gaW4KPiBNQUlOVEFJTkVSUyByaWdodCBub3csIHNv
IGhlIHdhc24ndCBDQydkIG9uIGFsbCB0aGVzZSBwYXRjaGVzLiAgSWYgeW91Cj4gY291bGQgZml4
IHRoYXQgdXAgbWFudWFsbHkgZm9yIGZ1dHVyZSBtYWlscywgdGhhdCB3b3VsZCBiZSBncmVhdC4K
PiAKCk9rLCBJJ2xsIHJlLWJhc2Ugb24gdG9wIG9mIHRoZSBwYXRjaCB5b3UgcG9zdGVkLiBUaGF0
IHNob3VsZCBkbyB0aGUgdHJpY2suCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
