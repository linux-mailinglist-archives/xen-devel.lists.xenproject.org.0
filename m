Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E16E7308
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523130.812890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp18a-0000aM-Ql; Wed, 19 Apr 2023 06:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523130.812890; Wed, 19 Apr 2023 06:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp18a-0000Yb-O1; Wed, 19 Apr 2023 06:17:52 +0000
Received: by outflank-mailman (input) for mailman id 523130;
 Wed, 19 Apr 2023 06:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp18Z-0000YV-5z
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:17:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8356cb7-de79-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 08:17:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6905.eurprd04.prod.outlook.com (2603:10a6:10:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 06:17:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:17:47 +0000
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
X-Inumbo-ID: e8356cb7-de79-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBY/QE4tzfh0nhGIPjJWZlEkzul5+oZ0/0a/aRBS8mk5dA7d3rguoGzPmR9m2JTOx7FqGPa/5skqKrI4EEsElE13U8KZ5SWRjxc4w5dP79sZvCzSxtlmjOOMInp3ijoo+gvD0cS1NjCKijlCrLNS6QQR4qvYkDE+1Wqt0NABf0h0cPuHLkjPOJLXmZMLYz006MRHQyd6yVdoDCjkPvU7lZHuKzZENej7RZSxthrnAg2p5RQkwkW/Ob+IDpjtyX82d6AiHQf23fOpJp8vunYup80H3baXA0L5bpEX9CD0A5h0vwkRZ6zQBA8FqjJxy0uNUaVlAJEgJkq1f9/BTEjKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cja/AsluzgAtOzgFCGClXMEUNs0H7z6a5o6h9BqqQWM=;
 b=Jneec/e4JvNPFugxqIqxm4GRhKe9BnJED4WW/OOmyIcojIIhLS5Nlei5TMeNVPwNYe+K28LEtQqbOLFJg/PKDkbhgyi3u/49UyxARdgIxr9M1zmAf4tDhC+ctWjhKNSQpoWnVAyyQOlqUlEaPv2W5PYp1GyzUdEyb3Bg9jC/xT4NGpikX4QzDGX/pnlLduufZMy7yLNXGcfh9+npY4rJVYj/enRK0D3LNj7Uig0B5XFRnvyAfHtg4MPs2xPjlA1dsav59AjsjA6wWMq7BG7xW8a25/bmpnxq2fPl9GHj77qA3BRjcU9BrwYoVG2VMAhf0NrOE2sJIVJWwgLSoY6HHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cja/AsluzgAtOzgFCGClXMEUNs0H7z6a5o6h9BqqQWM=;
 b=rv8aJyweU6yWAtxuIVJNjv2BeykTITfl36PNhjsojsfJuSuoD2Jhp098vmX6g7JNVl1p0GB1K+tBn0DAgE0wLQ8DRqT/BQuPR8Z76ZgW+b29WOvbzKo+6DlrhjH3vZGLDE0e9KIkKHpeProyhvpwTvbQd1sKnpDn0G2pemuYcf/TFEpWM2uUgxC0MXo1za+GIP96lHmq0lVC8+PEDglKnF5dKkVOUfaCICiqXKT8vGCF0V1v5oNA9cEgMKygekn5vLy9DOGcIT5A4Ps/BrfDYmIjJOlQlc8+CX1ItxHGk8e8SFIm4lBC51f1KRszgQIiu9E1fXmz3nUdKwmLtO7zNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d301e110-f840-a032-c406-2f7404752783@suse.com>
Date: Wed, 19 Apr 2023 08:17:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD6V0wzw/VS/MMw/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2024fb-2904-4fe2-bfd3-08db409dcb6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jNLVGxjxC3exHirwS53lRWPLayh0KbfxFvSlwXoa5MbA2/WJGxCTmiNFTBBNxjsKmjgGc8UyG+7FPlqh29plhHs5NTpYaikA1mRn9Wynp2Fg5UzJXz0dOMgvYqa3x0DdWiKRlut4mF5zPkikD4ERm6KvWGSLZ0sPEr9qqk59qAWPAlYv0aDkaGw93zF4vxrRJAgo+OyM1bOQwgSEF/rEELZ8CS9Oy9tNEKDgHLE/5nR0SqcYPOVLYjblxFnOtYspP/SZux28V515x0zYuFzzbF1bneFzvxoa/EXMy+SarxAXCU77UVs/MVhA9EofPvpK6A1STaaaYazRMXSsQdXXjHaOZn4wy65/1Z9oDa3F9DyemIEZgeN30VY+QeF2CBCfrtNqTcy5cJYfCZHjtUwoEsgXLcIGfjU2+Q4AoQI+DkkjXdi8/Sd5DO7YwVhpgkIzFuPqzZxQLrrS+Lwg7px29gzmQkqiFzN97PBfv9VeqdIQQtXyTHXugabGXdCExJLy64GeUaUj+p+0yNf/vLz2VF0JPv1PEH+YfbKmC5QZo3LX0IXCubffpeXd8fBdsOlZraFXKPnQtN7Resicc+3NKtaUMRVNoV9IxWlnwtUEOA8qmtp7EXzpuYHd+FfdLoweYevEJ6L1vdS1tkfLCn7nJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(2906002)(6486002)(478600001)(54906003)(8936002)(8676002)(53546011)(31686004)(5660300002)(38100700002)(316002)(186003)(66476007)(66556008)(66946007)(6506007)(26005)(4326008)(6916009)(6512007)(41300700001)(31696002)(86362001)(36756003)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JYYXVnNDF4TWJ6Qnc5cm16TEhaNmp2OWVNQ1hHYVd5bFZDLzUvUW9YMUpO?=
 =?utf-8?B?cW5HZVNrTkNDUjVnVmhrS3lWTFBLcW1vdHRnWjVpbUtUbGZnTmVKNWpnMGlo?=
 =?utf-8?B?Qkc5Uk5GTkRGeWh0R2RkcmNDRCt2MjJyZW9zbktqVFk5RUVCNnJuRUVtMHpO?=
 =?utf-8?B?cjZPWWI3MFRtcUhwVEQrRkt4aHo4TUw3RUM0TDh2VFNEamUrcTFtTnYyMFpE?=
 =?utf-8?B?dE54ZGczWXdDd1VpN3Fxb0dSRWZvYmgxbFZRUE51a2M0UE1icWozOEVWU0N0?=
 =?utf-8?B?WklmZDBFdWtXR215NTZ3MGk5ZWVQakZKOENSNmVrMldUd1FIeFdhKzJyT3Bx?=
 =?utf-8?B?Y3prVDdrZjF2dzg3c01aa1UyQ3A5SXUyc2hHVDJieVozZm03ZnhDUjEwMEVF?=
 =?utf-8?B?bWRsUUJ5Z2Z3bDN5WnByaGJ1RVlkNlFCRlJUKzlldXFCWFYrd1dVeDRJQ3NM?=
 =?utf-8?B?Y2tTZjFNRWdhb05TQzVwTndvcEd4RWRxRmJKVXlvVTdwL1lnTXV5MUhPQmhZ?=
 =?utf-8?B?RE1KbXNvUzVFTFVxZHJIYkJ2Zkp6a0cxZ1QvcDhDbllXN3Z4dDVocGYyd1hK?=
 =?utf-8?B?MDhSWmxyRThKOTJxb2tiSTFKRHltTGNITnFodVQ2bUxRQTdKSXJzSFIzNEhu?=
 =?utf-8?B?NVF3Q1Y3SWRWNkh0NEQ1bERRMUdFdjZQdlJ4UEhZakZYb21wTzlTSEdveFB6?=
 =?utf-8?B?eUdReVRNNU1iejYxZW9xTzhVZHFNODkrUjExWk9NVC94eHBOUXBoU2pVakN4?=
 =?utf-8?B?ZlFzbWUwaXhtd3pSQ3hjaHJtTXIwL29hVUI4bDJVTjJpYks3aktvNTdETVAr?=
 =?utf-8?B?ZGRRMGhySC8zenE1enFsUXNJazVEdDhSVWErL0Q0SDJmR2pQbnhtUVBXRXFB?=
 =?utf-8?B?bTJsa2NjRDFDTFNWU3BJdll2TXNENE5tczJNaGlQem0vdXJ0UjJhWHlyekdt?=
 =?utf-8?B?d0wrRlQyN0NEQUxZK21KK2k2UzkyTU5tVWRqSmpBbU56RncvUVVrZzl1LzNx?=
 =?utf-8?B?ZmprQTV5Z0JucjQ2RzZQeCtDRkhCMzJuUi9oODcxVWgrYnBXdGVUVlVSMW44?=
 =?utf-8?B?ZzJGWERxZGxCbEdqb0xkSy81bEt6b1FhZUJINmp4eXFFVkFPWmVIM1RUcUZV?=
 =?utf-8?B?QU1udkNvTVlYZnlBWnkyQkZHSkNCQ3ZlWVMwdWhDTFRaNjJzSEoxWk9KOUUv?=
 =?utf-8?B?akJqekxzVTNjb2lWNkRpaWVXc3k1WmNnZCtteE1DTzhpN0k2S1JXc1lJNVJV?=
 =?utf-8?B?ZFkvR3pYTWtzaFFxNkNVaVB3RWNNS0FSSWd3RnZTN0k4R1JWZFRzR1RRcUhw?=
 =?utf-8?B?RjFYc2tnRVRUc3c4QW5Bb1E4VkhHRzkvZWc0NWtrd2ZnSDU3cDlKVWs5bmV5?=
 =?utf-8?B?NGFDVmgyWUVmWW8wSzVLdnpLMURXaGpoU1ZiVXo2cERKVFIrUmNGN2FKdE1r?=
 =?utf-8?B?QmdMalFMZzNmZ2hhSzFlSkVDQkYveXlCM3phVncya2xLN0g4eXdmK0xNbjVW?=
 =?utf-8?B?MkNrWWUxbUdGVHVLLzJ6YjNBcFJvYm1yWWd1TVk1YkcwcFpjeXdjQXA0UHh5?=
 =?utf-8?B?T3hFbnBXU1lKRUppc0xWQ2ZNeUxLRmROS0x2c3h3Rko0WlNzZjR1ZW52ZjdI?=
 =?utf-8?B?ZFJSb00yZitXbXRBUkttcHZ1VUYwWURUMURWeUJmSGZaYXgxZlR4QlZSZmJI?=
 =?utf-8?B?U1VEbGsxbHd2VmZLcW5JSHQyeUdyK0FsM3JacWRzajJlMTFTWmR5RDFLRTN6?=
 =?utf-8?B?dlR6WUpQZEdnNkhSWjRINklDNmlHV1dqcklxTStmVW1WN0ZDTlVScmcwQ2wy?=
 =?utf-8?B?eUlkbzlWVDBsMWJyN1NFNTdDWkhZSHJkWGt3UERGVDRNbEJoNXdvaEZ2Nkww?=
 =?utf-8?B?VFFQQ0ZzdXBoMlpFSHQ4M09PaTZucXlnNXNMdFlBUHBtZy9BNWJ6MUFLUXNo?=
 =?utf-8?B?aFl5UTQ2TUVIRVBlYm9BSWJhRWxHN2dRZmRMOTNZa2NOL1QxV2RHWW93Rmpv?=
 =?utf-8?B?OXpNZzdrMnRmZkdFdVl6Z1hQNHVJcnVjZzdlRUgxK0xkVkF4d2hDTEQxZHk1?=
 =?utf-8?B?UC9RK01nWDhMbE1NOHZNcTBMNU9Gb3B5ZnB3THNuT0xzNUdrQ0tNQ0sza0Zp?=
 =?utf-8?Q?/O7XUw8Ma/Tjl4TGA5gqU1PoK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2024fb-2904-4fe2-bfd3-08db409dcb6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:17:47.1926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylK5MK6GvE06Zjo/mvOFXSpIUjeRdhf0b9tLEZoThdQA4g0NVdXvXguSzziAdkwwQ+C86PkiViMmkFeUYBZxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6905

On 18.04.2023 15:06, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
>> On 18.04.2023 11:24, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/config.h
>>> +++ b/xen/arch/x86/include/asm/config.h
>>> @@ -44,6 +44,20 @@
>>>  /* Linkage for x86 */
>>>  #ifdef __ASSEMBLY__
>>>  #define ALIGN .align 16,0x90
>>> +#ifdef CONFIG_LIVEPATCH
>>> +#define START_LP(name)                          \
>>> +  jmp name;                                     \
>>> +  .pushsection .text.name, "ax", @progbits;     \
>>> +  name:
>>> +#define END_LP(name)                            \
>>> +  .size name, . - name;                         \
>>> +  .type name, @function;                        \
>>> +  .popsection
>>> +#else
>>> +#define START_LP(name)                          \
>>> +  name:
>>> +#define END_LP(name)
>>> +#endif
>>>  #define ENTRY(name)                             \
>>>    .globl name;                                  \
>>>    ALIGN;                                        \
>>
>> Couldn't END_LP() set type and size unconditionally? (But see also
>> below.)
> 
> I see, so that we could also use it for debug purposes.  I guess at
> that point it might be better to use {START,END}_FUNC() to note that
> the macros also have an effect beyond that of livepatching.
> 
> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
> find START_ENTRY a weird name.

So do I. {START,END}_FUNC() or whatever else are in principle fine, but
I take it that you're aware that we meanwhile have two or even three
concurring proposals on a general scheme of such annotations, and we
don't seem to be able to agree on one. (I guess I'll make a design
session proposal on this topic for Prague.)

One thing needs to be clear though: Macros doing things solely needed
for LP need to not have extra effects with it disabled, and such
macros also better wouldn't e.g. insert stray JMP when not really
needed. Hence I expect we still want (some) LP-specific macros besides
whatever we settle on as the generic ones.

>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
>>>  
>>>          ALIGN
>>>  /* No special register assumptions. */
>>> -restore_all_xen:
>>> +START_LP(restore_all_xen)
>>>          /*
>>>           * Check whether we need to switch to the per-CPU page tables, in
>>>           * case we return to late PV exit code (from an NMI or #MC).
>>> @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
>>>  
>>>          RESTORE_ALL adj=8
>>>          iretq
>>> +END_LP(restore_all_xen)
>>
>> While I'm fine with this conversion, ...
> 
> So I take that overall you would agree to adding this extra
> information using a pair of macros similar to the proposed ones.

Yes (with the above in mind, though).

Jan

