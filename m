Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92619A6615
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823362.1237345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qLY-0004YX-Px; Mon, 21 Oct 2024 11:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823362.1237345; Mon, 21 Oct 2024 11:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qLY-0004WE-N8; Mon, 21 Oct 2024 11:13:12 +0000
Received: by outflank-mailman (input) for mailman id 823362;
 Mon, 21 Oct 2024 11:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2qLX-0004W7-3c
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:13:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2413::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7358cce8-8f9d-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 13:13:09 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:13:04 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:13:04 +0000
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
X-Inumbo-ID: 7358cce8-8f9d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFAK4Q8jh0lexQ7oiLkRzvQTeV9qdzAf/3Bqc7eQ5mOTnAyAAKokf/RkHrPEs+nH1gxHb0j2cM7BeYECofpWQ+8t3rcAlA7329B5ZZI8BfUvItltfvvGSmkqGX0y6pfmevKjh2LwGe3CdzNreTe0xqpOg3P867wN/C3UVpUXA7r6h1Q495NnECq2vImlNVSOe4kBzoQRBoArVMqPAklB1JR3St/kT5hbP01G96146tyEfjDPsBBeFCNn2qkN8wTc1Xu0d2oOzP7F5b6zy99GAZbPHPL+KAL1tmiQ7ec/nm4Ibgmo8wo8BL20VnWrHtJRsQM2hyj/3Iiwoeltz7h4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/hq6ogFFoePwgmFZF9miXV3OIKmYM6Dzdrg5I2d4RQ=;
 b=hnjzUJbxKElX1HJtyRbkblqQi87rE8FeIdtbExHEukkGWfakPQhJfA/dzhG2ZXi/35JvIA+vyCu+RC0N1e/ywYUmRiUT+9bJM6nXp26oTADVlilzQL1WuehxyZmjM3dXV/EIr2AX51eYRmxkYQwrC/02u5XpMgIOag4beP5ezWuk6Hw7D4hyckMRjiA0EQrlWlKGhl7j7wTjbL1UwHFpCPpUbDUZsenjuBLRfn73DtIjoZrvs6cOTeVzfWGszXd31ei8EJRzSxeFWfteQHnqz4NnjIJMReoWHtQA2ZjgI8oz5yZY2GG5pLqCYB0HEKih4FiEx/faynxpF8uGWfK1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/hq6ogFFoePwgmFZF9miXV3OIKmYM6Dzdrg5I2d4RQ=;
 b=hpKeJRHDk6yW/PHjSreH6XWG6pCPnRv2QF/UnNNt72azONORp+4D88qc8qyi/jtlv49gmnKFi0OKABkgM9QVOnvBpwadkr7RSm511p52nmMpfWjV29LEL88EMEbmbqtqXCy9ZKi6X+tWgDlK0XXNVNtrTRKwacJmT9rnTrM4txs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f5b875e0-56e6-451d-a736-f2cc33cabae0@amd.com>
