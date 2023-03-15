Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EB6BA96A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 08:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509917.786667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLfK-00011e-Dg; Wed, 15 Mar 2023 07:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509917.786667; Wed, 15 Mar 2023 07:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLfK-0000z5-A9; Wed, 15 Mar 2023 07:35:18 +0000
Received: by outflank-mailman (input) for mailman id 509917;
 Wed, 15 Mar 2023 07:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcLfJ-0000yz-0Q
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 07:35:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed85df49-c303-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 08:35:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 07:35:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 07:35:13 +0000
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
X-Inumbo-ID: ed85df49-c303-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxdsJIaA540hYQXOUBGA/U9q6g95bwyYHn9gnUvQCNL5PvkbaZw57ozi6c4BdmeK2Hzd5gVb0gqoeefHPM5PG7dZEqG59da7FqQWcs4ia2D1xIAs+CofNqTdOahOWCTCj5LRQyuwdiGz++fwwUh51P21KZ+jaxLqAsoXyCj14JngDhpNQhwji6hNmqrcjfarvzxmh1MktD3qkfYQv+YBtuWJXied71bBdvg/nzbi9UpTT58PH1k6yLs4NHDdr5wNtbJBTAxMzZ1AZquZoKu2xlVDQcHPB05Pu5yKXI9P2tdwbO62hWI0oBu5gzHqgjnjaHhNUVwNTAl3GnkEM1MjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hnuMzbqRd78MO1Ngzuc4RU7zLKlSx1G047bZaXZYsE=;
 b=TuHqWzFjUfMLso2v5MSe7IpVqchi4lnszGHDvGdqnW9mM7Xa0zmuVZBiek+2lxgRqj3avTjQsQ3KrB/HWy58cq4wEm4CdQC/9a6R3gWeDx/3RqeG6TfcJgc4SfX0w5gl7FS8tN7E4JYhI1CRQuPkpdykHRWYkSsY99NJAHSC+T+kNluLmRYIGQJxwA8mot+AH4v5mcNvuomGtnUJq3Vj7xZCg2bK6h+zVFUL2iI1KyPJngb40wyiWHAnESSiak6FVyPJf8AOCadTgCMbE/qg404Vm3Yt6bcYu2nbHHEXhUPsrvdn6kn0StEFQRJuAM5njZBIoLTzde2wXH9UjcZ8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hnuMzbqRd78MO1Ngzuc4RU7zLKlSx1G047bZaXZYsE=;
 b=EmPjEAPq9s4Z3ZorUcHIIAbrs4cshYo8P4JiVhaqvXct7eriHMMm1faZxV8n9uHV012hVNFNwnuEYyGvSc0Kr4uthtrhHLkSkc+ps4cESKL9dZRAQ8U+s/FQpg39z7yl2fDXx5dd22Ua8LTtTJRufi7OHtjlI8dx1EtVz8B2Oi3DQXYvBkwlKfPgPGuNf2UNKlJtB5V9gcpnAZas3qpLOoG3Iljs7/ttIAFXxukgDN/kQOHbhZiBRFPmX8uBMMYhZO801tRafXDEQY2QjYSdILWoA+pvNjwZqefifxvaQXE14uYxOrgBMlA5WfpGBFn1iGWKdJcOK7BYcsjC/UbBzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a8d7292-38b3-1c32-4037-1c94b94b6f46@suse.com>
