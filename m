Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E720C27E559
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 11:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.513.1684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNYaP-0002L1-C0; Wed, 30 Sep 2020 09:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513.1684; Wed, 30 Sep 2020 09:39:45 +0000
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
	id 1kNYaP-0002Kc-8E; Wed, 30 Sep 2020 09:39:45 +0000
Received: by outflank-mailman (input) for mailman id 513;
 Wed, 30 Sep 2020 09:19:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9w3=DH=epam.com=prvs=854240d79b=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kNYGK-0000WB-PY
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:19:01 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98f81a11-4272-4b99-920e-0310a9300fbe;
 Wed, 30 Sep 2020 09:18:59 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08U9FVoD005336; Wed, 30 Sep 2020 09:18:58 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 33v1ddbnc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 09:18:58 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM5PR0301MB2530.eurprd03.prod.outlook.com (2603:10a6:203:a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 09:18:55 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3433.035; Wed, 30 Sep 2020
 09:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=H9w3=DH=epam.com=prvs=854240d79b=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kNYGK-0000WB-PY
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:19:01 +0000
X-Inumbo-ID: 98f81a11-4272-4b99-920e-0310a9300fbe
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 98f81a11-4272-4b99-920e-0310a9300fbe;
	Wed, 30 Sep 2020 09:18:59 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08U9FVoD005336;
	Wed, 30 Sep 2020 09:18:58 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
	by mx0a-0039f301.pphosted.com with ESMTP id 33v1ddbnc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2020 09:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgvsGXPi3tGwXADXixORmba78SPKC2pRNXZ8ABjkia5HO68yR+uQYjcAuv2hnx0oc5vBh/6+vRX8g9z8jbA87s2KAs70WkTUfSXuNtoMkPXrnW+XoXACCUHel7Mqi5xUKVWUOg1LfVHeavRTiXeYFc9Ss0/51c9j81i5EYTOWpKGHCYxpPjPBSSLqTQpNadplh2iRYgD19bXe0Bk4cuva9ragvBt4sTXwXSrjYOOgub8xLzAnecKLSvxDJ8Xuhv1gMBVoKTdNBZll6P17xYG1b+ChR66JulJmRZ72RVBKSRprYbMGpSW7N4OVFq2K3BT7bg7Hjn8tIyth2Ek7B4IqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+en2vUmnSfrEQDW+5ajFkmlchYiLkAw/BRL9zRxswnA=;
 b=j4hgAkf74gMf6vHh7dPtZLcoZUeM0rmN6iYrJnTHlVDdRQuhVO6kz4qdzDPB4lXMlfmEIS8yPhX4fo3afE2CvxnrIemmjiNiY1vXfjfA6f9UKUwwkl1vzymZcQF+Bt9GKWE+rdeDU5Z/HhvAbCVpm0inOeCAxlx60GmpGIWPI3tTvNCIm0FNBdVyKo+CWaQb+gOBGtz40Xutx4ZEqRbpPVfUd3ygVIrAQPwLqwBHjsSku0cZSlQnqfYEDOj3pMInF378r1A0fochoRwOPekTVmo8PZtxxLpwBTXI9d4/Peqk5THSB6p7B+dWdLqCfOw51Wocc1tgijeFa/lw2ozsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+en2vUmnSfrEQDW+5ajFkmlchYiLkAw/BRL9zRxswnA=;
 b=xt5erUQByuMcqjJz8OGmKAhqxhjdFK0FeYCfBztoYrn+s7VnGr+CZg31KAMBgjVxS43Ypsoh/fvrN06qqWyHYYjBfghz0QSXIlN3xJb4ZNrbOw0f0MvjjB+trtGwJ7XMC9LHtqtwxP5A3/2KiMbDYLetO3qYvU2wyzIxHuXphYvOiVc8u9SXfy98BhDwtV5RWXqpZYAgPWFf5DyQuit4kCCOGGUOJzqDRw8AoFrgIOdE+x6IYhDTmVPmT1wkQYe7fKSh0HhZVrbXBdP4VnmOoV5BpUFPlycfyDUm8p7XggjXgwz0+LsRsWrMPc5Vz10VNgO6erMwgy65wnWZL48+lg==
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM5PR0301MB2530.eurprd03.prod.outlook.com (2603:10a6:203:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 09:18:55 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3433.035; Wed, 30 Sep 2020
 09:18:55 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "committers@xenproject.org"
	<committers@xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "vicooodin@gmail.com" <vicooodin@gmail.com>,
        "viktor.mitin.19@gmail.com"
	<viktor.mitin.19@gmail.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: AQHWlwq4nKYEhMN38U+xmvwRsutq+Q==
Date: Wed, 30 Sep 2020 09:18:55 +0000
Message-ID: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41803486-9377-4ad6-250c-08d86521db05
x-ms-traffictypediagnostic: AM5PR0301MB2530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM5PR0301MB2530F70453613502488C170AF2330@AM5PR0301MB2530.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oyHZzIly8vpbY6snm/UpA1sSWHvtFBMil7OAjqNxfma3uWURsJMPMzN8Bx57olKxLenoGYNgPgcc2xNRWmAWw+302HOtS7SwcfEDnB15Oan11TiZpFf+Izzder6Qb13RvY1yKhkzCMnenxoHKNs/PnwPIiqwVTZmWdO/e5TLT9rkdy+pDLacL6a0JnrVRo4P6BorAxWt0QHZ293X8bHaSw+pxiBxkirng34JFcWQKl6ONrkxVjBQ5jS7pUKtvD/3ZdrymvCFQdbz0DqNO7yCw5wR/XGW17zUfe7zrrIqxMuEqsYEYd/LXCDCm0SbxTZszfXVSKDwHQALmURYvW5p5LEcNear816beeyqauw0XTl/t/bdRtZfeXXhqntd8GvLtWxqLOETRSXvZQQfWZPlYg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(76116006)(54906003)(478600001)(26005)(2616005)(966005)(6916009)(5660300002)(186003)(66556008)(66476007)(66946007)(64756008)(66446008)(55236004)(6506007)(86362001)(8936002)(83080400001)(6512007)(71200400001)(316002)(107886003)(4326008)(36756003)(83380400001)(8676002)(2906002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 P13vsRm6BP6Q8l/OqVrhW+s+/NYLtOCg9EKDLCxXg3nOQ3Jm7FY48SgMv0guGkqX8l3eUwu37MO9/2uNrD6o5YCY0jYqJY2SUh9/M1MfUGUAgRp4dVOOSePdqUyOpuFr6Es1rrk2/6fEBRdJ6NFPJpPU7ri515WHuyXhoHYjksF3jzOyVBqrWWM2bVy/DZtH4aJfzUMudfUj/txQEaIL6uuFjQwH9FdkBCBJwrLlrB9xrJhX5dnEvAQlFsOV+WI8tgfRt17elWSWXQfVArBWHwHwQph8PoesB3/eRpTvDi0mprsEltqk5smGY2td08hiDUYXftwrEZaTgBro12F/vF24rxBqH5Vks+ywSlR43Gf5RJRhGe128fgw967Od7IsgWnygtj8xELzeimyj8Ts9/ZYoSaEy+a6V4jUSrhY0hrt6CL7C+DjW/s86i2nFsFlKfY65Uer+wzwGW6hz7R5+lmmDXWGGndq/JL9TNs2kmdJxtet1nIfhwhNCAXna9+UHORxE0iuhFXjdqR6AK4WuDn7rEwE9BcqWl6K0DmW3yajJWf1vkqjuZQtO8VGD/7hs9epzabaYTnzgAFvR9aCqPHztCjQaJnEI0Vh3xPgPvsqJ8aylxMSRX68Nz1TrblDfCI8CrAt79TyGomNHg1k1g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <51338315F8EDD742A2C74624087CF792@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41803486-9377-4ad6-250c-08d86521db05
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 09:18:55.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkIUqL+CAPhWighVp6oBaxDhXn/IfoxMuv90KP7w5ZNgLy3Afc6ZrGfSK9KwLSIdI+0j/yj/ISMavrN6pFXsKlyOYSNgEM2BhK/ciA/WreA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0301MB2530
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-30_05:2020-09-29,2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300074

SGkgYWxsLA0KDQpJIHdvdWxkIGxpa2UgdG8gYnJpbmcgdXAgYSBkaXNjdXNzaW9uIGFib3V0IGEg
WGVuLWNoZWNrZXIgdG9vbCwgdGhlDQpkZXZlbG9wbWVudCBvZiB3aGljaCBoYXMgYmVlbiB0ZW1w
b3JhcmlseSBzdXNwZW5kZWQuIFRoZSBpZGVhIG9mIHRoaXMNCnRvb2wgaXMgdG8gdXNlIHRoZSBj
bGFuZy1mb3JtYXQgYXBwcm9hY2ggYXMgYSBiYXNlIGZvciBYZW4g4oCYY2hlY2twYXRjaOKAmQ0K
cHJvY2Vzcy4gVGhlIG5ldyB0b29sIGNvbnNpc3RzIG9mIG1vZGlmaWVkIGNsYW5nLWZvcm1hdCBi
aW5hcnkgYW5kDQptb2RpZmllZCBjbGFuZy1mb3JtYXQtZGlmZi5weSBweXRob24gc2NyaXB0IHRv
IGF1dG9tYXRlIFhlbiBwYXRjaGVzDQpmb3JtYXQgY2hlY2tpbmcgYW5kIHJlZm9ybWF0dGluZy4g
VGhlIHRvb2wgY2FuIGJlIHVzZWQgYXMgYSBwcmUtY29tbWl0DQpob29rIHRvIGNoZWNrIGFuZCBm
b3JtYXQgZXZlcnkgcGF0Y2ggYXV0b21hdGljYWxseS4NClhlbiBjaGVja2VyIGlzIGN1cnJlbnRs
eSBpbiBhIHN0YXRlIG9mIHRlc3RpbmcsIGJ1dCB0aGVyZSBhcmUNCmNvbnRyb3ZlcnNpYWwgcG9p
bnRzIHJlZ2FyZGluZyB0aGUgY29kaW5nIHN0eWxlIHRoYXQgSSB3b3VsZCBsaWtlIHRvDQpkaXNj
dXNzIHdpdGggdGhlIGNvbW11bml0eSBhbmQgbWFrZSBhIHVuYW5pbW91cyBkZWNpc2lvbiBvbiB0
aGUNCmNvcnJlY3RuZXNzIG9mIHRoZSBmb3JtYXR0aW5nLg0KDQpJIHdvdWxkIGxpa2UgdG8ga25v
dyB5b3VyIG9waW5pb24gb24gdGhlIGZvbGxvd2luZyBjb2Rpbmcgc3R5bGUgY2FzZXMuDQpXaGlj
aCBvcHRpb24gZG8geW91IHRoaW5rIGlzIGNvcnJlY3Q/DQoxKSBGdW5jdGlvbiBwcm90b3R5cGUg
d2hlbiB0aGUgc3RyaW5nIGxlbmd0aCBpcyBsb25nZXIgdGhhbiB0aGUgYWxsb3dlZA0Kb25lDQot
c3RhdGljIGludCBfX2luaXQNCi1hY3BpX3BhcnNlX2dpY19jcHVfaW50ZXJmYWNlKHN0cnVjdCBh
Y3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpDQorc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJz
ZV9naWNfY3B1X2ludGVyZmFjZSgNCisgICAgc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICpo
ZWFkZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQ0KMikgV3JhcHBpbmcgYW4gb3BlcmF0b3Ig
dG8gYSBuZXcgbGluZSB3aGVuIHRoZSBsZW5ndGggb2YgdGhlIGxpbmUgaXMNCmxvbmdlciB0aGFu
IHRoZSBhbGxvd2VkIG9uZQ0KLSAgICBpZiAoIHRhYmxlLT5yZXZpc2lvbiA+IDYNCi0gICAgICAg
ICB8fCAodGFibGUtPnJldmlzaW9uID09IDYgJiYgZmFkdC0+bWlub3JfcmV2aXNpb24gPj0gMCkg
KQ0KKyAgICBpZiAoIHRhYmxlLT5yZXZpc2lvbiA+IDYgfHwNCisgICAgICAgICAodGFibGUtPnJl
dmlzaW9uID09IDYgJiYgZmFkdC0+bWlub3JfcmV2aXNpb24gPj0gMCkgKQ0KMykgZGVmaW5lIGNv
ZGUgc3R5bGUNCi0jZGVmaW5lIEFMTFJFR1MgXA0KLSAgICBDKHIwLHIwX3Vzcik7ICAgQyhyMSxy
MV91c3IpOyAgIEMocjIscjJfdXNyKTsgICBDKHIzLHIzX3Vzcik7ICAgXA0KLSAgICBDKGNwc3Is
Y3BzcikNCisjZGVmaW5lIEFMTFJFR1MgICAgICAgICAgICBcDQorICAgIEMocjAsIHIwX3Vzcik7
ICAgICAgICAgXA0KKyAgICBDKHIxLCByMV91c3IpOyAgICAgICAgIFwNCisgICAgQyhyMiwgcjJf
dXNyKTsgICAgICAgICBcDQo0KSBDb21tZW50IHN0eWxlDQotICAgIC8qIFBDIHNob3VsZCBiZSBh
bHdheXMgYSBtdWx0aXBsZSBvZiA0LCBhcyBYZW4gaXMgdXNpbmcgQVJNDQppbnN0cnVjdGlvbiBz
ZXQgKi8NCisgICAgLyogUEMgc2hvdWxkIGJlIGFsd2F5cyBhIG11bHRpcGxlIG9mIDQsIGFzIFhl
biBpcyB1c2luZyBBUk0NCmluc3RydWN0aW9uIHNldA0KKyAgICAgKi8NCg0KUGxlYXNlIGZpbmQg
YmVsb3cgdGhlIHJlcG8gY3JlYXRlZCBieSBWaWt0b3IgTWl0aW4gd2l0aCB4ZW4gY2xhbmctDQpm
b3JtYXQgdW5kZXIgdGhlIG5leHQgbGluayAoYnJhbmNoIHhlbi1jbGFuZy1mb3JtYXQpOg0KaHR0
cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvbGx2bS1wcm9qZWN0L3RyZWUveGVuLWNsYW5nLWZv
cm1hdA0KDQpUaGUgbmV4dCBzY3JpcHQgY2FuIGJlIHVzZWQgYXMgYW4gZXhhbXBsZSBvZiBob3cg
dG8gYnVpbGQgY2xhbmctZm9ybWF0Og0KDQpodHRwczovL2dpdGh1Yi5jb20vdmlrdG9yLW1pdGlu
L3hlbi1jbGFuZy1mb3JtYXQtZXhhbXBsZS9ibG9iL21hc3Rlci9idWlsZF9jbGFuZ19mb3JtYXQu
c2gNCg0KUmVnYXJkcywNCkFuYXN0YXNpaWEgTHVraWFuZW5rbw0K

