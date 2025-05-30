Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F2FAC8DE8
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000921.1381098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKz33-0000tx-Lj; Fri, 30 May 2025 12:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000921.1381098; Fri, 30 May 2025 12:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKz33-0000rl-J7; Fri, 30 May 2025 12:41:21 +0000
Received: by outflank-mailman (input) for mailman id 1000921;
 Fri, 30 May 2025 12:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvem=YO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uKz32-0000rf-MI
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:41:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2009::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d14176c-3d53-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:41:11 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 12:41:06 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 12:41:06 +0000
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
X-Inumbo-ID: 5d14176c-3d53-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4vyaBGoydFjwXvbyt1MU3L9/EiNk3CRuvudvvew2PZWubMjyoCeykiC7g6lEXKH7TZYEKWaft+eNq7QJ61FodVpf09BBuBDlSor1q1kYR/focL+SjEZVQs7mnzbOhNVeltmnVwatSZMuEb6DWiTah6T5CP41gob9QssFqpfCu4lRLl6FtfCfWSXUzQ2gfIWIJWomApjt1gvliI2IPLCfNeeiV5s5AttHRBQqnOos1Rcckittvg+E81zV323l+wLSvgWGh+MkxG4affAwOPLR1YEu+ejnUQbbw2GF8ud0ojgGH6FQ4ZYUyj2f6XrMCx0aEhYEg0wI/v+q8EWFYAv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOjWkpKyeQG28wm9hNPROs5/ISGe6hlQtZIZIb3e0vA=;
 b=QUMYt7i2lv8glcNrOC4Pv+osOSgF/yZpmuNao3d9q9IJlV+0/vpAO7E5c7hiCDxmEoIP33jcfltG1Z5rSYmWiclf2LrHDUkekKZ8O6erKkB5IKQS2HU1v7vka9Z/Pq+wn0jl3VEFV2yGamQ2CjE3m1Uq/InoozF6fUk6wZDqjLaNVuQ0AatF04BibDYEPwESVIaY3THYl9+c2Ls2kdJ1c1KWmol6aWTx/WPlAKfv3dh4zZgndkx1Z8svFh7kkdiHVJ0wQpSKWTYtdK3kS2z6dT2AsHX4+R3eaw8x12MPAfK212pMOY1Oxvc4N7aLBkKPkwa93qTnLGyZXA8TIr4ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOjWkpKyeQG28wm9hNPROs5/ISGe6hlQtZIZIb3e0vA=;
 b=x7WayGYOcB8r1HRlD3DcMmGGQFXZG4aXKY7mhEE0Phq/XwluEmiT5TxwJqftGRSy7+gj2AG94BnA8f7qC5dw4edAt9yHUTvj58laDAgdPbCC8IOTNIU9q8/sJ29C49NqSW9b1BivctXCHExyHyTgr+pm4eFcmxAWLIitMsChoRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <20505776-da44-4fab-bcb5-7114157d0bb0@amd.com>
