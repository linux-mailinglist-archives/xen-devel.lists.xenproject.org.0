Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB015B9BD1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 15:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407386.649891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYovb-0000ja-2J; Thu, 15 Sep 2022 13:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407386.649891; Thu, 15 Sep 2022 13:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYova-0000h5-VJ; Thu, 15 Sep 2022 13:29:14 +0000
Received: by outflank-mailman (input) for mailman id 407386;
 Thu, 15 Sep 2022 13:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYovZ-0000gx-6s
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 13:29:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a2b44f-34fa-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 15:29:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 13:29:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 13:29:11 +0000
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
X-Inumbo-ID: 62a2b44f-34fa-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbNsQSB7VVvaS7vITkyPG7v0NL2P4jq/9lWXwndYKIUJf6D7o4Cl9bWMsBtOcj3Rgub5GzoR+Ol3hVWfZ2t6Qo4q/+zTt3eXt5+TCJNFdYFd0SfQc1iOc86+0Ick15Bq9OzNoZ/Lf6R7XxyavrImDrdyqHSHcLPFfgEjRCs7Vbw4mh7BF/XoNMFwxcdzbGwmH0Ylz4nJzsDgiEMsr+7Isjh/vy9JRYUqZ8blCEdUB3sawTMtmyL0fkoDNHNo16luKBHZSoKg/jcqauWTOphEDYPcUBsUko2mwbEPqOAgo3oqIfeVKYXDeoBnoV5yiBWypK/EfkwbBZzc8orbsSbpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X3P1EpZ7AG+nMna+lOXuXgbggKAIOOVNW3TjVq8YD0=;
 b=jDD91aHAh+nvH6k9VyIIntJYP/Gjv0EBXHEMnEPSYhKntu2wJNWezE0wK7yF1ZYoqnl/NiVvYAdu9a604umZQWL3edcSUGjY0iw6UOxnBWR3A0CB6I3CvV1mZujXmacsHJTeb69FI+xsTuyeKs1g1fn1APPc1Oi7UGMpYnuq0m9FvnurRH77mQewCS1Iy0PeYq6nnUapJy7jbAOLJu2n8EZ4g1IV4yNH7abW3Qq4pLXS8KYC5AsBFNhEyu0CShSTWn/sjI4jHG3SJcnSXeUl0xRbM2FKMhG0XNxOdi8854sw/ET8HtH/EfSY93m6RaZDQsUjhWaqGmJ+NsWkptf42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X3P1EpZ7AG+nMna+lOXuXgbggKAIOOVNW3TjVq8YD0=;
 b=CpRWPXQcZ87ycgL0OzVSFe2ymiyYTc/cviMbZ9rKigYqnaQ9TUu93Bgp9mL/kVlT1SQdSEu9zw+tb0g49vYnwn2byNw1AFsxe8wQsfyFKdPRLxfSepXbf9gO2lujE+D4FhwmSSATq68IltQhCQP/hg1SyzlRMEO9jsiUjBB9nEuECFU9771OwPDuV/+ufL682iWsthrLy7WdTwnjuy0lnpMzYc1Ak6g+byPI4Bwha4TlP8ai0YFGju2j6GvgbDLXD+5gLgQ0mig697b8vbfeirs9feOIPgcMqAJqbfotqOfSgjZ3qVkU189/T99jrr0N0oXwzMllb7tIJUl7JqwcnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65f5a6b5-37a7-4b5f-b42b-805a51790a60@suse.com>
