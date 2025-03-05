Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63912A4FA47
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902097.1310039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplBi-0007Ow-U4; Wed, 05 Mar 2025 09:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902097.1310039; Wed, 05 Mar 2025 09:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplBi-0007MO-RN; Wed, 05 Mar 2025 09:37:14 +0000
Received: by outflank-mailman (input) for mailman id 902097;
 Wed, 05 Mar 2025 09:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CLvA=VY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tplBh-0007MI-Gn
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:37:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6946e7ca-f9a5-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:37:11 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 09:37:08 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 09:37:08 +0000
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
X-Inumbo-ID: 6946e7ca-f9a5-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaIgOI5yP2s7mKBnYeDOimgMVIUt3BibZCwadu+fMiD+PIIjmv3ANn/Xl6MUAC4PyVN8D6ZHTwSY9BalC+J7/rzotljd+1pqAdLpmaKwTvHURl+MwB0fNergl8w8xm2HG2axMCEYwdSuqMjMOz8VTB0gM3NGSBwUhDIvInkAXsdNgil42j4SXC/ZaKLqPALQTjD6B6jL9o4Zbmy22vTOzAtCtVEGHeEpBfZB1PMufW9SghQCytWu4oTgzoYLgGz4X6NB/kE131NxFWXnCxWF1jSUVCgryfvKBkV9vHzv36AIa1ceyK64islkELoPcU+rDIOEyxjhLlS7tvgophiSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTub73MzIdYx0mkaTkETVVWEUbyCzXiHGfG7tIIk61s=;
 b=RNiLpH2BLtoLzOqwrvaEPTGgZ+Gz4s+04W+Z9XA26li/1zwilE5gA7uNvk9DiktMbt80r7yrIEgZfE9XuFQe5lwCoreuppuByctwTaX/aDNrz+UynQSbfP7HFdmNs7CYOzBj1SGY3Zxsybv9txg0uczvjc0t6jbDzw9GM6l9FPaSmkC95qRLfG3fVAdNb4U0tmr5Rk7eQqkOZojxSIiVPamBaB7z1zNrx4lfKiWJHMy8CSb4BYMpZRHHRF8uyImPgMU5oZwVl7E3jRR3iJdYfOLM+Kilf55CZhyCqATyV9DUq1Uw0TpKIhr7UBCo0B+Ay+kcf843TowVNSbZsw8G3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTub73MzIdYx0mkaTkETVVWEUbyCzXiHGfG7tIIk61s=;
 b=aEul47oQz1PUu5xcQWwQgDvdcIfa1OyUh+kTG9rPTHFK2ZOvHbM8Z41RT7NK8Icr3F8PzqeNuZpwnUuQM6V2rS75LoW275k8wcdoWBgrEm4rvKqVXYnp7F6ALzJA+5KM+ydARUt7sPYHt8Ce4fip8BZi1cZ1UflGGJAOE82zRxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2904f052-c35c-4fa6-9f1f-917acb72f1ac@amd.com>
