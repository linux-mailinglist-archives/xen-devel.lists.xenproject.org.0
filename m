Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54856B3A3FD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099272.1453257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureNq-0000Qy-0Z; Thu, 28 Aug 2025 15:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099272.1453257; Thu, 28 Aug 2025 15:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureNp-0000OJ-TK; Thu, 28 Aug 2025 15:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1099272;
 Thu, 28 Aug 2025 15:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AInb=3I=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1ureNo-0000NO-SI
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:17:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:200a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24f8de7b-8422-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:17:47 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 15:17:31 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 15:17:31 +0000
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
X-Inumbo-ID: 24f8de7b-8422-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeFisRlfdtskQJuokSZMY5Xg0kP2ri832SWOoOxZmFyfr1hQfzKObwTm+dZ/jmzAp7YiYKcameskckoFkgeqeKsJxR2M86hxVxefTFJbbHlbo89kJvMWfHWDSwK/7Xbo0GP+iu1sr0X8F7X9m2WKLIg4t6QznLNFOH/MxS6vCOK3IPW3oyYLUg9yK0etWTT2a+s/dKUyjQ88tELxataJ7E5iLzNbugrf5kkulSCJGU/EvDMBusPgZ8cjI4kdKgZrWBT8VeRErl8D8Ri5s/0qX+BTGAQoUlsRXJ/0BnVyew7Z3j3iM+QlgZObIGJGnjVP1RNDkbX2v1H7YIjLyIISSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gj2EZNRr0DPgaVxIhfrzZTloYAFkHlRSLQ88RnkN/Y=;
 b=dJXQVVIKxoWlQmbSqqZra4WL6Kz2zfSDPLs05lcSjOU93g6u6C66YMMC8Lt3Gk8wFzCpFvCT5ecVUr69Yz9PvqCgt8QZlH+B83dzj16RIDYQMsoCT04lKTgWQTCPY1rNP6GnD9WyIvwDUgafnL0bPZdm8DCw5ABjQBMBINbCBaiLuf7hCYi52ryeathkd22iFVq6j6zhCh3E5CMa04us5TUS23R+FIpNb8rlNq78JyS1RQyYFtZ99/2WNmCca3aanZ1jIYmPQ/OkZg+Wvu8mWT96SktYVKQjqsH52wQNa9gpzJz/G0n/q5JG6ysHSnvUGNNYmzoeUJKVqVuN27ktMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gj2EZNRr0DPgaVxIhfrzZTloYAFkHlRSLQ88RnkN/Y=;
 b=UIZ0GZxLWq96gYKdBE/P4lQCZJ/U53VWHTY3ryAUhjy0X1E+7u9oiu3k5AoUiMUDaa8eL1b1Wdk5oukxyOCLIGxGWfEqpGWwD0WnuQqK0CWUk4Pjv6sZATLWHy3VvkAz1N6i0ZIuB2gSyRBKH3ged5fEf/orLDC4hWPRCFed0nYiRGEAkC1JX6QMt+qgnmMkpflTk5txVNqxo17dOPUe5QdVM6bbYWPbF1aOsOZApv4G9Ez+qUarJEoHsl2dH5FPFKLe1FDSweTA21KHqzfcelVf5uDwFPAMt74wpsbdBW+zyizr+r4458egUOpiKxlVc2I7emXXunUtZG0jyRuMsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Thu, 28 Aug 2025 12:17:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 09/16] dma-mapping: handle MMIO flow in
 dma_map|unmap_page
