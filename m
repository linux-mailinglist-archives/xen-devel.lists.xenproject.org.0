Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472C4F637F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300003.511441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7h4-0004cs-4K; Wed, 06 Apr 2022 15:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300003.511441; Wed, 06 Apr 2022 15:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7h4-0004ao-0y; Wed, 06 Apr 2022 15:35:38 +0000
Received: by outflank-mailman (input) for mailman id 300003;
 Wed, 06 Apr 2022 15:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7h2-0004ai-Ef
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:35:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33791365-b5bf-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:35:35 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-1blXUoNnOiuUJmf20AcUfA-1; Wed, 06 Apr 2022 17:35:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 15:35:31 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:35:31 +0000
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
X-Inumbo-ID: 33791365-b5bf-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649259334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ciozZ5JTikXArUsVDhzD96BkLQlS1ZjvVnvOLE8T0S4=;
	b=ID7nG2bFGKTeRTQM/SN1YDOdQMj7TewZg6alSFHirLcPV9p10UxKhLn1WM+TU0yG+DukI/
	Ve4oNNaetDZ6PCRf7HkhK/DmaHzat5daWjR+jSQiGR7ZknlT/uStOp0cSByNrtxwrT4mDD
	lgQoTHGbcGR1zoJYyjbEuY1iGZYm8yA=
X-MC-Unique: 1blXUoNnOiuUJmf20AcUfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akSmF9A0h3hdy86VMagU02yo1Q+A4amIFvhfSwY1CjfJ67htonzvr6BzoernjdGdrGjZiZaDKIKvIvwfS6dtaottE5uPVCsV45Sr7Hb0Fit4ispvDAh6DmwN9stWcKZTiUyQXXsli0BtHPoFhkIM2A7BeweprIAWuh4n8p/b9+WEN7bzr94mXWnw2r1xWfwbzqXYqmNOqqN7psPmdGLBQ+3XPApbyQc2iDZfKS1ZZX1k4RZi1RzDj07GW+g4aF0RctSphrzuArPMrG1srjUnXcmpVGi3XqciTL3elPglqlWxs3j1FVn7ODKmgqH6fYfPOfk9aIImATOaFlzt2GOGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTlQiAwOhnULjpw6AdmxnG8sxKLuP1rGcQ2vG4BBHxA=;
 b=h8H7bd+zeKbls6MTk2hJ8quxDWFK1Fp3YCLd03Pj0XLiv287VQLjRAkR8+6rIUt1KFvvOJv2vTKDjBxzAfodkRnbgrviRJ00rxNfn6ZpxLL2aGcm5kRvhmLfW7EI/TCILIM8aayTAccRMccpPGr2nzYdfZw6PQZ1FHr3YL/tkAr7pOFN/+4uorfBqBQnVlaiTy9FZlFIk2D2e1Ibj2GhA+6sCWRjsmBjvmalHHXcIkwuJQ0hda13EZMi/JYFaXMNEfpSec2MOwSidExUgRgez/Boih3q9A/6wwaSnJHXxH34W0zNAYIiR3wTPj3d7ZBv2SxL5/3DMSKnmYhH+JNfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e82b38c-016f-fb5f-7157-2e3655ab3704@suse.com>
