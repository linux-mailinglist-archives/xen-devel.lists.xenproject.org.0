Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1AACFE5C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008144.1387362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSVG-0001FY-CO; Fri, 06 Jun 2025 08:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008144.1387362; Fri, 06 Jun 2025 08:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSVG-0001DT-9P; Fri, 06 Jun 2025 08:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1008144;
 Fri, 06 Jun 2025 08:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg/F=YV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uNSVF-0000k2-26
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:32:41 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2405::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc7529d-42b0-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:32:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 08:32:36 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:32:35 +0000
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
X-Inumbo-ID: cdc7529d-42b0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax9NaYCk2HAXr155pC/gberOicZIj/zHtoXzYHpKobnuldNGkkjynnaFwmLN6Kqi5gVVDNNC+Buj1vNe2gRbrWFWeaVUy2L4dZ++Lg/vNHK09iAoNUxmNzlwKxhcfGnOhF6+4m/cKntamnhfluaW21piwdiOBj2exlFNWpQw0jwcr3TI1ZhojmP7Z5j2OAcn19ebww2ltRxdtwW+fqk7JW9P/VfCU6jUR+WL1BCgSFTvyChlo4eFzTLfbzC6nj1BsCberNVhjBCh9Bl6yHpy0Jmrg9O4S+30DdNcndU+6ZBONVJyGiD4gMI7hhXssp16a+mXuwOhg8O/nRnQ0JjDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GpoamSMunsvFeR74MN8OcfzZgcA+45yqhKevz0JsSs=;
 b=aQfPYdDlW/99RVgeqwzZRBIbeL9eHNjW/D9lzOj5B59sKDuJIMQPSA3AxD2RJ5Sb9KBuGEMlPe7CshcqbdgwtteNV7JapdfZyWPPnHaz7hbmT3wqFppjg96sBRknHq0YUlD1WzxByWL+XWWc3kpTNjITT2ZRw/NbZgOg63tn9Zo1CV03YMCU5qXLbI4KRP5Z1xgX4kaNfNndrmYHScuFS+i2F0Nps1T8dLtAqycsllDoQUTOX5VWlyMuB+3RgXTpCJrjDcSplLaVSTMxuaIa0xByN5ewrZyZztK+WKYTysH/p9X92JT0NB0PP5bQPxc17rTedWc2HE6keHkDNCoyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GpoamSMunsvFeR74MN8OcfzZgcA+45yqhKevz0JsSs=;
 b=CDz2Qaha7uJkqpOAAcptA9jhIEyh+Njk/uQnp4avhBVNQFevWpuqQFGN2qz3iJLrT9vrp5d7TEwM4ENLvFQsD0g8L4AP3lDGzmZTLAbEge8JePNtXv1Qf1A1yAVpEgEuMqRy/4mTU/uBXb1H8kyPptdiE6hKA9IBc30XfrydxUE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 08/10] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Thread-Topic: [PATCH v5 08/10] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Thread-Index: AQHbziMRPzOlFqwgb0K+e9/00F6hg7P0vO6AgAGnwoA=
Date: Fri, 6 Jun 2025 08:32:35 +0000
Message-ID:
 <BL1PR12MB5849F4955656B6D67D123E6EE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-9-Jiqian.Chen@amd.com>
 <aEG0cx6Yyy7oUhwh@macbook.local>
