Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C514B65EE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272821.467784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJt5C-0002YT-H8; Tue, 15 Feb 2022 08:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272821.467784; Tue, 15 Feb 2022 08:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJt5C-0002Vt-E2; Tue, 15 Feb 2022 08:21:10 +0000
Received: by outflank-mailman (input) for mailman id 272821;
 Tue, 15 Feb 2022 08:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJt5A-0002Vn-Sk
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:21:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b9e69c-8e38-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 09:21:04 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-PRsB4F-vPz2H7CfvJ6Nllg-1; Tue, 15 Feb 2022 09:21:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6218.eurprd04.prod.outlook.com (2603:10a6:10:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 15 Feb
 2022 08:20:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 08:20:59 +0000
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
X-Inumbo-ID: 37b9e69c-8e38-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644913264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdWll0s2w6gn4R868nKe436TBPCowh3uC9PzT9pyfFM=;
	b=ncy6nuIxJPKVqvHjJ6OHZaGJs+MfWL32b1mWDz1Dh348gSlGC8L81mke1FY6Y11ibOFKp8
	WIKwD91N1lZpVPDvL88tjLb4mBk9APJc+mhEHgJ9Bkuonzm+OOLXJxFzt6AKPuaf+sRwdK
	vzs5HXQijnRorE+8YfAOTr3WGinDFBs=
X-MC-Unique: PRsB4F-vPz2H7CfvJ6Nllg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbnFEE3xMRsgrxiFgairOMhn0mbdpOQH2Oek+3RLF6MFSxciEE9YdW2xMl2UkqwJF3D0VtwbW3ThbEoru0sJ/DHRrispkQFcKtYmcWQprVeXWCd7e+S+DkZW4J+rrOaxvUe90r2qKLqiJYCycXp3k56K3bms49M+K1zrpA5dzsMWJMEokGNQ9JPoEKYBJD6PrqOSKgCR4mLCTiUz/+Lfnce1UhAqTGN1JYr1aaQqM4Qr3yvjWyZTlBhzVJTbWIDptHcpOHlC+yP7Tmz1sfoi/nKkWaintYWesbT/g9ISy7vxtjkL1hk3ecWkyZcWkGrR6RuXDlJgUY4659t/mJvMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F4Vp0W9+D1r9cTHm9jz9B/KGprdwL6D5iCqew7qx7M=;
 b=OveUZyWIL/Zg85ZrEFEj7xVUeKMfhzzomZB3u0/DJ6mJ5e+Lxn6Udh3pIkZcPsihrztv+BB7109rAS6Xqyt1qXwG90SwsgAQRi19SCDbFbvN9PZwD3uGmx8Xp7ODF9bZaW+1n6iGpiVE3UVTHd6faOTtJcHu1wOq825zNaAVTEGoQ4EXTYvYJg72HAe+I4T1AQIGTYsRjz1A9XzZqowSajmKEbb+Oap/RMuPZ1KMjnyPfpnacjXSu9f4SE6ZPBgm4B8pbPgHarw/Z3kL0w851aj4t4xbNFQ6zP7GnKR8zoxi00Hpw+esEs1AVZL2Exr7gbHhMhqpsHarMEB6zQNNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bfdf348-8ce3-0f22-d28b-993ddc7242d2@suse.com>
Date: Tue, 15 Feb 2022 09:20:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] RFC: Version support policy
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Committers <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8744999a-700a-472e-e2ae-08d9f05c18c8
X-MS-TrafficTypeDiagnostic: DBBPR04MB6218:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB621890DB43F96366CFBB4CF7B3349@DBBPR04MB6218.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UN1uMsYHyvd1LcczBvpH/irg/M+HklbQTVatI/3PvjUfHC3UHcRuUoJL/wtSwCdpRUtR/iEeGgrbCMWUteMcAS8gPjzBbfDcUxu+mpC32JI8oTm2ljAerOs55v2p3+xDw/IWbPmiubbjxGtI+SoTOoudh269Gwm04uIS0kbG3HO79qE19jwGh979I2rr9gHACPLQaixLE0eILQboZviw+6m76iCaXPo7qyBdX7A/Hj5hWHi086HaKc/0W8uC5YptPolmmLl3/grKtZG+zcflKWaTrEF89ILCIWgHtk2WZj+12SwmZbVfDPTubM5NjxXCHnhnamQulXEIeSEgcYFbZbGA9VLyL5RKAsJ86gC2tppr0du45tmjV28E2Scz7RK98wQU04LuGnID6Vg0A9C0JDON9cL5WwL1pzlbbBq13/05WAFpIgn5mIH8WRWam48Zg3SKfxUYIEw/tkZGqup+NhQz3N2hOVpzPPww4O1QwImjDWyGnevD/rxu0snwi1udkq79Q8DcJLOp9fQPjdnkm7MgnIpiveNuGBM+EEeEDFmuTs6hENzP/xcrxBsdW1Qg1kC1J+MrImqleqsJLHietsoEWqdQ8rbR/7rLtI/UkFXXg3UJpGzcpYqC2IaEVzHecnD10hemGZK43Mf8GfurIxmdCEo3yxVFM0J3ncg8+roDY4zSv0HYaYJu5b9SXWmCagpa7Fna0NTw3ZkHRqnwOkN09aM74y7Xi6RA7x2wdtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(8936002)(86362001)(53546011)(316002)(6486002)(54906003)(6916009)(6506007)(4326008)(66946007)(8676002)(66476007)(66556008)(2906002)(186003)(6512007)(83380400001)(38100700002)(31696002)(2616005)(36756003)(31686004)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iv3zzhmu3thxwdvUj4L/KP8AvLJYeVOSmNi5Ou3EdnKC1VtsuC7hmGeLh/8y?=
 =?us-ascii?Q?0dE0moRtFN70or7Y0IDpNYgAGLevdDesLJNyqDXrkBEmYje/XCUVPRFQsGmc?=
 =?us-ascii?Q?zCqmUvK+lqXbLU4tJZKFjX2qtSEzctBnHyCDqzp5nZun4aqs0u8dVLmuiw+H?=
 =?us-ascii?Q?nycNT2IGpDFshYa/zIo/bOZKcMRmgGDLCZ7v3BdV15LW8auTHPZk60qPrWjC?=
 =?us-ascii?Q?+M5z94HRByhZyFWLZC5yOY484mgHcCEZnR9C1Y2Bnj3M90oHtR458om0SweE?=
 =?us-ascii?Q?kyYegv5ROAohCwiyTNM3RYd4Nc1zq7ohP9ib7rp0KWz69/pQCOXF/wiOvemn?=
 =?us-ascii?Q?ZBHHdqTrd+FQEwi9bYudbMfys212R/HxhJT7C1DXAWdV2SboJ5ldtvVaYx+Z?=
 =?us-ascii?Q?VVOCEe9oeUBMhdWY54m4+or6W4o/1AjWotME9sRnaR8/nN4+/A6WMc4GRhg9?=
 =?us-ascii?Q?0TLziAKKjryYhUZBtJubuagecPjyQDf7oeZSKf0MHUSoea8NJxSB22XmSZYl?=
 =?us-ascii?Q?kxy8c3ObwpgAH8waYfdimVBj40o8YG2HzpIvwwQdxL0lKmJz5Ef2Oy4vm1Vj?=
 =?us-ascii?Q?joiNYgzUr8fhSbVqEaM4tEPvXCJLsakjIWe/iYkQqqe0uk0MmQIV42cGC4aI?=
 =?us-ascii?Q?gI7lnVVJFdK54MERzbBumDyf+ZK2wuEp9xoYr9odPxIwj3/gr6ZyaBnkhsVS?=
 =?us-ascii?Q?QGH/caZLfV84XZwLnfOgHbdRJwhZraX2LDaAYzbwy+QggBFTCuTnqjAVzwJr?=
 =?us-ascii?Q?/C6BUadOG1/W4AT/x6cABYgXEYA5tr458NBaltPn9MMc3n+CIWiqpIXum3Uo?=
 =?us-ascii?Q?Xr4a/9D4gmRbnO4Gf5UR7KBSjel/pVKe/YZlWxAJcTZlrtrdvBqzhmyesPSR?=
 =?us-ascii?Q?BQMpheJmxyDbJCcmy6Q5DUObyeauCQLsdhLzJPU1JxEzD3dlsNu47sqNiOIT?=
 =?us-ascii?Q?D2Ec9oBSKFW8sODN7XIIdsuYd810MQzJuXakeBA6AGgq9khkF3gl42lrZy/J?=
 =?us-ascii?Q?qmzlFVnmYzAE1MC+o7t9JGjzCSduQNBXsEl4friga9ZqTvNvDVhyJ3eokjG5?=
 =?us-ascii?Q?6UgrSTVLdJofvS+lu18oQDz4WoLWRw2+n7Nzf76BRMD7BcSEeMjc89b8vyji?=
 =?us-ascii?Q?fuvABO7HkQ0wpIWDwoaFJ0s8+jDMdOTs/sw/GfTBWIX9eCjkydZQEtYzU1Fw?=
 =?us-ascii?Q?2ZqKM7vsQMbJShRN/E0JuBJSA27zkHqxhWQCtKjDBCPDzyrljSVAjAh3LlCv?=
 =?us-ascii?Q?W0n1bfZ2BbyY1w0Anv0+sW6M0rHQmTNPBcZBnqn6BmFsXGS7zkoNKXpMOBsh?=
 =?us-ascii?Q?XhVfYzeNiIUOGeau84KPv/ZeHJFx4ZWZTlj/gl+ar/tLQQBwXD74ZGqAVkrI?=
 =?us-ascii?Q?+vUY2lT1XMWRKB/DrRzfJdK5SPY3XWVYJDiN+U6jjFBvGqKlXTE36thOPn7s?=
 =?us-ascii?Q?X9RxJGLMNOLgLD7hNKeaSnBgBvIaC4KaLx6nHJ0ZC3G3Pl7ExIlH+X1AU8J1?=
 =?us-ascii?Q?ROCC6hJvD2aphFHe6x91votxWs56ckxx0LBbnoCg47cUix8hXLgQFnNhnePj?=
 =?us-ascii?Q?ofalNIrN2/WR7ogYnUvKR0byk4fBVUgcRjEqTjSl0swEXH3obeqXLPmgBKDV?=
 =?us-ascii?Q?eAnq71l3/WcllGmOdx38nS4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8744999a-700a-472e-e2ae-08d9f05c18c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 08:20:59.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7p82ZFkfBTAgnjIDSp8anh1ark+iVA++A+sjgycSviiro6XqJPZ//TiL/glPOxun34yKvZmjnUBSnASmGyCPLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6218

