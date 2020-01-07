Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25574132818
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:51:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iopEA-00076e-9F; Tue, 07 Jan 2020 13:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iopE8-00076Z-F3
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:48:56 +0000
X-Inumbo-ID: 7233adc2-3154-11ea-ac08-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7233adc2-3154-11ea-ac08-12813bfff9fa;
 Tue, 07 Jan 2020 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578404936; x=1609940936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=blBe+tmOgK2bVK6bVrJsy9Rcfnzth70wed2zsrona2E=;
 b=SzfyNLs+vopYS6RfPz6MboWGN9j1Te/aKkULFAuznkCORxNmGekS+ClB
 NoLTDRUKbMFkqLJEgKFWRMX3P48NexwlE2HLA4WaTN6OUMulfFRGcV64u
 XlxiT3+H6IfsJtLPPPv02AoIGuEIFtOALgD7/0ChhSuH641TWEPhQgsCV o=;
IronPort-SDR: IYgh6geIK6MPQDg81YrQkicR9pQbxHh6pAsHifY2ZZmAEZpQt5qVCgctCfbjlZRFGSBXcJ3WIG
 ceb+STSPTLjg==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; 
   d="scan'208";a="8814413"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 07 Jan 2020 13:48:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id C4666A25D9; Tue,  7 Jan 2020 13:48:42 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 13:48:41 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 13:48:41 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Tue, 7 Jan 2020 13:48:41 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>
Thread-Topic: [PATCH v5 1/7] x86: move some xen mm function declarations
Thread-Index: AQHVxVQK0vhR7eIoAUe+gS8Oc6VWEaffLJ6AgAALDwA=
Date: Tue, 7 Jan 2020 13:48:41 +0000
Message-ID: <021e7246d95a3f5a48d5d91a671d30dbba86d3c4.camel@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
 <20200107121335.nqb3kx4eos3yfiwb@debian>
 <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
In-Reply-To: <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.35]
Content-ID: <69CBD6342935B048B1A54DC6B14BFC85@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDIwLTAxLTA3IGF0IDE0OjA5ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Li4uDQo+IA0KPiBMb29rcyBsaWtlIEkgc2ltcGx5IGZvcmdvdCBldmVyeSB0aW1lIEkgd2VudCB0
aHJvdWdoIG15IGxpc3Qgb2YNCj4gcGVuZGluZyAoZm9yIHRoZSB2YXJpb3VzIHN0YWdlcyBvZiBw
cm9jZXNzaW5nKSBwYXRjaGVzLiBJIGd1ZXNzDQo+IHBhdGNoZXMgMyBhbmQgNCBhcmUgYWxzbyBp
bmRlcGVuZGVudCBvZiBwYXRjaCAyIGFuZCBoZW5jZSBjb3VsZA0KPiBnbyBpbiBhcyB3ZWxsLg0K
DQpJZiBzbywgbG9va3MgbGlrZSBwYXRjaCA3LzcgaXMgYWxzbyBpbiBhIGNvbW1pdHRhYmxlIHN0
YXRlPw0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
