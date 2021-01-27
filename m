Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932D306480
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76384.137810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qwe-0005Vk-5n; Wed, 27 Jan 2021 19:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76384.137810; Wed, 27 Jan 2021 19:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qwe-0005VL-2Q; Wed, 27 Jan 2021 19:57:40 +0000
Received: by outflank-mailman (input) for mailman id 76384;
 Wed, 27 Jan 2021 19:57:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SNmx=G6=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1l4qwd-0005VF-2R
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:57:39 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2e51b52-6b72-4234-9190-1bba509d22d3;
 Wed, 27 Jan 2021 19:57:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RJs32u111560;
 Wed, 27 Jan 2021 19:57:30 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7r111j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:57:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RJuaEm106690;
 Wed, 27 Jan 2021 19:57:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by aserp3020.oracle.com with ESMTP id 368wq0pk4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:57:29 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 27 Jan
 2021 19:57:27 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1%5]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 19:57:27 +0000
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Wed, 27 Jan 2021 19:57:26 +0000
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
X-Inumbo-ID: d2e51b52-6b72-4234-9190-1bba509d22d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=sxZo9V9olp9ayVjpZCZBPvJMYBnlqgW68jXqslEpabc=;
 b=sU7MnltrCXm7pJkuLzXN+4RgibVKNZ+qkN1UDtDibXSVn1GPHU15Eh00UI2jTg9GrdpP
 5B5p3yUfYSQEYuQfWc+k8xM9zuwUF5UJ422CVCISEOkC48TdJtUabykf8Tp6DiNC8q9F
 HQ0CtpRuu0SihxlTek68VwUy+iHbKl7XD4jdCb1EFZwymPknh96iI4E9XH7DOqk+cISD
 6LCzOyyuwtD13cnW+wrSs1GYF0GN4Coj3vEKU4TTxGroYfYvxDeFwXoAXmhuaGNqAJe9
 zfHrcLmiLcHpDd18dTs4uFDcqZ4fEz9qlAY2un+EqIT9QA/KKqKzpY0/zWAxc0IvLldv ng== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbbEXRCIklVXxnrN5aqe7O4uyGiI+qtfglIIHqBK7l9sWOwwjjT86rsXzhPcuQuKmcpFyLEitmF18ZV/dGQsYyes9Z1GEtOzrdifvcS67+FDg37TIc6CFDbr8nApedOzIt8JsVKvsJopAWWj3FX4ff1b11EBv6qr0BOsKXDAwqaP5WiBfhJhyIBKI73aLCILDbtBcJmydREJ6CtgpRCdGueAfXL82VJ4kLk8HXJhNmyuovHX4tMe6brBlMJAnVHrmqlGtI2Iwy9YG0jSsfdmDBOB9c5EgNmYIn+Zz4u+jTA8kw/6/S7kyktQi7Q24yZtv+JNicDHc8RKF6n1o4Q5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxZo9V9olp9ayVjpZCZBPvJMYBnlqgW68jXqslEpabc=;
 b=WFkHRR+iDKFYLffjADZr0pSF6tCEWk2EF/cvxyp/xKjGc9nebr/0C179ULZ1d84VOguvLN2T3/Aa2cDYe9nAnZ0ZY4qWVz5TE5EE7x/kwKlbWfVG1P4IYFGRujWpb/KfcOfGlo3CE8cviYS10NBYkuxEtviROjrMYJ5dWSrJgu2Cj8ociXKBPzao5nb9tXdN208+CDPjbYOJGLhhZi8oprPG5+ibG1Ow7ejvYaMTNWwif+lS+cb4U66/n3WyfhoNwxxgVmpt1OYUeyjDm8x5U5ocl4D/+2ljVIG6MLAkh6uOaGDYMD8tWoBEiJ2LW8KtbR7IWUAAY66K2tdH7GsjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxZo9V9olp9ayVjpZCZBPvJMYBnlqgW68jXqslEpabc=;
 b=O5rXxXf+Fp2VLKmOm3y1wxYDU/9F46/b8ZUiK5aQfVMS4EwQI4YLlsK4mmumbVE0waATDp0pMn6+bmBh58B1qmNTTOf1KutOq/bdyx4XhzCkg47OFBE8GVAwODBtykbWmaMZxDFgWx1eOOEf4REqc0TLPEhzaKgg7tW+v7JAr7Y=
