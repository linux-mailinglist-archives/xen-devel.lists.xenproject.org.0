Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B54BFC5C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276842.473163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWzT-0005RA-5k; Tue, 22 Feb 2022 15:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276842.473163; Tue, 22 Feb 2022 15:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWzT-0005OB-29; Tue, 22 Feb 2022 15:22:11 +0000
Received: by outflank-mailman (input) for mailman id 276842;
 Tue, 22 Feb 2022 15:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMWzR-0004xs-UB
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:22:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33059cde-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:22:08 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-EuGrLnZ8Px-WQTJXZQ1mgQ-1; Tue, 22 Feb 2022 16:22:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4170.eurprd04.prod.outlook.com (2603:10a6:5:19::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Tue, 22 Feb
 2022 15:22:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 15:22:05 +0000
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
X-Inumbo-ID: 33059cde-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645543328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7C1TYxIrM4iGA02CqMktBHSEKGII9ThfElLzKOxJ1s=;
	b=OBIs31DmGyQN5bPfBV+2AbPqkq6EIpwKoD+zdcHFR+LoqtvqCq4sHVzYp1k9B5r+DXVJ73
	dhWhj3pTijY1IJ91MGHItlpANkM7AWmbUPBZoujYMVddRiWFgZSfaiQl5kHs+n37ZGE4Yk
	B/crJ/R8o4EEFaw18j6lZZtKZ3MlNbk=
X-MC-Unique: EuGrLnZ8Px-WQTJXZQ1mgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsNAORj5ejULJUUH+l2IRq/CSx2QjuvtulYYaRYO1LNI1ZAdBJkF/MbNjdKYLbiO+4XQUb21ivACGtmrg4ViYHAe/vmpSlbM7Tynw69WxwNOifja7ZvXi6Q/KhA8OQlqb7uGM6X2VJieqyazSSkmBVWzAJ8cVJUZTQVUXVBsFh0dT3Pbkm7k7v/3l1aXD2fA5XmIWHk0/gMwE8miiE680kczu8jnQrd1TiFtGrXJKD8MtEALh2Z6sqNjc9HqkE1j1lX5MfU0B0Hg2RNTmWZseuGEDd0DCoira+l/68htwRiKeawiceQbb/CisJHY46afEc/8V3E4VMIll0AJydUtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7C1TYxIrM4iGA02CqMktBHSEKGII9ThfElLzKOxJ1s=;
 b=TlpKhnzLrfaey7W2bVKxLR5tx35lc0exnxs+lkyUrqQPL+BRP1HchgSvgECdF3NVMmV0Pv9fr6mRfHfHJbnbwkftyf7N0rR73KrQzJT23SQ0JsVXT2X3NGwG+JgNDFOGdbbG9oKFfD+N5DlJ2EGgx3M6tVGLsKTpX+1skOyocRpTfUia7Tk7Qqo6xbDCZSDjsHg2tE4wx2Vy69gEmeE6N0gAjVzgcWpBQLC2WJSBA3gKcqHvMGyaLDwUNvE9i5reIpVZWuHbdxtjc+TJwrxXEltdscsM0otMKGpTYvluACK52/LOj+RvF5PviW+epwuCwpjP9RtSYxbwBxV0RNpPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
Date: Tue, 22 Feb 2022 16:22:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220221102218.33785-15-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:206:1::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477b96bf-95ce-4ad3-38d8-08d9f6171558
X-MS-TrafficTypeDiagnostic: DB7PR04MB4170:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4170C9C1E8497CD58D71E112B33B9@DB7PR04MB4170.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sIk1PX/YrWDaNB+/i79FXzD0g7VdhxFZG+plavQuz4eX7xFrrBUfTLVYmFvTlQBmX6+sWlI1jtranNWO8NmixKHkZYZJAFogc2S51vA5CjQsDdvz4vj3ghB1fJxquJ+4YmFusGgBlEU78Wg3hCpxVn5Ein3PAd+Ru+31Cd6DGg30nTWB1uOX7o+u9uLjgfV5vZqbSNnF5J6JrngKQZqQ9v9QliRpjpUfgPbMTXuT6eXRhhcy1Jd1EvH3lYwz6S0C0LEGEVkQdImUv9KT+nbY7pvHqok526Nf6w+Ywjyv3AucNE4An5ZjGkeTfIn2pt/F2OVjoYEYzSKeBMahCEIqQZsrBFH10PaVdxSCUqSaAyPPBU+aDx2NxrIcqPYFp4ZLBXXPbrnfrTxN3/jQ7MAuiC7hC+QHdcx0J+Ojb6wifLpUAvhwftHVvI3//Ge1RVgPwSujH+DLS1ylU9M0fVMfnd0AH3tesj55tTePYnc5YBmfhHPczMbKXWhU25c2/kB/q35w8TqJ7wIvgfv5095VTzY8waknsgavUh+atrQMjlAh3wb3Rug8oKPnEl+n5cVIWF1EhFjMAxNV0yHzuWrZBCNOh1Ul+5XjnsE78dRDEB0pSic5PbIjfZ+BJhWG7DFSoJpRSZ8pkHzcUlLSqGjQZYG+empjw2J561QEC3Xi+t4uYYv4zbPlrYtIk0d1x4x0a9Ipx98oPb0hGNWG530igT+cn+YbQz1mKXJ/VYYIC8zQmWhqDRoUE4myk0vs4a02
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6512007)(38100700002)(6916009)(508600001)(316002)(2906002)(36756003)(2616005)(186003)(26005)(6506007)(6486002)(31686004)(31696002)(66556008)(8676002)(66946007)(86362001)(83380400001)(7416002)(54906003)(5660300002)(8936002)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG0yYnRiQnZ6T2JWL1R5UXcwaVVya1pDaEkyZGovK3dMMGUwZjZublR5R0hB?=
 =?utf-8?B?cnJ4U1JHSlFYdDVyd3pnZVVVQytJQWY3cU54aWtrczhGOGIrZ1pSSGZqeW9O?=
 =?utf-8?B?QnFVQ2cwOWRzaHUveTV1bHdpRUlCbmFBMzBtZHNkRkhRcEpHckdxblRBVHFx?=
 =?utf-8?B?ZlNuQjR1WmcxQ2JZQlZ1bXNyOXJoekpxQjVyTFlUd0dKRHk0aHRlenhsNHor?=
 =?utf-8?B?c3VCczJpS29yMTBoL1F3YkswakRMdmV6bFBUSzB2aGlHb2hQYWVVQ0d1SUVX?=
 =?utf-8?B?YUkrQURDRUpVWkxpbGlvN1phSU1YaldhV2Z0QXVvT1FBc2ZCODlIVjhMSTR1?=
 =?utf-8?B?MjBnSHNpSXM4MFpQNWgrZzFnb2psTE9BemZYcUM2Z3BSZWNRbXV5NDdLM1BB?=
 =?utf-8?B?UXlkTk1abXU4Y1ZDdVAzQTdzZXNERGs2UGU5c3U2RngrRHdGZlBPaGNYLzVP?=
 =?utf-8?B?cUVDb0o3ZUlDZGhqRGdoTW84dkE3WDlsUjlpSDNsa2Q5ZmVLWmxXMnRZcTdj?=
 =?utf-8?B?UFg2WWlPZGUxRWEvNDlwTVdqUnovZmJ5NVpwYm1TWVlMd2s4VXdObHYrMENa?=
 =?utf-8?B?dlRmYW40ZHFTVHZUVjYvM1VoOHk0d2xFOXRIdjhPYXM1RnQ2R2pLQlVFWmhU?=
 =?utf-8?B?VVhIOEJ2T3hKV2w2dFlISmNBS05xSExKZUhYVWt6cmpYc2o4YzFuMXprcFV4?=
 =?utf-8?B?Mm5oSWMzTUY3L3NjYkxKRU1hVHRSRndISzR6Uy9JaUlTd09uaU93eERGRjkz?=
 =?utf-8?B?VW5rcWwrSVJKMlhGZGk1bHFNZFpRZi9MTDVxcFgva0tmZ205cTJtdUk1azhF?=
 =?utf-8?B?aHVxZ2llSGhuVUlseGt3dVhVT2dzZU9rMG5vQ3NIc0xrMXBEandDbmNiT1I1?=
 =?utf-8?B?SWtlYTFZQkNxdlNmWDhZaHFKMU0veG5JZTk3bmFHS2xGWCtWSEc5ZmZkYk15?=
 =?utf-8?B?YTRvU3VrUEhmaTdxR0Q2TkFMbC9GdzR3NDNQdGJpYlJUcm9iY1BPV0VXWE5K?=
 =?utf-8?B?R0gxN3JkOWprV2VvdVNCVEFSSVFaNkNsUys4V3FpRXZzSnN2RDVvV1hTa05r?=
 =?utf-8?B?aVZ4V1EwSUxjYzYvTzB3bHl3aE82REZRU3FvSDZWbFladTVFTE5ZR0F1ZkdC?=
 =?utf-8?B?elE2ZUxSazJJY3Y3ZGpWRDQ2Yy9rV3UvMzNtNFpPb3lvU1ZDOGlpTkswSVFh?=
 =?utf-8?B?dFJRTFFZQXNIamVLeGo4QWdqR3pwY3JsdjlqVUcyWWowcXh5eWtjZ09kZHhS?=
 =?utf-8?B?bUVCMllrUkYwYm5zRVF0dGtjcXBSRGV2WW9Pc1hYNzREWElVS1puWXlBdGZ6?=
 =?utf-8?B?KzBJU1NIbHVBQTZVYThYdEVRczE1UithUzNqU05lY0t0cTRmM0ZoQnFPTnl3?=
 =?utf-8?B?dXRBRk5ENi9pWGlhZjZVTWs0bWs3Vjc3K0hud2E0aExiUkFTZGhLQmxQZURz?=
 =?utf-8?B?VzNWRmtMUDk3Y3pseFllUTRiYURhaE4vWC9hR2t3TU96QUFBWjU1TElPZWZn?=
 =?utf-8?B?Y0p4NGR0ZkZJcGQ3OTgxTCtXK2pXd3poWUdEWEsxaWptT3QvRDZoODd4VFZC?=
 =?utf-8?B?MWJGVVFLaUxnMWVuclQ1ZzFGVUlmTXAyRU1zZ0FlU2lBd0FTV3gvRFNzUVZX?=
 =?utf-8?B?aHc4dFpkZE1TS0ZCNTRMdGp6NDNkbU1EV3NaN1VSbGdJUTJnTVV1VDZ0Qys1?=
 =?utf-8?B?Z3J0N2ZZZ1RzRW9vb2NKTzVRL2EraGYwbDJIQTZ6enlNNFNkdTZUdzlOdWpP?=
 =?utf-8?B?VVVUNHBXMFNPc2x2ZlBmRUtUSk1UMDkyb0ZHdTVMSzN0VW8rYlVITDlGM2cy?=
 =?utf-8?B?YmpYdExvRzVEazZHOUd1Y1JUU0tqUDRXMmpFd2lxMFJIeHdEbFljdDEwd0Rw?=
 =?utf-8?B?T1B2T25RcktTQzZPbmdBOU1xb0xSWEVXeGJIRXZBWHpTblN0SGg5eDllMzBl?=
 =?utf-8?B?dEFRR2IrQlRxeEFETUVyUnVEVjVKSWdhVDNlN0ZaOG5WTjdjMHhBNXJjWHky?=
 =?utf-8?B?bDRLbm5nMTBabkRBdXVYdk4wVVFLaC9ybERYbWlXdW9mSVU3dk5Od3hqNmpv?=
 =?utf-8?B?REFMbHZFTlkrRGp5WGZqNFpyUXpUUFpNUlNpeHVoUStsTjB1VGFWeVZJZU02?=
 =?utf-8?B?QS9OdDZjTXRtRzhVQk1ZaDI2dmhEQkpWRzFndXM3ZWpFMmp5Q2hKbHFmWjFD?=
 =?utf-8?Q?UQtBO3x6JUzAT8mzR044gdM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477b96bf-95ce-4ad3-38d8-08d9f6171558
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:22:05.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLpdyJAY/r3P5UB8JdaMilTNBkvCPB8akIvyWZBr/cqt8ylmf0Pw/zBGore8uLjAamk72W4O3/t7ry+0sf3xkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4170

