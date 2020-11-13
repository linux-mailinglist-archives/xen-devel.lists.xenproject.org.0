Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D986B2B1951
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26303.54573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWbS-0003um-LI; Fri, 13 Nov 2020 10:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26303.54573; Fri, 13 Nov 2020 10:46:50 +0000
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
	id 1kdWbS-0003uN-H7; Fri, 13 Nov 2020 10:46:50 +0000
Received: by outflank-mailman (input) for mailman id 26303;
 Fri, 13 Nov 2020 10:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdWbQ-0003uI-KH
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:46:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae06d3eb-c932-4343-ae06-47ce1bee7be3;
 Fri, 13 Nov 2020 10:46:47 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADAeQXZ025774; Fri, 13 Nov 2020 10:46:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0b-0039f301.pphosted.com with ESMTP id 34rf7yg1fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 10:46:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7122.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:46:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:46:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdWbQ-0003uI-KH
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:46:48 +0000
X-Inumbo-ID: ae06d3eb-c932-4343-ae06-47ce1bee7be3
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ae06d3eb-c932-4343-ae06-47ce1bee7be3;
	Fri, 13 Nov 2020 10:46:47 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAeQXZ025774;
	Fri, 13 Nov 2020 10:46:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
	by mx0b-0039f301.pphosted.com with ESMTP id 34rf7yg1fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 10:46:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dc8T5ozEp9nnBTFGk80WxbhNgr8hRnf41mK7wS0OvmzOr+0u4jXNfYfvhgwtvYl3QK+vHQBaOZmC/Mdhu3PVMQqO9JWlalLpIxN1B2grqa5p19VcQWFbXVjP5xQAMYSnJJQ5DrDjWkSkNviw1NfulOUZ5MDvkLOIoJ8lNPQHwyW+GwNIl5TDhEUkTMxrpRw3ebYWd14KhSqK/V/Q/q3XlMB/eI7N3TyHXRt46Y3p5qioGDz76C+xQ0cAneY/MLaZfeyw/Nz13YIJdJYSUO6QnAbmwv+/cKGGiS0AVUWtwYxKSmEt7lx4FOj2YNt4/b8Yx3Uagm6MYYlHNicruX1gXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZiq79gaOgQ3DZieciyOSU0byE85sGosJ0zutjqC+rw=;
 b=P8no0Olw1aD63CcEcgGVUgbWI4mWYHDjjhqXAsbzjVhy4Z6ymrKYMDU6CA5ZqTXDyhxj6oONzstnXF3G/Hcj74jwauezQTV96YulhIRk0/nI6Qz1LZP9iTaB3Brzegp95bDQjxLazEyfcVPUGppKM0jjY5w2BOiwm7KOrOip6bH+6+Inr0IyZ0jtJ3p7j83YMVgbAfEPp899OI/O1Llw9BzqYtSs2sJFyAlQyLnICuQsDOfLIjl500017El2Uj4Fj2W1vw4L/fmtOFiNeQ8THrFEny2y4PLnEXDiDuUmMM5DhLSrYe1sOs2a2+iuJrz9aUgP1Lm3Ed5Z8tojYdhvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZiq79gaOgQ3DZieciyOSU0byE85sGosJ0zutjqC+rw=;
 b=uchJb3YbLQY3teNMCbMNC19/2Y5c8wQCtrpagVf0yQFk6qLr9uytGzUC3ltV9VN8meyG1ebcw1UNv0Qy/tAF4n9l5nURs+rhtKIHheb9vIA+yKyERFRZxgR6fTJljJEQuwi7ufH9LVA3dOEuE/lKhCMDqpoQnKF+F2DR5ve42xhPwOW5f33kboN9YKdJYET6CoEBaiVER9OIN9DntTt9w0P8uTbMZ6pMIuCD6yEhOg7BhZzC8WghM264+UC9cVrus2nRpD92bJ2a3Rr4soKAA/h6xrJp3BSgHCI1H9nFC4ks/QPjvO8JpLP8gvtiv6MZl5z6XHHa4GX1IOjawKcrWQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7122.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:46:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:46:39 +0000
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
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAA==
Date: Fri, 13 Nov 2020 10:46:39 +0000
Message-ID: <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
In-Reply-To: <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b17b7e1-8a9b-4ed4-36e0-08d887c166db
x-ms-traffictypediagnostic: AM9PR03MB7122:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7122EEA5FF20937D033A121BE7E60@AM9PR03MB7122.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Fjk01S1gj1XDy3G9LSvTNUftfpeUHwvTGSsyY+y3YoZZCu5dD6ScQ3Br5YC7YNtVqtJK5fbXBlQNdtVgmhtXxp52iMOG6AE1AiOYfW46oSaqjyujwerVUej/GIDdi04iEU8xR6VCmUnb6imJd5Rz5DLKNBNnUlzQGAhr4Kc4i2hvlR1U3YXPV1dlKH2aI5stWPPHv4KWUMhxz5Gb/HAx5IDVIrNJ7U2zH2FE87CWF2KZifICqZrEkllgdyELW2eVWflP2Tw0BLfpt1L6zFRlSmBRTEse88EMSbHKt7Pl7tM39JzNLPq2JBwIeZwunhW9IGSPhiuLRK1sWFzxlDmJaQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(6506007)(64756008)(6512007)(8676002)(478600001)(66476007)(4326008)(186003)(2906002)(86362001)(54906003)(6916009)(26005)(53546011)(7416002)(2616005)(6486002)(31696002)(71200400001)(66556008)(76116006)(66446008)(66946007)(36756003)(83380400001)(5660300002)(8936002)(316002)(31686004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Rs0X4L6xLqVQIMcwveuysdPbVzydUC0oDYOOtg8ZJbydmneDo9C+fC5olUyKIPU5LVSIF4bUKOEPV7z3cp01eN9nPJ3R1U0USecJNn394Jdarv4KX42zCqKzdghDasxUXaMdKd/yDUvuMOvbuXJIyWqqksQlezZGHA89ChU7PT+jhoaNPSp1NVK0uRPSRtrIPjwoNZRZ+HzImaqVFVUftkv3kDioANUhZiLLDbswd/lM4PG2W44IN2Ot1zw0GkWQlt6YeyLYP7la8oL1DX4+X6yIP36OVGjiWUnvQc6krUTE/pnU9nAUk5NR2GkAkE5PC+N1z/Qp6+acGg9fkN2EawJeh0tMC8KnW0v/mrYRci/e7F0i3NRtbgbsZ9Z6t1IqT+itqbwml7+DTw7chCpl3vSXwIjer/MvkuY+AEo/4fzIOM63+/YT06FrgRlYqBkIungqVJ3TGJFz/as1SOgpXKNtXrex1CxQ8POqhUsaXal4ni2xMPWYfLbYYW7AuUUSkc7w9Ge9d2NYU5Wl5CAslKPlVjXvZWhGObqt28CN716GiCHAHg5AWwTJi+d+tZ4RU8p3PG9BUns+yob7iM8ikOkW5JI/jJoQTZw8xalOKcclk0EwLnuutz75YdmnE1hE5d666ZI7Pw9WGSeEUa2s2w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <98730055D513364499A86994062CD792@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b17b7e1-8a9b-4ed4-36e0-08d887c166db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 10:46:39.5840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRDTiGejwCbGB1s2EoZHy2quMtGL/6dUf9dAo+Wz8aGAs7idhjc+RuFhrssm++zogmdw3MBKej6ufgC7yZdfTSzGZRT1gTFxEcjt53Qr19eq0l3gYv5gDk2C+kCWiym0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7122
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_07:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130065

DQpPbiAxMS8xMy8yMCAxMjoyNSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjExLjIw
MjAgMDc6MzIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTEvMTIvMjAg
NDo0NiBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUaHUsIE5vdiAxMiwgMjAy
MCBhdCAwMToxNjoxMFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+
Pj4gT24gMTEvMTIvMjAgMTE6NDAgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBP
biBNb24sIE5vdiAwOSwgMjAyMCBhdCAwMjo1MDoyN1BNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBi
YXJfcmVhZF9kaXNwYXRjaChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50
IHJlZywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRh
dGEpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqdmJhciwgKmJhciA9
IGRhdGE7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oY3Vy
cmVudC0+ZG9tYWluKSApDQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIGJhcl9yZWFkX2h3ZG9tKHBk
ZXYsIHJlZywgZGF0YSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgdmJhciA9IGdldF92cGNpX2Jh
cihjdXJyZW50LT5kb21haW4sIHBkZXYsIGJhci0+aW5kZXgpOw0KPj4+Pj4+ICsgICAgaWYgKCAh
dmJhciApDQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIH4wOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAg
IHJldHVybiBiYXJfcmVhZF9ndWVzdChwZGV2LCByZWcsIHZiYXIpOw0KPj4+Pj4+ICt9DQo+Pj4+
Pj4gKw0KPj4+Pj4+ICtzdGF0aWMgdm9pZCBiYXJfd3JpdGVfZGlzcGF0Y2goY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsIHZvaWQgKmRhdGEpDQo+Pj4+Pj4gK3sNCj4+
Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsNCj4+Pj4+PiArDQo+Pj4+Pj4g
KyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pICkNCj4+Pj4+PiAr
ICAgICAgICBiYXJfd3JpdGVfaHdkb20ocGRldiwgcmVnLCB2YWwsIGRhdGEpOw0KPj4+Pj4+ICsg
ICAgZWxzZQ0KPj4+Pj4+ICsgICAgew0KPj4+Pj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAq
dmJhciA9IGdldF92cGNpX2JhcihjdXJyZW50LT5kb21haW4sIHBkZXYsIGJhci0+aW5kZXgpOw0K
Pj4+Pj4+ICsNCj4+Pj4+PiArICAgICAgICBpZiAoICF2YmFyICkNCj4+Pj4+PiArICAgICAgICAg
ICAgcmV0dXJuOw0KPj4+Pj4+ICsgICAgICAgIGJhcl93cml0ZV9ndWVzdChwZGV2LCByZWcsIHZh
bCwgdmJhcik7DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4gK30NCj4+Pj4+IFlvdSBzaG91bGQgYXNz
aWduIGRpZmZlcmVudCBoYW5kbGVycyBiYXNlZCBvbiB3aGV0aGVyIHRoZSBkb21haW4gdGhhdA0K
Pj4+Pj4gaGFzIHRoZSBkZXZpY2UgYXNzaWduZWQgaXMgYSBkb21VIG9yIHRoZSBoYXJkd2FyZSBk
b21haW4sIHJhdGhlciB0aGFuDQo+Pj4+PiBkb2luZyB0aGUgc2VsZWN0aW9uIGhlcmUuDQo+Pj4+
IEhtLCBoYW5kbGVycyBhcmUgYXNzaWduZWQgb25jZSBpbiBpbml0X2JhcnMgYW5kIHRoaXMgZnVu
Y3Rpb24gaXMgb25seSBjYWxsZWQNCj4+Pj4NCj4+Pj4gZm9yIGh3ZG9tLCBzbyB0aGVyZSBpcyBu
byB3YXkgSSBjYW4gZG8gdGhhdCBmb3IgdGhlIGd1ZXN0cy4gSGVuY2UsIHRoZSBkaXNwYXRjaGVy
DQo+Pj4gSSB0aGluayB3ZSBtaWdodCB3YW50IHRvIHJlc2V0IHRoZSB2UENJIGhhbmRsZXJzIHdo
ZW4gYSBkZXZpY2VzIGdldHMNCj4+PiBhc3NpZ25lZCBhbmQgZGVhc3NpZ25lZC4NCj4+IEluIEFS
TSBjYXNlIGluaXRfYmFycyBpcyBjYWxsZWQgdG9vIGVhcmx5OiBQQ0kgZGV2aWNlIGFzc2lnbm1l
bnQgaXMgY3VycmVudGx5DQo+Pg0KPj4gaW5pdGlhdGVkIGJ5IERvbWFpbi0wJyBrZXJuZWwgYW5k
IGlzIGRvbmUgKmJlZm9yZSogUENJIGRldmljZXMgYXJlIGdpdmVuIG1lbW9yeQ0KPj4NCj4+IHJh
bmdlcyBhbmQgQkFScyBhc3NpZ25lZDoNCj4+DQo+PiBbwqDCoMKgIDAuNDI5NTE0XSBwY2lfYnVz
IDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtidXMgMDAtZmZdDQo+PiBbwqDCoMKgIDAuNDI5
NTMyXSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAweDAwMDAtMHhmZmZm
Zl0NCj4+IFvCoMKgwqAgMC40Mjk1NTVdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3Vy
Y2UgW21lbSAweGZlMjAwMDAwLTB4ZmUzZmZmZmZdDQo+PiBbwqDCoMKgIDAuNDI5NTc1XSBwY2lf
YnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHgzMDAwMDAwMC0weDM3ZmZmZmZm
XQ0KPj4gW8KgwqDCoCAwLjQyOTYwNF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJj
ZSBbbWVtIDB4MzgwMDAwMDAtMHgzZmZmZmZmZiBwcmVmXQ0KPj4gW8KgwqDCoCAwLjQyOTY3MF0g
cGNpIDAwMDA6MDA6MDAuMDogZW5hYmxpbmcgRXh0ZW5kZWQgVGFncw0KPj4gW8KgwqDCoCAwLjQ1
Mzc2NF0gcGNpIDAwMDA6MDA6MDAuMDogLS0tLS0tLS0tLS0tLS0tLS0tLS0gQlVTX05PVElGWV9B
RERfREVWSUNFDQo+Pg0KPj4gPCBpbml0X2JhcnMgPg0KPj4NCj4+IFvCoMKgwqAgMC40NTM3OTNd
IHBjaSAwMDAwOjAwOjAwLjA6IC0tIElSUSAwDQo+PiBbwqDCoMKgIDAuNDU4ODI1XSBwY2kgMDAw
MDowMDowMC4wOiBGYWlsZWQgdG8gYWRkIC0gcGFzc3Rocm91Z2ggb3IgTVNJL01TSS1YIG1pZ2h0
IGZhaWwhDQo+PiBbwqDCoMKgIDAuNDcxNzkwXSBwY2kgMDAwMDowMTowMC4wOiAtLS0tLS0tLS0t
LS0tLS0tLS0tLSBCVVNfTk9USUZZX0FERF9ERVZJQ0UNCj4+DQo+PiA8IGluaXRfYmFycyA+DQo+
Pg0KPj4gW8KgwqDCoCAwLjQ3MTgyMV0gcGNpIDAwMDA6MDE6MDAuMDogLS0gSVJRIDI1NQ0KPj4g
W8KgwqDCoCAwLjQ3NjgwOV0gcGNpIDAwMDA6MDE6MDAuMDogRmFpbGVkIHRvIGFkZCAtIHBhc3N0
aHJvdWdoIG9yIE1TSS9NU0ktWCBtaWdodCBmYWlsIQ0KPj4NCj4+IDwgQkFSIGFzc2lnbm1lbnRz
IGJlbG93ID4NCj4+DQo+PiBbwqDCoMKgIDAuNDg4MjMzXSBwY2kgMDAwMDowMDowMC4wOiBCQVIg
MTQ6IGFzc2lnbmVkIFttZW0gMHhmZTIwMDAwMC0weGZlMmZmZmZmXQ0KPj4gW8KgwqDCoCAwLjQ4
ODI2NV0gcGNpIDAwMDA6MDA6MDAuMDogQkFSIDE1OiBhc3NpZ25lZCBbbWVtIDB4MzgwMDAwMDAt
MHgzODBmZmZmZiBwcmVmXQ0KPj4NCj4+IEluIGNhc2Ugb2YgeDg2IHRoaXMgaXMgcHJldHR5IG11
Y2ggb2sgYXMgQkFScyBhcmUgYWxyZWFkeSBpbiBwbGFjZSwgYnV0IGZvciBBUk0gd2UNCj4+DQo+
PiBuZWVkIHRvIHRha2UgY2FyZSBhbmQgcmUtc2V0dXAgdlBDSSBCQVJzIGZvciBod2RvbS4NCj4g
RXZlbiBvbiB4ODYgdGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCBhbGwgZGV2aWNlcyBoYXZlIHRo
ZWlyIEJBUnMgc2V0DQo+IHVwIGJ5IGZpcm13YXJlLg0KDQpUaGlzIGlzIHRydWUuIEJ1dCB0aGVy
ZSB5b3UgY291bGQgaGF2ZSBjb25maWcgc3BhY2UgdHJhcHBlZCBpbiAieDg2IGdlbmVyaWMgd2F5
IiwNCg0KcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nIGhlcmUNCg0KPg0KPiBJbiBhIHN1
YnNlcXVlbnQgcmVwbHkgeW91J3ZlIHN1Z2dlc3RlZCB0byBtb3ZlIGluaXRfYmFycyBmcm9tICJh
ZGQiIHRvDQo+ICJhc3NpZ24iLCBidXQgSSdtIGhhdmluZyB0cm91YmxlIHNlZWluZyB3aGF0IHRo
aXMgd291bGQgY2hhbmdlOiBJdCdzDQo+IG5vdCBEb20wIGNvbnRyb2xsaW5nIGFzc2lnbm1lbnQg
KHRvIGl0c2VsZiksIGJ1dCBYZW4gYXNzaWducyB0aGUgZGV2aWNlDQo+IHRvd2FyZHMgdGhlIGVu
ZCBvZiBwY2lfYWRkX2RldmljZSgpLg0KDQpQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgdnMgWEVO
X0RPTUNUTF9hc3NpZ25fZGV2aWNlDQoNCkN1cnJlbnRseSB3ZSBpbml0aWFsaXplIEJBUnMgZHVy
aW5nIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBhbmQNCg0KaWYgd2UgZG8gdGhhdCBkdXJpbmcg
WEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIHRoaW5ncyBzZWVtIHRvIGNoYW5nZQ0KDQo+DQo+PiBU
aGluZ3MgYXJlIGdldHRpbmcgZXZlbiBtb3JlDQo+Pg0KPj4gY29tcGxpY2F0ZWQgaWYgdGhlIGhv
c3QgUENJIGJyaWRnZSBpcyBub3QgRUNBTSBsaWtlLCBzbyB5b3UgY2Fubm90IHNldCBtbWlvX2hh
bmRsZXJzDQo+Pg0KPj4gYW5kIHRyYXAgaHdkb20ncyBhY2Nlc3MgdG8gdGhlIGNvbmZpZyBzcGFj
ZSB0byB1cGRhdGUgQkFScyBldGMuIFRoaXMgaXMgd2h5IEkgaGF2ZSB0aGF0DQo+Pg0KPj4gdWds
eSBoYWNrIGZvciByY2FyX2dlbjMgdG8gcmVhZCBhY3R1YWwgQkFScyBmb3IgaHdkb20uDQo+IEhv
dyB0byBjb25maWcgc3BhY2UgYWNjZXNzZXMgd29yayB0aGVyZT8gVGhlIGxhdGVzdCBmb3IgTVNJ
L01TSS1YIGl0J2xsDQo+IGJlIGltcGVyYXRpdmUgdGhhdCBYZW4gYmUgYWJsZSB0byBpbnRlcmNl
cHQgY29uZmlnIHNwYWNlIHdyaXRlcy4NCj4NCj4+PiAgICBJbiBvcmRlciB0byBkbyBwYXNzdGhy
b3VnaCB0byBkb21VcyBzYWZlbHkNCj4+PiB3ZSB3aWxsIGhhdmUgdG8gYWRkIG1vcmUgaGFuZGxl
cnMgdGhhbiB3aGF0J3MgcmVxdWlyZWQgZm9yIGRvbTAsDQo+PiBDYW4geW91IHBsZWFzZSB0ZWxs
IHdoYXQgYXJlIHRoaW5raW5nIGFib3V0PyBXaGF0IGFyZSB0aGUgbWlzc2luZyBoYW5kbGVycz8N
Cj4+PiAgICBhbmQNCj4+PiBoYXZpbmcgaXNfaGFyZHdhcmVfZG9tYWluIHNwcmlua2xlZCBpbiBh
bGwgb2YgdGhlbSBpcyBub3QgYSBzdWl0YWJsZQ0KPj4+IHNvbHV0aW9uLg0KPj4gSSdsbCB0cnkg
dG8gcmVwbGFjZSBpc19oYXJkd2FyZV9kb21haW4gd2l0aCBzb21ldGhpbmcgbGlrZToNCj4+DQo+
PiArLyoNCj4+ICsgKiBEZXRlY3Qgd2hldGhlciBwaHlzaWNhbCBQQ0kgZGV2aWNlcyBpbiB0aGlz
IHNlZ21lbnQgYmVsb25nDQo+PiArICogdG8gdGhlIGRvbWFpbiBnaXZlbiwgZS5nLiBvbiB4ODYg
YWxsIFBDSSBkZXZpY2VzIGxpdmUgaW4gaHdkb20sDQo+PiArICogYnV0IGluIGNhc2Ugb2YgQVJN
IHRoaXMgbWlnaHQgbm90IGJlIHRoZSBjYXNlOiB0aG9zZSBtYXkgYWxzbw0KPj4gKyAqIGxpdmUg
aW4gZHJpdmVyIGRvbWFpbnMgb3IgZXZlbiBYZW4gaXRzZWxmLg0KPj4gKyAqLw0KPj4gK2Jvb2wg
cGNpX2lzX2hhcmR3YXJlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnKQ0KPj4gK3sN
Cj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4gK8KgwqDCoCByZXR1cm4gaXNfaGFyZHdhcmVfZG9t
YWluKGQpOw0KPj4gKyNlbGlmIENPTkZJR19BUk0NCj4+ICvCoMKgwqAgcmV0dXJuIHBjaV9pc19v
d25lcl9kb21haW4oZCwgc2VnKTsNCj4+ICsjZWxzZQ0KPj4gKyNlcnJvciAiVW5zdXBwb3J0ZWQg
YXJjaGl0ZWN0dXJlIg0KPj4gKyNlbmRpZg0KPj4gK30NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIEdl
dCBkb21haW4gd2hpY2ggb3ducyB0aGlzIHNlZ21lbnQ6IGZvciB4ODYgdGhpcyBpcyBhbHdheXMg
aGFyZHdhcmUNCj4+ICsgKiBkb21haW4gYW5kIGZvciBBUk0gdGhpcyBjYW4gYmUgZGlmZmVyZW50
Lg0KPj4gKyAqLw0KPj4gK3N0cnVjdCBkb21haW4gKnBjaV9nZXRfaGFyZHdhcmVfZG9tYWluKHUx
NiBzZWcpDQo+PiArew0KPj4gKyNpZmRlZiBDT05GSUdfWDg2DQo+PiArwqDCoMKgIHJldHVybiBo
YXJkd2FyZV9kb21haW47DQo+PiArI2VsaWYgQ09ORklHX0FSTQ0KPj4gK8KgwqDCoCByZXR1cm4g
cGNpX2dldF9vd25lcl9kb21haW4oc2VnKTsNCj4+ICsjZWxzZQ0KPj4gKyNlcnJvciAiVW5zdXBw
b3J0ZWQgYXJjaGl0ZWN0dXJlIg0KPj4gKyNlbmRpZg0KPj4gK30NCj4+DQo+PiBUaGlzIGlzIHdo
YXQgSSB1c2UgdG8gcHJvcGVybHkgZGV0ZWN0IHRoZSBkb21haW4gdGhhdCByZWFsbHkgb3ducyBw
aHlzaWNhbCBob3N0IGJyaWRnZQ0KPiBJIGNvbnNpZGVyIHRoaXMgcHJvYmxlbWF0aWMuIFdlIHNo
b3VsZCB0cnkgdG8gbm90IGxldCBBcm0ncyBhbmQgeDg2J2VzDQo+IFBDSSBpbXBsZW1lbnRhdGlv
bnMgZGl2ZXJnZSB0b28gbXVjaCwgaS5lLiBhdCBsZWFzdCB0aGUgdW5kZXJseWluZyBiYXNpYw0K
PiBtb2RlbCB3b3VsZCBiZXR0ZXIgYmUgc2ltaWxhci4gRm9yIGV4YW1wbGUsIGlmIGVudGlyZSBz
ZWdtZW50cyBjYW4gYmUNCj4gYXNzaWduZWQgdG8gYSBkcml2ZXIgZG9tYWluIG9uIEFybSwgd2h5
IHNob3VsZCB0aGUgc2FtZSBub3QgYmUgcG9zc2libGUNCj4gb24geDg2Pw0KDQpHb29kIHF1ZXN0
aW9uLCBwcm9iYWJseSBpbiB0aGlzIGNhc2UgeDg2ID09IEFSTSBhbmQgSSBjYW4gdXNlDQoNCnBj
aV9pc19vd25lcl9kb21haW4gZm9yIGJvdGggYXJjaGl0ZWN0dXJlcyBpbnN0ZWFkIG9mIHVzaW5n
IGlzX2hhcmR3YXJlX2RvbWFpbiBmb3IgeDg2DQoNCj4NCj4gRnVydGhlcm1vcmUgSSdtIHN1c3Bp
Y2lvdXMgYWJvdXQgc2VnbWVudHMgYmVpbmcgdGhlIHJpZ2h0IGdyYW51bGFyaXR5DQo+IGhlcmUu
IE9uIGlhNjQgbXVsdGlwbGUgaG9zdCBicmlkZ2VzIGNvdWxkIChhbmQgdHlwaWNhbGx5IHdvdWxk
KSBsaXZlDQo+IG9uIHNlZ21lbnQgMC4gSWlyYyBJIGhhZCBvbmNlIHNlZW4gb3V0cHV0IGZyb20g
YW4geDg2IHN5c3RlbSB3aGljaCB3YXMNCj4gYXBwYXJlbnRseSBsYWlkIG91dCBzaW1pbGFybHku
IFRoZXJlZm9yZSwganVzdCBsaWtlIGZvciBNQ0ZHLCBJIHRoaW5rDQo+IHRoZSBncmFudWxhcml0
eSB3YW50cyB0byBiZSBidXMgcmFuZ2VzIHdpdGhpbiBhIHNlZ21lbnQuDQpDYW4geW91IHBsZWFz
ZSBzdWdnZXN0IHNvbWV0aGluZyB3ZSBjYW4gdXNlIGFzIGEgaGludCBmb3Igc3VjaCBhIGRldGVj
dGlvbiBsb2dpYz8NCj4NCj4gSmFuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

