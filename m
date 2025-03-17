Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2FCA64D75
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916619.1321682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu94s-0002uf-GT; Mon, 17 Mar 2025 11:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916619.1321682; Mon, 17 Mar 2025 11:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu94s-0002rn-D1; Mon, 17 Mar 2025 11:56:18 +0000
Received: by outflank-mailman (input) for mailman id 916619;
 Mon, 17 Mar 2025 11:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu94q-0002rh-Nb
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:56:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d212dfac-0326-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:56:12 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:56:09 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:56:09 +0000
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
X-Inumbo-ID: d212dfac-0326-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZUdkoUukBZn9G5ZwyvQDMIfVbpVaCSOTDtak+N2+nVXydkCH9pTipl/xhhTanc7s5N6E6GZshutq0NRg3nypoiHTzjDog6LtSpB9lvgCVtSE51a6UUBd/RcAvDUZ22b2M8pffZRPB5xTtHsER1Yptzaa5hS1s65uwEtEu8hcqFNYQIhMV4VTBx/NrOh8HzjALnCNqeyqBvf2CutC1VhhPKiiEXoEgSS678ni3TqAcPe+DZB7wxSAZlh6ajeMidpV0XVA/3psAaanvN+dwezpixyQql0GFPHiqvZdO0fWv+bdKyneRNvaWRI8971mnFS/LB6ay8UTTk2Y896aEAg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5N4I2gYm1Dt1D7YY9O7VMQ8Ed3sDR1K4xQIt1gNzPo=;
 b=frIovU+VXzAcLrQIg/X/gjPmfj7ol8vgw8ANOzi6ci0sMgVRwo17e7p0ftjlnk0bf8qcu9r/6y+ECCfz6J8S16dZGUfS+UzNAtPzIWLx1yLLFOY6UcYct/I1pD4NR9gUSXt0lptk4ThmEU19ec8lozu3zAyV05jS6KQ74IG1RIKd+JIkkPS9KMQPtuX7vJfQhX7awsyg1doZIKzEoobO1hWr6iHW1N8K1PaINuPXpPjlCD+9qRpKiSZPk7ugbWxYlnUKAQIOi6Juez23h23JFN+HmngUEUqh/17HFNpEXaSbBuzze288gt7/QNyP19s6TjbXit79Y2iny76gNB2v2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5N4I2gYm1Dt1D7YY9O7VMQ8Ed3sDR1K4xQIt1gNzPo=;
 b=tgK+9UUJm60vrr7NcrCmKmk5tW4+e7zWNp4ETpdSMb0hws2rkNtgXrw93vqep97xzcO4xmDedri6Mqt6cd6kvjwXtzJNXFRR7b1yHEdH9JzTZnSj16GrmkC41dP/xWeCNPID4xPgZJlYJckJQf8FgEWEQ1l8CpNSNbk32ZJwQeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c21737e3-67e7-430c-a0a7-203a8fd7d2ab@amd.com>
