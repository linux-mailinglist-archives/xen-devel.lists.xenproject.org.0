Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A63B3AA28
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 20:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099859.1453541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhYw-0001bo-W3; Thu, 28 Aug 2025 18:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099859.1453541; Thu, 28 Aug 2025 18:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhYw-0001Z1-TI; Thu, 28 Aug 2025 18:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1099859;
 Thu, 28 Aug 2025 18:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AInb=3I=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1urhYv-0001Yt-IZ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 18:41:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:200a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a77bc2a-843e-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 20:41:26 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 18:41:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 18:41:17 +0000
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
X-Inumbo-ID: 9a77bc2a-843e-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR+CIVlRgwV9tDETEuGzlP8ip4aFPHzJBGzDvHbjKfYz/rc2zF3tORBCBM/DoT1VJ3kbD4t4G+PGxVI4K+Hv3xXztY6kMjJyXifQ+gKYlp63yZ1+dPBrxwaadi/B4V/N5dgFEZQiQNAyHSQygRIl8C/i4Ky9g4kyBBUNPkLJ4FDNwXrHBkmgTrtl230i641/7HjsAixjeqHS1dT2v4GaPIzWzGMfqZJNAl4HTT6oc+J2l9XVujdJhdi2sLyJksV5iQMMCKfkQvcR7F6xKF+/i4GTbH5hrATvfBpI0iZqsAeCuvSZ/MRCl6EmMZQYxeoAqnwmkwEgT7rOtKKEVDJjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH4p1Ynk9S0qsGZQOi2m3kXmB/gc/sOBxCVzanZxDJg=;
 b=KeH+UnNB4zg15YJvU7ADMo84nKVAI71Q6ibHzwd9vdo2H1LN7XQdt0ZPdKdaqZq3LGyiI32QGbJixU2ERNMizdR3mq7W5UJy8QnZhUO55FM3UQzEhm+kUN2J6hWwg5qax6JEYdn5ZOr0s71DKfO7wES7I247L1KyvjtV9dGWW1MnxWceNx1PExB+eKfP8eZClx2+jyoyYs0mQ/lfXtd6YUmuyy8QYF/wLWVWfdaVCGS26CnxjAW9X+DxKv8Zl2cLlb+/IWr4zWRuOXVfu6dU7Kl20kiRxfBkV6wMoyZ6vvI2fzSQlEy6dVbffA51/SgK/mBSlZ0MAPRur/6iEJ3kbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH4p1Ynk9S0qsGZQOi2m3kXmB/gc/sOBxCVzanZxDJg=;
 b=siB2nADhfviyBOx84psFQ+Z/YOuywTPbRlhEA1IqYGfDHOOqxMRKuslkZkkf8BjsTrNo0rhFHlUui1W8RPnSzhYhaaiSNMw7dqSd7hFbz3zmYeV5ceWegYyzclb0QO+j6Jwj1QIpZ1z9vH7ihXCpTmwkvsoyEwYSUK8/XlW5LEo1oWSS2Tcy+RANq6Sp3Zgui2wLG5HAQCcU0A+qNG2ktRDOAcknQ68so63qYCyZ7yF+PMYfrKej2R0p7xilIZi2YXahia/CoyDIqECstfej6HkchwMNCLKOkr3e5/W6nmu57qK8zUZxcBZgJP5O8wQKfL9d4OsErhqM6ArWft5ufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Thu, 28 Aug 2025 15:41:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <20250828184115.GE7333@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLCOqIaoaKUEOdeh@kbusch-mbp>
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3a885c-158c-45b2-6f52-08dde6627977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nV1kIOb9VP48Ge+qYZehwA9eGeoxeOZdlL6tbqFCaZF7sX7c4XZQ+EeTEXV1?=
 =?us-ascii?Q?jeOHpXDpN9jTsr0aNY6rvxAEZT563BNdWHjY39m6D+rbkoJCxDyVhpMAKzT4?=
 =?us-ascii?Q?ZiDMILlnK4rP2lqQl4aAw8OQMeKljsP6XMW5lTTWivG2xK3dEy6PZXJSCovR?=
 =?us-ascii?Q?BIANh2Q1CfCf5pFWKroPAu96gx3gMN5vwEGdtNRAoKx8xtulXV3TFsmTS2xJ?=
 =?us-ascii?Q?nwU/Ja5/QcJxHQVAICa5K5arovbYb6RJ56hG5XnmQmqRnORnaDBGTzumViRg?=
 =?us-ascii?Q?DkMxQtBopzV2/gFJShioAb//97O4/pd0ohUYfqUBK75vpTzqiANsRQRk/ouP?=
 =?us-ascii?Q?Fv6CwYSYIuOhJmzdhhMxA2fCTtjH/j8sneQs/z26EmdguwM7eCODjWsqyxXb?=
 =?us-ascii?Q?krd1yEy7/9eXMuHFA+8/BQLpYwNCSdZnDKnf2GHOr/r+sIORslv0r6llJ/W5?=
 =?us-ascii?Q?lYuGM6Jl0iL0lTz1xPBKnEQLL0PNl1q3EoXkp1zkdVHWTqa7YjQAM3LY4xnq?=
 =?us-ascii?Q?+xyXr5leJisKW4ybbGmqcLY4dFG9memB49yY0V2DqdyiwLRQTofGh+srQ7j6?=
 =?us-ascii?Q?SLzI9ufkZixUXU32tsskxXeMjyixZ7Jv9y9mzfLg2gLveR89VBCORXPfbZ4I?=
 =?us-ascii?Q?Rz3RK65W2EFd1bY/g6b7/BJ1lRFVs0gKzpkjgAPeLQQZ4w2i+yquliXEg5cW?=
 =?us-ascii?Q?UpnplUqsnF2sJhmOW69n1N3suCJj7k1RtNz6Fc9v3x+vy+D0AjDK2NeXZfYY?=
 =?us-ascii?Q?ggNou7iwS3eUP3mmT/UbZbJr/c80mQn9aRBz90zkq1YJDX6B4AUMg/V/mBWE?=
 =?us-ascii?Q?dLhhDvkJ6qJVwo6PgMuMIAVd209YsjIh3LBoHhKFIBqoykFmePWfa8wShv+E?=
 =?us-ascii?Q?woIROJMSoD4mqx8s82XZTfSfaBQQDM4rI1DHz7EWZ6aJss4VpQy3hjZ3DXnL?=
 =?us-ascii?Q?yunNIYOHlbwaao8eE8/8Q0enL72WtWHCREdigrSCso/t0Ymxj658JJetd6am?=
 =?us-ascii?Q?r4eWmL98TVTrU3oE1js1kLGYugu8BtiG5c/LhyWENYYwGg4L38kePJ1hQsQb?=
 =?us-ascii?Q?ga63IImaDX1Ke8gVjOdBzhF5Mdk3jECr5JTReym6u2vnytQTGD1Aw5K2FcxE?=
 =?us-ascii?Q?HYtNc6zV429goAnwbIgzIr9oAlHAQyoxWi9ij3k0yJnxyCpmDprAMycojbAk?=
 =?us-ascii?Q?EzwY9beQEtM6o7DjAGgBbH2YAIZfDijNcOgmC/kbeI7ihRarV5UV0eqZkU3I?=
 =?us-ascii?Q?ENsaIqLh/Xo3CLt7Ol6vEm9ZzGFxM2epqD02bjJJftP3gVu6nchYBPmU6pRo?=
 =?us-ascii?Q?IxKRYL76ez6f9Lzhx5rNGhXWpHnx6dn+V1v2qE1skWJ/GY9tOIOZHLxIvdrU?=
 =?us-ascii?Q?BoyC9ifHd9gN/BQpHESbI1RbRWrS4N5nGYzhVWQItOCmuQrpFt+xS7I69mrx?=
 =?us-ascii?Q?josnzQcDqpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?612nRiCny2xtHW95HDZvqIOsNAcX7knc6GaUA1ENwQSUEyWYRrxQ6LgHZM9V?=
 =?us-ascii?Q?gxIbVEIlCpkc5dpljNzBkZka3iIL1//txK42jVrfAO5Mxfz6nm05pHR9RU74?=
 =?us-ascii?Q?sViC+p9O0c+HVw9saEBM8mb1QG0kiimXnK3LSHrb8aFfVfgc2Iq5QjfL/uht?=
 =?us-ascii?Q?Lf+lkIg1ZOhhihb2SlUFSulu8mpGU3jOgcDvl3HM2XP7nfTVOKBThqogue+W?=
 =?us-ascii?Q?1CJhUPa4eY1szS76IWXTgIIhXYHrBCbuTjs7sCxbDLihH8wqXAtDa/Rg/g71?=
 =?us-ascii?Q?ljua2SF7XuiXfvtQ1CY7cw4MFCoteno4FC79mVzvNFpEvK7R78LNuMMHUwVA?=
 =?us-ascii?Q?VzwzEx0KDGcJ3Rv1a3vKSH827Z3cN938T+JI07+/ngE+rJUeyI6So7kts8QB?=
 =?us-ascii?Q?fvuLgamOpucTIP9glxRVgHF7gtRr255/n2zDW9qUI2H0Cmgb9w3KxTApeXU3?=
 =?us-ascii?Q?OeRGzdCkiVzHYuuOMyytk3IPu3txt7oLyoPYLaGMJPkNz44EwgDtVYjPhEkm?=
 =?us-ascii?Q?GmlE526wdzwFHyqNV+QnfquwtCZ5mo03XalIrWWNqwQC17yUsL/h438i4O71?=
 =?us-ascii?Q?VwO8L+Lg/Chss9IRqQJTn1FuJxTD2YwoEsgICmYx6lXkT5Aosba6lTJaRim7?=
 =?us-ascii?Q?p0Zml7Ro9ze8oOuftM60T72mE0P7GFFajmaTP4qNiv1s4J/9AUyZqZh7PRpJ?=
 =?us-ascii?Q?Y0GAAIAFHYaWvPSjqTXlZMEXOjQv6tHu0j0/eTcjURhe3Tnb2CVH/gk4TH18?=
 =?us-ascii?Q?QDOjQ3lXkELM0HB1w/fllOjPldc1Hu1NRLasvOJeQDkWHfAgYdhxQk9lgtV0?=
 =?us-ascii?Q?AyoS7yExGHLto2dq4Zn4tdoi6ZzgbXkCWE9wvFVi3Tpks693wdZ9eU/Ytrm+?=
 =?us-ascii?Q?89V7owK29lgAAaY4FispQ9SCR1zjVzVxEP/mawel7Lngn5evc/516bQOh3uo?=
 =?us-ascii?Q?yNefhsv1nYoIiiqGFvJd46fgazIZmU8k2I3NU/aeew5e4w5UOmCfT0yFfzUh?=
 =?us-ascii?Q?zhQHGytPL1/5XlM65i58JQWBt2sVBd3V7sXbx/7QBWmMWZ4JnanEQznV1xEJ?=
 =?us-ascii?Q?/MRtt7aKWupeCMt939zVdJ47rTdTQMF3P/kpyLZj8RKd6yrEf9HBiedJJJj5?=
 =?us-ascii?Q?b/Es6Dcd9GqF58vO/AL225W6jecBZYHyOjUQVTslycoqPKmk+nBKaIiPD6bz?=
 =?us-ascii?Q?OzjLSXXmyt2z2pmr08AyKLDljujpBwKFcArblI+6yefY5/Zdzgpv/RVKIvwm?=
 =?us-ascii?Q?xXrKKWUGFnz6l2UBXl7oMms4tGvgbabzhDyP83M21Ku9t/34OEp5sfoDFLDO?=
 =?us-ascii?Q?pg9sDLqwgjuxlf1NJ1JeVlZE8S8lZUluNK3wtdYVHq5vdfSBZ6UKLJgUPbZX?=
 =?us-ascii?Q?t4Rn4C3mi4obUpy77vBnFcDjUzSoiY39nc6esrK6NLhI3nmAiULLgvdZbusK?=
 =?us-ascii?Q?WkpOM8JbpDrGzaCuR8ogZpOLnjMis6ZKv2WE4KguqS+kU5EmVp3Rqbz540to?=
 =?us-ascii?Q?6dX741hkL2oiFucdvhQXK1tK3/5CIz7Z9lq/W3yBJcYxMAGwVK+poT+JPUTS?=
 =?us-ascii?Q?dFmRbRG5orn6BsJ5VfU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3a885c-158c-45b2-6f52-08dde6627977
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:41:17.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDSLv6OFkm+aZOnW74Ehofn0ul6m7JzKm/hB2lXjK1SkGQPpQAYH91pJpVyw9xjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306

