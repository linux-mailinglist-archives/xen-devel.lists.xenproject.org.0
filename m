Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71E7D2F8A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621248.967506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quryC-0002n8-6V; Mon, 23 Oct 2023 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621248.967506; Mon, 23 Oct 2023 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quryC-0002l5-3p; Mon, 23 Oct 2023 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 621248;
 Mon, 23 Oct 2023 10:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quryA-0002jc-G2
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:15:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 188636f0-718d-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:15:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 10:15:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:15:29 +0000
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
X-Inumbo-ID: 188636f0-718d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDZwFr0oziFv5tipW0tlHuOmS/nSf8bHcv54UEEQdflnTNfSJkqfEZmNTluexEeX9HhK9QCrh7qNdC946I+2pnLPWWak5WjhiyEBRoWzHRaGRE7BqrykvV0w6EeWLrXQnNinXm+0sP8CKbnopXUTefNXz+Qc9yrgELYJCr72Hrtkd7yv84DHwkX75d0aCbCTsuKruAfOuDGmbqt7AJsEPeYT+fxDFyyiYv2hezrsE7QLq72yDKjeYB2YQ/CVEZxfj2IDL3bcP22crMuq6zKl8nqXkCHHNAoFQcCdBGPqKVtCGcat194fLX7ERGoBRPcv3ZVMsFS8SYRnwnG7E0gm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMmEnqBJouoEbqHFYP/sBwuxGAbMQYANWOUYsV3GV5c=;
 b=VFj3H5gRD4CmPXNMWGIW4M6izgBSEb5+GM+382Z5YYilH7eV8BzGt1aQjQ3htFCawdbCBrjxevbqhxCBail0NkWJJ8os2hNBTlwI19XReDBnUVMd3yhlqX5LTYma2iA6854v7OXpxio50XMvNwkp+5TS770eM7ejxfzL+4xGv+j821D+Du3vh2Xj/e8nWgePndcJJUu/lpZd8knK60eNY0fGjqc0oV0RR39wcq8qb2k8lnJG20W8+OjJOjqK/6lIyUir7s5U+u/QgUypU9DKnMx35xY+QRqej7m7O7CwSiq0+BCxQbJiEatux3QavdYVH6NwL26dyZL9fBNH7iD3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMmEnqBJouoEbqHFYP/sBwuxGAbMQYANWOUYsV3GV5c=;
 b=4h4LMKb21mQZwyQvUvSw4uzP9ZWjzhf8z22YxLkMErs9lnC86iLqYhHl9q3EiXeM6HzvP2S8tqJ9KK1Bv/VHEHavz1kvkRHvMKkZVnzNyDQG1K59VgqgbC8kKwWWyuUTF0cUagrhOtb4t7p0N2t8tSeok7mpqRFbyAoUq2g48tfZW/6uzycKh5YZ6pExKntNqz9j4uD6undLDDM6M3Izwt6tAlI0Ndi4byPVHZ5hLMiN87XipdAQitFmKzMyNbIFN/z1XtUgd4VzauDSjlUMaQAJjv2cHScoE9HiRfewJlzFoswemF0nPFVOGJF7HIiMAdze/QjpfvVwAaxkhmngfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fb48368-8993-dcda-fe22-db656489963d@suse.com>
