Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2F14E024
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:44:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDpT-0006xs-01; Thu, 30 Jan 2020 17:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixDpR-0006xn-Mu
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:42:09 +0000
X-Inumbo-ID: d6c54760-4387-11ea-a933-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6c54760-4387-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580406129; x=1611942129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fGXb4u+fhowSffDZclL+euCX0JoVAkDjPjOnvG5qpKk=;
 b=Lr/uk6OZvWVxu3HyP84jSWIpDeqL2brqrkrIjOw0+olANN5NcxDAWS4l
 Y3gvJyhWuy3XmsLmXL2PiEZnoPMdiKp1SWo5A/jKQrDxw5p5LG0Aj8e3w
 PJ7GztHhvijqGfudBm4koTNHFk2HLLQv2W/zkpZvqxmzWXnXyi2z8tXeA w=;
IronPort-SDR: t764CrvNyYuhHae5i+cp7pRix6hmC4lxn7coyc6D//EUQuuj5jAO1EgcmBDEUvCliJgenF+mNc
 iWp2xxUIsQ3Q==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="14061544"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Jan 2020 17:42:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 37EDBA25BE; Thu, 30 Jan 2020 17:42:07 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 17:42:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 17:42:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 17:42:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v4 7/7] xl: allow domid to be preserved on save/restore
 or migrate
Thread-Index: AQHV0TKHr+B+pHB500iZ2KXg2puHsqgDgxKAgAAB8tA=
Date: Thu, 30 Jan 2020 17:42:06 +0000
Message-ID: <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
 <24115.4689.88393.840303@mariner.uk.xensource.com>
In-Reply-To: <24115.4689.88393.840303@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxNzoyOQo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkCj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA3LzddIHhs
OiBhbGxvdyBkb21pZCB0byBiZSBwcmVzZXJ2ZWQgb24KPiBzYXZlL3Jlc3RvcmUgb3IgbWlncmF0
ZQo+IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggdjQgNy83XSB4bDogYWxsb3cgZG9t
aWQgdG8gYmUgcHJlc2VydmVkIG9uCj4gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUiKToKPiA+IFRo
aXMgcGF0Y2ggYWRkcyBhICctRCcgY29tbWFuZCBsaW5lIG9wdGlvbiB0byBzYXZlIGFuZCBtaWdy
YXRlIHRvIGFsbG93Cj4gPiB0aGUgZG9tYWluIGlkIHRvIGJlIGluY29ycG9yYXRlZCBpbnRvIHRo
ZSBzYXZlZCBkb21haW4gY29uZmlndXJhdGlvbiBhbmQKPiA+IGhlbmNlIGJlIHByZXNlcnZlZC4K
PiAKPiBUaGFua3MuCj4gCj4gSW4gcmVzcG9uc2UgdG8gdjMgNi82IEkgd3JvdGU6Cj4gCj4gICBJ
IHdvbmRlciBpZiB0aGlzIHNob3VsZCBiZSBkb25lIG1vcmUgaW4gbGlieGwuICBTaG91bGQgdGhp
cyBiZSBhCj4gICBkb21haW4gcHJvcGVydHkgPyAgV2VpLCBBbnRob255ID8KPiAKPiBUaGlzIHF1
ZXN0aW9uIHJlbWFpbnMgdW5hbnN3ZXJlZC4gIEknbSBzb3JyeSB0aGF0IG5laXRoZXIgV2VpIG5v
cgo+IEFudGhvbnkgaGFkIGEgY2hhbmNlIHRvIGFuc3dlciB5ZXQuLi4KPiAKPiBQYXVsLCBkbyB5
b3UgaGF2ZSBhIHJlYXNvbiBmb3IgZG9pbmcgaXQgdGhpcyB3YXkgPyAgTXkgaW5jbGluYXRpb24g
aXMKPiB0aGF0IHRoaW5rIGRvaW5nIGl0IGF0IHRoZSBsaWJ4bCBsYXllciB3b3VsZCBtYWtlIG1v
cmUgc2Vuc2UuICBEbyB5b3UKPiB0aGluayB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlID8KPiAKCkkn
bSBub3Qgc3VyZSBob3cgaXQgd291bGQgd29yayBhdCB0aGUgbGlieGwgbGV2ZWwgYXMgdGhlIGRv
bWlkIGlzIHBhcnQgb2YgY3JlYXRlX2luZm8gYW5kIHRoYXQgaXQgdHJhbnNmZXJyZWQgYnkgeGwg
b24gbWlncmF0aW9uLiBJSVVDIHdlJ2QgbmVlZCBhIG5ldyBsaWJ4bCBzYXZlIHJlY29yZCB0byB0
cmFuc2ZlciBpdCBhdCB0aGF0IGxldmVsLCBhbmQgdGhlbiBJJ20gbm90IHN1cmUgd2hldGhlciB3
ZSdkIGhpdCBhbiBvcmRlcmluZyBwcm9ibGVtIGFzIHdlJ2QgaGF2ZSB0byBkaWcgdGhhdCBzYXZl
IHJlY29yZCBvdXQgYmVmb3JlIHdlIGNvdWxkIGFjdHVhbGx5IGNyZWF0ZSB0aGUgZG9tYWluLgoK
ICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
