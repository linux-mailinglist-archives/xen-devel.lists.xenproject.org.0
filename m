Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305367D3035
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621331.967679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusMs-0003Fd-Bd; Mon, 23 Oct 2023 10:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621331.967679; Mon, 23 Oct 2023 10:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusMs-0003Cg-8S; Mon, 23 Oct 2023 10:41:06 +0000
Received: by outflank-mailman (input) for mailman id 621331;
 Mon, 23 Oct 2023 10:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusMq-0003BG-Vz
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:41:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa07abee-7190-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:41:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7564.eurprd04.prod.outlook.com (2603:10a6:10:1f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:41:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:41:02 +0000
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
X-Inumbo-ID: aa07abee-7190-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSEB1WY+iwRQQq0PyLjxdNbPIMbTkA6Za8J16wO5uzEJnvOGvWD0CLrYcXb69ZSrvBtEC8P3pFDR0YO+P19rokOIrTsMM1KF9q7iXq+OCOLEgorQ8n4hDHcpzhUjyNdk+iUvWc32Ee6I8nrpiaomFJHowqEkUg63o8lgUKJucEK2LJcRA+HnzzT7gW09icIq/Bjq6PjNut/TL7lk7optB0Uy+xmLlkCBZM3LyZe5E/x0oVYujSonySa07Ad2u+PemsJxUpQ9WvNCRNfMBCrEfpmSf//RU8+ucM8y2WJXYE1Id0bioDLTcSyIxh+4mDOLSg7jBPG3PyiV/+XQcZQ6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaXZ/EqFpYS8eZVeGMBdiUOk1MfQP0UUpm9Zqz+UNKM=;
 b=VuXNSJgesCH/2RXNGTPSrgbcpgc85y8bNlpjVVr/ktvD+posj73mGfyIm9aMYCjfB1XbuhUg9spjsyPSe5Bs7BrIXoP2Gz3pv2zDWQatQEM1pfVHi/GBPXSOOEsCNzcp/vo89TylpiGV24JyJwbx5o0W6PQFi8TN+72BxKWqgAttfk2HUDaDfg+xnW8UrSK1S/5g6YkdYzmssoTCXxJ673L4D97MWKttQU92TEirtzFVzzpROQMqMm+C7y+XB2fsmoL+wh607tI5CVjFrAraEIhTsBou1TY4XdtfBe9NsBR9EKltXq2eB9CRF8X9V142gfEPnMREIxYBa6YgzBUVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaXZ/EqFpYS8eZVeGMBdiUOk1MfQP0UUpm9Zqz+UNKM=;
 b=TeZSAvLn8QNmaChgMQMnmihpuIAW8t4dMKb9bYX09YCRGHsQz/DhCexdRQHbdv4yQa8jjFsvBcl+tONkr+bbx9Ae6oIIxIuMPnulvW4QAYBj9bH3AHnabOv6UiP11kmMBvh8vvqp/E6VoRsfGch4GZ0ctQKomaZ0zFA+LX5eamm1OEO+R1eA0bGr5sVVw7mAQvEs49idSNr0Z2XOfnK8ah/rQ/YV3D1dWkYcyr3pKpZkB87b4DcmSd8HmuBtQGbovMty3vyw0QuQuViEz5CHGME8rBDXa3WmuNlvLlP8ER4TEdrSGbX/wBahyH/H9jQHkbrQADx4hYZJuoecbu8zKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53fd5aa9-bb3c-cf64-28fa-c24f723511b5@suse.com>
Date: Mon, 23 Oct 2023 12:40:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 05/29] xen/asm-generic: introduce stub header event.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <69563e3f41cb6971f93630d9df59395f159bd3c4.1694702259.git.oleksii.kurochko@gmail.com>
 <a71eb141-6ef7-f1bf-d4fc-832d710f63e4@suse.com>
 <1b7bec33c0931401d635586e5569279435e1ccb7.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1b7bec33c0931401d635586e5569279435e1ccb7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: ca394dfd-c4cb-40be-1e6f-08dbd3b48d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8cEtTPQIveou6LYLBjcGAo+I93gG8XTcxClv9yiZIcikVEflV9pfqjaSRdxhUKlcEqh3lUD7TSMv2odOgz6yBeuV+pz8Q+bhZVbwF+4UgKaVy4ouHZekPAe8gQMABKtQy7djcTWct20PVVXGUJPC9dkS72pbzF4kC2QFZYZhr1pDLl2RgjLv0ECo6tkFkIad8qcPuMFzLtArlxIxt343tqUNV5xsvxhCjWeQ1QaGlIhMCwEuq6m06hlzUsLUjG8OdBo/d9j8wh80BU/heSzdfMDhIFF6hly4JYLgNG7SoVPimQ4oaUGgFT5DDw+SA2Nj9IkDSyQrAbxwvVaDvCqvhb/dGyEkVg4/4Mmc+OBZtOYDWkWpQWzquoiQz8lTW8pNgwsJQgzP5JUcxCiKJOXtuqdsCwH/3ukuZDLqPgX0rt5ddq59sJpvDA8h890Rdh+8DF2ikr3SMTDVvnp+Q557+8wkOSneCu/bx3Qm+N27e8cb5iCfjz2pbqmyB/yrzA4AayFwKPtwpbkhO5Jm+OQieAzwrPvlmJkD9NdPgyZopvWH4n08svGILx4qkLrqID9qMDwVXPJzkc2hJIaqKoVzLP9mRjCAUg8MoQtUwTE6i+4UukM1gv3uUf2J03VKBe96Iw5tTCDY+4//5atPLy8QLOM/x8c6TcMfTefe5jsdVPEv5yNDVuXZIURjpcNEHrEuvZQjyq/S2JTpHmPJyXB9Gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(31686004)(4001150100001)(38100700002)(2906002)(41300700001)(86362001)(31696002)(5660300002)(36756003)(8676002)(8936002)(4326008)(2616005)(478600001)(6506007)(6666004)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(53546011)(6512007)(6486002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRGMzcxZm5tcVdTdjg3VFlhRmxGV2xnT1hwSjJHSW4wQVltdDZlS1EwQkJW?=
 =?utf-8?B?dWNzQUU2SW1DbEZ4bjV3cVBGZjJVOGRkZnpKYmd3U0dtdHJ6Y3kxRHNvSUdT?=
 =?utf-8?B?dllTVEpxS0doazlSWFVkMmR0Mmg4NUZVYmphWEoxTDVvZ1lFUTNHZ1Urdkc1?=
 =?utf-8?B?dWorUnRudHY2WG1oUzZqTnpnRFFpZ2hYY2crV1hqU0FBVTRGK2pDTGJDMHFT?=
 =?utf-8?B?ZCtOSUtNNms0dlZkRW94Kzk0OWl5eFpTRElKRDZ2dk9JRU9vSklrWnFGNzNw?=
 =?utf-8?B?bjhNRm5KL0Y1NS9pV0NtcUhpMHBXdDhpeHM2NjY5VytxYVl5YWFGQThRUWk2?=
 =?utf-8?B?VXM4NldNOXc5ekpLQ0hrakxTRVBKR2oyNXpQRkJ2cElrQnQ0SmxKR0hNeWw3?=
 =?utf-8?B?bG9QV2tUSHVvb3lxMDg1c2NUSCs1RjJuclFaV1dmcVFZajliWHFlWHNLb0NT?=
 =?utf-8?B?dU43TWJyMEQvb0tSamo5Yjk3alp2Z3ZFbFdwdElkdFZHZ1Z2aXl2Z21wY0FS?=
 =?utf-8?B?OEVDUW4yM1pyZDdha2ZtdlBqUFlKSTg4NlJuRWRqQjhBQm1GTWx4Q2paY05S?=
 =?utf-8?B?TkZuVDltUTIxY1RnR3J0eEhuM29kMTBqWVJjT3IrUmxhY3RTRjlaY1RWRFlV?=
 =?utf-8?B?ZDN3d3JGMVZKbTl1UFhtYnBoYnRsYTB4SUdEZFkwWVhlTDlWTGRiQzlqaWt0?=
 =?utf-8?B?d0dRK00vQjlaVVRNTE4yZUwrcnl2enRVT2FZeWw2ODN3S1JlOTZYNUN0UTZh?=
 =?utf-8?B?Y2I5ZTA5YzlhM2MwSlpnOTU0ZGl6UjdGTTc3YnFuRjV1NCs2UnVNT1dVNCs5?=
 =?utf-8?B?ZThsdXVRcWdVSzcxS055K0Z5TXpab1cwNUYvR2FPNktLblpiZ0xzSnFhYlpM?=
 =?utf-8?B?VFRBRmhLWU9JelhjU0RXb25ubitFRnN5bnVNTUZiVnpIU24xTFJpUUtMNVNK?=
 =?utf-8?B?R0JZRHZXY29oREVOOUc0Smg1UTVaR1puakgvVTkvWHhIOFFOU09KZ1c2Zk1S?=
 =?utf-8?B?cGp6clBGRmpNVEZraElOb0NlWDhnN3N1K0gzeE5tUXdETTY1aWZzWHR6L25k?=
 =?utf-8?B?UWlqYk82R0VaN2FSdE4zb0pKem1vakE3TGlmOWVYMDZZRGJyWUwrTm5xWWNh?=
 =?utf-8?B?MlhRTjZQdDVjSzdVQjlxbnFwUDZZQUNsRnh3aGlkNkN4N1NSKzJOTHFYcmpX?=
 =?utf-8?B?MFUxOEJWUThGK1F6dGNCeWl1b3VGZ1VPM1AyMUorL2RPOFk4REk4WWtuWUNj?=
 =?utf-8?B?RWxPWDVtdGlhQlF0NFAzVGN1UTE1OUt0K0VGQ2t4VlpvaERIWVptc2sxM09p?=
 =?utf-8?B?cU9MMmFIelpERlZEcXErTEhQZWxzTHljUzMwYUk0c1R1Ylc5RFV0UkNRTklV?=
 =?utf-8?B?SDM5bUVxUzArdElhVEhlM0Rxckc3OXltMzczNnNhbVcyd2MzMkpFTWxhRlcw?=
 =?utf-8?B?eldHRlFJSDBXM3Z5UWsraHZYWlV0VkFWYllkUWhHZSs0bkl0eFA5bDErNGJt?=
 =?utf-8?B?YTJsdXVvODA1aG5XbVdra0IzZ3Y1QlQ3c1BBQURmVWkvVzc1VGtTZXliT2p1?=
 =?utf-8?B?VW1PNm1VcWcxWm5XTW0xd0xDY25ESTlEcHFRMEJIeTRKdlJMN1BxdjZSV0FH?=
 =?utf-8?B?TW9uVGxQMzhrWTg4eVNHWnZYejlCWW1ob0VpbUhQU0xGdjdHUDIzSEkya0Ro?=
 =?utf-8?B?TTEzMUgrOVlsVXNZd0V3em1xQkNZUTRWN01XQlhIMm1lTzVWUHZLYjZrOHJ4?=
 =?utf-8?B?Ri9CbkloQ0pnQnlDYWdKR3ZTMmZWaENhQU9VcFY3ZFdnREJ1SWsvMXBNWjB5?=
 =?utf-8?B?aWp6OFJmYUkwa05zSUg3aTlPUzhYa2E5WW50Tmh6dURyR3llUlkvNkZENjRD?=
 =?utf-8?B?SGQ0aUJPZkhqUmRlekg2Q1pwa0hZbStrZGdGaWJkOThBZldoSStNckVldTB4?=
 =?utf-8?B?SjZsRWhnUXVVTS9iNld5Q1NHK3oxdldCRXNXVjlUdUxHSW1XeWkxbFRTR1Jr?=
 =?utf-8?B?ejRFb3ZqR1FzU2t6S2ZqTmdRWTczbXAxS0VlbjZyUzBVUDhuL1pZWGFwdlNo?=
 =?utf-8?B?OTFuL0p5eVhXYzlJN1BKR0w0OU44ejlNZDZiTzMyNURXdks2R211czZlVXp4?=
 =?utf-8?Q?qx7cJnrG/zWxu9FW7cX8Di7wY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca394dfd-c4cb-40be-1e6f-08dbd3b48d1c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:41:01.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DOhKUjfZzpq/rYrJgtdTyVxjLRWkt+QpEoWevT8/4NWqWil2An8OijKiMeIgEqCX5FdH7GXt1Nd+6RtxYG7Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7564