On 14.02.2022 22:50, George Dunlap wrote:
>> On Aug 19, 2021, at 10:18 AM, Jan Beulich <JBeulich@suse.com> wrote:
>> On 13.08.2021 13:37, Ian Jackson wrote:
>>> The current policy for minimum supported versions of tools, compilers,
>>> etc. is unsatisfactory: For many dependencies no minimum version is
>>> specified.  For those where a version is stated, updating it is a
>>> decision that has to be explicitly taken for that tool.
>>
>> Considering your submission of this having been close to a glibc
>> version issue you and I have been discussing, I wonder whether
>> "etc" above includes library dependencies as well.
>>
>> In any event the precise scope of what is meant to be covered is
>> quite important to me: There are affected entities that I'm happy
>> to replace on older distros (binutils, gcc). There are potentially
>> affected entities that I'm less happy to replace, but at the time
>> I did work my way through it for example for Python (to still be
>> able to build qemu, the community of which doesn't appear to care
>> at all to have their stuff buildable in older environments). The
>> point where I'd be really in trouble would be when base platform
>> libraries like glibc are required to be a certain minimum version:
>> I'd then be (potentially severely) restricted in what systems I
>> can actually test stuff on.
>=20
> The question here is, why would someone running a 10-year-old distro that=
=E2=80=99s been out of support for 6 years want to run a bleeding edge vers=
ion of Xen?  I understand wanting to run Xen 4.16 on (say) Ubuntu 18.04, bu=
t who on earth would want to run Xen 4.16 on Ubuntu 14.04, and why?  If suc=
h people exist, is it really worth the effort to try to support them?

