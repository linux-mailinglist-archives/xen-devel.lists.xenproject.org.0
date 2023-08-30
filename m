Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6778D6E6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593069.925975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMxZ-0004lt-3r; Wed, 30 Aug 2023 15:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593069.925975; Wed, 30 Aug 2023 15:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMxY-0004ji-VQ; Wed, 30 Aug 2023 15:18:20 +0000
Received: by outflank-mailman (input) for mailman id 593069;
 Wed, 30 Aug 2023 15:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbMxX-0004jc-7N
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:18:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c7502a-4748-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 17:18:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 15:18:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 15:18:14 +0000
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
X-Inumbo-ID: 71c7502a-4748-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADo/qdtAKcttk/35lpCcvmxai4plc+JiseUe3P8nHKL1+Gz8hyfFYdXtbm/iUmhZd6/hQfTyHJHno5eGq5xRIXWwoEo3SVvZLN37iPrTIEmrTGCP2/KEQu6p8hNyE585DYO79uWCXjqT/K3ZwwNRRyY6neD3Ebw6hKfZ8sZt807rrNAPZGF3UI//6dYxPjd3qP2P3DkpgEnr8YWsxCp1xQtRDCd3FntgyfzR5gDok8K/SQW299VbLSgw1yXij8dJyej7xlP7xrM28Mw/Kkv3eT7jFT2FRRjiWxAoAn5KWv6p//edgkkaxU4Hv4Aw0rwZoipWCc7ZhXiC2nIC9UE4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pApXcpexZHy/JfADEbdVoRXBFyCgDnRYKr85jq7XUdM=;
 b=a+5NbXJXu4HbEVcyT8j4nt6p/bqxETyazclP7+Rs22Y5FBnMBB92PCkH0jsbn6xR89LLgAikRr625rjfG81R+ESQHcJzq0i3MQ1ZNmH0zxHWR/ZnH/lqlTv3iBMwghWiBIHN00FotmLlz4O8v8xJQ0lVn+VualSsAX9A2lR3xgCPMY960pAYttUwBbqgQrfRl4jkYw/IApjS1ngGPy7iEaKvHEluySgXz0EXKTDvxp2jwnQlnKSmbi4IMTz5FdT3AJVY0u9GZP3D2m4O1u2JjR3KufhK3cAj37QekMEeric44QCv4zFyxhbcUHV1IbCalI7WCWEf7mL0OUmoMJq7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pApXcpexZHy/JfADEbdVoRXBFyCgDnRYKr85jq7XUdM=;
 b=uoL8fzvkFcJW2AkR2KjSdQ4dry1880VWlmU+Dc+d08Yj6LgykpscOMrN5BF+6IOSP072S7u9i0y4FqNIAUNGkZymrYYEaegMH5F82/WTa/2qYbElesmrCKi93UScGnJs/r1UnBVlI9lZXvCTleQ9KD/e0/DvQfrna11qtfDpdWxHiuO/r+wUPC0Wgslzm0fmvrBdM/+R+IO/0CToClaE8h651fu3mXWss5OH+anFGpzArNnlk7CTPZFVR4O7dG0QIsOzgoBhW/XyrkFA5iyqgxkrhav/Vr+Kfvhbkwgq9cYNJ8KdSHDDNsCu+v7O3Ysfqqu8dzZ3QuByKg1tbD85Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5abe351b-7f0b-d7ff-de8b-aa6d84610767@suse.com>
