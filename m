Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03C09F6935
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860527.1272547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvVm-0002nw-UZ; Wed, 18 Dec 2024 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860527.1272547; Wed, 18 Dec 2024 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvVm-0002lc-Ro; Wed, 18 Dec 2024 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 860527;
 Wed, 18 Dec 2024 14:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNvVl-0001hS-48
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:58:53 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 981106b0-bd50-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 15:58:52 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 14:58:49 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 14:58:49 +0000
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
X-Inumbo-ID: 981106b0-bd50-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYJSsrj+ohRUtKj7l4JpXSksbHOnEiytKUWfPSaR/pvHGyM8uIkFWoJMfP3HP9chR/BM6gYS6YK0NCDyjoMqocd/IkxTWtopVQZP2TnQOvLSJThYBiIFe3Nz/jQtKA42OFk+M5slBCCtEry6eAHE21LmtQeGvoQm7ioe+94bi4quh/Hk60qeCoIsp6e6im3GI/Jkr0/kFhKv7HofS2vSwWbOg8T/rMWDxgSJL/On5LK71nBlQk3fOmLy9glD77Em/MJSvtfeT9erDDF/i3xAxV9EB2YZ6PeBTxOHW3sopIpJ7N72VGhb1+AUM9RU+DOyyPpK+BEj4tcQyk9oIh/4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5nD//b0JavtJ6znmFnqrPWjCj/MU+Fht37nAkphZo4=;
 b=hukkzkvor4DIRyOC4dXuhI0FCIEdvc5i7wKpAzct76xJCAqZu9zOau/3XuoWkhdfhOL8qTjdpUt7SrlV2jRwu2vHIR1OXMlmvClvZFA9Zv0wjRhTyyaFUlBYCU0yGcfYlWkoveWkLBdCfaPgV7mVf3O47/Cl7Zr1eOECDVv7Br3cHZ4jfwhtiSv/mKjOKlYrvHGcYAaSEElItjYygoACNDO5aDnlA/EInCMhLAHoeI2PDjHJg3m6PbQMm0DKtE1z9G3im45sQ38WP9i/Pem7GvCDv+IqLO4wE25vZM4rUxw9joqdWh5clJ/W/O3O9/pwlnlVb+PJtbnThDT/Ccn2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5nD//b0JavtJ6znmFnqrPWjCj/MU+Fht37nAkphZo4=;
 b=ixukpN8mKCGECA+7xop93T+KAxCeBZ47a00KyvM0hRrLFGyocgTqtoia01W+D4DaIMTC367oO9G6qHFPpWNowDkBC0j2h+w5HwfRnzwkl9nmMwVJ0KQQknt8jPa0NhnaLsRh+C7+TRqNBM5FkrXwf9bFcx7m0iBpPsnBR84Fyt/5J6a5DpbNLpL1sKxqe19CcJxvTsXSb6eb6FWFUFU3BBP6CCRJb9WFgk5e9CM2jz6dI2rp4kmusaXqHD6pRpcQEikt0kwGOUKpIpf3wz722ioUJ8UBYgMmUrzmFivu060mj9C1/nq2JSwcZRYJV7x6NSBkUo9X1XvnqgK7tS6zUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <b8ae100a-4ee9-4351-9f60-0cd961810af2@oss.nxp.com>
