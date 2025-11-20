Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72081C74246
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 14:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167376.1493699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4Yg-0001Cw-Ow; Thu, 20 Nov 2025 13:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167376.1493699; Thu, 20 Nov 2025 13:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4Yg-0001BJ-Lo; Thu, 20 Nov 2025 13:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1167376;
 Thu, 20 Nov 2025 13:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM4Ye-0001BB-NK
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 13:18:44 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa4bdc0-c613-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 14:18:43 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8469.namprd03.prod.outlook.com (2603:10b6:8:326::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:18:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 13:18:40 +0000
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
X-Inumbo-ID: 6fa4bdc0-c613-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt5sydJTs4GIJPkRxcqyLKcnzizO2wvg/zW2n23kG0lzRpQSLm8jwv/XKQ3doWWb9CQUFCLZ9ByYf0vPZM5DDV9oFioEReTXyVm2fpQ2u0+p2O36Z2/CNIkwfd41wb05IDOJUizoQlTE/kC+1Uy7wSi7KJBX+snPIQN+OAL/Am+FKTlRu7uXOpxsC8Jwz0hM+95ULZwymu1hevpbzXXZNh2iyIkJ9FoqMfy3/pbwpA/bm2ZZjjKWpeo+NYkSeF2mrJNCvFAU0wpv3K7+/TZjvL1v+ltwJrHhpUFHwYci+ip75I1Qz+Hbv4Y6iT2zP5RRG3KxIJigzBq+DCSn9J1CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4YEl5xlgH+6YN2sXhH8yU5Z6joaCrykrDsffQPSWiI=;
 b=NttjVOknH8htTBuvypGsKXIaU062EWtWW9nbDWv3cWzUHH/1C5z5drlFs9lZelimfEcWpuC6cLTDT/cvpSCEm7QABZ76GdsHilfV0N9Rlvicv8Ct2AX8zcYj0cLTbnNEpcvbd1wxpLOLpdal8eFDhnIIOFeXSh+fbWSQmBY3bWMKyKSPpdNeRoWBTicYKf6GmyEpVgxsagFxZ02QnQZwsEhpzAyQG9Dx5c44OqtmzPXYpGiepbeTUMHrjzAj/DPXHgIKLKT+WZo1DlTFvL8SxZPbwZlWxCXhJly6VvwvGS3+x4Bz30pEBnFsu//dEVfNAv3rjw4bX5vxyi8aC8Z/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4YEl5xlgH+6YN2sXhH8yU5Z6joaCrykrDsffQPSWiI=;
 b=X/hEDJchFCiQ9TQwHwsayEPyF3QJa7pWrUpg6oR1WFufaNJytRIbTMb1sod8QDlFw8im4GRdDIQLZXThqbboqdWlMyM37IOVLDCTNhnmPwRi/vKySGARj01HWfyVOct83ijievTubGV04yxkNvU2+D6zkR0VmRCrSG8w6Bo+g8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63a4f416-f475-4b6b-8f44-db570b7a75d9@citrix.com>
Date: Thu, 20 Nov 2025 13:18:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/io-apic: purge usage of logical mode
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-6-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251120090637.25087-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 33de4339-b9db-4660-cf1b-08de2837527a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlhmcWdaK2wxM1pmVmpjbGo1NkhhWE5BcDM3SGpXYTRuN1pkUWVMRFZVdEtn?=
 =?utf-8?B?dXdmcE1nZ1VMR0xaRnp0ZmFQd0hPek5Mc0c4VzZtbHlTeG1MY3hmbGo5OE01?=
 =?utf-8?B?UTRwV29vV2VqaGNQSTFHdlB5M01pZ2w5ZnJWSVViRGpybk03b3M1R3FiUU9i?=
 =?utf-8?B?SU4yOFV5RVVNenkzOTRuRHZWaDdlekg4cnoxWnhOQXgwemtQaTBnZmxyTTAv?=
 =?utf-8?B?S2NTdTllb1pHT3pPSUlVclArVVh6eFRzZTc5bEZmWGp1bDVBR2hOM2Z4RkZr?=
 =?utf-8?B?TW4xVCtPZlVJK2N4VldJTEtVN1JMT3NBYnNyUGhtYjg3aDNWdFg5aiszN2Zp?=
 =?utf-8?B?MGdLZHhsVnhpdnNVNzBqNS95WTBvejIzUHgyMVc2SFpiTzdHS04rZ3UvSDYz?=
 =?utf-8?B?NkhSSUF3RXJqTjJaSWJUUjBRcWZyZUNjcmtkL2hsWENlRUdzenZMd1JwMjk3?=
 =?utf-8?B?dk5LalJIdFNycmI5MEt0ckNENGl3OTNKY0RLMGtWRTQwamNsV1lYdlhRTWRz?=
 =?utf-8?B?TFRoQzJibklhK0FuWHQ2ZjhCRUQ5Uy80dVUvMnlHV2Q3TElGdlBTWTY5WitK?=
 =?utf-8?B?cEkvcE1XQ1dGREJtaGN3SmR6MGxkQXFTVWs2Q0ZRbDNhVUVsTDZOSmhyT2pN?=
 =?utf-8?B?UjhmNWdjOVh4SnRSRlhWZlNSUWRuYW5tSGVwTkJyS01kSVhBMU4yRnorTWxB?=
 =?utf-8?B?eGhaNmltcldlVkZ3bml2ZmtzT3dCcmhJSW5YdDVRS0ZEZWhVaVhlUlBnQmo1?=
 =?utf-8?B?OUtyZ1hweUk3NGFsQ1BGd1J3S1ZuMXdWZEszeGgxSzhWQTFTTlFTNnIyYloz?=
 =?utf-8?B?Q0VKZURwUTlvL3VWTXZrSGI4dVVHRmpIYm5jeThjYlM2LzdxU3RzWENETkZ2?=
 =?utf-8?B?VEpLWS83OFVMY3pjY2JReVN3eDdsMkk0Z1llNTJCbVpXL2tFNVdvWnZZVlRR?=
 =?utf-8?B?UjIvSDA5dDlnZng3WmZDMis0S3hvWThSeFdXbFVaWkIyNWFNeXNwbmRMU2Jh?=
 =?utf-8?B?NXpqcW95QncyZXBiSXlpdXlVWTF3WWZwdXJINkpMcHdvNmRaRDRHMEx5bHlj?=
 =?utf-8?B?SWtjaHBQeDliUlE0V3BzYlhxRjJPcko2MWlWL0pRVU5za1BrME5QN2hDeGFa?=
 =?utf-8?B?bnJtYjVHU0hCcUZJKzRBM213U3NINEpoakVGeEJZWmVuVUt0c2ZJelJjNUhO?=
 =?utf-8?B?Z2J4ZHZYcVRPeG5CMGVzcVZNVjdoMUlPK0NIcUZnTTllVmJJWFBvVTZIRkdU?=
 =?utf-8?B?R1NiN2FEeGZFY2F6WEpzcGV2ZkZOU2lJUnJ1TUsrbEtDeFozVVAyY1M5Ris5?=
 =?utf-8?B?SlVKQlpMZW9vVVFqbFN3bkM2Ni9JWTl5R2pCYUNlODJmU1Vra1V3TUFZNVZS?=
 =?utf-8?B?U00vZC9xV05hZ2xYZjJaSjlIUkVZTm1MMVJCazRjNFQ0bmtNaE5MRkkxN1ZY?=
 =?utf-8?B?MjA3ektCRmwrMEJJZldBUmhrTW5zYlAxaENQZ0ZVS2M0cUF2NllzTHE1VENo?=
 =?utf-8?B?bnlIR2J4MU8zYXdEZmlHVjM3RE9hbDlnTWFZaFl4bXYyZ0VWdzFiZ0lTempm?=
 =?utf-8?B?SWRVY0JlSjdpT2dJZ0ErRkZTdjBVaklJUHQreTBIOW4rak5HVzBFa2ZLaUFF?=
 =?utf-8?B?T24zVWdGelQ4Z3l0UVFIUk1vbGVrd3ZTOVdrQWxqK0k4MzFWMkp1ajkrbFk2?=
 =?utf-8?B?Y3lXMytDd0N1ZGtQWXBNMTN3cENYUi9INithNElmUXdJOE0ySC9QbGlIVjJ5?=
 =?utf-8?B?RDRQYTdPRmQ4YVNTSk5kWUhaT2NGREZiOEdza09pTlhmVGJIcXNsUm1UdEox?=
 =?utf-8?B?ZmpjQkFId21pUVBydUQzUTJ5c0lIOWJJUW0wS3lyU3NGYzJEQVdsUnd3SW91?=
 =?utf-8?B?b0ZTZDkxOVVDQVROSy85cVEzWXVVMG9PWVZyeU5tOGZYYlhONWZGZjQ3K2RP?=
 =?utf-8?Q?y0sxqh/3H63iBLXMts9OAkfaNz5VA3lY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlYOE0vd1R5bkxjWk9OblZNSFZVbC83NXFqaGVCcGtvM3l2OXZxUUVBUFU3?=
 =?utf-8?B?dlArVGJ5SWhRSGRrc0hxM3BYVDd6Tzhud3pjQWVycDRkVXFtL1BFV3NVQWdy?=
 =?utf-8?B?OUo0YnpyQ05HRFVWSjZVTWg3L01BcEljYTBvWjFWRXFTY25VdDg5czU1OElm?=
 =?utf-8?B?MHEvRE56OVJib1VXSkQwRGsyMFY4WWRVb1RvS1FnaGh5WDlBREJVaHRXelFB?=
 =?utf-8?B?OGVlVmhROWFFeG01d2xWMTFuYnlXRnNFa2l3OW1Ia296SDUwVTBkbTFlWjM0?=
 =?utf-8?B?bnNpVzExMWNIcmFXMjF6anBTZVRUTDRlTk03amp2TXRLRjZ5OVJrV2RkR3py?=
 =?utf-8?B?clNnQTFBanUzSzBFbUtVZURKeHpiUURtVWhuTmFYeGdWaFZ4YUFsTXg3VmJX?=
 =?utf-8?B?aTJzKzZmRW1iSTJmN21CY1pTVFZCYWwvWXN1WGNTYmdxcmNXaGxYLy9WSlM3?=
 =?utf-8?B?bDlsWm5oL1EvV2IyYy9vTmVoU0xBMWQxNzFieWN6dkpobk9tVFRTcDVEdi8v?=
 =?utf-8?B?d3JDem9XemwrTEVmZnAzTitXM2Vtd3Jlb3pYeFg1RUlVNGJaU2JqTW1DWlow?=
 =?utf-8?B?bVQveXpDOXYxb21QYXRUaTVta1ZBNU9Oa1loRDhCcDhoUkhPaklBREYzaUFL?=
 =?utf-8?B?R1g0SExZcGdoc0dkc01GQnNzYzgwRDZMNTVVd2ZNVXZZbjJWMnZxTEtvTldN?=
 =?utf-8?B?R2VXbnJVTU52NFo0N09XbU5VQXFGQ3E0Qm1GR2RkbEtBUmNzbFJMZDRHeUtY?=
 =?utf-8?B?aTE3NTlFRFFSNGYyZnEvM25uOXh0RGpCSENwdHQxTzJMQTNndGRoc215VWVH?=
 =?utf-8?B?eHVZenpCcGJyRi8ybGNKRmJjMXRjdzRpcU9nRHV5a3RzWmVEalJhdjBYTXRK?=
 =?utf-8?B?U3F4bnpicjByVG9BaGk2MThhOGlxQktkT3dkOW5PTG10NjFsTkZac3pBZXNs?=
 =?utf-8?B?bmQ3azlJcFQyWDlIbmxmZlpvdURCNDgzeXlDOVA0SGtEdFprajFVejRSM0hM?=
 =?utf-8?B?VHBhMy9HQWRpczdGQUZ1azUrWUNjRVc1NVZWeW14K1dBZ1pCOEM4cEI5OWNj?=
 =?utf-8?B?RWprNXl4OWFHcXBkYVFHY3FRZHJ2bHFxdnFRZy8rOGdUUFpFL3ZRNkowOGhS?=
 =?utf-8?B?THlqVG1id1NYcllTSWNsRlFrMTVwOG11RmNUK280b0JMY3NYMlJlNGVUZEpv?=
 =?utf-8?B?WkdGYjVzeFBydUszbkxiWHlYRFBCYzBzRCtZMDh4ZEM2WTcya3BVeWNoYnZm?=
 =?utf-8?B?YThrQWFOaDlHeEJCSWlZdXdESy9SdDdnWWxhY05sdEUxSmxMemFSeWRDTFY5?=
 =?utf-8?B?ZTFqNVpaOFFjc1VYZ3FRQnBNUUxzK3VkckMraUlTTWt4ck1ocGxGYkgvWmZp?=
 =?utf-8?B?anF2RWdtSE04YVNRVmU5dnY1VHZWcnIvSkgzTGphMkpRWFkzTlJ2TU9sdlo1?=
 =?utf-8?B?NUZoaDIwa2wvVnZrc0hTWC9XQ0gyRFJLYTZQTVhHRXRueGRBY2E2THhDUzNP?=
 =?utf-8?B?RjhMNDBya0lESUZvcTJTRy9iclVYMHRHcFY1cWxiekNuUUVHTm5iTnV6eTRG?=
 =?utf-8?B?a2pLK2lKSDRobzExclVPMTZJc1FaZ1hudUNqZ3VRbVRMRjB1Smc3RHRpMGZt?=
 =?utf-8?B?OGFpSE1JaWYrRUdTaEhxbkVFUi9VQmtiT252Mm1HRjd1a2xNdjludkMyVVN1?=
 =?utf-8?B?WXliL0lKOEQ3ZmZUSXVBOU96WXk0Z1hoUm50VElWZmxIRmdRZjQ2QzFocUhk?=
 =?utf-8?B?bmJXYklRaVhYZ1phODVsR3FLNXowSDRYSjB5MEgxK2RQOENSMXlVWVhNWmFF?=
 =?utf-8?B?Z0xpQ0ZXTksxOHZ3SHRFeEhGM3RxZUF4UkE5ZU9TQXkrVnF1SWM2VkhyNTRm?=
 =?utf-8?B?RkV0SUZoazk5dVd0dWcyMHZtcXNnem5SN29LY1NQT3h4K3pOWm9qS2hXZTda?=
 =?utf-8?B?OVlwZ2NmVmFRNjJoblN5MWw0SmlncExIL3NUa3dBaDZ2VVpES3B1T3dTa1Uy?=
 =?utf-8?B?Y2xTME1QOE13dm1jZG5jcUFPN1c2Rk1zd0prdVM4UC9yejAyWkQ5RkZjU1dy?=
 =?utf-8?B?aVpsWXljUk1uQ1UxSGZKZ3dFMXV6RG9FSmJXQmsrOWhKWWt5aGJnMms4QzYz?=
 =?utf-8?B?VGhuNTBSUmVhZ2s3cXhMdkpHRkN6cGk3WW9kMG54T3dvdzdSRURKT0U5SWl6?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33de4339-b9db-4660-cf1b-08de2837527a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:18:40.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3fPNHk/1oxKTfMcdZJjDTK1T1NO25lObsCarqt+FCurpBkY9pHpaY7I+eFr9IwCj0Fmq/Qvl4bKcRvUjElCJDpQ06YSS/EbLJ87tP3jH74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8469

On 20/11/2025 9:06 am, Roger Pau Monne wrote:
> The IO-APIC RTEs are unconditionally programmed with physical destination
> mode, and hence the field to set in the RTE is always physical_dest.
>
> Remove the mode parameter from SET_DEST() and take the opportunity to
> convert it into a function, there's no need for it to be a macro.
>
> This is a benign fix, because due to the endianness of x86 the start of the
> physical_dest and logical_dest fields on the RTE overlap.

RTEs do not have overlapping fields; it's Xen's abstraction of the
IO-APIC which is buggy.

For starters, Xen's IO_APIC_route_entry still only has a 4-bit
physical_dest field which hasn't been true since the Pentium 4 days. 
This might explain some of the interrupt bugs we see.

~Andrew

