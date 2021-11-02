Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D4442B73
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219946.381002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqn7-0000fD-5L; Tue, 02 Nov 2021 10:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219946.381002; Tue, 02 Nov 2021 10:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqn7-0000co-2P; Tue, 02 Nov 2021 10:13:17 +0000
Received: by outflank-mailman (input) for mailman id 219946;
 Tue, 02 Nov 2021 10:13:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhqn5-0000ci-9a
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:13:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d17ac0c-3bc5-11ec-8554-12813bfff9fa;
 Tue, 02 Nov 2021 10:13:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-UGQDI_DaOxmi95pXGw0mew-1; Tue, 02 Nov 2021 11:13:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 10:13:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:13:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:f0::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 10:13:09 +0000
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
X-Inumbo-ID: 7d17ac0c-3bc5-11ec-8554-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635847993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7V9EwHTVizljkpTbpVymTgmS8EQybsp/hR8NuMt/7m8=;
	b=VQeWEJpmbE54NCZrw9My/HE6S+qn+GjFb38vZrLY4tASYfeuOt9G1nQOt/qM9wMB6UZmV0
	nibZvT6xcuOWroB745v7uYGyLsppSvj/Li11qrJ4LjVuxxfDDTyIw9eFlcMsT/tygdiblP
	2VcZPzzBh7zslMuoTw56KjKiGqQEs+I=
X-MC-Unique: UGQDI_DaOxmi95pXGw0mew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2ObmRLszwBqFQ7U0R4AnC9myDouCA9YxTeuaqIgLFufk/W7q+2lFkZGCBZiC92PsbonCkkwWGNR+Mv8XlIeQyjoDyrF5Wg/qWJhhNrDi9N/GSD7L4r8mmFGRy/hoQxCAlfJ7m4RV/RKzz0y2bgMAk6HwHlRg1ThdCUtJp0zX9A3wJkR30XptaZE5t1M0y9+BzbC62ku19xD566nUj8uhdO4xPn/rUQdFJcNnrwOJKT7JCfHTgrNGNmouqcNRfggsNidV9Ylewxvr7G6zAinIMaUounySmbkV5aY/e7HyczsfT61fWwR4WpOxMUtBcTOJLBN+o7O39ysfLojyBn9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwGJHf5NukqlWsZQVj5e4N0cQEWgMz1RlF/aJ30dzgM=;
 b=WZV8T5AB2aPvRju/vHCuEe43CcJKf4ErSpjwqkqzXEfW7ih4BgvShBbioEU7ptuyEHmTtqHmG5pSPGvtxw+HDuI0QjB/qfPphmg6EqhJ/WQ19AxKSULmh5n/DCRHNHco+8+xmnC9oZ+UaojUNyzFgT5yTH4q3aX57XBp3xd33o/vzKeJ8odqHO1uany3DehZNfDHgT+rHmZ7xobQ4+krNI+U9kwSe1BiEUJfMCS2uqksECaf31X4vKLubTDYal69ymEuppoxt/kot2Hf2uh3f0tfe/PTi/VB39yJXQFEtiAjOfK8gnWIS8D3raQgS/nvlDXWcgcWS7ugeDkGImJBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
