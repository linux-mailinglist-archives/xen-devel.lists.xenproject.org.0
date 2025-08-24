Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A8B33218
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 20:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092254.1448236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFkh-0000XP-6P; Sun, 24 Aug 2025 18:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092254.1448236; Sun, 24 Aug 2025 18:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFkh-0000Uz-1y; Sun, 24 Aug 2025 18:47:39 +0000
Received: by outflank-mailman (input) for mailman id 1092254;
 Sun, 24 Aug 2025 18:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Bk9=3E=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uqFkf-0000Ut-SP
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 18:47:38 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd794777-811a-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 20:47:36 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7303.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 18:47:33 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 18:47:33 +0000
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
X-Inumbo-ID: cd794777-811a-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY6WRTHUH2ukmQgKtR604Ab+u+PEX+iMSkAElh+sA+5tuNWq99e9QJTUVcMX8X5rU1roIWxfktNUxHxxuzw88Ns0mFrPGeNfJHcurEKEOzoHHMYdJB83MZlSV9Ovu5QhhViZCK2SlEUMdvpNgdvoryMcdtde94EPahy0OpC69GGAbmSKEueLDj1TKA+Nxau9qieXlmFBT6rYuEIjMOOdGuuSzFFOxur7jaamop8LWWgxLsggblBJjNxoAxeU3+Qyho2GCdTx3elTaxFQ/2fo+wEfC26HbGUtQqkRaDNgNn6kNVYE78SlIihbIdOnvAWa95p0164uyS4UZRVSShniNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDfnx9kmCEvzJ4OYVjtCKr+h8z+Kbd3+sJ7+w+Jbum8=;
 b=qpnoTcNpn7BWLs4GPHD20ddtNvlkLFAMLGRoo4G7/IQYQqL9o1T9PwEp5a17x7CxqMlYZFqR7zXEAq9eLq5KNgL2fEvJfYc5cqmowFFsIpEe1mMvsFKeKub1v2oA7FdYiaDJ08GcB6D84oYBv4tajdn51TSUb9iJL4d+aDtYR8fQOVlzaUuV8d/4btdbAZf8/j6Wk9tjM7YNYzdwSFeLaj2snPOpVwbDBY70M1sZxizAk+3n6ki5g3Ls6QSTuKeKcexcKk02S2D9VU4U4RR9ecOaVolxG1z7RJmGriKt+N/Fg5XdKb3Cw6SfUpE7079Zlf32duk41FiQ79xUbW2qfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDfnx9kmCEvzJ4OYVjtCKr+h8z+Kbd3+sJ7+w+Jbum8=;
 b=shweaEt+ib/Kf44sTZfGP0TGbA3ZDEEEmASoL1LlSWl39Yw76j5A+Igv09fNuHwb4Wn82T08+bdofbhGQge/dLjMaGrZe2xLun1WqeI+RayWc9XjNPQZh1o6CI7IPVmZDlR0Clj2vuGVCZdGnuYkDaidM37cNo+x6YxqxwqV4VM5o6P1JtfD5vs7bNuScV6unO9f+8PxZGBrXWCoawQfolJ4cgjI/5tqvd05Eav979ml4C9OAbP1KEv8cHvotY7Ap2Y/KPZ/wi4suyfj7ZKbmCn4w+ZW1bKVmv9WcHUeCOd1hFoOvrn/8yEbQWA/KYlBL7cOlFAGGqAZvT+dmoP6Vg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d9D2bB2ytT+0KvuTkMlpIiH7RwTReAgAHy1IA=
Date: Sun, 24 Aug 2025 18:47:33 +0000
Message-ID: <b54a5a96-4e81-4550-9cd3-ba0c22871385@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
 <543c8010-bc73-4da8-be9a-f1774ec8b963@gmail.com>
