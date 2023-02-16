Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8A699760
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496578.767400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfE1-00042u-BX; Thu, 16 Feb 2023 14:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496578.767400; Thu, 16 Feb 2023 14:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfE1-00040Z-7G; Thu, 16 Feb 2023 14:27:05 +0000
Received: by outflank-mailman (input) for mailman id 496578;
 Thu, 16 Feb 2023 14:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSfDz-00040R-Hb
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:27:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7c8197-ae05-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 15:27:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 16 Feb
 2023 14:26:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:26:59 +0000
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
X-Inumbo-ID: fa7c8197-ae05-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/v6FfiI/7FrdVXBAVsCHaajCCQOeT+O6o8FmZAU+DfhxcKzHkbiwCuShwnlhxrNb8p+OxtYeZfCbTJFmoVx2C/VJqbzRaZzj6riqZ25cCClW95oOb6z07dhxybX1LDpXcdXxDYBeToMyjymfvmKs3DRY2KH+6h4lEDk+WFNP2wOd12COWNSScM9C2d5yKQhRBTZiQG8XkuD+aXoag3TMUCnkU/JsHEboWqw3e/CWXhPJxFGqTBfjf6BOoTA725ixUe2mbXSb6KjWIrMFQzyo79FizHragqQowS090UatZ40jaYlUUzvSrlKAIE5M8nlB133QAPNADilRbQ3prTXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjaZms3aw/Ub8Y3/Qm89xtSAbiAlHv+A21nsdu3cXV8=;
 b=FyP2QevatNxyGUSMMBc8q3E3ZkLUyMKouzLgj7N0qKvknSMsaFgqmLakKaXFhPqewSOeWdUm4RzfT/nFEhDBEqp3hHORf2Cty7y7K9XwEcl8HaNSmeC0BJpw4Q6jIHhKgNxKD4NAlgPuPiaG+NkfUrJLCl8N8nbK6zJwONr8occJBQdZDvfFF4VKLWxFN1kbQspaZZ5JmbszYgGKZicaxlccyJTAbMCfWxLyUbCPYtZXlDFdz/W3anW+waBvK7rxw/Bo7ahYtQ1Jp/ArVancqzsuDbpPfp4czhH6IPLzSor22LGDJPDSa1+6Dp915jSRWxUXvmJd2xe/LgyaKA9Guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjaZms3aw/Ub8Y3/Qm89xtSAbiAlHv+A21nsdu3cXV8=;
 b=DTDl57fTEVDMCxKBGLXpVtvxdzaLPy5Hx39lwe680a3nvrenC7X4MQSlr0vrfs9ncPRmd6ZkgyOnV9+OcHxkxOmWmRucm0PryrkapzWPmTkStM7Uj3IVCBuhuNxVTyodefj7X90twzKDoYgS2jwriWSYPQs4WMfgEdzI6rxsspSZepm4xgSP0l/9Ejp0J+Qy8cEKBhS5SXtP7IqXj+qVzjRbyxeupHqR3yegfDMNf53BGEy+qR9vynU+N4gDeP48G+Ee94ujrKW+q/fXjYRKwXGg1PopI40aKnOPoiALswZnwPjUAofne1boJX+VV1wSqZTwvu9TleWkIhBsGIoZ6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <000badbf-cd94-76b6-1f60-faa720a5407f@suse.com>
