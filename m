Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7314A359
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 12:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw2yi-00034U-KH; Mon, 27 Jan 2020 11:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw2yh-00034P-Cn
 for xen-devel@lists.xen.org; Mon, 27 Jan 2020 11:54:51 +0000
X-Inumbo-ID: d2a21f34-40fb-11ea-b833-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2a21f34-40fb-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 11:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580126090; x=1611662090;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=J1b/bxY/P9arlFhgj89byRbVJzAC6R0i8qHAcEn9QP0=;
 b=YFvyRCyPCzs1MVB0p/dZr/xXxmZMLHA7a4dCoEMfFSeRq0aAlSwtiA+j
 V+YZ2BeLL3nv5TZxEYhqYVsJOG/acCdx5pDr126jZ2n/eOUQX4mNqcCmW
 pMZ7d2HOadNWiV3yhBK73RdfHZDldhQejKUfeSPlvmH/LOHT5zV7yAaC+ U=;
IronPort-SDR: ER+iloZ0pzLdY6sUxYm14pIUKaE7fl1EB1Uq2GxmAgQbbxQpC/oS5ngKr/cOE8LraNNesb7pv6
 NvxiC6qmTeog==
X-IronPort-AV: E=Sophos;i="5.70,369,1574121600"; d="scan'208";a="12882732"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Jan 2020 11:54:39 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id E9099A249C; Mon, 27 Jan 2020 11:54:38 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 11:54:38 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 11:54:37 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 11:54:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
Thread-Index: AQHVyf11gUSmbB+iq0KEPStCWv0JQaf+dkOAgAADHTA=
Date: Mon, 27 Jan 2020 11:54:37 +0000
Message-ID: <580201e5daa849399b79641bd610ec93@EX13D32EUC003.ant.amazon.com>
References: <20200113113627.08786ba0.olaf@aepfle.de>
 <20200127123005.7d6767c2.olaf@aepfle.de>