Date: Wed, 6 Apr 2022 17:35:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
 <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
 <Yk2XcUhUn0BYk3lA@Air-de-Roger>
 <ffad005c-d6b9-9f27-9b5b-4f6d7345c81a@suse.com>
 <Yk2rS+9o2fNkUV8+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk2rS+9o2fNkUV8+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f271de4-2290-4882-cef3-08da17e3158d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776EA860F1A53B7D9FAA2DFB3E79@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nwRFHwuMoh1BNyCaUnZt4923WuvHZ98rhL32RzR7G1naHzaC9IXbWmUQMN67Mkea2ShqqsqDOafGoyBNMe3pVeFr1bQ0nOS+WsXnDmJ4POH+WN2A1q8QgP2HeMpX/dotgvtvot/wLa5ra1FzJJOXc0BbKG1l9s8cU/hLl8EJfIevnwWfoXJrmcAm+zoOg60CYBIzvpzTshOa3SgiMNGab9vUIKBaiBMhCj4IXsrGtK5B0Z/hpSuNe1R729grsQiMEHyMKAiRTs8PW3emmXLOIq/w4c9U5R0nEWYQCt5lQortw1QHJRhlIXMEB3VV7m3LwIubucqhskwm3r8L533MpShOIh8G3tdFPQ16oNKTjwJo1wKWpouxcJcmn5MUV0O3J1X0B9d4N6tdHLDHqkF1TFY74tBEKHFBH3igTS9U8om9c5GraBWRGlz/KJoT9tWiPEdsw6otCQRahphfGgeV2/l060M4Ls2fAi0flj66rrhHYZBP8YUo87zfv8+vrYfbL/czUtGZgpEEnAKXbkK9ISJ0t58x9vh9d0o3SAazFaIACdV7djGmDtC7a/xVdoVx3Bb3ekaR3hytPbean+bW9qoorxSMy3/TjIPNGDK+XHG0pjavKJXRrqUFhbVlsI7nDdSsBGiwTZU1zBg6/kOSxSv/jeh09/znvTshM1pEf2sSjTir9k73RWBOM5tKSeNFpb4VKE/DDJZKdG8FYlIsJ+jQBx/G/rv1gsWUHhUVA2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(6512007)(38100700002)(2906002)(508600001)(53546011)(36756003)(54906003)(6486002)(6506007)(6916009)(8936002)(5660300002)(316002)(66476007)(66556008)(8676002)(186003)(86362001)(66946007)(4326008)(2616005)(31696002)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NubBOXeY/4m39YCXZxWMfY8YPQgA5y89nK83O1TGTn/yJTbOiqTok7USmCgl?=
 =?us-ascii?Q?eaeQbFWZnLYaiBkcTuGL5cYcAjmSEavSLovn5PhlWwZpwDZ6crDozvJuwEPR?=
 =?us-ascii?Q?03gikdpqlxJiBFODoEvTJbMiiWtnF5HKgnQQXc93LQOahORNOCZkIChcP14g?=
 =?us-ascii?Q?c0oh2uxVIUnC9yjAo47cRaJYprmLXDUCdquHRl4P0XDVpCC0sxl0gC4VXVN9?=
 =?us-ascii?Q?zXZ29fUTJOuZbz+DlF8A7zD6eiPwSzrc4nvM5+itBKshEca4EiSGKCBEMDQj?=
 =?us-ascii?Q?iyO6OszKRKN5rJmNfX3GKpPfagGEUEZbURH5JlifnEWPT3PNiHS9p2XU7nq1?=
 =?us-ascii?Q?2NeLzNhoatuisrLz+8lP8VqljpxmCleL+XMKcfKUGAVHw4YdSLiq1I21GOYs?=
 =?us-ascii?Q?fiLa4qPgZiUN/ediSeMUeAV+6XCdqwZLcR2FQq2QXKK6y0/oS7eesw+rZ2ov?=
 =?us-ascii?Q?NkQyLkAwAkk6TsroCGEwLOKTlgep5NBANux8D0scstzYUKWT1n5YSiSZMlAe?=
 =?us-ascii?Q?LkDQuS4zRNTyTkFXVmyFvGQ6SeZb2SVDO+XJMG8UxGsUquq/p4taoXe+I1/Q?=
 =?us-ascii?Q?ikTDqiHGF7DHrTMrzMgaptoyeMtaCcMs5rICJUB6IhWBYGszoT+S2UV3Vtgf?=
 =?us-ascii?Q?BLLxTCZOxaXSBpoN3KL0BO8aeOOl23DtkSfg+jFR+WHcQ8T1wCtD87I1OOcE?=
 =?us-ascii?Q?UhfaHNnE/fNCVdD+OpAb+7XyJqVpok3b8u2JvcDzLl/gwlTYhTBMsCSjJrla?=
 =?us-ascii?Q?CnEiKh8a7WoE/hN9ANNQDs+w41wJ3nN9GB3neG6bG8H/aGwWY5ViaEM+BxFR?=
 =?us-ascii?Q?xfMXC05CHuPkk/9Y+s6v/JGoH3szK8KZ1+uNaB5rcCpqFb3oLq+3SZOckb2I?=
 =?us-ascii?Q?1/I1IDGAJ2ro8XCn38CCBconnAPGtbwpwGsv2Dq3YY1FzYe0r4tUM4dA611O?=
 =?us-ascii?Q?22HjCPs5GWXYHnb0VMg6FA3J9bfJ+IVBltepr/zd1vge1sWDEiUVqHMHpW6E?=
 =?us-ascii?Q?1rV3TuMln8Yr0SC8ppkF9+1wMTMKhI9JU2dknHmunMlIg7Q2Vww2UlObg//f?=
 =?us-ascii?Q?eMVq3FVmkkpgBO1WRVnUTvDyAlyUMMn1u/fmdpO/RUknib5tww3hhfXI7sTf?=
 =?us-ascii?Q?HIi8pqpqVvJMv3n7t0glHqlJM4oH2MUw4vK+ap5o2qflgq2WiXSWGYg6U/UD?=
 =?us-ascii?Q?ZaHQ76vh1ErI4TcD+ZjgWynzoCtuDF8EEXjprWMuCeMRedSZwOIyxkqNSjlj?=
 =?us-ascii?Q?zsyhs32Vvo4F+aS7zkwX5uG8qEuWjddgYaW3cmKpautTksQAWRMmJGW3f+cI?=
 =?us-ascii?Q?XLMffmsdvMKnMuKHk4tCZ+kcNLXfT3SkwNRxBvprodicQDroRBa+9ldcJ8kw?=
 =?us-ascii?Q?akdNClFphUjD5nmaZ1IMEjGoyP0Ww7JMPlDEy4dkTPi2n9LtK8V1cd9Rieqz?=
 =?us-ascii?Q?FG9chFyuG2CYEjUK2bv1ORTsJSkGMzP+WK8BXEOtCg4Nz08rw1m3umgQxHjZ?=
 =?us-ascii?Q?5mK3GJ7FRas6zDg9HpZ1KrunDPD8lUVJWYoDtqwPH/mYJcQ/1Qop5UkKJ8jq?=
 =?us-ascii?Q?4kEWhYDYY+ysl0LPkBbVHX+/39XbMAwioO4JzgRBCbN+D+xsDjaMZgjzaj8v?=
 =?us-ascii?Q?j1ZtneF4KmWIu6KQKBfOqIGYFHGmykGEaCKKCLW00YNS4N9mxtvAFz/8s4oB?=
 =?us-ascii?Q?gIz2zqZ3lEwz/HAJl9Dm8gkiyWvHkSJutYQe8Qqpkd8mojLE9JAabgtvTiol?=
 =?us-ascii?Q?G9GKhG6qNA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f271de4-2290-4882-cef3-08da17e3158d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:35:31.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bFvFSQyFzm8PLnce95wDZSYy5G5TpPziOTqciRFn8mfId2SNrINCS/Kbwv1KzVdFD814CIszYis8WjvEgp4YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 06.04.2022 17:01, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 04:07:24PM +0200, Jan Beulich wrote:
