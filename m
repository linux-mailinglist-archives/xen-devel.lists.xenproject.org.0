Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F7717B91
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541680.844657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Hvq-0004BJ-OA; Wed, 31 May 2023 09:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541680.844657; Wed, 31 May 2023 09:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Hvq-000481-Kb; Wed, 31 May 2023 09:15:50 +0000
Received: by outflank-mailman (input) for mailman id 541680;
 Wed, 31 May 2023 09:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4Hvp-00047v-DU
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:15:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id badc4362-ff93-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 11:15:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 09:15:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 09:15:45 +0000
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
X-Inumbo-ID: badc4362-ff93-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/htu+xCNmgrRxE9k3b7PwwC55u5whTUqj7w3ApouiY8EVaOyUko5o1qg/N3eL6LoFEPPfenHyaXg50qH6vVTF6sTv2dbXk24Thxi5sdHfPjbm2BTGHEswY1gmT+b0NADrj147sRo61vTiY2WS2qvfhv4T0Pftq65nd9k7568H0YOjFh7PVNEJecHYt3PU7hvTmBjbkCG1GY8+2OZaMhnI/7WLQjsXSAAaQw09ne6eMCGRw6C4RR5n3XRLxmdpUL4Nh0+kRnC95RODIGbJeElcBN8Q1EoY3x4z8SILFUHXDJqj+wlk94SOIWZVj2CQcx63h192N4IazxfQqvosOtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwSoEqNkQBhLrenw8fGigrS6OudYI3l6kjib7iW7vLA=;
 b=XyUxTsOOQJdbdG2qoDUenyQJSmX5mfdf3D4jedymHYXpor+s6yuiHlTMj6s7tkYa3so86CzbngQhJzSQh3r11bznvitXHtnQ5KqqDS1IecX5hZp4Zlc+tOwagXafAhTvcEdf5le9GGdBJfeIQb241chYwZC/qYNPGznT8RXjFawyV7TLkGZqYza2ArBavzCKRA9siBtrJLPN7HTvQlQbUzNMFqo7cWa0hqu5GrTKJQ9byUR6qmkcqi4atq0cm3nZGu2i9ij2tqTbiMjXzizk6DE6BYoBs6TuOLVYhr41hwpZUDcYLdReS+7uuICnQySZuRyUxdybeuLzzviSBg0rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwSoEqNkQBhLrenw8fGigrS6OudYI3l6kjib7iW7vLA=;
 b=evd7MX8ILfiRwwtPYrWb3ry/L9hLcW1UseJlgmmzVhczMQ1X7MufeGky5emG7i8FGZGi0qqzBS9BmWv7Wfe+5zz8FZqTZYnZNRKbgkJXX798hC/0dH6kWqDOelcwwSuxA4XNOlhkrNzr0PA7P0fppLk+TLH5W8xiy4lu57cA5cSR7WWhautZG84zzAPvfs7B52a4S90RwgRyXxV+JoyxZ7eLKSbWWCnhdjPpgknrmCc6n7q+xQJnsSGTcVx1KOHtpxuHty7JqH5NF69ktr8ggfYPDfSPSvJhpO/gdMIGzPwFpi/58gkk4yl8RI/M6KQnITg1UUc8HuoKWU8Gdxzt6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96ade9a5-37c9-dd38-cb04-ed0f2c0bbd97@suse.com>