On 21.02.2022 11:22, Julien Grall wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -28,6 +28,7 @@ obj-y += multicall.o
>  obj-y += notifier.o
>  obj-y += page_alloc.o
>  obj-$(CONFIG_HAS_PDX) += pdx.o
> +obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>  obj-$(CONFIG_PERF_COUNTERS) += perfc.o
>  obj-y += preempt.o
>  obj-y += random.o

Nit: Please move the insertion one line further down.

> --- /dev/null
> +++ b/xen/common/pmap.c
> @@ -0,0 +1,79 @@
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/pmap.h>
> +#include <asm/fixmap.h>
> +
> +/*
> + * Simple mapping infrastructure to map / unmap pages in fixed map.
> + * This is used to set up the page table for mapcache, which is used
> + * by map domain page infrastructure.

Is this comment stale from its original x86 purpose?

> + * This structure is not protected by any locks, so it must not be used after
> + * smp bring-up.
> + */
> +
> +/* Bitmap to track which slot is used */
> +static unsigned long __initdata inuse;

I guess this wants to use DECLARE_BITMAP(), for ...

> +void *__init pmap_map(mfn_t mfn)
> +{
> +    unsigned long flags;
> +    unsigned int idx;
> +    unsigned int slot;
> +
> +    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_BYTE < NUM_FIX_PMAP);
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +
> +    local_irq_save(flags);
> +
> +    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);

... this to be correct irrespective of how large NUM_FIX_PMAP is?
I think that's preferable over the BUILD_BUG_ON().

> +    if ( idx == NUM_FIX_PMAP )
> +        panic("Out of PMAP slots\n");
> +
> +    __set_bit(idx, &inuse);
> +
> +    slot = idx + FIXMAP_PMAP_BEGIN;
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +
> +    /*
> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
> +     * PTEs directly instead. The same is true for pmap_unmap().
> +     */
> +    arch_pmap_map(slot, mfn);

I'm less certain here, but like above I'm under the impression
that this comment may no longer be accurate.

> +    local_irq_restore(flags);

What is this IRQ save/restore intended to protect against, when
use of this function is limited to pre-SMP boot anyway?

Jan


