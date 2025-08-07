Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F1B1D7C6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072918.1435851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzca-000838-0Y; Thu, 07 Aug 2025 12:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072918.1435851; Thu, 07 Aug 2025 12:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzcZ-000811-Tx; Thu, 07 Aug 2025 12:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1072918;
 Thu, 07 Aug 2025 12:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=igFk=2T=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1ujzcY-00080v-El
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:21:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0641461d-7389-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 14:21:21 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 12:21:16 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 12:21:16 +0000
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
X-Inumbo-ID: 0641461d-7389-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEnBLU6Fn+bvJuFhXrDOfeHZfZZJoQUlnjFqSU03DmEaY9Yg1dFXTziUDvd/KWouXotCCxOmhxm0KA4hRUofvg7E0TGwICjC2YD/taZ0W5TziXaOIHDbqvjbm1a5AypxMBpknPjxcTrgi9oQS1+Xq4UO5BXlILBEwR/dumMdLmVtAvleshemuIAw8HiOMw1TB3PpbXYyA1ASxPQNUsx6utSMluw8LtvxV2hbzLXjDahxr8QqIDzKBKDOYifIDni01kVBzAgH7uuZ8iDzAoOkc290QmgVBrGpn0yE1Z/bJtlag4IDf2e0d7//imy72cj+VSnuCmoBQRkVlngN9wsWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIwrg5hZVD9n+qTLo0PvHeRDi9M5OxJeYXC5xQMGF9Q=;
 b=iwE/xLTfCyrC8ee1vw4uEG+h34Wn34VeltBaXYu0i2R1gGo9E+A164UBEkCPjYt50rregiXdeh0ja+goDDZ6BiAaUqe/mDjdNl0UQR/M81wN9t899qhRS6KFPNRDVxHnxOYLWMp+InYZ0b8bAopRHOKt7PywTQ63lCxXQBCKkofpy8ooKCYQ9MH8FH8B6G3srzOKf4JVyw9xMQslbXDy+YL/9F1L5UTjI0R0cVkhiHYQzggro9YNqOyXwuFdN9vjsfF+9F3t3uF6tDwgXC51K2O5hcaGOQzDKrAF/8BkQaEV7Y1s6+u9s5ku2+vpT6hS1xAlxSWne/hWbBxGI7xDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIwrg5hZVD9n+qTLo0PvHeRDi9M5OxJeYXC5xQMGF9Q=;
 b=DQup7Rl0SVcoF8re1dFsAIxpcqxYBz+VV52Wxy9CvxRu+neaYypZvKmLsdkFX+t6NJsZ6gSkfMpflsPcNTeB/VurId3edfAI/TRLW+ByvbbBEXjsau9BTNu2OFQWk9hopBCuvRQAyvG6Q259wTim1I/hoXxjEz3RhUOlK8Nvx3/cFUTvTPKG06ayE5i4MiBtL7AFOWCLkITJ3jx/fcM476LRWg1CuJxFQbwp9vNrIGoSRnNnJVI28EHxtqoJ20rofhOKxnpteT3ctRred52UfNO+hOH59kCsvavXhWy6iSZzr2g7TrgWvsivXHV+GVqHgMX30mI6YSP9rEqB5UwR+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Thu, 7 Aug 2025 09:21:15 -0300
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
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250807122115.GH184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0406.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e07372-234c-40d3-7ecb-08ddd5ace814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcmCtkqecLuYtDCnDoRlhvSKgTT5O7jY9fB7njAfEKgRuCXn50LnrysE5XVh?=
 =?us-ascii?Q?HHHAN7z4/J5xvUWNAd3tJhECZcp7Ql+pgNOvcReDfVhuleC4cKTABMpRRtoh?=
 =?us-ascii?Q?aY3QpyTNWixXI0gB/Y4bf1i1lT8HgfkH22q3+mhuQjKup1cVCn6hVl1BZwTM?=
 =?us-ascii?Q?mQpTYRAobaFMQ+OieoSqdQ+Lxj/3WOZ5z1/Gf2LnPEJ2GRKDAbWCU3iM0ud8?=
 =?us-ascii?Q?YC8EqhMwZSSB/3PBhrlTUGKhsNGF8BD/w4jfVA9l6wu/Uk86IG6ge7vWCFyo?=
 =?us-ascii?Q?kys6scYUZbPmGVPGrvywN0OU0G9R7C8fFpcYWMS0mwqVs7RJUMf2j43gIgjb?=
 =?us-ascii?Q?1fkWj8FpnK4bqhJ6pM20nVi0Dt7MNeF0YXVC6YN3C7G4+tfDc+/0gbvqF0Hf?=
 =?us-ascii?Q?usdP28UmpouMZ+UBUtbvL5o+J9Jj6e7EqtPy7C3deVPbXbtBcEveSdekYWWp?=
 =?us-ascii?Q?eaBvTB72MXmZ0735k5aAjIQ8fovIiJhhQejPXveYmqemQduWz25ThPoM1eqZ?=
 =?us-ascii?Q?hvUfKNSh3d21kWNdIOJMdt4WJ0MVo8r+zlHv62h2e2nTLgea8irXlEXv99+t?=
 =?us-ascii?Q?9abB1hQHhLLE9Tfh2wR7W3Hv4Y5lDpziV0LihEpXZevtAXNlboY+/0zE57IU?=
 =?us-ascii?Q?eXAFXMryprJkz0Obz9A0FVlXqO7sNxgYzuodXDJwyagnQSPjhduZXH6990zv?=
 =?us-ascii?Q?A+EYPTlyDjqoZ7HLgtD5T5J9C8MG72WhF0RuUZ7lA0rRbCDq0JZIeEWucW5V?=
 =?us-ascii?Q?Nui9RZGHtiFjRBW4RPuPXgXYypDKxdIwo5LThSu18WEPH6ps/qKfmDYuhW4L?=
 =?us-ascii?Q?6ZMnKQFL3GSt7CUeR26oVB9QFDDPOl/8kKyQivG6jF1zRVwRx995/P4nDTpF?=
 =?us-ascii?Q?bc6sVQoQedRLp3XQ+lU4t3UMcQUXd/b+fvekmRIAzNfKiyGTRfyAp62p89e2?=
 =?us-ascii?Q?7GK5Fu/VExPANjI47G36RPW0wJib+9pK+2+trRdzfYAVg30PXQEVXXXJtfhR?=
 =?us-ascii?Q?TngMZsI9z808iwIf65gqVo6z+OnVmGE+VyNH29KQrQxEylaWxnnfsPvCa+dY?=
 =?us-ascii?Q?xr65GLLJ6QJPeptcsV2b1pN3feRXI/KS4MRmpbV7S+7SeriXKufdylnQ0np5?=
 =?us-ascii?Q?wT4DGlcCFyqgN67yx2P0pHr31Rr6xVoHlhz512Q7+gLbRoRtEQXwCa8vWE0G?=
 =?us-ascii?Q?RJjmlFkvOlyEIUtxEsuQ5PpEzFd+k421rblnu+aj8YpKBCxVDbDzZxTrqvZ/?=
 =?us-ascii?Q?UK2nUKn6Wr2rC3kP2pJZ0D4D2wM0vgGYWhXl16x6dEh/DWhyd/7bOhqKnbKa?=
 =?us-ascii?Q?VNx7NF7SvFys0FhkSckJWJ4fbB6HvKOfE9kd8h4YHoZ2g1ofRjy+wSp3vrL6?=
 =?us-ascii?Q?RxlnheXz0ZYQJjEeRGoG3MIG8njgEYIwj4HY9Pap/obbXlLpfoBKGKw5lLH0?=
 =?us-ascii?Q?pWbcsn5FYYQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pc3vrtdK7uQ3bBQh4HJXdZhAoMLJBbNO+o6b6SQK7JlS0PAL+ZySFf4fmVdb?=
 =?us-ascii?Q?mIfceakcMfVDPHrfP45m4OdncIOaahvpJDFi6KaQUZtVPWJHpIS/+AdiZ2wh?=
 =?us-ascii?Q?9Q2/0qvT3Hmnvhwy2IhfV6Kpk5iVzD6zVFL/9u9FOb2bzU77MAoKSsLFWTH9?=
 =?us-ascii?Q?ZqKyce9MRdpe+RIaTD5blMdKNW/wIIlrtUNrkctASWqipNngYLPc0h8xIct6?=
 =?us-ascii?Q?fV1b8QUAI7TEqblWMxtKN52Vw4lshjLvTsnYS1/fupCu9PQzHyzdmc7BMag/?=
 =?us-ascii?Q?9USsKZAU+mpsX9xyjtf1piM1pDFFYZBGzPppZl9HrgnKeQNcSf/tQpG5OVK3?=
 =?us-ascii?Q?p4kAkYoFaMt/n+ktLk7aKmt47wM9YYjxIhNp5pEd4xHC3EfLwljN3wRqvJ50?=
 =?us-ascii?Q?EXJjKlCI/PJ6iL6IM8I3PoxGPy1I4I/aWl+oz7JH5Pc/o73gOlCL/NelVW4J?=
 =?us-ascii?Q?vR5M9oaGlp1c4HGfhB4uPSMXRASguqiRAhlCMFxGHSpaF8eFzv/K93QZ+W2h?=
 =?us-ascii?Q?mPLhw8Nae/i12HukegIW/6hQDtyd3Xa76UsmmJWTF1hL+NMt0s3ehRtfnulL?=
 =?us-ascii?Q?/mWRDfidY3adfRrJ907pVXv7U9bY7Stcz6kr4LwpeiYUZ2In36hPj22VsY+V?=
 =?us-ascii?Q?+GfoOWGYYmaE5XwMZYD1qLBrK6CIe2bNHmA727jh+sjvPWLG7f+ZZ3GN559Z?=
 =?us-ascii?Q?jYdEBUb1etxVXR46PCFUJ4fHOSV1glLwUmqpkJ0Py15dbLxyYAZh93o2Iz1K?=
 =?us-ascii?Q?xpPllA29goRc3asGj8wfcdb0rQ7YLFCFo3rBMIoBJCsSaQYphu2eqFETyMjA?=
 =?us-ascii?Q?+QkoLVY8A33MyqAB1Iw0tsxu8b+xtrwmr1hxZHMzJyWooM7TdUaSDRkY7lZD?=
 =?us-ascii?Q?FAgXFW9f8wKN51QniBbbgDXkKECwNCXwMu3zH/FFqpQq0C9MiGhECUySmL0o?=
 =?us-ascii?Q?UhMPaQSlMgKqJm+aqgTyGXBDX8mTGT115vrv49BVv5pm6F0atvp4UpzP+nIu?=
 =?us-ascii?Q?q9YHaZYPAXY5q3fln1otyE6eZ9w+u+pdrCDj1yqm1fvNC9jMRfs/vD3IvjdD?=
 =?us-ascii?Q?AkxPl0GL2pZjdEQihDiiY25or1gYy1d+an+dG+QLiHqa4UQ/XBaIvocRDJ3g?=
 =?us-ascii?Q?YdUQgpoSERS7ydpHFp2ccuOJ6JEBUU0/jK7BN1HNQFapRgSsQn38Cuh8nZqQ?=
 =?us-ascii?Q?6p+AreHWoxfwdlexNCoF3YxozoqVWr0am8wJbLzVAZ49RdRgrZygj1JY5v0V?=
 =?us-ascii?Q?B4xCyWa9sLxVoivN8PL2coCjhGr/mi49MWlHpa2W5fejSdZFUhWsWXgfOqJC?=
 =?us-ascii?Q?S4iIvnAXHxWF3bWS2PCpJz7OXmmnsg9IgaSwXrgG0M+eZDZc16V8JpcCO2mq?=
 =?us-ascii?Q?UFnD6SqIs6zN9IqGVGwtUp9tdG//QjZQGA/RH+6hKwFCsumcaMWK6lT3Wo5D?=
 =?us-ascii?Q?9hjlxhWz6r0yvZ8JevHtLQ/0kVB0fUqbPpmV2aIQq9VgY1o1Fc8/x6h4KltS?=
 =?us-ascii?Q?2r8lBtj8ktp7EwM5dokDtJNHLfRfLiefxas8cMFz3Q2Uxigb/bfiMpCa3Zui?=
 =?us-ascii?Q?mY6Q9aoX7ek+jFqDOXk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e07372-234c-40d3-7ecb-08ddd5ace814
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 12:21:16.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JO8XjpfI+n/ktzlAxi3pKObP/UQ+HQjrheHHMFaNuRrOBpujcfgJK85cLbLXwHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017

