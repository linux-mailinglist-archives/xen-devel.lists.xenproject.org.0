Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79816A60BED
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914054.1319872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0ar-0006Dx-5z; Fri, 14 Mar 2025 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914054.1319872; Fri, 14 Mar 2025 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0ar-0006Ci-20; Fri, 14 Mar 2025 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 914054;
 Fri, 14 Mar 2025 08:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaPW=WB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tt0ap-00068v-KW
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:40:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdb7ad1b-00af-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:40:34 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:40:29 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 08:40:29 +0000
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
X-Inumbo-ID: fdb7ad1b-00af-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1K50mZpEkhQOk9yJqfet2X8M/IwBTAtmzKcwj7UwWWin1JsZMTeRSa/uCqiF9kjwC/nGYjC37UP6r9mAqPi2vqf3O5iok+4tROaHWAQU8/MxOxHJ2HBlxi5BPWJDHl7Lh97RK4OqgEjv9oJ7C9W1GDB7Yj0Bhzn8TImrW+4iogt6A7eR4RNH4xMLnKDWyljPtdsOXJU3dBR/numKIhbcAUdVMAwCl420f5OqwfeDseKoDNogpu5KDhYEefbWm9985wlgXRWiOWRMZfdVUynLRRjwDxkYEWey3+8MBVA4yM9Jqf3qeb7YRXN7gTvv3oEelER07Q2XrbLjvuOgx0cVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhpU4gM0Rs/fr4IyV3Y7WapXYvpeGeGXthUe6j0fVZU=;
 b=kH5wYJOhy3G6kBbaOJWd6V3zHsL3A5XgkQ75MqaxkBZBZIARLlp0Od0zzWafE1DGJNPwIVPTmHwmtWcNRRNiW9FnYeavILIb8qW7OIUAppD1CKyJ3sVj4kj1XDZSNF0EWDGts6RxN3T5mIHWwHxoi4h3RvDik3ABN8l4VqlYAoUV6E1fdE65H4wM0WKb+gb4zA/VyWOBEw27qVe4TGTW81X5NKhOIIsj8CdvYM0T1W1bcbXheNp46VzTjZuLQdvsB9TXYrcc9QxJP+BTbOdJg/D/T0XuBeW2OtqXnWVckW1JLNqGQnheDOlGyKFxM944mnumFsnqcJdpMyzEPLhedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhpU4gM0Rs/fr4IyV3Y7WapXYvpeGeGXthUe6j0fVZU=;
 b=XB7YiXsVJRdtNEqOR0H3JgT0iQw0i6TC+wcsawMliVFJei3Acq2c6deLKuoJm/KX6q2g8Df5i4bmbrGxcKWDT9vEYBRE5QXYXlOhse74JEMVoh+rPiPPF4aZZq3ESMI6agyQ6IrsEu655Agat9NA/SkMvGsB8+VY95FF2K0dXoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ae10d1c8-e48d-4646-b09a-71e43fd16b5f@amd.com>
