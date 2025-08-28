Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DCAB3A687
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099657.1453422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfeU-0003Mx-Uy; Thu, 28 Aug 2025 16:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099657.1453422; Thu, 28 Aug 2025 16:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfeU-0003LI-R1; Thu, 28 Aug 2025 16:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1099657;
 Thu, 28 Aug 2025 16:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urfeT-0003LC-PV
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:39:05 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d885a1-842d-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 18:39:03 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI2PR03MB10761.eurprd03.prod.outlook.com (2603:10a6:800:26e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 16:38:59 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 16:38:59 +0000
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
X-Inumbo-ID: 81d885a1-842d-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6Ti2vvpAznUULYtaOlsQK6jsr8Lj08aLr3Z96ZtCqxNFUimaYg3YVF8GVq0PQyKkj27BDzg49OtUBE3a05/ST4pXeI8+g1R7UpEgRXVP0322Ox9y3JuADoZEtJgZbWNZD0lt54+a1kPUrjVSFWaO+qOUdHmIxZqCrQ5bYJ5auCZUu/yZFagmhmgIby2R7m+Crpju83andkDq+5YQzPgTsCwtHhPGNIwpof+gSTUMLGWkqACsMQfjGJRliOPLA1E1mE3EpKt7wy26PHBPz2CEq+NwP4PIjcJJ6cEz28maHsTgyMhVTO2e9XMlBOsKwe478oAMnS15G+0brUBW+0w4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc1qcNobPmnkS5mghtIACn642xr30g/IVbn+Atejrdk=;
 b=rAtV2QpY/YLw2sloFdijRUDbJWq/DlqgwDu8fRJwH8O0K4jeDdoD8L2x6aynuriW76j+ahCrW8jyASA0rjD3tiIRWRXIkFUZGwnmkSke+hk8S7BtF9b5krirnR2m+c1KnWy4qpEpI192Bgxa4nccE5OPQ93AkciUt49+iwkCA/LrKvcQCsbjn+fNdtVrKBehx90xq3S5/lLDd3U8HA0wtUCBDM1oMgPd8HIPsCDH+59A1k7Gaq3w/iue0S+/j9qPMjcxfjbAw3ZLd1WdhWGzLBz4FKLsi0Gt47bb5NpcSvMDPj6vpVU4P6iNXoTawAtWrAibiBVe2BNmAIG6dIuXNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc1qcNobPmnkS5mghtIACn642xr30g/IVbn+Atejrdk=;
 b=ZU5CZlet+wPZFmtOzjuoE1DuVi5PYDDf2Tk3qstz9HR4oY3yIx8Dzrq13+YI+hB608GkJtjkYKy3dncCdmosEGeUhRL09dg+vqmgbQsjB5aC4MA6ijYhsO1EsH+gsE+EjHXpb3d49oC/ejZoUO2TFvY+jNKA3Csv2z37PmDywXgXZqpzgYlVoa1Z950F5vHr84PjNHSHeUIp7np8sCOwFEPulTLcOG7PaVjjdqyk2y4BRcfDdiv2QFRvZ2aOd9KT9/kdABTnF1MPWtvUA8KSA6uGt3pHoNvTs6ZK8ZFEsU2AckqM2qdcsOai/JBDCTcNiTGzKsfml0mAx3ZJ4oa4dA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcF3/Ont2iCNudZU+HGYrvI6u3EbR4DeIAgAA3ngA=
Date: Thu, 28 Aug 2025 16:38:59 +0000
Message-ID: <44647ede-8f42-43bb-842a-0825f632e659@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
 <1f4c921d-5c0d-46f6-b4c9-c7bf0e41330f@gmail.com>
In-Reply-To: <1f4c921d-5c0d-46f6-b4c9-c7bf0e41330f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI2PR03MB10761:EE_
x-ms-office365-filtering-correlation-id: f73b81b9-c74f-4140-cb54-08dde6516395
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUFDL2cyWXBIWHF0L2NReEE5VUY5Y3FmRFg3MXZQQ3F1TGV6MTBvU0hTdU9P?=
 =?utf-8?B?Rlo1MHR2dEFQQWNoNEpldi9obmR0VVlPbm1VOXFqUm9NaDN0V0tIbjFncHlX?=
 =?utf-8?B?YVZIZE5MTDBjbDMwWnVUQW9sMmhLTmR4YTdubHRDQkxEc3Yzcnp1bE5VTTFU?=
 =?utf-8?B?OUlpZUJpeGhXTUY5UEVmS0d1clAvVDJoUTBkUFBoS3p1NFBLNGl3QlFIR0R2?=
 =?utf-8?B?VWFXY1NDakp5MWJQQVFZc0h1VThsbm9oR0pid2ltaDhUYlJtTW5idlhsaWNS?=
 =?utf-8?B?MUt1WncvVDNMbHlJNHppWWI3L2ZITm1aandSd1JNY1NnRkVleHpnUHpDTEpo?=
 =?utf-8?B?dWVBS2w1UjV3cXViWjQ0elNQc2dLYmxYWjM0RjBWc0g2WmJEdnhRamd6TWtN?=
 =?utf-8?B?SlhCemJ1UDR0ZWRGSWFVSVdQa1JMWEJZZmNCclE5dzdNalVreDVvM0VKckxp?=
 =?utf-8?B?ejNOTzNaZGxncmsyTGNmeTlPU2Z2QXhCTXJ3bWlVRWlZbjVmMkJ3ZmppVDd1?=
 =?utf-8?B?M20rYUk0Zlp2TTlXcUp6OXMyZVVLOEhhcklvdUxLZlMxUzdUNDBzNHpjbURG?=
 =?utf-8?B?MzhPTFRyWWdKZmFIYWNCYzZMZ2lzZzJ4S3lDck1DQzdCenVhTForb2JOcVg5?=
 =?utf-8?B?YVMwNzZKZTQvUjd3Mnl2SS9uc0M4RGhxZGJ3RytwNE1Hemx6NFhlMTJwa1V0?=
 =?utf-8?B?VTRROG0vbHdLR2I2cmFQV2RWRWUvVzBBZXpLTS9rM0VWd3FyYnh3NWxlMTRp?=
 =?utf-8?B?UTNsVEN0TGdJNWpLbVNOY1BhWEZsZUtEUXhYcU90U3FhWVk2dU9HTGlBOWh4?=
 =?utf-8?B?Skd6bkNKelFhVkVveUZiMXZLM2N2L0VON0phR1VZNWE0azl1MCt4WlE0WkFw?=
 =?utf-8?B?T1BoaUowZ2Jaa0ZkMnFpaldMUFE4dTVxSHFBejRzM1g4M0VrazlIVWhSRFF1?=
 =?utf-8?B?aHMxM0JkUmpuRWpHNWhYckJ0amVCMkVHVTNvSDRXaXJaaU5uMG1GTlg1Z3M1?=
 =?utf-8?B?TkhJNXRKOFpGWnAxaXpVanAwR3Y4Yk1jbDZsZkVuMFkvVzJ1TjIxQlI3aVZw?=
 =?utf-8?B?bHdUR3Y2MzlMQ2lRTnEzU040Zy9mb2c5S05FMWFzSHF6VTNCelBWVHppL253?=
 =?utf-8?B?VkkrNHpobnhva1AwYXUzQm1KZ1UyN00wL2pSUHdQNVMxOHZiN1VWckVSQkxp?=
 =?utf-8?B?dFVLT3VFYWZsV0crNGxBY1NlaXBaZXZUdnpyVVRseVVXek9YL0R5V2thcmwx?=
 =?utf-8?B?dDgyUHNJb2o5NjlzRWdaSlhYUlhpOWpvYzA1MGtJOTU1MUZSb3M1bHM2N0R2?=
 =?utf-8?B?YWdlcmJrK3J2d1VlV05MVEpmd1pheHB1SEtWOVMyajRJNGJCUVlRckNiajVC?=
 =?utf-8?B?dEhYd0ROSjNoNFp6em1KeEhhTE1Fa1lJYkQ4RXNhTUZOOGRwdDNhRmV6KzFQ?=
 =?utf-8?B?YjNURHBTek5acWRxSDd2OFpsNy9JRG9nUGZkNmJDL1RZT1hGcWUxYkJQUW1h?=
 =?utf-8?B?NmM0a2pPMStTN1djVFhSZDBKTzNseGh6VmlNUVBHQllJaDNUTGFGdlE3OHV6?=
 =?utf-8?B?RDJSN3NPSE90U2ZpNFMvVmpVWUE5OHJoMDRGRkdLbWRNYkdiTWU3cTViM0gx?=
 =?utf-8?B?SXNBNTYrellIZExmTXpOSGNqSkgzdTBYRFdtdTV2M2ppdWxXdFJkNDRXa3lZ?=
 =?utf-8?B?bTNMdXZ3NWc1S3ZCTUprclFuWlpJRXd0UWtlSlg0THQ4alRTc1ZLWnR5Wi95?=
 =?utf-8?B?RExtRGsxRzQyamhLQWtoNjhQbGhabmN2TjljTXFxTm5ScE1peWMxWFlEUlk0?=
 =?utf-8?B?LzZHZ0pBZEZwaWdHU0lLWDJZV3Q1dHlFeEJxcFJOMmxrV0MzQ1FJOU4wSndK?=
 =?utf-8?B?QnJ0NlRKM3dDaTVieWFJVUczSzRYTG1iN0NyRmRCLzRaUmZxalR4aVMzTVR1?=
 =?utf-8?B?QlovQ1NtUFgyM01HL2hvWlRkK3BncmN6QTVmUnhPVlYrU3orVUs3VDhOWWV6?=
 =?utf-8?B?OWFobmVIQlN3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFdYbHdBa1pvYzVLQXRRSHkvaU5sNlVFSGxEc2VNTFRxdytyNW1mejV2TnFs?=
 =?utf-8?B?cEo3S1pBU2xHcjVUdDJSNnF1R0JqTlUxelJWUU15MTFLVzRNRjF6TlZEcS9s?=
 =?utf-8?B?amEvdGlBVElqYTJrUXVTcXZnN1pZVVQxbzM1Q2RwNFFtUlNreUsxYk10UU5u?=
 =?utf-8?B?SkMvVTAwNWgza3pQdlFFWW9XVnovUGFKR3A5N3NmbzU0NUdmZnJTQWJRUVEr?=
 =?utf-8?B?ZU42TVlLWWl5Rjh5Y2hNOThVbERIVnNXZ29EOG5XaHlUSTk2NHRGeDBUb0tt?=
 =?utf-8?B?VjZGZHhhOUFESFRFV1YrM3M2Q3drMHplWUNnS3o0bWt1TWhPbkp1bEpZVG5C?=
 =?utf-8?B?U3l3NDltUE1JNDdBS2pCRFp6VVQzUjlOV0NYdVRrSWZ6bVN5SzdScWdPdk5y?=
 =?utf-8?B?RGFteWNBZHd2Q2RqTGRUNllPV3JVTDJrY3ZnLzJZcG5sNzI5c0tuQ1R5N3pF?=
 =?utf-8?B?dXRRdkdEOGV1WXBXa1JiZUdoZVhEcW5tK0ZtSXBHb3JmTG9TU01zMFlwclBz?=
 =?utf-8?B?cHI4NXlucWtCcG1DRGRsNFpNU2Q1MGp4a1ZxcjNrWkIyVExSS2ExcGtiODN4?=
 =?utf-8?B?ZnMvQ0dOUlBFNEdibUhzdWFmSkVFazRIRWd5a1V6ZDNheVpsY3dLck41QUFs?=
 =?utf-8?B?S2VNOGkxRXFmVkp1VjUvWTFSTSt6UncyR1pIVTZ4UHhBeTVJbmdlai9sSm5x?=
 =?utf-8?B?bS8ycXhXZkNvSVBWcDlwNUY4eEN2RUE4NUdXZnVMVWhwYlNtWGJjT1hKajhZ?=
 =?utf-8?B?UW5BaVVuZVJLOWRGMmUrZDNLN1hjTWg1dG9xYXR2bmlFbFZrT1JWYjhvQURt?=
 =?utf-8?B?cXRpM2J3RDZaOUZ3azE4R3BhRjdWT2R3R0NaVWV0WkxlYkRyN0UxZFc1MWN0?=
 =?utf-8?B?OS9mMWNaK1NHc2xHUkV6NDJMc0tXZVZXdCs2ckZsWVNDdGU5bXdmbG1xNEln?=
 =?utf-8?B?ejJFUkdOMnBvNEMvb1drNTR0WGY5UmdVZjdoaFhQM0hkNGVBbWVxdDNvTFpF?=
 =?utf-8?B?VXdzNEtPcFBiemplQmF0NXdGZHlXMFE3SkpuckpYakdGK0M2VXZpdzlMZncy?=
 =?utf-8?B?b1owVGRtaHRaRkcxS1JzQ2hiajROdzJSQ09iZGxtN2xBUkJwM2ZIM3BTbEhv?=
 =?utf-8?B?KzVnM3VwYXR1MFQxaDFrUTVHUVlVeHpPRGoxY2JCeFN2TEhvNHBMclllVWRs?=
 =?utf-8?B?RFpZSVFTSzcvNEI3UmVJTndNRU1XTEhrL3BDVkREK2orZWlLd1ByUXZUUmF5?=
 =?utf-8?B?eERCeFFsOWE1N091RXEvb1Y0N2FYMU9YRU50R1R1VnVDMWRxUHBJdkF6QVBE?=
 =?utf-8?B?bjViZUV3bkdOWHErOGRPaGI3V2JNOWpTZHpwcGFqRXNaTTFMeExJSXRGTTNT?=
 =?utf-8?B?dWVaV3lBUEdWdjQ4OGwrMG9lVUltZ3dDdThsZS9LNTV0MEdxNjMrNFVYMmtF?=
 =?utf-8?B?TlVLRlVreWZ2OGpnZDJIamNSUkN5UGVRclFKRVlWNzNkZHhPSkxhdU5kL3VE?=
 =?utf-8?B?RXc2bHFuVmpoMkpsSFE2WndHZTRETVJsbUIwTmVLK3FqaitnaDhQaFZSZmQ1?=
 =?utf-8?B?NHNqdDJGUFV6VDhyM1B0L2NBUDJNV25rYzZhdnl4dlIrUjBSRlM0TXpSWVRT?=
 =?utf-8?B?SU9xTGhwRHBBUnR5dzE1Mi9IOG9pY1YzVUQ2NlNRTHkxeit3dGxFL1pLUnBZ?=
 =?utf-8?B?VloyU29LN0l2UC9tanFIQXhaeVlmc1V1YzlURDhoTkk1U3FjSzZRcUt0OG1l?=
 =?utf-8?B?ZVJHbm5JQ2k5YTd1cjJFeUFCTU5JT0hmTS9QR1NhYzR2UlFqUFZCbmw5OUxr?=
 =?utf-8?B?SGV6SzJ0SWczUytOZDZmeVpZUmFQSWJmYjlkb0U1ckU0d1VyTVhUM0ZRN0t4?=
 =?utf-8?B?YzNBTG9ieU5oQW5KMnEwWVhCNHJvaG4rMUd1SllUN0FudmJJc0dDK3R5WVA1?=
 =?utf-8?B?a1JKOGY3VjJxdmdCNDdtaEF5ZUsxRnJmOS9ta3IyZ0wwZG1DaG5rbWVxcHlL?=
 =?utf-8?B?K2J2NXNocXdOdEpuajN1WWZ4aVNKSTFQbnZtcDZWalpVelFvTnU1b1FNbUdm?=
 =?utf-8?B?cDRCVERjbG1VMTJ5Q2U4ekp0SGlsRWZtaitSQTZUSTh3T1B6S0xKZTVZdnFl?=
 =?utf-8?B?UjZxNGJtV2k2TGxkZ1F2anBHWlFXR25BT0pPZUJ3bWo2L2ZoLzllclR1T0t1?=
 =?utf-8?Q?4AHNiOuWp3DS8z79dxgD5/U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9B849E6BF51694C915E748D413683A8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73b81b9-c74f-4140-cb54-08dde6516395
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:38:59.3452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkotzdiL3+nApV9j9BtVTUNYM1u+fXRibKcq+fopKMKWPD6wRXE3yjJLPOyudwF4rkspuoUpXiIf8E/mB3UPhNqDvEUSt/yemoh6eGEhsxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10761

SGkgT2xla3NhbmRyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAyOC4wOC4y
NSAxNjoxOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+IA0KPiANCj4gT24gMjcuMDgu
MjUgMjE6MjQsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+IA0KPiBIZWxsbyBMZW9uaWQN
Cj4gDQo+PiBUaGUgRG9tMCBhbmQgRG9tVXMgbG9naWMgZm9yIHRoZSBkb20wbGVzcyBjb25maWd1
cmF0aW9uIGluIA0KPj4gY3JlYXRlX2RvbTAoKSBhbmQNCj4+IGFyY2hfY3JlYXRlX2RvbVVzKCkg
aGFzIGJlZW4gdXBkYXRlZCB0byBhY2NvdW50IGZvciBleHRlbmRlZCBTUElzIHdoZW4NCj4+IHN1
cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUgYW5kIGVuYWJsZWQgd2l0aCBDT05GSUdfR0lDVjNfRVNQ
SS4gVGhlc2UgDQo+PiBjaGFuZ2VzDQo+PiBlbnN1cmUgdGhlIHByb3BlciBjYWxjdWxhdGlvbiBv
ZiB0aGUgbWF4aW11bSBudW1iZXIgb2YgU1BJcyBhbmQgZVNQSXMgDQo+PiBhdmFpbGFibGUNCj4+
IHRvIERvbTAgYW5kIERvbVVzIGluIGRvbTBsZXNzIHNldHVwcy4NCj4+DQo+PiBXaGVuIGVTUElz
IGFyZSBzdXBwb3J0ZWQgYnkgdGhlIGhhcmR3YXJlIGFuZCBDT05GSUdfR0lDVjNfRVNQSSBpcyAN
Cj4+IGVuYWJsZWQsIHRoZQ0KPj4gbWF4aW11bSBudW1iZXIgb2YgZVNQSSBpbnRlcnJ1cHRzIGlz
IGNhbGN1bGF0ZWQgdXNpbmcgdGhlIEVTUElfQkFTRV9JTlRJRA0KPj4gb2Zmc2V0ICg0MDk2KSBh
bmQgaXMgbGltaXRlZCB0byAxMDI0LCB3aXRoIDMyIElSUXMgc3VidHJhY3RlZC4gVG8gZW5zdXJl
DQo+PiBjb21wYXRpYmlsaXR5IHdpdGggbm9uLURvbTAgZG9tYWlucywgdGhpcyBhZGp1c3RtZW50
IGlzIGFwcGxpZWQgYnkgdGhlDQo+PiB0b29sc3RhY2sgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiwg
d2hpbGUgZm9yIERvbTAgb3IgRG9tVXMgaW4gRG9tMCwgaXQgaXMNCj4+IGhhbmRsZWQgZGlyZWN0
bHkgZHVyaW5nIFZHSUMgaW5pdGlhbGl6YXRpb24uIElmIGVTUElzIGFyZSBub3QgDQo+PiBzdXBw
b3J0ZWQsIHRoZQ0KPj4gY2FsY3VsYXRpb24gZGVmYXVsdHMgdG8gdXNpbmcgdGhlIHN0YW5kYXJk
IFNQSSByYW5nZSwgd2l0aCBhIG1heGltdW0gDQo+PiB2YWx1ZSBvZg0KPj4gOTkyIGludGVycnVw
dCBsaW5lcywgYXMgaXQgd29ya3MgY3VycmVudGx5Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExl
b25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+DQo+Pg0KPj4g
LS0tDQo+PiBDaGFuZ2VzIGluIFY0Og0KPj4gLSBjb25zb2xpZGF0ZWQgdGhlIGVTUEkgYW5kIFNQ
SSBsb2dpYyBpbnRvIGEgbmV3IGlubGluZSBmdW5jdGlvbiwNCj4+IMKgwqAgdmdpY19kZWZfbnJf
c3Bpcy4gV2l0aG91dCBlU1BJIHN1cHBvcnQgKGVpdGhlciBkdWUgdG8gY29uZmlnIGJlaW5nDQo+
PiDCoMKgIGRpc2FibGVkIG9yIGhhcmR3YXJlIG5vdCBzdXBwb3J0aW5nIGl0KSwgaXQgd2lsbCBy
ZXR1cm4gdGhlIHJlZ3VsYXIgDQo+PiBTUEkNCj4+IMKgwqAgcmFuZ2UsIGFzIGl0IHdvcmtzIGN1
cnJlbnRseS4gVGhlcmUgYXJlIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBjb21wYXJlZA0KPj4gwqDC
oCB3aXRoIHRoZSBwcmV2aW91cyBwYXRjaCB2ZXJzaW9uDQo+PiAtIHJlbW92ZWQgVkdJQ19ERUZf
TUFYX1NQSSBtYWNybywgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YgaWZkZWZzDQo+IA0KPiB2ZXJ5
IGdvb2QsIHRoYW5rcywgb25seSBOSVQgYmVsb3cNCj4gDQo+IFJldmlld2VkLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IA0KPiANCj4g
DQo+Pg0KPj4gQ2hhbmdlcyBpbiBWMzoNCj4+IC0gcmVuYW1lZCBtYWNybyBWR0lDX0RFRl9OUl9F
U1BJUyB0byBtb3JlIGFwcHJvcHJpYXRlIFZHSUNfREVGX01BWF9TUEkNCj4+IC0gYWRkZWQgZVNQ
SSBpbml0aWFsaXphdGlvbiBmb3IgZG9tMGxlc3Mgc2V0dXBzDQo+PiAtIGZpeGVkIGNvbW1lbnQg
d2l0aCBtZW50aW9ucyBhYm91dCBkb20wbGVzcyBidWlsZHMNCj4+IC0gZml4ZWQgZm9ybWF0dGlu
ZyBmb3IgbGluZXMgd2l0aCBtb3JlIHRoYW4gODAgc3ltYm9scw0KPj4gLSB1cGRhdGVkIGNvbW1p
dCBtZXNzYWdlDQo+Pg0KPj4gQ2hhbmdlcyBpbiBWMjoNCj4+IC0gbm8gY2hhbmdlcw0KPj4gLS0t
DQo+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuY8KgwqAgfMKgIDIgKy0NCj4+IMKg
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuY8KgwqDCoMKgIHzCoCAyICstDQo+PiDCoCB4ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+
PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2Fy
Y2gvYXJtL2RvbTBsZXNzLSANCj4+IGJ1aWxkLmMNCj4+IGluZGV4IDY5YjllYTIyY2UuLjAyZDU1
NTkxMDIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYw0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMNCj4+IEBAIC0yODUsNyArMjg1LDcg
QEAgdm9pZCBfX2luaXQgYXJjaF9jcmVhdGVfZG9tVXMoc3RydWN0IA0KPj4gZHRfZGV2aWNlX25v
ZGUgKm5vZGUsDQo+PiDCoMKgwqDCoMKgIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgdnBs
MDExX3ZpcnEgPSBHVUVTVF9WUEwwMTFfU1BJOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGRfY2ZnLT5h
cmNoLm5yX3NwaXMgPSBWR0lDX0RFRl9OUl9TUElTOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRfY2Zn
LT5hcmNoLm5yX3NwaXMgPSB2Z2ljX2RlZl9ucl9zcGlzKCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLyoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVGhlIFZQTDAxMSB2aXJxIGlzIEdVRVNU
X1ZQTDAxMV9TUEksIHVubGVzcyBkaXJlY3QtbWFwIGlzDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBp
bmRleCBkOTFhNzFhY2ZkLi4zOWVlYTBiZTAwIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+
IEBAIC0yMDU0LDcgKzIwNTQsNyBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lkKQ0KPj4g
wqDCoMKgwqDCoCAvKiBUaGUgdkdJQyBmb3IgRE9NMCBpcyBleGFjdGx5IGVtdWxhdGluZyB0aGUg
aGFyZHdhcmUgR0lDICovDQo+PiDCoMKgwqDCoMKgIGRvbTBfY2ZnLmFyY2guZ2ljX3ZlcnNpb24g
PSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfTkFUSVZFOw0KPj4gLcKgwqDCoCBkb20wX2NmZy5hcmNo
Lm5yX3NwaXMgPSBWR0lDX0RFRl9OUl9TUElTOw0KPj4gK8KgwqDCoCBkb20wX2NmZy5hcmNoLm5y
X3NwaXMgPSB2Z2ljX2RlZl9ucl9zcGlzKCk7DQo+PiDCoMKgwqDCoMKgIGRvbTBfY2ZnLmFyY2gu
dGVlX3R5cGUgPSB0ZWVfZ2V0X3R5cGUoKTsNCj4+IMKgwqDCoMKgwqAgZG9tMF9jZmcubWF4X3Zj
cHVzID0gZG9tMF9tYXhfdmNwdXMoKTsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vdmdpYy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvIA0KPj4gYXNtL3ZnaWMuaA0K
Pj4gaW5kZXggZmI0Y2VhNzNlYi4uMTFmOWQyMTZlYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS92Z2ljLmgNCj4+IEBAIC0zNTUsNiArMzU1LDI3IEBAIGV4dGVybiB2b2lkIA0KPj4gdmdpY19j
aGVja19pbmZsaWdodF9pcnFzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYsDQo+PiDCoCAvKiBEZWZh
dWx0IG51bWJlciBvZiB2R0lDIFNQSXMuIDMyIGFyZSBzdWJzdHJhY3RlZCB0byBjb3ZlciBsb2Nh
bCANCj4+IElSUXMuICovDQo+PiDCoCAjZGVmaW5lIFZHSUNfREVGX05SX1NQSVMgKG1pbihnaWNf
bnVtYmVyX2xpbmVzKCksIFZHSUNfTUFYX0lSUVMpIC0gMzIpDQo+PiArc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQgdmdpY19kZWZfbnJfc3Bpcyh2b2lkKQ0KPj4gK3sNCj4+ICsjaWZkZWYgQ09O
RklHX0dJQ1YzX0VTUEkNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIENoZWNrIGlmIHRo
ZSBoYXJkd2FyZSBzdXBwb3J0cyBleHRlbmRlZCBTUElzIChldmVuIGlmIHRoZSANCj4+IGFwcHJv
cHJpYXRlDQo+PiArwqDCoMKgwqAgKiBjb25maWcgaXMgc2V0KS4gSWYgbm90LCB0aGUgY29tbW9u
IFNQSSByYW5nZSB3aWxsIGJlIHVzZWQuIA0KPj4gT3RoZXJ3aXNlDQo+PiArwqDCoMKgwqAgKiBy
ZXR1cm5zIHRoZSBtYXhpbXVtIGVTUEkgSU5USUQsIHN1cHBvcnRlZCBieSBIVyBHSUMsIA0KPj4g
c3VidHJhY3RlZCBieSAzMi4NCj4gDQo+IE5JVDogcy9yZXR1cm5zL3JldHVybiAuLi4NCj4gDQoN
Ckkgd2lsbCBmaXggdGhpcyBpbiBWNS4NCg0KPiANCj4+ICvCoMKgwqDCoCAqIEZvciBub24tRG9t
MCBkb21haW5zLCB0aGUgdG9vbHN0YWNrIG9yIGFyY2hfY3JlYXRlX2RvbVVzIGZ1bmN0aW9uDQo+
PiArwqDCoMKgwqAgKiBhcHBsaWVzIHRoZSBzYW1lIGFkanVzdG1lbnQgdG8gY292ZXIgbG9jYWwg
SVJRcyAocGxlYXNlLCBzZWUgDQo+PiBjb21tZW50DQo+PiArwqDCoMKgwqAgKiBmb3IgbWFjcm8g
dGhhdCBpcyB1c2VkIGZvciByZWd1bGFyIFNQSXMgLSBWR0lDX0RFRl9OUl9TUElTKS4NCj4gDQo+
ICDCoC4uLiBJIGFtIG5vdCAxMDAlIHN1cmUsIHRoYXQgSSBmb2xsb3cgdGhlIHdvcmRpbmcgIkZv
ciBub24tRG9tMCANCj4gZG9tYWlucywgdGhlIHRvb2xzdGFjayBvciBhcmNoX2NyZWF0ZV9kb21V
cyAuLi4iLiBEaWQgeW91IHBlcmhhcHMgbWVhbjoNCj4gDQo+IEZvciBEb20wIGFuZCBzdGFydGVk
IGF0IGJvb3QgdGltZSBEb21VcyAuLi4/DQo+IA0KPiAgwqBXZSB3aWxsDQoNClllcywgSSBhZ3Jl
ZSB0aGF0ICdGb3IgRG9tMCBhbmQgc3RhcnRlZCBhdCBib290IHRpbWUgRG9tVXMsIHdlIHdpbGwg
YWRkIA0KYmFjay4uLicgc291bmRzIGJldHRlciA6KQ0KDQo+PiArwqDCoMKgwqAgKiBhZGQgYmFj
ayB0aGlzIHZhbHVlIGR1cmluZyBWR0lDIGluaXRpYWxpemF0aW9uLiBUaGlzIGVuc3VyZXMgDQo+
PiBjb25zaXN0ZW50DQo+PiArwqDCoMKgwqAgKiBoYW5kbGluZyBmb3IgRG9tMCBhbmQgb3RoZXIg
ZG9tYWlucy4gRm9yIHRoZSByZWd1bGFyIFNQSSByYW5nZSANCj4+IGludGVycnVwdHMNCj4+ICvC
oMKgwqDCoCAqIGluIHRoaXMgY2FzZSwgdGhlIG1heGltdW0gdmFsdWUgb2YgVkdJQ19ERUZfTlJf
U1BJUyB3aWxsIGJlIHVzZWQuDQo+PiArwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqAgaWYgKCBnaWNf
bnVtYmVyX2VzcGlzKCkgPiAwICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVNQSV9CQVNF
X0lOVElEICsgbWluKGdpY19udW1iZXJfZXNwaXMoKSwgMTAyNFUpIC0gMzI7DQo+PiArI2VuZGlm
DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiBWR0lDX0RFRl9OUl9TUElTOw0KPj4gK30NCj4+ICsN
Cj4+IMKgIGV4dGVybiBib29sIHZnaWNfaXNfdmFsaWRfbGluZShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgdmlycSk7DQo+PiDCoCBzdGF0aWMgaW5saW5lIGJvb2wgdmdpY19pc19zcGko
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZpcnEpDQo+IA0KDQpCZXN0IHJlZ2FyZHMs
DQpMZW9uaWQNCg==

