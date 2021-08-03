Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E758E3DEEBB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163466.299436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAu8J-0000Oy-Gx; Tue, 03 Aug 2021 13:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163466.299436; Tue, 03 Aug 2021 13:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAu8J-0000Me-DO; Tue, 03 Aug 2021 13:06:59 +0000
Received: by outflank-mailman (input) for mailman id 163466;
 Tue, 03 Aug 2021 13:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAu8H-0000MY-Ou
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:06:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id addaca88-f45b-11eb-9ac0-12813bfff9fa;
 Tue, 03 Aug 2021 13:06:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-xC8hmtF3OEejBm-Ass9NNg-1; Tue, 03 Aug 2021 15:06:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 13:06:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:06:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 13:06:53 +0000
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
X-Inumbo-ID: addaca88-f45b-11eb-9ac0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627996015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ijges7Ai0bixcL0v23ZHSDab3xcOAdpDUi0XTuJ5B4=;
	b=Ef0YsrhpCe7TFqE3ALvmxui7qJZU9/Sr+CxYCKqBeZjqvkb+P0erINGMcLYadzg0Ra5RTB
	iaakLoTEsLFUETzBdNy9+OjGYge2XQ0ZAf8HUhxDtVciX9Q4mQPx4hAfFPxc33n4MfUyxO
	g3mJFAkHKq/z8T7XHjXIi4U8FSSuJ54=
X-MC-Unique: xC8hmtF3OEejBm-Ass9NNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMdrB5n5tmER2gUJnIERgE4rkD2PXYzhJ8O+T6smVXdZsqVseoTSDB5Yy9pc1hxCElatHq9U+aQvd/o/FFjOPuKCR1yKtShRzLDv2UVgWXuDOrpDmguy25eU87A5QMowmWxq9swsDzcxy9i/3sgtxKPkESQh8O5IQj5IcY1hdBRQHz+Y26fYnKtlsnVp1R+cfBz1UJNWG4J5Pfkqa12txXacYMCQ73mqi/1MYpWLE6oPyBg2mAgA6LqL2pi+MmkjLLtV/qAi4uss5DNAEfuATg/ukiwbP3dgXPI2OuaZkIFgt5f74EQeIgsUWwQvYk7crLujxdfryDSLI2EbFwrqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKAexD0jpo8G3aRTo44bCMwjJ/b5JQlrrEcQKrf1jt8=;
 b=Z7raWC8SAK/ks5K8DRiUiEEZ/BBVzVAddxe6PeyBQ4QXWt40Fr8vfIYGvtGuvWZGaut9S5jfnPClGqBkq6XBh3p7wu8Yf1D/CHHBV6QtLrQWoKmhPTPolXhT/XA2YiVb05zoq6rkQul3/Gt2FzenC1FPBmTVsWEbGF51wUecJ0kIDX678yTDtfinjGWGY3CqPCF5s38TPEQo049g0I93fUW4ztbAcYZEOrcrFMXCBSxNJ8bS31A9Cd/WGQCFy1NOiVfZR2gzadc0OGAEv4bWdEj4gR/d2uPLkrtVY1gwB42mt7Dm2sbmgs/jZFzivM0bANnstAX55DA+19JviGm6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl> <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
