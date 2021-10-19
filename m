Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE8432EAE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212745.370739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcj1L-0000OI-TK; Tue, 19 Oct 2021 06:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212745.370739; Tue, 19 Oct 2021 06:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcj1L-0000Ln-PF; Tue, 19 Oct 2021 06:54:47 +0000
Received: by outflank-mailman (input) for mailman id 212745;
 Tue, 19 Oct 2021 06:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcj1K-0000Lh-K0
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:54:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70936eb6-30a9-11ec-8301-12813bfff9fa;
 Tue, 19 Oct 2021 06:54:44 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-Cm-Xu-cPONO7WGF20K7ATA-2; Tue, 19 Oct 2021 08:54:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 06:54:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:54:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 06:54:37 +0000
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
X-Inumbo-ID: 70936eb6-30a9-11ec-8301-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634626483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKrFvbS7tBHkYCpKzYSqrGy/08dg8BMVxRhNRepJzt8=;
	b=TshYBZVWoinlRHAK3sEi8gznoemho0Ax5WuYcNCfZivD+iLwbmURmFZRqActdfzQBiUJss
	ZVVfphc+JAqe2lxAPYk3w0T4YjjV7bRyT4lq9qnOrnluZjmuXBLaSvQdAsX06fVocUDOHL
	aI3I+OPE/4jZVZQkEL7UigXNWB1MDcE=
