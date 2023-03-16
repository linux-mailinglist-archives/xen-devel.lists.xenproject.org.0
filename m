Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2CA6BC951
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510373.787905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj9I-0004pJ-7w; Thu, 16 Mar 2023 08:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510373.787905; Thu, 16 Mar 2023 08:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj9I-0004nR-4x; Thu, 16 Mar 2023 08:39:48 +0000
Received: by outflank-mailman (input) for mailman id 510373;
 Thu, 16 Mar 2023 08:39:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcj9G-0004nJ-SR
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:39:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ab4aa94-c3d6-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 09:39:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 08:39:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:39:44 +0000
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
X-Inumbo-ID: 1ab4aa94-c3d6-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdKVhxrOiWg1hsH7hGBiKtvn3mSZBbMxL+7JripWShZfza4WI/YybtOi6SYOXELgt/ihshJOALabdPEJazCDgfpMNbqnZbOnCBuVHLzgbS5VY3u4kAXESy1/XNYQ9SiKc/1DO1+suciMvVZRnGb07FIT5WKmowvxfmklnEmEBj6e0rRQVu5Bzi6aRlzvnNbwszNDDakQmeGRTk4gxgHUDLiH6eTKDADUhxwgv+4vacW2d2B3OFfrThY8E3vHf60p5zKp3uOPfMzdLWsEg3jC0V+tpQCzEM6bvH7R0NcWMjdsctU3bndVMytFuwu5XUIJX6CKKDlM/vLG+lgoE95kBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26VMdxx22eRBC6hpz2cCCbozfAW9XKw5RMXnOcLUZxw=;
 b=dlQcnNiyGBL7NmLmQHuHYhSWPLwtCgfIetZvZFQ2aH0t9NVMQQqVcolm6sPLeXkhI9BRFYzZIF05/fPSUb7umw5Cldj6Q/yBjbGwMKU2Zhyc0ZZQDb/ISiWDOKjY/Fh085SC987EqNKiwOm2fjWqmG6hPVuqlrZZfXT0kPNEzHExkHLEO1Ts7+dbB5sml6G9CizL7OIRFKfz09xreYBH+Z0FaNnHzct6IZ19M3cvm7+7MzFULu7xSD695jlwvmTM8xn2PV+5UklqnWR8KfIIYFxjQ2nycYN1py1B+Mib4bDTjhH4I/ceyqrVDmAMSir9HkRLTgoZ0FxbdE6DwVu7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26VMdxx22eRBC6hpz2cCCbozfAW9XKw5RMXnOcLUZxw=;
 b=RI5Lgo/B9QviH8NFYOdkl6QiPyqtlLVnhIo6SG1svnH42zzm1fP0kWVmF1eggU3nkJHCZ0p+/0IN/GurUdrIegNsB7QORJ1xoNthK1Z3dHP09bdJEYs20kWa7lmQ8nrlgjDhEO114O2JagJjS3pq+3JPgELU/izBWtnTUd2K3h7m/44sPRivofa8BrZRKJSodNvzDQHLCez56ufmn6Onw6EqwHcmyJ5UDdUGNyVEmEhTqbtUG/pMKvSOK2Xr9TqxzI4gZdWIeGL9hIyHYlrH/cchDYjQ7A3/BhNEfq7o0OKXSatDJ8N8QMk1sgw5YmzYl0bUHQozXFqs8SC4iuIaoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f3bbaab-d936-31c7-a3d4-07da1e45211d@suse.com>
