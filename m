Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662E15047D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 11:42:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZ8f-00060t-1t; Mon, 03 Feb 2020 10:39:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZ8d-00060n-At
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:39:31 +0000
X-Inumbo-ID: 74fe2ac9-4671-11ea-8e44-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74fe2ac9-4671-11ea-8e44-12813bfff9fa;
 Mon, 03 Feb 2020 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580726371; x=1612262371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7eBrJCUkcv7+/LEuN88G0XOUaggOcpKVfn97ACVXM18=;
 b=KTfE2JVoB6Blz4j8cpypPdJ0Y5EQiQmGrCbtR3Gm+MQpnez5KAU4YIt2
 t4ieqUnIEd6XSJsrsJbyVtmJg3v5tlRtcMcV4zdrhusoQAdBdWazdYbej
 YNwp3EuOd+s6D/Ihg+o9VIhanpD/eqZr8nJlp2jIrje9U9p4rxXOyN180 U=;
IronPort-SDR: P1dQXMBZcywGSwUP5HnV6/d+5JpLu9W0e4F/WzgPZ8X1s1/r5QYat7pRlIUV84Cv9pp/RKp6F7
 9lGRiR1r0R4Q==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15312681"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 03 Feb 2020 10:39:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 13106C06D0; Mon,  3 Feb 2020 10:39:27 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 10:39:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 10:39:26 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 10:39:26 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 05/11] x86/hyperv: setup hypercall page
Thread-Index: AQHV2F7h0j5uTCeDZUSwJbhowp1kHagFDuyAgAQ8dpA=
Date: Mon, 3 Feb 2020 10:39:26 +0000
Message-ID: <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
In-Reply-To: <20200131175659.5nabkw7joiaepku2@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE3OjU3Cj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jby51az47IE1pY2hhZWwgS2VsbGV5Cj4gPG1pa2VsbGV5QG1pY3Jvc29m
dC5jb20+OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+IDx3bEB4ZW4u
b3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0
dXAgaHlwZXJjYWxsIHBhZ2UKPiAKPiAoTm90ZSB0byBzZWxmKQo+IAo+IE9uIEZyaSwgSmFuIDMx
LCAyMDIwIGF0IDA1OjQ5OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gWy4uLl0KPiA+ICtz
dGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVu
aW9uIGh2X2d1ZXN0X29zX2lkIGlkOwo+ID4gKwo+IAo+ICAgICAgICBpZC5yYXcgPSAwOwoKT3Ig
anVzdCB1c2UgYSBDOTkgaW5pdGlhbGl6ZXIgdG8gc2V0IHRoaW5ncyB1cC4gQSBiaXQgbmVhdGVy
IElNTy4KCiAgUGF1bAoKPiAKPiA+ICsgICAgaWQudmVuZG9yID0gSFZfWEVOX1ZFTkRPUl9JRDsK
PiA+ICsgICAgaWQubWFqb3IgPSB4ZW5fbWFqb3JfdmVyc2lvbigpOwo+ID4gKyAgICBpZC5taW5v
ciA9IHhlbl9taW5vcl92ZXJzaW9uKCk7Cj4gPiArCj4gPiArICAgIHJldHVybiBpZC5yYXc7Cj4g
PiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