Date: Wed, 15 Mar 2023 08:35:11 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a39d38c-399a-49e9-fb0f-08db2527d052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DYoQdqWqyJgrUL79qZkw+qzLRxSkwPBEyvM6mzgoILQsfcyPQTCC9A8TzDjoOyyc8s8mq9V7vwzXMgFsiK0EXj/v3gip1GCIwoJ1pA/4Cq/4Pm+AjprZ1W6gT+2DFiB4YLZbvO7RwR6EqkqcbzzQZXGiFMCuvWxHQhHnYGmVlBO2LQ3L2H+Pi1/r66m6mpv9AdGtXuy8YeTQ91sz19DkoEwhFD5xY/W26WfQeQz739HY6KnE4OvVezxUoHruYF8lolgaaPQ0vcbgaOrbnBu98+imB1PKLavD0/3cCrh1ohm/l45xpNROIKOWl2ufXwuuy3NN80fYMlM7EWN0xrPQmGVjMkWysLrlRVmESap007to4q2ODJmqERQeQ5DfVzFFhbwpah3/AbT93ZGKTge0133mvOn7w0zBJJFcJ22WInlJvNxBe9Wdu7hlskXXbvwqzu4t7R7m0neIEgD6qQQXXYaSktR/WNGYCFnz9pJIx/VugrlcpA5AaNroRCV9Eh1BLseWIbDDKQLIqmbAQymMuu35L2MnTXvyTIwJc5PwCTwoJXI4iuDqIVor8ghvBW27QJ0c1hd9OPs//yTz/n9tkmU1fEri8HXT2us91ZxbX7ERM3vixMh2I/wBh4aSZsu2KSRzNUwwLm1lo3dM7XwjLlcxL8B5Oqzns4p4I21Ba81Tlik9L9Cew1N3HXYP3QYqcTFSjJ63kMy/odhujBm3OWz4KQHWQKstDiKsAE/3J+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199018)(5660300002)(36756003)(83380400001)(478600001)(53546011)(6512007)(6486002)(26005)(2616005)(6506007)(186003)(8676002)(31696002)(66946007)(6916009)(66556008)(66476007)(8936002)(4326008)(41300700001)(86362001)(54906003)(316002)(38100700002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTV3WUVsNjNDMWVOYjV4aHE2bml4WjhFSWVZMVpNczlGVzJLSFRMTXhVSHFw?=
 =?utf-8?B?cW1HY3R4dEdCNFdqdDlHQ0dHNDlPOHRNb2VTUWdrR2wrR0ljSncwNTNrOThi?=
 =?utf-8?B?S1B1bDFKQ1dwZHFkSlphbjZWSXBGZkw5TkNIcXlFdFdnZjJxd0RsQTIxL3Iw?=
 =?utf-8?B?dVgrNEF2NHJzNEFIdU5sdnkrUG0zVkdYclFsNkRZVi9Ra24xM29mNEdJMVpQ?=
 =?utf-8?B?L2tsL29TWmpCTDZ2VnEveHk3YXVaWXgrWTlDN0RtZHU4aXA5YTlsWDVaVXh5?=
 =?utf-8?B?MFk0MjFYVWVmMENXSnNYNVV0b1JEME5nMTRUUnpDT3JFTXQrWnRIVmRubU9h?=
 =?utf-8?B?c0lYZitINGtYeFhpaUFjbzE2VGRaa3Nnby9McU54aVNtZjVpUkdOU1ZsOWl2?=
 =?utf-8?B?cWc2ZTZlWGVzemwya2N5RmZCbGJxUnRIQVNsN0xleFcrYWdOQTk0K0pQVjk0?=
 =?utf-8?B?WU0zNUZKSGVHdnk5UGhUQmxKYjVLaWlDNGtNN2JZdVRIek5lNXliUytTdW9T?=
 =?utf-8?B?SXVNWU9GN2hQS2Qxb0g3WHl5OENxY1R2ZlRoYmhVMjJxTVpRanBVZDNIMEpy?=
 =?utf-8?B?UlpOQ1BQdDVHMWQxb1BWYk81eGxOTFYzc2ZDL0JWSjBaSHRlWllOK2NIRUF6?=
 =?utf-8?B?dVdFQUxjU0E5SVJ3Ylg0TGdJM2pSRVpvQmhCYWh4bEtXZ0xOU2FIbENJY1ZP?=
 =?utf-8?B?dy9MOXVRUTFZS0pjaTBHRWNOWEJucTNsK2VxOXFUMFM0U0k2K3d4MjAxa052?=
 =?utf-8?B?U0Urc3pPd0RubEgyWVJETk4rc0RmcWdXdDNaUVdCU0RPdlhtSkFyMTZRVE1W?=
 =?utf-8?B?T3Q2VHR4V3p2T295MWc2akxEalk3KzlPWE1zYjl2cDZiTTlaVXExbEtudGs4?=
 =?utf-8?B?SG9CN1FZUHdXQUlmbEs5M3dnZlBxa1Y2ZUF1RExPNGZTMzljQVBZVUJsVnBQ?=
 =?utf-8?B?bysrS0xDQ0dGYmhZeE5LMUxGdWU1UUZwNWFQczRzVkZkZVpOb3N2ZE9xWGdQ?=
 =?utf-8?B?YTh3YS8rZm1aWmwrdDhMUFpHUWpDNVdjUW8rRU0xZHAzMUxGU04xSEIwWFpW?=
 =?utf-8?B?TzB5SkN1dVliQlQrOW04RCtrT3c1blU0eGlOVElRSHB2cnhWdDBuY29qNnhX?=
 =?utf-8?B?R3FiYzRqTzZxQndXQmxzdUlML0VnSEhLNVI4WnIwMWFMcGFvQ0NhRmVMNzd1?=
 =?utf-8?B?ZGJkcGVQMW1lY1VPN2RoUDVVZjNlUlpGK2x4L0pNWG9LK2F0TEpDWWI4N3o0?=
 =?utf-8?B?VHdYRUxrbFRwVXFKTW53Y0hQTE9uOWdQU0xLRVNwZzE3b0dITlA3VkxkWHAz?=
 =?utf-8?B?MmdKYXF3aVpEMzZ4cy8zaHZBZzRyaEhYRDdVeDZVVlBycjRwQ2ZZYmRycjRu?=
 =?utf-8?B?akU0NElpTWxLOFFCbks3OWt5azFaSXFOVHJRQ2crSkVJQTlJU2VqU2w0bmlV?=
 =?utf-8?B?a1ZNbTc2WVZDY2c0WnN5SjR0TFJpOVVobDVuTDZVYy9VSkhoUEdnUHJwTHZw?=
 =?utf-8?B?dHQ2UDZ0czM2NUplL0R0dGZWRnQxdHU5VUVtWCtEaTJ1Y2VPMXdFTEVvbi9n?=
 =?utf-8?B?ckdyRU9EOE5WZ3FrYkdxc2h2ZXhjMS8rM01mOHBtMVp2aGlTWlNsak83QUF2?=
 =?utf-8?B?d25jZVFKVTVIL21XQkFDYUFkNWhMdElJcnhaVHhOYXlCVXQ5aFRRRmhDM21N?=
 =?utf-8?B?TUFUbllQZytxZ2VFTEdmMkJFcmV6NkIzd3ZjL3o0L3V0T0ZSeUM0bGxnSkU4?=
 =?utf-8?B?Q3JLS0FZQXZHK1NaS3V1QXJJWEoyR1lPRXhCWFMrQitHL2d4azA3dWppejRM?=
 =?utf-8?B?U0Zmc0k3d1praVFVRVZJN3B3QkFFNXdGNWU0ZnBrSHoyM2xtbFZkOEs4bW04?=
 =?utf-8?B?UVhxN28vaGNXbWo2NU9wRWVpaEY4bE1SeU5hdUhWSXFTenJzbHZJT3ZBRS8r?=
 =?utf-8?B?b080ZDZQa002TzR0UnpPQzhLZXVucXFuM1U4UWJackhxVTRRZDg2SytiTzZN?=
 =?utf-8?B?cGVZV2xiNUMxMlg2bGh1QnUvS2x2MTJvT20zbzRlTGF3MzlyRlloOW9aYmg0?=
 =?utf-8?B?SVVrK01uNXh6ZU5WNUpSdVN1UGpZelR5eUJvd2s3bFJma1lOWFhMMURjcFht?=
 =?utf-8?Q?+3iNMHzn5/oLrol8Q6rHPSHl5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a39d38c-399a-49e9-fb0f-08db2527d052
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 07:35:13.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZA1f5uU/lL6bmHzzWi2iaoAynVu0vLw7MuF826ocSfHAI6mIy3201gDSf3ZSK8mUF/p6tVeg57yl72K9nLJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416

