Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C6ACEB0E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 09:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006360.1385540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN5HC-0006Cu-PX; Thu, 05 Jun 2025 07:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006360.1385540; Thu, 05 Jun 2025 07:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN5HC-0006Ak-Mj; Thu, 05 Jun 2025 07:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1006360;
 Thu, 05 Jun 2025 07:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Otu/=YU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uN5HA-000686-Ds
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 07:44:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:200a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea57e49e-41e0-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 09:44:32 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 07:44:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 07:44:28 +0000
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
X-Inumbo-ID: ea57e49e-41e0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zaj10gY9FbMEaT2kI3TgD3zqvdtuzWnrZxq+2+D7aWbxZ2o+fGMZecPUvqunOwOXayfnsdwqjIcPgjN+NKESpXSRyLSbOU5gilHRWI80GZ8S9UbBwI5Wsqi6RLERuZLo3gFuExPsgxRbg2FjCPm5aIrNy2hZqSUVtVLMYk5c+tI6VgyBiczF9GrLlBP5R9hmQJKp0fcF483i8cDfQdKo3Ws1hr+A3wrr4C1fgCbKjoiwhxtkpKYgnB2LFtX3VRp2bd/yEpK5vG+S5OBanENp9i8mM1+Hzhe6i8i7QEVV+JIxO1Q1p9mFTddGZGdy24NnnkBaAZ5l2Q/sd0v1cu3rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5hwflqy78G9+DmEoprHffsh3VGaV4cnyWxL4C/931E=;
 b=Psaap+sr2sOngXyY4Yc5jpWwC5lzW3Jhp21Ku0XtoEiyYWcplQ1RpbM5vAlXNE2lEr8lqYKjbhf1aYwtfkXzizgQJRktjvTOftdwYucjHa8WcfIbD+kcnZL6dpYiIr+QvYndFrL7I7rtcd0CUPI0HUmxd5GmJD99WT70fu20lhs+5sUKNZqVK6Ae1N8iOo3l8F/cfe/MaR/TnOVr6Tpd+jT9dTC1CWGrOXxq6XiUL3eqWaje9ibHg+oBnES8kdjW+EuH83ekPJBzD9jgF9WVCrB0ClN/yKEH9GYrEdF720TsUcc+sI20HmL8gVnVD+7bbJe3XQ7PuFczE3cFc+zorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5hwflqy78G9+DmEoprHffsh3VGaV4cnyWxL4C/931E=;
 b=xRFg9x2wGGvvIItKWxcpSe/yL2nXvuId6wfYNaXhBIA25bAaxpiQp0i8B4log/3x8T+vwCHpOfLGTGSNkWzUHatIpVr3ID8maB7RSDg2KjK5JlpXY8U7C8eZzNEbYtNRYKJYxS4gK8zjvnYP1Vec5EUHRSHHqxmTjstmH18idVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