>> On 06.04.2022 15:36, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 06, 2022 at 02:24:32PM +0200, Jan Beulich wrote:
>>>> First there's a printk() which actually wrongly uses pdev in the first
>>>> place: We want to log the coordinates of the (perhaps fake) device
>>>> acted upon, which may not be pdev.
>>>>
>>>> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
>>>> device quarantine page tables (part I)") to add a domid_t parameter to
>>>> domain_context_unmap_one(): It's only used to pass back here via
>>>> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again=
.
>>>>
>>>> Finally there's the invocation of domain_context_mapping_one(), which
>>>> needs to be passed the correct domain ID. Avoid taking that path when
>>>> pdev is NULL and the quarantine state is what would need restoring to.
>>>> This means we can't security-support PCI devices with RMRRs (if such
>>>> exist in practice) any longer.
>>>>
>>>> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
>>>> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quaran=
tining")
>>>> Coverity ID: 1503784
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -750,6 +750,10 @@ However, this feature can still confer s
>>>>  when used to remove drivers and backends from domain 0
>>>>  (i.e., Driver Domains).
>>>> =20
>>>> +On VT-d (Intel hardware) passing through plain PCI (or PCI-X) devices
>>>> +when they have associated Reserved Memory Regions (RMRRs)
>>>> +is not security supported, if such a combination exists in the first =
place.
>>>
>>> Hm, I think this could be confusing from a user PoV.  It's my
>>> understanding you want to differentiate between DEV_TYPE_PCIe_ENDPOINT
>>> and DEV_TYPE_PCI device types, so maybe we could use:
>>>
>>> "On VT-d (Intel hardware) passing through non PCI Express devices with
>>> associated Reserved Memory Regions (RMRRs) is not supported."
>>>
>>> AFAICT domain_context_mapping will already prevent this from happening
>>> by returning -EOPNOTSUPP (see the DEV_TYPE_PCI case handling).
>>
>> Hmm. I did look at that code while writing the patch, but I didn't
>> draw the same conclusion. I'd like to tie the security support
>> statement to what could technically be made work. IOW I don't like
>> to say "not supported"; I'd like to stick to "not security
>> supported", which won't change even if that -EOPNOTSUPP path would
>> be replaced by a proper implementation.
>=20
> My preference for using 'not supported' was simply so that users don't
> need to worry whether their use-case fails in this category: Xen will
> simply reject the operation in the first place.
>=20
> Otherwise users might wonder whether some of the devices they are
> passing through are security supported or not (lacking proper
> information about how to check whether a device is PCI, PCI-X or PCIe
> and whether it has associated RMRR regions).
>=20
> I understand your worry here, but I do think we should aim to make
> this document as easy to parse as possible for users, and hence I
> wonder whether your proposed addition will cause unneeded confusion
> because that use-case is not allowed by the hypervisor in the first
> place.