Date: Mon, 17 Mar 2025 12:56:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm32: mpu: Create boot-time MPU protection
 regions
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
 <20250313182850.1527052-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250313182850.1527052-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e77b483-eb06-45ef-0be1-08dd654ab4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1ZLdS9sVkZuaW9qYkJvK285M1BpRG9WSkduemtJYzdpblpUYkVzSzVhRm0x?=
 =?utf-8?B?UDlJZzBlS1g4dlZTMitPZU5OVFhucklodW5lZlBMSDFXeXQ4alRhMFhwa0U1?=
 =?utf-8?B?cXZkUERRRUlwZWJvMlcyRE5QZ0NKVy9vOEFYVit1b2ptMlNqdmU5SFBtYVJl?=
 =?utf-8?B?QUxDZGdYRlJGQTVqZW9zdm1pTEtGdmJXYUIxMnpkckNDTjZuVFE3aEFlVXdG?=
 =?utf-8?B?RzZNUUxXZXVSVEVZQVRIL28zbVpIeUdQbWtGNktoL1FQWllWUFE3VkQ0N3k1?=
 =?utf-8?B?QXBIY0hURnArc0hucTltamwxSkZlelBtOW83QmN5SlBPQm1NMUh2YjNGMTN4?=
 =?utf-8?B?TlREbWo1NGpFVWpCRkhsWGxrcDM5WlRXS2RJdGErcHkwRFFpbS9hTXdnYi9a?=
 =?utf-8?B?cmRHeVhnbGZiS2duK04vS3VQOUVDMG5WQ3JuUUQ2Y05KQjZZNHk5dFM4bVhL?=
 =?utf-8?B?MU9GL0F2VVd5d1hRQm14dklPWlozZGMwNlBMVGRaSE9GQXhQeVJJeitmU2sx?=
 =?utf-8?B?V1JoYkFubzRZZkIyVi9Xd1d2Kzl1WE53aXNZSUpaUjVRVG41Z2JvdGpGVXVu?=
 =?utf-8?B?aDMxRlJHdGFaOFc2ZTc0R1FZVDI4N3B6alI0OEN1RzlseTRWaTRmbHYyUnFH?=
 =?utf-8?B?TEloOUhEMHdMZUNJUW1IckZXY2lEcytERWdBa0lnYUVwZ1pQQTVxaTBmM29X?=
 =?utf-8?B?bVJnUE1pOHRrSXEvTTBvVGRnVUplbUdnRkhlQ0RWQ09tRHZxT003dkhNUXJD?=
 =?utf-8?B?eWpDVVdUaVNhNHNic2liZ3kwS2lxeTRuVDduN2dqOUFhVGl6YWRTT3djUHlo?=
 =?utf-8?B?dVN1VllTclZ4akpmNlpKbDZldnU3MXNuK0xNSk1LTEVQUHRBMWZZeVp5RHYx?=
 =?utf-8?B?N3h4YmMvS2hLR1Iycnh5NU1XNUMzN2pvVDFycGxabmJwSEZqazRtT0o4SFNh?=
 =?utf-8?B?RCtQRGZZWkFuQ1ZXNHQ4Zm10MUtTMTNwNmFSRnJFMWRJZ1MrSVRvdGgycUtB?=
 =?utf-8?B?VEdnQkJFWGl2c1hJRlBKMWJIOGNUMk8xTzlsaWNXbnNlU0poMldRSW9Gc1A3?=
 =?utf-8?B?OTZMY2FHRlFUcUtVbzgvcW5haWhibHhVUk9WNnBOajNNS3Biay9Ib3ZiQ0hr?=
 =?utf-8?B?Y2c4OHhpbEtpZWovbnJZamZkMGtIVjcrK0Nra2pGTzJKeWpFbEZ1dnNTYjFF?=
 =?utf-8?B?T3dLRTRENnMyeGdTOGZWZzdYYjlUVkFaVEZGTnlNQ1hZMUpnK3hOL2hPVm5E?=
 =?utf-8?B?cjVrNU5LTjFTYVZvQWtSUE13cS9hVEt4MDk3WXVycVArbUViT3gwL1F6Y3FN?=
 =?utf-8?B?KzVvN1lpT0xRRTFscmFKazdOSDVrTjhPUTJLTnEyZWdGSzZsTlpTYmRHUUkr?=
 =?utf-8?B?N0liSFVyNklkOHhZUHU3a2ZZMnVFOXFzV29BUDhoU1BCZHpPK0FNT1dFMzhx?=
 =?utf-8?B?eVJWaTRacm1CZWJmNW1zSmhQRzNOT3VrdEd2ZXQ5Sk5FMTB4T3Q4S3ZLUXJw?=
 =?utf-8?B?OS9OVXBjSnB2YXVvZ0VvOTc1NTAzVmd6cVR1UWRNeC9SUkozU0x6a01Ta1o3?=
 =?utf-8?B?Wm5ZalBUT3hQeENXYWVGcFZsL0lwT2JjcW5HU3dleklNcmhCQm9EUnRmQjJh?=
 =?utf-8?B?djF6YlpZbUxVVHVCRXdnZE1GOXhSOUEvV0JKdEpNQi9zSUFzRm1VMUFpYTk2?=
 =?utf-8?B?YXdhaHl1YXhHUGRpWEN1R0VYZ0c1SnNBaFlrUE5iU0t5MzJsZUpDVW02ZTlj?=
 =?utf-8?B?Q2NQVCs0NWxVQ1RnbmtWS2ZOTDB4czJjZUh6a2IvNlk5YVVud3lGQkhURUQz?=
 =?utf-8?B?U0lKYStvSGE0SzRjYlBOMU5jK2RyU1N3SlhEc2oweWlmbmx4c3ZWV3dkMGVF?=
 =?utf-8?Q?8OMU/xl1/MGnr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlB4SWlDbTZ0Mk9weFh1RGQ0UldFN3QvVHhOemNoL3l6eUhsL08xZkpXQWFj?=
 =?utf-8?B?anpzYTVJZGtrajdhU1BYL2E1NDE4WTJNSHY4eEtmRTVOZ0ZRQlJIYkUrdksw?=
 =?utf-8?B?WDBBNDFSQ1IwU29vMWxPMGpmMExGaUdXbjlpZ1NpK1pVVjJKVDQ4R0hGS1pa?=
 =?utf-8?B?ZDhocGhSRWxrcjJUWFg4VU14RUV0NkpFK3dQQURSQmhURjVhRDR0Zitwekh6?=
 =?utf-8?B?a3JDeWlnUUo4dk9yaEVuMDhXWHQ4d1JlQlNZUElaTlpIekh0ajg5M1NRc1Mr?=
 =?utf-8?B?S3hFTnh6N0F3TXlSOFB6TjRmKy9vN0lkdEV6YTcxVXRVL2FzdFJONjB1TzZ2?=
 =?utf-8?B?TzZTS1V2b1dyOFVmWEMweE12ZytpMEw5Z2Jma2YreTZjb2tZTmpKQTlGcFVP?=
 =?utf-8?B?ejRoMmswMlZzRDYxZE51ZWpDS09oV2ZwZERzdnlqY0NCZzlnMFkwc2ZNRnVl?=
 =?utf-8?B?RGhKTUJZZi9hMzBYakNZVkxScGZ3SGR1ZHVnSmRHTTQrQWtTWENqbk9kOWc2?=
 =?utf-8?B?VTBPcVZ2VS9HNGNFTWxzNUpJa1gwL1E1bzd0c01WaGlKTjN1cjl3NE8ycXhy?=
 =?utf-8?B?cU5xcHF0MW5HN2hIMzkzaXFMSEdpclp4d2lIRE1wMTdUSEQrZi9yM3luK0M5?=
 =?utf-8?B?MFRmUkhsVVJxYXE3VmVPNWpUa3JuaFh3cmNreEg2WTVhOHNqV1ZpTUM0eHBM?=
 =?utf-8?B?RG1yMlZlN1hBZHZIdVVYN3AzSkFycEM0Um9lNWQ0eDdPSjlzNEhQRVZxQThK?=
 =?utf-8?B?cVFBYjByb2FTTWQ4WXRpUVdJeXVySzUwcCt5ZmwxOWRsTmQrdkxxaUh0U2lC?=
 =?utf-8?B?ZlArdVhCS1ZzWUxwbmk0ZlA4YUd3Q0U1MFh5TnRnZW1HTHRMK1hrdzVoalQ3?=
 =?utf-8?B?RWtNNkpFVmlCcXA0TEVSYVY2V3E5LzZQVm9wMCtjWW1vcllCTFdYVFcrNmo4?=
 =?utf-8?B?UU1jVjQrWlMzMXFja1g1ZHJIaHNvM3ZFRVVVT3lMZTZwM3RQNnJwUGRhaTdh?=
 =?utf-8?B?dWpNTjUzanhUc0JERTQwL0lyelBUVXVqanRvdFA4SlMzbnpsUkxJUG01RmFu?=
 =?utf-8?B?RXIvZkhCQTMyc2pWcmNjMnJFb1ZKZk1QWENnMENRd2VEaXhQNlpsZVVOTWp1?=
 =?utf-8?B?R21BN05tMkVHZTNVUEIyMVhKM0xIS3p0eGwrS29wUUduS3NKZDJmWE9xZ1FQ?=
 =?utf-8?B?MTlxS3Nna1FhaWJzTjNjMVlNcThqS0JJekh1Z2ZsUTNMc0lnaVVCckFUTFlr?=
 =?utf-8?B?dlE0SDlsTWkwYlRtR0pQMzBpZkp5MEhmUndlMU9hK0RyamwvR2c5VWdoUmRH?=
 =?utf-8?B?bTkvamtiZlVud3pKOFR0d1dDTGtZYTVsdXQ2NmQ0K1JOaU9sWUc3VzYzL0pE?=
 =?utf-8?B?WDVXVWJBNmN5M0t2b21FZXI4YXVCaWRuVHMyL3d5eGczV0xxT214NmFBRmJD?=
 =?utf-8?B?b0NxWmt1UGJja25GYVdvc0QySW1DNW1mVEVCc0dIUnFqL21acE00ZFhiNnhB?=
 =?utf-8?B?aGQ2b2RpMTVnR3hjdTFIb2VXcE1nQkRDQ0lXSUpFK0hUaWx3NktkcjFZd2pk?=
 =?utf-8?B?R2FpMjlzTDk5NDA1RnJEaEhmYktCZ2M1VmVsbzhFTnlPZnNxSWxTYUlDdGFL?=
 =?utf-8?B?VTMzdk51Yzk4RDZtd2s2TkFXM081eXlOb21QTzUyUVJRMnB2UjhYQUNkK3BU?=
 =?utf-8?B?M3VlUGFGcm5KWE85VDhUcVhpdVVlTHY2SVNmSzFSa0hQVmJZcWtSVHNLa0sw?=
 =?utf-8?B?cmNGaGpNWlpCTGkrUk94aGg5L3Q2aFhXdWUyZXpJU1Y1ZnhIbjlHbzBYL0Vs?=
 =?utf-8?B?UjN0d3h2QlpvcGRSYUNWTVMyNFNiVjN3WGNQRkZoVUJHR1N2bm92V001SVVm?=
 =?utf-8?B?NHVXRHg1STZ4eHREOVFmb29nb0N1WHc5Ykh2MS9GQldKOW5EeUdJVXJqbXJQ?=
 =?utf-8?B?cWxEQ04wbkQwbHFLN3ROMGp1STRhcm9pYTUrSFNSWjFTYVBRUGpzYjJmN3Bi?=
 =?utf-8?B?WC9ZbVV6UlZpcW5CRW5HQTBQYmt3S3JpcXArS0pZZGhLOTF4d0ZUbDhZbzNX?=
 =?utf-8?B?eGRBNEl6akJBdGcwRTdkUXVOZkZtWDk0M3VKYlVUNW8vdlYwd3hWSUtsRU5u?=
 =?utf-8?Q?GyIw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e77b483-eb06-45ef-0be1-08dd654ab4a8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:56:09.1001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I88gW23TXx94KRk73Ur/dQ2xMV19eGlBvqxPDSpAQ8WWkWxQ0LfypFzM77YNdk5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156