Date: Wed, 5 Mar 2025 09:37:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: mpu: Move some of the definitions to
 common file
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
 <20250304175708.2434519-2-ayan.kumar.halder@amd.com>
 <860cfb26-37f6-4007-a66e-5f9075efe87e@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <860cfb26-37f6-4007-a66e-5f9075efe87e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::16) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b55025-d0a5-4c61-7d11-08dd5bc94bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWkySTdKdHljVGhDN1Vsb1hYakJCWDFFbXJDSEFNUUtUemE2bGVXZGVqU0ZX?=
 =?utf-8?B?cWFFMkNyUzhKbTJnK2gwaHBoSkQ5WDR6Y3MrNXg4azdqeGlrSkdlSlJjNDdL?=
 =?utf-8?B?RHB0bGU2ZFJjNjNvaDhwcGI2ZlZVK2pWY1dUYWh2V1ZCd2ZZUDhZWVJQK3dr?=
 =?utf-8?B?WUVpc0ViaXFUbkozcGtNRTZ2dUlLcFVyK0U0d0lQNFJuc2FoVGtYcU9NczQx?=
 =?utf-8?B?enh4aDVrQjFwNDhQMXY3U3QwZVVXVEhTZ2xiSGZQb1Rsb01QOWhLblFrd05j?=
 =?utf-8?B?dGFGWmtndGhjdytraGR5cGp4dDQ2dzNDMEg2bWRMdGVLcnJxYlJzT1hWd043?=
 =?utf-8?B?Nklib3FEcVp2UDJNNmk5US9VNERKNEJpWWFMd2FpUmp3cys2czZWWUtFTGZs?=
 =?utf-8?B?UDRoUExpK2p1Z2g5UHkrYndmbnRJbmRhYWgzbjJDT0p1YmVjcEo4V2wzUHR2?=
 =?utf-8?B?TCttdnllM29ZbHhKb2VqV3paUDF3Z2NSVmhXSVl6amc1SHcxdXZhcWQ2aVQ5?=
 =?utf-8?B?cWFVVGdleENEYjRyN3lhSk94WUtPT25vaDk1M095cDNlMktEWGNoS3Y2eGRP?=
 =?utf-8?B?QjdoSzBrd3lMNWR0TGJBNUIyUE10VGptdHdITU9UMXQ5cnVLbWZza0VNamVh?=
 =?utf-8?B?N3pMdlVOK2VlT0toL1UvenVzaWRHNEFmejJjcDNXOFlDd0RZTytiTUhKY0dC?=
 =?utf-8?B?dy95VG1RakVvSmVyRG1DblhiTVRtQnFEdDZvSlU5YjBZT1h3L2xMYmVuNS94?=
 =?utf-8?B?eHJSMyt6QnRod1c0ZDEzMDQ3WGVDbXlSRXZwRnFXM0pNZnRyVUovbWwwR3dT?=
 =?utf-8?B?YU1VeDJOOVorVGN3dDB1Q1J1MW5SdmVpNndmNWI1YlVxS1VPeTl1YXJnSVgv?=
 =?utf-8?B?bUsyWXJsL1JtUHp2TFFwNGEwN2RZUWtmWkt1dlpWalJPRThPMXhnZmxEcExn?=
 =?utf-8?B?eUpseWhIM2NJVm1pbjM5RnVxN0l1cDVQalh6L1k1dG1uOW9QVC9OQzM4c0FM?=
 =?utf-8?B?RDVoSVh3THVNVUVmS20rUysxa2FNUXpGVUh6aUJzV1V6VDByUWNDZWE0TTBa?=
 =?utf-8?B?K0FkT29VcFRLRkVWcldibGJKMWlxS2dFbUdkeE94Kzdrd3BLcHZ2K20zOVhD?=
 =?utf-8?B?WEtJNVNCajZ0RElWRGJqVDNMM3dxaE5uN3B3NGxoSC9sWFZXd1VGbE5QcTFt?=
 =?utf-8?B?bTMrMXVoNGZRWE5mMWR0RXQzQzArcnJFMGQvTDBETlRHWUJsVzlNYjJ4b3lE?=
 =?utf-8?B?TTRMTVY4K0hiZzdleTZXK1RtODNpbUY0SFhneHhtRlhEVDM3b1ZyQXl5NW8v?=
 =?utf-8?B?ZDNTUlVUYldKOXJmVjlOaEJzcDlPREYxbHpSQmRtMXRDQUVqSWRWSFVYTnhF?=
 =?utf-8?B?d3hNbndkS0RmNTN0SExZbW5BQm1RTjBJa2phZ1M2cERadlRoMTgrSUpsZWhM?=
 =?utf-8?B?cy9SMGhGcm5uM1pjam9jNzJWTXp2L1pwaVVVeG9LbEZYb285SWtkVnVHSTJr?=
 =?utf-8?B?ZmZmK3JXTDBOQitXckZlL2hkZmJJbkl3TEV4aEtCOElpaUtUanhPRktrTERM?=
 =?utf-8?B?c2dDTkZxMXJCQVBrcXF0R0NNUFE2cVlPeXVYdlkvTFI4TTJ2MExHQkF0blY3?=
 =?utf-8?B?R3Z0WUluRS8vOUlhUkNsSUo5cHZERnJwV2orOEcrVFU3cWphQWNoTDBkajFL?=
 =?utf-8?B?RHRibVVuRjZha1haY01FdTNSWWNaZnA4aFdlakYydWFXVDRMaXZtT3ltQUlH?=
 =?utf-8?B?aDNXKy9EWlNWQzZPWlM4YlpYWWlVbld2L2hUN3NLY1pMck4rTmg1enhrejZn?=
 =?utf-8?B?YjZLa29YRkpscFBOV09GRHVxSlQ1YUY4cFJBNG5hNmJocVgvcGc2VmlVdmx0?=
 =?utf-8?Q?32+N3EDiXtbhX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aElyNnZMb3ByYlZ1RjBneXRaamFyMGhwcmNvN3hRcXpCVnVEQTR5TDhMdzhl?=
 =?utf-8?B?ZTVFSC92bnpVUWliQWlXU3BIbDdWYkZma2d6TjB3bkgyMURDUUJJN2tPY3VP?=
 =?utf-8?B?eFpyaENRZElWQnFRWW5mK1JZMnZTa0VpUnliRVg3bFpCaVVuM1FQbzRsMnNo?=
 =?utf-8?B?UjVkVlZQR3JXcUI1em1ZaW9LNDZSUHpjWlg2M21YQWNVRHAyMTNsbkNvcTZu?=
 =?utf-8?B?WlJqNTY0dm42Rkxrcjh3a1g0bHBwV3pBNG9RaXo4MDlMZjh3UzdTZ3BnVEdT?=
 =?utf-8?B?a0hRYXNkdlU2OGlhOUVQRFdPQjJFS1dTYUY4dzA2bDdSWmpFbkQ4L2J0TVMv?=
 =?utf-8?B?NTJTUVExNVEzZ0ZaakEwVnZDTmU1UzQ5Znl3cW05VDJUaithYjdUNzBuRG1W?=
 =?utf-8?B?MkY4K3lXQW1pYmdDMjhvcmVxREdOcER1dFYyWktkSlozTjlmalc4SUxkTkI4?=
 =?utf-8?B?V0tlTFFWUEtpSzJjdTMzMldDYzRRK212Q1lmZ1dGOGttY2ZDNXlFTVM5OGlx?=
 =?utf-8?B?UldKVDUwUVJCWVdGR0NSNFFIQXhNM1JMRzUyWDlpam5hTk1Wbmp3NkE5RDJw?=
 =?utf-8?B?MEx1elZGK0dzV0s5VC8xRVNKZkt1STJBUHUwSmdNdDhybGpPZ2xrRUp4RnpG?=
 =?utf-8?B?TS84eDdwYXNJQjNPTUZGQkV6ekFRL2I1Ymh6TTFHRFpISGlnYUx1cEhWeUxx?=
 =?utf-8?B?RmlNRHRiYlBYRXhIKytWdWdlWkpUS0JnQlB4YUJZK3poNHF0VFFDMnpYRmd5?=
 =?utf-8?B?RXlBak5TdFA1WHh5TDA5dWVuaU1CVkI1NXZmM1lBMko3ZG5ONHlOK2NFWU5z?=
 =?utf-8?B?cE5XWkFZb1ZRbTM4YWVGMFBhQjFvTHZYYTZmU2Roc1FicytXMW0zUXJOd3pI?=
 =?utf-8?B?Vm5HeHJ0K2llTTJyMkw2SHhQaVJFT3U5OWdjcm5QbVA3R2JPN3Z3UDc5elV1?=
 =?utf-8?B?V0ZvTWVmQkRvTUhLRnpxd1N6aU9hZWNxNXFmczNXd1lMTUkyWWFhWW5aUC9E?=
 =?utf-8?B?b0x2MTFMbEdZei9pckdLNzRGbXo2TkU0ZFMvNEw3UWY0cE00VzJjSXJsWTdC?=
 =?utf-8?B?dDRuODFvcitENDM3SDEzTEUxZE9VNUMwVElyYmVTVW14eDVoUVVyUWxOemt4?=
 =?utf-8?B?bDUvYlo5SnJFeE5SV2JMdkkzUmVFNWx0clErR2NkWnpYcXJPdlNpbm8yT2s0?=
 =?utf-8?B?QXlqaFJVdXpTdk9CUTBBV09mWStHcXpsQmxTcHFJd1pQOVRuRzlnRm5HcGUr?=
 =?utf-8?B?ejRyeWxMVlNtaTJ3VjRiQjJTOWpuT1dQWlFrVzVFSEN6RDR3eFk1QVNOSDcv?=
 =?utf-8?B?aEtzZ1BqTFBlMXpsNkdkbDN2M3Z5d0NPN1VwM01QMVl6U3ZabXVHTGVHbEF3?=
 =?utf-8?B?cG9Sdkc0YmluVHRwQllaYzRYQ2VybCtZeE1lcmlhVGk0QnZGSEl6elF2VXFB?=
 =?utf-8?B?eU4yRUV3aG0wT29vbENXUXI5RFovQnBzWE1ieEdpMHdueXdabFBuQ0FTWkpS?=
 =?utf-8?B?ZC9hWERyUGcwVTBrQkxjRnpzSjUwVnBMbUhyOG9JWi8zclMwY1l6MGdLWGN5?=
 =?utf-8?B?SDUzZmxlYVNjWnZaemc3WG5YaXJPR3dISWlROW80dkROeHZNY05oa1F2aVBN?=
 =?utf-8?B?WS9Nam81SkVselJYNVd1MmdDUXBiNmw5UTZoVXJ2cTg5Z0cxK0xLT3V5czhk?=
 =?utf-8?B?OXVhb04yUitObTRzTzh2bXdMcU9Qc1NudmQ4dXN2QzBIRlVlVzIxVU90TERP?=
 =?utf-8?B?VGp5VkVBTlVYTlltRkh1MmllaU93TVN0OXlkL29mVDdqRHR3a05FMitkQzkw?=
 =?utf-8?B?dDF6ZVBCcytGd1dYb1ljRFA3NkRYU0QyYnRvUFlUbjZLQ0F4bllGMVdGMjk1?=
 =?utf-8?B?bXRXdTduTU1OcXFJbGQ3TEhYRVh0dUF1Q0dzVGZMdWt1T2k0alpnOFJvaEJl?=
 =?utf-8?B?eUNmQ244VHEybHZNVk9vUWxwQlowRW8rc0pxWFB1UDRiQWRaOFJPMVhMcVBV?=
 =?utf-8?B?VTJ5bll5UGt0SE1nY2Q3eTZzZGx2VkFvMGdrV0xNRUlKSXhLK0RZZGE1Y2pZ?=
 =?utf-8?B?K29RRGRSQ2FkQTdPT2FudithcDR5VDZoVXBCS1o1THBXaTNZMERWUHF5VVVT?=
 =?utf-8?Q?snhe1eV6lhMCqT+YwqKh34O66?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b55025-d0a5-4c61-7d11-08dd5bc94bf0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:37:08.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sjRGfpqZRU/q6jbAu6A1alyXNao0oG3eWy1341HjYCkQKcTs/Ypl7fn6h1aybr7fIMnoKHVMTWG22IOR5IpgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311

