Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C87D2FE2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621272.967586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusBv-0002PR-3l; Mon, 23 Oct 2023 10:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621272.967586; Mon, 23 Oct 2023 10:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusBv-0002Lv-0o; Mon, 23 Oct 2023 10:29:47 +0000
Received: by outflank-mailman (input) for mailman id 621272;
 Mon, 23 Oct 2023 10:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusBt-0002LF-TQ
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:29:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe13::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14aee385-718f-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:29:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:29:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:29:42 +0000
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
X-Inumbo-ID: 14aee385-718f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNtv8xKQtCh5glHrkOOiTLFp+LCoT2aRR0OT3i38OrltWA53G/k1bOUNq+4EBVcopXxvp/BUJhpeeXG1D5/VpSR2VwhpLiMoaPTe31d2eJ8R6KY5ZaQJStQveUhbZq6mG1f6t2B3nI5cfGeCegQQb4DKmwAqSvP1qhRV6PfJEkJ0iSc6afyeLURXVdcXq6yhb7PRHZlGSTAEc40Atdpw+qFkAk7AdqtHLyN/sfUuMPFM+0aTQ5xMI/GVaW4nXHTNYviM3cXWqrUv3QeWcXZUR/Vse1N75M4iLz79Aw0wFlQogEJIUD6C2YPXJv+2tqpfg/EcuTshn6iG2zOq0KZVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNpN2Do1LmSoDh8/dS0736JwErDVTtV0NvfNFjq4qOQ=;
 b=aclIt9NT7HshJ9fqfUMThSZRcUeEXoMpvXVarUvT8Mq3YABSS+D2oZ2yKdgDX0ql082oc+/99UU+s4yhibTxBbgiQpPbGxCc95yadmui0KRY/0VuVFLW1D7yS7IFIQUcF/XAiWyPStOjzx8HmRMy+J511hbOY7X4HOEr+3dCW1QzgjE8FIWIJjhZdIeeayoqfGdEtOlh0uz3RCLQVYem+PzJlInsXaG5pLSFbWCRGGzY324Y188Hm/D/6izOiSML2MRvlAWBTuhJw0RaDEJ5WgEAi08vdIVnhlamm+elN6AmuERrC4PXiYJEKAS4kpZ0pSb0hkaHl2s+JyrMhPpb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNpN2Do1LmSoDh8/dS0736JwErDVTtV0NvfNFjq4qOQ=;
 b=b+VRQE1vQxBAKBYTayYKbRJ+C3juXzujald71qYVWDXbLJuSAylLUhJHbMG0NRML10jYRopQX9OhcVu4RZROZAhvTHkZksXMBo1NvlBNpGC0o+hH3kaNbWkBcuPiUlVfUCT3c84QGI9Ev3EllN/QS3R+0e0KfXbTaFIW1ojCDT/l/zwOq1b/37PJKq7eKuPI/4DPfn6dGH41EplW5u3GXM4siyRMxBZ3fDZFb2oY4vksVQiVH3LVWhLaN5umDUyBEWNyWv85OtXcBvtXhNSzeH+75hv+JPs5SqqkP8Vc3tPGrpmXd9OQTHZnpArommJNi6YXajp4fv/Sim+OXvyLFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <450c8a4a-bbfc-bcf3-5391-14417c113278@suse.com>