Date: Fri, 14 Mar 2025 09:40:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm/mpu: Create the skeleton for MPU compilation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-11-luca.fancellu@arm.com>
 <40606489-99b4-4cc3-b202-9abae4cd1ec0@amd.com>
 <0FE3B1C6-3DDC-447C-9C3A-474E47B53299@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0FE3B1C6-3DDC-447C-9C3A-474E47B53299@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: b8159d17-e346-46c7-6778-08dd62d3e044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjJvMG1GcmZvbUJSdm9YejRkRDhZU01mK3Z2ZzdiQTM3K2xBemwvTzQ1ZDBn?=
 =?utf-8?B?SllmNC8rVHZjcnhDMEdXWFg5R1pWMFM4c2FCUzNzdUR4THd4eWprUUY0R1Fu?=
 =?utf-8?B?R2kzRGVjWVlXMlVOTnhYdEFicXpEZklRUitVWTdwd0lPRnRTU3owV25IY1No?=
 =?utf-8?B?QjFZMXNMSXczOWJsSEVaOTBBUnhWRXBSRGlFOUEvd0crYi9NekFmdEFZaW1n?=
 =?utf-8?B?YkdGd2crcDJRYksrMHBQZ21OeXV4eVRqcXdzM090ZWxRcEpyL2N0cnB5M2NK?=
 =?utf-8?B?bldNTnB4U0pRRmNQcDZEMENqbUl5OE83YjV6NzBnSmxYT3R3UEFtdUpYcTVD?=
 =?utf-8?B?cHFCSUlFRmw4KzJ2VzRmTlBWd2NybzdaSVQyWmduWWtPQ3F2TUd4SmRiTGxn?=
 =?utf-8?B?c1oycDdkN1hSZy9uSDEvOXZuTVZjcERiVnhNMjNibW14N3BhZTgyaVJ4QVov?=
 =?utf-8?B?M0V3MXFQV3VxOXhOS0xXc3F1UGhQa21La2NIUW5PVktGR1RkSjRBc0N0WDha?=
 =?utf-8?B?OG1lbUx0RnAwT2w5TDZxcmViTFJTR3dGc3J4ZldBWllDeFJ5Y2NIbGRZRG85?=
 =?utf-8?B?V1RXcm5JRUU5YkFXMEZMekZLTlBKR3pGY3FTRFFiUFFxREVRV2JSZThFdEMw?=
 =?utf-8?B?RldnNENBSnJYNGRuQVFoeUpNazFQRWFpNzJQOGZobFVnNTJQVERrL08yVy9B?=
 =?utf-8?B?N2x3dFNueUUzZUlHM2l5Z1ZuWjd0NUpuZk9OYkdybjA4NWRYRERFeDlSdDJj?=
 =?utf-8?B?c3JjYW9nSWpjdDZNSnhSTkpLV1pNZ2JPcG0yWEJLaE5TSUVCbmZ2NmhiUkp4?=
 =?utf-8?B?KytiZ0lEZmFBMXVZUUphbmVjZVg2UHltU1VZRVhZems3L0MreHExbEowcjJq?=
 =?utf-8?B?ZjJaU0M3Uzg3RnAzK2IzNFRwUS8wRjlXR2Q1clJEVVBPNnhHeDI4dXJjTEVQ?=
 =?utf-8?B?VkxHNE5laFJzTm9HT01qWkkyYmhOeWc1bm5ZMFBkS2Q4My81bFZTaWxreVYv?=
 =?utf-8?B?WEFUNFQ4OWZZODYwYVdqVjhidjA1a0FLR1NOMUx3b1MwbUxKVlBCU2ExWFI3?=
 =?utf-8?B?WW8wb3ZSa2kzYnFKMk8waFVTOFZlNjRLV2FLNFc1cWZ0MFkvR1BKa21QK0N4?=
 =?utf-8?B?amJmMDBQRDA2SmViUHhIc1FiMFo2R1poNHRvelRkaVlzMVVaaEt2bkVlY1VX?=
 =?utf-8?B?NTJCeGlGQUNwRzFDMXpwN0wwWUljY2NqT20xSWtXTi9FOXRtR08zME9sZk1U?=
 =?utf-8?B?eXVoTmJwMzdtSFVmN083NjYzYkM4RFB0NWFjTmNSMzU4ZEFmbGJwR0p0L0d3?=
 =?utf-8?B?SUNYdllPSXM5ZjVjN08yckFVVTZBVEZqUEZQRnFGZ1hiQmNQYUg4K1hPUktK?=
 =?utf-8?B?dUpsSXlWdDNLaHlnZnRUeFBUajZGblZmRFpjby9pR1YxV3J0N0hab0hZSTVo?=
 =?utf-8?B?RkNaVGFIczg4R0s5cXptSmw3b2xwdnlzS1FSSjN4bFhoRHY2WDZDbDQ3c0d5?=
 =?utf-8?B?S3hMWFR0SzNaYWlUdlJuOVBtd20wYlBORHJ1a053dzIxUDhnNVhpV1lobU1s?=
 =?utf-8?B?ZTVndUVqbUdYSjJaL29aWGZNOHdEQ3BVV0d5NC9EdjVJVGN1SFViemd5alVN?=
 =?utf-8?B?L2NwUmlXMUlDdTZSMFdnMjlQeGQwbnYyM1VFODZJR1pnREd5dFZuVWY4WUFs?=
 =?utf-8?B?MWhEbW1IdU1rM0dyc0dTeWtJWDZOdFpOYkhJN0cyclVsSHUvZzFKS0owTXho?=
 =?utf-8?B?eG5KOGM2SnFSVlM0dCsrNm5DUVVLcUFsdnBsZjduNlA0dVZGQ0l5Q0UrNE9p?=
 =?utf-8?B?ZnVXY0lUdi8yanZIb3BUcTdNK3VFY0NteXdtck5Ec0VMSVNWazh3Rk5Nc3JK?=
 =?utf-8?Q?7kJdJ41qPibOW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXYwb3Q5RExCNkpla1VOQ0QrbGhhN1ZEd3ZUT2p1VTlLamdmWmRwQmYvS2Jm?=
 =?utf-8?B?MmlGRDIzbWoyV3ZrU3F2S1JUVk5LZ3dhQlk0SDI5VktuNmFoVVdBSVdYUWRB?=
 =?utf-8?B?OWhjdGgwbVFPT2xxNDJYaVhLemthT3Foa21PTGRJM3E1c0dLWFVRYWE5ZEU4?=
 =?utf-8?B?dzBIQ3BmeURocGc4TDZZL0tmN2R3eXhwdGFxbnZ4SFNxU3BQTXlDb2hyTi9V?=
 =?utf-8?B?K294ME9LbGUwcmtvbk9iSFNrb2JuNHQzQkFySUlhYVR0NytHNjd3MW5hd3N1?=
 =?utf-8?B?R1pyQzAzY1VkMEZsMCtLYncraUFwTW9pb292aUZNYW80aWRtSG5nNkZTci9m?=
 =?utf-8?B?S3VZZGJKUkZNbW9waWJpNG9TWXhOVUdQNkJ0ZHNXVUZFYnNVYkp5NjVKcWhh?=
 =?utf-8?B?Y3YxV0drRUFHQ294K0NZaTRpZ3g0Tlc5UkNFeXNVeTFqV2U0dWNtdG5KOUZP?=
 =?utf-8?B?S0hrUGFBdU9MUm1DdnBvTXJmUk02cWlBdWdqcUxOTEYyTkRhQmFNN3pmczBL?=
 =?utf-8?B?YlRDb0EvbS8vZWpUb1RxcjRqalJzcm5Ub2ZoVnJFYkJqcitlbFovNjYxd3Rw?=
 =?utf-8?B?aDBERFh1c0hHVW9OanlKRTVvcDFrWWcyc2FzZGlCZGNxV3hDZS9QY29Fc1Jj?=
 =?utf-8?B?SEJtSnd0MUMyL3lsWDIvMmFvM3VXd2VxYWRCbE9yVXRYWVU3QmkvT3htVHhM?=
 =?utf-8?B?L2gvcHl5UG5XOWttd2pObzdYNWIrZU9JbjRyMzM1SFZyTWdOaGdmdEQzWjJI?=
 =?utf-8?B?Rmpzd1Y4MjlyNlZEU1V2TEFRZ3FtV0lUelRPR1dYUms0WHFPdldVTjljbmE3?=
 =?utf-8?B?VHBvbWFDZHRFUTdBaUFKVXlCN3VuZFR6S2huKzZ3VDFBTkRRNi9CWjdOakp4?=
 =?utf-8?B?ZFZpQ3E4NFpya1o0QjBZcDR2Z0QreHl2c2JkNkcraXYrbURsK1VJWGJZa21D?=
 =?utf-8?B?RTBGSVRlVmNWdTZMWmIxcGxSSG5zKzc3cmp3WEszbUNhc2E5eVN0RUZvSUN5?=
 =?utf-8?B?RENMM05hTnpzN08zSmowQVFHZ3Z4SjF5KzVQelVETjE5T0d6YTFGdzArZ091?=
 =?utf-8?B?MTdzQkN3Mk4wUXhaUk45a1RzdlZVbU1HUXVQVmNLekNCVlRZazVHOE5pUndn?=
 =?utf-8?B?Skc2NkVQUXpQa0RUc1J2WWhkdHo2VElpQ0RNZkt1QzRpZC9DTGJ0eE8wM3ln?=
 =?utf-8?B?U1NjR1NPdFc4WmV1VEdsMmJWN2ppWm1DdGJmZFByVzloaEJZU2tvVHhaZnNz?=
 =?utf-8?B?VGh2U2lzTURkMUpCK1VDLytSdVVsTEF0bUlxRjNqTmY4UDA0UWZWQ1BUM3U4?=
 =?utf-8?B?bnVQVW1sYkp2NFBOVW5kTGNNWUFaVEdrK2poNU5FanFoL21SK0FVdEcvWjg0?=
 =?utf-8?B?RTJnSEU4Mm03TE1xM1o2Z1Q0ckdMYTNzbFVsbnVsTThZa2wzNFdVU2l2WTUr?=
 =?utf-8?B?R29vektINUUyQWhTa2o5VXg5WVhtVGFrV2lBVFZzU1cxdjhJZ0JYVHBmT2dR?=
 =?utf-8?B?SFN5UHR4UkJ0ZWdtRUZHQzY5NGhwRTlLWm5EOW5MbGI1UlpOb1p1K1p0S1RW?=
 =?utf-8?B?YXFGNUNlUEMrblRvRWtIUW9nWk5yUDMra3Nid2t5MkErelNqc2RXR0FyWkYx?=
 =?utf-8?B?OWdMWWN2R1lMbE9oMkx3QnJrSm9JTXQ0QzRaVUI3dG9VN0FzL240bzRGNXBs?=
 =?utf-8?B?MUxxYlk3Q3V5OWNsZ2d2aU84Wi8rYTloajhlWlh2SUdsTEluU3lkZ3J6SkVp?=
 =?utf-8?B?VGdsNFVRTzdxVW9CRkQ5V1BFS3VXMEYzbElOcmxpdmpzQkdaWkVWWklKQnJH?=
 =?utf-8?B?d2VTV2lySHhaQ3A0eVQ2enhleDBRZ292bnhOUFZFZ09mVG1Kc2hxUFZzeEV5?=
 =?utf-8?B?K2F6Vk5yM1JGL1dJbWVOcHBnYkRmMlBPU2V6YlZ0eXRmMU9QTXVsLy9mVU9R?=
 =?utf-8?B?MmpkaWt4Um83cVJpa3dFeDltci84bitpMVVVUDNQTWJadFZncTJLck5taTRr?=
 =?utf-8?B?VFZtOWtEbllCRjVROGFJVDYxdVBzU1NtV1BZd2pPU0kvYUxkUDZpUjAxYXJy?=
 =?utf-8?B?L1p2M1FMVFpUQjZGcXpMRDBvcHhxaDcwZy9mVDNnbHE5MktHbUsxbmVQNkJr?=
 =?utf-8?Q?T6JmWe413T8PXnpHRFtZ+9Ip9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8159d17-e346-46c7-6778-08dd62d3e044
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:40:29.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wWivQHbw/U/GpdoyY4sxwqLvm8hwFpvwPPk+/iEiRQa1APLjeN7SUMsce5Jj8WY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029