I do this, for the very simple reason of wanting (needing) to be able
to test a large range of Xen versions all on the same small set of
hardware. Internally we're still maintaining versions back to at least
4.4; upon customer request we (I) may end up needing to even play with
4.0.

>> In addition I see a difference between actively breaking e.g.
>> building with older tool chains vs (like you have it in your
>> README adjustment) merely a statement about what we believe
>> things may work with, leaving room for people to fix issues with
>> their (older) environments, and such changes then not getting
>> rejected simply because of policy.
>=20
> Yes; I think the principle should be that we *promise* to keep it working=
 on the currently-supported releases of a specific set of distros (e.g., De=
bian, Ubuntu, Fedora, SUSE, RHEL).  Working on older versions can be best-e=
ffort; if simple changes make it compatible with older versions, and aren=
=E2=80=99t too burdensome from a code complexity point of view, they can be=
 accepted.
>=20
> One of the issues however is build-time checks.  If we have a build-time =
check for version X, but only test it on X+10 or later, then the build may =
break in strange ways when someone tries it on something in between.

Well, because most people only test on "X+10 or later", is has been
frequently me to run into issues with, in particular, old gcc versions.
And I've been making fixes / workarounds for those. Hence I wouldn't
consider the full range entirely untested. Obviously not every version
in the range would see testing, unless we specifically arranged for
doing so in, say, CI.

