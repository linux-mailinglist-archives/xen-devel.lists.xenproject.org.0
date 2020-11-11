Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E552AF4B2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25070.52649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcs2l-0000nC-Dz; Wed, 11 Nov 2020 15:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25070.52649; Wed, 11 Nov 2020 15:28:19 +0000
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
	id 1kcs2l-0000mn-AM; Wed, 11 Nov 2020 15:28:19 +0000
Received: by outflank-mailman (input) for mailman id 25070;
 Wed, 11 Nov 2020 15:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kcs2k-0000mi-CR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:28:18 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb8d3f40-deb9-48dd-83eb-4314b7c1a9a9;
 Wed, 11 Nov 2020 15:28:17 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABFMlq6016077; Wed, 11 Nov 2020 15:28:12 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 34rf800sva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 15:28:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6322.eurprd03.prod.outlook.com (2603:10a6:20b:15e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 15:28:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 15:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kcs2k-0000mi-CR
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:28:18 +0000
X-Inumbo-ID: eb8d3f40-deb9-48dd-83eb-4314b7c1a9a9
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb8d3f40-deb9-48dd-83eb-4314b7c1a9a9;
	Wed, 11 Nov 2020 15:28:17 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABFMlq6016077;
	Wed, 11 Nov 2020 15:28:12 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
	by mx0b-0039f301.pphosted.com with ESMTP id 34rf800sva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2020 15:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDkZmIj9AYjOsJ4vO7ltv3EAZbjUUumH/IW0GuDhZ41zXDHs9ZFmU+zNFUT9zXh2hopdvw2dFKUJrXgC3fB1su4rwGlBpvj+f1Mrf4Pqr3NyL2beUCfjmTr47evZEkg5a8LOZFhw44I5x7MNyr4AI2FOYfZIBYWmQ9XRWDw1IQ+fDjr67D/EQgybea5bf6Im3kLQL5w6NGZnyIOI0chdQym0cGJcHHRM/PBwINO1CreJk1xorHTSM4Xq44xzvTTEIPc/WPCq6fYjNY4tV879LfTdcSWf1HGpBKKhkicDRiyo8RRyS6CalxDIMk+blv/cVhhi80IDX9qDZzgOYtW3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7yX6/AQXuuo70d0FtI7GkAPxZz5dsPz2NaD4N/5R3c=;
 b=Skw2zAp+D54lRSKW4fUyo/XzzVvTnIN6R9GwB+5NEnkBAMPCt4B6O+Qi3FKM0ObuUPQFmrgRwJEKe62HudfXEN3sV8ifSzeM2NkdqEkQd36p3jpYdJptrSDQd/yWHRouRjTFgX8bMH2aELZEfYTSf0FHXGZ56QME7txn0wAmxyx2JGORCefqGzjb2T2l76ovsBxOec9TFvu7Z9bbkehixCCPOVR0LM4ManNms7iZ3xT6Njw27jVcu6buobwDIkQfQWbVuFYE0UHL8TPP0Xt6/vU/lLQjM1n+cOirWv2PP7+eeqUY8YMnjqJNv1id/XVWrfcGvZFMRR04OQ8s3BwifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7yX6/AQXuuo70d0FtI7GkAPxZz5dsPz2NaD4N/5R3c=;
 b=rAgiOiAc3DrSQ56bPUpDQmowOqq207vEpRYwTLIHJrU+pgctkqLXLpA3ola91b2BShDEUV2LxLhHKYmsVWx/hcPseCritH7BS2N05DqfXyksonZxnZz/qBT0KSLBOmdD3pcoqlUS/8PDdFAWJs47VqHvhriGoDonDiVSqVKdqK8joo3D2aditY/7cXfkHtUfhqVax6sH4yIGh2+9Ar06V+PgRhoBgLT3fNNOw7Da6bmn+SXIDFmrgZGfDfN8vGODhxG6b61UPjsvyGs5RZGRCbSYL+1otkF3cATjzoEHxn0N7PGuqLyC9NZaMEb3MzFcsQFhAxt5rcvEOrkIxQKquQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6322.eurprd03.prod.outlook.com (2603:10a6:20b:15e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 15:28:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 15:28:10 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Topic: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Index: 
 AQHWtpbuKiRgL1HiZkyNC2yoNcmnl6nC9s6AgAAMvACAAAbRAIAAAv4AgAADNACAAADJgA==
Date: Wed, 11 Nov 2020 15:28:09 +0000
Message-ID: <4cfff7a6-6d7b-a6be-b31a-98e4eccd3fb2@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
 <20201111135311.6jhskiss2qswm3zp@Air-de-Roger>
 <03d6a75c-075d-6c57-1d66-2514ef1d0cb8@epam.com>
 <20201111150310.2wo33lr3f5xrd6sj@Air-de-Roger>
 <d94e37a3-d8b3-7d3d-0ba5-c7885a5ef512@epam.com>
 <4619f6b5-6050-6beb-ced7-f7d6da9782d0@suse.com>
In-Reply-To: <4619f6b5-6050-6beb-ced7-f7d6da9782d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52cd1c40-3747-4a1d-5f04-08d886566581
x-ms-traffictypediagnostic: AM0PR03MB6322:
x-microsoft-antispam-prvs: 
 <AM0PR03MB63225985A885ADDE836D215CE7E80@AM0PR03MB6322.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ItxCTAD8GWMOUcpeS7AdKMv4VF01ckNhxfA3D1BtMLP3JhYs54n4yfRa07nBW555UhkmCmghSs6vA+A585xnE2BBrh3Bxi5fcdW511eRyEKZrmdrBQW7M/NQGBw0kCTSMwIX2dlG6vAjHnb6JjhqyFEFa304eNVWRqJug2wsMJAIbExDyhK3cD6DT8zYeZagkdOzNlum2fl+ZQSFv3udX58Uc7BqCsTiaqLJgcXzzQT2YVLR5Vhkm+6v9KoDeSPdBWbj0D30rYITDMz5SItFIqf7fJN+FSSkSpYOukI5eRu1FQ5MHV5QOXnkhKCHLyGzUTTjysjI12rrlvrzJ33lEA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(186003)(4326008)(31686004)(7416002)(66556008)(316002)(6486002)(110136005)(71200400001)(54906003)(66476007)(91956017)(66946007)(64756008)(76116006)(66446008)(26005)(8936002)(2906002)(86362001)(478600001)(8676002)(31696002)(5660300002)(2616005)(53546011)(6506007)(36756003)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ahJT4cC+Z3LOorbl78dKfyEnTZM9kQ/bsgd/qfdTrd71fvK+frW6UlpzToZThWk9bs/SrnQVEu7CmDdyNV6TQFwHox4C2HHY4DfD8XR4PapKKdTjgLFpGLvEXyG2j/RdsWdd4KhUPE8SB1MjUbMLyiLhKAPBJcDsnZPMDskseIlyejiS+lcD83vuVWjDKpWdbT5LrxAr81bfBJoxbWzo08vqLgtrEst9nArxJwsjCnhSYq2t+GQNJE9PtyAdq864M7MV/8A1awyu4KYQJaIglOf9ragpuynWPjAMJbs8Al//nlZRfBX8uyTPFPBKYNK/G/IiAWrek1QUG5t4oMuMvPRqXc0iuI67R/ghjrfJ/+Yl703uNG62o1ixe3CUq5BZfbsXtlstQwx8XODRxYX/HJbUEnnNjtujjpYNZMWfwUyqo8S8pYO0KY1nIalpTgKeDCO9bIy/EInSD6FGcjw6L97GyscGwTYKyr3uWgb4jOutu9Y/dTlomxKoJtNHXuP3kxPiKPCbHQH4wnQSOp/tDDZ6pVBRGwr+Vi02GluYuZKqHHz6/GdhS2nlU+VGCcGnAElC4wZdXxLCrWg6sxh6Emq9HXKKKf7JTA36XyCqH5r1I1flcVP+KNbf0muFU+ge4F8zS2LP4ZxfHEVhgyDuOw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EF5FFD1856418438F6E9D603B27AA21@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cd1c40-3747-4a1d-5f04-08d886566581
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 15:28:10.0007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hLEVZ+LSFwfSwRrOvTXEnMCEb4wIyydL/dYYudVqCe8WuW8NgGViE5tyIE+Z5k26gL4wNXwRMem5RyNmhjAxgE2cKlBTEpxSscqf4rkgqwYZr+7fNWL/sNlOiwQAmf5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6322
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_07:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=890 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110092

DQpPbiAxMS8xMS8yMCA1OjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMTEuMjAy
MCAxNjoxMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMS8yMCA1
OjAzIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIFdlZCwgTm92IDExLCAyMDIw
IGF0IDAyOjM4OjQ3UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
PiBPbiAxMS8xMS8yMCAzOjUzIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24g
TW9uLCBOb3YgMDksIDIwMjAgYXQgMDI6NTA6MjNQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIG9yaWdpbmFs
IGNvZGUgZGVwZW5kcyBvbiBwY2liYWNrIHRvIG1hbmFnZSBhc3NpZ25hYmxlIGRldmljZSBsaXN0
Lg0KPj4+Pj4+IFRoZSBmdW5jdGlvbmFsaXR5IHdoaWNoIGlzIGltcGxlbWVudGVkIGJ5IHRoZSBw
Y2liYWNrIGFuZCB0aGUgdG9vbHN0YWNrDQo+Pj4+Pj4gYW5kIHdoaWNoIGlzIHJlbGV2YW50L21p
c3NpbmcvbmVlZGVkIGZvciBBUk06DQo+Pj4+Pj4NCj4+Pj4+PiAxLiBwY2liYWNrIGlzIHVzZWQg
YXMgYSBkYXRhYmFzZSBmb3IgYXNzaWduYWJsZSBQQ0kgZGV2aWNlcywgZS5nLiB4bA0KPj4+Pj4+
ICAgICAgIHBjaS1hc3NpZ25hYmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlwdWxhdGVzIHRoYXQg
bGlzdC4gU28sIHdoZW5ldmVyIHRoZQ0KPj4+Pj4+ICAgICAgIHRvb2xzdGFjayBuZWVkcyB0byBr
bm93IHdoaWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaCBpdCByZWFkcw0KPj4+
Pj4+ICAgICAgIHRoYXQgZnJvbSB0aGUgcmVsZXZhbnQgc3lzZnMgZW50cmllcyBvZiB0aGUgcGNp
YmFjay4NCj4+Pj4+Pg0KPj4+Pj4+IDIuIHBjaWJhY2sgaXMgdXNlZCB0byBob2xkIHRoZSB1bmJv
dW5kIFBDSSBkZXZpY2VzLCBlLmcuIHdoZW4gcGFzc2luZyB0aHJvdWdoDQo+Pj4+Pj4gICAgICAg
YSBQQ0kgZGV2aWNlIGl0IG5lZWRzIHRvIGJlIHVuYm91bmQgZnJvbSB0aGUgcmVsZXZhbnQgZGV2
aWNlIGRyaXZlciBhbmQgYm91bmQNCj4+Pj4+PiAgICAgICB0byBwY2liYWNrIChzdHJpY3RseSBz
cGVha2luZyBpdCBpcyBub3QgcmVxdWlyZWQgdGhhdCB0aGUgZGV2aWNlIGlzIGJvdW5kIHRvDQo+
Pj4+Pj4gICAgICAgcGNpYmFjaywgYnV0IHBjaWJhY2sgaXMgYWdhaW4gdXNlZCBhcyBhIGRhdGFi
YXNlIG9mIHRoZSBwYXNzZWQgdGhyb3VnaCBQQ0kNCj4+Pj4+PiAgICAgICBkZXZpY2VzLCBzbyB3
ZSBjYW4gcmUtYmluZCB0aGUgZGV2aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRyaXZlcnMg
d2hlbg0KPj4+Pj4+ICAgICAgIGd1ZXN0IGRvbWFpbiBzaHV0cyBkb3duKQ0KPj4+Pj4+DQo+Pj4+
Pj4gMS4gQXMgQVJNIGRvZXNuJ3QgdXNlIHBjaWJhY2sgaW1wbGVtZW50IHRoZSBhYm92ZSB3aXRo
IGFkZGl0aW9uYWwgc3lzY3RsczoNCj4+Pj4+PiAgICAgLSBYRU5fU1lTQ1RMX3BjaV9kZXZpY2Vf
c2V0X2Fzc2lnbmVkDQo+Pj4+PiBJIGRvbid0IHNlZSB0aGUgcG9pbnQgaW4gaGF2aW5nIHRoaXMg
c3lzZnMsIFhlbiBhbHJlYWR5IGtub3dzIHdoZW4gYQ0KPj4+Pj4gZGV2aWNlIGlzIGFzc2lnbmVk
IGJlY2F1c2UgdGhlIFhFTl9ET01DVExfYXNzaWduX2RldmljZSBoeXBlcmNhbGwgaXMNCj4+Pj4+
IHVzZWQuDQo+Pj4+IEJ1dCBob3cgZG9lcyB0aGUgdG9vbHN0YWNrIGtub3cgYWJvdXQgdGhhdD8g
V2hlbiB0aGUgdG9vbHN0YWNrIG5lZWRzIHRvDQo+Pj4+DQo+Pj4+IGxpc3Qva25vdyBhbGwgYXNz
aWduZWQgZGV2aWNlcyBpdCBxdWVyaWVzIHBjaWJhY2sncyBzeXNmcyBlbnRyaWVzLiBTbywgd2l0
aA0KPj4+Pg0KPj4+PiBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2Ugd2UgbWFrZSB0aGF0IGtub3ds
ZWRnZSBhdmFpbGFibGUgdG8gWGVuLA0KPj4+Pg0KPj4+PiBidXQgdGhlcmUgYXJlIG5vIG1lYW5z
IGZvciB0aGUgdG9vbHN0YWNrIHRvIGdldCBpdCBiYWNrLg0KPj4+IEJ1dCB0aGUgdG9vbHN0YWNr
IHdpbGwgZmlndXJlIG91dCB3aGV0aGVyIGEgZGV2aWNlIGlzIGFzc2lnbmVkIG9yDQo+Pj4gbm90
IGJ5IHVzaW5nDQo+Pj4gWEVOX1NZU0NUTF9wY2lfZGV2aWNlX2dldF9hc3NpZ25lZC9YRU5fU1lT
Q1RMX3BjaV9kZXZpY2VfZW51bV9hc3NpZ25lZD8NCj4+Pg0KPj4+IEFGQUlDVCBYRU5fU1lTQ1RM
X3BjaV9kZXZpY2Vfc2V0X2Fzc2lnbmVkIHRlbGxzIFhlbiBhIGRldmljZSBoYXMgYmVlbg0KPj4+
IGFzc2lnbmVkLCBidXQgWGVuIHNob3VsZCBhbHJlYWR5IGtub3cgaXQgYmVjYXVzZQ0KPj4+IFhF
Tl9ET01DVExfYXNzaWduX2RldmljZSB3b3VsZCBoYXZlIGJlZW4gdXNlZCB0byBhc3NpZ24gdGhl
IGRldmljZT8NCj4+IEFoLCBJIG1pc3VuZGVyc3Rvb2QgeW91IHRoZW4uIFNvLCB3ZSBvbmx5IHdh
bnQgdG8gZHJvcCBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2UNCj4+DQo+PiBhbmQga2VlcCB0aGUg
cmVzdC4NCj4gV2FzIHRoaXMgYSB0eXBvPyBXaHkgd291bGQgeW91IHdhbnQgdG8gZHJvcCBYRU5f
RE9NQ1RMX2Fzc2lnbl9kZXZpY2U/DQoNCkluZGVlZCBpdCB3YXM6IHMvWEVOX0RPTUNUTF9hc3Np
Z25fZGV2aWNlL1hFTl9TWVNDVExfcGNpX2RldmljZV9zZXRfYXNzaWduZWQNCg0KU29ycnkgZm9y
IGNvbmZ1c2lvbg0KDQo+DQo+IEphbg==

