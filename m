Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1876CB91F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 10:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515582.798601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4Sk-0003ut-O5; Tue, 28 Mar 2023 08:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515582.798601; Tue, 28 Mar 2023 08:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4Sk-0003rS-Ji; Tue, 28 Mar 2023 08:13:50 +0000
Received: by outflank-mailman (input) for mailman id 515582;
 Tue, 28 Mar 2023 08:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph4Si-0003rM-Tq
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 08:13:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75d26c88-cd40-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 10:13:46 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8847.eurprd04.prod.outlook.com (2603:10a6:102:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 08:13:43 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 08:13:43 +0000
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
X-Inumbo-ID: 75d26c88-cd40-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSj+z6JcjhnRqN1Gk2uUJJ7MfRCHAQYhK8bjKAkT5ffAZ0kUnyXuTMxjQ9dqJTaY9qronuz+21uhYIhCzI8xFMhRDpVOvQLUXxPx3kU18dFsYE6B9J109ycqYqPZQjQqA8+uyQD1rUAtU6aeOXWkTDSJWvxUsn3wYVM+oLJT91d9Rbo0n0rbMqgGK6kR1CWcS62ipzMcPLoyTqr6VqpRskzVfQCPKCaCxii4f27JIDZYJPzGJ+ybafDJ0oq03PpfyTfkka8GUttFFe05j5sUngT+ZlbAkna4ujQIAB2gaUjviJIGYDCdReS+pXVpntl7KsrifHIQzzxnfCiFvNCKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ps6Cg2zFYgpSH96/vj2RJEY4CEwXSqfHOGsAuHE53z0=;
 b=cRFSEEldHr32ef7m+79TJT49B8KS2+Fd3MHu4HlDBr9cchIcnyNxXvQw5RMN4xROh88lNS4ju+KtItODhEtR/f9BcZR7uLMB4DmfdIpR2zP/PVQ+RQFKDJxmiVvMbb10oB7L2c19r/BWw84W6bmXWY3uFOCOVWF/oocjaWb93icoMy9zMEc8YTEiBoVSADgfO+5YATqxyvNocTYUCiV2qS7Qa+e1CvLoy81PNjrG1BFShdVt+XUY3MTYOkL/rlrLLE7cjQdXrfaK6zse/G/gY7v+UdwHxfIxoacD0kpWnBfukBR1V3ix2MErMdnKEOm1zEc1LTOGSwRhwONmCbMuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps6Cg2zFYgpSH96/vj2RJEY4CEwXSqfHOGsAuHE53z0=;
 b=tnoWuOf8fIodAG/QTtCLfw62HZjk+FUJfyv0aGrMFWHMRV/RLbDuzyqh+6CxfFJXRa433B8I6EzJ+cr3x+/QLU0ibn1vDNiDSML+/k2AwKrwPoR6WbCwqGyKEiDWWuBr7X8FO1kcl8RVD3fGsQulMEurP/IIexZD1eAycXPuZ+MJnoyhKM7nJewC0dw2m6PcwPQxHnH4EyQztyyVeTSBVpRVPsEML9siMNarcuXnZJJq6oQYK45uM2rA5VZHEGMo8S45O0wW/VFiDlP0xNgqx3PHRKv3j72rMCzgn4DK66Zx6IzPictVuM/ydgTY+7E6PwrNaCf94ecni4AkBxGezg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eccd3494-6e6b-48f0-be2e-7fbda1db1196@suse.com>
Date: Tue, 28 Mar 2023 10:13:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
 <3febb233792329adf0cddf81efa8536a98b7151b.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3febb233792329adf0cddf81efa8536a98b7151b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX2P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::25) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: b139cc81-2e8c-4dde-99a4-08db2f64588f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BjzMhtRpG6ZV7fNR6ycGU32IjF5Fq0t9uGQsgZO5Fvo5FtEaPnpm30T12CxUv2CrNjXUFoLHE7uCoT4a7nWdlGlKBMZjblnghSGVkF3nEDwsxQkWINMlIkgT4JSbfQibjv4QcNo7Qu3uvathePP1A7Hbt4x744pOpQCHIh6cOi/tP9IUa1Hwvc5FQH1zFaFNxLNiESFkGlxObLF2aaP3lBJ7ilfsyTSGmJdUgnknqv6Ti/OsDBvm79KFKLf6V7JMhs9H/1YngVXuK6jVBK6aQJcPGQc8XmrWttoJFtX2RLCsMPrfsowZgRLHGDFr7Rz5OAgjYbwG4x73Td41pQbO/FVhsVFJ3PEApsRRrXbv8aX3jWkUrK5vHGSRN38sG7yq8nPJ2v1wE2A9fIfcpsLllvp9CzNSrV74yd+Nz7H8tORTyryHvYJ+Rdlij9FHsfArxA34gkm+e6xdIUet7xvDQhZMySaeZvw2Vl3LRGDEDyMbUt9Ms/TNIyO/ZvfI4/KG4qG/vIV20MSuW+DNCn2+IzCEphqAKImv4aXJsyrBxmn66bmM6+857mx8rx6MWE8gXw0zNP2tdPLw36mQjzYENgBgzsqKscogEF6iuJCDvLktgYrH3OGj3FRwjVKCHX0QBFEc03y0utNmA8Uh7SPOu5rLXMKc1HOfPRlo+spQ7IQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(53546011)(2616005)(6666004)(6512007)(6506007)(26005)(36756003)(83380400001)(41300700001)(8936002)(66946007)(5660300002)(8676002)(66556008)(4326008)(6916009)(186003)(66476007)(2906002)(6486002)(31696002)(316002)(86362001)(54906003)(478600001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCtxRThYU2w1ZzNGOTdxeG5iTUxMQ0RCZG1ZUCsyZlZrcFhaQ3RnWVVTSG1S?=
 =?utf-8?B?NlFycDBITkt4dkV1YUF0UnpSQzlzb3RXK2tTUys5eU52bnBoVHBVd2xKbSs0?=
 =?utf-8?B?NEJIVkFBdzUzWHBJbEF2d3BNNmxtNnZEK2VmWmZ3Zjg3YnJtVDBvbGpPei8w?=
 =?utf-8?B?NlEzbFVYbU5TUkg2QzB5WHN5OGIvQzRPRGR5ZTNpYlRWKzE4S0tCK1JRUFhz?=
 =?utf-8?B?cFptMk1TVk51a3pjcDR0Sk9STWRKYnE1S2dwdVZ0VUo1SWlMN2ZNSFRkNVVH?=
 =?utf-8?B?Q2lRYTJQNHRVbm5tcVgvbUYwM1lQTjZXQjBNY2RYRW54NVBuTW1QcTQyNXRI?=
 =?utf-8?B?Q2NqS2RkRTZUU3dJNWh1NWhGdnIwS2NiejJEVGRodkZLT1dzRlhXUlg4UjNn?=
 =?utf-8?B?Q2xGUXlyTWVxNGFKWCsrYmYyL1Y0ekhrTmVMSWpvc2M1NHpRdGtxZjJWcUdu?=
 =?utf-8?B?NG9KNGlUYkNCRXV1VFlyVzJOQmE4SDkxbVZWWFBNdGNVOEF4L1ltZ1hYc2pv?=
 =?utf-8?B?M09jQS8wcTFsZGVnQlF2UUhpd094NEs2NDByRjVvNUZBc21IQUd6T2EvK2Ey?=
 =?utf-8?B?ZUEreFRNbFdKZXZOQ2IvRCtIM0h2VWV0TDNYTlRlemkyK01hamZrSTUyYTFX?=
 =?utf-8?B?Z216dzMza1BOQjdTaVkwUElleCtLNXA0elNiMDAyRXo3bWQvTHkwRHRpOEE3?=
 =?utf-8?B?WWI3QXY3RWRkMmlHZ1EvRUlwV3YxN01VRTRNSXl4WStlK0FZd1g0Qk5tY0gr?=
 =?utf-8?B?MmZXazZVajJSanNUMDljNFJnT3daakVDeSs4K21QamFuQ1NwcVZJTi9za0x4?=
 =?utf-8?B?eEpjdzVtd01VQUZmRkUwNkFKVEFDRDJxRy9SRXNzV0xSOHlSLzZ6MjRFTWtE?=
 =?utf-8?B?bUZ2eVhkNlpybm9YZ2h4cHFDaDdaUFhyU0lGRmlsR2pLR0Uxa0xzejZJdXZx?=
 =?utf-8?B?QUFUTmRsOWM5c2MyOUF6WlRxc3lxN3Vxb3lGLzE3RUg4b1NGY1BETk5NNFpl?=
 =?utf-8?B?eXRWaEc5WDcrdEpPWE5nTS9vVFNUVkx2ZDFBQ041Yy9XU20zdURxa3lQWkoy?=
 =?utf-8?B?OGl0Kzg3azBKUllYeFJjZXBzMGJzRzlWWUlBVkIrMi9iSnJhS2NSb0MwUGF3?=
 =?utf-8?B?R0oybEFhMDVGeENmdHE0ZTVHY2V1OUxBcnJhcFR2L2hycmt6T1ZxZUVaZEpL?=
 =?utf-8?B?eFpvWnVuUkoxR1AxWUtYNWFDdzB4ZThFT3NtdWlFYUIzV2NXbXF4TzFlRmVW?=
 =?utf-8?B?QUY3Q2phaGNobWorQmJlSHV4S1VMcUR3QitFMVVUZ291U0E1dzFEVmFxcnBy?=
 =?utf-8?B?QkZ1UFRtQnUvSWRTRk1OdWlkN3NqR2p3RFdjdE5xbmovYTdQVU1Qd3NBQnZF?=
 =?utf-8?B?MHBUaWw1Q1R6UklKbFNlL0xzZFU0T0g5Y2pMZXJGa05DU05UWjVXVEpJcWRR?=
 =?utf-8?B?ZGQwZ1c5N1JuYTRiZTBudk5rcURkZnBkQkhmZjVQa0FpUFJROXk4cVhITzJ1?=
 =?utf-8?B?TkZsS2M1d0w0Y0QwZ1RVd243NFBDTEtNdStrdEZ4RHRMT3llc1d0dHNWQlVk?=
 =?utf-8?B?MU8zMUJHWXZlS3VkYjJJekNUWUtyT0htbjZBRFpodVpkbUZHcmZramovZkFV?=
 =?utf-8?B?K1h4WDVIb3RHN2RlWDE1UDB4UXBpTTkwZXc3d0FMUXliMWNQbzhkeU5vRnk4?=
 =?utf-8?B?R1VLNEtaMEJaRXQ2SkZmVHlWcEFuWDRpM3N4V3BPVWNyTHBMcjdYTUovVXhS?=
 =?utf-8?B?Y2Q1UzNFclFDQm54QS8rU0JSVnJ6eUpjMVpjK01mWHZxRjI3YlpGVS82V2Vu?=
 =?utf-8?B?MDRYT2l6ZFBwUUxPREdJaTIyY2NhMWhWZUxEVm40NjA5ay8yVVExK3lkMVkr?=
 =?utf-8?B?OUxZYUJhQVpYYUtDR3IvSWJTMkFJbU5MNGIyNmpDVndvVE1QbnVFd2RFR3NQ?=
 =?utf-8?B?U2ZsZWFENVByejVDdGtrd05NL3M4dzljeWVpL0R0MzJqY3F4eW9oS0RPQndC?=
 =?utf-8?B?Y1lBaHpGbHZCQnVHWklLM0haY2dremp2eFRGN0FCRHltN1JvWlBTQVQxOXNn?=
 =?utf-8?B?WmJLMFo3TWM0WVN0NHdEVDNDUGVlb2VDQ2QzTXhoTi85VzJkdU94aHJtQ25O?=
 =?utf-8?Q?K7K1PH0pyWm0AwI8r50xxSFUQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b139cc81-2e8c-4dde-99a4-08db2f64588f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 08:13:43.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9G79G+hSnu7Mat6mbqq/dB5D0c2iCa8tALIOIyuF4qpW2uIFDaBkQQxBsI/PmIiUsYeQ2+OtS+KL4aGBhESdsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8847

On 27.03.2023 18:10, Oleksii wrote:
> Hello Jan,
> 
> On Thu, 2023-03-16 at 10:52 +0100, Jan Beulich wrote:
>> On 15.03.2023 18:21, Oleksii Kurochko wrote:
>>> The following changes were made:
>>> * Make GENERIC_BUG_FRAME mandatory for X86
>>> * Update asm/bug.h using generic implementation in <xen/bug.h>
>>> * Update do_invalid_op using generic do_bug_frame()
>>> * Define BUG_DEBUGGER_TRAP_FATAL to
>>> debugger_trap_fatal(X86_EXC_GP,regs)
>>> * type of eip variable was changed to 'const void *'
>>> * add '#include <xen/debugger.h>'
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V8:
>>>  * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix
>>> compilation issue.
>>>    The following compilation issue occurs:
>>>      In file included from ./arch/x86/include/asm/smp.h:10,
>>>                  from ./include/xen/smp.h:4,
>>>                  from ./arch/x86/include/asm/processor.h:10,
>>>                  from ./arch/x86/include/asm/system.h:6,
>>>                  from ./arch/x86/include/asm/atomic.h:5,
>>>                  from ./include/xen/gdbstub.h:24,
>>>                  from ./arch/x86/include/asm/debugger.h:10,
>>>                  from ./include/xen/debugger.h:24,
>>>                  from ./arch/x86/include/asm/bug.h:7,
>>>                  from ./include/xen/bug.h:15,
>>>                  from ./include/xen/lib.h:27,
>>>                  from ./include/xen/perfc.h:6,
>>>                  from arch/x86/x86_64/asm-offsets.c:9:
>>>      ./include/xen/cpumask.h: In function 'cpumask_check':
>>>      ./include/xen/cpumask.h:84:9: error: implicit declaration of
>>> function 'ASSERT' [-Werror=implicit-function-declaration]
>>>                     84 |         ASSERT(cpu < nr_cpu_ids);
>>
>> I'm going to post a patch to address this specific failure. But
>> something
>> similar may then surface elsewhere.
>>
>>>    It happens in case when CONFIG_CRASH_DEBUG is enabled
>>
>> I have to admit that I don't see the connection to CRASH_DEBUG: It's
>> the
>> asm/atomic.h inclusion that's problematic afaics, yet that
>> (needlessly)
>> happens outside the respective #ifdef in xen/gdbstub.h.
>>
>> If another instance of this header interaction issue would surface
>> despite
>> my to-be-posted patch, I'd be okay with going this route for the
>> moment.
>> But I think the real issue here is xen/lib.h including xen/bug.h.
>> Instead
>> of that, some stuff that's presently in xen/lib.h should instead move
>> to
>> xen/bug.h, and the inclusion there be dropped. Any parties actually
>> using
>> stuff from xen/bug.h (xen/lib.h then won't anymore) should then
>> include
>> that header themselves.
> As all your patches are in the staging.
> 
> Can I send a new patch vesrion with <asm/processor.h> removed in
> common/bug.c but leave <xen/debugger.h>? 

If another variant of the build issue still exists, then you want to
leave that as is, yes (but update the description to point out the
new issue that makes this necessary).

> Should I wait for xen/lib.h reworking?

No.

Jan