On Mon, Aug 04, 2025 at 03:42:42PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Convert the KMSAN DMA handling function from page-based to physical
> address-based interface.
> 
> The refactoring renames kmsan_handle_dma() parameters from accepting
> (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> size_t size). A PFN_VALID check is added to prevent KMSAN operations
> on non-page memory, preventing from non struct page backed address,
> 
> As part of this change, support for highmem addresses is implemented
> using kmap_local_page() to handle both lowmem and highmem regions
> properly. All callers throughout the codebase are updated to use the
> new phys_addr_t based interface.

Use the function Matthew pointed at kmap_local_pfn()

Maybe introduce the kmap_local_phys() he suggested too.

>  /* Helper function to handle DMA data transfers. */
> -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> +void kmsan_handle_dma(phys_addr_t phys, size_t size,
>  		      enum dma_data_direction dir)
>  {
>  	u64 page_offset, to_go, addr;
> +	struct page *page;
> +	void *kaddr;
>  
> -	if (PageHighMem(page))
> +	if (!pfn_valid(PHYS_PFN(phys)))
>  		return;

Not needed, the caller must pass in a phys that is kmap
compatible. Maybe just leave a comment. FWIW today this is also not
checking for P2P or DEVICE non-kmap struct pages either, so it should
be fine without checks.

> -	addr = (u64)page_address(page) + offset;
> +
> +	page = phys_to_page(phys);
> +	page_offset = offset_in_page(phys);
> +
>  	/*
>  	 * The kernel may occasionally give us adjacent DMA pages not belonging
>  	 * to the same allocation. Process them separately to avoid triggering
>  	 * internal KMSAN checks.
>  	 */
>  	while (size > 0) {
> -		page_offset = offset_in_page(addr);
>  		to_go = min(PAGE_SIZE - page_offset, (u64)size);
> +
> +		if (PageHighMem(page))
> +			/* Handle highmem pages using kmap */
> +			kaddr = kmap_local_page(page);

No need for the PageHighMem() - just always call kmap_local_pfn().

I'd also propose that any debug/sanitizer checks that the passed phys
is valid for kmap (eg pfn valid, not zone_device, etc) should be
inside the kmap code.

Jason

