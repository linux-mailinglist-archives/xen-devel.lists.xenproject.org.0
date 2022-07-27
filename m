Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA117582027
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 08:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375908.608384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGabH-0001pT-1I; Wed, 27 Jul 2022 06:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375908.608384; Wed, 27 Jul 2022 06:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGabG-0001lz-UM; Wed, 27 Jul 2022 06:32:54 +0000
Received: by outflank-mailman (input) for mailman id 375908;
 Wed, 27 Jul 2022 06:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGabF-0001lt-NO
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 06:32:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0cac56c-0d75-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 08:32:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5467.eurprd04.prod.outlook.com (2603:10a6:10:80::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 06:32:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 06:32:48 +0000
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
X-Inumbo-ID: f0cac56c-0d75-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdpAkA5EBnhOgULm6HOrJ9LI+tyrAjxIc5/k1vzq/I0c0X3ic61SwoRSYhchtNgit6c8JQ0a9Hpfutots4pe7e2MPOiLRXSEMzLl8MwK/jE3mnLOBIjPIbGC+AI0MEUs77UI9k5KcRPG+qgL0EFUg8IESSrATxT/IRsdp/4RIOE7UTqQ+yLjFVhk+pam9U92hiwgQ9BoQGrwXB6XxVddmcOQiCw1sfaXX58Ru10kKUphMkTpgvYvYnavsk2uegDBL3mtIoAsZz4bB1fd5iIix7I/NG9A7rGXNQSs+T67mp+3j1zqpzgulyCckfMPOEFrsXf0AU7SIlynV/Xj8kmSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgtaUsS5yF/v4t7ZXNu2/g/7jMosFjQ8zb6pO9YeMwc=;
 b=fegIrrZBu8Kuz7pmWc1w7ylUBNgldc6AgTY3+LxyCiG3X9fZ03nhUyyz6JFy5fydc6bvfkw65HoXzkLA/ctv8NoxSwDJ9hq+aZCivYRoPeZYS0uq3rtSXxdv2KgR5E/d5srjSBnWvH2W0aMhT4JRqvImGVjUY7s5Lq0XGnN/UVKUi4D16uQ0Kvkp/tOIH0tYFOUM6Wxk61QZPwL4bLC9Qu8nDuj2/XRB97VCs12jqZN8ZycCXZGjK+7GTvkBsMIl3o16Zy8r8RUoAuxNEZMEGu6+5OrACNnFIUOOVbFez6z5OWjSF5vwTUXlw5paktBgzTWQYYO9yD+ZPumedo9XPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgtaUsS5yF/v4t7ZXNu2/g/7jMosFjQ8zb6pO9YeMwc=;
 b=1xgqZxzKXjT9cFg7Ckm6/PHqpgbSqyFXiSIebyU3nvRRojQb0ZjP8M65cDY8YyGvo67IMWdh9HO9oxDHVOgQH6lmXPNZ0sEY6jmgrlM7OffkKq8kc3Vn4MRmm5nabiuYHUKLpAjs/qB4RhAMPVhgQK2m1Lb3N11kwUcb6ktapAFVUYv4+F//+n3rBnKvkh0t2ANIBt/H0B3q/tCWoliArjpqKQ5QKrlROi94P/pTGP0LQOo5fRzOp9pnC0NdD90PqXIMA3vMFvmMRXlCQihXvjH8k/jXm2edxSDsT28snFKr/ofX0oZygRV9w0k8D1E2y5WXHZQYfr6P4Du0COnRVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>
Date: Wed, 27 Jul 2022 08:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: cpupool / credit2 misuse of xfree() (was: Re: [BUG] Xen causes a host
 hang by using xen-hptool cpu-offline)
Content-Language: en-US
To: "Gao, Ruifeng" <ruifeng.gao@intel.com>, Juergen Gross <jgross@suse.com>
References: <BL1PR11MB546193E001A425E0B9B7848EEC979@BL1PR11MB5461.namprd11.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR11MB546193E001A425E0B9B7848EEC979@BL1PR11MB5461.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df59f344-01e7-4776-48ab-08da6f99d2c7
X-MS-TrafficTypeDiagnostic: DB7PR04MB5467:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5UM3vQUb+nQ345qMEl35TfAkclK88QXnxUId07BfKxVYWsG2lVAPDd9fkHbNaEfTBS3dtNRGU0qXPZw/ipliCzVqeLudV6Ggj6xx0fNgqMlqGthMpYO+2KNTUybd40rTxlJt4eUbmW7boTCqf8S+IOCvvOcrg2n1ek192IIqXlBhn0+isQ9vKu4FZ8ZDln8u1SqW/5mTdAj4ypjkwrgne7DDtSHypkiIzy5PUcLmA51zDO3OlKqS5XifQ+HHvIF6xwuN6dDYiJneHnQDu8qpXjDf3p7G6sDYL5Bp+ISo012p5qEBfec77CyJNwUeWweOfKT+qaAB9CS9YgG83I6/tfDoG8tf1T2NWgULlNDiq8kG6td3l28LnHoc708L06xyEtY97WTuQ68JEdrZ2kb2/fIbbE5CPWT5eubCMeBmp8ZfQ4gbM2cOrVx9Guv7jhzLam27bZKyWecvdEFlE2TTuYnwsL5Xmb6q6XCMDfBXoN5EtFYOUky7lyRixq2fZAgmpKx9wKPGEb5zT+TySS1aFWl0P3U0AF2121ynZd4ORF9sKra31KvGatrK4IUAcmnHeQPdpok/e1Uo+e9e7rNOVsXXOFELHCwR6eM6x7G8Z90fkSSDYVCfhdnAk9CorSrSrVpP4bKg3IFMQXpl81ccnZy5lGub55Zbjf7kfHdKS1lZwpRGlhthycS25pZiDlHbA+POuHWQJqI979WoLzdX/SbCqHGC0KUMpJQTzzAd7t+xFkE3gnssKW1Ik4NWci72nWeFCdZrKbEk5zGUypdZRANR/JpCGmeWmrHQWa/ElLqY7E5Cc7V2YnnElXRDKdpYadKgKFI59bJJ+yX+moT31g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(376002)(39860400002)(26005)(53546011)(6486002)(66574015)(478600001)(6512007)(36756003)(83380400001)(6636002)(8936002)(316002)(31686004)(41300700001)(186003)(31696002)(66476007)(2616005)(38100700002)(86362001)(66946007)(66556008)(2906002)(5660300002)(8676002)(4326008)(6506007)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXN1bERmVHY0akRUWEtSS1NxSVk4V2RlVWw3dmtQNzUwUVgzdStNY1lsKzBU?=
 =?utf-8?B?MktIMVo4RDAwZUJoWW1KNWlLR2VYUzJicFNDOVZyRVB6dzlmZjhNa0Vqam83?=
 =?utf-8?B?RkRjZExWeDNacjF1eGdHVTdFdlBMOUdKVTRBc1R1N1k1QjR3RStjNE5BVWF3?=
 =?utf-8?B?TTZLckhDMG9QWEowY0pmbzR5d0hLYy9xWnUvb0ZRY29JUkZwWU92MUU1UVdY?=
 =?utf-8?B?SmtKeFA0eVhiV0k0dXdjS3BtYzNGcXB2enB1ZkkrMURDYkdMMk5lL29iOWZ1?=
 =?utf-8?B?RU8yeVViR05ucGFZa09zY2ZrOVk0MFplUTVxbGxLMXdYVnRTVXg0UWk4WElQ?=
 =?utf-8?B?WmtUejJReEYyckRFbmJrUmtSaGQvamx4VXpOOGFTTk1JaHpyUjR3RHlDOG13?=
 =?utf-8?B?bGlibWlSbWh5S1hFTi9SbmdSYmRIc293NUFBS1AyS1NTZ3BBMTd1YkFEeDZw?=
 =?utf-8?B?NEVDcnJ1MktsMWd4ZGkydFV1SWJZdjkzZ0c3dmhGL0NYVVRvcmkySTB6cmNU?=
 =?utf-8?B?cU1tMFpGVVRFQnlwMGRSSSszL2dISmFORnkvS05JY0U3aXMxa2o1WGhOd3Z5?=
 =?utf-8?B?OUMzUlB3a1VQdFlWT3B1M01UMmttQ3BvYlMvbnRhdXZDNXlMOXV6WjVXM1hx?=
 =?utf-8?B?MFFCWkZuZUNFb0tNS2Q2RFQxR1FYQ1ptMml3bVJxeERHcTJnNWlDT2JxbWFs?=
 =?utf-8?B?MUZGZDNEZ3NyQXorNm1WY1ZCUHd1K1JvN0pWOWh3NjY1M1Z4NS91Z3NWM1J6?=
 =?utf-8?B?dU0rYmx4UVJoclVpTVNNTFQwemVrZnNDeDhEZXRwQkxUVkJkZzFMeGZqK2lm?=
 =?utf-8?B?ZkJDVk1abnJJZlpJaCtwTlRvRmZaaTFIeGpLVng0a3QxZXlpWjJHNzRrNXZ4?=
 =?utf-8?B?Q0JaV0VkV3pCWVAxQ2puQ3dpbU1yRkxGeHFrdHR4SFVCQkd6RDJwbDliaUlo?=
 =?utf-8?B?NDlDdzhyTTdaL0pEQXl6aE94QWR2N1JzTFpaSEhoWXZWSDV2RXV2OFRNRVpH?=
 =?utf-8?B?STRnMVFYb2ZuQ3ZxcGRxVm1DVzRUV0NVRUR1aGhzZWYyQmhQdWhwcHhjbHhT?=
 =?utf-8?B?Tm5kOVRsR2VCVSs4aW5IaGVJSmV5SWxNZXJDUXhXdDVPMVFNV25qMTlqRUc1?=
 =?utf-8?B?N0hJUmthblF5ZEJvVTl5NVJ1bHB2anFGZWZvclloZGYzMEZXOVZOd0UwOWxw?=
 =?utf-8?B?bmFibjg1bHAxV3dDKzY1UW5SSlFkcnh6NFVVTStqSVYyaldwR2hwOUlkUldk?=
 =?utf-8?B?dXJjaG9XMDU0SnJkOUhMOHFibnpXblUrSmJGNWgwM082Nys1d21sSTRiNmxp?=
 =?utf-8?B?RFd5SUR1ZUhlekp3aURNa0VMdmZ1WnZKSGU1TzE1emNlS3RyUnhxNWlhVU9z?=
 =?utf-8?B?cnVWNHpmTHV6SC9kWi9kSnJyeFNaRTQ0UU5WR3d1aGpGOUxDM2R5V0lnbEgv?=
 =?utf-8?B?aHFMU0RnOGxLQ0VydFF4OUdFR3BTR210Sld6N2JjYkJ0WWZybzFmelRhb3hh?=
 =?utf-8?B?VXJrRW4rVWFYdXBpVm9zNEJHOHBjc3NCbXlENlQ3cmVqRUtvRDF0ZmhUVyt5?=
 =?utf-8?B?SUQvcC9JSWJGUmtMOFd4bk9xQVZHQjBiV3JORzFTNUYyZndvMzY3aDhuWkRp?=
 =?utf-8?B?V2tyaldUdFhtVGlOTmVONi9sUXlUcDJvaW8wSW9FaFZPY28yWEZjS085Z2hT?=
 =?utf-8?B?LzBqbGlodlB3M2FDU1RaVXA5WExZdVB5M05nNGxVNGdGOWtZWWluOURxaWlP?=
 =?utf-8?B?N3o0d0hNbVN3bWw5TzlDTkthS3NEczRjZFdqNk5Va2ZTeXByWjJFRVVWZFJS?=
 =?utf-8?B?eXdNek9ENjJKN3JMYm5uMEsxazZ1ckswbWh3aEg4SHVUbk5UQXZjV3MxYllB?=
 =?utf-8?B?aTk4YVAwWGx5dHdrdkUyRlBCVjQzRmFKbjFrV2ZYUHBXMVdUMDhDWjRSVGU0?=
 =?utf-8?B?TmNYWTdEQWVlRlRhQkxHYnd5SXI5VDNpb3dxSnhvVUZRWFRhaHdpNlRwT3I2?=
 =?utf-8?B?MnhmS1QzeWltdGVxc3ZkZjY4aGNyMXpxSE9Ua01DNGpHTVBGbEZzTXBIQ3Mw?=
 =?utf-8?B?cEhKVmsyeld6eGtiV1VzY3BYUDcxenExb1JZM0t3YUlpVHRUanptK2tLTzg2?=
 =?utf-8?Q?0VZ7D/qMrooOSTEauzuSwqNPi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df59f344-01e7-4776-48ab-08da6f99d2c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 06:32:48.4395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BFz488eh+A1zOmaUg9MNmzb/uxVxyAUeHlUQqQAJ19htb8mEew1Xd5bQkmCxbbDPveYWj3pP/aiOzO4XCdWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5467

On 27.07.2022 03:19, Gao, Ruifeng wrote:
> Problem Description:
> Trying to execute "/usr/local/sbin/xen-hptool cpu-offline <cpuid>", the host will hang immediately.
> 
> Version-Release and System Details:
> Platform: Ice Lake Server
> Host OS: Red Hat Enterprise Linux 8.3 (Ootpa)
> Kernel: 5.19.0-rc6
> HW: Intel(R) Xeon(R) Gold 6336Y CPU @ 2.40GHz 
> Xen Version: 4.17-unstable(ab2977b027-dirty)
> 
> Reproduce Steps:
> 1. Boot from Xen and check the information:
> [root@icx-2s1 ~]# xl info
> host                   : icx-2s1
> release                : 5.19.0-rc6
> xen_version            : 4.17-unstable
> xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
> platform_params        : virt_start=0xffff800000000000
> xen_changeset          : Thu Jul 14 19:45:36 2022 +0100 git:ab2977b027-dirty
> 2. Execute the cpu-offline command, here cpuid is 48 as an example:
> [root@icx-2s1 ~]# /usr/local/sbin/xen-hptool cpu-offline 48
> 
> Actual Results:
> The host will hang immediately.

Well, it crashes (which is an important difference). Also you've hidden
the important details (allowing to easily identify what area the issue
is in) quite well in the attachment.

Jürgen (and possibly George / Dario),

this

(XEN) Xen call trace:
(XEN)    [<ffff82d04023be76>] R xfree+0x150/0x1f7
(XEN)    [<ffff82d040248795>] F common/sched/credit2.c#csched2_free_udata+0xc/0xe
(XEN)    [<ffff82d040259169>] F schedule_cpu_rm+0x38d/0x4b3
(XEN)    [<ffff82d0402430ca>] F common/sched/cpupool.c#cpupool_unassign_cpu_finish+0x17e/0x22c
(XEN)    [<ffff82d04021d402>] F common/sched/cpupool.c#cpu_callback+0x3fb/0x4dc
(XEN)    [<ffff82d040229fc3>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d040204df7>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d040204e33>] F common/cpu.c#_take_cpu_down+0x24/0x2b
(XEN)    [<ffff82d040204e43>] F common/cpu.c#take_cpu_down+0x9/0x10
(XEN)    [<ffff82d040231517>] F common/stop_machine.c#stopmachine_action+0x86/0x96
(XEN)    [<ffff82d040231cc5>] F common/tasklet.c#do_tasklet_work+0x72/0xa5
(XEN)    [<ffff82d040231f42>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d040320b60>] F arch/x86/domain.c#idle_loop+0x8d/0xee
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 48:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:704
(XEN) ****************************************

is pointing at the problem quite clearly. Conceptually I think it
has always been wrong to call xfree() from stop-machine context. It
just so happened that we got away with that so far, because the CPU
being brought down was the only one using respective functions (and
hence there was no other risk of locking issues).

Question is whether we want to continue building upon this (and
hence the involved assertion would need to "learn" to ignore
stop-machine context) or whether instead the freeing of the memory
here can be deferred, e.g. to be taken care of by the CPU driving
the offlining process.

Jan

