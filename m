Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7044281A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 08:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219710.380659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mho21-0003PS-2L; Tue, 02 Nov 2021 07:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219710.380659; Tue, 02 Nov 2021 07:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mho20-0003N6-UD; Tue, 02 Nov 2021 07:16:28 +0000
Received: by outflank-mailman (input) for mailman id 219710;
 Tue, 02 Nov 2021 07:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mho1z-0003N0-5u
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 07:16:27 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca0c5864-3bac-11ec-8552-12813bfff9fa;
 Tue, 02 Nov 2021 07:16:25 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A25whS3015586;
 Tue, 2 Nov 2021 07:16:22 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c2wrd0g37-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 07:16:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 07:16:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 07:16:19 +0000
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
X-Inumbo-ID: ca0c5864-3bac-11ec-8552-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyTkNbvRYFRwxYRw2fh4Pynpvg0+anmEFWLmt0Pk46U7cNzIU81VIs/5ZryaIPyD9p3NW074KwmQ7eHF6pci0h52JCKZ+N5HJSEM25FGte0Ruh1n9kmW/SY9uvbkyvLddJsYfBxMfg13ssD21ynQmpiUju0o7oIhtylibz2YLdeWOA4XwRYcZDRfV0hDXA1yFMwTA0KB966Q2naAhtntbk7StcGOPtkmX8kByQG704gdJdwDo0wTQDO19TTFzLlSyetZa/PySCK9sLgRPaiy9TdbJjTVr5gmZgney+yiZJoZCWfbOBmFwDrXzYz3nPrWRs99g6leu5rB0z/6sjUCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDWJLMvmPnVR2tXLk4dZlsCRBfP6i8Gcr7/zk0N2OOo=;
 b=cyydph/gzx3GnKsz0ai3puAUlbKBfVvGkOGDCZNzNt/mdtToojpYBsNb/tkomtz6/iaqDWF0gdK5AA1ELg08f5gmPZhehQI6fRJe427wgT6Bl7BN3jYon8snyYSXcYbIWd+LrMmq2GyWmVBM4c49d4qIBer7KJM0VaBvhyN3hhPqSIOAPqQl5OXUI3XWGIBJ32niDCEwqpdox3SayEmB13ID7TINKoRlxT64AEU1LTMUXi61VXgs51gWwCX9Rv/C6PcLFDhEZRNl1BCoTiZhE+yhCBEV7dmK6b7zTy2NLncPGEkZ65Rmrzei5J8kCKN+V8+3P5ppUHFMyvJg5SeNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDWJLMvmPnVR2tXLk4dZlsCRBfP6i8Gcr7/zk0N2OOo=;
 b=sFPHoobftg5iR8U4pINoY5INd3gzimKlTufCtytNyarh9xzFNyat2x5QaB2tLDltcvRZV8O6a6b1kItTiZtv8J+tcvMHrrvyTEezshpDnc5qQZUvOhzwg9mY14CO8Et+1fD4WHgjYeRV4CT7O1PbACwRyKgYee0YXYpuZK1duxafW9d8IG7fC1iz8Hrdora6i8nGY9K2EhHdcO3VqUW7CB/Hy1Rsk2JmC0kJkwRREqT9K+Tdy3AR/+BBjP5oyNv41j+KkeOyIwoKIzFmx57R6eDGeo2kYf/aufvi36iW2RtinDEwwcwdkkTje2gMNer68dewezFsBi9F6d4YhmYjnw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Ian Jackson
	<iwj@xenproject.org>
CC: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers [and
 2 more messages]
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
 [and 2 more messages]
