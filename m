Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C752B1D87
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26552.55001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda8Y-000281-BI; Fri, 13 Nov 2020 14:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26552.55001; Fri, 13 Nov 2020 14:33:14 +0000
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
	id 1kda8Y-00027c-7T; Fri, 13 Nov 2020 14:33:14 +0000
Received: by outflank-mailman (input) for mailman id 26552;
 Fri, 13 Nov 2020 14:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kda8W-000273-81
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:33:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f0e06f0-4e44-42f7-99ee-57745fe0f0e4;
 Fri, 13 Nov 2020 14:33:11 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADEPjg9022279; Fri, 13 Nov 2020 14:32:55 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by mx0b-0039f301.pphosted.com with ESMTP id 34sd1ptvaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 14:32:55 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB7301.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:32:53 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kda8W-000273-81
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:33:12 +0000
X-Inumbo-ID: 2f0e06f0-4e44-42f7-99ee-57745fe0f0e4
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2f0e06f0-4e44-42f7-99ee-57745fe0f0e4;
	Fri, 13 Nov 2020 14:33:11 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADEPjg9022279;
	Fri, 13 Nov 2020 14:32:55 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
	by mx0b-0039f301.pphosted.com with ESMTP id 34sd1ptvaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 14:32:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUDDonNQQMB3JRhMD6x/WZUYk1cLq6AVWqdXe9364BKwRd2YLcaW3KFzIVE7WknKYUtJk5UAwGcAtCR89UEDFUE4uZpFZv5FLKVt+QbPPAr/md0UozEDnI3P8fPbPvnNXHzeYMW7KS22yV5eoNs6N0gIKgOKI7a2H/uMNslWPh/yEumnjQ+qAdJYQugvsXjZKFHR0QsHaG/syiY+AifWYbjJzWUwrSw56MHfdHZKuSR4BPKewft0aDNuHWtZWwNlWXDlIkB4Kps6YcP0cuFrgHtE2EXmBoJnLsweyVXJtGHPqgNowJltW+qtP9wt3vMMyBT7u5klzSfBgLIoQxDG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9Ch4ugNbZBira3V9svRU358YKW7Li87r2cPoF/nDOc=;
 b=UVWA3wJyGU2p2oUkM8OLXzTcgHwvkGv9d+hjJirW6uYR0ZooORmwhAGIaoE0KuT3HqpJUkx0N6aXRbUpvx4WaQ057vkTWTc0YPi3+C1yZ0DcwdEIDf3jBgJq9e0tEP0t8ie88xJvB0XKH6uS13eOg+NB9xBpOqMqADJWmssI5QnW30e/5U4Fkz/2YgXAd0F1j6CR1YdhR0VZ58QHterUgE28hEIsIz2lI3dOWlrlI/eGQSHA8068+Ssty7jAK8gzhE4ZZW1RmsklZIs+nHL1Bz8fuwKR42EkogyQYscVlfmK+W3JIX91SvdGeBH2xRNfG2vo+K6mADeviK89vqLgIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9Ch4ugNbZBira3V9svRU358YKW7Li87r2cPoF/nDOc=;
 b=6Nea2718Ngq3v+BilQoAvmJHK1xXyJAzXqBbJq7gBRpAttsjqL3Wq3jSY4FeRc3reNEUp1Sx0WrxGCPPHrplvL81IyhuoF8Q/NL+/UVsvK1JJr8qRCAEun1vgMcL6fN8FxhqXdrKJCnU/u6Datnh0/m5zXaDTLYMe3iW/TmV3AKQowr01vJMNNEeTFE+rqNIzlRDrvZcw13RmWrliXW+tHnO09cOJHewx8TWoLjYLLnbJ2+YprW8opQb2PrVqKHTgOXaJsLpn812EVgc83ZAHa1w4ptRKv4E0wdRqSgW1S4V9aa5XsrIDnAZ8M2zq/Cu24kd1OwTZb+sHrgLvHxbOg==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB7301.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:32:53 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:32:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAA==