On Thu, Aug 28, 2025 at 11:15:20AM -0600, Keith Busch wrote:
> On Thu, Aug 28, 2025 at 07:54:27PM +0300, Leon Romanovsky wrote:
> > On Thu, Aug 28, 2025 at 09:19:20AM -0600, Keith Busch wrote:
> > > On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> > > > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > > > index 09b99d52fd36..283058bcb5b1 100644
> > > > --- a/include/linux/blk_types.h
> > > > +++ b/include/linux/blk_types.h
> > > > @@ -387,6 +387,7 @@ enum req_flag_bits {
> > > >  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
> > > >  	__REQ_ATOMIC,		/* for atomic write operations */
> > > >  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> > > > +	__REQ_MMIO,		/* contains MMIO memory */
> > > >  	/*
> > > >  	 * Command specific flags, keep last:
> > > >  	 */
> > > > @@ -420,6 +421,7 @@ enum req_flag_bits {
> > > >  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
> > > >  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
> > > >  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> > > > +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
> > > 
> > > Now that my integrity metadata DMA series is staged, I don't think we
> > > can use REQ flags like this because data and metadata may have different
> > > mapping types. I think we should add a flags field to the dma_iova_state
> > > instead.
> > 
> > Before integrity metadata code was merged, the assumption was that request is
> > only one type or p2p or host. Is it still holding now?
> 
> I don't think that was ever the case. Metadata is allocated
> independently of the data payload, usually by the kernel in
> bio_integrity_prep() just before dispatching the request. The bio may
> have a p2p data payload, but the integrity metadata is just a kmalloc
> buf in that path.

Then you should do two dma mapping operations today, that is how the
API was built. You shouldn't mix P2P and non P2P within a single
operation right now..

Jason

