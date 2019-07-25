Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B974BBD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:38:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqb7G-0001w0-9z; Thu, 25 Jul 2019 10:36:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqb7E-0001vp-JM
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:36:52 +0000
X-Inumbo-ID: 1c31492d-aec8-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c31492d-aec8-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:36:51 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:36:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:35:49 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:35:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqrSfGrNREiJHGNl+QkaQijpKIiISgtUjKC4ncdXkvVfv859qT8e6jCUlh35yTcDY4Oh4SJkcbWwbgy8yeshUMrp7YgI2PsSZ6H9r9vLEa4gVQfNQEP+1zke68cCTRhJ86HgE8IW2DavwgllSbIEh0MNz/L2yxD3Upm0LzPlwqNMLG+vvcjawAX8kOG4sFkwXuWZ9UK0ohcSD8IHc1zcQ3dyzUi2SFlfsw82ZS6B6JzTIEI33F8LsBh1JsBnlQ/GzN2HuInIVyEXGqVTcGhBCSFdDIV3TONXnQ+pEbwa0OtztaAUMnuwFHHv2xJ+nkmgV79UsIWbzkQiXjizohiYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e869mG4pNSI1uZseh0JmPukFAykr5+B+zS0bfiXXd5U=;
 b=jTDzHZ73MQLvQGqcK30HEr6XEohz5+9ETw/r/bOkG4fDS8/iR8NIhVzD5zoM36b4BZl5jZI9cXyROvVPHVS1L3R2+U9XweztAqYD+DG+WNa+Inawy8M9s1COPBl2kYbpuiz9FP0DSIfXyKxlrVnU698d5PsUxWPcc7SqOI4Ujutr7M080y5JYqRneBFSSpIKOsHmCsqKuh4t5fMFTeFaZQNyDCN9TT5SH/914ZIWPln1e4SZW/Tk/+0jaW1LAXGy7PcKwdOcwfBizA5nuKGqSofpig/JKMQWktQYZEGLnoQ+6Ke2GYW7sgGndLQDn9IQROY5zilRUIQoO1xyJw992A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2985.namprd18.prod.outlook.com (20.179.48.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 10:35:48 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:35:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 2/3] x86/dmi: Drop trivial callback functions
Thread-Index: AQHVQkdKBV8AYBVwqk6k/Z84XZJf5abbJN2A
Date: Thu, 25 Jul 2019 10:35:48 +0000
Message-ID: <701dbbb3-030e-4a18-2dff-1ce376bc995e@suse.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
 <20190724174256.5295-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190724174256.5295-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::25) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783d9c64-ab11-457f-dc93-08d710ebdb85
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2985; 
x-ms-traffictypediagnostic: DM6PR18MB2985:
x-microsoft-antispam-prvs: <DM6PR18MB29850C2C12A58604D0EA10F8B3C10@DM6PR18MB2985.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(11346002)(2616005)(476003)(102836004)(446003)(386003)(6246003)(31696002)(316002)(486006)(6916009)(6486002)(229853002)(53546011)(6506007)(186003)(99286004)(66946007)(76176011)(26005)(52116002)(5660300002)(4744005)(256004)(25786009)(305945005)(64756008)(66556008)(66476007)(53936002)(4326008)(71200400001)(86362001)(66446008)(71190400001)(478600001)(3846002)(8936002)(31686004)(6116002)(6436002)(6512007)(14454004)(8676002)(81166006)(81156014)(68736007)(2906002)(66066001)(7736002)(36756003)(54906003)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2985;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jqE86f7PXk7Hi7SRwY6q6xnQywsmgWxoNBLG/tSJI+ME1nVceSZT4i7wOPRMb7Fnp4FHBDAbtpiHKBpAa+KfkjAZDiV7wDlriqNYPUPkT0Qy2d3CsY7LrTShBzzsFUrav3rRe3w3WOOQyOcmx8w0bIOm1RA2iVoI6l8ONHiLgUkMowYtifds/62PTiN9kjGK4vclqulTBEXov+Fjwl2l3+BgAHrbUfj8SZiAANU/h8CCFhDnJA8GLbOp7UyATh3bgSNFQIXugBrlpn/G0Jt3waqrHW9nvwJuyta4MLYDml52baWrOYfXlnTqT2lZyRZ8Ec2dYe2JbJl+YCXGXfRRw8fTFlBLO5HE/xGzwG+vCioUAOJztl0Cx0yckENrudKZxIOALSbJYAAlSTJVVaVR/vcF06LKi/bJIfzRwY6tt/k=
Content-ID: <A499F89FA512FF4CBB4899AFD424AA2B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 783d9c64-ab11-457f-dc93-08d710ebdb85
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:35:48.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2985
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/3] x86/dmi: Drop trivial callback functions
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxOTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gZG1pX2NoZWNrX3N5
c3RlbSgpIHJldHVybnMgdGhlIG51bWJlciBvZiBtYXRjaGVzLiAgVGhpcyBiZWluZyBub256ZXJv
IGlzIG1vcmUNCj4gZWZmaWNpZW50IHRoYW4gY2FsbGluZyBpbnRvIGEgdHJpdmlhbCBmdW5jdGlv
biB0byBtb2RpZnkgYSB2YXJpYWJsZS4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBidXQg
dGhpcyByZXN1bHRzIGluIGxlc3MgY29tcGlsZWQgY29kZSwgd2hpY2ggaXMNCj4gYWxzbyAoZnJh
Y3Rpb25hbGx5KSBxdWlja2VyIHRvIHJ1bi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
