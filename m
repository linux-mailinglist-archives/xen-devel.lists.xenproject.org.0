Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D62A27DE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 11:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17578.42372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZWp6-0000ph-Fj; Mon, 02 Nov 2020 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17578.42372; Mon, 02 Nov 2020 10:12:24 +0000
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
	id 1kZWp6-0000pI-CB; Mon, 02 Nov 2020 10:12:24 +0000
Received: by outflank-mailman (input) for mailman id 17578;
 Mon, 02 Nov 2020 10:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nG/o=EI=epam.com=prvs=95752e5c40=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kZWp4-0000pD-T7
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 10:12:23 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b28e0276-fc8f-442d-b9bd-ae75d3b5f551;
 Mon, 02 Nov 2020 10:12:21 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2A9jji027951; Mon, 2 Nov 2020 10:12:15 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 34h02rucp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 10:12:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4018.eurprd03.prod.outlook.com (2603:10a6:208:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 10:12:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 10:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nG/o=EI=epam.com=prvs=95752e5c40=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kZWp4-0000pD-T7
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 10:12:23 +0000
X-Inumbo-ID: b28e0276-fc8f-442d-b9bd-ae75d3b5f551
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b28e0276-fc8f-442d-b9bd-ae75d3b5f551;
	Mon, 02 Nov 2020 10:12:21 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A2A9jji027951;
	Mon, 2 Nov 2020 10:12:15 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 34h02rucp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2020 10:12:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvU02lfRj6Ic2TkzUWbl49vG1i7F61/iqykKOBe81g2Rwmca6HpPOcdKMW3/xktRn1BAUpq0XlFnNSytjDWwiRhP98oKbK3stEKrjpvZK6cYAtmJ0W9nTpxbw37dBGhxqzw9bTTUh4TdO6ukrHrTvnhikRcDDtY8ZAUNYBXbKOtJ5tJP7p0YG8SVHhgYs06MdN5DOtkwxG6yU5tUnXVwiqH4LADn0QlvD0GRBDE1f+frmx3OVsUK5ETvfRMLu6APodY1Tzmnxi9aJ9rZwmSRg2b+qcg+fRBB2kGaYrQJST0NbbWcjvbZYCC6hS11m9802S1P6rjR9GtiptgGoFlIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL3imZAcZA9qSoMPlX7S/WFD8xp3V8WJlIBuF+fohzI=;
 b=cCIahvhaVK0jzSvjc19O46XabJLzmta9BT9K6o08V5vOM1VhdKoJipHPya3b3twXeUOcE+JSP+fBGr+SImOO6xiG+FWQrOoDV3MUCAcDNbhPcNGHRxNnvARss97YTR/rq4aJiFHJeF2gbuVEfml8v8s1hEG68HKJ2O0u9w7Cf8pRkhFAIfW82zuZnf4jJsPlBu8guVWgRaWbQonE/e81LPb4XzndLkRNj5/fYGaO2KRRp9DVkH7T1nFkLlWN4fNodUPGxtSqyCqpwmu8cLjOqFMApm62C4/5U3GOb13yIPYaIT1oUAwTmTGtNjyt5LjUJJ6eAdR/jBOVRM6t9VSFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL3imZAcZA9qSoMPlX7S/WFD8xp3V8WJlIBuF+fohzI=;
 b=AFZX+hZusjZqLzjL41M4Lmi/Wm06mF2QQ0fpnvY5aOh6ARWvaTZAhRBI91sIMhVNlWuatPE6SO8KzPgHwNonxYYaY7909Bf6axbiVScTONqxBVh4Vc0nuiBndwYUzqK0XGA95B+o4MXdnHsoxamjYAxIyEg9sSWdN9SZZe+ry9wDf2I5+o/J/PdYT2NdF3nDuBS8QFoiQGk5STUoEUSr1S0bjsHHrpESXN+acvRWS2cSMcFNq/lR/u+vqUupDrhy0jS4kpGPEp9j7QoxtX23jTfgIsVp139dBUatyy73p7H5p/EZE5O6SCX1NZOegjgYff1Odq7JACfZhhlx6hApvQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4018.eurprd03.prod.outlook.com (2603:10a6:208:73::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 10:12:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 10:12:12 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWrqmeCV4SGlhADU2GY14D47cn76mwZCkAgAP4JoCAAELzAIAABK0A
Date: Mon, 2 Nov 2020 10:12:12 +0000
Message-ID: <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
In-Reply-To: <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19913cd9-188a-405e-f722-08d87f17c44c
x-ms-traffictypediagnostic: AM0PR03MB4018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB4018BD5FDEFC3AEDD7B72F7BE7100@AM0PR03MB4018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QmCAyQSuA2CxWJ+sxQ27VFpjob+3mVJxoQfNgySvGwIMSMBCTNr/cfIfX+oNmDErpwJhg/Rugd9wYxHGu8duo5qlfGpeM/g+ID+L79Ptf+E+F2JGmxCAH0vzhzEezHbU80A1Ga+sLH54M7bUz7knuhsSAKWlEHzZWO6oQNwsZZxzhiR5KK48/JqD12nx2VfOB5Rqpjlfkj1i7PuJGoB6ArQitjePHVofxmpRdzuhH9MzQyfPUuZwDS3Xe9NuL95nQX6LrHofcFeaKxI8sxF1fvlXwpKD7/BL65vXKopMdTEtkoU22vHf07sY+GcJUQpDWW6exYR5F0dIE/wuL4CC0g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(5660300002)(186003)(86362001)(478600001)(31686004)(26005)(71200400001)(8936002)(8676002)(2906002)(6512007)(66946007)(316002)(76116006)(36756003)(4326008)(66556008)(66446008)(54906003)(64756008)(107886003)(2616005)(53546011)(31696002)(6506007)(6486002)(66476007)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 4xBIy1IEY1f8XaPLPa83UGk+E9bKj0vcqJTl9xEptYX28U+nWqYiceGW+Hwjq52Fw3WdhR1TJbIwT65JrEf8EDSKUKsdt5LnphojdY2djAgCauvxrr+RyvGm5Ww5JQK6sEM75DHhXc3gqAt9XkNOykkDrV6LFq+JxaZatYyPnxOV6BOUJbTsLohUhYTHaYKkqFHFlfprdSX+hkUTA+AFPTEIbqyRzjdz4JysBCADJv59d9aDB4Z6Lah9DwdxhAN3OacLjurmS2KlhvQ32h1xcrgg2RopSTBSlS7ozF1+DiXyFjURG6dNL3nOJUgGeSC+dWifxr5DCpKOJ00AD91/tc2U9AmThnm3tSO0VnSFg9/iB1QWZ201NANRSyO/CcEnOEYaFOas1x8reaZGdF9eQxg2CQJGpAjiS823ADYy2RM4+skR+47k5rT03fgUzEwzBfty+ttOoUhnKwRguwYEYGmQO073ogWiYbv4oXjLZBpNFNCItxB/oy9AHodN7VdCpC6yAK7JCJ8L2Z1am1/87/EEJ+/lwTTsMeywY0kWsQwpXDuSADJYCUV0Hcu411tCa4bodh7Yhm4aQVvg+I/FxKditQsK8IFmSTqRQD8XRblT60FcyF4OFSxp7MKg6Q1zN8AQjtIHe+xjS52h+nmfsw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <16FA9744C5E1C64DAA9B614D3904BE0E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19913cd9-188a-405e-f722-08d87f17c44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 10:12:12.6143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+KhXKdUHdhdqzRcCStAvSEceDDIuzx3TIvD0Z3rZRFpjdOAL6DcVQ5dbTB+ckXTRiCbow9CME+67suC4eLYJCv8v5I2FA+dUzGB7KTOmumXxDjt+d0JEug36X+sdn4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4018
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-02_03:2020-11-02,2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011020080

SGksDQoNCk9uIDExLzIvMjAgMTE6NTUgQU0sIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhp
LA0KPg0KPj4gT24gMiBOb3YgMjAyMCwgYXQgMDU6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxhbmRyMjAwMEBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IEhpLCBKdWxpZW4hDQo+Pg0KPj4g
T24gMTAvMzAvMjAgNzoxOCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIE9sZWtzYW5k
ciwNCj4+Pg0KPj4+IE9uIDMwLzEwLzIwMjAgMTA6NDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+PiBPbiAxMC8yMC8yMCA2OjI1IFBNLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+
Pj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxlbWVudGF0aW9u
cy4gSXQgaXMgYmFzZWQgb24NCj4+Pj4+IHRoZSBMaW51eCBTTU1VdjMgZHJpdmVyLg0KPj4+Pj4N
Cj4+Pj4+IE1ham9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUgYXMg
Zm9sbG93czoNCj4+Pj4+IDEuIE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0ZWQg
YXMgY29tcGFyZWQgdG8gdGhlIExpbnV4IGRyaXZlcg0KPj4+Pj4gICAgICAgdGhhdCBzdXBwb3J0
cyBib3RoIFN0YWdlLTEgYW5kIFN0YWdlLTIgdHJhbnNsYXRpb25zLg0KPj4+PiBGaXJzdCBvZiBh
bGwgdGhhbmsgeW91IGZvciB0aGUgZWZmb3J0cyENCj4+Pj4NCj4+Pj4gSSB0cmllZCB0aGUgcGF0
Y2ggd2l0aCBRRU1VIGFuZCB3b3VsZCBsaWtlIHRvIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBj
b3JyZWN0DQo+Pj4+DQo+Pj4+IHRoYXQgdGhpcyBjb21iaW5hdGlvbiB3aWxsIG5vdCB3b3JrIGFz
IG9mIG5vdzoNCj4+Pj4NCj4+Pj4gKFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2
MzogRFQgdmFsdWUgPSBldmVudHENCj4+Pj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9t
ZT0weDE5NDAwMTANCj4+Pj4gKFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4NDAwMzEwMDAg
b24gQ1BVMCB2aWEgVFRCUiAweDAwMDAwMDAwYjg0NjkwMDANCj4+Pj4gKFhFTikgMFRIWzB4MF0g
PSAweDAwMDAwMDAwYjg0NjhmN2YNCj4+Pj4NCj4+Pj4gW3NuaXBdDQo+Pj4+DQo+Pj4+IElmIHRo
aXMgaXMgZXhwZWN0ZWQgdGhlbiBpcyB0aGVyZSBhbnkgcGxhbiB0byBtYWtlIFFFTVUgd29yayBh
cyB3ZWxsPw0KPj4+Pg0KPj4+PiBJIHNlZSBbMV0gc2F5cyB0aGF0ICJPbmx5IHN0YWdlIDEgYW5k
IEFBcmNoNjQgUFRXIGFyZSBzdXBwb3J0ZWQuIiBvbiBRRU1VIHNpZGUuDQo+Pj4gSnVzdCBmb3Ig
Y2xhcmljYXRpb24sIHlvdSBhcmUgdHJ5aW5nIHRvIGJvb3QgWGVuIG9uIFFFTVUsIHJpZ2h0Pw0K
Pj4gRXhhY3RseQ0KPj4+IFlvdSBtaWdodCBiZSBhYmxlIHRvIHVzZSB0aGUgc3RhZ2UtMSBwYWdl
LXRhYmxlcyB0byBpc29sYXRlIGVhY2ggZGV2aWNlIGluIFhlbi4gSG93ZXZlciwgSSBkb24ndCB0
aGluayB5b3Ugd2lsbCBiZSBhYmxlIHRvIHNoYXJlIHRoZSBQMk0gYmVjYXVzZSB0aGUgcGFnZS10
YWJsZXMgbGF5b3V0IGJldHdlZW4gc3RhZ2UtMSBhbmQgc3RhZ2UtMiBpcyBkaWZmZXJlbnQuDQo+
PiBTbywgaXQgaXMgZXZlbiBtb3JlIHdvcmsgdGhlbg0KPiBPdmVyYWxsIGl0IHdvdWxkIG1ha2Ug
bW9yZSBzZW5zZSB0byBzcGVuZCBzb21lIHRpbWUgYWRkaW5nIHByb3BlciBzdXBwb3J0IGluIFFl
bXUgdGhlbiB0cnlpbmcgdG8gbW9kaWZ5IHRoZSBkcml2ZXIgdG8gc3VwcG9ydCBRZW11IHJpZ2h0
IG5vdy4NCj4NCj4+Pj4NCj4+Pj4gV2UgYXJlIGludGVyZXN0ZWQgaW4gUUVNVS9TTU1VdjMgYXMg
YSBmbGV4aWJsZSBwbGF0Zm9ybSBmb3IgUENJIHBhc3N0aHJvdWdoDQo+Pj4+DQo+Pj4+IGltcGxl
bWVudGF0aW9uLCBzbyBpdCBjb3VsZCBhbGxvdyB0ZXN0aW5nIGRpZmZlcmVudCBzZXR1cHMgYW5k
IGNvbmZpZ3VyYXRpb25zIHdpdGggUUVNVS4NCj4+PiBJIHdvdWxkIHJlY29tbWVuZCB0byBnZXQg
dGhlIFNNTVUgc3VwcG9ydGluZyBzdXBwb3J0aW5nIHN0YWdlLTIgcGFnZS10YWJsZXMuDQo+PiBZ
b3UgbWVhbiBpbiBRRU1VPw0KPiBTZWUgYmVmb3JlLg0KPg0KPj4+IFJlZ2FyZGxlc3MgdGhhdCwg
SSB0aGluayBYZW4gc2hvdWxkIGJlIGFibGUgdG8gc2F5IHRoZSBTTU1VIGlzIG5vdCBzdXBwb3J0
ZWQgcmF0aGVyIHRoYW4gY3Jhc2hpbmcuDQo+PiBZZXMsIHRoYXQgd291bGQgYmUgbmljZQ0KPiBG
dWxseSBhZ3JlZSBhbmQgd2Ugd2lsbCBsb29rIGludG8gdGhhdC4NCj4NCj4gQW55dGhpbmcgeW91
IGNvdWxkIHNoYXJlIHNvIHRoYXQgd2UgY291bGQgcXVpY2tseSByZXByb2R1Y2UgeW91ciBzZXR1
cCB3b3VsZCBiZSBtb3JlIHRoZW4gZ3JlYXQuDQoNCk5vdGhpbmcgc3BlY2lhbCwNCg0KcWVtdS9h
YXJjaDY0LXNvZnRtbXUvcWVtdS1zeXN0ZW0tYWFyY2g2NCAtbWFjaGluZSB0eXBlPXZpcnQgLW1h
Y2hpbmUgdmlydCxnaWMtdmVyc2lvbj0yIFwNCg0KLW1hY2hpbmUgdmlydHVhbGl6YXRpb249dHJ1
ZSAtY3B1IGNvcnRleC1hNTcgLXNtcCA0IC1tIDIwNDggLW5pYyB1c2VyLGhvc3Rmd2Q9dGNwOjEy
Ny4wLjAuMToyMjIyLToyMiBcDQoNCi1ub2dyYXBoaWMgLXNlcmlhbCBtb246c3RkaW8gWy4uc25p
cC4uXQ0KDQpJIGFsc28gc2V0IGlvbW11IHRvIHNtbXV2MyBpbiBteSB0ZXN0cywgUUVNVSBlbXVs
YXRvciB2ZXJzaW9uIDQuMi4xDQoNCj4NCj4gUmVnYXJkcw0KPiBCZXJ0cmFuZA0KPg0KPj4+IENo
ZWVycywNCj4+Pg0KPj4gVGhhbmsgeW91LA0KPj4NCj4+IE9sZWtzYW5kcg==