Date: Wed, 31 May 2023 11:15:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] multiboot2: parse console= and vga= options when
 setting GOP mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-3-roger.pau@citrix.com>
 <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
 <ZHYeGOFpAtLnoQf2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHYeGOFpAtLnoQf2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0236.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: d84cd62f-bd0a-4146-4ca3-08db61b79db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6F/rLzI97Q6TYtbd+qs43mAKT10jTowEbyhhH9vEcTLVTQ+GGvnv2wuEft7usLFHqlYxyylowEGol4YzD8X54VAWmUGqXn5VJitw+jiEdA9UuSjn4yZy82raFg1C+m3ZRgqSjzCMhyTY6+JrBV8/Ft0B6PlWsad0CZy4gryBV6Z1FkZM+Yj8T5sfokRSbIZrLh8Fiunzq7UQQvYa+XZhzZcQY/7EhP4PaBbz/tn151X9/3cYR52ftGKbhmAhgHXN99ay2y2X5qQLvJdQvgE8vslZuqma+obiExeXXAnhJURVL8HY46BykRJ/3O57t2VP1khkkU+TgDYB/rgo24AUYYXS5BouegVThL9v2vUUbEn48tipqTrdq/B5qTh0oFJP2UKv1mlFST4h2AqdCKPCWuSygbDwQCt8qZr5qPW50zVgXRCdt1E8mcXuR2ZxrYubzHQO70fWivhparGb/FY0q5j7iIQm+Wz+deuCTC/gsB5ABwaJx61F26h8AWcHeP5PB5kxKF5FE16GsKGXZpFVZrR8+9/MBG/xtv2hjW+rvZpvqZMOHOkwc2oyzBaUA8OY84ceJUP0Q3PJ8EGqGqKJXlJe+uoMk3fBuMBGd3r1ZdD8tkgRpJUEQT3j0otilH6QmPKEzbI+4QnkUj5p7tRAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(6486002)(478600001)(54906003)(6512007)(53546011)(6506007)(186003)(26005)(2906002)(4326008)(316002)(8936002)(66946007)(66556008)(66476007)(41300700001)(8676002)(5660300002)(38100700002)(6916009)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE92NTN3ZzNkNDZWKzVoN1ZRTG5GYko0V0g5bkxFWDdXOGZ3Tm5LbjI3Q3dl?=
 =?utf-8?B?eGF3ZmNkLzZmd0VSeFFXNEVMKzYzVFJ3ZDhlc1hEQUcra0lHdmV3R3UrL2Jk?=
 =?utf-8?B?WFdLWm4wMXhsYXBZRzE0V2ppVWR6ZWtTQjI2eUVyME5OZzZ2K0xiV2dmNU45?=
 =?utf-8?B?ZGhUM1dOZnNnNHBkYnNDRWkzN1BtaWpKODhkQ1BvNk9UYkpZSERrcFNqSDBX?=
 =?utf-8?B?eFNPdTk3NWM0R0pMNzZqN3ZmczE4UVkrOG1FMzNsNjVPVm9keHVGTFJ1MFZt?=
 =?utf-8?B?MHUzeVlneERqV1NvekFtdkVHVXZDaExWa0VsYzNiT3hQaGhpRFQ1dDJQL2FG?=
 =?utf-8?B?Nm1ZOGUvV25EK3ZVS0hpTytQb2Q4MVplakJwYjZuR0JKSXhxa0dyRkZKeWpu?=
 =?utf-8?B?RGFhaFA5NEFMR2Y0SHNma2prUGlxdHoxV3dIVmtrSC9aQ2lVTkl2T2c0T3FO?=
 =?utf-8?B?SWpNR016U3QwSmV2WFBRRUFYam4rUGhMMUVGRlovUWlmdFFNVEFoeFBod3RE?=
 =?utf-8?B?cnBLSkF5R3R6emFINitONk5jaktuam5wamNLSHhESW0zZDJIU00vaEZtemd5?=
 =?utf-8?B?NmJNUlZyTnlTQWFWZ29BdDVTUUZQVzBwUmZjeFZOYTBzTWxLYlVMcWZWVXZn?=
 =?utf-8?B?N2F3SXFNZFN1TmN4cUg4OC9OT0FOM05teVl6K0VESTdzbE5tQkVkd2V0WEdy?=
 =?utf-8?B?aGJ3c3BCcVN0ZnFXM0E0YnpxSmh6bXVnVVhMeUNyYUVOSUlJbmdQYTcvR2Ru?=
 =?utf-8?B?MG01MXU3Y0tLeVFhMUliWWZSMkEyVGNmQWxRU0x5S3hXa2xXRWIvSDJXY1BY?=
 =?utf-8?B?c2VvazZWSEY1VlJpbTFqdEtLSVFRSjVnSzBYa21UbGlsKy9mdjZsd0NzNU9o?=
 =?utf-8?B?Wjc5WTUxL2tXOE45YWdNc2JWN2xCMGRIendPSkpTVTJRR2s3a083UlhGZU5a?=
 =?utf-8?B?WFlyUlN4a2JJRHhNSVlYVDAzd1prSk5VMDl6RnlnUDQvcUpER21Ick9IMFQ5?=
 =?utf-8?B?UndXSzRLbUs4a2VLOWlyMlhORnhDcXd5cVlXZjBSa09MTVZKbjdUZFhpanlh?=
 =?utf-8?B?eThEZkQ1d3JKdi82SXJheXo2UzhsUzd4b2psbHd4cysxS1pCemNadjhDQVd1?=
 =?utf-8?B?aTl0ZVVSNDVibkFOdVoza0tjUHR2R3I2bHkraWU4YUhpazBYSkd5eVg0Tm9p?=
 =?utf-8?B?ZWhFRFV5UmpwN0xLUitqVnZ2VkdpSFFOdnFDLzFyOTljMnZtMUhDeWtWdEY0?=
 =?utf-8?B?dXUxQ0tOdS9kSzIvRXBKY09mRmFwTFRsWlM4Kzl0TS96alBEZDk3d2o2aTJ6?=
 =?utf-8?B?K1V0VFZ4Tm45L3Rpa2dQUUJVK2NoNklsY2EwY0NnUThkcGE3TVB2MndvUmds?=
 =?utf-8?B?UDZjQzFhRTBXZnEyQXNnS05aWUpMb0V3UDlmNnlUY3M3eUNIeWJrVnpiUkFT?=
 =?utf-8?B?QUlROXZ2VW9WWndCc0ovcXBGZ3hMSTR4U1pJUXVybzRETlJ5TXN4YnF5NDcz?=
 =?utf-8?B?SmZlTGlrTVRCYTRhRUlBQVYwaG0xTXpyWERLRUcvek1Rc1ZwQjdCMUdOYm5V?=
 =?utf-8?B?cWFkTW5GRjRBWWZod0x3UG9kanNZWmR3ZmRiek5yYlk4SVM0OVc2bnVrUWtw?=
 =?utf-8?B?T2VBT1NwVkdoZFIyWml1YjJMckMrQ0xTdU81blAvMmtZc2tGRmpyK1UrVEdp?=
 =?utf-8?B?anR1N2xvTC91aUMweWdTU25ReW10eTB0OWxWblZFRUpOZ3JRb0dQaCtpMWlP?=
 =?utf-8?B?UzIwTnNQTEg5NnI3cVJYN1R5a3lVamZDTE41Wk15anYwY2FNdGVQTlpCb3l6?=
 =?utf-8?B?TXcrekJac0xUaDJiL25pRnRhQzlEMXdUNi9CV2JweUZNNzViQW9CamVER0xO?=
 =?utf-8?B?d2tJUmxlYmJJcGdOTkZ5YWg2VkduRXJicEFTUU1IVFZjU3BrRTRCQmV5bllK?=
 =?utf-8?B?T1Y0QzBadkpaaVorTzdhTlBCWkRGbUpxdjZaTzQ3MjY4WlpBc1BocllkaGFh?=
 =?utf-8?B?U1ZmVWZaRVF1dkVRR1cvY3hyWlhCWVM2OWxaVkU5d1Z2L0NGUS9ubHhEM1NQ?=
 =?utf-8?B?YVEwZDd0cHhOWFc2S1JZa1Z2OWVWR3hRU1dUeDNSTmFUSGtyeDN2T25jK0tH?=
 =?utf-8?Q?3hbLG/1n93FeOexEwJ0uswH0M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84cd62f-bd0a-4146-4ca3-08db61b79db1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:15:45.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrI+7B+e5ZeK/3Raq0XpgcG9+vuUsSVcBJa8EvRmOPBcGkjSpMYd+XJTxKclyDJiMpklON4ncrVoobAUD0keyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899

