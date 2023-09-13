Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385C79E0DA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 09:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601001.936887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKM2-0000un-GM; Wed, 13 Sep 2023 07:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601001.936887; Wed, 13 Sep 2023 07:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKM2-0000sP-Dc; Wed, 13 Sep 2023 07:32:06 +0000
Received: by outflank-mailman (input) for mailman id 601001;
 Wed, 13 Sep 2023 07:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgKM1-0000sJ-01
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 07:32:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ce4891-5207-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 09:32:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 07:32:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 07:32:00 +0000
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
X-Inumbo-ID: a1ce4891-5207-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ai58XmAK60Y5crv7Ldek21LSTLBC8ox+o8jfZ2UVCYs3EwpUJJ2utQpdnEi2iamDOCBtt6dpZAiR0zqcLJg0xyKL+hxJlGCWBUHo7r6j7OyeT8613LplL+kLtjFH5ln1UvKpiX6E9kEmDPmb38xlOokFyzmep2xYayWbAUs6ny8L0OwBHvnxfPKOQwDaD0T7vhqR3csunTnrBKnOWBz6MT9+7DRSNrKQWD2Uj26yYnlXI5erl3o4iOoLQZskusQUyhz1cs541XUJhC/ZHLW8JSTmsc8rHxHB5kMidMNXS0GJuMtip08dTkBoJDr2BXZ4L3vzSIHlj4PHP3I5TEesUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tiHzTrYqqG3aaqu9LsDUaxhtnU6xcOEZaIY6SzhcLI=;
 b=FhPMdOY4X1s6Bnxs3Fck3sBfWlHwiT7VtpXs0NqFSFgDTuR/9+MRFsc61iUp+flPX5G1afSUGHx5/m8aTqO7HXmS5xM5do+7KPd9QqJ0vCJvkAG4MRfH61gOEBshD2WMpCwWOdpXGsDYoFomZ6tjAEzl57hScA2zg0wX5mIdlR7IfVCeMS/thKdc9pAYq2XApsjn3t/bfLYvcd3YKZXnvCsxEhQ8dlhqXpujWHRoNABcMSIYJrBZDoEFvzfTVIqDGCLF7JEPtjnTk2UNvcBY7RKluNboi5r+ft2v77H2Ya3MdEAO/jCfmaFo7KIFZgmiojWg5/WfZc+nA5lql0z6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tiHzTrYqqG3aaqu9LsDUaxhtnU6xcOEZaIY6SzhcLI=;
 b=Qy/YmyjNbU3Zbw5NeNJDb972AHKole3yVHqN7uoAJFCQtBTm8CJir1lyL8SdhSdGQxPSDqjamv4jsBk1fZtFB43D+3hAXUwWfE7VNoMG7EETRz/u97dTYwAwfF8lBdMbDye3YrKJjzW5dYeagLUwIEvcONZaoH1mk5v3kB07stJgVh3t8mK3KG7kT8RaCVxCCFki8+TYcR5iWYqhELhvILpIqZdjh7XG49csZYNGUHtoXR+0XeZlmTPDIcnsHu8vls8vHt3p7cqkThQpH5KFUrScyxRuQ67SwXuP3rwzCfFvFE0CX31t4AyohdsFayqkMoC72NpgBQv84Q2Yb6b7GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
