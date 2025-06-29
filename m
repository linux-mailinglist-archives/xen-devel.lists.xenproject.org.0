Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BCEAECE4F
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 17:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028695.1402471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVtm7-0002nN-H0; Sun, 29 Jun 2025 15:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028695.1402471; Sun, 29 Jun 2025 15:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVtm7-0002l1-EJ; Sun, 29 Jun 2025 15:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1028695;
 Sun, 29 Jun 2025 15:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRmj=ZM=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uVtm5-0002kv-Ui
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 15:16:58 +0000
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c407::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a9a446-54fc-11f0-a311-13f23c93f187;
 Sun, 29 Jun 2025 17:16:54 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS9P286MB4989.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Sun, 29 Jun
 2025 15:16:46 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.015; Sun, 29 Jun 2025
 15:16:45 +0000
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
X-Inumbo-ID: 15a9a446-54fc-11f0-a311-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyRnaDH4ZrsIdcxrYEa+rrZrMRjBB4wp+P8610hoSG7jyZH0DeuC3LssehyTrz1gw8slOkenPnfNI2nXwTgkbKQWp2RVY897+GCrucERwzQck5ZX7+Ct455VLYQ/Mo00W6n3eXkQgQEv/y38BONFOFHDB7cGTwUquHp8VetffWYD8uho0pPC3MNSdtKAUlG9mj+jxV8dmY3oOHMtQcyRHOZlEjzbXwla09bPnkwUIzK98MBNKjUq4OcDfy5YEOdjWAV1NMpJfe0fOUsD+3s9DYA7sKcMe77KLGJ2ZqxAk7mdYVf/FFhGDDHdpWAXWskTcFb/qK83hyS4mEfqbvKJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCsUgSwtSB37D1Pg4exdlnTtaGZ/hiRsZz2RlFPIAC8=;
 b=yZNgbGPFTKHSknRdE7luXmKGOZiH0ftPaOkWQiVdtGt4tJkPnmc8v+22gRORlgXNhpOIwoDtxH5Ruxx89qseWEOlQZ6YYRWo+cmrZ3HVXQbN0QbuCkc/g00ctoQS6QNb//G+IkUsh2PfIY0TvTD3HJ5bTJ/rIlVBuEs7bwX7WhdaHqqYtOCEUxyjtym8k1kx2YUjDK4SUpe4czcWgEFm5EU1LcmkyY+oMeApv6cfeE3sq8h81ioBVgfY2PVGaCKi7wD+a5EZsAaNS+Jex+wsbr5u7Wj/eIFSrLP/4vSPnJsaq75lTHAK3Abs4PgVjGJxcHbjRJ/SNVPd5a3V2jrkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCsUgSwtSB37D1Pg4exdlnTtaGZ/hiRsZz2RlFPIAC8=;
 b=fgtgVsjgqYGhv0QXWJYlZwLyGmruDvoV5tfCP8/RZo7DhNLH+syk+fOLFYaRZOiXpFb5QNNBYlPycy0l9Md2pXoqEsUgh8RdP49tzv0jDNjn9doK2uKbDvc8dLTQhauZg5KCI6rdDHs2UfUUVhp7X/dlZgarIK0nCMmxQ6HitNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Mon, 30 Jun 2025 00:16:42 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