Date: Wed, 18 Dec 2024 16:58:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
 <60d4ac08-c5e8-4a38-bfc9-2b73e6cf5ec7@amd.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <60d4ac08-c5e8-4a38-bfc9-2b73e6cf5ec7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: c232b71c-5441-4da1-0bb0-08dd1f747abc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmhEZkVubWw2b1VEbTNkMUxzcFZGdHFXeFRLUGk2Z3k2YlJCdFloVkk4SFlj?=
 =?utf-8?B?VnhKTTlxWVJVZEJFZWdGVXVINitIWTIxblU5RDNxZmM1c0VWUmpJS1JyRkZw?=
 =?utf-8?B?UHJKekRHQVdHQWhNelprekxnVUZDYlNsT3FzTkYxVVhDRVB0WHRTTG9HRjVp?=
 =?utf-8?B?eGpLVXZpVHFuc1ZWaTh0eWdLTzlabHptcE1LKytieWZUUU9ZVGp5YWUrZEMz?=
 =?utf-8?B?TE4zdDE2YVJua0xqVitBWlptZkpaL2lIZEltcFdIdUFZQzhkTkt2SCtQTnhp?=
 =?utf-8?B?ZktMV1hhdTJiMi9uZnFvQno3aGJ3NmhGL1JNU240TFRmeTE4MGZZWDk4UWpT?=
 =?utf-8?B?aHVRODcxVEx5T1oyT0JIc1RXQUlnMG1xclpBUlRJS2QwWllFRkt4dklGd3VJ?=
 =?utf-8?B?VzRGRjNmYktOaW1KWkgzQVprRm9PcGJ0bStDYnNIcm96WTIxUjc2ZlJxUDBY?=
 =?utf-8?B?Y1NOcG5GL1NJMFJOSGw3ZWF5YmsvMk5wdUpPRFJHWlBwR3FNOGlXL2x6MU95?=
 =?utf-8?B?ak5IOUlhSjEvYklBUDlxbmVjWGpBcUgrSVhramNHcVFtZHF6eHdCTGhvN0tD?=
 =?utf-8?B?M3BwZjlmS2pzZVVlYXhYVVBvZWtkNEkwWS83ejU0anZudG1qNXBiVHQvanZU?=
 =?utf-8?B?MUpoSXM2US9GbHhhRFdCeEFWOFpGWFRKVmtrZURmNHlra1dNSEo4RG82TFZR?=
 =?utf-8?B?ODJOcXJyZ3c4VURMM09sK1VXUW5FQklEZFI5eXZab3o5b2l3QkdmSzQ0NlhT?=
 =?utf-8?B?bHV6ZlhPVDFIci9PaDdQWE1IZ2hxOEVHellyMnBaUEFtLzhvRWc2bFAxblVQ?=
 =?utf-8?B?UVNuZzArYTdQUnpROVNEOFBSYzZXak9MQ3F1WkhTdjlwemV6SEp5aklVVE5C?=
 =?utf-8?B?Y3ZCcXNaL1BZaG5YdW9SMnpybHdVZUZ5TnQyTlk0TGQxZ1dOTTgrVUthTGFl?=
 =?utf-8?B?VG1FQUVTM1UwUnlZUm1YQnRyakF2VEZybEVFeWh6TjE4OG9xY2xzRHNpS2hK?=
 =?utf-8?B?endWUHlmTUdGZExYdE5rdlp1RFVhRHZjc2JvS1cxa1R2bUJFN3FMK3FycEFl?=
 =?utf-8?B?eG54TkFpNzZIbVJlQXJjUjg1ejlBZ3VWRXU1dUZYL1JadzhQWEg1MjdsdGxT?=
 =?utf-8?B?Q0l6TFpwQUp3VnpOYWp2SzJsMkJQWk4xTjlYN0lsL2JkTnVRRnlOSUF3dkg1?=
 =?utf-8?B?Wk5jcHAzM0JwRjFlbWR3d3Ryak96bkdSWHdYbzFraXkzYzExdk11dnpyVDU2?=
 =?utf-8?B?RGRGVWJodlBSMDNackhoTW0xOURQZER5bnhpZlNONHlPUUFtZ1ZKWTBUZHR1?=
 =?utf-8?B?cmtTVGU3S25ueHVLYkFxdGRyb3lXZmpqa3dwV3VicnNhZURrbHRPSWNHc2tW?=
 =?utf-8?B?WHBCOUhvczhDOE9oakFac1dsdXI5R2F6WjE2Si9tM2g2K2VSUFZsa0NVc1dF?=
 =?utf-8?B?N1BxU0lsNmhLbjB3Z0xlbUE0MHJJNlJJNU5OTXhqdkxhWnEvWHkvMVJ5aWVa?=
 =?utf-8?B?aEJXaUZMSjhEZTZxSmpqODFTblJybUpROC82b1BuOUpIV0Mva0h6dnAvckNh?=
 =?utf-8?B?TnlGbWhPekdQeGV1bGx3cUswWEpMYUxFbjBJZnYvL2Z4WVRXdHovN2JLS09M?=
 =?utf-8?B?U1IzZEIzWjhUc1k3VjFLVzNybXBGWDV2RHM4KzNOWC9Sam04Y2VzbWc1Q0sy?=
 =?utf-8?B?b2pTUXVZRTNiVjBsUmhKWTBYekhYSk1Ld2s4MDBXMzhrcngzVDgzbHFJbDBH?=
 =?utf-8?B?YUJSYnBKMHFlOTBGZWZ0RGJ0L1FSNjQrNXJQOEdTV0phd2lzNjBFV3U4WkI1?=
 =?utf-8?B?MFJqZTQ1VzhjcjRPT2dYWlZoZ2JFOVl5K1k1TnhKNXFmTWZvWEVoeGFMcktT?=
 =?utf-8?Q?Kjs5ejJcD0c+s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STZhaTB3MVhDVnBES21JVUJaakhoVTdVQm9rTHZhUHhsVGk2WG5xSlNNT0Nr?=
 =?utf-8?B?b3MyMTd2cHNtZUhQT0ZIZDZYbWxoWUExRVRyTUtXVFI0MEhJbU54b1RhRWNz?=
 =?utf-8?B?cXJ2WEExTHFzZTg5OGFjZTVwZUk0UmpSeVplUGdWWWNYTndFNHhGbTdkQlh2?=
 =?utf-8?B?am9FRFZOSzlFTnptNjFtVzAvUi9qdzJvODRobnBEcDlKRGJ5cHZvNnp0TEdu?=
 =?utf-8?B?dnFHVm1sQWN1NUdnMFBWblNDeEhxTnVBZjdLTUhaK3ZQVjRTaGVjSnRXZjR5?=
 =?utf-8?B?QW96ayszclptWjZVOW1CU1RqWXI0Q1Aydmd0MmY0cHJLUUNEV2xpaGs5RHVr?=
 =?utf-8?B?dlEyekZrUHo4bXdWZ091cmUrVnFtRHBBbnE4eDB2T0FiYTBZeGFaWTJoWGJl?=
 =?utf-8?B?eTZQeXA1OHhwT0Z0Wkc3MkdvckdvS1hqelp0WEpsck8zRm4zOTJrK3ZneXhp?=
 =?utf-8?B?QmdDdXA3UWgxNGIwVlNjSHNNYWVGRFpZSUpCRlV5NGJ1eXJtQmV4SElwNnMr?=
 =?utf-8?B?eWNkaWM5U2lMZDNOZExUbnJQRVhEUGg0c3V0Snd5bnZ5d3E3cGRNL3dFdUox?=
 =?utf-8?B?czRoZGJuSEkxdWdWVmsyWVNXdUFhOXlTc1QrdXNxOHBkaXZUdDhEbEtNYXR6?=
 =?utf-8?B?ZFBaUzZMWjZJdTJUK2ZyR2RRL1dkVEtnN3NNRGIxSFdrVkQwVFFvVHB6MDJC?=
 =?utf-8?B?dUh5VndkWjBJTTQrLzZWejNxWXNaTHpWcEhuRjQ2L2tKVFltaGoreVhhbWFX?=
 =?utf-8?B?Q2FwQjNZL3UvWFIvYUk5d3MyUDltK3M0VTU4eXRQS3N1aWozSU9kMUZDaWRm?=
 =?utf-8?B?K1NlMkNZUkpMbml0aGFuZzJLNWpNajhpd1RJT3VOcVJxOTFkbFY0Qkl2VHoz?=
 =?utf-8?B?bWNmRHE1ZllyYVAyK24wYzFQZXpiZGNsclliS1A0dW5kQkJ6YzBTRndJQzFH?=
 =?utf-8?B?Q2FTK0FJTEo3dFZPV1A2RHd5VG9vdk9EQUZ2ZTRMZjBjQm5XbVhSUkM5Z1Zk?=
 =?utf-8?B?OExiSHdHNHFmRlhOSHVXa3lBby9qVFYyQm91SlhDbUtLSkJIeTJncFBVM3ZY?=
 =?utf-8?B?Z0JWb2dROXIvRUpOTDJ5My8vN0V2dkNOSnoyaGEvMGUwejQ1Wjh6VlErZmNu?=
 =?utf-8?B?cEw1bjFZY3N4UWdjRVBMQjkva3lhN2IvUmpVRlBYYkRJcmRQWXdvRVVOUGRh?=
 =?utf-8?B?NlBmVm9pWVVvcGJBSGJGN3B2OWdQZysrUnJkYVNDNk0wdTA2L1ZpdGY4NnA1?=
 =?utf-8?B?UlZKU3dBN3U3emlVQ3Rha09rM2NNSFJ0aXU3Z0h5eWphTXNEdFdXNTdxSmVR?=
 =?utf-8?B?aTRNK0g5UjVqTXhsYjZYOTRUcUFTWXF2SzhPdWpDQmFSMzdrRWVIdE5WWFhn?=
 =?utf-8?B?N3FtckdORzdTWlhyTk1oazI1ZU84WGhxVG1oeTFHU2hZYXFNWVdjNkxQcENY?=
 =?utf-8?B?S2VEOGRwa1lNYTkrRkxsZmhDQmlkR05INW4yWjhGM05GUDR2VEIvVit1Ujl0?=
 =?utf-8?B?TkJoT1RScXF0YVc1Q21tUC9zSWtnRzlTYVRUVExQcm5nR1pLRlgybDF6VzdF?=
 =?utf-8?B?eUhOY29la0h2ekhiVVI2VTBPSUlWSzRuNVJQczlCL0VxTCtkZk5nUmpKZ0tm?=
 =?utf-8?B?SFpKVXNqTVVkWm5rVmJlMThMcnVSYS8rd0pZMU9ma2RyUTdYdUVtQUFoZ296?=
 =?utf-8?B?UEhqNkpvZmxSSzhkaDBMMU9iK1lwRkV0VVVmQXBPd3NsbG8vTmdVcjlmbUg3?=
 =?utf-8?B?cVRKMWk2TmxCdkREQ0d4dTVaeVZaRVFpNk4wbnZtU0tlMlJGdm04TGhSZkEw?=
 =?utf-8?B?T01CK1RzRVlraGdzZS9kZmUzYXBCekE5TTNmWnFSNWs1OE94TTB1U2g0YTkv?=
 =?utf-8?B?STRlNUZ4dWgvRHpoY0x1OVIweUh4UmE2NmJsM2V1akp5aHk0RkxSY3Y3dEpV?=
 =?utf-8?B?Yzk4bkdUSVRpNy9BcVdIUUVpaHlDUmR4SEhwa1RDem9NdnM4ZHVWdTJFRVFK?=
 =?utf-8?B?a3lXMit3Qi9BZFNzSW9BRngyUFpnM0l0MzFlbWRiTk02UHBYNGtSUlI4UjZG?=
 =?utf-8?B?Rkhrd3BzSE1hRGl0RVcxTVMwcVEvSW9mbjMzbGMrTytZL0h4a25ESC9JT1B5?=
 =?utf-8?B?eW5DTUxNQzZMWUhIVjRMeWkwdVJNZU8vQUIxZWRscmh2WW8yN1hTcER6THdP?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c232b71c-5441-4da1-0bb0-08dd1f747abc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:58:49.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNA40Eq+vXiJL1Hu8PukRXtWKXSWPcLBJqV/CmQwe4kWoBbPL0ihaac8F2pNfkiJiZbworYJIetIKQ/8OUCyUhRo4RAAoNT3bOVY8TPuWg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811

