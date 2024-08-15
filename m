Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF0952AFC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777916.1187975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWJM-0002qs-8X; Thu, 15 Aug 2024 08:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777916.1187975; Thu, 15 Aug 2024 08:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWJM-0002pO-4y; Thu, 15 Aug 2024 08:58:24 +0000
Received: by outflank-mailman (input) for mailman id 777916;
 Thu, 15 Aug 2024 08:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2AJB=PO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1seWJK-0002pI-8o
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:58:22 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857fe005-5ae4-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 10:58:21 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 08:58:17 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 08:58:16 +0000
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
X-Inumbo-ID: 857fe005-5ae4-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKeMgatSC2yVxZEKfZ4ZoQHDe5R5ulLNJ+9iFFHY7xKRMosBMjxcbY7p5OLp8V4FPUFojqXCu/9GpeR5hWyeKMoZP31x10TCQ6JzIXT06bbw+FNxpLCBiSTuCBNKzhY3WjtnZOkfzvVV3zHOIuCeB8HKqau5gp0R7F3b0ZbKrKdF3OiLju6UKgHJE44QIWwMAm80Yiz9QPUkdvZjfzlqcaOejy7vVum1WruHqWb+HVKz5azyD72zhjrDLSiz3vKryoptp3xcHHF2+/vJQp3mk6ZOQdbmHGVpqRFl33ERdFk1jZVrZXuon6jmmTv+5vJoiuGa2KfhYZ5VUmuwRzbWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFnrv9fbL7ZUs+Z2t4Wb/IGZdm7n0CDTN16K0+B4ekk=;
 b=Bxay4vmD46PW/pp/KSYN6eDcS+Hqv/eHF5fwc4yJmkpdao8WReUVFB7gkD/bNfYlyuZmJZ85OkSPmgTpTB/Xe7uVlI7abZxPHR5Lw9oIgeoOQzLeaHLJhuTdocyTbiEL8frBqkQT8HxvyOl+fDhdAFtknDr24agw7ZoCBnmNbsWM71vfkKo02trL4But+8874yQf/8Yiti5BUeZf2HeXWt5BEUX3uYto+FCgxUW8UBF/qIVtn/ax9lEL/mnMjZ3C8+bj3jPzmR2aVyVEO9mICBTurAHK5Bi0QbERg/9mY4mHtz+8EvFmS6FOSoX5penaMbXQZEOsM0Wr9hcYzdblOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFnrv9fbL7ZUs+Z2t4Wb/IGZdm7n0CDTN16K0+B4ekk=;
 b=0UjZxlhI3Ri4X72+B8mQxJgaqy2IPgZ/b0v3K747NzbHYd1wPT6U0JvKvaxNWhFPt3WDHhhmqHQ2pyv1Tpzg6Z9hSY/qvoBRVa2KzI3ecQrABft8lHTY/fEYB0tEf2JCSttNkH5DAy6XZ2zs6H9e+0KGic8NW/v5tBes8R7yhOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22dcdbbf-5000-4b92-b746-5e01c0160776@amd.com>
