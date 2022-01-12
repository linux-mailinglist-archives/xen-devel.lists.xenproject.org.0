Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85F48C335
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256576.440436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bsJ-0005ED-6B; Wed, 12 Jan 2022 11:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256576.440436; Wed, 12 Jan 2022 11:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bsJ-0005BL-2z; Wed, 12 Jan 2022 11:33:07 +0000
Received: by outflank-mailman (input) for mailman id 256576;
 Wed, 12 Jan 2022 11:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7bsI-0005Ah-23
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:33:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6863b269-739b-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:33:05 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-Xt7NVrGiOa62V4nKAm-sMw-1; Wed, 12 Jan 2022 12:33:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 11:33:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 11:33:02 +0000
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
X-Inumbo-ID: 6863b269-739b-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641987184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIB/f9EE0kJuDhOxbZswW+z4P5HrwmzWNGHNR0+a5u8=;
	b=WXJR24tGi+1VImFVaW/dnlL8+cYKa6Br+9r9eh0qVJT1ViYaf6eN457nD6LgxIWIqBv5kq
	QHO61E4BjgI09O2ywe9jYHrgScyEGY42C7nVOr7YUIcQG+VdIKOOvTJqu/ZoNBNq6zUGUG
	PxMdNtv/4XNHEP/Gvaq5z1H4ITGJpqY=
X-MC-Unique: Xt7NVrGiOa62V4nKAm-sMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moAFYyLhTL3rbAyTRwLW/I0sxCLujoe3iGJCIdh0VSZGK+pV+mWljluFIxSjSz4ZVbIgwO1z+7KnzRxGg7KITk6v/DSmJoYn9R+oR4nBCPQOeQS/Qz8PqH/r4AqHPdW50IFJBPzWylX2/1WUQiDH/qR76SGflu64rsmM6nICRKBZ//kGaViqtZIgve3e7v3AcrLSRD+fubOz0rKvUqa+73dBavTb6Xw5U1H7FMo98CU+RyNKkG12snW4QnWLlrE2QnkaypvCANKtVkQQKFqEEwS8H2r6JwDbMADuhxpdq8hfZ10S1zmNIhi5hI2axmG4iNY3iQANQLBHdOQcZq/VaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRtH3mRhSYg0S4bJGdHbVUkcwJZGWh4ljLRnbJYXOTM=;
 b=auXnnxMtjU/PrsQWJF1/JPpzHDuwDKefy76SB0gUPwn9IhzzVEC2Rxn8+EWLssk8zzCTNPq7ib4/LsDQVAxVHuDP/nDfGHXhGrlWqqS4RLNviSL/8WgGF/LYGtPRh1TSVyWLH6I1sDzzXifa9qPwCKYFYYGIg4IE8nagqrvOWGKgtvZMknaxNBd8x5rbPUy9ABzZQLpyJDfVlEKrHcqKeuUFoW+GAOfYfaEdcwFilX4AFGK9ADfFDHQL3g4eWgVqWuKSqYrBUVQXe17+dlnLXjqXIxFrXDgqbSY4oe+6Km514AbBNCh9lKkyoxZAWziX/4r7TOH3TAoGvrwcjdMzvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c18b93f-8da9-ff38-065a-5050767d17a0@suse.com>
