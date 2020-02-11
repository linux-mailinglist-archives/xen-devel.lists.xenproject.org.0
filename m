Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800E158DCE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 12:58:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1U7z-0004DD-0x; Tue, 11 Feb 2020 11:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fl1e=37=amazon.co.uk=prvs=30305dd31=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j1U7x-0004D8-5r
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 11:54:53 +0000
X-Inumbo-ID: 5023be2a-4cc5-11ea-8d48-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5023be2a-4cc5-11ea-8d48-bc764e2007e4;
 Tue, 11 Feb 2020 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581422093; x=1612958093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6pfQh8uke9zIvEqyrvbJYWQL1nNgQ52UBcUTzccbKfc=;
 b=lwDgM9QpWk7P7+/HH/AWLgy+Xpee42W2oACXapL1kTc8lfGRtu7HpmvG
 uIjEpJgFn9cF2sNovBZE6pDpLzfa0vUEyo9SDJuufkIEpybJfRlgzjbtR
 rFMYjGkZVE4eQSzFKVlbwNrQsAK8eEiis8s8zHWaLayjhmjn2gPZFGyCc I=;
IronPort-SDR: Tl61OYSe9R7EQkz1jBvx7JDYoggVvKhOQ85SS97JXqWrS0Y8VDaq18FKLSndgwZRO4QagNjy3N
 PZBoLxm3wm7Q==
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; d="scan'208";a="15719299"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 11 Feb 2020 11:54:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7A36AA1EA7; Tue, 11 Feb 2020 11:54:30 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 11 Feb 2020 11:54:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 11 Feb 2020 11:54:28 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 11 Feb 2020 11:54:28 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] AMD/IOMMU: Clean up the allocation helpers
Thread-Index: AQHV4M58j/Z1IFIQ+UefBGelxDpizagV4jXQ
Date: Tue, 11 Feb 2020 11:54:28 +0000
Message-ID: <aa71a3fc42af4f5dbea7a1db2f59a0aa@EX13D32EUC003.ant.amazon.com>
References: <20200211112726.26639-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200211112726.26639-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.37]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Clean up the allocation helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gQW5kcmV3IENv
b3Blcg0KPiBTZW50OiAxMSBGZWJydWFyeSAyMDIwIDEyOjI3DQo+IFRvOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuDQo+IEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gQU1EL0lPTU1VOiBDbGVhbiB1
cCB0aGUgYWxsb2NhdGlvbiBoZWxwZXJzDQo+IA0KPiBDb25mb3JtIHRvIHN0eWxlLCBkcm9wIHVu
bmVjZXNzYXJ5IGxvY2FsIHZhcmlhYmxlcywgYW5kIGF2b2lkIG9wZW5jb2RpbmcNCj4gY2xlYXJf
ZG9tYWluX3BhZ2UoKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
