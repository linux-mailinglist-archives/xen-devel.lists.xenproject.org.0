Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACE113143
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:57:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYr4-00081h-N8; Wed, 04 Dec 2019 17:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYr2-00081c-F8
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:54:24 +0000
X-Inumbo-ID: 1a9a4775-16bf-11ea-8207-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a9a4775-16bf-11ea-8207-12813bfff9fa;
 Wed, 04 Dec 2019 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575482064; x=1607018064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gUFYcVPqJf6EDBpOdHvglKGadbFUMluK4Vu/6iQM+s4=;
 b=sV5aE2CydznD1tys6xDZIfl8wJJmdjBoum5MKZ829V2PXoOSTuK8coY0
 8YfrZ4OKtiUlD3hwVJrV5ApILGwHRQgOEYdX2AryaiClDpJI4eV99O6yn
 FqFcF6WfwIfw5c0M7EJWChveGRz/wx4Ipd3uyDTSxSUi1Ds946vwHI+0n 4=;
IronPort-SDR: 7slnK+wHmcZ9fWAdnIPHzF8F7aKkQdwEOHSGSXYHJqFOdM+8ini2mPc/pzCoVdCpZ8cHuhT6SI
 Wn1R3fjfs+5Q==
X-IronPort-AV: E=Sophos;i="5.69,278,1571702400"; d="scan'208";a="11640396"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 17:54:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 475FCA29E9; Wed,  4 Dec 2019 17:54:08 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:54:08 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:54:07 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 4 Dec 2019 17:54:07 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v4 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
Thread-Index: AQHVqsZK9VYw3RQGIU6GDPLQlkj2NKeqQhmA
Date: Wed, 4 Dec 2019 17:54:07 +0000
Message-ID: <a4cbdde29f9b879ed1e6fb212eb435c17ef7596e.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <fba262641f8233b4b9856cffeeb7a3ad0bad086a.1575477921.git.hongyxia@amazon.com>
In-Reply-To: <fba262641f8233b4b9856cffeeb7a3ad0bad086a.1575477921.git.hongyxia@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.67]
Content-ID: <6A308A3B49A0594FB8BE03DD77978504@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBUaGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBtYXAvdW5tYXAgZnVuY3Rpb25zIHRvIGhhdmUgYSBf
bmV3DQo+IHN1ZmZpeCwgaXMgdGhlcmU/DQoNCkkgdGhvdWdodCB0aGlzIHdhcyB3ZWlyZCBhdCBm
aXJzdCBhbHNvLCBidXQgd2hhdCBJIGZpbmQgcmVhbGx5IHVzZWZ1bA0KaXMgdGhhdCB3ZSBjYW4g
anVzdCBjaGFuZ2UgYWxsIGNhbGwgc2l0ZXMgdG8gdGhlIG5ldyBBUEkgaW4gc21hbGwgc3RlcHMN
CndpdGhvdXQgYnJlYWtpbmcuIE90aGVyd2lzZSB3ZSBoYXZlIHRvIG1lcmdlIGEgaHVnZSBiYXRj
aCBvZg0KY2hhbmdlcyAoYXJvdW5kIDQwIHBhdGNoZXMpIGF0IG9uY2UuDQoNCkhvbmd5YW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