Date: Mon, 23 Oct 2023 12:15:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
 <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
 <b37269c08749424e54611595e2ab1a0f4cbb3cc8.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b37269c08749424e54611595e2ab1a0f4cbb3cc8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0295.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beec4e0-9e47-4584-02bc-08dbd3b0fb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V68k1hBN+iKnc5KFnzK1NIQIK+MUbyJJqJs6FefFxVBi9MFsJKh7ch1gpXFveUqwaLd6OSnFZSAV5PxcKxrbGyKzhHRaImYPn5pWV0McA+r3GIkB9nTylAPcxpS/alOA4hkQNuriP6OROVe4CAf6385pnrwjrJ8at4ZruKALYjM07mlvKBMUq9ARrD3Lr7xfChGm94pwbbMm0xl+PnwYWi0Sa1Jiil4d8syj1j7u2VCe+UtRxu6SE7It/1Vcb+F8DuAPOxsDsdvTm06c3Q7HuquNX6X4FA/2STPhLnZEPBIoMrw+YqsHwCIM1SjhKzFA1YlnR6bAjFwTu3FAq8Qdtz+h+GQr3MTIUdufYgFHhEL9S9HOW8rl9TAA2djLCkZ3xrjaKyhGaHPSark1RApDBBshVVW/rtv1nEY6bREtXIYRrsv2SYsqC8RaskL2X2UXlC4y5oJD2O+zzQ+MoR5gSCumrE1WXzr5X7X9DyhI8JhvxC5D9Z9H5SJZnd0MuDdWaFIbBgpiL1qhkJEQVvcS7/5GIueRRF02rhCRWjzWYXBpBT8Qocyv3RV8R1T2fvtGtRggxtO61Q1znelvTmwGjya7bbvwbwau0txRPCHfCCQ4ZZkzLDIZMlUN1XaPEmE/gcRxs1GUfw9XGy5tMnBJf1eykvaMwe6DvpWNySLy0l0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(31686004)(4001150100001)(38100700002)(2906002)(41300700001)(86362001)(31696002)(5660300002)(36756003)(8676002)(8936002)(4326008)(2616005)(6506007)(478600001)(54906003)(316002)(66476007)(66556008)(6916009)(66946007)(83380400001)(6486002)(6512007)(53546011)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNLSHh2VWQ5TWlCYmw0T2I3cXVweG9EelVZcHNsSnVNUTAvQU9YRVRHNm9s?=
 =?utf-8?B?SUU0dEs0TE1HZ3VHb0RnTWRNTENwbVY0M3U5dUs2OHMwUk4vMVVCbXJyRWUz?=
 =?utf-8?B?M3BSMnlDQ2pOKy9EeUNROXg4QVZwWGMrL1JmQ3BoTkRNZk1hTTBwZG5OWURZ?=
 =?utf-8?B?Nzl2UkRqSkhJMXNXdzdDZzFWL3VlaUgyREJZL3lUYU1RL0hiSFZIamovcUhM?=
 =?utf-8?B?d3V3UHhwK1poZC9wN2cxTnNQUVFHUm1IZHFtZmErTVB1bU1RaC94RkNqaThh?=
 =?utf-8?B?amJSc2t0d2ZJc2xFaTVVTldwUXFUSVI4UU1KL2UwYUxuREttbXpBcDFaSVdn?=
 =?utf-8?B?YXlYQUlpekdsZVRVaStnZmlVS1d2SDlZV1V0OUdpcFFQeFlpY2paRElOQnFK?=
 =?utf-8?B?OHlxYkdNcWt4UWxZWTMzL2FDeGVoeVBza2h3RXBJOFExdHZVSEdQYjFCaXU1?=
 =?utf-8?B?YlRtaS81bDQ3NnF5SFBZZ2xmYmF1Uko1TWNWU21sbmVjSU5PWnlzSG8xTWpt?=
 =?utf-8?B?Z1dWYTdtc09PVkVGYjIyUFMwUlVuWnlEN0tVM0JOWlNOcTJIMk1kN1crNGRY?=
 =?utf-8?B?TllGWVdLU09SRlN2b0dVby90a1FVb0NaQVZGemk4ZFRQMVhwdkdEd2tpdjNB?=
 =?utf-8?B?SU1uREt1aDZncVNQdU5yTmJXTCt3RmdrdW9kbXJBbWxEWXVmMTdSRDU1TTFu?=
 =?utf-8?B?L3BFb3QrK1hhaFlXcW1BL05NWjJab3pUSlhIeU1WWU0zTFVPRmhzTEhoa2h5?=
 =?utf-8?B?NjN4ZWdOSGJFZHozbmVIekNCMXFXQWV1eTlReVdkSHdjSTlMakc2OTJ1L3hm?=
 =?utf-8?B?ZXNkdVU1QkpaT2VWeFAxU3dFNWsrSmhCZCtiQ0NGekUwY28xalNZckpQSWwy?=
 =?utf-8?B?SWt5TnlMdVVWN0ttWGxzV3Z2eGZ5bzhYc1NxbFYwb3dpWkRKT29QVEtLUnI3?=
 =?utf-8?B?M2xkeVVScURieDJreFRjeFJQeDA0WWZLZ0daSUVHRDk2NFd2ZkhpTS9NNXV4?=
 =?utf-8?B?cXBLN3Zld3JjOTJaUzFILzl6MGZEaWRlaVpkQkFMdUNBMnJGWDB0bjlUSTNZ?=
 =?utf-8?B?bEFYYXB2cCtLdk5qMWxUR1NHV0V3VlBhWVF1bGxLaWprMmxDUmZWR1ZRamRk?=
 =?utf-8?B?Vkc5bjY5T2s4RDdUZXNDR0hQWENPaDRzSEdjbjZlbUx5RzN3Nllod1VlNW45?=
 =?utf-8?B?OVNEb2VNL3pqTExmS0gwUVlMRmtOVnRTMTA1OThxM1poSEYyT2ZwVXJnRjRv?=
 =?utf-8?B?VGI4eHhDQ3lzNzBreHhvQ1hVYWNjcTk1emVXVFZkZ1BubGwwUHdsYjlRdTU0?=
 =?utf-8?B?Wlk0NUlBWnp0K3I0b3pnYkRUblhmL0V6ekhoVzRYYmZtU043M045eE84eUFL?=
 =?utf-8?B?ODZ2ZzJWRzB0WVhqRnpsV1plSmtBNWVHOHN4bVRJN3ppYW8xa051UlRKQVQy?=
 =?utf-8?B?QlEzKzlCekt6aGh2M05PbzRlVkU3VWxIY21WZm5taXJtbnV4RFhqRFdXZSsz?=
 =?utf-8?B?VW5lZHZxS24wMVlsWkpNZFQvK1dnb3ZiYi9kVlZnS3pPT3R2NmFZTmt2ZGV1?=
 =?utf-8?B?NkVPZElNTXZCby9IVW9DYjJxRVdHblpQbmlsUDFmNEVVZkVjZDJHc1lzRHc2?=
 =?utf-8?B?T01VTGwySTcvd1hMcDR6UDZSMGw5c3BOUHNOL2ZzYUI1b09LUHZYZC9meC9n?=
 =?utf-8?B?QnJ6b2lYOUNJOHdmQ1RNY3BBUVZlUmtOVkZoK2FJSlZkQy9iYmdJUE9tVEdR?=
 =?utf-8?B?akcwUzVvN2phN0FoVGx6YWlEbnVYbExFS3VlWDlHNllHYmJvMkhpdmRyZ05y?=
 =?utf-8?B?cDBBL1BvS0M2R2dxKzVkUTdmQnV4aG9RR2hodkwyOHJ3WkdTY3czVnFrSm9j?=
 =?utf-8?B?VWN3bGF1M1NVSms2VXBWUEhJQ0M2dTNGZGN3RXNuODZZbS93UUIyYm50aFdU?=
 =?utf-8?B?YVRQQVAyNDhBSHhGVTBSQzhqMkN3OHptQy9QVWY4blpXL3ZzQnN5THorLzZj?=
 =?utf-8?B?cW96a2cvNThVMDlaRVBaa3Z0RmJNZjNQZjBhQ0FIWWVzZk5KWjJYeHpkMndi?=
 =?utf-8?B?dFdIKzJDdHBGRktWQnNCbjhEY2tNOWxTU0NreVREMGtXUU9jREhSaGUvbXJv?=
 =?utf-8?Q?JdLe4QVWLlsVh65s4StLYVbM/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beec4e0-9e47-4584-02bc-08dbd3b0fb71
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:15:29.0551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Amo087kzaMCclJpgn9BMwbeeP55NnXSu+0AZmu+7W9B4sF9juctk/ZX1jr1IUaTEWkoEpLwHPVaFBe0PVInTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104

