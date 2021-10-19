Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A24339B5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 17:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213336.371510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcqhI-0007W1-GZ; Tue, 19 Oct 2021 15:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213336.371510; Tue, 19 Oct 2021 15:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcqhI-0007Sn-CO; Tue, 19 Oct 2021 15:06:36 +0000
Received: by outflank-mailman (input) for mailman id 213336;
 Tue, 19 Oct 2021 15:06:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcqhG-0007Sh-OU
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 15:06:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 254d152a-30ee-11ec-8317-12813bfff9fa;
 Tue, 19 Oct 2021 15:06:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-HuxZTiYmNbW_sNA1qldx7A-1; Tue, 19 Oct 2021 17:06:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 15:06:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:06:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0052.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 15:06:28 +0000
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
X-Inumbo-ID: 254d152a-30ee-11ec-8317-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634655992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fDDAHyhygBrlo7ERUk/LHMjHLwkqKGbCYdAdI9ziJs=;
	b=mFWm+EbYNC0Sm7ffg3p8KVsZxIW5xwSPCZnxIsikfep9OEe1cJ/SO0rp2H5WYRte9iQlAv
	pGZsv9PDGbb2ltvb/X7aOUAr6vQlkywZAXGfCHL+DM/IVdzgwpM2hHsvtOHw8m1C+hJ/Hh
	dlMYsVqaaomwrnkHa+WSBFlzxHT4tyo=
X-MC-Unique: HuxZTiYmNbW_sNA1qldx7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofXZC/ApXws3hlT+TTYOLRWKwDeYR9urJexLKSZtArOG3mYspNiTc54xfx7getwzV3RlOtVmZyhCODVZXLn/15TIyOO/vtstzFwP74qCHzzk2yU4OO/KD73aS6QoICUTFJeCsv2fqeoLdut8x0WwT6qTCFPa1haUFNw2g4q1kGuaXQ/3zBGhhDVLGdlH52bUX2WYhCmEK6aBTNzFCh355/MGJ1SZnpOr9qW8Wlr5/aD7iI1FPmibBg7e9L9YaDwfeWchqcVj0duM7hcQACklqnGT+0PVyyOjt+p02StDm87clcbRYikVUJ00koJh2vxi3mlwkwyu8lOZnckXocnuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8ke/QX7gNdmFCNySK5F3vO3xAjkZDmo+WEJy30JzYQ=;
 b=YO2PGdFs/w3IMj92+B493zz3dHTABbfC0Q0or9bv2N34/N6D6/PSj2G/AextrZf+ac4OedqEOvTb30HwvmCTuI9SkjmVfk2S9Y4CCEgkiZftWHW+q2UU6eF+QJu2xrF8XinJkUiUCYH1ENh6VR1rGYakQBVrE0IzQx/Vmmw98Hrf9V/Bhl9ESvbkXmeaGgah/173XEPu2GNnNaE0DY4LdsbIDYWbjN+EeAt7Fr6wQYaykc7V3mKf/aWq1tjFDbZOYFzbt19AdFUkpBe1z9/TX3zT32rYsOxUfQi7/1V+i1rUfkn7W6xBZVDU0/VixgaVR6OHo7safMtyS0DC6a9/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2] x86/PoD: defer nested P2M flushes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
 <YW7N13JsVfwwcqAl@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67220d20-9722-6566-0c6c-6166e346b09f@suse.com>
