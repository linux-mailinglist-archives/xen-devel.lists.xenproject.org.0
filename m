Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C497B0C3E4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051455.1419783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpOi-0002BV-78; Mon, 21 Jul 2025 12:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051455.1419783; Mon, 21 Jul 2025 12:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpOi-00028p-4K; Mon, 21 Jul 2025 12:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1051455;
 Mon, 21 Jul 2025 12:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udpOg-0001pe-Gr
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:13:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2417::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb7aca9-662c-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:13:33 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:13:29 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 12:13:29 +0000
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
X-Inumbo-ID: 1eb7aca9-662c-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZB9r6Uclsw78/+EHM/OXButFEQHaLrCDwZyr9MzYvjH1fn7Sr5UmbuUovB45JWCfAMTfgTxqLzqQ4EgDSqW+vdpA/C5PcWcEKouoJTqRwbZFJcU2TvXZfj3be7e95+jWgk9AglwdbdEGs5U+CKgP9cB9HY7UBevB9oTkbHLRu5NBr5JHasTLexgU5ZDuqQcemHdU9PCiANtvcHpBCMcENceie2UqwN4chnKkgm2yRGcAraX2jCUxholKCbzlpPilbtj9LXHDPOePy9B/+1DipSMVKZ31N0MJ8yeEEu3X1GwAbY2SJ9dX3CfXGq1SFgPvL0lUSlXxBFPWyllvX0idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/62eu5MaDI7nQ7ApIRuSEH7ZGf4V1QbUVVg/jQ0h5tQ=;
 b=NM/w4wGuQvACfc4miXffZuVOwiBjq80oH8iS8FP9vrX1XQZOOHF1r/BTQaVQws2dwNrOkfj2iA6LH2J3fVIbOlP+47dIdV9ZEFHZ2ReCe6Tqcb33oJDpwYcyTI/vVPr3u6scU3A2Ub+Dk/I38ROIMOInoezMXuYaAKaCkhhNiuUkneZbX63EPf1Ki1Mv4SUyhIxW/EhwQki/ICR08FZC4udFpiSloPGF75LJdt8VELGdrhQqF6Rkc23FRplABvc8S/+0JKzsCpJNKvgXBeysFuvGErPiTEDUTihnEvQZJZFdVya5RW98YVLgJFNL11gBusLqrTK+5F8PJm500k7G/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/62eu5MaDI7nQ7ApIRuSEH7ZGf4V1QbUVVg/jQ0h5tQ=;
 b=kPeJ+eyuHl7ng1CremgTo2sx0UKxoYaua9yJ+YQ/fhe8dhPdz7ZQ9wkpslntzNSRZNBaB/e/moT8R83kUWzgC5dwXLswDoTbVuhpRSxS/Ux689AXA6sHBV2iFcwPUnTpi/6PYEyNsMBzsGsCV9Ni+QBiMP680hFPtPsQvthZWb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0dbaa241-153b-4cc0-92ae-ed74f27970e8@amd.com>