Date: Thu, 16 Feb 2023 15:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
 <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
 <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com>
 <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: acbaf292-915a-467b-bb20-08db1029dd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+2aEXn9lQw7dTb7vn8UXJz4rbVPHeJEuz1qzDmcfg2qHuipi7bb+s/2iGzBwb41ouvtlqOzVBgVzK+X0mx9lnpvTKIgYlSS/HDawn3L8kzh6/y35mOHKNfI8ank36gPHUOvkMR36J2eyUueTfuQRcPKhbyjcFTxOVw4VPsiWhuXqJPs1pG29RGd6HRhPKXHtxBug6HuKD2t70u3tNU39gtKZFY44VWnP6D6fgSfsKFzJaQzb4WcLkCSZVqMOXK9MD5Kdbb0FKbIZES5q/h3D8dDn3WfL7+vIsqJWpcpeGfzIgsjDqJ6HUWfThEU9NWjZFFzMmYzbf4gE4cF+FiR455b4u7usACV5pZssA6ZcrTy9P9xPnqp9N8TTS7G33n/NoaIOoA2W7v481Iahe/G/34Gh+fwE3Qq706X7j36DhJe0EQQB+IS5mA51wdP57ocyBdWE7PvyOMGJc7d3oOorpfp7dvlZefbZVcgIAaeWu6vby4F+4hGczb9hHLMY0JYRsutv8htqeiM3L/lYX5soCaqXtsNvRpo7K8T1MLdV/tvCHyyWWsB3RAlKGvSheJw5BWki8Oo3iPSHUjNKPGtcenreySQDbaLqCi4YvppccDYLjw98+iJxc8ZWjwY5Y4aJrwb84q1WFq1cmfpNB5QPf5lTMDViSwWD5AJZzTDgyIOAEjJkhgrvNhUbCFCMKuOW2AZ0iq2dWh3BEdzWkXyCeNCxHpl++yVdCDZmILxTEQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199018)(478600001)(186003)(8676002)(31696002)(86362001)(38100700002)(2906002)(83380400001)(66476007)(4326008)(6916009)(2616005)(66556008)(41300700001)(6512007)(66946007)(36756003)(26005)(6506007)(53546011)(5660300002)(8936002)(31686004)(54906003)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnRLZVl5enl6alExaDA0REJZQlNiVFNFZzBpQkpmZDRQMDBRNGhCenhMcUoz?=
 =?utf-8?B?TWc0UzVOWW5DTzE0VG9ER2EvSXYrRzBZS1k0Z0d3SUxhRVFnNWpadXhCR0dH?=
 =?utf-8?B?YWVKOFpNU05PWHlEY0JJMUFPYnBsOXJRWmp0MUYxTFAzU25MZWxkK3hZNXFu?=
 =?utf-8?B?a0hQbkxLMFpuUGFGR09QVm5NZTlIUmhTcW1ZSlkvN0lWQzRmODVjRFFjLzZj?=
 =?utf-8?B?dE44Qzc3ZkM2c1NCdnRoZ0d0Nm51ZFo5VE5SRm8zRmZ5N2owSUtNMmtPSDQr?=
 =?utf-8?B?V3I1OXVtVS9qSXQxTjFqS0xFd1RnVW5ndE9QOG5qL05CMzBXditGT2dvMlRu?=
 =?utf-8?B?Z2NraUVsa0M1cy9RM2xDZGtOTUg3aUI5UE40d3FzSWUvRFU5ZFZPMmJaMFhG?=
 =?utf-8?B?VHFpUG9aK3ZLWGd6VkMzUjllSFZqcmJGWU92WWJheVhCR3NCU0lBME5NSWZW?=
 =?utf-8?B?RSsvS29HUHFlb3YyMGl3REM3Wmd5N3JDbERHZEVkTkFranpSR25wYUQrY0hN?=
 =?utf-8?B?UEpndVBTb1dEYmdkVVNDckxGYU44OGJkSXU2WnJXSGhyVHdsNlpTd3JjRUVy?=
 =?utf-8?B?eHA0UGxOZEMrLzJNWnoydnlQYjU3T2ZqaE9xcEs5cFZtREZNc3VBTTFvMm16?=
 =?utf-8?B?WUovdU44T2NYUjhYVWtXQnBDNmZiQmZaTVl0eDhTbXNhVDFqdnZGRHpITUl5?=
 =?utf-8?B?V1lxMEFuRzFOaFYvd1c5Qlp0Y2M2bDFVVENCRTR5Q2NWczJUWGxicXNzNFk3?=
 =?utf-8?B?R3VHTXBnY0pRVlN5M1RoRWs1MzFrYkpEMTkvRFdUYVhNMWRZZGhVekw1SVNW?=
 =?utf-8?B?ajluMzY5U3A0MHY3VzlTdkh0dTY3N3ZjUVhlZUxmc2ZiR1hLY2lRbHJ2QUU0?=
 =?utf-8?B?S3hKZk5wSWljYU1ISXhpVVgxRkE2NmpjRnYvME56bHU5YzVYLzFMTHZMRXZs?=
 =?utf-8?B?Y2ZEQ0VsbnNFY1FSQWhEL0FhTTRHRlVvc2NLanVySGVNUDRSZCtZZVI0RGhJ?=
 =?utf-8?B?Y0VIZ2hsLzVCOUIyam8wTGVFdmFIcWliTmlMY25ZUmdtczJCanlHSmwrK3Ji?=
 =?utf-8?B?RFNKSFBKc29lNmErcEV3bkJudmg5SCsydFlnOVZrekpxSHFHaTc0TXc5d0tX?=
 =?utf-8?B?dVJKd0FlYUxkdDdMMVcvQVlWQkhySlNDcFdCSjhCRTFtdjdoRFhwT0ZYRGpF?=
 =?utf-8?B?bHlIQmc1VUpMVG91ODRiSm8vTFB4NFcxSFZka2pxSTUwSmdoZGg0T1JHSFA5?=
 =?utf-8?B?cEZhUFJQOFdzWk1kN3lRSVNkRU5uU09nK1Jyb2UrVkR6S2Q0VlRKS25tUm5t?=
 =?utf-8?B?R0c3T1NhVGtCNEI2TWlJZzlYTTRPSUtzV0dDOE1TTlBsdWFRMlRqOUR3RTVp?=
 =?utf-8?B?dUR4YlNWZk11YTgzeTFhVVE1N25ESm9xZzBndUtDcWZ2Wk12SngvUTdXS2Zt?=
 =?utf-8?B?RUdvUDR4enpXMkd1Z2pxNjVMNWttQ1lKWm9KZ3NGa3hBcGJ4YUQzNzJ1MzJJ?=
 =?utf-8?B?S1BoRHYxdk9VRENCZHpvUndjOXVYbmszR01GYUlRbUlaY2t6R05UelNrYVpk?=
 =?utf-8?B?eDVzYmFJRjFuOTNMUVdtOW5EY2E1Vm1oTndBWjkvQSt6L0U3T00yTGZtYlpp?=
 =?utf-8?B?cUdqc2ZpZmJlKzk2dkg1U1dxM0lrYUlOLzBEbE9uUS9CTVNGTFN1NVZuSzli?=
 =?utf-8?B?R1U0bWlSV2dnRW11SWs0elZWZmhPWHVlVmVQSC9hWVlFY01uWnVrazJlakdW?=
 =?utf-8?B?OFE5MEVsQnl6Qm5SZzV0NmF5dFpydjJsZTI5U2dKckhsdUsrekltMzhVY2xm?=
 =?utf-8?B?d0ZUWmRzNlNVb0JHcCtUWXB5b1FQN3JJcHZoTE43YlRmYnl5VmwyNEJIdW85?=
 =?utf-8?B?SnBkbnIvREVNcXg3TzB4NlFNdk1DbU9WM3QxVUFoKzVSYXJ0RzJzeDdxQzkw?=
 =?utf-8?B?ZUN4VDVnZ1R2bGVWT21MMUtaRHJkU0dTdTBRYUR3bnVxQnNRQ09xM3ZCek45?=
 =?utf-8?B?RXZtekh5MEMxbElHQXdJOElVYXZkd1ZGZkI0ZmFqZTFNVkFyVVhKYUI1RUZ4?=
 =?utf-8?B?ellzTENHUWh4bFZBajZ5ZkVOOEdtbERFa3g4dTkwQTR2UEQwenYxTTNjcEg4?=
 =?utf-8?Q?XVsZ/bvDYz1tSUuuxw9VoJC49?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbaf292-915a-467b-bb20-08db1029dd59
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:26:59.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTs120t1Y0Lx1LUA8glIby4ZQiLfPspqFcjNemyfi5+xvWINq3pBHnjBh80FsjBqr6UWrMnoqAm0iJc0rvJKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9351