On 13/03/2025 19:28, Ayan Kumar Halder wrote:
> Define enable_boot_cpu_mm() for the Armv8-R AArch32.
> 
> Like boot-time page table in MMU system, we need a boot-time MPU protection
> region configuration in MPU system so Xen can fetch code and data from normal
> memory.
> 
> To do this, Xen maps the following sections of the binary as separate regions
> (with permissions) :-
> 1. Text (Read only at EL2, execution is permitted)
> 2. RO data (Read only at EL2)
> 3. RO after init data and RW data (Read/Write at EL2)
> 4. Init Text (Read only at EL2, execution is permitted)
> 5. Init data and BSS (Read/Write at EL2)
> 
> Before creating a region, we check if the count exceeds the number defined in
> MPUIR_EL2. If so, then the boot fails.
> 
> Also we check if the region is empty or not. IOW, if the start and end address
> are same, we skip mapping the region.
> 
> One needs to set up HMAIR0 and HMAIR1 registers in enable_mpu(). The register
> configurations are the same as in enable_mmu().
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos.
> 
>  xen/arch/arm/arm32/Makefile           |   1 +
>  xen/arch/arm/arm32/mpu/Makefile       |   1 +
>  xen/arch/arm/arm32/mpu/head.S         | 170 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/cpregs.h     |   4 +
>  xen/arch/arm/include/asm/mpu/cpregs.h |  21 ++++
>  5 files changed, 197 insertions(+)
>  create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>  create mode 100644 xen/arch/arm/arm32/mpu/head.S
>  create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
> 
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 40a2b4803f..537969d753 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += lib/
>  obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>  
>  obj-$(CONFIG_EARLY_PRINTK) += debug.o
>  obj-y += domctl.o
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
> new file mode 100644
> index 0000000000..40648ce1a8
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -0,0 +1,170 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/arm32/sysregs.h>
> +#include <asm/early_printk.h>
> +#include <asm/page.h>
> +
> +/* Backgroud region enable/disable */
> +#define SCTLR_ELx_BR    BIT(17, UL)
> +
> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
> +
> +/*
Lines from here...

> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * sel:         region selector
> + * base:        reg storing base address
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
> + *
> + * Preserves \maxcount
> + * Output:
> + *  \sel: Next available region selector index.
> + * Clobbers \base, \limit, \prbar, \prlar
Just a question: I know it was done like that for arm64 but where does this
format of specifying registers in the comment also with leading '\' come from?
At least for me, it reads odd.

> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Check if the region is empty */
> +    cmp   \base, \limit
> +    beq   1f
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> +    cmp   \sel, \maxcount
> +    bge   fail_insufficient_regions
> +
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
... to here (40+ in total) are exactly the same for arm64 and arm32 MPU. I don't
think it's great to have this code duplication. There are/will be also other
functions that will be the same. Can we have a common MPU head.S or a header
file to avoid duplication?

