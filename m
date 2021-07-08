Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07D3C13F1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 15:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153119.282883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ToB-0004j4-Qm; Thu, 08 Jul 2021 13:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153119.282883; Thu, 08 Jul 2021 13:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ToB-0004gf-NS; Thu, 08 Jul 2021 13:11:15 +0000
Received: by outflank-mailman (input) for mailman id 153119;
 Thu, 08 Jul 2021 13:11:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1ToA-0004gZ-Gx
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 13:11:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f81e5bfa-dfed-11eb-856e-12813bfff9fa;
 Thu, 08 Jul 2021 13:11:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-hNxWYglAO0O33bdWQOT1nA-2; Thu, 08 Jul 2021 15:11:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Thu, 8 Jul
 2021 13:11:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 13:11:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 8 Jul 2021 13:11:07 +0000
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
X-Inumbo-ID: f81e5bfa-dfed-11eb-856e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625749872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dApYUv0qBUWG/wRh9snu9rIDXsxOLh5oXW2J0EqkRjU=;
	b=Qqx0quu3LaPpEv3UKaoxcfTUVCJdqqyZ4Ageis0pbRP2ZLUDko+GHIHIIqPV9FHjMiSWRR
	jUM85mvNImZ++0vS79RqCcWiLh7XAyGwMCXwPJd36JGiLPCAotzNr5GEMQrjePD6G13ADX
	F6l58zTv8KDsA9n0XAoui1KNse6jzB4=
