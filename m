Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1A76541D8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 14:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468534.727651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LdK-0000tx-LN; Thu, 22 Dec 2022 13:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468534.727651; Thu, 22 Dec 2022 13:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LdK-0000rf-IZ; Thu, 22 Dec 2022 13:29:14 +0000
Received: by outflank-mailman (input) for mailman id 468534;
 Thu, 22 Dec 2022 13:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8LdI-0000rZ-Jq
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 13:29:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2043.outbound.protection.outlook.com [40.107.8.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d1fc1a9-81fc-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 14:29:09 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7720.eurprd04.prod.outlook.com (2603:10a6:20b:299::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 13:29:10 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 13:29:10 +0000
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
X-Inumbo-ID: 9d1fc1a9-81fc-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyB3ZV7+/kibrxd3JGsZUKMefwb9CZ6m9MlRv1sx/oc8RyEv7jjFMA97E41kTo1GGmr4hWt61B8Tu4rw1bK9Y+r4USnOgiosuKOUgchlCEsheTN4vKS5Sxe1uH3qEU0Uyb9b7nCZvIQQhM9hlCfhMtCY7FWzXhM8LE3h2wMplN6fn/GmyzDD3Qw88F8az5UGJY28yJddUFHP6f42LypuAVXT9vB0yGmh5o0cyt2cEvFeiFSm2ikya7Z8VWoYNWecZpZN0rTC6JcQiuO/7brYk0YCoM+t8/ULg+tA29oee/UqgxPk/M8WWZgR77QblaSPiLs+Umger+mkXj6pCDWX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdSO9IcI/EShL/Y5dZ520U7r/P2gmaVkQwGdvlYfG+4=;
 b=mKqLG2RwnW63V8wvXfBuaL3U0iNdzCo/pZOdC5pFgCVkXozwTv01oJ0IWrY1d/9Z0eeZgQXTtmRiRPd4dFnI5osqwT2Mna7c87InpDXM8nkw6DzVAMRaQVW+dZ7Ba26N8s5Gq8uuFUxxeGQZgIjJYZ7CzHXRs9fHHPiaoQcFDS4TTad4DlZoW9Ee2su7ehYXPHed3nmH542m916jZamu+RP08simv9l4FJs3NT1fiFS/qAqiSyLNitxv9DJqRH8RqQYZPhiK0+WyEKIaPObiECoEDmlxMPJM6XfLpU1VCtv/xSPqjJpRacDKU2KnjTTJaEaI2lRMiPTwMwO3Ab6w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdSO9IcI/EShL/Y5dZ520U7r/P2gmaVkQwGdvlYfG+4=;
 b=sn5pmOv+30FTfeuPFNg5tbK2ylXqrPzXFQxcxLazFawqWs6sHy/GhC7alEnGkiwMEH4Wrx5xHKSYhv8wLuF7PmTACNOw4UtEgUdKo6PZ5zHj7/uUX3v1YcbDX7rFVVfiwTb20s7JvNbJvrRfnrMnObYwL1IGqyYcZsS1stqGxmqO8OlYh8lt4sKOYoUOLnS/osWUokpNCcQ6N0N6WFlzse3oEb7g6j450zRH4GcEfGz/01BjDTKpAsp9Fq0b6kTfqQSNnyvWWVlbhfxZr0WyERQyRF6yNGbN0zAT4kpUOQ8UiYUj/dpPpTq/JzTTcatuk/qY8fpOdElug7BiNhNVaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23815e37-f474-68d5-1315-faf33b8db460@suse.com>
Date: Thu, 22 Dec 2022 14:29:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/22] xen/arm: fixmap: Rename the fixmap slots to follow
 the x86 convention
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-13-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-13-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f00946-dacd-4889-3a19-08dae420822c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K+H3gmHlpe3cfDYiPOMhWjKVmdqrE/QnOLvu8iXgN2C+ZZ1VRy/VV3QxJnutzBOLTat2Di7MoEojC0YX+Mk8MpYhk7Qgn35cY34nBKXPpqMpld/vgJE6WJIWAXbDQFJBDPugeT0TmdVrr9P/QtYmMD+GQgRS5AaEgcrEnsE2W2h1UnV0483POG8WrFjjHpkSoGTp9WByAi6FTxQw/XzkNdoiDCCHCUCsDHyZ121t+z0p42n2BXOrWESYVm4v82W0MTsftY2K4i5AujJf4ANfdtk8w8jUG6/lqkSVRvNqFOMZUyi6F9pUcs1U9Du5YVyYjTwDXxglcg5qSZhdVsHPI0QrWiRqz4ltyO/bK2uUnmSxzHGmUC3T91jJ9jQ5A4vE5tK4y42YwHx09H657fp5xise1thQCgPGxm61Z2ypRduVHc/yCK7IwHIY1lKosBekiAcZZRCgTiO/z8Oa85HAdyYEN5AsvB8ShIwUaMWf++DawNIN2+495Tx7pyFF/7TxABiH7/cXtdFxD4Dv3H54+U5dtMswp4qbXbqwaydX/aHMQZ+vRvRJvdllX81Fb8QKT7aD8VpUmo6AAtuTZKH/1RYeWbNOVFhUiHnDpZq7WF9W9NawXeri5Y+7pyc3sC/cl0qhvVV4fv8i9oZwo2jKkAZ5Mfu32BGcmYHk4ft4fjXrvacMzG9Z8eY7XE42HyvmfpkRKKqXbQehFw6HdtV5ijtXNFL4EepMxg7jSvt17ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(31686004)(53546011)(6486002)(6506007)(478600001)(2616005)(186003)(316002)(26005)(6916009)(54906003)(6512007)(8676002)(66946007)(66476007)(4326008)(66556008)(41300700001)(8936002)(5660300002)(4744005)(38100700002)(2906002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm8vTEJBTG81SXJ0a21GQjNKdDNzOUhNK0lFeXZIRTVtTVkrZlN6RGh2L3lt?=
 =?utf-8?B?d3g3Q0k4RmNCczY1eDFYenZodUZHMEhDanU5NXI3RktpSXZycGhXNEN6WmNv?=
 =?utf-8?B?SExOc1kzRUVFVXBmaUtCVTRiSkw2RVBnZkdRRFBJZ3FvN1ZqSU91Vk5MWksy?=
 =?utf-8?B?MmY0b3M4S0xVc2UrN1BZeGlweHFjUjJBSkN5UFo4bTNvYnQ3cVBGbTB0VGRI?=
 =?utf-8?B?RGlkdGJwNmE4R1ljY1haYkJpYXRBQzhjREpteTFXaWFzS1gySjNsdzN1cWRt?=
 =?utf-8?B?ZEVReE13em9xdm8zbWhIL3NrNzgxSXVyN3FXUzJKNHVVVFNwL3BkYzZUVmVF?=
 =?utf-8?B?M1pTdm5kZ2EyOGhSMk1XTnlGRHhqaUJLeFpLOVdvc1RPM29nTXhuZDdBRFp1?=
 =?utf-8?B?MUlaMTU2SWF3MlJsNWRFMmxQUUVNTWYxQ3UrQTZhTHJQZ0tIalA5MVJsT2d3?=
 =?utf-8?B?akQxeG1kaFZJN3pVMHM4dHFNSGcxTFl5cjQ0L21yT1Z3T2dyNU8za2gweTVU?=
 =?utf-8?B?cEVvbUFFWUxVZTg5cldNcUZuNjVHdDZrNzNzaEg4VEozNjNEZENEcUdJbS9a?=
 =?utf-8?B?aFhVOXRienBNd1N1UkZCUXZab3ZEY0FyRHA3ZGR5dlMwYjhXUEFIWmQvZ3hO?=
 =?utf-8?B?KzVndzZROFcrRGMzNjBTYi94cUlpVE9YdUx4dk5OSWlWOXNZazNKbUhsb21O?=
 =?utf-8?B?ejIvK1FTb3F0ZkNGSTliTFpudjBHZTRqQ3ZvU1FQbWFiVDBNTk1nZi9yZHV6?=
 =?utf-8?B?NkVLRWVyNDV4bXc5TUp4cklTa2JDQThtakRLMlM0THpkL0ZZUWFuaGgwRUJC?=
 =?utf-8?B?TUkvRzI1NE55OWd2TWg4WE4yTUZ5MUR6cXRBUFlNamlrcVNybExZdy9FcTFw?=
 =?utf-8?B?VklVSW5Lb0JUY3QxTFM1SkhzTjNRaFdXK1R4NnJxeGlqUVhJZmxkcW0vVVVa?=
 =?utf-8?B?WTNSM2oyT1ZtbXl1V2p3ZXFEWHdHeUYvNHlZeG9LWHZQK2NNSU5CSGNyMUEv?=
 =?utf-8?B?RjU4aDQzd2xwOFRqQ2xsTnZ1djNDdmNRMEk5M2FuUnBzQWF1ZC9UOVNzL2Rs?=
 =?utf-8?B?OHVBNTZ2L2d3dFJnVW5iQTFPYnUvaHRKUFd3UnFUVWRJL3YySVZ3dFp2d0FE?=
 =?utf-8?B?ZTRXdXFqd2xYWXBsVXE5WXdoUmNzRHlFTVIySjRHelVnazQrN016MjVPYjYx?=
 =?utf-8?B?TTcrK0JDM1d0WGJKQVpBVWphc29mWHF5cFFhdVB2Tkdpb21WalR2eTF6TDdh?=
 =?utf-8?B?NkJmVWtYcG1LUTB2YzNkRm9TN1llV3NzMU9SMzh0YmFJU3g2L2xrUEQrdkg0?=
 =?utf-8?B?bnVacTFKbjB1VTZ5WUUycGtoenpvVW91a3RDa2NRY2hBNE83Sm5Sb2FxYTZT?=
 =?utf-8?B?bEFqMHVJTUJWbS9MdXptNm9SWW04ZWxxK2pwcEJkMEk4NDU1SlBWQlhKWWVL?=
 =?utf-8?B?NCtvdmU4NjJMT1REVVhpdWh4UWNQREZnYnAzTFdLUy94RlFVSUtmREVkK210?=
 =?utf-8?B?MHZQY3c2MTNISWpPdm5udzlXMFFnbnJLQlh1UE5YTlhKOUxSQ3FYaFBHQVVm?=
 =?utf-8?B?cHRzelpLNTdCK29wczBmTXlwaGY2YUd0Um95MkFueVZxa2JCZ0lYci9zZW5E?=
 =?utf-8?B?cDZhaHZtSnpUcXlJMUFmRGY2TXFvUC9ZcG1TS1ZyWWlQdWZhanh6OVR3VExr?=
 =?utf-8?B?dzdqU3BPMVlNWlpFOFovQXNoR0RXQU5mNjBFQlFVV1FHdXpXeXAxakVPZUV0?=
 =?utf-8?B?YldWVEpCcURQTWUvT211T0pmVUw0Q3hpbTAzSmt0UmZva2lNam9kNUk3OUFy?=
 =?utf-8?B?dnZ3ZDlXNVNjUElTcWZPSzdIU085RXJsRys0MzM2THo2WXRFSkNjM1pROXow?=
 =?utf-8?B?V3M3Q2Z6S0RSM0FlYUw5TUVVbk4yam5reW1vLzFCUkEzMUY3SWVLY2xnVlJi?=
 =?utf-8?B?QWRzSTRUVFgxTVBibTI5TlUxZU1QYmpRWC9ReDVZMFNsWloxcThLQlM3Vko0?=
 =?utf-8?B?aWh1VE11NUdGUkxsWjhtdnZld0h1ODVjRDZFeUpnZ25Da2dNNUhnZXVKb2xq?=
 =?utf-8?B?VXNXaCtaR0NrVEkwRlRpOVlGNW5JVk1iZ3lUd3BNQmtKTFVCbFE2UnVHb2JN?=
 =?utf-8?Q?Dah4yCfdfqynfZeV8L3G0DTEv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f00946-dacd-4889-3a19-08dae420822c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 13:29:10.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzLWOUTh7IKcBUfn4wMYTBEho/J03QdnJ9BMrPbckY7FHbZusScPYbvT5YnJEBHNrPi04SZXTzQ7QiExnILhVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7720

On 16.12.2022 12:48, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment the fixmap slots are prefixed differently between arm and
> x86.
> 
> Some of them (e.g. the PMAP slots) are used in common code. So it would
> be better if they are named the same way to avoid having to create
> aliases.
> 
> I have decided to use the x86 naming because they are less change. So
> all the Arm fixmap slots will now be prefixed with FIX rather than
> FIXMAP.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



