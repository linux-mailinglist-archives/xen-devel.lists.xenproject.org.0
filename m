Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDEF31596
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 21:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWnSJ-0000fw-Gz; Fri, 31 May 2019 19:44:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifn6=T7=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1hWnSI-0000fr-6H
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 19:44:46 +0000
X-Inumbo-ID: 89e57efc-83dc-11e9-8980-bc764e045a96
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe40::61b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89e57efc-83dc-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhf9yg12FYwPe3trfsjjhu4+MxOB+vRFhpqtdNhWi8k=;
 b=ipKZwRiUyYBdAvKtxV9TBNrqnmqAzQhF2KGzWhK8G3aNB7PD/Je1lEFQIwvXEeeKuRqSBawmyjVQWTRWu4a5mWLnOJEvyW+FLCYF+pH0/gM2oij6T33gSEcRt+MNkid9t4ph1bQY1TunTAYKDiY9CD6nXZdu8sAxm7YRyRc30Q8=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
 BYAPR05MB6694.namprd05.prod.outlook.com (20.178.235.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.13; Fri, 31 May 2019 19:44:41 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::2cb6:a3d1:f675:ced8]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::2cb6:a3d1:f675:ced8%3]) with mapi id 15.20.1943.016; Fri, 31 May 2019
 19:44:41 +0000
From: Nadav Amit <namit@vmware.com>
To: Juergen Gross <jgross@suse.com>
Thread-Topic: [RFC PATCH v2 04/12] x86/mm/tlb: Flush remote and local TLBs
 concurrently
Thread-Index: AQHVF3tF8UKMn76vfUO/W6G8mcgAUaaFHqkAgACE8gA=
Date: Fri, 31 May 2019 19:44:41 +0000
Message-ID: <1DEA29A7-D033-4816-876C-05E7D77F0437@vmware.com>
References: <20190531063645.4697-1-namit@vmware.com>
 <20190531063645.4697-5-namit@vmware.com>
 <a847ee9c-4faf-c8b4-43bb-cc30e0980796@suse.com>
In-Reply-To: <a847ee9c-4faf-c8b4-43bb-cc30e0980796@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ff6d24d-760f-4cf1-93a5-08d6e6006cb9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR05MB6694; 
x-ms-traffictypediagnostic: BYAPR05MB6694:
x-microsoft-antispam-prvs: <BYAPR05MB6694A02D23273C4945DC9657D0190@BYAPR05MB6694.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(5660300002)(6246003)(33656002)(66946007)(4744005)(99286004)(25786009)(54906003)(316002)(2906002)(66476007)(64756008)(66446008)(76116006)(73956011)(68736007)(66556008)(4326008)(7416002)(476003)(66066001)(229853002)(8936002)(14454004)(6512007)(6506007)(2616005)(8676002)(53546011)(446003)(76176011)(11346002)(486006)(81156014)(82746002)(305945005)(6436002)(186003)(6116002)(3846002)(71190400001)(26005)(71200400001)(6916009)(256004)(83716004)(6486002)(81166006)(7736002)(102836004)(478600001)(53936002)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6694;
 H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8vzZaIBhzD6qajL16JVgIzMw6d4O8dWiIxREAOQKbgqx7lEuupRTbVsCWDWGr93Cy3VSBBjH9syRZNtEOL2Zn3yu900mPiwa0bKgWpELQ92Kgd+f+yFap9jSai30Wt6Rrty57+qNsl1IxGpoSlhyf2+xWjes0o+DnUjIaSZ98myWf1POpTCv7F33sZvFvqqdwRs0v7NUGH4nU5wNF3zlFeLEkI6JZazDoVWpK8Nue3QyZSGFKToCmGgBGgJCd23hd5SE1uycaK+bcxzgfV7IKBe3+pEjxkkzXyZGsVlqdwMnDt6WsLZhRG0ykA2UQBHZ2hbrzyyPJNDOstW+Ts7fvhlKEIrwSC0yzt47CNLxFXisPrf0Sw1xRTXcchSxXACzzDoEiPd97LOyc/Ym/LvwpxmDnM3oKBVb5zbXtveRK2I=
Content-ID: <498DEB6111D0B64C9D5657F78CFDD0EF@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff6d24d-760f-4cf1-93a5-08d6e6006cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 19:44:41.6564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6694
Subject: Re: [Xen-devel] [RFC PATCH v2 04/12] x86/mm/tlb: Flush remote and
 local TLBs concurrently
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBNYXkgMzEsIDIwMTksIGF0IDQ6NDggQU0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4gCj4gT24gMzEvMDUvMjAxOSAwODozNiwgTmFkYXYgQW1pdCB3cm90ZToK
Pj4gCj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgKPj4gKysr
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+PiBAQCAtMjExLDYgKzIx
MSwxMiBAQCBzdHJ1Y3QgcHZfbW11X29wcyB7Cj4+IAl2b2lkICgqZmx1c2hfdGxiX3VzZXIpKHZv
aWQpOwo+PiAJdm9pZCAoKmZsdXNoX3RsYl9rZXJuZWwpKHZvaWQpOwo+PiAJdm9pZCAoKmZsdXNo
X3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRyKTsKPj4gKwkvKgo+PiArCSAqIGZsdXNo
X3RsYl9tdWx0aSgpIGlzIHRoZSBwcmVmZXJyZWQgaW50ZXJmYWNlLiBXaGVuIGl0IGlzIHVzZWQs
Cj4+ICsJICogZmx1c2hfdGxiX290aGVycygpIHNob3VsZCByZXR1cm4gZmFsc2UuCj4gCj4gRGlk
bid0IHlvdSB3YW50IHRvIHJlbW92ZS9jaGFuZ2UgdGhpcyBjb21tZW50PwoKWWVzISBTb3JyeSBm
b3IgdGhhdC4gRml4ZWQgbm93LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
