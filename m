Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE4A7E719
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940615.1340335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcK-0001JO-JB; Mon, 07 Apr 2025 16:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940615.1340335; Mon, 07 Apr 2025 16:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcK-0001CG-B8; Mon, 07 Apr 2025 16:46:36 +0000
Received: by outflank-mailman (input) for mailman id 940615;
 Mon, 07 Apr 2025 16:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1pcJ-000129-25
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:46:35 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd19affe-13cf-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 18:46:33 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB9590.eurprd03.prod.outlook.com
 (2603:10a6:10:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 16:46:20 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 16:46:20 +0000
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
X-Inumbo-ID: dd19affe-13cf-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbFIyi7aUOaMI5N9x9g8ef+aduIsnvjteoG2zUutoCv0KnP6cOghkml878iBs0Xfd3E2sR6Z+RYsJhOgYmkUxbrr8kvmDAgqSwWqfmITwu8BqzbrJ8ClPayD7RNFYgUIosVpPUuAesvcsg0JogyNCNXSaFo7RI009sDDcvxCOvqYaGQSN/VbgmIY8wrLivo+rQgzuJlNkelG6n39/LeQXFUd6x30lFtFp3Zqg5XvvqFfhG1gBi+qRJIeZtzHEn9L/y5mB4gu58JtbxqBrcAMRc7IfVaDeWsEJbVx9kPx3ZF3HOht/BkO7EPNrxPB+Ms2MbZSFdhKVD7tQ2PkdCknOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KivJ2k6BfE001jDKKqlP7G1zDyRivt2r7x3oxgOSz1w=;
 b=ctwHtFKbkWnZ56xLZGfEaVDGkOHf2ZwB0DpAASFMk8Hz4EZY52jWjl09ESg9J5Te01lezIwNrq41DXiAIPV2PRalI0iOD9YSZmU8jH09mnpkhLyigGr/Sf5KJRtYJYioD/QdqumgP3muAK58/e63uzMkNHDJfg/Z/heJ8Ygkhzc+1ntTdf1oiTtSZx7Ui5smlAMEQIz+TGXHgCcgOzS0hGYP94PIrU2lZq9YVRP39qPbIDLjxCOpwyIQCD8v430oeODE6lYaTd3zSdLbOW+AnK5ZXjYgogFcdFQBQu4dmAdmBz2H26vvZPCiUAxF1J+zG32SQ7OGUsUUUQjbsi3gXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KivJ2k6BfE001jDKKqlP7G1zDyRivt2r7x3oxgOSz1w=;
 b=MAfkanGFTqXd72ZqMa9k6LWUegkY7V5g5M/8KyLZjG7uCrtxjuRBCwe2yKNrxds1Gcqd2o6z2uTlAjr4+lC89/lL1rAShFCxXt+1w/SxJbkm1Q8AVMYVe2VJnM1jHhCEdtGZvnAOzfUL1d/M1/K9aci3oW5RjiMVAUPZuqXId3P7beQ5XJRD2Y5FlOQZGV97jtwJbe9U3gO9cbG0pYmiPYSIwGFPY6rorszxlYB4SDfCaJ8TFoWezEInw4M4kNK9GKv2dB8PAY3zoim0U9yPqT6ELvdpFzXq2t0DfNPPCmk/xdpqZt2DQthlQURV3xHO0CwD0RkEOU7FbeFWLMT5rA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] xen: x86: irq: initialize irq desc in create_irq()
Thread-Topic: [PATCH v4 1/2] xen: x86: irq: initialize irq desc in
 create_irq()