Date: Thu, 5 Jun 2025 09:44:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data
 structures
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250604174311.754899-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e0c967-900b-416a-e734-08dda404cca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlVrVXpPd0U2WW11aFY4RW1WU0lKT0RQVlhyZDRpRjU3VmRSakZSZ0xRaDBK?=
 =?utf-8?B?SEVRN1ZuWnZ5S043Nll2d0FQd3BoMkVtekhWTHVaZDFjQ1d1RHhVemdTRUF2?=
 =?utf-8?B?QlFBbFZIT1ZVZUhsTFNpZXArRC82dUYwUVhrKzhjWStqaGhubUNKYXgyMndu?=
 =?utf-8?B?R3VHME9pMXNQLytjSEl1UHpPbWh6UkVTMVdVV01QenNFcHg4NHFuUGtTVGQz?=
 =?utf-8?B?TnlsWlQ5bGhKYUV6eTdmN1QrYTVvWEhoYVllM3pLNk1WVFNTT01iTmRXaTJw?=
 =?utf-8?B?TysyMGwyYmRRVFd4Y0dnSTJRNGpSVE94YVlab3NEdnhPaFZ2dzNvejIvNWpG?=
 =?utf-8?B?Z0xRNXlORmRDTmhjWFVGZDdJbFptTy95VDFOOW5zRjhCbFZ0OTc4cUhRRkNq?=
 =?utf-8?B?eFF5UWdhNm1qZk5oRXlIajUrWG56dkdKUDdDVFVYcnc0U0VNZFRoUjlvVEsv?=
 =?utf-8?B?bzh1ZUxNVEJsdUd2MjZ2M293THhKeHZESHlISjBXZEErZkFxalExazFoZ21z?=
 =?utf-8?B?UXB0QnpOVEhVZ2NBTkltbXE5c3lHZTVqL0Y1M25rTEJ3UG5abUJqWkVUb1hB?=
 =?utf-8?B?UlV2SjlQSGNSZWNJWGJlb0FzT3d1VzZueTl0cEU2SEU4eituVzVZaTl1cnRG?=
 =?utf-8?B?cGlieGZRZWR1R0I4WHpaVnlpZmYwU2lxWndJOFpvNFRuVFFtWGdsZzlJaVVZ?=
 =?utf-8?B?ZlI5VHpBRDEwN2UxMlp0TVJTQTVFaTluaXRhQ2FHUUVPbGtBYWk0blcydDR4?=
 =?utf-8?B?ZVBMN2paZk1CUHZ0aWdjSmpqcWtLa0FkcVN0d3pMdVRWWE1XZTZodEowN3Fq?=
 =?utf-8?B?bTZuNXBVZW1pU1pWL2p3dnFHT3JDcUZYdDk3Qm14Zm1iYVlEbUdUb2hTM1Vk?=
 =?utf-8?B?dEc2UzlvOEZqS1UrRnJmakxER29pSFdaUlBoUGdjL0lnOFhzSDFleWlHR3R4?=
 =?utf-8?B?SHlhdTJkWXE1aUVuUDRBbGJqK29ablRFZk03R0pwYnptTHlLUkljeVN0dXoz?=
 =?utf-8?B?OENXSzljdy9jNW9DYWZpZmEzV0JlWGkwdkNoQUxBeFMyMUlIbjd3VzB1dVRS?=
 =?utf-8?B?ZW1HdU9jZlNxeUpoTXI1YXB1cEtORktWZVNCOEhnWWF3MkxFRkd5SG45TFc3?=
 =?utf-8?B?RnczNTNPOTh0YXBIOE5rVVFaZ2I3SUZ0YXhIMXZPWlhuQnpFV1M0eHE0WnJx?=
 =?utf-8?B?N3BQZGRtMGZ4dyszeE8zalp4TFZYVTdzVWxXeGhjSWt4TEcyZG01a3FEVWs4?=
 =?utf-8?B?VE5FTDVJRURKRVZkODNvb0VKT0RmNGNNYUZtYWNoTFRyREpHS0R5UTNIMm9S?=
 =?utf-8?B?WUVsc3hFQ0swaVJHNTNXTkZSSEttazI3R2RVUm9zZUh2Ui9jdTBxU2hiZXcw?=
 =?utf-8?B?cURvL1lpbFp1MmhuS0ZiQzRIVHV5NEVkWDJSZ2VQU2ZydzdwMDJZRU45RVZD?=
 =?utf-8?B?R1BZNjFZeFpGSFpuVEhBK0lNR2l0NVd0Y1YvTlVjTFh3NUZqc0I0dXhnNFdC?=
 =?utf-8?B?a28yTjhOWjRqV0VEL3ZDa3h2eXlFWXdWUFdMRHJNSm9qbUhHNkF6UGZyUGp1?=
 =?utf-8?B?d3MwczJmMjhQQnUwbE1OZnIrSEdTWnBQaE1pUFZ1UWVjeVVCdUxlQnRPN3Rl?=
 =?utf-8?B?b2dqQWhqSjNXVUR5T1p5emVUZThLdSs2aytFbXNoWCszbWx5eTBDSEVGZlkx?=
 =?utf-8?B?SW9sZ1JNdXhUeTBzbEJWcUs1UUFSZUxtTTUzcG4rU0gwMXgwemVPNk9Jc2tl?=
 =?utf-8?B?Sm1oQWtBaThXRTMrOTlBaGd6NU5JakRYK3NIZVd0ZEh0czhpdWJ6UFZCcjVH?=
 =?utf-8?B?R24wdFNqbkJNUmpsU0VzVFd5UENJVmJkVnIwUXl6TGRnSTFJNXpheUhqRSsy?=
 =?utf-8?B?NlhjbkRWZEJEMXgrb3ErdDRrUUppaTBnWmJ4Mm5QbnIrRXM0cTlEaENic2tF?=
 =?utf-8?Q?7j2DrbkS0uY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHFJT3hMYkpvWGsrdVRBN2dydnZWZTlLN09LenRLMjlqMnRITm10eit6emRN?=
 =?utf-8?B?VnlkSkd3ZVhwL3doZHhNcWRjTXh5RDJBNGF5RzdYVEk5c0c1Mzh3QnRCaWtH?=
 =?utf-8?B?RTZyUE1Ka25QK1VJTzZoQWtPRDlRRWZpdmV6SnNQN0xlM1Z3eGRyRXdybC83?=
 =?utf-8?B?NWZ6MnZMbU9iMTIwL3lMNFEwbVBrOU9GZU5NbGpkZVZldE1obytiMXcrd3gx?=
 =?utf-8?B?WDVReGlsdWt4enlMTm5aUElrN3dPa1k2bDQzcUl6L2s1Qm1xcjRmTzU0OTRU?=
 =?utf-8?B?dlJmSldCbEhPczZQZDY4VXkzak5Mc1EvZ1hjYzRSeUpmazhIM3N0WXBreVhN?=
 =?utf-8?B?SlpKMnk3RFcyNm1ReWRGaTc3bVBaaWY3amhJZ1lhQTlIQ2REMmsrL3pHdnFP?=
 =?utf-8?B?SDJDQm8wbWtQb3JjOHU1djVLYVozYVN6ZVVWWG1XMVM4dHlJTDhGTGJjVXdr?=
 =?utf-8?B?enNMZWV0bE9INFBmeGxxK0oxV3creG5aTlg4VnRqMS9QVzlOVVpjRXBjdVJj?=
 =?utf-8?B?UGZzT3k1VmUrUGNLRmJIRm04M0o0M1FYUHFHQ1pET0FDOHR0TGE0VEpNNHVB?=
 =?utf-8?B?ME1SeEJ1cHFVb0RBZnJGK2ltM1orVHo4YmF2elIrTTFDVDJ6YUhXbFVqSjAz?=
 =?utf-8?B?ZDM4akhXNnlRR2U3Tk9OR1VBWGlocHYwSnBwM0gwZ3UxWXZxRTNFOEdWZVF0?=
 =?utf-8?B?bjQrV3c2YXh5M3Nod01jdWYwTmtjdmI2MzU4RTNwbklmSnJNTHhIWmlGdGtK?=
 =?utf-8?B?dUpxU3NLejh1TnN3TzV2Zy9BZjg1bXNxQVpiVld4M2Z4RkxQbjN4dXBKVE0r?=
 =?utf-8?B?eldBZVNMUENvSWRiSy9FSTFSZmdSV09OWkFuM1FjakhIQnlrTklhZFg4YWZp?=
 =?utf-8?B?SXpJMDNaYzE0VEJTWDN1T2FSSmpuT0pyTnhvcTdpa2NmOUFkSSthdFo0SUdq?=
 =?utf-8?B?TWtacUNEWGdhb2lYeWx5K0FYdWxFREp6OHhZYStML2s1LzZVQlFFMmVieUF3?=
 =?utf-8?B?bWZ2bGNlMy9jWjZiejhoclE4ZnIrMStUMlBYaWVZemZnTjc0ZWpDS3kzMXBr?=
 =?utf-8?B?L2hIbkRxeUdUQWE2REI5T2MvUU5MZHdkV3pZdW9RKzdwZmhSaWVobGJrZFZq?=
 =?utf-8?B?aWtqRS91eDRySHlkMHY3K3ExSElpSFg5ckR0cnRFcmMvQlR5Z0RKd1ZycEJE?=
 =?utf-8?B?Vyt3bzZtdkJlMnNHaEYxMGI0Y1JsSmJDVkEyemJCYVdTREQ0Qll3cnE0QzFu?=
 =?utf-8?B?ODdKSnBRSll1ZFZLcWg4eW1BcERWZEJjcWZaZVh5dTBoN0doMGFTa0dEb2Zy?=
 =?utf-8?B?Qzk2dEo0ZHNTZkE5c2tTV1U2SGxmZHF3dTN3Q25hdm5VOUVUaTJuVm9IVlpT?=
 =?utf-8?B?dUNzaFhoZ21obUpBVWtvUmpjN1dYdnRwUmYyZnNWTnZZaEIvYVl6VHhtK1NQ?=
 =?utf-8?B?MWs1ZTVZVHVlcXJqMlpjWlJDTEszU2huR1FjOVhyTEpoeCtHL2pYYWVqZCtQ?=
 =?utf-8?B?c0lFWjdmM3NXbFM2bVZINlFlUlZ1U0sxR1JtQk9RY3ptb0ZZSmVOL3RQTXdP?=
 =?utf-8?B?cFhaNTQ5QVZMWlM4N0g4Q3k1dVV2dnVPbmNiSWI5eE9xbHcxLzlZay9WVTlW?=
 =?utf-8?B?c3QxRkM2ZFRSdzBCRnFzRFJ2K054TWg4M2dGN3NBdlh5eEtVNnZNU2k4d3Fq?=
 =?utf-8?B?OVJkOWlTamdBQzZOU1I3NVo4WlA1YVJoOVlpZUNRSmt4NUtxa3A3bWdmSkM1?=
 =?utf-8?B?aW5zRW1UeDZHMUlGSjZVMmhtRzJSV3lBeGJ2cFZOdmJoL3o4UnY5eXcxV3or?=
 =?utf-8?B?OEpNQzEvMVhZK2t6S2dLeUVyeWhkc3NJOXRMSDFrL2FYNkQ1OFlaWFljVktS?=
 =?utf-8?B?UjlWRmxDRUpUZi9PeWNqL3BWWWE3YzNhN016SGxtUmQrazJqbFFCMkVwRTky?=
 =?utf-8?B?RmtnK0FTL0dlV3BaYS9OU1Vad0krRHgzdFpaTS9oV01HbkhNcFlrM2QwK09X?=
 =?utf-8?B?RFpnUk5COTVuek03cC9McWgya3F5Y3pCRXVrdEQzR1JSSDJmOENtUDlNUUF6?=
 =?utf-8?B?dklId1VUeThac28rZVRiUUE4V2VzT3N0Uzd3L3J3OHBVbkpIY29HWVI5Z3hL?=
 =?utf-8?Q?ftrIGOPRAbqroq+ZYpJhKmyMA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e0c967-900b-416a-e734-08dda404cca3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:44:28.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zt2845p/QwZ5hfAwKRgVwMik+TPQ8ory/fd2tPsTaPo9ypVeJW9gPA+wQrYKp9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063



