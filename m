Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD124B8CA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8ijO-0001G7-JM; Thu, 20 Aug 2020 11:27:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX0G=B6=epam.com=prvs=65010a7043=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1k8ijM-0001G2-M1
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:27:40 +0000
X-Inumbo-ID: 11d49223-9f17-4989-910a-9e2aec525571
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11d49223-9f17-4989-910a-9e2aec525571;
 Thu, 20 Aug 2020 11:27:39 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KBQYGm031062; Thu, 20 Aug 2020 11:27:37 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0a-0039f301.pphosted.com with ESMTP id 330x6wm39f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 11:27:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9iBC6ROncfY5oB2x1uWZqlcDQ+HFfmsDB1qohnawwCoYe2j25qjgU9Sh5zXyE4YE14JRJsTfP3G4/cnCPWVUu4G37h0qrEyMn0xT95ZkS53oVy7kEefDNZE3zb7Wt5TqzO3rh9jstA8TKb8jdpu2vAHJalPbNVNlQtV4MMeKXPk6yz5ljMlnNo0CD4M0H1pCVi7KyL4nPAywwPDaYwWBOd/BDxQLUY3OMSbE9Xwau8ihFgGVaqubs5TM/qdXe5xtYRHNKMDMaIIj3PexcqJVaBNuYupjE/YhAnkturV6DSg2UShPmdqLMj+fFjJZw9v7ce0rpJijRgIxuqxLTkS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1ypKjiIQTjQ7BvzCv83/urzdOxzndZ6G4zxaiXelns=;
 b=WDHLn8U0m8iQkMfcvlWKQN8Umu2OalzPzKbXaTwi8UhBbIpz4QkNXYG9rOL02YUFtTasQ7l/6dvy7Cvo24VsIFBUtc+54BxxJEi48bagXbuxBVhregwK5Ig8Ikq7qvZvFEC64ZG1DAzPOSArc3LIFTd73bwFzp3wpqgcFz6p9j16vDL1F44pjVYUeJOiPVKh+z+xPR6lhdIiurQkXJND7iLFZE74LctwsRwDaRcALyCzJiJTcumf94LsnsOlQt3FqUxO+Jk17sJN9VYPm3nfteK8aUrJ7yyOhwuSfLbq6eGH4a/smA2r2CUANtw3D4i5MW0dnPBKWfL1u3zz6T7A6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1ypKjiIQTjQ7BvzCv83/urzdOxzndZ6G4zxaiXelns=;
 b=WRTdH5rD5XIT2ji9Mof7doa1NPiW0cdVk2H16dfNnN98pLnp7jlaYmc6ZYfK/eLEjAi3E1MgKEcFZNByrhMa4NgVhinWifXKlQpkn/JaIqANbmS/KdUHZgqiMnXZX2Pdp7PqigM7cu4VZ+68ZDu7cOqjKCNvO7ekEOZUnf9euL8mbrqCe3VQzeApXQFnm9XXsXJAVjRfUo/4ZG/Ct/rDO+QIPMkzAYEUMbiYS5+LbUu5g526wV/+kGCmt9vNQVkSYxLIC8MWWbT1AT+E7wpxgyiG6/bCOMnQhxi8bxWM1TsVdO+KfCKkXFRQ+vLw1gfW7SH6uoUG+wV4hBeO+5b5YQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3281.eurprd03.prod.outlook.com (2603:10a6:208:a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Thu, 20 Aug
 2020 11:27:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7%8]) with mapi id 15.20.3305.025; Thu, 20 Aug 2020
 11:27:33 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Roman Shaposhnik <roman@zededa.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "vicooodin@gmail.com"
 <vicooodin@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: u-boot vs. uefi as boot loaders on ARM
Thread-Topic: u-boot vs. uefi as boot loaders on ARM
Thread-Index: AQHWduTlR9y1WkQPUkq3XmaI+hJKmA==
Date: Thu, 20 Aug 2020 11:27:33 +0000
Message-ID: <d921de55-e26a-e5e7-2a4d-b34fca2e8875@epam.com>
References: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
 <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
 <CAMmSBy92Aiz8btqkEbU9oVJifJ3ft0htPpjObGz-wYVjXuwvoQ@mail.gmail.com>
 <af097943-89fe-76db-54f4-89a3e534d586@xen.org>