In-Reply-To: <aEG0cx6Yyy7oUhwh@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB9008:EE_
x-ms-office365-filtering-correlation-id: dc33fa90-48b5-4f5c-aedc-08dda4d4b09a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGI4RU04ZG1CQTIraHc5N25OYTdYY1NrWW03eGhYUzlEZStCMk9CWFhUcTJt?=
 =?utf-8?B?YlRJeFRBYXZLazE0NkxMNlR5MnBXNEt5UlkzKzdoSWxPWUsxU2dVSlB5SVlM?=
 =?utf-8?B?MWhYTzdqM21EeUw4ZVN4N1lkSlMxU1BBbGlLakVCUFZLN2J1UFA5cHZ6VVYr?=
 =?utf-8?B?WmdCNGxCaWZsb2VpNUNPMHpXL0RTVlRXY3dmNlpzVVo2aUZ3K21valhKVE9O?=
 =?utf-8?B?NmJjVktLSzN6TTEwNzZqbStNdFlRanBFQ1ZiWHduUkRnY0JvMDdWaDRiL1da?=
 =?utf-8?B?bjVONGRWLzdtZEhIdmQwTmY2SThhOW85K2doTExSNmpEL2VFc1piR21wUmtV?=
 =?utf-8?B?bTVqYkxpVVc5Nnh5UklTZG5zb1RzeW5GUll3eGtMOTNnMEhtVk1jekN6UHhi?=
 =?utf-8?B?TWpzOWJPRVFzM1R0UDR4N2laVzRUWlV6MGthOEpHTEJxLysvN3BLcGJhaCt6?=
 =?utf-8?B?VkJoM0x2QzhPbUdqWVY4QU5TVDlSVmgrZkZ6MlM3ZDQ4SnZaQm9WRUhkdUxn?=
 =?utf-8?B?M0hoRVJIQ1hHQ09tNDJEdytxMU0wMjlUOXF3b1FvZXpLeXNnRjZWKzM4WUtS?=
 =?utf-8?B?YlhTakRRTTV3SjVQN0tYWmRpbHd5R3hneG9JRHlUdUI0M21SUEJDUkpKYk12?=
 =?utf-8?B?SXBla1NDclh1Z3FzY3BpSHgrZVEzaW9wdys2cGFoUEpOUC8yYlpJcU83c21v?=
 =?utf-8?B?SG1hUUZCVmo1ZXkvTXNNVkpxNVpnbFJXZG5XZEJHdTJROXFueVdoRE00LzNh?=
 =?utf-8?B?VnFLTTdHSmNib0h6RExyYUJHSm16T0lVMlFjZnlVZU9hdTJTcGQrSHJkcUJr?=
 =?utf-8?B?VnBJTjVIdTZSMnp6Tkpqc0gvWE5OUDEzWGFXSzBpV3ZTdTI1MGNvNUN5WjBI?=
 =?utf-8?B?MUN4a3hrbmlhelU0Y2NaRkk4MDRRNzYrT01vcmNnY1ZreERGejJrWkIvQnJw?=
 =?utf-8?B?aTlQL25RbHdCNXBZL00ralFKN0FSUm5pNFhMcXBUalJYRVV5NFJLNWZlNVgy?=
 =?utf-8?B?NmxCcHV2N3VJemYwb3gxZUFtL1JleDhZbEpBb0VLVlFPNDhUUU81N3pYampV?=
 =?utf-8?B?WERUUURkeUUxVElvNGdpS0VLbHlKaENhYUI5STRxTk84dmNYSk9NWmYxTDV6?=
 =?utf-8?B?YkQ0cXdJNHM2OWhDU0JEU043dHBiNXF2bmlhLzRKUktnUEErYzllRWx6ZldL?=
 =?utf-8?B?amFPMUliNmRHMURKOGgwMHB4MlpUZFZWZlkwN2J6OElHMURkTVZXRDZNbjdR?=
 =?utf-8?B?NjBZbDArdklpdG51MDJYQjQ4R1ZTSjhNYTFuQ2p0QXZCMzM4TDZGS2pPM2JU?=
 =?utf-8?B?RWIrQjF0dDMyNU9pUTRYV0YveFhCWURaNmt2UFpuaHk1dVEycUVmcnMyVzQy?=
 =?utf-8?B?Wk8yTkNNbW45K2NTelhzMmZINUNQdERlczg3T1dVZS9xeG1XTUMvNEpDRHhp?=
 =?utf-8?B?N3dsZXZiRnhCMW9RbXRaZVY1cnFuRFErSkk2dnR0QWtWQkFqcTA1WTFIQTR5?=
 =?utf-8?B?V2VrOWtGQ2tUNjJNaHhid0ZjWkdyUWFxdXNpYTg5eEtWN1Y3VVFseWVIdFpz?=
 =?utf-8?B?dVQycVZwWTFMQVFQbmFrRUZybW5Zc1o1NHlkVzY0OWw1MlVKMjNsM25jYllw?=
 =?utf-8?B?K0s3SVpqb3FmVTFLRlFENXh0SXlCdGZVbHZHQ1NROHM0dlhRS0hBUkNZSCtL?=
 =?utf-8?B?d01wSDUxVUJPaFRCQnlMUUdaL2F0S05TSzNIbDRsUzY1V0ZhUFBKL205bExi?=
 =?utf-8?B?MjI4QlN4ZmxuUU15aU9YRVJtQ3I1UUVUazZOWDY4L2huazlETUt2RVF2Uytu?=
 =?utf-8?B?TDVlYU4welBMdjd0dGIwOWNxUXFVa3FIZkFwTFBsbkZFdkppNHhSVFFwdko3?=
 =?utf-8?B?L3lab3RHVE82SnJuM0w5Z3ArUlB1TnZ4YUYzcEdQajVwbVYzREN0ZjBiZFpv?=
 =?utf-8?B?K08yL1Y4cnZMV1dVMWw4a0phcHNQRVJUMlMzZlJYSi8wOC9OZlNscnRUbzJH?=
 =?utf-8?B?ZjBoOUx0ZXZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3pJd1pERWl5S1hjL3VyakVxcWUrYUNPZVEvSHpOeTN6T05aWWVMOFo5cTh4?=
 =?utf-8?B?cGx4RTJrV2NGK3pPWnFTYlF2bjJ5WGlTcmZQYUhVdWtnaG9pWVBQc29MWmVO?=
 =?utf-8?B?TnZaam1oT2VsZnpscUllTzNTd1RlV3k0czNRL0s2YTNpTkxSS0E4WUVQelJT?=
 =?utf-8?B?Ump1eWttd2pLYXg3UVU5N3dzWDNHTSs3TW1rREpzUW9PR2JES2VKQlJLR0dR?=
 =?utf-8?B?QVY2UUIyeFYrM2doZmM5ME5QYlNDWlAyZXpFWFo2R0tSRXo0TjJZck4xVnRq?=
 =?utf-8?B?amJ1NFJqZHFNRlJNRE1DQURPOXdHRngwS1F2N2NJM0xBVTh6SHNXVTFxWjBm?=
 =?utf-8?B?cWVRVVdCTmlRZ2xXZDBJdXNFbCtzZXZ5T2luYzdFRTVGZ01CS3lNT0NOcnZv?=
 =?utf-8?B?aGR0ZzArWWZjSlE0MEs2QVB2Y0ROSVNRMEFHeWJQSHR2eW05aEIwU3ZHK0ds?=
 =?utf-8?B?NjlmVGJDYUp4MW1zZ1pIUHdsUUZQd1lNcUNLczRtRndJYVZqaEkreFYvMUZz?=
 =?utf-8?B?RStGdHI2cHN3Mlp5VWRzYVRwRzk1RnpPb04xajQ1d3dXbnpQUUFYTEFqaFpN?=
 =?utf-8?B?ajNYaE0vOGcxZVRqTU1pd3hnbk5PdzlXTXFoMlpsOGQ5UlN4K3pCS0thWGJn?=
 =?utf-8?B?TWcwdTY5ZXdJVUhiVDY2WWhoTC9ZYWcvd3FmSnU3UzdpbStoeGtxcm5raXZz?=
 =?utf-8?B?RkRUbmN5Wm1Sdm9lM1F6b0w3SFNWamxTZ0VlMkxjd1p3ZkVKSkJMeUxZaHBG?=
 =?utf-8?B?V3kvS0NFZGwyOE1leWx6RFM2WE04V2V5Y1ZPMVM1U2IrRzNpNjZXTnFzMmlz?=
 =?utf-8?B?TFFRWFVsbGVvTUsya1d0eEFQVGtlblBWSDBXWG4vRkNEa244TElUZjNQU2lB?=
 =?utf-8?B?Q1Z5cCt4U1E2bTExek5xSzJnSS95V1JZRlBiL0RCaVlaa0lkSXNHM1BGMzVU?=
 =?utf-8?B?eDl2TTNQZHoxbXJLQjB0NkkyMFdvamtxaVk3em83NzE4YnNWcDh3NWRXWW1j?=
 =?utf-8?B?bHFJa01GL212YnVPeEJwd2gxSVB3MTJhcitYSGxJdXR2T0dGUnRLNWFObHcy?=
 =?utf-8?B?amM3K3RVVWxVMTAySGRKVFR3TWdWS3hPK2F5UDBoYkNoQ3oyV1dYWnNydzRP?=
 =?utf-8?B?VnhYb0pCdldyVUU1UFBFb3Bua2xGWjFDVjFRVTg0eDhiQTFnbWdjWVlhSERZ?=
 =?utf-8?B?MGR6cTJnWGJyaS9nOHhNcE9WTVh1YWczOWU0UmhGMnNpc0g0ZGFKRHIwb3Jh?=
 =?utf-8?B?SkVHb3M1NlF6ZGQ0L3FkZFFhM2ptWitXdHNQb3Q0K2c1bU5UeDFEckE1bUFJ?=
 =?utf-8?B?SC9HOWgwblg0Z3BzaXVPRmFNdVF5aTdBZE9qSWtXeW5qTnlpcUlGY2owaDJF?=
 =?utf-8?B?algva2dMRTBYaS91Q2h1SWUyWVB1SFJkdnZuQ21qMzBJWFZPeHdraHIzQnFB?=
 =?utf-8?B?UG8vTFZRTzNJT21PUm95Sm10ZjVUdEV6cmU0cG8rWno4T0t1OTZpWTFidW5B?=
 =?utf-8?B?eWEwdW53ZHlTTDVZTFdrdGtnVENTQTAvb2dKQnNjdU5XMGY1NldSaG9Vc0sy?=
 =?utf-8?B?U1drQ0xqY0RlM1Z4R0JDLzFOZnVzM1Y1Y2c1d0Y3K1V1Sm9DSWg0TkVqUTlt?=
 =?utf-8?B?akZUUUdFMHF6UjRwcVZaQmFkSU5TVnFva2tPRW9tUWF2OGMyV29FT0FnNFox?=
 =?utf-8?B?SUtzc25TanBPZTYveFplMzY3M093SlRSQVA5VnNkeGFEMTBYajl4SUQwSFNJ?=
 =?utf-8?B?aGZ4ZE0wa21RekM2dG9EM3BEalk2dDBYbTc2N3Rlc2FMb3VQZ3Q5bDFFV2kw?=
 =?utf-8?B?RE9tLzRMRThSWGxvN3FoUjIzT3pXOGZnRUdFcW84WFRwcFVhZFJGcUdlNjBH?=
 =?utf-8?B?V0d4dWd3eTh0QWlPQXV3L1dPb0doQ05ERUZXZHk1bC9XMHo2UE5yN0JzQ2h5?=
 =?utf-8?B?dkFWbWVDeVE4bWxNS25wMjVtU0l3dm9pRHptZVViYVV0Zkx1NjNScUNBWi9K?=
 =?utf-8?B?TTNWai80WjFzTTVrK1Z4YVpZdWRoVEFsejNVZksrYjlDR3FrZS93WkxpSjc0?=
 =?utf-8?B?citaN2ZCbnRjTnhadmxXdmx1VU1VSS9JMit4QUFNMVVreTZoK2RvbWFxbVYv?=
 =?utf-8?Q?krxc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E398576C845B1B4385E6A1D09F7B62A7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc33fa90-48b5-4f5c-aedc-08dda4d4b09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 08:32:35.9327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcW7pU59fHb85z3DqAuu32kDfJhtxgMG0eVZWaC1t72mL9rsK/qNcZj5k9WKuKC/tYkIE53+pOtLG1rpi7O6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008

