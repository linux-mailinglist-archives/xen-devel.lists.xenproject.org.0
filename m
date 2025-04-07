Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17041A7E2CF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940313.1340127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nvM-0000DG-0N; Mon, 07 Apr 2025 14:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940313.1340127; Mon, 07 Apr 2025 14:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nvL-0000Ab-Sw; Mon, 07 Apr 2025 14:58:07 +0000
Received: by outflank-mailman (input) for mailman id 940313;
 Mon, 07 Apr 2025 14:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsCM=WZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u1nvK-0008Ny-2H
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:58:06 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2407::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ff64f0-13c0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 16:58:04 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 14:58:01 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 14:58:01 +0000
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
X-Inumbo-ID: b4ff64f0-13c0-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya1OmtalvuIwf4c0owxMeGvyUCeBIlGC21dDcynNOd+yQzNd7inwXfDL5Xj+s0D/65XQ2sZywzeUCbX2sFbI976BdvlGSouOQlMMTNffZ3r7uNnzU2yc5LX1NG16CaPIyj/DDNkBXWnAdNtWBXIbck6Q+41AhkxuYaJi4LlqmL/zQoOlnrQ/84Mdc9LZopXzeUVm8gK74RhkJ7ZA/eZCeDViGes+8ZrcdtnSlLIkB17HD6LQ45Y+T2CUWnpEVmNX7yYWE7TqOIs8ToYgGRy10H0ywzmGhKk8hCwzkK7ydNlV4xIQJfYQQ7AFxn3jBXjRfDsrjUDTvQfovzlcanzRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4aXYCeeQknm9tA3vPcoBrrNJZdlm3b6pdKwtQvRgWE=;
 b=GaZBt0/nvuyTiNgfVR8CFrJrQYZcWrPvtrd238mbGMoU7ORgxO25fxtFC/kbOfyaT0sxS2aURQIYi4UxfqTnR6jsDOhnFZ99zsOIIuGvZ6JkW4QlBmueLVPawz9pEwdBaT4Fx6azGyL6h7p84uvGF+uaGPHd+6jnVBojV7yIEiIXnrqo7W/ea5vAadUkucOorcG942SOjx48l0zxJJGMgLNWkGB8MZC8aiSJs0YTAVBZxZfA5vyizND3w82uAXxwTgAKbWUc/wJZiv30gNf/+XzFCK9ozS1ViS1ykkfFCrwiGSpdV2kVURvubBicZ9KLKf2WrxVJSy8yKSPrBUOeAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4aXYCeeQknm9tA3vPcoBrrNJZdlm3b6pdKwtQvRgWE=;
 b=KuBahIRWhsJdj3zuT0M7LN1PPdkNj4JTGVW6QkqDf1329rKQHk18DGF5qgOAr/pFGLc6Nr5b2Mj6svNv6Pj2auYWdKzXfM9jHRlJYf6zdtsj8opj9hMWSMrRmjihyMHUkmAPhkmINJgrL/59qCrsKecj0aFUrTrbm6qht7MwWk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ca831d83-2795-4cfc-a43f-9cf8533169c9@amd.com>
