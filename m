Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE529042E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 13:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8029.21369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTO35-0004Bp-HA; Fri, 16 Oct 2020 11:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8029.21369; Fri, 16 Oct 2020 11:37:27 +0000
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
	id 1kTO35-0004BP-Dm; Fri, 16 Oct 2020 11:37:27 +0000
Received: by outflank-mailman (input) for mailman id 8029;
 Fri, 16 Oct 2020 11:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4YNt=DX=epam.com=prvs=8558b98f7f=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1kTO33-0004BB-PW
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:37:25 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd4ceea3-ba98-4069-85c4-8ddfa7638720;
 Fri, 16 Oct 2020 11:37:24 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GBZ72k010829; Fri, 16 Oct 2020 11:37:23 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 346f2vchbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 11:37:23 +0000
Received: from AM6PR03MB3687.eurprd03.prod.outlook.com (2603:10a6:209:30::16)
 by AM7PR03MB6644.eurprd03.prod.outlook.com (2603:10a6:20b:1b6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Fri, 16 Oct
 2020 11:37:20 +0000
Received: from AM6PR03MB3687.eurprd03.prod.outlook.com
 ([fe80::7819:980d:4992:f090]) by AM6PR03MB3687.eurprd03.prod.outlook.com
 ([fe80::7819:980d:4992:f090%6]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 11:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4YNt=DX=epam.com=prvs=8558b98f7f=artem_mygaiev@srs-us1.protection.inumbo.net>)
	id 1kTO33-0004BB-PW
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:37:25 +0000
X-Inumbo-ID: cd4ceea3-ba98-4069-85c4-8ddfa7638720
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cd4ceea3-ba98-4069-85c4-8ddfa7638720;
	Fri, 16 Oct 2020 11:37:24 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09GBZ72k010829;
	Fri, 16 Oct 2020 11:37:23 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
	by mx0a-0039f301.pphosted.com with ESMTP id 346f2vchbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2020 11:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTtq7kWuIG3n3fZf5b+Ew/f5NRDikfttnFrxaZHhaYZeQ/iEIX8lJkelb3b3HrxeWG5uKrXMSuzELBTSwwplQ5dHQW4Yqb8t1nqtMtGu6EkCGwNMQVJMhyHIiOpioc8rgeYtg9j0faQFmlXLZwuJvwwmVoH8eYB4nvLseBnpeoR95gc/WY8xr43157VWNqcULCcvZHLEZgFzckLHCfRKEwciJeAji1iyPjn8MGvf2GsG2TuqCqBviRsxVf9R/R4schm/iCb4TgnYpf1X/PT+IybR9JHDdaLTs6+RH4KQL268WDDKqzYkW35Vy/ZZft5JM/H0ShIAnpXZ80EL7/JHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7bwsr9BNPpt1G2ulhrUtkoAEtVHKgN9w0+u0WfepFs=;
 b=dkUyRjmxKXlulgokjoKUGLH4T0P2/TKdnkaVH7FgH9xGjUPuKahprGPPoqngA6avjrsYtkFfECv0mDTuSULLvzBE5MvxVtivijiflwX/y0QKgCuZhQ70NkSFbMiiLChyU9yQYCdWvpY5UhAOPcAvS0O7fWq5X8qOrjBvpSobYDikFX0jfT81+LpjOjcqxsPLpzKHEXNIsKCJFFlbhOgva7kzqrhvwLAo9PNYovlFoXA3CfCeHNFJj/YOxHdvrcla9+w8EnXY+ICry/sCiB5ulRyd8UH6jCqxYhSqS7Eo0TlcQ8onq5P5HhnrArTtzwNsaVQwTddr/GtESjIZMOzfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7bwsr9BNPpt1G2ulhrUtkoAEtVHKgN9w0+u0WfepFs=;
 b=YxqVcruOtJ6OT0YbamHYi/5UuRRJ3Z3yXaKQFjuUo7MfqzNU9XBRjenA3jjYFgN4lG40AmcQKce+NobPSxOgE5/rMdQMb3RdYOs8tPBjDRBHzYl/AShqSrDHXz/7i9iwkrozLZC0EMjPZHMZGkL928ElpyW1EAYbP1wIWlSMVB5dmjHdEp1PlxekeN5zUIvy8VYoxoEhxJU7G3pcoY+pUTVhwA3p93uXN5IgGXNqUqLMwL0zNAWew+6mKe2+o4Lle+T6tzpu7jBxhcEQgSaNUHR6Ch3rdTD9J67/AfPH9Rwkgt92qcxXe7FDR8Xyp49gCDZMXldM+afrI3s9U0nZhQ==
Received: from AM6PR03MB3687.eurprd03.prod.outlook.com (2603:10a6:209:30::16)
 by AM7PR03MB6644.eurprd03.prod.outlook.com (2603:10a6:20b:1b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Fri, 16 Oct
 2020 11:37:20 +0000
Received: from AM6PR03MB3687.eurprd03.prod.outlook.com
 ([fe80::7819:980d:4992:f090]) by AM6PR03MB3687.eurprd03.prod.outlook.com
 ([fe80::7819:980d:4992:f090%6]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 11:37:20 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: Julien Grall <julien@xen.org>,
        Anastasiia Lukianenko
	<Anastasiia_Lukianenko@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>
CC: "vicooodin@gmail.com" <vicooodin@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "committers@xenproject.org" <committers@xenproject.org>,
        "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: 
 AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkAgAlxpgCACF7sgIABM44AgASIOQCAAAt9gIAAE8Bw
Date: Fri, 16 Oct 2020 11:37:20 +0000
Message-ID: 
 <AM6PR03MB3687A99424FA9FD062F5FE4BF4030@AM6PR03MB3687.eurprd03.prod.outlook.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
 <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
 <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
 <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
In-Reply-To: <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [194.53.196.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2503e26b-e40f-4956-4daa-08d871c7d7fa
x-ms-traffictypediagnostic: AM7PR03MB6644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM7PR03MB6644562B10C55A1F1EDB95EAF4030@AM7PR03MB6644.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VRvea6+zUZ4Nrtg7kZ1dkhCa93cW+g3bd2zgsiRehBe9EIbge09PrmB2hBYzAzTuTXgyE8EkYns3zEJE1E3fFbTqHxioDk8k2097TbjCWQd/mQ77CtFzOKC94DKFVf1gYZEYYS48F0s9eOV5woZHUf4dJNnTJ/nCBIE+AnnrVH1ZV53lGcAELtW4ck6WT4PKskjXrfLe3oBmcX2nwLgONk/CakOYDr/OmGps/FNhvZJfU221HaYaPS9mN4/XSQP4dx5HK2lIA67CaieNN785netw1H1B5bPnv8VIwTrZPCkbMA3lOfAr8cbqAIi+zOxOu1Fi5VzFm9Dwlldz8lu05w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB3687.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(55016002)(478600001)(110136005)(33656002)(186003)(52536014)(26005)(54906003)(316002)(53546011)(5660300002)(107886003)(8676002)(71200400001)(9686003)(86362001)(66556008)(2906002)(7696005)(76116006)(64756008)(66946007)(66446008)(66476007)(83380400001)(6506007)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mgoXCRGZ52brfGygO9plHy1egf2hL5TxIZsqyqTfHbr7zk9PGFXPDs69yqoGlzvP3jbd0Td79g9xzQk/hRKnToX7w+lVmqbCKXPdi7smY+DDOwhxJ6qoEl1aoPEYX57l5nqk+398X4EfVcgvGmp3XLaYQBUu5u8eFwJXdWbP5N/fbkLA3PKsd09OaMUCU11vmEvB2MQwBTrmNB7Y2d/SOKGZh+o6XOTTkw52+qmjtwYHLqmI3JWCzVa0on8g0fnsOt1nF9tbkzo+kYxHw+UKZwofjk8uHpY74Tle6IaJJ0i96wYLXlMIOW4UiRUIQJjVcUJuOtU4hgSACT0PlBsnF6MvW3MqksxwYJ/Mbbl7gbXhcPHEWtUe6Hn7HeJPZo7d1mly5g7MhEYRox9Zi1w2Kqu/NMWuLZ8onx0UzAyveVVzIiaNLsIUxnIm6dxzhOeZznG2HSs3N3Bfdy8jBm/iW64K9idLHZgwTiULoIsnyW1pFK9cxb1GrizcSQlBlabZSHDhn4cec7//kpXf37rwZ9b4ECLPb77uqTN87U+m4iLXGP/Jw0pNbfpGuoz530xWqeqkyQ1jFYs5Wu8DhxXXniVoZ7rM/zd7wwecV8/rvE9ztluaSUT5wcZLaGHm+7vPLObKS7v+7xUoDyag3Hmpjg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3687.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2503e26b-e40f-4956-4daa-08d871c7d7fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 11:37:20.7781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPeAMFpZGm3XvZsQHmwzXe3rZEosLlzUEqJnSG02L9FHr7Bk1HytmjZMusGQyWcCGbEKRdMxZeG/HabUeVcpJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_06:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160084

SGksDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiANClNlbnQ6INC/0Y/RgtC90LjRhtCwLCAxNiDQvtC60YLRj9Cx0YDRjyAy
MDIwINCzLiAxMzoyNA0KVG86IEFuYXN0YXNpaWEgTHVraWFuZW5rbyA8QW5hc3Rhc2lpYV9MdWtp
YW5lbmtvQGVwYW0uY29tPjsgamJldWxpY2hAc3VzZS5jb207IEdlb3JnZS5EdW5sYXBAY2l0cml4
LmNvbQ0KQ2M6IEFydGVtIE15Z2FpZXYgPEFydGVtX015Z2FpZXZAZXBhbS5jb20+OyB2aWNvb29k
aW5AZ21haWwuY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGNvbW1pdHRlcnNA
eGVucHJvamVjdC5vcmc7IHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb207IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NClN1YmplY3Q6IFJlOiBYZW4gQ29kaW5n
IHN0eWxlIGFuZCBjbGFuZy1mb3JtYXQNCg0KPiBIaSwNCj4NCj4gT24gMTYvMTAvMjAyMCAxMDo0
MiwgQW5hc3Rhc2lpYSBMdWtpYW5lbmtvIHdyb3RlOg0KPiA+IFRoYW5rcyBmb3IgeW91ciBhZHZp
Y2VzLCB3aGljaCBoZWxwZWQgbWUgaW1wcm92ZSB0aGUgY2hlY2tlci4gSQ0KPiA+IHVuZGVyc3Rh
bmQgdGhhdCB0aGVyZSBhcmUgc3RpbGwgc29tZSBkaXNhZ3JlZW1lbnRzIGFib3V0IHRoZQ0KPiA+
IGZvcm1hdHRpbmcsIGJ1dCBhcyBJIHNhaWQgYmVmb3JlLCB0aGUgY2hlY2tlciBjYW5ub3QgYmUg
dmVyeSBmbGV4aWJsZQ0KPiA+IGFuZCB0YWtlIGludG8gYWNjb3VudCBhbGwgdGhlIGF1dGhvcidz
IGlkZWFzLg0KPg0KPiBJIGFtIG5vdCBzdXJlIHdoYXQgeW91IHJlZmVyIGJ5ICJhdXRob3IncyBp
ZGVhcyIgaGVyZS4gVGhlIGNoZWNrZXIgDQo+IHNob3VsZCBmb2xsb3cgYSBjb2Rpbmcgc3R5bGUg
KFhlbiBvciBhIG1vZGlmaWVkIHZlcnNpb24pOg0KPiAgICAgLSBBbnl0aGluZyBub3QgZm9sbG93
aW5nIHRoZSBjb2Rpbmcgc3R5bGUgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMgDQo+IGludmFsaWQu
DQo+ICAgICAtIEFueXRoaW5nIG5vdCB3cml0dGVuIGluIHRoZSBjb2Rpbmcgc3R5bGUgc2hvdWxk
IGJlIGxlZnQgDQo+IHVudG91Y2hlZC91bmNvbW1lbnRlZCBieSB0aGUgY2hlY2tlci4NCj4NCg0K
QWdyZWUNCg0KPiA+IEkgc3VnZ2VzdCB1c2luZyB0aGUNCj4gPiBjaGVja2VyIG5vdCBhcyBhIG1h
bmRhdG9yeSBjaGVjaywgYnV0IGFzIGFuIGluZGljYXRpb24gdG8gdGhlIGF1dGhvciBvZg0KPiA+
IHBvc3NpYmxlIGZvcm1hdHRpbmcgZXJyb3JzIHRoYXQgaGUgY2FuIGNvcnJlY3Qgb3IgaWdub3Jl
Lg0KPg0KPiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgc2hvcnQgdGVybSB3ZSB3b3VsZCB3YW50IHRv
IG1ha2UgaXQgb3B0aW9uYWwgc28gDQo+IGVpdGhlciB0aGUgY29kaW5nIHN0eWxlIG9yIHRoZSBj
aGVja2VyIGNhbiBiZSB0dW5lZC4gQnV0IEkgZG9uJ3QgdGhpbmsgDQo+IHRoaXMgaXMgYW4gaWRl
YWwgc2l0dWF0aW9uIHRvIGJlIGluIGxvbmcgdGVybS4NCj4NCj4gVGhlIGdvYWwgb2YgdGhlIGNo
ZWNrZXIgaXMgdG8gYXV0b21hdGljYWxseSB2ZXJpZnkgdGhlIGNvZGluZyBzdHlsZSBhbmQgDQo+
IGdldCBpdCBjb25zaXN0ZW50IGFjcm9zcyBYZW4uIElmIHdlIG1ha2UgaXQgb3B0aW9uYWwgb3Ig
aXQgaXMgDQo+ICJ1bnJlbGlhYmxlIiwgdGhlbiB3ZSBsb3NlIHRoZSB0d28gYmVuZWZpdHMgYW5k
IHBvc3NpYmx5IGluY3JlYXNlIHRoZSANCj4gY29udHJpYnV0b3IgZnJ1c3RyYXRpb24gYXMgdGhl
IGNoZWNrZXIgd291bGQgc2F5IEEgYnV0IHdlIG5lZWQgQi4NCj4NCj4gVGhlcmVmb3JlLCB3ZSBu
ZWVkIHRvIG1ha2Ugc3VyZSB0aGUgY2hlY2tlciBhbmQgdGhlIGNvZGluZyBzdHlsZSBtYXRjaC4g
DQo+IEkgZG9uJ3QgaGF2ZSBhbnkgb3BpbmlvbnMgb24gdGhlIGFwcHJvYWNoIHRvIGFjaGlldmUg
dGhhdC4NCg0KT2YgdGhlIGxpc3Qgb2YgcmVtYWluaW5nIGlzc3VlcyBmcm9tIEFuYXN0YXNpaWEs
IGxvb2tzIGxpa2Ugb25seSBpdGVtcyA1DQphbmQgNiBhcmUgY29uZm9ybSB0byBvZmZpY2lhbCBY
ZW4gY29kaW5nIHN0eWxlLiBBcyBmb3IgcmVtYWlubmluZyBvbmVzLA0KSSB3b3VsZCBsaWtlIHRv
IHN1Z2dlc3QgZGlzYWJsaW5nIHRob3NlIHRoYXQgYXJlIGNvbnRyb3ZlcnNpYWwgKGl0ZW1zIDEs
DQoyLCA0LCA4LCA5LCAxMCkuIE1heWJlIHdlIHdhbnQgdG8gaGF2ZSBmdXJ0aGVyIGRpc2N1c3Np
b24gb24gcmVmaW5pbmcgDQpjb2Rpbmcgc3R5bGUsIHdlIGNhbiB1c2UgdGhlc2UgYXMgc3RhcnRp
bmcgcG9pbnQuIElmIHdlIGFyZSBvcGVuIHRvDQpleHRlbmRpbmcgc3R5bGUgbm93LCBJIHdvdWxk
IHN1Z2dlc3QgdG8gYWRkIHJ1bGVzIHRoYXQgc2VlbSB0byBiZQ0KbWVhbmluZ2Z1bCAoaXRlbXMg
MywgNykgYW5kIGtlZXAgdGhlbSBpbiBjaGVja2VyLg0KDQotLSBBcnRlbQ0K