Thread-Index: AQHXzwrVBVHykfdvRUOfqNSizjfhO6vvKqAAgACqWoA=
Date: Tue, 2 Nov 2021 07:16:19 +0000
Message-ID: <a14ce7fd-c3d0-0777-f0c9-5f7fad901452@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <65886734-7333-4469-fcc1-6916db708f13@xen.org>
 <b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
 <6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
 <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
 <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
 <24954.51153.588540.850154@mariner.uk.xensource.com>
 <d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
 <YXkU+DKYmvwo+kak@Air-de-Roger>
 <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
 <24953.34635.645112.279110@mariner.uk.xensource.com>
 <24959.49313.936961.936820@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abb2033e-58b4-49e7-9b78-08d99dd0aafe
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6881C33C739BFB8B2B24ED8EE78B9@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3VF8g7MaM92YBlHRjGJDJEQG4cQL3BGN4sDk1MrT19yXbNBX2Yv6TxHWmbyZMvlD8KITolCYa1EHIx269E/aQhCtkNYHlS4Y4Gnm/FQxsqn+KvZNoFtWHgOeaVbGXEoVgYh4k8JNzxMENdQ31bTjmgGfERXyakgmtGMLr8PniVjYBIOMbJ3CJbswD3mcmMTMNby6zC9R8nDa0s9bVhMJKpQclJv6H3sCxwhnHEmgovBoBFf/B9EgzApZgAk/bT8nmJvRSzNJgK05WfN1GpQhY+3s2S9j/LtEwSsQF9W2cmQfp+FCDg4JMhvScyViiNT1brqfncJIpV3h7DjnFNZGpgQA9LaQhB/csQm74X2yr3sc+QDsM09RAWvBEcsvBiSv5Zyp2aC80Nqz5ZbRZX+EIeY2QqdC8RovI9ChFcx+HmaulJNCnakwOUUabXNXeIEP3xaCkt2lJwNgkvKIs+Nd0YM6xg9Nleg8FScCHd6kydxNk2HsAR3t2knzqYygtftgYtAGzWDvmxfZ8URLQMZFv5IYwNR1yGx+gFV+OK5oGoTRytTfTo2RnlncGBGbq+ce9stgWTNdb1J5VIXmsrVGJoLj9LgiEhh5GTqXefqzsXe+m99Gx99sxAPwyUZXdBs3Tu9U/tJRnnM3UyYUVmE1ci6jpyM+yu+Z9Ne3+L21Td24PvHme/+Tu8KJz7xnvzC69JF5qmiwwFZI1LeI+ZU2ijmg0Exl9nhEgUimJbPVWjt7TuNqs2eCANUt9sGRoyCZ3vrFQfUlvXk7mzVkdQh2TsGomyB4f5gzPBw39/cO5GNHCtKUI7CsicLvwJP0z+L1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(966005)(38070700005)(8676002)(4326008)(6486002)(66476007)(38100700002)(66556008)(6506007)(64756008)(66946007)(6512007)(508600001)(66446008)(31686004)(71200400001)(122000001)(53546011)(91956017)(86362001)(110136005)(54906003)(186003)(2906002)(76116006)(15650500001)(31696002)(8936002)(316002)(26005)(36756003)(83380400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 CKp06j06YF5ig40PrM3djJCIo9noVLTx0u1/9gwa89XjdJ8f6LrD47tvFoZiSX1Z0ew9wlTeiSISi+BVhN/IYmkasLkqRkWvIw2nPU/6p44Wg/9UMYGspwFmGmvUYVGyGZhxu+mFMKHQ+L9OnM7/sGgHS9O8g/Y706z8VE5W0aJewXsBpwVhs2W3NgC5oQvrYy8RyXv5hVf62JEbdkXItlm1m62IeJJ+xJDN4DYgXSHuzwDM3hx7piYBjYa0KLza51g9J1KGppK1F6WahV5fMluYZUu4VtCqg5OQSe5wXEehU6T7uutWFWukV54r7jNFXAp9UXgaEMTnZQXnoqUkG/bWNizKiG5vzacaywjm9JxDwrlqon2rCUz9KPJg9AaT0mRJcm6SdKZPCBXAaqkD5T+poDLnH/5ozmU7lJS4BENcTCmIuPHSv4MoMHwKW+cDGAc7mLDbLU71gvW2Ys6YnoH+1DC2Tb9y+ah/NuTRiaQiunyugdv08Vr0mC6izAzTCcq/sTkTslEiwpk+ZfH6S/BLMF37ODCZtSLKbAMc0Kk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED5AE535B712EA41B290274E0524158B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb2033e-58b4-49e7-9b78-08d99dd0aafe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 07:16:19.5972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHaXnxjPHXw0WyH0inDerQ8gp6zwVD5+/ZJft5h5Eie6Y1FgVFQGZfB8WuBjAUmiPveSpCIFWcCHsHMEx71/6iL+G58EUX1C5C35nj7sejUMSs2X4KR5tC2UWuRxeYjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-GUID: XpF1cLx-IcGdLpb4znO9y5ta1uG66s02
X-Proofpoint-ORIG-GUID: XpF1cLx-IcGdLpb4znO9y5ta1uG66s02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020040

DQoNCk9uIDAxLjExLjIxIDIzOjA2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIE1v
biwgMSBOb3YgMjAyMSwgSWFuIEphY2tzb24gd3JvdGU6DQo+PiBKdWxpZW4gR3JhbGwgd3JpdGVz
ICgiUmU6IFtQQVRDSF0geGVuL2FybTogZml4IFNCREYgY2FsY3VsYXRpb24gZm9yIHZQQ0kgTU1J
TyBoYW5kbGVycyIpOg0KPj4+IE9uIDI4LzEwLzIwMjEgMTY6NTQsIElhbiBKYWNrc29uIHdyb3Rl
Og0KPj4+PiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgcGF0Y2hlcyB0aGF0IEknbSBnZXR0aW5nIEND
J2Qgb24gcmVsYXRlZCB0byBBUk0NCj4+Pj4gYW5kIHZwY2kgKGFjY29yZGluZyB0byB0aGUgU3Vi
amVjdCkuICBBcmUgdGhlc2UgdGFyZ2V0ZWQgZm9yIDQuMTYgPw0KPj4+PiBNb3N0IG9mIHRoZW0g
ZG9uJ3QgaGF2ZSA0LjE2IFN1YmplY3QgdGFncy4NCj4+PiBPbGVrc2FuZHIgd2FudHMgdGhpcyBw
YXRjaCB0byBiZSBpbmNsdWRlZCBmb3IgNC4xNiBidXQgZm9yZ290IHRvIHRhZyBpdA0KPj4+IHBy
b3Blcmx5Lg0KPj4gT2ggeWVzLiAgSG93ZXZlciwNCj4+DQo+PiAxLiBJIGFsc28gd3JvdGUgdGhp
czoNCj4+DQo+Pj4+IEkgYW0gZmluZGluZyBpdCBkaWZmaWN1bHQgdG8gc2VlIHRoZSB3b29kIGZv
ciB0aGUgdHJlZXMuDQo+Pj4+IEl0IHdvdWxkIGJlIHJlYWxseSBoZWxwZnVsIGlmIHRoZXNlIHZw
Y2kgZml4ZXMgd2VyZSBjb2xsZWN0ZWQNCj4+Pj4gdG9nZXRoZXIgaW50byBhIHNlcmllcy4NCj4+
IENhbiBzb21lb25lIHBsZWFzZSBjb25maXJtIHdoZXRoZXIgdGhpcyBpcyB0aGUgb25seSB2cGNp
LXJlbGF0ZWQgcGF0Y2gNCj4+IHRoYXQgb3VnaHQgdG8gYmUgb24gbXkgcmFkYXIgZm9yIDQuMTYg
Pw0KPj4NCj4+IDIuIEkgaGF2ZSBub3QgaGFkIGEgcmVwbHkgdG8gbXkgcXVlc3Rpb24gb24gV2Vk
bmVzZGF5IGluDQo+PiA8MjQ5NTMuMzQ2MzUuNjQ1MTEyLjI3OTExMEBtYXJpbmVyLnVrLnhlbnNv
dXJjZS5jb20+Og0KPj4NCj4+ICAgIFVtLCBjYW4geW91IGV4cGxhaW4gd2hhdCB0aGUgcHJhY3Rp
Y2FsIGltcGFjdCBpcyBvZiBub3QgdGFraW5nIHRoaXMNCj4+ICAgIHBhdGNoIGZvciA0LjE2ID8g
IEFzIEkgdW5kZXJzdGFuZCBpdCB2cGNpIGZvciBBUk0gaXMgbm9uLWZ1bmN0aW9uYWwgaW4NCj4+
ICAgIDQuMTYgYW5kIHRoaXMgaXMgbm90IGV4cGVjdGVkIHRvIGNoYW5nZSA/ICBTbyB0aGVyZSB3
b3VsZCBiZSBubw0KPj4gICAgYmVuZWZpdCB0byB1c2VycywgYW5kIHRha2luZyB0aGUgcGF0Y2gg
d291bGQgYWRkIHNtYWxsIGJ1dCBub256ZXJvDQo+PiAgICByaXNrID8NCj4+DQo+PiBJIG5lZWQg
dGhpcyBpbmZvcm1hdGlvbiB0byBkZWNpZGUgd2hldGhlciBhIHJlbGVhc2UtYWNrIGlzDQo+PiBh
cHByb3ByaWF0ZS4NCj4+DQo+PiBOb3RlIHRoYXQgd2UgYXJlIGluIGNvZGUgZnJlZXplIHNvIGFs
bCBwYXRjaGVzLCBpbmNsdWRpbmcgYnVnZml4ZXMsDQo+PiBuZWVkIG15IGFjay4NCj4gSGkgSWFu
LA0KPg0KPiBUaGlzIHBhdGNoIFsxXSBpcyBhIHN0cmFpZ2h0Zm9yd2FyZCAyIGxpbmVzIGZpeCBm
b3IgdnBjaSBvbiBBUk0uICBUaGVyZQ0KPiBpcyBubyByaXNrIGZvciB0aGUgcmVsZWFzZSBhcyB0
aGUgc291cmNlIGZpbGUgYWZmZWN0ZWQgb25seSBidWlsZHMgd2hlbg0KPiBDT05GSUdfSEFTX1ZQ
Q0kgaXMgZW5hYmxlZCwgYW5kIGl0IGlzIGN1cnJlbnRseSBkaXNhYmxlZCBvbiBBUk0uDQo+DQo+
IEF0IHRoZSBzYW1lIHRpbWUsIGFzIHdlIGtub3cgdnBjaSBpcyBub3QgY29tcGxldGUgaW4gNC4x
NiBhbnl3YXksIHNvIHRoZQ0KPiBjb3VudGVyIGFyZ3VtZW50IGlzIHRoYXQgd2UgZG9uJ3QgbmVl
ZCB0byBmaXggaXQuDQo+DQo+IEdpdmVuIGhvdyB0cml2aWFsIHRoZSBmaXggaXMsIGFuZCB0aGF0
IGl0IGNhbm5vdCBicmVhayB0aGUgYnVpbGQgb3INCj4gcnVudGltZSwgSSB3b3VsZCB0YWtlIGl0
Lg0KVGhhbmsgeW91LA0KSSBjYW4gcmUtc2VuZCB0aGUgcGF0Y2ggd2l0aCB0aGUgdXBkYXRlZCBj
b21taXQgbWVzc2FnZSAoSnVsaWVuKSwNCmJ1dCBJIHN0aWxsIGhhdmUgbm8gUi1iJ3MgZm9yIHRo
ZSBwYXRjaCwgc28gbm90IHN1cmUgaWYgaXQgaXMgd29ydGggaXQNCj4NCj4gQ2hlZXJzLA0KPg0K
PiBTdGVmYW5vDQo+DQo+DQo+IFsxXSBodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0x
NjM1MzIzMDc3MTU0MzUNCj4NCg==