In-Reply-To: <543c8010-bc73-4da8-be9a-f1774ec8b963@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7303:EE_
x-ms-office365-filtering-correlation-id: c70de905-e4b1-46d4-60ab-08dde33eafea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUZjZE44K0pPQjlVSGJHYUVGYU5QWmRPS3I0YWlENWh3eWNKUm9WRXJMM0lD?=
 =?utf-8?B?QytOUnNjcml6NmpWVkg2RjZtbEJTc2JaR0dMWkVLa05uV21lRFdXb0pFY3ds?=
 =?utf-8?B?UWJ1UHJFUEJWQUV0WjQzN3Jvc3pUSi9WbEs5cTZpeFFHb256bTVSTHh5alY0?=
 =?utf-8?B?bG5DY00yUHJkbDVlSmJqamppYlZJQlhLbnVCNGo5dVpsdDJhQ2NIdTdZUXNt?=
 =?utf-8?B?NS83UDlmbHk2T2NacGV6aEE1b3p6N1ZhZzFjbjFMaEZhV3VlaFhyM2xWZUNQ?=
 =?utf-8?B?Wm9oeFY0OTIvVWl4T3NnZE5NQlFIa1pVRkpwcDYwVC96b2xNQ1lLbVdkUVg4?=
 =?utf-8?B?RWU4b3V3Ym4zbGNyS3pGYzZqMnhrUndNWXEvS3dqeHMwSUdnNlI1ZDh2TTI0?=
 =?utf-8?B?YThLSm5oRnh1Wm8xTFlYdE1DYkxYZUEycGVSWnBZOHczTnp5SUsrRElFdWJa?=
 =?utf-8?B?TFN5TWh3Q0d0ZkdmaTZpN2hDQVdwdFBoUTZwcnp4WGI1d1JOR3VKRXNkc2Z6?=
 =?utf-8?B?S25XT1pXN3VFekk2NDhZN1pDMWJMcVZPY09ONnJWMmlKQUl4aDdiK3J2U3BJ?=
 =?utf-8?B?ckxaUlplZ3hTWUZ2RU9TeHBFbUdxVlRzeWQra3lyU1JGcXp6QWRNamIxYU01?=
 =?utf-8?B?SVlVZWk5YThoSVVXdkdBWTVlOFNwV2Vla1pCNVl5cFlGYkdHTjRYYlNWZi91?=
 =?utf-8?B?YjRYR21VUTdudkoxZHVVZnFvZlRNWjZpWUdnVWs2cUJZNXI5Tlp5WVZUTjdC?=
 =?utf-8?B?YlpGYi9rZUVvc0lNaUZiUlFzSDk5UVBVMEFic2g5dkJSazA0ZHlycmxQaCt2?=
 =?utf-8?B?TzRjWlVqVTBwclM4bG1FUUZPWGlzRTVhclBic2lHWDdCOEd0bk5EV0ZWRFhW?=
 =?utf-8?B?WlBhTUdndXU0Z1FJY3FxWUlVV1E0NDFyN2VVcGU4TVNyR1NVT0ZQcm44TnVW?=
 =?utf-8?B?TTRNSzNiZWNMNExoa1ZzSXVXTGEvTURNaFMxL01JekxTbzM2c3RZSXBMOVZS?=
 =?utf-8?B?K2xWTVhkTVZmSFlIS0l3UkMyVmNrYU9wM21jeDByRTZjY2lIYXpPTVlRZVY5?=
 =?utf-8?B?L0t6cjRVOTMxVUNIeTJxd2JaS0xGZ3NEa1BpekhiUHUvSzhndGFCMnFtRGZH?=
 =?utf-8?B?MWFGOHQxL3dEVDBhVkRFa1dKWjFlcXp3UGpDUmozN0NSTHlHWklWbUNENnRQ?=
 =?utf-8?B?K0l0TXFDa1MyODc1Y0R6RlJmeC9jZWMrZmtjV3RBSEh1WDBuTzh1dVlueWlo?=
 =?utf-8?B?eU5YTlNtZkhnZGk3blRhQWwyNnFWYUpzcC84aWtCRDNqZ09JazE5RUZqeERx?=
 =?utf-8?B?ZUl2S2dTM0dQc1dlUzlFenpEWU8zeWRpMWw2b2dLS3hMT0FVcENkNFp4NTdB?=
 =?utf-8?B?eEJKZmxpbW5vQmttL1VoMTNBRXBmeXhwOEIzRGVCOXVRUDhkWC9SSERaNDVj?=
 =?utf-8?B?SlFhdEpJbndhcXRkVTFFMEFQRVo1ZUMrNlllMDEreWZCRDNVM2FEMFVhNGFQ?=
 =?utf-8?B?UXM3eFQwdkcxQTdpVGtOTStJWDlqM0lsYnVsdnZTbzZaM01QTGFGZGV4WlJL?=
 =?utf-8?B?eUYveWd5UWhTakxSa1ZtdHpROE1mNHM3Rkh4aHU5R0VmeEhWc2dDK1Q0TDJ2?=
 =?utf-8?B?NkxIMk5tSUFFaUhzNVRSK09VK3htTlRZS3JkWE9RQUwvZnVmK0ZvSDFSYlVL?=
 =?utf-8?B?QVJkME5QcVNsb0NlZkh0SlVHTEI5MjBaR1d6Mndycm1wdUFZYnhpa2xFY2oz?=
 =?utf-8?B?YkpNQ01XOWV6aG5EZUZvczBRVjAvVE9nOVU3dFhPUEd5ZkNUekk2MEZHSTQr?=
 =?utf-8?B?M2dBR25Cano2UnFXNDI1eU1ENUYyTGdKVmtJR0Z6emRSNXNJcEkxekNtKzV5?=
 =?utf-8?B?TXVNcmUzNzdQM1FlTDJ5UUNPR24yRWZ4cmFsVlZ2M1dJSVpSdGdoQ2MvQTVW?=
 =?utf-8?B?c0tUb0pVL2sxd3lIalpTTDNSLzZLeXVqMUtoQVBvc0huVkYxYW44elV5c3c2?=
 =?utf-8?B?U1NBRFluc1VRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVgxTmROb1R6dlF5Y00zNE1wL2VrREY0b0M2ZVhVTjR6YXRpTkEvQUZlOEtW?=
 =?utf-8?B?bHRwTUl3T3RZaUNIZHFqVnFzdzR1OG5hODJINlkwa3RLSDlDdjFuVHNaMnFB?=
 =?utf-8?B?aUJWMDUyWnN5L25udzV6eVRRUnFaY09SaEk4eDRnMklqQ3Bhb2JjYzhxU0xG?=
 =?utf-8?B?ejd4VFcrbmFIck15ZERCM2hLU2lpaUVoczBUSmN6N3hlUy9BZGxnd01DOUhE?=
 =?utf-8?B?eVhWdE9KQjIvYmpwb0hxUHNIWXdRQVlZdnpqWFJobFdXcm1YZUZPNUliZnRu?=
 =?utf-8?B?UTZiL1E0b2dCb0lVa2xlWGk0QW5wOXNFMTRrazNNcWIvVy8zc1k5NVJ2aU5I?=
 =?utf-8?B?QmhmaXlzNDdycFMvSjV0b04xTTYxZEVJSXVUckpIWjZURTVjbFZxZlFtQ3N1?=
 =?utf-8?B?eXR4OGQyWXZCT3grSEZxNjU5MmN5MHJ2Qlh5S0p3eklwN3hTOElOdHJsdWtp?=
 =?utf-8?B?WVJ0cGxYVjVSRWNGZUp0QS9uNStXK21NbU05MmNXcnBvOHYvMUZ2RGZBV1g1?=
 =?utf-8?B?VGtwT0ZtZVoydFlDSE9ZWm80S1hpVEVsL3pWdUtXV2Jzem9WeVRmOURyTkQ5?=
 =?utf-8?B?cFZNanpkOXFLR29jeFhSNmNlTDc0UTJOeU80T0tlWjYvOXo4Rm9iWmN3WHVi?=
 =?utf-8?B?QTVscmY3N0FHdWFvWjc5aVppaGxzYy9WVlY1NUtTdUFkU3NBdUFqMVgzUkp4?=
 =?utf-8?B?cFFRZFdyQ2hjblZkd0V6d0tzbHY5eXQzUUNOcGd6TmV1REFDc3hzU2FOQ1lK?=
 =?utf-8?B?RzRPY2FYUGtCT0VtNzlUSFgyeXdoMHBCRHB0UU9Hekg3NmM0emFLTHkxaWtj?=
 =?utf-8?B?c0hwN3hCT2lJOHU5cDZBT0dxZW9pMEFPUVI2SzZoYVk2R0V2WUN5V0dVL2lz?=
 =?utf-8?B?cUxMTU9qUjFEOWRPemtCMGNXdWNQTEZTOEx3REFUMi8wbXJoNGYyQzh1aUtE?=
 =?utf-8?B?bC9hb1hTc0pqRFhMY2RCYmtIcW1IKzhyeXBvOE1XamdUYkJGdXNNRzJzR1dx?=
 =?utf-8?B?NXdMYk43bWNVVkxzOEZxWDdmSHB1eC9EcW1IQk1SV2NwVmQybFJXUEh3QXRX?=
 =?utf-8?B?WXRDeDBqZUt4TUxlbklWWjN4cmpEZkhMN29YU0tTaU1zUWVWcWpMSW0wOE8x?=
 =?utf-8?B?RGVBQ2hVby9aS0ZaR0V1cE1LNzRTWllpWG9DYjQ5T0lYa2gvTzk3S1RPalZ0?=
 =?utf-8?B?dFVZZE5tMk9ZRTh0Y1lLVlhaaU1qdDhPOW55SGJrVUs5MVVZQ3NKTVUreW5U?=
 =?utf-8?B?WmY3THAvZWxGWncvaVltRGNEa3ZHQVVabkRZaEVjbWErMCtGVDNKRE5PTzlu?=
 =?utf-8?B?Z0JFM2FDUGk5UGoyNytTQVE3V05NUTBuQkVRYzdSY0hLVWRhRHphbVFQUWl1?=
 =?utf-8?B?TFk3dkx1djQ1WGp1QXV2cGJLdWxCNEE2bUgwbVljQTl0OGU0TlREczdnRGwy?=
 =?utf-8?B?R0RlOG1vRUMzNTI5U1NqOEpiTVhZVE54akcyL2IzdVAyb1dCQXQvNyt0V3BI?=
 =?utf-8?B?dmh6NXhuTW5aS1J3YnVBNm5BT0o1YzNrUHQ0bnl1dkVtYXFjRXhsMlFhZXJO?=
 =?utf-8?B?SCttdzRiRG9BZTIreW4xUWpnRnNuMjZ4ek8wS0RqZ1YyckIwQ1E0dFFNWWhX?=
 =?utf-8?B?WjhsUWVNbjNkUktHVERraHFQN0Y2QmI3OEVqdjlXNFJCNUJXMEkxMEU4aGFI?=
 =?utf-8?B?Y3A4Qk9uekVvZXNaK2tYM2VDcmFCQ0FJY3l0U211b0xGNGI0VUN3Y3dJb1c4?=
 =?utf-8?B?MVZjT3NlOCthN2s0SlpYWDdBQ09OSXpqZm80R2E3MVFZdlFqcVlLcDNSN096?=
 =?utf-8?B?Vzg3UEhyejdXUmhNSGhpVGxLVG5SdDhGQXRmTUk2NHBNR2NENG54QWxDVktw?=
 =?utf-8?B?NDRaaCtGaXdzLzFWTVBvMjU5TkdqQzBsNVpEK3dLUjFDcThOUjhpYVNxNDRr?=
 =?utf-8?B?cExhQUdnVjg3Uzlhc0Rmb2pOem5Kc1pEYzM5UENhMTNQSjl1aWszTk5sV0tU?=
 =?utf-8?B?bU5TOU1kSTVnNENlMGVGL1d0VUhwcmMxNnZ2Mml5TDRXdTdhdkRmeExNTjM0?=
 =?utf-8?B?cWJYSE1mbXdWQ2Npem9xSXBRUERudldXckVPNXdqTDdvbjZFWWs4WjZVRUY4?=
 =?utf-8?B?b2lDY0diNE9XL2l4N08xTnplUW9QVktRQzlEZUVReHNNT0VtRkZ2d2htVk12?=
 =?utf-8?Q?P4K6BTqkSuKf5B1ys0tB8BE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A3A46EF11D31F4CA82B248AEA92E3B6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70de905-e4b1-46d4-60ab-08dde33eafea
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 18:47:33.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNo3MuAiGb0mAIZyloBQd343azJl1er5H1Vb9KTAa3E8UabgtNJzEArAUmTzXypVAHR1bD0Oj7b3cY8Ei11DZsXdinuBs/szUZ1a5/L72eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7303

