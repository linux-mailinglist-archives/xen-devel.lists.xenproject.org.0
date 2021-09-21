Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044F412FD5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191511.341574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSafS-00085u-1h; Tue, 21 Sep 2021 07:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191511.341574; Tue, 21 Sep 2021 07:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSafR-00082q-Tp; Tue, 21 Sep 2021 07:58:17 +0000
Received: by outflank-mailman (input) for mailman id 191511;
 Tue, 21 Sep 2021 07:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSafQ-00082k-0R
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:58:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed87663e-8798-4531-855b-ac831316c95d;
 Tue, 21 Sep 2021 07:58:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-l9tVX36FOdGSD20lT2vsqA-1; Tue, 21 Sep 2021 09:58:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 07:58:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:58:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0129.eurprd06.prod.outlook.com (2603:10a6:20b:467::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 07:58:10 +0000
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
X-Inumbo-ID: ed87663e-8798-4531-855b-ac831316c95d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632211094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZliVOe7Xmlc0GHxrcQt3IFb5580D1LkSDKMEF2ykdA=;
	b=ZZGx231HJGdX0t6Vg4KogVJH6yKYVNrLlUrRuNo9RvEvRHZcE+SmBNfMYw0H7brtJE/wff
	DI28gPlqW8l3LHJETw8p3br+H0jRiBKsYGn5KO4ygXiAXTtgmlrQPl3433mzGb5YqZrTrI
	3AIr6ObIGXFE/qDyhIXVi64mC4/4stU=
X-MC-Unique: l9tVX36FOdGSD20lT2vsqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6Ft1wh7xHVu2uM9YUNOmD2KTD5HvMhF4yDrS2JBEzjFzB1R3K850GNuhWqSAiGEo956WVBPWjk8Rx9+yleKkBqweWE/BHQzNz+odE59Oxy0gW6i44vbjN0aIs7TIWOYAH3RhOXhxCK/t3XGHfgBwHWvP/pkisFJPBdDDZ8iZyOmFc5ek+DVI8fSSbs6evSA+xTtlRtBWgtUtDO4WjzI7/wP9v380rg6y9AiX1uzl4dwkSBYYXVEPQ2u0o8elmgt5NpC3Mj6r4O1dYm6EqrRn2YOY8yN7asueFPw5csGaQmTTJb78vetC/io1ACiciYy4G942g7QBTshvjys9+50vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5SdVMlKdK6Fp3DvkmECiR7cppxy477qPRMs5PbUQaJE=;
 b=WWtzBhb03fS+mmXDHcYeb2BwARV/9ujQ+cD4QUI0jTGVooSEyCwO91eCqZ3WIRIRV12BruNfTIix2ETRJCQUZAHrplyHybgo3MiFKtFj1GnSeOTbDWZFHDepSTxCcs1PxCIL0OmDkUeog/ontYcTYR8RtWlm7a0/dliFo7YlnLlVCCAJM/1JjGhvr541Dk8c6VlhnwInGmV+3ZLphV+kkrZzUTayued4h2Znx1LeySXaFmiuIuwTIg9bkz7Rf9E4yPAKjiitG/y2VPvmoBPClFNC+SlLCCMwQCcQHHsTzb6liTqOxgWEEJxelEACHba7oP1GtXG19ZmKAFSzWgjROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86=3a_drop_a_bogus_SHARE?=
 =?UTF-8?Q?D=5fM2P=28=29_check_from_Dom0_building_code?=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
 <0accd732-71a2-b122-6c7b-bb8fc8b0f3cf@suse.com>
 <27bd50f4-2216-ceb2-437a-f9eaa8f7c019@suse.com>
 <YUmQAIGJaK+Uh/UT@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d120fac9-4e7e-1f38-90b6-b02ebd05662b@suse.com>
Date: Tue, 21 Sep 2021 09:58:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUmQAIGJaK+Uh/UT@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed3a01a0-dc7a-4607-82f3-08d97cd58e49
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736020326CAF9D876123E789B3A19@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYUjsr2eySHgvWY6Mt6Q2Jz4Uv8Giha2KWSDCm0os3YxEDP/kWpn+dTqlI52DtxPmMUQn9k+CqoKbb6myqPJG5LjAOgblewtZRWHqToYa4P9QZjOx55gAmdvf+6DcP+YchfUGIpB6mx6CCXTtgps4DtEFtekry1GD5c7EV/sxPcFIW3/3PooHqp7eOuvlZyItDtfugCMksYL9psh25Skw1hWHoM6mNdmvbjGx0zjvj5P2HEFuW/SBMIvCv3rAB3uorlNXjych1fObpUTUe5NsGpjrpm22KOblE/XBLqbpqYXK0a52tM0lAoMilZEIvHP9TkY/A0iHdRbmK4UY9ceGu3dfdYE9Vdb+twbhUwmCEN8TNA+tKoxTrzaYwLmDwJhPZCQNeHi01YBM/QjAT66XAfYRNVkkzocmhlScp4lDPamYzEfZiNGjqr83lIWaQ/Fa+R+zwlfh87V5LCwIqdhjTD0UetkZ1kyDBiOY1hkpXaQdO5NAw9JjlBLu+qT9KX6kK/Oqb7wy0LO9EaZV+c7N7Xba7KO1oQgz9FDxmLwZXFsUskkLiNQaNqsBQwG/nFS2BeynnssBgITSZxP95QD0bKrJHhTbJq3mM2aKzYZU2baaekLD2qz6SiKpBu3uSNJWXDe5XIAxoCKeLGxT0OjLibVIFMK+Mg4jFhWt9h1r5s331oc5zofQJp7IVDAxeQd1R8nRy+875CjiOaqPLcNqs445ExAxIPR62Z3XM/F0BI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31686004)(8936002)(956004)(2906002)(2616005)(54906003)(36756003)(316002)(16576012)(508600001)(66476007)(86362001)(66556008)(66946007)(186003)(26005)(38100700002)(31696002)(53546011)(6486002)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OBnLotjjRLo2uh+UB3f6cqeNchgm/806braiAK+lY731hTd/Kbs3Jl7yr/bG?=
 =?us-ascii?Q?paKQZcduOhAfyJp6LEJoDD/71IzAwkBS2oV7XBPJ5VezmD61SbdgFJuxlX/n?=
 =?us-ascii?Q?5zphoT7GHhhb5pQJvDkbxGt6yoQ+XInDZERB8ZVAXTL06DLNV82PtZaBQ4V4?=
 =?us-ascii?Q?sgcPg7sDMpID/NX67dG7fla+7Tk0Vrb3puY7pcpYV0ajijKLn1Wbg0GC/+Uv?=
 =?us-ascii?Q?o81/kD5/U04JyzefOk4K6S9golAwMz6IP1Nz0EemSsSFzutIPR6oBwFj/JBo?=
 =?us-ascii?Q?Js89L10WTa0ViAlWRkkyhU/PAyPAYglJnWQLXeTQLH3/GAXVN2hgAsg9UCOq?=
 =?us-ascii?Q?hW6zdT3nMFf27Jh5HFzyHaKCktkKjzs39O+S4XSwE/yJBEUtk1drJrfBinVl?=
 =?us-ascii?Q?lcyLzSrbNMX7mBIMgCs21vAay+Lwy8X/FX5IAYe/Ad3vkeGLxiu+n50Y1lX9?=
 =?us-ascii?Q?aKQkIHqkXW1OE1c/vbyD1C9uwOoYDKXYIVWe/uBj0gD8CQWIU0YZC9wNCFyH?=
 =?us-ascii?Q?v3HKG2P2zGG4T4JCmfkrrwEAx12NnFSC2mXYMuPxadxDPTPEjvye/xYL9Te1?=
 =?us-ascii?Q?zmqnW1YhrIb3n76pnDagZrxJU4JKu1uOqxjiRLta22HMheyYF8VoefBrdB+5?=
 =?us-ascii?Q?7sgbYD2XyFtklroWSPXy1YzwuTs42c6AMvikp0pMtyP8W8R/Lnnr17MRGSdt?=
 =?us-ascii?Q?8D3Tm6dPK0Bpd+kapGIwES0aXlklT/aQtLfRiSWreE0EskVHx5XRMxkQScPq?=
 =?us-ascii?Q?wz/UYV+1R1J55RX0544Vbe1W+NWY1RAoQo7KCzad9DTWFNA6IeJMqYKweQb9?=
 =?us-ascii?Q?5A8nBKX8Dnj/6xtxO2g/nz3yuqGDnN0tyvjCIja5WGv2tKf7fTX0eAHXignP?=
 =?us-ascii?Q?YlM3XPHtir777JravDKveQ5rnJB+wMKwpebpmVSU5OYcOQBw4Jz8+1wPmxDn?=
 =?us-ascii?Q?urS/Bb1I/SCvW/vzlcpNKETkZy954d91KYTuvXULjaKKiSdu8uSUsU5WHMeW?=
 =?us-ascii?Q?SpJ4fVsrhAYxDcs+ouSlwRftMNpbWEv0vA0mqjBT6G09uQR98CAzhnVGsyUm?=
 =?us-ascii?Q?oe7lJtjdqnp6B1ChvdwAHawaj9HYSfR+fyWAtoLqh9u4jBvEK1jwtxmxDCqF?=
 =?us-ascii?Q?01nnGyKTO+qnAn/j0eT2t6CKfy61HEPeO3zur7VuG3FjKX2bW/74HvbHtTjM?=
 =?us-ascii?Q?5xT4QbIFKmSu8DBS8KQvG1KEyTixyUKuTIW0vKFgTo4ao4wPiSy8G41bySeB?=
 =?us-ascii?Q?3VTFgiVT3acioH4DwW44NnA7y69Gj8i88GvQQgUZmQIQ9VPE4Eq6H1VxHyS+?=
 =?us-ascii?Q?Om0R1JPHxQJ7W5ML2awFmMKL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3a01a0-dc7a-4607-82f3-08d97cd58e49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:58:10.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+tqIOf383Vgtj+zBx41PEDzHS6XuoaShBTVXLiA9dHbNEx2xddMV+SxXvEOUtqpNgJ3a7hfY9DRuIla4/0Bkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 21.09.2021 09:55, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 08:10:12AM +0200, Jan Beulich wrote:
>> On 06.07.2021 09:37, Jan Beulich wrote:
>>> On 28.06.2021 13:52, Jan Beulich wrote:
>>>> If anything, a check covering a wider range of invalid M2P entries oug=
ht
>>>> to be used (e.g. VALID_M2P()). But since everything is fully under Xen=
's
>>>> control at this stage, simply remove the BUG_ON().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I didn't expect this to be controversial, so may I please ask for an ac=
k
>>> (or otherwise)?
>>
>> To be quite honest, I find it very strange that even simple changes like
>> this one sit un-responded to for months. This isn't the only example ...
>=20
> Sorry, I'm trying to catch up with reviews, but after being away so
> long it's hard to figure out what's pending.

Thanks for the ack, and I know you're still catching up. This wasn't
primarily targeted at you (for this reason), but it also wouldn't have
felt right to not include you in the ping.

Jan


