Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC907442C6B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220098.381217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrr0-0008Qh-Ho; Tue, 02 Nov 2021 11:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220098.381217; Tue, 02 Nov 2021 11:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrr0-0008O7-EL; Tue, 02 Nov 2021 11:21:22 +0000
Received: by outflank-mailman (input) for mailman id 220098;
 Tue, 02 Nov 2021 11:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhrqz-0008Nu-E5
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:21:21 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0113dd06-3bcf-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 11:21:20 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2AJpM1014010;
 Tue, 2 Nov 2021 11:21:18 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c33fxg98q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:21:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5011.eurprd03.prod.outlook.com (2603:10a6:208:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 2 Nov
 2021 11:21:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:21:13 +0000
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
X-Inumbo-ID: 0113dd06-3bcf-11ec-8555-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2FgtdLSYYmqLNKmjGJYeijuhQEqgnb8BLmX1tqw1dXra2fen02acPAdYKoEhwI7aOccDrpOTtHecX7+FvksG3Ts0oKVPlyS4EhD0V4qilH7ST/2YEDzZsNxfNYi6ZQWJY02oqS22psH3vbCi6gvs6xnOXh3qcho/64tytGdxTfUkR0/HvjxcWtGr4XmAi15Nbay9snU9pnBfBpkfH92c7iHiljipqeh0NTrqLe31aNQcXqEpTQRS+3LlUxASsMjvnbvEduv4klNMhBX5tmG0IFCWB6Xc9HWFgOESPkmFWefIuu4s7Lne3w4KT32EipvNvdzXJ6A1CGQpXst/zb5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXrkdrj0oNxMbTmbzQlxiA5CYcESU/otI8QXoU8Ip5U=;
 b=AjD9wakoMtCrrM63QrboYTUlmcEnXNt9mUPE2bCbANaVL3UH6RkVgERR15xhVX0zFjwGq6LwFulRpAoxFiD7WXUZSbkCe0gbp0ey7/FaEvrLoSLspziSz1EMMZ5rgIp5pAkI1JQQ4dZWUu7sIWjvigAY6kTuJiAXS/x5W17fE2mRPz01NPRveAkufAxuqwTH8WyZ97xQ2FQoBDeXGJeXBa3vG9vXf689TB9Dwh+6/tihf0BNqW0vjjqJOZn7w1tip4zBspHy2e4/kUO0mGGKSn4MAVzzxMmvtl+5AerjQ23t2pqh8+/9qw/RiueK08Dd6L4kbU/UmNA3M49RnJP/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXrkdrj0oNxMbTmbzQlxiA5CYcESU/otI8QXoU8Ip5U=;
 b=dK4Y2JtEcOYCZ6jQWKRcNFvSwgZgMxjoKF4v0VUtu1+jmvDFOQKqBi5eayMxd1P+ZQfDK5YzSHFnU+ZpeHFb8smlQJhkIw2Ltlo/Y23mWT6c5ng4PkB70h1E/APFb0kivtxKAyR7jSl6NTy5xWOtYgwQXHHBV/1zD2YFE1NeoLlZ+7td+0QTCyWykfO/1Ke7Kv7/a4Q51X9EWo32hptbABqe8l2qa8m0VX6UGLCresZN9IKy5yxKXbAUmWmarMudyA05f3OzCEoMkVIo2O0X6cWy3DifX/fDfS/pMKQR72Yl9vExBByFeKlqsADyVy0DGWgYJHZN+Wf+cfPufhLRnQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Ian Jackson <iwj@xenproject.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers [and
 2 more messages]
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
 [and 2 more messages]
Thread-Index: AQHXzwrVBVHykfdvRUOfqNSizjfhO6vvKqAAgACqWoCAACYdAIAAHlCA
Date: Tue, 2 Nov 2021 11:21:13 +0000
Message-ID: <2ea412d2-0ed2-f9eb-ee56-373bd41cb4b5@epam.com>
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
 <a14ce7fd-c3d0-0777-f0c9-5f7fad901452@epam.com>
 <61c76ed6-e9f2-f4ec-608c-d84bd0e73258@xen.org>
In-Reply-To: <61c76ed6-e9f2-f4ec-608c-d84bd0e73258@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 122148ee-7647-4ea9-e9f1-08d99df2e14c
x-ms-traffictypediagnostic: AM0PR03MB5011:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB50118379161216EFB87DEC7EE78B9@AM0PR03MB5011.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WKNw6bHDrYJ40+Ew8kFaR6jPl8e21iU6sb5hdoNmIRJZdyNdyyqrsDI/t0/XV5S0FB02EERtx2imkudFpM0et5uSbh7m1tZpYCz4oR3o3619wqEGr1r6t1v5BiFq+xkvgvWNhKjilV528/fYR6khOqlMgw2Mq6QCIU9iBrTjc4CAJe547XZWAlDRRI+Bo3PoXuLiz4EDHN1tjOOB49bFl23dTRlzuCiwh8MvLiadTQukj5PLke3nlJT6WEKh4GIkKIGalD4BDvihctfdkos3XYgPy97IEBPXqntmMoKgAxQWooP/MB8mMxjJP28hFnUMOgWuksX483oFz2nW29UirC1GXducsy4L8QvgfToc0yXnSXYAM7GPp38jVDVAmRn7VNX6dLiES2NKRNfFH+W7AAsNIBanRBl5ymAil7kE8d4d8WZC3oq8tstbi2ms07ztVNHxSng/GTVTiOW1DmH2dbpCpUzAnyX1X795IzcP2MMoIrGcBc0TJVDumRVms/NTI54b/2F1Ed5ES/sPYS98C+z4DWCScNTHbfJmVSwgjFAsERfKSykOZnih6YAmd5cBEuLP5aIMvbOcVTaIaW7wqwSP2p8RahA0kxmT6LE8kpmtW3mTU5BWwIhSMv30B4SNPcTtav8QCKxhRvaZsElxYkSXnqEUil0qNGBw4NWJ5ubsCSEj2g+IZS+0wpj0Eb5Dx/S3BfaKYsPJiNVZ6IhwmLdWgjVbCEet6qQ6gVW5h7CQiFifU29V0pFwOEPHINIx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(2906002)(54906003)(36756003)(66476007)(71200400001)(83380400001)(6512007)(38070700005)(31686004)(31696002)(26005)(107886003)(38100700002)(2616005)(15650500001)(76116006)(91956017)(66556008)(122000001)(66446008)(8676002)(4326008)(86362001)(5660300002)(8936002)(110136005)(316002)(64756008)(53546011)(186003)(66946007)(508600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHBzY1Y1MmI1bG1SL25GUU9VT0NLMzUrd3g4V00walNqMGwzaXN6QU01bzNJ?=
 =?utf-8?B?bWxzekNXZUhlNWFFSXRzZVBsbXBqV3h4SVoxdWlCVC9iQ2EyaThwT2VZckti?=
 =?utf-8?B?VTI5bUtIcGF0M2RvRm9yamxFTG5JMFd5UFRPdGZPdjlhMGJGU2E1ZkNOTVVH?=
 =?utf-8?B?VDlVRjd1L2kvd3ptSnBtVjFtUllLUkhzK1FtbWRpUDIwY29rTHo5c1UwQ21J?=
 =?utf-8?B?TWgzYk9LVHN1UEhFakV4T3FoZFdRVkw3OElyaExYNFNGUWFZaHd0clNpVlAx?=
 =?utf-8?B?NmFmQzZ0YXp5QldoakhIdkx0YTJYVnFraTV5NlU4bXpEMSswVHdlYUxnWWtC?=
 =?utf-8?B?TU1tc3YwaDZQdlAxSndmQVhscVlidUUwV1BaOWpWNElqZ1ovVWN0U1IrMThp?=
 =?utf-8?B?WWlZNFJyMzREMEhWWnFHMjlmWmtyY1NXZE80QjY5RnJzaHJaQTZUM3VWa3pV?=
 =?utf-8?B?djBCSXBod1ZweXgwbEZ3amlYR0xaSlRBMi8yWGlhRklHWXh2NldJUmlaTmdJ?=
 =?utf-8?B?MWEyK2NGRUthOVgrcUY2QlExUlZCRnFqVVJZUmlJb3FRbUhLVWV0aTQ4Sklx?=
 =?utf-8?B?dHFsMVV6OUd3ZUQ4aFhuWUJrTjlxRDJ2VVdObUNUd1NjMG1vTmRRT0IwTUZJ?=
 =?utf-8?B?ek11dHVjVHZ1MTNZWWJHemp3MGNZdWtvTTBBSjE5YVpRTGN0UjZGbUdBUzJw?=
 =?utf-8?B?dXRkck1SSEFVbTB5eFpFYVdLOTRNY2k1NkdRNHdHaUxUYjdwTTBwOU94d2U3?=
 =?utf-8?B?Yi9uMDRVYnZwSEpnVE4zdm52anU4OG43ZmpzV3FDTms1U0JGdXgrQXBGNUdI?=
 =?utf-8?B?aEdVRlFkT3l5ZkFpNDh4d01obGFMaXJXaWJPQXIvdXlSMEhtOXdHbWtEanU0?=
 =?utf-8?B?M1kvL3VVZSsrc1p1NVFMU3hrRllTeDg2aEZ5Z29GaGlicGpEV2JCeHBkbmg5?=
 =?utf-8?B?ZUswN01HT3JoZnhTcm5rS0pDb214ckkxeEh5cTBlYU9hM2MzblJhelRqMDJz?=
 =?utf-8?B?bGhPcklQVXN5cWhXckcvT0JzNjA5VjRkUFZMbWFXSW85S2RXM0tKRmQzQmV2?=
 =?utf-8?B?SnhJZHlweGtHS3doejFESU1rWm9DOExKVkZnbmRYRG8wZ0FqTDJ5VmRYZmxJ?=
 =?utf-8?B?SGlLRTB1TDVqZ1YvbDE0cDVvRmhYQ3A1WmtPZmpNM1J6elZjcjNqdDAvTWlQ?=
 =?utf-8?B?RTloNXk4WWN4a254M1hrbTRBS215UnBWUFdqTEkyUmRPdDUyZHRpMzRESWNr?=
 =?utf-8?B?TnpFcFNwWmVwUC80RndJNXFPK1FpVWNZU2I4N3RPbzhFSG5ncDlualg5Zm4r?=
 =?utf-8?B?NXdzVzJBbHBpeXExbmcyQUc3VzZUZXZFV2owa2lMbHlaVjFybkdLeWplVlRq?=
 =?utf-8?B?cXhKTXFWVzhwc1I2azEwUDVEUnRtdGpydGFwV3kzSERlTUcyS1hscThUcEZI?=
 =?utf-8?B?dFpvMjRXd3VodXJXcXdvby9YZmNBbXlGNkFISEllTytoL0lha2pBWENUTW5R?=
 =?utf-8?B?TVBlekpqcXkyY3BaVDkrS0tSWnJFK2NGVTVZME5GOHB5V3VUMUtQanNSYUox?=
 =?utf-8?B?aGM4V3p4QUFiNndjS2dSMVByWTl5cXJiSVF5c3BXdEFudStIdlNEN0tsVEdT?=
 =?utf-8?B?RG5JS3RiR2YxeEM2dHZWRTFvZzVXRjBhQnJFTVZtd25WaUtDaGFNSjcrV25z?=
 =?utf-8?B?VTVrdEpDOE9IZm1ndWdDZ3FCTFl5ZnVIZ2JENjBhNTN5VmJ3d3JRMUxQZUFq?=
 =?utf-8?B?UTRTVFlrbWhJaktRQWl5elllVGliMmtjWk1KSGRBbEV6L0dGUW9KS0k5eDFU?=
 =?utf-8?B?WVV6c0ZBSnBpSUJTSFZpYnpHQ0llcWEwd1RkRVFRUlJDdVg2OGRuVVNSYk9V?=
 =?utf-8?B?TGxSZHZDMlZIUDN0ak5VSzRzK2ExZE5nK0ZRYmU1NThucStid0JmYkVlRS9h?=
 =?utf-8?B?dW1GVWpJU1YvVHo3WG92K3BqM2pSVlhOV1V3ZE0wUnhjS2pod2ZGVE5Kano0?=
 =?utf-8?B?eGhXVXl1Y05YdEg0L3ZtaDJZZ3FQODQ5bHJKWkFwbkNhWmVqa2JRSTc1UE4z?=
 =?utf-8?B?elkrMzYrYjZqc3FDaE5ZSWhNWnV1MGlpMXZneXJHTzFqS291dk41Rzl0R1V3?=
 =?utf-8?B?N0EzbGlybUNKd3Z0VGFNeWFsYy9Hb3p1TFBEdXE5aVdoWHIySFhLY2hEamNa?=
 =?utf-8?B?VGI5VHZSZERrVitjeXJrSG5NZ1I2VUJGaHNySnlicEttM3VtbWN2VGcyOGJM?=
 =?utf-8?B?bHNDWFhJcnR1NnNKYmdoR2RDenpTMHVRaDk2WmlYSXU2RnBHMld1bk12TUdw?=
 =?utf-8?B?aTM5dkRxQTMrNDQ1cTAzQzZySnlrT2lwUE1WOXpyL2I0L0xjbmo3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D79B721F3DDC6458250A67CC727FBB5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122148ee-7647-4ea9-e9f1-08d99df2e14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 11:21:13.6250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCOleA/6pdg2zJKM4jpoeB0XEPvqlrlXENVWmc86NSwuT/WpNFu79PKO3pJVJGimGYqMZeA2m9xucZ3HE4j1wI2vrA1GFq5RuDPNbyKnEhqMFiyb4f9mUcNDrz8imjh8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5011
X-Proofpoint-GUID: kQ4aVs5o007xCa3Ws2Vs-yqAvBrPG6C1
X-Proofpoint-ORIG-GUID: kQ4aVs5o007xCa3Ws2Vs-yqAvBrPG6C1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_07,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020067

DQoNCk9uIDAyLjExLjIxIDExOjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5k
ciwNCj4NCj4gT24gMDIvMTEvMjAyMSAwNzoxNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pg0KPj4NCj4+IE9uIDAxLjExLjIxIDIzOjA2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+Pj4gT24gTW9uLCAxIE5vdiAyMDIxLCBJYW4gSmFja3NvbiB3cm90ZToNCj4+Pj4gSnVs
aWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIHhlbi9hcm06IGZpeCBTQkRGIGNhbGN1bGF0
aW9uIGZvciB2UENJIE1NSU8gaGFuZGxlcnMiKToNCj4+Pj4+IE9uIDI4LzEwLzIwMjEgMTY6NTQs
IElhbiBKYWNrc29uIHdyb3RlOg0KPj4+Pj4+IFRoZXJlIGFyZSBhIG51bWJlciBvZiBwYXRjaGVz
IHRoYXQgSSdtIGdldHRpbmcgQ0MnZCBvbiByZWxhdGVkIHRvIEFSTQ0KPj4+Pj4+IGFuZCB2cGNp
IChhY2NvcmRpbmcgdG8gdGhlIFN1YmplY3QpLsKgIEFyZSB0aGVzZSB0YXJnZXRlZCBmb3IgNC4x
NiA/DQo+Pj4+Pj4gTW9zdCBvZiB0aGVtIGRvbid0IGhhdmUgNC4xNiBTdWJqZWN0IHRhZ3MuDQo+
Pj4+PiBPbGVrc2FuZHIgd2FudHMgdGhpcyBwYXRjaCB0byBiZSBpbmNsdWRlZCBmb3IgNC4xNiBi
dXQgZm9yZ290IHRvIHRhZyBpdA0KPj4+Pj4gcHJvcGVybHkuDQo+Pj4+IE9oIHllcy7CoCBIb3dl
dmVyLA0KPj4+Pg0KPj4+PiAxLiBJIGFsc28gd3JvdGUgdGhpczoNCj4+Pj4NCj4+Pj4+PiBJIGFt
IGZpbmRpbmcgaXQgZGlmZmljdWx0IHRvIHNlZSB0aGUgd29vZCBmb3IgdGhlIHRyZWVzLg0KPj4+
Pj4+IEl0IHdvdWxkIGJlIHJlYWxseSBoZWxwZnVsIGlmIHRoZXNlIHZwY2kgZml4ZXMgd2VyZSBj
b2xsZWN0ZWQNCj4+Pj4+PiB0b2dldGhlciBpbnRvIGEgc2VyaWVzLg0KPj4+PiBDYW4gc29tZW9u
ZSBwbGVhc2UgY29uZmlybSB3aGV0aGVyIHRoaXMgaXMgdGhlIG9ubHkgdnBjaS1yZWxhdGVkIHBh
dGNoDQo+Pj4+IHRoYXQgb3VnaHQgdG8gYmUgb24gbXkgcmFkYXIgZm9yIDQuMTYgPw0KPj4+Pg0K
Pj4+PiAyLiBJIGhhdmUgbm90IGhhZCBhIHJlcGx5IHRvIG15IHF1ZXN0aW9uIG9uIFdlZG5lc2Rh
eSBpbg0KPj4+PiA8MjQ5NTMuMzQ2MzUuNjQ1MTEyLjI3OTExMEBtYXJpbmVyLnVrLnhlbnNvdXJj
ZS5jb20+Og0KPj4+Pg0KPj4+PiDCoMKgwqAgVW0sIGNhbiB5b3UgZXhwbGFpbiB3aGF0IHRoZSBw
cmFjdGljYWwgaW1wYWN0IGlzIG9mIG5vdCB0YWtpbmcgdGhpcw0KPj4+PiDCoMKgwqAgcGF0Y2gg
Zm9yIDQuMTYgP8KgIEFzIEkgdW5kZXJzdGFuZCBpdCB2cGNpIGZvciBBUk0gaXMgbm9uLWZ1bmN0
aW9uYWwgaW4NCj4+Pj4gwqDCoMKgIDQuMTYgYW5kIHRoaXMgaXMgbm90IGV4cGVjdGVkIHRvIGNo
YW5nZSA/wqAgU28gdGhlcmUgd291bGQgYmUgbm8NCj4+Pj4gwqDCoMKgIGJlbmVmaXQgdG8gdXNl
cnMsIGFuZCB0YWtpbmcgdGhlIHBhdGNoIHdvdWxkIGFkZCBzbWFsbCBidXQgbm9uemVybw0KPj4+
PiDCoMKgwqAgcmlzayA/DQo+Pj4+DQo+Pj4+IEkgbmVlZCB0aGlzIGluZm9ybWF0aW9uIHRvIGRl
Y2lkZSB3aGV0aGVyIGEgcmVsZWFzZS1hY2sgaXMNCj4+Pj4gYXBwcm9wcmlhdGUuDQo+Pj4+DQo+
Pj4+IE5vdGUgdGhhdCB3ZSBhcmUgaW4gY29kZSBmcmVlemUgc28gYWxsIHBhdGNoZXMsIGluY2x1
ZGluZyBidWdmaXhlcywNCj4+Pj4gbmVlZCBteSBhY2suDQo+Pj4gSGkgSWFuLA0KPj4+DQo+Pj4g
VGhpcyBwYXRjaCBbMV0gaXMgYSBzdHJhaWdodGZvcndhcmQgMiBsaW5lcyBmaXggZm9yIHZwY2kg
b24gQVJNLsKgIFRoZXJlDQo+Pj4gaXMgbm8gcmlzayBmb3IgdGhlIHJlbGVhc2UgYXMgdGhlIHNv
dXJjZSBmaWxlIGFmZmVjdGVkIG9ubHkgYnVpbGRzIHdoZW4NCj4+PiBDT05GSUdfSEFTX1ZQQ0kg
aXMgZW5hYmxlZCwgYW5kIGl0IGlzIGN1cnJlbnRseSBkaXNhYmxlZCBvbiBBUk0uDQo+Pj4NCj4+
PiBBdCB0aGUgc2FtZSB0aW1lLCBhcyB3ZSBrbm93IHZwY2kgaXMgbm90IGNvbXBsZXRlIGluIDQu
MTYgYW55d2F5LCBzbyB0aGUNCj4+PiBjb3VudGVyIGFyZ3VtZW50IGlzIHRoYXQgd2UgZG9uJ3Qg
bmVlZCB0byBmaXggaXQuDQo+Pj4NCj4+PiBHaXZlbiBob3cgdHJpdmlhbCB0aGUgZml4IGlzLCBh
bmQgdGhhdCBpdCBjYW5ub3QgYnJlYWsgdGhlIGJ1aWxkIG9yDQo+Pj4gcnVudGltZSwgSSB3b3Vs
ZCB0YWtlIGl0Lg0KPj4gVGhhbmsgeW91LA0KPj4gSSBjYW4gcmUtc2VuZCB0aGUgcGF0Y2ggd2l0
aCB0aGUgdXBkYXRlZCBjb21taXQgbWVzc2FnZSAoSnVsaWVuKSwNCj4+IGJ1dCBJIHN0aWxsIGhh
dmUgbm8gUi1iJ3MgZm9yIHRoZSBwYXRjaCwgc28gbm90IHN1cmUgaWYgaXQgaXMgd29ydGggaXQN
Cj4NCj4gSSBjYW4ndCBzcGVhayBmb3IgdGhlIG90aGVycy4gSW4gbXkgY2FzZSwgSSBkaWRuJ3Qg
Z2l2ZSBteSByZXZpZXdlZC1ieSBiZWNhdXNlIHRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBi
ZSB1cGRhdGVkLiBJZiB5b3UgcmVzZW5kLCBJIHdpbGwgaGF2ZSBhbm90aGVyIGxvb2suDQpTdXJl
DQo+DQo+IENoZWVycywNCj4NClRoYW5rcywNCk9sZWtzYW5kcg==