Date: Tue, 2 Nov 2021 11:13:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43b30591-90f7-48ee-7d4b-08d99de95f0a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559874E37BDC753E01187F2AB38B9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqY1yGrVUS7wMTMKhpyRupV0RnIESyeIS4VzDQBLMh9hLRgSESd303zWkGPfxAt8nAgurzUfaEzKAzfwOqwfGFMl3H07EKGoJjj9CvY9W6vV+ROeq66UvUGESJSr4tVMgt80uWMlkjm1yV6T4rIkczkjf634g0iGsOauSAc9Tijh4jqd/4o7NYB2+0ww1cCpckvuwe1mDaCt870v165v6xtfh1tYq0ceIB0VRwTuNhgG+MvlyrYbKLzWrbtQzHy3tWP7N9iKkASmlpEi4usZFoN0sKvr84ey3cQ3Z+gqFMSB4Mi578bscNfy6bT4qIsSs7VEd+ln9PwoqApQzUw3e1J1rKlYb9VP4SsVg+Lj9fJ8n52hJRYmD/OwKuuBqNC2LmDh/ctrgQ6JMwafO9WlAWVGEiremMczrKV0fLMDj/hkKgXoeMEXp7BvhRI8Sr9FsRMc4G2cbjd2L8pg4oEiSXG3O1BL8n0RDG+n3FliWQCDdpyeQFa92h+3R3wB4fIsCLAiFWiGDJSluy4EzLIijfDuq/0xo0fqNASMaUrxVXHz9m/NbnZfxRzQd5kDASTGGfaXORL7XdJKqr4BrvxSOAIByDCp8mLgBPO4N0ac4znmeesBeiXyxsd6aXi1PrwJywUNqJ8DQGygT4+Fk4NOOFMLIL6bVUz3VqSVUw2Hrr7IKBS1a3glxQYVWFXrk8JYQQSZ5fVtaTJDUDKBugbqWX1mcB3tRLGXXqcoUvcaCZ+vgh+PkDfh3MNOyl8Y5F77
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(16576012)(2906002)(36756003)(83380400001)(86362001)(31686004)(2616005)(956004)(8676002)(186003)(6486002)(54906003)(5660300002)(4326008)(66946007)(53546011)(31696002)(6916009)(316002)(8936002)(66476007)(26005)(38100700002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUO4g8cEUhr2ZsFpMqcZOAjL2XHt2obOiagnLchfCaQXNTgFCZHMU0zqqXKX?=
 =?us-ascii?Q?T0mRbWiU83Z7CW4tIfo1kun40mSNAtfrYl27G6X3DuXbdfLQL0Yk+UvDkrnK?=
 =?us-ascii?Q?PUWQSzgVFM0yA4k2iqKDz4Xzd+ITVuGNwUQ3KkgX8XwT0ETxlK354xwpJWwi?=
 =?us-ascii?Q?2ycPevI8RGnhfsS89RALkPpAKYSZwEgAiTTNrOuuXap5FJ0DTrtZhiNM1t2N?=
 =?us-ascii?Q?UuLbrT+oKPttICUA0DGcakdeh7JQmcMaSw3vceorRvK0C2w1pBJJOmmgBuht?=
 =?us-ascii?Q?F3ApELOgvXxzKFht0s7UoroFunb13hbmZl6ikrJD398/p1fFuKjpb4XftZHh?=
 =?us-ascii?Q?2B2LpVus9BMxkbQW34ZZ05b+0PfincpsWuXBnaaNjj618UWTCAKRYTnIpdYa?=
 =?us-ascii?Q?mhqIyL4uxTNWasyyODEZGSUHbwCBpWoh7r1qb75eh7sYr23lie7PhlDTHjf8?=
 =?us-ascii?Q?/YxoaLIEypAhhC+pioAJI/qQzFMN7BkXMUklcs7oQxkr1VAw392PnnGoOAFw?=
 =?us-ascii?Q?/0Zh5Esdd/u2CyB6u0yi82b5NEffencQZ3mD6HV+2xAE8e1heUyBPghKCfqt?=
 =?us-ascii?Q?hqEWLjtEGUUloW71gi6D0gfUflF4jhZUvP5K+G+fwlOXcAH8gJLXiOGWTtfS?=
 =?us-ascii?Q?KpAxkWwfmPa2Yj4GBTwuIGNoM9YE1ABjxWpg4pu1QdPbRAUaifZSsiqfwsp+?=
 =?us-ascii?Q?HBkGpxyQHcBHMikV4iJA17PiCyDYI63gbV3Ij4+b0zFVZQehdX2LY53p50An?=
 =?us-ascii?Q?VECnqqpvkvjaaSe5S/+VEfWZfGjOrZQKdtqNYL97MctvzPncjEEcpNpERovv?=
 =?us-ascii?Q?QpQChgD4ihvBPOw9Wc2kJxEdta1H+/XD9K1Fiw20uqVqvnivVVN8HMXahiiX?=
 =?us-ascii?Q?K/4drBP6tlhpSIjJ55Tpqq4E/El6yhKnC9E6Cxot6byNT33OGIDhHt6HLvvJ?=
 =?us-ascii?Q?onCAn++C+GzkiNT8gkOFVvvXbG1pzy5fCHqjsrPKyOJARLgRL6afP+KRTUqV?=
 =?us-ascii?Q?GCDx5srAQzrIKHHVo4u4NuxYUNkXmSniP+KWicpRE+bWq4hbB+juOCj2g6Ts?=
 =?us-ascii?Q?nYe5H2jGP2kX2xFFaQxJL6h8c7oF+5RlyF5Txn8plu7Eh2pL0GzxKSYMmX5H?=
 =?us-ascii?Q?L4fVJoL3Rq2HolhgJEdZYDKpWYuHgK4fdsG1IMgx0DKEEjUoGtCfgbXEZbyz?=
 =?us-ascii?Q?TFYAs+eAlPUYTwiLl1IDIPm1OBpD6W9ffb2QlU2uVy2EOQq2+ByUXlPAfODj?=
 =?us-ascii?Q?h94csXUoklRakOtEd6ZL8194e0ZG27l2yZU+gI7uGoE0qmDh0HOpjDUgzaX5?=
 =?us-ascii?Q?8g/dcLm9Nh4qPXTkmDUG6qEyRAIss4RIMloFgp2NBrzfnsEnimuhxTN+Rjam?=
 =?us-ascii?Q?6gbyARJgdVnKxqxHXrevT84Wa5gITOJOSZob4TefIOS7eBXcOn24ZhsBVJw0?=
 =?us-ascii?Q?hZ8UoYBal/4JVyksKo3G2D43ogq+ylXMwye1fVs620OvNkv2qhXCcn4R4LOr?=
 =?us-ascii?Q?P/Zd1sLVXyC2KXmyIlVRrNcUfoFf975cmmRWtuth7fx8pPUbMZsb7Q/iPMf6?=
 =?us-ascii?Q?0RPqU3gubgD8ZNbcpQfb5J3DG7B59VFrGfRJ4b47tIrlv770kbeOGUN+SPXM?=
 =?us-ascii?Q?gXiqeZ2avKNjXhFJEXhbbZg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b30591-90f7-48ee-7d4b-08d99de95f0a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:13:09.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mAvKuXbNMXYDVQzSe8QDngkf0rmxOSo27frF0anUxwt80luegNU7rQA//d9WLLchCVl8LpjMBihOW7fUPOw5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 25.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
>> The two are really meant to be independent settings; iov_supports_xt()
>> using || instead of && was simply wrong. The corrected check is,
>> however, redundant, just like the (correct) one in iov_detect(): These
>> hook functions are unreachable without acpi_ivrs_init() installing the
>> iommu_init_ops pointer, which it does only upon success. (Unlike for
>> VT-d there is no late clearing of iommu_enable due to quirks, and any
>> possible clearing of iommu_intremap happens only after iov_supports_xt()
>> has run.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In fact in iov_detect() it could be iommu_enable alone which gets
>> checked, but this felt overly aggressive to me. Instead I'm getting the
>> impression that the function may wrongly not get called when "iommu=3Dof=
f"
>> but interrupt remapping is in use: We'd not get the interrupt handler
>> installed, and hence interrupt remapping related events would never get
>> reported. (Same on VT-d, FTAOD.)
>=20
> I've spend a non-trivial amount of time looking into this before
> reading this note. AFAICT you could set iommu=3Doff and still get x2APIC
> enabled and relying on interrupt remapping.

Right, contrary to ...

>> For iov_supports_xt() the question is whether, like VT-d's
>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
>> alone (in which case it would need to remain a check rather than getting
>> converted to ASSERT()).
>=20
> Hm, no, I don't think so. I think iommu_enable should take precedence
> over iommu_intremap, and having iommu_enable =3D=3D false should force
> interrupt remapping to be reported as disabled. Note that disabling it
> in iommu_setup is too late, as the APIC initialization will have
> already taken place.
>=20
> It's my reading of the command line parameter documentation that
> setting iommu=3Doff should disable all usage of the IOMMU, and that
> includes the interrupt remapping support (ie: a user should not need
> to set iommu=3Doff,no-intremap)

... that documentation. But I think it's the documentation that
wants fixing, such that iommu=3Doff really only control DMA remap.
With that ...

>> ---
>> v2: New.
>>
>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>> @@ -731,8 +731,7 @@ bool __init iov_supports_xt(void)
>>  {
>>      unsigned int apic;
>> =20
>> -    if ( !iommu_enable || !iommu_intremap )
>> -        return false;
>> +    ASSERT(iommu_enable || iommu_intremap);
>=20
> I think this should be && in order to match my comments above.

... I think || is correct to use here.

Jan


