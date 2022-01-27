Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E649DBFF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261233.452139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzeK-00069w-5a; Thu, 27 Jan 2022 07:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261233.452139; Thu, 27 Jan 2022 07:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzeK-00067v-2A; Thu, 27 Jan 2022 07:56:56 +0000
Received: by outflank-mailman (input) for mailman id 261233;
 Thu, 27 Jan 2022 07:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzeI-00067n-Im
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:56:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0b76349-7f46-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:56:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-14P18EVnNSqYre4cLOr1KA-1; Thu, 27 Jan 2022 08:56:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5041.eurprd04.prod.outlook.com (2603:10a6:208:bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:56:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 07:56:50 +0000
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
X-Inumbo-ID: b0b76349-7f46-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643270213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtFIBX07JmKgFyFHJN4Oe8G2y+SXY8eL4YI00ZKlUkE=;
	b=DOx3um4oj9+WvD1t8g0n1eJ/jFDS7+VNC7awmik3CHBNzYVqZlCptsGhEXxzt1/dCICW5h
	+0RyCz5/AhaSRrvcJnQZa00CWs3ui7bLf/2BUsUUAQ7MCwOJsWKu18d/A0lAskC0fLL8ka
	87UwTvtUHtAO2daJjB6KtE9hHiYMkyU=
X-MC-Unique: 14P18EVnNSqYre4cLOr1KA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoAmSqZ8fOHIqWqIoJzH5RX9ezTzPE5zm5GnTZZVteBZ07+bCGwRE6pVgMclT2w0RbOOE/yy3cYlFz9WEuEfegDfXEFREQQ5mTrbQd7Lyfn9iDrZ6LfWuvAUfaWrhLWunQw1af9hlGolswTT5oKjCaj1v7FyybaX98YsX+CeS5pesVsUGRZ21YQ61wQL0+SA+PigU1Hz9AbuXyfRqGqbNz9uR2JZwhtrYHreUXhed5J6WyjpwQMPsOAWDDcOU7V6AkKefFUb1zIdYX30PMwFMlvp/xyt2XGex9bK8MRnE6ncAerDsWyxqYaikPs9rgHI/08O/ERFs1N8OnQsp5tLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGnjn2YzP8YJVc+76ST39NTXgr/APnCHJQ78huRYelE=;
 b=C0U8P1VFPiF2rPG58ewAkD9a4lh4ghUP50UvTa9shgeWOSmjVQDdit+SG0BEm4NSWlYIToaD3tkFy4BPnC3GMaYY/SVPbakgHowHmHxyRxNBF/Wn+QEnf6h9xNA7zdxC1nqbbApByz3r7ptNH/rKHZ6O6UgoNZDwwYOfsyj6s0NGs9S5G3ZMbMYPMiOldYwpDXtVavf77n0vQ8sLWwBWKLU4MvtkzeL4+x2H19GiDCsrKWHtCWON0SXNiN/E+7716nFvupaWGMaWUYJX47pCo+zImTGzt/wArdSMFFfl7cvFbA/3aloYEG6u8WQwkpetXDDTrbjFlnzvDqQylH/u3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b07b22a-8599-320e-5746-fe1fe279c62b@suse.com>
Date: Thu, 27 Jan 2022 08:56:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] x86/Intel: use CPUID bit to determine PPIN
 availability
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
 <2d13a663-f03e-b1e2-0c38-5dc3282dab10@suse.com>
 <31121cc4-5980-3e06-89ea-c2268e2ec53f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <31121cc4-5980-3e06-89ea-c2268e2ec53f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e958f600-692d-4921-8c41-08d9e16a934c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5041:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5041D42E9CCD4451A8A112E9B3219@AM0PR04MB5041.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XuQBDlSfZ7eC91/XnLCaJw/aDhVArrniEXhjVYz71wEi4Qm0zSjFpZ1ndRsLnrCTu9Q8hWsmqz3gzahndROgDHSlGVIqOxebIBlW3lKNurv1UZQBgBT25K/CDYqGlCa+OQ5+6zEIPKgGAOI+LkCT8nFKyNl+CPQPeYZhjWApesStMaS6yjL4TBlVxzSAfGHZKQEVfHGZ5RHCL5zquSOrG3h4WJL73hXggkwf/mmstd7Z99F43mEZGCwuH9rRvE/zFhT6yF1P03yV2seToYjj7eP7h3cbzE0GmmOH7VXQbtzqJGXU18qwv5lfML0sJbaTqBzerJRnZXyE1kldG4WEfP0/n0Ar3+iS2ugF2qibHQLPiaJ3X+Kx0wM+3KxJ3lkH9xS28/AA9P8GTToHnXVE7gO45AHxnXxPj4I2AhVu+DwQythArhia36lb/X2wgnd7mGpIoQghGFh30PXo/f2eps14pgUR6ZOG+3lqOVhk0tE1mbRLDNQjFxbFFr7uYCOAJpvoCn3nwT2XTtCtcIYn3jneXYxjko71QrJiKPGQZLt4A4tyFz32/OKHZtMChv6LCtiyJ4eOVyOOXHFtewQLCLNnQIr5qqSWrkMY/rjaEnlupAJIJKvK5MOUkM4PZSIPhXK4cYhc1R3EfxYf8vYFl8AP83fKpWPw6QEzyd36o5Su2HAwBPZM/REjH9d4Gqb8h8CDJ9sGFnD03b56pOW9eTRX0rg4yAVohkdGviFHgV/XevUxtHnUu6hxA9SuCIwN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(26005)(186003)(508600001)(2906002)(86362001)(31686004)(6486002)(53546011)(6512007)(6506007)(316002)(4326008)(31696002)(5660300002)(8936002)(66476007)(66946007)(66556008)(8676002)(6916009)(54906003)(36756003)(38100700002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KccHJzJeNndejg48ftGeagave5tWK5OqslHB/sjpqFa1eAjMwKLvgltW+mih?=
 =?us-ascii?Q?vaMW73WiQE+zvKHv374u9D5j+eudxYUCvaKOgB0dcQy3ppC2mHNhOywV34Nr?=
 =?us-ascii?Q?gyoAM6v8ceyjwBz8jbsR95IPYTdwe47rfhPcr6yZREaBKIWnXAfT3nhnZVpz?=
 =?us-ascii?Q?MFevexxUhPtG93fstms/MY63nCO+3GfMIHPJ1zEI+dalzlJO/NOzLHJZ4juu?=
 =?us-ascii?Q?1FDJd1KnIhMdYoilI2Kjq429/rKsoiFuUGwR8Odk0n0IF5B47wC9rIqPXPE4?=
 =?us-ascii?Q?2LQ61VlH3mnuknvWLfXS2cximXaBckrHbpkLSGJtq/bDMs6iGkXkUPX36e7q?=
 =?us-ascii?Q?WBhnIOetvYhgEnvFW8AqBIGsMxpYegk0a8t4Si5S/J0f7ZqzZCXJ1Je1UBp4?=
 =?us-ascii?Q?f18H14iAiVfKmniuoToxrTdduILj0KhaW1MXnp51ZSeEY7PokAG8/b0fA0yn?=
 =?us-ascii?Q?zlUN+SnzfeeVjTyQxO0010AUXutIc1VTmJQJyZlFcIynVrOrxNkepl+vdaXi?=
 =?us-ascii?Q?Z6rQMgmL3F0hyScH/MuMOu71Q+xzPz08l6F5dqZWD3ChXX5KywYGf/F+qNax?=
 =?us-ascii?Q?IysQE9FlqQKhqIbjFxgoBiEEa509htvin6XrH/Wtomd1KSC63eljzrc0kmwP?=
 =?us-ascii?Q?olyKZDjIHmtypwO8UWgmls436/h0tUVdrRGss8Nww9Kc89OEc57okPUYXuLW?=
 =?us-ascii?Q?p1C2ogA8QoCLEIlWU1FQioCT1Y/txMB536JlXwxxwjgNTulnGI2NY/8zIV8z?=
 =?us-ascii?Q?QdWvTtXK2tRC58MN+ZMkVBxtUhBbsCUGfIoRjMDH9caOuhsemYnaw6PYa5TT?=
 =?us-ascii?Q?ne+poguBDYfMIixRHnuCilyJbGdhPGSpIpBWs+bGmXQfJO0TZeT4ySSc19m/?=
 =?us-ascii?Q?qadG9vzIVyBj/ri4qzGiXrz4f1SsrWS5A2Rmp/XaLBYwGKPJWSdeq9SoZRBd?=
 =?us-ascii?Q?xN1i+fJs0NcbNK42a7u2AEHcYbVPGX0+3JvW0nMmKsW+y8tIWeGVEzgLg8Ne?=
 =?us-ascii?Q?7K2LiC9Uv6iZUTjiUt2i2V05HDqDS6obo3HUy8s9D77PrnUxsYV+wWjFcWN2?=
 =?us-ascii?Q?YVEIY0bFXgCEk6b2Dlt/OClYILsgitsPjt7iOZxwIKyXtQxKodbkLcNLpmj2?=
 =?us-ascii?Q?2YzUIf66VoHer+HEyYiZNpb2H07k8d+pQGV+oXcjhG1VprsDgqL9PCOJCx1E?=
 =?us-ascii?Q?p6Z/v3DBMof0ZIaCGYK/4ZPGZ50ROSZXKB4XuHN5zTTBLvMrSqp/JcrvFWMz?=
 =?us-ascii?Q?hF86i3cMCWJzqWpO+4fKOittk+KmeWIXFNGC/nGBfehzcOsBq2QIG/wn5ShX?=
 =?us-ascii?Q?7Y1OtwFpHe1UA1B3WA30YGSHDuulyfgIFQ83odM7kwM11AHTOBDf3obzUbOL?=
 =?us-ascii?Q?8yd4cr/UDOTX1WQcYzVPm8soFYwH7/u+hrsM2CtvM4Rl7BaETp6Z032LBq13?=
 =?us-ascii?Q?dE3W4v0oMEgnQNHLAYpur7kPm3qbTGrBT1HtuPluuYRiNGf+sJqblAfi6a31?=
 =?us-ascii?Q?WrDq4yoqBG7sgxllwhYrjImA/fGnqKRCQ6ifDCskpIQdqeHjOoh4sLHZ4Q4I?=
 =?us-ascii?Q?C++4z2YSX3QWDZj1Se/OHeLzFmCZYMPTsMto3ysArdgTGpHUTB5D90Ekk6Bj?=
 =?us-ascii?Q?/CIW1ZmLnhu/xJ92H317HoQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e958f600-692d-4921-8c41-08d9e16a934c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:56:50.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbCFsGSvMbGrej2lRUCaJtsMOKavKwLo+rBS0WiuTscZc6IPoL4b+S85KX6unpd8AndzlMfJXyoqPeLbD3fwpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5041

On 27.01.2022 00:30, Andrew Cooper wrote:
> On 20/01/2022 14:17, Jan Beulich wrote:
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -195,6 +195,11 @@ static const char *const str_e21a[32] =3D
>>      [ 6] =3D "nscb",
>>  };
>> =20
>> +static const char *const str_7b1[32] =3D
>> +{
>> +    [ 0] =3D "ppin",
>> +};
>=20
> I hadn't realised what a mess we had with the prefixes.
>=20
> We have AMD_PPIN rendered as simply "ppin", while we also have
> AMD_{STIBP,SSBD} which are rendered with an amd- prefix.=C2=A0 This patch=
 is
