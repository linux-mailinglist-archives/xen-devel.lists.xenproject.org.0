Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD23C99FC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 09:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156461.288762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3wGP-0004OM-Mr; Thu, 15 Jul 2021 07:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156461.288762; Thu, 15 Jul 2021 07:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3wGP-0004LP-J6; Thu, 15 Jul 2021 07:58:33 +0000
Received: by outflank-mailman (input) for mailman id 156461;
 Thu, 15 Jul 2021 07:58:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3wGO-0004LJ-Ey
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 07:58:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71ac8a7e-e542-11eb-8895-12813bfff9fa;
 Thu, 15 Jul 2021 07:58:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-JIT_dVIuNcSWssJk5Q7xmQ-1; Thu, 15 Jul 2021 09:58:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 15 Jul
 2021 07:58:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 07:58:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:102:b7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 07:58:25 +0000
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
X-Inumbo-ID: 71ac8a7e-e542-11eb-8895-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626335910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xt1DbyXpm5Nh6OVIsFP89oM9FGOC45n+l3qSTDXc6nk=;
	b=DQGDclzkWjC1NxCremfn9sn5ybZjVQsG0sjXhtieWxgNrYhlgHGnN+Cn2URWc3i4/N7O9u
	hIeGMIuYDQ2KMW4EyahlraHEZ09hSbsyF9bQ0J/yYvfGECsDh4TRH6oj4/xO+bESdi7jLj
	N0XZtO8b5Jn9S+2024atmcz0ZH/MP9M=
