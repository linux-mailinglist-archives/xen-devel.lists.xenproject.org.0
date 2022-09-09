Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A55B3552
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404177.646537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbLg-0005i4-7H; Fri, 09 Sep 2022 10:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404177.646537; Fri, 09 Sep 2022 10:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbLg-0005fB-4C; Fri, 09 Sep 2022 10:35:00 +0000
Received: by outflank-mailman (input) for mailman id 404177;
 Fri, 09 Sep 2022 10:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWbLe-0005ex-V5
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:34:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cca6016-302b-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 12:34:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7734.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 10:34:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 10:34:56 +0000
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
X-Inumbo-ID: 0cca6016-302b-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIGUGHXKfKxT12bzTdxcNL7AfO23OcwG3qWqbAKPw20lktgKM11Ac4gzJu5IvqD5uIwdB7jDVihkP/ksdbCGiKiYf69GOw+yyutfZiFxXRMj046aUZ/THpMXVSHUNwIjpBbyQrNDYYzbn3zv3EF844/k1EdlwtcFT3OrDUVPO8YVKzYcvNBqOzX9//n2j7NjnPV7Vc/y/SqbVJHzK/XxpACxTZbGZDf5RVdo2EvtsWyJzya+W4XMg2kv+FObj1eLIEJd7MxBJ2kWslU5yZoRcCHq6b7Y5TEUcmm/x5SiTGi/yiHwUzhdvS28dgHZUdhTLngV6WJMf9YCVoeRnyf+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W522B65Ql8ge1yXQa0g03EnCK5GQLmyF2y9BK1asyac=;
 b=YVLe5YNATbbgE5tzvkH4sJINiS7bkmbzrR5Or13iCyDYI2VhdahqTxTPCkmWkOVWgYNbuWZKHE4h1HnwMJDFlrF1JDDVtuvo+y0NIlKzACCCmVqnUakMCVpSJFvgsEhLK++94Bw0vfXkbINxLfn+1dtGeHp1GhYViY+xvsigg1/qDJJRxq62yiX8fNS9zMyr5gqYaLmrqDIMR0/+bmgyjxGITjICuEnTok/LoA448ug5i1+uGko5vil/cLFM+I5DA7y1v9QAtlV2GkDBA6piof6sgAhHjXnr8sP/NHlQUl7dHtqyVFIBj7Zx5u5CngZJQd0m/orl+PycD0d2JZcpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W522B65Ql8ge1yXQa0g03EnCK5GQLmyF2y9BK1asyac=;
 b=0lRlWbQ24BmGJEKmDw68nZUHKMXsdZCqYJ9PgHA7L4NreUOeqQKc+de6KlIcrHP7R0NIuR7iOg72o8BglR7KnYwe545ePHkQ/StqovwuOiiCyC85K0lCzMSHyWZXFM2c7kAYc/98dGff12hZdJOXryMwKKAUVw0uVS4eQy5WFWeTPPaA6vtYi1De9IrfcBNptLWXOtTavdl5aGw7edTIoWcg3bZEmgbs6Nzx2b/Cuc4qraC4kG7PzN106wYlkxh+OTIuy6QYZPHy5YE743JIUBhIliejUBlvEEaIh6ukI3+TPGeYcez1aQeorfimUXLyKZc/FinLxy+a/eg8oqvAMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f35cbcf-15b1-19d7-5cf9-22c71392a40d@suse.com>
