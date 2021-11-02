Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CED442BD4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220038.381124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrLB-0000m0-Px; Tue, 02 Nov 2021 10:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220038.381124; Tue, 02 Nov 2021 10:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrLB-0000kH-Mb; Tue, 02 Nov 2021 10:48:29 +0000
Received: by outflank-mailman (input) for mailman id 220038;
 Tue, 02 Nov 2021 10:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhrLA-0000kB-IP
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:48:28 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b36d2201-f242-4175-9be8-58682af54b78;
 Tue, 02 Nov 2021 10:48:27 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2AJiAT013389;
 Tue, 2 Nov 2021 10:48:22 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c33fxg4fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 10:48:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4020.eurprd03.prod.outlook.com (2603:10a6:208:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 10:48:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:48:18 +0000
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
X-Inumbo-ID: b36d2201-f242-4175-9be8-58682af54b78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWTMhWAisbug5goOpWwhnk4Ff2KnRq9V/ScyxfrnP+8DoOLL5137caRo3xUEzeVgkYvJiDvAjiTEhoZKj6gLHAslSyVJ4aEhBXxBKaZ6dt2ii9k35yzq1QNYoJ97xU/NfwKV/8zWZcMLrvet7VJFOEyWkUuclfglkz5NW93Fo5/W+norx6JfALSsuE0QA5J25ZvkFmLg396jQvx1XHnrHegu6loJHExNAireSsiFmXCsU4mt/f02G4kihxyKCFvezzl4mXm6l57kWwtQs48mz/qCWBF+JNePAz/ycjXzbr9lWNZwFN5B8E4SuxyBJ9PQgCSHdjMRYtsYU3lfi0tHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brPnHj7mXniA8xFQaXIirWOF0xVoPP44xmFnPmgiA44=;
 b=XAT6SSguMmTIUnRhwTdDA4UiBFmXCctBloMwLGyyl1Ucx+rYpoYcdefFEEvyMvSmiFv2yqy9uInkwDebkd0R6zACQIbkdpiY/hUlTQuT7JUYjTwN/wo3IPg6lc55DIBuxQAF8I/8O6szL9+CEtWGAeW9fVT4FPXXMMLqNZbc9/huM6wuo4q7XtZk9Q6bX8QHxV4W6yklj4C1CF4RVUSseUEboSyFpgmzqAgAJuG7exdKwpgXmdk64YZQZvl/wCw4CEWKc9whevWKJYFlVu9pMGq41aBIpb8yEY64n95bjd5vTBonvMet3iEeEVhbzVeVAkrnlTpvTRn6TSsJreCctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brPnHj7mXniA8xFQaXIirWOF0xVoPP44xmFnPmgiA44=;
 b=c2PLLOx5RGbZvQrpjrqqg4gntZtIv5UL5b7KFyobgGLPF+c6GPqV7btpV9sh0Mu2KvwJysjXTx1WvScMy0SLS5fkKtGDOaoH8wk69hb5jPIZsm7fHsPrzeOO9cU/C3CqFC3qyycnKRsA3CQPWE+7JIspGNyt5wdAW0aon7iXSRKJ0CKmMhnnTeTndgwTBiipUl4Mtw5SDY2SiRHsl0TovgvHPNhEv0T33tZ2dZzDkbI3NNCGW/TAFZ0/o09CKFR9zKYmKwIh/ylfzNST4DPQddURwD9Bg8/3x/lV4WQXaMyClgYrwi4b48mjCDy5LFFYiATk5GKMy3PAtl9rHUrVsQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Michal Orzel
	<michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAr/CAA=
Date: Tue, 2 Nov 2021 10:48:18 +0000
Message-ID: <7f4fb8f4-499f-5b98-dd6f-9f730bf9dee3@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
In-Reply-To: <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e64e6181-4323-47d5-1569-08d99dee482f
x-ms-traffictypediagnostic: AM0PR03MB4020:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4020C010F5E6052161006771E78B9@AM0PR03MB4020.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9BO40hrVGEQx6/6OK/E6LEM+wBAC459Kvu86QF3fakwLNtU78EakyiND+0a94Ed4HNbflwmd0AYnQhfgQkOEBE51L1EbLcRBkjtl8LFQq+fUFQKE5oL/B30uIsvYCtUmtqfEmDeqZKKadudRQybeaMLR8THAycoxuG+7HYzlHRX43ZCO3R5H0vLJK6AyM1DyALfhvXVB305mfTWfHCm4huuU7wGyDUMa3P11HeIA1NY3t8arxg09RZ51IHOPt5b1wrFTpetRbmGT1OYRcjCfPm1wEQrDoNbGFxsAF8WtqgA2U5Task5u+zpsPqeuUiit/605t0glXuHu6FSOVZwdHrKlkuHBUmEU2dBSFX8ArjnSfkPLGLqZP5WaGwDFHfeqk3uXRRVxP81AOGyPsqv8tqaOGUITeIFOvHHuaVq+BZ0iu7kN1kjhpSdzes1cldZ8kC1NBYK6KqGqWHv2EgrXkKcmAVsDemlAwvRCkhvdoW6E13M8kwqX+pP7Qrzi9WAPeoFxCDrsI5xchZ+2mDy0Y3oP3Iecopcyp5od8fXuX9TMmD6zRIFszuPwpdhKr7hGqsjyJNP3ppDi97OxV63Cp8rAv2zU2mil9GqU1GB/AqIJBqmrEAsCvJNcjBWdmrxlWsWBIP48MQK0J9WBh5y8Zo76KEoyfbLX815SHgwt4X8SMbXKVHvEORb7mmZvECTD+8onjD2ykr23xhuR5rWqfQdJ+j5tJ5vFucsa75C6wY8fXM4DZ2TARofGx7tFAdbL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(186003)(6916009)(6506007)(122000001)(31686004)(107886003)(38070700005)(6486002)(5660300002)(4326008)(38100700002)(8936002)(54906003)(86362001)(83380400001)(91956017)(66476007)(2906002)(71200400001)(2616005)(6512007)(76116006)(66946007)(508600001)(53546011)(8676002)(26005)(36756003)(66446008)(316002)(64756008)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1JMUnMxcllJa1pJQWtKWm9hTmJrWWIvUlFsN2tUNlZWcjhoY2dEaFRUcUVB?=
 =?utf-8?B?aXFCdk5KbXNuT2JaMDBGdW9XbFlTTlN3b2ZHZTVrSmZmbCt1Uk9HdjJWM3N4?=
 =?utf-8?B?K3BKNTBnMVFkc1NGeDVlOW5HcXBOM1hJYVF5aTZseUdjOGlzNGd2bXdOZks0?=
 =?utf-8?B?dzJSVWVOZjVCQ2dpVURHSFE0eGdOb1QzSnU1MWNZb21PaTR6dnZTNGs4UmQr?=
 =?utf-8?B?eVFIcEpSUUJySGtEOUJvOHFQbzZLMStqaVpLdEYxYndSWVQ1QVdzOERQYVJ2?=
 =?utf-8?B?VUt2ZWpuOEtDQ1BUNUVkbmYxQXRzVzZrc1lmeGF0bElWU1dvMVFOcUlKMCtO?=
 =?utf-8?B?aUVBM3VwS0NQTzBDYWp6U0IzZkpic1kwdGhEYmxadzFUOEc0eVNRQTlzUDg0?=
 =?utf-8?B?SGx2QVNPSk1jUkpneGk0Y3BxRzdXSTJna0cxL2FuTDl0WjR2TFhJWS9VNlpT?=
 =?utf-8?B?WU54TDBXLzZRZ0VNYzV5R21GU1Jlb0lad1hrSElZalJ3alg1dzRqaGhkWmd2?=
 =?utf-8?B?QmRIZUhTVEthMHcrcmVBaENEZDRJRSswMUk3QTg0dTFldlhDWG9rR1k5VDAv?=
 =?utf-8?B?eWhKSUswSVNLckJDSzdyM2Iya1BVR2JZUzRITlZ5Z3pvdlFKU2hHemh2Q3Nz?=
 =?utf-8?B?OHU5WStRMCtKSjhjSzZudjVoTCtVd1hwQ2RlWTBrc09ScFBoMTRZSnF4K2hZ?=
 =?utf-8?B?OTYxZnVBenh6aWJFRjAyZWtSNW1DU3haNmd6QXhqa2syZStwcHoxOVg0ak1R?=
 =?utf-8?B?WjdTOTFBSW84OEFZeDA4ZlFnTTlWNy9NQWpCVXNITXY3anArN2hxblZ6T2U1?=
 =?utf-8?B?VkI3RlM1OWJnM0d6TjhWTU0ydFpPdko2dVRvL0VXZGY0cGNyTmhRMjNaTDRX?=
 =?utf-8?B?cS9BeGdOVmM2Y0RScm1PNEthTThEcVdZUWZydnZRZDJ1TWQzZXhWS2lmcGxE?=
 =?utf-8?B?VXJCVkxRQjRBUTNhdG5KNVpFMjNUSWFGYlJoOGhDMkhwOTdHd0wyQWhTV25O?=
 =?utf-8?B?clJ0bFpwY2Z0OU1JYk82VkdEN3E0TkdEZER3QTlSQnFLOWRxNGFhdkxlZEk5?=
 =?utf-8?B?cGU3am1xRG9ueHpnZUFZTEFuZFgrbExnSkNpQjFhUk51ZjExdFNiOTB0MEJS?=
 =?utf-8?B?R2dWS2NpcWYxeXhUNEhZeUdyRVN5MGcrNDVhemZmeGh5Ulo2WWEyU2FINTds?=
 =?utf-8?B?UFVvM3hta3NuTldEams5dEdxRGhoQm1MWkZRU3QyeERkd2tqWW1XdDhvU1Fx?=
 =?utf-8?B?anJIOHdnS0dVL0M3TjhhWXFtM2M0UjFVbXdsTDB1VXJ1SG0rK2szTm1nUDFB?=
 =?utf-8?B?NC9mSnpwL1FEMm1zODY3blpEVGhvc3BOV2M4a0trY1ZiRTdUNk50UkhseENs?=
 =?utf-8?B?cmwzQldrMFpJNVVoRjMyV0F2TjB6LytOQjhuNjVJdmhzQjNnbndXT3hYVFpF?=
 =?utf-8?B?aU15MjlRYm93RjZCT1JDQkF3YjhWVjVDMm5RVW1Ta1NBa1R4U3pEU2xpNEtS?=
 =?utf-8?B?WE9iSEJqSDN2MW0zUFFFdFRKSmRONkE3STlTZFVBVi9Edk1JYTNVZlNhUmpl?=
 =?utf-8?B?ZUVCdVMybFlOSmVzNXpDc0J1V1pQN0c1WXJlcWQ0b0lRS3lpTGx3WFh1Vkkv?=
 =?utf-8?B?WHdBaVpGdWo5NE1OakNHQmxqdFpaNmlzaXhGQkRpVUVZT1UzTHRLaC8wSTNZ?=
 =?utf-8?B?VUl1RTlzZXUvUDJMRkpxRlpoazV0SWFjaXhWWUV5VnJ6TXZmUHZ5QUtFbzBL?=
 =?utf-8?B?cXFYMUFWR1NpWEpPRUl3cERVeWNTSVMzbXZyclNLdk9mQXlWeE9xNk1veTZ0?=
 =?utf-8?B?TmlvWlhscU1Udm16eGJjbUpyQlphYzVnL2laTWdyYlhTbGlZRU1aMlF1bnhz?=
 =?utf-8?B?SkVMTnRIVnpwK3UvWWYvTnEwQ1p3UFNwWVNqZDFuOCtCd3U5UHVRdzJ0UzVM?=
 =?utf-8?B?NGlpNUQ4bTdnekVSbTc0am12RlVpSkIwQXVLMjMvZlliUVYvUFExRTlpZ29m?=
 =?utf-8?B?U3AzOFNUdnZRN3VRUDFId1dTcEM1Q2c2eWZUSk9ORVN5MWpLYUx6aHhZV1ln?=
 =?utf-8?B?VkZFWjEwUDhuSHgycmg0Z3BFN1prK3MwTmNPUmpoMXNQaHROdFpZUHcyemxi?=
 =?utf-8?B?KzZDMHBPdXRRWVhYT2kzL1EvZDVmYjd4alR5d2k5d0lqL0xENWlXS0hzTDdN?=
 =?utf-8?B?bE9NSmdiWWxtMjlVT3Z0M0hxSmZIRGJXVUVOVW1Ud2Nic1dIb2tHVmU0bWM4?=
 =?utf-8?B?WDJnSHpsMWQycXI1RjdzMWsxWE5pVzJTS2hZQjZLVDJjamFRWlU4QmNEZVRI?=
 =?utf-8?B?SHlkY0Z4TGJMMGllaFRleXhuMTdKT2xHcWxjV2NZbGYvY2VlNWpoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <757AA190E0421B4792CC6BCC62BE443F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64e6181-4323-47d5-1569-08d99dee482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 10:48:18.6915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zG6w5kK/YSC1jIrawMkclRQ4c3UhEGDWVR0qtWwiMMh97RjITwc8h0hZVLpTJ+TC8gKll38LGEVJ7mwEgUBrrUPWTlC4XffZulJJcyJFUTNoU8Y5QP8u+Sg3phdt3+di
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4020
X-Proofpoint-GUID: iMbdwFffYZcEfd22a8TU6uMd_UBrEb2B
X-Proofpoint-ORIG-GUID: iMbdwFffYZcEfd22a8TU6uMd_UBrEb2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=655 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020064

SGksIFJvZ2VyIQ0KDQpPbiAyNi4xMC4yMSAxMzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MjBBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIGJhc2ljIGVtdWxhdGlv
biBzdXBwb3J0IGZvciBndWVzdHMuIEF0IHRoZSBtb21lbnQgb25seSBlbXVsYXRlDQo+PiBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUgYml0LCB0aGUgcmVzdCBpcyBub3QgZW11bGF0ZWQgeWV0IGFu
ZCBsZWZ0DQo+PiBhcyBUT0RPLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IFJldmlld2Vk
LWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhcm0uY29tPg0KPj4gLS0tDQo+PiBOZXcg
aW4gdjINCj4+IC0tLQ0KPj4gICB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIHwgMzUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBpbmRleCBm
MjNjOTU2Y2RlNmMuLjc1NGFlYjVhNTg0ZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC00
NTEsNiArNDUxLDMyIEBAIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2
KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBn
dWVzdF9jbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGNtZCwgdm9pZCAq
ZGF0YSkNCj4+ICt7DQo+PiArICAgIC8qIFRPRE86IEFkZCBwcm9wZXIgZW11bGF0aW9uIGZvciBh
bGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+ICsNCj4+ICsgICAgaWYgKCAo
Y21kICYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFKSA9PSAwICkNCj4+ICsgICAgew0KPj4gKyAg
ICAgICAgLyoNCj4+ICsgICAgICAgICAqIEd1ZXN0IHdhbnRzIHRvIGVuYWJsZSBJTlR4LiBJdCBj
YW4ndCBiZSBlbmFibGVkIGlmOg0KPj4gKyAgICAgICAgICogIC0gaG9zdCBoYXMgSU5UeCBkaXNh
YmxlZA0KPj4gKyAgICAgICAgICogIC0gTVNJL01TSS1YIGVuYWJsZWQNCj4+ICsgICAgICAgICAq
Lw0KPj4gKyAgICAgICAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4gKyAgICAg
ICAgICAgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7DQo+PiArICAgICAgICBlbHNl
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgdWludDE2X3QgY3VycmVudF9jbWQgPSBw
Y2lfY29uZl9yZWFkMTYocGRldi0+c2JkZiwgcmVnKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICBp
ZiAoIGN1cnJlbnRfY21kICYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFICkNCj4+ICsgICAgICAg
ICAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+ICsgICAgICAgIH0N
Cj4gVGhpcyBsYXN0IHBhcnQgc2hvdWxkIGJlIEFybSBzcGVjaWZpYy4gT24gb3RoZXIgYXJjaGl0
ZWN0dXJlcyB3ZQ0KPiBsaWtlbHkgd2FudCB0aGUgZ3Vlc3QgdG8gbW9kaWZ5IElOVHggZGlzYWJs
ZSBpbiBvcmRlciB0byBzZWxlY3QgdGhlDQo+IGludGVycnVwdCBkZWxpdmVyeSBtb2RlIGZvciB0
aGUgZGV2aWNlLg0KVGhpcyBpcyBub3QgYXJjaCBzcGVjaWZpYyBhcyB3ZSBqdXN0IGRvIG5vdCBh
bGxvdyBJTlR4IHRvIGJlIGVuYWJsZWQNCmlmIE1TSS9NU0ktWCBoYXMgYmVlbiBlbmFibGVkIGJl
Zm9yZS4gVGhpcyB3YXMgZGlzY3Vzc2VkIHByZXZpb3VzbHkNCihKYW4pIGFuZCB0aGlzIHdhcyBw
b2ludGVkIGFzIGFuIGFjY2VwdGFibGUgYXBwcm9hY2ggdG8gbGltaXQgdGhlDQpndWVzdCBmcm9t
IGhhdmluZyBpbmNvbnNpc3RlbnQgY29uZmlndXJhdGlvbg0KPg0KPiBJIHJlYWxseSB3b25kZXIg
aWYgd2Ugc2hvdWxkIGFsbG93IHRoZSBndWVzdCB0byBwbGF5IHdpdGggYW55IG90aGVyDQo+IGJp
dCBhcGFydCBmcm9tIElOVHggZGlzYWJsZSBhbmQgbWVtb3J5IGFuZCBJTyBkZWNvZGluZyBvbiB0
aGUgY29tbWFuZA0KPiByZWdpc3Rlci4NClRoaXMgbmVlZHMgdG8gYmUgaW1wbGVtZW50ZWQgb25l
IGRheSB3aGVuIHdlIHVuZGVyc3RhbmQgd2hhdA0KdGhpcyBlbXVsYXRpb24gc2hvdWxkIGxvb2sg
bGlrZS4gVGhpcyBpcyB3aHkgSSBoYXZlIGEgIlRPRE8iIGFib3ZlLg0KPg0KPiBUaGFua3MsIFJv
Z2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

