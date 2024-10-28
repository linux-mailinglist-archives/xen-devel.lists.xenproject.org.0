Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F939B37CB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826917.1241372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ThW-0007SX-J7; Mon, 28 Oct 2024 17:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826917.1241372; Mon, 28 Oct 2024 17:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ThW-0007Py-FZ; Mon, 28 Oct 2024 17:38:46 +0000
Received: by outflank-mailman (input) for mailman id 826917;
 Mon, 28 Oct 2024 17:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5ThV-0007Ps-9e
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:38:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79763b08-9553-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 18:38:43 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 17:38:38 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 17:38:38 +0000
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
X-Inumbo-ID: 79763b08-9553-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhBQlLpEuKmKrPRrLpjzS30uO090r9wNMUxf6SVVpPwawrqXMiOkCXxcyTy4A87lDTqIDKU0W7o8GKBD0FRSxNqdsCSFvojyeaiWiG0YXm+hj1+Ob1BjHjg5IZ2pe3jrpTZAG04l5Fy4nTZSBnEbpsI/sgIDRtDqfaP5SQoF3ZUdbZfArkIEw6pzEuIHoWV3vUzalkeCuJgnOk0v8sRSAR/rNezckIj47CSLj7kbch/ecO2/TvQjMv/U4Nk54ePjSockHh6JpHOQirPb1xmOcttKzWjGVa+cETJ3w6i8ZXecY9WNsAssQjwIkDI+Y7E0YHc6IW723qXcboTd4bHI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nopL8+k3o/tabKBR/yVcNwir6xe8rKnJIOrq3/WBXaY=;
 b=Z/iZLtyHzzCnx0SyB2be8AbBP0wIomYS6HNe0wuW+v9HIsA22awiUHnPf9vifak9E6jTA47bEPjCj5SkmMz06lk1GZ0zlcer3N/3lzkP5bvVt0LORmmUVFFoSagIEni0oJ+RyNOV/V2JvhMBCYIBVHs7sjhDrRWQerRXza5MdBS8WkxtfDKs7YgbGGLqUjZffCd0dtERGAmoY3fWRAcBHpamFy58fM+J9irexmBD1b3A0mu8dtQu/IQVPHH5rWDyQUl0ip44qeHp4pHly/evjNkRxWr8lxjC99WgxtmSFvylazTzOr1oUon4QhrzpDTbeIHkWBAyni42il6rtQoodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nopL8+k3o/tabKBR/yVcNwir6xe8rKnJIOrq3/WBXaY=;
 b=H91n5p+LWLOCU4DStb627soIi+uHa+UH24d7wTklUPWGMHmozyKSAYx4fLLd/vNeAXEveOhqPaoJcqBiiQrV7m9J1AGUBDqq7lbhxd1aIbXgwGexb4axtKDvQmdpRjS5q+YhmqVTYYxHeg3GfrQ8LKDQbvOUtgbKtEmH4mAKCxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