In-Reply-To: <af097943-89fe-76db-54f4-89a3e534d586@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f50d90a-950e-4c6f-31d9-08d844fc0897
x-ms-traffictypediagnostic: AM0PR0302MB3281:
x-microsoft-antispam-prvs: <AM0PR0302MB32818CEAC458EA27F608D5B2E75A0@AM0PR0302MB3281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g3vHBIA6k9W+zTbAVycAGv8p/IOrYVKGzNYemgtCqSug4nvW6HSy2S/olAaGlD9t8NjkZRLDjMv0M4hJswClDl3YhFRNurXJBq9+4ibKR85f+YjKfJlXVwK8Ojb2tV5XNQJQMv+osCbXCCLkzdywTd6XNQgqR59WxBX3MWj+B9fzKs27EvUrIOPv0gM4QwegzENs0q5X6oYrhpJYfvsiuKgv4gSgqPISNP59DapQVxEJ7UjVnJ3AzaGLKjnfIUMNO0JqbKc1NGF9Vkjb8nX+NhIjjX0vhXm+8eIGHDKJWNh2fZTjDFWq3i77QVM4yq3l5009/VtIkXZEzXjVTyVQJpzXlTupRaYLgfbj3uoDvsf2V16+Wfgq+ZEKz2di0LKtdEHci29OXUKVnl+M0uea0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(8936002)(31686004)(966005)(2906002)(86362001)(36756003)(186003)(6506007)(8676002)(31696002)(71200400001)(83380400001)(478600001)(53546011)(110136005)(76116006)(91956017)(5660300002)(64756008)(66446008)(66946007)(6486002)(66476007)(6512007)(26005)(316002)(54906003)(4326008)(2616005)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: X98GGlul4obfi62BNE3YMFltAgymQFNkHMuhcaPvXq90C1BaS/OP5uVqN4vAE9x33Wu/k2p98QxNAPhqxUIrhpVbs5qVC6IZ0+zffYtow6QYVLkSBBVF/0rXPPFcTcy9v4aVNgMIGePyyMixK1odCAcTpBp7iX+qjwG7AhdAnZmF5Mhxv77UL0F8yO9LbCsVxvuKpfloD1AMmfPDD+SEDzIGn50d9HkSywhSABBQAI/9OrSKoA5neHzjN0LWgi0gCCgugvb5uAtJZeuMI0HJoX2ZvyfoubYmNZOB/boMMiEZb8Di0oXk26Z40pzoKHY94lqEpa1LyUJNUXLHeDVSJ9BKsZC0oN21VdlEdD6Z8HJ+RyhmUJVgj2iQFKMK/L5rdZ+x27g9eK8XDN9VRXkp+TE0b4iUZiOhLfc+U/CvmkJh3QBlexe+p0xoRrxpYBmjMKIxZdm9j2ju64sNj7WyEln+Ofb6SLyGSudGpGBHdaMXsAhvx4OaAbo8RewNR2H58lC3/P6mUOx50LSlWIPLXaZXrQt4utKfwz5I5qBnZaByjj0ieFUi7A6i5oQM3SiTIblRCEH6tVTlP6X9B4sCaU5XMExi5STQ9yICJMdvwgOKGy6P1KFPxbCvZKDeX96T2PZQNzC+I4u6LNJhcQu1mQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <042FC468D036E14984A02BC9075B5201@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f50d90a-950e-4c6f-31d9-08d844fc0897
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 11:27:33.9021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N46UpqxQJbyvaFJYHD0iLrwyE1BRY74+oVzd81fI2sJOODH81xYING6k5cfXEnmPOuKbIKl2HoEwNndFigoXqMcLq4vygz5fSrYLvs/RxcuvaEfpTET3bgD+j4lsYxfP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3281
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxlogscore=714 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200096
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA4LzIwLzIwIDE6NTAgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgUm9tYW4sDQo+
DQo+IE9uIDE2LzA4LzIwMjAgMjE6NDUsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6DQo+PiBPbiBT
dW4sIEF1ZyAxNiwgMjAyMCBhdCA3OjU0IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
IHdyb3RlOg0KPj4+IE9uIDE1LzA4LzIwMjAgMjE6NDMsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6
DQo+Pj4+IEhpIQ0KPj4+DQo+Pj4gSGksDQo+Pj4NCj4+Pj4gd2l0aCB0aGUgcmVjZW50IGV4Y2Vs
bGVudCB3b3JrIGJ5IEFuYXN0YXNpaWEgY29tbWl0dGVkIHRvIHRoZSB1LWJvb3Qncw0KPj4+PiBt
YWluIGxpbmUsIHdlIG5vdyBoYXZlIHR3byBkaWZmZXJlbnQgd2F5cyBvZiBicmluZ2luZyBBUk0g
RG9tVXMuDQo+Pj4+DQo+Pj4+IElzIHRoZXJlIGFueSBjaGFuY2Ugc29tZW9uZSBjYW4gZWR1Y2F0
ZSB0aGUgZ2VuZXJhbCBwdWJsaWMgb24gcHJvcw0KPj4+PiBhbmQgY29ucyBvZiBib3RoIGFwcHJv
YWNoZXM/DQo+Pj4+DQo+Pj4+IEluIFByb2plY3QgRVZFIHdlJ3JlIHN0aWxsIHVzaW5nIHVlZmkg
b24gQVJNICh0byBzdGF5IGNsb3NlciB0byB0aGUgbW9yZQ0KPj4+PiAiQVJNIGluIHRoZSBjbG91
ZCIgdXNlIGNhc2UpIGJ1dCBwZXJoYXBzIHRoZSBzaXR1YXRpb24gbm93IGlzIG1vcmUNCj4+Pj4g
bnVhbmNlZD8NCj4+Pg0KPj4+IFVFRkkgaXMganVzdCBzdGFuZGFyZCwgc28gSSBhbSBndWVzc2lu
ZyB5b3UgYXJlIHJlZmVycmluZyB0bw0KPj4+IFRpYW5vY29yZS9FREsyLiBhbSBJIGNvcnJlY3Q/
DQo+Pg0KPj4gWWVzLCBidXQgSSB3YXMgYWN0dWFsbHkgcmVmZXJyaW5nIHRvIGJvdGggaW4gYSB3
YXkgKEkgc2hvdWxkJ3ZlIGJlZW4NCj4+IGNsZWFyZXIgdGhvKS4NCj4+IFRvIGJlIG1vcmUgZXhw
bGljaXQgbXkgcXVlc3Rpb24gd2FzIGFyb3VuZCB0cnlpbmcgdG8gY29tcGFyZSBhICJzdGFuZGFy
ZGl6ZWQiDQo+PiB3YXkgb2YgYm90dGluZyBhIGdlbmVyaWMgRG9tVSBvbiBBUk0gKGFuZCB0aGF0
IHN0YW5kYXJkIGlzIFVFRkkgd2l0aCBvbmUNCj4+IHBhcnRpY3VsYXIgaW1wbGVtZW50YXRpb24g
dGhhdCB3b3JrcyBvdXQgb2YgdGhlIGJveCB3aXRoIFhlbiBiZWluZyBUQy9FREsyKSB3aXRoDQo+
PiBhIG1vcmUgYWQtaG9jIHUtYm9vdCBzdHlsZSBvZiBib290aW5nLg0KPj4NCj4+PiBSZWNlbnQg
dmVyc2lvbiBvZiBVLWJvb3QgYXJlIGFsc28gYWJsZSB0byBwYXJ0aWFsbHkgVUVGSS4gVGhpcyBt
ZWFucyB5b3UNCj4+PiBjb3VsZCBlYXNpbHkgdXNlIEdSVUIgd2l0aCBVLWJvb3QuDQo+Pg0KPj4g
WXVwIC0tIHdoaWNoIGNvbXBsaWNhdGVkIHRoaW5ncyBldmVuIG1vcmUuIEFuZCBpdCBpcyBmdW5u
eSB5b3Ugc2hvdWxkIG1lbnRpb24NCj4+IGl0LCBzaW5jZSB3ZSBhY3R1YWxseSBzdGFydGVkIHdp
dGggVEMvRURLMiBmb3IgUmFzcGJlcnJ5UGk0IGFzIGEgYm9hcmQNCj4+IGJvb3Rsb2FkZXIsDQo+
PiBidXQgcXVpY2tseSBzd2l0Y2hlZCB0byB1LWJvb3Qgd2l0aCBVRUZJIHNoaW0gbGF5ZXIsIHNp
bmNlIGl0IHdhcyBtdWNoIHNtYWxsZXIsDQo+PiBiZXR0ZXIgc3VwcG9ydGVkIChzdGlsbD8pIGFu
ZCBnYXZlIHVzIGFsbCB3ZSBuZWVkZWQgdG8gYm9vdCBYZW4gb24gUlBpNCBhcyBhDQo+PiBVRUZJ
IHBheWxvYWQuDQo+Pg0KPj4+IMKgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBVLWJvb3QgaXMganVz
dCBhIGJvb3Rsb2FkZXIuIFRoZXJlZm9yZSBpdCB3aWxsDQo+Pj4gbm90IHByb3ZpZGUgcnVudGlt
ZSBzZXJ2aWNlcyAoc3VjaCBhcyBkYXRlICYgdGltZSkuDQo+Pg0KPj4gSXQgYWN0dWFsbHkgZG9l
cyBwcm92aWRlIHNvbWUgb2YgdGhhdCAoc2VlIGJlbG93KQ0KPg0KPiBDb29sISBBbHRob3VnaCwg
aXQgbG9va3MgbW9zdGx5IHJlbGF0ZWQgdG8gdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIHRob3Vn
aC4NCj4NCj4+DQo+Pj4gRnVydGhlcm1vcmUsIHRoZQ0KPj4+IGludGVyZmFjZSBpcyBsZXNzIHVz
ZXIgZnJpZW5kbHksIHlvdSB3aWxsIGhhdmUgdG8ga25vdyB0aGUgbWVtb3J5IGxheW91dA0KPj4+
IGluIG9yZGVyIHRvIGxvYWQgYmluYXJpZXMuDQo+Pj4NCj4+PiBPbiB0aGUgb3RoZXIgaGFuZCwg
VGlhbm9jb3JlL0VESzIgaXMgdmVyeSBzaW1pbGFyIHRvIHdoYXQgbm9uLWVtYmVkZGVkDQo+Pj4g
bWF5IGJlIHVzZWQgdG8uIEl0IHdpbGwgbm90IHJlcXVpcmUgeW91IHRvIGtub3cgeW91ciBtZW1v
cnkgbGF5b3V0LiBCdXQNCj4+PiB0aGlzIGNvbWVzIGF0IHRoZSBjb3N0IG9mIGEgbW9yZSBjb21w
bGV4IGJvb3Rsb2FkZXIgdG8gZGVidWcuDQo+Pg0KPj4gVGhhdCdzIGxpdGVyYWxseSB0aGUgY3J1
eCBvZiBteSBxdWVzdGlvbiAtLSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IHVzZSBjYXNlcw0K
Pj4gZWl0aGVyIG9uZSBvZiB0aGVtIGlzIG1lYW50IGZvci4gRXNwZWNpYWxseSBnaXZlbiB0aGF0
IHRoaXMgc2hpbSBsYXllciBpcyBub3cNCj4+IHF1aXRlIGNhcGFibGU6DQo+PiBodHRwczovL2dp
dGh1Yi5jb20vQVJNLXNvZnR3YXJlL3UtYm9vdC9ibG9iL21hc3Rlci9kb2MvUkVBRE1FLnVlZmkj
TDEyNw0KPg0KPiBXaGlsZSBJIGNhbiBzZWUgbWFqb3IgZGlmZmVyZW5jZXMgd2hlbiB1c2luZyBl
aXRoZXIgb24gYmFyZW1ldGFsICh5b3UgaGF2ZSBiZXR0ZXIgY29udHJvbCBvbiB0aGUgRGV2aWNl
LVRyZWUgd2l0aCBVLWJvb3QpLCBpdCBpcyBtdWNoIGxlc3MgY2xlYXIgaW4gYSBndWVzdC4gTWF5
YmUgQW5hc3Rhc2lpYSBjYW4gZXhwbGFpbiB3aHkgdGhleSBkZWNpZGVkIHRvIGFkZCBzdXBwb3J0
IGluIFUtYm9vdD8gOikuDQoNCldlbGwsIHRoZXJlIGFyZSBtYW55IFNvQyB2ZW5kb3JzIHByb3Zp
ZGUgdS1ib290IGFzIHRoZWlyIGJvb3QgbG9hZGVyLA0KDQpzbyBpdCB3YXMgbmF0dXJhbCBmb3Ig
dXMgdG8gYWRkIHB2YmxvY2sgdG8gaXQgKFJlbmVzYXMsIFhpbGlueCwgaU1YLCBSUGksIHlvdSBu
YW1lIGl0KS4NCg0KU28gdGhpcyBpcyB0aGUgb25seSByZWFzb24gSSBndWVzcw0KPiBDaGVlcnMs
DQo+DQpSZWdhcmRzLA0KDQpPbGVrc2FuZHINCg==