Date: Thu, 15 Aug 2024 09:58:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Hide FEAT_SME
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814210054.67520-1-julien@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20240814210054.67520-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aee1947-b9d4-4266-51f2-08dcbd08670d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEx6TTF5NFl4OHNnbWlBb3F3K3dFVnBQQXRMNGh1THZQTjZvMFZseUIzZXJ3?=
 =?utf-8?B?Qkg2Z3p4NGdxcTNtRWFBQzJTc01SQUNuMUFCeEVraWxZVy9IUWJHUG9VZG9q?=
 =?utf-8?B?NUw5Y2lYOWFuUEk2VlRvdnd1UlhQRWhSNzRQZFZCU0NwYnF0c3o4dVMvekFT?=
 =?utf-8?B?QVJhWW55TER2UGpwRUdSY2hsVzJvemI0OEo5S0J1b25iZW1zSzh1ZnhDb05T?=
 =?utf-8?B?bVBaZm5tUWJGQUkzdERCVSs3Z2k0ZFNLTExsTmExZElIOG9XZEMrMFZuWk9B?=
 =?utf-8?B?QWtnUFpCcGxDS0N2Z0huZkVkOE5FZkt0YjNXYk9vK0dXUkw3eDdzbk5ydWlU?=
 =?utf-8?B?NjliTEloUHdwVUtGdWlRMUNkTW56RUFWREhJZlRlSWdxMU9JbXR0TUhuMmVW?=
 =?utf-8?B?YmE4emZiTm1lRnZVRC9mdm9EeDQvR0F0eWpvMXJSNVVUeDJwbDFtblpNaXpt?=
 =?utf-8?B?NUNJL21JTFpjdnUrTVlZaU9MZ044UkU4VWJFMCtLMWpNNmsyVGtsL3RvRUhz?=
 =?utf-8?B?MytqOFJiSGFEblFEeXJvbFBLOEZzWEVwNFVMOEllSWhucXh3Rk0vekhpRVlL?=
 =?utf-8?B?ZGhYUzBLeHAxQnpPSjhNbjloajloZ0c2K1BCVHBQVHlRRzhPU1JpSGpUYWFT?=
 =?utf-8?B?L2VBZEZWSkh3blVkSlRQOGxuNkpNNjFybmJlcG1oUXdubHoyWi9LRS9XYVJw?=
 =?utf-8?B?SFNsdWNVYitZSGgrUk9kK051TUlTREFmSW1JeldRT0grL0RpUlo0RGxoRFdi?=
 =?utf-8?B?em90NTNCOVVWNlBYL0orQlZjRzYwQlFxY2JNa0cxY2NCMVdBZzdkemRKcU1E?=
 =?utf-8?B?a1NPN0taZStyVGllOTJ2QndBQkVIZ05FbG1RbUpJYk1hUVJ6N1ZxanBWWGo5?=
 =?utf-8?B?NS9Rbm1FcDdjTzEvUGRVdkdsTlU5Z2hXKzE1OHhyWmVnR242OThoenBpZ0Rv?=
 =?utf-8?B?cnEydS9oS3hTNEFyOHBjUExLVVNVdktLT0JzR1JjcWxqeFl0UjFIcDdNaHYw?=
 =?utf-8?B?NXdJZWtjSEVRRWNHSlh0M3FPM3kzRVFidHJDODVZL3lkeXVzNS9tank1ZWlh?=
 =?utf-8?B?UDkyTnBGcnB0S1lBMjFucjhlZkRwNWJ6NFZGcDNkSloza0JDdVI5cVowNDVy?=
 =?utf-8?B?YTRhTjJpRzhuS1VJNy9EMkNEaEpVWHU3ZStBZ1REOHBOazlBdUlJR0t0bjJX?=
 =?utf-8?B?Mm5tbTA1QXJ3WGdlRTVPaWNIdXg4dmRURjFocWhaM3JVaUwrTEFZSUZJQTJi?=
 =?utf-8?B?ZXJVUW5rOWRmb0dIc2xUVDg0WEtaSEV1ZjNsdmoyMkdmUVcyWUREVkNlY0RR?=
 =?utf-8?B?ZC9CWlNmNUtiQmJwdEd0cE8wekVPdE5US09VSzhreTR5dk9LWjdZZzBpbGhO?=
 =?utf-8?B?TVliQlRJbEx6SFh2aG56ZXlvZG1oZHdrTmpreUVJRkJvS1ZWc1EwaXQ4bWVv?=
 =?utf-8?B?YWZpcFlOQ2FSamk5bnkwNW9LR1BJdDl5UlBxbmIyN3lYcnRSWFVIWFAyYXJ5?=
 =?utf-8?B?aElxd0pPTTJ2WTFwOWpwVE8ya0Q3UXlZTXVCNFhWajlob09xcU5idzZuRHJS?=
 =?utf-8?B?eTZzMzl0bjY1aHZPM093TWFiaW53NU5jT2FLaU14SElsZ1lCc2dSbUkyMEhu?=
 =?utf-8?B?dU5kR242VE94SGNWTDY1RUpBcnJHWXp3RGRQa0paZHZJbGMvTjVWaElmeXNs?=
 =?utf-8?B?WVl0QTk4VXFQZ01zVkpJVXNndkNHaGRNY0t4Zys3Mjl5YkppTWVscjBXcjNL?=
 =?utf-8?B?cEJ6Z2NTaGpraUt2MENHSEZGYzZzVkl4MkxFdFVnc1BQREZOOFByNHQ5Njcw?=
 =?utf-8?B?UjB5alF3djAyc1gvVXFJQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGdHRXVaODZwOEc3TXJhWFNiSFA0SHpTbWNZRmJ1RzVOTW52Um5KLzlrMkg3?=
 =?utf-8?B?a1pIa3hmWlhOTTNKQXJFTlZYUWFJWlBmRzZZLzNrdDNweVhndmk2TlJDSTBj?=
 =?utf-8?B?VzJ2aklqc0lBSjZYSXNwaGRZMm16MmNrbEc0dy9WZy9hQ0VVZ240TlRVd0tl?=
 =?utf-8?B?WVJORzBVak9ZZklJL1JFdVZNaHpTWkhrVzNyREtxUzdHMkk1dGc0SkIzdDh2?=
 =?utf-8?B?NEhpMW9wSlVWYU84SjZKTC9RQjlKYVRTV3VlTmczVllDdHZRUkhFYmgvaHdr?=
 =?utf-8?B?ekw1bWcvck1sRGt1QWJyd2x0WjZUU3g2RTFBNVIrQzNBaFNWb1BSSlBPZksx?=
 =?utf-8?B?U1FkN05hZkY3U0xLdFRKbEpqb0U4VGxTaCtMcUNDRklPc0Z1R2pIRlhsR1pi?=
 =?utf-8?B?cHVQTmZMamxab3JPU20ycjRWWk9mc01vWGJ1Wk5QYTliOVVYT2hNT3FJWkta?=
 =?utf-8?B?U1BFNWI5MXM4VElHd0VOdzNGK012MjFyR2pmVC81L0lLV3hwN2JaRnJydUpB?=
 =?utf-8?B?bGgrU2U3Vzd3Yi9KdGVYU3lmRExQb0VIa01tMm84YVJLdS9KNDhtaU1SS3hF?=
 =?utf-8?B?NFRLZnVSSndzUGQ4ZGlKR2UyQnE0QlRtYVR0R2FUdnBHMEFERHIwQytxTGU0?=
 =?utf-8?B?ZzBFTGxBWXJtMTZvWmRiL04rUFJXTVE5M1F4c3dSbDM0My9TZ1JPdE9aYzJo?=
 =?utf-8?B?bGovVHRXUWs2dmNybDRXeDJWQmViSytMRHhnRDlyUnJ6SFNtU2M3QjZ0OXlU?=
 =?utf-8?B?aVNhaTNkMlMwcnc0YjN4RkpIVTFPRkR6ZWY5czFFNUJBbC9OQ0RwMlp4S2Fa?=
 =?utf-8?B?b0NoenVNZTAyQkFrc01ObFJTbmxGT25Kbys3M2lvZHAzMDI1aE5OdjJpOW1z?=
 =?utf-8?B?WS9Xd2pNSmw5WEQ5bHA2Z0grN0hSYndNUjdJN2QvUDFsVDlqK2M2STUxa0Zr?=
 =?utf-8?B?UFRFT05UWGpiK0tjRi9ZQ1N0UlYyWG4vTExvaDZCT1dtYWNETlkyWEprTkhL?=
 =?utf-8?B?VjdmQXlERVhnUkczd1IrSDZTMy9sWDRoN3VHeENTeVo4ZDZPaE42a0oya0gr?=
 =?utf-8?B?K2g1K0VRWjlQYkU4ejJGVTNRdFBXWHNvYTJMNjFaUzI0MVZrMjNQV3N3NlY2?=
 =?utf-8?B?ZDRjbE9odzl1WURIcS9Qbk91UGxBT2luc3YwVEdKQkZlQkUyZHl4ejRnTWhB?=
 =?utf-8?B?aVhDaURFMFhDekZKSXZ2bVY4MHZlL2tyOTJrS1QxUE44OFJneUNxSElEQkhu?=
 =?utf-8?B?d1gzbjBDUW9iVlNKNitMcGxtNnJwUEZETHRXNFRza0lXblFoS3c2ZEJLMEFm?=
 =?utf-8?B?SVkvZWdtOHNKd1pqbWpZK01TTjhJWHNjV2FlNUFKOFk3S0hBemxmaVBVTmE5?=
 =?utf-8?B?K3JCYjU0eEtzdjJpMG4rL0xBb3pqRzRpcDNnVThhWlFKelNxM0tKUXdWNlYr?=
 =?utf-8?B?Tk9XQnB6eTZTMnRCcUdoNjRvVWFCK29DY2M4SHFQSDBuZ3BLeVAzQmxGL1lv?=
 =?utf-8?B?cHliOWFiMko2TlNBckNVMGFtSm9OdGs4OE9uNTI5bmdmWkk4RUZUQVBOUGJn?=
 =?utf-8?B?VFM2VjM3RXdNd3hlUFl5MUlObXJiVUJCMlNxdVp0VXpSWHZFeU93VjNrVUxK?=
 =?utf-8?B?QlF4eklLaVJIcG9xUmlzUWN6QjJCNGkwUUcxWGk4SEFJbDJ5cjJiamg5ZjNy?=
 =?utf-8?B?c3NnK2h4T1hnVlpnajloUmVDazc0SjhiS2RwcUVJTitJWE14MVBUdnNrcmsv?=
 =?utf-8?B?SGY2RFhJTFpWc2JGUjI3c05hMm1VelpveldmaWFlcUhzbG4ydk5OSmNRbHp3?=
 =?utf-8?B?REgrMjAwVlJlRVNKNjJ1UkdBWTY0d0g1ZWppdUU3R0FlaFhCMHVWbCsyVTZn?=
 =?utf-8?B?RFVaQmtoeS93WmJuMG9PZ3NjbUhLOVhIUnZnWGRVb281N2hMNHVVZEhzSW9n?=
 =?utf-8?B?TzFlYXByZUdvV205ajlqQzZPL2RKYWFxQllaV0pZanJUdnlJRVc0ZHNON1RC?=
 =?utf-8?B?TWorWExGdGJhdUl3ZHpMb3lkeE9kWWxVb3pQa3VCVnBNNmRUa01oV2FPMG9y?=
 =?utf-8?B?clNORG5NSEVvak9nMlM4Y0lrTWVxWDlveWQ5TUFGcjlVSVRjM1lFSGV6dmJL?=
 =?utf-8?Q?q0UqdrTXAVjSrVSzURDcAk8QM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aee1947-b9d4-4266-51f2-08dcbd08670d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 08:58:16.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BpsfM5d+R3QY6QHOPZOj09fPFwVKVpB+TF/ojwF5+ojB9xuof57H2ZNhHbIJFhi9JDA8xUKdCngpn7m+1Ie0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240