Date: Mon, 7 Apr 2025 16:57:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <C6C24096-2BCC-4D09-A20E-AAB1FA923A18@arm.com>
 <a99913ea-b425-4c24-8d32-f4e2e3ab3edb@amd.com>
 <E7EF892D-8212-485F-980A-F0D213456707@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <E7EF892D-8212-485F-980A-F0D213456707@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: ac69e90b-f89d-4dcf-eb80-08dd75e497b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K09xK2d2S2E1blpHV1o3bDA3L1pMbXJFL3NraXdHYVN5cWlOckpZNWdnVElZ?=
 =?utf-8?B?Si92OStVdlFjYko2RTQ2Y3IyZmd3YmFOL3dyVEFDT29OUENkY3RHYVhJTVhK?=
 =?utf-8?B?T2Q0L0gwSTVWdnBONFI1aEorT25LbFMwa1NuRGRZOGQrY01qa1kzOXNYYWpW?=
 =?utf-8?B?b1JTUlBYL2l2QzhPK2RaSXJ6L1Z1YjhabmE0UG1YSGRTZG5PZzhmVUlVN1lE?=
 =?utf-8?B?cSt0OWJudHgyWHpwNmRaMFV4K2RLclBBUkJXaGJZZElqL28xVllWcjd0eEZ6?=
 =?utf-8?B?WGR5dllXTDR0dkp3Y0c5SElxZkJVRERvcnBDc0NWWVhKSi9MZEFDRWtCUzFQ?=
 =?utf-8?B?Si94d3ZZelFZV0tHQ3BqWWZicndrSjRoY3hOOTZicEZZSlNlSnVhRHlOaTJD?=
 =?utf-8?B?T2RSZmtUaUdpZ0Z2NUo2bVpvampSQmwxdzkrb0JVaHk1dnBnZ1JGZGFIYlh4?=
 =?utf-8?B?L244eGExTit5L0xSZVZ2VkNJSnNQUlJtUHBIblpwb2h6MGdxQm9BYzRHN2tp?=
 =?utf-8?B?QnFEdG1xS2RHbTNZU21jU3RHN1M1bXdzN2UwRnUreXBUSDhxWlNqVHdpN1BP?=
 =?utf-8?B?UnVLOFJCUW1rNVpRdk55NWViZ0h3WUFJWFZMTi9UbjAxOGtkY04wbW1ZaEti?=
 =?utf-8?B?Tk82K0JqcTJkRmg4RTFqNXZBYWZuWGNMWmtVaGpucmRCekhKTmcwOHR3R2I4?=
 =?utf-8?B?ckpsaXJQRWg1M2ZoSGdzNFdCOHM5V3JmMEc2ZTlmVE1IUlFrWG11QmVzMUxt?=
 =?utf-8?B?ckZMYXp0MWlFUFdzRWJqdit0MEJFcXRFUXduSGVhTXg0bzJzdUs5M010TU96?=
 =?utf-8?B?RlZMZHZiZGhkUE9JeldHZkU4Z2lJU2YrK2FJU2Z0Z3lMc3dGYXRTejBLdEh2?=
 =?utf-8?B?OHMzT09nT1ZQOEF0b1AzS2ptZ2tpTXRBQ3JpbTJpcnpqbDV3dlRGaldNQlBZ?=
 =?utf-8?B?cDl2OU01d09TQnp0YjRSNzlzK092UnRHdG9kWkw0Qi9VaGZSL2JKbXJsNmtX?=
 =?utf-8?B?RWRJTnJ3bTFQRDVxVzNQMzB3bVJ5N2NWSmpXckpmTExTTksyU3l6dnJGbFh3?=
 =?utf-8?B?QmxpejlLTE83VjB4TE1YZ1NXajZ4ZEZ6YUFIY2sxL3c5YjcwUk1qSUlFMVJh?=
 =?utf-8?B?WkxWcUo2Z0tlZ3FHamJheGp3QU1YZ2RCS01KclBEU1RjZCtHY09DRHFjQk9Z?=
 =?utf-8?B?N3AyQ2k2YTdOZlQzc3htL0xDdVErRy9ibDNKcG54aE94SUlLMHFyaDBwbGgv?=
 =?utf-8?B?bjdtV0xIS3pZWFhLUGFBcEpXRTA5cUJ0bW85bTZJS0lJT1lkc1NBSXlVU3FN?=
 =?utf-8?B?aldGQkZ6UjcwYWlXTTVqMkthNG9wMmtoWW51MVJNdThRa1RVRndSS1l2UDZm?=
 =?utf-8?B?WDV5M09CVTlNd3RBUDNIMEZzMUlWRkdqZUZpSWJ3eWFzK0piL1hwR0xTVFFr?=
 =?utf-8?B?cEdBUDVYSklxSXIwajRtbSthUCtxV1RoVGV0S0JyWjJEMEZnMm1Vdnhqd3VJ?=
 =?utf-8?B?WkgzbDAraU80a0ExWWVKSlV5RlQ2SlNkbmE4TzlyVTQyU2ltcUo2MjY4Tm5P?=
 =?utf-8?B?WVA2YUNMYis2bHVJOHlUdlRCWlR4VnM2T0RRTVhUcXNOU1FEeWR0YUNHSit4?=
 =?utf-8?B?NWJrZUxoVHdCQ1kxaHJURW53aTd2NVBlaXZETjRpRGxiU1NxSGcvaFBMTzhY?=
 =?utf-8?B?SDQ5WmdhZ24yRDg4K0Z3V0RJMk9BaFZrVW5nSXJONWQxSWpvTzFUaTJFTVN2?=
 =?utf-8?B?d3prSUI2eFNuemE1UEFIb3p3dTBzazZZZTEzK3RtQmE4Z2lkT1BOQnpVUExP?=
 =?utf-8?B?TTRCSmJHKzBqMm9kaDNDZk15NkhUS0VuTmNnOHVPazVnQkFQUUhTYUM2K1ZR?=
 =?utf-8?Q?upsJ217T84WAi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDR0SjdQUGRpL09FNHJSNHpWTG94aWRlcEs5elF2ekpkMkpuNWhSbm1CdU45?=
 =?utf-8?B?TmtMcDZjRGJHTUZmekMrR1lxd1N3WG50SWpjc3NpeXVtdWZHV0tWYkFGUC9U?=
 =?utf-8?B?LzlOTUYwMVp6eU9rTjFUcFhaNDJQaU5iZUUxK2NzN0RvNnFnQWN2aHEwclc0?=
 =?utf-8?B?ZEI2TXJONDVpa3Bva2dRY0JWNG5VMEhRZ3ZVSFFtZGVJLzdLWHVYNm8zdDdI?=
 =?utf-8?B?anFNZ05aQUNLV1B5dnRMRW91Yk9TTXhhT2ZxazByUnRYY3RaL1FQbkpaZ0JV?=
 =?utf-8?B?MGF5M0t0NVJUb2w4ZmlhNmRsZ05OSTE5MDNUSCs2MDRRZGQ0T0hmR0NnU2ly?=
 =?utf-8?B?UnlzMzRtN2J2clhyak5VdmhWM1EwWjZPYUhkZm5oL1FlYVAybW8vSHlBRWk4?=
 =?utf-8?B?M1RYaXhxZEVSZ2tIWVA1LzVwRXNSNTFmSU5NbmFheEgwczhmMjNFRWszZ01D?=
 =?utf-8?B?dXdocC9LRE4rSXJPTGxsN2RzdUVNVTE2SmZFQjc5QldKeDFjU055VkFpTThD?=
 =?utf-8?B?ci9XaWl2M1Zheno2UmRZSytCd09IRUs2c0dUVG45NG91ZHNqV2FQMkladDBL?=
 =?utf-8?B?amtnWVppcjlRRzJVaHBISCtSckxFRFNRZzdHVlYrVWU0a0ZXVDZab1BkaUtO?=
 =?utf-8?B?Ym1vVlJIbzVwM2NCYVU4Um1tQ0Vla2d3bUJpRXltaWNRRWlRckhvdEE5WUFm?=
 =?utf-8?B?a3RxUGhqcnd3N3RGSzlaeENaRDl0MSs1RHNiOGJmbUhMWVJrVC9CNk9aN2Y3?=
 =?utf-8?B?VXBpdE9MLzE1N2VBTW4rdlNkb0VKQzNLbTBmZUdoZDg2WWxDY2JCSjF1VnRT?=
 =?utf-8?B?UTNOU1NlRE9BKzJhNnd6d2pHSklPSlVvT0VDcWpRVlA1djRHdCthaHBlM2xY?=
 =?utf-8?B?QmsxYm5QQS8xbGlCditMUmJsWHJBdklaK1gyQTZWckhUaklIeE1lUnJEQXhE?=
 =?utf-8?B?dHdyZ3YxTEE2QlhCc0szMThJeDIybjRaYmt4cHIxY09ic2szU1FjQ3Fud2lY?=
 =?utf-8?B?d01KTmhNcVNOMlkrRjNQZmVGRmNXcnQ5UFBZVGloeTZnS1MzdzRXdmJ6RlFU?=
 =?utf-8?B?R3FIdUJuTjl1TmdXNWhSTitIRXZhdGdmU1FzSnk5aDBsZnRjaVlzWmV3VFJn?=
 =?utf-8?B?TnZMR1UwODhZenB3RTdGVVZxaVVxeEsvRjk4eXRjRVk2eUUyV0xwNXcxUVVB?=
 =?utf-8?B?ak9lV1NuVHMrUEFjMjdIQkl3ZjJ3aUZsUHNjeVRSVVBVVUxaUWdmOHZTT0Vp?=
 =?utf-8?B?eDBQaXM0WEd3emcxWW42WG04M1RkZkRxUERHRGZ5TXBhdDJXZ21ON2ZUYjRV?=
 =?utf-8?B?bFRUTWtuajNaV2Y4WUJ2Skc0T3BiUlV5VnpuVHlhajZSc01EOGY5Y09nVFF5?=
 =?utf-8?B?eE1COEVZWVdjdi9kemNyZGRQRUVYMjN3cE5LbytjMi8vZUFjUVBnWVJLMTRI?=
 =?utf-8?B?SHZMZTJ3T3RBeEEvQnJvc3NrUjZaS0tsTVFPYndBdHB5K1R0aC9DcmJaT09D?=
 =?utf-8?B?YnMwT0NPUUhSY3Jhd245OXhzM2dpMklHVVpHZUFmUkFTanA4MEkrbWZsRjlm?=
 =?utf-8?B?M2NFbjNNNGdBcFU4UDEydFE3MVUxc3NtMHhBdGpxYlcyM2M3Vm9Pc0doRURT?=
 =?utf-8?B?VVF2eE95WlllelMrTVIrMEZoOWE3OUI2Y2J4a3pRUUxRUGQ1SmZZQmE1N0JX?=
 =?utf-8?B?NDNLVHI2ZEdFK3hEeEpqUlJDVnp0M3dOczNjS012bzdHWE9Ka0h1TWJWcU82?=
 =?utf-8?B?d1dIZkJZOUxQdUw5SnhaRmxUQUczdFk1N1dVbkhZSndEU29ONm1ZdWxveDho?=
 =?utf-8?B?MHVkMEJSQnIzKzJNYVhrdkVCNjlWMEtQdkIraXhKU0RMd2MyTDVSTUdGcmhO?=
 =?utf-8?B?ZmVUS1B1VlA1eHJjZFBYUTJycHdSQ3Z4S3AreXVlaDRML3M3cVhYUjFhMkZr?=
 =?utf-8?B?c0ZzZ1U3N2ZpWUZjMkxaeWdmRzFibGRMR3M4T0tPUUYrZFc2NUZ5MS9CbUJJ?=
 =?utf-8?B?R0JSNUZEVmZWZFpZTUFsVXdHUm1xb1Awemx2UnpvdlNSWklRanhqNWVJYlhw?=
 =?utf-8?B?K3lkaG1CcytueHZaMmZvZ0gwWncvTGU5eEpadTc1TC9ETE5WaXNNaG5hbHNi?=
 =?utf-8?Q?IMykjCbuI4GbrKWOS9pjRDYHi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac69e90b-f89d-4dcf-eb80-08dd75e497b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:58:01.8243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+uexLYI3kCXX4mRiEQI+ybD3EesqzOSxOqttWDFQplgMtk63kPXHuJWhI7YwGfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D



