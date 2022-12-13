Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3664B04D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 08:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460217.718087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zYC-0004IW-Aq; Tue, 13 Dec 2022 07:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460217.718087; Tue, 13 Dec 2022 07:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zYC-0004Fu-7u; Tue, 13 Dec 2022 07:18:04 +0000
Received: by outflank-mailman (input) for mailman id 460217;
 Tue, 13 Dec 2022 07:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4zYA-0004Fg-Vw
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 07:18:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46e59690-7ab6-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 08:18:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 07:18:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 07:17:59 +0000
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
X-Inumbo-ID: 46e59690-7ab6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A98IdPjHJh1kw50IZhzxKpk4joOd/oh1IxkF8B5bSlwvliENk2emmSSuCRcjVzFtFloRRfoO3kGFpaWsKT9ftQADBSPXwz7DAxk48FKCdYMUouGlynBhkZL0vZORk2Lo/4C23V0XLd8FJ6i6JYtmEbjbvHqMDoAIH+/VxWq5B2fbtm+UV0jJmNCm2dM8jnF0jL+asa10cg+QjDgIfpYx8xSomom9u98HthfNOvQrSsiy3PkLMj4r5KJ/Mw9/h1ebCuPeGsakWLKCQ6RFE0dBukLxMoiRwiAMm+9eqYwJP7A6xUd0+jVbdQKAXKBDTn1FU/OSc9wKFfYYSmMyd9TINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yumtuPumW//LbLdht9RR10lyRMsr8EqEVgTwNWOxl8=;
 b=Y/znPCEHvbTKJxNZXCzv1lQ0IOur05q7BvuJB1TlECntAkhjeETQsi7UqNvuz7ssf0TlKfRMq6lr0M42QAj9avhCoRuDskU8BhCDthj5Pp4cdXV01DvQhHdSLdjgDi6/jqvNbzRnYe4iuKmn4nsjDTJ3Km1NNdFo54qMMkjfB+mNFtBturZMIdIJVO3OynOoScMtNx4m+6x2HnuRXIB8FMN6Tr68GT2COb4R+5Gcsv771paw/uhNiplsGRNHgiGpHyAu2FqbRznmyqjSgPiKUzewztzlpsWFRfooVJnvZuGIM+ndgzLla9K2zXNs/i7a8XcnI0Pyh3oqA9v6KQoGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yumtuPumW//LbLdht9RR10lyRMsr8EqEVgTwNWOxl8=;
 b=zxrbSavJoESNqm5hkeZj6TE3y7hnCCwcrIli66O/efu6xky0Bk5qUrmfmS6cApx4RWv3S3iptgbByG8vwpOWfHwkaXc5uv3H08CiX8C/BDMcsCRC3PHmUQDvjukxOljMMUChoC5xl0qJG1wOAqpUL71pLGN5hA4KZnTprBMHk0KUSgCeY7RypfeHaE+XPgA+QVAxr2MNtu/mAPcmmWtP61LybXONBYHQ9xE+JBTpHbPqGm+eycsM2dO2oHjfe0D8TQ7X+kHE/ybTUXtJqTwbcjjejPSDiz6WSeh1sgkHEewNt8e1/cPkao+CpVCMzFYJiBiC5XUjtzlMUbXuRzZhPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11b8ccb4-b2df-1b5c-61a7-7defafd8c8ef@suse.com>