Date: Fri, 13 Nov 2020 14:32:53 +0000
Message-ID: <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
In-Reply-To: <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b1c7a76-f6ee-49d1-27d7-08d887e101af
x-ms-traffictypediagnostic: AS8PR03MB7301:
x-microsoft-antispam-prvs: 
 <AS8PR03MB73015A37D72DC0D40FCED0C9E7E60@AS8PR03MB7301.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wz2CFnN5cFqCqqsOuPPm7QX4TU2xYtHG7BAC7uKuALsHZZturzautc5+q1RAeL+gceDZW9lahyPOuKuH2+T1Q34kWUZzumgWWi39RAcAlzXyd2WLIqMx/hdgR06jcP64GP1771EdoFEa69fBKiDFvbihrqeVKh5rXX49b9E6u+ri89sFboMIhqX2JiIPqCBfzjGnSZveHzjQz4LvTrEiraeYqfTAnvQ+L5mv9njGSUnu7yaDslweAS59NTFL3MaJNGF7RG/BeuTJ3njkB9Pyxs8X8xjf2DvQKd4P1C2gyC33+yIarutGTdTVSz00m1mzQ6i93nBz1+Fsaagwwg6KvA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(8676002)(76116006)(66476007)(31696002)(64756008)(66556008)(4326008)(6512007)(66446008)(6916009)(71200400001)(8936002)(186003)(53546011)(31686004)(478600001)(36756003)(54906003)(2906002)(83380400001)(316002)(2616005)(26005)(5660300002)(7416002)(6506007)(86362001)(66946007)(6486002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 zWRErDnGW4mCpcOGceD4hNT97JdYqQtc3itWT5ZURczz50K46UmAvDYtqZ9b7V/B20upNAWHUdtxj9TOwZ0aUk+xfPLnPh3zO8MoOqnZ7WrnSfZg0I3rBkfAz/LlJNRXEy2VtNrmwtWNOfVw8yx05NpgrzLMtvyGULabAtWM59NWQ13C8JfDdCAngu47R1+JtrpWwwjqbT3tOWiMywHSNEm8Cy+/IUIvNDYjhKHK9SNHQeQM93PUCgT+zDgCjKRzD4r+AFBMFkyezOHPqGhoDwDQL280zY8+91Fg3SoYN4SKgMEXg5HvO5jOrQEAOaDrTwCTQkBM8b/MhF4/Z4Rs8nifUMwzFkpX0h94mjUXSIGze83T+vgHm4AlkpjfE+few39tPRKAlf1dVe5Q3a43utGAkRn+nkNuMetaVUaHCwXifFjXPT59CJrt3B4mr6Vzkhf44oFOnz32FOg0dnc1p9DlG2ouNN3P6btOzb/Bsx3MGuYSGg4XVArj7CqHZj+qcVlXF7/Pkg5C5jMRC/xhl7yCJRSZ/xWlb81AXMPcvnisd/loKfAEgroD2idCkQ3pO6Vje6kYNQkA+qC/mgB9oZJZhcNLVUDfbhHFX7p0481oB6RQnIUyZzfEOgb4nNa29slH2Iz3Hs6VrGsO9SHHkw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6933FFEDAF48304ABC361523ED969DD4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1c7a76-f6ee-49d1-27d7-08d887e101af
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 14:32:53.7228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fNwtA+77nrGipQfmM8DV5BdVNCwSK/xYESk0XM6DSoE7BwkWOvDSSbydXjuAwOfdP0pl7f0CwgxChnoSvHDTAKDY0qmWCtE42P9TtaGvuHvc+PTrYyxvuGC2V8jGNUE7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7301
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_10:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130091

DQpPbiAxMS8xMy8yMCA0OjIzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTEuMjAy
MCAxMzo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMy8yMCAx
OjM1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMy4xMS4yMDIwIDEyOjAyLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEvMTMvMjAgMTI6NTAgUE0sIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMTMuMTEuMjAyMCAxMTo0NiwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMTEvMTMvMjAgMTI6MjUgUE0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAxMy4xMS4yMDIwIDA3OjMyLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IEknbGwgdHJ5IHRvIHJlcGxhY2UgaXNfaGFyZHdhcmVf
ZG9tYWluIHdpdGggc29tZXRoaW5nIGxpa2U6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gKy8qDQo+Pj4+
Pj4+PiArICogRGV0ZWN0IHdoZXRoZXIgcGh5c2ljYWwgUENJIGRldmljZXMgaW4gdGhpcyBzZWdt
ZW50IGJlbG9uZw0KPj4+Pj4+Pj4gKyAqIHRvIHRoZSBkb21haW4gZ2l2ZW4sIGUuZy4gb24geDg2
IGFsbCBQQ0kgZGV2aWNlcyBsaXZlIGluIGh3ZG9tLA0KPj4+Pj4+Pj4gKyAqIGJ1dCBpbiBjYXNl
IG9mIEFSTSB0aGlzIG1pZ2h0IG5vdCBiZSB0aGUgY2FzZTogdGhvc2UgbWF5IGFsc28NCj4+Pj4+
Pj4+ICsgKiBsaXZlIGluIGRyaXZlciBkb21haW5zIG9yIGV2ZW4gWGVuIGl0c2VsZi4NCj4+Pj4+
Pj4+ICsgKi8NCj4+Pj4+Pj4+ICtib29sIHBjaV9pc19oYXJkd2FyZV9kb21haW4oc3RydWN0IGRv
bWFpbiAqZCwgdTE2IHNlZykNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArI2lmZGVmIENPTkZJR19Y
ODYNCj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIGlzX2hhcmR3YXJlX2RvbWFpbihkKTsNCj4+Pj4+
Pj4+ICsjZWxpZiBDT05GSUdfQVJNDQo+Pj4+Pj4+PiArwqDCoMKgIHJldHVybiBwY2lfaXNfb3du
ZXJfZG9tYWluKGQsIHNlZyk7DQo+Pj4+Pj4+PiArI2Vsc2UNCj4+Pj4+Pj4+ICsjZXJyb3IgIlVu
c3VwcG9ydGVkIGFyY2hpdGVjdHVyZSINCj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+ICt9DQo+
Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArLyoNCj4+Pj4+Pj4+ICsgKiBHZXQgZG9tYWluIHdoaWNoIG93
bnMgdGhpcyBzZWdtZW50OiBmb3IgeDg2IHRoaXMgaXMgYWx3YXlzIGhhcmR3YXJlDQo+Pj4+Pj4+
PiArICogZG9tYWluIGFuZCBmb3IgQVJNIHRoaXMgY2FuIGJlIGRpZmZlcmVudC4NCj4+Pj4+Pj4+
ICsgKi8NCj4+Pj4+Pj4+ICtzdHJ1Y3QgZG9tYWluICpwY2lfZ2V0X2hhcmR3YXJlX2RvbWFpbih1
MTYgc2VnKQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4+Pj4+
Pj4gK8KgwqDCoCByZXR1cm4gaGFyZHdhcmVfZG9tYWluOw0KPj4+Pj4+Pj4gKyNlbGlmIENPTkZJ
R19BUk0NCj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHBjaV9nZXRfb3duZXJfZG9tYWluKHNlZyk7
DQo+Pj4+Pj4+PiArI2Vsc2UNCj4+Pj4+Pj4+ICsjZXJyb3IgIlVuc3VwcG9ydGVkIGFyY2hpdGVj
dHVyZSINCj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g
VGhpcyBpcyB3aGF0IEkgdXNlIHRvIHByb3Blcmx5IGRldGVjdCB0aGUgZG9tYWluIHRoYXQgcmVh
bGx5IG93bnMgcGh5c2ljYWwgaG9zdCBicmlkZ2UNCj4+Pj4+Pj4gSSBjb25zaWRlciB0aGlzIHBy
b2JsZW1hdGljLiBXZSBzaG91bGQgdHJ5IHRvIG5vdCBsZXQgQXJtJ3MgYW5kIHg4Nidlcw0KPj4+
Pj4+PiBQQ0kgaW1wbGVtZW50YXRpb25zIGRpdmVyZ2UgdG9vIG11Y2gsIGkuZS4gYXQgbGVhc3Qg
dGhlIHVuZGVybHlpbmcgYmFzaWMNCj4+Pj4+Pj4gbW9kZWwgd291bGQgYmV0dGVyIGJlIHNpbWls
YXIuIEZvciBleGFtcGxlLCBpZiBlbnRpcmUgc2VnbWVudHMgY2FuIGJlDQo+Pj4+Pj4+IGFzc2ln
bmVkIHRvIGEgZHJpdmVyIGRvbWFpbiBvbiBBcm0sIHdoeSBzaG91bGQgdGhlIHNhbWUgbm90IGJl
IHBvc3NpYmxlDQo+Pj4+Pj4+IG9uIHg4Nj8NCj4+Pj4+PiBHb29kIHF1ZXN0aW9uLCBwcm9iYWJs
eSBpbiB0aGlzIGNhc2UgeDg2ID09IEFSTSBhbmQgSSBjYW4gdXNlDQo+Pj4+Pj4NCj4+Pj4+PiBw
Y2lfaXNfb3duZXJfZG9tYWluIGZvciBib3RoIGFyY2hpdGVjdHVyZXMgaW5zdGVhZCBvZiB1c2lu
ZyBpc19oYXJkd2FyZV9kb21haW4gZm9yIHg4Ng0KPj4+Pj4+DQo+Pj4+Pj4+IEZ1cnRoZXJtb3Jl
IEknbSBzdXNwaWNpb3VzIGFib3V0IHNlZ21lbnRzIGJlaW5nIHRoZSByaWdodCBncmFudWxhcml0
eQ0KPj4+Pj4+PiBoZXJlLiBPbiBpYTY0IG11bHRpcGxlIGhvc3QgYnJpZGdlcyBjb3VsZCAoYW5k
IHR5cGljYWxseSB3b3VsZCkgbGl2ZQ0KPj4+Pj4+PiBvbiBzZWdtZW50IDAuIElpcmMgSSBoYWQg
b25jZSBzZWVuIG91dHB1dCBmcm9tIGFuIHg4NiBzeXN0ZW0gd2hpY2ggd2FzDQo+Pj4+Pj4+IGFw
cGFyZW50bHkgbGFpZCBvdXQgc2ltaWxhcmx5LiBUaGVyZWZvcmUsIGp1c3QgbGlrZSBmb3IgTUNG
RywgSSB0aGluaw0KPj4+Pj4+PiB0aGUgZ3JhbnVsYXJpdHkgd2FudHMgdG8gYmUgYnVzIHJhbmdl
cyB3aXRoaW4gYSBzZWdtZW50Lg0KPj4+Pj4+IENhbiB5b3UgcGxlYXNlIHN1Z2dlc3Qgc29tZXRo
aW5nIHdlIGNhbiB1c2UgYXMgYSBoaW50IGZvciBzdWNoIGEgZGV0ZWN0aW9uIGxvZ2ljPw0KPj4+
Pj4gVGhlIHVuZGVybHlpbmcgaW5mb3JtYXRpb24gY29tZXMgZnJvbSBBQ1BJIHRhYmxlcywgaWly
Yy4gSSBkb24ndA0KPj4+Pj4gcmVjYWxsIHRoZSBkZXRhaWxzLCB0aG91Z2ggLSBzb3JyeS4NCj4+
Pj4gT2ssIHNvIHNlZyArIGJ1cyBzaG91bGQgYmUgZW5vdWdoIGZvciBib3RoIEFSTSBhbmQgWGVu
IHRoZW4sIHJpZ2h0Pw0KPj4+Pg0KPj4+PiBwY2lfZ2V0X2hhcmR3YXJlX2RvbWFpbih1MTYgc2Vn
LCB1OCBidXMpDQo+Pj4gV2hldGhlciBhbiBpbmRpdmlkdWFsIGJ1cyBudW1iZXIgY2FuIHN1aXRh
YmxlIGV4cHJlc3MgdGhpbmdzIEkgY2FuJ3QNCj4+PiB0ZWxsOyBJIGRpZCBzYXkgYnVzIHJhbmdl
LCBidXQgb2YgY291cnNlIGlmIHlvdSBjYXJlIGFib3V0IGp1c3QNCj4+PiBpbmRpdmlkdWFsIGRl
dmljZXMsIHRoZW4gYSBzaW5nbGUgYnVzIG51bWJlciB3aWxsIG9mIGNvdXJzZSBkby4NCj4+IEkg
Y2FuIGltcGxlbWVudCB0aGUgbG9va3VwIHdoZXRoZXIgYSBQQ0kgaG9zdCBicmlkZ2Ugb3duZWQg
YnkgYSBwYXJ0aWN1bGFyDQo+Pg0KPj4gZG9tYWluIHdpdGggc29tZXRoaW5nIGxpa2U6DQo+Pg0K
Pj4gc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlID0gcGNpX2ZpbmRfaG9zdF9icmlkZ2Uo
c2VnLCBidXMpOw0KPj4NCj4+IHJldHVybiBicmlkZ2UtPmR0X25vZGUtPnVzZWRfYnkgPT0gZC0+
ZG9tYWluX2lkOw0KPj4NCj4+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGhpbnQgaG93IHRo
aXMgY2FuIGJlIGRvbmUgb24geDg2Pw0KPiBCcmlkZ2VzIGNhbid0IGJlIGFzc2lnbmVkIHRvIG90
aGVyIHRoYW4gdGhlIGhhcmR3YXJlIGRvbWFpbiByaWdodA0KPiBub3cuDQoNClNvLCBJIGNhbiBw
cm9iYWJseSB0aGVuIGhhdmUgcGNpX2dldF9oYXJkd2FyZV9kb21haW4gaW1wbGVtZW50ZWQNCg0K
YnkgYm90aCBBUk0gYW5kIHg4NiBpbiB0aGVpciBhcmNoIHNwZWNpZmljIGNvZGUuIEFuZCBmb3Ig
eDg2IGZvciBub3cNCg0KaXQgY2FuIHNpbXBseSBiZSBhIHdyYXBwZXIgZm9yIGlzX2hhcmR3YXJl
X2RvbWFpbj8NCg0KPiAgIEVhcmxpZXIgb24gSSBkaWRuJ3Qgc2F5IHlvdSBzaG91bGQgZ2V0IHRo
aXMgdG8gd29yaywgb25seQ0KPiB0aGF0IEkgdGhpbmsgdGhlIGdlbmVyYWwgbG9naWMgYXJvdW5k
IHdoYXQgeW91IGFkZCBzaG91bGRuJ3QgbWFrZQ0KPiB0aGluZ3MgbW9yZSBhcmNoIHNwZWNpZmlj
IHRoYW4gdGhleSByZWFsbHkgc2hvdWxkIGJlLiBUaGF0IHNhaWQsDQo+IHNvbWV0aGluZyBzaW1p
bGFyIHRvIHRoZSBhYm92ZSBzaG91bGQgc3RpbGwgYmUgZG9hYmxlIG9uIHg4NiwNCj4gdXRpbGl6
aW5nIHN0cnVjdCBwY2lfc2VnJ3MgYnVzMmJyaWRnZVtdLiBUaGVyZSBvdWdodCB0byBiZQ0KPiBE
RVZfVFlQRV9QQ0lfSE9TVF9CUklER0UgZW50cmllcyB0aGVyZSwgYWxiZWl0IGEgbnVtYmVyIG9m
IHRoZW0NCj4gKHByb3ZpZGVkIGJ5IHRoZSBDUFVzIHRoZW1zZWx2ZXMgcmF0aGVyIHRoYW4gdGhl
IGNoaXBzZXQpIGFyZW4ndA0KPiByZWFsbHkgaG9zdCBicmlkZ2VzIGZvciB0aGUgcHVycG9zZXMg
eW91J3JlIGFmdGVyLg0KDQpZb3UgbWVhbiBJIGNhbiBzdGlsbCB1c2UgREVWX1RZUEVfUENJX0hP
U1RfQlJJREdFIGFzIGEgbWFya2VyDQoNCndoaWxlIHRyeWluZyB0byBkZXRlY3Qgd2hhdCBJIG5l
ZWQ/DQoNCj4NCj4gSmFuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