Date: Tue, 19 Oct 2021 17:06:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW7N13JsVfwwcqAl@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0052.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ce506a-c5ff-4c7b-fb92-08d99312075f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4350642CFF6EF49FD4DA38E4B3BD9@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3L67KOWd6W1iHpKdX6fWRLMACoN+zb004UVfQLlSA71ewiOb1eWIxMPEnpDysc+A9SGdUXhxYlfR+AsBfqEZvK9oePnO2czHdJRHct88YhCS8TAugmQucPXGtc6tEhQzCTvMUI1KbP/+wBY9/itfgu2Yc1PVjPZZnmh+Qoqa/eulSkZUzvxGfCtfCRNDpmiN9ZsarPBAKvSazpKKckNo3UneCF7pjb9LT6U/r8AwmBqK4SYZtfD+RD+DTY5GULCJsqBxlkOAhPw2pE3osZItn1fVtgZUaAWCqkeEHNAHylcw6hW/hNi+3eSZ5p3AbyOvNmRP7pwx55XQeiV2vr2XkgxYtTXj8GUtGHNgA823fPrAl78RKObk3hiJjxFxJNNMv7+RSS7i5s31/mUcSTfXpPAmz1aUt+MHzrCNq0q1EBKbbDDPFsp0+1CcMUOi1mq4rub+yRMexz9+syBG9IwPt9LtyVXMbMFxOMb90c0ySlSPno0ASPC/SISdbnUPZopcPWfSKGjLEhQD9Z/wb85K1submSJR0lqN4EFkB+27X0PU2qOItauZLv7iPGOsyPUF+1ij4bWhbSmHY3KxsEzdZDMJNIZR1fMsoP1bgGooASm/frqwHa87fCuNTHiIUiC3MvrbA8FicZ15Mk5bquDt+thp/xk4Q88Bd3o9wDvuEjWbBZn63vm/CkRT6mrufGofbJMInQQG0zxL/NpkI7Ergfwq0xWYO2Y6efJBAh/YfnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(38100700002)(66946007)(6486002)(2906002)(86362001)(316002)(8936002)(5660300002)(2616005)(186003)(6916009)(83380400001)(66556008)(8676002)(53546011)(4326008)(36756003)(31696002)(508600001)(54906003)(31686004)(26005)(66476007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJ7VRY/Buz9jLwBUQ94sXQbixGpasoR4UXAeoMwSzhDvaR+x3TebPcWfBAwo?=
 =?us-ascii?Q?S9Q++aiYHu1F4QwmjbK8bTq8gGE2De9Q8889+1+7PKHN3ytQXfnjRZVQAWPx?=
 =?us-ascii?Q?fURxzo4SYdreDLyTm48MfoRHealodgMvCY6OB8Q1zIwTyOgzXAp2ZGCaL28b?=
 =?us-ascii?Q?r52pxWErjkbGHI7ro3XO6CEc0YoUV0gun81IXlQBIQi2wCBYnq/aOGIqNvZi?=
 =?us-ascii?Q?Lsao2RzlG6Y+/4rLRiynNPEwR6YFynBEH4K4mVFN1peH9EOFN9gearyqmdOU?=
 =?us-ascii?Q?QBw6/+3sFJY9NhKsJ5cw6WNF6HVqciVmtnK7p76ZQp3TkmozQnJGFhXg01Ps?=
 =?us-ascii?Q?RT6QyLbpLCQioIhtwghpRHFEWUg1JkpHbq7xTB0wISOELxdggOMOHEz3RGHU?=
 =?us-ascii?Q?TsSzac8vmX9WQ/Upijl2bEcAtA9smpT4/WSjtQjpvUfb5HqaO5SQ46oP5TS0?=
 =?us-ascii?Q?WCXlEKoWr21ZPNkOm43ROAcAmkkwqmevOy3hWIZ34v2pkafrErbXw/Ud9Sdo?=
 =?us-ascii?Q?A1jvgFKtKMBVPVJKelJxgoiGlg0NC3mIgN/6GBFM5m54b+oZyWLEMWV/RLQp?=
 =?us-ascii?Q?qnz+wOAU+fitAwYuLdjTZU+04TXhJuK9Skq4sZ+o1hWDU0cSjY+w4mslIefU?=
 =?us-ascii?Q?7goY8nwZPieYHGyx8DL5nzyOOsLXvbg2HpEy3lwMOnFK2/JulZvnwalxgmlp?=
 =?us-ascii?Q?43RL2qxzmPLcdarp41neHYL0a7oXGqwWlxt1OwFYU7WlkZsfNxEkqG3pRwtj?=
 =?us-ascii?Q?aceH47okuTMC7YS3xRwKH58qgusIQFNZJEPQ8rtJGbBjjwRYKMFsAU1ZbJVj?=
 =?us-ascii?Q?JCQOT5n2dp3p7BYqffwGjiifyFT2ByHrJ6Q29FuyVqyq2RIbtf9V/Lc0qdtX?=
 =?us-ascii?Q?KWqCNaSvXfzCZYaIFylTk7mnDuEv1AucXI/zx6HiGDIvdyUH/rtQXwM+yDuP?=
 =?us-ascii?Q?YtTR9IL0yYYaEAK8FfWprUyKPRKfGeMUm4sHgr1v/9A4VdqhHwNo+5opYwH/?=
 =?us-ascii?Q?BfLUvVlDVT8TmDWdARsjlK2HlX11dxVyYI8lpky9wZvzm7koUiEUXkOGaNRn?=
 =?us-ascii?Q?6qDf1bQyQdlerMIlH1/ArYdwGobvvWOfzS62qCP/1ta+LuNdjTxCdsjQX+Uw?=
 =?us-ascii?Q?UuWnTXLbwX14zieV7iZDvcq3vxuSUU+/MMRemXi8TFkwgc45u/IZ/9KH/GBz?=
 =?us-ascii?Q?gpkvjNtKlcpdUSFjFghL/3tp8GigqvpZdZhM4upWkdpt9EFKOtxjY42sENCP?=
 =?us-ascii?Q?6wfzHptd02/xBjvaZj3dAvFkD7vgva/MwcMV1edsyaqwGCtqslFC74WW9RDs?=
 =?us-ascii?Q?tQ7RDuTHBvi20JcGHrQiJecv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ce506a-c5ff-4c7b-fb92-08d99312075f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 15:06:29.3610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgS4G8MG6SP/V5VEKondWCjq0RNmaLswj5XOhxRlJI0RvCqsWFhcBVdrQ25PMOc/dQU1pILo4F8oVErG7XjIOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 19.10.2021 15:53, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 02:52:27PM +0200, Jan Beulich wrote:
>> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
>> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
>> order violation when the PoD lock is held around it. Hence such flushing
>> needs to be deferred. Steal the approach from p2m_change_type_range().
>> (Note that strictly speaking the change at the out_of_memory label is
>> not needed, as the domain gets crashed there anyway. The change is being
>> made nevertheless to avoid setting up a trap from someone meaning to
>> deal with that case better than by domain_crash().)
>>
>> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
>> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected. Make its
>> p2m_flush_nestedp2m() invocation conditional. Note that this then also
>> alters behavior of p2m_change_type_range() on EPT, deferring the nested
>> flushes there as well. I think this should have been that way from the
>> introduction of the flag.
>>
>> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -1253,7 +1253,7 @@ static void ept_sync_domain_prepare(stru
>>      {
>>          if ( p2m_is_nestedp2m(p2m) )
>>              ept =3D &p2m_get_hostp2m(d)->ept;
>> -        else
>> +        else if ( !p2m->defer_nested_flush )
>>              p2m_flush_nestedp2m(d);
>=20
> I find this model slightly concerning, as we don't actually notify the
> caller that a nested flush as been deferred, so we must make sure that
> whoever sets defer_nested_flush also performs a flush unconditionally
> when clearing the flag.

Well, this _is_ the model used for now. Until this change there was
just a single party setting the flag. And like here, any new party
setting the flag will also need to invoke a flush upon clearing it.
It's not clear to me what alternative model you may have in mind.

Jan