Thread-Index: AQHbp9yWkav/sMjfLku8fUslcpXJUw==
Date: Mon, 7 Apr 2025 16:46:19 +0000
Message-ID: <20250407164608.2558071-2-volodymyr_babchuk@epam.com>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB9590:EE_
x-ms-office365-filtering-correlation-id: 033114d3-0b84-463f-1882-08dd75f3b944
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGNZMGZZVzNoNDdZb2lXOThiTSt0WlF1K2pLdFNkWURSZUZISmduem1Ia2ZP?=
 =?utf-8?B?YVJ5UUMydlVCSVNha0N1TVQzanZlaCtaMk9xbllsVTg0TzM5R2pESFZmUmMx?=
 =?utf-8?B?T2JTY2NGZGVpa0F3YU5KMlpYZzdyQ0hqbmh6K2lwZmV6TEJlbERqdXp2UXc0?=
 =?utf-8?B?eXlJeWVkNlJtYnNMSW1pYTM0UzdwVDFnNEQyS0YyMHZBYzUvSFliZ2dna2RU?=
 =?utf-8?B?ZlY5TGlxaDZwcDdSZ3BhUkVFRTUzZ2ptME1tVzgvd1JSTDdkajU3d2I0LzFn?=
 =?utf-8?B?bXcyclZka3NTR0VTR1J5NFo4bkRUcDBsOFQvSVpEUWFwdjQ4T0haU1ZjTjdW?=
 =?utf-8?B?aXgwVDB4UEZMekpnandSWURCeE5PcGhpclZCQ1Y1bitYM1hVTktTUGY5S2FH?=
 =?utf-8?B?REwreGFVZzUwOEpkaHRydVRLUWdkclc0NU1rdkFaMTlTc1dWb1J1eWRQUGNB?=
 =?utf-8?B?VDhBQU44bzMySDFpbVhTOVBaN29GaENtNzVEVFlvM2E0MzJaaFpIYnJDNW1h?=
 =?utf-8?B?NXEzeFRFUURkOENrSUNqWjFnRGtQQmQrYkxwcGwreDZiQnorOUs1MHdKSlpp?=
 =?utf-8?B?NUFndWY3ZnFlMUJrWEZZYk42VG1FQzIzUmhXbmw1cGhXN3VZa2I1cktvWmVa?=
 =?utf-8?B?Snl5cnd6a2ExczBCTXFlQURRSUVXcUtVMzVTMmh2T256T2lDSGhsSDBYclN2?=
 =?utf-8?B?ZEFIOUxNZjJ3OVNrZWNrdm9wZ0V5KzdnTnFGeVZrdGJTVlBscjRDZGxLaGhW?=
 =?utf-8?B?a2FVOXRpK1dFbzdHUG80bmpBVTMvK2xGVUQxK3drbmozeENWakhoaXNGMnBl?=
 =?utf-8?B?bXlqcEkwK2hEOVZ6VFN1ZU1BbW9DM0NoSDdZd1JicmtXSGxQVi9VaDVlTUFG?=
 =?utf-8?B?V3hwNkFtTG1SN2c5ZjFVRG9NOGl1MXVLeWlKaDRGTTFmbHNBaGk4b0FJU0R4?=
 =?utf-8?B?cWFISXN6em1KVUJSaGh0dTYyY2VYc0tWbFdTKzljTm0rVDYyWVVjM25GSHZJ?=
 =?utf-8?B?QWdQb3hIcWh2ZU9NdTk0Sk90WWExY1FrUE1LYmxvcTB2ZUtHUjJIZnd6Q3E3?=
 =?utf-8?B?cUpFZzlPQWhRT2dnWHJScGpOeHFCUEJ0dEoyaThUdkRYQTBlK25mdUNlZGEz?=
 =?utf-8?B?TWZHQkNOdFdsSFZ5eHUrbWhTWmVIcVdlRU1lUklvWFErVktXRXd0cURuZFk1?=
 =?utf-8?B?Uit6UnFpZ3luaWxsdCtHQXlETnpLa2ZZSi84djk1a1hmSE9zKzNhalA4V3Fj?=
 =?utf-8?B?RHhEK0pCRlhRc2xLbnAvVEdSYytJTGlrdHlzZy9abDgwa3FKMU5PR3FuNTk3?=
 =?utf-8?B?MHRDbGNrNzJQYUdhT21ldnV6TGxGTHhmb2d2RXJMUXV1RTJqMWExb2pvVUVN?=
 =?utf-8?B?WGtuN0F2VTN5QkVrQTkvY1h0WmdBdElEc3ZMZlk1aUViU2xrdzVBRUNmajdI?=
 =?utf-8?B?c1ZDc1pCdkFkRy83cWRQQW96aTNzT2MzVTJ6TVRLZmlkekhlWUZnaEZCdVF3?=
 =?utf-8?B?c0VER09GUmEyWWY0dkhWa0pDNG1XbktnU2IyeEVOc3RlQmFRa0U4QStWcVRK?=
 =?utf-8?B?Q1Y1NGh5SkdVa0paL2lWcFUraEVPK29xMjhBbWxJWFowQTZ4Wm5zUkhXUm1h?=
 =?utf-8?B?UkVoNGdkaE5lT0JLY1NJZjYrUTJWRGFaRXozcllTVFBUNlgvaXNpdnY2TkVH?=
 =?utf-8?B?U0JCeENNb1l6SmdCbzlYTk9zUlBQZ3BDNzErOFNqbWNGeXhsTFlQWDZ6QndN?=
 =?utf-8?B?Z2c5UHNaZTN0eUdjbGlLMEtFOFd0N3daajQwaXpnSTNXWEFha3FpNXlMTlpt?=
 =?utf-8?B?YTk0K1N1aVdGR2FDYmF4OXdCNjVTMlh1Q2FHeXNOMEw3Y01BRWIza3NVU1ow?=
 =?utf-8?Q?qHOLaap0xr32W?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkhYQ1U2UUd2VDIxVWxDSjhwWThXV0pJMHl5Y29uQTNqRktQV1JWbCtOUnYx?=
 =?utf-8?B?ejUxQVdZcHhNQ1VTQktJUU11anJzOWVSa05YVHE0dnBGZWJTYStGSTBDckF2?=
 =?utf-8?B?Q084Q29JUlFyRUEyOE1CQUFIbXBWcUZ0L1VYOFpoVm1Cc082c0ppb25ESDNF?=
 =?utf-8?B?RDJkYXQ2U0RLMHhTZUc3anZaUXQzVDE5Z0hqQkFSNkIzbVNDS2FTc1RjUE84?=
 =?utf-8?B?YzUxanZTZDdBT09QZUQ3S29JK2IrQkkyYWxMdE1keEJyVVhEdCtXTFlRWlNq?=
 =?utf-8?B?WTR6SUJZNmxLSVRBNC9ZWER0cTE2cG1nSFNuWnhuNXU1NlcwdEhzajQ4MDB2?=
 =?utf-8?B?UTBlVW5LMXpWNTV0dUREbDhHQzlZVmRGU1VOemw2bU9HSkp2YzZaTFFGZFFK?=
 =?utf-8?B?VzAxWjhZdHcyMkhOcUMvRnpXTWNYbjZpV2NKVHJIcGJrbk5ucmFlMzd3SzM2?=
 =?utf-8?B?dklORGZCeUl2NUxxeW5SNHB4VFVvazVIOThXVS81bk1CWkhMMmJOQVoxelVO?=
 =?utf-8?B?RVdGelYyRkpYcGx5Njc2azUrY3g3aU84THJiREZsU3ZiUWQrSkJ0elkwSkp4?=
 =?utf-8?B?UlJKTW9mYW5BYlRqOFpva0RSR0pPcVRnL0VkMG9CNnBsSUJTcCsvWVFubW1a?=
 =?utf-8?B?T2NvS3RNMVd0ellEcHg5YjZOV3hpUHJuWms2dkU1c282R1c1QUJRMjFJZUMy?=
 =?utf-8?B?UUdBSzVxYjFDMmdDY2ZsMUJvYnFxY0hjVmFvMnZSeGR5azN6OENRUk1JTFZW?=
 =?utf-8?B?SnA3UVV1MWkvem1FNGtwSW4rblp1ZmtadVFNM0hFMnQ0NVV6S2crdEdtaTFj?=
 =?utf-8?B?R1dIeGV3Q2REMS9rdWhCZEluQmpwLzlKb2g3cW1JMjY2NGJQc2I5K0dyVFFq?=
 =?utf-8?B?OWNFTk9hMmtVVVJpSFNWM2loZmY0cG1xUDZPZFJUUjVzT1JiQ1Q2SXpNWHJt?=
 =?utf-8?B?Wnd3aHFWK0pkanZjQXc2Wkc1THhZN3BQaFcvSC9GZUZWQWdGOVZaMzNqSlBt?=
 =?utf-8?B?STVDMmoxR2xkTWROczJOMm0zK1pwQlE5SHhjTWdBcXhJbllwVExCMzdpckY4?=
 =?utf-8?B?amtTNVNhUWJxdk40UE44bE0rZEh1RmRoSDBBM0FGV1kyQ0JHblNZbXdMRTNG?=
 =?utf-8?B?RWVhYUlheWF3bEJKT1ZPaXZYVEU3dzI5dWJ6T3hBZWtIUnRJb2grN3hpN0JC?=
 =?utf-8?B?VmkyZTFuQ0xTSlpOc0wrcHhpNENic0JKbzhaek1GdnF1YnBqQ1cydEprYUZm?=
 =?utf-8?B?a2tLZGdVYWFXdmwrY09CMHdLMlJMSGZwWEY0bi9nNERoenNqcmVYQ3lvdWNy?=
 =?utf-8?B?V2lybmhIeEhHVUdBUnFwQlo0a1dpZWNJSDJoa1ZOZFE1NHpZQkhJQzl4MWM0?=
 =?utf-8?B?aFUzT3ptd0pKUnRwK3p3dmVnYzlLV0doQ2xqc29OY1hrSGRSRFAwRzdMZndJ?=
 =?utf-8?B?L0RYdFR0RGxXbG9JU3Nxa0tlVUErRndKVTZBRXN4WE9OZDhGS052cEY2L09M?=
 =?utf-8?B?dEFmRlFYdWRLZmhVa3lWYW1uamdJTHRNdVVRV0R6MEJjakZqbGFuZUFDOEJE?=
 =?utf-8?B?R1RnYUNQNm1kQlY5SXFVL1pQZDVxZXIvZmZzVXo2N0NyaDBSZXhIcHhscmlZ?=
 =?utf-8?B?MDJZbmprMXNYNG8yQklkN1lxbG1GV29kMUF2Y2RuWDhVUE1VWmU2UmhobnJY?=
 =?utf-8?B?ZTYyeHQyQW5rTUhkZitWZzVoemdSSzVJdmk5ZC95dVJhMlZkUDZ5RVpONUdv?=
 =?utf-8?B?SndpOUVEQmNYd1haTU4yaE1kMWZQRDVmcnZLREF4eTNNSks4TUhoMVhKcEdJ?=
 =?utf-8?B?RWZYWlBXTU1xSk1GOE9LU3FnZTJqZ3lTWTJ5dDVrWTI1ZlZZQlBHVG02NklC?=
 =?utf-8?B?ZkIvYWxhaSszZU9mbHl5R04xYzlUc3BEajU3RjRNalZQUFg3ekh3a1dvdC9G?=
 =?utf-8?B?ajBXU2F3NFMrekhjSUFRVm0welVOVDRZSWkrTmx4RnFOdXRlc1AyRk5PMS9k?=
 =?utf-8?B?OFY5MnpZZFM0SHV4ekg5QVVFMXIrUWxZRU9OMTAwbXpFTGMwdmVFNUpEZVA4?=
 =?utf-8?B?Ukg4c09wM01PZXVkSllDajVBSXJrWTBWNHlONkloSEM4R1dKVVp1MkZZM2Fj?=
 =?utf-8?B?THZjd1AwbmRESXZrNGhDM2pXZDl1R1BHbjZDTzVvSk8yZE9BWUd5YitJSm9V?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF21E639059AB945930AEF409545A0F7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033114d3-0b84-463f-1882-08dd75f3b944
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 16:46:19.6505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp7w8/CLhJzhTxR2fWQi1L7CHThhhrH4EkchXxQgi7PXL2h+BWrXIPRA+t3rZochBqa7hWPFsIz6RHnyXqaa5oXSt3LZCaLpXa0vhl89l4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9590

