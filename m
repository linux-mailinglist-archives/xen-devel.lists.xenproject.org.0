Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F265E17A659
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 14:27:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9qV5-000476-6G; Thu, 05 Mar 2020 13:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMQk=4W=amazon.com=prvs=326c579fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j9qV3-00046z-K0
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 13:25:17 +0000
X-Inumbo-ID: bfc41ce4-5ee4-11ea-90c4-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfc41ce4-5ee4-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1583414716; x=1614950716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=haFpBrpDftLnlfl1tH9JHWJr5YMnMVm0w4BTNeC7cJQ=;
 b=Vfe+NNLZEGo6JJS5JV8Xnk/QwolXOkkpGIKfQk13qfQs3nJV2TB9Di38
 5yn0ji0yfCfBLMUUi9kRjLJITU17hF0buvmgY87ROi32bK+J/52w7R25C
 YS9itI2uMvzoAcrrF58NWGYL0osJrcMizn0f+iE8FQqdyeImBkDYsT0zN c=;
IronPort-SDR: DfjwGlJhA+YGxgA5o1qVwOvlT5TwypaJe/URLI9iftlwXmwLGwc9Yer2hrFo5MvzZJoPkaaI+i
 PLGag07uFnLw==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="30821946"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 05 Mar 2020 13:25:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id E0B50A25CB; Thu,  5 Mar 2020 13:25:12 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 13:25:12 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 13:25:11 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1497.006;
 Thu, 5 Mar 2020 13:25:11 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "pdurrant@amzn.com" <pdurrant@amzn.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 1/6] domain: introduce
 alloc/free_shared_info() helpers...
Thread-Index: AQHV8uxNAQsPed399E6+S/AMqb+Rvag5/KMAgAAAgQA=
Date: Thu, 5 Mar 2020 13:25:11 +0000
Message-ID: <a31a144bb0c44e53c1e5695b053de9a946fbc4fd.camel@amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-2-pdurrant@amzn.com>
 <02cbae7ef896e59eecbe89cbf898142a49c8e191.camel@amazon.com>
In-Reply-To: <02cbae7ef896e59eecbe89cbf898142a49c8e191.camel@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.82]
Content-ID: <39905821A786DD46A31086083D39634E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/6] domain: introduce
 alloc/free_shared_info() helpers...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDEzOjIzICswMDAwLCBIb25neWFuIFhpYSB3cm90ZToNCj4g
T24gVGh1LCAyMDIwLTAzLTA1IGF0IDEyOjQ0ICswMDAwLCBwZHVycmFudEBhbXpuLmNvbSB3cm90
ZToNCj4gPiAuLi4NCj4gDQo+IE90aGVyIHRoYW4gdGhhdCwNCj4gUmV2aWV3ZWQtYnk6IEhvbmd5
YW4gWGlhIDxob25neXhpYUBhbWF6b24ub3JnPg0KDQpTb3JyeSwgSSBtZWFudCBob25neXhpYUBh
bWF6b24uY29tDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