T24gMjAyNS82LzUgMjM6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgTWF5
IDI2LCAyMDI1IGF0IDA1OjQ1OjU3UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBpbml0X3JlYmFyKCkgZmFpbHMsIGN1cnJlbnQgbG9naWMgcmV0dXJuIGZhaWwgYW5kIGZyZWUg
UmViYXItcmVsYXRlZA0KPj4gcmVzb3VyY2VzIGluIHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkuIEJ1
dCB0aGUgcHJldmlvdXMgbmV3IGNoYW5nZXMgd2lsbA0KPj4gaGlkZSBSZWJhciBjYXBhYmlsaXR5
IGFuZCByZXR1cm4gc3VjY2VzcywgaXQgY2FuJ3QgcmVhY2gNCj4+IHZwY2lfZGVhc3NpZ25fZGV2
aWNlKCkgdG8gcmVtb3ZlIHJlc291cmNlcyBpZiBoaWRpbmcgc3VjY2Vzcywgc28gdGhvc2UNCj4+
IHJlc291cmNlcyBtdXN0IGJlIHJlbW92ZWQgaW4gY2xlYW51cCBmdW5jdGlvbiBvZiBSZWJhci4N
Cj4+DQo+PiBUbyBkbyB0aGF0LCBpbXBsZW1lbnQgY2xlYW51cCBmdW5jdGlvbiBmb3IgUmViYXIu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+
DQo+IA0KPiBMR1RNLCBqdXN0IG9uZSBuaXQgYWJvdXQgYSBib3VuZHMgY2hlY2suDQo+IA0KPj4g
LS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+
IC0tLQ0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0aW9uICJzdGF0aWMg
dm9pZCBjbGVhbnVwX3JlYmFyIiB0byAic3RhdGljIGludCBjZl9jaGVjayBjbGVhbnVwX3JlYmFy
IiBzaW5jZSBjbGVhbnVwIGhvb2sgaXMgY2hhbmdlZCB0byBiZSBpbnQuDQo+Pg0KPj4gdjMtPnY0
IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBmdW5jdGlvbiBuYW1lIGZyb20gZmluaV9yZWJhcigpIHRv
IGNsZWFudXBfcmViYXIoKS4NCj4+ICogQ2hhbmdlIHRoZSBlcnJvciBudW1iZXIgdG8gYmUgRTJC
SUcgYW5kIEVOWElPIGluIGluaXRfcmViYXIoKS4NCj4+DQo+PiB2Mi0+djMgY2hhbmdlczoNCj4+
ICogVXNlIGZpbmlfcmViYXIoKSB0byByZW1vdmUgYWxsIHJlZ2lzdGVyIGluc3RlYWQgb2YgaW4g
dGhlIGZhaWx1cmUgcGF0aCBvZiBpbml0X3JlYmFyKCk7DQo+Pg0KPj4gdjEtPnYyIGNoYW5nZXM6
DQo+PiAqIENhbGxlZCB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSB0byByZW1vdmUgYWxsIHBvc3Np
YmxlIHJlZ2lzdGVyZWQgcmVnaXN0ZXJzIGluc3RlYWQgb2YgdXNpbmcgYSBhcnJheSB0byByZWNv
cmQgYWxsIHJlZ2lzdGVyZWQgcmVnaXN0ZXIuDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gSmlx
aWFuIENoZW4uDQo+PiAtLS0NCj4+ICB4ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMgfCAzNSArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Ry
aXZlcnMvdnBjaS9yZWJhci5jIGIveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiBpbmRleCA5
Y2FmZDgwY2EyYzkuLjRiMTg5MmZhYjNkNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Zw
Y2kvcmViYXIuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiBAQCAtNDks
NiArNDksMjYgQEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICAgICAgYmFyLT5ndWVzdF9hZGRyID0gYmFyLT5hZGRy
Ow0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfcmViYXIoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICB1aW50MzJfdCBjdHJsOw0KPj4gKyAg
ICB1bnNpZ25lZCBpbnQgbmJhcnM7DQo+PiArICAgIHVuc2lnbmVkIGludCByZWJhcl9vZmZzZXQg
PSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5zYmRmLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0VYVF9DQVBfSURf
UkVCQVIpOw0KPj4gKw0KPj4gKyAgICBpZiAoICFyZWJhcl9vZmZzZXQgfHwgIWlzX2hhcmR3YXJl
X2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4gDQo+IEkgdGhpbmsgeW91IGNvdWxkIGNoZWNrIHJl
YmFyX29mZnNldCA8IFBDSV9DRkdfU1BBQ0VfU0laRSB0byBiZSBtb3JlDQo+IGFjY3VyYXRlPw0K
T0suDQpEbyBJIG5lZWQgdG8gY2hhbmdlIGluIGluaXRfcmViYXIoKT8NCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