Message-ID: <20250828151730.GH9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <ba5b6525bb8d49ca356a299aa63b0a495d3c74ca.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba5b6525bb8d49ca356a299aa63b0a495d3c74ca.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: ac16ca3a-0c04-4c85-d3ef-08dde64601de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njO48yMTkw5FBTMUHcU9RfdwduyPEqfYr5sDmRvb6M70ofOoeXEHGdq1KNf4?=
 =?us-ascii?Q?QnOK8yoCKTiN54zd+3Ivy4vhFI07qsRdXAtVykVph5TO913t+GGI3xiUDVb+?=
 =?us-ascii?Q?jdnd66i9zxJkY2od5xp8XaKem47dhOkzbyqZTg0QSTIE1Kl+JtwAQuGucH+T?=
 =?us-ascii?Q?WjnqVfoyqNqJyAXe7F4pk/eGqkOCR+KiacAhMEjzezrQL3MBdzW1NdVzexOQ?=
 =?us-ascii?Q?4JoB0upSpmTOokwwxt2bakEPV0ltEhyRe9dYQxfuSK2Ni5IBHIpgyw9/GjgO?=
 =?us-ascii?Q?rNdkK/h3qoZxtMvYY2QtRdUSkPrc4Xxm4GIfjB32jEXKmfR0gmsX86ipkdSl?=
 =?us-ascii?Q?+ImevhWLNt2q31YwRfzliMD7KZSG0HsQjlY1SSVnmAUUf82tnmqrimbEPDLg?=
 =?us-ascii?Q?eSdVfVKj7cOEAAq1+leLcYkCxGBZl12n84VymHT0KYsqW8wleBoLujozvOqc?=
 =?us-ascii?Q?zmgLDEGRinBrPJDXwZuGq2f9BT4fJm0zdrIJfns1LtxKDEMqVmDAWNh8/SgO?=
 =?us-ascii?Q?9V2fUyO5leN0oa/4AVwYmWXV3aV4V2gUOzu1EVUlutMPRpfmeGz2vW1gub/D?=
 =?us-ascii?Q?ki9V01NbOn8YGcJiX8wDYnKzaK4aqlnnVuZH9YRSeCaaRm1Muo77Uhd5L3LH?=
 =?us-ascii?Q?INl61YEAVQO0z56Kjz68QZSheFaG3KDVD5f5BEn1oRj0PzThcoCsU2k9tWIq?=
 =?us-ascii?Q?UxNTSR+Pb4sW53wbVO7DgnW1qURzXATYaVpNa00mg1Yy1LSGgkQQCjRYGBHq?=
 =?us-ascii?Q?27O1T4Jx5AHYP3cBB6ymsreMfcb/Ta+gxBBQAtwbjxMsJVU7jz88CVvQn7/z?=
 =?us-ascii?Q?+WKSsy1NKee+3h6bbDYWAOH4FdM2Y7eQx41AvGBe13AgWiTDC0b+ZD+eRZWx?=
 =?us-ascii?Q?ZwsdUsxeIZx+zEvtrxiMU5OhJJlwBlTPBOjO5wSkKX3WqPUSpjaxR8BDV2VU?=
 =?us-ascii?Q?1wx3mUKsBiRWWhdj7HUjQN53bDZFnAWV7CUSCUt1EO/Y/VTP3xsRgujjSe/+?=
 =?us-ascii?Q?BSLh/DT/4OCuihxSMkTch9BW7a3YK/5gJJyPDDblqNZ0pcDTobHcfz8DTYJn?=
 =?us-ascii?Q?Ck8DUdWdRnBvLdNHEaGz8HiqeczuoebVoyqnxnVuNzA+nxR3ymb+d0uKw4uZ?=
 =?us-ascii?Q?iKR+taHPMsQ2WzJ7cabBlBYVSqX63f6H5dMGHIn9K44bU/MW0BOeJY4BhkwA?=
 =?us-ascii?Q?QHSqhhpxargIpwGhK1abMW0zmR+qJVJuDoXc3rIZSpt8N3mkfHnb0ikI8p48?=
 =?us-ascii?Q?CwJzWANXRtAbCp8qfDMvPDcUQuWlZvAVE8yRoHDUNhguvACqUuTu6nDAg/vQ?=
 =?us-ascii?Q?t5GGhsyS4K6VUdYb16hY8nIS2UJkrMLqTASPdhZdqWPT/P3qqDThBqsezU7w?=
 =?us-ascii?Q?ckjS0OwVRy8YboJ9/UkMDTqTRY5Q2TSeLuYkVmRNbBTZUYbRAwnlOakGXQWO?=
 =?us-ascii?Q?xKNTVNVhIIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdNZg78XP2T9TUtHO4FrQOYHXwTm5pXMXy4+gH+6XrSX7+gSRUdR6SOGtYEH?=
 =?us-ascii?Q?HBth39Oc9aLRJBNWgk7O8lPEICHVy+pfoNIpyct5Rj3WezAlVOXAvl4iRCzg?=
 =?us-ascii?Q?VRcyxl9TvcvDq4wWiG56ZTJlx7IDlObxlQ9JuyPvdbibioMEpVIfgfJGHkB/?=
 =?us-ascii?Q?B5MPYLJACoNIJH3MHSn0DW2KwM+6yeEyfC9LQ4PqD9PeN7fmLX3u/JSRbXIy?=
 =?us-ascii?Q?NAXdRpAs3wuONAvSTzn+75geHNCvqxmuFmZLoEz/AqX61KOtRvg93Ee78uND?=
 =?us-ascii?Q?peUCkwk8Oy09PptlLWkstUOcVdOS4my9pSfWso3H/0IROqZIFLkKoDoNkwcv?=
 =?us-ascii?Q?kILYeC7kNf+VH6z19s6jkr1t2zH4PtxftHk+sUqKCeX4wQV7ZJ8w6+ko2CqB?=
 =?us-ascii?Q?iEXLEDSYPg85+Njc5Kaw6p7ej/9nB5LQvS3L9gSNVGzPX7fiPT0jfn+sbDwA?=
 =?us-ascii?Q?zDo1NrvIGE8yJgrURQyQGI8NGl/gmac6MSrfKEyE2wYOwuihBg+52zpOsKDT?=
 =?us-ascii?Q?zVPQGuknFn6xhw0ULIhgilBdsMTevgwlb8qik+1gJ43vwHxDHCa2Anp9iHQk?=
 =?us-ascii?Q?TJLSt9NQ1qSa8R2ssZqykd9si9z9ihI5/MiAuuMbmYKUqklCS2wrGtcSAl9t?=
 =?us-ascii?Q?f7B56uwj1x2ObZAI4STPBh9GoCG0cjFA0CDbaCzesWcfTbERSpM84j599A3A?=
 =?us-ascii?Q?7/pOpboO/5AzqdZXmgN3iusPK4ZsGs3PawOZNUKRjdOoMirfvjsNjGaAu3e9?=
 =?us-ascii?Q?mHR5nsa+ehX36f5u+5vBZKoaCd7cliPg1DxHMnaRcEKCzF/+WOoA7I23qLG9?=
 =?us-ascii?Q?WWME2fMxQsO5zwF5c0bzvTXVO6Hi2XAQfd98biDYJK17A7m5+17+VtkU5337?=
 =?us-ascii?Q?YjFKF/V5Pq6THGrsvVlUSNoNyIG/X0vgCedtyw+iebNuNTKeWWOyklAbORXt?=
 =?us-ascii?Q?2JUO+pW6trCpPpIAfhnlNn4EQ8nX8WAiUMIdLmvdkP5pQpAQ2ATG30U5vkJI?=
 =?us-ascii?Q?MhRMHPJ1FVQgx7yYaRYurqh8qUxc8NDRXR1mXSAO19NQo+k9y1rbWR+JlkLG?=
 =?us-ascii?Q?FuzY4iQ4QiaZwAIKT2jv0ZXztWs+nnlZ2aIG7UdiTK++Sl77Fx1AvE65Amt+?=
 =?us-ascii?Q?Y1875MWrBCt+Wn7UE95WSo+fXxDYboAE+E8BZ++FSd91hEpKBaTazy5qHd5F?=
 =?us-ascii?Q?GvYxoLDevzvJgY7AqRGDY6RqRTMaSAgYOTnWAXVJEqiXjStCFQ2xk2mhoZ/9?=
 =?us-ascii?Q?4O3blNpfVskby8PNMgxF4LDXhmAmGIZ97qQgKAQhEvx9H7K+lpUR9d5i4ctY?=
 =?us-ascii?Q?UMUIVKh1YqIgWJ7ftzcTNKMbIvuAu44IA5qQLDK357xwY6CzE+ywzliWXGJm?=
 =?us-ascii?Q?L6KnQLr6kD1VXrLjSmlzT9MhabxD2MryJs7/a9RtUr/RmwVnntoTXxdp1NJG?=
 =?us-ascii?Q?IZzy0C2fDKu4I01dJA/qvtIZRvPDzy/WptVch3Jg08J+u7E1GsZKopGv3DLM?=
 =?us-ascii?Q?lCw0VQ+/cSQbw0BhTD4bvNTf8wfDSAMKWNhgcNrXutwByTrAMqSyv26wVxme?=
 =?us-ascii?Q?1DqU5O6tlVCU/VrZBMg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac16ca3a-0c04-4c85-d3ef-08dde64601de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 15:17:31.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZwuEXlW337UFGaRmTgrOOZ86hQJ0hssTlhNBI9xQ+44PM8OwEdLJrn8oa/w6/tN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342