> +    mcr   CP32(\sel, PRSELR_EL2)
> +    isb
> +    mcr   CP32(\prbar, PRBAR_EL2)
> +    mcr   CP32(\prlar,  PRLAR_EL2)
> +    dsb   sy
> +    isb
> +
> +    add   \sel, \sel, #1
> +
> +1:
> +.endm
> +
> +/*
> + * Failure caused due to insufficient MPU regions.
> + */
No need for multi-line comment for a single sentence.

> +FUNC_LOCAL(fail_insufficient_regions)
> +    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> +1:  wfe
> +    b   1b
> +END(fail_insufficient_regions)
> +
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch32 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + *
> + * Clobbers x0
> + *
No need for this extra line in comment

> + */
> +FUNC_LOCAL(enable_mpu)
> +    /* Set up memory attribute type tables */
> +    mov_w r0, MAIR0VAL
> +    mov_w r1, MAIR1VAL
> +    mcr   CP32(r0, HMAIR0)
> +    mcr   CP32(r1, HMAIR1)
> +
> +    mrc   CP32(r0, HSCTLR)
> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    mcr   CP32(r0, HSCTLR)
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
> +/*
> + * Maps the various sections of Xen (decsribed in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Clobbers r0
> + *
No need for this extra line in comment

> + */
> +
No empty line here

