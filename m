Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE63FEBAD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 11:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177202.322491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjSk-0005Zc-GX; Thu, 02 Sep 2021 09:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177202.322491; Thu, 02 Sep 2021 09:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjSk-0005Wu-D6; Thu, 02 Sep 2021 09:56:50 +0000
Received: by outflank-mailman (input) for mailman id 177202;
 Thu, 02 Sep 2021 09:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLjSi-0005Wl-F0
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 09:56:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e37a3955-8d92-44b4-85b9-c9d90503737a;
 Thu, 02 Sep 2021 09:56:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-5S3dmyduOmedLylCb4vH8w-1; Thu, 02 Sep 2021 11:56:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 09:56:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 09:56:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0192.eurprd02.prod.outlook.com (2603:10a6:20b:28e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 09:56:38 +0000
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
X-Inumbo-ID: e37a3955-8d92-44b4-85b9-c9d90503737a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630576605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgtEOi+Tk+N1Qhq1ZjjXcboumpOXjoDLgESCBpFZp68=;
	b=eC9Lau+U+rDtM+tkCWN/Rqh3kSuqC14DFGAo2R2zVOPsMHzIQAgXeAECHZQvhK/AjFfdKr
	lsQRpWqeFQ3EZJgf1ZOlq7OrIknfOkAFIbVSmeVIem3jc8xYjT0GbyBgr6aL8yrnC5/NSO
	L2kDKGMXcNIu4gtWPyiR4/NCQiKYP8o=
X-MC-Unique: 5S3dmyduOmedLylCb4vH8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DphjXKh/tuw+Tw+JeXFFe+06FkWazd/Hb6rKuH8qQZY7gObzhmlvNB8oJkzs6wx+xpq5/6f6dIYiAM6ZBv5QrL4GcAvTguGWMKxIkez4FEizSLoykWy1EJDqZsbHKRbmXdbBVK8BYid+J4WIKzMcb7TkRj3KK3+MjZPUJXORURdsCTF1RAY2zOMo1eb/3O0kBhA5yFvJGclwkhGAgSlmE3SZRIi3EId3jiXo5tkXyh/rVufLaHglK7Hw+ImqI/3i8zSQCCOmGCgPk2sV2VXT3q9rEXAjoFOLeQFnD+ze9Wa6xKXneTOREMtwDWLz9lN/6scGR+eALsaoKyOGk+Ycig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vgtEOi+Tk+N1Qhq1ZjjXcboumpOXjoDLgESCBpFZp68=;
 b=bjqUCXNF+C5eHhPK7u5tG0SbwsPcL4z5LJ7ozNCnIqL7VgpW9TBON1HL4+hQSxf2t7k9mr7vQZYEXKbysuHkdTJH65pWuXqrer7C2ZoowJAJzCpI5OgYsOzzwLZ69YT+DsFD2Hle2nbtsFgofIIZNTNyHWBmb8GLxOAGbGxfbJQi654GB0Wr/Qt9unJQlzTGDy1YUWyH9K1RowkanTK47b3ix4Ic83ryMAJAn4B44bD08WT3ej/BwS/qYq+9B7/Nf1uYSfQ78BsrcGmCzZH6eeSlcEh6lSYMySHiAvssx73QOehzl9KLF7cn5Id2qMpzKRn8aOlZUtdryeD5DLUK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Grab the EFI System Reference Table and check it
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <YSt7P0a63GCxygAa@itl-email>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eec7828f-ed75-2aab-982a-ad98352c5728@suse.com>
Date: Thu, 2 Sep 2021 11:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YSt7P0a63GCxygAa@itl-email>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0192.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c167e8-17b4-4a2a-1237-08d96df7f5a2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB648061CA10813B7BBE06FA3CB3CE9@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PwSnTndDfRlEZSTHreSGL1vE/F5g7LaFIDdN1yXDC+fHdV+TCWuz0z4xlu9sGIqlFwWuGwb/astUy0TtKPWgsmlYw8nHSu78teev3fvsIfcKrpS7ZUCRB3uvjN1mO24wASf4X9JKt0MiC+QICpjn4g5jv6K1Mza2YFZDXZbGfV+8whdeimNhWdYfM5594lJ2BU6Ou8AQ09987Rfv/tgAAGFip+OtqpAyiK9xgIW6pbC3GBvAMbGwdqMKGPK0D9obYcHOJD0qMaPULgZ9OIQNcjU3thIduV6kQo0J4+hd6B4dDIw4rDPoEZXmB2nl6Tz2NEA4ia6JeqebldPNl2gAufgb2q9WfzPnCtGgDBFZHZ1pvBtHT9xZX/EyfbGAu7yFm4w+P4VdkiBGWdmvKye3fW74+7Nh1laj/lWYKZBwza2jT497Ay/7yCG7c8ZGslPBFCAkSmWcqJT4SuTpJ2QQDDFMvh/IHUbR2S+QQnHiqHx1QP7+tjqLt5S1fuyDSatD+vg4kQTNfbgCf6/83YNcxNk3wYlNaxx6mJX0wcWE/dN5FcRVeLPlOObtOSa7wnrffIBnxjH4OUuu4QK5cUWUr86vG1qefyf8u+8OFOyp5YGbMPM3iA4M6kJwdfLhVGl+7/3fIX50/GD/avkPiui56Ud0zhCEmrlVhAsNMLycgy8f+eiAMPxWmMusdV/sa1SD8swf901HTqb6G1tOK7dwDLFkXwP6vXTLa+aF2mA5pxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(396003)(366004)(376002)(54906003)(53546011)(2616005)(16576012)(31686004)(316002)(956004)(86362001)(8936002)(186003)(31696002)(36756003)(38100700002)(8676002)(2906002)(83380400001)(6486002)(5660300002)(66946007)(66556008)(66476007)(6916009)(7416002)(478600001)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?Vg5sufvTDInRUQKy3fm5myKiOVueIk5seUpjp+vk7zthd9aYSTfCl4K8?=
 =?Windows-1252?Q?EUD3civvNXl7PjEQCj7LQXigP+8qKzrz8ansQUqcDYoKl8fpx9MbF8Je?=
 =?Windows-1252?Q?S8dTe0ziPHBJRzGkYsjkSLvEwBTZdhzYNMlC33eOGgFOwavektjNugXy?=
 =?Windows-1252?Q?DX3l9F2sh1G/MH4MhQUojZHy1E1g26EgIe644PjcaJrFg14XYE/dDEnC?=
 =?Windows-1252?Q?LqdS2zHJVrMC2ynPQm1hDLzVCITIJp4XjS0bcrFnD6fBCmFLYJcKB7/a?=
 =?Windows-1252?Q?5lvKoTtI8GHPQfqjhRhNRycG44Up501ulCJuvhK7kd8OtMTuuzEgU5gp?=
 =?Windows-1252?Q?V2UtQm9TShHfWAEFDpb6+xG19XCuOOctnxNe5nrMv0PIV5ihUDOFXDVw?=
 =?Windows-1252?Q?R68Bww0Sx8qBPdxD0TqzbZGVH3haOm6/jqkWzZrhKZyBaHoYzOPVoJA5?=
 =?Windows-1252?Q?VQ1z9iRDoThEx/ghPERq8zW4ExuttbAzLSRz6NphoYpLjRwUj4Zq2inQ?=
 =?Windows-1252?Q?bZsZarP3bdXqhkuoUQKTW7cfZ78Q3qokW6+QdS5ZBUkuoGsSKVM5B7Ai?=
 =?Windows-1252?Q?P2m5e8ldgdbQ+oHZcszFeMddAqFHo6RlPZRsBQqDSzpaJZ3u3rG+lQAk?=
 =?Windows-1252?Q?+p1JQ81Nt3cJ0W8DvQbkLSVlSGNXBOeTHimOWYV2al5iDeV6u7oVhtea?=
 =?Windows-1252?Q?1sxgoDF4cMYAwJP9zBlpIffnYC4GDa/uof1g03riroyvHnyW/6nA6uHr?=
 =?Windows-1252?Q?9x9cmzri9DbDMLHjES2B2cRjhW0PWuACP5jlr/unSHxnrwxJu6BRyxAX?=
 =?Windows-1252?Q?Oy7mBxvQEEScJO0/nJZVQH9z6OGho8jH47O0einJMul+YNz+kzJ1R2DI?=
 =?Windows-1252?Q?roJgF0rIMn+rWy9Tq2SL8H2hhQWqth4DrVAyZF7DMt6ZAFtuLFxVJC7T?=
 =?Windows-1252?Q?T5ueHSkMkHby3lWztFN9G91rPRUvONuo5H4pWXXMihfHYPr0c+71LKRS?=
 =?Windows-1252?Q?CNUU15EeOsY4CTna++lLh+p9Ho6bKgQcfteJBRyYYUCOxtuUoQ5gifhK?=
 =?Windows-1252?Q?8hdQJRWpvRJDa7N5fmKVUflUny89k6rgwtCg7In5gZSDP0lDmyMD4Zn6?=
 =?Windows-1252?Q?TYeugOGyI334vnwJmKyvaHRoMgCDhG6RJePIcKYyz9UG73cMmDhn+SUC?=
 =?Windows-1252?Q?BAZZ9eGvnauLVm24NNw4Sf3W74SBWPEKypjOBwcFAdqvFwbwWZqztHfq?=
 =?Windows-1252?Q?yO16S97MkgCK+armTkgeG89PEGsDcDXfsbHdyYA8I09vWMXCeMVqLSOq?=
 =?Windows-1252?Q?ywFpivYCKn2GAsWgVjXM/nWrWCzvIOXHwGt8ylCv5t6uRRb3ocGv8Esb?=
 =?Windows-1252?Q?Q55+dt6V43QbSOaQBGBFhWlKhEQfLc/NMliOI+xtQ6f6QYCZhkqdWakG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c167e8-17b4-4a2a-1237-08d96df7f5a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:56:39.6444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76jU/swXVLyo8tN/JEWV/8Kguexxaxw/HhshhM54VOsXl380TX+Z8P664cD4ROIqGyszd/Skv9LugAMB36JXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 29.08.2021 14:18, Demi Marie Obenour wrote:
> The EFI System Reference Table (ESRT) is necessary for fwupd to identify

To properly match the UEFI spec, both here and in the subject I suppose
you mean "Resource" instead of "Reference"?

> @@ -171,7 +172,7 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>          {
>          case EfiBootServicesCode:
>          case EfiBootServicesData:
> -            if ( map_bs )
> +            if ( map_bs || desc == esrt_desc )
>              {
>          default:
>                  type = E820_RESERVED;

Elsewhere you also permit ESRT to live in EfiRuntimeServicesData. The
code addition here looks to contradict that.

Furthermore you're potentially making a large chunk of data unavailable
just because it contains a small piece of data which needs to be
preserved.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -93,6 +93,23 @@ typedef struct _EFI_LOAD_OPTION {
>      CHAR16 Description[];
>  } EFI_LOAD_OPTION;
>  
> +struct esrt_entry {
> +    EFI_GUID fw_class;
> +    uint32_t fw_type;
> +    uint32_t fw_version;
> +    uint32_t fw_lowest_supported_version;
> +    uint32_t fw_capsule_flags;
> +    uint32_t fw_last_attempt_version;
> +    uint32_t fw_last_attempt_status;
> +};
> +
> +struct esrt {
> +    uint32_t esrt_count;
> +    uint32_t esrt_max;
> +    uint64_t esrt_version;
> +    struct esrt_entry esrt_entries[];
> +};

These don't match the gnu-efi style (where we're generally taking
pieces from), but since I can't spot that package supporting ESRT at
all, we have to roll our own, so the style inconsistency is perhaps
okay. But at least - alongside EFI_GUID - I think you want to use EFI
types (UINT<nn>).

> @@ -166,6 +183,41 @@ static void __init PrintErr(const CHAR16 *s)
>      StdErr->OutputString(StdErr, (CHAR16 *)s );
>  }
>  
> +enum esrt_status {
> +    ESRT_NOTFOUND = 0,
> +    ESRT_GOOD,
> +    ESRT_BAD,
> +};

I think we generally try to limit all-caps identifiers to macros.

> +static enum esrt_status __init is_esrt_valid(
> +    const EFI_MEMORY_DESCRIPTOR *const desc) {

Style nit: Brace goes on it own line.

> +    size_t available_len, esrt_len, len;
> +    const uintptr_t physical_start = desc->PhysicalStart;
> +    const uintptr_t esrt = efi.esrt;

Like said above and to match other code in this file, EFI types
(UINTN in particular) should be preferred.

> +    const struct esrt *esrt_ptr;
> +
> +    len = desc->NumberOfPages << EFI_PAGE_SHIFT;
> +    if ( esrt == EFI_INVALID_TABLE_ADDR )
> +        return ESRT_BAD;

I think this is rather ESRT_NOTFOUND, too? But see also below.

> +    if ( physical_start > esrt || esrt - physical_start >= len )
> +        return ESRT_NOTFOUND;
> +    if ( ! ( desc->Attribute & EFI_MEMORY_RUNTIME ) &&
> +           ( desc->Type != EfiRuntimeServicesData ) &&
> +           ( desc->Type != EfiBootServicesData ) )

As you say in the description, the spec mandates the latter. I can
accept you also wanting to cover other plausible types, but then
please add a brief comment mentioning the intentional diverging
from what the spec says. This would then hopefully also clarify
the curious redundancy between checking EFI_MEMORY_RUNTIME and
EfiRuntimeServicesData.

As to style - there are quite a few too many blanks here.

> +        return ESRT_BAD;
> +    available_len = len - (esrt - physical_start);
> +    if ( available_len < offsetof(struct esrt, esrt_entries) )

Iirc both gcc and clang allow sizeof(*estr_ptr) despite the
flexible array member - please prefer that form (also again further
down).

> +        return ESRT_BAD;
> +    esrt_ptr = (const struct esrt *) esrt;

For this and the sizeof() below to be applicable, you need to check
the version to be 1. Also, as to style, there's not supposed to be
any blank after the closing parenthesis.

> +    if ( esrt_ptr->esrt_count <= 0 ||
> +         __builtin_mul_overflow(esrt_ptr->esrt_count,
> +                                sizeof(struct esrt_entry),

sizeof(esrt_ptr->esrt_entries[0]) or alike please.

Also - is __builtin_mul_overflow() supported by all gcc versions we
support building this code with? And is this overflow check needed
in the first place? After all we build EFI code only for 64-bit
hypervisors, and a 32-bit quantity times the sizeof() can't overflow
in 64 bits.

> +                                &esrt_len) ||
> +         esrt_len > available_len - offsetof(struct esrt, esrt_entries) )
> +        return ESRT_BAD;
> +    return ESRT_GOOD;
> +}

Style nit: Please put a blank line ahead of the function's main
"return" statement.

> @@ -835,6 +887,10 @@ static void __init efi_tables(void)
>  {
>      unsigned int i;
>  
> +    BUILD_BUG_ON(sizeof(struct esrt_entry) != 40);
> +    BUILD_BUG_ON(_Alignof(struct esrt_entry) != 4);
> +    BUILD_BUG_ON(offsetof(struct esrt, esrt_entries) != 16);

Why? We're not doing this for other types declared locally in this
source file afaics. Plus - did you check that all gcc versions we
support for building this code can actually deal with the C99
_Alignof()? I would generally have expected you to use __alignof(),
as we do elsewhere.

> @@ -1042,9 +1101,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size = 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif
>  
>      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
>                           &efi_mdesc_size, &mdesc_ver);
> @@ -1055,6 +1112,10 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>  
>      for ( retry = false; ; retry = true )
>      {
> +        enum esrt_status esrt_status = ESRT_NOTFOUND;
> +        const EFI_MEMORY_DESCRIPTOR *esrt_desc =
> +            (const EFI_MEMORY_DESCRIPTOR*) EFI_INVALID_TABLE_ADDR;

Style: Misplaced blank.

> @@ -1063,8 +1124,31 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>          if ( EFI_ERROR(status) )
>              PrintErrMesg(L"Cannot obtain memory map", status);
>  
> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +        {
> +            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> +            switch ( is_esrt_valid(desc) )

Style: Blank line please between declaration(s) and statement(s).
I question the need for the local variable though - you only need
it ...

> +            {
> +            case ESRT_NOTFOUND:
> +                break;
> +            case ESRT_GOOD:
> +                esrt_status = ESRT_GOOD;
> +                esrt_desc = desc;

... here.

> +                break;
> +            case ESRT_BAD:
> +                esrt_status = ESRT_BAD;
> +                break;
> +            }
> +        }
> +        if ( esrt_status != ESRT_GOOD )
> +            efi.esrt = EFI_INVALID_TABLE_ADDR;

In the end you don't distinguish ESRT_BAD from ESRT_NOTFOUND, so I
don't see the need for the enum. The function can simply return
bool then.

> +        /*
> +         * We cannot pass efi.esrt because we need to explicitly compare the
> +         * descriptor pointers for equality.
> +         */
>          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_size,
> -                                    efi_mdesc_size, mdesc_ver);
> +                                    efi_mdesc_size, mdesc_ver, esrt_desc);

I'm not convinced this is "need" (as the comment says), but at best
"want", for being an implementation choice. But the model itself is
suspect to me in the first place, as said above.

> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -19,6 +19,7 @@ struct efi {
>      unsigned long acpi20;       /* ACPI table (ACPI 2.0) */
>      unsigned long smbios;       /* SM BIOS table */
>      unsigned long smbios3;      /* SMBIOS v3 table */
> +    unsigned long esrt;         /* EFI System Reference Table */
>  };

I have to admit that I'm having difficulty spotting why this field
needs adding here: No other component in Xen wants to use it. Yet
that's what the struct is for.

Jan