> I think it=E2=80=99s too much effort to ask developers to try to find the=
 actual minimum version of each individual dependency as things evolve.

Hmm. On one hand I agree that it may be a lot to ask for. Otoh I
generally take the position that it is okay for advanced functionality
to be unavailable unless certain dependencies are met, but that base
functionality should be provided (almost) indefinitely far backwards.
I did add "(almost)" because I think it is fair for a project to draw
a baseline at the time it is founded. No-one would expect Xen to be
possible to be built with K&R C compilers.

Beyond that raising the baseline for any component needed for building
needs to consider how difficult it is for people to meet that new
requirement. Speaking for myself, I find it acceptable to build certain
leaf components (binutils, gcc, make, etc, and I've even worked my way
through building newer Python), but things get more hairy when e.g. a
shared library needs replacement. (Prime example of the latter would be
libelf, which Linux'es objtool depends upon being a half way recent
version.)

>> While generally I find Marek's proposal better to tie the baseline
>> to distros of interest, in a way it only shifts the issue, I'm
>> afraid.
>=20
> What do you mean =E2=80=9Cshifts the issue=E2=80=9D?  You mean shifts it =
from versions of individual components to versions of distros?

(Half a year later I first had to go back and check Marek's reply.)
Yes. Individual component versions would then be inferred from distro
versions. While I don't know how other distros handle this, in ours
parts of the tool chain also used to get updated during the lifetime
of a distro version (where I already mean to limit "version" to e.g.
service packs). For binutils typically by simple replacing the older
version, while for gcc typically by making a newer major version
available as an option. In such cases it then of course becomes fuzzy
what the "distro =3D> component" mapping would be.

> That=E2=80=99s why I think we should support only currently-supported dis=
tros.  If the distro=E2=80=99s maintainers don=E2=80=99t consider the distr=
o worth supporting any more, I don=E2=80=99t see why we should make the eff=
ort to do so.

And "currently supported" ends when? After "normal" EOL, or at the
end of what's often called LTS / LTSS? For the latter case: I've
recently learned that we've gained further sub-classes of LTSS, with
different life times.

Jan