Date: Tue, 3 Aug 2021 15:06:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQk+I2FglGrnuyPw@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d5d53ed-a414-41c1-dc79-08d9567f90b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037FF29B89178A0E50B8601B3F09@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WQGtPtMlGdVzS94vJ8joqDTZso7yyL/RtQJGZ4X8CWSalxGkhsNPQ631yUna6WBfCfvWE/s6LfLaY2U+LNW4SNFJ7WZuCwvLd/Fy4Ocp8jgOb6K4Z1B2VOyK0JZiv/eSr0y339ByzR/vd9ez3Nn8AHwWU3UOuoK7F6o9bFCsMn9IUubAQOi9RSAIqRFXJN0lO5sH3qGr5yp0Yt68bHdmM3l1hXArg66Wv82EY9sIfDQwUMlyL22pvaQ/I6/Twsd4xsSy8cQQ1WoND1c6vG+LMaZZY5v1ktG4/Pjb3ySYxIt3YMrsfmrve0DOMG3jfuamcpY/eN/u4opljRP0QYO4vjM5aItc0MCtxHtldN96a5XK3LDVudpEVRhRWnB2zteXVbUK65e1Hz38uhQFrXndqSqOJlCZaSTzLCtjryyHXrwfPcODHGs+2NMIg0vrD4GVuxRtlqOoEW6isM7ICnQqLsdYXfH1U6kd1ju8DynMv1Wi4sGKF5/jrKKAF72Few4mvqeiCBwBFNs9I+0hNB1/hffH8R/bdKnXwvO6naq2892bqSmthYvoFu+F4ecC8prt0nlM5qgaiT0vXnZaZL0q/LPA4q3UY5DJvbOW5qRSiwfWQS1lH9ot+gtoxzg8vT0Sj2toG9Jwmu5f+4hs82jcUkU9V0Z5IBUzAbagEuDkMRD6NH2lTR3liHPCT0fxckhg2W4YW2xfvdaqdmwVAY4V+8o8Y6Uh6DRap8t8dOQsBv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39850400004)(346002)(366004)(376002)(2906002)(8936002)(8676002)(478600001)(2616005)(956004)(16576012)(316002)(38100700002)(31686004)(26005)(54906003)(6486002)(6916009)(4326008)(86362001)(53546011)(66476007)(66946007)(66556008)(5660300002)(186003)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlxV7zaoU8s8Ih3JoayUARgj4mObOXEgnBSEHZjsk/Hk+6aqIVKmrfUadl4K?=
 =?us-ascii?Q?cfQoCfA5Kq4yKy1melLmUOxgTO4kzA1xrclbEbl8QYKirL9egjT4yYo/Jstb?=
 =?us-ascii?Q?tYXNqQOK1nSfgI6AOJz8DUuWHJotjeccMKxi2BLrRxAXkwO8N960J2k0ejAJ?=
 =?us-ascii?Q?UjgTdLh48kEbINcTNm1CbjDKjw+Lj80KzQ+aadtNzUHAdlH2qFt2tJqLtEjB?=
 =?us-ascii?Q?UBZE30ze/w3s8I3Gpo9Qc/tKoau6tbHP+4LcDxubS3x+el/C9kZsVcb+iSLH?=
 =?us-ascii?Q?iBQ9ZwXNPrAR2+51HOhAKg/Q6fzbSmP+FLLcmj97KK0cgBcZDprKtE5x/wNl?=
 =?us-ascii?Q?F0WLl73yJVwcPPR2bCvfbad/SByqFUJvFK2B6O+txZrsYNbbWqexpNJadWFe?=
 =?us-ascii?Q?5VKNQ9N3MAVG8mnQNe/GUoDbMkf+JIw25WpL3pyKjbo0gjOU4Fx9laynWcd6?=
 =?us-ascii?Q?puSnAN5BWHVKLhbevpTLUAoP6NrvCS272IPuyI4u4fdIrwV8COENRMpQp0Dl?=
 =?us-ascii?Q?Dqfq8pLLs/3eR9VDh4ot0g0zGG62LJYYQY3dC6gzElV58e2tuiam0PJ3Fm4D?=
 =?us-ascii?Q?MA/DJ6F4piPZEyvHFI8MWAKm1aXT/VnPHkJJtaR3tEFXz52wANZSGjtv+niz?=
 =?us-ascii?Q?6KVaStmiDpvH21jEVBOl4XWbkFQyudpJo9EJKP72JIl7vqOYkaBnEc5rblCR?=
 =?us-ascii?Q?KrWK+ftxUYG4wA+2GkV7HgqnMs5kmfR2eaTM+1xrJtbztthmJNWZHBF/Us7l?=
 =?us-ascii?Q?Kp3ooO1HygJS4xVzzkubQI200tveNkjQDB7sfnTHOFhmdp0fMP2+Hn7+bqKW?=
 =?us-ascii?Q?MvZ2BLv7ORRNNWYYpkOgZzNgFjsY6EboT/5kLCugeQLUQMQ/p+Wl65ZO3i3h?=
 =?us-ascii?Q?Iz6sG37MCSYBvXw+T17rhkqZxq+CN6hvl2BgYO4B1rnA2pj6BAx5uO5j2Lgo?=
 =?us-ascii?Q?CxtA+viYmQtn8SlIzFGO1Ffv9T1cOO/0CSU//j3PSGLk4EKT996bRkP+DCdt?=
 =?us-ascii?Q?dTLnM+UTqzqsNac+WCdHSPoIxVxRxs9ZVlxfItEvveOJZIT1aBCn+87fz6R0?=
 =?us-ascii?Q?MXaTQKmjn+2VEWfPKFVFpjyPsri2XJi4EoMOuTXLIGw3OIjYPrqeG4wYho4l?=
 =?us-ascii?Q?/vsybib40ostrm+54pBL/lf+LFSQPGZyGw7iOdZL/XAcq38KU4s81IBV5Q2l?=
 =?us-ascii?Q?jVvpFbh5J4us8Ocvhu0P7qrN+2KSXvHdYkuKrdeZu1LKGZoEDsnAsodgGDcE?=
 =?us-ascii?Q?kxaON+nM8rpTWRKgr4B7Xk38mckmQJrmY80n6gGoQlh9+rYHbzXM32sWOwK2?=
 =?us-ascii?Q?Yr3JrRGxPSRd2C74w1oF/M5P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5d53ed-a414-41c1-dc79-08d9567f90b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:06:53.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0+LNVZiKiTHzNLNJlZHxHtJWVaTbUdTdYZ/16ODGGevhZoobMwNEtgaCSoH2IVmAtpkI5YoTqf+5yU5KlZEfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 03, 2021 at 02:29:01PM +0200, Jan Beulich wrote:
>> On 03.08.2021 14:21, Marek Marczykowski-G=C3=B3recki wrote:
>>> If we would have an option (in
>>> toolstack, or Xen) to force interrupt remapping, then indeed when it's
>>> broken, PCI passthrough should be refused (or maybe even system should
>>> refuse to boot if we'd have something like iommu=3Dintremap=3Drequire).=
 But
>>> none of those actually exists.
>>
>> "iommu=3Dforce" actually does prevent boot from completing when
>> interrupt remapping is available, but then gets turned off for
>> some reason. See iommu_setup()'s
>>
>>     bool_t force_intremap =3D force_iommu && iommu_intremap;
>=20
> Ok, then, just setting iommu_intremap=3Dfalse should do the right thing,

... if "iommu=3Dforce" is in use (but not otherwise), ...

> if platform_quirks_init() is called somewhere between the above line,
> and actual enforcement of iommu=3Dforce few lines later. I couldn't
> quickly find if that is the case - is it?

iommu_setup()
-> iommu_hardware_setup()
-> iommu_init_ops->setup() (i.e. vtd_setup())
-> platform_quirks_init()

Jan


