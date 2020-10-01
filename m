Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220327FC32
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 11:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132.3721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuXS-0005zX-9m; Thu, 01 Oct 2020 09:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132.3721; Thu, 01 Oct 2020 09:06:10 +0000
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
	id 1kNuXS-0005z8-6Q; Thu, 01 Oct 2020 09:06:10 +0000
Received: by outflank-mailman (input) for mailman id 1132;
 Thu, 01 Oct 2020 09:06:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ighY=DI=epam.com=prvs=854382b084=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kNuXQ-0005z1-E7
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:06:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c53b9c4-648c-4e1a-8b6a-7eb57b4ec612;
 Thu, 01 Oct 2020 09:06:07 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 091960d3022678; Thu, 1 Oct 2020 09:06:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0b-0039f301.pphosted.com with ESMTP id 33w0f19b8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 09:06:05 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM6PR0302MB3445.eurprd03.prod.outlook.com (2603:10a6:209:1b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 09:06:02 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 09:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ighY=DI=epam.com=prvs=854382b084=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kNuXQ-0005z1-E7
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:06:08 +0000
X-Inumbo-ID: 2c53b9c4-648c-4e1a-8b6a-7eb57b4ec612
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c53b9c4-648c-4e1a-8b6a-7eb57b4ec612;
	Thu, 01 Oct 2020 09:06:07 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 091960d3022678;
	Thu, 1 Oct 2020 09:06:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
	by mx0b-0039f301.pphosted.com with ESMTP id 33w0f19b8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2020 09:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8kFqoiEMbrQZ8knMQOSDTKVxcA/kj0WUiJQCSKLhmJR8WfD7sx4e4phkqEhadmxj9CNfWGPvt1JM0Jidq1bpbbRHrJCUWo0GbO/hDCPG0YZbQrbR8tbyJNr0GYdWB5u7u+FYrMHfFGRY/I51VW5hJ0PVDqQib4u4I9jvdrVW+bM4RVd5PT0W/2xdFEhwG8aJNDQZzYELjx4AUvi7mjMjRNzNnyfIi4ps8Mw+FAwIhcnGtyJVu2zW9V3772dMAGgjRcc8dysKaszSFo+b8BhBm3rc2myNDnmYGsvTGoTlaWwyt3reyLB7aLv5KP2nDJPDknr7WdH+gGTc/rsYXEpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4doJ2qYtM5XtWt+iExX4kzM70iPQkK6QRgn3W6ui5bA=;
 b=D2NxG27ns2tvzZ6OpYyzQHGwh6C8dkBuXhSEEOXIlKFCwfo3+G10nMC/KsprtavSU9SDaaKLqYmhGovMFdBZtE6wJlukz5OTZkFj+ujB6n1Bvn5wnfXe22aYP/aaAqB7b0JMW8ucYL/sXp2u721G1uupogoVASqJTE3nQYnZdm7Jv93eHTtPO1nQur/l785WawUt+9mAfNwDAYBCZhsofAkRJQsBwmYrk8flWyyDTc/644XYlY+H4lds8gEFm9hRXEalviRNMeUJ+UUuHN238PwiW6J55TwdRDzspz6ac3hTCJgkQxMSiPNVInd1Kow9CsbdgyI4AR8D2m4nO+f+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4doJ2qYtM5XtWt+iExX4kzM70iPQkK6QRgn3W6ui5bA=;
 b=o9bQTVvP13/ZB88/5Mt4y9eg4YWGuEm8UeHYqtKqTj5dIj4ydEFoYjTT0aeoNoei60vJodW8GkhvDhWFSuSu8FFMyWZV922bzml/z2VuwLiO60BT7COjLDNEXuJyBWLTZiynu6iKB52RCVqulzEBqcB5HbNbC1slIMfJmtxG3wdqsXbnUqEwyG9kdu6wHW5t86M/EKG7haek4EoA66cwLVRYqsthQ6SXDHLZNnxoHXjD0P0Junz+i73XeFvyGQDNileTcAMzDILQiGmfJMU5q1CnDG5P1MHRQ6Qd2RIv4qHgEYPoyubBbyjygNCMD1gMWDQYQt6AkhQvDlbecddC5w==
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM6PR0302MB3445.eurprd03.prod.outlook.com (2603:10a6:209:1b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 09:06:02 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 09:06:02 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>,
        "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>
CC: Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "committers@xenproject.org"
	<committers@xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "vicooodin@gmail.com" <vicooodin@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "viktor.mitin.19@gmail.com"
	<viktor.mitin.19@gmail.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAA==
Date: Thu, 1 Oct 2020 09:06:02 +0000
Message-ID: <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
	 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
	 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
In-Reply-To: <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82db19e4-f993-4154-825f-08d865e938e7
x-ms-traffictypediagnostic: AM6PR0302MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM6PR0302MB34458431BA9B79EF93DB9433F2300@AM6PR0302MB3445.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8sq3aTegJqMFZU/f7zQig+7Rhq9GPzi6KfPO4TLrILwwuThP8WoaZidnGStRUY+RJJR68/FTny3VByok7hVulRPyl4rIEl/wrLlkH5ANTIlVSltpL4VR1R8NEldDq+789YpNbnFQY48jrqjTVzfP+K5lNE7iUUI4NTa7755zrfGD9tBvxPKYVUCAlT8i/aWsIvAXdZs41UvdfdPt5WWMtgK1r6QXWHTJhrwqjFP4HeNaJvMm3UKmatytincuOE7Rc/k6/nmEWUqB2UzyPw6BDJ1NjzF+NeXJCT2DJS62lWDaFMmmOsje0Pw0r56iJ6LV6PS/WqPpIMjqFg045NWPAQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(54906003)(2616005)(91956017)(66946007)(4326008)(71200400001)(64756008)(316002)(76116006)(110136005)(6486002)(6506007)(53546011)(8936002)(86362001)(36756003)(5660300002)(66476007)(66446008)(66556008)(107886003)(8676002)(6512007)(186003)(55236004)(2906002)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 UcCEUmGzWzNYd0YxhsHHiARhr49ynTXtseGH796RzcCWFCNfd6+ufiCWRZ/2dzyZqaGcOWKe+J1QAIKo3RCQSUoPHQ6YjN59ruyBLW9HJ/1ouoNagyGMpOf26Tb0H4wNkvbnfk81nLrzlcTYajdlTM5JiaOdElhmw9Xvo3eJQgKczwOsCR02f60YhSw7shMuTT76OpU1NRwXrZahb6DBatBcUWGWr7h8aGIhTrqa0v6zrqXB51DF6gAjDGvmfzW4JoagCNLTYWwcYnyQ+LX9BshCixdZdK7YVqXeOUn3K8h28fUfcoMOWxjFpiMRrOgUhEdqLJKUWsPA47eXbq1tQUdo4ZKUxqvDXqTS6SqsEEY9GlOtLGa7YxPcxDuiLJha6HxUoW7r7dhGC+lXgzpDXkdJvyjUQJsgz5xGixvIjXP0x6guCo+8QJ4ocvsvtIajO5z1P8SWA3dJdWUvxN6klMIotDFLP7RbdmFLnWLPkP46lt7Jl6CH2MvuJA4a/HUOhqe+ucfBuYh4JVfKT1TICmMFAQIwSbNsb+2wH6wnrV0rt5137rSwirfqVF/iNFgmW4qmdQul8adOgMvGOPIWUKjJQFvdZz8xtYuc+h8j1W0ekR02A+YDXb+UHPATcPOs6BxJOD/MTuKlv6/m4t/WRg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B31A096870AB204CAC770E10381A24A9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82db19e4-f993-4154-825f-08d865e938e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 09:06:02.8102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht5TLRfMAWXfD3sNiPXwe4dzmuzjzMb30r9wDcFjqHF8KQKI21B3+slAmnP8AOVC/vjhfzZXEM7wxs/hc3Xk9G80QRRAWCyAE3kGEZ6KuRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3445
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-01_02:2020-10-01,2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010080

SGksDQoNCk9uIFdlZCwgMjAyMC0wOS0zMCBhdCAxMDoyNCArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToNCj4gPiBPbiBTZXAgMzAsIDIwMjAsIGF0IDEwOjU3IEFNLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4gd3JvdGU6DQo+ID4gDQo+ID4gT24gMzAuMDkuMjAyMCAxMTox
OCwgQW5hc3Rhc2lpYSBMdWtpYW5lbmtvIHdyb3RlOg0KPiA+ID4gSSB3b3VsZCBsaWtlIHRvIGtu
b3cgeW91ciBvcGluaW9uIG9uIHRoZSBmb2xsb3dpbmcgY29kaW5nIHN0eWxlDQo+ID4gPiBjYXNl
cy4NCj4gPiA+IFdoaWNoIG9wdGlvbiBkbyB5b3UgdGhpbmsgaXMgY29ycmVjdD8NCj4gPiA+IDEp
IEZ1bmN0aW9uIHByb3RvdHlwZSB3aGVuIHRoZSBzdHJpbmcgbGVuZ3RoIGlzIGxvbmdlciB0aGFu
IHRoZQ0KPiA+ID4gYWxsb3dlZA0KPiA+ID4gb25lDQo+ID4gPiAtc3RhdGljIGludCBfX2luaXQN
Cj4gPiA+IC1hY3BpX3BhcnNlX2dpY19jcHVfaW50ZXJmYWNlKHN0cnVjdCBhY3BpX3N1YnRhYmxl
X2hlYWRlcg0KPiA+ID4gKmhlYWRlciwNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IGFj
cGlfcGFyc2VfZ2ljX2NwdV9pbnRlcmZhY2UoDQo+ID4gPiArICAgIHN0cnVjdCBhY3BpX3N1YnRh
YmxlX2hlYWRlciAqaGVhZGVyLCBjb25zdCB1bnNpZ25lZCBsb25nDQo+ID4gPiBlbmQpDQo+ID4g
DQo+ID4gQm90aCB2YXJpYW50cyBhcmUgZGVlbWVkIHZhbGlkIHN0eWxlLCBJIHRoaW5rIChzYW1l
IGFsc28gZ29lcyBmb3INCj4gPiBmdW5jdGlvbiBjYWxscyB3aXRoIHRoaXMgc2FtZSBwcm9ibGVt
KS4gSW4gZmFjdCB5b3UgbWl4IHR3bw0KPiA+IGRpZmZlcmVudCBzdHlsZSBhc3BlY3RzIHRvZ2V0
aGVyIChwbGFjZW1lbnQgb2YgcGFyYW1ldGVyDQo+ID4gZGVjbGFyYXRpb25zIGFuZCBwbGFjZW1l
bnQgb2YgcmV0dXJuIHR5cGUgZXRjKSAtIGZvciBlYWNoDQo+ID4gaW5kaXZpZHVhbGx5IGJvdGgg
Zm9ybXMgYXJlIGRlZW1lZCBhY2NlcHRhYmxlLCBJIHRoaW5rLg0KPiANCj4gSWYgd2XigJlyZSBn
b2luZyB0byBoYXZlIGEgdG9vbCBnbyB0aHJvdWdoIGFuZCByZXBvcnQgKGNvcnJlY3Q/KSBhbGwN
Cj4gdGhlc2UgY29kaW5nIHN0eWxlIHRoaW5ncywgaXTigJlzIGFuIG9wcG9ydHVuaXR5IHRvIHRo
aW5rIGlmIHdlIHdhbnQgdG8NCj4gYWRkIG5ldyBjb2Rpbmcgc3R5bGUgcmVxdWlyZW1lbnRzIChv
ciBjaGFuZ2UgZXhpc3RpbmcgcmVxdWlyZW1lbnRzKS4NCj4gDQoNCkkgYW0gcmVhZHkgdG8gZGlz
Y3VzcyBuZXcgcmVxdWlyZW1lbnRzIGFuZCBpbXBsZW1lbnQgdGhlbSBpbiBydWxlcyBvZg0KdGhl
IFhlbiBDb2Rpbmcgc3R5bGUgY2hlY2tlci4NCg0KPiAgLUdlb3JnZQ0KDQpSZWdhcmRzLA0KQW5h
c3Rhc2lpYQ0K