Message-ID: <yvh7f2bvbyfataridfldknkbyjtfmwpa7s3zpeyysr3khm7a55@hmdxrdluraob>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-5-den@valinux.co.jp>
 <21cbc79b-2209-42ef-8085-81c41e8e697b@xen.org>
 <zyuhfqsecyt3upsj3lrixgakn4bevbofdaylgqfwkukss5l54p@j5wvfn3545a6>
 <a2544b8f-ec1d-46ef-acbe-d1683940f841@xen.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2544b8f-ec1d-46ef-acbe-d1683940f841@xen.org>
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS9P286MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ce54d5-9aad-44e2-0982-08ddb71ff59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wB4EPKYBp9BrUH0FNpvpyiKZy0vN41dR2ztDL++C0PRnOpQNrZgkc4fIdREl?=
 =?us-ascii?Q?3TeLFwyj49NsCiAXsPmN7NZDMA8U4vwu/CzLdP5PEzOc+JZTBqvngv7k4KNE?=
 =?us-ascii?Q?HE+ptYgxBZESa0X4wIrdPP1noAVUfU+pd/kGzm/DNZzcc5ACo2bvy34Fqcwq?=
 =?us-ascii?Q?nkFIgWINKiNz4bK9j2B8ng+KVR9v3pKBjYLZvnjfLG4ynoqmI0HieZa8umYu?=
 =?us-ascii?Q?LxLvJes3xxZAYoWAebRuIeokqBVO9LuAgH9eK66Ps7lQW3you6Eo+O7jE+Oa?=
 =?us-ascii?Q?E6Pi1T+r7fnSlzZR+LoPRXV8dJJ2tzBzSnRqqqhPReSVMm+NEmqMLHdb2M15?=
 =?us-ascii?Q?jx3kHejssSed3fIYVMIj5zDys7XburJEFlh+7ZXuBb57B+t8PpDFwwplaLyi?=
 =?us-ascii?Q?mJQ7/fekZc1KYQZKwwAJQVWWknwn4M3QoQVAnaZdqKeTTqIJc+R4fjTpp8bY?=
 =?us-ascii?Q?tAlqgc5HGfdfGeFkXLRn5qKiCGtEjgNtW7n/1KX2RuEXndtSJ4+hvkKnTMLU?=
 =?us-ascii?Q?6a4faJO1sfeiwtxVNhMN3YEcxA/DNayqQ9NBKnV0Ky3nj6/tImsWDRJVetZ4?=
 =?us-ascii?Q?WN+n8ieOJO/uQ4WGkIGlZw27WiINACpwmfsdNKp8TYAToeEC/+KPzsq5I1Bm?=
 =?us-ascii?Q?FF/Cje2roX5J1w6JnyV/WMR/8I4YE6iRWI6LcpghqKaxmGsl8pXJaFUB0FYn?=
 =?us-ascii?Q?/+k8pyHkLKFr79/U5TDTx7lzxXnM+aIR13QVJG+gy1t5pJZHc1exZrulHgvm?=
 =?us-ascii?Q?1Q+Ym53woONrGiwnO6Vorb0hRtK2TGNu9c+nvwj1Ib6Cm6NMTAFSLJlDnamu?=
 =?us-ascii?Q?T299sqBjFquJUZjwjDGCgjUnxwvS7UbTeUZeTtIUoW2g8ejJCwEi1wQ6NCBO?=
 =?us-ascii?Q?HPl+aKQ+95sYtklqB+LJ/3/68Tk71QkUoXKV9sGZkV3g9IJScAo5h8l1Fvg0?=
 =?us-ascii?Q?0B7rMkN6KRNQ1N/++Ic5P33Em4f08LUgv3gJVZa922jfsTccZuKqHOMo1T/C?=
 =?us-ascii?Q?LtmkKDyf28H/z7rnS3DhsMGCTB9SPSqOgs2FX1IWBw5RdoNbHNTZIAs8tmoW?=
 =?us-ascii?Q?rm0WLqwm8Um++h5BPrgRJZCVvUbSHZ2rVwX7q8Zc9TSm+DigrVM0jH31riVc?=
 =?us-ascii?Q?gZwbunxg99yfgWcTrLQr1W3NFp6nlCujfkI7xVvt2UXmxQLCvMZTOkiO6p5k?=
 =?us-ascii?Q?nuolzXeuhGmr246LeKpQPuXW0Zf5tuGgELQSPTI7Yk2ID/mjrzEtuUTWLCrX?=
 =?us-ascii?Q?gSzJzAy4pVEZ9V+gTMpS8C45mynKdUm3vLaAr5vQAT8oKOH3GXdJlbaBK3Xw?=
 =?us-ascii?Q?9AjJY/2NWA3xXqRZHuVCNccADnE7h0QsvjPkICE9C4F6M5J1n3vGqou5nVUW?=
 =?us-ascii?Q?duD11FlOesjzNqsZ+lVGOxkplKeEHzKF6B1YnS9e256dEUaaXv2twZAyFUS/?=
 =?us-ascii?Q?g4xfUHrbgNziCx3UGl8fO0QXmRTt7iSU+aXSBYRE0/jKYca2fACf5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2l+EzraWwl3PmBPSxK5aUJX4BzotmacLmgv8PBQobqyxjbE/gf0ncn6TG/Gt?=
 =?us-ascii?Q?vY4C51hDM4yaINgG3bK+WM0D0idobpSMlu9vmyL41A7Z4lxQ0ixClgHPNwJp?=
 =?us-ascii?Q?VseAKtY4GawBJ56FgWStaAC+Ru6PfL7hWsCD2VMYpraNpxi6C19eB9EKVVSQ?=
 =?us-ascii?Q?OBBLWLAKQ5KCIaLaHRkurPdBBBixuaJrOSiw63uC7fviMRPXrh/YHGyGOgs7?=
 =?us-ascii?Q?3pGKjp/sb9DPLk1ipWD0LA+I/4DQJvZ3QlJ8180vl1B2MvN0u/soI/pzvhoQ?=
 =?us-ascii?Q?Wvj4wpQr88QbXx22vMirfTrFsYo5NcEzRBM74ZU/Ca/b+fH9d6qgpI7ZLywC?=
 =?us-ascii?Q?fkrQVkrLBLeErntZUv5EeA29yUjK3n1yXW3LN03JtpIm9Rkl+Sxa5cLS2COA?=
 =?us-ascii?Q?CklvoK9OigrZPnlvHPBUQylP/KEI7bk1CvwAK24fszC8pQIqYUEbOc6nnpT1?=
 =?us-ascii?Q?9vs+32QNYHmisbIfZXngYAeqZZG6GdG87eXeUNdJ+eqSEPrNViZSKIMZhLU6?=
 =?us-ascii?Q?CPxxAJGpFP8WOfgekcvCQ8VfuAMofUBq8SpPbME7qNfVqe6cUkRF9m60IWXN?=
 =?us-ascii?Q?lbpcUmegHN/EspJyc5V2qBNWwD24wDb1N/hLkoO6UYZlVnnG1P/op3ODF7rk?=
 =?us-ascii?Q?ngi0T3luDqHPMBCAH3tgreE0F3b2L9RCZx1eSBwYi0n/Oz/rmhBBNjdM8iGu?=
 =?us-ascii?Q?fY7Yi0HUEJeCBYtAWlqd9ITIFNEHpoJ0i4zybl9Y6sdYXM9MYVPXiKQwn6w7?=
 =?us-ascii?Q?gXMpktYGQnV5q8SUW/NFzvS+htpmqKRiyawE2hWZEUWojqwsM/nfAmH+OoIq?=
 =?us-ascii?Q?/GLMRzh56GaC9RMamY+9bTfDP9P9IxeXNo7ZYn+I4xPlNcGtYeWnEnWDZXZh?=
 =?us-ascii?Q?ouDpvdU2ApLsUYZe4Jdhf7U/M+ugGBuexfvUq4xYUACLjKg5YydGibSuRCVQ?=
 =?us-ascii?Q?wRjovU597sE2RkB8swMYWrFZyJTlMNkykmmnP6i0k+z7BW4dscrrGEUu6Y2p?=
 =?us-ascii?Q?ftbJ7nmcAMxMWIeEajJmPle3DnU1WxNn17/rIY7sKnthKLc7KzMWt7k+V7oW?=
 =?us-ascii?Q?VRwkNpb4e9V+Ss54SVLP3M/5phmpYxF8Z9ELstn77DeTnUxUx2WCZSTz0ycz?=
 =?us-ascii?Q?cWMkIEKbBrTBzxSNBo9jYg+V3vlwOJJsqIfs78OGfyMTnLLC0P3ldLeaWF9i?=
 =?us-ascii?Q?JW5CrdFUQ1yaIrGQ7IbOdFgH7Dsp5fwRjn73jnIv2BFiTZeIE/mDZgCtmWfN?=
 =?us-ascii?Q?zXR1uMi/6ce3GU11CFaiuFS9Zli7BYdfcMytWsDefBSwCvRhtXUQkd4lB6EY?=
 =?us-ascii?Q?EXbVrn/W24o4Eo6SVH/HUJIyjntnX2P8upDfk4cLuz0dM9H+uhE2gJfWt/Yd?=
 =?us-ascii?Q?9RP+1MlFY9fRqytPgNIKbmhEnJPaBe3ylRpzU+KsRnsiBKxfZpKmEXZu0Yeu?=
 =?us-ascii?Q?5ccryuE4CvckClQISG7WlGcLOQlsLUVz4f0VKgHFsX+gW21k1N45sIm0l92T?=
 =?us-ascii?Q?iRa9xjmelLqjf+kMxz1eL6ADdwTxkolpmRi0fviJY0dN+F9Ezar5eJYfP15r?=
 =?us-ascii?Q?kcfLiU9umwueeBY4khiRTfwNkTIYZOt+c+3n7C5ddaj5pY8ktV68T6zvZVSe?=
 =?us-ascii?Q?6GgC0jDbHildugv6FVXo/cE=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ce54d5-9aad-44e2-0982-08ddb71ff59d
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 15:16:45.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9RXQOKHGjiseKtGTmqzhBO2d/A7xP8kN0IaMr0I7GYi5w8FWLWjbRTENVL7+4HRoHq6EK5MRZCtMXbMAALYmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4989