> +FUNC(enable_boot_cpu_mm)
This entire function, except for reading sysreg and register prefix (x,r) is the
same between arm64 and arm32. This could also be made common.

> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    mrc   CP32(r5, MPUIR_EL2)
> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
> +
> +    /* x0: region sel */
> +    mov   r0, #0
> +
> +    /* Xen text section. */
> +    ldr   r1, =_stext
> +    ldr   r2, =_etext
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    ldr   r1, =_srodata
> +    ldr   r2, =_erodata
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
> +
> +    /* Xen read-only after init and data section. (RW data) */
> +    ldr   r1, =__ro_after_init_start
> +    ldr   r2, =__init_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +    /* Xen code section. */
> +    ldr   r1, =__init_begin
> +    ldr   r2, =__init_data_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen data and BSS section. */
> +    ldr   r1, =__init_data_begin
> +    ldr   r2, =__bss_end
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Xen early UART section. */
> +    ldr   r1, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    ldr   r2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
> +#endif
> +
> +    b    enable_mpu
> +    ret
> +END(enable_boot_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index aec9e8f329..6019a2cbdd 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -1,6 +1,10 @@
>  #ifndef __ASM_ARM_CPREGS_H
>  #define __ASM_ARM_CPREGS_H
>  
> +#ifdef CONFIG_MPU
> +#include <asm/mpu/cpregs.h>
> +#endif
> +
>  /*
>   * AArch32 Co-processor registers.
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> new file mode 100644
> index 0000000000..bd17a8c75a
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -0,0 +1,21 @@
> +#ifndef __ASM_ARM_MPU_CPREGS_H
Missing SPDX specifier?

> +#define __ASM_ARM_MPU_CPREGS_H
> +
> +#define HMPUIR          p15,4,c0,c0,4
> +
> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
> +#define HPRSELR         p15,4,c6,c2,1
> +#define PRBAR_EL2       p15,4,c6,c3,0
> +#define PRLAR_EL2       p15,4,c6,c8,1
> +
> +#define MPUIR_EL2               HMPUIR
> +#define PRSELR_EL2              HPRSELR
> +
> +#endif
Please provide comment /* __ASM_ARM_MPU_CPREGS_H */

> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */

~Michal