Date: Mon, 21 Jul 2025 14:13:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/efi: Fix indentation
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
 <20250721090713.414324-3-frediano.ziglio@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250721090713.414324-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f58694-691b-43b9-bdfb-08ddc85000bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlFHTm9TY21HK0VKV1VYUnBYcnZsWDd4VlJZYUNEYU0rbGxma24wYUY3UFBE?=
 =?utf-8?B?c3Y0U2lRNTM1ZUtGQ2VvRkhFSWZJVGMzN0tRVjV1QmJYT1hQQWdkMnU1RVVD?=
 =?utf-8?B?V01obnRTaUhtVlI4MWppUURtQVBld0pZeitJaUxYM3ZRVk5ub0hQeVFkVFM3?=
 =?utf-8?B?a0FKdFFjZXdlSmV1Tk45ZHF6NllwcGJjK0tHeDVSbnFnVHhTTkxBRno5QnN0?=
 =?utf-8?B?QytUaGQzR3ZwREVRRWNYNm1HTXA3bG1pMUNONVdOdHgrT0dJRlpTNEdCbGIy?=
 =?utf-8?B?aHZXMTFiN0QxaGt5VkJMMFZBMytpNWppVEh4MDJTd3d3VG9sSGgwTHA2MXhL?=
 =?utf-8?B?VVlBaWF2cFkwRjRBUXRLM0gyRHl5cVZMb1k5eEpzQklRaUFBRzBPcGpicDha?=
 =?utf-8?B?eWFKcXdPYXlZUTRhaTNkMVpQY3A4SzBZd0JMWFhDRXRxNVNPdUgzUUM4Rk55?=
 =?utf-8?B?cms1VUUwRFV5aHpVOWtsQjRVSWVENUEvd0RCa2Z2Mlh1Ry92SVliTFhxUTZM?=
 =?utf-8?B?SGNZTVRQN3FpWEJjejVabk8zSHVPWVhUMUF2bkpGRWpBZXpZU25odXhmZ2Jq?=
 =?utf-8?B?aS84QVdWVVlqZEFvdVd4WjBGOE9HSnVzZnVLTk1FZjhuM0xxd3dBR2JQS1F4?=
 =?utf-8?B?WkFYV1gvTTl2M21BbFppQWFXY2hReFZuVkNYR1l5VHdBQTFUdEtEenhoVlhk?=
 =?utf-8?B?RTlpK0ZJaE81c3d2aFIzNTNJSVRDVUhjeVQ3SDF1cHJsZzRnc2N2RlNzekVx?=
 =?utf-8?B?c1E3b1phNHZKbDB1M25LNy9LSUpYS1dtL0ZSSDhIU3JwOWN5QndqSnBxWksw?=
 =?utf-8?B?V2ZCdFN1YWthL0ZaTjl5YVBkZ0xtS29OQXdnOUF4TzJydUp5Sjg0L2kxR1dt?=
 =?utf-8?B?RXFoQk1VQThpR2lYLzN4VE0zaUpadVVuRU1iUTRZWW1lVFRQUlhwamZNVW5X?=
 =?utf-8?B?d0FYRkR4Z1RTdklrSXRDSUZjZ3ZZRG45L1JJbjIyanpPUXhRMlo5QmM4MEJl?=
 =?utf-8?B?VDBFUjVsemJoZkNYUjErWSt1RWtKYityV0JnaVBtUkY1RUJQZENyUmY1czBN?=
 =?utf-8?B?eTVsMHFoZ1AyaklvRWJUWE1HeDFyV2ZLRlYwVWNaVHAxZFVzbWp6RnVwSlNU?=
 =?utf-8?B?KzRyNWwzdVFCRDQyd28xSVdZVFdaVzhPOXRFcnhYWHB1OXBPeDIyblVhcHY2?=
 =?utf-8?B?SEVCVnNhbTFJR280dndiYkpGTktTV1lCekVuNkJ1VTNCZXo4SGUvNkN3WWUw?=
 =?utf-8?B?M1prTzNGYUljUno2c2hRbnl1cXYxc1NUaHVZTlpkSTd1S2R5Nlk0ZDhEUjNk?=
 =?utf-8?B?WkhzRmw4b0o3d0dySzFyYnZpQmJJdU9CQkNSSkVBUXhxUzhzRGtEWFdPWmYx?=
 =?utf-8?B?dkV6emhTdXpoY2JuRVVSTzRMbSsvbDErUm5jckxpOSt3S0RpdVlvcEl0SGYy?=
 =?utf-8?B?N3FPelROZEZEbUxFL1J1ODZmeDV1WVlDbnphakZacmhicEtVOEk4aTd3YzYr?=
 =?utf-8?B?VURUREU2U0FzUkJUZXlMUGhyY0RJZEV4L3VlNUxwMWJJU3RwRkFBUTFqOXNj?=
 =?utf-8?B?NFIrcGc2UEtZVU9jSTRPY1c0dnFKMVo3VkNvVHMzQ1VaUWsrZ1F3UTJ0R1pW?=
 =?utf-8?B?WlJQcWUzUWgzaHQ3di9YZGRyUzhRTitHSkd6bVZDRHNIMG5Rcm45ZGRFVUNu?=
 =?utf-8?B?MXJ0WG5kUnVqMDZncDdObGtjM1dveFBOblZMelV4dHh5Mjh4TFVxZUFOaFF0?=
 =?utf-8?B?c09EWDA4L21yUVpXTGNWOXhONmlEakpDd2ZPWGMrS1pPc3ljRlBWUTl6UUNj?=
 =?utf-8?B?S2tUa05zNXV0bFhRVDdET3U1eldsV0ZQR0FYSXk1cGFXUE5QTkVkNU9ueWQw?=
 =?utf-8?B?TkJPMUpzMXZNdmUwT2FBa2RPYjNNUmI4RzlqU1dMR2tjWC9rQW9iNG1sYWYw?=
 =?utf-8?Q?yrPeAWlqAgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktvb1NPdzB1S1pHV2dmYUNQMFhDM3lpUFZWcUxjWE01dG5kMjIyODA4UVJW?=
 =?utf-8?B?RGdJVUwyOXJoUE5mN0pzWUtQcFNXY29yM2cxcXFrNTRPSkN1OGNTY1pjVkFo?=
 =?utf-8?B?WWNSVXdWa3FWZzNpNW1vTGtSa0FyUW16V2N2eE9XY1psa25FQzFaT3ZFOXBQ?=
 =?utf-8?B?aUp6azJYY3dJdXQ4Q1p4alBHQzYzYzFNb1pXc1JaSXBNR1NEa1ZXeWkrZXY0?=
 =?utf-8?B?MVA3Q1A4aDJCb0txR08xZktScFJ2L2dmaXgrcmVYM2NDRjRmeXNZZU5TcEZj?=
 =?utf-8?B?aHNJSTRXckplb3R4dTBzeTJlT0dLdzlyOTBnbDR4SnpGRU1sdThWa2RiVTJE?=
 =?utf-8?B?dGFLQVhzak5DMFByYVQ0SUMvYWdBMG1xMkEvTS9hYUFVZkljZEgvK3lEYTJZ?=
 =?utf-8?B?NlRWZ0hPaDZzMXRSekNqRGhKcUZmdFpzUXMrTnRlZ3d1VGEvQXFhMG9welBw?=
 =?utf-8?B?WTM3ZHRPVy9oeTRHK01VeHh2TUlBT3BkV2hBbjBPckdEM3l4Sk5IRHJaOENO?=
 =?utf-8?B?cGVkbGxTL2R5Z2I0MEd0NTkwNm5XRUpUeHcwZSswUE5HYlduKzlyRmdQdjEy?=
 =?utf-8?B?QkpkWXlMdnhZcVRyUkV1TFNOVFFmbWdvbVplY2YxRDRXbTNBVmlNZDV0NStE?=
 =?utf-8?B?TGRSMXhhZ1JBb3ZzL2Nzc3ZNL3luTlY2amVrTVJ4amhmcklkMjNXQmVjRUJL?=
 =?utf-8?B?blh2a2tEWVp3SDE1WTZhWFF3ejVneU9mQTVGZlo5cnJPZ0phYjQ3eHlqU2FD?=
 =?utf-8?B?aGhkT0lVKzRmQitHUGNObzJnSUxpVE1QcVZWR2pINjAxcWJ6RHZTSTZTOGx5?=
 =?utf-8?B?WU5yR2ZMTmdRZlV2eVhBNlhLR21QUjdDR2RQRk51SU40V1JzNmM1LzU2d2Vj?=
 =?utf-8?B?T25ITVk1cGFvRnJZaC9FeERjWWxlMS9aWUd2cUxoOFY0OHNZWDBRZE1yZWlG?=
 =?utf-8?B?T3hPcHFJVnJabFhlOU1mVXZncllIYS80V0hHU2l6RDBVeHBGclAvUG8rZDBx?=
 =?utf-8?B?eC9NejBNSnd3YzRHMlRaRW1GallyKytKUm1rc0ZPRlRINm5teUVTdGtGMmZH?=
 =?utf-8?B?YWhRMlR6MjZCRFAzak5LNHlLbDhjdGY1SmR4d290NXJFdW1uYzFIQVNmWTdT?=
 =?utf-8?B?ZzRrVWpiZnFGUzRrRjNTR09tTklxVzFzaUZPSFB4bFByUk9xT21sWkNDd2Ri?=
 =?utf-8?B?WjM2QWJRQVBRU1U4QlVvWG52TzBldWJ0OVgyMkJZTHZuc3FLMS9MZ09vN1A3?=
 =?utf-8?B?RUI1L2paczBpZWdFUDhhcUpoRDdhUlp5QWF3cGQ3MjJqOWFhdG1aYzAxblZ3?=
 =?utf-8?B?azFjcThuOVd1SzNQY2JNbmVqWmVTcDVad2ZKek51WThNb3c1TXk4cEhLcG5Z?=
 =?utf-8?B?N1IzL242UHRaNTdsNGRlcU1BcWZPeTZCYVg3YzFaR1h2NXZYTUY1blprMzZk?=
 =?utf-8?B?bFVVcXZ5SWtXUnBWRHFzNUMrLy9UdWM4NE4yaDc5OGJKS2F4aVprb1gzTUNW?=
 =?utf-8?B?ZmNzblJicUNnTEh2NVhxTStMQTRaRk5YVHE2SzlxSFVJZTljTlVNUk5IbkxL?=
 =?utf-8?B?VTVHc1ZCMFljb0pmUG9xTlN6YVNiTjRielRVYWFQWm95a1J2bTVjaHVqeXlt?=
 =?utf-8?B?QksrMURuNGZYRzNpL3lnWFhpUzdJeXdNNE4rUHA4ZmZHKzcyb3FsTUZ0eDdt?=
 =?utf-8?B?L2ZQUHpwUTFIR0xaMURKY3Erc1B6VkRoR01IbUl5T2trcVZ4SXFLOXFldTdr?=
 =?utf-8?B?ZUVOMkw3N0pOZUhtS1NJMEVqejh1eml4K01RamIweXVUSVhyWWtjYVhTSWZT?=
 =?utf-8?B?WmtGMjJZbHpnaVNhMnlMaHVLa0VBQzdXYkRIaVpuRnd4QW1JVGRGaWp5Ni9y?=
 =?utf-8?B?RGRHNE1vTE1aUkx1dmdlTWI2WEY1enAzcXI0SGVBTTUvZnlCV1AyakJSS253?=
 =?utf-8?B?bWE0TFgyOUVWbWxHYzJwUGgvLzdPQlM0djNPcUJtbkNKSkpDeVlvdWtjdUlQ?=
 =?utf-8?B?blpUZ3dDT1pyNXI0eFV3NXVkVlJFWG15TVVPcHJYL1kwV3dEekJtSlEvdHVZ?=
 =?utf-8?B?TjRweCtEU3Nnc3BVNnFyYSs0MFBjTDJ2cStkMjluTVZueVBoMTlnRXdUZFh5?=
 =?utf-8?Q?CwF8gyvBSpyels5DjkZne5ANZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f58694-691b-43b9-bdfb-08ddc85000bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:13:29.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 421ZwkXgnMC0vUPZIjrSe/TFlSAx/h84VEoauUL5d8GoCiEqTyVObAweQUJ6wIVA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470



On 21/07/2025 11:07, Frediano Ziglio wrote:
> Use 4 spaces instead of 3 spaces.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