On Sat, Jun 28, 2025 at 06:36:02PM +0100, Julien Grall wrote:
> Hi,
> 
> On 28/06/2025 14:58, Koichiro Den wrote:
> > On Mon, Jun 23, 2025 at 09:41:47AM +0100, Julien Grall wrote:
> > ---(snip)---
> > > > @@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
> > > >                           unsigned int flags)
> > > >    {
> > > >        unsigned int count = 0;
> > > > +    int order;
> > > >        int rc;
> > > >        BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> > > > @@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
> > > >        d->arch.sve_vl = config->arch.sve_vl;
> > > >    #endif
> > > > +    /*
> > > > +     * Preallocate the stolen time shared memory regions for all the
> > > > +     * possible vCPUs.
> > > > +     */
> > > > +    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));
> > > 
> > > As this is an order, we could end up to waste memory fairly quickly. So we
> > > should try to free the unused pages from the order. That said, the maximum
> > > number of virtual CPUs we currently support is 128. If I am not mistaken,
> > > this could fit in 2 4KB pages. So I would also be ok with a
> > > BUILD_BUG_ON(MAX_VIRT_CPUS <= 128) and we defer this work.
> > 
> > I'll go with the former in the next iteration. Thanks!
> > 
> > > 
> > > > +    d->arch.pv_time_regions_gfn = INVALID_GFN;
> > > 
> > > Does this mean PV time is optional? If so, shouldn't we allocate the memory
> > > conditionally?
> > > 
> > > Also, looking at the code below, you seem to cater domains created via
> > > dom0less but not from the toolstack. I think both should be supported for
> > > the PV time.
> > 
> > Yes, that was intentional. I should've mentioned that this RFC series only
> > caters the dom0less case. For domains created dynamically via xl create, the
> > only viable solution I've found so far is to reserve PFN range(s) large enough
> > to cover the maximum possible number of toolstack-created domains on boot,
> > which I think would be too wasteful.
> 
> AFAICT, with current MAX_VIRT_CPUS (128), we would only need to reserve 8KB
> in the guest address space. We still have plenty of space that we can afford
> reserve 8KB (the layout is described in xen/include/public/arch-arm.h). I
> would suggest to allocate the region just before the grant-table (see
> GUEST_GNTTAB_BASE).

