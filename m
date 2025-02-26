Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD0A45B00
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 10:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896277.1304960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEBp-0004ox-G0; Wed, 26 Feb 2025 09:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896277.1304960; Wed, 26 Feb 2025 09:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEBp-0004ls-CW; Wed, 26 Feb 2025 09:58:53 +0000
Received: by outflank-mailman (input) for mailman id 896277;
 Wed, 26 Feb 2025 09:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9WXX=VR=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tnEBn-0004lm-Vg
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 09:58:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f403:260e::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4719e71d-f428-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 10:58:50 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7983.eurprd03.prod.outlook.com
 (2603:10a6:102:21d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Wed, 26 Feb
 2025 09:58:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:58:47 +0000
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
X-Inumbo-ID: 4719e71d-f428-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL8gzK7FINalsqHJ2Q9jJQh65brGr+Cwl2opdSbSv1BNRhUut0qZND4chf2MXx2G6D9Hsf6R1iOZQ2wYBdWOnlbGmdy4xZF/aVplN0V8toKmrVBny2sXXpCZrikI4x3WGv491pXGtrm2v0gYoNMUzbAFe2oOzzh9eCZY+uIbSZITvWLjwhsWdQqFoXI4F4L6eDtN+Wk+pwbJevoMXGIPrrzpp30PWEftQWzZt+LUjawvx/dyrZm/rBM4jxcSfTbl6ajJZBik3hAFxoG+MAhZ0MQYO4nBcNLBmObejLhi46U0dfRbXTob+oTkAC7mw2oWcJAj6xzD/7BvyKcJlDVSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDD56LKMooMs7+7yBsyUhzulBbC49slejj6BUFlkyIM=;
 b=S+Hee+DEKkGNe0X/MxbUJiLoYENWgSwNandAxWpFwA8BQHCHWj0VLN1ll96GnbLV7aKTpfgnvfPkVHZmp61CCffkEj+PNZCnjeSeLCeQBuSdWkfAidxf06rfVuz/wTHGI73QNsSFkAV8xx4sl/3hMdkCEeUYIIDYkxa0E8IWxKmAfZwLSgbMbe1nvUbxzXN3HNjzBLSzsFQJTsNqsElHh1DCFZjock/t6yWRj3rRYBbc6KtK7/Kry6lgylGBTFsIlJrvgbn+KzLnAZniythTrlDOF7tkdgl2FrJlZBKVcw8liX4rZxMXDJVN83iMSV2KMsmlEroexoGa285ahArMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDD56LKMooMs7+7yBsyUhzulBbC49slejj6BUFlkyIM=;
 b=CaAQNFmLMg75fpqXldW7cIzT1JxbWV+r7dWuX8WPK4YeRX2ws2A6zk+YFpHKB0v2tZvuXw9SygaGluVIdQH/jPM3qNJaJclnkIgindwjNtZ6KsXvpyo7X9+rIYZuY0UNPmf77Jfy84qXvvFkIVvfbI2qZan+vC0N/vrjGfLKyZ5FOxpBnhzg2HXfuPubKvEP7+G/BFh1uwGtPk6I052IkPtHM9FBmdvIp9W79D1YA66Hcb+ID6+4P2lFJdw+89Mn9KJJWOaxDnRBmVznzMktph/UnXtGM1a1dbqArI6m15/pANM3YbmByWTH5OldqdREDB0RfN7H+4/mVkJ1Pjcz+Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v8 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbe6bXkeUuupR7FUWii7Y2X2QPj7NAXFWAgBkWagA=
Date: Wed, 26 Feb 2025 09:58:47 +0000
Message-ID: <e6ea52a3-c7ce-411f-8186-cf725aa608f3@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
 <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
In-Reply-To: <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7983:EE_
x-ms-office365-filtering-correlation-id: c3b1a69c-b1d4-4f7d-a6d1-08dd564c29ec
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkNVQUptaWx2VHR6M2pObTdkYjdEVnFRTUtuc1ZpTDd4YVhQaTlXOEQ2bldl?=
 =?utf-8?B?ZHdPUFZjaUZ0U2labmdpb1dTQm1mZ3VYcVF6MGRvVTdxdUxqL3Rka2FGTHVo?=
 =?utf-8?B?WTdrNU5Ma1hlRFJQdCs5UlgxTWFva2M2L2tKTTVvRTZtRzZwby81SEMydTdr?=
 =?utf-8?B?YnY2UkhwWEUyZTNpVXpud0plNDl6ZHAveVJjM2lwT0lkWEUvcGJIVVNtcHBk?=
 =?utf-8?B?ZzhiQ3FvZHBMSGx3SXcxdHlDRlkrWWdBaVhtSnNkdlBCVGR2UEI3S3RJazMx?=
 =?utf-8?B?NGc3TklKc0RKalM3TVBEbmFGNm1Ec3hsY3FSWUluUjNwS2g0Rk84Rk9XRFdE?=
 =?utf-8?B?UXVJZW1lMHkzd2NXcDNDRHpYTXliTW5hVVVQMzM1QkhmVWR0c3VtUnNsM3d1?=
 =?utf-8?B?S0hsVHdZNUkrMU5uN0JwMHg1UVdhRnpRTGRiM2ovazFwVEtNcDNDbUYrTVU4?=
 =?utf-8?B?WWNuQWcrSS96cURZR0pBd2tSY1N5bTl1Um1IY2JRZllaNUF5REFMOWhaTU1Q?=
 =?utf-8?B?bHk3NlIwT2Npc0JDSzZIOTB2NWlRWm42eVlGMEJaWDJ1ZW5GTWtPTTQwb1c4?=
 =?utf-8?B?MnYyOXhSSS9zdFUyMEVtSTUxemNxYWwyYkx5cjJlSnEza2dpUWZ0dVRYTkpH?=
 =?utf-8?B?SlZVcHc5RVZMSEZWM0pyaFFnZTloRnpoRy9Tdjg0Ukx0T0syRnlOY0hKYXdn?=
 =?utf-8?B?QlRiNGc0OFdGaW5BWTROMHhYMXlGSFYyUnl3SG0rV0ZleHZJbm5qa003emly?=
 =?utf-8?B?a3Y3SkdDMzhIanRTaHZFOGhGcFkzd3hCSmRoQWU4NXNtV1oxWld0cVd0SFlG?=
 =?utf-8?B?K0YrZHBNOW82ankxcjUybmV1WVE5ZVBvV09rdkl1amRMc0ZhZHBZaExtK08v?=
 =?utf-8?B?eTNNRzhUZmlXMUlMZW1TMzlQMFVydXljRVdhRUlVcmtwc0JVTnBIUi9idUpG?=
 =?utf-8?B?UTFJeHUvRnRxb29hdW14ZWNKWGp3Vy83c3hOcm0zZ25UbW5JcjE0cUJzS3gr?=
 =?utf-8?B?dU5iM2FXdnp0NXV2c1JlcjFaRmFDRDZLRVdtd1BGSHNtOTdMK25Zc0hVd1RS?=
 =?utf-8?B?a2h3Z1NMRDlDTVVYdmxlSk5waThQT3BINFZUbVhuY0d3MEFIV3JYc1pSbCts?=
 =?utf-8?B?M1E2UXYwVE9zZEphd3V0QUhDT0gzUjg4SHVhS3dBY3M3TmUvTjgxVWpkZnh1?=
 =?utf-8?B?WlRLcnlMYTkyYjdoM0REbEV3eWxkTzBDSEEvbEJNNUsydndPZy83R2RpQ0Mw?=
 =?utf-8?B?UEpqL2RHR1NqOEVLZlVDVDMwcEh1NmVYWUVBTXBwYk5NSmJwMU1UUExYMTN4?=
 =?utf-8?B?S1VFRjcxVlRDRlVQdElXWkZ3NWprdTUwdE1jMXBMaU5od2VyS3d5UkNmZ0Iv?=
 =?utf-8?B?VWgvaGJudVRvYTZlc0lxNHc4cmVyV1hjZVRCQ0ZIN202RFMrTnhqU01BWmpp?=
 =?utf-8?B?OEZkWThMQWxITUpuODZZbVY4Q2ppUjJJSW85VmVvZlhjN3p5V1p4Mmg2K3JQ?=
 =?utf-8?B?WUYvSFFwZjRWWi91RXVpclJFRldvL0V3VTRhNkxJaElWN2VGVVVFMkRTaWU1?=
 =?utf-8?B?WHhBL0diV2toaGdoVFNTcGw5RjNrNG9xQTVCamp3SWM5VS9hTW1wTlFRZklC?=
 =?utf-8?B?NjFiVzRIejFKNU1RNDREbmhjZ3l2bk5LUk1mZ1BRQzhHVWdHUkpWblR2ZkFY?=
 =?utf-8?B?M1o0cm14ZVRIRUR6NFd4Y1Z6SXQ0WXdHTXZySERVNFpqNXF6YUZydWpMR1V5?=
 =?utf-8?B?dU5EVk1iN01yY2pGR1ZsUG9EM01DeHFBTHFzZmNqSFZzRFkzMmwyRERjMitu?=
 =?utf-8?B?NUF0TEduWXNnRWkxOS9SSVdydzJWZk9oODRtNEc1RitrU3hWeWZqTGlmV2h4?=
 =?utf-8?B?UW91K1dUYXFpdDBFUjVvNHZvUW9ZQVIzQTZleGFLdmVpeGExcXB6bVNxcGND?=
 =?utf-8?Q?R20OivBYWTtEG0eTSQZw9HbPL8cYi5Qh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekZVUGUvRUY4RGZjR2lSaUpSM1J4VFY1UFpseXdReUhOcVdSQ0FqSkNjV2pl?=
 =?utf-8?B?NzEvNUxuL21rNnZOM29rbVhUZ2hyZ0ovL0QrdUVHdWhiZkNsNDFkY21wQ24w?=
 =?utf-8?B?dGxidEdTUklEeFkydkg3d3Fua0RTdVp2VThQYUtNN3VNTVpCZUNmcnBLVFUz?=
 =?utf-8?B?MXYremE2cmVNVW0xaElEQktxMEdxTVpPQ3M3WUZjZ0Q1MXB5dkNqT1dWUXk2?=
 =?utf-8?B?bE9GSXB5NlcvZ1VlUnNBbGJBTVZnOFl4elBybG9xOUVTWVJhdHN6VVZLUTUy?=
 =?utf-8?B?bm1xSVBVK2d4YnJFWVVGby9HZ1VhNEJSTGJNVkk3RHkzajA5bVdCOW52d2Zp?=
 =?utf-8?B?MG9jdDFmNjlJalZDcFNRS3FjTmw2K3ZBYy9PTW1QSjdqME9kOWIxMTYxbnJ1?=
 =?utf-8?B?N00yYU02VElyWVdTbmwvRDFYTFdxdUZ5Z2F2YmxWOWs5QUdaTWdxMW5tNzFS?=
 =?utf-8?B?eU9nMkF2cmFXRWNpd1Y3aEFNVDN1bDBKbTFpK2RtRUxMZ1pleUFqU2Q4ZW5L?=
 =?utf-8?B?V0MrMWVjSGlmQUpTUVU1QVJiU2xCQk01RFgwSllzM1plMlUvZ3BqZU8vYUNy?=
 =?utf-8?B?NDVIbS8vM1ArNFJPczlmZDNGM2dpbDFWVytPSE82RGRobk1xU2lwOUpxRmN1?=
 =?utf-8?B?TTBMNnFnanlDVUxHSVVQTHl3V0NvUXFPN2lzeGVCUytrTHB4UzBCZGYxclhm?=
 =?utf-8?B?T25IcjMwSHRUc2xlbXl5bkdjTHBSR2IyaXBhbnU5WlZRRlE2L0gwcElnQWtC?=
 =?utf-8?B?R3R5K0IyRjk5K2QzL0M0Y05aaFpNMDdmOVkybVkrVS9NVzFvR3NVMkZxZDRp?=
 =?utf-8?B?ZlM5TjJ2Q1J2amh6eUFiVlBHUlZqUUpJYnk3Uzl4d3hjYkxqaWtacDVyelY0?=
 =?utf-8?B?aUc4VDFBL0tiaHhzWW84clN6ekFBYlVPQkJHb1c5dWkyYkFkQmtXUjFQRFYr?=
 =?utf-8?B?ZEJhZlhNRWkzUDFiNEMxS290N3hmRzR0V3F3NEFhQ2xrcUNqTS9GSFZLZEdM?=
 =?utf-8?B?bElyNzc4dm1HZjRobjJWQ2RDUXpCZjc1QXZidENmekNFZHpUd1d3eTRCYXp3?=
 =?utf-8?B?aG02MmpGa3lURWRYSUNXY1RpNzF5S1VVWCswczNWSWFNelNYeW4xc3M2UmN5?=
 =?utf-8?B?STFjOXJXZmEwMUNQSms4RWg3TDgvRzRhMlNhTEVKV3lzaE8yWDBqeE8vb0lC?=
 =?utf-8?B?dGhsU3JlaE1tdlFNWGNzRzBTTEFKK01HUXpVNU5BUm5sY3VVeVFHeHF3NUZ0?=
 =?utf-8?B?TXZtbTdmSHVuR2tlM3MzMGdpMjJWQWFUSGZya2lZVldCNXU2RmRuMGFuSmRx?=
 =?utf-8?B?SFdGanhkbmpzclNmSldJM01zSDlHc3JWbjE3ZjA2Y2VnNHFuTExpallwQmYr?=
 =?utf-8?B?WWIrak8wQXhpRUNYVVlyYkRCZk83N3RUazVoYVYyTnRPaWlCVDF6VjhETWNE?=
 =?utf-8?B?UU5NbnlmZ08wK1RlRFFrT2tiVTl1SXcxamlIc3NmcWVBTzNZT0NYTktvM0FH?=
 =?utf-8?B?eTlwVlJWWHVNcUN3U3NOUWNvNjV1QXRLeDNzMVJrQkVhcGdCM09BQ0RHUEN1?=
 =?utf-8?B?S3hVT0M4T29qZ204SDVHb0ZWNzJ3dHFCdjVIa05FNFBFTUh2Z0wrNnJxYzJz?=
 =?utf-8?B?NHhJdUZSZFFCaTM1OUJQcVpycEl2aWtGWGFldGVaMlRPVnp4aTNYL295MnM4?=
 =?utf-8?B?Mjg2ajE4YU5ITmZxTGkwS2RudDQwS1FXVWRWWjlUVFNDRmRua3RrV1RnUmtM?=
 =?utf-8?B?TzZzRFFPdWlKcXpVZzNQZGJJRTV1ZnF6MjZEMU1lRUxEOHBpZEhIa2RCMHdl?=
 =?utf-8?B?bWhDUHd1dW90ZWFXYlBMQXJvcWY1bDUzUVFDTUxibkdCNjJROS9obSszNUxG?=
 =?utf-8?B?VUVsdHdkUXdqbk41UUZkNURwQjBJNEFYbHBvVzNqc2tka2FjeEc4NEdnTVlm?=
 =?utf-8?B?dG5OMHFwNWVuL1hHaHVaY3krSDFacEdFSFpRODJTTW9tZ0VvQStiRlhNcUFJ?=
 =?utf-8?B?Y3lhMDFqSDBRTHd2MjVNVE9oK1luaGNycUROb0NmVCtReU00NFZwSFZ0Tk13?=
 =?utf-8?B?bEkxL0s0bzVEMlRGdFlCWEo4TGx1UUlIS1dSbWpYZ0NxdnBKaHRpZGNxV3Qv?=
 =?utf-8?B?WXYyUHJEREZLcnFPSkZkN0lPdnNPMjUxNG4xeHQyQnpDeVRxV2hGZVpMeG1a?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40A2FF1127E41647860D4D4EF2374AF0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b1a69c-b1d4-4f7d-a6d1-08dd564c29ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 09:58:47.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dgVpCR2L6kYXnrv5f3qSm0RnaeILxShqbLOPPCh3/WB0gi/VuWv4hXwQ6c1s8tdJaAgYz3Om8janoftHnBIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7983

T24gMTAuMDIuMjUgMTI6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wMi4yMDI1IDEx
OjMwLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4+
IEBAIC0yMCw2ICsyMCw3IEBADQo+PiAgICNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4+ICAgI2lu
Y2x1ZGUgPHhlbi9zb2Z0aXJxLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPg0K
Pj4gKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPg0KPj4gICAjaW5jbHVkZSA8eHNtL3hzbS5oPg0KPj4g
ICANCj4+ICAgI2lmZGVmIENPTkZJR19YODYNCj4+IEBAIC03NDQsNiArNzQ1LDE4IEBAIGludCBf
X2luaXQgaW9tbXVfZ2V0X2V4dHJhX3Jlc2VydmVkX2RldmljZV9tZW1vcnkoaW9tbXVfZ3JkbV90
ICpmdW5jLA0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+PiAraW50IGlvbW11
X2FkZF9wY2lfc2lkZWJhbmRfaWRzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsg
ICAgaW50IHJldCA9IC1FT1BOT1RTVVBQOw0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1BD
SQ0KPj4gKyAgICBpZiAoIGFjcGlfZGlzYWJsZWQgKQ0KPj4gKyAgICAgICAgcmV0ID0gaW9tbXVf
YWRkX2R0X3BjaV9zaWRlYmFuZF9pZHMocGRldik7DQo+PiArI2VuZGlmDQo+PiArDQo+PiArICAg
IHJldHVybiByZXQ7DQo+PiArfQ0KPiANCj4gVGhpcyBmdW5jdGlvbiBoYXMgbm8gY2FsbGVyLCB3
aGljaCB2aW9sYXRlcyBhIE1pc3JhIHJ1bGUgaWlyYy4gQ29uc2lkZXJpbmcNCj4gYWxsIGluZm9y
bWF0aW9uIGdpdmVuIGhlcmUgaXQncyBhbHNvIHVuY2xlYXIgd2h5IGl0IHdvdWxkIGdhaW4gYSBj
YWxsZXIgb24NCj4geDg2IChhdCBsZWFzdCBhcyBsb25nIGFzIERUIGlzbid0IHVzZWQgdGhlcmUp
Lg0KPiANCj4gSmFuDQoNCldvdWxkIGl0IGJlIG9rIHRvIHdyYXAgaXQgd2l0aCBDT05GSUdfQVJN
PyBJIGFtIG5vdCBxdWl0ZSBzdXJlIGhvdyANCnJlbGV2YW50IHRoaXMgbWFwcGluZyBmdW5jdGlv
bmFsaXR5IGlzIHRvIFg4NiBpb21tdXMsIGFsdGhvdWdoIExpbnV4IGhhcyANCnNpbWlsYXIgaW1w
bGVtZW50YXRpb25zIGZvciBBQ1BJLg0KDQpBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gcmVtb3ZlIHRo
aXMgYWJzdHJhY3Rpb24gZm9yIG5vdywgdG8gY2FsbCANCmlvbW11X2FkZF9kdF9wY2lfc2lkZWJh
bmRfaWRzIGZyb20gQXJtIGRpcmVjdGx5IGFuZCBvbmx5IGludHJvZHVjZSBpdCANCmJhY2sgd2hl
biBhdCBsZWFzdCBzb21lIEFDUEkgaW1wbGVtZW50YXRpb24gaXMgZG9uZS4NCg0KQWxzbywganVz
dCB3YW50IHRvIG1lbnRpb24gdGhlIGlzc3VlIHRoYXQgZm9yY2VkIG1lIHRvIG1vdmUgdGhpcyBm
cm9tIA0KdGhlIGhlYWRlciBpbiB0aGUgZmlyc3QgcGxhY2UgaW4gY2FzZSBpdCBpcyBub3Qga25v
d24uIFRoZXJlIGlzIGEgDQpjb25mbGljdCBpbiBmaXhlZCB3aWR0aCBpbnRlZ2VycyBkZWZpbml0
aW9ucyBiZXR3ZWVuIGFjdHlwZXMuaCBhbmQgDQplZmliaW5kLmggYW5kIGl0IHdhcyByZXZlYWxl
ZCB3aGVuIGluY2x1ZGluZyBhY3BpLmggaW50byBpb21tdS5oLg0KSSBpbml0aWFsbHkgdHJpZWQg
dG8gZml4IHRoZSBzb3VyY2Ugb2YgdGhpcyBjb25mbGljdCwgYnV0IEkgZG9uJ3Qga25vdyANCmVu
b3VnaCBhYm91dCBBQ1BJIGFuZCBFRkkgcXVpcmtzIHRvIGNvbmZpZGVudGx5IGRvIGl0Lg0KDQpJ
biBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2FjcGkvYWNwaS5oOjU3LA0KICAgICAgICAg
ICAgICAgICAgZnJvbSAuL2luY2x1ZGUveGVuL2FjcGkuaDo1NywNCiAgICAgICAgICAgICAgICAg
IGZyb20gLi9pbmNsdWRlL3hlbi9pb21tdS5oOjI4LA0KICAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUveGVuL3NjaGVkLmg6MTIsDQogICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94
ODYvaW5jbHVkZS9hc20vcGFnaW5nLmg6MTcsDQogICAgICAgICAgICAgICAgICBmcm9tIC4vYXJj
aC94ODYvaW5jbHVkZS9hc20vZ3Vlc3RfYWNjZXNzLmg6MTEsDQogICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS94ZW4vZ3Vlc3RfYWNjZXNzLmg6MTAsDQogICAgICAgICAgICAgICAgICBm
cm9tIGFyY2gveDg2L2VmaS9ydW50aW1lLmM6NToNCi4vaW5jbHVkZS9hY3BpL2FjdHlwZXMuaDox
MzA6MzU6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYVUlOVDY04oCZOyANCmhhdmUg
4oCYbG9uZyBsb25nIHVuc2lnbmVkIGludOKAmQ0KICAgMTMwIHwgdHlwZWRlZiBDT01QSUxFUl9E
RVBFTkRFTlRfVUlOVDY0IFVJTlQ2NDsNCiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2VmaWJpbmQuaDoyLA0KICAgICAgICAgICAgICAgICAgZnJvbSAuL2NvbW1vbi9lZmkv
ZWZpLmg6MSwNCiAgICAgICAgICAgICAgICAgIGZyb20gYXJjaC94ODYvZWZpL3J1bnRpbWUuYzox
Og0KLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODZfNjQvZWZpYmluZC5oOjg5OjIwOiBub3RlOiBw
cmV2aW91cyANCmRlY2xhcmF0aW9uIG9mIOKAmFVJTlQ2NOKAmSB3aXRoIHR5cGUg4oCYVUlOVDY0
4oCZIHtha2Eg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJl9DQogICAgODkgfCB0eXBlZGVmIHVpbnQ2
NF90ICAgVUlOVDY0Ow0KLS0gDQpNeWt5dGE=

