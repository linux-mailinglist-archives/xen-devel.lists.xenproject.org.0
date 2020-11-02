Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A22A247D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 06:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17368.42155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZSmj-0001Nw-Vl; Mon, 02 Nov 2020 05:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17368.42155; Mon, 02 Nov 2020 05:53:41 +0000
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
	id 1kZSmj-0001NX-Sm; Mon, 02 Nov 2020 05:53:41 +0000
Received: by outflank-mailman (input) for mailman id 17368;
 Mon, 02 Nov 2020 05:53:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nG/o=EI=epam.com=prvs=95752e5c40=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kZSmi-0001NS-1X
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 05:53:40 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2afc28af-af07-4d03-bf0e-e9c5c08e2acc;
 Mon, 02 Nov 2020 05:53:38 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A25pG3m019687; Mon, 2 Nov 2020 05:53:34 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 34he0ustwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 05:53:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5010.eurprd03.prod.outlook.com (2603:10a6:208:10b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 05:53:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 05:53:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nG/o=EI=epam.com=prvs=95752e5c40=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kZSmi-0001NS-1X
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 05:53:40 +0000
X-Inumbo-ID: 2afc28af-af07-4d03-bf0e-e9c5c08e2acc
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2afc28af-af07-4d03-bf0e-e9c5c08e2acc;
	Mon, 02 Nov 2020 05:53:38 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A25pG3m019687;
	Mon, 2 Nov 2020 05:53:34 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
	by mx0b-0039f301.pphosted.com with ESMTP id 34he0ustwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2020 05:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXZfIuCn04uAIRU49CljNtCLtxxz4x82467CXC9TcySXFIV0yMPXUDehYeYdUOjTLDlmNKLLg3prxRCZ8epFnjnX7AcNEeXviavs65YbSH8p7LZUMubaMuCx+MrKVDzG4zVT3M9Yx9gO+iwrzRHqpZtZTFELJH/ioFBewqr1oFtaCR7+4F5xdmL7eXCGL6VblMyxOXuKiGXZsmos5BSCka5S8FNUGm0156xwO28lFlpMNC7Jp9VVDzKVr/VPjeyBbaX08WbKe2hf/7H78r952zc2ngGlW7X1RFspUy2HHVq9Pwbw8iH6a7CAF248avaRC1qQeNhpi0kD3HWbqb5XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhcCXt9ozxSanJ8vIzdy30LTqtz+UqFM/wuYQheCPLI=;
 b=EU2m0H5GD4AEu8j98vBunxbugqxNLRMpxBNqXdd1q1qDfqtaD+JF6PYbRbIczvyVtcsb+il6p8wmdiIFEu38cwEsg2Ry7yUOCw8ApErUkXfbaadFFoFQkJVjDZMz4cu9IhlfzYlqWcU4OIt1zxi5nt8DlTJsVnWCkD4naGQ7Iu4ixmE4BL4GBQD8e+fcpaD3TkRoduD+8eQpztd4SqbgnP3M8kLn8HJyAxi5jkrm5t14n7Ds8av9oDZ+6pEB/9wJ7aSsJdNemm8+f0KhDFGYBb+lDnjfZ5gvnJ0ed3oP/PFWszCaqNgjoTZeugbyRrPUcIWtu2wtMNZvvYa9C9ewdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhcCXt9ozxSanJ8vIzdy30LTqtz+UqFM/wuYQheCPLI=;
 b=Mcw77cJhDD5so/TNQne70CetHy7wkcJmbBXKWIiivSVxIEknEVsNy8h6gMtOevYpwnKw9TzXCy7lDvrKjiOZqicc6lkqQe3w5S8j+aylO/T8d5/IPJJbq5wpQ3GWw5S+9uHPXq5NAz8zvIXkT5AFkCH/OtW2cS1aB95ftb8dOPv+2mpxODLCB4gs28rida7L6nt44yUnzqtmiFrzKcYZSEmJ9BGk3XQjk1hhNcsh/2i4w5PKX+5583zfUv4OfNToPxffKUhlGTi2Vt3JcGPGsv8i4GdskxQFmTYPCxPy2esleGSSFZBXqxsTRojyDiDjprH8OHwb1Ur/XT6kCfQiwg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5010.eurprd03.prod.outlook.com (2603:10a6:208:10b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 05:53:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 05:53:32 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Rahul Singh <Rahul.Singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWrqmeCV4SGlhADU2GY14D47cn76mwOdAAgAAEO4CAABJtAIAECzGA
Date: Mon, 2 Nov 2020 05:53:32 +0000
Message-ID: <2960c8cf-d237-67c1-fcc0-3171d509dbd8@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <2AB3A125-D530-4627-A877-EC2BCDCD63DC@arm.com>
 <da9d0192-7431-83ab-be1a-cc107ee1ac4c@epam.com>
 <E1137D39-EDF2-4663-A990-7628B7057B45@arm.com>
In-Reply-To: <E1137D39-EDF2-4663-A990-7628B7057B45@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34119cc6-f243-4f2b-78ab-08d87ef3a176
x-ms-traffictypediagnostic: AM0PR03MB5010:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB501017E20F5971311770D7EEE7100@AM0PR03MB5010.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nkphQ+9QQ9+8umcPy945bBuAzveDbwRVEuxOzlfYkRD6tFfXjdz4s+I+jjsQmissxXkIZYY7LR5h46Qy2Jtkb4zc69Z1MWqF8qAdmQ20W4N9onsCzjf32cBj9Je+yyLY5Ci4aWyvLpWlNqN8ZKcmUwg/rksIpZaG34oOkU/Go+E6iQc5Aex08r9BY86GbeiqsUef4+TUq/M0pzpvsrtqvN2s3nFc+3MIb+yJW/whWRlj9kIIqvvHizeY2hWo4PVLxfUYAoOi9bnhFoiqyVtb7fhWea3JAXxDuikwAdvuORyZSvk4vuAZhUEEQLP4rcSvcUFuerXQ7b87f0U8kx4tr7zypThvS2RnyBlxpJ09U7ZZK5/D5uxkEtBHd8CqByf/+N9SWsd71YPuWoM3WqpwRQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(8936002)(8676002)(4326008)(83380400001)(86362001)(6512007)(31686004)(36756003)(54906003)(26005)(6506007)(2906002)(186003)(53546011)(6486002)(2616005)(478600001)(966005)(107886003)(6916009)(66476007)(5660300002)(316002)(76116006)(66446008)(71200400001)(64756008)(66556008)(66946007)(31696002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 xxaDutRHPRmgxh1o/Xk21TucwP7aWZoa8ucKlVwGvo8HLp41GNTxkBYfBAwoYcfiTUZ3uHFg/VMYPts0lJu8AGeDa5iVhlajIpQmLNce0y5bc0MbAQQLK1fiOWh0WG0Jsfec0JKa5uprBRHtLZ6Au/c3Qcbr05m76/3zRePvJNJNDtvpCrU2O1f95VGvX3PQTTcPL/Gw6B+TaYN9eMbvY7UAFL25GkQl9lcTZTuJ5HurIbx+3Rh6FZb0AuHCFD+Chx3WXc1b+NPKPgt/2Y0ip8xBok40B9z3OU4cR6QKUWXzUoVgbqKVJB1jgyWuWIO2BYJXsqu+fRJjUYR4orupY5iPbei2Qw1ui2vyPw/1QInCmsAJZLoGw0MgVNFxv6dSAwscsxq/vNsaKxk+qGdkDEXPLyAMCDToy6067qiFp8LSMJ/w5WUtJdbClv0+rj7C3fv5KqfCDHo9b6pziU9pN/HX5JZkuWgZD0jAMImy/IsC495czMTFzku3Vc0NsOJDyB7laachijnEAL/t6N5XTa2/XTk/9ZDZ3942iMAragXvLRkZkGTil4w4cB0/3CS1RSg001ipUjsfvqqWnHWLzsar0lpcTb8Cq4gqWBuJQARI4vk8CPJP/IqA4Jk7vF+R1AFdAPPvYPdfgA7R0IhwSQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEC7D742632E714E854E27AADF31E81B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34119cc6-f243-4f2b-78ab-08d87ef3a176
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 05:53:32.3316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWz+fauaGUP78q/TMR38uGAqWZT8E3UtX4N5ymdMhzKKux6sK0fMcOyWxDHRIy7wPrgsE/VjFUvnMXYuHSOE1+IFuxPv/lkBW3+BrSAElSn4Gz9r4YbOEpuVkjz8Gg8R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5010
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-02_01:2020-10-30,2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=884 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020048

SGksDQoNCk9uIDEwLzMwLzIwIDY6MDggUE0sIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhp
IE9sZWtzYW5kciwNCj4NCj4+IE9uIDMwIE9jdCAyMDIwLCBhdCAxNTowMiwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPE9sZWtzYW5kcl9BbmRydXNoY2hlbmtvQGVwYW0uY29tPiB3cm90ZToNCj4+
DQo+PiBIaSwNCj4+DQo+PiBPbiAxMC8zMC8yMCA0OjQ3IFBNLCBSYWh1bCBTaW5naCB3cm90ZToN
Cj4+PiBIZWxsbyBPbGVrc2FuZHIsDQo+Pj4NCj4+Pj4gT24gMzAgT2N0IDIwMjAsIGF0IDEwOjQ0
IGFtLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBh
bS5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSwgUmFodWwhDQo+Pj4+DQo+Pj4+IE9uIDEwLzIw
LzIwIDY6MjUgUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4gQWRkIHN1cHBvcnQgZm9yIEFS
TSBhcmNoaXRlY3RlZCBTTU1VdjMgaW1wbGVtZW50YXRpb25zLiBJdCBpcyBiYXNlZCBvbg0KPj4+
Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIuDQo+Pj4+Pg0KPj4+Pj4gTWFqb3IgZGlmZmVyZW5j
ZXMgYmV0d2VlbiB0aGUgTGludXggZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0KPj4+Pj4gMS4gT25s
eSBTdGFnZS0yIHRyYW5zbGF0aW9uIGlzIHN1cHBvcnRlZCBhcyBjb21wYXJlZCB0byB0aGUgTGlu
dXggZHJpdmVyDQo+Pj4+PiAgICAgdGhhdCBzdXBwb3J0cyBib3RoIFN0YWdlLTEgYW5kIFN0YWdl
LTIgdHJhbnNsYXRpb25zLg0KPj4+PiBGaXJzdCBvZiBhbGwgdGhhbmsgeW91IGZvciB0aGUgZWZm
b3J0cyENCj4+Pj4NCj4+Pj4gSSB0cmllZCB0aGUgcGF0Y2ggd2l0aCBRRU1VIGFuZCB3b3VsZCBs
aWtlIHRvIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0DQo+Pj4+DQo+Pj4+IHRoYXQg
dGhpcyBjb21iaW5hdGlvbiB3aWxsIG5vdCB3b3JrIGFzIG9mIG5vdzoNCj4+Pj4NCj4+Pj4gKFhF
TikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2MzogRFQgdmFsdWUgPSBldmVudHENCj4+
PiBJIGhhdmUgbGltaXRlZCBrbm93bGVkZ2UgYWJvdXQgUUVNVSBpbnRlcm5hbHMuQXMgd2hhdCBJ
IHNlZSBmcm9tIHRoZSBsb2dzLCBmYXVsdCBpcyBvY2N1cnJlZCBhdCBlYXJseSBkcml2ZXIgaW5p
dGlhbGlzYXRpb24gd2hlbiBTTU1VIGRyaXZlciBpcyB0cnlpbmcgdG8gcHJvYmUgdGhlIEhXLg0K
Pj4+DQo+Pj4+IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHgxOTQwMDEwDQo+Pj4+
IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQwMDMxMDAwIG9uIENQVTAgdmlhIFRUQlIg
MHgwMDAwMDAwMGI4NDY5MDAwDQo+Pj4+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMGI4NDY4
ZjdmDQo+Pj4+DQo+Pj4+IFtzbmlwXQ0KPj4+Pg0KPj4+PiBJZiB0aGlzIGlzIGV4cGVjdGVkIHRo
ZW4gaXMgdGhlcmUgYW55IHBsYW4gdG8gbWFrZSBRRU1VIHdvcmsgYXMgd2VsbD8NCj4+Pj4NCj4+
Pj4gSSBzZWUgWzFdIHNheXMgdGhhdCAiT25seSBzdGFnZSAxIGFuZCBBQXJjaDY0IFBUVyBhcmUg
c3VwcG9ydGVkLiIgb24gUUVNVSBzaWRlLg0KPj4+IFllcyBhcyBvZiBub3cgb25seSBTdGFnZS0y
IGlzIHN1cHBvcnRlZCBpbiBYRU4uSWYgd2UgaGF2ZSBhbnkgcmVxdWlyZW1lbnQgb3IgdXNlIGNh
c2UgdGhhdCBkZXBlbmRzIG9uIFN0YWdlLTEgdHJhbnNsYXRpb24gd2UgY2FuIHN1cHBvcnQgdGhh
dCBhbHNvIGluIFhFTi4NCj4+IFRoZSB1c2UgY2FzZSBpcyBiZWxvdzogUENJIHBhc3N0aHJvdWdo
IGFuZCB2YXJpb3VzIGNvbmZpZ3VyYXRpb25zIGluY2x1ZGluZyBTUi1JT1Ygd2hpY2ggaXMgcG9z
c2libGUgd2l0aCBRRU1VLi4uDQo+IFRoaXMgaXMgY3VycmVudGx5IG5vdCBpbiB0aGUgbGlzdCBv
ZiBjb25maWd1cmF0aW9uIHN1cHBvcnRlZCBvciB0aGF0IHdlIGhhdmUgcGxhbm5lZCBvbiBvdXIg
c2lkZSB0byBzdXBwb3J0Lg0KPg0KPiBCdXQgd2Ugd291bGQgYmUgbW9yZSB0aGVuIGhhcHB5IHRv
IHJldmlldyBhbnkgY2hhbmdlcyB0byBlbmFibGUgdGhpcyA6LSkNCg0KRmFpciBlbm91Z2gNCg0K
VW5mb3J0dW5hdGVseSB3ZSBkbyBub3QgaGF2ZSBhbnkgSFcgd2l0aCBTTU1VdjMgYXQgdGhlIG1v
bWVudCwgc28gbm90IHN1cmUgd2UgY2FuDQoNCmludmVzdCB0aW1lIGluIHRoaXMgYXQgdGhlIG1v
bWVudA0KDQo+DQo+IFJlZ2FyZHMNCj4gQmVydHJhbmQNCg0KVGhhbmsgeW91LA0KDQpPbGVrc2Fu
ZHINCg0KPg0KPj4+PiBXZSBhcmUgaW50ZXJlc3RlZCBpbiBRRU1VL1NNTVV2MyBhcyBhIGZsZXhp
YmxlIHBsYXRmb3JtIGZvciBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4NCj4+Pj4gaW1wbGVtZW50YXRp
b24sIHNvIGl0IGNvdWxkIGFsbG93IHRlc3RpbmcgZGlmZmVyZW50IHNldHVwcyBhbmQgY29uZmln
dXJhdGlvbnMgd2l0aCBRRU1VLg0KPj4+Pg0KPj4+Pg0KPj4+PiBUaGFuayB5b3UgaW4gYWR2YW5j
ZSwNCj4+Pj4NCj4+Pj4gT2xla3NhbmRyDQo+Pj4+DQo+Pj4+IFsxXSBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3FlbXUtZGV2
ZWwvY292ZXIvMTUyNDY2NTc2Mi0zMTM1NS0xLWdpdC1zZW5kLWVtYWlsLWVyaWMuYXVnZXJAcmVk
aGF0LmNvbS9fXzshIUdGXzI5ZGJjUUlVQlBBIWgtRWFFME9uU2JYdExCU3dJUzMxMWFsRGw3cG44
c0g3c2loZ0lZcWlsTTUtci04a0NINlVTTk5sTEIzeGhiemM2ZWN6VU9yaGN3JCBbcGF0Y2h3b3Jr
Wy5db3psYWJzWy5db3JnXQ0KPj4+IFJlZ2FyZHMsDQo+Pj4gUmFodWwNCj4+IFRoYW5rIHlvdSwN
Cj4+DQo+PiBPbGVrc2FuZHINCj4=

