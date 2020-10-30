Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439712A0908
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 16:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15965.39226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVvQ-0004wt-58; Fri, 30 Oct 2020 15:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15965.39226; Fri, 30 Oct 2020 15:02:44 +0000
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
	id 1kYVvQ-0004wX-1u; Fri, 30 Oct 2020 15:02:44 +0000
Received: by outflank-mailman (input) for mailman id 15965;
 Fri, 30 Oct 2020 15:02:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CBev=EF=epam.com=prvs=95721c7f7b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kYVvO-0004wO-Hc
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:02:42 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1da9e7-0062-4f43-9bd5-61ca165b7215;
 Fri, 30 Oct 2020 15:02:41 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UEv5qT022520; Fri, 30 Oct 2020 15:02:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0b-0039f301.pphosted.com with ESMTP id 34gf4nh8qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 15:02:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2801.eurprd03.prod.outlook.com (2603:10a6:200:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 15:02:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 15:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CBev=EF=epam.com=prvs=95721c7f7b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kYVvO-0004wO-Hc
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:02:42 +0000
X-Inumbo-ID: 1a1da9e7-0062-4f43-9bd5-61ca165b7215
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1a1da9e7-0062-4f43-9bd5-61ca165b7215;
	Fri, 30 Oct 2020 15:02:41 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09UEv5qT022520;
	Fri, 30 Oct 2020 15:02:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
	by mx0b-0039f301.pphosted.com with ESMTP id 34gf4nh8qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2020 15:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHHnaKppuuCX5qYeU6JtYUrq9onNIUC/oum3i8BLrwqHXQXu/g71Muigg/h4m0/OVIrO4wGiQ0OLdTFaXthBQM51PPpihtuAFyGUciay9qpdCFOqsSNmSwCY6zyN43lBaDV97QrHcWySuQKNpc++X9m4ju1nJpexKrxne6z2jDR2/Ze75L3bjNs1ZzRm5pb+1LFXQNWJvT1F+7c18JVcNh4vyA2SFheMamHONpQ+xwATAkEQA01DEjsaK1RtyhsK959Uyzc83ypXQPJ+Q7xmsCAhKh7YE7j4cWax3T7Q1A6O5m91uYVGl2Dk9+uZStVQfGse3fEblM/UCj0P3pxoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLlrb76xIQet8Y6fn0HO1ccId/+9T+kzIKATnE77fZ4=;
 b=IYUrH80p3tlHNj70RqvSfDEbNUHpayRjGTfjDK2vL5va1GaIUiVohjrQsbWaML1W+csI9Lj8kGgq0wa9TEGJNq0ygb65gdFgN/3Dm317dY8zP+2jiJ8EYEEp4q0PXaSnIzheK+GQSc9ZlH05cc7HQLr5gG2iUg2210n8je86W50fqe+fCLZ0uZeHbmmjKJxnlHn6v3ThDfkFdNq2W7upry1l/NndVh3LSL76q8idgL8R1eKS1Wb1mIxQgJBUfeAJP0Cr1F7Yb2KucfDbfGAdhdmsWv+QtYMSebwtFgyp8rflzhCdgEWm/F7azm04BLZvPbuzKghSjmC+SqoUdOp1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLlrb76xIQet8Y6fn0HO1ccId/+9T+kzIKATnE77fZ4=;
 b=xUgWSQUEJQe1B4HOBRUynG2RfhbtVKrmfOeWtYrpB4lggC9Kk/hKN6sQ++UuurygQ/OUSDAo4RBNbdsXTKnt2M0UF7B5NCH988IMQYUWUFAmyFkT+zso6jC1aA2l/Qm1DlZoZhbvKRJE1Fpkl51jbryc2kAH7THFXr4bnMsncLEvAyYgwGS53QTsZGxmRtYEcUDpA7e44jvOa0DY8Z76WKwNg0YvnDkHrTXIlUGrmHAouCxGEqeyHgChTUcHa3ixDDh/7gFWaEW4L6nb5fXMPIKu39Y+AOlx8YjPFUPc/9rbtmim2QNwpRXG+F10ZZ7TASlk4p4goOw7xTfkoH/hbg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2801.eurprd03.prod.outlook.com (2603:10a6:200:99::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 15:02:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 15:02:31 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWrqmeCV4SGlhADU2GY14D47cn76mwOdAAgAAEO4A=
Date: Fri, 30 Oct 2020 15:02:30 +0000
Message-ID: <da9d0192-7431-83ab-be1a-cc107ee1ac4c@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <2AB3A125-D530-4627-A877-EC2BCDCD63DC@arm.com>
In-Reply-To: <2AB3A125-D530-4627-A877-EC2BCDCD63DC@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ce3663d-359f-4957-aacc-08d87ce4d331
x-ms-traffictypediagnostic: AM4PR0302MB2801:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM4PR0302MB28019D6154E2EAF22973B4A6E7150@AM4PR0302MB2801.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5Ag6u9abNcl4EVQC7AVIPKtRkTIA+P0+G8IJq6fK60+Guy+tQ4tufZ4ovIhhrDPVf0BpAmbDBCV8tvx7Xe1766Q+pJd0lIbciuCA/k4F6keAO2j4TCIvGTHhKCSx2pMo4OtYUQbdPCd20oF3frxbrcy6DPHnkaWBszo3h66qR/PgPVt6140Smy6e0akQtjKLf7FGB+ZvSIfgkYL6ka955qEViInH7URmDXu7Am3KTi/jvXiSXtLgCJY8b6p9/16gMvJZP7VjmsnLPVROgNK5fMr7CzmCnJryYOmzhgBCgkTorX5/xwtv4iL245f2gO625RWgi2bkRQUlUZR3yYHWFI1caH4jOAON3MMfDXqih0jpNbqkVtqmtQx4OtE/oEsSfZFkSikn7pXgCcxcFyyNaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(31686004)(71200400001)(6512007)(4326008)(186003)(53546011)(6506007)(2906002)(83380400001)(54906003)(26005)(316002)(36756003)(6486002)(966005)(8936002)(76116006)(6916009)(66946007)(31696002)(66476007)(66556008)(64756008)(66446008)(478600001)(2616005)(5660300002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mHWlM/2uB4c2p+1i0h9BwtkMoFJlB5anv2il8MDssBGXb+mu2QL6wTIzaV7gqWAA06Cn2aZy9cAEhklyQsZALL1Ecitsp2k9x/dOx5EuCQr6tbKecvBVx/sR2zI1KXzORIkHEUnTWFwyxk3+bTFGOoOGLDCKE+BoaOGq8BE1scKnrew1Bsla+yW98pCgxBE81GPtRfvd4JxT9vta5aoT4zVZ7zhQAMHu4Nccs8rbgH8aln4FnIEAPZuqURGcwIv+/1j5X8UD0s+p/EogCtP2WTmwddrXKPlE0GAjPD9JwfGd3DUdVc7opFlZUFvaDeIiM0vEucQV7FpZaUgAf6iP1f8hkGagJWO50nuj7AEpBH6EEBMFtAU6j7D6uwfiUU4LLNrOtF5tpqZxVwmGBVmAiq1SKw0rTz6/HbWrQwn/NVAGjUEOE/o+vaoYY/qM+28uiiUj6fFJVxvM4YR/PUobJke2VedqVEzlmjnTgL9OdVZ2CdtHYvOQJ4XLBA/oOVz1l0fvYNUVj1doDb01IgMr6n42Q1mVoKkwXF/Xo82jkAIRgWuIBbRm07HNyTQVwQjGBEn+H+IUL+Gui6GiJTPEKbVJF37i1NIPTRGXgQo10q1C33+xrTcB/tr+qJaSFeNQxSczoZJYejOUiqThi4HfOQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7B12ABB49D52D4CA05F988FFCAE1C4A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce3663d-359f-4957-aacc-08d87ce4d331
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 15:02:30.9325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAQrk18rEb2o54dc/+Q4Zat3275WSQHKRd/fFqPSUpgoSSEzQQcbnMy6vRhZsJD/4waPuQ7ps+CHTghLl6Vj64jyB18aSqlsmsnO8J1RaiCtJfvnLjBEH94Oqi33OQVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2801
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-30_07:2020-10-30,2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=838 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300114

SGksDQoNCk9uIDEwLzMwLzIwIDQ6NDcgUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0KPiBIZWxsbyBP
bGVrc2FuZHIsDQo+DQo+PiBPbiAzMCBPY3QgMjAyMCwgYXQgMTA6NDQgYW0sIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4gd3JvdGU6DQo+
Pg0KPj4gSGksIFJhaHVsIQ0KPj4NCj4+IE9uIDEwLzIwLzIwIDY6MjUgUE0sIFJhaHVsIFNpbmdo
IHdyb3RlOg0KPj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxl
bWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24NCj4+PiB0aGUgTGludXggU01NVXYzIGRyaXZlci4N
Cj4+Pg0KPj4+IE1ham9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUg
YXMgZm9sbG93czoNCj4+PiAxLiBPbmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVk
IGFzIGNvbXBhcmVkIHRvIHRoZSBMaW51eCBkcml2ZXINCj4+PiAgICAgdGhhdCBzdXBwb3J0cyBi
b3RoIFN0YWdlLTEgYW5kIFN0YWdlLTIgdHJhbnNsYXRpb25zLg0KPj4gRmlyc3Qgb2YgYWxsIHRo
YW5rIHlvdSBmb3IgdGhlIGVmZm9ydHMhDQo+Pg0KPj4gSSB0cmllZCB0aGUgcGF0Y2ggd2l0aCBR
RU1VIGFuZCB3b3VsZCBsaWtlIHRvIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0DQo+
Pg0KPj4gdGhhdCB0aGlzIGNvbWJpbmF0aW9uIHdpbGwgbm90IHdvcmsgYXMgb2Ygbm93Og0KPj4N
Cj4+IChYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUwMDAwOiBTTU1VdjM6IERUIHZhbHVlID0gZXZl
bnRxDQo+IEkgaGF2ZSBsaW1pdGVkIGtub3dsZWRnZSBhYm91dCBRRU1VIGludGVybmFscy5BcyB3
aGF0IEkgc2VlIGZyb20gdGhlIGxvZ3MsIGZhdWx0IGlzIG9jY3VycmVkIGF0IGVhcmx5IGRyaXZl
ciBpbml0aWFsaXNhdGlvbiB3aGVuIFNNTVUgZHJpdmVyIGlzIHRyeWluZyB0byBwcm9iZSB0aGUg
SFcuDQo+DQo+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4MTk0MDAxMA0KPj4g
KFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4NDAwMzEwMDAgb24gQ1BVMCB2aWEgVFRCUiAw
eDAwMDAwMDAwYjg0NjkwMDANCj4+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMGI4NDY4Zjdm
DQo+Pg0KPj4gW3NuaXBdDQo+Pg0KPj4gSWYgdGhpcyBpcyBleHBlY3RlZCB0aGVuIGlzIHRoZXJl
IGFueSBwbGFuIHRvIG1ha2UgUUVNVSB3b3JrIGFzIHdlbGw/DQo+Pg0KPj4gSSBzZWUgWzFdIHNh
eXMgdGhhdCAiT25seSBzdGFnZSAxIGFuZCBBQXJjaDY0IFBUVyBhcmUgc3VwcG9ydGVkLiIgb24g
UUVNVSBzaWRlLg0KPiBZZXMgYXMgb2Ygbm93IG9ubHkgU3RhZ2UtMiBpcyBzdXBwb3J0ZWQgaW4g
WEVOLklmIHdlIGhhdmUgYW55IHJlcXVpcmVtZW50IG9yIHVzZSBjYXNlIHRoYXQgZGVwZW5kcyBv
biBTdGFnZS0xIHRyYW5zbGF0aW9uIHdlIGNhbiBzdXBwb3J0IHRoYXQgYWxzbyBpbiBYRU4uDQpU
aGUgdXNlIGNhc2UgaXMgYmVsb3c6IFBDSSBwYXNzdGhyb3VnaCBhbmQgdmFyaW91cyBjb25maWd1
cmF0aW9ucyBpbmNsdWRpbmcgU1ItSU9WIHdoaWNoIGlzIHBvc3NpYmxlIHdpdGggUUVNVS4uLg0K
Pg0KPj4NCj4+IFdlIGFyZSBpbnRlcmVzdGVkIGluIFFFTVUvU01NVXYzIGFzIGEgZmxleGlibGUg
cGxhdGZvcm0gZm9yIFBDSSBwYXNzdGhyb3VnaA0KPj4NCj4+IGltcGxlbWVudGF0aW9uLCBzbyBp
dCBjb3VsZCBhbGxvdyB0ZXN0aW5nIGRpZmZlcmVudCBzZXR1cHMgYW5kIGNvbmZpZ3VyYXRpb25z
IHdpdGggUUVNVS4NCj4+DQo+Pg0KPj4gVGhhbmsgeW91IGluIGFkdmFuY2UsDQo+Pg0KPj4gT2xl
a3NhbmRyDQo+Pg0KPj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9jb3Zlci8xNTI0NjY1NzYyLTMx
MzU1LTEtZ2l0LXNlbmQtZW1haWwtZXJpYy5hdWdlckByZWRoYXQuY29tL19fOyEhR0ZfMjlkYmNR
SVVCUEEhaC1FYUUwT25TYlh0TEJTd0lTMzExYWxEbDdwbjhzSDdzaWhnSVlxaWxNNS1yLThrQ0g2
VVNOTmxMQjN4aGJ6YzZlY3pVT3JoY3ckIFtwYXRjaHdvcmtbLl1vemxhYnNbLl1vcmddDQo+IFJl
Z2FyZHMsDQo+IFJhaHVsDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