Date: Thu, 15 Sep 2022 15:29:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 00/12] Arm cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0056.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a07c812-4ed1-424e-3fa1-08da971e4622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t3WcKnF4GsCdSzMgmYDKxJqiHOeMtFwWgiAGOfHWnKrrcUYa/oDydxUHnL6azoi2RNnvLjCpgkXG5x4FF6OPgZkCn32+6OR88JVAO8kghYSxsUmvINy35sF9rVgdODMpO8W3qi3pTwVqk/+DpRfnKeplMrDjwd8ROM3Cpdq+Yzf/qMJG3Won9fZXBTbD01yxSvQHmWGO3UnkRY4ea569udVMhjFfgeczKUAewbaCg58Q1phcW+q9Eh8NH92933eeOOSsMqAUV00XLixSqFlaU+vqaSy2A1xPGnVUW+XWMcBgvHHrwzHR47PjkI0YN64sY6ZtoXIuK+/m70T3Hok0TgwhqFLr7Oe5NSk5U2V8xYJ7SQ4RITxtWcsbp/Uz6H2bdaQ1GaXjhOkPRM/7jhPiDNaHXqcjet7njHcx6fOiJX058Hm5RY9YsDF7Q/3jz51fbItwUDaWYpqOeIBBxNJCJVRN8abSoChh6MSZyCkJlGu4PmE+xWIHqsvNj6IS+TB1AgnBnDZdMFQ3lsH1vqpKpH03oUXcWrjD5lYHySYzRt1WwO5lxEL0jMQzeXJXU8Z4llPPeQh9jN8QVCpM0LsnhzHrd7YJZ3L/l43Qda2r/6fZnUoStRukgBhjPnkky7ko5BWvB8vwnFJQX0YuQgH4ypF7elePMN73j1f1QdxkSMqRDoqtcsklz2kYas339aBCHhLwCqtq3hnaLZMsJOdc4ozC13PFUA9Q+YfQJqmtEaEJh0fC+5nBNl5b2NUR8MX7EM1y0vqZWTH1lE9HxLhHvypGXdEYCHDjHFZ+5HdjsJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(26005)(6512007)(6666004)(6506007)(53546011)(41300700001)(31686004)(36756003)(38100700002)(8676002)(6916009)(66476007)(4326008)(66946007)(66556008)(86362001)(31696002)(2616005)(83380400001)(186003)(6486002)(478600001)(316002)(8936002)(5660300002)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0hzQzdYcVlWNlN5WVRIdTh3cjBQSThobXNIbTV6dmlHWlFsY3I2K0RPMmpq?=
 =?utf-8?B?dVRIbU1xVjM3VlFaK3Rxb0d0bGVMK2FNWFFPYlpzdEovSGJ4NnU5a1BBMVcw?=
 =?utf-8?B?dCtMLzdZb0pKZ3VmcTlkR0xBZkl2emZOakVlYWxubHJ5ZXhUdWdhOWxZeWcv?=
 =?utf-8?B?TW1jMFNBTm05TkMzV3htMmtmVFh0cU1QaFFmTlY2SDFXMVMyMVhhbkRyVGl5?=
 =?utf-8?B?YWNIVURaZnRkbThZWXhwU2FzYmlZL3ZWRmxudENtbXRQVEZ1RlN1cERrdzVw?=
 =?utf-8?B?MlhXa1FmWTVqbnNmWldwVDlSMW1DeDYvekZvT1BCS2tTZ292c0pwSTN6WDQx?=
 =?utf-8?B?L2l6MWYxMEV1Sk1Kd1ludU9oMnA3OXQvMEN2NmxZN1JyZWk0ZjJsZ0s1bU02?=
 =?utf-8?B?SS9sNE01a09weUU0UGxYNERjL2p4UUMrRHB6Ly9PSnFDNEtHMmtpMXZ1SVdK?=
 =?utf-8?B?LzUwdGs5eEZZOEt3ZCtmd3dwamtkcndOUlFkTmkvL2FVM1dhUXhHbWRDNzQ0?=
 =?utf-8?B?WnU4SWNHcjZqMHp6KzJnUjd0SDIvbUY2WWN1a3BjNjlnWElxMmZOdTFuc2Jl?=
 =?utf-8?B?dllHOGtnTWhyVVdvY05mRklJTVlOT0xIQ2cwNHlkSTRKeEV5NVdCL0lqUWRr?=
 =?utf-8?B?R244UkR2NWlEZ0tTUjBTdkFkMlRZLzFrcFdlc1lxaStmSmp3bkpwMHk4UDN2?=
 =?utf-8?B?OStMV3JxM2pUUC9VbERETVVJVWdqYWllem9XQzc0RnBhTkd1Rk92ZkJWRlRZ?=
 =?utf-8?B?dzh1OTlrVVplRzRrS2k0OEd0clV4b1hPWE8vNGhuQVBSVWgxdDl2Y1k0UGdX?=
 =?utf-8?B?MTJtaVVRcVQ2TW5PRzJ5VWtZWkRBY3gyRVhnOEVOZDdmQXNFYkx1bHJBd2Y2?=
 =?utf-8?B?STQvN2ZHRUlDUHB6dndKczJOSXV0QzMyZGFoTnE1YTdSSU4veGhsRGdueWVm?=
 =?utf-8?B?Qnp0MlZDcUZkT2ZNOUVDM2QyZHAwU3pMQWdyTHRIV0s0MFoySWQ4QURpc1hn?=
 =?utf-8?B?QzlnYVRHVytTcDN3YWU2TEZLUlVyOTk2WWRieDdXSm0wblBQaytMSHk2SytP?=
 =?utf-8?B?c2VmcXRDWFR0cWhmR01KYjdWOXlCekgzRnFMYThWNWQwUmV3bGp2eGY1T0I3?=
 =?utf-8?B?MERWdU9jRlVWMDVtK1hFQ2U3UTlZTi9sd0dENjRRNTI1YUdOa0N5bFVKRWtk?=
 =?utf-8?B?Y3RIV1E2cGFXU0xmcUZGTzNiTHJTa0l0U0o0Wm1NUTRLNkJxRXh2Zlp3bTFs?=
 =?utf-8?B?eE5aaDhIbllJcFhzaHBhR29lVUUrNXMwVkcvakxDTGV2alBnSFRNeW5VRzNM?=
 =?utf-8?B?QTlqa1RxRUlsNFg3b3dsOUZ0UVhxNG5XSUlLdG1wWGVxZnJON25aMm5lQWwx?=
 =?utf-8?B?UmNHenZiLzJpOGxsUU5lL2ZSS21IZVNBZnoxazZiSWlQY1VJTnFXNStOVHg0?=
 =?utf-8?B?Z2VNZ3ZnendCc1NOdUJSOWNZeTlwTDMrOE1BTHVubEd3WFNzMEFmc2x6VGt6?=
 =?utf-8?B?dSt6VE5Ebzhid1J1TlBHZEtVMWlBWE1nbC9aUGdVU3ZsT0NLQnVoQ1RjdUtm?=
 =?utf-8?B?bmtUM1NlTy9BZGRpOWlmbC9ybW5qUDUxY0RhNjJReHg2SU54a05zM0RJQVBX?=
 =?utf-8?B?QTRRMzFqNy9PbG5oZUNaWElTeWJRYTVRNUdINURXQUdwNXBpdnJGaUJvMlov?=
 =?utf-8?B?STN1eVl2bi9UQUVQV2RENWdMZ1ZPQ1BmTXlZMVFQTHJ6Q1crRVZJQVdPRHcv?=
 =?utf-8?B?YmRUUHBzZmxoNys3c09BSXJOSEJBRjVJSTk4TnJPWU42bTNJVEVsbUdJU1pZ?=
 =?utf-8?B?enNwNWFLTlp5QVVGZERwUEF6ZmRsTmJnaWFRRUxGZ2JvUXE1UW5Vdzd0TzRs?=
 =?utf-8?B?dSs5NjlsT2ZMUndwVzVBb3ZleVQ2QlFPOGJzNEdZd0xVUTUraTdIY2tYTXhQ?=
 =?utf-8?B?RnY3MjZNaGcyQTFCeGgrTU5veU9iaEZrbG1hMXpxbGsyMDU3eUp1c2xITnBy?=
 =?utf-8?B?Z1NMS2E5NmtyM1NJb0Y2YitubmhDS0NXdnJsL1RuUnpqY3cybmFUTXp6dDln?=
 =?utf-8?B?T3ExRXEvZm9FVWZRekVWNVFXOEszTnJmZ0U1bm9NTXFHWkM2K1lxcHZjMCto?=
 =?utf-8?Q?wvAOIUOydf3d59wO0cUVUZfr1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a07c812-4ed1-424e-3fa1-08da971e4622
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:29:10.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtBA0Vhc05UULJG8/5XrRC6CaHf+7o6JAfQNZuc2GmlMlE0JvzxKz4ycvjZAa9ePHYIVJRGLSfy3J7xifTMqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

On 26.08.2022 14:50, Carlo Nonato wrote:
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.

Having looked at the non-Arm-specific parts of this I have one basic
question: Wouldn't it be possible to avoid the addition of entirely
new logic by treating the current model as just using a single color,
therefore merely becoming a special case of what you want?

Plus an advanced question: In how far does this interoperate with
static allocation, which again is (for now) an Arm-only feature?
Your reference to dom0less above doesn't cover this afaict.

Jan