Hi Julien,

On 14/08/2024 22:00, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
> it will still expose the feature to the VM. If the OS is trying to use
> SME, then it will crash.
>
> Solve by hiding FEAT_SME.
>
> Signed-off-by: Julien Grall <julien@xen.org>
>
> ---
>
> The current approach used to create the domain cpuinfo is to hide
> (i.e. a denylist) what we know Xen is not supporting. The drawback
> with this approach is for newly introduced feature, Xen will expose it
> by default.
>
> If a kernel is trying to use it then it will crash. I can't really
> make my mind whether it would be better to expose only what we support
> (i.e. use an allowlist).
>
> AFAICT, there is no security concerns with the current approach because
> ID_* registers are not a way to tell the kernel which features are
> supported. A guest kernel could still try to access the new registers.
>
> So the most annoying bits is that booting Xen on a new HW may lead to
> an OS crashing.
> ---
>   xen/arch/arm/cpufeature.c             | 3 +++
>   xen/arch/arm/include/asm/cpufeature.h | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index ef77473bf8e3..b45dbe3c668d 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -208,6 +208,9 @@ static int __init create_domain_cpuinfo(void)
>       domain_cpuinfo.pfr64.sve = 0;
>       domain_cpuinfo.zfr64.bits[0] = 0;
>
> +    /* Hide SMT support as Xen does not support it */
> +    domain_cpuinfo.pfr64.sme = 0;

Instead of this, can we do the following :-

domain_cpuinfo.pfr64.res1 = 0;
This would imply that SME, RNDR_trap, CSV2_frac, NMI, etc are not supported.

If later Xen decides to support any of these, then they can be selectively turned on for a domain in do_sysreg() (Similar to SVE).

- Ayan


