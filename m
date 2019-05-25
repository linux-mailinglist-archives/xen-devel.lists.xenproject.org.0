Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB52A37B
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2019 10:40:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUSCC-00051B-EI; Sat, 25 May 2019 08:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yIH2=TZ=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1hUSCA-000516-OG
 for xen-devel@lists.xenproject.org; Sat, 25 May 2019 08:38:26 +0000
X-Inumbo-ID: 6e4256a8-7ec8-11e9-bb40-a38eb31e358b
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (unknown
 [40.107.68.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e4256a8-7ec8-11e9-bb40-a38eb31e358b;
 Sat, 25 May 2019 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6J2DvToHqUoKJMZU5ckrb26c5lekjhb7vISkynKHyI=;
 b=KExin2AMte4c/j7+rFNWbofR0BeuSUpBWbQDy6w+XHknTeULNVIPux87gv+iYLDZ/oN2OHErnPVp4LlTZ7pLfmVEL+my2NfdGmegE6nVyiqGtdO2NPMkq7AKSVSHMgkPG+mu/GHApqF3ySrNqj76N56MGThU5AK01GXqk0co0Mg=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
 BYAPR05MB4615.namprd05.prod.outlook.com (52.135.233.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.13; Sat, 25 May 2019 08:38:06 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::2cb6:a3d1:f675:ced8]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::2cb6:a3d1:f675:ced8%3]) with mapi id 15.20.1943.007; Sat, 25 May 2019
 08:38:06 +0000
From: Nadav Amit <namit@vmware.com>
To: Nadav Amit <namit@vmware.com>
Thread-Topic: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
 concurrently
Thread-Index: AQHVEtL3brMxLnyQKEm7V/vFcW9jOKZ7hLGA
Date: Sat, 25 May 2019 08:38:05 +0000
Message-ID: <F9875905-7383-4815-B6F6-B3EA73B7BF3F@vmware.com>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
In-Reply-To: <20190525082203.6531-6-namit@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [2601:647:4580:b719:c833:b364:6fe3:b42b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0ecb8eb-24df-456a-89f4-08d6e0ec4eed
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR05MB4615; 
x-ms-traffictypediagnostic: BYAPR05MB4615:
x-microsoft-antispam-prvs: <BYAPR05MB461521666233A75FC7AA838CD0030@BYAPR05MB4615.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0048BCF4DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(82746002)(99286004)(229853002)(66556008)(64756008)(66446008)(73956011)(66476007)(66946007)(25786009)(53546011)(54906003)(14444005)(14454004)(256004)(6200100001)(37006003)(8936002)(81166006)(81156014)(6506007)(8676002)(7416002)(33656002)(6436002)(76176011)(86362001)(76116006)(305945005)(7736002)(316002)(478600001)(6512007)(486006)(6486002)(476003)(5660300002)(446003)(6862004)(46003)(11346002)(36756003)(4744005)(2616005)(6246003)(2906002)(53936002)(4326008)(186003)(102836004)(6116002)(71200400001)(71190400001)(68736007)(83716004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4615;
 H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +MzpgiAwJJ1Y0+54CC/xVsiJ4fsLrUc+V0z0BaUwSLpHi6Mi7JLHsskn5Gv3BeLeI8Wb/WhcQ0SOfBPPg1IVALSCW1hImG0HugvyeMPmYwW98wqjf87+iqYUo5egeAHCsNnguUht6k8YuhR7IEcZbiOlQdMlJJmDC90xta/NvEyAWOxp796E841P/hJHBnIaFUGfF8cHkUCb5uWt91nCE7mRNboQUIOO9f1ZW3VgN6/DoRvnHdQgV613iTDauyBS61xGRtOJJv9qT9Bjq5+1Q4JLhCKtsv+4u07av/oXlRbgQAnrJoJeIXgV39kO12HScwXMTHEPHlkARtAubi+1xPaeXzCqvsx0pwkF1epyppKLH0xf9k65U2hqZgxUt3o32n7X4a3R4i8mUKJbZZTD8VyXBka88JwTe1snJxBmMuA=
Content-ID: <75106B379062644D9E12CC0F943F0E87@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ecb8eb-24df-456a-89f4-08d6e0ec4eed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2019 08:38:05.9608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4615
Subject: Re: [Xen-devel] [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local
 TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBNYXkgMjUsIDIwMTksIGF0IDE6MjIgQU0sIE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5j
b20+IHdyb3RlOgo+IAo+IFRvIGltcHJvdmUgVExCIHNob290ZG93biBwZXJmb3JtYW5jZSwgZmx1
c2ggdGhlIHJlbW90ZSBhbmQgbG9jYWwgVExCcwo+IGNvbmN1cnJlbnRseS4gSW50cm9kdWNlIGZs
dXNoX3RsYl9tdWx0aSgpIHRoYXQgZG9lcyBzby4gVGhlIGN1cnJlbnQKPiBmbHVzaF90bGJfb3Ro
ZXJzKCkgaW50ZXJmYWNlIGlzIGtlcHQsIHNpbmNlIHBhcmF2aXJ0dWFsIGludGVyZmFjZXMgbmVl
ZAo+IHRvIGJlIGFkYXB0ZWQgZmlyc3QgYmVmb3JlIGl0IGNhbiBiZSByZW1vdmVkLiBUaGlzIGlz
IGxlZnQgZm9yIGZ1dHVyZQo+IHdvcmsuIEluIHN1Y2ggUFYgZW52aXJvbm1lbnRzLCBUTEIgZmx1
c2hlcyBhcmUgbm90IHBlcmZvcm1lZCwgYXQgdGhpcwo+IHRpbWUsIGNvbmN1cnJlbnRseS4KPiAK
PiArdm9pZCBuYXRpdmVfZmx1c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVt
YXNrLAo+ICsJCQkgICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQo+IHsKPiAr
CS8qCj4gKwkgKiBuYXRpdmVfZmx1c2hfdGxiX211bHRpKCkgY2FuIGhhbmRsZSBhIHNpbmdsZSBD
UFUsIGJ1dCBpdCBpcwo+ICsJICogc3Vib3B0aW1hbCBpZiB0aGUgbG9jYWwgVExCIHNob3VsZCBi
ZSBmbHVzaGVkLCBhbmQgdGhlcmVmb3JlIHNob3VsZAo+ICsJICogbm90IGJlIHVzZWQgaW4gc3Vj
aCBjYXNlLiBDaGVjayB0aGF0IGl0IGlzIG5vdCB1c2VkIGluIHN1Y2ggY2FzZSwKPiArCSAqIGFu
ZCB1c2UgdGhpcyBhc3N1bXB0aW9uIGZvciB0cmFjaW5nIGFuZCBhY2NvdW50aW5nIG9mIHJlbW90
ZSBUTEIKPiArCSAqIGZsdXNoZXMuCj4gKwkgKi8KPiArCVZNX1dBUk5fT04oIWNwdW1hc2tfYW55
X2J1dChjcHVtYXNrLCBzbXBfcHJvY2Vzc29yX2lkKCkpKTsKClRoaXMgd2FybmluZyBtaWdodCBm
aXJlIG9mZiBpbmNvcnJlY3RseSBhbmQgd2lsbCBiZSByZW1vdmVkLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