Date: Mon, 28 Oct 2024 17:38:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
 <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0314.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: d948fc5f-61e1-47de-89c4-08dcf7775b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkJmVXh2cUJrdmdaenI3ZDJmS3pBbkYxNytUMENWdjRDK2JwUVRHd08zT1Qw?=
 =?utf-8?B?bXhlODNQWWIyU05Uek9iSHlJbWlLSnNqR3IxQjBkbGN0UFcyYmptNno4UWRT?=
 =?utf-8?B?MFZvRHg3R3NHZFgzZFBmc05NN3c5RHFCUEduR1JPYVVBNHNQWWhnM3IxM3Vh?=
 =?utf-8?B?V1hmUHRhWWU0OUI5T25DMEIzYUVNejBueVdrRXZzTkx4NkpFcHhoOUoxSjhu?=
 =?utf-8?B?OWppc1VWWldOeEhVUU9FS3RFN01HSC9VWEhTTWR0MEs5cEliMlJadC82UlBQ?=
 =?utf-8?B?MUJDRFZkblNPYXp0QmVQWVNPL1gxdHRUeXhmbjI4c3BRNUhUS0g0NEdLOXQ3?=
 =?utf-8?B?dUU4b0dmaFhqUUZ2M0RaT0xndFZsRnNqWS9PLzNCOGxuUFRHTURwQndzakJE?=
 =?utf-8?B?ZEo2cytVZGVzTlp0bHVqNmFUakt4NDNrYnZIVGRFUzlKZGVvd3JtcGJOMkQv?=
 =?utf-8?B?bGVXS1BudXpzVGZGc3ltdDNvS05iWGs4TjVhZEdOSWtITWg3bTVLUitLTVdV?=
 =?utf-8?B?NTREUVVuR2pNZTdtU2dWV25BTGJxbE1Ddi8rZjY0UzEyZ1AyU3JidzNFRlp0?=
 =?utf-8?B?VXFQcFVoczRLc2NyVHVDZDJkQ21GaW9kVXJTZFprMzljOWpJTkVDeE45NUZt?=
 =?utf-8?B?TXNBKytnSUhNUXpTOFQ1OUV4RHNsQk9QK0VxS2ExSVFoMkk1U0w3Nm1QMzUx?=
 =?utf-8?B?dzlOc3pGQWh1bDY3ZnRSTFB3SkF3WEY5Nk5QemN0N1Z5VDJTcUtKZXQ2RFpk?=
 =?utf-8?B?VEwwQ1pXYXlXL0VkcmM2ZkdWalVqajdoWjg0SlFadHQ4U2xhZTZyb3ozWWs3?=
 =?utf-8?B?anRoT0h4N3dPQWMvdGFsai9LcFJ3cDFMeTRlc3NUVEFQejE5RFV6ekJoMGgv?=
 =?utf-8?B?MDlVMG5qMlJpV2gwQzJFK2VoTzVEK0dtMlc2aVFyWGpkSWQ4czNSTUhQSWVL?=
 =?utf-8?B?YmJZTWE3aFVmTkFuL3lLWEg1R3VOTVJoZEZQTFBQb3JNZ3kzN3JRMkF0U1Br?=
 =?utf-8?B?Rkd6NUhRTzlUYkh1NzJyMWoyRXBOSlJjZlFjMDVPRi9IOUk4b3ZKbDhjNmdy?=
 =?utf-8?B?N2NCQk5OMjl1KzVZMWVpR2REQ2txOXd3SkJzelFNY1lmamtnQWhkWVVocnhB?=
 =?utf-8?B?UzlWUG9GREVmOFBSVlBXMmRYWkhCSVM1VDYxVnc1RjlqakdQT2NYV3p5TWc3?=
 =?utf-8?B?YWc4R0tOcWpkYk8vNkxMcGQzMWpybmdrYXNvZmdxY0J4aFFZKzE5SUhqV1Rv?=
 =?utf-8?B?Y0tzS2pERVhpeGcreVRRbElLNCtkRE9KWVE2NVpZOElFZzlrMUhpSlZhbnhE?=
 =?utf-8?B?b09WVDg0VlhRMEpQOGRYTDZVOEpqb2UrMEhxclJ5c1J5eEgweFR5WUF2MXor?=
 =?utf-8?B?a2RNZVdQYjlYaFpycWkxSUY3N0hpdmdsNi9Tek5KRXB1N0hsRWQ1ejFrN0Np?=
 =?utf-8?B?SUxYM2twblF5em9DdzN1WUFraWFBRGtneER2M3pzVmZ5YU1MYnBaaFR4bDhY?=
 =?utf-8?B?cWZ0UHRuSEdNM0wwQWtFakVNamI5MlRjVjd1TTZMR1pjOE9Ub3JWT3Nza2V6?=
 =?utf-8?B?RWl0TWMzaWhweEd5a3dXVjJFZlpCaStwS3JHQWVpOER1WWxLRjJkVEc1ZnhP?=
 =?utf-8?B?d2w2aDNUekRiNmJ3NVpza1FSdlhTYlRWc01mSTBkQk4rcGp4QXBMNjZTR2J6?=
 =?utf-8?Q?RGGAWgn3h1vl9bR6uIkz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldTbVduck1VR3JWam5RQTJCZzRVU1d3L0ZrdU43eUE3ZnAveEp0NlphbFZ2?=
 =?utf-8?B?VU14ZUlpV3JoS01RU1lnTmVnMTB2WmI5NnBjNGhPb0RkUWFuWTRWbmdReU54?=
 =?utf-8?B?SU5MY3p4c2RNaFlPTFBqUkJWcjFjZ2dPeUJUbHpxaWlpT1hwNXd5ZHZqWi9U?=
 =?utf-8?B?eXY4cDd5WGNERUFXS1BOTEw3dFBsTmZQR3VqMHNMbkxsUGtKWnlaMlB2R3Ft?=
 =?utf-8?B?ZjV6VlpxTVBZcUdLWSsrclhPTFRJU2xoZ2lYYWRIajFYSVVuNFlEQWhKWGNB?=
 =?utf-8?B?L2tzd0lWNnJ4U0Y1K284bStkSFNIcTNkT0hROW5OUEVKTTl6WTV1NERxZXV4?=
 =?utf-8?B?bUFuMUNPb3JHeU8rSVZUTHJKazd3OHREWVd1SVltb2tQVFFDajRna3dpT1h0?=
 =?utf-8?B?MktFeFY2TEJmaFk1YitOVFNGMEo5dTNTbmRQWnE2U2JBWGRjcUZETTdqTmdH?=
 =?utf-8?B?NDlNMTFkMURSMVduY2xnTkJsSG1oWE9xUWo0MnJsdFFlcVdqbS8zc0VmSEQx?=
 =?utf-8?B?REdJYTYvZ2c0UVdhL2F0eEZ0ejdXR2E0YTRVR2JWZmVRVVhRekxHd1dNQ1Ru?=
 =?utf-8?B?VjJtQ0d6TXYxZmhxaExOSEdJVkp0NVkxWVpnTmF4L1BiOXlhdlpYck9KMWZH?=
 =?utf-8?B?N1BzdHViR1FISlZhQkZxelBTeXlxbzVsYVYydDh2Qm5ZRy9nRDNuVVhHV1FO?=
 =?utf-8?B?Ny9uRTBuQktMWE5id1RYVjdEOUphaG8rME1mN0F6Wm1pampYeURpYVhXbFZ2?=
 =?utf-8?B?d2cyNEpaMXFBc0x4cEg5Z3NVeW1tOGw2NFVvOHRWTWlvSGFBS3dsUzcvYmJF?=
 =?utf-8?B?STR4VENVR29pNnhPWW0zU2Yxbm1VcEF6aUVMcEsrOWx5Q2ZvRmptc3Z1b3FW?=
 =?utf-8?B?ZWtMZmE4ZWsveFByNHlmUk5CRjJpcTBKQmRsKzV6aDVGa2VMUlQvcTJUR0JQ?=
 =?utf-8?B?Zkh5STFWNUJRVU1aY0VIYTJEZXQyN2kvUXp2NlJmc1ZjVENQODIxQS9HdTY1?=
 =?utf-8?B?MmVxdFNFM2hsNGdDZVpURjU3NGtQdHRrTW9nZEkrb2VtUGwwcmtRLzFTVGR4?=
 =?utf-8?B?SzV5UlQwRTI2cVExU3Vxc1NzUEZSRzZMVXVkb1hDdnluRXZQY1Aza1NNRjBH?=
 =?utf-8?B?cmxRQlIrajFnVElTZE5INVNpTXY4SFBxRE5ndTU1d2tYQUYxdEsya0w2Q0Ft?=
 =?utf-8?B?NWtQNW9lWU9QNUpOaTJ0V1dwSUxNT2QxdXY2ckhOd0VIcGRDZlkwQUhaT3Jk?=
 =?utf-8?B?ZjFtRTMraDU1YzRoaTBQRXVBZC9XSzVJL0JpLzZsUzRmdzFDQXd6WWkwTU5J?=
 =?utf-8?B?UnpRemYvL1l6bjR3MzB3akw1aTNaU2hHWmx1ZTE2ZEtuQ3o2UG1qak1NS3pF?=
 =?utf-8?B?MTNIYWo3Y25oZHNaYXZIcGFwaDAxa1RFeGtZbVU3emtkTjNQdHJWMU91cEw4?=
 =?utf-8?B?OEhoeTNRQ1FvRklQdlNEeFUveWkzUXhZYWVQeTdVV1NFOVZqSE9kcjgrRmE1?=
 =?utf-8?B?UE5KVFdXR1cxZ3MyUm5NTktPK3UxZEpSMUZQNExYOWlyK2pzU2p2UXdQMkl0?=
 =?utf-8?B?QWtwbzlZU1lNUTk2b29CcmdCZEgyakhWSmtyOEVkcld6Z1M5VCtablZtVTBF?=
 =?utf-8?B?SHZ0MklqVlA5dUo2R0ROSFJrbEFjenJXTER1SHlteVhURXBYQjJLZE5WdXJC?=
 =?utf-8?B?WllQeE41NzljdmVYRjN4b28xbGdwZG5yWnMycUUwOWl1WmxBN1oyTHlpL1lO?=
 =?utf-8?B?L3dOZHZrVGNMOVF2bWl1QkRwdlAzcUpEZVhqUE8wWk1UUmdtMnRaeGtNbUhX?=
 =?utf-8?B?WlFwcDV1eDlzc1dPSVRYMkpKeUZGYmFSOHd0MTl1WUprTnFFY3cveEhxcVRq?=
 =?utf-8?B?VDA5NjFhWDJlK2tobjlPUHE0WHBNVjhadndqVHBteDZqVzV0Y0tldDI4T3Nr?=
 =?utf-8?B?VzJjOFlpVTh0eHlLOWtGdmtZcldNVVlVa28zL3ZDYThkbG1ycXNib2dGMUJ0?=
 =?utf-8?B?RmQxT0hDS0hnQlFjRlVISWlJMVVJQjgvR2hzT0FuYWlqK1JxT2lVZHhVcFZR?=
 =?utf-8?B?aWlzVkVNc0crQ0hOaTgyNURraktXcVdtd2JzK1J2MDlHd1dnWFZkZko5eFlz?=
 =?utf-8?Q?W/vPAyP9FvdS5GciLLYNIMxpA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d948fc5f-61e1-47de-89c4-08dcf7775b17
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:38:38.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaNe7+UALlyiaRCveUZR33bj2NZdq+oWOb47RhJshg3e5lSlplW55+tDojR6VGQ1hx/y7aEQVjVJQ1azJi65zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269

