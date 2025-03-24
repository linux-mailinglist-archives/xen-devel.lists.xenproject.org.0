Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDCA6D6A7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 09:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925089.1327961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdaI-00042y-B8; Mon, 24 Mar 2025 08:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925089.1327961; Mon, 24 Mar 2025 08:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdaI-00040k-89; Mon, 24 Mar 2025 08:55:02 +0000
Received: by outflank-mailman (input) for mailman id 925089;
 Mon, 24 Mar 2025 08:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t537=WL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1twdaG-00040e-Eq
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 08:55:00 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:2408::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8df699c-088d-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 09:54:57 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 08:54:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 08:54:54 +0000
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
X-Inumbo-ID: a8df699c-088d-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZQMVvDMaDT2qP8yuP/YTde01p00tlLAtLsXs8FKpFwlbDPUoA5nrwBdplC3XC0s89p3FXw4NhoP4iQ1PR1AseD3MulAwUi4zHep42AjTMkdW+tXa2R5aW91dJQhfpH1rSyY9B8KvvMw2bCDtx7eiG69Zrypye5Qps98gP5nrhkKXCdYQfDu9mg4dXsUjE41Om/gSLYT5cjY30gE4wa8Ljz0z+0bBoz0sMjR1rOR48MjT+p3VLPqpwsXQsyRZs676vEoNlQ2ZwOD1Aa3hRTQc/A7GepLvL9B8TYI1nzQkFHFlRZ2WAcPFWW9CL6/uMGfZaLULHPtiidjD/VZOEL7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeYnyl5HoKJCGH0AX66P9UbGs4UBU43/q7iCBbJmfMI=;
 b=vHRVUEKdB7WgKp1O5yoxPZZu5exM3Wdc/8adAexe3zOs6hmS91xcDpwbjWK6cAO668UZkL9gbXBvjV4Dszgc1rY4KwiNooB5d8+iviQ59Z2VX2ICoNW0L+oJqo5de9AceSTEQgEUxcw+qNdz1SOr4igvjhJBGBbIY8SIIYPKogWv0C5oHiLvJlDuAm1/ll3N7niQuYc1f3CopKrv+c1fNO0CcureVQ/eqL1CUxvzqfFwX7mtAkOHxDoo/fCwUfeqY6P8gzHmGUiQycpazwtf6hsh9DR+wDbDJg6GEV2TyM4MFJheaN3bmA47EdDA8dxalBTH1F866hHlGZnw2Np/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeYnyl5HoKJCGH0AX66P9UbGs4UBU43/q7iCBbJmfMI=;
 b=yKWlBAzdwL5S1iJO1Hcz+Eqz+VsPvTuC5j0MoSIRyuj1tCbJbmKyn0ILN+1jZha21l1KUjYT4kX5eCSdjRc+dCRzQ2WmODc9EYG+skt0y/rvSm35M1noQFl8p85OBS5Z8yJ0eHbh4r7PJFOEMu2duo7UZGzTcQxs6KykD36c3Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <231ac68b-d5ba-41a5-944e-4c644d527d07@amd.com>
