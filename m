Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056CA38473
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890440.1299559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk14b-0006pn-6s; Mon, 17 Feb 2025 13:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890440.1299559; Mon, 17 Feb 2025 13:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk14b-0006n4-2q; Mon, 17 Feb 2025 13:22:09 +0000
Received: by outflank-mailman (input) for mailman id 890440;
 Mon, 17 Feb 2025 13:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRFu=VI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tk14Z-0006mv-4e
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:22:07 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2408::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf1b533-ed32-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 14:22:04 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB7184.namprd12.prod.outlook.com (2603:10b6:510:227::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 13:22:00 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 13:22:00 +0000
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
X-Inumbo-ID: 2cf1b533-ed32-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4q1ig1wAmZx8UA0MS3+8BB5cFXdNt2T+VkZCcUncrql0i6v1BroxBP5WqrxTRDRQv8lDsJYmebHAfDJ04fBIyy9tuQEub86kbCskiERGlZKaZZ+J7ypovvsOQ9ELUldCJ94cMEFzvwEgBWR1MTK6OajHGrBVn5vCkLX7hJyfrsM5e+2ugeFAqssMIwjpEnMn09/esHz4rDOUn3hwhm4thxRL+IetlCVBMvPf5mbrmNLh6yAWfNPiG73OF1wZWiKSL4PYe+7T6SlLHxEvmM5bxDA0J2wwocAYrr9qpMEYofX1XSlpcrI4vjpMz5E6xziEepJg3u9tOwvcglJMZSX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNq4lFAyiYKKEycovE7j1JlmKFhfBQahUGOYdbrvq74=;
 b=B4irf6BNqxbrWF8SFZrjVbJRST+/1rUrOQEZ0AdeJ+Cx8bSr61AGhPPZe/KgDm/rv/9Dy2ra/g9LDHHBsHMKT8SsYgB0eEN+vVM/zwAwf4btRvN2k+wzBQ3n6/QZVlr234vj1Q7xRh6ZeyqhUFb4SrmQIahCKXODk4ZT5KpmeeHnRNSlLHKjTq/4ZOVf5qGzVSVUdNJIrI2A81qvkdoboEiyyfvXiTUbKIY8aCnZpvRDIP37/Jn6FkiepGe+Z23yiffvUzU/X/0NXLTZTuhfXxHoLngMo2moo8Yq/ClAWx5HxdeX0jK8HkrarIu4KjODLVgGdRTjtfITHVP5GM+GGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNq4lFAyiYKKEycovE7j1JlmKFhfBQahUGOYdbrvq74=;
 b=Mr/TikXjCag3I8WF3IEmWgPv/2/0c6UxhFzrABd7wRfMxdluOI3cwrpNzi7QBRgDXhdnHjOBZSlbu1shWSGUMKcdhvV5Db1uwSDccO39BfqgLOaLyNT/kQSAXei/CRdtwSJ7hF2gQKVoBQB13vCkSXyLw41pEauTXKu4neTB50o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <74ed67a9-1ac4-4df0-b71b-19903d418f91@amd.com>
Date: Mon, 17 Feb 2025 14:21:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-3-luca.fancellu@arm.com>
 <0ac6b968-c298-462e-a190-65cc3e74aa01@amd.com>
 <4EF0BB2A-1C67-4878-8027-7246B3483902@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4EF0BB2A-1C67-4878-8027-7246B3483902@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 460b837b-0b78-4e09-a69d-08dd4f560f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWxubmx5ekt6dERjTWI4bmdKWThTQ3NpZmc3RkNZcU1MSlJ6NnIvYkJYKy96?=
 =?utf-8?B?L3hDVG5lM3pHTXlhWHVEem5XOVByK0RMZzg2MWNlYUY0TzRocHBNUUJGSis0?=
 =?utf-8?B?Zkk2ZTlJcW4vUC9jTk9ISHlXelc5Sk4zTDZvU0luRHBTN3NXKzRJQ1Fwa05E?=
 =?utf-8?B?SkpPaVR5MExvSjg2SVBJUnRnaW4vaENCYjVYcEh3Rzd2cnRnQk5Wb0lyTWRV?=
 =?utf-8?B?aG5PRmo3aWxaa1o3c0dGT3NJRGdDRCsrWmxKOWo4cS9NZDZhdEdiRUlycks3?=
 =?utf-8?B?dnd6RVN6b2wyS2RjcDNjV2tCR0Z3a0E1Z0d2dGpzdmZndUxubFRqM2F1NWZh?=
 =?utf-8?B?QkIxNGZVREd3NDE3bS9tQU15cVFTMkl6aVYrQ0xtME9jazdiYzB6Q0dPeEJH?=
 =?utf-8?B?eEQzcXVTbVAzeU9aeHRYTlNoVXRiT0piS2g1MXUxMFBreVczdkErc1hHR3Zh?=
 =?utf-8?B?N2RtWEllaE9BTzdRbGl3aWNuaTRUblJvZ0hGZmFhQVNSRFJVOWZqejlqSFMx?=
 =?utf-8?B?bFNpajdiTzE0KzdCcjFvVXQ3UWhPaTFTSVBLaWorejJiZkRqSkFPZERkbmRj?=
 =?utf-8?B?L3M0WmRBQ3VBWWtmR2JVOHJ0dWtqdnliRWlLWVFSc3k2WTFqOWFMS3RUT0Yr?=
 =?utf-8?B?bFh6ZWhaK2I5dWxrVEJQa3ZxckpnWnVTaFYwTzhGcVF6dTJjaWV4amVYYlV0?=
 =?utf-8?B?WFVWS2ZIcy9xTnhjVWRyRlI0b1pNcmNlYmJwV0VKV2IrMU1XOUxucE5YTk5M?=
 =?utf-8?B?WDVnRVVmQ3FORmIzU2dsdXZoY0pXNG5lRk9zcHV5NStXeGN3Y1grdGljN2lW?=
 =?utf-8?B?eEIwL21oUGVQR0daK0hxK2dDTHZhbXV5YnVUQTJGS2lJNlkydGNMazh2NmM1?=
 =?utf-8?B?T3dhbEdHSTR5MG15M0RZM0xjNXQ5RjkvT3AwQ2Y0RHNqYldXSG1vc0k3NG9D?=
 =?utf-8?B?MXRZTS9JMVJ6dFFhNzlsOHhYM01oTXlERVNsZzlrUWxENVB0eXYzMHZPVVIx?=
 =?utf-8?B?emFzTmJ5aThVVWZnWHZiSmZ1ZU5hVVVUYjJNMnprK0dTb0h0NTE2MDI3VFR4?=
 =?utf-8?B?aGR2VGxUS3l3WXN4SDVWdUJWSE9IK1JRQjl5M0s3MUZqWm1iM293NXd4aFFV?=
 =?utf-8?B?aWhsR2V6UWxtbzNFTHFNSm1IekhsM080MzVMcWh6dTRUMnRyMHZ1VndGWGpX?=
 =?utf-8?B?ZmdwRC9rV3B5blovTmJFR09WdHNEWEQ1RGNyMlBnbXI4MXlHenk1aTVMYis5?=
 =?utf-8?B?V09aN1JlRCtnUkhGbU55eXArZjFOdHlUbmVTa1VIZ0NOVVVjOTVhUG1SamxX?=
 =?utf-8?B?VTFISzVYaWxGMXpmQTA4U3FRNGxDUlJKQkJTRmRZcEV1c2hpSmdjSHA1R0V4?=
 =?utf-8?B?Y25CeTRseW1Vc2ZNK1lCTTl2Um90a1dpRlFRSUxwcW5Hdk51SkpaaUdkUEow?=
 =?utf-8?B?Nm1hQnJpY1UyOWpuaytDTEdCVFU3K2JvbzJIV0R3azJJM01nTys1OWFQOWxD?=
 =?utf-8?B?NnV3bzY4NXVXU1hpNkVpV0VFUy9CZGhIUVA3b09OcndSOERrYnlzelN5bTha?=
 =?utf-8?B?YVY3alVHTjZLSHhZTlBHRnRpejA4ZElraUY3S1pOQ1ovdWRQQVk3U1JyNm1h?=
 =?utf-8?B?SUs1QWVzNGFzT3RZankycll3bHhzeEs3ZmZNdzg1RXVkZHdVZEF2TFBEMlRr?=
 =?utf-8?B?WkpnY1JCKzRRRFg0NlNvYXV5M20yb0FIelMzMmUwTWF5Y1d4cTRWelBYUXBX?=
 =?utf-8?B?enQzdzUrWTVJTTdEZCswRjl5cGlEQXhJYkk2ZFZQcDA5OFBHb2pYSENCVnls?=
 =?utf-8?B?TS9lSXJXMWZGVW1KdUVyU2hpSTJ6SUFsZHVyL1JQVkJWbmdFL3JFbDNlS25T?=
 =?utf-8?Q?fMekVMtk2zXL2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXlqVUdITDM2UncrbEY4V1pjb1FkRTdPS09aWGZPUzZkdWpBcmJjMWo0MUVi?=
 =?utf-8?B?T0tBNTN3dGFoRlFUTUtvMXQ0L0pSQUk4QStVTVVFT1hnYjg5SE81R21zcmdJ?=
 =?utf-8?B?Nkp3Zk5lZmxNczV6SEF1eXFydzFGY2dvUk42TW1hM3NDMlFPTW1YbFZyQzIw?=
 =?utf-8?B?SDA1RVRGZ1U3WFdxYlU4Q1NnK21OT2RXYWxaS1FjOUhOQVp4Q3BxeGdvZXVO?=
 =?utf-8?B?c3psc0t4RXhtN3VVZ1NUSmNVMzFaK3k2aVZqSVlDd3FSck0vZ3RDeHFPRXJS?=
 =?utf-8?B?MHZoRUFRY1dFTWZyVkxNMDZ3amhqMzBEVWt2Qy9sM3BWbGZscDR6ZlhGQ2lJ?=
 =?utf-8?B?b2xMbytwZFJMQWx0OHJzWmg2cng3QVFXdldlOThXb0M1ajdUWXdJY1YzZHkw?=
 =?utf-8?B?WmhWZTdNNFgxTzBDekhQRkZqMWJpalNQNUJhOGdLaUFPei9KU0tYZjAveC8w?=
 =?utf-8?B?dDZtN2JnZEtkbmFDSnd3VkVxZFgrMWxrZVdWSkpSUS9HdU85ZFNMYVFlVWlY?=
 =?utf-8?B?c2JoaUxITHJScFFmSTN6TUs0a0t1cGRaRm85OCtFbFVEZDF2VDMyTTVSTG5C?=
 =?utf-8?B?QVo5czhEd2ZVb0x0dTdQV0dZOHV5ektRY0dVMTF1UUpManJMTzNXSGJxei9l?=
 =?utf-8?B?dU1oVzNoYlU2QzExSGVUbWVELzlWOXdFdCtsaVhrYjhraFI0Zmd2eGIvalpK?=
 =?utf-8?B?UFpML2M3dThMYVloVktKQ3ovMG8wSEQ1cXlRd0FwWDlaT3RtN04rajZqZjM5?=
 =?utf-8?B?akZOejcraHlOWmtTVlNCRmFUZkxHYkYrZHhtR3Budjh3bVUvMmgwL3cxRXNy?=
 =?utf-8?B?MHM4c2pvTnRmV2pCcW8vYnErUGpSSUJnTndyM0FoZk9iMHRsU3hneUZEVE5K?=
 =?utf-8?B?bGRFLzlCQzFsQ3IwMGx3c00zSlRjekhIRTJyNnZueWZYSXQ4TzcvbkNtN3B6?=
 =?utf-8?B?ZmxGelVNcW95K24xVE41b001ajgzc05IMzlaZ0xMVVhrUXFpcXFTam1NejlK?=
 =?utf-8?B?QXdXVGhScU9MV1JFVWRPdVNFVHR5OHFkYVVqQ0NMQTJ6anJWeTBKOGRrSWFy?=
 =?utf-8?B?NHYwTVF1aEpJZUVxK0tOSGhQZEdNNjhwNmtSQklEbG0vZjRLUUVPVVZ1emwy?=
 =?utf-8?B?ZERGYzV4a0ZBRFE5QzBXQnJId1REWEtmM0g5ZkRvazEyMnp5U1RQZDNud2tR?=
 =?utf-8?B?eTFWNGQ1a2E0RkovZmxYTTBJMHVYcGhRbnpFalcyd09nbmVWTXVUdGJzc296?=
 =?utf-8?B?R3ZMWGE4a0hIMUtLUWErOHNyNW5VeWphdnF3bStYVUVzTDNLV1k1a25ETzhU?=
 =?utf-8?B?N3psUnN1OE1SbXZ0R2JPbkNXK1lEdE00bG1uSDdJNzg3NktWb2xoUFBEcDRk?=
 =?utf-8?B?TXRnYkZ6YUdmeFJNOVFRMEJJd3A5ODJRT3pSK21HclNUaFM3V0pqK21rRmtB?=
 =?utf-8?B?d3NKR3dFclY4ZlJPMEFiY0Q2WUhKMFhzbW13dXhDZHVNVFZxYjZYczU3UFBR?=
 =?utf-8?B?SVBFSnNaaUtrTGdUenZVQ1dQVDJtL0xvS0lTdkhPMWtrRXV0TXlsRUtIejlu?=
 =?utf-8?B?YW1EZWkyTWt0S1FJSGhOTGNDZlQ0aGhYZWlRUXR6ekxubnFraS9ENzB6Z3Fi?=
 =?utf-8?B?QWc1aUFQRDdaVEhLN3c0K0kzOWJkczQ1THl3dU9SclhuZHJqK3NJQjdKemRk?=
 =?utf-8?B?czBpRHdDaDQ5NW84S2dpWkNIbEVNbW92OG1ZdmE2emFCZ3RFNkxOUUphYTVI?=
 =?utf-8?B?dHdFOUI3amx5NXJVM2RGTWtCc2ZjcGtoZlNEYWdHajVsUFRZUHZzazJhaEdr?=
 =?utf-8?B?NGVDN1BiamtTWUpJVGovbjFpblh4V3RkNlpTTUhRaUJ2SmhjejRPR1kyOEk1?=
 =?utf-8?B?Q2FMZmtOR2t4RnRqUmM4YlM3eFB2SmdrSlp1dmIrYjNzN3JGdWV0MFVlVlYy?=
 =?utf-8?B?eFpXcEUzSkpiWkpPdEVGcC9obTFHK24rVU9LT1c3Sm11b2R6M1FsM2QrbTZu?=
 =?utf-8?B?RXVleVYvN20vbXAyRXUrMUkyV3orazFZbGhRYis1VTAzMmkyd0x5Zks0S2ts?=
 =?utf-8?B?YmpUOXBESGlBeEtvdFRTMS9MRXJXTENQQVM2RXVtUnRqLzVpRGpCNWJBRm0w?=
 =?utf-8?Q?EUCmvcdcrkU8UpjcSUkTLNqh+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460b837b-0b78-4e09-a69d-08dd4f560f9a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 13:22:00.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OrtGZ+sJhAbpWV1RMIxs0aWRjcMnwO/kEWfA0UjHmGcirAwcgknM6Gfc/uXPvno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7184



On 17/02/2025 14:15, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 17 Feb 2025, at 12:55, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 17/02/2025 11:27, Luca Fancellu wrote:
>>>
>>>
>>> LLC coloring can be used only on MMU system, move the code
>>> that selects it from ARM_64 to MMU and add the ARM_64
>>> dependency.
>>>
>>> While there, add a clarification comment in the startup
>>> code related to the LLC coloring, because boot_fdt_info()
>>> is required to be called before llc_coloring_init(), because
>>> it parses the memory banks from the DT, but to discover that
>>> the developer needs to dig into the function.
>> Well, if at all such requirement would better be expressed using ASSERT in
>> get_xen_paddr().
> 
> Ok, you mean asserting that mem ( bootinfo_get_mem() ) is not empty?
> 
>> The reason is ...
>>
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v2 changes:
>>> - dropped part of the v1 code, now this one is simpler, I will
>>>   discuss better how to design a common boot flow for MPU and
>>>   implement on another patch.
>>>
>>> ---
>>> ---
>>> xen/arch/arm/Kconfig | 2 +-
>>> xen/arch/arm/setup.c | 1 +
>>> 2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index a26d3e11827c..ffdff1f0a36c 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -8,7 +8,6 @@ config ARM_64
>>>        depends on !ARM_32
>>>        select 64BIT
>>>        select HAS_FAST_MULTIPLY
>>> -       select HAS_LLC_COLORING if !NUMA
>>>
>>> config ARM
>>>        def_bool y
>>> @@ -76,6 +75,7 @@ choice
>>>
>>> config MMU
>>>        bool "MMU"
>>> +       select HAS_LLC_COLORING if !NUMA && ARM_64
>>>        select HAS_PMAP
>>>        select HAS_VMAP
>>>        select HAS_PASSTHROUGH
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index c1f2d1b89d43..91fa579e73e5 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -328,6 +328,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>>>                              (paddr_t)(uintptr_t)(_end - _start), false);
>>>     BUG_ON(!xen_bootmodule);
>>>
>>> +    /* This parses memory banks needed for LLC coloring */
>> this comment is confusing. It reads as if boot_fdt_info was here only for LLC
>> coloring. Moreover, if you add such comment here, why not adding a comment above
>> boot_fdt_cmdline and cmdline_parse which are hard dependency for LLC coloring
>> code to read LLC cmdline options parsed by llc_coloring_init?
> 
> Yeah I get your point, do you think we should just go with the assert or maybe add a comment
> on top of llc_coloring_init() to say it needs to be called after boot_fdt_info and boot_fdt_cmdline
> in order to work? Also because the assert in get_xen_paddr (llc-coloring.c) won’t be compiled on
> a setup not having cache coloring
TBH I would not do anything. I assume such comment would target developers. Then
why are we special casing LLC coloring and not for example boot_fdt_cmdline that
also needs to be called after boot_fdt_info to parse legacy location for
cmdline? There are dozens of examples in start_xen where we rely on a specific
order and developer always needs to check if rearranging is possible. Adding a
single comment for LLC would not improve the situation and would just result in
inconsistency leading to confusion. That's why I would only consider adding an
ASSERT but in this case, there are more things than memory bank that LLC init
relies on.

~Michal