On 04/06/2025 19:43, Ayan Kumar Halder wrote:
> Do the arm32 equivalent initialization for commit id ca5df936c4.
This is not a good commit msg.
Also, we somewhat require passing 12 char long IDs.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/arm32/asm-offsets.c         |  6 +++
>  xen/arch/arm/arm32/mpu/head.S            | 57 ++++++++++++++++++++++++
>  xen/arch/arm/include/asm/mpu/regions.inc |  8 +++-
>  3 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
> index 8bbb0f938e..c203ce269d 100644
> --- a/xen/arch/arm/arm32/asm-offsets.c
> +++ b/xen/arch/arm/arm32/asm-offsets.c
> @@ -75,6 +75,12 @@ void __dummy__(void)
>  
>     OFFSET(INITINFO_stack, struct init_info, stack);
>     BLANK();
> +
> +#ifdef CONFIG_MPU
> +   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
> +   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   BLANK();
> +#endif
>  }
>  
>  /*
> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
> index b2c5245e51..1f9eec6e68 100644
> --- a/xen/arch/arm/arm32/mpu/head.S
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -10,6 +10,38 @@
>  #include <asm/mpu/regions.inc>
>  #include <asm/page.h>
>  
> +/*
> + * dcache_line_size - get the minimum D-cache line size from the CTR register.
> + */
I do think we should have a cache.S file to store cache related ops just like
for Arm64.
Also, no need for multiline comment.