That makes sense. So I'm now thinking of adding XENMAPSPACE_pv_time and a
new call site of xc_domain_add_to_physmap() to kick MFN allocations + P2M
setup for PV time shared regions of dynamically created domains.
Thank you for the review.

Koichiro Den

> 
> > In any case, I agree that conditional allocation would be preferable.
> 
> For XL, I would suggest to introduce a field flags in xen_arch_domainconfig
> and use one bit for enabling the PV time interface. The other bits would be
> reserved for the future (so we would need to check they are zeroes). You can
> have a look how "flags" in xen_domctl_createdomain is handled.
> 
> [...]
> 
> > > > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > > > index a3487ca71303..c231c45fe40f 100644
> > > > --- a/xen/arch/arm/include/asm/domain.h
> > > > +++ b/xen/arch/arm/include/asm/domain.h
> > > > @@ -59,6 +59,18 @@ struct paging_domain {
> > > >        unsigned long p2m_total_pages;
> > > >    };
> > > > +/* Stolen time shared memory region (ARM DEN 0057A.b) */
> > > > +struct pv_time_region {
> > > > +    /* This field must be 0 as per ARM DEN 0057A.b */
> > > > +    uint32_t revision;
> > > > +
> > > > +    /* This field must be 0 as per ARM DEN 0057A.b */
> > > > +    uint32_t attribute;
> > > > +
> > > > +    /* Total stolen time in nanoseconds */
> > > > +    uint64_t stolen_time;
> > > > +} __aligned(64);
> > > > +
> > > >    struct arch_domain
> > > >    {
> > > >    #ifdef CONFIG_ARM_64
> > > > @@ -121,6 +133,9 @@ struct arch_domain
> > > >        void *tee;
> > > >    #endif
> > > > +    struct pv_time_region *pv_time_regions;
> > > > +    gfn_t pv_time_regions_gfn;
> > > 
> > > Given the feature is 32-bit specific, shouldn't the field be protected with
> > > #define CONFIG_ARM_32?
> > 
> > Is this typo s/32/64/? Assuming so, I'll do so (=protect them with #ifdef
> > CONFIG_ARM_64) in the next iteration. Thanks!
> 
> Yes this is a typo.
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