SGVsbG8gT2xla3NhbmRyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcXVlc3Rpb24uDQoNCk9uIDIz
LjA4LjI1IDE2OjAyLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4gW1lvdSBkb24ndCBv
ZnRlbiBnZXQgZW1haWwgZnJvbSBvbGVrc3R5c2hAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBp
cyANCj4gaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdDQo+IA0KPiBPbiAwNy4wOC4yNSAxNTozMywgTGVvbmlkIEtvbWFyaWFuc2t5aSB3
cm90ZToNCj4gDQo+IEhlbGxvIExlb25pZA0KPiANCj4+IFRoZSBEb20wIGNvbmZpZ3VyYXRpb24g
bG9naWMgaW4gY3JlYXRlX2RvbTAoKSBoYXMgYmVlbiB1cGRhdGVkDQo+PiB0byBhY2NvdW50IGZv
ciBleHRlbmRlZCBTUElzIHdoZW4gc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSBhbmQNCj4+IGVu
YWJsZWQgd2l0aCBDT05GSUdfR0lDVjNfRVNQSS4gVGhlc2UgY2hhbmdlcyBlbnN1cmUgdGhlIHBy
b3Blcg0KPj4gY2FsY3VsYXRpb24gb2YgdGhlIG1heGltdW0gbnVtYmVyIG9mIFNQSXMgYW5kIGVT
UElzIGF2YWlsYWJsZSBmb3IgRG9tMC4NCj4+DQo+PiBXaGVuIGVTUElzIGFyZSBzdXBwb3J0ZWQg
YnkgdGhlIGhhcmR3YXJlIGFuZCBDT05GSUdfR0lDVjNfRVNQSSBpcw0KPj4gZW5hYmxlZCwgdGhl
IG1heGltdW0gbnVtYmVyIG9mIGVTUEkgaW50ZXJydXB0cyBpcyBjYWxjdWxhdGVkIHVzaW5nDQo+
PiB0aGUgRVNQSV9CQVNFX0lOVElEIG9mZnNldCAoNDA5NikgYW5kIGxpbWl0ZWQgYXQgMTAyNCwg
d2l0aCAzMiBJUlFzDQo+PiBzdWJ0cmFjdGVkLiBUbyBlbnN1cmUgY29tcGF0aWJpbGl0eSB3aXRo
IG5vbi1Eb20wIGRvbWFpbnMsIHRoaXMNCj4+IGFkanVzdG1lbnQgaXMgYXBwbGllZCBieSB0aGUg
dG9vbHN0YWNrIGR1cmluZyBkb21haW4gY3JlYXRpb24sIHdoaWxlDQo+PiBmb3IgRG9tMCBpdCBp
cyBoYW5kbGVkIGRpcmVjdGx5IGR1cmluZyBWR0lDIGluaXRpYWxpemF0aW9uLiBJZiBlU1BJcw0K
Pj4gYXJlIG5vdCBzdXBwb3J0ZWQsIHRoZSBjYWxjdWxhdGlvbiBkZWZhdWx0cyB0byB1c2luZyB0
aGUgc3RhbmRhcmQgU1BJDQo+PiByYW5nZSwgd2l0aCBhIG1heGltdW0gdmFsdWUgb2YgOTkyIGlu
dGVycnVwdCBsaW5lcyBhcyBpdCB3b3JrcyBub3cuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVv
bmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+DQo+PiAt
LS0NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAtIG5vIGNoYW5nZXMNCj4+IC0tLQ0KPj4gwqAgeGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jwqDCoMKgwqAgfCAxMCArKysrKysrKysrDQo+PiDCoCB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oIHwgMTEgKysrKysrKysrKysNCj4+IMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+
IGluZGV4IGQ5MWE3MWFjZmQuLmZhNWFiZjJkZmIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0K
Pj4gQEAgLTIwNTUsNiArMjA1NSwxNiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lkKQ0K
Pj4gwqDCoMKgwqDCoCAvKiBUaGUgdkdJQyBmb3IgRE9NMCBpcyBleGFjdGx5IGVtdWxhdGluZyB0
aGUgaGFyZHdhcmUgR0lDICovDQo+PiDCoMKgwqDCoMKgIGRvbTBfY2ZnLmFyY2guZ2ljX3ZlcnNp
b24gPSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfTkFUSVZFOw0KPj4gwqDCoMKgwqDCoCBkb20wX2Nm
Zy5hcmNoLm5yX3NwaXMgPSBWR0lDX0RFRl9OUl9TUElTOw0KPj4gKyNpZmRlZiBDT05GSUdfR0lD
VjNfRVNQSQ0KPj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDCoMKgICogQ2hlY2sgaWYgdGhlIGhhcmR3
YXJlIHN1cHBvcnRzIGV4dGVuZGVkIFNQSXMgKGV2ZW4gaWYgdGhlIA0KPj4gYXBwcm9wcmlhdGUg
Y29uZmlnIGlzIHNldCkuDQo+PiArwqDCoMKgwqAgKiBJZiBub3QsIHRoZSBjb21tb24gU1BJIHJh
bmdlIHdpbGwgYmUgdXNlZC4gT3RoZXJ3aXNlIG92ZXJ3cml0ZSANCj4+IHRoZSBucl9zcGlzIHdp
dGggdGhlDQo+PiArwqDCoMKgwqAgKiBtYXhpbXVtIGF2YWlsYWJsZSBJTlRJRCBmcm9tIGVTUEkg
cmFuZ2UuIEluIHRoYXQgY2FzZSwgdGhlIA0KPj4gbnVtYmVyIG9mIHJlZ3VsYXIgU1BJcyB3aWxs
DQo+PiArwqDCoMKgwqAgKiBiZSBhZGp1c3RlZCB0byB0aGUgbWF4aW11bSB2YWx1ZSBkdXJpbmcg
dkdJQyBpbml0aWFsaXphdGlvbi4NCj4+ICvCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoCBpZiAoIGdp
Y19udW1iZXJfZXNwaXMoKSA+IDAgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGRvbTBfY2ZnLmFyY2gu
bnJfc3BpcyA9IFZHSUNfREVGX05SX0VTUElTOw0KPj4gKyNlbmRpZg0KPiANCj4gSSBtaWdodCBt
aXNzIHNvbWV0aGluZywgYnV0IHdpdGhpbiB0aGUgd2hvbGUgc2VyaWVzLCB5b3Ugc2VlbSBub3Qg
dG8NCj4gdXBkYXRlICJucl9zcGlzIiBmaWVsZCBmb3IgZG9tMGxlc3MgRG9tVXMgKGluIGRvbTBs
ZXNzLWJ1aWxkLmMpLiBQbGVhc2UNCj4gY2xhcmlmeSB0aGUgcmVhc29uPw0KPiANCg0KWWVzLCBJ
IG1pc3NlZCB0aGlzIGJlY2F1c2UgSSB3YXMgbW9zdGx5IGZvY3VzZWQgb24gdGhlIGJ1aWxkICh3
aXRoIERvbTApIA0KdGhhdCBJIGN1cnJlbnRseSBoYXZlIG9uIHRoZSBwbGF0Zm9ybSB3aXRoIGVT
UEkuIEkgcmVjaGVja2VkIHRoZSBjb2RlLCANCmFuZCB0aGUgZG9tMGxlc3MgY29kZSBoYXMgdGhl
IHNhbWUgYmVoYXZpb3IsIHNvIEkgYmVsaWV2ZSBpdCBzaG91bGQgd29yayANCnNpbWlsYXJseSB3
aXRoIHRoZSBzYW1lIGNoYW5nZXMgaW4gYXJjaF9jcmVhdGVfZG9tVXMuIEkgd2lsbCB1cGRhdGUg
aXQgDQppbiBWMy4NCg0KPj4gwqDCoMKgwqDCoCBkb20wX2NmZy5hcmNoLnRlZV90eXBlID0gdGVl
X2dldF90eXBlKCk7DQo+PiDCoMKgwqDCoMKgIGRvbTBfY2ZnLm1heF92Y3B1cyA9IGRvbTBfbWF4
X3ZjcHVzKCk7DQo+Pg0KPiANCj4gW3NuaXBdDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA0K

