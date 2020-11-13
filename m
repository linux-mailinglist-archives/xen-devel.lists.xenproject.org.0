Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C967D2B1B45
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 13:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26485.54877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdYOt-0008JZ-Gs; Fri, 13 Nov 2020 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26485.54877; Fri, 13 Nov 2020 12:41:59 +0000
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
	id 1kdYOt-0008JA-DN; Fri, 13 Nov 2020 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 26485;
 Fri, 13 Nov 2020 12:41:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdYOs-0008J5-Fw
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 12:41:58 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2557f26f-a62e-43a1-a260-02d9448fce46;
 Fri, 13 Nov 2020 12:41:56 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADCTVXr014580; Fri, 13 Nov 2020 12:41:47 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80g1ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 12:41:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5939.eurprd03.prod.outlook.com (2603:10a6:208:15e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 12:41:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 12:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdYOs-0008J5-Fw
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 12:41:58 +0000
X-Inumbo-ID: 2557f26f-a62e-43a1-a260-02d9448fce46
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2557f26f-a62e-43a1-a260-02d9448fce46;
	Fri, 13 Nov 2020 12:41:56 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADCTVXr014580;
	Fri, 13 Nov 2020 12:41:47 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80g1ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 12:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCVl6jheAeum17sSz+fy/lK3Xzw431c0qvbvp9pH1kEO3RIob+mtLhovbFWif9n9ZWLHGXotc8EKzHev9R2e239pYw8WZMvRkBbNohwcn30MONt7KmV6KItcdk5ZgbyGft9VpRd/wx7UDKLDEh5PogNPO8w0VPcIPEQ1djAxE0P1EplASvEW5lGaEbnXufckBH6DehoXXetf+IiuDCWRTn6CAd93C5hOCgKIoSHa96VU1g5ISdlYeTv39Lf2856X8LRTxqTNJkFDhUBGixVMAV+QpVxyTlxlMMgMCfDEmqod7mv6h4N1adfPG6kOi7Fa7VjwZHbpG5M6X2MpQDxoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB6mo+Kpwwh8xD5892sG6TYYo7RkmqiMi2lLmDuyo/Q=;
 b=l8jEz/VzaJQlCwn9MQznxaV3dfgPj59HDPNOeUi6THc7zGruM9mA89m8eFlwq699l/x1NvF/SXssSArvQ1a7cDgoZbReBYg5hudp/KoDIkJjX3RKnYH8w4zciI3MBkuU7ZHazwgPZAQcy8BxXO/rCAzlLeOgusdbQjG3AITMejBpIX68WV6uowIy2USMT/NpZA4+LDKClfF20wGvoCh4AGWo8m7MRUt1VTusMjbcfLn0k27jNKsEPTxYFUCDQ7M2q6tY7tpv9HYOpxidUOeJYIw9LRmDmOWC7tco5A6PnwmLWvwFBS8ECq5rtH/VRgTwiTA8kOPXg3Wrk+nrJqEDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB6mo+Kpwwh8xD5892sG6TYYo7RkmqiMi2lLmDuyo/Q=;
 b=EL9XiBmtNMRPhpwKehVlfbZ3KrYhhkBbC7IGL6m4VqIPzM6BGF8VXydCht1dpK74wUsIldFXyPIwFW2OUsgobhaO6Rfg4a5mS+S7rqTSARRNTWsZMtgxktWD3k7Bk6vWBKp7mgQIlgMwz7OPHRpzd1OrUMCjpMqdfIIS+mI8saqpPqpr9MLyWzxU2yF4DRkbYhkQarILwz4SHvntpJkxNbTHn4nkBrIup7j1uyzK1sg6ckD7isk1DJIh8aZigDGo/bMlDQQJ3sCJt9mZs75NONPbZ32OagriVRM1CBHskM5yBLxkaHIBsCtT9BN19Mkp+xafu946Dr5a2so6qqpxRQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5939.eurprd03.prod.outlook.com (2603:10a6:208:15e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 12:41:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 12:41:43 +0000
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
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYA
Date: Fri, 13 Nov 2020 12:41:43 +0000
Message-ID: <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
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
In-Reply-To: <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02e5a9c2-4179-4e09-4e6c-08d887d179c3
x-ms-traffictypediagnostic: AM0PR03MB5939:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5939A09D1C3F99C5E289F364E7E60@AM0PR03MB5939.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0j5Ftb5QekEAI+QdLro/L/8IexRzTvUktd0d4kDZylaxtY+aimjUMRvpRXk9cQ+QKrC1cmcbQ9emeDQi7qSis+q/3GMTRBslbnKIc79lWFByYftWC1KSBzCMpspc4dXR7jHt/TQ1igDelcnNnrNN9M735Yo8ZQDoCaGXU9CKW3mamdsPqwp+Hoc1q2NM0dEb/d5DgOCTxJIfSn2i0RGYLoy4lieOVjVOeZ5fsxU4QKmNF1Ldn0cbLwM5x4qeWqtCVTXGl/diyuBjECdc59bD6OTYYs6SSxB8Y7Jtxesg9IBkrqKb7vKdtQU0JqCWMoghmLTsO5dfKVg29wBIiFKZjw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(31686004)(316002)(66446008)(8936002)(66476007)(4326008)(86362001)(6486002)(66556008)(76116006)(64756008)(66946007)(478600001)(6512007)(8676002)(6916009)(7416002)(71200400001)(2906002)(26005)(186003)(53546011)(31696002)(83380400001)(6506007)(5660300002)(2616005)(54906003)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 uUkG2ulqFBCZOyRHAjUCaYVPozX/bV0qz+HVsYRyDRMZgyMA4OiOTNq3pgAF8+prjcDGC1op7xgnFkEeZ7JIgbJtxgecQabd7tHcqdQZYNNyV5QB5bqcFQlc/exZ3BLlzaiCBlKbFpU8KRvV1gi1lB1t/HWafcIcqst0u5w5tib4phjHkcXaO1FysNn5odpZJ8aFqIFhdy255abW6gjnEhg1dNhCbBi/OuuQuxml/RiXBtOz68ItfgPtEmW9Hkxw2Z+vxFl1gamppvYBWHTuUPSgBVs5ui+mZF28wYeGxG8ostEMORspaawnAud/k4f9zUQJlya7WSnCAfEKlBG7+KZ+sciVPB3RIw4qog0LbPa4nLNeK7sZ+X+FX1Le0ozsJJ9IEjDQKy6lmO8M2dYuc0KpWyJS+zquJyqlQ/ENWzvHt6aWuacx2bsHtE/dGpvrQ0bEKtZdRv2i40rdFIyqliv3XHSHoPsV5K45GMvxvqwzPxE8yYRHcd1tcVX3i2UGz407O8hrgxkIvU7PNCtkJQuJ4EvkZ5heqevjjsRGglqwf5apycOPWXlmtNAvfo1pkLlpi62h0qVFgrrB/e/+JEg0LarvYJHMhBuq1s/Mw3twWK1+FwEfZamiur0BgWMf85H3/qnyqtHd2Brvda9lFw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7136AAC70D86E54189D0C6044232EF43@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e5a9c2-4179-4e09-4e6c-08d887d179c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 12:41:43.3085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LAEV6SnitSFXQzas2CiN7Y+R/efGi7SCT1/2x/CReAMKTyLVT5Uy96jO1g4JOqT3qTsFxvOC45EnYNhMOZzpGNDuRCQqxoOCiqsWM4oy2HGE8IRnJdoQlkRsdEneDjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5939
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_10:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130078

DQpPbiAxMS8xMy8yMCAxOjM1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTEuMjAy
MCAxMjowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMy8yMCAx
Mjo1MCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTMuMTEuMjAyMCAxMTo0NiwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDExLzEzLzIwIDEyOjI1IFBNLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDEzLjExLjIwMjAgMDc6MzIsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDExLzEyLzIwIDQ6NDYgUE0sIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIFRodSwgTm92IDEyLCAyMDIwIGF0IDAxOjE2OjEw
UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTEv
MTIvMjAgMTE6NDAgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gTW9u
LCBOb3YgMDksIDIwMjAgYXQgMDI6NTA6MjdQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+Pj4+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+Pj4gK3N0YXRpYyB1aW50MzJf
dCBiYXJfcmVhZF9kaXNwYXRjaChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQg
aW50IHJlZywNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
b2lkICpkYXRhKQ0KPj4+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2Jh
ciAqdmJhciwgKmJhciA9IGRhdGE7DQo+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAgICBpZiAo
IGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pICkNCj4+Pj4+Pj4+Pj4gKyAgICAg
ICAgcmV0dXJuIGJhcl9yZWFkX2h3ZG9tKHBkZXYsIHJlZywgZGF0YSk7DQo+Pj4+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4+Pj4gKyAgICB2YmFyID0gZ2V0X3ZwY2lfYmFyKGN1cnJlbnQtPmRvbWFpbiwgcGRl
diwgYmFyLT5pbmRleCk7DQo+Pj4+Pj4+Pj4+ICsgICAgaWYgKCAhdmJhciApDQo+Pj4+Pj4+Pj4+
ICsgICAgICAgIHJldHVybiB+MDsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIHJldHVy
biBiYXJfcmVhZF9ndWVzdChwZGV2LCByZWcsIHZiYXIpOw0KPj4+Pj4+Pj4+PiArfQ0KPj4+Pj4+
Pj4+PiArDQo+Pj4+Pj4+Pj4+ICtzdGF0aWMgdm9pZCBiYXJfd3JpdGVfZGlzcGF0Y2goY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKQ0KPj4+
Pj4+Pj4+PiArew0KPj4+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsN
Cj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGN1
cnJlbnQtPmRvbWFpbikgKQ0KPj4+Pj4+Pj4+PiArICAgICAgICBiYXJfd3JpdGVfaHdkb20ocGRl
diwgcmVnLCB2YWwsIGRhdGEpOw0KPj4+Pj4+Pj4+PiArICAgIGVsc2UNCj4+Pj4+Pj4+Pj4gKyAg
ICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqdmJhciA9IGdldF92cGNp
X2JhcihjdXJyZW50LT5kb21haW4sIHBkZXYsIGJhci0+aW5kZXgpOw0KPj4+Pj4+Pj4+PiArDQo+
Pj4+Pj4+Pj4+ICsgICAgICAgIGlmICggIXZiYXIgKQ0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAg
cmV0dXJuOw0KPj4+Pj4+Pj4+PiArICAgICAgICBiYXJfd3JpdGVfZ3Vlc3QocGRldiwgcmVnLCB2
YWwsIHZiYXIpOw0KPj4+Pj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4+Pj4gK30NCj4+Pj4+Pj4+PiBZ
b3Ugc2hvdWxkIGFzc2lnbiBkaWZmZXJlbnQgaGFuZGxlcnMgYmFzZWQgb24gd2hldGhlciB0aGUg
ZG9tYWluIHRoYXQNCj4+Pj4+Pj4+PiBoYXMgdGhlIGRldmljZSBhc3NpZ25lZCBpcyBhIGRvbVUg
b3IgdGhlIGhhcmR3YXJlIGRvbWFpbiwgcmF0aGVyIHRoYW4NCj4+Pj4+Pj4+PiBkb2luZyB0aGUg
c2VsZWN0aW9uIGhlcmUuDQo+Pj4+Pj4+PiBIbSwgaGFuZGxlcnMgYXJlIGFzc2lnbmVkIG9uY2Ug
aW4gaW5pdF9iYXJzIGFuZCB0aGlzIGZ1bmN0aW9uIGlzIG9ubHkgY2FsbGVkDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gZm9yIGh3ZG9tLCBzbyB0aGVyZSBpcyBubyB3YXkgSSBjYW4gZG8gdGhhdCBmb3Ig
dGhlIGd1ZXN0cy4gSGVuY2UsIHRoZSBkaXNwYXRjaGVyDQo+Pj4+Pj4+IEkgdGhpbmsgd2UgbWln
aHQgd2FudCB0byByZXNldCB0aGUgdlBDSSBoYW5kbGVycyB3aGVuIGEgZGV2aWNlcyBnZXRzDQo+
Pj4+Pj4+IGFzc2lnbmVkIGFuZCBkZWFzc2lnbmVkLg0KPj4+Pj4+IEluIEFSTSBjYXNlIGluaXRf
YmFycyBpcyBjYWxsZWQgdG9vIGVhcmx5OiBQQ0kgZGV2aWNlIGFzc2lnbm1lbnQgaXMgY3VycmVu
dGx5DQo+Pj4+Pj4NCj4+Pj4+PiBpbml0aWF0ZWQgYnkgRG9tYWluLTAnIGtlcm5lbCBhbmQgaXMg
ZG9uZSAqYmVmb3JlKiBQQ0kgZGV2aWNlcyBhcmUgZ2l2ZW4gbWVtb3J5DQo+Pj4+Pj4NCj4+Pj4+
PiByYW5nZXMgYW5kIEJBUnMgYXNzaWduZWQ6DQo+Pj4+Pj4NCj4+Pj4+PiBbwqDCoMKgIDAuNDI5
NTE0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtidXMgMDAtZmZdDQo+Pj4+
Pj4gW8KgwqDCoCAwLjQyOTUzMl0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBb
aW8gMHgwMDAwLTB4ZmZmZmZdDQo+Pj4+Pj4gW8KgwqDCoCAwLjQyOTU1NV0gcGNpX2J1cyAwMDAw
OjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4ZmUyMDAwMDAtMHhmZTNmZmZmZl0NCj4+Pj4+
PiBbwqDCoMKgIDAuNDI5NTc1XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtt
ZW0gMHgzMDAwMDAwMC0weDM3ZmZmZmZmXQ0KPj4+Pj4+IFvCoMKgwqAgMC40Mjk2MDRdIHBjaV9i
dXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweDM4MDAwMDAwLTB4M2ZmZmZmZmYg
cHJlZl0NCj4+Pj4+PiBbwqDCoMKgIDAuNDI5NjcwXSBwY2kgMDAwMDowMDowMC4wOiBlbmFibGlu
ZyBFeHRlbmRlZCBUYWdzDQo+Pj4+Pj4gW8KgwqDCoCAwLjQ1Mzc2NF0gcGNpIDAwMDA6MDA6MDAu
MDogLS0tLS0tLS0tLS0tLS0tLS0tLS0gQlVTX05PVElGWV9BRERfREVWSUNFDQo+Pj4+Pj4NCj4+
Pj4+PiA8IGluaXRfYmFycyA+DQo+Pj4+Pj4NCj4+Pj4+PiBbwqDCoMKgIDAuNDUzNzkzXSBwY2kg
MDAwMDowMDowMC4wOiAtLSBJUlEgMA0KPj4+Pj4+IFvCoMKgwqAgMC40NTg4MjVdIHBjaSAwMDAw
OjAwOjAwLjA6IEZhaWxlZCB0byBhZGQgLSBwYXNzdGhyb3VnaCBvciBNU0kvTVNJLVggbWlnaHQg
ZmFpbCENCj4+Pj4+PiBbwqDCoMKgIDAuNDcxNzkwXSBwY2kgMDAwMDowMTowMC4wOiAtLS0tLS0t
LS0tLS0tLS0tLS0tLSBCVVNfTk9USUZZX0FERF9ERVZJQ0UNCj4+Pj4+Pg0KPj4+Pj4+IDwgaW5p
dF9iYXJzID4NCj4+Pj4+Pg0KPj4+Pj4+IFvCoMKgwqAgMC40NzE4MjFdIHBjaSAwMDAwOjAxOjAw
LjA6IC0tIElSUSAyNTUNCj4+Pj4+PiBbwqDCoMKgIDAuNDc2ODA5XSBwY2kgMDAwMDowMTowMC4w
OiBGYWlsZWQgdG8gYWRkIC0gcGFzc3Rocm91Z2ggb3IgTVNJL01TSS1YIG1pZ2h0IGZhaWwhDQo+
Pj4+Pj4NCj4+Pj4+PiA8IEJBUiBhc3NpZ25tZW50cyBiZWxvdyA+DQo+Pj4+Pj4NCj4+Pj4+PiBb
wqDCoMKgIDAuNDg4MjMzXSBwY2kgMDAwMDowMDowMC4wOiBCQVIgMTQ6IGFzc2lnbmVkIFttZW0g
MHhmZTIwMDAwMC0weGZlMmZmZmZmXQ0KPj4+Pj4+IFvCoMKgwqAgMC40ODgyNjVdIHBjaSAwMDAw
OjAwOjAwLjA6IEJBUiAxNTogYXNzaWduZWQgW21lbSAweDM4MDAwMDAwLTB4MzgwZmZmZmYgcHJl
Zl0NCj4+Pj4+Pg0KPj4+Pj4+IEluIGNhc2Ugb2YgeDg2IHRoaXMgaXMgcHJldHR5IG11Y2ggb2sg
YXMgQkFScyBhcmUgYWxyZWFkeSBpbiBwbGFjZSwgYnV0IGZvciBBUk0gd2UNCj4+Pj4+Pg0KPj4+
Pj4+IG5lZWQgdG8gdGFrZSBjYXJlIGFuZCByZS1zZXR1cCB2UENJIEJBUnMgZm9yIGh3ZG9tLg0K
Pj4+Pj4gRXZlbiBvbiB4ODYgdGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCBhbGwgZGV2aWNlcyBo
YXZlIHRoZWlyIEJBUnMgc2V0DQo+Pj4+PiB1cCBieSBmaXJtd2FyZS4NCj4+Pj4gVGhpcyBpcyB0
cnVlLiBCdXQgdGhlcmUgeW91IGNvdWxkIGhhdmUgY29uZmlnIHNwYWNlIHRyYXBwZWQgaW4gIng4
NiBnZW5lcmljIHdheSIsDQo+Pj4+DQo+Pj4+IHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9u
ZyBoZXJlDQo+Pj4+DQo+Pj4+PiBJbiBhIHN1YnNlcXVlbnQgcmVwbHkgeW91J3ZlIHN1Z2dlc3Rl
ZCB0byBtb3ZlIGluaXRfYmFycyBmcm9tICJhZGQiIHRvDQo+Pj4+PiAiYXNzaWduIiwgYnV0IEkn
bSBoYXZpbmcgdHJvdWJsZSBzZWVpbmcgd2hhdCB0aGlzIHdvdWxkIGNoYW5nZTogSXQncw0KPj4+
Pj4gbm90IERvbTAgY29udHJvbGxpbmcgYXNzaWdubWVudCAodG8gaXRzZWxmKSwgYnV0IFhlbiBh
c3NpZ25zIHRoZSBkZXZpY2UNCj4+Pj4+IHRvd2FyZHMgdGhlIGVuZCBvZiBwY2lfYWRkX2Rldmlj
ZSgpLg0KPj4+PiBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgdnMgWEVOX0RPTUNUTF9hc3NpZ25f
ZGV2aWNlDQo+Pj4+DQo+Pj4+IEN1cnJlbnRseSB3ZSBpbml0aWFsaXplIEJBUnMgZHVyaW5nIFBI
WVNERVZPUF9wY2lfZGV2aWNlX2FkZCBhbmQNCj4+Pj4NCj4+Pj4gaWYgd2UgZG8gdGhhdCBkdXJp
bmcgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIHRoaW5ncyBzZWVtIHRvIGNoYW5nZQ0KPj4+IEJ1
dCB0aGVyZSBjYW4ndCBwb3NzaWJseSBiZSBhbnkgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGlu
dm9sdmVkIGluDQo+Pj4gYm9vdGluZyBvZiBEb20wLg0KPj4gSW5kZWVkLiBTbywgZG8geW91IGhh
dmUgYW4gaWRlYSB3aGVuIHdlIHNob3VsZCBjYWxsIGluaXRfYmFycyBzdWl0YWJsZQ0KPj4NCj4+
IGZvciBib3RoIEFSTSBhbmQgeDg2Pw0KPj4NCj4+IEFub3RoZXIgcXVlc3Rpb24gaXM6IHdoYXQg
aGFwcGVucyBiYWQgaWYgeDg2IGFuZCBBUk0gd29uJ3QgY2FsbCBpbml0X2JhcnMNCj4+DQo+PiB1
bnRpbCB0aGUgbW9tZW50IHdlIHJlYWxseSBhc3NpZ24gYSBQQ0kgZGV2aWNlIHRvIHRoZSBmaXJz
dCBndWVzdD8NCj4gSSdkIGxpa2UgdG8gYW5zd2VyIHRoZSBsYXR0ZXIgcXVlc3Rpb24gZmlyc3Q6
IEhvdyB3b3VsZCBEb20wIHVzZQ0KPiB0aGUgZGV2aWNlIHByaW9yIHRvIHN1Y2ggYW4gYXNzaWdu
bWVudD8gQXMgYW4gaW1wbGljYXRpb24gdG8gdGhlDQo+IHByZXN1bWVkIGFuc3dlciBoZXJlLCBJ
IGd1ZXNzIGluaXRfYmFycyBjb3VsZCBiZSBkZWZlcnJlZCB1cCB1bnRpbA0KPiB0aGUgZmlyc3Qg
dGltZSBEb20wIChvciBtb3JlIGdlbmVyYWxseSB0aGUgcG9zc2Vzc2luZyBkb21haW4pDQo+IGFj
Y2Vzc2VzIGFueSBvZiB0aGVtLiBTaW1pbGFybHksIGRldmljZXMgdXNlZCBieSBYZW4gaXRzZWxm
IGNvdWxkDQo+IGhhdmUgdGhpcyBkb25lIGltbWVkaWF0ZWx5IGJlZm9yZSBmaXJzdCB1c2UuIFRo
aXMgbWF5IHJlcXVpcmUNCj4gdHJhY2tpbmcgb24gYSBwZXItZGV2aWNlIGJhc2lzIHdoZXRoZXIg
aW5pdGlhbGl6YXRpb24gd2FzIGRvbmUuDQpPaywgSSdsbCB0cnkgdG8gbG9vayBpbnRvIGl0DQo+
DQo+Pj4+Pj4+ICAgICAgSW4gb3JkZXIgdG8gZG8gcGFzc3Rocm91Z2ggdG8gZG9tVXMgc2FmZWx5
DQo+Pj4+Pj4+IHdlIHdpbGwgaGF2ZSB0byBhZGQgbW9yZSBoYW5kbGVycyB0aGFuIHdoYXQncyBy
ZXF1aXJlZCBmb3IgZG9tMCwNCj4+Pj4+PiBDYW4geW91IHBsZWFzZSB0ZWxsIHdoYXQgYXJlIHRo
aW5raW5nIGFib3V0PyBXaGF0IGFyZSB0aGUgbWlzc2luZyBoYW5kbGVycz8NCj4+Pj4+Pj4gICAg
ICBhbmQNCj4+Pj4+Pj4gaGF2aW5nIGlzX2hhcmR3YXJlX2RvbWFpbiBzcHJpbmtsZWQgaW4gYWxs
IG9mIHRoZW0gaXMgbm90IGEgc3VpdGFibGUNCj4+Pj4+Pj4gc29sdXRpb24uDQo+Pj4+Pj4gSSds
bCB0cnkgdG8gcmVwbGFjZSBpc19oYXJkd2FyZV9kb21haW4gd2l0aCBzb21ldGhpbmcgbGlrZToN
Cj4+Pj4+Pg0KPj4+Pj4+ICsvKg0KPj4+Pj4+ICsgKiBEZXRlY3Qgd2hldGhlciBwaHlzaWNhbCBQ
Q0kgZGV2aWNlcyBpbiB0aGlzIHNlZ21lbnQgYmVsb25nDQo+Pj4+Pj4gKyAqIHRvIHRoZSBkb21h
aW4gZ2l2ZW4sIGUuZy4gb24geDg2IGFsbCBQQ0kgZGV2aWNlcyBsaXZlIGluIGh3ZG9tLA0KPj4+
Pj4+ICsgKiBidXQgaW4gY2FzZSBvZiBBUk0gdGhpcyBtaWdodCBub3QgYmUgdGhlIGNhc2U6IHRo
b3NlIG1heSBhbHNvDQo+Pj4+Pj4gKyAqIGxpdmUgaW4gZHJpdmVyIGRvbWFpbnMgb3IgZXZlbiBY
ZW4gaXRzZWxmLg0KPj4+Pj4+ICsgKi8NCj4+Pj4+PiArYm9vbCBwY2lfaXNfaGFyZHdhcmVfZG9t
YWluKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArI2lmZGVm
IENPTkZJR19YODYNCj4+Pj4+PiArwqDCoMKgIHJldHVybiBpc19oYXJkd2FyZV9kb21haW4oZCk7
DQo+Pj4+Pj4gKyNlbGlmIENPTkZJR19BUk0NCj4+Pj4+PiArwqDCoMKgIHJldHVybiBwY2lfaXNf
b3duZXJfZG9tYWluKGQsIHNlZyk7DQo+Pj4+Pj4gKyNlbHNlDQo+Pj4+Pj4gKyNlcnJvciAiVW5z
dXBwb3J0ZWQgYXJjaGl0ZWN0dXJlIg0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+PiArfQ0KPj4+Pj4+
ICsNCj4+Pj4+PiArLyoNCj4+Pj4+PiArICogR2V0IGRvbWFpbiB3aGljaCBvd25zIHRoaXMgc2Vn
bWVudDogZm9yIHg4NiB0aGlzIGlzIGFsd2F5cyBoYXJkd2FyZQ0KPj4+Pj4+ICsgKiBkb21haW4g
YW5kIGZvciBBUk0gdGhpcyBjYW4gYmUgZGlmZmVyZW50Lg0KPj4+Pj4+ICsgKi8NCj4+Pj4+PiAr
c3RydWN0IGRvbWFpbiAqcGNpX2dldF9oYXJkd2FyZV9kb21haW4odTE2IHNlZykNCj4+Pj4+PiAr
ew0KPj4+Pj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIGhhcmR3
YXJlX2RvbWFpbjsNCj4+Pj4+PiArI2VsaWYgQ09ORklHX0FSTQ0KPj4+Pj4+ICvCoMKgwqAgcmV0
dXJuIHBjaV9nZXRfb3duZXJfZG9tYWluKHNlZyk7DQo+Pj4+Pj4gKyNlbHNlDQo+Pj4+Pj4gKyNl
cnJvciAiVW5zdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlIg0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+PiAr
fQ0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBpcyB3aGF0IEkgdXNlIHRvIHByb3Blcmx5IGRldGVjdCB0
aGUgZG9tYWluIHRoYXQgcmVhbGx5IG93bnMgcGh5c2ljYWwgaG9zdCBicmlkZ2UNCj4+Pj4+IEkg
Y29uc2lkZXIgdGhpcyBwcm9ibGVtYXRpYy4gV2Ugc2hvdWxkIHRyeSB0byBub3QgbGV0IEFybSdz
IGFuZCB4ODYnZXMNCj4+Pj4+IFBDSSBpbXBsZW1lbnRhdGlvbnMgZGl2ZXJnZSB0b28gbXVjaCwg
aS5lLiBhdCBsZWFzdCB0aGUgdW5kZXJseWluZyBiYXNpYw0KPj4+Pj4gbW9kZWwgd291bGQgYmV0
dGVyIGJlIHNpbWlsYXIuIEZvciBleGFtcGxlLCBpZiBlbnRpcmUgc2VnbWVudHMgY2FuIGJlDQo+
Pj4+PiBhc3NpZ25lZCB0byBhIGRyaXZlciBkb21haW4gb24gQXJtLCB3aHkgc2hvdWxkIHRoZSBz
YW1lIG5vdCBiZSBwb3NzaWJsZQ0KPj4+Pj4gb24geDg2Pw0KPj4+PiBHb29kIHF1ZXN0aW9uLCBw
cm9iYWJseSBpbiB0aGlzIGNhc2UgeDg2ID09IEFSTSBhbmQgSSBjYW4gdXNlDQo+Pj4+DQo+Pj4+
IHBjaV9pc19vd25lcl9kb21haW4gZm9yIGJvdGggYXJjaGl0ZWN0dXJlcyBpbnN0ZWFkIG9mIHVz
aW5nIGlzX2hhcmR3YXJlX2RvbWFpbiBmb3IgeDg2DQo+Pj4+DQo+Pj4+PiBGdXJ0aGVybW9yZSBJ
J20gc3VzcGljaW91cyBhYm91dCBzZWdtZW50cyBiZWluZyB0aGUgcmlnaHQgZ3JhbnVsYXJpdHkN
Cj4+Pj4+IGhlcmUuIE9uIGlhNjQgbXVsdGlwbGUgaG9zdCBicmlkZ2VzIGNvdWxkIChhbmQgdHlw
aWNhbGx5IHdvdWxkKSBsaXZlDQo+Pj4+PiBvbiBzZWdtZW50IDAuIElpcmMgSSBoYWQgb25jZSBz
ZWVuIG91dHB1dCBmcm9tIGFuIHg4NiBzeXN0ZW0gd2hpY2ggd2FzDQo+Pj4+PiBhcHBhcmVudGx5
IGxhaWQgb3V0IHNpbWlsYXJseS4gVGhlcmVmb3JlLCBqdXN0IGxpa2UgZm9yIE1DRkcsIEkgdGhp
bmsNCj4+Pj4+IHRoZSBncmFudWxhcml0eSB3YW50cyB0byBiZSBidXMgcmFuZ2VzIHdpdGhpbiBh
IHNlZ21lbnQuDQo+Pj4+IENhbiB5b3UgcGxlYXNlIHN1Z2dlc3Qgc29tZXRoaW5nIHdlIGNhbiB1
c2UgYXMgYSBoaW50IGZvciBzdWNoIGEgZGV0ZWN0aW9uIGxvZ2ljPw0KPj4+IFRoZSB1bmRlcmx5
aW5nIGluZm9ybWF0aW9uIGNvbWVzIGZyb20gQUNQSSB0YWJsZXMsIGlpcmMuIEkgZG9uJ3QNCj4+
PiByZWNhbGwgdGhlIGRldGFpbHMsIHRob3VnaCAtIHNvcnJ5Lg0KPj4gT2ssIHNvIHNlZyArIGJ1
cyBzaG91bGQgYmUgZW5vdWdoIGZvciBib3RoIEFSTSBhbmQgWGVuIHRoZW4sIHJpZ2h0Pw0KPj4N
Cj4+IHBjaV9nZXRfaGFyZHdhcmVfZG9tYWluKHUxNiBzZWcsIHU4IGJ1cykNCj4gV2hldGhlciBh
biBpbmRpdmlkdWFsIGJ1cyBudW1iZXIgY2FuIHN1aXRhYmxlIGV4cHJlc3MgdGhpbmdzIEkgY2Fu
J3QNCj4gdGVsbDsgSSBkaWQgc2F5IGJ1cyByYW5nZSwgYnV0IG9mIGNvdXJzZSBpZiB5b3UgY2Fy
ZSBhYm91dCBqdXN0DQo+IGluZGl2aWR1YWwgZGV2aWNlcywgdGhlbiBhIHNpbmdsZSBidXMgbnVt
YmVyIHdpbGwgb2YgY291cnNlIGRvLg0KDQpJIGNhbiBpbXBsZW1lbnQgdGhlIGxvb2t1cCB3aGV0
aGVyIGEgUENJIGhvc3QgYnJpZGdlIG93bmVkIGJ5IGEgcGFydGljdWxhcg0KDQpkb21haW4gd2l0
aCBzb21ldGhpbmcgbGlrZToNCg0Kc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlID0gcGNp
X2ZpbmRfaG9zdF9icmlkZ2Uoc2VnLCBidXMpOw0KDQpyZXR1cm4gYnJpZGdlLT5kdF9ub2RlLT51
c2VkX2J5ID09IGQtPmRvbWFpbl9pZDsNCg0KQ291bGQgeW91IHBsZWFzZSBnaXZlIG1lIGEgaGlu
dCBob3cgdGhpcyBjYW4gYmUgZG9uZSBvbiB4ODY/DQoNCj4NCj4gSmFuDQoNClRoYW5rIHlvdSwN
Cg0KT2xla3NhbmRyDQo=