Date: Wed, 13 Sep 2023 09:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] timer: fix NR_CPUS=1 build with gcc13
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b146e7-f195-4b6d-55c2-08dbb42b8468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0umaN6X0wUYLlXTbF3J0l/HaCUKRzcC4NOvHa0/XcWHYHZJOlrzg7vZSA2yRILDUtNFHkXzjRXV8pqDLKVnBAHhRe08am4wySNA3CX16RaZJft8+ybgJFZBZvpTyh9O7tpPunz1dG2E1SF5QHDfnVa9n0k85IXzWLfNPEK/PTUBlOrxR0epAzWJuAxaGBD+dyCqcd232jX2X7zUCfJF9B3lBRoQLtGHjXISIpSbZpS74YeA/l75LFfqeMk/SGXfl6bXJRhUkQXSWq5JbjSzSL+tgvn7LsUd+46/ERIYzp78M5UWvJBAV9DmSRIfw/87NZRK8bCsveK92GkpSwewu2IIlW30cHp9/OufH30RRuXQZMQo+gI3rS3YR7p2vmqVzga7hyTVROjKFYeYM5CbRnYBJdlx94yzVCFjk59H2fTcN7+6vfqWZ0Tk7zI50bwGvZWe6m0DapNSKpSbbimasaU4gEyZwtaRCZs3vswP28gGCbvRPND1b1H56zcnsSDxUWXJhFmH5OT7GP2wP5y4yHZG57I+HawFMUeDPga75MTFTi0Q/f/cERyooKusyYEoiNJi9T9x/ieWfQhH3UwOFQTqvf4LFiL2Jby7YCaVrY6sKssBghqCf8Ed6VzbeRIxKKUMgX33E7GCKhGLWdvcBZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(6506007)(6486002)(6666004)(478600001)(38100700002)(2906002)(4744005)(83380400001)(6512007)(2616005)(26005)(36756003)(86362001)(31696002)(66476007)(54906003)(66556008)(66946007)(316002)(6916009)(41300700001)(8676002)(4326008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlU1VUxMa3laUTYvVDl1a0tRUldaNWx5Nms1eGt5bUNRUUdHRzQ5bzIzTXp0?=
 =?utf-8?B?MHJIQ01NQkVoYmJOcmt6RHNJUHFVZk9obURQTVpHdUh1OUtNQ29Nc3AyUWZa?=
 =?utf-8?B?ZXZCdmtRZUtjYmNWY1RCV3FRT1VzRDVYRDduMjMzSDRJRzBjUlVueVRiOWNP?=
 =?utf-8?B?eCtlTmZ2anZ3TUNRbCtSdXZSeTRDdTgya1hncXBCU3p3YWFKdlVJNEdMMHR3?=
 =?utf-8?B?WFZxckJjenBZT0cvZzFMdkpMREJVRFY4emZ3MFFHaERzNkFNUk5zZkVOZ3dF?=
 =?utf-8?B?Z1hydmtjTzkzRjA2dVExdU9DaGhCWEs0bGtnK0ZWRmpyT3JtQkRHcmFuWDlF?=
 =?utf-8?B?ZU5rOVZ2WjZHeWlCU1FyVk03dU5pQnlScWxzZGFZODhCcnV2VmllR05WZE1p?=
 =?utf-8?B?UTRDenQvNjZLVlk0OVFnKzdYWUN3SE04SE5rYnV5cVhOb0ZmWi9HaTJDWlp5?=
 =?utf-8?B?RURRRVFMZnJBOXZXN0UvRytVT0pTSVFQdS90T0tKQk1ldHJ6cXE2SzdIc1Y5?=
 =?utf-8?B?SW4vRWNFeWRtT0NSTmFKYmhJa0RRZ3JOT0RqK20rN1JmZWdxZTRJMFQyZEky?=
 =?utf-8?B?M1VnaFZ6V0g5dDdRS2tReDlpOWcwdk50RWRkQ012RElxQjYzQnZlYmJYNlRD?=
 =?utf-8?B?RStySTF0Q1A1ZHhNNEhUWFBoUEFuM3RydE9JaWhlL1orWmdaNkVCbmVBbnpX?=
 =?utf-8?B?R1l6SjUwZjNkbnZiRGlPdE8zOUlxc3phbUhHKzhqSjVDajFKRzErQ3FVUE1F?=
 =?utf-8?B?RWc4NEMvWHNuSnd2Q1AxZE9PbEtYdTdCOXZLTEJaOGlYZ2tNWXVtWVVqT2Ny?=
 =?utf-8?B?Vmd2Vi9qNXUrWHhRZjF1UVZkN2ZZbHFkc2hVcFNicVJnTVhNWlZrR3poTWdw?=
 =?utf-8?B?eUI2RmtUQ0pmMEp5Y2c5UEZlTW50T0RLMVM0eE1LUVJpaUJienh1d09UMm1F?=
 =?utf-8?B?Zy9ZcXl0cFhYZG9BajQ2RiswOUVyc0N3Z1kxTXM4UDk3Y2pZY1NVMjZMTUhV?=
 =?utf-8?B?Rm9pME4yTTJibXBqNlA3N1dYMFdWcG9taGJURnBWTlNvV2pLd2tDNytWR1lH?=
 =?utf-8?B?bVljR0F4dE5pSHF6ZnRpZEt6UlVYM1lxVzBMbWtNQVJpSU9CVXQrbU9LMTNt?=
 =?utf-8?B?b3JMWjZMd2wveVA1cGVveUlhbnNTbVhsaC9NaDFVTFFRNzR4ZDJaYVI2cUJp?=
 =?utf-8?B?a0ZCTGZhcG5yd3YraWsvTjl5dWNSUzA0WWIzNGxDemQwQmNuN1VOamxtSSsv?=
 =?utf-8?B?UnJLUmRnM25tMXZqU0ZtanY2TkdPMHAxd05mUGpqTUhqSllkUE80NXRNdlVK?=
 =?utf-8?B?WGdHaGkrbTI4V0hncnVqblpwRDF5TUtNaFZnaFhPZlp3SkNQT0JOTm0yRHkx?=
 =?utf-8?B?a2xaM1pYVWE1QWFjSUlqV0EwVWUzbzNEYTlwMFZKdEFqYnVBNHExSnB3Y1M4?=
 =?utf-8?B?WVpCSkxlTGlISWt5Qk9KQTh5MGU0VitZRElraWFwbDlDenBiQ0VWSjd1c1pz?=
 =?utf-8?B?OXVxS1B3QlFsd2VPa21hT2NET2FOSDg2MWZXd2VmQjd5blIvL1E5WlphTmVi?=
 =?utf-8?B?NWJ6UEdlMzZjTDJJblFscDhKd21SSHdvZ1hpKzhpbm1oVUJtQTZJZVl0OFU5?=
 =?utf-8?B?SFpSUXdtbVJVVU1EK0huZEl4MHB3c2JPZmlWTnliM3lBVWFnZCtHVHRMVUxP?=
 =?utf-8?B?U3haekxKWmh6VGg2OUpyZ2hXZUE3RmlrbnpVOWs1MjMwTDk2eE10d3ZqdXJP?=
 =?utf-8?B?d0VZU3RXN01tRU9hRDYwUlN4d1Rsbjl1ZjFhU0RHQ2EvZFdyeW5VQmQ5d09B?=
 =?utf-8?B?a1JUYkhGYURwcU10cXFmWjNBS0VHaUlZV3lKdnd1SktsVHpOMjRxRUQ2MHRR?=
 =?utf-8?B?bmltU2xlWnBSODcrTU9LQU5FMlQzeE5jTTlzK1BRSWg2cFd1MkJINkV5S3NM?=
 =?utf-8?B?dWVRaDc3OWlsRnFxQTIyeDFGWE15eUtRWXc1WERBTlJnVE5uVkg4N3hLOWhz?=
 =?utf-8?B?WmYwNGlYU1YwYkduMkNkSzdoMzJCTHNMbkNJdnljMDB1ek8zaitucmFXbE90?=
 =?utf-8?B?U3ZpTE92Ui9uZ3IrVG8zR0Vtd3NQNWM5VklCdktaaWx4QVYwYW1uOGxHRnY3?=
 =?utf-8?Q?iiNiSoD07IL+ll2wy6h/8Q0V+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b146e7-f195-4b6d-55c2-08dbb42b8468
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:32:00.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+kXmMOltB2lqD+stXgOPER9QI2vc7zaqVcX1NsEn0bAzG3VNoAHdhfVH6y66dDbLIfLq7YxysOmbIs1NRig8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756

Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
is >= 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
configuration). Make the code conditional upon there being at least 2
CPUs configured (otherwise there simply is nothing to migrate [to]).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -356,6 +356,7 @@ bool timer_expires_before(struct timer *
 
 void migrate_timer(struct timer *timer, unsigned int new_cpu)
 {
+#if CONFIG_NR_CPUS > 1
     unsigned int old_cpu;
     bool_t active;
     unsigned long flags;
@@ -404,6 +405,7 @@ void migrate_timer(struct timer *timer,
 
     spin_unlock(&per_cpu(timers, old_cpu).lock);
     spin_unlock_irqrestore(&per_cpu(timers, new_cpu).lock, flags);
+#endif /* CONFIG_NR_CPUS > 1 */
 }
 
 