On 16.02.2023 13:22, Tamas K Lengyel wrote:
> On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.02.2023 17:29, Tamas K Lengyel wrote:
>>> On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> Did you consider the alternative of adjusting the ASSERT() in question
>>>> instead? It could reasonably become
>>>>
>>>> #ifdef CONFIG_MEM_SHARING
>>>>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
>>> !atomic_read(&d->shr_pages));
>>>> #endif
>>>>
>>>> now, I think. That would be less intrusive a change (helpful for
>>>> backporting), but there may be other (so far unnamed) benefits of
> pulling
>>>> ahead the shared memory teardown.
>>>
>>> I have a hard time understanding this proposed ASSERT.
>>
>> It accounts for the various ways p2m_teardown() can (now) be called,
>> limiting the actual check for no remaining shared pages to the last
>> of all these invocations (on the host p2m with remove_root=true).
>>
>> Maybe
>>
>>     /* Limit the check to the final invocation. */
>>     if ( p2m_is_hostp2m(p2m) && remove_root )
>>         ASSERT(!atomic_read(&d->shr_pages));
>>
>> would make this easier to follow? Another option might be to move
>> the assertion to paging_final_teardown(), ahead of that specific call
>> to p2m_teardown().
> 
> AFAICT d->shr_pages would still be more then 0 when this is called before
> sharing is torn down so the rearrangement is necessary even if we do this
> assert only on the final invocation. I did a printk in place of this assert
> without the rearrangement and afaict it was always != 0.

Was your printk() in an if() as above? paging_final_teardown() runs really
late during cleanup (when we're about to free struct domain), so I would
be somewhat concerned if by that time the count was still non-zero.

Jan