Hi Michal

On 05/03/2025 07:28, Orzel, Michal wrote:
>
> On 04/03/2025 18:57, Ayan Kumar Halder wrote:
>> For AArch32, refer to ARM DDI 0568A.c ID110520.
>> MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
>> Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
>> (HMPUIR).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes from
>>
>> v1 - 1. Add the R-b.
>>
>>   xen/arch/arm/arm64/mpu/head.S              | 2 +-
>>   xen/arch/arm/include/asm/early_printk.h    | 2 +-
>>   xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>   rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>> index e4f2021f45..7b659aa42b 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -3,7 +3,7 @@
>>    * Start-of-day code for an Armv8-R MPU system.
>>    */
>>   
>> -#include <asm/arm64/mpu.h>
>> +#include <asm/mpu.h>
>>   #include <asm/early_printk.h>
> These should be sorted alphabetically
>
>>   
>>   /* Backgroud region enable/disable */
>> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
>> index 219705a8b6..644fd0fcfb 100644
>> --- a/xen/arch/arm/include/asm/early_printk.h
>> +++ b/xen/arch/arm/include/asm/early_printk.h
>> @@ -11,7 +11,7 @@
>>   #define __ARM_EARLY_PRINTK_H__
>>   
>>   #include <xen/page-size.h>
>> -#include <asm/arm64/mpu.h>
>> +#include <asm/mpu.h>
>>   #include <asm/fixmap.h>
> These should be sorted alphabetically
This and ..
>
>>   
>>   #ifdef CONFIG_EARLY_PRINTK
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
>> similarity index 87%
>> rename from xen/arch/arm/include/asm/arm64/mpu.h
>> rename to xen/arch/arm/include/asm/mpu.h
>> index f8a029f1a1..40fa6eaaca 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/mpu.h
>> @@ -3,8 +3,8 @@
>>    * mpu.h: Arm Memory Protection Unit definitions.
>>    */
>>   
>> -#ifndef __ARM64_MPU_H__
>> -#define __ARM64_MPU_H__
>> +#ifndef __ARM_MPU_H__
>> +#define __ARM_MPU_H__
>>   
>>   #define MPU_REGION_SHIFT  6
>>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>> @@ -13,7 +13,7 @@
>>   #define NUM_MPU_REGIONS_SHIFT   8
>>   #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>> -#endif /* __ARM64_MPU_H__ */
>> +#endif /* __ARM_MPU_H__ */
> Would you mind adding extra line between last definition and #endif?

this, can you fix them on commit, please ? Or do you want me to send a v3.

I am fine either way.

>
> With that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
- Ayan
>
> ~Michal
>