Date: Fri, 9 Sep 2022 12:34:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220909102413.2899-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220909102413.2899-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cae6dda-1a22-4e0b-3332-08da924ef01a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Se1MC+xTUmGNl2TdyCBSOhMTK7zsxj3dup6+GtPiR5kmaZbu5CZDhLn/ZNu8lVQ3GrMLjqrKN9p6lBQtq9uM/iYUy7WVg5tTyEfQDsOOwX9hPnCUjW2LIabnAxokxkRmEwiZwkMvleEY8L4qm0zcqoja+3n36uvvTDZeyJw5LmA/tl/Ujv/ZS+bGAwmhrPpGHOf4bX42aYzuHS/71vLXywXDlq2hVoP2ZGTp+JNeQUvYPofW+wL51JkHeCoLo4SO6ATqEwbtS2CYBgPmphd4mCls5qKt2ky6QiPfNCtCWu7iPC7oA6EwlpQEwYcDkvbMch37ZkD9m3iqvvJ5GDTSiZgvDKL6IvBiapPiIXYJDMCxBmIhuThgIvAZ2Pxd2ch7AT2LhzZjxG/fLd4IfEYNK1b+5gnZfcQt0HflEA4iFdsySXcGGZd6gOnDC6av46EHYvKWMzFW23I/PqCbrwzfNDcBAjA0CLnKyjJdkGvQPMAMpMYkK7wpCerKp+1c33NtCPBqLMQL8z9n4t5XKu3aF8AF0BmkhbZJuCHoB48hI2VWQ8WxTsZ5kYj1F2U39s1LncLrBSSnnZ6pkp0Dx+jDcKRzy2KamwNoPpEk2SRurp3Vid5qMNrEuTuwfpuVQvWhurfXoyJgdOVVTCDdizoL7M7KJk2QrUWF4RvAD+QwQFs5IfNBCb1Sb/GfhcwraRM+LW3pxlJJDf13Bn5oVDMLqreLYrMPm257n6DpXFeGNRViSI5qukwBLQPy//XG6sZyyaRMl95B3W26h+k3Bal5zV8Hz3NPsSjHWeeMRWM7TxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(136003)(366004)(39860400002)(41300700001)(6512007)(26005)(2616005)(53546011)(6506007)(83380400001)(8676002)(8936002)(5660300002)(6862004)(66556008)(4326008)(66476007)(66946007)(2906002)(4744005)(186003)(478600001)(6486002)(6636002)(54906003)(37006003)(31686004)(86362001)(36756003)(38100700002)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1dlYTJ5QnNYak9QNmhRV3lvS25pV1dnTEdlQ1NRUEhGZ1dOa2JKM21oOUJY?=
 =?utf-8?B?YzNCQVZSTnVoRHBNTG1aOG12aU9NbHdZbEgwa2ltQ0o5YzdESWhhazJsY1hW?=
 =?utf-8?B?M0tINFo3K3F4cFh6bWdVVDdVWk4xWk9mY29acVRmK0FTbnFFZElIL3dCSDM3?=
 =?utf-8?B?VWZiaFhmTTNPZlJ3UWdWbnA0VkpYWU1qT0VlaHdycnp1ckJmMTBXeHZyYktt?=
 =?utf-8?B?Y2J6ODcwVVFHVFRIT1BheVZJMUdtYnZuUnNNdWV4UWQxV2oyTFdLQmV0Ymtp?=
 =?utf-8?B?UUk3RWYzd0lMWWhxMm5iKzBaL3M2TFFFWEtsc0ozUE5uSmxBZUJkOFdmeVJy?=
 =?utf-8?B?RXhZVXhjOVJudGZ0dUw4WlM0ZXl3Vms5R1M4SW9JR01HWUdZcTNndG9BWmNQ?=
 =?utf-8?B?QWlpdDlydThJdmdtY1VYMGFHbmFLVFdZSnQ3MGFKZmNCLzZtWGtKNzV0S1lQ?=
 =?utf-8?B?WlJVYTBEbWxQUUNaRkNkSFBTMTB3T21ocTQ4UTBDamROZUppMkRyRCtwRWU4?=
 =?utf-8?B?VkhnNFd5OXZueURydHI5ZkljZDBFNnNTVWpYMUJFdTcrQjdvMFhhOUhqUmZR?=
 =?utf-8?B?enNWd1BzaThGK3k2U3Z2NHB4Z0p1VjJVWk0zY042M3B5a2FEZlM2S0Y5TFNN?=
 =?utf-8?B?a1dVUU9DODlsYlU4alNJbHBENERZVDFxOXVvcm9tZnZXMEN6eU55bXN3VDNy?=
 =?utf-8?B?Ung4a3dkOGRLSE05RmgwcW1uSitOOGwyNzVzZnpNMEpTK2JrNHNmRHZ2VjNs?=
 =?utf-8?B?SlRHMCtaYzgyQkFRamx6MWt6SWpEcnQ1NW0xRFd1UDF3QXBTTExHREg4Szds?=
 =?utf-8?B?TWd6dmRJYisyT2U0Z21tRWduSDdqSm5zK2lMbkIwRzNPaDhseHQ1blVSYlFr?=
 =?utf-8?B?NFRkd1VlbExucHhJN2Nha2RyTE1DRWdlbWdQbkJPckF0bUpLV0dpOVU4bWZj?=
 =?utf-8?B?Tm9mbjhDUUE1RFh2Y0hOUEk0WnJEeGRqRysxUDZmcEhOWlE3TEwyTmpqNGdn?=
 =?utf-8?B?aXFOdjcxSFIwQVRUOXIxQXZ6Uy9veUpmRVNqNTJEbnFuUlhmK205TGVyY0RM?=
 =?utf-8?B?dWFsaXFoK3VmTnMrQUdOakFTSU5LaXdIU3R6SThqaXVRSDl0TFhIclNtZ2ZO?=
 =?utf-8?B?Ry9aMUNXUUp6TUdkUzdqOEt5ekxFVEVUcFNtWGM1SVpSdnlQN1lWajJnQzU0?=
 =?utf-8?B?SnJNR1RmdGl1WlJQdXRVbGJyTE1Ga2pWeDlKVkNqZUtTdGM3RzEzQWFJQU1G?=
 =?utf-8?B?ZnlPRzNLR05SajVyRkhQcStiVjJYRnh2NW1PMWpMRXo5Qk1aUkVYaVU5akp3?=
 =?utf-8?B?cEd4S0VGMytleGtVVkszazA1MXp3UDFSbUc4Vmo2bERKajBHUXZXYzZFenVQ?=
 =?utf-8?B?a3JxNEY3MnZBOHRqd2dJSVEvRGZtdTZxMG1TbFRLb1phS21tNmlLUXNhY2M2?=
 =?utf-8?B?RkE2WExmZkh2TXVSekI3L2tFT1Y0eTc3ZEFSZ2VEVmtYZWd0YTl6c2o2SHIw?=
 =?utf-8?B?cUNDQmsvZjRWUENHcjZZTllza1RjTmpMdXE3Q3B1b3ZIY3FTRENlOVN2OWlB?=
 =?utf-8?B?ZEVUSWdtcG9kb0h0QlJzenkwR0E0NnlLMDRmRFRUcU9uQTBIeW9WRm9KVWVn?=
 =?utf-8?B?OUU0K1E5d25LYmNGRSswVjA1aVA1ZzBTalRzUmc3c1RsZEF6bzJzQWhYNVpT?=
 =?utf-8?B?c2x6S0RLNG0yb3BvalovVlBGbk9GRFR0UUhCM2sxcUZNMnA5VzVYbXAzd2tD?=
 =?utf-8?B?QmJLaXlCOFl4RHRZK1JYV1JHQmZjS09pYk9jWU5LRjB4azJuVzZZV2NpbGhM?=
 =?utf-8?B?Zjd1NFgrajFTWXJrUDVGMVQ4TThGQzM1S2VORzhRKzRHSk9sMkFiS3laVm0w?=
 =?utf-8?B?ZXVKQy9UOXVIOGUwSFQyT3BBMUxVbzhObFdueS92Szh1SWJSRllsQ0NqeHRQ?=
 =?utf-8?B?SEExSkRxMytUdUwzakF1ckR3UU94Z3hVcWRaOGV1Y0F3d25zSkh4K0tkRUxx?=
 =?utf-8?B?bEEydU5oMTdGcGsvOXlZcjV0Y0xhRWVFT0tGUzNOSW1yeVdCL3FVUURFZjdD?=
 =?utf-8?B?c1BCZklnZGg1RDVVWm5CZVFwVVBENExwL3pFc1FYQUtSK1pvS3FKUUZMa1J6?=
 =?utf-8?Q?3KJP8GPGMl1FYIHfGZUBL+5Ik?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cae6dda-1a22-4e0b-3332-08da924ef01a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:34:56.0793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH3JXyh+rUzrozpmIu/RxvZhA+BPgf7Tn709kYWJ+6wE76j2ZKb1/qcyDUGaD5ScCC6IYHAODQdk4zMhJnWw5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7734

On 09.09.2022 12:24, Juergen Gross wrote:
> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
> warning") was wrong, as vaddrs can legitimately be NULL in case
> XENMEM_resource_grant_table_id_status was specified for a grant table
> v1. This would result in crashes in debug builds due to
> ASSERT_UNREACHABLE() triggering.
> 
> Check vaddrs only to be NULL in the rc == 0 case.
> 
> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Might be considered for backporting

Sure.

Jan


