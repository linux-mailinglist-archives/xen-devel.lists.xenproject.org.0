Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F35BB255
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 20:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408112.650811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZGGu-0002pR-0p; Fri, 16 Sep 2022 18:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408112.650811; Fri, 16 Sep 2022 18:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZGGt-0002mq-Tl; Fri, 16 Sep 2022 18:41:03 +0000
Received: by outflank-mailman (input) for mailman id 408112;
 Fri, 16 Sep 2022 18:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jfnW=ZT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oZGGs-0002mU-8T
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 18:41:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b311431-35ef-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 20:41:00 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB5002.namprd12.prod.outlook.com (2603:10b6:610:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 18:40:55 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 18:40:55 +0000
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
X-Inumbo-ID: 1b311431-35ef-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/ICXphZGFPRhAPiO4slYzUVfjlGFuJfVn2d4E6DiwwvG7dY3J2JSrRxReanfB60ZFyirkbIN/B59fTgTniCWf99FbjEXKlzsRTZR/mZVCbsyEcvycNHKOFusaY1yg8nY0g/9n2WMgNqqPRW3ypsgGhrNz7XFRivVgX/vi/bRiTd8il33x57UkCwmP6/+iR7YuLMbZZpp6lgGYm22IzQrY8dbRFIMTEmtKWco/VBYXgRDTzcOxGZTtUUY8X6ecIh6fyWXQYayQ7XsD0wdxoRIMancXiv884tpasEE/C6Ejt7qRNKGaSL7RWg+32nGmpCFDpqkuL4n4WfgTlgnLxQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2niwYhetKBpTYRmrYXKxjPz0rrtfaxqA1XpfjGMOl6Q=;
 b=JxtoUJ/2sbhZNRiXGpZjQ2BQkmqFfBFjjb738vOLqtoSENh9vjdjQ63dJFcmEmRuvhyYsBbfzDERmz35lwrLso9whnhWS8xSTwFYJEucirGW8u7kkzSmJP93T+6G+fU1x3xOW9z0byiF+C1k/S7MxGpUq97+wFPNHK+0ZG8u99rJysmUoofvBUJPX69LaOJM+lI24oBPP+ItpZZDU5ya1LfgWwlIXx/xZeT14Yj6g7QPtq3T/RKmuKT7klEAtbAxHVtPpvcNJcTAtaUPURF2Y6/yAYHeErjIXvlP77eLOXtvHNETczjLr5gjjE15ucqNb00dpTII3pePQQ9v2NUDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2niwYhetKBpTYRmrYXKxjPz0rrtfaxqA1XpfjGMOl6Q=;
 b=v6erNQWd50dFskEKSGGfTPdBJE9ya0dewiGce6zXIVpBAV3VObP6GC3izHiHPIsthvDL5BMHzGgqeNM0lzgUzZPkVab3iORcPyhJYEgeeTfAnTR5mqwZ/0jvrM+X4pP+nVwmRype90Y83BrSqiYf1LSuDUuo1k2ZnQye1/Q6TqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a63ba68e-b1d3-59f5-66aa-9ca78f7636b2@amd.com>
Date: Fri, 16 Sep 2022 19:40:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Julien Grall <julien@xen.org>, michal.orzel@amd.com, stefanos@amd.com,
 Henry Wang <Henry.Wang@arm.com>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Xen crash seen on Cortex-R52 FVP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::24) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb08318-a498-4345-9809-08da9812fd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKKqHDFmSRIFMfTfvOFq8QN9DpiaItxIDOBTwGkVB4j0PpxxW94DZRy0qsiT/wAn5CwuF5FzSsdqbmBYlTWzoO7cSzdsdH7hA6tbQ7EeQQ0rrb6xO6durJLUnukF6gajDUwYlUbJ4BbUWAYtQ/AfkpbqKhnlD4cFeamPYHvyiBp/35o14QKz3VNVXagBijsOHuUj1nztMndmChZl/8ZAq4ePDFEIUh1TY4AkJTStRm19JxS603zCmkp13spr20fMFXMJ9OG4AP8SWi9cAkxnnL+GKkgLZ4qh3+GpRBMKu5cXpgopuwaqTCyr+UTfdaXHfAaBYMQuNxKVHh4RRYxeyvUWBlXieI50iMH9ltHdo8zgN3k28SZNfdt5sKnoGwEwqihSVpIRs+NzTe2UFNdEQLF77HiPNqwEYtK/ceiNinWv+MxmrHzkFIl2rOCgCMLHSL3U0OaFzk/dfUFXtnE5qkER992I6loNJmvDneRAAtrRPlKrte2L2YwQa3bMfG/STSQCTQiTmmg7k7mEEY2YtdcBcBqNcPw+QGzzvxuJzsw6NVHI2r1jbfaK4/LNpUasVLANWbX29mgw0A8jhkFaQHw8DcrkCPrHktpzLQXbXcFOMSyyXyZyyXk2ykbjxtsqfDewGRCoJvR3XvKfQaYJ4txTwZnFo9sQjw0PcMng4a39LF+ULl7cf5aLXA9jk+d8fLJ4JcDNAYmubwOc+tLDS5AK/Sy4HkEaLOOjW9ORZ8DjkHs3d4LtXor5mPn/WHohM/nSQNXceqhTxrUPM5YRNP85ACWfCubi5JNT3Bi4DPJHdoXTYW6CErIOWKDq8JsXAySWOFgMET0aHu9TSn9FdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(31686004)(36756003)(2906002)(4744005)(66556008)(8676002)(66476007)(66946007)(4326008)(38100700002)(110136005)(31696002)(8936002)(316002)(5660300002)(186003)(478600001)(2616005)(26005)(6512007)(966005)(6486002)(41300700001)(6506007)(6666004)(10126625003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09jVU1scy8wQyt0Z2pEZzNLcXZtcVhPbTNmdElGOW5XSWZUeUc0bDlpcTJJ?=
 =?utf-8?B?MTJPYmludS9ZZUhKejJjTTNYQjJuc0dBNzdYUkhNQ0RwSlkyT3dPdkNiMk10?=
 =?utf-8?B?dFlhUi9yRmJTVG9hcGZuUDNxRGFmRlMwUXBjU2NsUVkzeFdBb0k1bi9ZYkdD?=
 =?utf-8?B?QnA5N3VtNGNKZHJZLyswZTE3ckl0ZnE1UEFUU1Y5ZUJvZmNSSG1YcU9RUGw2?=
 =?utf-8?B?YVdkaDlVazhtM05GZSszaUw0UEFyWVpFQ3BLRzBNQ3Z1TWNPc3VTZzNmMTRU?=
 =?utf-8?B?MXVGRGY1UFNYdjlWL2ZvR3dKME5RbFBJdTk5bzBvd01ENjM3NmgzS2ZKKzdn?=
 =?utf-8?B?dW1iTUVISVQvWGtzcytCK2tXVWp1QitJdVNjUmdxV2hMcVJ2WG03RCthZW1I?=
 =?utf-8?B?dVQ0Sm8wQjNVY3pOMHVpc0FxaTEvWW44SEFjbXdlOHY2VFluVTAyaEs2a1FG?=
 =?utf-8?B?ZGhLMlNYZER5cW1JMytaWHZsUlR2aFJxeXU2Vm90MGQrampOVDhxOGx4eHU4?=
 =?utf-8?B?Z2hoMFd3QUFmVUlxUkZHM2VKK3RUV3c5aGVzSW4wYUZRb3pUMnlwNUN0TmZu?=
 =?utf-8?B?OElNdzZYL3krZlAxVnlINStiSDJKS094SDdIWlpsQ2tEaU1Ud2pXYnI3TnUr?=
 =?utf-8?B?Tll2OXFjU3hIbEQxeFd0VThDMzI1cjlJRzFPU1N0M25hcUJjVjZUT21nRFR3?=
 =?utf-8?B?SXpJUlJSTGl1RmY5TnBoSnpYdHlBb0FMOXBiOCtoemM1cktlRjE2aE0ybWtY?=
 =?utf-8?B?VUlpTjc3OUczUXRDcWZyMzJhYThIMVB5bzR0eWxORlBmSk1ZelR2MFRuZFlG?=
 =?utf-8?B?UmxXcHplR1BtcjJFVHUzTVR1Y0J0Vjh1dFBwcVNpWGdpRmJ0RVZxdkEwZ0Fu?=
 =?utf-8?B?cVZjSUhUcEI4TXVYRUluREJlOERHc0lZM0ViOEFhYXBHRFc1eDFtWE04ekhS?=
 =?utf-8?B?bi8vRDUzVHdwblFRVXBUcmtCSmZCK2J3T0crZDRhVDhpYWJBaDZyOFpONmNt?=
 =?utf-8?B?SER4d1VsYzFGSlh5YmYxa3ZjZlM1UUhHTTJLYnFrWDVnblZHWFk5Mjljbkxo?=
 =?utf-8?B?YmxDNXhNYUlONVNYM3l3Tzc5eHpSbU1ZS1ZMVEdzL2g1dWtaS3RrV0lOUVFu?=
 =?utf-8?B?VTVQZ0dkVjBxcmFCSW9rMFdYd1N3OXNsRG5HQVRiRTlhOFZTWGxITkxKRjZ1?=
 =?utf-8?B?WnhHdU9OeWRqUk9UZEdKUFhNWWI2VTNzTFhkZjJ1eitVUjRVYkZVWFV5dWU3?=
 =?utf-8?B?UnhDT2tKaHdNZTJXVjFmSDFDVDM1NGlJc0R1SmZnRlNXbDVNdjVieDlQNlVu?=
 =?utf-8?B?MFdBNFloVkNqT0xzdThzVlpmNzVtaGw4c0c4NlRQanQvQnlnWHBiSWRQb2tv?=
 =?utf-8?B?MEV6YklkYXZ6NnhhalNGUXRQSE1aQjhLWTh0c1krVFdSVmV4Q0IrbkZEVlFE?=
 =?utf-8?B?bnNjbDFmQTRQTmdJQnhKazhuUzQ4Z3kxQzg5RkxNQU9CVjMzUGxlVFY3T3Bv?=
 =?utf-8?B?dnRWZ3ErRUtFWElvQW80UmxjdmJXa3hZZlBNVm9yT3ozYlVPNkpjQ2h3QnJ1?=
 =?utf-8?B?S2J3d0ZxMXJzcm9aZjAzSW93bWwrbmNLbWswL0NGZ0FOSytqMmJQd1dRZ29R?=
 =?utf-8?B?Wjdud1V1Y21IdWdJQ3FRK2pvU2gxS2thSTlxcVlZTWxHbit6ZHR5WW5YRWJC?=
 =?utf-8?B?Ynh3YkZISFR5YURMNHRsSW5vK0RzaEV3NkhQQTl6dWR0QStpL1VLbGxTUXpq?=
 =?utf-8?B?dmFqY3RxZVBLcXJVWHZlQlJMRUhvZjlEcERjL0xGYThnSCtweW9RRHpiaE9v?=
 =?utf-8?B?S3BBRGJmN2VFNjNySUEwOHJUdCtwVlNkdjRVODVVK2hNZjdhRktRODdVNTND?=
 =?utf-8?B?aGtPcmdGN29oTUNXWnpPL3ZlTFIyNWdEV3AwUWxCYzhTbE1JL1Q4WkV6OGIw?=
 =?utf-8?B?NllydEJJcGpKcUVuU1dzN3FIOVl6VkwwTCtNUnR6YTdxUXdXVlpsb0RobDQ2?=
 =?utf-8?B?NnF0TnFleU8yRG1PSHF6VTBLSXp5eWpwekY1QkVHbnRyMUtsRG53T3lXMVZP?=
 =?utf-8?B?am9xZFF2aXR1SGxjOXR3K0hJejVkd1lCSFJpUEczekNSalREVjZKUU03TDFT?=
 =?utf-8?Q?iSCkr6ND8/J1O0XUgx1/EYrr2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb08318-a498-4345-9809-08da9812fd60
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 18:40:55.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wr07vtMsCq273jTEQz8w/hOLIM9hvgkKpP3Tj8J2M3Dbjout1H2prILvEKVK6em1JGUjVRZGFPrqDnhqTvwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5002

Hi All,

This is a follow up discussion on the crash issue being discussed on the 
IRC on 15th Sep.

For the context, the issue is as follows :-

Crash logs - https://pastebin.com/F2BKbW5a

Codebase :- 
https://gitlab.com/ayankuma/xen-integration/-/tree/integration/mpu

The crash is observed in idle_loop() --> scrub_free_pages() --> 
scrub_one_page(&pg[i]) ---> 
unmap_domain_page(memset(__map_domain_page(pg), SCRUB_BYTE_PATTERN, 
PAGE_SIZE));

&pg[i] = 0x6f002400

_map_domain_pg(0x6f002400) = 0x00122000

0x122000 has been marked as read only in early_fdt_map() because dtb is 
mapped in the region. See

(XEN) MODULE[1]: 0000000000122000 - 0000000000122d22 Device Tree

Thus, I am not very sure what I need to fix.

Is the address returned by __map_domain_page(pg) is incorrect ?

Any pointers/guidance is appreciated.

Kind regards,

Ayan