Hi Michal,

Thank you for the review.

On 18/12/2024 16:26, Michal Orzel wrote:
>
> On 18/12/2024 11:11, Andrei Cherechesu (OSS) wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Introduce the SCMI-SMC layer to have some basic degree of
>> awareness about SCMI calls that are based on the ARM System
>> Control and Management Interface (SCMI) specification (DEN0056E).
>>
>> The SCMI specification includes various protocols for managing
>> system-level resources, such as: clocks, pins, reset, system power,
>> power domains, performance domains, etc. The clients are named
>> "SCMI agents" and the server is named "SCMI platform".
>>
>> Only support the shared-memory based transport with SMCs as
>> the doorbell mechanism for notifying the platform. Also, this
>> implementation only handles the "arm,scmi-smc" compatible,
>> requiring the following properties:
>>         - "arm,smc-id" (unique SMC ID)
>>         - "shmem" (one or more phandles pointing to shmem zones
>>         for each channel)
>>
>> The initialization is done as initcall, since we need
>> SMCs, and PSCI should already probe EL3 FW for SMCCC support.
>> If no "arm,scmi-smc" compatible node is found in the host
>> DT, the initialization fails silently, as it's not mandatory.
>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>> are not validated, as the SMC calls are only passed through
>> to EL3 FW if coming from the hardware domain.
>>
>> Create a new 'firmware' folder to keep the SCMI code separate
>> from the generic ARM code.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>  xen/arch/arm/Kconfig                         |   2 +
>>  xen/arch/arm/Makefile                        |   1 +
>>  xen/arch/arm/firmware/Kconfig                |  13 ++
>>  xen/arch/arm/firmware/Makefile               |   1 +
>>  xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
>>  xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
>>  6 files changed, 229 insertions(+)
>>  create mode 100644 xen/arch/arm/firmware/Kconfig
>>  create mode 100644 xen/arch/arm/firmware/Makefile
>>  create mode 100644 xen/arch/arm/firmware/scmi-smc.c
>>  create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 604aba4996..23dc7162a7 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -271,6 +271,8 @@ config PARTIAL_EMULATION
>>           not been emulated to their complete functionality. Enabling this might
>>           result in unwanted/non-spec compliant behavior.
>>
>> +source "arch/arm/firmware/Kconfig"
>> +
>>  endmenu
>>
>>  menu "ARM errata workaround via the alternative framework"
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index e4ad1ce851..8c696c2011 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
>>  ifneq ($(CONFIG_NO_PLAT),y)
>>  obj-y += platforms/
>>  endif
>> +obj-y += firmware/
>>  obj-$(CONFIG_TEE) += tee/
>>  obj-$(CONFIG_HAS_VPCI) += vpci.o
>>
>> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
>> new file mode 100644
>> index 0000000000..817da745fd
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/Kconfig
>> @@ -0,0 +1,13 @@
>> +menu "Firmware Drivers"
>> +
>> +config SCMI_SMC
>> +       bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
>> +       default y
>> +       help
>> +         This option enables basic awareness for SCMI calls using SMC as
>> +         doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>> +         compatible only). The value of "arm,smc-id" DT property from SCMI
>> +         firmware node is used to trap and forward corresponding SCMI SMCs
>> +         to firmware running at EL3, for calls coming from the hardware domain.
>> +
>> +endmenu
>> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
>> new file mode 100644
>> index 0000000000..a5e4542666
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
>> new file mode 100644
>> index 0000000000..62657308d6
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/scmi-smc.c
>> @@ -0,0 +1,166 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/firmware/scmi-smc.c
>> + *
>> + * ARM System Control and Management Interface (SCMI) over SMC
>> + * Generic handling layer
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/smccc.h>
>> +#include <asm/firmware/scmi-smc.h>
>> +
>> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
>> +
>> +static bool __ro_after_init scmi_support;
> I don't understand the need for this variable. IMO it's useless, given that in next patch you do:
>
> ...
> if ( scmi_is_enabled() )
>     return scmi_handle_smc(regs);
>
> return false;
>
> which could simply be changed to:
> ...
> return scmi_handle_smc(regs);
>
> and the variable, functions for it, etc. could be removed which would simplify the code.
>
> [...]

