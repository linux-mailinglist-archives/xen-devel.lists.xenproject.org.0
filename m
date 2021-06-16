Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE83A9F48
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143418.264346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXYk-0005W5-64; Wed, 16 Jun 2021 15:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143418.264346; Wed, 16 Jun 2021 15:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXYk-0005UA-2l; Wed, 16 Jun 2021 15:34:30 +0000
Received: by outflank-mailman (input) for mailman id 143418;
 Wed, 16 Jun 2021 15:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltXYi-0005PW-D7
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:34:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1939a9f6-3413-4085-81c2-5e58f8636553;
 Wed, 16 Jun 2021 15:34:26 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-KYGs_NoTMo-ajRnFbRz4Fw-1; Wed, 16 Jun 2021 17:34:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 15:34:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 15:34:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0010.eurprd09.prod.outlook.com (2603:10a6:200:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Wed, 16 Jun 2021 15:34:21 +0000
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
X-Inumbo-ID: 1939a9f6-3413-4085-81c2-5e58f8636553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623857665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8tpKxy8KlSHxMCtuG/eMRMNCstS9i53aq8u/RpJNYM=;
	b=bc1EhOGr5jPCK1PZVwJdVdDYTwuVD6ox1MbS+I43KfIuCYag/fmaVuopkGr+J6yYVu1FNf
	OBA3CqAUccSynq/Lxd9x/AuCwbWVkdXK9gbcNSpfeiqhsVL3ZcYxtTvbZ9B1H23uGY/E8D
	en3pUbcNFtY0CoLxQ7MYJQBNAHXknTE=
X-MC-Unique: KYGs_NoTMo-ajRnFbRz4Fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwXKCXdEz9Le/YFS5D/Yfx8kMKWO2AP4Q3TLV27TSC1KzbWIGnJbMgytfhNvDVh2XGZu7fNHd/uEYZQv8BY5lF7k/wFagNlh8UM8hBXdvehTaxYQ+t5JEtl8tnQhkQEXGZMggUs13k4j92CDaEVShwv0/aDEvkZ60V1jDRAxXpgEaK+0iYR4BYGQk2Q8amv55MU0nFvioSxbQzv0X4PaU46sDXhNcfK74CEqNtcs6a9dKrkDc3RZygxKpkuuWBIFyfrY8Vf25DwGbKhNu3/t+4fGC1s869oNZ3smZ5zrrV0CXrFwGQw3fxXil0F3ESqjpL2p+N8qJqVC6WaiC38WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaAwwp88N1zeKfF5XWWmXKzUDLfyl3gzUR91ONM+jNo=;
 b=Iqyoe6y3XA5LA7X5zsfctlRQqCAH6RY7HrXo7RGVSEm9Bwi8zoR8lPhM6GErS1UiTzYOEsNZyFTHvmtknOyVM6HO8zex8DGtM37RdCm9hKMDSrLVK5Qdpqf7IoyUqQttu5zV1t2EU7hu9tgNexIw/vPuV8sUv1YMx6nZiMhItb51Z+0h8j9ldnEmV/zlEPmEYc0cjgJ891FiI/VrVr1wXKzoqKNtnXLeUdDZNGwZG4/EoJr/GWR1qIo7Dx8zJK3CZJ8GjfN8rsc/20Gw47UupJIvvGFaBPrX9eRL3DINse1WV+8Lt1BQuNqqrVJ9d87lJYt5ZoVSJDuNLFT939UBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-162845-mainreport@xen.org>
 <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com> <YMoI8YZfOvogwOMY@perard>
 <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com> <YMoU5gLQEVBkmnLC@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8e4dc36b-10e3-9da6-eb4e-91644c2f417c@suse.com>
Date: Wed, 16 Jun 2021 17:34:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMoU5gLQEVBkmnLC@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0902CA0010.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ce8ddb-12a1-47b9-5b66-08d930dc36f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957194625E41F530153A6E0B30F9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JHXeMdKzBW+n+jyQtsBPugOOOVv1PqbL3j9HwO22cjEfKpR3xtK+RS0mG2JMBYygVLeJTfVBHLNXvAVy04rNgZQ2cPexKJLu23cyypo1cDxX7/4a5/qM4MQg9/3sugZ2OgwfZObF6ivrncejLJihA6KkC4kF3VQx3o1xq4hDcxnyUqRCGoRTachou/XLjIpzw8HII9Y+BpzsUZJjz8PzpGsmv9Z0CpAjeq/qQbdO3FxjEAN+ju8uqK9PvPRCJzrvioILLlMav32dzVVgdrBTVBv79Ma+kBvPJj5hi8SXsS6Js4atbu/bLOi5tfHOyoTlObDk59Ue9yYzf80Y3MtltBJNdo5CmhdHGfa6Bn2gmS2QcfHB3UGdtLqUg1Iumj9dQ+Bz6p84whJDqlMiqBYxLSQuXp9cYwQ4XZl0vxa2AUewQB480aLaYoaDe/ehiHOtbhnrVYtcoU2yurVBewRckTN0f9AW1DMGRdnLBF3Ptii355zVdCf54aBsn7fvnUIX3S99nH0zkZciG7Igk5CNOGlYSbY2KwRgl3x6HUlESWpt9KKiJhgohgrMtHsLypeWNu05OmefCKvcUFQdE8IerrcAELvakpvuKWz/mpdTspkuocXsr7l1hp7RcX2nl9BoAlW/n7Kk1jglPr+aM17gSWHsZD/ahyIj6zaTGVjt6dRjXm084/Xyr2KaYB4zaI9N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(396003)(376002)(136003)(83380400001)(8936002)(316002)(66574015)(2906002)(956004)(2616005)(5660300002)(6916009)(8676002)(6486002)(26005)(16576012)(54906003)(31696002)(16526019)(38100700002)(186003)(66476007)(478600001)(66946007)(86362001)(66556008)(31686004)(36756003)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2aZQyGiFqXnwu+pyRpQnW+e1IqwWSzKRSd+bWgo3Fidfl5GL5uJ2GCugTbbS?=
 =?us-ascii?Q?WepoTKUaK+TSyWVz8ltPJgDgEeJ0DU4TT7iodqgjVU5OyIZquVJLzjFPic+k?=
 =?us-ascii?Q?75Xp5nvQiNABupk2Z2SvQNGXuZ5k6BthkOkk4fVBUlpdv8en6wRwHRY+wyE3?=
 =?us-ascii?Q?yyiE9wf0qcnVqc+S1t3hRo86Rzz6uHw4PzO1RUX0IYl3zpxAxr7pMLsB0IaQ?=
 =?us-ascii?Q?ltRtTmiZZ9z176GnXCa1n5X/CWvPFK28jtrt9b2JvvnpBQg6xODF0EFrVfSK?=
 =?us-ascii?Q?ieNL6DhQIV8mkh97TB5BQYqrpVO2/anG1piVZK6Hj9ZagziId7lqkFT3+eSy?=
 =?us-ascii?Q?YUX+OJkZl6na1CFxtrBoZQ/EZ9ilt4DT1A4asg1ke3qnIQdsEuEFUfthcX73?=
 =?us-ascii?Q?9wqrCRA+7cbC0i7893/g7w0CZIA3CRXqSEdx854gHt3X4VBOiDgZ8nhTxmWR?=
 =?us-ascii?Q?TbIkMTp5dK7LkhuIyaB9iTbRL1YJ6QYb+K95ZcN+rk29u7G0hIapmZZfdC0l?=
 =?us-ascii?Q?kbQL0FCy9NhthZs0ifgocFr9xFATNTKxzdHMkRubjATIMuaeKCwe3ENePZuX?=
 =?us-ascii?Q?VqgGmu1S5RoMc3AWBlc3Pg2CBgYVcQ61uhTN1romAN1tgG6hNSIwzo4/4oJm?=
 =?us-ascii?Q?DY2e1kORIGUapJnNWXd+LGi+7to7clIMpY9l+zWy2Qt+4NXYu8Nx1a63QQwh?=
 =?us-ascii?Q?vYNyfBaIGFwQpcnzC9aH13Q/SyBj2/RGl4zPsM4v2+sWI4nkI8wPQp6aMysY?=
 =?us-ascii?Q?g35uIMhlptdwuiRcPHoJuw70ooXApY1/DixU7qMLZoOxOLtPm0MSzUyCXw9u?=
 =?us-ascii?Q?sg+R1EAK9hcesxVHvMEnJinWpRFnTEeNpjWxY/4dba1SO4/erPI8ViVc/sjk?=
 =?us-ascii?Q?FJdlY09XxXgMxqmBojeknXZV7D5fV91JMltvey58hpLODuuwEpZtiyaecaZt?=
 =?us-ascii?Q?8jv3i81Q/powdIZf7BSL/3F2i5KhIJUuMf/U4+Xr8dq6NfzTrpd8/bJQQFd/?=
 =?us-ascii?Q?jSLnERgMSksck2FztQbRkCoZH11JeWEFUoLUQQOtBN+wP7aXvmqs4er95z+8?=
 =?us-ascii?Q?fFKMuNtXUt2kTxtK+cc7xo4IMl3GVu55QjbWy6vLnHaIIZoLKDuVkhoTLhmo?=
 =?us-ascii?Q?/dNnMAvc8LNPJuvJ+h144ZY7/i5ca73fADnREY8d9zov4Q29u1VrubbWtYgZ?=
 =?us-ascii?Q?PHfZMTzq2Z0QCfp1fattxMBM/auYNJVYCAniMCquWQ/Uhj9XAlXm8GMqP+i7?=
 =?us-ascii?Q?DbYUdFsCgYByiZRE1c5eDh4nG2UrVk3gVF+qACSar75JwLDyHrz+S7m9zJvO?=
 =?us-ascii?Q?N0Z8RztHNTrG+8p1kRQ6FNHY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ce8ddb-12a1-47b9-5b66-08d930dc36f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 15:34:22.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsGDBnS6Q3hJ8ChT4qvtof4zdiieVuvsaVSWy0RnO9o+REBSyuQ3HOzKex3JlipGaiGiA4Pm+u4/TqthezneSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 16.06.2021 17:12, Anthony PERARD wrote:
> On Wed, Jun 16, 2021 at 04:49:33PM +0200, Jan Beulich wrote:
>> I don't think it should. But I now notice I should have looked at the
>> logs of these tests:
>>
>> xc: info: Saving domain 2, type x86 HVM
>> xc: error: Unable to obtain the guest p2m size (1 =3D Operation not perm=
itted): Internal error
>> xc: error: Save failed (1 =3D Operation not permitted): Internal error
>>
>> which looks suspiciously similar to the issue J=C3=BCrgen's d21121685fac
>> ("tools/libs/guest: fix save and restore of pv domains after 32-bit
>> de-support") took care of, just that here we're dealing with a HVM
>> guest. I'll have to go inspect what exactly the library is doing there,
>> and hence where in Xen the -EPERM may be coming from all of the
>> sudden (and only for OVMF).
>>
>> Of course the behavior you describe above may play into this, since
>> aiui this might lead to an excessively large p2m (depending what
>> exactly you mean with "as high as possible").
>=20
> The maximum physical address size as reported by cpuid 0x80000008
> (or 1<<48 if above that) minus 1 page, or 1<<36 - 1 page.

So this is very likely the problem, and not just for a 32-bit tool
stack right now. With ...

long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len)
{
    DECLARE_HYPERCALL_BOUNCE(arg, len, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
    long ret =3D -1;
    ...
    ret =3D xencall2(xch->xcall, __HYPERVISOR_memory_op,
                   cmd, HYPERCALL_BUFFER_AS_ARG(arg));

... I'm disappointed to find:

int xencall0(xencall_handle *xcall, unsigned int op);
int xencall1(xencall_handle *xcall, unsigned int op,
             uint64_t arg1);
int xencall2(xencall_handle *xcall, unsigned int op,
             uint64_t arg1, uint64_t arg2);
...

I'm sure we had the problem of a truncated memory-op hypercall
result already in the past, so there definitely was a known problem
that got re-introduced. Or wait, no - I've found that commit
(a27f1fb69d13), and it didn't really have any effect afaict:
Adjusting do_memory_op()'s return type wasn't sufficient, when
do_xen_hypercall() was returning only int. Now on to figuring a
not overly intrusive way of addressing this.

Jan