> the first introduction of an INTEL_ prefixed feature.
>=20
> We should figure out a consistency rule and fix the logic, before adding
> more confusion.
>=20
> Given the AMD MSR_SPEC_CTRL series just posted, use of CPUID bits will
> often be symmetrical and it's awkward to have one or with a prefix and
> the other without.

IOW you suggest I add a kind-of-prereq patch to drop the prefixes?

>> --- a/xen/include/xen/lib/x86/cpuid.h
>> +++ b/xen/include/xen/lib/x86/cpuid.h
>> @@ -16,6 +16,7 @@
>>  #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
>>  #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
>>  #define FEATURESET_e21a  11 /* 0x80000021.eax      */
>> +#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
>> =20
>>  struct cpuid_leaf
>>  {
>> @@ -188,6 +189,10 @@ struct cpuid_policy
>>                  uint32_t _7a1;
>>                  struct { DECL_BITFIELD(7a1); };
>>              };
>> +            union {
>> +                uint32_t _7b1;
>> +                struct { DECL_BITFIELD(7b1); };
>> +            };
>>          };
>>      } feat;
>> =20
>>
>=20
> Looking at a related patch I've got, at a minimum, you also need:
> * collect the leaf in generic_identify()

I'll need to make a patch first to collect 7a1, as it seems. It was
actually 7a1 that I used as a reference, iirc.

> * extend cpuid_policy_to_featureset() and cpuid_featureset_to_policy()

Yeah, I missed those. Presumably by looking for instances only under
arch/x86/. Especially with per-arch include/ now living under
arch/<arch>/, having separate x86 bits elsewhere is a little unhelpful.

> However I've got an idea to help us split "add new leaf" from "first bit
> in new leaf" which I'd like to experiment with first.=C2=A0 It is rather
> awkward having the two mostly-unrelated changes forced together in a
> single patch.

I'll make the necessary adjustments here anyway. I can always re-base
on top of what you may come up with.

Jan