Date: Thu, 16 Mar 2023 09:39:41 +0100
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
 <2a7fbb0495833ad686f260091024966f8b003dcb.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2a7fbb0495833ad686f260091024966f8b003dcb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 805aec8c-ae18-45ac-09f8-08db25f9fdbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u4EHCAzfVi+cXSZa3AKROHxjHvAAew+DLBAwVDjQF7ynobtvVbKHbdSkn86lzM/0wTFLWbbKhzbPAAMrWACSv845RT1L68Ko/Y1Ixbjb9Qr313+z9RZjSl1wJJ2PiSCvTxmuGhKyHyFRej7FysXwxyuiF0NwWw5fdAqbwSwYTuuAdBZ59l06MihR0uF2VGAiAZE/+fi0XTiN7dXeXPbxbSlogcQVkuxMOxeFkwZGqtc+rIeyVD1U90fMiMvAn4OgNyTW20f4j3RfUWwsv80OOzh8TooCreBl8t+QV0p9RJ8cl9xGgdp6fOHgguljOEdKIzvH2v9HYA8sbHJPQs32RVNusJQW3QViqdcs7Mi091Ot57j9Mvp7teiRNwnebqmngdsIqg88zD+GRZERscVr5LDILiQDMdcbS1Gj1zZnz16AyPIAv+zTYiJKVmuDHAwipOufaL2iX5ZOeFg6tHPkM6hDQ9XciIBQZq/7uCsgMsOSPgxSPLY9KsoiVuRo8xqf2PjHiwX1ePdwn6UnNQu4szD4qqDfhL2434LiBCquDSfHX8fz4mIdryFWZ+It5SaIelREkk81orrKEVepHTXQJXTRezFbWhGGPp9fZaSA1szy+oKvmqAjX9gIrvjGTHg4la7trCvkz59lrqKxEhPLtAbWBovk14vb3shozObL7qX3c9DHZPV4J8gDMdkk4TKpe+8vBzjideDD5XxlWaHZZ0gy8Wn49XmdxZxB+GHDKek4PA+4ueKuVq2ib6FZIGvJfDODGIzIlou7Na4PuUphCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199018)(31686004)(6486002)(2906002)(478600001)(8936002)(4326008)(6666004)(6506007)(26005)(54906003)(36756003)(53546011)(186003)(5660300002)(6512007)(316002)(86362001)(66556008)(41300700001)(31696002)(8676002)(83380400001)(6916009)(38100700002)(66946007)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmdNbHU1Y1BYOGR6T3pSa1FDaGhiZGtDUTZpc3Y5K2llOFRGL2hNZ0hDK3Rq?=
 =?utf-8?B?bUFVc1FUdmIyVURZVnZFd2Z4dGVjU1c1aDFNVFo0allVV0tUeFJqc0t2MHJh?=
 =?utf-8?B?aTExc0RMTC85SW0veGdHcllWeVRTMkpGMzlTTTByMjRyZEFXTWkrd0IzeDFl?=
 =?utf-8?B?dkJKRHRFbEVWTHc5NDQrTmgyUG5nR1RkTzY4dVZuR2VNODFqVWNrTEhMUFdj?=
 =?utf-8?B?QmxydDd1V0hGSm45a240TzVwRnFuL2hVaE5yeHBvZW1kV2doV2FzRGhQTzJP?=
 =?utf-8?B?YU9iY1NnZ2R1dWgwWXJXTXBxMDZhcjBjeXB0cUoxU3dVcFIxZTA4OVFBVlZJ?=
 =?utf-8?B?ay9KYVM2WmM2eXYxZHpRaUhUT21PWG5hYitLUlFMNUxZUGhOQ25wWFdOTmtQ?=
 =?utf-8?B?SENzMDNjS2I4RFArNGFsRHJrM1J4bnkwbjkzeXMwZExyWVoxL2tGUlNjb0hx?=
 =?utf-8?B?NXdKdTdiY3h3SjZpejU3dndxRXVSRHlsNHFscGJkdjRjWC85cWc3ZDZ2KzR4?=
 =?utf-8?B?Um5oV21XdGFPdjBNVjVTd1pZRWFTOVc2L0tWZTZLaC9FMjVaRGRGd1VOVFBw?=
 =?utf-8?B?RHFHQ3JjbGwxWXM1aExuMlJJangyQm5ocmxhYnhRVnhRMzd5M0plODZ0UTJF?=
 =?utf-8?B?RnQzQ2RiSkNSayszUk1JYlRGNjVad3ExMWcxOHFKbytXdzR2R0xVUHQ4V1R3?=
 =?utf-8?B?dGJLdnFWbGdLRU8zZXN0TDRHK2RDTUF2bTcvd2lsc2g5RWJRTEZ1aFBRc3Q1?=
 =?utf-8?B?TXA2KzZWdWQzTkVqNWl0NjQrVkp5TnErc1ZSTDc0bFRZL2hKWTZ0RTBsWnRm?=
 =?utf-8?B?cEFrMUZMSHByYmdGM2tIUC9MWUNjSG5EazJidWlReE5JMHJRMmx2d094TnJV?=
 =?utf-8?B?WHJ0WTBObkFzMTNXdjFFdXNVcjRvQ2c0TWFXbUlqOWlFNjR1cHNEU1I1c3JR?=
 =?utf-8?B?RmNCKzRNemtzOXdKZVpFVC8vK3cyZFpZRG5Pa1o5OXl2R1Z6a3ZCZzIxaUFM?=
 =?utf-8?B?TGxOYm5BTEhRZmhVbTN5RlJmQ3Jmc01tbnd0MFdhNXVBd3lOekZVY3MvY3I5?=
 =?utf-8?B?NWREM2Z0Mm83TFI1OGdHeXVPdFd2eTlPUXNJb29hM1pDcitPbTdjQ1NtQ0x2?=
 =?utf-8?B?Qm5xdm91OWw5RXh4NjVSU0dXWEJEQmtycmxLMzA2bTJ1aFU4Z1FNUFM2N2pK?=
 =?utf-8?B?N1RlejBhcjY5R1lqc2l5K0FxZTh4QXdGckF5VENwQ3dkWGh2MVc1WFloZ1lJ?=
 =?utf-8?B?TldIYlJBRmdrMnowcUNTSkJUZ1hGaHFJaTJLMGs1M1BOYWF6NmJLUVdycDBL?=
 =?utf-8?B?amJ5V1luN25aWTZXUVhtZ3VQMHZieDVYdWdrRnZHam1RbTQ3S1lWTFl5STc3?=
 =?utf-8?B?a05GVGI4VGtLR1BGTlJZSDR6SCtTbFhoKzhpdUdMVTlHUW5rWkFacW11R0Y3?=
 =?utf-8?B?NnQzQ1JId0dqZWFXRmtKeDBUbzNFVytmZHNjVldaYnFaTWE0bUFSWnVZMjRt?=
 =?utf-8?B?STZDZnl4djIveDVlL3ZvVnU5TlFmQk8wUlk1bzhzZnU2dUxPc2c1azlxV3hK?=
 =?utf-8?B?M2tTQkJzLy93aWdEdUQrc2F1dEZENXpMZ1RsVUVCbFU3TzgrazBvNUd5d0FR?=
 =?utf-8?B?by9DZ1B0WjF6VmtVaXRPUGFjQU1zMWMwRHlHeU9Ya09UWXFSbktGWC93TmxZ?=
 =?utf-8?B?aFZaeDAvbnVjUVRRdjlHQ1dNUHd5SWhkM0FmWStLeFV3bDlVSzlOZzNWNTBQ?=
 =?utf-8?B?YWp4ay9laVFtVE4vY1BPMTUxeXlHTDYzK1FrZXNKbDF3RmdGaVVVZEJJL016?=
 =?utf-8?B?R1hibVNrcUE0UDV2ZlZFeFh2QVRvZXkwSysxd2crSzNaajlQeUVDeEtxZFlX?=
 =?utf-8?B?ckhQVk9qMFllUFBBMkNmSXBRUFYyUGtvZnpaVWhWZHdMUTJjQWlkbzFoV0RH?=
 =?utf-8?B?MkJFWXpKY09iSWZaeHkzS1czY3ZXUG5CMzk0VmVsSldmQTM4ZmpZRGZjWjAr?=
 =?utf-8?B?aEgzZUpidkxiUCtTcWJ1MjhNSGxydWRtOVAwSHJ6T21iWFBVbFFwMVZpMk13?=
 =?utf-8?B?VSsxY2JmdGxVVmtnWGFQWDdubkhmcDhhSW9FcDBmQ1RMb1QyR1NPZmlzNW1r?=
 =?utf-8?Q?ZW0LvGfeEqDwgWTsczSMtXuQb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 805aec8c-ae18-45ac-09f8-08db25f9fdbd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:39:43.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MftNNPM+Tpt9zFFk9C8AwEppVj7dUU37WFCrKq8myXx8j69WBg2tl7b1aGNBykniI18KhwGZ2cl/Ai7KO52hsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

On 15.03.2023 19:25, Oleksii wrote:
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
> Why don't we should see different code?

I consider it an indication of a problem if assembly code like this
differs depending on the tool chain used. It suggests (and as we can
see this is indeed the case here) that we're depending on some
defaults that we better wouldn't depend on.

> Do you use CONTAINER=riscv64 to build RISC-V Xen?
> If yes, probably, we see different code because you have more up-to-
> date CONTAINER. I am using CONTAINER_NO_PULL=1 for a long time so it
> might happen that we have different gcc version.

Just to clarify: I'm using a compiler I built myself, and I'm doing the
builds locally, without involving any containers.

Jan

