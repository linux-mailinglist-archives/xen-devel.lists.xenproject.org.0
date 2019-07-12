Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D067319
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 18:12:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hly7Y-00042s-9t; Fri, 12 Jul 2019 16:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iJO3=VJ=wdc.com=prvs=089da2055=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hly7W-0003r4-LI
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 16:10:03 +0000
X-Inumbo-ID: 7ec1bccc-a4bf-11e9-a099-4b8ff97f92a9
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ec1bccc-a4bf-11e9-a099-4b8ff97f92a9;
 Fri, 12 Jul 2019 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562947862; x=1594483862;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=N0fhyTrShdGrfIW5zABp0j8FA7VDbZFhG3Fjh78mCWY=;
 b=rXOk9Jk1c60Yp3i08aIr05lnw9Ywu3BslQ6FX5HEfdDQoBYGVBRb8MNE
 g0fi8bpioeqnOfA5LqYShiCE11k9wQuy+Rhyd99B12pky6A9pU1aKKOG4
 7s3Oa6bbqjj1UmrTK7Vtcmx0Lh8xwwxgaDBRio9tUAvoP5jOjb8AbJxb8
 HUnr1lsDaUsYKswb0MthIiszA+QZzCUJMgi8tE6HPZ/KyDyYI4E0pDD2r
 mRLP0S6RM3FTSwiHlJfcDYWrmTUdD3ZQu0JEXLqxTwa3TzTAW3Ue5mkjk
 POr+QnHyzKcxbOpUbgk1oWAt2KxJRliUGhrdq0IePWNZobCsMOSXt1KmB w==;
IronPort-SDR: D7AKZ0sFotlHabHpoZYaGMlm/sydqrz7/jqe+0fse36zw+twTcdZhYTT7MlL0ogV0CKYTD55Gf
 Bsr2889sTfy/fjz0AmhXWUW/HzFzQVnlr9a939AsqK2BjTAwJgbdLKHdPZkJ4/1uutLKEUG2oS
 ixF0mtoh0DBGZKyxKNd0HIZZnMM0sayw/CHbgPIBMhOWqf1HSDECJbNf6uFj+O8f9fBDElS60m
 eAOWlVIw9dMYzDqHv41RHTXPlHbO80gMayCx1rw5SnOhmQ6xfbWc0WIU1B5s3ZLJAflbLLFuQ3
 mOo=
