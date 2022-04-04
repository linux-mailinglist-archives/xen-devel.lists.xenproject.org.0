Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA164F18E0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298432.508401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOyw-0004Xb-IT; Mon, 04 Apr 2022 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298432.508401; Mon, 04 Apr 2022 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOyw-0004V5-D8; Mon, 04 Apr 2022 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 298432;
 Mon, 04 Apr 2022 15:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbOyv-0004Uz-0m
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08475cda-b42f-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 17:51:03 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-MmQ10txMNsm0s9qfCCmRzg-1; Mon, 04 Apr 2022 17:51:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5520.eurprd04.prod.outlook.com (2603:10a6:803:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:50:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:50:59 +0000
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
X-Inumbo-ID: 08475cda-b42f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649087463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARFGu0yX/v8BfWGK/f0iUvDFJYiKkJSpJA8ULoIMzD0=;
	b=ROeACkGPgtwSx1JUXupIR1r3nRnypHXZtEChys0xohWXB/E9gILZpTg4iknNo5xHfy2/ll
	9MCVSaWah3KmpbCf9j6+llsddeXVhJSUhoIXSqSOcpcjGPmxvETsHMqLN3Pe0OEakFhw4q
	ETydl7AoX4rlVVfjKTP+ZuWzO26ICEw=
X-MC-Unique: MmQ10txMNsm0s9qfCCmRzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNlUMV3II+s77LvRQ4WenznMHtay4HW7t9iqVjHq+/WxgEIxZhbmuhAYg06Y4wuODP7rJymJ3ZJEsIoYN7E5X5ZWDFZiFB+DmyjuKw/VIbRQsFSI5kaaS/g/1lfn/97fv0YQ2mvwkdD1jBlHW1M1DVPWVZCKA3uNxzYoyxWcQQqvVOq3Paj5JHOMId65ZJTwioM72/SLpfY9JFunpx54utbUyuer4E2+vT621WywLHrNHSEq4G3kaqR89js/442G6cSkBqkg7jlktNiay1Hv4YWwo5jjOFIuwOcQHlYvSAALvdw8iCkPOBbkLJDFU/O1PE0Z+b8n69cVEp74iQVdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/kRyZAouxKhyufkdxuZDL1nBfdiou+8O4FXFXLoL50=;
 b=Xg1w6xjSrjyI4b/v0LU8JssTKk7ZiHzYEO4JcpBx2UkdSBYp6/GDo+x4OBQJAqPfSD+4/1epbDRbGEIf69xuxjL4IxFmsiNotqeFvh1MtUK8tKLIILLcz2lXHoB7pTx8OpgNEgjNgy9W2pzmjkDX6MguZTxhmByiz1yXmkp9G5Ycg/SSmYxeL7ZBPEcDvvLHd9ttPktgQjEdMkxBz9/g/k9vU4ZnOHFfPUGCqlNEXoW+mNkG3xs2W45ePrlmIRjymTa/AXEnp9RzKJG4KdeID2/ek8mN6QVOEoFVrOvY8ksDksiQo4DzFZNSUQUNAq8fNLEG/x12HPb5tnb/j4LdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aca0954d-e235-4b25-458b-1183a7471b12@suse.com>
Date: Mon, 4 Apr 2022 17:50:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YksFeCB3bcXBGfDe@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YksFeCB3bcXBGfDe@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:206:14::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e61c3fc-9717-41a4-65c8-08da1652e9c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5520:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5520BC85EF38C06A74B87A4EB3E59@VI1PR04MB5520.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7rpU/2gVKcAODX597FK/HOoclhJLIjOrzZbFISva1JdcsN2tmUODMz4ZGQPeHR+X5UQJA4dWpX0+FlP62CsfC/D0fWTcTkIkaGJz2tdXr69gNKfOqPaJo3DdSpCIkFilx4L3xUVklWWGXi/D5tKTKvJ4UMoqt00fGKbKhPsxxiCWmtl5xDbSXaV6pjAS7O1nkZnJjaxtEXD1eJv+MnUyRTcg6r/tCAxR6f3kHc0ogeiUlg5g/Yrf+CiOMRieR6ODay6kAl/iMd4qZRfDn2csb/n/o4PqQISw64bMzDYfTl+h5Mpo2JMwkpl6U7RHt3SVn7oR3cXSeJ2t620oy4e8EafuA/t81U91bllLH4GPKIuOURLi8YZYemupEq3WqvSNrR915az2EfaG3j708flzlbyTHIM52DRRHkzFr+emuUjajaezZRhYWObFT7PmaT3nhNUt52CA/ssawpoNIkvoiHZncV2RgEMmb7OBi9rHoexvtPDps0RU2ie+DDpWrSIRiwY+tttGo88vJOVy8+ds2ATJPvOgpiXZlSy5zLVBs5lpzivp95DucW9C9KudRmDLCXKQR05AN2OgyGGxCu33FNlTbOxdRFQ+ZRGOHTlygc1S2EBRVUbxYEsh3DVBC4RV1pal81vhuqw7VNqI08gWsjW+vsKXl86d6aTXxxt1mkOSqE1cuCb624KJWbhR3Fik+UoEIED5de+UnQDpi+BSWVuvH8MG+wtKk6QUx0Fc0BSryWXtz94sq+9RdHXiBWgi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(2906002)(31696002)(8936002)(86362001)(36756003)(5660300002)(66556008)(66476007)(6916009)(2616005)(66946007)(54906003)(53546011)(6512007)(6506007)(316002)(38100700002)(4326008)(8676002)(508600001)(6486002)(26005)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O88/iGxR+ZL0TxXkFiZR6DPzsrdEPqvUklaAG22Xle+a/r+NV5P/NAuTj+pV?=
 =?us-ascii?Q?y9znC5IwNpQOBwh9TxD/ISuQnAo0QCce4n+xCzRI7ZLd1d12r1duRS/093Dj?=
 =?us-ascii?Q?IGavhi+0R/sdVFtaV7Pg+pRHxUkHJ1CIukdM2RlRxD5PiVFsngz1Gq82e+Mq?=
 =?us-ascii?Q?wesw+ED5vOINhKTp2FhhfoEUgFtDRwzVaBcgHgK9piGAIQ/dXfT8EcwgzySU?=
 =?us-ascii?Q?V3ZyseN+X9cvIBNJtNKvNUNN+QwNKslVPDQknJeCD5vwQqo8Fywj2JMQrdFU?=
 =?us-ascii?Q?N3w5mbyCFLGR/r6H7MVjLwRU6MY6RhcXRXc3Aazsfaw8Fbyr/2plr7wWjSso?=
 =?us-ascii?Q?2GdsFGBKQii9pxlcAJSaVBrCN/o362l8L1X6qPOQUar0qgTbJ+4bzQ+XXVlD?=
 =?us-ascii?Q?OeKbmQwrQpHJY96ebUjJUwoH7A4YZBfoFhxKKAKRnWdbjfB0S3m99FMUbN/o?=
 =?us-ascii?Q?jQFS28dEu+JcHXz/erhg28HX0Fq5VeBccXEWU8YBRYLJcvhMm5/0CwPaLT4V?=
 =?us-ascii?Q?n/PA/8MC5aPh9lsk3WwfQfttC69olJ0r/W9K6egzX0TKpZwbxaaWMEyx9Lp8?=
 =?us-ascii?Q?qoOJtu4kFX7BjvFvVN2eGTt51sNmPLOQHsoPSnCO1qcEmP8KxupgdkTGiEqF?=
 =?us-ascii?Q?/ycoIN3TH8CGtrC9mZ7ISbvKyV7jAnl2aBzGkNYhA26tCHFkUDuot2ux2LTI?=
 =?us-ascii?Q?ZMfbUG9+DD8mTaWMwaOmnQXnlLMox8ibOATz5QmCWHrWRVdDoMetmFTWzjSY?=
 =?us-ascii?Q?dCC+cX07a6pkJ9nvsZQszDFW4HNdR9xy6/l37Gvg3XUGBWZUDhuqlYSKJE14?=
 =?us-ascii?Q?AroaKRyiLm26Udp5it3DLHR0guil9c1gwlSQQmPHSNDL06IK3PRjf7moldzE?=
 =?us-ascii?Q?qURQhEuY+NKozkyKp+domdHTuQBmVC4SWmqEziV6WEa3QRDbvXZp+VM8JoLj?=
 =?us-ascii?Q?Wba+VelcmUz/jyJmjNKozUch6yRoCm02kzCGptmvQlXFQWy1fAsWM2citIX4?=
 =?us-ascii?Q?W7Xqne+ZLZlYH6CTTw5ynCn2h84j2S4BwV6vzU0nDr21PsO2WptiPCRXHZtM?=
 =?us-ascii?Q?PM/buCHn1ahWq9pZcHUw5cG5Y0mP5suzlLa5x3fbqHj16IaA72lgofCqti1M?=
 =?us-ascii?Q?o+xKfeAOg5SLEuAyW8E2E4/4LBzJwQg5vy/Gke9SxZbIo3jwrNTMI9XA8XIY?=
 =?us-ascii?Q?FlUeWIZfdm8zI2p3jVZHRnGCQSThovssqk5cLi8qNI+3JAwlW6KaqlmkBxqn?=
 =?us-ascii?Q?LtVjlR2CwoWm6IZBJR8PEgR/p3iHriOgAixt+VaMEdGzivtoUWacMdxQqH6R?=
 =?us-ascii?Q?PtbAEzaCv8Zrxjcb1NOnf4voBewGsx69MEhK9l3hXn9WakyPRepZ4WJHyZTf?=
 =?us-ascii?Q?HQa5eCxf6EReEDRSkt7VUAq6rGqqFN0OO6iUGJbuP40EOlOKbaB/E5cn6WGD?=
 =?us-ascii?Q?GghRZO35HG64CBEuVXJfLCK22i7FJ1F0lbrEKUHslj5kFxTgaG4YIb+5SVe5?=
 =?us-ascii?Q?dnYxNiIamrKPBpVP+6hf0/4KMtyfYjO69uFq0pK/VRXYQCwnyQLRH8IR7xMd?=
 =?us-ascii?Q?F/IK9o1uV/rPypD1QgY9VMLJkCetVdO4ltWdpTY3juc82P8Xslka47jY3HUA?=
 =?us-ascii?Q?IYPDv4TNFwgtrhdz+EuV5DHNZivMII4n3/FM6IlZWUT+7icRAxgwEC+M/JUE?=
 =?us-ascii?Q?DST0PAhja+JE6jLNeRfwkdGkSdm65fUBs/Mq9vhdYYsl81xnUvE3d23NR1mG?=
 =?us-ascii?Q?MBcLR7bZAw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e61c3fc-9717-41a4-65c8-08da1652e9c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:50:59.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJ4KcJMLylbImEH5VriIurdMYjMqFy85zTlPE410O93Q80JTM84MypJ4oSFp2nbyQYaQ76pURAi4cG/6cMs+FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5520

(reducing Cc list some)

On 04.04.2022 16:49, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
>> GrUB2 can be told to leave the screen in the graphics mode it has been
>> using (or any other one), via "set gfxpayload=3Dkeep" (or suitable
>> variants thereof). In this case we can avoid doing another mode switch
>> ourselves. This in particular avoids possibly setting the screen to a
>> less desirable mode: On one of my test systems the set of modes
>> reported available by the VESA BIOS depends on whether the interposed
>> KVM switch has that machine set as the active one. If it's not active,
>> only modes up to 1024x768 get reported, while when active 1280x1024
>> modes are also included. For things to always work with an explicitly
>> specified mode (via the "vga=3D" option), that mode therefore needs be a
>> 1024x768 one.
>>
>> For some reason this only works for me with "multiboot2" (and
>> "module2"); "multiboot" (and "module") still forces the screen into text
>> mode, despite my reading of the sources suggesting otherwise.
>>
>> For starters I'm limiting this to graphics modes; I do think this ought
>> to also work for text modes, but
>> - I can't tell whether GrUB2 can set any text mode other than 80x25
>>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
>> - I'm uncertain whether supporting that is worth it, since I'm uncertain
>>   how many people would be running their systems/screens in text mode,
>> - I'd like to limit the amount of code added to the realmode trampoline.
>>
>> For starters I'm also limiting mode information retrieval to raw BIOS
>> accesses. This will allow things to work (in principle) also with other
>> boot environments where a graphics mode can be left in place. The
>> downside is that this then still is dependent upon switching back to
>> real mode, so retrieving the needed information from multiboot info is
>> likely going to be desirable down the road.
>=20
> I'm unsure, what's the benefit from retrieving this information from
> the VESA blob rather than from multiboot(2) structures?

As said - it allows things to work even when that data isn't provided.
Note also how I say "for starters" - patch 2 adds logic to retrieve
the information from MB.

> Is it because we require a VESA mode to be set before we parse the
> multiboot information?

No, I don't think so.

>> --- a/xen/arch/x86/boot/video.S
>> +++ b/xen/arch/x86/boot/video.S
>> @@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
>>          movb    $0x01, %ah              # Define cursor scan lines 11-1=
2
>>          movw    $0x0b0c, %cx
>>          int     $0x10
>> -set_current:
>>          stc
>>          ret
>> =20
>> @@ -693,6 +692,39 @@ vga_modes:
>>          .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
>>  vga_modes_end:
>> =20
>> +# If the current mode is a VESA graphics one, obtain its parameters.
>> +set_current:
>> +        leaw    vesa_glob_info, %di
>> +        movw    $0x4f00, %ax
>> +        int     $0x10
>> +        cmpw    $0x004f, %ax
>> +        jne     .Lsetc_done
>=20
> You don't seem to make use of the information fetched here? I guess
> this is somehow required to access the other functions?

See the similar logic at check_vesa. The information is used later, by
mode_params (half way into mopar_gr). Quite likely this could be done
just in a single place, but that would require some restructuring of
the code, which I'd like to avoid doing here.

>> +        movw    $0x4f03, %ax
>=20
> It would help readability to have defines for those values, ie:
> VESA_GET_CURRENT_MODE or some such (not that you need to do it here,
> just a comment).

Right - this applies to all of our BIOS interfacing code, I guess.

>> +        int     $0x10
>> +        cmpw    $0x004f, %ax
>> +        jne     .Lsetc_done
>> +
>> +        leaw    vesa_mode_info, %di     # Get mode information structur=
e
>> +        movw    %bx, %cx
>> +        movw    $0x4f01, %ax
>> +        int     $0x10
>> +        cmpw    $0x004f, %ax
>> +        jne     .Lsetc_done
>> +
>> +        movb    (%di), %al              # Check mode attributes
>> +        andb    $0x9b, %al
>> +        cmpb    $0x9b, %al
>=20
> So you also check that the reserved D1 bit is set to 1 as mandated by
> the spec. This is slightly different than what's done in check_vesa,
> would you mind adding a define for this an unifying with check_vesa?

Well, see the v2 changelog comment. I'm somewhat hesitant to do that
here; I'd prefer to consolidate this in a separate patch.

Jan


