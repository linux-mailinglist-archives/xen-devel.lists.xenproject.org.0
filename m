Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44999ACEE2A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006620.1385839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Fo-0005VT-Rq; Thu, 05 Jun 2025 10:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006620.1385839; Thu, 05 Jun 2025 10:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Fo-0005TU-P6; Thu, 05 Jun 2025 10:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1006620;
 Thu, 05 Jun 2025 10:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Otu/=YU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uN8Fm-0005DA-T7
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:55:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2417::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a8fa4f-41fb-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:55:21 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 10:55:16 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 10:55:16 +0000
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
X-Inumbo-ID: 92a8fa4f-41fb-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM24YmbHCrCWxHjRnxdqd6OcXGz6T1pEQYccEd1w7iUf2I/Zb0iuVIh2+f8NT72xrEbxMoofZbB2ZM8+ehB4VfQ45iq+EAEqR4/oln9el+xhjtug9WbXZoDLoT7OdMOOPYcsmXCDKrrGMQDsRbKxLK+dZyMd7aVmm9zfHXzy+d+H9vis58WGJBZdour2TiltDIpDRDwvGby9pQUuKcqVdlHsvBmLLjvRdjOh0ZyiJFVrjWJLGiQgFSEYI/6CrWhtog29vxPZdTwGz14AlCKC7rK0oaTKaFlFndz5nFt+KX8RhlWjbmjGl17Jw8h0W3tvGHHdrfZMUOweN4tKe9bMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR+gbydvo4UmGyC7Ee6+sqhj2cAhLvN0uoaPYZy6+j8=;
 b=UATO9tBoZlsY+NcMPG0CzvNC21a6IktXQmNkIpUM76iGAdDaIOOasyYabvQ+MshvKULciXQFYoFGM1bc5GOCBGCTGf9I7NvQoUIBY4LxMvuBY513DJpZ4GCjw5KVMJP3UQ6yX+324BKbwGmPP+AJfv3xj0FdMSScGOYa5oZ3epmBtjmbgp0E34RV+xqbHAb50QrttpYGX1obqY4VmMWHjWysFP8r+6kTSqyVFusvGXNPZKmBGmx0GGk41w8/wvvoXwn8aVv2rhAmwNS+dTJRPO+AJs10DNLLHb4E4PycN8W13pm0D2FgCzFwxM7W5GeZAGeLht0zooC42fOLHq5s6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR+gbydvo4UmGyC7Ee6+sqhj2cAhLvN0uoaPYZy6+j8=;
 b=N0fVYqt4Opc5Zw9FTVfep9KghszKPla98lqLPr6tK941Dxb2FhQcWcUMbxd+OwzPEkZWxShd65Hw5sckHpAk5gTupgeAom/9xkWOXP9h/V1CXYTaOCwzWK74uYrgNp+miUgkKnu0i6oCejB1fScVGrEagpRTTmx7Q3lKSVj+UwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c6081516-22d8-4ee5-b1d3-5aaf358d72af@amd.com>
