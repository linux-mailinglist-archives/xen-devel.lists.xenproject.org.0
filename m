Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28A6BC945
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510371.787895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj6b-00041h-Ra; Thu, 16 Mar 2023 08:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510371.787895; Thu, 16 Mar 2023 08:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj6b-0003yq-NH; Thu, 16 Mar 2023 08:37:01 +0000
Received: by outflank-mailman (input) for mailman id 510371;
 Thu, 16 Mar 2023 08:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcj6a-0003yk-IR
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:37:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7757a4d-c3d5-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 09:36:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:36:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:36:57 +0000
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
X-Inumbo-ID: b7757a4d-c3d5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njYJCMBi490ZV2osStfMA8tZtKv7io0IyWq0xhDp9zXyIN+fLxY7AvvdXZgTiEJKLaHj4dbKLqoPV/9Frtc8fjnNk6WKDzeDFLvOuP38yK/R2GYPgXXPjxlJaUjFl3/Ayr2pK1Q/NCcpHjHWLUZ4fKbgFWa3zyGNKP5EO5iLHbcxuoNqWu+WR2xOPbDApYIhMNYr/W7hH0YYRMAxRi7feaYgrK0hTcdXTA5LNsuc8mFOEi0+hfE15mJPISZl4GOeeisKLvNcdX8QnnWwLyMtc9oytkkqIgsgzyrqxCKOMetDkucit9pIqfDGgoO1htucs2jL0ZCShY1VKTktCIE5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZyGCdkYYqfmPTo0V1A34d4tmy60vmrNocI3W9rwGIU=;
 b=Azjn9TgH27zRs5wS1GGSqIO5XVM0ypwR4cPn6Gh1K47f4eoFYQ4Je/B3cxieM8Wg07u7IRFqdI5LemVzvQwhVp2je7f5TE9klyWr2nXi9yvJ0IVv7Wc2GH7FJK0zOxG9GY62rbr29y/XsdcrbACMMBE7VcmNwx2KTweXlEWOAMtLqAPYJ8kHHKSMEPrTVUEXTFOGgg0FK7BWtMHI11KMVgjHxQDXVhtkx9Vs6JvxcXCJsBl4qPIq5qOjnCDTqj3rfgZ2LGuyLq0pZV+T5Zj1l6e/27CB3usi0VnMn6vj6fX8waAM14u/K+2iXf1oGmTLS9zvy8MPal7pBbwYVU7AlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZyGCdkYYqfmPTo0V1A34d4tmy60vmrNocI3W9rwGIU=;
 b=DnIRHFcuV54BCEq5p+z034/fVEcigUbyCgbG1swuUjDBcLQZEEIphajp7y1NhA+gc05nt1LuVjzqthCUj/pGQ3gkWYFI8zfGgTbtGDSNJ1caSQf3Bj2XT7LNmybr8dQynS3onoSwnGQVtEyrTaHlh4k9ElX8tprH7yCst8Ucm4Grz1T6yiic0bCtaylUMwitU5ubNEEkHWfOgt2fdPwFxKCcOkWvEUdnJpwpRh6X6wGnvVs5lnyexOJEAluvdFHg9KgBL/kRXv19WuiTmahszQiRlksPLoysk5E4HV77O6PzUwPTvKREBAUfWTOXeWEBuwUjz7n1+lOWiNvq+NP9/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd448a01-3701-2d9d-9476-f0e92794b6cf@suse.com>