Date: Mon, 24 Mar 2025 09:54:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <Z9xGbTYJG6s6Wvl0@l14>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <Z9xGbTYJG6s6Wvl0@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0294.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 1626f787-8ba5-4753-13ef-08dd6ab18b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUQySzZaWWtLaDBWN0tHamZVNUU3R3dlbjJWRk4xNWdZK1R1ZEdiaGl6Z0xz?=
 =?utf-8?B?dllramR0djUzRVZ6dlJ0ZFdabXp0ZFRJMDZwS0trOHNJYm5FUHNhc2Z2S2lH?=
 =?utf-8?B?YTQvVnZJSjdNL284eS80LzRxL3FSd3huRVdlNS9JWUpQbENFMkJEdnhBbDdT?=
 =?utf-8?B?SXdtbnlUcFpRaCtvMVNGS0NyWUNkcjZIU1IxbFVGZUdJY0pwVWE1dmhTRnJm?=
 =?utf-8?B?SXAzWVhjYmhjNWlNUmFFdzFZOHJ1bm9FOUNSaGZTVTNObmdQNm16cVFPeTRG?=
 =?utf-8?B?clVGZUtpOTBsd0lQanhyU1ZMU043dmdZRzUwNFpQbjlDS2RnaDlzN21OZEJq?=
 =?utf-8?B?L0V1QkN4UFZyaElaWStFeldTRTcwclhxM0d6Z3pFSloyRjBwdjBvNUVNZTU3?=
 =?utf-8?B?WUU1RzFrY3lWbHhLMFF0bGhEMUNHKzZtL3RhZkxwWThCVDZVNkp4a2s1UG9I?=
 =?utf-8?B?blMwd1ltM200QWpqcmRPQVU5V3EraWlMUzhHUXl5TzdGbjlDcE83ZjVuOTZI?=
 =?utf-8?B?VEsyNkxpT0E2VURPVHZ3b21RU2FCWGpIZWdMc08vMFBsUlUrVVh5aU9IZUxP?=
 =?utf-8?B?MGo4dmdMUDVtTXNXTnhrUVBNTDUvMjhIM0JVMjRocHBlQktsbGxOeExFTkFH?=
 =?utf-8?B?Uk13bkU2bThFUWVWNitFd01WTm1Ccy94QTczdUdIcDNuOExQWDNDbkdQeTFC?=
 =?utf-8?B?Vlc5V0N1UHc3ckdPbmRFNjJVWnh6V3JjLzRnKy9nYW81c3ExOEZaT1c1U0E4?=
 =?utf-8?B?OWwzMlM4cCtjclg5MlJsc2EwVHV3YVVzb3UxREdBZ2dGZFNibkpOQ0VicFky?=
 =?utf-8?B?N1ZhZzB1dnIwaXMwR2tTcjB0N0w5T2htL04yVHZEZFV5N1A1N1labzRvKzBR?=
 =?utf-8?B?Mmc5aTlTaE4wRFNYdjQrR3pQNm1ZNUJnN2tEVzBoV3FqdFNXOXJKczFoVEpa?=
 =?utf-8?B?bnphZFpVYm5jZWZ6aXFTd29Ud0lHazV0OE5wWlZlMUxxVFo0eHc5Y3Z1KzR3?=
 =?utf-8?B?Y05lTmRFNCtWMXY5b3M2ZjAzMHh2Q2ZVbUpUdGwxNmdJbGZScUhwbnh4bmNl?=
 =?utf-8?B?VkkvYnptdEswT01CenpWUk92Z1F3d2QvbGFoMWoxUWJ6RUtWamhDT0h6YmJl?=
 =?utf-8?B?SXFzd1ZSUTM2N25SdllhMmd2S3FhcWk4REdJVnZhV2dxR202THJyN0VQTmI2?=
 =?utf-8?B?TXhjMktEckFIejNwYTN1c3pnWWdhTGFCYVZlTUplNmF3NUg0dHJCN3ZBUzVH?=
 =?utf-8?B?TFhUVWVIZTdYcGdaL1A0K3NMMGp3OUJHKzdpU0F2UXpvK3dGY1lXTldnY0cr?=
 =?utf-8?B?WkdPTXRJd3pHVVFlZG9MakNwRFhSc3VYWGxMWmtnMTFOTCtoZUlNYlg1dklM?=
 =?utf-8?B?c1BqckQyWkdxVGJKNWNhYTI2KzIyVk9XRWMyWTFVUDNKbFM1eDZseDBmVUtr?=
 =?utf-8?B?em5EM2pZSjdwTHhrZDRHRWo0VmpjejZUZ3lxSThENnczNnVKUC9XaFRFYlFS?=
 =?utf-8?B?ZHJLc1NqRC94MzEvOTA2RWprbmtpUEdjNGlCbStRbXJPaCtKeDFGUDlzcHha?=
 =?utf-8?B?aWs3U3ZOZEhrTlZ1a2RNTFc5RHZPeUJZQmRlK2c4QlA0dW84bTJ6bmdsdWdw?=
 =?utf-8?B?SHlZNGJUUHUwMEJPaUpkaUVEd0dWVm9ralZZSHlOL3JXR3ovZjU1anpsRnNh?=
 =?utf-8?B?MC8zU1ZIcmphUGtWV3h4UVpKYTlHZFdWT0tOQ3JEOWtKZnVEU0xEOTJRYjRF?=
 =?utf-8?B?d2xCNzZ6Y0JaaWJGNzdOVk1BOGFJRm1tWXF2bEExKytuZktqMjVxaENtYVND?=
 =?utf-8?B?QTdpTFRJeFZQMFdSNnF1dEpGNzVVMm9XZDlxaGdQYWVSV0Rwb1N4Y3NwNFZN?=
 =?utf-8?Q?Vq4dDMyHQvtWP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUpZbVJHcVh5M2xUbVhPNGJjN1p3TjFhSSt3RnczYTJFb2lCUm8rZE1PaS9N?=
 =?utf-8?B?aVA4ZWhYRFIrOFpsQmNHUXZZU21BV1l0T1VNV3pJVjVZM0xJbThVN3pzSC9S?=
 =?utf-8?B?MDk1L2ZIZm1tVnVveno2ZGNaYUs1K0x3cUJxclR6b1RkcE1SRzdidEhoNDNx?=
 =?utf-8?B?OFMzelRBeFFaeDV6V1lIK2VlZHY3VVlSV2xiRHUxS2l5T3BMeVdyM2JuZHU2?=
 =?utf-8?B?SUZqQWtQT2d0dkVLMkdvdm9vN2dhN2ZnOXF6clorMmQrbzMybUVtQUlLMjVn?=
 =?utf-8?B?QkovZ1Y3VG1OQ0Z4YlNnNy90RVFidFh5OS9vQkNCRncwN1YwNlo3VkxqbSt4?=
 =?utf-8?B?VHhLeGo5YUJwK3kyYXlPM0JCNlVqT1hNQ0NIbFNYcmtSOVZOOGc2cnh6bVgr?=
 =?utf-8?B?UVdJYjFUVDd5c1pWQnJNSUI2VWozVlpTT1lNTm4rSDlzdVQ5Vk1iRzVSd3Nj?=
 =?utf-8?B?TDhRTWR1TmUzOGt3c3h3bWR4K1lYR1BLQWd4c3FvSUFsL2paQzAxL3E5S0Vw?=
 =?utf-8?B?aXN2KzlGUjhpNERsSnlrbmF2RXB1c3JFWTdqaE1rU3ZSTTdjaDZqVW1lQW5t?=
 =?utf-8?B?MjRnM1h4YlJFbjJqeGx5aU8zRGVIR1VwVkR0eUdSZWVsZ1ZmZ2dVQVl5ZVRp?=
 =?utf-8?B?eGNMTGJyRnYyelQ1QXVLL0UyaTk3V2dpc0JDWVBZTDNyeExKWjRyQmxPUzdB?=
 =?utf-8?B?cVJZV2tjQ1ZEeFJqRGFoSHpBZDZML1VvZUlvNEJUQlZKekcvb3F4cldKV3ND?=
 =?utf-8?B?S0dHYWJnc21ndk9ETFpSa1YxMmloUG0wYjlnUGE2K3ZwSGl0VGhRTEdYbnFF?=
 =?utf-8?B?aG84WlpiVFFieWRZN2RRZnNVeElEYXUrcXZGMXI2SXdpLzVmMk80WDdnTjY2?=
 =?utf-8?B?VEhVaWpCSFlqRXVULzl4MzlHUU55cDRYbFBacUxaT20rckVveWhXR3lPeWJi?=
 =?utf-8?B?dkZ6MVdCVkhQSllDV1JuMU5GQVVqV3F2KzFyZTNIeVRhYkg4UDk3aGE1alBo?=
 =?utf-8?B?VG45bnBYS3hYS01JTXhLR2h2aXlmRUd3WmlPbU9OeFFDbXJYWHJ0UDd4dnVZ?=
 =?utf-8?B?RHlLekZaOWVmZnR1WGxrb3pjSHZwZnpzc1M2OHNFZlZPQUtHc2tOTFpBL1h4?=
 =?utf-8?B?YVRsVzI4OHhNUkJwd0FCTWQvNzdZb0YzZitVTnNUTS9VdmpSMURTZ0poT09Z?=
 =?utf-8?B?T2NUR0hDeGU1OUdmNEtOTTE5SEp5aCtxMkRVSjRmWTVKUkNlSituOXdhdTNv?=
 =?utf-8?B?SC9pUk5Lc2hJenAvTXlzTXpMSWZqUXJLYmtGakpsMlNWa0h6VFg2VkpzeDVq?=
 =?utf-8?B?d2FydmU0eEtMcWNmNExraW5jUWplc0lkTHIrTGdsekZIVmVqSzdNNmgyN2RM?=
 =?utf-8?B?L2dHSTdlNllWTzNGcm05QjhvaG1PVkk0U21JSzlWeDlTandVMHNEQ0lyQ3Vk?=
 =?utf-8?B?U29vK2FaSGlDeGY1ZnRmZFJCUnNpQmh4RlZDS0pLZmNSdGx4M2FYcWZ5VlNz?=
 =?utf-8?B?d0Zmb09sK0grdWxzWWpMeTNOcFBBb2dvTGhtZFk3M3FPbC90Q1JJdHk3clR3?=
 =?utf-8?B?cFg4UnVsRUliU3kvN2w2M251VlkybFFlSDRCRzdDcGd5dnk1WWxzcG9VNDA2?=
 =?utf-8?B?aEc1K0pmOUZsU3RoUmV5THdScEdDNC92UHI3S2ZiWWd1WlljOHRxZlpHSkVX?=
 =?utf-8?B?TjdiR01pZ2hKWHJ3N1dmb2xxMXplMkowVG1UblZocHZKNmE5Ykdkb2h6dGNt?=
 =?utf-8?B?VzlITVVCRklCVUFZSWw0U3RKbmFMdy9QY1pIUGtlMUhHa2dtM3UxcVduRzVI?=
 =?utf-8?B?V2VzOCtLbGxHTndTOFcrVWcvUEx5RWVsZUpSYXhZV29pdlM4NUdleWxxT2w1?=
 =?utf-8?B?MFVxQUlIVHJmYndZRWhra2ZFUVd4blBmQUVhblFPbEpRMWUwU01TMjVNWXdr?=
 =?utf-8?B?S1FVMzhmbGM2Rk52eUZabWlyNmpkVjdjREh2cFVrWG85TDZUZjFWaTJYYmpB?=
 =?utf-8?B?UzNBVk8zV0YyQlJoUmE3SGZXSENwbFgvVktDcXhUbXVGVjhSa3lmaXEraVFi?=
 =?utf-8?B?c0lIa0Z3WVdPbTZ1aExmSlAyMTlsc3BmYkk5YzhIMFE0QVRTcXlVQ01scFA2?=
 =?utf-8?Q?01OJDNl6hu3+exZDS/D+LsTUr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1626f787-8ba5-4753-13ef-08dd6ab18b72
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 08:54:54.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V0mPgqAkuIE/MudzVp5OHzd1pJFvRFnAC/9mcQYBSClpvr6VlD4LDpKgm0ALUFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019



