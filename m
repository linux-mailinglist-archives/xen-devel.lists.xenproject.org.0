Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5B2B1930
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26287.54551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWUH-0002uo-Jr; Fri, 13 Nov 2020 10:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26287.54551; Fri, 13 Nov 2020 10:39:25 +0000
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
	id 1kdWUH-0002uP-GW; Fri, 13 Nov 2020 10:39:25 +0000
Received: by outflank-mailman (input) for mailman id 26287;
 Fri, 13 Nov 2020 10:39:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdWUF-0002uH-Rt
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:39:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58996885-a1df-464d-b007-2177cd880699;
 Fri, 13 Nov 2020 10:39:22 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADAapQi018598; Fri, 13 Nov 2020 10:39:16 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf7yync3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 10:39:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4433.eurprd03.prod.outlook.com (2603:10a6:208:cf::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:39:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:39:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdWUF-0002uH-Rt
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:39:24 +0000
X-Inumbo-ID: 58996885-a1df-464d-b007-2177cd880699
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58996885-a1df-464d-b007-2177cd880699;
	Fri, 13 Nov 2020 10:39:22 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAapQi018598;
	Fri, 13 Nov 2020 10:39:16 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf7yync3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 10:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkAUq3Od0LqaZhaB6vpXL97KzwcyLn4INdY0aoWYCzokUBSfg4GZM/XtkD2HztQ7Wf1R9yy8XCSu0ju230dFQk/FD2v67KXxkyrEXu/wQwO3CguyNExKhM9aK7sckrtwYTOcHJ8Gsk5Zvb66LIOaIzJtwb20LHlVQUEb+5Pd0/ls4lCzHUuEbfg9KAfy5TDYY9Y3BTr3MZfL4bqFdcs9H9bKyJpt0JC7rBegLWGxspkEMffH86RWbi7FWdJ4mXr/Daa8RKl8x/b/ak+LYLXbygG4sgS/90N5uq1pzdHxCF515bDaYSqhiORiZ9uPt6jSJmf2zfBty79PXGc8ykhY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCClWK2e5vOQFNf52Cc4gu7Npc68nDufeBrTfr+3aYw=;
 b=hd4jcHk3Twjp3faG7r5HLZoBPJsYd94Aa1Gt+mUik9m8wRkP/HgSl1wIennUqa/QlMHcWO0WdxQyfQF/QsXf/1Vz6KqVpYYbmqpw4COVbC/vi5w/j7FCD7en0ghfHujWedCbrim0SXFwMnSvogSbxymfFYQoPuauioA9vvrK2fsuyA5qU6P6gmkcV2fbTuELxa0RjGs/JedR+BFA3b9f6G0VVstQIgtrTPmFJGeGwhCSdM8vLIWBb78fvU/tbC164TTPXarxqYx6d6/fCHXSvOyp8TzjIVTTjGlgy4lzdJJqzvG4FQowDwpM9n6q+To8Wt//XWNfPL5wNJFehWyMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCClWK2e5vOQFNf52Cc4gu7Npc68nDufeBrTfr+3aYw=;
 b=4lQdpA/rRvsZOWSZDUI42/RLcWNs48LGiuGZ2VQz2VGRNq43C3t6DciF3s/soh7zkDGiRZXHKzR9nNWQNGbIZzUKJd7HF9EfYJnHyurSpKw4owUCRVGOy+wEEh7Z6hb5UChysQS5FzTXS9cSDucLlH5qME4NF9UZx805uyx8+3dF/HcuNC90GwMBDIH6O2R8oFxGakRmcPEmDISYrTeJ9AgcOUnH6Lmo07LnduRRfZr053UvlEU43pURU4cj0A0JRBtpprVL5O/4mXbGblDJR7SYmDL4BUU9EmADjwZy/abbrXAp4NtCzqwtDZr8X/vUxGSO9CRyeHGmVfO0aU8YSA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4433.eurprd03.prod.outlook.com (2603:10a6:208:cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:39:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:39:14 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Topic: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Index: AQHWtpbyYHzQ7b7gKkKm7jsDdoAEE6nF4pWAgAACsYA=
Date: Fri, 13 Nov 2020 10:39:14 +0000
Message-ID: <1f0a3eb7-be20-95a0-0c1e-c7d45e3279f8@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
 <ae66dddb-98e3-61fd-86c3-eab30ec33d18@suse.com>
In-Reply-To: <ae66dddb-98e3-61fd-86c3-eab30ec33d18@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ddb423e-ea42-48ca-8319-08d887c05d59
x-ms-traffictypediagnostic: AM0PR03MB4433:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4433D64C7C6D053DD3CA20C1E7E60@AM0PR03MB4433.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bMUo4V00u6sDXuwlDp/MKEjMY3+grznjA3XqPVpV8KRys1LZ+Fj/LWhRxhAy5Ggyia1N5I/YDyf90SgngjOxhyQhuSEwa7GoCUIDfQnulQDZeGM1+rEgGQ3KSZBfhoWAzV44jRfZixnP+eN0sf6cnRmguoCZrkLrLLnLhSpQZv/8BzqqTv/Tm/Jq5i29LedJYd4rWb443rpFaWBAHi2hgR1biF4H4m+hQxB5TfzAUHs0JGng8zk+uhNlNWytOSyywihDoNSvoEPUp9n3a2vZKJ6ecGJx4lr2zRRSw2XZRnNE1f9mcLrzjBWgc4HbiBaQTK/s0OHu3PKY0ZlvXV8m4Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(83380400001)(54906003)(6486002)(31686004)(53546011)(31696002)(6506007)(71200400001)(478600001)(316002)(76116006)(26005)(91956017)(8676002)(8936002)(66476007)(66946007)(7416002)(2906002)(2616005)(4744005)(6512007)(110136005)(4326008)(66556008)(66446008)(64756008)(5660300002)(36756003)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 U6/r4CfUF3tqBZ5tQ6URmfNfkxtarEhIvE7wFY5i6Q4DKDzTCtxlPwmb3JqiaJRRgP3XYg4yFHf5ZhDMjMlwmDzUHjNHKuNP35fsezER+IAvLhgz040d4zBj+lRYZVFMCz7byuFDeWLPaEf/us+Uf9wjyv9jc8RHkpse1WkoBq9dA3HJbjIP5YhnKlwXCY/vcqYnD04S8J5lv2Bvmf8bGtWDAVHJDffS334TCxepQwPJ6nHYLXiWmxP/ytrxEk3syOZpBtkNUgHpBeyGI8t8mafStxXoDx5233RpUvMN5N7NmUJyWczjysKZAjXWkkz4mHi9df/BwnQGNw+6Xa6ZRfqCjyCoKtNCDHbC7RmKP14ltXcX1FjiRgw4jGQLZkmpidaK4wYPxuVoCy2RSljil6WqtfbmAqU/XUK0+syg5bXZnR/0byhn7nLG1s4U4neVoVdG9/717XRBhWI0cuemxKVn3jGXaGMusCnNL2ALB0QZRBV6OvSLL64EvycJ35V7MUYfK/wt2aWfHR3U+/PceDXmS5RvSDj5t45r/6QtL3TCpiaHf5K7IYDndEHD1LISmFjGR5wmXWswgc8TIdxapx5mAmJJbShsGb6O7RESSclcU4He/OP987bOuq3JxrepYyw2jzham+qIPfwCT1liRw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5941C4E1305D7C40874075A2A9E0FAEB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddb423e-ea42-48ca-8319-08d887c05d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 10:39:14.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtSuYIknWKiRuFVu6194SdvPBiuqf4S1sNZmzasU9/Bzri/r+3dK253TT1EJGLOii6Q08bVUqnIRqiVjP1wSmjEBjM+QvjBHnmfvVNcdPRUT8Ta+GCj5UUVNOAc/73sg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4433
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_07:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130064

DQpPbiAxMS8xMy8yMCAxMjoyOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjExLjIw
MjAgMTM6NTAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4N
Cj4+IE5vbi1FQ0FNIGhvc3QgYnJpZGdlcyBpbiBod2RvbSBnbyBkaXJlY3RseSB0byBQQ0kgY29u
ZmlnIHNwYWNlLA0KPj4gbm90IHRocm91Z2ggdnBjaSAodGhleSB1c2UgdGhlaXIgc3BlY2lmaWMg
bWV0aG9kIGZvciBhY2Nlc3NpbmcgUENJDQo+PiBjb25maWd1cmF0aW9uLCBlLmcuIGRlZGljYXRl
ZCByZWdpc3RlcnMgZXRjLikuDQo+IEFuZCBhY2Nlc3MgdG8gdGhlc2UgZGVkaWNhdGVkIHJlZ2lz
dGVycyBjYW4ndCBiZSBpbnRlcmNlcHRlZD8NCg0KSXQgY2FuLiBCdXQgdGhlbiB5b3UgaGF2ZSB0
byBmdWxseSBlbXVsYXRlIHRoYXQgYnJpZGdlLCBlLmcuDQoNCiJpZiB3ZSB3cml0ZSBBIHRvIHJl
Z0IgYW5kIGFmdGVyIHRoYXQgd3JpdGUgQyB0byByZWdaIHRoZW4gaXQNCg0KbWVhbnMgd2UgYXJl
IGFjY2Vzc2luZyBjb25maWcgc3BhY2UuIElmIHdlIHdyaXRlLi4uLiINCg0KSSBtZWFuIHRoaXMg
d291bGQgbmVlZCBsb3RzIG9mIGNvZGUgaW4gWGVuIHRvIGFjaGlldmUgdGhhdA0KDQo+ICAgSXQN
Cj4gd291bGQgc2VlbSB0byBtZSB0aGF0IGlmIHNvLCBzdWNoIGEgcGxhdGZvcm0gaXMgbm90IGNh
cGFibGUgb2YNCj4gYmVpbmcgdmlydHVhbGl6ZWQgKHdpdGhvdXQgY29vcGVyYXRpb24gYnkgYWxs
IHRoZSBkb21haW5zIGluDQo+IHBvc3Nlc3Npb24gb2YgZGV2aWNlcykuDQoNCkd1ZXN0IGRvbWFp
bnMgYWx3YXlzIHVzZSBhbiBlbXVsYXRlZCBFQ0FNIGJyaWRnZSBhbmQgYXJlIGVhc2lseQ0KDQp0
cmFwcGVkIGFuZCBlbXVsYXRlZA0KDQo+DQo+IEphbg==

