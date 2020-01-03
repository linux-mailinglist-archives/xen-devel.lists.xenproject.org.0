Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B212F609
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 10:26:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inJBQ-0000vR-MF; Fri, 03 Jan 2020 09:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmXo=2Y=amazon.com=prvs=264a10e96=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inJBO-0000vM-R4
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 09:23:50 +0000
X-Inumbo-ID: bbdb211e-2e0a-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbdb211e-2e0a-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578043423; x=1609579423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUihzNhri4GAb6VBG9zKHjvMCKfs4YlVoezHsUdVYSM=;
 b=S5xurfSoG+H9W3J2yQZa0WX4mYhGgUR3xUevPUWiIw6DOfB7JOWojU8t
 0hXgZtnDaolnFjseFD1wL23pMd9rWgV0+ZAd6hXnHxl/F5BRkSK6Lt8sG
 N3pku3aeean9F1zHjeRCtZamKd263WPpa7293c+fy2Rognt1gCxvmS61A U=;
IronPort-SDR: nMzSK8hY8Ok9vUPjhCed+yrJpLkiOU8x2UN4FRbKBT2XWQbI+lIFTAYw/TPXd96zyUSiUrzzVS
 WZH+OlCO0s6A==
X-IronPort-AV: E=Sophos;i="5.69,390,1571702400"; d="scan'208";a="11381559"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Jan 2020 09:23:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id E11F9A25AE; Fri,  3 Jan 2020 09:23:41 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 3 Jan 2020 09:23:41 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 Jan 2020 09:23:40 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 3 Jan 2020 09:23:39 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH 6/6] xl: allow specified domain id to be used for create, 
 restore and migrate
Thread-Index: AQHVulqyb1+bSLfCzUqPsmQIg+shHqfXr8aAgAEJitA=
Date: Fri, 3 Jan 2020 09:23:39 +0000
Message-ID: <ad3e409f44ec49169fcdcff3775401cf@EX13D32EUC003.ant.amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-7-pdurrant@amazon.com>
 <24078.10385.878947.19392@mariner.uk.xensource.com>
In-Reply-To: <24078.10385.878947.19392@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.95]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 6/6] xl: allow specified domain id to be
 used for create, restore and migrate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDAyIEphbnVhcnkgMjAyMCAxNzozMAo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCA2
LzZdIHhsOiBhbGxvdyBzcGVjaWZpZWQgZG9tYWluIGlkIHRvIGJlIHVzZWQgZm9yCj4gY3JlYXRl
LCByZXN0b3JlIGFuZCBtaWdyYXRlCj4gCj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCA2
LzZdIHhsOiBhbGxvdyBzcGVjaWZpZWQgZG9tYWluIGlkIHRvIGJlIHVzZWQKPiBmb3IgY3JlYXRl
LCByZXN0b3JlIGFuZCBtaWdyYXRlIik6Cj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIG9wdGlvbiB0
byB1c2UgYSBzcGVjaWZpZWQgZG9tYWluIGlkIHRvIGJlIHVzZWQgZm9yCj4gPiB0aGUgY3JlYXRl
LCByZXN0b3JlIGFuZCBtaWdyYXRlIGxpZmVjeWNsZSBvcGVyYXRpb25zIGFuZCBkb2N1bWVudGF0
aW9uCj4gPiB0aGVyZW9mLgo+IAo+IEkgYXBwcm92ZSBvZiB0aGUgaWRlYSB0aGF0IHRoZSB4bCB1
c2VyIGNhbiBzcGVjaWZ5IHRoZSBkb21pZC4gIEJ1dDoKPiAKPiBXaHkgc2hvdWxkIHRoaXMgYmUg
YSBjb21tYW5kIGxpbmUgYXJndW1lbnQgdG8geGwsIHJhdGhlciB0aGFuIGEgZG9tYWluCj4gY29u
ZmlnIHBhcmFtZXRlciA/ICBPYnZpb3VzbHkgdGhlcmUgbmVlZHMgdG8gYmUgYSB3YXkgdG8gb3Zl
cnJpZGUgdGhlCj4gY2hvaWNlLCBlc3BlY2lhbGx5IHRvIG1ha2UgbG9jYWxob3N0IG1pZ3JhdGlv
biB3b3JrLCBidXQgdGhlcmUgaXMKPiBhbHJlYWR5IGEgd2F5IHRvIHNwZWNpZnkgZXh0cmEgY29u
ZmlnIG9uIGRvbWFpbiBjcmVhdGUsIGF0IGxlYXN0Lgo+IAoKSSBkZWJhdGVkIHdoaWNoIHdhcyBi
ZXN0IGFuZCBjYW1lIGRvd24gb24gdGhlIHNpZGUgb2YgYSBjb21tYW5kIGxpbmUgcGFyYW1ldGVy
IGJlY2FzZSBJIHRob3VnaHQgdGhhdCBjaGFuY2VzIG9mIGFuIGFkbWluIHdhbnRpbmcgdG8gdGll
IGEgY2ZnIHRvIHNwZWNpZmllZCBkb21pZCB3YXMgc21hbGwuIEJ1dCBJIGd1ZXNzIHRoZSBjZmcg
Y2FuIGFscmVhZHkgc3BlY2lmeSBhIG5hbWUsIHdoaWNoIG5lZWRzIHRvIGJlIG92ZXJyaWRkZW4g
b24gYSBwZXItY3JlYXRpb24gYmFzaXMgaWYgYW4gYWRtaW4gd2FudHMgdG8gdXNlIGEgY29tbW9u
ICd0ZW1wbGF0ZScgY2ZnLi4uIHNvIG1heWJlIHRoYXQgb3B0aW9uIGlzIGluZGVlZCBtb3JlIGNv
bnNpc3RlbnQuCgogIFBhdWwKCj4gVGhhbmtzLAo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
