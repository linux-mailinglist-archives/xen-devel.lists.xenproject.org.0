Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F212B0538
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 13:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25803.53814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdC6x-0003S8-7q; Thu, 12 Nov 2020 12:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25803.53814; Thu, 12 Nov 2020 12:53:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdC6x-0003Rj-4Q; Thu, 12 Nov 2020 12:53:59 +0000
Received: by outflank-mailman (input) for mailman id 25803;
 Thu, 12 Nov 2020 12:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81XN=ES=epam.com=prvs=9585825f72=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdC6v-0003Re-N5
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:53:57 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7c94627-d6ad-43c6-8249-1da5099a67dc;
 Thu, 12 Nov 2020 12:53:56 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACCVRTo008957; Thu, 12 Nov 2020 12:53:51 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 34rf80ur4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 12:53:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6883.eurprd03.prod.outlook.com (2603:10a6:20b:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 12:53:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=81XN=ES=epam.com=prvs=9585825f72=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdC6v-0003Re-N5
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:53:57 +0000
X-Inumbo-ID: b7c94627-d6ad-43c6-8249-1da5099a67dc
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b7c94627-d6ad-43c6-8249-1da5099a67dc;
	Thu, 12 Nov 2020 12:53:56 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ACCVRTo008957;
	Thu, 12 Nov 2020 12:53:51 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
	by mx0b-0039f301.pphosted.com with ESMTP id 34rf80ur4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2020 12:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtmHfC5BMTrN+OKh6X09/JYWiowjpqGtK2Teoz47X0TI5KHgSyjWq7pADimbC1lBZ0ipRut/RfdX+gNejnjWS+qPkKXkD+bSEx12lhgOOCMKyQtD/FcvzZcqNvup9sxIoiWkOD0F1IJ33Ds6u5B14Yq5HA2WbXnvl9ohp6AC+rUrM2X37LO3DYjBCmVPchioEgZbcgSCPj7zee/OPlLv5s6XtDdqa1Z8AqC83EhJsAKG2FxoFK2muxcx8ORpDdrnMKJzXcSLDQJi/vKBOk7p2nc2p/vOsuSD34T6AXUxSS4OGk4to3KDtzoMFlbznad4Jmqw5fwNFZBbZuEnN5rXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNloKH2E3e+RoItDDf/WzumfowLq0jgvU8+B2joGuxw=;
 b=aHRw1tDuXFo3PmC1QUo4m5J/3UU9rPTNJ90CZOsGCzR+r+6Xs0bC4eyrsNS+40iugAHdMX00fJHA9Sc6yP3iTpqT/sbzt7dGamYQPBoeGomSbTLSwfy989IkrasLZ3rFfW1r5VpZeD4633dtFc9QVm+VGCw6NU5owdZzv1HxBOjzViVJcNiauVEsPOpd4vVs9Kz+ex3yOHao4J8CjSxr3hf+U687itdtCMHYZAGi6TbOzr1nWsqGMAkd4nuoVwwyOEv3VwCp41HTJ3Dg9owR6uoiS8LB1YxDOaGL0abXZz3s1o7GAh6YWqDeqkZUz6zRj2zcsXfzXEGET6vuesD9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNloKH2E3e+RoItDDf/WzumfowLq0jgvU8+B2joGuxw=;
 b=ZltFrQrvik9V/OytNu0SxR+A7C00v/xQ17fSZ0Ad4UBZLz0ji+5P7O9eyFnyykBdeS9XYhvaBF272jo4mBwjE8KOCfW3Lbx2sCMvAlLZAogdedNWlYe3+az+GFMCws/FZB1gmdoGN3DgdKWyuFcopGXpQC2jGFkfwCZ2NndV8RUKp1KqF/upm2O+ESbVIdRUOV1ttybQ/6xbGoIq4kKCpX4uJ/SyU92+L8DZeT4/VvcyiY0BDTt7bQK+lXRy6VdKiiU3/qziXXUpo6aaQ3vxXzYX2fgCY0kHqtrx0RMfaegUKUNzY5u61jGqVA22SyQ75/TBbEOrGRVeqPTNkI0bfw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6883.eurprd03.prod.outlook.com (2603:10a6:20b:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 12:53:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:53:47 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com"
	<julien.grall@arm.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Topic: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Index: AQHWtpbuKiRgL1HiZkyNC2yoNcmnl6nDB9uAgAFwr4A=
Date: Thu, 12 Nov 2020 12:53:47 +0000
Message-ID: <eb50b7f2-a2fb-a7fb-7937-511e5b26f7a0@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
 <6a2dc03e-202b-b8f9-46a5-9c90d9de8a6d@suse.com>
In-Reply-To: <6a2dc03e-202b-b8f9-46a5-9c90d9de8a6d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d80fe6d-4369-4ae7-6fea-08d88709ff36
x-ms-traffictypediagnostic: AM9PR03MB6883:
x-microsoft-antispam-prvs: 
 <AM9PR03MB688340CF3793A3731938A77AE7E70@AM9PR03MB6883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9n4yyALzw3SpINwl5CHT67G702I2j+PMOIm0ydeuma/nh1s/51GDHLKhAQnmGYP6wfMQ7ooYTWc/7iBRqjzNSJ4vCV1lefy1Rb+CCdero+hXdxdZ8KlTf1Pkf4dbe/cPj1w4/2MmOlma1+pIqiJJsrVq+Q1ID+2FdODOiYZ5KykbvjkCN4U7dWIZWhH+sc0AMzVQ6XOQxPUfGkEbq3a3oUBjb/en3lZF9ciFiTiJBZUlCa/Q2lNe4LjJWlbTID1Y2gN7Fnz3Df7+MBiuX7K3Tfhz/8Uas/fNYN56XZDHYlO0i8gpHBEswyWUAvbWykjXk90FcUTbN6oJ+808Exetow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(2616005)(83380400001)(6512007)(36756003)(2906002)(6486002)(8676002)(8936002)(31696002)(53546011)(71200400001)(6506007)(26005)(7416002)(54906003)(31686004)(186003)(316002)(66446008)(76116006)(64756008)(66476007)(66946007)(5660300002)(86362001)(110136005)(478600001)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 h1pe5e/UnR1YXLq7CTHSOUxq6evYxfWZTxvsJetxmdbyVOvmks13Gg2RRkPQXSzMShfDFMgsyJ5w+frEhUHQ/hIBZNDapQLQnkhaye6OX3AHFAmP79dVVxf6Rvsvo87wIT4YbJu1C/J7ezxaCiMdlvw/967eFc1mBZQxbmMfvO/+mFq5NlJmXadMhxqIbJcqMgGuj2XZ6a7Zy1Nh6hO5alf+YFnRdI0Bb2hghq8XGjmamGp4Kla3TGOwca/NcOzXznfCjLGhqd4Q4+ZZHzRHeeEcFWmgRWGeJiXXblgmNj6wl1Eg3Vsqeey3NUmyDNHj9KT6qgNQs98QWEosQMurkJ1j/gHuaMg1dgizoTB4gVJ/QkW+Img9PMgivhszOH4zGrJobqJkWXLXb5s6KMiFK5bjVKpdnVrog/znr/nGJ1mkuMeNgbKqSxguxQxeYa0wugRdRdiYcFyJWv/2Kt6x7uqidpzYixs1vSUX5zy8GxYBiQ5Ui/bwNfn/nQPZB9l8cFtfltHcu1gHQMDzf/3f3M3hkMIT17mjYb9YiumJV2HeO2xwHxIP0zZmBeE1+TaRhMMFz2Ix/pio6BqgwUAvXl/q9urNcmv+rUI3HzPtTKwLNmBk6+/dQi3PSP6UV8E/gUIYLqe14MFbOqat6mTsyw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F88741EE7FE1042B15BD4DD03898A88@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d80fe6d-4369-4ae7-6fea-08d88709ff36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 12:53:47.7774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRB+v3VwZZux3k/GhLHLD6dSmMQN+n7Aq+MYvSn+bK9lPNGzwULqupeXtoyZv37mEYpv9mbyIrDWhCs90xFkhm02d68bCJCuCUsje+4Ij6D0V0CHNHwb11YilUVFaTAq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6883
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_05:2020-11-12,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120075

DQpPbiAxMS8xMS8yMCA0OjU0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMTEuMjAy
MCAxMzo1MCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMNCj4+IEBAIC04NzksNiArODc5LDQzIEBAIGludCBwY2lfcmVtb3ZlX2RldmljZSh1MTYg
c2VnLCB1OCBidXMsIHU4IGRldmZuKQ0KPj4gICAgICAgcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4g
ICANCj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPj4gK2ludCBwY2lfZGV2aWNlX3NldF9hc3NpZ25l
ZCh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCBib29sIGFzc2lnbmVkKQ0KPj4gK3sNCj4+ICsg
ICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiArDQo+PiArICAgIHBkZXYgPSBwY2lfZ2V0X3Bk
ZXYoc2VnLCBidXMsIGRldmZuKTsNCj4+ICsgICAgaWYgKCAhcGRldiApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJDYW4ndCBmaW5kIFBDSSBkZXZpY2UgJTA0eDol
MDJ4OiUwMnguJXVcbiIsDQo+PiArICAgICAgICAgICAgICAgc2VnLCBidXMsIFBDSV9TTE9UKGRl
dmZuKSwgUENJX0ZVTkMoZGV2Zm4pKTsNCj4+ICsgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4g
KyAgICB9DQo+PiArDQo+PiArICAgIHBkZXYtPmFzc2lnbmVkID0gYXNzaWduZWQ7DQo+PiArICAg
IHByaW50ayhYRU5MT0dfRVJSICJwY2liYWNrICVzYXNzaWduIFBDSSBkZXZpY2UgJTA0eDolMDJ4
OiUwMnguJXVcbiIsDQo+PiArICAgICAgICAgICBhc3NpZ25lZCA/ICIiIDogImRlLSIsDQo+PiAr
ICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbikpOw0K
Pj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAraW50IHBjaV9kZXZpY2Vf
Z2V0X2Fzc2lnbmVkKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+PiArew0KPj4gKyAgICBz
dHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+ICsNCj4+ICsgICAgcGRldiA9IHBjaV9nZXRfcGRldihz
ZWcsIGJ1cywgZGV2Zm4pOw0KPj4gKyAgICBpZiAoICFwZGV2ICkNCj4+ICsgICAgew0KPj4gKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkNhbid0IGZpbmQgUENJIGRldmljZSAlMDR4OiUwMng6
JTAyeC4ldVxuIiwNCj4+ICsgICAgICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4p
LCBQQ0lfRlVOQyhkZXZmbikpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+PiArICAg
IH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIHBkZXYtPmFzc2lnbmVkID8gMCA6IC1FTk9ERVY7DQo+
PiArfQ0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gICAjaWZuZGVmIENPTkZJR19BUk0NCj4+ICAgLypU
T0RPIDpJbXBsZW1lbnQgTVNJIHN1cHBvcnQgZm9yIEFSTSAgKi8NCj4+ICAgc3RhdGljIGludCBw
Y2lfY2xlYW5fZHBjaV9pcnEoc3RydWN0IGRvbWFpbiAqZCwNCj4+IEBAIC0xODIxLDYgKzE4NTgs
NjIgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoDQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4g
ICB9DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfQVJNDQo+PiArc3RydWN0IGxpc3RfYXNzaWdu
ZWQgew0KPj4gKyAgICB1aW50MzJfdCBjdXJfaWR4Ow0KPj4gKyAgICB1aW50MzJfdCBmcm9tX2lk
eDsNCj4+ICsgICAgYm9vbCBhc3NpZ25lZDsNCj4+ICsgICAgZG9taWRfdCAqZG9tYWluOw0KPj4g
KyAgICB1aW50MzJfdCAqbWFjaGluZV9zYmRmOw0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGlu
dCBfZW51bV9hc3NpZ25lZF9wY2lfZGV2aWNlcyhzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgdm9pZCAq
YXJnKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGxpc3RfYXNzaWduZWQgKmN0eHQgPSBhcmc7DQo+
PiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gKw0KPj4gKyAgICBsaXN0X2Zvcl9lYWNo
X2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0ICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgaWYgKCBwZGV2LT5hc3NpZ25lZCA9PSBjdHh0LT5hc3NpZ25lZCAp
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgaWYgKCBjdHh0LT5jdXJfaWR4ID09IGN0
eHQtPmZyb21faWR4ICkNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgICpj
dHh0LT5kb21haW4gPSBwZGV2LT5kb21haW4tPmRvbWFpbl9pZDsNCj4+ICsgICAgICAgICAgICAg
ICAgKmN0eHQtPm1hY2hpbmVfc2JkZiA9IHBkZXYtPnNiZGYuc2JkZjsNCj4+ICsgICAgICAgICAg
ICAgICAgcmV0dXJuIDE7DQo+PiArICAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgIGN0eHQt
PmN1cl9pZHgrKzsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiAraW50IHBjaV9kZXZpY2VfZW51bV9hc3NpZ25lZChib29sIHJlcG9y
dF9ub3RfYXNzaWduZWQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCBmcm9tX2lkeCwgZG9taWRfdCAqZG9tYWluLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDMyX3QgKm1hY2hpbmVfc2JkZikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBsaXN0
X2Fzc2lnbmVkIGN0eHQgPSB7DQo+PiArICAgICAgICAuYXNzaWduZWQgPSAhcmVwb3J0X25vdF9h
c3NpZ25lZCwNCj4+ICsgICAgICAgIC5jdXJfaWR4ID0gMCwNCj4+ICsgICAgICAgIC5mcm9tX2lk
eCA9IGZyb21faWR4LA0KPj4gKyAgICAgICAgLmRvbWFpbiA9IGRvbWFpbiwNCj4+ICsgICAgICAg
IC5tYWNoaW5lX3NiZGYgPSBtYWNoaW5lX3NiZGYsDQo+PiArICAgIH07DQo+PiArICAgIGludCBy
ZXQ7DQo+PiArDQo+PiArICAgIHBjaWRldnNfbG9jaygpOw0KPj4gKyAgICByZXQgPSBwY2lfc2Vn
bWVudHNfaXRlcmF0ZShfZW51bV9hc3NpZ25lZF9wY2lfZGV2aWNlcywgJmN0eHQpOw0KPj4gKyAg
ICBwY2lkZXZzX3VubG9jaygpOw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBJZiBub3QgZm91bmQg
dGhlbiByZXBvcnQgYXMgRUlOVkFMIHRvIG1hcmsNCj4+ICsgICAgICogZW51bWVyYXRpb24gcHJv
Y2VzcyBmaW5pc2hlZC4NCj4+ICsgICAgICovDQo+PiArICAgIGlmICggIXJldCApDQo+PiArICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKyNlbmRp
Zg0KPiBKdXN0IGluIGNhc2UgdGhlIGVhcmxpZXIgY29tbWVudHMgeW91J3ZlIGdvdCBkb24ndCBs
ZWFkIHRvIHJlbW92YWwNCj4gb2YgdGhpcyBjb2RlIC0gdW5sZXNzIHRoZXJlJ3MgYSByZWFsIG5l
ZWQgZm9yIHRoZW0gdG8gYmUgcHV0IGhlcmUsDQo+IHVuZGVyICNpZmRlZiwgcGxlYXNlIGFkZCBh
IG5ldyB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vcGNpLmMNCj4gaW5zdGVhZC4gRXZlbiBp
ZiBmb3IganVzdCBwYXJ0IG9mIHRoZSBjb2RlLCB0aGlzIHdvdWxkIHRoZW4gYWxzbw0KPiBoZWxw
IHdpdGggbW9yZSBjbGVhciBtYWludGFpbmVyc2hpcCBvZiB0aGlzIEFybSBzcGVjaWZpYyBjb2Rl
Lg0KWWVzLCBkb2VzIG1ha2Ugc2Vuc2UgdG8gbW92ZSBhbGwgQVJNIHNwZWNpZmljcyBpbnRvIGEg
ZGVkaWNhdGVkIGZpbGUNCj4NCj4gSmFu

