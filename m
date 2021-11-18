Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDB455814
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227253.392995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndmu-0007dO-8h; Thu, 18 Nov 2021 09:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227253.392995; Thu, 18 Nov 2021 09:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndmu-0007bF-4b; Thu, 18 Nov 2021 09:33:00 +0000
Received: by outflank-mailman (input) for mailman id 227253;
 Thu, 18 Nov 2021 09:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mndms-0007b9-R8
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:32:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82aa87dd-4852-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 10:32:57 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI6Xp5o012873;
 Thu, 18 Nov 2021 09:32:54 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cdc4kh853-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:32:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7427.eurprd03.prod.outlook.com (2603:10a6:20b:267::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 09:32:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 09:32:51 +0000
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
X-Inumbo-ID: 82aa87dd-4852-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+OLJXVQIfDmajoPiQTxdJZMNGOf1rraCC45rt/wbrxu8AuTrrxed/ss66/3QzXKKiE36O36dx58QWa0CCxYK6TKYL6j99/DIhlTazg0h82K3YByfpm/lXUfeJl1X1C4pEzsf1GFIiyeKaYU/5cBakBBfXPsqDEQUIQy6WomVaI/ROvv62U+zCzk/+1oGXWWvwhtv9LIlUBteMfood+NsoIRLzK0Nl+5H7PrS6TvpeZVT3NiSMPxcW3v+PYozUQCbZ1wptGByOVCllSwrfXpBTHj4SUMaWlmtWIxI5yaIUFohSYRBuIOxaP2VjLpbAO6v8eOpcQuwXF+aF24R7/xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3Q05aaD6d6aRKdufVlG1cq8/91qZuyaHzj40U6mZ34=;
 b=GWkGpsSLkUviOKcE8s+t3RPgJYZXpLiebHfhlKj9nhpeMy+s4+PBgbil0Bsieqz4bpFuh+lmlYq9OlOv8yB4Mn8+1VRuIFEg5SlIIb4CyGcrjpRd7uG4cmVXAq73T0573LmpaY3oIb2giODn18LKcSqDwLAsK2cxB0G51NoUoDmNUnaYB42X5BBHapXx1yTZty7sqnosPtwFZHGTpbmysgFq4z3N8FDLC+cTBBwH6Us4YgEZ/BTDW4icy40HrU3cwoE32SmRxzPlHYs8Y2ljrx90e9/ABaysTs5ZKbqVL7AE5MdXKd2TU0mOks2Or9FDCjXUZ/EK2ohR0eRC4Q5deQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3Q05aaD6d6aRKdufVlG1cq8/91qZuyaHzj40U6mZ34=;
 b=of/dV2a5BYgYbMs//cSXBwXWaPnen/cXR1IICYvCQmsyJdz3pg5Z9F20XyCaybbkdnNzZcsDZCptBO9Q3oFbuEul5qrpvJq271r8BN4CJSzJszsJyOflJpbB1WpuMqTIB+0RqA68NsuxaxfPptIBphZar+hNONh3D0LqL3faU15ltq7T9OOJmMOVS+CslikeoWMaUSc7qHnOt7YwX2DKXNthF3Ol+8y9kV0vfMqE4jmr/+TkMzMMYVawdzMF6g3pJsNahG5ha75B2BTQ9GdbrRQBJ/sGQ99rJ11k2em19S7wnUgtPm1T1MaBC4KZJb7LDDS1ZMa5Z7G98Re6O+9Ewg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAA==
Date: Thu, 18 Nov 2021 09:32:50 +0000
Message-ID: <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
In-Reply-To: <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e213129-6806-4587-a41b-08d9aa76640b
x-ms-traffictypediagnostic: AM9PR03MB7427:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB74278F5B945273BCB34714E3E79B9@AM9PR03MB7427.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UlKp+1zJ9mi1UQmg70AJrI6BS9kcam8jAq86rJ2BWLSRTKIERmvSGN8BbTXtXlABibb80s0WXF5xG+JtEqZ4jEUaTdIZpHy+HJXUhVC+azdJHZpNnYA/r1A7UwARhrbKJ2w0Snm1yGyeCZ/Hn9Czi4yY31A/1k6EFHPIZ6X0NpaK4Mq6Rp6YT79zyHZVciOYxjn9/E9uALQ51eYR3ClKkQ1ctrOyn7xyIz8OiPm+QLDJUQUJKCM1L8MXMVZ3N14KmoIpIxdukcAOZvPtVeUeZuj9k8WO5IxxkQ102qkoz6xYlNc6ioArVABMuQ93DjLRABgAiwyMKp4jYOhcWKGJZsKQiIo5VoCvpFtnJIb3mkt0WSe8unG6RNj8FwN0Y8iVD8YmyJGNuQDq19HoS/iNtyjC9KG+tc/te0XH8azDsDj4dknm+McASXXx6NObcbEM0Wbbou2vgSy2y3iWO1HTQF1tshmsVVJdl2FknjC/rzVODOJqENFhvV4HuGhB6QQTqArz4oeJHqoEsjS645Woe4upMT23PocnCBykPmn8lX4O9Uen2/Jp2V5zL4zyVzCOtpfGgrfh5JZb4YWi5/IDiLutoy9YopJlwM3laX/CzLLp2OOsLMJ3C0NxUxjlJi6EOycy6rXzU6lxU5LetBu+N+TApzjib97pxnDWKj+DD5XGbmwNqywobTMPJrlbfkK9hYhzoHIMyuXq3VjBbxTWzVJTQYl5qJoaQxygWOyu/uiJNvaj+zJzdM308S57jqso
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(2906002)(54906003)(186003)(36756003)(316002)(6486002)(71200400001)(38070700005)(5660300002)(2616005)(7416002)(6512007)(86362001)(6506007)(8936002)(83380400001)(122000001)(38100700002)(31696002)(6916009)(31686004)(66946007)(8676002)(26005)(508600001)(91956017)(66446008)(66556008)(64756008)(66476007)(53546011)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXV6S05hc2I2M1FlcGErV2VCTll5VmhnM1Q0SDhxMVp5blNYTzVSS1RUejky?=
 =?utf-8?B?Q05vc2lQWlQ4MXZDbmJ5MXh6TGV4MVdLZ0w4VTRjQ2NZNHFDaUF5TE9sQUZw?=
 =?utf-8?B?S2NzRzBkUEdwZVNRV0xhSUFpSVd6VTRJWU9YcFd0UTJxaENKZDdUWkVMekpy?=
 =?utf-8?B?cmpmM1UwVWRKemRXcmFBd1dMazArdUF1QjlkMW9QWnl2V3RnVzk4Zk0ycnlW?=
 =?utf-8?B?RW0zTVhZOXN6bytuMFZzc1FualJYcGFzUnNtV201K1ZhbzBpQXJpZFV3Y2NS?=
 =?utf-8?B?NlF3SUh2QktIcU05RXN6T2M1bmNXTFVqWGw1ZDI5b3BMcFIyUHhGOEZlbDF2?=
 =?utf-8?B?aWVoWTcxcUlLTHcxOXZ4MGRreU95aHViaW95Mi85WGRRQU1NK2QzZE83R2FB?=
 =?utf-8?B?N3BmU1ZRZ21vc05nZ1o2eHk5ZHFXdHMvT2hvSlNvWTdyVW13a29WSGJSa2dJ?=
 =?utf-8?B?YzF4SFJMQVp5YTdPQjM3TDkzU0QvKzNEWTd5d0E3bWNJTVJRUUhpd1B0Sklv?=
 =?utf-8?B?ZGROOW9scHAzb2t5YVVkajFaZTFEdW8zWGp6ZDRHVFhrYmJ3cnZtSVZvUVhh?=
 =?utf-8?B?YUlnVW0rL1ZSMEtmb3RiUGhZL1M5dldQTkdrWmpONnU0WkFVYUJBNW1EWm1y?=
 =?utf-8?B?NTF6aUQ2OFR3M0F1REJtTEVCTzRpWmdkSmVxcTd5WXc3YVdqaWpWY0pqbmwz?=
 =?utf-8?B?WURWVCtzK1hyT1A1NXJOSWh1alBlTUJLaFJHOUp5b2NkZmFGUXhyYkZVa1Rr?=
 =?utf-8?B?Sk5xMUU4bHlhQTFOSmp1NGxQQjhxVmZ6VDdnRXByYlNKUmRQUzBSTCtrY0Yx?=
 =?utf-8?B?MThmM3k5NW1jWXNFZjVodGRvMEZ5bjlkeUk5eDhXV09ET0xXWUQ5S3hmaHhr?=
 =?utf-8?B?YktNTGw4aXJYM2VSSm5rUmljNHM5SWtoV0hkdjBHY2hDVENXZEQ2R1h3bWpr?=
 =?utf-8?B?QUhTakRFNm9WckpKQ0FIL1FjY1h5bFo0TGlTdXYzdzc2U0w2OFkyNHZYcVpo?=
 =?utf-8?B?bDZ0dExMbm5mOWpXenRMZmNOT202aTNqckhpcFlCcjV6VFZsZHVvS1FJY2dZ?=
 =?utf-8?B?bmZ2V2RiUTI2MWZ3QkVSOGxuVm1ubzAzTzVjQ2NxQWxwOUpIdUdsNzdzM1Bw?=
 =?utf-8?B?N3gyY1ZMOHdKbDlGVEczSmNvOHBsWmsxemNpZ1o0cy9hRG1WVEQrdzlZS1Ix?=
 =?utf-8?B?QWpmYXorZXN6MlV3QmxvSDJqZTRGbmJ2eW5WV25zWWNiVGtPT0VsT1krM3gw?=
 =?utf-8?B?bStMRTFSSnVOK0xOL1dSSnQ0TmsrakpqaUhvaGVWd1pyQmJnOS9DcFBTV2c1?=
 =?utf-8?B?cDlENGxGYkVRVk1VaURxcWRKZS9mSkhzMFkyQmF2c2dCbHhkVHRLN2w0RDc1?=
 =?utf-8?B?OUNrdzlPbDNzR0wxYWl2dVVZcnNvWUNmdWxtREhZQXRPL1Y4NVVvZjdvMWlJ?=
 =?utf-8?B?aVY2TlRjTmpQazUxMlpLaDhqR1dXVTNUZ2orWERHWVhZS2VRdEFrZUY5QmdG?=
 =?utf-8?B?SWczWHFSRVprN3NUMTJTSUZmditDQlpMV2M1bXdZQlJab2FBWkIvZWlFSVh1?=
 =?utf-8?B?dzZjUjFKN2hPdjVYSGFQZTBrRExWaktnYkpYajhlaHFqOUE2eEU0SjFSSFdK?=
 =?utf-8?B?QzB0MnlqaVg4Y2RLL3RnZ05yYTlQUFJwdlh6djNYMEhmMFk4U0w0WE1Ca3Ni?=
 =?utf-8?B?RUtGUzNMWkMzZHdUV1QxUFozT1pqeFJGZEE4Q0xiK04zd3EwUWh3UTBwaUVa?=
 =?utf-8?B?K3dSWWlvRC90a0p3ZlVnaVcwczBVY2dkOUcxWUt2K2E5S0dJOGowUk1XUTNT?=
 =?utf-8?B?aWovNFFXbVBZaUhzbUl4a0JWclVsWC9qR2RHUUlteFh2NDE3UUpQVkcyWE9h?=
 =?utf-8?B?YVNETHlVVEQwaWdiTzU1RUJ0c0l6UzhvWDdmTlpnSUhOM3JrWDA2TDJxVjAw?=
 =?utf-8?B?cmZlRjlvQUEwWXV1TmpHQ1R0NWVucDNSRW5uNGh2RHI0R2hiUUF5dlhVelVq?=
 =?utf-8?B?TlRsNk8zRTExT1oyd28rUUx3UmU1cUJmVEl3RTVDU0FQcWFYeUQ2dVF1RlNr?=
 =?utf-8?B?Q3dZK21aRnZqOWxDNjVmcXlwZGR5ejJXRUkwa2IvaEZmb1ZSQXlYSUUxZVZj?=
 =?utf-8?B?bndLTzh1bXVGeC9yWWNicGVnb0thVmtkMUpOaER3L2lpT0xVSkRMcExVWk5k?=
 =?utf-8?B?ajV6Q0J3VnloS090RDRPVVJXbkNZVjBTV2RXZVFXWlRVYVhoc2pnOXRoZ3Y5?=
 =?utf-8?B?dXZ3L2Q0RDEzc0JQTUJHeDBpQXVOaDBNWUIzZGlXdUZHa2QzaWNpVnRRQmFp?=
 =?utf-8?B?SWlOOHY5dFBHUFl0TGdyVUUveEttZ0RyUi83RzMxSzM2R2NjWCtTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E764EC16AF70A248BC606EADF8674C0D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e213129-6806-4587-a41b-08d9aa76640b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 09:32:51.0067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZ7uWCG2uX2AsfUJ/OFePEtNhN0uKK634N3Jn7xVesPrTlW2PpTOEHAyDq9/0oRey87cW4L9I0TJTnVLrocLptXkkA8/NFd/wsq6QkWpZBS9PrUQaHS/WfhVI1aA6jEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7427
X-Proofpoint-GUID: vuKIKkaXokHUDiCoUwgJ00b0IG8aZgQw
X-Proofpoint-ORIG-GUID: vuKIKkaXokHUDiCoUwgJ00b0IG8aZgQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180055

DQoNCk9uIDE4LjExLjIxIDExOjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAwOTo1NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOC4xMS4yMSAx
MDozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTguMTEuMjAyMSAwODo0OSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE3LjExLjIxIDEwOjI4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IFdoZW4gYSB2UENJ
IGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmljZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHdlIGhhdmUN
Cj4+Pj4+PiBzY2hlZHVsZWQgYSBkZWxheWVkIHdvcmsgZm9yIG1hcC91bm1hcCBvcGVyYXRpb25z
IGZvciB0aGF0IGRldmljZS4NCj4+Pj4+PiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2luZyBzY2Vu
YXJpbyBjYW4gaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToNCj4+Pj4+Pg0KPj4+Pj4+IHBjaV9waHlz
ZGV2X29wDQo+Pj4+Pj4gICAgICAgcGNpX2FkZF9kZXZpY2UNCj4+Pj4+PiAgICAgICAgICAgaW5p
dF9iYXJzIC0+IG1vZGlmeV9iYXJzIC0+IGRlZmVyX21hcCAtPiByYWlzZV9zb2Z0aXJxKFNDSEVE
VUxFX1NPRlRJUlEpDQo+Pj4+Pj4gICAgICAgaW9tbXVfYWRkX2RldmljZSA8LSBGQUlMUw0KPj4+
Pj4+ICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZSAtPiB4ZnJlZShwZGV2LT52cGNpKQ0KPj4+Pj4+
DQo+Pj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+Pj4+ICAgICAgIHZwY2lfcHJv
Y2Vzc19wZW5kaW5nOiB2LT52cGNpLm1lbSAhPSBOVUxMOyB2LT52cGNpLnBkZXYtPnZwY2kgPT0g
TlVMTA0KPj4+Pj4+DQo+Pj4+Pj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2UgY29udGludWUg
ZXhlY3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+Pj4+Pj4gY291bGQgaGFwcGVuIGlzIHRoYXQg
TU1JTyBtYXBwaW5ncyBhcmUgbGVmdCBpbiBwbGFjZSB3aGVuIHRoZQ0KPj4+Pj4+IGRldmljZSBo
YXMgYmVlbiBkZWFzc2lnbmVkDQo+Pj4+Pj4NCj4+Pj4+PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFp
bnMgdGhhdCBnZXQgYSBmYWlsdXJlIGluIHRoZSBtaWRkbGUgb2YgYSB2UENJDQo+Pj4+Pj4ge3Vu
fW1hcCBvcGVyYXRpb24gd2UgbmVlZCB0byBkZXN0cm95IHRoZW0sIGFzIHdlIGRvbid0IGtub3cg
aW4gd2hpY2gNCj4+Pj4+PiBzdGF0ZSB0aGUgcDJtIGlzLiBUaGlzIGNhbiBvbmx5IGhhcHBlbiBp
biB2cGNpX3Byb2Nlc3NfcGVuZGluZyBmb3INCj4+Pj4+PiBEb21VcyBhcyB0aGV5IHdvbid0IGJl
IGFsbG93ZWQgdG8gY2FsbCBwY2lfYWRkX2RldmljZS4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4+Pj4+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUgbW9yZSwgSSdtIG5vdCBjb252
aW5jZWQgYW55IG9mIHRoaXMgaXMgcmVhbGx5DQo+Pj4+PiBuZWVkZWQgaW4gdGhlIHByZXNlbnRl
ZCBmb3JtLg0KPj4+PiBUaGUgaW50ZW50aW9uIG9mIHRoaXMgcGF0Y2ggd2FzIHRvIGhhbmRsZSBl
cnJvciBjb25kaXRpb25zIHdoaWNoIGFyZQ0KPj4+PiBhYm5vcm1hbCwgZS5nLiB3aGVuIGlvbW11
X2FkZF9kZXZpY2UgZmFpbHMgYW5kIHdlIGFyZSBpbiB0aGUgbWlkZGxlDQo+Pj4+IG9mIGluaXRp
YWxpemF0aW9uLiBTbywgSSBhbSB0cnlpbmcgdG8gY2FuY2VsIGFsbCBwZW5kaW5nIHdvcmsgd2hp
Y2ggbWlnaHQNCj4+Pj4gYWxyZWFkeSBiZSB0aGVyZSBhbmQgbm90IHRvIGNyYXNoLg0KPj4+IE9u
bHkgRG9tMCBtYXkgYmUgYWJsZSB0byBwcmVtYXR1cmVseSBhY2Nlc3MgdGhlIGRldmljZSBkdXJp
bmcgImFkZCIuDQo+Pj4gWWV0IHVubGlrZSBmb3IgRG9tVS1zIHdlIGdlbmVyYWxseSBleHBlY3Qg
RG9tMCB0byBiZSB3ZWxsLWJlaGF2ZWQuDQo+Pj4gSGVuY2UgSSdtIG5vdCBzdXJlIEkgc2VlIHRo
ZSBuZWVkIGZvciBkZWFsaW5nIHdpdGggdGhlc2UuDQo+PiBQcm9iYWJseSBJIGRvbid0IGZvbGxv
dyB5b3UgaGVyZS4gVGhlIGlzc3VlIEkgYW0gZmFjaW5nIGlzIERvbTANCj4+IHJlbGF0ZWQsIGUu
Zy4gWGVuIHdhcyBub3QgYWJsZSB0byBpbml0aWFsaXplIGR1cmluZyAiYWRkIiBhbmQgdGh1cw0K
Pj4gd2FudGVkIHRvIGNsZWFuIHVwIHRoZSBsZWZ0b3ZlcnMuIEFzIHRoZSByZXN1bHQgdGhlIGFs
cmVhZHkNCj4+IHNjaGVkdWxlZCB3b3JrIGNyYXNoZXMgYXMgaXQgd2FzIG5vdCBuZWl0aGVyIGNh
bmNlbGVkIG5vciBpbnRlcnJ1cHRlZA0KPj4gaW4gc29tZSBzYWZlIG1hbm5lci4gU28sIHRoaXMg
c291bmRzIGxpa2Ugc29tZXRoaW5nIHdlIG5lZWQgdG8gdGFrZQ0KPj4gY2FyZSBvZiwgdGh1cyB0
aGlzIHBhdGNoLg0KPiBCdXQgbXkgcG9pbnQgd2FzIHRoZSBxdWVzdGlvbiBvZiB3aHkgdGhlcmUg
d291bGQgYmUgYW55IHBlbmRpbmcgd29yaw0KPiBpbiB0aGUgZmlyc3QgcGxhY2UgaW4gdGhpcyBj
YXNlLCB3aGVuIHdlIGV4cGVjdCBEb20wIHRvIGJlIHdlbGwtYmVoYXZlZC4NCkkgYW0gbm90IHNh
eWluZyBEb20wIG1pc2JlaGF2ZXMgaGVyZS4gVGhpcyBpcyBteSByZWFsIHVzZS1jYXNlDQooYXMg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlKToNCg0KcGNpX3BoeXNkZXZfb3ANCiAgICAgIHBjaV9hZGRf
ZGV2aWNlDQogICAgICAgICAgaW5pdF9iYXJzIC0+IG1vZGlmeV9iYXJzIC0+IGRlZmVyX21hcCAt
PiByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpDQogICAgICBpb21tdV9hZGRfZGV2aWNl
IDwtIEZBSUxTDQogICAgICB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkN
Cg0KbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KICAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6
IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZwY2kucGRldi0+dnBjaSA9PSBOVUxMDQoNClNvLCB0
aGlzIG1hZGUgbWUgaW1wbGVtZW50IHRoZSBwYXRjaC4gVGhlbiB3ZSBkZWNpZGVkIHRoYXQgaXQg
aXMgYWxzbw0KcG9zc2libGUgdGhhdCBvdGhlciB2Q1BVcyBtYXkgYWxzbyBoYXZlIHNvbWUgcGVu
ZGluZyB3b3JrIGFuZCBJDQphZ3JlZWQgdGhhdCB0aGlzIGlzIGEgZ29vZCBwb2ludCBhbmQgd2Ug
d2FudCB0byByZW1vdmUgYWxsIHBlbmRpbmcgd29yaw0KZm9yIGFsbCB2Q1BVcy4NCg0KU28sIGlm
IHlvdSBkb3VidCB0aGUgcGF0Y2ggYW5kIHdlIHN0aWxsIGhhdmUgdGhlIHNjZW5hcmlvIGFib3Zl
LCB3aGF0DQp3b3VsZCB5b3Ugc3VnZ2VzdCBpbiBvcmRlciB0byBtYWtlIHN1cmUgd2UgZG8gbm90
IGNyYXNoPw0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

