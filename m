Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B440D9A4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 14:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188430.337585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqIl-0006ko-Hp; Thu, 16 Sep 2021 12:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188430.337585; Thu, 16 Sep 2021 12:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqIl-0006iG-D7; Thu, 16 Sep 2021 12:15:39 +0000
Received: by outflank-mailman (input) for mailman id 188430;
 Thu, 16 Sep 2021 12:15:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQqIj-0006iA-C8
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 12:15:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbe5aea4-16e7-11ec-b5d7-12813bfff9fa;
 Thu, 16 Sep 2021 12:15:36 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-8iVdFdoIOA-mKxuFAPbM0A-1; Thu, 16 Sep 2021 14:15:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 12:15:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 12:15:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Thu, 16 Sep 2021 12:15:31 +0000
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
X-Inumbo-ID: cbe5aea4-16e7-11ec-b5d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631794535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRmqhwUR41eofkPr8SzID7w4eBRv+gV/YQjDk7/DE2c=;
	b=efJ2LBD2Fn2+fopzMOtYGylLJYPZ0pmQDwWULl/YCn1gKA404Pkg7KhHeqtXpaIEHLAKfH
	lkgG/QfXfcdL6fwOTuTeklYOv2ycUYoJb6esDKeKdlFtQJ5SdqrqBuohtXBmJoZ+M4vZZ4
	KDc32YVhrloq0x+59bBlppKalRgazb4=
X-MC-Unique: 8iVdFdoIOA-mKxuFAPbM0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDVOzpsz4uLY2EZcPehdd6W+cPFD1oPWYB/Em4wEV48Gud0YNMD+QYQpLYTPxZWkJ+aWHIWYJeRoravoJz7HVTzJ8jQwzkpE5RE99CrSwb/PgjubAu9MbINlOAeyGzHMEqi4yuNglfLqUmfTNlvr8KLVlyTuJMNFEN/9DB0X1UO+xhnGFa46EUM+tVzOrjUfnzkh0+W6izFZ57VVBJR4G8x7nMYQ7CU2IvVB4DzP6ldvhtecpt1mKJtQ6aZE5FUpQJaN1IY+U//xpc2GOSL+z+6w1rYtq0C+Ud32flIr7IOKpOX2VL9JoS+o872TF3hupvx17i4rTmiiTUDaf5rzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Wwftvcb7mTw2LJsR9vHNEmfugrmfZACJVuXclaSOzqo=;
 b=Vxs7l50EJdoU7LyBZ3F0iNWZwsyV4bMEKuj47uAvnC3/LberLbyRXYb78WFkrUqiwdUx9qlVAYbO7wxzJYCoydPF5dc4ud6DePkRh7zVAI7oGtnkkNtdgZ5KYbnQ6RhvxzgYDo/Jbx1bQyLdSudtmjPgjhx62DpPCc+Z2o0VMK6s4Ieyx83RjwQ7SxWs++2detmsBzZaNmEo0XJfF1yFJEZfa7IT75JGOA+60CkNrlLCsToLcarvW1uYPvQZQiyaofqKUtedVM7ctWB+lmz5ZLEPWNAWugQ49Mst+K84lTiRpAsM6Xo5EezonzpUILQNDycUC5/4CTRpDIiDdf28gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