> +    .macro  dcache_line_size, reg, tmp1, tmp2
I would prefer to use the macro from Linux that uses one temporary register

> +    mrc CP32(\reg, CTR)           // read CTR
NIT: wrong comment style + wrong alignment

> +    ubfx   \tmp1, \reg, #16, #4   // Extract DminLine (bits 19:16) into tmp1
> +    mov    \tmp2, #1
> +    lsl    \tmp2, \tmp2, \tmp1    // tmp2 = 2^DminLine
> +    lsl    \tmp2, \tmp2, #2       // tmp2 = 4 * 2^DminLine = cache line size in bytes
> +    .endm
> +
> +/*
> + * __invalidate_dcache_area(addr, size)
> + *
> + * Ensure that the data held in the cache for the buffer is invalidated.
> + *
> + * - addr - start address of the buffer
> + * - size - size of the buffer
> + */
> +FUNC(__invalidate_dcache_area)
> +    dcache_line_size r2, r3, r4
> +    add   r1, r0, r1
> +    sub   r4, r2, #1
> +    bic   r0, r0, r4
> +1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
> +    add   r0, r0, r2
> +    cmp   r0, r1
> +    blo   1b
> +    dsb   sy
> +    ret
> +END(__invalidate_dcache_area)
> +
>  /*
>   * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>   * If the Background region is enabled, then the MPU uses the default memory
> @@ -49,6 +81,10 @@ FUNC(enable_boot_cpu_mm)
>      mrc   CP32(r5, MPUIR_EL2)
>      and   r5, r5, #NUM_MPU_REGIONS_MASK
>  
> +    ldr   r0, =max_mpu_regions
Why ldr and not mov_w?

> +    str   r5, [r0]
> +    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
> +
>      /* x0: region sel */
>      mov   r0, #0
>      /* Xen text section. */
> @@ -83,6 +119,27 @@ FUNC(enable_boot_cpu_mm)
>      prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>  #endif
>  
> +zero_mpu:
> +    /* Reset remaining MPU regions */
> +    cmp   r0, r5
> +    beq   out_zero_mpu
> +    mov   r1, #0
> +    mov   r2, #1
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
> +    b     zero_mpu
> +
> +out_zero_mpu:
> +    /* Invalidate data cache for MPU data structures */
> +    mov r5, lr
> +    ldr r0, =xen_mpumap_mask
Why not mov_w?

> +    mov r1, #XEN_MPUMAP_MASK_sizeof
> +    bl __invalidate_dcache_area
> +
> +    ldr r0, =xen_mpumap
> +    mov r1, #XEN_MPUMAP_sizeof
> +    bl __invalidate_dcache_area
> +    mov lr, r5
> +
>      b    enable_mpu
>  END(enable_boot_cpu_mm)
>  
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 6b8c233e6c..943bcda346 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -24,7 +24,13 @@
>  #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>  
>  .macro store_pair reg1, reg2, dst
> -    .word 0xe7f000f0                    /* unimplemented */
> +    str \reg1, [\dst]
> +    add \dst, \dst, #4
> +    str \reg2, [\dst]
AFAIR there is STM instruction to do the same

> +.endm
> +
> +.macro invalidate_dcache_one reg
> +    mcr CP32(\reg, DCIMVAC)
Why? You don't seem to use this macro

>  .endm
>  
>  #endif

~Michal