Date: Wed, 12 Jan 2022 12:32:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/2] x86/time: improve TSC / CPU freq calibration accuracy
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <85939a58-ab7f-31ea-1014-91cabe746046@suse.com>
 <Yd6zEgfPTdBdFR2y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yd6zEgfPTdBdFR2y@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ee0315-7b7b-4326-0785-08d9d5bf4aa9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533B8EC68D126D9AB677E0AB3529@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjlpOjjvsr8uCIt2bu5NErFyuOCEo30dkYTMptLu20abIKCaEIOY11o3FGfeNDY9JYQR5YT+0KGxdVXmyhtcflD+1ME0VNx5zsNzBvzcf0oSEXc+0YOFyqNMNtiWca/sDbA90Ncl+vtsBIR8YspGNFRfbDNzB15FpNYGurKKwaHGOBKV9evRzE9Sad9e9R1KLtEFR85lobl7UA/mkkp/EZ8MIb4I3qb//H06uwocf2JOY/rflWvJRjZhHxQCkMiAUSTPwqvpkeyQFEoC81XMCAUzSVD7gy3j/CXE2g2HS/XsgaoeuZyCqE64QI0QVY7KKlPckp3X7+eFjHcnKR2Qfgg8d028j6OhENAMxiHkVVdzJD5Xr99YUu4s40oLpoxYhpZI2+e1dzgc2kac/AyCDktFvGSjKAWklkeobqpYg5Hpx3zsP65DVVryLDX4nN2NLnKZAtnG6p5WjTRJ380j7WvHLo4MVatMqfLnbI8NYEpL/I5bBgQugQWxeo6whFSLi1aqrCIfo6pd3ScS5RZzoxfaQptDlAvCLP92P7J2Da6miTZEpJP4uxjfkuRrYbV0y0UrywGeBuGZ5DHMxx1H5NX0WkXKh5LOcl7uR6CnIXULSxEME+O+f8AmAAKu13sTqINaYZdlDhxYlOonlQszzojkktWaPaYN0flF84XB5b6tnCiSVg94/IlTlWu5Xpx/Ez7PtP/eHkKSN3toLMlB21eghUtkHaLsQLREhB/A9MQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(31696002)(5660300002)(6486002)(6666004)(316002)(6916009)(8936002)(8676002)(66476007)(66556008)(66946007)(38100700002)(86362001)(36756003)(54906003)(2906002)(83380400001)(26005)(186003)(508600001)(4326008)(2616005)(53546011)(31686004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mvjGNhEIOhwvSB3ijISUBAn+7TLVJ6J/vQo0lsmUYArnsk54BM1m3usbAWOU?=
 =?us-ascii?Q?IimHy2+wGe9UwrY9ik2kPxCkai16eA3b+DnA8QLVDF6bmBV3hEJx2hPVzY1k?=
 =?us-ascii?Q?mTN0ZL6xwx1b4UQP0iIP4jEGx51uL8LHGSSPKw8m+quTseCiS6A9gZ1XMc5y?=
 =?us-ascii?Q?+OhWGJ4BmaVI4Gim1lsCucwkoONo1uUPeMLEF3M6bHqfao0+xWq6I3u/an7f?=
 =?us-ascii?Q?xWTV8x6/YWjL6ztaeasVktbkp5yfAOhm9Z/aVOq6tqYuI04aFJh4P7uC8riE?=
 =?us-ascii?Q?zExPKmsNf+0gXGq44qZ5LlDBlboeYjA3JLlmk1cDGu/QNk617JpP27QdeVt+?=
 =?us-ascii?Q?uoEH6c065SOQy8U8lmXVkfi+MGAU+k0XMElms1yRB8GQtWNZiBI9BGCyqfiJ?=
 =?us-ascii?Q?7+TF1qJ6Ilf6w1jn4VTXgV9NTsHqSeuLrLsD630Cm0Ntwf2zimP63kHsTpR0?=
 =?us-ascii?Q?Aov5Sk0VNS/6VvoGTbQDXHIBYYiLnE8Q4TbxoACazXYS1YaugNLeuBVo5H54?=
 =?us-ascii?Q?FSZ+xgGq3J6XOgr6hcVgHEcNVxuKSxCijBaSkBm/p3384Emu9hxPj2Vin2zt?=
 =?us-ascii?Q?F1s4wm0F+ak/2Tvzd9Guv+pQxpNXIGw8g4U1aMTidniRiagdPFQCw8aA/ewS?=
 =?us-ascii?Q?dbs+t1ggxYNXRvoG76bYvT1fRMFdIa86xisipW95qUoX//zAZysxFEm95eUh?=
 =?us-ascii?Q?74WHs17d51xoY6MWwgMQTnrdiVynsjVd4qNWFduQaj7PLubI/P5l9w0dJBOD?=
 =?us-ascii?Q?G5gFAscZYbuNOAHX7tJ7n6V1YcMezPBuhXK4A5dtYzdHeyFBhRUDQph/rQH5?=
 =?us-ascii?Q?uvsq/5eeQjiLobCeCxD/cw9NUF+vb5Yo8YXk1OjMGlwDYLsbDTTeKuBzguEf?=
 =?us-ascii?Q?amzk0B4aoyOCYQq9BWzhg9zcWzvtNxYiFmBshgTVOq+HACoz4Zu+5d2YSeOQ?=
 =?us-ascii?Q?V2hNjLUVb31hG79dFrQDxzkfGD6rAa89/W9AXqfuAFungdUDi/bIfXhz+OXH?=
 =?us-ascii?Q?PqWQIVadoEWY3+IYjUS6PcG5LAK7rIPxwg2xJPn2D4YklsBbB9qdFliu+Tnh?=
 =?us-ascii?Q?TfqQHifd3g2J6+wemSzP8zS10xX7RndHOW0kdAAYdB/ipkKTPxUL0onK7xCJ?=
 =?us-ascii?Q?oPdoGTWNJ/YHUVz3qaPnqGMXCPAOwVrTtVmZuow40DLODu8Aq8PYR9uFQMvc?=
 =?us-ascii?Q?p1znThgWowhDhyEZRg4yUfGwv90Wt7cvZlTzKuRh8Orcfd1bZnnoeVLWul4y?=
 =?us-ascii?Q?A6WojALt9tqwdJpUlw0tTO0W18WxLHgs+6LoLucxbqYNs2XKkcmMWD4iTQug?=
 =?us-ascii?Q?3XxGOegkrbSKJynoor+eUUYidIA14IOy35KNMuyPmH7+TCcghcIG+9kqxggR?=
 =?us-ascii?Q?TIUyQv76GOQn2prpByQja+JG18ABpmisQ7tkwj5ZRvIsvE8wd1E5SBgMi7eh?=
 =?us-ascii?Q?Fm7XsVZTDJgGEWVr7Bts5Z0nuPZefkNKrBAvWiOIe66mGHsu/OEXB+/CmGMG?=
 =?us-ascii?Q?CHpYUSNiuVxmjP/29oWQ/OvCJHrjPUS+pNUeXSNviWNlufO4pDf6QJRZd6Tg?=
 =?us-ascii?Q?Ugh/hcgN3iR2wvWCfDWbz+GUO1d5gSWvVqini+fYhEecVxjuJXeLr2Lqo5iA?=
 =?us-ascii?Q?EwuMJe1qtO7hTyrEp1w2eAc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ee0315-7b7b-4326-0785-08d9d5bf4aa9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 11:33:01.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5ALblXblecOuM+9YzBT5HV1ujlrMNtFwa6QIQ1daRBmgYgFYuHyqF/RgYSMtpdmCc0rnNPlcgUdIme6zwXpqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 12.01.2022 11:53, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 12, 2022 at 09:56:12AM +0100, Jan Beulich wrote:
>> While the problem report was for extreme errors, even smaller ones would
>> better be avoided: The calculated period to run calibration loops over
>> can (and usually will) be shorter than the actual time elapsed between
>> first and last platform timer and TSC reads. Adjust values returned from
>> the init functions accordingly.
>>
>> On a Skylake system I've tested this on accuracy (using HPET) went from
>> detecting in some cases more than 220kHz too high a value to about
>> =C2=B12kHz. On other systems (or on this system, but with PMTMR) the ori=
ginal
>> error range was much smaller, with less (in some cases only very little)
>> improvement.
>>
>> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> I'm afraid I don't see a way to deal with the same issue in init_pit().
>> In particular the (multiple) specs I have to hand don't make clear
>> whether the counter would continue counting after having reached zero.
>> Obviously it wouldn't help to check this on a few systems, as their
>> behavior could still be implementation specific.
>=20
> We could likely set the counter to the maximum value it can hold
> and then perform reads in a loop (like it's done for HPET or the PM
> timers) and stop when start - target is reached. Not a great solution
> either.

Not the least because reading back the counter from the PIT requires
multiple port operations, i.e. is overall quite a bit slower.

Jan


