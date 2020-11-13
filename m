Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3BA2B197F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 12:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26341.54640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWqi-0006Ev-98; Fri, 13 Nov 2020 11:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26341.54640; Fri, 13 Nov 2020 11:02:36 +0000
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
	id 1kdWqi-0006EV-5C; Fri, 13 Nov 2020 11:02:36 +0000
Received: by outflank-mailman (input) for mailman id 26341;
 Fri, 13 Nov 2020 11:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdWqg-0006EQ-5F
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:02:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf4d9774-547d-4709-93ee-782e774e4f7b;
 Fri, 13 Nov 2020 11:02:30 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADAuKQd010748; Fri, 13 Nov 2020 11:02:24 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80qqj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 11:02:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6883.eurprd03.prod.outlook.com (2603:10a6:20b:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 11:02:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 11:02:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdWqg-0006EQ-5F
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:02:34 +0000
X-Inumbo-ID: bf4d9774-547d-4709-93ee-782e774e4f7b
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bf4d9774-547d-4709-93ee-782e774e4f7b;
	Fri, 13 Nov 2020 11:02:30 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAuKQd010748;
	Fri, 13 Nov 2020 11:02:24 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80qqj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 11:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQhEXpS/qk9SnX5ac0QHBS2zJbAZkBO/b3eNpLXKyI3BNNoDSt+yvJ5HhQ/IEIxqPFOul4o2jymu+je1rYohdn3Lkz8XgiQDeakhLOa7GV12dgSieVZO6htJ0OJop079oy37zXXGJbZ/0mWF4rBwJHj8zDkyz3E3WW8eEmG+ORNWQesrlQwrYy736NElCUswjNFpdd3Ssrsdks3t4WX5LONPHwXoHFiKlsJT2bOtiV3+Oz5p3u2gx4B8tQKzaabijlrM6/9/Us0K8mXITej1KZg5sjiUoezYTY2eFtz6plb4eoWa0uB7miCqLHnFpR06VoEYIENMmAeqBrCPCVfBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEL+sGuSsto8HF1T0TQocDqYMB5lhW+ndKvHHZ1o/Sw=;
 b=V1JMXNmoc4uy2U0Kci3p1DRvp/OLb8e63FDN2thVYVkfMjaiZGk2xUR7G6tCXlSHeaIpR/MNPgvMWboD9zElWMx2eHV/LGbFJa28yjb/Mn4h9pt3VfuJZ9uucGI4CeIImlbcjHEKiqfqp0KDfegwXwBH3IYQ2wurMQSPfM/+SuS7i2b4trVN/hqE0xVZduVyoacHqBoKG2RNWrTRvEsDo7Vl7uERmr1yc1TFAglQ8LmcZQrDoL/7ff5lgtiRnkS50BY78fF9xbP6K2hntXphA6/3qAlDWgnXF6teg98ZdHXWigTzRXOoEN/gosvOIZv4BrNRHYCHiCR0EUVG5xHceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEL+sGuSsto8HF1T0TQocDqYMB5lhW+ndKvHHZ1o/Sw=;
 b=W/9vPzF3gQgXNvVJduCz4wYVCIZXLPjLeSOOirXZ1uoV2AEeBdZuGcsA74/tjcXinjGwGrPLHiQcO0DD1O4EoXZHCePTGK/clR8NHAPs0npO1sJy5dyVNunqYBwinAscM2yzZykjlr2MjaJQYcAIuwwj5Op929ZMz2ZqHvmjbO6SGG87NDUTE7Dyb9dUrVj2rtcGdb/q6VQmNOHdfSTTeopfaPvkKKQCPU17/bWhJKQJuUPo1jcuDMX0fplQkjK/zadV+eqjViYJfH7jcfRu5uyA65cTPBUq7/WjEozFSlPbWAkyEhy2OxLBIn/DcI2E3tHMQZHmOZZnUC7gJ5ySyg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6883.eurprd03.prod.outlook.com (2603:10a6:20b:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 11:02:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 11:02:21 +0000
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
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgA=
Date: Fri, 13 Nov 2020 11:02:21 +0000
Message-ID: <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
In-Reply-To: <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42f2bd8b-786a-4306-ff8e-08d887c397fb
x-ms-traffictypediagnostic: AM9PR03MB6883:
x-microsoft-antispam-prvs: 
 <AM9PR03MB6883F596FE3676730A79EF39E7E60@AM9PR03MB6883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wp00lF/cPiJ9GuCc/Nn7RXBEuylvszeJlWgF4+7q/fAL+1rvoFmPAldWL46ThD1epSmVKYJuMxiXzkzcvVsSv4cyJVtErC5FZ27qbgnquOF4//mzRHbk8D8yXWj+ep6fJo7vaMYhzAgyUC2jhvbph08XXtGrDlkdxiSxXSBv/txA29hpx4xDb3e/8EDYysjh3Ssta2Fsoq5BJX0uYqTbE1nWWbZpVJnz/dEy3ZdHpVLKeMq+oGZXWdNVXQGfxhOetmziUtswrH8RzOFOxSECZnXHzHPBeKEXhcM/NCqT+2ExQMWD7EWbHHp1jqvP3ubE+eBUU9TRYP6I2NSUxnpucg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(31696002)(76116006)(8936002)(66556008)(66446008)(66476007)(8676002)(4326008)(66946007)(64756008)(86362001)(6916009)(6506007)(7416002)(53546011)(26005)(5660300002)(6486002)(2616005)(83380400001)(31686004)(186003)(71200400001)(6512007)(2906002)(478600001)(54906003)(316002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 CXC5iTxfHqSIbAbvkh/M1VmiD/MBnbp1565KM4by6FSIM/2TvoU+hC0Zffwc4edeWrOS0p3M1MDKA24NPz+/BDdB5uM0PLAPuxuk+wxdG8aDS/udgratdXt12rIuYn+vIoCWoNwH6bldh2clqti1nluCWoquqet19N7Vo0jJMCXFP6t49i7iq5kxuG7roCWhdgnENzpMNKqPOHmRjbK4okcHbxWKUW7ldx8kEpjYsltPLuUhtduorv3Yo9aPzHa8c+S2zepdV0APYEfuAk7qbeF3XUWjzsCvTl0hkuJDcrVgRRmUrdxfGJ0gqHvQirjJHR0S/HFSafccFTpwtfxByzIAcgUUzhlzLZaBUKLjXIpd9IbFnlOT25W28kOdMy8cARss4FKnuqY+B7dLjcfUeCLoXWxHy2/SFWmq2mrckmCIr3l8AhXy4fSmAemVG0vxBr5dRThNVQNkMOjfQS6hUVea3ebuB6RqBC7zuiPNlsCRaZpX1qO+ibBUDfekCR6fHCWDg+8nVKumq5Jtk4UrpPTps7X9ZUI8bOy/8+2IrkPsDBkzCIY1amOUkfMjPeddG3Oda3ntJGaYZvTEyvMJaOW8hT3LIQ7zI8Zne/yOgId1gPSgKZGnP3Wxd4QeyDCjjRIGxQNL/JsZjk5g7AsnGw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FBBF9884848A449A969C373F90AC9C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f2bd8b-786a-4306-ff8e-08d887c397fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 11:02:21.0375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZkTcOUYtbPiT4veCovfIpDkEFoWtOGSJ7RJMiPOs9Nmgx1l8bU5ETVNrh72zrbxLme2YTKQDVHdTwn1jMLwyFGTucaXaLFkRwhW8XAVSZD54vAKSL/tX55bCykj+mTS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6883
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_07:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130067

DQpPbiAxMS8xMy8yMCAxMjo1MCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjExLjIw
MjAgMTE6NDYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTEvMTMvMjAg
MTI6MjUgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEzLjExLjIwMjAgMDc6MzIsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxMS8xMi8yMCA0OjQ2IFBNLCBS
b2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDE6
MTY6MTBQTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gT24g
MTEvMTIvMjAgMTE6NDAgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIE1v
biwgTm92IDA5LCAyMDIwIGF0IDAyOjUwOjI3UE0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBi
YXJfcmVhZF9kaXNwYXRjaChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50
IHJlZywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
ZGF0YSkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqdmJhciwg
KmJhciA9IGRhdGE7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIGlmICggaXNfaGFyZHdhcmVf
ZG9tYWluKGN1cnJlbnQtPmRvbWFpbikgKQ0KPj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIGJhcl9y
ZWFkX2h3ZG9tKHBkZXYsIHJlZywgZGF0YSk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIHZi
YXIgPSBnZXRfdnBjaV9iYXIoY3VycmVudC0+ZG9tYWluLCBwZGV2LCBiYXItPmluZGV4KTsNCj4+
Pj4+Pj4+ICsgICAgaWYgKCAhdmJhciApDQo+Pj4+Pj4+PiArICAgICAgICByZXR1cm4gfjA7DQo+
Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIHJldHVybiBiYXJfcmVhZF9ndWVzdChwZGV2LCByZWcs
IHZiYXIpOw0KPj4+Pj4+Pj4gK30NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICtzdGF0aWMgdm9pZCBi
YXJfd3JpdGVfZGlzcGF0Y2goY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGlu
dCByZWcsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IHZhbCwgdm9pZCAqZGF0YSkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNp
X2JhciAqYmFyID0gZGF0YTsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgaWYgKCBpc19oYXJk
d2FyZV9kb21haW4oY3VycmVudC0+ZG9tYWluKSApDQo+Pj4+Pj4+PiArICAgICAgICBiYXJfd3Jp
dGVfaHdkb20ocGRldiwgcmVnLCB2YWwsIGRhdGEpOw0KPj4+Pj4+Pj4gKyAgICBlbHNlDQo+Pj4+
Pj4+PiArICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqdmJhciA9IGdl
dF92cGNpX2JhcihjdXJyZW50LT5kb21haW4sIHBkZXYsIGJhci0+aW5kZXgpOw0KPj4+Pj4+Pj4g
Kw0KPj4+Pj4+Pj4gKyAgICAgICAgaWYgKCAhdmJhciApDQo+Pj4+Pj4+PiArICAgICAgICAgICAg
cmV0dXJuOw0KPj4+Pj4+Pj4gKyAgICAgICAgYmFyX3dyaXRlX2d1ZXN0KHBkZXYsIHJlZywgdmFs
LCB2YmFyKTsNCj4+Pj4+Pj4+ICsgICAgfQ0KPj4+Pj4+Pj4gK30NCj4+Pj4+Pj4gWW91IHNob3Vs
ZCBhc3NpZ24gZGlmZmVyZW50IGhhbmRsZXJzIGJhc2VkIG9uIHdoZXRoZXIgdGhlIGRvbWFpbiB0
aGF0DQo+Pj4+Pj4+IGhhcyB0aGUgZGV2aWNlIGFzc2lnbmVkIGlzIGEgZG9tVSBvciB0aGUgaGFy
ZHdhcmUgZG9tYWluLCByYXRoZXIgdGhhbg0KPj4+Pj4+PiBkb2luZyB0aGUgc2VsZWN0aW9uIGhl
cmUuDQo+Pj4+Pj4gSG0sIGhhbmRsZXJzIGFyZSBhc3NpZ25lZCBvbmNlIGluIGluaXRfYmFycyBh
bmQgdGhpcyBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZA0KPj4+Pj4+DQo+Pj4+Pj4gZm9yIGh3ZG9t
LCBzbyB0aGVyZSBpcyBubyB3YXkgSSBjYW4gZG8gdGhhdCBmb3IgdGhlIGd1ZXN0cy4gSGVuY2Us
IHRoZSBkaXNwYXRjaGVyDQo+Pj4+PiBJIHRoaW5rIHdlIG1pZ2h0IHdhbnQgdG8gcmVzZXQgdGhl
IHZQQ0kgaGFuZGxlcnMgd2hlbiBhIGRldmljZXMgZ2V0cw0KPj4+Pj4gYXNzaWduZWQgYW5kIGRl
YXNzaWduZWQuDQo+Pj4+IEluIEFSTSBjYXNlIGluaXRfYmFycyBpcyBjYWxsZWQgdG9vIGVhcmx5
OiBQQ0kgZGV2aWNlIGFzc2lnbm1lbnQgaXMgY3VycmVudGx5DQo+Pj4+DQo+Pj4+IGluaXRpYXRl
ZCBieSBEb21haW4tMCcga2VybmVsIGFuZCBpcyBkb25lICpiZWZvcmUqIFBDSSBkZXZpY2VzIGFy
ZSBnaXZlbiBtZW1vcnkNCj4+Pj4NCj4+Pj4gcmFuZ2VzIGFuZCBCQVJzIGFzc2lnbmVkOg0KPj4+
Pg0KPj4+PiBbwqDCoMKgIDAuNDI5NTE0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291
cmNlIFtidXMgMDAtZmZdDQo+Pj4+IFvCoMKgwqAgMC40Mjk1MzJdIHBjaV9idXMgMDAwMDowMDog
cm9vdCBidXMgcmVzb3VyY2UgW2lvIDB4MDAwMC0weGZmZmZmXQ0KPj4+PiBbwqDCoMKgIDAuNDI5
NTU1XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHhmZTIwMDAwMC0w
eGZlM2ZmZmZmXQ0KPj4+PiBbwqDCoMKgIDAuNDI5NTc1XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3Qg
YnVzIHJlc291cmNlIFttZW0gMHgzMDAwMDAwMC0weDM3ZmZmZmZmXQ0KPj4+PiBbwqDCoMKgIDAu
NDI5NjA0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHgzODAwMDAw
MC0weDNmZmZmZmZmIHByZWZdDQo+Pj4+IFvCoMKgwqAgMC40Mjk2NzBdIHBjaSAwMDAwOjAwOjAw
LjA6IGVuYWJsaW5nIEV4dGVuZGVkIFRhZ3MNCj4+Pj4gW8KgwqDCoCAwLjQ1Mzc2NF0gcGNpIDAw
MDA6MDA6MDAuMDogLS0tLS0tLS0tLS0tLS0tLS0tLS0gQlVTX05PVElGWV9BRERfREVWSUNFDQo+
Pj4+DQo+Pj4+IDwgaW5pdF9iYXJzID4NCj4+Pj4NCj4+Pj4gW8KgwqDCoCAwLjQ1Mzc5M10gcGNp
IDAwMDA6MDA6MDAuMDogLS0gSVJRIDANCj4+Pj4gW8KgwqDCoCAwLjQ1ODgyNV0gcGNpIDAwMDA6
MDA6MDAuMDogRmFpbGVkIHRvIGFkZCAtIHBhc3N0aHJvdWdoIG9yIE1TSS9NU0ktWCBtaWdodCBm
YWlsIQ0KPj4+PiBbwqDCoMKgIDAuNDcxNzkwXSBwY2kgMDAwMDowMTowMC4wOiAtLS0tLS0tLS0t
LS0tLS0tLS0tLSBCVVNfTk9USUZZX0FERF9ERVZJQ0UNCj4+Pj4NCj4+Pj4gPCBpbml0X2JhcnMg
Pg0KPj4+Pg0KPj4+PiBbwqDCoMKgIDAuNDcxODIxXSBwY2kgMDAwMDowMTowMC4wOiAtLSBJUlEg
MjU1DQo+Pj4+IFvCoMKgwqAgMC40NzY4MDldIHBjaSAwMDAwOjAxOjAwLjA6IEZhaWxlZCB0byBh
ZGQgLSBwYXNzdGhyb3VnaCBvciBNU0kvTVNJLVggbWlnaHQgZmFpbCENCj4+Pj4NCj4+Pj4gPCBC
QVIgYXNzaWdubWVudHMgYmVsb3cgPg0KPj4+Pg0KPj4+PiBbwqDCoMKgIDAuNDg4MjMzXSBwY2kg
MDAwMDowMDowMC4wOiBCQVIgMTQ6IGFzc2lnbmVkIFttZW0gMHhmZTIwMDAwMC0weGZlMmZmZmZm
XQ0KPj4+PiBbwqDCoMKgIDAuNDg4MjY1XSBwY2kgMDAwMDowMDowMC4wOiBCQVIgMTU6IGFzc2ln
bmVkIFttZW0gMHgzODAwMDAwMC0weDM4MGZmZmZmIHByZWZdDQo+Pj4+DQo+Pj4+IEluIGNhc2Ug
b2YgeDg2IHRoaXMgaXMgcHJldHR5IG11Y2ggb2sgYXMgQkFScyBhcmUgYWxyZWFkeSBpbiBwbGFj
ZSwgYnV0IGZvciBBUk0gd2UNCj4+Pj4NCj4+Pj4gbmVlZCB0byB0YWtlIGNhcmUgYW5kIHJlLXNl
dHVwIHZQQ0kgQkFScyBmb3IgaHdkb20uDQo+Pj4gRXZlbiBvbiB4ODYgdGhlcmUncyBubyBndWFy
YW50ZWUgdGhhdCBhbGwgZGV2aWNlcyBoYXZlIHRoZWlyIEJBUnMgc2V0DQo+Pj4gdXAgYnkgZmly
bXdhcmUuDQo+PiBUaGlzIGlzIHRydWUuIEJ1dCB0aGVyZSB5b3UgY291bGQgaGF2ZSBjb25maWcg
c3BhY2UgdHJhcHBlZCBpbiAieDg2IGdlbmVyaWMgd2F5IiwNCj4+DQo+PiBwbGVhc2UgY29ycmVj
dCBtZSBpZiBJJ20gd3JvbmcgaGVyZQ0KPj4NCj4+PiBJbiBhIHN1YnNlcXVlbnQgcmVwbHkgeW91
J3ZlIHN1Z2dlc3RlZCB0byBtb3ZlIGluaXRfYmFycyBmcm9tICJhZGQiIHRvDQo+Pj4gImFzc2ln
biIsIGJ1dCBJJ20gaGF2aW5nIHRyb3VibGUgc2VlaW5nIHdoYXQgdGhpcyB3b3VsZCBjaGFuZ2U6
IEl0J3MNCj4+PiBub3QgRG9tMCBjb250cm9sbGluZyBhc3NpZ25tZW50ICh0byBpdHNlbGYpLCBi
dXQgWGVuIGFzc2lnbnMgdGhlIGRldmljZQ0KPj4+IHRvd2FyZHMgdGhlIGVuZCBvZiBwY2lfYWRk
X2RldmljZSgpLg0KPj4gUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkIHZzIFhFTl9ET01DVExfYXNz
aWduX2RldmljZQ0KPj4NCj4+IEN1cnJlbnRseSB3ZSBpbml0aWFsaXplIEJBUnMgZHVyaW5nIFBI
WVNERVZPUF9wY2lfZGV2aWNlX2FkZCBhbmQNCj4+DQo+PiBpZiB3ZSBkbyB0aGF0IGR1cmluZyBY
RU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2UgdGhpbmdzIHNlZW0gdG8gY2hhbmdlDQo+IEJ1dCB0aGVy
ZSBjYW4ndCBwb3NzaWJseSBiZSBhbnkgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGludm9sdmVk
IGluDQo+IGJvb3Rpbmcgb2YgRG9tMC4NCg0KSW5kZWVkLiBTbywgZG8geW91IGhhdmUgYW4gaWRl
YSB3aGVuIHdlIHNob3VsZCBjYWxsIGluaXRfYmFycyBzdWl0YWJsZQ0KDQpmb3IgYm90aCBBUk0g
YW5kIHg4Nj8NCg0KQW5vdGhlciBxdWVzdGlvbiBpczogd2hhdCBoYXBwZW5zIGJhZCBpZiB4ODYg
YW5kIEFSTSB3b24ndCBjYWxsIGluaXRfYmFycw0KDQp1bnRpbCB0aGUgbW9tZW50IHdlIHJlYWxs
eSBhc3NpZ24gYSBQQ0kgZGV2aWNlIHRvIHRoZSBmaXJzdCBndWVzdD8NCg0KPg0KPj4+Pj4gICAg
IEluIG9yZGVyIHRvIGRvIHBhc3N0aHJvdWdoIHRvIGRvbVVzIHNhZmVseQ0KPj4+Pj4gd2Ugd2ls
bCBoYXZlIHRvIGFkZCBtb3JlIGhhbmRsZXJzIHRoYW4gd2hhdCdzIHJlcXVpcmVkIGZvciBkb20w
LA0KPj4+PiBDYW4geW91IHBsZWFzZSB0ZWxsIHdoYXQgYXJlIHRoaW5raW5nIGFib3V0PyBXaGF0
IGFyZSB0aGUgbWlzc2luZyBoYW5kbGVycz8NCj4+Pj4+ICAgICBhbmQNCj4+Pj4+IGhhdmluZyBp
c19oYXJkd2FyZV9kb21haW4gc3ByaW5rbGVkIGluIGFsbCBvZiB0aGVtIGlzIG5vdCBhIHN1aXRh
YmxlDQo+Pj4+PiBzb2x1dGlvbi4NCj4+Pj4gSSdsbCB0cnkgdG8gcmVwbGFjZSBpc19oYXJkd2Fy
ZV9kb21haW4gd2l0aCBzb21ldGhpbmcgbGlrZToNCj4+Pj4NCj4+Pj4gKy8qDQo+Pj4+ICsgKiBE
ZXRlY3Qgd2hldGhlciBwaHlzaWNhbCBQQ0kgZGV2aWNlcyBpbiB0aGlzIHNlZ21lbnQgYmVsb25n
DQo+Pj4+ICsgKiB0byB0aGUgZG9tYWluIGdpdmVuLCBlLmcuIG9uIHg4NiBhbGwgUENJIGRldmlj
ZXMgbGl2ZSBpbiBod2RvbSwNCj4+Pj4gKyAqIGJ1dCBpbiBjYXNlIG9mIEFSTSB0aGlzIG1pZ2h0
IG5vdCBiZSB0aGUgY2FzZTogdGhvc2UgbWF5IGFsc28NCj4+Pj4gKyAqIGxpdmUgaW4gZHJpdmVy
IGRvbWFpbnMgb3IgZXZlbiBYZW4gaXRzZWxmLg0KPj4+PiArICovDQo+Pj4+ICtib29sIHBjaV9p
c19oYXJkd2FyZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZykNCj4+Pj4gK3sNCj4+
Pj4gKyNpZmRlZiBDT05GSUdfWDg2DQo+Pj4+ICvCoMKgwqAgcmV0dXJuIGlzX2hhcmR3YXJlX2Rv
bWFpbihkKTsNCj4+Pj4gKyNlbGlmIENPTkZJR19BUk0NCj4+Pj4gK8KgwqDCoCByZXR1cm4gcGNp
X2lzX293bmVyX2RvbWFpbihkLCBzZWcpOw0KPj4+PiArI2Vsc2UNCj4+Pj4gKyNlcnJvciAiVW5z
dXBwb3J0ZWQgYXJjaGl0ZWN0dXJlIg0KPj4+PiArI2VuZGlmDQo+Pj4+ICt9DQo+Pj4+ICsNCj4+
Pj4gKy8qDQo+Pj4+ICsgKiBHZXQgZG9tYWluIHdoaWNoIG93bnMgdGhpcyBzZWdtZW50OiBmb3Ig
eDg2IHRoaXMgaXMgYWx3YXlzIGhhcmR3YXJlDQo+Pj4+ICsgKiBkb21haW4gYW5kIGZvciBBUk0g
dGhpcyBjYW4gYmUgZGlmZmVyZW50Lg0KPj4+PiArICovDQo+Pj4+ICtzdHJ1Y3QgZG9tYWluICpw
Y2lfZ2V0X2hhcmR3YXJlX2RvbWFpbih1MTYgc2VnKQ0KPj4+PiArew0KPj4+PiArI2lmZGVmIENP
TkZJR19YODYNCj4+Pj4gK8KgwqDCoCByZXR1cm4gaGFyZHdhcmVfZG9tYWluOw0KPj4+PiArI2Vs
aWYgQ09ORklHX0FSTQ0KPj4+PiArwqDCoMKgIHJldHVybiBwY2lfZ2V0X293bmVyX2RvbWFpbihz
ZWcpOw0KPj4+PiArI2Vsc2UNCj4+Pj4gKyNlcnJvciAiVW5zdXBwb3J0ZWQgYXJjaGl0ZWN0dXJl
Ig0KPj4+PiArI2VuZGlmDQo+Pj4+ICt9DQo+Pj4+DQo+Pj4+IFRoaXMgaXMgd2hhdCBJIHVzZSB0
byBwcm9wZXJseSBkZXRlY3QgdGhlIGRvbWFpbiB0aGF0IHJlYWxseSBvd25zIHBoeXNpY2FsIGhv
c3QgYnJpZGdlDQo+Pj4gSSBjb25zaWRlciB0aGlzIHByb2JsZW1hdGljLiBXZSBzaG91bGQgdHJ5
IHRvIG5vdCBsZXQgQXJtJ3MgYW5kIHg4Nidlcw0KPj4+IFBDSSBpbXBsZW1lbnRhdGlvbnMgZGl2
ZXJnZSB0b28gbXVjaCwgaS5lLiBhdCBsZWFzdCB0aGUgdW5kZXJseWluZyBiYXNpYw0KPj4+IG1v
ZGVsIHdvdWxkIGJldHRlciBiZSBzaW1pbGFyLiBGb3IgZXhhbXBsZSwgaWYgZW50aXJlIHNlZ21l
bnRzIGNhbiBiZQ0KPj4+IGFzc2lnbmVkIHRvIGEgZHJpdmVyIGRvbWFpbiBvbiBBcm0sIHdoeSBz
aG91bGQgdGhlIHNhbWUgbm90IGJlIHBvc3NpYmxlDQo+Pj4gb24geDg2Pw0KPj4gR29vZCBxdWVz
dGlvbiwgcHJvYmFibHkgaW4gdGhpcyBjYXNlIHg4NiA9PSBBUk0gYW5kIEkgY2FuIHVzZQ0KPj4N
Cj4+IHBjaV9pc19vd25lcl9kb21haW4gZm9yIGJvdGggYXJjaGl0ZWN0dXJlcyBpbnN0ZWFkIG9m
IHVzaW5nIGlzX2hhcmR3YXJlX2RvbWFpbiBmb3IgeDg2DQo+Pg0KPj4+IEZ1cnRoZXJtb3JlIEkn
bSBzdXNwaWNpb3VzIGFib3V0IHNlZ21lbnRzIGJlaW5nIHRoZSByaWdodCBncmFudWxhcml0eQ0K
Pj4+IGhlcmUuIE9uIGlhNjQgbXVsdGlwbGUgaG9zdCBicmlkZ2VzIGNvdWxkIChhbmQgdHlwaWNh
bGx5IHdvdWxkKSBsaXZlDQo+Pj4gb24gc2VnbWVudCAwLiBJaXJjIEkgaGFkIG9uY2Ugc2VlbiBv
dXRwdXQgZnJvbSBhbiB4ODYgc3lzdGVtIHdoaWNoIHdhcw0KPj4+IGFwcGFyZW50bHkgbGFpZCBv
dXQgc2ltaWxhcmx5LiBUaGVyZWZvcmUsIGp1c3QgbGlrZSBmb3IgTUNGRywgSSB0aGluaw0KPj4+
IHRoZSBncmFudWxhcml0eSB3YW50cyB0byBiZSBidXMgcmFuZ2VzIHdpdGhpbiBhIHNlZ21lbnQu
DQo+PiBDYW4geW91IHBsZWFzZSBzdWdnZXN0IHNvbWV0aGluZyB3ZSBjYW4gdXNlIGFzIGEgaGlu
dCBmb3Igc3VjaCBhIGRldGVjdGlvbiBsb2dpYz8NCj4gVGhlIHVuZGVybHlpbmcgaW5mb3JtYXRp
b24gY29tZXMgZnJvbSBBQ1BJIHRhYmxlcywgaWlyYy4gSSBkb24ndA0KPiByZWNhbGwgdGhlIGRl
dGFpbHMsIHRob3VnaCAtIHNvcnJ5Lg0KDQpPaywgc28gc2VnICsgYnVzIHNob3VsZCBiZSBlbm91
Z2ggZm9yIGJvdGggQVJNIGFuZCBYZW4gdGhlbiwgcmlnaHQ/DQoNCnBjaV9nZXRfaGFyZHdhcmVf
ZG9tYWluKHUxNiBzZWcsIHU4IGJ1cykNCg0KPg0KPiBKYW4NCg0KVGhhbmsgeW91LA0KDQpPbGVr
c2FuZHINCg==