On 23.10.2023 11:35, Oleksii wrote:
> On Thu, 2023-10-19 at 11:35 +0100, Julien Grall wrote:
>> On 19/10/2023 10:05, Jan Beulich wrote:
>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>> The patch introduces stub header needed for full Xen build.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>>   xen/include/asm-generic/paging.h | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>   create mode 100644 xen/include/asm-generic/paging.h
>>>>
>>>> diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-
>>>> generic/paging.h
>>>> new file mode 100644
>>>> index 0000000000..2aab63b536
>>>> --- /dev/null
>>>> +++ b/xen/include/asm-generic/paging.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef __ASM_GENERIC_PAGING_H__
>>>> +#define __ASM_GENERIC_PAGING_H__
>>>> +
>>>> +#define paging_mode_translate(d)       (1)
>>>> +#define paging_mode_external(d)                (1)
>> This is more a question for Jan, in the past I recall you asked the 
>> macor to evaluate the argument. Shouldn't we do the same here?
> Could you please share a link?
> I am not sure that I am in the context.

There's no particular link to be provided, I think. It is simply good
practice to make sure macros evaluate each of the parameters exactly
once. This is simply to avoid surprises at use sites, where function-
like macro invocations - as that terminology says - look like
function invocations, where every argument expression is also
evaluated exactly once (and in unspecified order).

Jan