Date: Thu, 16 Mar 2023 09:36:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
 <4a8d7292-38b3-1c32-4037-1c94b94b6f46@suse.com>
 <009b20a71738e8a33fe4044be10a456c4fd37b68.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <009b20a71738e8a33fe4044be10a456c4fd37b68.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbdb20a-d46c-4c31-c3b5-08db25f99a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QooRpWAYaB3kAjY2MBHGPMPHVKFFxPAtJp7ojmxGs2zmm+rmp2p4E9Q3xeaJDkF7UdqxdfUPQ2LbTkuAMdW1aLE9Mw1MMn35ht9KwpNouWG2OXKqe9aK8A+VVEwlsqmJ4kIfB8lyCflxXyJA4HSizSQJgI5rJ1Q4gCVQ5oo002vBG2AwOanlxeficivEzzUZl1BtQMHf1DLCGcGfq8Zweobn3Tfo8zLVGUuo6yqpdZ9q4FLCYRV6ofv18VR6Ll6CRUog62KzAiBqi5zj5cC15NLByY8wxJQOr2BoUDbMrO1i3MjN3fsXx3xyRi7vtzXJ0+j2lLdBQWXKR0t1p2qMeo4tqEoMmTV+Ban8vCKiQKRbhpRQiuXLR1KPzRpuS5wuI+7uBlcY61EJ+JhU+9VVyZ1rBLKX1m6Rr1wpvLDo8OKyA37umZO8DiAxi6b2nJcdevkNaf2wgR8ptz2B0oZLO4MxUlYSJAjo5bAb2Or7eJKlss3eT5rj6H7H+8zkF2P7p27o6E5MJtldECC89OmhkN+xN1HTkPgIWRGzeOoyo+xV4ie8Wv2GH407Ig0wZ0SYKc3a3CQ7AlOUAYXfC0Spwooalbcy+J+UZD44Fbhlw4bSJUiNtj9j3tKQJHuurMgoAaY0QPHYBNjGnmNZQ3zZkBounGeWQax1dBqLmzFFz/7Lz/wlRe3+m+0gT0IDOphDemsHQYQyM5Ezl+kLx0sRjtWlRbUXvv0V0c/rpG94KJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199018)(31696002)(86362001)(38100700002)(36756003)(2906002)(41300700001)(4326008)(5660300002)(8936002)(6916009)(2616005)(6512007)(53546011)(6506007)(26005)(186003)(83380400001)(54906003)(316002)(66946007)(66476007)(66556008)(8676002)(478600001)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRjNWVzdUFKV1JGOEZLRzZkbGhsRmVMYlBYbndkNUZ5ak5xbENaamo3SjUw?=
 =?utf-8?B?K1hVQ1BhbW44ek5peDhmREd1RFc1RFpZQmt2a1FmWnN6R1BhNXNkR09oSllG?=
 =?utf-8?B?RUNZZU9IbFZiZ2J0WFdDdGhmWHhhMlp6RFlFYllzUDR5TlpRcFRHaEk4T1or?=
 =?utf-8?B?L29NVFNLZHdUcHA4R0srMldOWHo1Qm9wR2VVZXhtZ0k5T3lURnlHREZBNGhk?=
 =?utf-8?B?L2xNZlZYODRaZk44UVR5WjErRWpheVJERHQxMEQzZGNRNHZzZFdHWW9yWmRr?=
 =?utf-8?B?end2NXdIYnBtR0loYlg3OWtQS1lFV2hYYVZJV2JaRkZDWDRSQitmSFhnNitl?=
 =?utf-8?B?QXNFQmtKUlVHYkFNc1ZScU1WUmVZTW5mcGVYUFNkbmxHTTRCODJ2d1ZmWVB5?=
 =?utf-8?B?MXhqbnlOSkRFeVJvdnh3MVNpdldPYnd2dGVCZWc3MG5jQ21QdXkrdExXK2JF?=
 =?utf-8?B?dE9DbnVsSWxES254RTJtOW9kN0loNjJJMmVQbzlpS3pUTlExYTJJNTI4Qkll?=
 =?utf-8?B?aGZvUFlYRjlqcDMwaTVJSXhYKzJuN1liUXc3Q3hBWDJITGM5Y1RLQnhXQ0ov?=
 =?utf-8?B?eHdTYStneXJ2c3hwbFFLby9hSHg0N21BNXVMWTlHT0ZINDFHL1V5aEM3N2Rk?=
 =?utf-8?B?VlRDRnNRdWFwK0gvWXZGNUYzRE5ranNmdmZMNVgwaHBOZGlGSVhBVU96d1hB?=
 =?utf-8?B?Y0ZsYmpGSHIyeDBsc0ErNHBQcTFoNTZSQ0V2ZWxDekVFaTg5OG83Wm1mVmQv?=
 =?utf-8?B?RGJDbEk5QzZoNzZScDlYQXo1ekd1a0FVdEJuSnlnRzY5ditRR3BxdmxkMjdU?=
 =?utf-8?B?QlE5QjlKbVArT3Q3MVhUeWRrRXYzYjlDOXA2VlJlRkRiWXJVQ3FEOGEyalRa?=
 =?utf-8?B?dWZLaTdVSCtBb2RXOGdiYUJCTEtZV0ZITjlHUWZXaFpsU3hJWWRIMGRGVWFa?=
 =?utf-8?B?RWVhbVcwNXk1VkxzMnlFeWg1SEZQWjhtMlUxK2tnS2twYjUzTmVsNjdZV0Fz?=
 =?utf-8?B?T3JKc2RyUndZOHRwczdwSDNaNlhhL1M2OW1oVVdTUHBIVTZOTkQvbXJxdVV1?=
 =?utf-8?B?dHVCYTQwdURFblpra1RGRUFadEpnN3JTdkxKQ1hkVndHZGlVYytySTR5S29E?=
 =?utf-8?B?dWRwNzhDbFplKzkwM0pvUlpML2F2cHIvTnM1a1BQQXBzT3R1MllKYXM4eTg0?=
 =?utf-8?B?b3pnbWRBZnZFUWlNaUNuTzBQOTR0K0RVY0N0TWVkZW9JeWprenNiRDdQWmQy?=
 =?utf-8?B?eHdOZkdMUlZiMm9ONjdyNFN0am5HV3VEZ08yUnlueU1EWFZYMzU1WCtYY1U3?=
 =?utf-8?B?eVJLRHpwQUhrNlBWT3E4UlVHQzZZeUYwUWJTVmdrR2l0cXFGKzlpSnpMdy9H?=
 =?utf-8?B?bVhybGI5ZVNlK1pnZjhJVUV6eEFlanVuVlJmUEdPVStZY2ZkeGdiMTdSQTBW?=
 =?utf-8?B?Y1pYOCtZUkxPdUQ1V241Ly9YSEpyTmF4NkVqcU1pdTg5aGhna1JnN2tzaU03?=
 =?utf-8?B?c3MrQXJJZ2NhY2ppMjNhMlY4djNKYTBjVnA5RGlTNk4yeFlTb0ZVTUd4WTl5?=
 =?utf-8?B?VEUvN0kvQUtrUVd3SnpFVFdlK2JDbVdJdUNQZ29XMXpvT1RRZ2ZEdkF2NEFY?=
 =?utf-8?B?L21sMXpyMmZwSzVTMSs0Yll2b1lyaFVWMUlEZ0taQ3pSWWZ5MGpLdVQ1aENj?=
 =?utf-8?B?YjJnLzlKT2tBOVN1cjVSTGk2VHUvVkFtdDBuWXRRS2NLelZKdnhuSmNudFQ5?=
 =?utf-8?B?UWN4ZG45YVdLYkkrWlJQZ21YZVh0eHI4WmVRZ2ZOZkFwZDN2ajJDQWdTZzhm?=
 =?utf-8?B?VCtVa1RDbWNwazJzY2ZLMjhzQk5LMFp6MSsrS25wUjF3RHJBT0JTN2h3YzZH?=
 =?utf-8?B?Um5DWTN5eDlsWE1QdWtHZmNWUzJDZXo3MFpSWlh3VkthT085TkljQjNxUjht?=
 =?utf-8?B?SWFCanU4VUJrcFlZMmk3em80Y3k4bG5HZnBZbHF2Y2REVzZwTnI3a0JkdWJL?=
 =?utf-8?B?SmN0K29pK2VpRnlUZkpsazJWUlI4bTV2L0I1R09ZNjZ6VVU1SHpzMXZaSXhp?=
 =?utf-8?B?emxiam5DUWxtOS9LbHBvNGlLeURrZWc0dmUzYXdXNHJFVzhIbE9nTStIYkZV?=
 =?utf-8?Q?b3okV4gJHg9uOPyk81J70785W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbdb20a-d46c-4c31-c3b5-08db25f99a80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:36:57.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mxss7e/SvtoXGzp5MP/5PYslJr3k3mFOJiV1ZzXFm9+4JVnCfYk7+yROZH4wGdzkLZ/6sf99GYVurx3OpxT/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9386

