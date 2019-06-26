Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DE5607A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 05:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfyvY-0007yz-44; Wed, 26 Jun 2019 03:48:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PrWr=UZ=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1hfyvV-0007yu-O4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 03:48:53 +0000
X-Inumbo-ID: 4fc02699-97c5-11e9-8980-bc764e045a96
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (unknown
 [40.107.68.68]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fc02699-97c5-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MipVIl/vK4jT6xfDxXZnl22+gCgO6Ner30cT/dH+FYA=;
 b=XC+xHE8mDv2cKU9kwuQMb6VQg0eKbWnjkIk5SsfB0kSFU6ULjTRlUEqFWgmQz7a3Q9kmvR/84s4vmm/7KHXrf1VEfLvCmLPxwYjh6pwTI5XdghYKz6BtechdSpjdRTe4tw0uOepeVhFRAbM9c820ZvwzV2NyforHfSAJ8DOR4Yg=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
 BYAPR05MB4918.namprd05.prod.outlook.com (52.135.235.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Wed, 26 Jun 2019 03:48:49 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::f493:3bba:aabf:dd58]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::f493:3bba:aabf:dd58%7]) with mapi id 15.20.2008.007; Wed, 26 Jun 2019
 03:48:49 +0000
From: Nadav Amit <namit@vmware.com>
To: Andy Lutomirski <luto@kernel.org>
Thread-Topic: [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
Thread-Index: AQHVIbQneqvfvnASJUSZoJZyXs9UlaatXWmAgAADTQA=
Date: Wed, 26 Jun 2019 03:48:49 +0000
Message-ID: <28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
References: <20190613064813.8102-1-namit@vmware.com>
 <20190613064813.8102-5-namit@vmware.com>
 <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
In-Reply-To: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [204.134.128.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb2700b8-7c95-44a7-7ea3-08d6f9e932f9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR05MB4918; 
x-ms-traffictypediagnostic: BYAPR05MB4918:
x-microsoft-antispam-prvs: <BYAPR05MB4918241570189A72A62A0AD6D0E20@BYAPR05MB4918.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(136003)(376002)(199004)(189003)(76116006)(102836004)(33656002)(91956017)(81156014)(76176011)(446003)(2616005)(316002)(11346002)(6486002)(73956011)(7736002)(6116002)(6916009)(36756003)(229853002)(54906003)(305945005)(66066001)(81166006)(66556008)(6506007)(8936002)(14454004)(7416002)(476003)(256004)(86362001)(4326008)(2906002)(53546011)(64756008)(6512007)(8676002)(26005)(6436002)(6246003)(4744005)(66946007)(71190400001)(66446008)(53936002)(186003)(25786009)(486006)(68736007)(478600001)(66476007)(71200400001)(3846002)(99286004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4918;
 H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: my4KTkN3aqGXmWhsjfVVxjr2Sm5jxWwCaMIuqKK1SsSqfx8cHPx4n7R/9FEhekYtgpGmPoA2h6nrHG+Rz9L+JQsOqVLuwNvdEQaMWrCZP5qmj2mkG2t8zspoeNUHe6nCs4Y376EXS5L+59rbBaGcI7/Uh5HlOSRZEGrZdEiUA+DWcY+l2XlRv9JlVTF/g2eykA/66MtRJsOCSLrhfyecmaFOXkw9qYctXE2l1tb4y03sQ948HXUHOY4Sm2rNKOqk6IcdUuaYwgu2eYDCUjv3QsrQk85ptyza2hGIyDPYsJNr/D2fB3z+zk1AWlB0T9oDTOsQLCVM30dXJaJTr6JzyyuaVbSXADluDzrGIjHaSB+X+uG1sYe+/Oz6VFJpDdB7qrQQOhC59RFt//fXiwkrodWD5nTlq09DMzrcv+Fmdyo=
Content-ID: <E62AD8D44ED93F48AE881F9F9D2418DD@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2700b8-7c95-44a7-7ea3-08d6f9e932f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 03:48:49.6652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4918
Subject: Re: [Xen-devel] [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs
 concurrently
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
 Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdW4gMjUsIDIwMTksIGF0IDg6MzYgUE0sIEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxMTo0OSBQTSBOYWRh
diBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiB3cm90ZToKPj4gVG8gaW1wcm92ZSBUTEIgc2hvb3Rk
b3duIHBlcmZvcm1hbmNlLCBmbHVzaCB0aGUgcmVtb3RlIGFuZCBsb2NhbCBUTEJzCj4+IGNvbmN1
cnJlbnRseS4gSW50cm9kdWNlIGZsdXNoX3RsYl9tdWx0aSgpIHRoYXQgZG9lcyBzby4gVGhlIGN1
cnJlbnQKPj4gZmx1c2hfdGxiX290aGVycygpIGludGVyZmFjZSBpcyBrZXB0LCBzaW5jZSBwYXJh
dmlydHVhbCBpbnRlcmZhY2VzIG5lZWQKPj4gdG8gYmUgYWRhcHRlZCBmaXJzdCBiZWZvcmUgaXQg
Y2FuIGJlIHJlbW92ZWQuIFRoaXMgaXMgbGVmdCBmb3IgZnV0dXJlCj4+IHdvcmsuIEluIHN1Y2gg
UFYgZW52aXJvbm1lbnRzLCBUTEIgZmx1c2hlcyBhcmUgbm90IHBlcmZvcm1lZCwgYXQgdGhpcwo+
PiB0aW1lLCBjb25jdXJyZW50bHkuCj4gCj4gV291bGQgaXQgYmUgc3RyYWlnaHRmb3J3YXJkIHRv
IGhhdmUgYSBkZWZhdWx0IFBWIGZsdXNoX3RsYl9tdWx0aSgpCj4gdGhhdCB1c2VzIGZsdXNoX3Rs
Yl9vdGhlcnMoKSB1bmRlciB0aGUgaG9vZD8KCkkgcHJlZmVyIG5vdCB0byBoYXZlIGEgZGVmYXVs
dCBQViBpbXBsZW1lbnRhdGlvbiB0aGF0IHNob3VsZCBhbnlob3cgZ28gYXdheS4KCkkgY2FuIGNy
ZWF0ZSB1bm9wdGltaXplZCB1bnRlc3RlZCB2ZXJzaW9ucyBmb3IgWGVuIGFuZCBIeXBlci1WLCBp
ZiB5b3Ugd2FudC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
