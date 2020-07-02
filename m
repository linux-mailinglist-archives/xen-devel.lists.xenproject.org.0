Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D1212402
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 15:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqypD-0002e0-Ua; Thu, 02 Jul 2020 13:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6eVn=AN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jqypC-0002dv-Lx
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 13:00:22 +0000
X-Inumbo-ID: fc61239a-bc63-11ea-8826-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc61239a-bc63-11ea-8826-12813bfff9fa;
 Thu, 02 Jul 2020 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593694821;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=JpdqUWmLtIxp95F8LhvgPzgrsk18CcQn9P14QlRU8w4=;
 b=CYGxmhN9ilKxeHdgvQTwsH7TUmmMeNpjSLZ/KMpbM9a5gTJZ+pufgopJ
 IUWIXjnjy6Z2PIdn3ckP5NLonTVMQzhr5PAvsuJytBXfEVRwQyG0g6n4l
 MJaQsaJ/g0mxTRMbry5HCbHg5zcpI8ZmPBezdhKnBV7S/hGHiytutfaDR s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qx072hEsQjapmb+M6zyM+dhQT53LCju5GCPkso4fuP9CPCtTNAxSQ9TVW+NfY+5AlQlaHVBVz3
 hHbehskfstKAb2l+kSpoSqgZCHPQ/LIyVAyZJ5Qp6BicBSxiTwNnsPAkZtbZG9twq3gLq+0MEh
 1kZwsKCn+1n3uLF6JhyDnZuX5mONXbSlabzDAIDmGz5CAPwW+NBTloZdYTZt7M3CmdJOr31pqz
 dKWw/DgDQeguYYE6yuGItvUUU+ok3emcvErD0SGJabMy4PI3v3HqMWlv9+u5l2Kz+MdfyBWhSW
 xts=
X-SBRS: 2.7
X-MesageID: 21819042
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,304,1589256000"; d="scan'208";a="21819042"
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
Subject: Community Call CANCELLED this month
Thread-Topic: Community Call CANCELLED this month
Thread-Index: AQHWUHC3euMoSyGYyUylOaYjFN5BqA==
Date: Thu, 2 Jul 2020 13:00:10 +0000
Message-ID: <AA2A5E63-6791-4B81-9571-4FA6C4A2DAD3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F3A688F48244F4E85E97012D80ACB75@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IGFsbCwNCg0KUmF0aGVyIHRoYW4gaG9sZGluZyB0aGUgY29tbXVuaXR5IGNhbGwgdGhpcyBt
b250aCwgSSB0aGluayBwZW9wbGUgc2hvdWxkIHN1Ym1pdCBkZXNpZ24gc2Vzc2lvbnMgZm9yIHRv
cGljcyB0aGV5IHdhbnQgdG8gZGlzY3VzczoNCg0KaHR0cHM6Ly9kZXNpZ24tc2Vzc2lvbnMueGVu
cHJvamVjdC5vcmcNCg0KV2XigJlsbCBwaWNrIHVwIGFnYWluIGluIEF1Z3VzdC4NCg0KIC1HZW9y
Z2U=