Date: Mon, 23 Oct 2023 12:29:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
 <9b446557abc4579219c0ead28263ded8136fefbc.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9b446557abc4579219c0ead28263ded8136fefbc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c200b20-7731-4a75-43da-08dbd3b2f7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhheaCRZ1MEOnbdZSBtIhCjcIpgDMG/o7Dt3lQpakhWO7t9g4hqOY0LCWjCdeFL/bH9YKSJl3V/njUEGk1HJmvb4Hwlrb2sj6pHnVDtgB2sTls5LM3g6UM8P7pxzfv0bf7OYeOvnbYxd9vOU+szyvNQVF/2AdRL2fuG0CtuvC7LXx0UHgwKjkXY5+LGWxqDe9/I4hwMvM90USRI79QmOSIDEWLmihJ2aq1ZK0vxq1J9t/UUEC+Nko/YtabwLM34pQ8QPBXG3oClEj4HzSlZIRzbFMs8KFQ0DhuO6jMeiyNy1NA7nyLC5C7QP2TWy4Hp5T9WVe5bZHw3DGe4suq2QzDV9Q42Xi97IFQnK1Y1m1HE+gLjxJzmw7SVKC5Y6Yn4IrbD7qccHZxQVkNsW+jB2+mJW8SDtGR1yx/ViC2Vqq+uyeysLGDj2kf1ozsjIpkFbaPyy0jx3gF2M4VaZHFbsqeKbOkrhVwFBS6ggf8xUhecoWeH/TMaZn0HmEXDQVsK58TfKttaPoVQlBWEHajwMJ8zTVCqcSv6xA5BFHF8yc+ZPggovr9hohQROojEpaJrroqJ3eBU3eeT0clWkjrJ7zXyTDmmH1IESmjGdCQPBPX3gntorcGSKKvjJzbMJSLUBPNjf0p+3OHM6MRmhe7Z3wY/luySIgvc0IAuyIHCiQUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(4326008)(8936002)(8676002)(41300700001)(4001150100001)(2906002)(5660300002)(53546011)(2616005)(26005)(36756003)(38100700002)(6512007)(6506007)(83380400001)(31686004)(66946007)(66556008)(54906003)(6916009)(66476007)(86362001)(31696002)(316002)(6486002)(478600001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0hZV0Z0RlBLaDM4dkNFRUZ5Q2UxbHZzZ3EvL0I2NlhsY3JIcUJ5SytLM3Vm?=
 =?utf-8?B?OWkrQmgyaEFRRzlhdW9UaVdKZ2VnRE5OcExJeURIWHg0K0hxbWgrcW9TM2xi?=
 =?utf-8?B?eFZncVY4bTJDZ3paSGFIOGt5UjlvZ1ptd0xOeFVoVUo0ZzlwNmZTL1dtL2Zt?=
 =?utf-8?B?N2ZtbC9jNW5nTUVQbHFrc1g1R3grc1gzaUJUdXUvOVFBR3lvUk5MREcwNUxt?=
 =?utf-8?B?VFBCQU9PSTVnK1ByTnlqNlhsVDJ6cktXbWl2Z2FCNnJsaVNVUXVtbGdaL3RV?=
 =?utf-8?B?aFdSakxrbS9LMU9SSlZWd2lBMldNUG1sN2Y4WG9KQ0FnWWlMOCtVNXlnUlla?=
 =?utf-8?B?MTNvRnlsRmdZTzBsT2JGd3pZajIyVUk5YmFNanpvWFNVZXUrUEpib2U4R3RI?=
 =?utf-8?B?c0RyVk04d0J4eWRQTE0ycFdxeHk4c0x6TGVQREtYWWxONDBaZmFyM0M0LzNX?=
 =?utf-8?B?ZmJpT2dURVJuYjNZZVA4MTluOXNjTXJHbkVLRmo1NWJrN3VnV2tCRjUwbVBN?=
 =?utf-8?B?K0hUdmVuUlRPLzNYMERQN0xITTRzbmhNZHdNS0k3MDdMZGhMYko5MXdTSjAy?=
 =?utf-8?B?M3RpSDJhOWd0NSt2cWxwL0ZpR0I0UjBXWHFaOEJKbWZHanlMcHdVNHc1aytL?=
 =?utf-8?B?Q0h1R2xWaTZkbnM3N3c1YytvRk5yR0dVdHk3alNDZExKcTB5UFhUYWRWNmdE?=
 =?utf-8?B?M0Fvcll6alUrL0tWc3NvVlUzcTNOdTdpMGY1QWVQSUl6N2N4bDFFdnVYYmpF?=
 =?utf-8?B?RXFxYnA1N1ljNzlJWGFTRFJWVjNhLzk3d3JKUEtlU05yRGlaM0M0VXdUMk5C?=
 =?utf-8?B?Z3FYYzN3OVYwRkFzblNQbjdsUkNZL3FUSmMraHd6Q3lGMk4xWGkrd1N4N0Zx?=
 =?utf-8?B?N3J1a2did3MxM1lXemMxUHZFSUoyTnd2T05oUFVNdGREQ3JRYm1XQzdUR0dl?=
 =?utf-8?B?OWJxa3doYWY0WUlscjFjRlZsbkxKVkRZRTJIUDkwU051VEdrMStIR3NrRkRt?=
 =?utf-8?B?ZGNJMzRwL1Voa2ZvcGZWTlRDME5OR0ZWaUJHdGtTcTFsMFJpQkZhTVAvWDJl?=
 =?utf-8?B?aWo1ZStheC8veFVYY3R2VC9VdE4vYmYyVVd6OTNVazRCQzQzaUJuMHhaSDM2?=
 =?utf-8?B?NHpxdmhtVGE3enZEOEFuV2d6SGJTTDJEZC9kSnNsQXZwMGthaVBiWUVsVmZw?=
 =?utf-8?B?REhGUW5VZlF0eVdsaHp3OG1qK28vS1Z1My9ZYzk4VFBEeC9xaGF5cXFlRFRX?=
 =?utf-8?B?NFVCS1EwS1lsY25Pc3VOT3hzODFzeGZIbFFvRTc4dEVzMU5zRzZ5bFBBMHJ0?=
 =?utf-8?B?dXZiQ2dVTGxEWlZvYWVOZmdWRFhEWDJ3bGQ3a0ppTFE5anpXc1kvMXF5cnVz?=
 =?utf-8?B?dXp4YWxFbFdldXc4M0V5a2J3d0I2Tm9OY1BUMXhHeHE3dlF6aS9Sb2lxRksv?=
 =?utf-8?B?UlBlamFjK2pLSmVGTk9pNTl3aHZ2TXlpbG5MUnc4ZUlvQXJpM0dFblRNQ0h4?=
 =?utf-8?B?MVlMUmpWcmdBclVqMjhKdk55SzZUT1IvM1F4WXVqdEVKRlk0VlBJclBRYUlm?=
 =?utf-8?B?RzluZkNhUUptaVJQRWgycWhRbStNeWxvb1NRSlRmekpYUTdmTU15cEw0S3cz?=
 =?utf-8?B?UTJLa2tnNWczZW5ySmt0cWk3RjdiU0gyOExxa0Z3b3lCcDhRanFuM2ZwaXg5?=
 =?utf-8?B?VStOUThyV2xsU2pHd3RtRUZqelc1dXZrZ21td1RJYnV6T0E1bm04QVB0bnZm?=
 =?utf-8?B?a0UwaSs5UU5zV2plZ1Nuek44QjVpT05MM0k0VWVva1BFS2owekVNZXZTYmI1?=
 =?utf-8?B?allYTm5pZm5WeUhPQ3M4MnhJRDhZdFBaQnNDZmRveWRYdEcrRjlBdTIrUmZZ?=
 =?utf-8?B?TXhDZ2p4N1drSjZqTERwUEF3Tzhzbjd2V2lIVGRHNWVoOHRGbGdJZGhrQWdG?=
 =?utf-8?B?S2ZFa3RKV1ovMjlXQUFicVdqc2tWWUJUNVlUTTg5R2tLTTIvTC8xUjdNeGRa?=
 =?utf-8?B?dG9CTzkxTVVJbEQrSE5semtVRGNvZCtra0EzZVUxSDJIeWZOd0FlOEtJd3VH?=
 =?utf-8?B?dE1RZGIwazlIMWprVVNCZkYzcnZnMEMxNnl0bjZ2OG9Eb0RmLzdNYVRjdFFI?=
 =?utf-8?Q?uIHehRKZqV4pcr2eVwHftYPoh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c200b20-7731-4a75-43da-08dbd3b2f7f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:29:42.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82umSbKxszL8TqU262o0/YbqVX8iAu9JOECYk+LZ6YgE7XFTCSr2DMQhZy1GMqaLUoXisuCl/r99mH8pGVouWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

On 23.10.2023 11:40, Oleksii wrote:
> On Thu, 2023-10-19 at 11:05 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> The patch introduces stub header needed for full Xen build.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  xen/include/asm-generic/paging.h | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  create mode 100644 xen/include/asm-generic/paging.h
>>>
>>> diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-
>>> generic/paging.h
>>> new file mode 100644
>>> index 0000000000..2aab63b536
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/paging.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_PAGING_H__
>>> +#define __ASM_GENERIC_PAGING_H__
>>> +
>>> +#define paging_mode_translate(d)       (1)
>>> +#define paging_mode_external(d)                (1)
>>> +
>>> +#endif /* __ASM_GENERIC_PAGING_H__ */
>>
>> Looks okay, but wants accompanying by dropping (i.e. effectively
>> moving)
>> Arm's respective header. The description than also wants adjusting
>> (it
>> wasn't quite suitable anyway, as there's missing context).
> If I understand you correctly, I'll re-use ARM's header, but I am not
> sure I know how the description should be changed except that it can be
> more specific regarding which one header is introduced.

Well, first of all context is missing in "full Xen build" - PPC has recently
reached that point already, and both Arm and x86 have been fully building
for quite some time. And then, as said elsewhere, imo headers needed solely
for building (but being otherwise non-functional) shouldn't be introduced.
At which point it may make sense to give a pointer as to where the
definitions are needed, and clarify why what is introduced is sufficient /
appropriate as fallback for a certain "common" default case of operation.

Jan