Date: Thu, 16 Sep 2021 14:15:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43906351-26dd-4654-6f82-08d9790badef
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119745041485673539202D9B3DC9@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KeNXqxX2ugHif5tCK9mCyjnOHloLvz9PDGO+Po8XNa26KtWJ4BvGmNb6eUapujK+ZsujYocnuU2ysp2WA5MveLSrb2nnktmcZw9m4WYQR0Qj86UWU0yHMC8tlkEAiFO51Oqfo3/X+pOJIQ/HRX2hhIVKxkiBcwYWwWFvF4ESlw3M9t8jUmmJzmIuYa0v/F1fqClz7IoDQj6M1W/39yFg22fobyEbgeOaeKaMtr2drcXmtR4YRWX29kXtVw8ygGml+RbBEM38yIAPqwF4O2O0FU1NQFvFR3nYtq0q1kEYUTwN43528aEsv8onY5voM7WGGaIewY43f0NuFROclGhgKYXQJHUFA45SLPnopJRzrld87BNFSp5e/u5QcX3PSfi2rfdfqeNNgQFD0Qf2S/QF+hlwKVjGenSq/hUrrMP4qAXLkjxwGOE1SagFJen5FFVR1Pa+4x1HbfQovLneNF/cgNCl+nRKM2psKLe8dZ9BG4VkRJ5yhT5sNWan6yLlcGWWkFa/sohSK0vw5BktfCbj3jZrMiqjf4ovDs7aZbVf+SY05zZA4afaA8c3r6TxTtxOSWqy3sN+w+vzt18UDH3tDk1Xr+wx8si0Py6CW4lfpyqbJyznYhB/u6itv0Q5FaAV/fFQrN78DnuKf7LrV54P226a7eLBEpzlT/8/+RsCr+tDti6/QyRyhkiIE825gq8l5th9+DDUn/Gc/bZ89OwJ1TdlvWyM8Oe0Y2tGxuTapyUZZO8/9ynoYKcACjUR/z4Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(26005)(4326008)(86362001)(31696002)(8676002)(186003)(16576012)(316002)(38100700002)(7416002)(53546011)(54906003)(5660300002)(8936002)(6916009)(2616005)(956004)(66556008)(66946007)(2906002)(66476007)(508600001)(36756003)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e6BYLD6d0QdWOqxWrlStgh2iZLtuDboiDeK81uS/WWsgAn7GI6IPTX3McIHh?=
 =?us-ascii?Q?n8qwOx/TmSZwe79kzoHmnH+NUOS/yFoJCw0Bp0smGuifvyny+v22RzXhwU0Y?=
 =?us-ascii?Q?sP1ThlVm9Q4h9AesneHdpCEIyMo6syUF+9+xb7IA5fBrHfbE4PVGtU48htCU?=
 =?us-ascii?Q?9N3O7oi6difoamqwxOssojjkpORXCGd8yfX7xO9KZzlxV1mKQ9LJbrJGGCUg?=
 =?us-ascii?Q?Dz6WvwNQ11aU1SjClbwa52KoFz+lqhy4QCVZUwOT067piRbZrJQhiFI2SpPf?=
 =?us-ascii?Q?BuAHgmPqH2L8r25VhVz5dglOYLNJ5X3f+YTfCEQoLxxXf+nWxpzVE4S84CaH?=
 =?us-ascii?Q?LLJNI3ed7xTEI4dVcUuD2xHSKLYvZuadb+3+CtfzjO6mqqhwseeAYcYMXoPW?=
 =?us-ascii?Q?dBGHta1mjKIUl6OPVbEVzFyxLHiN6DhKe7T3diRhbjrLlJzC4RXQ4+K3EOzF?=
 =?us-ascii?Q?y5MzA5rDqNgka7QImgWVWbWu8fN0caq/EkomR2KWpZxk25OSjcn92t6YEvdY?=
 =?us-ascii?Q?qMDcwHXHuKHb2zT4LZ1FIEOPms20NkzV33KQ6EYzUr/wb7bV4hArMgxCHsfW?=
 =?us-ascii?Q?RpvzH/cpfmn8eEervls+yWPAEsXi04dZEGmUBvC/PpU6C8pRA3IysmeG2KXI?=
 =?us-ascii?Q?3p53lbBYpCVV92Gwe0ZJ6W4PODnbCP+VtGOADz4CSo9y5wcHTeC2AJqs7vi2?=
 =?us-ascii?Q?dziFXEKaqK0H9ZGOFd6etgOgJLt9GzPrO2Jctto7JtvdgB6m+D63EDBB5LtB?=
 =?us-ascii?Q?+Ljle83IZ9irpZ+QcaKvG0TH4hoMCRflBGQ9Whfcpg3G2CSVacv4+TOHN2pR?=
 =?us-ascii?Q?/5Z+QMOLRSNU6+EpL/US7EC1GT54enH8hx8VQAYCUuaclqu+lGcplSraLIuO?=
 =?us-ascii?Q?ajvWOg1j8pLAivEk3xhlkC2y+38S8Tx9RsEOtcYAvO+basb8BXv0lCfmLkb5?=
 =?us-ascii?Q?SUhIGVW3J//gDTJuJwcuCCGKbL7c+yFZ29S/+bLT2JHOWWgleXuNbFNBGhdw?=
 =?us-ascii?Q?bHcsxE8T819QjNkxmTFTZ0lge7yg8U9eBsBuMeNEVZfHPhplux9VzWlnNHYY?=
 =?us-ascii?Q?CNOo+/X5W3kC7aSxaJVyTsGqMjFHqeOw1gX8cbc9z7aa4RYJUSWXKQeuy8Gk?=
 =?us-ascii?Q?ltkTd5F5zRADGSI698CNSKJF6CVMLBpwcqsg97GRG++QtTnGvjFIDr+ALDyn?=
 =?us-ascii?Q?qSU+GZv/f8OqVJM7HKDU1LHEymE5OIoiPuMcKHL0wblxRSLz6bq+wIhRpwdi?=
 =?us-ascii?Q?AZUz/m0rk6rjQyg6HRJQaSoLJ8MiLfPV2JfAAaAtudDoP2nrlih9ZBOATSmJ?=
 =?us-ascii?Q?Ho/C7k7Ys9HVTwdglu8v7T+A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43906351-26dd-4654-6f82-08d9790badef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:15:32.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh1cgEOoa68xeFWNiZ+rVJoYUIXaxjVi/2FoOhiTx/KaHy6SnpxmTGlkV1Df2iimGoNyL176px0dBPEWLaHqjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 16.09.2021 13:28, Luca Fancellu wrote:
>> On 16 Sep 2021, at 09:46, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.09.2021 16:26, Luca Fancellu wrote:
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -8,9 +8,39 @@
>>> #include <asm/setup.h>
>>> #include <asm/smp.h>
>>>
>>> +typedef struct {
>>> +    char* name;
>>
>> Misplaced *.
>=20
> I was looking in the CODING_STYLE and I didn=E2=80=99t found anything tha=
t mandates
> char *name; instead of char* name; but if you prefer I can change it sinc=
e I have
> to do some modification to the patch.

I don't think it's reasonable to spell out there every little detail.
You should also take adjacent code into consideration, making yours
match. Issues only arise when there's bad code that you happen to
look at.

>>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
>>>             efi_bs->FreePool(name.w);
>>>         }
>>>
>>> -        if ( !name.s )
>>> -            blexit(L"No Dom0 kernel image specified.");
>>> -
>>>         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>>
>>> -        option_str =3D split_string(name.s);
>>> +#ifdef CONFIG_ARM
>>> +        /* dom0less feature is supported only on ARM */
>>> +        dom0less_found =3D check_dom0less_efi_boot(dir_handle);
>>> +#endif
>>> +
>>> +        if ( !name.s && !dom0less_found )
>>
>> Here you (properly ) use !name.s,
>=20
> This is not my code, I just added && !dom0less

Correct, which is why this is fine.

>>> +            blexit(L"No Dom0 kernel image specified.");
>>> +
>>> +        if ( name.s !=3D NULL )
>>
>> Here you then mean to omit the "!=3D NULL" for consistency and brevity.
>=20
> I usually check explicitely pointers with NULL, is it something to be avo=
ided in Xen?
> There are some industrial coding standards that says to avoid the use of =
! operator
> with pointers. Is it important here to do !name.s instead of the solution=
 above?

As you can see from neighboring code, we prefer the shorter forms,
for being easier/shorter to read.

>>> +            option_str =3D split_string(name.s);
>>>
>>> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_st=
r) )
>>> +        if ( (!read_section(loaded_image, L"kernel", &kernel, option_s=
tr)) &&
>>
>> Stray parentheses.
>=20
> Will fix
>=20
>>
>>> +             (name.s !=3D NULL) )
>>
>> See above.
>=20
> Will fix
>=20
>>
>> I also don't think this logic is quite right: If you're dom0less,
>> why would you want to look for an embedded Dom0 kernel image?
>=20
> This is common code, that check is not from my patch.

It is you who is adding the name.s !=3D NULL part, isn't it?

> Before this serie, EFI boot requires that a dom0 module was passed, other=
wise
> the boot was stopped.
>=20
> This serie instead removes this requirement, letting the boot continue if=
 there is no dom0
> kernel.
>=20
> However (as in the old code) if the user embed the dom0 kernel in the ima=
ge, then it is
> legit to use it and if there are also other domUs specified by DT, then t=
he system will
> start the dom0 kernel and the domUs kernel as well.

This doesn't match what I would expect - if configuration tells
to boot dom0less, why would an embedded Dom0 kernel matter? I can
see that views might differ here; you will want to write down
somewhere what the intended behavior in such a case is.

Jan