X-MC-Unique: hNxWYglAO0O33bdWQOT1nA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLk6rZXViFu7Y2TOTHEwfy+5qhcjUEiTjSi6kMpRGeXLTbX3cociKgiFbMBooAUrovV3rDjELkIC/xFLAivmxSI/7lEPP+ksRSarbKcIm68kBgOyjE/b2YRfIISMEB1+lE4PEfpF5omiGQQK8c8YF9Wb+8AWhcinwjQwlYQHJWxx/r6ZnVjjdHag26Sh/lMpr8oak2Z0htwisXLvRKo8S2kU/ij6nZ2nI8HAflZ9UTpf7XU5jWbAzraMs/IcvlXhZMVMP4bUgwJyq5tHK0hHDEGJ6ztg3dNRvQ9+HYT90fh+EYuBYxpDtZmRqcHThU2bsthHu+O5fgH7h7Crq7javQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dApYUv0qBUWG/wRh9snu9rIDXsxOLh5oXW2J0EqkRjU=;
 b=VAdiMJmCCnkHquSE7nCNKxGliAxuVRHKEHKT11p5bVn2xgqH4N/LqJtEDZeDgu/H6Zb6uOWhuYl+I9NGhM0XBMpHSF/WcCncMuT6CDYDiunbP3Ww98QghFaoUsZZlfddIf+OxfBl+h3fHQLWLwAP9tik36vCfLozzFSuuTARH74GmErqSzBHFd899+WNWsyd/UqH6txXatl6Z0IIaLW8i7KjejDh9GyGbKXq6AT5WBxkUnsfTStdvu1qcRh5rsACLAp1Ay7ZZVM8BoTErPXY1CrIOg2FbiRJ7sSc0r17Zp2piXt14tQahonZz/FJQQbufDHnu9YhJ6mK9ouJcAw/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 3/3] xen/blkfront: don't trust the backend response
 data blindly
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c33d7570-d986-749d-1e4f-85829a11babb@suse.com>
Date: Thu, 8 Jul 2021 15:11:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708124345.10173-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61fe5661-7176-464b-7042-08d94211d979
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167CFFD359DFFA79FC3CAA9B3199@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	759rmCWBcna+LESXm5El+06QO+Q6e7T+OsR8b3PRrlz1pTEf97QY5nwzO0VTRAD5AITHyW/5RhzwRArdlA9LP+HXD5xnv4wQZ1OGyT6lZz60QU6kWxSfd1E0utFJo6MWlG2jYQQiN6p9+8zfcGyEMZhWepH2SuAQGWiHyNEQzxzdBHvp7jCLaNvAA2FJsXEcA6jZhpfvUku/gtWyLHciGhBfv4FyMwcxsT46WG6MIqn2m3549kQoAg0zE5eG6KqVJZsPqJCDXIn5N3rqsY1RBVqZTydhv2Cc5hVU0nQb0EGQe+bxOmKIKmz7PSpdq/865hpNPeb+EN0sZSxG4pOR/KdggK9Mo63ZKi+LT1rxEKdzDZvYtIO2cvFRxpiaQH1NkSy3SqbhVSLx9cD2ovGCrv3126ibKkAlMPKtO0egzPlkBxOYiXUjGsGA9jQ+dOCPDwAIrc2Vxj8F53kte6RUlOmBZiYesKfQJTZ6iY1v4CmYBXaafpPBAlZ1yviuFyjCdzqbusIge57qXj93Ube9Ni2uVBwagzpNSj3/MtK6UIKeYNCf/zCtnkF/l4essmfv38S94cVhlnd6vJczwbqLgzpPY0U+AEGTF5TslS0TKVn7LcbTwEw4/BRgvSQ0EWdQNrVLGyRXmD4MU91FtoOm3rZAladVU/+S4e8knJKiH/y2V/6uWnXVvhaUnjNjxdPK+axWhssgjrS8AATUGbZg/wksCwNqnXOVlkINpo4bQ+ZdWqELhYdUnD//+jUjkoOv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(39850400004)(396003)(376002)(26005)(66556008)(86362001)(37006003)(16576012)(54906003)(8676002)(478600001)(5660300002)(6636002)(36756003)(53546011)(66476007)(6486002)(956004)(4326008)(2616005)(38100700002)(83380400001)(66946007)(31686004)(31696002)(6862004)(186003)(2906002)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxEekdzSnduZXRsZWZ4QnJWY0RxZU5uVlN0SEM1SitLN2dkYTVnQ3hNZUow?=
 =?utf-8?B?bVcrREhoUzNjYi9KZDdYNnRGYysxVk1sN1F4dmtsWDI1WEd0T2Y3ekhXUDNR?=
 =?utf-8?B?M29LYWFHdkhyaUdoTGRnc05TMFM5cVB6dkQwc1BzZFVubk96N2VlVmZQWlBj?=
 =?utf-8?B?MkxManh0V2x3NkdVMnJ6bHFqR09DYWppdVRrTjJ4OU1zaUN2OG9nNVM1Ym0w?=
 =?utf-8?B?THVNVHdvOFNtMnA0WENLTFZ3K1hYVXlBZGszWXYzWXQwRVpDRHVtS1JDOEtw?=
 =?utf-8?B?NlVHcmpmTS9ZUEZBY0FMTDhDVDlpNWFaWGRpeWQ0eWJ2WHZwN1d6WjZOK0sr?=
 =?utf-8?B?YUwrcWg2THZ0Y04rSjhXNXpJcmo4UEdxSkM3czdQVEwvSXF6RE1ra1ZFSXcv?=
 =?utf-8?B?aGlKTHZVSE5yVmNuckthUUVRM0xVUUJYUTlEd3RpUW93VW5FSENtK2d2YTZy?=
 =?utf-8?B?R2RDSXVycTU3b01laDFXcGJXaXVqcGtRTEp0OW9ubHZFRklvMHpQc1gwMXdN?=
 =?utf-8?B?TFdhUDNndVFQUDI0cFcxRDVvTHZqTCt6NVlHR21IZk9NZ3R0bGh0d0dpZTlB?=
 =?utf-8?B?QmFYZUVqTG9RYXR0dHZkZVBBNS9yNDdra2xKVGRPRS80KzdXU3RlclM0Z3By?=
 =?utf-8?B?RzB2U1c2bGVtcmxRdyt1WWZFb2lCbzJoVk9ZVzZmT2I4UG1nZjd4ZWxPNCtC?=
 =?utf-8?B?OG5zbUxhUTBKekN4T0VCVmVtR0ZDQWdOUUlFWEQ3OHFKNCtZM3RBZDNCRW5D?=
 =?utf-8?B?dUlwcXRnSE4zL0s5YVlhaGZBRDhNRHBxTFFFVE9OdlYyaGUyVFBnaEJSQ3Rh?=
 =?utf-8?B?ZmsrMGlZVFBLRWNyRjRaNVFXYjhLWmlCYW80R2d6RkQyQ0p5dEFYeTYzVmE2?=
 =?utf-8?B?SVlVN3M1OGd0eDU1Wks3UVduUCtqZ2xIbSt5R0JsMVU4SmlEb2FRWHJZdXhy?=
 =?utf-8?B?eDhITGlCenZKRUVmSTBzOEJmbUJCc2RPZHB1MnlCVzZVQjdiN3FIcmpHV1VF?=
 =?utf-8?B?c3J0V0Zqd05USENHei9zWmJRWWxLVVVBYkVJNU54NGo3cmJScWRyUUhUYTEx?=
 =?utf-8?B?OU1WSTNIV1FZanRJQ041YmxobytPV3luaHFOQU5rWFJOZDlkSnFod2hoN1l4?=
 =?utf-8?B?MUpqWGxWcVNFME1rcTdSdlpBc2VaRHVQWk1Zd1Fhby9ndklZTERXaEJML2xW?=
 =?utf-8?B?NVdXYk1rNTJLeWRac1o3ekJZR2N1N0RtZlczZ2VvdzRPejZjQ2RmYkpmSEdu?=
 =?utf-8?B?OUtiNkZiQ2ZteEdGUVNSZENRbXlWWitrM3BIYmRaQ291Nm43RHlLM0dDbzFa?=
 =?utf-8?B?SUJETldTTVNJQlFnTktzWlNxNjZOYTlVZ1NNYy82WExDTTVjcVhpSXRaa2w0?=
 =?utf-8?B?YWNVYUE4eG02WDNTR3VmZFh1WjUzb1c1QVE2TDFxUndLWTNLc0p5ZDNmb0xL?=
 =?utf-8?B?aTZEaDJlZE12RGdkdDJLWm96N0l1bFNDZGFUSW1xbmlzZmxKNGpmYkxOUlNV?=
 =?utf-8?B?QSt6YjBIMFlKL29NYnNFQjJtMUtJN2d2WU5GbXBQYlBOK0hlNUs3a1Z4UlFQ?=
 =?utf-8?B?NVQ1YUZweFlLYWRJN1QrK2Fjait4bnVrSFVqMDhEVjI1OGZsWVYvT1V1MzVp?=
 =?utf-8?B?Tkw1czRkZTFyYnA0OHBOenJzRlkxZE52VlZ3SXdReXBWMVp6cUNRVUlLRFQv?=
 =?utf-8?B?SUlwaklBZzlNTXZRSDQvcmV6ZWtiU1RuLzlHSWFxWG1GU3RGSW1oR0F4T3NS?=
 =?utf-8?Q?yI8EV2NI00WjuHSuVYQU0ZjybhMWs9QAGQwNOZj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fe5661-7176-464b-7042-08d94211d979
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:11:08.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sCOwJ3oMz+phsm4z9QPbBYGdLGN3i73yU8PrsQVHmk4uitO1FJ0I4hCLnqSjGVc/I/9/WxEWIT3Px3MFIe9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 08.07.2021 14:43, Juergen Gross wrote:
> Today blkfront will trust the backend to send only sane response data.
> In order to avoid privilege escalations or crashes in case of malicious
> backends verify the data to be within expected limits. Especially make
> sure that the response always references an outstanding request.
> 
> Introduce a new state of the ring BLKIF_STATE_ERROR which will be
> switched to in case an inconsistency is being detected. Recovering from
> this state is possible only via removing and adding the virtual device
> again (e.g. via a suspend/resume cycle).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> @@ -1602,7 +1628,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_DISCARD:
>  			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
>  				struct request_queue *rq = info->rq;
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>  					   info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  				info->feature_discard = 0;
> @@ -1614,13 +1641,13 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_FLUSH_DISKCACHE:
>  		case BLKIF_OP_WRITE_BARRIER:
>  			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
>  			if (unlikely(bret.status == BLKIF_RSP_ERROR &&
>  				     rinfo->shadow[id].req.u.rw.nr_segments == 0)) {
> -				printk(KERN_WARNING "blkfront: %s: empty %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: empty %s op failed\n",
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
> @@ -1635,8 +1662,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_READ:
>  		case BLKIF_OP_WRITE:
>  			if (unlikely(bret.status != BLKIF_RSP_OKAY))
> -				dev_dbg(&info->xbdev->dev, "Bad return from blkdev data "
> -					"request: %x\n", bret.status);
> +				dev_dbg_ratelimited(&info->xbdev->dev,
> +					"Bad return from blkdev data request: %x\n", bret.status);
>  
>  			break;
>  		default:

... all of these look kind of unrelated to the topic of the patch,
and the conversion also isn't mentioned as on-purpose in the
description.

Jan


