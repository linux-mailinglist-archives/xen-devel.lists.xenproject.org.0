Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B085D2335BC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 17:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1AgZ-0004Zq-Lw; Thu, 30 Jul 2020 15:41:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTMv=BJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1AgY-0004Zl-I5
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 15:41:34 +0000
X-Inumbo-ID: 24827126-d27b-11ea-8d98-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24827126-d27b-11ea-8d98-bc764e2007e4;
 Thu, 30 Jul 2020 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596123694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E2cl8ZcK0apEIOBVFe2bXnr32SKn5oC/68bk31hlAQo=;
 b=JaFOr4WdDlCAMtJo3OdXHGPjoH+YclG3V2YsD6ANYCGpBiJExZbBdXNE
 2Y8PakSZY/QzyAa9nFoVsNydcp3EJ17TqBm5r8i4spd4H6rrxSDvSBNx5
 miH7GUZGQMFNdKtH834LzEXgQkU008FoolYGBwHrqqZtmFZk8gpw9EGqF 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GUh8wbltn/5QguZNqKP/VJEpybgE2keFaz8OG9moVWWzPNr5nsHQXPeE6carXVd1XdmRTIcJmD
 rQX3T/1XR7hJTPXhzaXWtOM5pjswLE3eoxOxxKkkQa44Tekskf2o0t9zhUk8XxwY3Pkp2orak+
 SPRpyyx10aLvhuD4A7K60U64Rpdx6AOUoUeCJISQomwrcaXexM0xZ6EsSAqQrU/Cj6g77PHbLz
 UF4eYwTngaIpjT2GRzlwK4XJkCWEuIr7wKiw+My5BrLvRK1Nb15Sep8cIFg2yfckANZx29jt6e
 cSg=
X-SBRS: 2.7
X-MesageID: 23546757
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="23546757"
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
 <intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
 <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>, "Ji, John"
 <john.ji@intel.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev
 <Artem_Mygaiev@epam.com>, Matt Spencer <Matt.Spencer@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
 <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>, "Olivier
 Lambert" <olivier.lambert@vates.fr>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
Thread-Topic: RESCHEDULED Call for agenda items for Community Call, August 13
 @ 15:00 UTC
Thread-Index: AQHWZoSNV69Oim50MkyA6CRuliqKJqkgITQA
Date: Thu, 30 Jul 2020 15:41:26 +0000
Message-ID: <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
In-Reply-To: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <831A920F1F6F3A40B62003D1E0AC1CF7@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMwLCAyMDIwLCBhdCA0OjE3IFBNLCBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSGV5IGFsbCwNCj4gDQo+IFRoZSBjb21t
dW5pdHkgY2FsbCBpcyBzY2hlZHVsZWQgZm9yIG5leHQgd2VlaywgNiBBdWd1c3QuICBJLCBob3dl
dmVyLCB3aWxsIGJlIG9uIFBUTyB0aGF0IHdlZWs7IEkgcHJvcG9zZSByZXNjaGVkdWxpbmcgaXQg
Zm9yIHRoZSBmb2xsb3dpbmcgd2VlaywgMTMgQXVndXN0LCBhdCB0aGUgc2FtZSB0aW1lLg0KPiAN
Cj4gVGhlIHByb3Bvc2VkIGFnZW5kYSBpcyBpbiBaWlogYW5kIHlvdSBjYW4gZWRpdCB0byBhZGQg
aXRlbXMuICBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRvIHRoaXMgbWFpbCBkaXJlY3Rs
eS4NCg0KU29ycnksIGluIGFsbCBteSBtYW51YWwgdGVtcGxhdGluZyBJIHNlZW0gdG8gaGF2ZSBt
aXNzZWQgdGhpcyBvbmUuICBIZXJl4oCZcyB0aGUgVVJMOg0KDQpodHRwczovL2NyeXB0cGFkLmZy
L3BhZC8jLzMvcGFkL2VkaXQvOWM1ODk5M2EwOGZlOTc0NTFmMGE1YjZjOGJiOTA2YjEvDQoNCiAt
R2VvcmdlDQoNCg==