X-MC-Unique: Cm-Xu-cPONO7WGF20K7ATA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H01QLQnivtzMGVFLHNpUIc0UGQi4vvhDtqU/9mxpsjMIPkIEcI5cYBZYKov2ju66++1FATBCEXZxi1/9j0IQ2/ZRc9WbUx3lEZsmlveiT/eyizl9ojwEPu0iMeTxUw8cNXpUioEx6AHgzhUQLxdyt2pLhyTwevjyW0TXS7TBW6CBG/mm5TRMWaIpl+5qX6mwBD7UA+71SGdlYhF/Tx8f6sBOkite6HmlMZo50vtYRT7E9YVM+QPTEU3HvtdJtVt49qHKMSXL9JXfBgWpTNm+21JNiGMpOVyYd5GI4XLfAU22QGb0BnlmbvvvZhuNepgmOEYTNNt7kXwiCiODSLU1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKrFvbS7tBHkYCpKzYSqrGy/08dg8BMVxRhNRepJzt8=;
 b=lE297hY5mhrk8XVrfSNfvkq3psBOCAN1uqLhzru0kroDUzuTz3pzuEHad1uBEXz0H2satsbnlIi4rCtXiosWGYysXCJLisR96OMWFPKf+3AdE6wOyxTwCqwq0Dms4JgMSP1sXxz0Sce8QzmXBenshTtz2H/Xe9EK/T9pxCkLDXa8887MWKEKRJoYt2NUrgSvrgJtKmYNCxYcrCVDsSHKpkIYmidDJv4rnGJoJ4SLYlnfX8qWxxotzJFNGYs7wWVToyMW0z+jAC31v8yMrz2z0tJrjDFcGKXaYkmG1JSAkrQHCxVw2krnF2Sdpid5M5mDmUG002Nlh/+bQ2EEXSo59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools: fix oom setting of xenstored
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211019044123.29648-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
Date: Tue, 19 Oct 2021 08:54:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211019044123.29648-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e538191-a578-4a5b-7bd2-08d992cd517b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715064A098FDA9D82506D0CBB3BD9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKSaBzh1V+9aHADfo/k1MfGZIzEkV0Gq7sK6MLaJYWqMBey/pz28qOVnAnBTUQ1KCKyW00GbdULCKPhrjwEi9yxp+XzenlOOrk/fVxWGXqQFofRg7RpvvaHjORE78awqTov/NGm1Y35Xvp+OiX5Sv16NrtLxxTloyR060Cf4zUtqYQxtxpPJ8Myh059WSWR0m2Ngskdo/RVf3ll05JRJi989EB/tpnvAhS/gvWx0Pn1qjYuKAF0TmuFR75Oml4q5NjNMIYend8LDR57zQHZypEqGJw58LyCJi5QQ0OOQZXcWQ3Ag7QKlDfIqlv+Qlup/iOGb4OsLvpn/ui8ePo5Fah69AgwwZpaCxtsLZSR7RxmX4vGQh/mQiohtHWsbzSFVvSYNogA9zFKwA2RcALPZZkKJvAFQ3p/3zA9rst17Vvccovkl80a1A53wk6wC+qqQjM69XUNf3GOb1pwQ7uV47Bm8lic5//vOAIEtO7brnBfxGa4OgfioBQOERd5OSZQJtiHPvtyucoLQkf2LMEBVfxPNDGck2S2SCqCeL+lgvZTD9/BkmUDwBwJGH2y5wgF4o/KHzz+ftNTEIJN8lb/iaTfPt1Id3WZMEWwGq4cY5VYrRg0wOsqJfvICmDe+XieuaEIVNMofVt+aNRebhy8jpPMY0yKqdeHOhMk6OYCU9dApVD8TRPOTHUgZcBKZBnIaL5+eNN6K1fQ2VuXvr6RUgHnbOaCztp7wvkzRGcQvvx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66476007)(66946007)(186003)(6486002)(956004)(86362001)(316002)(6862004)(508600001)(8676002)(38100700002)(66556008)(16576012)(53546011)(5660300002)(4744005)(2616005)(26005)(31696002)(8936002)(54906003)(37006003)(4326008)(31686004)(36756003)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWhYNGZHWS9HRlk4TzdBTFZ4amMrSDdGMUtlbXJnRlFLUFl1UnFVNU5sRWhE?=
 =?utf-8?B?TUJ5M3dpdWNWRE5uT3pjaXpaYWNGRXk3UXlaamhmdU1Lb1crU3NjR2RoU2xh?=
 =?utf-8?B?SlRmcWlvSCtWMFR0Q20zMGQwVVR2RWJGb1VtKy9mRmRrWnRrQ2Y4M08yY3lP?=
 =?utf-8?B?Ty96UlZya1p5aGM5U2RDZzVzaE5iUVQveVV2bTAvSC9wcFdHenkzeHltbkZC?=
 =?utf-8?B?L0VaSjd0cVkyM0I2M3pDa3E0MW5YTzdnOGk0V2pLQzhVR2VkV09WZ2QzckZu?=
 =?utf-8?B?U0ZFRzJlQVJHdE91eUhaMkVRY1F3eUc1cDN2MTNRbkl1di83UXF3czAwOGpV?=
 =?utf-8?B?ajdxWlhNc2pWdkV5R3J2VW1MbSttck1vNDEraU5LeUFERy8zbWIyemIzdkVO?=
 =?utf-8?B?UUhLdzFVTGdRNHRUSHhBR2pDTjR3Q3B5b1RDcU42MFV1YXFiczhxUDlab0gr?=
 =?utf-8?B?MEppVGg1Y2ttNHpSSFdva0l1T0V5RnNNVUlrdHZmTGRJcnRRS3E2UGp1aHFj?=
 =?utf-8?B?cUduWlZVeUtBWFQ2ZkRzekpqSDZrU3BKdWhkdkZwYmkvS28xODlzbFlKdzdo?=
 =?utf-8?B?ZGRQMDFCb1lMRVVtRUROcHA0T1N6bmEzclRCdlc0c1J4MWY1OERvdlYzRXY2?=
 =?utf-8?B?WHlsUWtJU1I4T0hhSkVmMU9YUDZPRjhPR1JUZmZuZ2pjQUxJVlQyVlF3eTc4?=
 =?utf-8?B?R01CWVpBT1VFd055bko1WGswcVZ2cDJ4LzV6TERPN21LYS8wNFA0VVg4L0Zu?=
 =?utf-8?B?bEM4NVR1ZEdDVFJ0OWVXWjhrd3JMdFBvMVRJWnhHbzZycjBESDhtREIxdHpY?=
 =?utf-8?B?N0JnMlVQdDlieHpuSEpFM0pnSm1pMVdZbHA3NzBxZjZpaU5NcXBYeFUvUWUy?=
 =?utf-8?B?ZTZ2a3c0RHFZQWxoYk9tak8vOHZGb0pNZnBSd2VNVFovbjhTeUFRcHEyYjlE?=
 =?utf-8?B?NnRQeGFoR2Zsd1IzUkx1aC8vTEtndmU2Ymd3ejBPbjlmdjNUL0lQZjF2MVJn?=
 =?utf-8?B?N0YrY0xTVEVUQTJLQm1UTkNHOVRHUUwyNmtsWVJOYVM4bXZaRkwrOElQUFhN?=
 =?utf-8?B?bGJaUTg0cCtwTmYxRWdySXBrL25iTDlJYWpGeGhLRzdPdllReUR6ZmRpdDhU?=
 =?utf-8?B?dUJpSzg1TUQvMzMxaWdPV0d0aWFwb2ZDeXE2Y0ZIWlFHamhzdEEvSi9yTHBw?=
 =?utf-8?B?VEpFY3JmU2RVUXNzdFhHMkRwbEgzRk9JSjNENkUzdkNHVldZblFGZE1EZzFu?=
 =?utf-8?B?bklyWGI1SkpSY0QwYmRKelo5L2t2K1ZrbmZaS0VCWXZTdEYvbW5rOVZqeEIz?=
 =?utf-8?B?aHd4QTNhN25LclJOb1RjamwxMzFkZXdYd0pJdGVLOVlLYmNreno3bEdEVnZw?=
 =?utf-8?B?VTVERXJPdTFVNTJEUXlaK0lqajg4VHlMQXVvNURPYjVNTWc0alNPaVJPSTVw?=
 =?utf-8?B?UHpLT0x2YzF0czV3QlJGdVUzd29BM2ZjeFJyMzBQQkZIRjB5MEFrSWV3NHZK?=
 =?utf-8?B?UitMWXo0R1pGM0pLMXI1NlBjdFM4Z0ovVytXd1ZnV3ZoZ3dUbGNyaWpaa1dL?=
 =?utf-8?B?cTBoWWs3Ry9Wb2Z2YW56Y3lZTTNzRDJJUzMvQlBqbHprN2toL0dKZUl6VHo2?=
 =?utf-8?B?VnFLSXVva09wVE9wd09rd1VKZGpaa3BqS1dVZHI3eU5YazBWbXNSZzNhNFd0?=
 =?utf-8?B?NGg3VzIvSlQzREo2dnZYYm1pZmMrb1FJWDBCdm4vc1FHSUkzZDM1VjFqNkU0?=
 =?utf-8?Q?9j/bkT3Q8S9lTUL/ntRPN/5FqnBr3RqSYoNtUAm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e538191-a578-4a5b-7bd2-08d992cd517b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:54:38.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH1GIBEjrU/WsbsUlsF9CTyKmR/m+W3PoBUoNaZ19xAdnFEC8+ycYbzVM9nUtCXULLr3YZV5Etja/xzYMWkw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 19.10.2021 06:41, Juergen Gross wrote:
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -60,7 +60,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>  		echo "No xenstored found"
>  		exit 1
>  	}
> -	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] && XENSTORED_OOM_MEM_THRESHOLD=50

Is resilience against "set -e" being in effect of interest? If so I
think this would want to be

	[ -n "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50

>  	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))

Alternatively, how about dropping the line above and using

 	XS_OOM_SCORE=-$((${XENSTORED_OOM_MEM_THRESHOLD:-50} * 10))

here?

Jan


