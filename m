Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04301771C96
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577848.904913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvws-0005iC-5f; Mon, 07 Aug 2023 08:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577848.904913; Mon, 07 Aug 2023 08:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvws-0005fw-2u; Mon, 07 Aug 2023 08:50:46 +0000
Received: by outflank-mailman (input) for mailman id 577848;
 Mon, 07 Aug 2023 08:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvwq-0005fq-LL
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:50:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1594f4-34ff-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:50:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7893.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 08:50:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:50:40 +0000
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
X-Inumbo-ID: 7e1594f4-34ff-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnBYKO04nSaRNyukKv1hlGfmO5rNHF4aPTgebARiTSptoSDErd52tBHdyoWjyw11J0PO46l/8/KeHJIi7280a2BHIuyaIBlnomlq3FFIBhwTuTjifsC1hynSBTMToGyRcREUifRj810dUw3p2PrjyNLuYX3FzIeeVgkkLYE6dua2VvIvJ1ZkpVEiECOsdhbCsrSE/59CxL4VUa5kvpoaoKK1IFRO8xpRfs2UyVafxYkSoavRP7TGSvqOpsNIou36+3dwS7ioHwfIyCs1jHq3fiTKMkSQVflLJRWeKxiFujV4hS+1vjIju1BQUY45B6EEmZA2h1AEhgp2W7971S/2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYwG75RdvN5ed9YDpfIalpoJSJXCbFx7UtoQRKyDjOQ=;
 b=OTqhXw1Drvm87/DeV9ZnOMHUes68UT8CwtTwcqvpEq2Mi14zgDuOxT0OepRT921XLe7nGNI41Zdb5PYQ+tvWWt0ge8fylCez8pEuKnsVD3PS1CbMSnOY14OTwmD/glcJcLH8/qFrvSLLQaj0vxW3BCFO6EIVaL1ITxOf/Ci+TmLx05qm6DABxJ8ummOC7HVnnhDBu0NkCyIhtwWI8qMMCnOZUv9X1pz2BcpuVDfMR223qVjlkvIc68uwuu3nxAxaod32y/3w0rzikA7h2vLPqWB0yMQoJ+mrm44UY7pHXRHDJRh5tWuDbSKZ9KPv87yPYnrOYojQ0jY/3HNz3o9vsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYwG75RdvN5ed9YDpfIalpoJSJXCbFx7UtoQRKyDjOQ=;
 b=KvG+Brsp/7NSVgjlUafxiVJ62fwDM1zibRK+OcOZG+SE6ZbtYeftKoYvEwBo7U4pqIqq0PjyUz/pYa2yorWx2vGc8VciUL1BSt9Y2Od/VZ1T3nklJE+5cG+PMKCbH5pWK7GC/n8C+gF6dYq0SO9N0QF9uSoeBNUgTwKVauW8XiRwfA3T9LdezvmKitQIQ9E8XadOXgBtSeUEPdXClt3V2iCJgcV/eLCQPCZjakl+wRT1u5mtw+fN95002bwj6QmkbfvmWFypCAPlNcb+wxKkcaMPLekZqRaWCfLHaAdJxSjT5HkVNE35usdDdvD3E0ZZc8kXSGP3fqOocspB1mi5zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90aad07d-9445-5916-fd3f-eeb08280de59@suse.com>