Date: Thu, 5 Jun 2025 12:55:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data
 structures
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-3-ayan.kumar.halder@amd.com>
 <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
 <0f5a4c32-3631-4a4c-9dd5-ae5385fc984a@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0f5a4c32-3631-4a4c-9dd5-ae5385fc984a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f46265c-e220-4bb8-9074-08dda41f742f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjY0Unp0a21iY1l6NFBkc1R2SHFwazcxMmUrQzdrbDdPUEhQMkFJVkovaWZO?=
 =?utf-8?B?YnNjMDFqcXZLZWhoVFJiVkhpT29mVHB1QkxPY1AxaVVtSHpzOEJtVk1EWElI?=
 =?utf-8?B?Sm5wQVVGemViakFDOFFFbUF0UWtlSDVwQk1DZWdjSDJBUTE5TnVlMVVRakJP?=
 =?utf-8?B?QTRNVnZnVm13SkFiWks5bHAvcVFvS1lYSGovSmJ6cFp1UXVPWFMxYjVUL3Bw?=
 =?utf-8?B?cFIwWGJXZnA0S0FhSmlGejFrOTg2a2ZEMmF0bmEzUTFSZzVKK1NIbktYZmgr?=
 =?utf-8?B?b0g5UTlLY0xMTHNrcWNRYjJ1L1JmenlxNVhhcWRJQzQra3pmSEhhbFhCR3VP?=
 =?utf-8?B?R3R5SWZiQVNDNlFhK2dTazQvem5FZFVOd0JnUDFwbVdhYURjbUl5bGF4SzFK?=
 =?utf-8?B?TjgyWWtQQmZPZGM4dTBLMVBnWjJSK2lLa2l1UTlmc3NmU3BtR2ZyT21mQlQ3?=
 =?utf-8?B?VU5ETDdrcFNnNzF0MDh0VGlDdDZMdnk2RU8zM25lY0xUR1hldm8zWGZTV2w0?=
 =?utf-8?B?SHdZZTNic01qU1M3bGdnU1k5WFdxRWY5UE9oa3dGQnlBbjhWTFN3aWozYzYw?=
 =?utf-8?B?OFlpNklUSksrQmlTSnBkRG1KRzNYcG9aOFR4andlNU4rek5LazBqcUNRZUp2?=
 =?utf-8?B?RGptZ0svWDdUWjdyOFZNUVdUTEx4YU5CN2xUMTNHK25VZnI1bGdmYjFLdkN4?=
 =?utf-8?B?L05XdXkrZ29MYUcrTzZFeFVscFArM1ZUdENZM3FtS2pLOCttZDhtSWxHM09R?=
 =?utf-8?B?Y0FRUkt3NnZDN3NBbkhKMUdXNHk2eFBkM2ZoUk9vdXBPSUhEd3Rsd1NpTit5?=
 =?utf-8?B?ZmJucDJxck90dmdhY2RuRlFpYVBNQVdQRzJUY3cvM1c0NlVVL3d3TWNtbkJr?=
 =?utf-8?B?Zjd0bitXWXRIVlFhRHBYNVpKcVV1Y3RJcU45N01JVzh4SWxyTjdJVVJIY29V?=
 =?utf-8?B?NXFvRzduNGExSlNWSUtEN3lZNko2cXh3TlMvaVNXWEd6OXlyRlFnVG0yYmU5?=
 =?utf-8?B?UEx0MXBUVksxL3ZIUVZGVDR3bTBXOVpKRzdUTXpZQWlPZ0hYOHFKSHdPNnVG?=
 =?utf-8?B?aDZKdnprY2dFUnRCVXFaOGhtLzJjSHlYemczZjMreFpJcnI0S3lKVGhGbytK?=
 =?utf-8?B?MHJITDZJejVNdTdOYURzaEpTZStBaTFMeVVDSVR5V2Y2dWNRV2lmT3JLbFZC?=
 =?utf-8?B?Z0VMWWRPZzd6UDl0YTdDVHFsMUpHSUczaVdaN3p3VTBna2YyU0pydHpkb3c4?=
 =?utf-8?B?VFNiWUswSXJqNWh2M0RWR3ZGcFRpMWtOV05yaE8xZk5rVXluMlV0eDRFcGNF?=
 =?utf-8?B?Z3pVS1E0azYyZllXWXlnQy9oUXFmbmdpdm8xbGx3NWRFS3psRHJXU0crYU5V?=
 =?utf-8?B?YU44dDRGMEJUMGpZbVF3akl0bndRK0pTV2E3MXhXYVFYZ2RwbE1FMWNwSnlk?=
 =?utf-8?B?bnBSSXBGYm1tLy9KWmlKMmZZZzBBYTRkblNnTzQ4UU4wRm5DUjNVMEN2QXlV?=
 =?utf-8?B?cit2MURybFpwWGJCMEN1NGRTaWxiVUpjbHBwdGVuOFd6ZE5jRkVqTE4wcXZn?=
 =?utf-8?B?UEJxMS9wWFlESFhSbWZuaE5BTHJsM0k5UmpHaWdRYU54NFd3THVUL0ROU1FG?=
 =?utf-8?B?TUFDN3lpcHAyaW03WDdiNHg2dXNMclF0U0paWDFkNEZhd2Z4TC9LZkVBM2FW?=
 =?utf-8?B?ME1vb0NDTkdwbFRTS3NDL3MzYlo2MUNtQS9GVzVpV2EyWitOQkpVWFI1eGdt?=
 =?utf-8?B?MWZ6dEVzWnlNVHRmVmk0T0VSaGdETUExbC8zM0tTc2o4UmZHYmI2K01VWjhS?=
 =?utf-8?B?REk5QUFuSXhydHNkTW1RaGJNR2tsY1BLWlN3bzdiT3RNSm1EaUhPSmNTVXg4?=
 =?utf-8?B?Ym1lMmZqYzl5amdWNWZSR3l3T1BJVitaT3lFRGJHTXhubHdGZUtxMTQ3OUpw?=
 =?utf-8?Q?T13PRLCXRCA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blczK2krTjI1Ymx2NzNZUWQ0ZkYwMzN0UUNvb3JxY1JoVUdyS2Q3NXFpeFph?=
 =?utf-8?B?bkYzbHRHRHVTREozTURpUnRJUTU4QzVIYzc3ZDBOdGd4ZnFobWxLL05QVmpr?=
 =?utf-8?B?ZVVtTE9ZNTd5SWxwblZIZG1hUDVTR1BSVjlJUm9ONWdFdmpyTG91OWRYakFV?=
 =?utf-8?B?NFF6L0dONkdSMU05RVpwZFdQbTJqTXRkNkozYWdhSlVpSzV4eVhPMnhvblpE?=
 =?utf-8?B?MDRvS2lxM3FueVN3SGVWYTNGQXpkRVBGZnoySG9nck41bkZNUWc5QTRQV2d3?=
 =?utf-8?B?eXNxTmt6VjhjOGhXSXZHcHZPSThMLytuSFNISXJwSmJIL09xdkdHS3NrWncr?=
 =?utf-8?B?RGxjeDJkOEd5WlpQd0NiNW1BaEdVanNVbDBnc3NxbDMxYjg3RGxhTkNMeEIv?=
 =?utf-8?B?bGo3V3ZXSm1KZHZ4amw4bEI5Ly9QSEl6bDVmR0RIWXVCT1lCeGhoWlZyMncz?=
 =?utf-8?B?ay92Z1AydnlLS0RWOXJlWXgyMldQVldZOHBUUmNiZG4vSjZPdzBjYzVrVFpG?=
 =?utf-8?B?YXlPaUNJV1piVU9ITTFNbTQrb2M4NXFDSVhBYXJpczB3TzA4NDVPdU5jckV2?=
 =?utf-8?B?RFFhQmNVbE1kTm9WV1NHdDEyd05hRUdDNUpucHJ1T3p4VXB2YUhBVEdtWFNz?=
 =?utf-8?B?OFJwRm00bllNTzJNVWNjYzdhMTg0ZnBwcmhxQ3J0ZVlYbnU3eXJra0VKRHVH?=
 =?utf-8?B?NUkrSVM0NnRNZ2N6UCswTHNmU3VHTnV6YXFBZEZvcWZINWJBZEpMUXo3cUVO?=
 =?utf-8?B?U1p4YytwclU4S3d4T0grb3FjSGFPSDc3ZTRROFVCT2VRUXppeldsK2pwSzVt?=
 =?utf-8?B?VjAvOW04dmFRTUk4cnlmSFdyeHpVVlNGSHkvdDV4NWxMeUkrem1pNDRHczdJ?=
 =?utf-8?B?MEl6L3FRdGRPRXlNa1hPZDFWYmJadkM5Q0lRR1hoK0pSaGpERnZxUnVjbHJt?=
 =?utf-8?B?Z0JuWURWNXNZNEhiMEphakNKOHJENG15cE55VzFQb3V2bmRnbmw1ODF4QVlN?=
 =?utf-8?B?eEFadHY1Qnp3OHRyWjNnZGptd3BLR0pvOE5sVzl2QXRDd28xYWpadzQ2b0ti?=
 =?utf-8?B?VVlDei9CMW9DT3ZZeERtZHlqSlpDV0U5OXE2KzNpeTJZQ0grR2E3cjZBVUNI?=
 =?utf-8?B?UWVHejVBNlArVVBPMXh5T2hmdWJTZSs2cUo2YzdMQ1RnWFpibnBZVXhPcXpP?=
 =?utf-8?B?RUh3UTlzMzVpOU0wTisyU044T0tFTGtoN3RlRDA3ZzljK0M5TWhrcDk0b0Fo?=
 =?utf-8?B?UGdiRGI4QmpIN0lOUDNNamZ2cE95MkRNYTlsZ00yWUIvTDZYanVBL0RucnhI?=
 =?utf-8?B?bzlzN2kxSE1nL2NhWW1NRlhaN3pvR3BSVDI1cTAzQlZiREowSm9ycTBDL1d0?=
 =?utf-8?B?K3VldU5zYWdHaFo2WVVYMFRNZGc1SE10Nkh1SWw1OEwvL2N3azBSZkxmQzdh?=
 =?utf-8?B?dEN0c1RrcTdhcGxrNHZiMXQyeWVnRU5VSFVrOEw1d200V1BkczdNTnZqZ0Rp?=
 =?utf-8?B?Nyt2YjcxWTcrbE9aZndMR01GQURqaWptb1QwVkMrMURmeUhMaUdSVGJ2ZE8w?=
 =?utf-8?B?VTdVNEQxeWluakFKd2RmMDdDWE4rYWdzY0REcW9Kbk9OcFpHeHc3K1JGb2hU?=
 =?utf-8?B?UUVCNHBONVFaVExiSUJRTWVIRnNOcG1ZUkR6Nm4vcEhja1h6dnEwd1ZDYTcz?=
 =?utf-8?B?ektoazhkblFySzlTUjNhck5TYWZtekgyOWF4eXJWSWozTXNmZ1JyT0tBcFY2?=
 =?utf-8?B?QVpiTVh0ZkpPQ2J1b0x4LzhMYk4wbkUzUTk5UVcxakVQVWRWSmZtakdqZEdF?=
 =?utf-8?B?WFcrdXFXeVVabDlhTWp6Q3Vmem1CdEJFLzQwTDJiZGpuNHNybFVheWNKZ1NC?=
 =?utf-8?B?Q1RlSXlJdHNldi9qcTZaejBiRzE3K0VCbmtpNEg5YTBoeHlGK1I0U3RSL0h2?=
 =?utf-8?B?OGdmSi9Bb2RFYzBEajB1VzBIaEFBNklNb0ZhR0VOK3pjVi85eWYvV0FsYXBw?=
 =?utf-8?B?d2twVkRrTVp1NVpybDVVU0w4aEdHc05QaTh6Vzh5MEM5SEF5aGxGVG95dXQy?=
 =?utf-8?B?bk5DeWVoemJKK3VDQWdzVGNHeTRBL1RkVTNDZFR5TG5NSHVEL3hjVWpaRHo5?=
 =?utf-8?Q?KYDY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f46265c-e220-4bb8-9074-08dda41f742f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:55:15.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENlgr+YbZjHc+vgOeP+GxNeAg5YTCKDj6gnSQQ0aNxkjy8JcHZSkN+KFp3PkSagY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300