On 15.03.2023 19:33, Oleksii wrote:
> On Wed, 2023-03-15 at 08:35 +0100, Jan Beulich wrote:
>> On 14.03.2023 21:16, Oleksii wrote:
>>> On Tue, 2023-03-14 at 17:09 +0000, Andrew Cooper wrote:
>>>> On 14/03/2023 4:00 pm, Oleksii Kurochko wrote:
>>>>> The patch is needed to keep all addresses PC-relative.
>>>>>
>>>>> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
>>>>> 'auipc/l{w|d}'. It depends on the .option directive: nopic and
>>>>> pic.
>>>>>
>>>>> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
>>>>> cpu0_boot_stack[] will lead to the usage of
>>>>> _GLOBAL_OFFSET_TABLE_
>>>>> where all addresses will be without counting that it might
>>>>> happen
>>>>> that linker address != load address.
>>>>>
>>>>> To be sure that SP is loaded always PC-relative address
>>>>> 'la' should be changed to 'lla', which always transforms to
>>>>> 'auipc/addi'.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>>  xen/arch/riscv/riscv64/head.S | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/riscv/riscv64/head.S
>>>>> b/xen/arch/riscv/riscv64/head.S
>>>>> index 8887f0cbd4..e12d2a7cf3 100644
>>>>> --- a/xen/arch/riscv/riscv64/head.S
>>>>> +++ b/xen/arch/riscv/riscv64/head.S
>>>>> @@ -27,7 +27,7 @@ ENTRY(start)
>>>>>          add     t3, t3, __SIZEOF_POINTER__
>>>>>          bltu    t3, t4, .L_clear_bss
>>>>>  
>>>>> -        la      sp, cpu0_boot_stack
>>>>> +        lla     sp, cpu0_boot_stack
>>>>
>>>> I don't think this is the appropriate way forward.  It's very
>>>> much
>>>> smells like duct tape hiding the real bug.
>>>>
>>> As an option, I thought to add in head.S '.option nopic' directive
>>> to
>>> make la translated to auipc/addi [1] pair.
>>> As an alternative option, adds to AFLAGS += -fno-PIC... but
>>> still...
>>>
>>> I checked in Linux binary how 'la' instruction is transformed, and
>>> it
>>> looks like it is translated as I expect to auipc/addi pair:
>>> ffffffe000001066: 00027517 auipc a0,0x27
>>> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
>>> <early_pg_dir>
>>>
>>> I checked compiler flags between Xen and Linux. The difference is
>>> in-
>>> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
>>>
>>> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
>>> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
>>> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
>>> I./arch/riscv/include/generated -I./include -
>>> I./arch/riscv/include/uapi
>>> -I./arch/riscv/include/generated/uapi -I./include/uapi -
>>> I./include/generated/uapi -include ./include/linux/kconfig.h -
>>> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -c
>>> -o
>>> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
>>>
>>> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
>>> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
>>> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
>>> Wdeclaration-
>>> after-statement -Wno-unused-but-set-variable -Wno-unused-local-
>>> typedefs
>>> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -
>>> Werror
>>> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
>>> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
>>> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
>>> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
>>> arch/riscv/riscv64/head.o
>>>
>>> So can we update AFLAGS in xen/arch/riscv/arch.mk with -fno-PIE or
>>> will
>>> it still be an incorrect fix?
>>
>> Leaving aside the question of why you and I see different code being
>> generated, isn't it simply a matter of RISC-V, unlike Arm and x86,
>> not presently consuming EMBEDDED_EXTRA_CFLAGS in its arch.mk?
> No, it doesn't.
> 
> Could we consider cosuming EMBEDDED_EXTRA_CFALGS as a solution?

Well, that what I did suggest. Unless there are RISC-V-specific reasons
not to. (I have to admit that I don't really see why we leave this to
every arch, instead of doing this somewhere in a common makefile. Same
for the passing of -Wnested-externs.)

Jan

