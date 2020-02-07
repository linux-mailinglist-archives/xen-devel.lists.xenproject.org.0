Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725C155C01
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 17:43:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j06fo-0007oa-4N; Fri, 07 Feb 2020 16:40:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCN5=33=amazon.com=prvs=299200b1e=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j06fm-0007h3-B3
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 16:40:06 +0000
X-Inumbo-ID: 7dd9cb3e-49c8-11ea-b05b-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dd9cb3e-49c8-11ea-b05b-bc764e2007e4;
 Fri, 07 Feb 2020 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581093605; x=1612629605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8XHkz+QcwVSjzZjKV+N71FGh2advC+J77EbllWT8URw=;
 b=G+Zp0pJM8Vm5I7Mts94zFueMU9XGIi2DOFGpNEvrN/EbMpw2EiI+Y62S
 82QfGzWS08lGK4BrJLhostwcmt1LcCbA/uKG2Kr2UBWF6t9EMa7LqrDOp
 odi0KMa/5kApdqumI3eNCUShTrwdMhZ3x7RSWKlmg01JeJ5UQlBklSvyA s=;
IronPort-SDR: GpeSdoyLVNu6t5t/Es1RltNY2yx76TJF0+8BQlPD/Yh6lDvQgUykPcTiT9fKcKAxOa0EhbjO/H
 YyZIBkroL/0g==
X-IronPort-AV: E=Sophos;i="5.70,414,1574121600"; d="scan'208";a="25080433"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Feb 2020 16:40:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id E6F09A22F0; Fri,  7 Feb 2020 16:40:02 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 7 Feb 2020 16:40:02 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 7 Feb 2020 16:40:01 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 7 Feb 2020 16:40:01 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
Thread-Index: AQHV3c+Uml97/lHtTkGqVW/XjvUieqgP7BQAgAAAo4CAAAIlgA==
Date: Fri, 7 Feb 2020 16:40:01 +0000
Message-ID: <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
In-Reply-To: <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
Content-ID: <DC194A7B93EE5648B76E56F01047C0A2@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAyLTA3IGF0IDE2OjMyICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IA0KPiAuLi4NCj4gDQo+IElkZWFsbHkgbm90IGJlY2F1c2UgaW5pdF9oZWFwX3BhZ2VzKCkg
dGhlbiBjYWxscyBmcmVlX2hlYXBfcGFnZXMoKQ0KPiBhbmQgdGhlICJyZWN1cnNpb24iIGlzIGJl
c3QgYXZvaWRlZC4NCg0KS2luZCBvZiBkZXBlbmRzIG9uIHdoZXJlIHdlIGNoYW5nZSBpdHMgcGcg
dG8gaW5pdGlhbGlzZWQuIElmIHdlIGRvIHRoYXQNCmluIGZyZWVfaGVhcF9wYWdlcyB0aGlzIGRv
ZXMgcmVjdXJzZSwgYnV0IGlmIGl0IGlzIGRvbmUgaW4NCmluaXRfaGVhcF9wYWdlcyBiZWZvcmUg
Y2FsbGluZyBmcmVlIGl0IGRvZXMgbm90Lg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