Date: Mon, 7 Aug 2023 10:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <d18a1e2c-4396-7d7f-bd28-2d9e71107862@suse.com>
 <4c5b5091ecae8b1314ba67825f4a959d@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c5b5091ecae8b1314ba67825f4a959d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7adb2f-0591-4c7a-a577-08db9723605e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Addp3JacsJdiwDmrknhNkaviWKZbDVawVJBro/l3gLfu4z+BVkDrlDVxxa8IM7UXdEXlBsJPsWD1krF+J+cZvjzHnxnEOoJB7Log6AwauXnTyOU7DhILSYR79trSDZp0SXw/spuvrMYXtttKpipSyWTVqhvG8kwngpKh9wtnFlOzZ/bnXvjAY+c/8fsUBkUZ74dA6I2UOrWyo7bKEcRARNNCLHmA4RZFHETZmob5WRAZePufuYvWKUlUeqFpbxbdcmdmeU4eW2GNeRYUAQo2dlph6TadCwJ/2xJqRzu1PYvUJLcPOzehkQMwwcf4qxurAcSevvsA1hGrTtYvM4TnYUry0+4N6Z+vfnLkkpejIECvCJmVMeQvpSR1DHZgmYu/jijvc6IR/llisD4a9u7skkLSv5KjXSw6JEf1uWcSTwIWaLnvKX33KlU3SNmEXM1sn4UhUPPPhatkjrsD+FRdPpAQi6Q8dDi56YwEf3qnaVXjc518zge7cew/GRdvYgvQIPb91YutWr73Oo8ZrXW5IhC9juslheG7Gevx/GgClVjbtsPs69ybGYF546yjPWRYV5xFjVTPuUehePgqVn13/1ATLLz9UReIFdmlxdn1FaLihYtnMlltZeUMJBTfMAH/GxL0RNlD3kkrFzdF6IZjdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(186006)(451199021)(1800799003)(8676002)(8936002)(54906003)(478600001)(5660300002)(41300700001)(31686004)(6916009)(4326008)(316002)(38100700002)(66476007)(66556008)(66946007)(6506007)(53546011)(26005)(2906002)(4744005)(36756003)(31696002)(86362001)(6486002)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWFrNDVJZzVwUmVhUmlkN0lUZFV5QW00OU5LRDl6ZTBMV3JEZHV0a0VZemQ3?=
 =?utf-8?B?K1k3MjZ4SmNaRjRiN1FEa1hoNTR6QTAyYjRCdGl3bVdyRU45N04zS1ZZcEdO?=
 =?utf-8?B?K0VzalEzRUM3Z2NPWmI1K1Q4TFZTZ0NSWXZuWXpjN3dqOUcrcW5TQU1FSHpq?=
 =?utf-8?B?Z1d3VDhSQkkxV1NEQ1pOL3VtWWNiK0I5Tk5CRnlwVFY0R3YwRzMwU3NqTlph?=
 =?utf-8?B?Ti9aNVVmRmtic3l4N1M4VkFDSXZzcU54Q0VXdElxaFJtTFdEaW5CZGozQmlx?=
 =?utf-8?B?UGt3NkdXRW5haDZseGZLd0FMSWp6UzRoQXpTa2Q2TDUwQ2NmQzlNSkVud2Z6?=
 =?utf-8?B?WnNKaCtUclN6d1Rva3FBaERUY014QWZ6K1ZqKzRuWWV0cGFqWTBsNUxKQzly?=
 =?utf-8?B?eTlmc0xleVkxT2VHdWI3K092anNLWnUvSzgzRGJHMnZMRW1Xa3JOVXUwMFlh?=
 =?utf-8?B?OFIxRTdERW1ZT0dTVGRrTFJhRUNLQ3VqU244YWNBZTlkaXNtT3dNMDE1Qzhl?=
 =?utf-8?B?UW52VlVMVDhQL1pJelRIdU9jNE5oL290aDJkbkRxdUlRTEI5aFBqQVFJTW1z?=
 =?utf-8?B?cFg5ellBTy8zVU80eGJuVDhzNzJWYXdxNTJqSWo1dmZxK3NhSzN0OHg4VlJH?=
 =?utf-8?B?cytGb0xURGRENHFlMHU2TzRmZ3ZmSVpOSU0zclZzSGp5bzNNSHpWMERGTEpY?=
 =?utf-8?B?TmFxTEorOHU5dEJtVjhpaC9kSXNrRUplaHBFV2NON2pBZVE4bWgyOUV2TENZ?=
 =?utf-8?B?MEtLUEVJZC9uRldreFhnNmcxOFBGQ2tpZ1NOSC9TU3ByNFVINXNsK2d2SEFR?=
 =?utf-8?B?aHZWWUtwelhZWTY4dytlZjVyQURoeWhkSHdSRVp4OVppSDQ1ckZnYXVHM3Z4?=
 =?utf-8?B?YUdUZ0pKaFdCSE16SVVrdGNhcktEdkFhaUVHSG9jNUtha0FxL0lNN25heDE0?=
 =?utf-8?B?a05rMUlNQ1VyZ0M1NFhlQU8zTXFkMkZiUlZEaFNSeEk2SHdlZDE3a2UrbURI?=
 =?utf-8?B?UmFKMDJ0aWVHQ1J4MjhDVXRZT3dPdHFJZzFsUWQ2YnA4VDhnMm1lelIxUHIx?=
 =?utf-8?B?ckpQWFBkWkxvV25MTE9RWE5OT1hySVRmTEF6VnpaTmJrSnVEZGJFU2o5UjZl?=
 =?utf-8?B?ai9RWStYNWlKMzRjbFBFdloybDVadFhPRmkxd3hmWjVjalU3RGV3Uklkbmw5?=
 =?utf-8?B?SFIrQmpoVmtuZ0tyQkVHNE9nOTE1dFcwSlJYZ0xXNnp1eUVyTm8xN2JORi92?=
 =?utf-8?B?bjFaekc2c3BqOUExb1pzT2lRMHU1bFM1QkRlR3laSWg4NndNb1JKZERsdzZ4?=
 =?utf-8?B?d2F1UW5NRHlscmJhU29Ydm91ZVBZUHVYa1RoN2x6U0FlVk8yN0VDT2c2aE4z?=
 =?utf-8?B?NnlBa0YxUFEwMlk5NHBzQSsvd2V4dk5zODg3TVNtcUNaNUZlTEZ5eEkrRUIz?=
 =?utf-8?B?eVpraUU5SUdZTkZoNGVydkFPY0kzd3pmZjNZdXVFVmZKWmsva29FZ3ZNRWJY?=
 =?utf-8?B?M0h2UlBRTk16b1pYMzVXTnFMR3kyUmVBUm95eGd2VzlZeEtERkdoRWROZGZ2?=
 =?utf-8?B?UndQeW0xTm9nYXFTdlZQQzRjbzdyZytzMWlQOWJubW9Xb3J5NW9EcHdZVVcv?=
 =?utf-8?B?T2lQTEJKN0NDMmxabVo1S2dIUVhFNlBFQkZjWUszUU9WVXk0TXM0VmIzMytQ?=
 =?utf-8?B?WTBXWS9aVkR0aU1rUlZLK283MVp3KzZDRTdMcW9kT2VlbllsV2h5MlJLelFL?=
 =?utf-8?B?N1U2dm9ybTNTNVBMczQyMWk5aHRHQnRoWGtqMisyVVZQTHoyNVVGUDNoa0Ur?=
 =?utf-8?B?TlI4eHRQd1VkRzYzWmhOOW1EbXlxSjVxeTVvV09hNTQ2anJXclVJQUx1MTk1?=
 =?utf-8?B?dzdrcnF5cTluQU8vUjlGWStHQUI5WUd2aUp3ZE96UmJodFYrWjJncXNEUEpR?=
 =?utf-8?B?R1NEeTAwQVU0MlVNRStOZ3lRSzBIU1VaemN1YzdLWmdUek1acm5BY2ZVblJ5?=
 =?utf-8?B?eU5BM0hkbVVWQVFVM05CTWMxeXlBRDIzOFBPYzV2UFJmSW12bVEwcWphSk56?=
 =?utf-8?B?ZnlGK3k0cktyZ3lUakdsbnFzaHBheGJ6NXBnOFBPUmxhV1FBcFh0ZEhlTnpV?=
 =?utf-8?Q?oprD8my2da3pgX0Iaw3YYivHE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7adb2f-0591-4c7a-a577-08db9723605e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:50:40.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6Zjsvjj+IVMlqLtmqqEXU+ic0HrEDKm/3c62C9qT7+kRFqzpuyVqGl/NN0+k6p7fJYVQZLR6tx4Pxi7KLTjUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7893

On 07.08.2023 10:13, Nicola Vetrini wrote:
> On 03/08/2023 11:17, Jan Beulich wrote:
>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int 
>>> cpu)
>>>          /* fallthrough */
>>>      case TASKLET_enqueued|TASKLET_scheduled:
>>>          return true;
>>> +        ASSERT_UNREACHABLE();
>>>          break;
>>
>> What use is "break" after "return"? IOW rather than adding code here,
>> imo a line wants removing.
> 
> The "return false" after the switch would still be unreachable. The 
> reasoning behind preserving the break
> is mainly MISRA Rule 16.3: "An unconditional break statement shall 
> terminate every switch-clause", which has
> not yet been considered for adoption, but might be in future 
> discussions, leading to putting back the break here.

Well, adding such bogus "break"s is going to face my opposition, and
it is in direct conflict with the "no unreachable code" rule here.

Jan