Date: Mon, 21 Oct 2024 12:12:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
 <7ee1579b-f1e8-4dd4-8540-e6c0858c6999@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7ee1579b-f1e8-4dd4-8540-e6c0858c6999@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 060cf19f-5bce-4f01-2e3b-08dcf1c15537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1pDZEpVNkl3N0VDWXhRZUZMeHA5dzdNSzE3ZU1neTc1d2hKdWxuWUduZ0Vp?=
 =?utf-8?B?V05jK1U4WkFxdFp0b2hYOU5uVElwcWxkaGlQR0pvNnYrbzlQWWF2eGhUWWF1?=
 =?utf-8?B?blBZQmhWdjZkSThJTm13S0JSN1ZSRUdMeXM1cG14ZWsxY0xPbUx3ZlkyUU5U?=
 =?utf-8?B?NmJzbnJMa0hESzlUZmxQUE1pdFdTTDJMVUtaVXBpZktLM3p3QTFJNmRkLzVi?=
 =?utf-8?B?d0F1bFFrUUd4MVEwSmxDb1JiUDc5dVFOUUh0cnhxdCtSQzhJeEsyTkhsZlhI?=
 =?utf-8?B?WUtBd2ZCVmdTd3lhSS81ZG9JMWo5TFdyUUoxWFhSQ0xqNnlJcVVucGgvQUs0?=
 =?utf-8?B?ZUhXR2tyb0JpTHpTa3N5QWplNWdmMmcyYmlqOXlmN05iYXZydWt6cUhvbEF3?=
 =?utf-8?B?R3p6dFZ2VjRvNCtCazkySW5Id2owOU9jelQzaHJZd1RDYldnSWlsYUtOcHVI?=
 =?utf-8?B?Wkh6YzF4blpOT1g4L0xLd0hqOU01Y3J1eG5xRU5BQjZPZW5ZMEU0Qkc2cTA0?=
 =?utf-8?B?M1J4bU8yOHhUcTlYNlJBT0pYamh1RG1qSm4ySnBERTZPRkt1U3ZwZWhBQXZt?=
 =?utf-8?B?SDBucHl6dU5uRXA5QVhZY2pXazNXVFVnWU1zREQrNmlLS1BKUVprUXhlZEg5?=
 =?utf-8?B?Vk01Y0owTlU1K3d6d1JyeHpkV2d0RmcyRXpXY0hyWlZyd3FWbUJjTUczaktB?=
 =?utf-8?B?aTZXb1l4NnFSQnNlS0U5TnpaelphWkN3WUZJUW9PVXNyekpYMWNIMmY4Um4y?=
 =?utf-8?B?VmhRckx3UmlwcmJTWi8zeFI2ZnFGU0FmUHRRY0ptVUZXeVNRSEQzOVNERXJ2?=
 =?utf-8?B?MUhMalNoME1ISUQ5OEZDamV2MENVVnl3K3Z6RkEySXJWV1NpUnliY2RPbWsy?=
 =?utf-8?B?K3pMbzdqUmxqZCtkOGtlQlFTQ2Y2K05hWU1XZHhwS2xxZjl0WVh6VkVIK0FM?=
 =?utf-8?B?UDVmditVOGFQTlVybXluTktoQzdBV3FLVVpqWDZNN3Fxd0pZSlgrYWRIcnlU?=
 =?utf-8?B?TFRHQXh6TTBpb1M3Y3VyQ29XUloxR21sZTdIZHFiUjNDSU5BM0RlU1ZYNzBN?=
 =?utf-8?B?QUJlTndxQ0VBTzFYUGk1ZElZdVNyK3VValUyWStKTlNYMFpobmx5U0FUaUFl?=
 =?utf-8?B?Sk9LNk95SE9TR2kycU9JbktnMWZ4cks5SHZValMySXNQZE1YUklSckVTaGZB?=
 =?utf-8?B?VFdJL3ZPREZ0UFd5UnYvNXpoUG1uRzEvU09FTk9YYTNvSFcrR0E0Z0NKelVi?=
 =?utf-8?B?TnlabEpBb05iWG1HQmdxY3QySzVuWi83ZmVyRU9UenFuQThkUTQ4MURoR1B5?=
 =?utf-8?B?L05kcGdCdGdZNUt5WXBOTDJvSTdPSlBMR0wrOU5GZmdIOEF4YldsRlk4bGV5?=
 =?utf-8?B?VkVONHNtTmZUdXFKSnFQbVc0bXB6L2Vrb2xDQUFxczFaQ0ZwcnU5UkZ3bG9Z?=
 =?utf-8?B?SFVKZC9SbzA1Y1M3bk54MEtSRzRFdEJ2NFEwdVo1UWRiR0QrNDltZjlnYVhT?=
 =?utf-8?B?cE8zaGlIZlk1dC94bjU5NWZPZS82OUVuRUFrYjhZUkN2UTFaM3pCY2FKZXpH?=
 =?utf-8?B?K24xUHo2UjRCa2VrdkJSajQ1L1NPMW90V3h1Y1VWVUZOZWJ2ejdRZm00cnkv?=
 =?utf-8?B?VW04ajZjWVJlMlIzQkpVZUEyUXBFOENCbFhrd2UzQkIzeGJWNWVjaTFWcDkz?=
 =?utf-8?B?cW9PVC9HVkpyckJuUEV4eThXS0Zwd2xDU1N4QnZaNklsdXlSWDNabUNQeDh6?=
 =?utf-8?Q?WOogdCovoIC0+ZhfUb4//oeaDfzOJiCmgms9RUw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9LUmdKaHphM2E1NnNlUmdwZTR2Vk1GajV0Z2owUE9BbjlrTVFlMER5VFRZ?=
 =?utf-8?B?L0hycWxBRkF3dmtWSGVKVGxSdUlnVVk4U2hLdm5wMk1WNEJtQ2QyWnRjN0xp?=
 =?utf-8?B?T0NOTjJEK2VqVW1HeUFrTjZxS0s5N2JUbUpUL2Q3UHZZUXJoV0Q0OUVObE5K?=
 =?utf-8?B?b01icjBsMVBVTDMvdkNCcC9QdjI3b09KYnMvb3hKaXZFdmVpMjdMZi9mVHpa?=
 =?utf-8?B?RG9QeXlSSkxMSUVXNlErTDRpb2N0Y3NwaDlkN0ltdTRENG9DY0wwTDV1L2FZ?=
 =?utf-8?B?SlV6anpWYURiMWhmRSs5K1VqU3RPU3F5NFBCTVlkQ1VBcEZtV2l4dHJWME9x?=
 =?utf-8?B?S3NCbFZBaXkzcFl0Y3ZlTG8xeUVINkdqTzlDOC9UK1RDT3M3eXowcGdsNTNP?=
 =?utf-8?B?am5pb3M1S1IwOExXYlMyUW9maUhnSGd3UGY5Y3VhdkJOZ3RWNS9sUWIwQWo1?=
 =?utf-8?B?ajNNS1M2WC80QjNmN2dMZDJ2bDNla3Z2dS9Zbk02S2VvM3NORjQrMndRcDVv?=
 =?utf-8?B?dE93VUJzbG1La000V29HaCtvY1ZYM1Fwa2paSi9NRzNQbjRsOENCQzlmeGtL?=
 =?utf-8?B?UTRYaHNZZ0Q4TEs1TU5MVWE0L2ZWS1c0YUFlS1VhSjdMdTI1Y0lzMUV1cW5N?=
 =?utf-8?B?S2FCVmM3T3VVR29jZzEvMkNNUnZ6bHdidTd0by8rY3NTS3NMb3psRERqckFo?=
 =?utf-8?B?d2Q4ZUpDd2dROUtrT3IvVUp0bnpjalYvMGlHcVBhMWhTYTdkclhuQTlob2M5?=
 =?utf-8?B?K1FNeEcxaVhPVXo1UGh4aGg5ZmxVcXZIdWhTSjU0UHpwbytrdVdPM1NTRmEy?=
 =?utf-8?B?RFRBQ012YlI3bVdWRmg3cUxQb3Y4TE5iNzFMZ1dLK2J3ZTNYcHM4UkkzQ25P?=
 =?utf-8?B?Qnc3d3lzL29BSmQvUy9NYUdPTTJjUUVlQitLRzhDRUZ1cHdUeEVwcGFlWjNw?=
 =?utf-8?B?SGpRUWV1RjZVQUt0c3hhUUIvUktPcC9LTFloQ09CZUQxKzVaZkRSRzFaV3JY?=
 =?utf-8?B?aFd6SGhwNDRHVkJmbExiYmd1eHRSMkRsRDVZRS9HZlIzZ3luWEFqcDMrSU1k?=
 =?utf-8?B?Q2VLUFE5bi9CeGhzTDBYQ05udGVPckF1UE9sTGhOaUFSU3cvM2VXWlQ2U1Fv?=
 =?utf-8?B?OU8reTB3bi9TRjBIQ2J1dzcxZjZybHFSckUrOWFFKzhYd1NZbHh5VE9TZGlt?=
 =?utf-8?B?cVV5cytsK29EZXRHbmgxNG1ZQ2ozQWdGamlIeTJKcUx3WGFkUXdnUUNPSGNl?=
 =?utf-8?B?TkhpcmhPcUlMQUh2R3o5UFNJbm80cERRa3IyQUhHSWRYbWVCNXltYVEwWXZE?=
 =?utf-8?B?ZXhpUVpTNmpPVDZnb0xsR2VML2hXZUd6eHlJRVZ6KzRyY3Vpb0puSm5KSmdT?=
 =?utf-8?B?azRkUW5TUDdEcmlyUmpENklOa2oyNENMODlQZ0IzalNqZHpLYmR3OWo1c1pu?=
 =?utf-8?B?TEVBRDhIbFBaL3p4SVR6ZmZ4SDY4T0V4ZG95WE5ITnQwNTc5UXdUODJHQ2RD?=
 =?utf-8?B?WGJDWGczdUorcnBpb0lNQ3pRYUJvaTY1VTJaNUsvS3hublB1bm9OY2VrbTRO?=
 =?utf-8?B?b0FYMURhVmFLT0N5RGNDVVRob204MHo4c2RnNUdpd3ZxejV0cy8rYlhTY2NT?=
 =?utf-8?B?clRtVk5adG9qTW5MTWFET011a1N5SlRLanZtU1dSZ1YrNHZvRDNOYjZMblZI?=
 =?utf-8?B?S1I4RGJFc0ZiV3hLcGRmaDBLWUJUQlpjYkRkb2p6NmlEOCswRVZMeFpkcEVh?=
 =?utf-8?B?R0FrVVdLK29UTWFacFZVTlpTKzlRNDlhN1FjTHpnQ0tmc3BUVUh4RGNlOWcw?=
 =?utf-8?B?aWRuSjUwMDNmbUpwQy9IVDZCS0tOR3poL0dkZWJsbVJRUzNtR3YyT2phdkN2?=
 =?utf-8?B?VW9hVzNCZmJKVE9GMUdHUzVHc3UydS9BSVVTUzZwWG8weXFZRExxU1lXTW13?=
 =?utf-8?B?MVFqQ2FVbkN1amRxR0hDMWlkTDJvdHkrZnMwRUkyTTFlcTY4aEdxTE41NGxN?=
 =?utf-8?B?dmM0WFlBajE3d2J6UEVWV2tXeWNDWW5wMHJNUHB5blVpSGNOTnhGbTcxMmxB?=
 =?utf-8?B?MEhyamREdU8vMkZ2UEFvbUh6Q2JFOWpWUXIwdXBBOVp3eFVRZkJ4d2l3eGRw?=
 =?utf-8?Q?xvxLGRnAotSGN01F9Vk/peHSC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060cf19f-5bce-4f01-2e3b-08dcf1c15537
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:13:04.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwV1kp5WHTpFEVkDteGiQ7tUQVm8QoHU057teEjW8r4/O2T9MGR0svdqY2h/j7qKq1OaYXHET09DRT9k9xrSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466


