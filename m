Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AEA6FB319
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 16:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531596.827368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw224-0000I1-5Q; Mon, 08 May 2023 14:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531596.827368; Mon, 08 May 2023 14:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw224-0000FJ-2D; Mon, 08 May 2023 14:40:08 +0000
Received: by outflank-mailman (input) for mailman id 531596;
 Mon, 08 May 2023 14:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7VId=A5=corigine.com=simon.horman@srs-se1.protection.inumbo.net>)
 id 1pw1tt-0007go-PR
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 14:31:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::71c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 098fad6e-edad-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 16:31:38 +0200 (CEST)
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BY3PR13MB4913.namprd13.prod.outlook.com (2603:10b6:a03:364::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 14:31:29 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 14:31:29 +0000
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
X-Inumbo-ID: 098fad6e-edad-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOPnvtcWRS00h2H1ELQximqgO0pZdIvZXY6u1deEUuC//PltgduwnDCGdKZZArok2EVEDmfyLhb7b5YqaCLYBN0GUitpjBKi/PWuQASYSjQ31i1jKwxrFNO60orrSlp6BUpIhnUd9HZGvRhVeRIEr7hypPXGtlAvnLlk8OXZEUs0aS+cNIJpRUUlmtW0fCKlOpMQZtczLbHt7KCPutJ7PzJtLDrNWGkEQ7LzuJygSlhx3d6pS9qeHzNyt0suI+AjsZMMUkThrFeq66m/e8lImKVbRNNhL94l+rtbyExYq0R5kkDbY8t7iZUEraMZA10e80ksSL1a15BBEPwMXnUktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWHFB7hQg4+3+Z/Kov4mvbp9ZaOMHz+OyvOUtUL64qU=;
 b=O6wj9HG0SuckzQ6nfabxIDbVQPSBah283PxlOayQ2YTpeuIDbvSlK9dDvidWpVhR6wXXe88LKyEqSjzygdbEKSTWnQ/5F+juT3tN1xGN5xrM8DjTyy6bamk8VcSnopf4liQbknCTURS7fAmDAbQTNBL4Io6qOyx1xLO/sIUqzFp/0+OOorf3JErUhSX4K2qLJrXAVb96Yz6DhSodLdNM/49gJVIvCVf6taovKT/DsFMM9UEkxOxOfjIEenb+z7n0LQzTSsAJP2BgsDXo7p25eKald2Sl+PdfDMWVGEjbOOXU2/rJv2UQ7qD/8IeHFHdEtT6N6vf7eS0CEU07Q6m74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWHFB7hQg4+3+Z/Kov4mvbp9ZaOMHz+OyvOUtUL64qU=;
 b=UZ1kFLh6N/UUZaysCnvKi1HOrNlAY8XLjlJMKi3hV0cwb3kaxDDHzEDpBUlelrlm8CMmqqLEgYJWsh7t0gKlJdrWpFX3MaWjDKcW0Or7ZAIBEvz8gsP3Z4pEu2agITrfDlavuFsttW5cx4FZn1nqfMr56cmxrEGe4vW0JzFkiOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Date: Mon, 8 May 2023 16:31:22 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, edumazet@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	alexanderduyck@fb.com, jbrouer@redhat.com,
	ilias.apalodimas@linaro.org
Subject: Re: [PATCH RFC 2/2] net: remove __skb_frag_set_page()
Message-ID: <ZFkHulUs7d1xWKSa@corigine.com>
References: <20230508123922.39284-1-linyunsheng@huawei.com>
 <20230508123922.39284-3-linyunsheng@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508123922.39284-3-linyunsheng@huawei.com>
X-ClientProxiedBy: AS4PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::18) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BY3PR13MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 9731ce74-4abe-44d5-f641-08db4fd0e9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5dNvbxKWS9XzMLeoQtaatZgxcWBBz0PUQmxiJb5DU6EhqHZYM/maOgqjTbW1wWVVQCn7N2FpD3XUVNS01jpdjX3ZCRfMFB1GCr+Th+UbTe2B3sc0d3JgLpFpmCFklegFCmxtbazSb9gRkgpFZU31nxG3h9XixQuTCo8Mz5vgJMq9dTQUg2Z9BnFoougkMrjdt5/dHqIT766496PQMXBoc3BbyMpmfupZFfC7n/rfy7FnpmBBC+lPMwutxg6HSHMQMDF82PxrJ5LaQUJG8T0pVNYwhE3Vc3+2W4B4jOBK5hwYTsIjXWjFHOmy2whe7MWrcvLfnobwONoBx6lBl1NtV7F7JcwYz47SUYhl83P2Xi0oE8/ybKWgdZVmRcEdLipIAuqfWXNZD9EXMSbPxSrMmxosTjtETuTl0c2/VgbQ8b99vs82/snW3GrGNCi1RgbeJ2Gx+7NEY8Tppqu0t1MxYwxfXIvitcq4tFNmGAjt9Sh82tZIhhYz5g9sSF0FoQeaGRa6TS3VWZcI9MCF7VjrVH2eqpOkyN8bVeDkD/Upgk2AAizzhxc1GlFyQ/7KBkn/Q097geVLTF1AL/JE8wAkq4d7RHSojIHeGfJ5reJM07w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39840400004)(376002)(396003)(346002)(366004)(451199021)(2616005)(186003)(36756003)(38100700002)(86362001)(2906002)(6486002)(8936002)(8676002)(316002)(6666004)(41300700001)(4744005)(7416002)(5660300002)(66946007)(6916009)(66556008)(4326008)(66476007)(478600001)(44832011)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cN84bJh2d6pjo0zorxwYHiIln/mvP1cDBKvJYx3LiRZBb2LQFvS6Sb4Mc6ha?=
 =?us-ascii?Q?vGMVsIiRmKzBcrt8yZIjX18ZdrWyLoIXExonKUj4/k4IdkJdCNe447+wL8b5?=
 =?us-ascii?Q?ahXgms2O0O12VPiGtrGlxnnoJ5KfxhnwOHqOjwBgbIvlFPTHiXMutDAPi8YX?=
 =?us-ascii?Q?Pub8/S1Urv2UTYiDgUL00tGIINYWWMn7HotskbgaqFJUvJMkXflsFaskbUs2?=
 =?us-ascii?Q?+5Z4zQHoqIij9U9qn0jwjnzIzv+0ioLxQRTp5mZfDpKSMpTjNSUNbEE6Aa/q?=
 =?us-ascii?Q?I3RR58AjwQKz+mb8KjK1pBPcpsz7+VTjYKAv3wVD6B+UHLVd/9bYQ2AwnGQd?=
 =?us-ascii?Q?wdAjbSL6NO9wTjvPGPmA7QOmEMG/DWRvuEBJGfJcMpGU972nbJtwrZ9+aMHt?=
 =?us-ascii?Q?M5mAeVmc+5Dc7/Syx1ZIE1NUUS/skhEJAUUhJofS1KUrC4/SQMJ0T9tbC6tN?=
 =?us-ascii?Q?YfWihH40Q7asygFRlRMJPtjuMcpwbP0+2WVZILJeg61DToT9zLGs9S3cmK+2?=
 =?us-ascii?Q?B7i+d0qkWE3uL7Wki5pfpJrxxVNMCcr7icPdVvMpon3QSXb3PAbUzdmnu15E?=
 =?us-ascii?Q?o5njwCeA2P/yMg9qxxEj4xik4GlgXSaSsOK0YjyG8D3hCjB1lDMYia7kVChg?=
 =?us-ascii?Q?kl+VcngiXTZunIU2eBAA2/JjlT0UC7XkmwgC2O1z8Ou+CbbLFE6PSz2hQraC?=
 =?us-ascii?Q?qGouR+rDsi5plrNZhLN861PdMsP0jYdNrEqUAzlxhE36sOToQFiAeKGATnAB?=
 =?us-ascii?Q?fevHO3bqjE3saHpYqXNrANdn7wQLJnzpOAeU8PFt94ApXGjfFcdkzbiTQxrR?=
 =?us-ascii?Q?XOPmoUlTeJD1fwzi+fpS5WIDUJ7kaXuAVgBZ1RB1+O/S+qFKwi4qPMz3GpU6?=
 =?us-ascii?Q?ab6vA/LYAx3JjgHTjNLXLs4AntbbjGSXyn5iAtxELhpQgCmOAruhmQGVYRHZ?=
 =?us-ascii?Q?qP4ZuGBeV0eBT71zotsyaBgY/Krm8nvLc0s9IFd16Vr8ogBmO49J2pnwlpIH?=
 =?us-ascii?Q?Vz873wyoLbMAbYqKJnk+cbG9nfHwVn/nvxGRhI4L750q3o+0vBtUwgDceaPt?=
 =?us-ascii?Q?/KdA7uHiuOreiVAYb/RAMMiylSAjX52Ktm5M2ZmbJEXJXYtSDe70JE3tIeKz?=
 =?us-ascii?Q?UnxvNtWB8UKjRw3BFL+arxq0Fej8lT0UyuuJRwihQm9mdag5C82Iq/ZJidUE?=
 =?us-ascii?Q?9U/QMOCJXW06ByoK9WdjYYEfn24zhgE187lcH5ce7xQv9cVg2CqW9UUbhnmH?=
 =?us-ascii?Q?1qFOGd0tpM6Yj7Eq7Crm6qTXzbMTstKE5Ub2hVtIEIgYI20+NK075z6iLRSf?=
 =?us-ascii?Q?ux3bIATB+1NInBgGd1GZqEB7abQdmqfeyLcLuaGFmYXHu47Z+3mYZDObuk8/?=
 =?us-ascii?Q?2Mzs1FatRNSYF5UIoxnxXpZklLGEN+i3j3jWPS1fKlQtGUF1ZLM7egYWknwb?=
 =?us-ascii?Q?Oy9Pgvril1LAQOAXwp9HG/3QH2LisP7PKgcZwbreiHkNUOA8sAJ2vf40cr4K?=
 =?us-ascii?Q?J7gjpcti57++EJgcmXwfTf8Khtnhgh8PLeqAT6dR43XTFNg3xawHsPhTTWfZ?=
 =?us-ascii?Q?TNFidIuQqtCldx2Mdoqf7PgkJ/ZmyvGxhZckJean4Fj81Z2LDvYfA7kbHqXb?=
 =?us-ascii?Q?Fj7UDQXbqY6n6IPfqcksqcGghpacO97ACz+saMfiTZKcPY7akUDAaokSl9s6?=
 =?us-ascii?Q?Ryvtxg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9731ce74-4abe-44d5-f641-08db4fd0e9a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 14:31:29.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6hSWBRqOay5n8SVgV3DO8Jpj+AO+w/kQ2MhQ0MC5eFU8Many1hPg/r4wpMpQTXka5VdQx+3HXd4ZAJ+v+eaNix/d8aRuy1JBKZ02wKUGvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4913

On Mon, May 08, 2023 at 08:39:22PM +0800, Yunsheng Lin wrote:
> The remaining users calling __skb_frag_set_page() with
> page being NULL seems to doing defensive programming, as
> shinfo->nr_frags is already decremented, so remove them.
> 
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>

...

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index efaff5018af8..f3f08660ec30 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -1105,7 +1105,6 @@ static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
>  			unsigned int nr_frags;
>  
>  			nr_frags = --shinfo->nr_frags;

Hi Yunsheng,

nr_frags is now  unused, other than being set on the line above.
Probably this local variable can be removed.

> -			__skb_frag_set_page(&shinfo->frags[nr_frags], NULL);
>  			cons_rx_buf->page = page;
>  

...