On 30.05.2023 18:02, Roger Pau Monné wrote:
> On Wed, Apr 05, 2023 at 12:15:26PM +0200, Jan Beulich wrote:
>> On 31.03.2023 11:59, Roger Pau Monne wrote:
>>> Only set the GOP mode if vga is selected in the console option,
>>
>> This particular aspect of the behavior is inconsistent with legacy
>> boot behavior: There "vga=" isn't qualified by what "console=" has.
> 
> Hm, I find this very odd, why would we fiddle with the VGA (or the GOP
> here) if we don't intend to use it for output?

Because we also need to arrange for what Dom0 possibly wants to use.
It has no way of setting the mode the low-level (BIOS or EFI) way.

>>> otherwise just fetch the information from the current mode in order to
>>> make it available to dom0.
>>>
>>> Introduce support for passing the command line to the efi_multiboot2()
>>> helper, and parse the console= and vga= options if present.
>>>
>>> Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
>>> option, and print a warning message about other options not being
>>> currently implemented.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> [...] 
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>>>  
>>>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>>>  
>>> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>> +/* Return the next occurrence of opt in cmd. */
>>> +static const char __init *get_option(const char *cmd, const char *opt)
>>> +{
>>> +    const char *s = cmd, *o = NULL;
>>> +
>>> +    if ( !cmd || !opt )
>>
>> I can see why you need to check "cmd", but there's no need to check "opt"
>> I would say.
> 
> Given this is executed without a page-fault handler in place I thought
> it was best to be safe rather than sorry, and avoid any pointer
> dereferences.

Hmm, I see. We don't do so elsewhere, though, I think.

>>> @@ -807,7 +830,60 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>>>  
>>>      if ( gop )
>>>      {
>>> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
>>> +        const char *opt = NULL, *last = cmdline;
>>> +        /* Default console selection is "com1,vga". */
>>> +        bool vga = true;
>>> +
>>> +        /* For the console option the last occurrence is the enforced one. */
>>> +        while ( (last = get_option(last, "console=")) != NULL )
>>> +            opt = last;
>>> +
>>> +        if ( opt )
>>> +        {
>>> +            const char *s = strstr(opt, "vga");
>>> +
>>> +            if ( !s || s > strpbrk(opt, " ") )
>>
>> Why strpbrk() and not the simpler strchr()? Or did you mean to also look
>> for tabs, but then didn't include \t here (and in get_option())? (Legacy
>> boot code also takes \r and \n as separators, btw, but I'm unconvinced
>> of the need.)
> 
> I was originally checking for more characters here and didn't switch
> when removing those.  I will add \t.
> 
>> Also aiui this is UB when the function returns NULL, as relational operators
>> (excluding equality ones) may only be applied when both addresses refer to
>> the same object (or to the end of an involved array).
> 
> Hm, I see, thanks for spotting. So I would need to do:
> 
> s > (strpbrk(opt, " ") ?: s)
> 
> So that we don't compare against NULL.
> 
> Also the original code was wrong AFAICT, as strpbrk() returning NULL
> should result in vga=true (as it would imply console= is the last
> option on the command line).

I'm afraid I'm in trouble what "original code" you're referring to here.
Iirc you really only add code to the function. And boot/cmdline.c has no
use of strpbrk() afaics.

>>> +                vga = false;
>>> +        }
>>> +
>>> +        if ( vga )
>>> +        {
>>> +            unsigned int width = 0, height = 0, depth = 0;
>>> +            bool keep_current = false;
>>> +
>>> +            last = cmdline;
>>> +            while ( (last = get_option(last, "vga=")) != NULL )
>>
>> It's yet different for "vga=", I'm afraid: Early boot code (boot/cmdline.c)
>> finds the first instance only. Normal command line handling respects the
>> last instance only. So while "vga=gfx-... vga=keep" will have the expected
>> effect, "vga=keep vga=gfx-..." won't (I think). It is certainly fine to be
>> less inflexible here, but I think this then wants accompanying by an update
>> to the command line doc, no matter that presently it doesn't really
>> describe these peculiarities.
> 
> But if we then describe this behavior in the documentation people
> could rely on it.  Right now this is just an implementation detail (or
> a bug I would say), and that would justify fixing boot/cmdline.c to
> also respect the last instance only.

Yes, fixing the non-EFI code is certainly an option (and then describing
the hopefully consistent result in the doc).

Jan

>> Otoh it would end up being slightly cheaper
>> to only look for the first instance here as well. In particular ...
>>
>>> +            {
>>> +                if ( !strncmp(last, "gfx-", 4) )
>>> +                {
>>> +                    width = simple_strtoul(last + 4, &last, 10);
>>> +                    if ( *last == 'x' )
>>> +                        height = simple_strtoul(last + 1, &last, 10);
>>> +                    if ( *last == 'x' )
>>> +                        depth = simple_strtoul(last + 1, &last, 10);
>>> +                    /* Allow depth to be 0 or unset. */
>>> +                    if ( !width || !height )
>>> +                        width = height = depth = 0;
>>> +                    keep_current = false;
>>> +                }
>>> +                else if ( !strncmp(last, "current", 7) )
>>> +                    keep_current = true;
>>> +                else if ( !strncmp(last, "keep", 4) )
>>> +                {
>>> +                    /* Ignore. */
>>> +                }
>>> +                else
>>> +                {
>>> +                    /* Fallback to defaults if unimplemented. */
>>> +                    width = height = depth = 0;
>>> +                    keep_current = false;
>>
>> ... this zapping of what was successfully parsed before would then not be
>> needed in any event (else I would question why this is necessary).
> 
> Hm, I don't have a strong opinion, the expected behavior I have of
> command line options is that the last one is the one that takes
> effect, but it would simplify the change if we only cared about the
> first one, albeit that's an odd behavior.
> 
> My preference would be to leave the code here respecting the last
> instance only, and attempt to fix boot/cmdline.c so it does the same.
> 
> Thanks, Roger.


