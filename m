Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB554F2917
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298601.508705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeg7-0001dz-TW; Tue, 05 Apr 2022 08:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298601.508705; Tue, 05 Apr 2022 08:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeg7-0001bx-Q1; Tue, 05 Apr 2022 08:36:43 +0000
Received: by outflank-mailman (input) for mailman id 298601;
 Tue, 05 Apr 2022 08:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbeg5-0001br-T2
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:36:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8396687b-b4bb-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 10:36:40 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-dbij_fAPMk-KUaycs_s-_g-1; Tue, 05 Apr 2022 10:36:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5656.eurprd04.prod.outlook.com (2603:10a6:20b:a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 08:36:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 08:36:36 +0000
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
X-Inumbo-ID: 8396687b-b4bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649147800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmyRIpl/q4fWYDu76ZO+S4r6GStZphPjCKQCNFKzn7E=;
	b=aZn4drC5YWQm2hyBUhwr9fW4qAf+RgZCWttL0Kkn5ZzUC+gIukYN7psnKsc5ksF6FoTLJE
	yBMB/o+tzQvuFaLxRfbRcJzvXbL3kFM7FFoX7GjT6MWOFV7YkMCT/oRkXY7IadMo2r50gJ
	rYBwMjvFdrBsbLqPCAf68E3zzs30AuQ=
X-MC-Unique: dbij_fAPMk-KUaycs_s-_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmUZptHR1/R0/o5YIGwjZ+6fln/YMIa1ZdMwYkTgmVpmYO3rBIFr73aWPKy3fBDKiKyHw3r17obY75Dc95DRTobU5RwMjEmBSnNw6i6Ok9dXQ8FWinUHQ8YFbxQDoDxF4JqXf4p/cTm2Uh95ARde5VMBoypzel3ojGBxTF3SaAR+O0R3C5zsNim1zEnUkWkb0Cl1t3zR2KWRCbGxAJE513c/+EYFNLIODdgJoXKD/HPNQi3OiBzLdp15sTcrl6Rp0xaNcRBk4lkUOG1TpkKnX/G7YQ61nRNUZY+JALLxtNe7FT5cdji9BveWcC68TTl6zt82Xqye4l/g8odOmPhpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yk0fV4nj4m406HYCG/W4dHjIJKapYN2w3JVb2ycNGbQ=;
 b=Af9Ur295PC2uJ5CAJTsVRqdCeskByauSm5iu7ukATZm4jD3OsKYJyt+cAClXx7nZrZp9kLAODQo9zPK+2rO5NRW4jCZnZQB6fVgQnAWIs8qePtWhkC8euERmPiSQOVhMcQKMLVLNH82g7SDtK2uoF2eFNWO1QSmsO6/P2qg+E8mnke75l70NYNcGzH69ihNDGR81mSmaJDesX7RrD5zmht/Y2J9hk6VkqkzUTibh8PmKmr1BA0IHEdivshoDwv0VcND1pNblND6KocwLKbOGnoH8HisUmoy9v5d4H0lXqIkBwRF3Yx/MIcZBknKWwufGN48ZQUyhj5sAMNusYc1jqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dba31d91-5a5e-8ca3-5d10-e6425b0da9bd@suse.com>
Date: Tue, 5 Apr 2022 10:36:34 +0200
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
 <aca0954d-e235-4b25-458b-1183a7471b12@suse.com>
 <Ykv80Hgqp2oxwZ4S@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ykv80Hgqp2oxwZ4S@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0201.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b497855f-c518-4c8d-845a-08da16df6588
X-MS-TrafficTypeDiagnostic: AM6PR04MB5656:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5656101907110D4952D829FCB3E49@AM6PR04MB5656.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PM14fVuH8t3yiysA8ZtYwNNJAw2qHz8Nv3/bWBys5GhvIFSPPkodsLRkGdemPD0syEYtgBJmvyf3tbTZWG98+8Q9CAVe2gOdJ6vyefwRPW8And38sxfMZf80Ys3iwlpVPdaPHzNh8GqmhRJq6okvR5LMYsM5keBeIzcsd61DPevM/vQGLt1FsiVDANJgZEHAapPUNY0gh0nZwd/GlJe+AUTiL+udDEblwxomrQCpjoX0BzxywtN1ACGC1HTZHCeGJ0SVZBQXrY0RZtxSuvtWqLhY+iFf9ijYlp/AQTPomgvjC3TVztiUkN4tOQl+dsBd2HDPJ5gVRhT2Lz8PpQbpinxlvEuLe5biTxQA8OgTkjBMsaZZ/VZGtj161XNvk7fl5v047lnz8yvI1LwloPuyghapmWgVlXA4pCXLvMYIb9itWJk+ISygh79/JXdRdcFAb4jV7XxraMV5T8YCOiI2/ebxULfMjdit8wz9Gdwx1c+JgFCF3PJeH79nMYn1bGYeJybwkwnURAT3LEt8t2SmWYWDW+8MR9/VlVE9BoCkzXC9nZYD8zACbSC3PLJ66rHX7E3AZLDwi71yPSRWgmYSHK4sNcRO6Ph1Ppy3gG6htU9dn2HfDVKeKnVGF9m4GcnPhKS4c5ScVX+0IG/+6iVVCSAjRFmBSng+roU9xoyBS6PTtWN31w2Lwp7ZhTNSFPStWtKnZXTP7szhaKkdWfOcT0ZLJLvcpc83prtbiCzNNA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(66556008)(26005)(66946007)(83380400001)(36756003)(186003)(2906002)(8936002)(31696002)(38100700002)(2616005)(86362001)(4326008)(54906003)(66476007)(5660300002)(8676002)(508600001)(316002)(6916009)(6506007)(6486002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7DLsbhW45jINZLn264D9P5Tou5lv8DO9i1pBfRRwJR8nsZ+3aHTiFbzSfROK?=
 =?us-ascii?Q?nBvV2FW6Lsi7CpUQE071jNCR2VrCyih5T2JxB9i7UhakB7jPcLQaidD0zLmX?=
 =?us-ascii?Q?5T0gZMekWQyuob5jIn1elv/s2Zh1lP0h0lonRIu4qTZeChyrYAdxgDl2f9nw?=
 =?us-ascii?Q?nHrQKRekcP83S30FhcdwR1Rx+t7poNOo454LqUyz2/ifR6p2KnH9OQ8bfEXZ?=
 =?us-ascii?Q?nMOIkS7u1c0oIotHxbFMslubRxOERC18BwCWiHTEkFUvSk2FfHDGnOvKM49d?=
 =?us-ascii?Q?1XXsz40mMn9NyWrL6cvdQeI1HjQAnztBsW2ONa4t/cwhi5WYHWtPoWLRVmSR?=
 =?us-ascii?Q?OVkAbsNLviEWWj8DbpCdEilFHiFTmTEA/AuT/Frug1WSUYxOkehJ3CbGleb3?=
 =?us-ascii?Q?z0alS+T0ExN2UgrHAaD9i2O4ytMX3jg7PjSR7o+9s9rVZpLeiOtF0uc31aau?=
 =?us-ascii?Q?gPjJXr96eV4kZKpLzk1goP6xeoj/ugH45u6Rn8aqzQZtI4C3kEKDP9sy+/9M?=
 =?us-ascii?Q?lvMB0H4DoVji6kjSa7IDgHU1fxxmjKr/k25jRm8Savkq2LHvie97ViHSGVdx?=
 =?us-ascii?Q?SwLStZjL0LRDFcIBqDFs0A9IAnPva9xWbPQbRrmOTe/CZoGC/5oAOlXrMnei?=
 =?us-ascii?Q?ggq/yOPJ+/X5diwOdUHXm9Tthsqkg1m0HkgWJmc76UzcpJZ+r+wdVc8r0aA8?=
 =?us-ascii?Q?m746D6KfvQaY0UBdtGEQwxmgeTbFzdiO9lne96XzF/cK1bLj0Y1R16cHSjfU?=
 =?us-ascii?Q?1eUk9BuxowLCOGwONe5nG7SsgU8mB1w3ggJRHzVkuadfOl8t4nzlB1ot/SpQ?=
 =?us-ascii?Q?o8rENAnRE7+p5l6lXtUImYBEvsYieAZsyf9cezisxom+Nc5IyhThOOuqGCnY?=
 =?us-ascii?Q?wjDapZY4RZLyCZo48xBoB/8K0pd5UvZ8lE0g+bKQAX2CBkBwhCq/YkZCohX8?=
 =?us-ascii?Q?mxa7WHf4qQ0pByyq+Lf24I9LsOSgMPaROtdY3keVC6QS6eoq/ZEafV986+AH?=
 =?us-ascii?Q?8P+trE77pNkZwUoSkHjADFW0yHs1XOh54t9lIjAUJUPkXg9rmUzpHVmElFv5?=
 =?us-ascii?Q?h7afHcYpKIx1i7mGUoEqUgHLpDmKWkMuMz4SXa7lhsgIB1CQnmM2BoCMuZA/?=
 =?us-ascii?Q?zw/4k0l0QdCTIObAozuZowlCv++8UmLWH7Mb2wPiyY1NN3t8ldZGoJmDLM//?=
 =?us-ascii?Q?NAhsE9xficpIxtz14dfmFrtq1Fv5CKnUi+9Zm7t5FBAkjdoV+EJFs/dMgEv9?=
 =?us-ascii?Q?FCfbwmrqiUaJEisXgN/1yFEaoPneDoDEbZ+wuhfcB64N650mQuN+lIZDZvnR?=
 =?us-ascii?Q?eJ6pQ2CRZ2U4BmEmeh4hkN/mDPZDVo4nUebaFQM9W8OBbYWN6yf3InmjvVZv?=
 =?us-ascii?Q?6R2Krz1L4MymVojYwirrJgN8B274p2HU3nrxBGIF7PNnO59007Yotbi0X0Yi?=
 =?us-ascii?Q?9F1sA393tsCI47LP3vYFjEfbm/JXBDT7PJM4ldp5jALd18ZY/EI2AK+TbEeP?=
 =?us-ascii?Q?b/JldL55yD6QSdHwqGD2JiL+iVod+MtY6Dx6gBPQWaX8gPbxa27ln4fATaO/?=
 =?us-ascii?Q?wXwNOoh57Spxa5NyoZ2mMvG+bvWV38RUddrcsOdg3EUXZMZKZ5y2qQ0r/iq+?=
 =?us-ascii?Q?EpKzdyQ6Jj+wj/ME/DSyiAZ5uRi+SGHsfu44A5Ecot74a4Ua5INEYKLrkTFP?=
 =?us-ascii?Q?4dRxrzFldMzuLSWJxESFjTM1Ma8j/zr3cfJOqyTpDdOno5m/K7l0dJL9NL5+?=
 =?us-ascii?Q?po3Dn7OyLA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b497855f-c518-4c8d-845a-08da16df6588
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:36:36.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LriHExCgSLfUg2PPfMpQPbnExVErCxyj8y1u0I9XN3wAQYKoGAXW63H3yh87sefNf/8IjtaqDEcmW4MfZvNauQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5656

On 05.04.2022 10:24, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 04, 2022 at 05:50:57PM +0200, Jan Beulich wrote:
>> (reducing Cc list some)
>>
>> On 04.04.2022 16:49, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
>>>> GrUB2 can be told to leave the screen in the graphics mode it has been
>>>> using (or any other one), via "set gfxpayload=3Dkeep" (or suitable
>>>> variants thereof). In this case we can avoid doing another mode switch
>>>> ourselves. This in particular avoids possibly setting the screen to a
>>>> less desirable mode: On one of my test systems the set of modes
>>>> reported available by the VESA BIOS depends on whether the interposed
>>>> KVM switch has that machine set as the active one. If it's not active,
>>>> only modes up to 1024x768 get reported, while when active 1280x1024
>>>> modes are also included. For things to always work with an explicitly
>>>> specified mode (via the "vga=3D" option), that mode therefore needs be=
 a
>>>> 1024x768 one.
>=20
> So this patch helps you by not having to set a mode and just relying
> on the mode set by GrUB?

Yes, but it goes beyond that: The modes offered by VESA on the particular
system don't include the higher resolution one under certain circumstances,
so I cannot tell Xen to switch to that mode. By not having to tell Xen a
specific mode (but rather inherit that set / left active by the boot
loader), I can leverage the better mode in most cases, but things will
still work if I turn on (or reset) the system with another machine being
the presently selected one at the KVM switch.

But yes, beyond the particular quirk on this system the benefit is one
less mode switch and hence less screen flickering and slightly faster
boot.

>>>> --- a/xen/arch/x86/boot/video.S
>>>> +++ b/xen/arch/x86/boot/video.S
>>>> @@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
>>>>          movb    $0x01, %ah              # Define cursor scan lines 11=
-12
>>>>          movw    $0x0b0c, %cx
>>>>          int     $0x10
>>>> -set_current:
>>>>          stc
>>>>          ret
>>>> =20
>>>> @@ -693,6 +692,39 @@ vga_modes:
>>>>          .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
>>>>  vga_modes_end:
>>>> =20
>>>> +# If the current mode is a VESA graphics one, obtain its parameters.
>>>> +set_current:
>>>> +        leaw    vesa_glob_info, %di
>>>> +        movw    $0x4f00, %ax
>>>> +        int     $0x10
>>>> +        cmpw    $0x004f, %ax
>>>> +        jne     .Lsetc_done
>>>
>>> You don't seem to make use of the information fetched here? I guess
>>> this is somehow required to access the other functions?
>>
>> See the similar logic at check_vesa. The information is used later, by
>> mode_params (half way into mopar_gr). Quite likely this could be done
>> just in a single place, but that would require some restructuring of
>> the code, which I'd like to avoid doing here.
>=20
> I didn't realize check_vesa and set_current where mutually
> exclusive.
>=20
>>>> +        movw    $0x4f03, %ax
>>>
>>> It would help readability to have defines for those values, ie:
>>> VESA_GET_CURRENT_MODE or some such (not that you need to do it here,
>>> just a comment).
>>
>> Right - this applies to all of our BIOS interfacing code, I guess.
>>
>>>> +        int     $0x10
>>>> +        cmpw    $0x004f, %ax
>>>> +        jne     .Lsetc_done
>>>> +
>>>> +        leaw    vesa_mode_info, %di     # Get mode information struct=
ure
>>>> +        movw    %bx, %cx
>>>> +        movw    $0x4f01, %ax
>>>> +        int     $0x10
>>>> +        cmpw    $0x004f, %ax
>>>> +        jne     .Lsetc_done
>>>> +
>>>> +        movb    (%di), %al              # Check mode attributes
>>>> +        andb    $0x9b, %al
>>>> +        cmpb    $0x9b, %al
>>>
>>> So you also check that the reserved D1 bit is set to 1 as mandated by
>>> the spec. This is slightly different than what's done in check_vesa,
>>> would you mind adding a define for this an unifying with check_vesa?
>>
>> Well, see the v2 changelog comment. I'm somewhat hesitant to do that
>> here; I'd prefer to consolidate this in a separate patch.
>=20
> Sorry, didn't notice that v2 comment before.
>=20
> It's my understanding that the main difference this patch introduces
> is that set_current now fetches the currently set mode, so that we
> avoid further mode changes if the mode set already matches the
> selected one, or if Xen is to use the already set mode?

Not exactly: You either tell Xen to use the current mode ("vga=3Dcurrent")
or you tell Xen to use a specific mode ("vga=3D<mode>"). Checking whether
the present mode is the (specific) one Xen was told to switch to would
require yet more work. But skipping a requested mode switch can also
have unintended consequences, so I wouldn't even be certain we would
want to go such a route.

Jan


