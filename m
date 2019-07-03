Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF695DC8D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 04:32:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiV1g-0007lZ-9p; Wed, 03 Jul 2019 02:29:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPu/=VA=wdc.com=prvs=08019a6bf=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiV1e-0007lS-57
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 02:29:38 +0000
X-Inumbo-ID: 660dbdaa-9d3a-11e9-8980-bc764e045a96
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 660dbdaa-9d3a-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 02:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562120977; x=1593656977;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=l+l9DomngQKuSuSJqAgq6wo3tjf1GndxXG/AHhjYVP8=;
 b=gvwMYxmrMPr6ODKRbzau472X6RnwFt8RkAUqwd5A9m4R1KHLfaoNfWfP
 AMW/V568XFbGxYWUYvUgKuBfnYb2M8KB4IWSvxK+o2qIR8Sm78Tf+KB9v
 9Ban7so+rEGsXAj1WNWKBI76KQ4BAA/8JeXwbvQaY/ff1erL66/BEOijQ
 CgVMHmcZtKs/okpptFngQNHTZmB6TMSN8dBPBuwvdQmXIKmIOyhyiJOwi
 8t7aExBKuzQaXc6Wn5oZjkCFDw1scHO8Y70dwlyh0a4UnzqHpV9gBahaD
 Fvn6ziHL7KVBs61u8Jg+KOLE7fYwDdSyxxotXFS78LZ0uVci4le0r4EYX g==;
IronPort-SDR: RHGJlDbjhGP2ZJcmx+kmVw2eYFmSmXpU6yt5ANml9SA6c3w206y3QQ3qscbRBjpW2D5raJhg6z
 Zu45ggnS24zkMK1d9NvCmJjMka5NeY/6E/5aT9LqR3z+XOMFWqWsSw6VzaOn8ZF6bt/C0rxrts
 c9E+sZRBlWZkEIdaLda6CdvO1YGPcGBrjqaMy5U3HXmVIGKI0x7/E2iSTAh+GTVNMXMEvNMDqM
 zpu6Q6BdIQwRLN0EHp7Onc4SwxumKIVB9Cka//O3ZyVzdiaSbZg1kcl8goKSIIGwHotYI8Z4ib
 im4=
X-IronPort-AV: E=Sophos;i="5.63,445,1557158400"; d="scan'208";a="113301685"
Received: from mail-dm3nam05lp2056.outbound.protection.outlook.com (HELO
 NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.56])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 10:29:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QTXJPiil0L5APfru6tr55G3cKzXxDERcVNdWAnJ1+U=;
 b=VuCizFLVSFkjRb8Qys9kmFaOSf17rsHCHxzPrPjtSRZnsmbvbAWBxy9w0MMJBACZ49gPy+wQxxi5QEYx+xuLih4aZvmW6XbIb/q2yTkMCD9+mZniQC4Sp3OZJqmmuYPgpnl/26xgxgD/9tBrPkweOpEV+gce5Jkk24fWbYdKfqw=
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
 DM6PR04MB5388.namprd04.prod.outlook.com (20.178.27.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 02:29:33 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::a07d:d226:c10f:7211]) by DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::a07d:d226:c10f:7211%6]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 02:29:33 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Thread-Topic: [PATCH V3 4/9] blk-zoned: update blkdev_reset_zones() with helper
