Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D320AED
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:17:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRI5R-0001g1-Ks; Thu, 16 May 2019 15:14:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XxdW=TQ=amazon.de=prvs=03221fa14=sironi@srs-us1.protection.inumbo.net>)
 id 1hRI5Q-0001fw-Mj
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:14:24 +0000
X-Inumbo-ID: 49110841-77ed-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 49110841-77ed-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1558019663; x=1589555663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=aig0jPNztAGTfLrveYmFoH55ckuO8R7q/yjW4HU7drI=;
 b=rr2Z1pKSZ5LZfic1XZhaKkAPrc8ALZlmRiNZNOxjtfiI/tSyqgf6B4YG
 Mi/V3btRkSXsMjbheRtK40GCF0DJ7Tn+Zef799nSguvtNkrwfDJDkVOAb
 GQYq6+cXjCBtdHCYw5eUAJNAhp7OfWGhSKCDyxsGz/ZjvvDDh2wNMLYKq w=;
X-IronPort-AV: E=Sophos;i="5.60,477,1549929600"; d="scan'208";a="800025988"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 15:14:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GFEEo0036922
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 15:14:18 GMT
Received: from EX13D02EUC003.ant.amazon.com (10.43.164.10) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 15:14:17 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D02EUC003.ant.amazon.com (10.43.164.10) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 15:14:16 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1367.000;
 Thu, 16 May 2019 15:14:16 +0000
From: "Sironi, Filippo" <sironi@amazon.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/2] KVM: Start populating /sys/hypervisor
 with KVM entries
Thread-Index: AQHVCmguTMwTmVyYP0+tMrT8Z/dQMaZtx8qAgAADQgCAAAG8gIAADxmAgAADWQA=
Date: Thu, 16 May 2019 15:14:16 +0000
Message-ID: <649AEBAC-8408-4BC0-AA22-F721CC23648D@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
 <7aae3e49-5b1c-96d1-466e-5b061305dc9d@citrix.com>
 <22fadfb1-e48d-ccb6-0e42-c105b7335d7a@amazon.com>
 <92f2f186-2e29-d798-84bd-7209e874f103@oracle.com>
In-Reply-To: <92f2f186-2e29-d798-84bd-7209e874f103@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.224]
Content-ID: <6E2A8B9BB2A14F4E92BDE4A9FB721974@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Graf,
 Alexander" <graf@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNzowMiwgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gT24gNS8xNi8xOSAxMDowOCBBTSwgQWxleGFu
ZGVyIEdyYWYgd3JvdGU6Cj4+IAo+PiBNeSBwb2ludCBpcyBtb3N0bHkgdGhhdCB3ZSBzaG91bGQg
YmUgYXMgY29tbW9uCj4+IGFzIHBvc3NpYmxlIHdoZW4gaXQgY29tZXMgdG8gL3N5cy9oeXBlcnZp
c29yLCBzbyB0aGF0IHRvb2xzIGRvbid0IGhhdmUKPj4gdG8gY2FyZSBhYm91dCB0aGUgSFYgdGhl
eSdyZSB3b3JraW5nIGFnYWluc3QuCj4gCj4gSXQgbWlnaHQgbWFrZSBzZW5zZSB0byBoYXZlIGEg
Y29tbW9uIHN5cy1oeXBlcnZpc29yLmMgZmlsZQo+IChkcml2ZXJzL2h5cGVydmlzb3Ivc3lzLWh5
cGVydmlzb3IuYyBvciBzb21lIHN1Y2gpLCB3aXRoCj4gaHlwZXJ2aXNvci1zcGVjaWZpYyBvcHMv
Y2FsbGJhY2tzL2V0Yy4KPiAKPiAtYm9yaXMKCgpZZXMsIGl0IGRlZmluaXRlbHkgZG9lcy4gSSB3
b3VsZCBmb2xsb3cgdXAgd2l0aCBmdXR1cmUgcGF0Y2hlcyB0byBtYWtlIGl0CmhhcHBlbi4KCkZp
bGlwcG8KCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