On 18/10/2024 14:41, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>> If the BSS section is empty, then the function can just return.
>
> This is more than "can", right? If we don't do it, we will end up to 
> zero outside of BSS. This could be critical data...
s/can just/should
>
> Also, I am tempted to suggest to add a Fixes tag because even if it is 
> unlikely BSS will be zero in the current Xen, it is also not unlikely.
>
> The tag would be:
>
> Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, 
> start of day code")
Ack.
>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> I saw the discussion. I don't have a strong opinion on the exact 
> approach choosen for zeroing. With the commit message updated:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

I propose that this patch to be committed. The changes to the commit 
message can be done on commit.

>
>> ---
>> Changes from :-
>>
>> v1..v2 - New patch introduced in v3.
>>
>>   xen/arch/arm/arm64/head.S | 2 ++
>
> Don't we need a similar change on the arm32 code?

I haven't looked at the arm32 code. My idea is to get the earlyboot (ie 
the asm part) of Xen working on R82 and then do the similar changes for 
R52 (ie arm32).

So that when we start plumbing the lateboot (ie start_xen() onwards), we 
can test it for both R82 + R52 as a significant part of the code will be 
common.

Let me know if this sounds ok.

- Ayan

>
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 14c3720d80..72c7b24498 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
>>           PRINT("- Zero BSS -\r\n")
>>           ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
>>           ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
>> +        cmp   x1, x0
>> +        beq   skip_bss
>>     1:      str   xzr, [x0], #8
>>           cmp   x0, x1
>
> Cheers,
>