Well, I agree that the code would maybe be simpler, but
that means we would call `scmi_handle_smc()` both when
SCMI-SMC layer is initialized and when it is not.

That then means that if `scmi_handle_smc()` returns false,
we won't know in the caller if the SCMI-SMC layer is not
initialized at all or if it is initialized, but the SMC
request is invalid (it does not have the SMC ID we expect).
Do we need to, though?

But even if we're not exporting the internal status of the
SCMI layer (enabled/disabled), the driver itself needs to
have an internal state to to know if it's been correctly
initialized or not, right? Otherwise, how would we know
internally if we can actually handle a SCMI request or not?

Well, we could manage to base this mechanism entirely on the
`scmi_smc_id` variable (i.e., if `scmi_smc_id` is not 0,
then we know the SCMI-SMC layer is initialized). This could
work as long as this handler is not called in a situation
where the ID of the SMC we're trapping could actually be 0.
And it currently would be not, since FID == 0 is reserved
for Arm Architecture SMCs.

So, I agree that it makes the code simpler in some sense,
but it will add some underlying assumptions and make it
less explicit.

I'm happy to implement your suggested changes. But I need to
know that I understood correctly your comments and that you
agree with the implications I've stated above.

>
>> +err:
> CODING_STYLE: this should be indented with one space.

Will fix.

>
> ~Michal
>

Regards,
Andrei Cherechesu


