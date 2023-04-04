Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00E6D58D9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517649.803313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaLu-0003Ho-VK; Tue, 04 Apr 2023 06:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517649.803313; Tue, 04 Apr 2023 06:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaLu-0003FK-SL; Tue, 04 Apr 2023 06:41:10 +0000
Received: by outflank-mailman (input) for mailman id 517649;
 Tue, 04 Apr 2023 06:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjaLt-0003FC-MR
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:41:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad84d469-d2b3-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 08:41:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6989.eurprd04.prod.outlook.com (2603:10a6:803:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:41:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:41:06 +0000
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
X-Inumbo-ID: ad84d469-d2b3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhAYVrOsCkH3oFI1IWJuSAOHjQeCyzBcS1F/4v7Df+WS7mdqw8ER7e9r9rLSAFYu7+DND1buzmzJsHdUtnAKllUiQqqV0+U5yQMCKDMu9h180DKu3EYysVaQu8f54ydjpsd/cA/39x17QCFey1/N71mHi8BiwabA0qqDviJIZL72pn4XlMslEhSAiNH3fauCB28U/VahTBbkbFV1qCv1JoBrsdUa5v7tyhVYtyH2qvVYtqiaGFVcScAvg3KCrG+dRnL2TZKgGb7liV+Rhn7H2rMaj8xbHCyuahgXnxAei1qhqR+ETYRkrVW09hQ0YFqtNlJZvsrcFR2pycY11P8F5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2UkOx6OFZmoKsDw4mTu+8TCCvL9Hmx+/sNsW6ojfnM=;
 b=lcKQ6cd7GFTbI0ZTOiQi6A9Zr2gUhnaM+BGTesWnCKVzoubfjNnWfDJUfODAWD52PRcSTjp40w7nx97wQImdFUzzbkYd/4YRr+bBcvR2Fh7RPC8oNs06teJaLoEJsrHOs1kUXcFW7SFOwk3bkgyLcDR5vVaAsMjVqbEscyxPaUpmq+G7eslsDXFEsIr9PFsktq1qXF2dNPrsZwxkUTp5sl3qz5xq/J+sUa3qeGHOdt7yuji2YV1K+Dlv1Xn5s+Uyyhr2M2CCPcintMiVZk1y/vLB06qlko2V5LLSBdw+N934hW2YhJm6h/bqYbTxK882+qlpav7519mUC2bV355wPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2UkOx6OFZmoKsDw4mTu+8TCCvL9Hmx+/sNsW6ojfnM=;
 b=BGitEcbLQ8TjU/oYVRp8OmZwxgYSH0+5EpR9naFwFOrZJ0HIu/nW86b570LLoVns+wBIYoC8S2J1kS+9g6il7c4feBFCRgcshZTpd/aXHr92ogAddgZ4iU7H09n3/M+6HEgKFjTLUFvKVjJ91NrmhR9sNX4eNEW8p/FprUDSg8napQnv/VxCyvrHugAY2Yn0EZFNjEG0Vx/dFu30u+KgRomHO8C4rqY5PZa3H1ixLj0c+OrmjfEFan87UHY6kzBSBkRlcQPCY/fkNx4yCOkcptjYz6NujF8AO6Pc1uhRA4a7mRodore8BJ4/TIf3BMUaJEW5xxreX/iEqtLjSP3X6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c4ca4a1-1b68-5ee0-0434-e6c9ec7d1ef6@suse.com>
Date: Tue, 4 Apr 2023 08:41:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
 <3a94ad32-159d-d06f-cba6-3bb40f9f2085@xen.org>
 <605245331bb93b7e60a4a9d65b19b6642d897034.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <605245331bb93b7e60a4a9d65b19b6642d897034.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: edc3c366-953d-4c12-fb39-08db34d790f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u3KmMZgbqvI7VKAIR6A5RcGph19vbIQMa7j0RFKvJ4OnMTqzAFFyymZU1S2MbByq9Sa4D3AF4Li1xnCuJbF6XylPRbZfi+fo86aXd8V6zkY5QQNfaajccL4wBm7RsA6JaPfdOBt5aPy8WwjoGNYzmtwgYLQSBdbufKTgkpqSNjND34UC5mwdhZ6PV3+si0TOAvswE9ijfRsfewxGgBdMg+QzJj3U7ti56FN9IEEWvz1U15iaRGyW/BUrnwe4jrtRuDe+0DpUOLzI+ozIBSTja5ijSNAT6It5bB38n2PP8P2t7YexTbfxif1cKI/LwsfFPixQIU/njq4pwUxtNoSWY2DoyCJ+8NgSKXhdar6J7CZhMEn2xrdSdhZL+Cs2U5NpjMo7eodU6eH9qDOzQcBciaa7DUw3KLkgtMBT7xY1DQxprtpdPerpPZ3PNqS5qhOGF2hfo4OV5GX8hWW8QF47bexgXGwQv3mrMyB0TISlEQrK164hvijn1c235xw9lbYGgTHSdpRs1oMmAM9ICYUj+uB1Jv9R2Ga1b+AQWqrajXs301vJ9abrflEo2iX3rWp1dLpBTvfQ1vnprNCEmTq4EP67n46uHUWYJI20NmF891dV3vP5b8erfPJUVo3QeBm5FJ8DaLCsK2e8A2MaLxb14sgkChRgUzpHGfX9GeyJUUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(346002)(136003)(396003)(366004)(451199021)(66946007)(478600001)(316002)(54906003)(5660300002)(8936002)(36756003)(31696002)(2906002)(4326008)(86362001)(6916009)(8676002)(66556008)(38100700002)(41300700001)(26005)(6506007)(6512007)(53546011)(6486002)(83380400001)(2616005)(31686004)(186003)(66476007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjMrVURVWTcxMXFNUFIzS3haWEJwanFjQXYwZEJDcE0rWmRMMWV6UklWa3Fw?=
 =?utf-8?B?Z3FVR2o3ckk1VVVQZXRWR25BaCtMN0g2M3ZyTms3MFZaNnh1elRybXNWQ3VZ?=
 =?utf-8?B?SkFHcHh1czV5UHdxSkhTZzE3VG9JeFo0UzFYRWxycmxud0RkdnlkemZIMUJP?=
 =?utf-8?B?ekgzNktVZUdwaWg2Z0sxR1lEbUxJREFMR2NJdjNyM2ErMS92UG5sVXBDRnpq?=
 =?utf-8?B?YllETng3VkE0UXpXVExYcm9YejBzUDJGeTMyQ00vVjU5K3NpMFdMa2tUVllj?=
 =?utf-8?B?UjFJZzEzR0x5QzhNTUxPVnJIRWdhek9PbExodFZJWXg1WnlMa2JZQzI1RTFD?=
 =?utf-8?B?ZTBRdHkzd2FXSlFCT29EKzFHTmgrUVdDZ1pRZ0FoVUF0Z2VWQjFaSElWSFV0?=
 =?utf-8?B?T3ptSHBQU0c4NldHYnVTSktNYlVWWkx6KzZidEJuRnVOZjFZUFpENS9FaDhO?=
 =?utf-8?B?ZHpiRVh0UTIzdW1kT094cjN5V2J2S0VLUTVlMXlLU2V4UzBDNWEwbUt2UlpF?=
 =?utf-8?B?WUlmTWwwT3NDbTNSUkhmckJXZUZlUC9oU1VwczZHYWdMWXpXbS9pRVVOSll2?=
 =?utf-8?B?NkxJa3BSYmxNSC9iOTR6QWpSQ2NFcm9WVDhYYWpKSGZpRHA4Mno5ZjVMSFc0?=
 =?utf-8?B?NXJiT3dJKzNGWTdhMWwvZlZQYTNlZGFnS0JjYXc1a3NMZTZMVTBSK3JHdGpO?=
 =?utf-8?B?VGZkUDJEQ2JDY29SNEE2Y09pai9lQkhGUU52bEcrTk1hTUtaWkh2UzE5b3hh?=
 =?utf-8?B?K2c4OWJnaGltVUFuWjlZV05PUFhjSmVxY2srakR2ZzlTZkF0MlRmblovZXV3?=
 =?utf-8?B?bUZjVUU2SFJPZmhjakFTcHlDQU9CQnl5MXJIY2RMVHpWTHBJNmpRWE1lQWRv?=
 =?utf-8?B?Z2dJR3hQR2c4S1N5Si9DZy82OWt2SXFKdHhveE12WlVNVkZHbWdBbVZaMkJN?=
 =?utf-8?B?dHd4NGJVWjJFT1VlYmFWSzMxRVhyVXNmdmN0eGtzTmxLZ1l2S0dZSUVLc3ZH?=
 =?utf-8?B?MVMvd1NocGNRNTFQem1zNGxmNHVKTDdCd0R6OS90d2IwTUR2K253KzFEQlA2?=
 =?utf-8?B?OC9PT2toeG9Ka0svbmozem9sMDBDZTNNbzRXdVVlY3QzclFBdzEvZEZlb1NU?=
 =?utf-8?B?UnFSTjIzTEViaXZjMk9LZFhxVURxeVVPUUpKcW5oWDMzcjljNlpmQ01ndzZD?=
 =?utf-8?B?SHNFTW9MYStwc0ZSY3lQNFhlMXhoNCtXMVNpSFBLS3R2NFpIMmZFTzYxVVF4?=
 =?utf-8?B?OXRsc1dKalk5MnpobWpWNnRET21zL0xRY1BjaWM2bnBvSVhFSG9PYjdQZGFD?=
 =?utf-8?B?eTF0b0cwWUZINExQNkZEcjhSM0lwNGwzZ0FoVy9MYThhdmxudzUwWHhQdmdX?=
 =?utf-8?B?ZXRxblc0ZDZ6eVBDK1h6dEtlNXFqcVl6RTZQSWoyZWZveEo5VUl6djc5ODJV?=
 =?utf-8?B?Vmd4eUhyRHI0NjFzTW4wdTBxaFlVUURWVFk3NlBOYzY0TG9FaVlIMW5LaFc5?=
 =?utf-8?B?R3NrSmJwWEhQSG5HSnN3VFVmckwyRHR1bjkrWkhQellhcXcxRUNXZEl5dHlx?=
 =?utf-8?B?ZldVRDdhcDNuSTRBR21IbEhTUUpodkprL3k2eUwySk1zSDl1amc2Q3BLbUZS?=
 =?utf-8?B?T1lrdDdKbG40UTRFRzd1bUFUY1FxM3diR0J2UmJMVWRUd0xPQTlRRUg3MWlK?=
 =?utf-8?B?UlhLWFAwWjZvcUc0SURPUlhjVHlGcENteU5LQzBBNlBucmtDVzZXQ0s0WlRz?=
 =?utf-8?B?a1B3L0VTTkpwcEtCaTFTNkRIelArZERwODVvS0dUay95MkRwUDZyaEMrMVcw?=
 =?utf-8?B?YmxsQkFBejdFbmRrTDcwYktOMVNIeUp1SFFDRWZsdXVuSDRidzBCR1ZjZXl4?=
 =?utf-8?B?VEU5d0M4VmNoTGFsd2NleGpYa2ZTejdJSDF4Vk9DeW1oNm50aUo1cXkrOHow?=
 =?utf-8?B?cnNQa0hmdUdZdlVJYm9zUXBFaVF4YWgzaHpScSs5R2UxOWlOVWhkZllGdFFj?=
 =?utf-8?B?Ukt3akVBZGw2SU5TQVdGN1RzM1pwNWxKTGtyTXBabXBWRjRNaC9rNUpGMVlk?=
 =?utf-8?B?T042Um9FL2h6ZlNBMzZQUWtjS1Z3Vk5lK0dsazQ4RG5GRXJtZHhxVnd5Rk1T?=
 =?utf-8?Q?GoIDP28E9A++AEnKiElxIWNLY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc3c366-953d-4c12-fb39-08db34d790f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:41:05.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD4ZRKvkD68n4VjLQhm144hMBJOLoL/onhONJiRvxCztAAo6iEtfp5XHqfagCldncCnl2lxituXGGUxwaIr8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6989

On 03.04.2023 20:40, Oleksii wrote:
> Hello Julien, 
> On Fri, 2023-03-31 at 22:05 +0100, Julien Grall wrote:
>> Hi Oleksii,
>>
>> I was going to ack the patch but then I spotted something that would 
>> want some clarification.
>>
>> On 29/03/2023 11:50, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/arm/include/asm/bug.h
>>> b/xen/arch/arm/include/asm/bug.h
>>> index cacaf014ab..3fb0471a9b 100644
>>> --- a/xen/arch/arm/include/asm/bug.h
>>> +++ b/xen/arch/arm/include/asm/bug.h
>>> @@ -1,6 +1,24 @@
>>>   #ifndef __ARM_BUG_H__
>>>   #define __ARM_BUG_H__
>>>   
>>> +/*
>>> + * Please do not include in the header any header that might
>>> + * use BUG/ASSERT/etc maros asthey will be defined later after
>>> + * the return to <xen/bug.h> from the current header:
>>> + *
>>> + * <xen/bug.h>:
>>> + *  ...
>>> + *   <asm/bug.h>:
>>> + *     ...
>>> + *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
>>> + *     ...
>>> + *  ...
>>> + *  #define BUG() ...
>>> + *  ...
>>> + *  #define ASSERT() ...
>>> + *  ...
>>> + */
>>> +
>>>   #include <xen/types.h>
>>>   
>>>   #if defined(CONFIG_ARM_32)
>>> @@ -11,76 +29,7 @@
>>>   # error "unknown ARM variant"
>>>   #endif
>>>   
>>> -#define BUG_FRAME_STRUCT
>>> -
>>> -struct bug_frame {
>>> -    signed int loc_disp;    /* Relative address to the bug address
>>> */
>>> -    signed int file_disp;   /* Relative address to the filename */
>>> -    signed int msg_disp;    /* Relative address to the predicate
>>> (for ASSERT) */
>>> -    uint16_t line;          /* Line number */
>>> -    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>> -};
>>> -
>>> -#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>> -#define bug_line(b) ((b)->line)
>>> -#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>> -
>>> -/* Many versions of GCC doesn't support the asm %c parameter which
>>> would
>>> - * be preferable to this unpleasantness. We use mergeable string
>>> - * sections to avoid multiple copies of the string appearing in
>>> the
>>> - * Xen image. BUGFRAME_run_fn needs to be handled separately.
>>> - */
>>
>> Given this comment ...
>>
>>> -#define BUG_FRAME(type, line, file, has_msg, msg) do
>>> {                      \
>>> -    BUILD_BUG_ON((line) >>
>>> 16);                                             \
>>> -    BUILD_BUG_ON((type) >=
>>> BUGFRAME_NR);                                    \
>>> -    asm
>>> ("1:"BUG_INSTR"\n"                                                 
>>> \
>>> -         ".pushsection .rodata.str, \"aMS\", %progbits,
>>> 1\n"                \
>>> -         "2:\t.asciz " __stringify(file)
>>> "\n"                               \
>>> -        
>>> "3:\n"                                                            
>>> \
>>> -         ".if " #has_msg
>>> "\n"                                               \
>>> -         "\t.asciz " #msg
>>> "\n"                                              \
>>> -        
>>> ".endif\n"                                                        
>>> \
>>> -        
>>> ".popsection\n"                                                   
>>> \
>>> -         ".pushsection .bug_frames." __stringify(type) ", \"a\",
>>> %progbits\n"\
>>> -        
>>> "4:\n"                                                            
>>> \
>>> -         ".p2align
>>> 2\n"                                                     \
>>> -         ".long (1b -
>>> 4b)\n"                                                \
>>> -         ".long (2b -
>>> 4b)\n"                                                \
>>> -         ".long (3b -
>>> 4b)\n"                                                \
>>> -         ".hword " __stringify(line) ",
>>> 0\n"                                \
>>> -        
>>> ".popsection");                                                   
>>> \
>>> -} while (0)
>>> -
>>> -/*
>>> - * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't
>>> set the
>>> - * flag but instead rely on the default value from the compiler).
>>> So the
>>> - * easiest way to implement run_in_exception_handler() is to pass
>>> the to
>>> - * be called function in a fixed register.
>>> - */
>>> -#define  run_in_exception_handler(fn) do
>>> {                                  \
>>> -    asm ("mov " __stringify(BUG_FN_REG) ",
>>> %0\n"                            \
>>> -        
>>> "1:"BUG_INSTR"\n"                                                 
>>> \
>>> -         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn)
>>> ","       \
>>> -         "             \"a\",
>>> %%progbits\n"                                 \
>>> -        
>>> "2:\n"                                                            
>>> \
>>> -         ".p2align
>>> 2\n"                                                     \
>>> -         ".long (1b -
>>> 2b)\n"                                                \
>>> -         ".long 0, 0,
>>> 0\n"                                                  \
>>> -         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG)
>>> );             \
>>> -} while (0)
>>> -
>>> -#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
>>> -
>>> -#define BUG() do {                                              \
>>> -    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
>>> -    unreachable();                                              \
>>> -} while (0)
>>> -
>>> -#define assert_failed(msg) do {                                 \
>>> -    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
>>> -    unreachable();                                              \
>>> -} while (0)
>>> +#define BUG_ASM_CONST   "c"
>>
>> ... you should explain in the commit message why this is needed and
>> the 
>> problem described above is not a problem anymore.
>>
>> For instance, I managed to build it without 'c' on arm64 [1]. But it 
>> does break on arm32 [2]. I know that Arm is also where '%c' was an
>> issue.
>>
>> Skimming through linux, the reason seems to be that GCC may add '#'
>> when 
>> it should not. That said, I haven't look at the impact on the generic
>> implementation. Neither I looked at which version may be affected
>> (the 
>> original message was from 2011).
> You are right that some compilers add '#' when it shouldn't. The same
> thing happens with RISC-V.

RISC-V doesn't know of a '#' prefix, does it? '#' is a comment character
there afaik, like for many other architectures.

Jan