On Tue, Aug 19, 2025 at 08:36:53PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Extend base DMA page API to handle MMIO flow and follow
> existing dma_map_resource() implementation to rely on dma_map_direct()
> only to take DMA direct path.

I would reword this a little bit too

dma-mapping: implement DMA_ATTR_MMIO for dma_(un)map_page_attrs()

Make dma_map_page_attrs() and dma_map_page_attrs() respect
DMA_ATTR_MMIO.

DMA_ATR_MMIO makes the functions behave the same as dma_(un)map_resource():
 - No swiotlb is possible
 - Legacy dma_ops arches use ops->map_resource()
 - No kmsan
 - No arch_dma_map_phys_direct()

The prior patches have made the internl funtions called here support
DMA_ATTR_MMIO.

This is also preparation for turning dma_map_resource() into an inline
calling dma_map_phys(DMA_ATTR_MMIO) to consolidate the flows.

> @@ -166,14 +167,25 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>  		return DMA_MAPPING_ERROR;
>  
>  	if (dma_map_direct(dev, ops) ||
> -	    arch_dma_map_phys_direct(dev, phys + size))
> +	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
>  		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);

PPC is the only user of arch_dma_map_phys_direct() and it looks like
it should be called on MMIO memory. Seems like another inconsistency
with map_resource. I'd leave it like the above though for this series.

>  	else if (use_dma_iommu(dev))
>  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
> -	else
> +	else if (is_mmio) {
> +		if (!ops->map_resource)
> +			return DMA_MAPPING_ERROR;

Probably written like:

		if (ops->map_resource)
			addr = ops->map_resource(dev, phys, size, dir, attrs);
		else
			addr = DMA_MAPPING_ERROR;

As I think some of the design here is to run the trace even on the
failure path?

Otherwise looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