Date: Wed, 30 Aug 2023 17:18:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Jinoh Kang <jinoh.kang.kr@gmail.com>
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
 <badc045a-c16b-659e-ab3a-37830d1cb3d4@suse.com>
 <2e7acb20-04e1-e69f-eb66-07bd8f9d8b22@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e7acb20-04e1-e69f-eb66-07bd8f9d8b22@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa44cf1-1809-45ef-6ec0-08dba96c547b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ysz3QgSP+xYIySrlr9NN3VYiL50TZohqaxLUiwexRaB1ZpqMXgW7r41M7/8Byijt84f4DYKVrajdwWqKgGeTJocsNq/0qp5DCyBZGGHuqxsa/xqbW3HZwpgfXM8YKk0NycrXysWGD3ZrYftD9t/mOm4NW36cV/tvQX3BSpXPRbtknOHlQy8BzjrrFqCXDIQIsxPO9Bg8jyVeeyvLSxJwKrm7GXMjzZJZMHXOyg+aQ+LXPytiL6JwEIximQJUl07xIEA9cZ+0VozDw5kDRcwLLxK33H6uZn8mmmqWI7ZxWaW1kbGYOfOfITzXtRMrjhBycr07e2joaRxxLbds1coUkEBmNKcvRnkZ+nCNLRCUxfE2JtedJ40k9mEMjXyod/aTOEBtMOBn4P/mQPH5zg3okPlKFIILkEac3ZLzA9m+C1fuDTBA26IxgjuKOpPWJe0zU8YADK6RHZClBuPLAkt742D2r74otJYbrn/Q5+37tInsjqCBmYcfJgw5VZcrnhGxGr6pW787jQJazGqder+MuqXv0Walqo8qoWB+rdPejRkSaGnRa2Vc9ESOivJe5LxBhgOeYr2iuQLwlTI+nJkNzmVJ8jQvzF6z6ufq1fNgfVvXIiceQ5d+NbK1QKTqZsM5Llef37Jr0pmWzQ7uWgurpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(26005)(316002)(38100700002)(6916009)(41300700001)(4326008)(7416002)(2906002)(31696002)(4744005)(86362001)(5660300002)(36756003)(2616005)(8676002)(8936002)(6666004)(6506007)(66476007)(6486002)(66556008)(54906003)(53546011)(66946007)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtZU0J0amV3NngxKzZJWGNVNE8yREp6a2Y5SE5yM0duMG14L2lWM1l4aEp0?=
 =?utf-8?B?RXFsVDd2aWFmbURlSVdJVHM1Z2J1QjlqQmZiYkpQa2MrQTdXd3Vkejkzb05w?=
 =?utf-8?B?M1c2MzlKd1JFeUw4cVRLREV3QXJZQ1BSUkEzVnFTaHRUT0NvN1lDOGhub0wx?=
 =?utf-8?B?K0ZibE1XTjI0aHEwZGo1R3BVRGVlUmEwTGFOSlVwd2hXTFYxYnVXWWhtdVZu?=
 =?utf-8?B?TmRIQ0l0Yms4MVhUUUtZQk9TT3EzNXNYRmF4NWhhRjc0UnRYNzlLMUR5amdx?=
 =?utf-8?B?T3pmSnh5Y3FYT1lRN3FvQ0F6WmlJQmlJOGNaMWtvUDNxYUt3MWZMbFcwUW5l?=
 =?utf-8?B?RkVGOHoxS1RDbzhTOEhWYzlkRm5MTWVieEx1MXZ6YThFY2srdi81N3RMSlVV?=
 =?utf-8?B?QlhjMkYvbmJYbkJGZHUxK2xJOE5yY0x0NmZCVVBnaVJmYkdiQjFSNDF1MjNS?=
 =?utf-8?B?amdpZTJwN1RBVVVUSk1ER2dBcDJGODdOWEFtemx3MXkxeU5CUHZoVlVWa1RF?=
 =?utf-8?B?VUQvV2hpeXAvMTRCR3FLblBtVElyby9DSmUvWExZcmprUEdBYkdGZXdVOUJy?=
 =?utf-8?B?bFBseWtUSVlySUdWV242YkdGNTUzKy9OMHY3RjhrOVhTQ2kzdHpkR3hUQnJy?=
 =?utf-8?B?QXNPQy9ZQkd5ZkJOdFRIdkYyRG0vYitTbTRmTXFZekVlMjhlR3RBcjZoN0Qv?=
 =?utf-8?B?bTVXclVsVTVMV0pmdlNhQWxtRmw3NWQ4bk5hc1BwbGpBRy9nblFtSEhGR2NY?=
 =?utf-8?B?eVgyNnBMQjlxaHgzU0FwdG51VUlaUW5pUWxUbjJKUzJObks3dFJSL1hxeGtI?=
 =?utf-8?B?RDQ2cTUxdVp5T0FWOXZkYkwvcHlIMmpydjF6Y01RQWdPUzcvMk5QSG02eGt1?=
 =?utf-8?B?amUxSVdZRUY4TDZYTEdOdG1yR2c5VGh2aUN6ZzZwb2FObm9CRWE0QzNyaTBP?=
 =?utf-8?B?dk9ITHJ4aHlQbm1wL1pvVUVlMTVVZk15RC9MUWdWc1J4OVJNY0NpbXlPVk9m?=
 =?utf-8?B?TlZYWFJaeWIzTEgyU0FJb0pMeTQyRHk4S25aMjJUMjFlUjNFekp3S2ZDWTl3?=
 =?utf-8?B?MEl6K1gydmFEcDRHRnJHQXpBZVQxWWtkTkFUK0dBRjlqb2ZYWmpvTE1WT2M4?=
 =?utf-8?B?VUE1WU51dVBKR01rb2ZFRjFNdWxkVE83YWJkMWNNNFlmaU1MNEF5VTJNNVBD?=
 =?utf-8?B?NmZGRUxQSVZTSk1wZzkzcnM2dGdLZHNoeld5WWFkbENnQ1A4bERza3k3M1hS?=
 =?utf-8?B?Y2UxQTJmT3k2R1phWXB3S24rS1ppRGp5NTY0Zy94dUtINzFRVkRaajc4V091?=
 =?utf-8?B?c05mUzRZTTdUNDlQZDNuQ3V1c0ZQV1hZS1pWc2Vhcy9kaWlQc01HbGFoem8z?=
 =?utf-8?B?Z1RpQ0d5UksyQ0FwVlUydk9MYi84dWFpdjNWVWdBaSs4MXM2dzhkWEhmNTVE?=
 =?utf-8?B?cmhHbjhsdzlJb2FMYkZzWnZkVHVNUUc2NU5tTi9oSTlQVkVRSnZPd1FMU2Vv?=
 =?utf-8?B?REEzRmRPalFsU0R0aFRWSUZEZjhJbmZ0TFE5NldHMXBiYlBXWGtuSWw5T3hu?=
 =?utf-8?B?WXNwSmpyNjY4aGdxdzZoZkEvRlZjT0hwNEFIY1RSZlN2NUgrc2pjL1Nwc2VI?=
 =?utf-8?B?SVVNQjg5UnNKZllIUkdXMlQ1S0o4anpoZStsbEdWZTI0MlJOOXUwdXl1UUdo?=
 =?utf-8?B?eTk2aGVmalhBYW1HaW1Ob2J5a3p0eGdqODRWYkFhRGdYSXI3VzlzN2htdHJ6?=
 =?utf-8?B?VWNQUnJlejRrbkdIZ3BibHJjM3ZOMlpSZUI4MU1Bd1lUKy96Zm1ka1JkZU9u?=
 =?utf-8?B?b2pNdXhvOURic2tPS3k1eCtJZDRGWXBuclRqK3MvZGt5WjJyV1ZKZ2hDdGlC?=
 =?utf-8?B?NURYUDBQYWxaSGlzNlpCci81Qlh1MElXQWJRTXZIKzBkMGpyNjJieWJjWnVq?=
 =?utf-8?B?S0s5YjIybGZpVUtKWHJTLzhhaGhHZVpGMGxQMlVmcE9GK2k4ZUVTYkJqdm9E?=
 =?utf-8?B?dUI5SHkxQW5NRU16Z0NYdllJbHVYM001S0ZlTFlqYzV2VFozMXhna3BIRmh3?=
 =?utf-8?B?alNETnJ0YUM1eTNuZ0xJamc1UHA1clRKNmpmb2lIaWhaQmFwRGxMN250d1Z3?=
 =?utf-8?Q?bz4RCS+lKEjcRj/piEqRRNBlN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa44cf1-1809-45ef-6ec0-08dba96c547b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 15:18:14.3226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe8RQin7JYD6KOnXgpk4lyJY8u0zQwXOmpung5dEii4vujI8p9W2kqh/pyjiYgXSVxAXlA3ZSy2qyB92JR3WHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

On 30.08.2023 16:20, Andrew Cooper wrote:
> On 30/08/2023 2:39 pm, Jan Beulich wrote:
>> On 24.08.2023 17:26, Jinoh Kang wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> @@ -78,7 +78,10 @@ struct x86_event {
>>>      uint8_t       type;         /* X86_EVENTTYPE_* */
>>>      uint8_t       insn_len;     /* Instruction length */
>>>      int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
>>> -    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
>>> +    union {
>>> +        unsigned long cr2;         /* #PF */
>>> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
> 
> As a tangent, since I wrote the original series, there's #NM and
> MSR_XFD_ERR which needs to fit into this union for AMX support.

In "x86: XFD enabling" (posted over 2 years ago) I'm getting away
without this quite fine, and I didn't think it's wrong to write the
MSR right from the emulator (using the write_msr() hook).

Jan