I guess I'll simply drop the SUPPORT.md addition then. It would
probably have been a better fit right in one of the XSA-400 patches
anyway.

>> Even adding a sentence to
>> say this doesn't even work at present would seem to me to go too
>> far: Such a sentence would easily be forgotten if the situation
>> changed. But I'd be willing to add such an auxiliary statement as
>> a compromise.
>>
>> As to "plain PCI (or PCI-X)" vs "non PCI Express" - while I prefer
>> to avoid a negation there, I'd be okay to switch if that's deemed
>> better for potential readers.
>=20
> Maybe it would be best to simply expand the comment before the RMRR
> check in domain_context_mapping() to note that removing the check will
> have security implications?

Hmm, with the changes I'm doing I don't think I make matters worse,
so this wouldn't seem to me to belong here.

>>>> @@ -1601,9 +1601,13 @@ int domain_context_mapping_one(
>>>> =20
>>>>      if ( rc )
>>>>      {
>>>> -        if ( !prev_dom )
>>>> -            ret =3D domain_context_unmap_one(domain, iommu, bus, devf=
n,
>>>> -                                           DEVICE_DOMID(domain, pdev)=
);
>>>> +        if ( !prev_dom ||
>>>> +             /*
>>>> +              * Unmapping here means PCI devices with RMRRs (if such =
exist)
>>>> +              * will cause problems if such a region was actually acc=
essed.
>>>> +              */
>>>> +             (prev_dom =3D=3D dom_io && !pdev) )
>>>
>>> Maybe I'm reading this wrong, but plain PCI devices with RMRRs are
>>> only allowed to be assigned to the hardware domain, and won't be able
>>> to be reassigned afterwards.  It would be fine to unmap
>>> unconditionally if !prev_dom or !pdev?  As calls with !pdev only
>>> happening for phantom functions or bridge devices.
>>
>> Like with the support statement, I'd prefer this code to be independent
>> of the (perhaps temporary) decision to not allow certain assignments.
>=20
> I was just saying because it would make the code easier IMO, but maybe
> it doesn't matter that much.
>=20
> The comment however should also be adjusted to mention that refers to
> legacy DEV_TYPE_PCI type devices ('PCI devices with RMRRs' is too
> unspecific IMO).

I'm happy to use DEV_TYPE_PCI in the comment.

>> Since you mention phantom functions: Aiui their mapping operations will
>> be done with a non-NULL pdev, unless of course they're phantom functions
>> associated with a non-PCIe device (in which case the same secondary
>> mappings with a NULL pdev would occur - imo pointlessly, as it would
>> be the same bridge and the same secondary bus as for the actual device;
>> I'm under the impression that error handling may not work properly when
>> such redundant mappings occur).
>=20
> The redundant mapping of the bridges would be fine as prev_dom =3D=3D
> domain in that case, and cannot fail?

Hmm, yes, good point.

Jan