Date: Tue, 13 Dec 2022 08:17:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Relocate the ESRT when booting via multiboot2
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
 <e4dfe73a-a0ff-54c4-054d-2044de1e546a@suse.com> <Y5ex/9OBFZ3hdBx/@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5ex/9OBFZ3hdBx/@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e2cdd4-9c15-405f-76e5-08dadcda29ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9mjQMAhnKiRZEkd5dLKb2V0O9qnI9C8sFDSdsha8R8D6OABDg6fFjgkqZ4pz6iJ/oL9XWsi6LYRVoAK8AqBzUtstxBVMNvV3sUXI/1IIRzPmpiu48f4fGvm0XbSYQc7cmH5goXCFVTIlstnIRidIR2aTfcIeyQPbDuy7H9GKvxtUWnDDzowBcaljL9NZwmBzVAcMGHbeNNWbTn5Ic3/U3IBJZzgn/pxDDCXOOy5i+g5YC2+vjcZZ5nLi0JI1Sz9gX873FI/iYovTI9WafXOT2w1w+UGojEzWQmBlpV4/0yhv+Pwf2QRyMWtnbt6au5BoxAv+tK04+cQ42fuUovLouWpLJCxza0zr9xJsfBwKy7jG8l1Q9xvsIeOz0PVMdL1vAW8lbb4RxyOloDUkGUi/JC6XKewefhVW0S821efkqDENdOcT4E9MSnP1CgYY69amFwHbHqZa49f7D4AVfKwWIKast9P9C/qsxIC5fAIgxDS/WIoJvU0k+6VDib9t0vf49tFstm29VWlxP/fxyWL+RgSOMosSk/TQidmvcsF6X/XrxefyhWUH+9GkHB2Zx8qvUMdSWWKwcqghPAa1DflwnRt1eqp8bm9zeIv/eVR5VQiEXT3MjFYaVNC7DfrOdiZygUqqZsQB+FGM0RedEexm+kD7ZBLoOoFEMeWZNimJBt2KCeqAeFzHMCnNbd6L5LeqZ8Y4/YhdwkjaMuuo1GQoxD3lQb6b87OhDLBFhrvm/us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(4326008)(8676002)(36756003)(186003)(66946007)(66556008)(41300700001)(66476007)(316002)(54906003)(8936002)(5660300002)(31696002)(6916009)(38100700002)(83380400001)(6666004)(478600001)(26005)(6486002)(6506007)(86362001)(53546011)(6512007)(2616005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJOaTZXQ3h6cVJWNWkzbUxUckZzZnNrZDBkenRXMlo2aEFmeHpjVGhOcjlI?=
 =?utf-8?B?UERZU0pkUU9TRjZtekpyRHNybU9LaVRIcVpRUFRaQjBrdklkZFJGbldqMFBF?=
 =?utf-8?B?aFN0MThhangzSjVpa2pMNEY0aUwvWS9MaFJtNUdSemxWWVdudHR5QkQxN2lz?=
 =?utf-8?B?RHBLdFZRS1dJYmtKV3FIOTBTV2ZvTElFdERmanF0ZDBFZnpBWjJyUEhmcEZR?=
 =?utf-8?B?STBGVXVwZy9aRlF5czJPeEpQT2h5ODB1akpDWUFaZ2dNY3UrdXJLVVd4Vksr?=
 =?utf-8?B?MkhpSm5TV2MxYWNVdnVZOUhieUJ0UHZuaVR2VkZXdTNJYVFjQU9nYVhvNkZK?=
 =?utf-8?B?MldEYXVrMXpqM1ZUL2lxbXZncVkxOUlTcjNhUWNhdzBMaE5aM0NoWjBqUkVE?=
 =?utf-8?B?dGdXVVBOZzNna3BDZFBVaks4cWR2WVZ4cXpncmxXeXVWTFBjeHRtVGVNQXZD?=
 =?utf-8?B?RGc4NG90SkdaKzVmMlBuODlxVVZQMU43RHdDOEFZU1FsU0M5ZG5ZQzJ6cGpO?=
 =?utf-8?B?cEIrWXovMzBTVmpNMGI4M0xnTkw3NXE4bWIvVEhqWitYTmRjWTNqd0JCbmwx?=
 =?utf-8?B?RSt5WWh6T000YU5lcWlQbE9uZU5LLzZpMXZZWEZKMDhWbFNzQ1JZbVQyY1M1?=
 =?utf-8?B?VXFBK3F1bVdhOUFsZ083RkJTcFI2VWtYeCtoZm5ZT3o1UUJhUFVhcExIZXF4?=
 =?utf-8?B?ODhTOXFsL3FaLzZYeFJRSFpKd2V3Q1JEU1dYZkJ4bXlaUmxCRUdEblkwV3ha?=
 =?utf-8?B?SXovRWVOTElhTzdoakMyRVJwSWUrYVVuYWRwZngrTE14eDk1b3Vab2NUQ3du?=
 =?utf-8?B?MTNwNzFUYk5HNzdjK1c2c2dnYW5DY09heW9Cb2ZzQ0JWOHFrT25KRDZCWDRi?=
 =?utf-8?B?RnE3Y1hwS1IxUkU2YXo3amw5aGIzWFRMY0NQV25EeTNWc1RzcjZVbXFvdWJ0?=
 =?utf-8?B?aWRkMG9VNG95ZDNjaklYS0FyYVYreERrYzd4akpjR05tZ1JtT2FUWE9RYjZT?=
 =?utf-8?B?SVlJNVJxbEZMQzlIaVB2WFJMMFFTL0I1akpXMVNZbmdOV3d0Q2tvU2NmaHFx?=
 =?utf-8?B?amdadEVWVnVGUER3R1JUZ1JLY1B4amdYSk1JRW9Gc0hlRy8rZzkxMEcvdWtH?=
 =?utf-8?B?NEZIRHpBdzl6NDhFbTFmTkhkbk1qZ1QzeWpXY0d3WkVqamxMTTFmOS8ydkF2?=
 =?utf-8?B?Wkt2OUp6dkVkYTVlS2t6eERndHBuNUU3S2RKTWpZNmlUOWUwTCtCTGpYcmQ5?=
 =?utf-8?B?d08yT3RBQWppSDdBYW4xT3RxYkpFU2szY2h3Y3BtSUdhMHRaOHVZV0NFNHUw?=
 =?utf-8?B?Vy9BZm9pT2duaG1uUjB0b1plR1B3U21kNEdHQUJ0TG0zRGlkM1ZFdXdEamlw?=
 =?utf-8?B?R1l5YnJNbWtLL3E1TUE5NEpySkZ1c0x0MkY2M21wMDFmdjUzZko2UVp5N1lr?=
 =?utf-8?B?azVWaGpkZE41V1NIbjBraVQvVmlqMHE1Q1paTk03VFpDa09Ld3lZVlBZVTFj?=
 =?utf-8?B?SDgzR2RIK0xoMy9wSlY0N2JCaW4vM1lkb1ZqTnByNU41MkxmN1BCUXN6Yk9D?=
 =?utf-8?B?bXhsemplenIrK3JuekR6c3NNRHN5QjF4clB3WlFWTGoxWDZhR2N3VzdJZnRE?=
 =?utf-8?B?a3Q4UEhvdGo1SnJFMzUyUmEvQ2xZaDA1U3UyS2N0QTdtOHQ0ZVlFVU9CdlQr?=
 =?utf-8?B?ZnhGSmY0T2lHZ2s5Sll2TThhZ002ck1GNnlQM3ZtUC9RQlY4eHNFazkxSmdB?=
 =?utf-8?B?b0p2cUFPMWRYWlpGN0pDYXgyNVhNcDlwaERhR2dwQlR6TmlLaTMxQmR6S2tq?=
 =?utf-8?B?SExXVEpPVExsMUNjMDBOSzBqWkgvRUVNUkVGd2NKRWprV0t0WkwxRHJZVC9p?=
 =?utf-8?B?elM4VmlacUMzSFUzeElCQUt3Z2IraVhQZmlOQko4T2lFUFBSaktiaTBNaWtW?=
 =?utf-8?B?Z1d0UHZVd2MzRVVrYzBZcnNoL3Fzc05UMVY5RU8vWk9yMEhwVnJRSVdXU251?=
 =?utf-8?B?SEZUUTN0czdIVkZWWVdJTi8wdnNYN3UwYVdiblpmTE51SE9ybmQ3M2JYc0pz?=
 =?utf-8?B?blhmTi9NeElsNy8vT21zdG1uMHQ3UjNNV2VuMkJBVW1VQjNEdzJTQktRNnRF?=
 =?utf-8?Q?Anw3Sz2oal8lIO9/Si907xCy0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e2cdd4-9c15-405f-76e5-08dadcda29ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 07:17:59.6849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xyk11DbJw/Xjv6M+adzVumk57Tb2gVJmNPJ/a8XucOj8K/xPtQKf3wOSbvwPbj3XsHNTfKFzuti3lKJp/2vzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440

On 12.12.2022 23:58, Demi Marie Obenour wrote:
> On Mon, Dec 12, 2022 at 04:19:21PM +0100, Jan Beulich wrote:
>> On 09.12.2022 01:52, Demi Marie Obenour wrote:
>>> This was missed in the initial patchset.
>>>
>>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>
>> It looks as if, besides ...
>>
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -818,6 +818,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>>>      if ( gop )
>>>          efi_set_gop_mode(gop, gop_mode);
>>>  
>>> +    efi_relocate_esrt(SystemTable);
>>> +
>>>      efi_exit_boot(ImageHandle, SystemTable);
>>>  }
>>>  
>>
>> ... this core piece, the rest is merely pure code movement, with the goal
>> of avoiding a forward declaration. If such is the case, please say so in
>> your description. I'll add a sentence to this effect when committing, so
>> the remark if for future patches. Provided of course it is true (i.e. I'm
>> not overlooking any tiny change) - please confirm.
> 
> It is indeed just code movement.
> 
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks!  Do you want me to submit a separate patch for backporting to
> 4.17, or do you plan on doing that?

There's no need for backport submissions except in extremely rare cases
where the backport turns out unusually cumbersome.

Jan