On 14.03.2023 21:16, Oleksii wrote:
> On Tue, 2023-03-14 at 17:09 +0000, Andrew Cooper wrote:
>> On 14/03/2023 4:00 pm, Oleksii Kurochko wrote:
>>> The patch is needed to keep all addresses PC-relative.
>>>
>>> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
>>> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.
>>>
>>> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
>>> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
>>> where all addresses will be without counting that it might happen
>>> that linker address != load address.
>>>
>>> To be sure that SP is loaded always PC-relative address
>>> 'la' should be changed to 'lla', which always transforms to
>>> 'auipc/addi'.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  xen/arch/riscv/riscv64/head.S | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/riscv/riscv64/head.S
>>> b/xen/arch/riscv/riscv64/head.S
>>> index 8887f0cbd4..e12d2a7cf3 100644
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -27,7 +27,7 @@ ENTRY(start)
>>>          add     t3, t3, __SIZEOF_POINTER__
>>>          bltu    t3, t4, .L_clear_bss
>>>  
>>> -        la      sp, cpu0_boot_stack
>>> +        lla     sp, cpu0_boot_stack
>>
>> I don't think this is the appropriate way forward.  It's very much
>> smells like duct tape hiding the real bug.
>>
> As an option, I thought to add in head.S '.option nopic' directive to
> make la translated to auipc/addi [1] pair.
> As an alternative option, adds to AFLAGS += -fno-PIC... but still...
> 
> I checked in Linux binary how 'la' instruction is transformed, and it
> looks like it is translated as I expect to auipc/addi pair:
> ffffffe000001066: 00027517 auipc a0,0x27
> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
> <early_pg_dir>
> 
> I checked compiler flags between Xen and Linux. The difference is in-
> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
> 
> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
> I./arch/riscv/include/generated -I./include -I./arch/riscv/include/uapi
> -I./arch/riscv/include/generated/uapi -I./include/uapi -
> I./include/generated/uapi -include ./include/linux/kconfig.h -
> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -c -o
> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
> 
> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -Wdeclaration-
> after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs
> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror
> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
> arch/riscv/riscv64/head.o
> 
> So can we update AFLAGS in xen/arch/riscv/arch.mk with -fno-PIE or will
> it still be an incorrect fix?

Leaving aside the question of why you and I see different code being
generated, isn't it simply a matter of RISC-V, unlike Arm and x86,
not presently consuming EMBEDDED_EXTRA_CFLAGS in its arch.mk?

Jan