On 23.10.2023 12:23, Oleksii wrote:
> On Thu, 2023-10-19 at 11:18 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/event.h
>>> @@ -0,0 +1,39 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_EVENT_H__
>>> +#define __ASM_GENERIC_EVENT_H__
>>> +
>>> +#include <xen/sched.h>
>>> +
>>> +static inline void vcpu_mark_events_pending(struct vcpu *v)
>>> +{
>>> +}
>>
>> While this will satisfy callers from a build perspective, no port
>> will be functional with an implementation like this. Yet the
>> generic headers need to provide the required functionality, not
>> just build stubs.
> It makes sense but then we will have the similar patches when new
> architecture is introduced.
> 
>>
>> Going further in the series, I won't repeat this kind of comment.
>> Unless others disagree, my view is that headers put here should
>> be of use beyond initial bring-up of a new port.
>>
> Then we have two options here:
> 1. leave only declaration of the function.

Which would then require a stub to be introduced in the arch, or else
linking will fail (unless all calls can be compile-time eliminated,
which I doubt would be the case here).

As before a requirement (imo) is that headers introduced into
asm-generic/ are functional. An arch would introduce its own instance
if it wants to do certain things better, or if it has further needs.

Jan

> 2. remove it from asm-generic.
> 
> ~ Oleksii