X-IronPort-AV: E=Sophos;i="5.63,483,1557158400"; d="scan'208";a="212841637"
Received: from mail-by2nam01lp2054.outbound.protection.outlook.com (HELO
 NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.54])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2019 00:11:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDqjVCuNjygIykNV6cNUa9bqD2yACUy0tABSvnq9LH8=;
 b=NCcXh2b2sDhx2kujb9Mi9sQjnCYoIL7v+saCw3b9UvlfBu4AwEhdHn/6a/NuFDaOIkcVUtCpPZ49UhWCpV8b4sFB9xqHr8qd/vBLp1q9XaoomtOQHdzCgQmui2yVJm+Y22Syi3fUzsgUXlC8RCMR1HtCRw9OiK0QJSc/O975Y50=
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.58.26) by
 BYAPR04MB5992.namprd04.prod.outlook.com (20.178.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 16:09:57 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
 ([fe80::8025:ccea:a0e6:9078]) by BYAPR04MB5749.namprd04.prod.outlook.com
 ([fe80::8025:ccea:a0e6:9078%5]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 16:09:57 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCH V4 1/9] block: add a helper function to read nr_setcs
Thread-Index: AQHVNb2Z4KyEErtQ+UKxJ+HV/zvqXg==
Date: Fri, 12 Jul 2019 16:09:56 +0000
Message-ID: <BYAPR04MB5749AF90A9E9C81B4A6857F386F20@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
 <20190708184711.2984-2-chaitanya.kulkarni@wdc.com>
 <yq18st457yb.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fd8b164-03d7-4925-211a-08d706e3622d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB5992; 
x-ms-traffictypediagnostic: BYAPR04MB5992:
x-microsoft-antispam-prvs: <BYAPR04MB59928DC0BC9E08C4D8F6E87B86F20@BYAPR04MB5992.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(6506007)(316002)(71200400001)(74316002)(68736007)(8676002)(52536014)(53546011)(486006)(7736002)(476003)(81156014)(229853002)(305945005)(71190400001)(54906003)(81166006)(86362001)(446003)(7416002)(9686003)(99286004)(66066001)(2906002)(55016002)(4326008)(53936002)(6116002)(3846002)(4744005)(14454004)(478600001)(25786009)(7696005)(8936002)(186003)(66946007)(66476007)(6916009)(76176011)(66446008)(66556008)(64756008)(33656002)(26005)(256004)(5660300002)(6436002)(76116006)(102836004)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5992;
 H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m65h7YZuEY0B2mfDKE2vkIXVULnruRvyk75fkhxpzgV8FGZL0HMHPsVsO3Ld72vawN7WKVVQVXbNEJOmwfyNDP2X4a+0E0paeczD8wg8EJdAk/MO31iAajhL+AClW8vfPHDJxKpz6murAWqgDaWbazuQSy0jckZX4eiBk6CvM943Zgx+byGUPYfyINRdHDL/cvOEIMyW0DZt8bX9qToeV6rDXeZXWJnCz2EWjWnKcjDNOG9yw0cMYRInUFzmF8Dp7k+BYNk4UxCHdsb4X9p6N17n1ruhBfeEFtMd9MzKAEjKWLfM4lmH5QnVWwFc35IF0T0ny/7DZiTyjcatQnmN1qV/jZ+mz/bps1cVRQ/K1JFQKMab76cKP5gARNjhf8PUjQnUxyEF/QBlfMbONiOUw0ACwiDqha4PIrw/QTNZJfU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd8b164-03d7-4925-211a-08d706e3622d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 16:09:56.9522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chaitanya.Kulkarni@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5992
Subject: Re: [Xen-devel] [PATCH V4 1/9] block: add a helper function to read
 nr_setcs
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

T24gNy8xMS8xOSA2OjU5IFBNLCBNYXJ0aW4gSy4gUGV0ZXJzZW4gd3JvdGU6Cj4gSGkgQ2hhaXRh
bnlhLAo+Cj4+ICtzdGF0aWMgaW5saW5lIHNlY3Rvcl90IGJkZXZfbnJfc2VjdHMoc3RydWN0IGJs
b2NrX2RldmljZSAqYmRldikKPj4gK3sKPj4gKwlyZXR1cm4gcGFydF9ucl9zZWN0c19yZWFkKGJk
ZXYtPmJkX3BhcnQpOwo+PiArfQo+IENhbiBiZGV2IGVuZCB1cCBiZWluZyBOVUxMIGluIGFueSBv
ZiB0aGUgY2FsbCBzaXRlcz8KPgo+IE90aGVyd2lzZSBubyBvYmplY3Rpb25zLgo+ClRoYW5rcyBm
b3IgbWVudGlvbmluZyB0aGF0LiBJbml0aWFsIHZlcnNpb24gd2hpY2ggd2FzIG5vdCBwb3N0ZWQg
aGFkCnRoYXQgY2hlY2suCgpUaGlzIHNlcmllcyBqdXN0IHJlcGxhY2VzIHRoZSBleGlzdGluZyBh
Y2Nlc3NlcyB3aXRob3V0IGNoYW5naW5nIGFueXRoaW5nLgoKU28gaWYgYW55IG9mIHRoZSBleGl0
aW5nIGNvZGUgaGFzIHRoYXQgYnVnIHRoZW4gaXQgd2lsbCBibG93IHVwIG5pY2VseS4KCkZvciBm
dXR1cmUgY2FsbGVycyBJIGRvbid0IG1pbmQgYWRkaW5nIGEgbmV3IGNoZWNrIGFuZCByZXNlbmQg
dGhlIHNlcmllcy4KCldvdWxkIHlvdSBwcmVmZXIgYWRkaW5nIGEgY2hlY2sgID8KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