On 07/04/2025 16:34, Luca Fancellu wrote:
> 
> 
> Hi Ayan,
> 
> 
>> On 7 Apr 2025, at 15:29, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 04/04/2025 10:06, Luca Fancellu wrote:
>>> Hi Ayan,
>>>
>>>> On 3 Apr 2025, at 18:12, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>>
>>>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>>>> configurations across arm64 and arm32.
>>>>
>>>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>>>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>>>
>>>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
>>>> SMP is currently not supported for MPU.
>>>>
>>>> *_PRBAR are moved to arm64/sysregs.h.
>>>> *_PRLAR are moved to prepare_xen_region.inc as they are common between arm32
>>>> and arm64.
>>>>
>>>> Introduce WRITE_SYSREG_ASM to write to the system registers from the common asm
>>>> file.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>> The split for the common code seems ok to me, but this patch is introducing an issue for the arm64 compilation,
>> Sorry, I moved something at the last moment without testing. :(
>>> I’ve done an experiment and with these changes I’m able to compile both, but feel free to ignore if it’s no what you
>>> had in mind.
>> The change looks good. However, ...
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> index 22871999afb3..a90d1610a155 100644
>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> @@ -20,6 +20,13 @@
>>>   * uses r0 as a placeholder register. */
>>>  #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>>  +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>>> +
>>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
>>> +
>>>  #ifndef __ASSEMBLY__
>>>    /* C wrappers */
>>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>>> index 6019a2cbdd89..b909adc102a5 100644
>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>> @@ -1,10 +1,6 @@
>>>  #ifndef __ASM_ARM_CPREGS_H
>>>  #define __ASM_ARM_CPREGS_H
>>>  -#ifdef CONFIG_MPU
>>> -#include <asm/mpu/cpregs.h>
>>> -#endif
>>> -
>>>  /*
>>>   * AArch32 Co-processor registers.
>>>   *
>>> @@ -502,6 +498,12 @@
>>>  #define MVFR0_EL1               MVFR0
>>>  #define MVFR1_EL1               MVFR1
>>>  #define MVFR2_EL1               MVFR2
>>> +#define HMPUIR                  p15,4,c0,c0,4
>>> +#define HPRSELR                 p15,4,c6,c2,1
>>> +#define PRBAR_EL2               p15,4,c6,c3,0
>>> +#define PRLAR_EL2               p15,4,c6,c8,1
>>> +#define MPUIR_EL2               HMPUIR
>>> +#define PRSELR_EL2              HPRSELR
>>
>> Considering that there will be lots of arm32 MPU specific registers, do you want to move them to mpu/cpregs.h ?
>>
>> That would be my style preference.
> 
> I don’t have any strong opinion so it’s fine if you want them in cpregs.h.
If there are really a lot of new additions and the movement improves
readability, I'm ok with them being stored in mpu/cpregs.h

~Michal