In-Reply-To: <20200127123005.7d6767c2.olaf@aepfle.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYKPiBPZiBPbGFm
IEhlcmluZwo+IFNlbnQ6IDI3IEphbnVhcnkgMjAyMCAxMTozMAo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVuLm9yZwo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBsaXZlIG1pZ3JhdGlvbiBmcm9t
IDQuMTIgdG8gNC4xMyBmYWlscyBkdWUgdG8KPiBxZW11LXhlbiBidWcKPiAKPiBBbSBNb24sIDEz
IEphbiAyMDIwIDExOjM2OjI3ICswMTAwCj4gc2NocmllYiBPbGFmIEhlcmluZyA8b2xhZkBhZXBm
bGUuZGU+Ogo+IAo+ID4gVGhpcyBIVk0gZG9tVSBmYWlscyB0byBsaXZlIG1pZ3JhdGUgZnJvbSBz
dGFnaW5nLTQuMTIgdG8gc3RhZ2luZy00LjEzOgo+IAo+IEl0IHR1cm5lZCBvdXQgbGlieGwgZG9l
cyBub3QgY29uZmlndXJlIHFlbXUgY29ycmVjdGx5IGF0IHJ1bnRpbWU6Cj4gbGlieGxfX2J1aWxk
X2RldmljZV9tb2RlbF9hcmdzX25ldygpIHVzZXMgJ3FlbXUgLW1hY2hpbmUgeGVuZnYnLCBwZXJo
YXBzCj4gd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0ICd4ZW5mdicgZG9lcyB0aGUgcmlnaHQgdGhp
bmcuIFVuZm9ydHVuYXRlbHksCj4gJ3hlbmZ2JyBlbnRpcmVseSBpZ25vcmVzIGNvbXBhdGliaWxp
dHkgb2YgInBjLWk0NDBmeCIgYmV0d2VlbiBxZW11Cj4gdmVyc2lvbnMsICd4ZW5mdicganVzdCBt
YXBzIHRvICdwYycgYWthICd0aGUgbGFzdGVzdCcuIEluc3RlYWQgb2YgJ3FlbXUgLQo+IG1hY2hp
bmUgeGVuZnYnLCBsaWJ4bCBzaG91bGQgcnVuICdxZW11IC1tYWNoaW5lIHBjLWk0NDBmeC0zLjAg
LWRldmljZSB4ZW4tCj4gcGxhdGZvcm0gLWFjY2VsIHhlbicgdG8gbWFrZSBzdXJlIHRoZSBkb21V
IGNhbiBiZSBtaWdyYXRlZCBzYWZlbHkgdG8KPiBmdXR1cmUgdmVyc2lvbnMgb2YgcWVtdS4KCkFn
cmVlZCwgSSB0aGluayB1c2UgeGVuZnYgbmVlZHMgdG8gYmUgZHJvcHBlZCBhbmQgeGwvbGlieGwg
b3VnaHQgdG8gc3BlY2lmeSB0aGUgcGMgdmVyc2lvbiBpdCB3YW50cywgYXMgeW91IHN1Z2dlc3Qu
IEZvciBjb21wYXQgdGhvdWdoLCBpZiB0aGUgcGMgdmVyc2lvbiBpcyBub3Qgc3BlY2lmaWVkIGlu
IHhsLmNmZyB3ZSdkIG5lZWQgYSBtZWNoYW5pc20gdG8gc2NhbiB0aGUgdmVyc2lvbnMgc3VwcG9y
dGVkIGJ5IHRoZSBpbnN0YWxsZWQgcWVtdSBhbmQgdGhlbiBwaWNrIHRoZSBsYXRlc3QsIHN1Y2gg
dGhhdCBpdCB0aGVuIGdldHMgYmFrZWQgaW50byB0aGUganNvbiBibG9iIGZvciBzYXZlL3Jlc3Rv
cmUvbWlncmF0aW9uIHB1cnBvc2VzLiAKCj4gCj4gTWF5YmUgdGhlcmUgc2hvdWxkIGFsc28gYmUg
YSB3YXkgdG8gc2VsZWN0IGEgc3BlY2lmaWMgdmFyaWFudCBvZiAicGMtCj4gaTQ0MGZ4Ii4gQ3Vy
cmVudGx5IHRoZSBvbmx5IHdheSB0byBkbyB0aGF0IGlzIHRvIHVzZQo+IGRldmljZV9tb2RlbF9h
cmdzX2h2bT0gaW4geGwuY2ZnLiBVbmZvcnR1bmF0ZWx5IGxpYnZpcnQgZG9lcyBub3Qgc3VwcG9y
dAo+ICJiX2luZm8tPmV4dHJhKiIuCj4gCgpZZWFoLCBpdCBzaG91bGQgYmUgYSBmaXJzdCBjbGFz
cyBjb25maWcgb3B0aW9uLgoKPiBTaG91bGQgdGhlIHN0cmluZyAicGMtaTQ0MGZ4LTMuMCIgYmVj
b21lIGEgY29uZmlndXJlIG9wdGlvbj8KPiAKCkkgc3VwcG9zZS4gQ291bGQgd2UgaGF2ZSAicGMt
aTQ0MGZ4IiBhcyB0aGUgZGVmYXVsdCwgd2hpY2ggbGlieGwgcHJlZml4IG1hdGNoZXMgYWdhaW5z
dCBxZW11J3Mgc3VwcG9ydGVkIHZlcnNpb25zIHRvIHNlbGVjdCB0aGUgbGF0ZXN0PyBJIGd1ZXNz
IHRoYXQgd291bGQgd29yay4KCkZ1bmN0aW9uYWxseSB5b3VyIGNvZGUgbG9va3MgZmluZSwgYnV0
IEkgZG9uJ3QgdGhpbmsgZml4aW5nIG9uIDMuMCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uIFdo
YXQgaGFwcGVucyBpZiBzb21lb25lIGlzIHRyeWluZyB0byB1c2UgYW4gb2xkZXIgdmVyc2lvbiBv
ZiBxZW11PyBJdCdzIGdvaW5nIHRvIGNhdXNlIHVuZXhwZWN0ZWQgYnJlYWthZ2UgSSB0aGluay4K
CiAgUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