Authentication-Results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>
References: <20210127103034.2559-1-paul@xen.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <18c3efc4-57b6-5a5d-cfa3-7820b7f5080c@oracle.com>
Date: Wed, 27 Jan 2021 11:57:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210127103034.2559-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682af169-f6ed-4837-0d50-08d8c2fdc57b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB32552A2496CFB4260B2A4B68F0BB9@BYAPR10MB3255.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vOlez3VtjL0/S2SK44e4AKzK2owErep/S9SW3OvxV/msYERcT+xBK1Aup2J4gchJRenoQU/NnsLHYzal/eUDFOdGChz5sPA2Wo3pO5okjKJQs/2JQjEI/zsOmPJGkF8kmORLAusKRH/SYVrk1WA5XevRQXEg07/bkriC72R3lIxXKTWYBJczetEnpxiAparamJSPCCZRCIjAztGU4brqWNdDhrn1PbxcCDE8JHD8IQzTN1T9OTlRvB4tkHLWUY1DiBMVmp1kMfcDTDfTU9bD/i1y4iSvL/uvOAucf6pVnzLC2ME+PCeqCdxZmuKrzSU7xcaLUST0Ye2X30EMs+rlPx2SKGZTatSgA+yR4yC1A7ACZIXwvIBykdI/hRKObRLR22lVi9fnD4tfUDH+e9hpJYX2OL8JbURNG8E/qSHBeqBqnm0s4zp4HKaMI2PKUMxcmoUNbZeRYffzRw2DnZnr3/hCiPLkQh9DvdYErea6CTe7NJy8zHOkWiKo82f/69XQ64pcm0WpTolJwsNsGHmJWMkJ5354iVfvavpArTj5LO4hEy41wuRLhx4GObluh7BusOCDP7MEnQRnZGbkpwPJXHUNGBzCtgcy7R63nGlT9w4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(376002)(136003)(366004)(478600001)(2616005)(83380400001)(66476007)(4326008)(66556008)(5660300002)(44832011)(8676002)(31686004)(316002)(8936002)(2906002)(186003)(86362001)(53546011)(31696002)(6486002)(36756003)(16526019)(54906003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VGRWNldnSWpSSmhwVEQ5MDFUd1M4OXo0c2diakFnL25HKzl1NE0zNEtFQ2ZY?=
 =?utf-8?B?WHlMbUEwYThKSTF5V2lOVzhLQnIxN1NrY3gyaHBNVjJKQlRtRG1qRTlVaGNC?=
 =?utf-8?B?U0tuVzB3LzVYMEZLQ2xoYlBaRTU0YlN1SldWWTFHbTB6STNqVFZUb0xVMnNy?=
 =?utf-8?B?blFXd000ZnVrdFFCQVpJSHladENxSndIMXdIVnZubUZ0VXVnam1TVDJBbkNZ?=
 =?utf-8?B?R29xUzNqYUhrcGZVc1pubENjcFpMV2Q0Y0J5THFvcllNL3VOMjZRYlRmcTc5?=
 =?utf-8?B?YWN4MkVsUElCaG9oZzc0eXdSNXdqYm0rSzNSaW1xMk91eVZjRmtucXpId09x?=
 =?utf-8?B?amtGRjd4TnZ0T2hBVTNrdDBxa2RNZTBiVkR2d1pqcy94cWtCdG55b0kwSXdE?=
 =?utf-8?B?V0c1Q3RldjdiN3kxN0ZkUzJMaWJoWVRoaEtzQU9qMDM0WHVlbzc4UWpyc24w?=
 =?utf-8?B?aWMzK3BjcjNzUno2NHhvSGhiVHQzdVVrcnBLNklrRTZYV3daZ3JvV3k4Yzd6?=
 =?utf-8?B?enBFcktnb0hraENPb2puN2grU1o1MkYweldJaWJFdFl4SVNnRnRGcXhYL1A0?=
 =?utf-8?B?S2JtTGpQemE0VDhxUmxocHlrcjJGZEJWVndyL3N4NUlHam9tVDZNb01xNUNC?=
 =?utf-8?B?QzMxaGpDaklHamJoZEE4SlV6cFRseWl4c1NyY1dPdTNURTQxMmpHSk52eWd0?=
 =?utf-8?B?aGI2d1NhV0gvd0pjVmtNNHp2dWFxVXlvVnRmUW1FSWFLZDJUaU5CaXVXdys1?=
 =?utf-8?B?RCtHck1CNC83MlJuYjdCSHpRRGJGV1RIMHFOUG1ULzduRDhpaEorZWN1RHdJ?=
 =?utf-8?B?MzMxWWl1Ym00dFlxTDlXRzVpUGhqVTl5YkNvSVd6ZHR6enk2cXdmNnVCdjQr?=
 =?utf-8?B?UWx5WS9UVkEyNDk3dnJhVkd2NlYzVENUK1hVNFpwNm9rdDFRNURkMVB1RmJx?=
 =?utf-8?B?dUgzeHZFUzYyajBtRmltUWpwcWtVSVpiQzhGRmtIWis4UG5Vb0pzVC9PZmJ3?=
 =?utf-8?B?Y2haeDhWVVdRZENBaXJpUjhoQWoyaWE4YzcreEN4TERIUGI1OEhaU0hXT0hl?=
 =?utf-8?B?VkNXU0NiNFFBdnltUml5VHRYTTluNE9Wd2ZWM0JTQkh1VnZRY0hKamhvd3Bw?=
 =?utf-8?B?ZVZNWUtuM0xxNXBQekoxaDF6VFFzYzRVL3pnd3BlWERrczB1bEdYYlVaUFR4?=
 =?utf-8?B?a3RjRUc4VDBSc213dE1wVXd2TFBDNEJUb3FVOVd4RUQ2R0xpM3lmRk5FZWpn?=
 =?utf-8?B?ZHRIM0pGbFlTU1E5SDVVT3VyaTQ1bG1SR2tSaW5HUGI3ZFFKZDh4MFJwZXBV?=
 =?utf-8?B?V3F4WVFybnNXdGYyTGlrbDRwcnZlbXBPem1jdjVhQ2QvZVNNVHV4THNSSldK?=
 =?utf-8?B?MXdPU25aTExmZnNnbFBFUHdCNG43SHJQdEhHNkFFaWFiTTRydnkyU2xDa1lx?=
 =?utf-8?B?bGRJTEUrTEl0ckoyR1h1NjVEVEYxR3lNL01TcThRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682af169-f6ed-4837-0d50-08d8c2fdc57b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 19:57:27.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXUKUrg0TPDCiMe6aNIaxJBBBhClOtWgCOcxmXEZXDfB7nEsAqpNVFUCuxSHfhMYo1tgzmvFEjT4Ku2OBnRREg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3255
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270099
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270099



On 1/27/21 2:30 AM, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
> behaviour of xen-blkback when connecting to a frontend was:
> 
> - read 'ring-page-order'
> - if not present then expect a single page ring specified by 'ring-ref'
> - else expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
> 
> This was correct behaviour, but was broken by the afforementioned commit to
> become:
> 
> - read 'ring-page-order'
> - if not present then expect a single page ring
> - expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
> - if that didn't work then see if there's a single page ring specified by
>   'ring-ref'
> 
> This incorrect behaviour works most of the time but fails when a frontend
> that sets 'ring-page-order' is unloaded and replaced by one that does not
> because, instead of reading 'ring-ref', xen-blkback will read the stale
> 'ring-ref0' left around by the previous frontend will try to map the wrong
> grant reference.
> 
> This patch restores the original behaviour.
> 
> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  drivers/block/xen-blkback/common.h |  1 +
>  drivers/block/xen-blkback/xenbus.c | 36 +++++++++++++-----------------
>  2 files changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
> index b0c71d3a81a0..524a79f10de6 100644
> --- a/drivers/block/xen-blkback/common.h
> +++ b/drivers/block/xen-blkback/common.h
> @@ -313,6 +313,7 @@ struct xen_blkif {
>  
>  	struct work_struct	free_work;
>  	unsigned int 		nr_ring_pages;
> +	bool                    multi_ref;
>  	/* All rings for this device. */
>  	struct xen_blkif_ring	*rings;
>  	unsigned int		nr_rings;
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 9860d4842f36..4c1541cde68c 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -998,10 +998,15 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
>  	for (i = 0; i < nr_grefs; i++) {
>  		char ring_ref_name[RINGREF_NAME_LEN];
>  
> -		snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> +		if (blkif->multi_ref)
> +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> +		else {
> +			WARN_ON(i != 0);
> +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref");
> +		}
> +
>  		err = xenbus_scanf(XBT_NIL, dir, ring_ref_name,
>  				   "%u", &ring_ref[i]);
> -
>  		if (err != 1) {
>  			if (nr_grefs == 1)
>  				break;

I think we should not simply break here because the failure can be due to when
(nr_grefs == 1) and reading from legacy "ring-ref".

Should we do something as below?

err = -EINVAL;
xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
return err;

Dongli Zhang


> @@ -1013,18 +1018,6 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
>  		}
>  	}
>  
> -	if (err != 1) {
> -		WARN_ON(nr_grefs != 1);
> -
> -		err = xenbus_scanf(XBT_NIL, dir, "ring-ref", "%u",
> -				   &ring_ref[0]);
> -		if (err != 1) {
> -			err = -EINVAL;
> -			xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
> -			return err;
> -		}
> -	}
> -
>  	err = -ENOMEM;
>  	for (i = 0; i < nr_grefs * XEN_BLKIF_REQS_PER_PAGE; i++) {
>  		req = kzalloc(sizeof(*req), GFP_KERNEL);
> @@ -1129,10 +1122,15 @@ static int connect_ring(struct backend_info *be)
>  		 blkif->nr_rings, blkif->blk_protocol, protocol,
>  		 blkif->vbd.feature_gnt_persistent ? "persistent grants" : "");
>  
> -	ring_page_order = xenbus_read_unsigned(dev->otherend,
> -					       "ring-page-order", 0);
> -
> -	if (ring_page_order > xen_blkif_max_ring_order) {
> +	err = xenbus_scanf(XBT_NIL, dev->otherend, "ring-page-order", "%u",
> +			   &ring_page_order);
> +	if (err != 1) {
> +		blkif->nr_ring_pages = 1;
> +		blkif->multi_ref = false;
> +	} else if (ring_page_order <= xen_blkif_max_ring_order) {
> +		blkif->nr_ring_pages = 1 << ring_page_order;
> +		blkif->multi_ref = true;
> +	} else {
>  		err = -EINVAL;
>  		xenbus_dev_fatal(dev, err,
>  				 "requested ring page order %d exceed max:%d",
> @@ -1141,8 +1139,6 @@ static int connect_ring(struct backend_info *be)
>  		return err;
>  	}
>  
> -	blkif->nr_ring_pages = 1 << ring_page_order;
> -
>  	if (blkif->nr_rings == 1)
>  		return read_per_ring_refs(&blkif->rings[0], dev->otherend);
>  	else {
> 