On 14/03/2025 09:38, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 14 Mar 2025, at 08:27, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 12/03/2025 14:52, Luca Fancellu wrote:
>>>
>>>
>>> This commit introduces the skeleton for the MPU memory management
>>> subsystem that allows the compilation.
>> You forgot to mention that you're talking about Arm64 only. For Arm32, Ayan has
>> a series containing a few patches to enable compilation.
> 
> Yes I’ll be more specific here that we enable arm64 MPU build
> 
>>
>> P.S.
>> Once your series are merged, I'll send a patch enabling CI compilation for both
>> Arm64 and Arm32 MPU.
> 
> thanks a lot for that
> 
> 
>>>
>>> +
>>> +#include <xen/mm.h>
>> I can't see anything mm.h related here. I'd expect types.h/stdbool.h and bug.h
> 
> I’ll add
> 
>>
>>> +
>>> +int prepare_secondary_mm(int cpu)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +void update_boot_mapping(bool enable)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +}
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
>>> new file mode 100644
>>> index 000000000000..e5c0e302167c
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> Empty line here please
>>
>>> +#ifndef __ARM_MPU_P2M_H__
>>> +#define __ARM_MPU_P2M_H__
>>> +
>>> +/* Not used on MPU system */
>> I personally don't see a value in such comments. Initially when there were just
>> 1, 2 instances I was ok, but then I realized you keep adding them. It's pretty
>> clear that if a stub does not have BUG_ON, it means it's not used. I worry the
>> files will look awful with so many "Not used on MPU system" comments. If at all,
>> the only place they would make sense is if they were in MMU/MPU common code. Can
>> we get rid of them completely?
> 
> Sure, I’ll get rid of them
> 
>>
>>> +static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>> You should at least forward declare struct p2m_domain.
> 
> Ok I’ll fix, should I include asm/p2m.h for the visibility of this structure or
> because we won’t use that I should just forward declare?
forward declare

> 
>>>
>>> static inline bool arch_acquire_resource_check(struct domain *d)
>>> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
>>> index f1417cd1b9db..a963b35db88d 100644
>>> --- a/xen/arch/arm/mpu/Makefile
>>> +++ b/xen/arch/arm/mpu/Makefile
>>> @@ -1,3 +1,4 @@
>>> obj-y += mm.o
>>> obj-y += p2m.o
>>> obj-y += setup.init.o
>>> +obj-y += vmap-mpu.o
>> What's the point of adding -mpu suffix to the file located already under /mpu?
> 
> ok I’ll rename to vmap
> 
> 
>>> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
>>> index 45214bfeb661..28119e008341 100644
>>> --- a/xen/arch/arm/mpu/setup.c
>>> +++ b/xen/arch/arm/mpu/setup.c
>>> @@ -2,12 +2,36 @@
>>>
>>> #include <xen/bug.h>
>>> #include <xen/init.h>
>>> +#include <xen/types.h>
>>> +#include <asm/setup.h>
>> Please sort alphabetically
> 
> Isn’t xen/* first followed by asm/* ?
Oops, I missed the fact that this is xen/ and asm/. Ignore then.

~Michal


