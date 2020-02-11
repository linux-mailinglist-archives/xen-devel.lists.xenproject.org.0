Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2713158C32
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:56:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1SDM-0001n7-Ll; Tue, 11 Feb 2020 09:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fl1e=37=amazon.co.uk=prvs=30305dd31=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j1SDL-0001n2-Cs
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:52:19 +0000
X-Inumbo-ID: 30753786-4cb4-11ea-852a-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30753786-4cb4-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581414739; x=1612950739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkT5bp62K8IW8QH6sInzf8CDRgvXdD90dfJ2QD5Wre0=;
 b=X7FEeQri0WmUk4slt2wAPf87g0DzCxvrTnos5d7xj7MQvu4o7V2eTmle
 6oMJJytDFyBmnIIDdSpZ2zX1pru4IaljRgluy0sFtFFO+fwGCIXz1AJlN
 B+k3X0zfyrWfBo1zXllkLPsaki783UXyqfB60QI5zNb6Vw0kYPk0bIOIc M=;
IronPort-SDR: 6UlJR0BwcV/tu8tbsGAJNvqGnxTC3xzFtQIv54sazq32j9wDNWXdHziwCfsnfMYReS2OrlIOSO
 G7XV1VQSNOiQ==
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; d="scan'208";a="24283262"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 11 Feb 2020 09:52:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 392B02430A7; Tue, 11 Feb 2020 09:52:13 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 11 Feb 2020 09:52:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 11 Feb 2020 09:52:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 11 Feb 2020 09:52:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 6/7] xen/guest: prepare hypervisor ops to use
 alternative calls
Thread-Index: AQHV4De7MuueQVgYtkSjIyVhWlub/qgVwTMA
Date: Tue, 11 Feb 2020 09:52:12 +0000
Message-ID: <49499e8dd19a46169f27221675c65d03@EX13D32EUC003.ant.amazon.com>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-7-roger.pau@citrix.com>
In-Reply-To: <20200210172829.43604-7-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.37]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/7] xen/guest: prepare hypervisor ops to
 use alternative calls
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAxMCBGZWJydWFyeSAyMDIwIDE4OjI4DQo+IFRv
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBEdXJyYW50LCBQYXVsDQo+IDxwZHVycmFudEBhbWF6b24u
Y28udWs+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNoQHN1
c2UuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIHY0IDYvN10geGVuL2d1ZXN0OiBwcmVwYXJlIGh5cGVydmlzb3Igb3BzIHRv
IHVzZQ0KPiBhbHRlcm5hdGl2ZSBjYWxscw0KPiANCj4gQWRhcHQgdGhlIGh5cGVydmlzb3Igb3Bz
IGZyYW1ld29yayBzbyBpdCBjYW4gYmUgdXNlZCB3aXRoIHRoZQ0KPiBhbHRlcm5hdGl2ZSBjYWxs
cyBmcmFtZXdvcmsuIFNvIGZhciBubyBob29rcyBhcmUgbW9kaWZpZWQgdG8gbWFrZSB1c2UNCj4g
b2YgdGhlIGFsdGVybmF0aXZlcyBwYXRjaGluZywgYXMgdGhleSBhcmUgbm90IGluIGFueSBob3Qg
cGF0aC4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmll
d2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