Hi Jan,

On 28/10/2024 15:01, Jan Beulich wrote:
> On 28.10.2024 15:39, Ayan Kumar Halder wrote:
>> On 28/10/2024 12:55, Jan Beulich wrote:
>>> On 28.10.2024 13:45, Ayan Kumar Halder wrote:
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>>>>    
>>>>    config NR_CPUS
>>>>    	int "Maximum number of CPUs"
>>>> +	range 1 1 if ARM && MPU
>>>>    	range 1 16383
>>>>    	default "256" if X86
>>>>    	default "8" if ARM && RCAR3
>>>>    	default "4" if ARM && QEMU
>>>>    	default "4" if ARM && MPSOC
>>>> +	default "1" if ARM && MPU
>>>>    	default "128" if ARM
>>>>    	help
>>>>    	  Controls the build-time size of various arrays and bitmaps
>>> I'm afraid I can't easily tell whether MPU can be used together with any of
>>> RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
>>> up, as it's the first one that has a match on its condition which is being
>>> used.
>> MPU cannot be used with any of the existing platforms.
> That is - qemu can't emulate such an environment, i.e. even QEMU and MPU
> don't go together?

Qemu has support for Aarch32 MPU at EL2 and EL1 (ie R52). As far as I am 
aware, there is no support for Aarch64 MPU in Qemu (ie R82).

Even for R52, I could not get the upstream Qemu working (emulating some 
Arm reference platform).

I could get the Xilinx fork of Qemu (https://github.com/Xilinx/qemu) 
working which emulates AMD's SoC using R52.

However, this should not impact the current patch. There is no Qemu in 
xen/arch/arm/platforms/*.

- Ayan