X-MC-Unique: JIT_dVIuNcSWssJk5Q7xmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goB7iBYvIrIFM2COvy+e8VBF2naT1BDAlZeVGGliw16ylH5cw7gPbPm9oLhVnQ/4YKJ+aSpyTk8HQXZSaDgLPMM28CFEDGPo8cu3aoBJYMUcADAYBM3WVWJO1XZWsh04W33Jyp4g5ffOVvkzH/kHGDfHpswcdIVwf1P9B78zq/50qIZirNoLCiPonEfCkcvqavSa1cURc8kUMYE7DNwTFu2kRgHrdP+mHFS4RWyhct2zqKl1CUTNAC3kz5YzoR80nLOjZg659cWNEDR9hKfnK2ZWAtVu8YHNN5SbwnKPuTuiL0PC61U5HN3OHRhpg8nSC5ShcIsnUzriCqsjSl+8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt1DbyXpm5Nh6OVIsFP89oM9FGOC45n+l3qSTDXc6nk=;
 b=HsdY954CjA6tMrxZpkz9Skp8bvy5S0kzO67Q8Wp4owCdx+X8LJ+i3/q7nfxXMWXNEoc2WVbVV4qu2fCmcYSjb8tO8kqStjZC9c4oykYmiJKeIcRBmEM0CInpM9LrhQJf813qKH36PzG4pajqVFwJDJv4Lv3T1SzLVAJ5BB0VtE2cMP/adzmD/i24Q5PJ1aH8QLHB8H4v5fIlsAiW+bwAnup+NcSPUYAZlTLON3Nkg2VQ3yMpiq7t+99PqyOdMAW90yBx2tjDUMxa0fkeMBSdrP5ergZ63xdsUmLWOTjo91CFXThRuLNcJCxanccjiVfENeFoYsdXyWk5wHSn2vHnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.15.1 and 4.13.4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Date: Thu, 15 Jul 2021 09:58:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a3446c-f5d7-416f-7fe2-08d947665378
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64801284D8B4FA70013D0026B3129@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EjfKnUKp/w0F6sH/YqWyyWpTF0WB+3sw3eTq3YKlic+Zp/HS8w3F909HHtCFZRsKUpUQjAsBKRk5bbM27lfvaIsmnk/o95UiZBZGEvZBHieV4hAsm1rGqdg9vy/Opc1W1FDjhMVuFUO+QjzSJvWwItxWQgDuGrOBEJHHroqDTVlB7gVO/9Q9tXIMvO1mWK5TNd80e+kInb9XTaQ9Yd7LPn4OYemRdpbUOPZhSzufBYeG9kXq8xhx2SOkAibqwyj2cl0iU7b2Rpwup36/SOKBYnM/svSkpB7o+LAH+hsFEgvtUwOZ2HsAuI4Sr1GgkVExMoyw2fjLk+VX2ZR0j+/LtgLHpLFoXgGWFnOwz8IaHzh/mT0B7lauutbvnUzrcZO64xxDhwSRRI36E8uAEnKI9swiDdYRhFSsolDd3KdRPnAvY0bVWC7cdLhwxM2UNYZk8Y5DyO4vWjkpGCa7BITsUplUUcL8l3tWME0Y0xwBUsnP0QfwnqgrmGe28mibLi1Ha7FXYuO7o/kqW3NEvFerWxtUTaKbFDd7gymToqsPWHmHGJNM7jePfC+4ODiQGeD8NeZaKJoCDqVQmYNQEpwfkzRv6OOE/TqTrtCdsaEq22dhNpobBf1C49v4VJ40Et/QtnDNRSf4D7mCeNor/aKVh4vPv8xcbLCDqL2rGSMOP/+eh8j08ABK0eSVgD2sguqwuj/IqUzaZlYYpJ1vybf9nXoSgZdyw2QDGbkwSFrUvAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39850400004)(346002)(376002)(186003)(36756003)(110136005)(31696002)(316002)(956004)(31686004)(2616005)(8936002)(86362001)(38100700002)(4326008)(54906003)(16576012)(8676002)(6486002)(2906002)(66556008)(26005)(5660300002)(66946007)(66476007)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmR1RFdZSEVabHlzYmRoOU5KdkxBM3dyOGRUQkpvQzI4WW9ZR1k2QWMxb2xs?=
 =?utf-8?B?Zjg1QTAyNVVlalpabzB0QmlGWnFlVEs0ZmhFN2dMTkpKd2x3aFFnSEhZcXI5?=
 =?utf-8?B?aitpZmZONFFTRkl1cXJVUGdFKzBCeUdrU1hBeHhnQVBMRm8rRFAxanJlRTRU?=
 =?utf-8?B?aEU4cVp5bG5mbFh5eTZjTlhvbGdSa2V2c2htREdjdXFPU0RZblc2QUorVHZY?=
 =?utf-8?B?NjljcGErbUkrNWdaY3EwVFZuWCtjRkhDejh4RDBaUCtsMnVJUkpReU44a0ls?=
 =?utf-8?B?TVJ5Z3BGdHdINGVQZXNXcExKUEtYNExyRWc3UUUxOXpNWk9QZDhrc2IxL1NV?=
 =?utf-8?B?QkZjcGROYnY5MTY0d285S2xGTlErUFAzZlMvRXdIaDhCbjdrWmJFTGFvMytZ?=
 =?utf-8?B?WXlockZ4cSt5Y0h2azUrS1dZb0NzYllocmlQNjVoZ0xQUlYxN0paczdZakVz?=
 =?utf-8?B?TXZ6QXp4R1l6RFNSRnZ6T0ZGVWVxd2pMQW40Znc1SmFWN0ZWYysxa2dXKzd5?=
 =?utf-8?B?Y1cxbU1Kb3RlYkFYc3pYT2k4RDJwMHltbnhPYVBaR25UVFJWZlZMeDNTVU9r?=
 =?utf-8?B?Z2tyWFNMNGU1bW1YZm9JK3UzQ0JKN1c0RXY3Z2o5WG9BRG1EUm1hOHFmWW9u?=
 =?utf-8?B?Z0htTjJmVG5IVGtsWmdyc3A4YlowN01lV0VDQ1k2bE1ZZU5ZWnBndmdUVWJT?=
 =?utf-8?B?b1FsUFVwcU81ZzVpekQrNklzc2lBNittNWttVnFMTHExaXNCTitXVlAxVVZ2?=
 =?utf-8?B?UVNCcE5UQ3lQdkFFSnBSejR2TUxiOEtpeTB4NXJJOHdLQlFPN1hKQkpwanJ3?=
 =?utf-8?B?SkRkQTVETTlNTU1DbVRqM2lINWVkOHFLTDhJdkcwdUR1QmFaSU16a0ppVlpH?=
 =?utf-8?B?dmJxQzNRYzlMS1NYMzRuY1lVeUpEMjZ5MlhrZEtRc1o0SHp5WlpEV1BVUHVi?=
 =?utf-8?B?RUQzcWtqVTRDM2dwU2FFTFhWTjduZDJnWmMxWXJLTXVEL2gwREg1ODlueWRr?=
 =?utf-8?B?NUtrNG5UZ0tuYmVoaE1jOSs2M2hlSVhaM3pDVFVSa0VzcEc5TEtwUUlwV1Uy?=
 =?utf-8?B?STRscVNxZXVPRmJPNGtWY0o5TWczbjlJYkQ1c0xrRENleTRIdm5hTFNaaG82?=
 =?utf-8?B?RnZiMzVab0x1bXd0UTNyTEl1c1BsTCtWRkNiRUFKOVR0aU53TEhuQTVOT253?=
 =?utf-8?B?KytWYUVSd2lqcVVOMWRSK0J1UUZ2YWRVL0M5R3hPQlpwZDhlc0pZbGMrUzF6?=
 =?utf-8?B?bzRJZkZGL3RrK3VZc1NFNHdKa05IUGJPaFhDaFVBT0JmOElna3JFK0dyQlVj?=
 =?utf-8?B?L0FsRjgvVG1jbCt0RVpSMEgvWE1ZeXEzTEo4clR4SXM4N3doVy9ZZlNVV3BZ?=
 =?utf-8?B?ODBYaGM4YVRWVjB5SzBkVHdEUjFqTDg1cGZCdVJCRk42Wk96dG40ZDhoQUUx?=
 =?utf-8?B?ZllOa3lBSlRteHFkM2FJaW9OWDNZV2NlQVB6RFFnYVhKSFFPaGNBV1loN1Bz?=
 =?utf-8?B?QndVeUZ3c2hIdWNoeWFQTzhqd2FCQVNTbnFma1BQV0FsQkFzS1FrY2tEZWgx?=
 =?utf-8?B?clYyM2ZIM2c5U1Zuc3dkQmprTDVTVmlJWEZGdXJsUE03WUpFeVpLUjVmUmFp?=
 =?utf-8?B?RHR4cUQ4Sml5UUY2ZlVxelJDMFEvWml0aEZPUTNCRHEvMnhyTThyN3JxSHhJ?=
 =?utf-8?B?Q21oQWtxVFpUdWU3TXhQZDV6WHpDNmlmZmxSRTFlZ011akF5MVhqS2hsU25z?=
 =?utf-8?Q?A4JxgiMbhd8L4aztDOiQQU5/Wf2YAoINz5kPaX0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a3446c-f5d7-416f-7fe2-08d947665378
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 07:58:26.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZT372sse8Pt25+4gRiCrVpM9f7z3PPvox4iI3z1skDSA827bSMhTwOZyaOJe4grGIov3SW7vkFo24G32sA4VUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

All,

the releases are due in a couple of weeks time (and 4.14.3 is
supposed to follow another few weeks later). Please point out backports
you find missing from the respective staging branches, but which you
consider relevant.

Please note that 4.13.4 is going to be the last Xen Project
coordinated release from the 4.13 branch; the branch will go into
security-only maintenance mode after this release.

Ian: I did take the liberty to backport Anthony's

5d3e4ebb5c71 libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype

Beyond this I'd like the following to be considered:

6409210a5f51 libxencall: osdep_hypercall() should return long
bef64f2c0019 libxencall: introduce variant of xencall2() returning long
01a2d001dea2 libxencall: Bump SONAME following new functionality
6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)

If those are to be taken (which means in particular if the question of
the .so versioning can be properly sorted),

198a2bc6f149 x86/HVM: wire up multicalls

is going to be required as a prereq. I have backports of all of the
above ready (so I could put them in if you tell me to), but for
01a2d001dea2 only in its straightforward but simplistic form, which I'm
not sure is the right thing to do.

Jan