On 20/03/2025 17:46, Anthony PERARD wrote:
> 
> 
> On Tue, Mar 18, 2025 at 10:00:13AM +0100, Michal Orzel wrote:
>> We are missing a way to detect whether a user provided a value for
>> nr_spis equal to 0 or did not provide any value (default is also 0) which
>> can cause issues when calculated nr_spis is > 0 and the value from domain
>> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
>> (max supported nr of SPIs is 960 anyway).
>>
>> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  tools/libs/light/libxl_arm.c     | 7 ++++---
>>  tools/libs/light/libxl_types.idl | 2 +-
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 2d895408cac3..5bb5bac61def 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>                                        libxl_domain_config *d_config,
>>                                        struct xen_domctl_createdomain *config)
>>  {
>> -    uint32_t nr_spis = 0;
>> +    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
>>      unsigned int i;
>>      uint32_t vuart_irq, virtio_irq = 0;
>>      bool vuart_enabled = false, virtio_enabled = false;
>> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>
>>      LOG(DEBUG, "Configure the domain");
>>
>> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
>> +    /* We use UINT32_MAX to denote if a user provided a value or not */
>> +    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>>          LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>>              nr_spis);
>>          return ERROR_FAIL;
>>      }
>>
>> -    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
>> +    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;
> 
> Could you try to check only once if there is a user provided value for
> nr_spis?
Sure, but that's one extra variable or more if/else blocks.

> 
>>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>>
>>      switch (d_config->b_info.arch_arm.gic_version) {
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index bd4b8721ff19..129c00ce929c 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                 ("vuart", libxl_vuart_type),
>>                                 ("sve_vl", libxl_sve_type),
>> -                               ("nr_spis", uint32),
>> +                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),
> 
> Could you introduce something like LIBXL_NR_SPIS_DEFAULT in libxl.h
> instead? (Like we have LIBXL_MAX_GRANT_DEFAULT or LIBXL_MEMKB_DEFAULT)
Sure, no problem.

~Michal