Date: Fri, 30 May 2025 14:41:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] licence: Add missing SPDX line to bootfdt.h
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-2-agarciav@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250530120242.39398-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8946a3-1070-4f60-8675-08dd9f773f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWNnOVJTa1RQd09TZ0QyRDRGemV3bkVXM2ZYbTZjM2Z6QWF3Uy9VTWhsTmFE?=
 =?utf-8?B?V3JqR25QZ0xHSGM1a0xZZWd3bVZOQXl3bENxRTZVbm5rUVlFVlVBaXNhem1i?=
 =?utf-8?B?N3BOOVdUQXdLVzgzYkE0S1BOTXNqVlJGSEFybVpWS1ErNk9PM21mN3FOVlZs?=
 =?utf-8?B?MVcxZFFJb09hbFhyVEFrdE5oNVJJMmcrMno1VzdMbC9sZS9VeWp0UEpDOUt2?=
 =?utf-8?B?WVhuOHE5TGpPWHlhZmQ5Yzg5d25sbmUxUU5Udk1IbGdoSjkrbmhGODAzakt0?=
 =?utf-8?B?L29pcGpLOG04Z01oZnRUc1RMU0RyRDUyL3VkSWg2NnVWMUpycCtXV052Y0da?=
 =?utf-8?B?bkkyWlcwT2RzWVR6YWdYZGdLQTVhSnozbUxLc0c2MWg1UDVoaXZnb0lPblJQ?=
 =?utf-8?B?ZHRuM1hidDkvWXZ0OEV6Z2FyL24vaStxenM3RnZnMks5NG5Ya3dFQWZ3aHBV?=
 =?utf-8?B?MGgxZWprTTQydFd1S1FEQXorSzdiOFo3VHIzMk9pSWlBS1ZXMzA3K0o3U0I3?=
 =?utf-8?B?QWJNTy9XdGJhbk03c1JYK2F6SHI5K2xERzJLaWlLcUl1MWNKclhpZGE5aXli?=
 =?utf-8?B?Z24zelE2YWdad1FIVTh2eEdsc0FtS0ZIZ1VqY3R4Z1QzZmJFT0pQTWVrd1V0?=
 =?utf-8?B?dFc0S2FweWNjODhYYjMwSStIS2lJMmVTQ1U4dnJzZFgreGtPM3ZEZ2plcmEw?=
 =?utf-8?B?M1cwalpzU1IzdlFweW04RGZpZCtGTjdkS0V3VXBZdFhZZ2ZhVXRKMy95UTd2?=
 =?utf-8?B?TmtsbEdILzVjMTNoM29HWEhZeWJ3Zk1lalJuRFpaeDNjVlp0blkrSWxoYUh0?=
 =?utf-8?B?Q3grQkJSU0JCcjJqd1U1emdLOFRGazY0Vzg4bnJtb2xoSkFIMG1KR2N1RldG?=
 =?utf-8?B?L3h2aHBleFBRYU9OT3ZKNUxsanZ0cVkzRVYxVlBLLzVla0xFWWxNQUFTbjhu?=
 =?utf-8?B?WmFrcUE1ODRWdmdMcGhBazRycGZ4eWNaY3U2SksyejZmdktvcC9xZzcxWkw1?=
 =?utf-8?B?REVXNzB1ZXlZUGV1NmRCSC9kdllzbWFwREhkaExWaW16TXNWcHVpclJzMjR5?=
 =?utf-8?B?TXZvNXlUOWFiUjZURjFjZFJzdERNWEJPZE9xbXFNYWhQVlVUTVdXaWlZVDAr?=
 =?utf-8?B?a0Fvc2l2ZDhVUFl0Z1ZrZTVGK1BZblp2aUNDY2h2REhBZ05ZQXNLWlFGcnJQ?=
 =?utf-8?B?QzVBbnNGM2lib2NzM05QQVZscWJubVpiUTd5Q3BTazR3RU9IT0N3MHBoRVNG?=
 =?utf-8?B?eVFLaldzYXN0UTVEMUsvOUJvdWNINnpQZW42azdIWG1oazhZMDdtK2FyVW83?=
 =?utf-8?B?bVRtaEoyZEswU1podG9nU2licWFudnpJVjRMaXg4ME9JaUplQU11dmR3ZTNP?=
 =?utf-8?B?QkVKeEhFVWtFSitPVWdRU2ZJNEJVNktLK0h6TklvNVNvQmx0Q09KYkRwWnF3?=
 =?utf-8?B?KzhmS1c2QXpGZ3c0clRtRUYvczF6aTZtMVp4VEZxV1VyN05FOFVkOHdibys1?=
 =?utf-8?B?d3h5MERiWUV3MHM0VWQ4WHVWcjg2aExBSHdPVkFrcVZUUEFxektZTnhoSjVM?=
 =?utf-8?B?Vm03RERoNVBkVDFXRHhCdHNRVk9wTElsRGROQ3dBdFRWMjZ1SHdMVllGT00y?=
 =?utf-8?B?bGMzSS9RazlxODJwd2ZSakV4MXlxNTBnZFF1WnF0UTJrSmw2Qm91c2s4bVZK?=
 =?utf-8?B?MitQN21oVGt6OHloZTBxa3pnV3lQb252UUw0NS8rc0tXL0VhY1hYK0dUcFRt?=
 =?utf-8?B?R2ZhYjFsa2p5Y2JST0U2K21vRDYxOGRhaWN2OVNnaW5LMzhVRHluOWZWd1ZO?=
 =?utf-8?B?N3ZleUVJWXB6b0FJWVVJcGtIWmtzSXIrWWlSbVI3TmVVY0M5RjFSY3cwSm16?=
 =?utf-8?B?QTBhZVpkVmRleEJTTlB4MUVKZUR3N3Z0ZGphaHlQQXgweXlkanltekJGUytD?=
 =?utf-8?Q?Xgp1YF0q0oM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhGVk9MK2MzZWdVRmRoWTU3TmFqVXkvUlRCSjRER3dodHNwbEVva1h3UG5i?=
 =?utf-8?B?WnpPUFEvT2dDOWFQQWNZNDBTWEN3OWFUZVNSemdRTkh4ek5VNFFuQ2VSQXJ2?=
 =?utf-8?B?ZEJYL0JDOVBXSVNnWml3MEk4L2xQMEFKSlZqUVlnMElQKzZXMTNpY2JWODhR?=
 =?utf-8?B?RG9iNi9tQmhzVmEreWRFbGdqTEs3SzNjY2lmSG5hTmlYU2VDR0JjYnF3MXBC?=
 =?utf-8?B?Zis0Z2MxM1dGQThRWUdld1ArK2lFSVZUK21RQlVBcGoxRWZDT2psNm43ellm?=
 =?utf-8?B?cE9DOGJRYnpnWUVYMkN1MmExMDdhSmpJdlVWcVZqVjBjcnQ0aW9ESEFjS2VS?=
 =?utf-8?B?bU5MRXJYeTZQTFQwSnRWY2Y3dk1VRDJUU2l6MHpPMStXTVZUWDU2MVJmaUFH?=
 =?utf-8?B?S21xd3IrNnpyZXFOVXNpK0w1Q2NRcmp6MFhwSGpaOUw4bGxidnVleW03VmFw?=
 =?utf-8?B?Yk9qS0pYcncvdHVUWGJ1YUFsZWtiZyt1OHpkZ2NyQ2Fva3kzc2EzbmhvYmRN?=
 =?utf-8?B?d0pIbXhCQXhSb08wUGVmK0daaml5UzRlc3hScFFVUnhQL242ZjA5dk81T1Vn?=
 =?utf-8?B?dnJVZWJXck5oWjF4RWx1QVpZSitZdHJwTld5MjNMMzFYN0I5aVNuZjVWazJX?=
 =?utf-8?B?ejBhVytZUTBOWVVnQ1ZMUVlwa0xzMHBONVJZVTc4U3FOeVdyK2hRaVRsajBl?=
 =?utf-8?B?MERyOWxXbEczV0k5NzNrL3VWcE55WW00OTc0bmdRT2dzWWluVmF6bU9QTzlz?=
 =?utf-8?B?TVp6OXZkWHpYUDNaK1l1ZUY4WjZoMEtVNzhLYnEyeVJVekQzeVlGbkV4NmZY?=
 =?utf-8?B?YzI4SVhPdHdwUGlrUTQwT3hyRjk4M29pcjRxWTg4cWQ0YlFEL25haUVjN3pt?=
 =?utf-8?B?Tkl3MDlQWkozR0cwM0l3VmlYVFhtRjBWcGE1bUtsOFgwbGFNTWR1dGdCZG02?=
 =?utf-8?B?N1NBakNkc2d5Z0s3YWpIbmNFVXpBM3JUdjJCaWtZcmlzWWowNEhZR1hITjVZ?=
 =?utf-8?B?bWNHaVhUT1lEUWJJTEQweVlGZ3l0anAyUXFWMno0aklIQ1Y4Wmd3Rnl1Ungr?=
 =?utf-8?B?U2F6T0wwdHN5QXRaNEgxRGFkM2xFUGdjTnRoeDNOaUNEb01XcTlyaXdBSnlY?=
 =?utf-8?B?bmhFYVYxWWVGSGZEQXA0WVNvaDd5MGdKdDU3T0FlWDZZZ1BqNm4vUnNFWU1x?=
 =?utf-8?B?dk45N0xKOFVLREVyWGZtc01MR0ZReW10VnpHMEdXM3Z2bEZQWC9IbmlhN3E4?=
 =?utf-8?B?RWV4a2JZdmwrSTBrYTlRSzVZcjlkS2Fwd2tXcjBycG15RnF2UFdvVm1XR2xC?=
 =?utf-8?B?a2RoZjFOSm9qeEJLTWZrWGdBS3h2K2VvdjlVZmhVaXJjdUtmQk1KU3lNZnFk?=
 =?utf-8?B?djFhSERDUEIvMHNKTDVKNUU2RHJvbW40VHM3SEFUdk9XTkxWWEt2ZVpHdmhQ?=
 =?utf-8?B?UEcyY0xTV0RaVFJoWTVycEtPVzdBRFQxS1cva1RjV24yekFsYkNncTErVndU?=
 =?utf-8?B?WEN6NFFVRjRybHpNYXRkRWJSdE1iRU96YS9aWkRINnhrdkpsR210SEVlbWFO?=
 =?utf-8?B?YmE5azlna09BOXFta2hxSlZoSVB3U3VOZUFWbWxLTFkxUHlWN2JkQWRrSGpL?=
 =?utf-8?B?UGJFa1B4eXZocXBwc1Z1b2U3SjJSbDNGcXpLWUkvZ3JDOVVMOEFCOVU3R2U3?=
 =?utf-8?B?VXlNNnUvbXJBVGtsS21DQlZuYXkxUVBOeXhrcXNhd3hVMytFUDJScEd4VHJG?=
 =?utf-8?B?bGVEeXBBVEUxY0hsSGFTODMxanprYkFZSUlEb0NxV09yTVNTK3EyRTRTZUs3?=
 =?utf-8?B?c09sZld5WEVsTEZ0ZUFjR2F6ak5ubkhna3diLzI0WGRpTTBIQWc1MXJkT3A1?=
 =?utf-8?B?T3AvcmlySEFYOUpSK1FsdGdqMWZMMGhxZ3cvdzFiWGRSQ2RVMlI1TUFFVUF2?=
 =?utf-8?B?dFVlWU9jcVpNZ2taQ0R6cEp2UUc5NlhRcjVsTTFWU2FQNTI1eHRZOUFTSzlo?=
 =?utf-8?B?aHl5TTlFL1gvU0J4UEhkSUp1V2Q5aHQ3WnpWZEJOdHl6U0w3K0tJWE15c0Ns?=
 =?utf-8?B?YldONXMzdE5PVlRURzU1aG85eG9JWGhGTldOZ0p1b3RHdlJxTWs4SlJxMC9D?=
 =?utf-8?Q?oa3M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8946a3-1070-4f60-8675-08dd9f773f11
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:41:06.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7T7yWUt4K9g7rbFyVnE13LzG/WLeDjh8Hdc6nkg6CXh2WK408i81IBaLpgY0Q4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194



On 30/05/2025 14:02, Alejandro Vallejo wrote:
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/include/xen/bootfdt.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 80a90e53c0..847f019559 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef XEN_BOOTFDT_H
>  #define XEN_BOOTFDT_H
>  

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