On 05/06/2025 10:58, Julien Grall wrote:
> Hi Michal,
> 
> On 05/06/2025 08:44, Orzel, Michal wrote:
>>
>>
>> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>>> Do the arm32 equivalent initialization for commit id ca5df936c4.
>> This is not a good commit msg.
>> Also, we somewhat require passing 12 char long IDs.
> 
> We are following the same convention as Linux. IIRC this was updated 
> because there was some collision with 10 characters in Linux (not sure 
> if we have seen it in Xen yet).
> 
> [...]
> 
>>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>>> index 6b8c233e6c..943bcda346 100644
>>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>>> @@ -24,7 +24,13 @@
>>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>>   
>>>   .macro store_pair reg1, reg2, dst
>>> -    .word 0xe7f000f0                    /* unimplemented */
>>> +    str \reg1, [\dst]
>>> +    add \dst, \dst, #4
>>> +    str \reg2, [\dst]
>> AFAIR there is STM instruction to do the same
> 
> AFAICT, one issue with stm is the ordering is forced by the instruction 
> rather than the user. So \reg1 could be stored first.
Yes, I think it stores based on register number. So if you do {r2, r1} it will
still store r1 first.

> 
> I think it would be better to use "strd". It still has restriction
> (the two registers need to have contiguous index). But I think that 
> would be better if we want to reduce the number of instructions.
Ok

~Michal