Thread-Index: AQHVMP2kFSOCc0lMzky+P079uDsX6Q==
Date: Wed, 3 Jul 2019 02:29:33 +0000
Message-ID: <DM6PR04MB5754D27FC41D86E2D419DD6C86FB0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-5-chaitanya.kulkarni@wdc.com>
 <20190703002347.GE15705@minwoo-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [2605:e000:3e45:f500:c10e:84d:47cf:30ea]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b20f2cc8-ec95-4a6d-0990-08d6ff5e4908
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR04MB5388; 
x-ms-traffictypediagnostic: DM6PR04MB5388:
x-microsoft-antispam-prvs: <DM6PR04MB5388E1CEA3083E021D0EE5F286FB0@DM6PR04MB5388.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(99286004)(53936002)(6436002)(9686003)(55016002)(71200400001)(7696005)(14454004)(25786009)(7416002)(73956011)(6506007)(54906003)(186003)(71190400001)(53546011)(316002)(476003)(446003)(91956017)(486006)(6246003)(6116002)(102836004)(76176011)(4326008)(6916009)(229853002)(256004)(86362001)(76116006)(66446008)(33656002)(4744005)(68736007)(66556008)(15650500001)(64756008)(8676002)(7736002)(72206003)(46003)(52536014)(478600001)(66946007)(305945005)(8936002)(81156014)(81166006)(2906002)(74316002)(5660300002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5388;
 H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KC9Cpj5oHfF5EMnpjqmMcP38npo0T5L9eJC6PahoMTFVqRqOM043yiIIbBae2Cr5TJjei+hmZJRv2Zu4Joc0WESq+pqAtV8aXaFXsLyjXzQwLcQ/tvkro6CKioO/Ar324Z35QYFQX99OjMJbpr+dsDkdhj4KNcES2acLn1KC3IEYmj2DgcK4/HIfzeaBWFxsiDvGR3kyLO8lvC6S6ffAC1WEaojuIReKVHlzp752yeRuYzt6dheHka5cSZev+k8EY8QDadqJxskC/KW9NEUyPdsshYhaLF8oxkoBxpnnJGCwjtD6tzuBjF66MDYrWpvu2YcJFTno33SnKf6L+ydGlqAUWLlep5bFy+MuyBxQxklvDE0umkY/w4fy+RhE9QIjun8Vi50rWcW+Q2riklIBfgNCCWpYf1HVZq/7xTLYvmM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20f2cc8-ec95-4a6d-0990-08d6ff5e4908
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 02:29:33.4847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chaitanya.Kulkarni@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5388
Subject: Re: [Xen-devel] [PATCH V3 4/9] blk-zoned: update
 blkdev_reset_zones() with helper
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-btrace@vger.kernel.org" <linux-btrace@vger.kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuchao0@huawei.com" <yuchao0@huawei.com>, "colyli@suse.de" <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8yLzE5IDU6MjMgUE0sIE1pbndvbyBJbSB3cm90ZToKPiBPbiAxOS0wNy0wMiAxMDo0Mjoz
MCwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOgo+PiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGJs
a2Rldl9yZXNldF96b25lcygpIHdpdGggbmV3bHkgaW50cm9kdWNlZAo+PiBoZWxwZXIgZnVuY3Rp
b24gdG8gcmVhZCB0aGUgbnJfc2VjdHMgZnJvbSBibG9jayBkZXZpY2UncyBoZF9wYXJ0cyB3aXRo
Cj4+IHRoZSBoZWxwIG9mIHBhcnRfbnJfc2VjdHNfcmVhZCgpLgo+IENoYWl0YW55YSwKPgo+IEFy
ZSB0aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyBzcGxpdCBmb3IgYSBzcGVjaWFsIHJlYXNvbj8gIElN
SE8sIGl0IGNvdWxkCj4gYmUgc3F1YXNoZWQgaW50byBhIHNpbmdsZSBvbmUuCj4KPiBJdCBsb29r
cyBnb29kIHRvIG1lLCBieSB0aGUgd2F5LgoKSW4gdGhlIGJsay16b25lZC5jIGluIHRoaXMgd2F5
IGl0IGlzIGVhc2llciB0byBiaXNlY3QgaWYvd2hlbiB0aGUgcHJvYmxlbQoKY29tZXMuCgo+Cj4g
UmV2aWV3ZWQtYnk6IE1pbndvbyBJbSA8bWlud29vLmltLmRldkBnbWFpbC5jb20+Cj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