V2hpbGUgYnVpbGRpbmcgeGVuIHdpdGggR0NDIDE0LjIuMSB3aXRoICItZmNvbmRpdGlvbi1jb3Zl
cmFnZSIgb3B0aW9uDQpvciB3aXRoICItT2ciLCB0aGUgY29tcGlsZXIgcHJvZHVjZXMgYSBmYWxz
ZSBwb3NpdGl2ZSB3YXJuaW5nOg0KDQogIGFyY2gveDg2L2lycS5jOiBJbiBmdW5jdGlvbiDigJhj
cmVhdGVfaXJx4oCZOg0KICBhcmNoL3g4Ni9pcnEuYzoyODE6MTE6IGVycm9yOiDigJhkZXNj4oCZ
IG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0N
CiAgICAyODEgfCAgICAgcmV0ID0gaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQogICAgICAgIHwg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQogIGFyY2gveDg2L2lycS5jOjI2OToy
Mjogbm90ZTog4oCYZGVzY+KAmSB3YXMgZGVjbGFyZWQgaGVyZQ0KICAgIDI2OSB8ICAgICBzdHJ1
Y3QgaXJxX2Rlc2MgKmRlc2M7DQogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fg0K
ICBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KICBtYWtlWzJdOiAq
KiogW1J1bGVzLm1rOjI1MjogYXJjaC94ODYvaXJxLm9dIEVycm9yIDENCg0KV2hpbGUgd2UgaGF2
ZSBzaWduZWQvdW5zaWduZWQgY29tcGFyaXNvbiBib3RoIGluICJmb3IiIGxvb3AgYW5kIGluDQoi
aWYiIHN0YXRlbWVudCwgdGhpcyBzdGlsbCBjYW4ndCBsZWFkIHRvIHVzZSBvZiB1bmluaXRpYWxp
emVkICJkZXNjIiwNCmFzIGVpdGhlciBsb29wIHdpbGwgYmUgZXhlY3V0ZWQgYXQgbGVhc3Qgb25j
ZSwgb3IgdGhlIGZ1bmN0aW9uIHdpbGwNCnJldHVybiBlYXJseS4gU28gdGhpcyBpcyBhIGNsZWFy
bHkgZmFsc2UgcG9zaXRpdmUgd2FybmluZyBkdWUgdG8gYQ0KYnVnIFsxXSBpbiBHQ0MuDQoNCklu
aXRpYWxpemUgImRlc2MiIHdpdGggTlVMTCB0byBtYWtlIEdDQyBoYXBweS4NCg0KWzFdIGh0dHBz
Oi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTExOTY2NQ0KDQpTaWduZWQt
b2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQoN
Ci0tLQ0KDQpDaGFuZ2VzIGluIHY0Og0KIC0gUmV2ZXJ0ZWQgYmFjayB0byBpbml0aWFsaW5nIGRl
c2MsIHBlciBKYW4ncyByZXF1ZXN0DQogLSBBZGRlZCBsaW5rIHRvIHRoZSBjb3JyZXNwb25kaW5n
IEdDQyBidWcNCg0KQ2hhbmdlcyBpbiB2MzoNCiAtIENvcnJlY3QgY29kZSBzdHlsZSAoImRvIHsi
KQ0KIC0gQWRkIGNvbW1lbnQgZGVzY3JpYmluZyB3aHkgd2UgbmVlZCBkbyB7IH0gd2hpbGUgbG9v
cC4NCiAgIEkgcHJlZmVyIHRvIGxlYXZlIGRvIHt9IHdoaWxlIGJlY2F1c2UgTmljb2xhIFZldHJp
bmkNCiAgIHNhaWQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IGhlbHAgd2l0aCBNSVNSQSBSdWxl
IDkuMQ0KICAgd2l0aG91dCBuZWVkaW5nIGFuIGV4cGxpY2l0IGluaXRpYWxpemVyLg0KDQpDaGFu
Z2VzIGluIHYyOg0KDQogLSBVc2UgZG8geyB9IHdoaWxlIGxvb3AgaW5zdGVhZCBvZiBpbml0aWFs
aXppbmcgZGVzYyB3aXRoIE5VTEwNCi0tLQ0KIHhlbi9hcmNoL3g4Ni9pcnEuYyB8IDIgKy0NCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KaW5kZXggZGQ4ZDky
MWYxOC4uMzhhYzA4MjNkNyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KKysrIGIv
eGVuL2FyY2gveDg2L2lycS5jDQpAQCAtMjY1LDcgKzI2NSw3IEBAIHZvaWQgX19pbml0IGNsZWFy
X2lycV92ZWN0b3IoaW50IGlycSkNCiBpbnQgY3JlYXRlX2lycShub2RlaWRfdCBub2RlLCBib29s
IGdyYW50X2FjY2VzcykNCiB7DQogICAgIGludCBpcnEsIHJldDsNCi0gICAgc3RydWN0IGlycV9k
ZXNjICpkZXNjOw0KKyAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBOVUxMIDsgLyogZ2NjMTQg
LU9nIG9yIC1mY29uZGl0aW9uLWNvdmVyYWdlICovDQogDQogICAgIGZvciAoaXJxID0gbnJfaXJx
c19nc2k7IGlycSA8IG5yX2lycXM7IGlycSsrKQ0KICAgICB7DQotLSANCjIuNDguMQ0K

