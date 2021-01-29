Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F71308598
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 07:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77725.140956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5N9c-0002V3-3Q; Fri, 29 Jan 2021 06:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77725.140956; Fri, 29 Jan 2021 06:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5N9c-0002Ug-0D; Fri, 29 Jan 2021 06:21:12 +0000
Received: by outflank-mailman (input) for mailman id 77725;
 Fri, 29 Jan 2021 06:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mka5=HA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1l5N9a-0002Ub-Q8
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 06:21:11 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d539071a-df68-4db8-8dc0-66f23a33ed35;
 Fri, 29 Jan 2021 06:21:09 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10T6EfFM081723;
 Fri, 29 Jan 2021 06:21:03 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 368brkyd92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 06:21:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10T6FsJt162813;
 Fri, 29 Jan 2021 06:21:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3020.oracle.com with ESMTP id 368wjv3h4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 06:21:01 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 06:20:59 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1%5]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 06:20:59 +0000
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 06:20:58 +0000
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
X-Inumbo-ID: d539071a-df68-4db8-8dc0-66f23a33ed35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=k2k2cMm0q+8Zfcbjcar37c3V3ADtupHVsW85zj1D3vM=;
 b=COaWH2u+RbqLXkX+yHzfg7XT1Gtj7aQXHy5fHBEpjjske4eER6HCz4K2Xk1W/dpbCkao
 5hhpmiIamZ6ZPwTrY05MHKXs6khti6mkUNc5rY9pROekA0Mu1JnqD42iPeLAfUMA/477
 hhH6bIM91TF8ymq4Dd6Z9XzQvA0SgaPpXkoTywyM0en9sjP7QZ7D/3e8s7dKI6ToPrjN
 UNsqipqOv9VPq3HLTYqDy7++zbTrtkHM+LUHPWM6Uy1XFoZzgek/7qbrul5IEcYxHtoQ
 tXbS5nEFms2nE56OBuRAL38B0vMffolVLR/jv8NMV2XPZVdY6ESS60ET5SWN+JZBZQ1y eg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfBGbeS8eqwwoLcqthGZx2+VTukPZeeGU7MZf6wJ4a4+j1PfCK7gc6EaaA10OjAv23iuc3mTWsC+VT4xLefvPU32Pt7hWv9aTTwoX22tEhIrdh+Txpi2zMZAJC1+uARp/e5ppHpxc+8yQMrSvk5rIdELyjCxmSpx1XklJ2EnfTbgiqzHYiiEv8OJnYdCeC6s0w6oxFBK50RH/gbebrLroWhtHnrMjd7QhTpnGCIaPq/I/PvrHNl1EWN8l+rQoVDyPLLgSE59WkP+h40aV4m6K339CfXpvDOCreNv8Bdrv91X7zASrPxANvJGfxPz3kR5w7KlfoV/00EMaIk0g4d4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2k2cMm0q+8Zfcbjcar37c3V3ADtupHVsW85zj1D3vM=;
 b=VP9j/yfjkwdH/Io6S2/TJTz1iBdxsrHjULA9ISagsQRKytsa9SWMJEXNbKklg7Uje4UX8W+byj0oZvSVzflG11MjcXsVuIlLWiFx9GG3/cxgp9FcPXutER51QD0rU6jPcVudszSrdine7syrJpcvL9eD/aO6uF37sl8VgLMWmYX/Z4K9ePyjGodKaprffrBibWcWXlJmCe1iT2BLCRed+1vJSJlJ/BUObTTlwauzqYmYkDHU4BoawPkOD2eFem01wRsIH5OA+gOP8cHozQSZEF1TIoHvU8wlSo8ngiuaycYtr7ItsaNdQzfAPuV/KVRc21nsl+fv+c6vSHHcoomcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2k2cMm0q+8Zfcbjcar37c3V3ADtupHVsW85zj1D3vM=;
 b=uABulfnw/HxYPB5cuvl9g6lxRtX5i/6eaiN02ihy91r/lcSnOyVQjx9HKCAzlcbjUeRechpU6F3El7DVzCuK5vreiQpe/DLfpuTlEvfe2ejxnEJwW1qQEB3fvmHUaaNuBSipvlpUF7aBZCrlHvW5rOIYwrlsoTjH7Trz49cJ9ko=
Authentication-Results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page
 rings
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>
References: <20210128130441.11744-1-paul@xen.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>
Date: Thu, 28 Jan 2021 22:20:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128130441.11744-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: CH2PR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:610:5a::15) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330118b8-1fbd-4732-dbbc-08d8c41e0b75
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4784C48C3BAA37442BB11676F0B99@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fBTLHXlLvdITXJAI9wG+Fw5zJ7cyg7gtYjm5zdEbeM2yVrkfE+ilXppXw3FOS6RwD6ce1Py1i9IbqeFeDiZzxIk83rZf0D72CKBAQyR00LIUOB7FwIxIUB9v5M/hnnJjlGa9O/yDLUkdAiHCH+lrnz3pX68dDbGxCy0XN6Z6y25K1BAy8SbIm2vx0miyxenrXdWhwXdsy5fUNOBROA0s3jwlvzJKM+VEsdCgn/C6Mn8wJkje3nWSWuKkphYqz895MeKkRmeaPg5+pRuWVEu/cwnfdLJRl63PnqvEK6lqyoj/zfdGMgqbshDUKWWpw2tWEpXRCV7F1lm9QET9hLWBV3yDlQukw84LQSvm8HwNdIC1MM42pQN67eHBqRZJnf60eDghQhRbs2usfvVodOk3btbAUKEE7nHsirEMMDEaSQpmmEER+AplV8lMqG6xBgDPES/2ZnatpIdJGX+PuW29JzmSKH76A3wj7YcHIicLByKAyK+PvaIDpJGSlbyWYDpplNdSe0HEvqCOucyUt6HrRJXcJziJJXCx9w7q1rbt0e5Ucb3IG/BE0J8HnL7JGGy+DblJBFbSL3Fh324WJ7YcJsytz1CDiap4QSDvgmtxZoE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39860400002)(136003)(376002)(86362001)(16526019)(8676002)(31696002)(186003)(6486002)(44832011)(5660300002)(83380400001)(478600001)(53546011)(54906003)(36756003)(316002)(66556008)(4326008)(8936002)(66476007)(66946007)(6666004)(31686004)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eDU3UC8wM0Q2TGs4cFJVeVlqbDdFTnRNMXV0RjV4c1pRNXdWQjJRM2MvL1JP?=
 =?utf-8?B?YUl5eGlBaTRiaHNKWGtHM05DSVJqUDduVXVrbTFWdFlOQXNzNUgzK2RIVXJO?=
 =?utf-8?B?UEIyekNwcExZMmVzdUFYK2RGZEtZeFlmY2hIZUxZa0QrQ0hMMU5SYXFGK1hs?=
 =?utf-8?B?MGdtcmpxV256YUlJZlp6QVV6RGtNTjI3VUZBc0ZCOS9HdjF2TTRGSlAxSFBt?=
 =?utf-8?B?c05aWHA1bUkwdHZYRGxmNnlCWW1aV0x6SDlMZ0c2aUhHWXhFNVBHazA4SVBy?=
 =?utf-8?B?QTcyeXN2c2lNeHBONGYrT3hVeWdrU29RMFZKd0hxT3Y4OHNDVEphdWF3UTZF?=
 =?utf-8?B?eUtLcTJMbmg0ZXNtNURHdE1MSWh0elBCOEJ1TkFLazVNbUlFUDFBN1dRNDc5?=
 =?utf-8?B?akZRS3lCZmFocUpSZU5SM3JrSDlXRlNFc1JNOUtDR3R0bjYzLzlOMEp2b0d5?=
 =?utf-8?B?TlRFVmlOMFlNTlk5LzlxQnlISEFpRnBmREZrSjB3dWhEMEdqeWRqUitKaTFF?=
 =?utf-8?B?VHU1cDk0SytVakhqWTloT2poeXpZMFVsbmJ1eU9NVGVkOGF4N2VGc1lCcmg0?=
 =?utf-8?B?cGU2bm5uWlZMdTQ1RGE0cC9yTWxLV1JXQXNGN0VLTk8wV0pYUnVvQW5xdUtP?=
 =?utf-8?B?MzlIY3FPUFN2R2lvZWo4cmpmY2ZIVDF6SVNMWVVXWHVTS01LMnBUMnRZRGFx?=
 =?utf-8?B?Ykk1bGJnL3F4WHoyM0NaUjdoNWViMTZoUGdyNG1rYXIyc2Vnck1rcStPK3F3?=
 =?utf-8?B?UmU1anRsY0ZFdGZNTEMyVHFxSWhZbEZvUFdURVJjbHJ2aWk1TGJuVDFPYXVl?=
 =?utf-8?B?RmFsOHV2eTZ4c2JHLzFCSGxaenRtNTdMWnVlQ1M5NnlLandUdUFoRjArK3VO?=
 =?utf-8?B?S0prOFF6YzBRWWFKU1ZtVEdURWt1T1lYcmVMWnNvZVhMM29lTm9WK1MzTXlY?=
 =?utf-8?B?N1B6QytFNkxFbHROTDVqWTMzbWFlMnQ5UUN5WWI1WGxzQ2RGenR3cWhERFF5?=
 =?utf-8?B?K0hORHRHMTU2Q3pKY3ZleVpmUFlQaVQ0MzgrQVdjbldLUFJzVGkwTVQ1MUdK?=
 =?utf-8?B?ZytUTjcwMmR4dVFrSXpzbFhITmlpQmJ1V21vM2ZKYzVrR09OOFhnY3I4NHZM?=
 =?utf-8?B?aDBBSFlrbSs3TnA5OWY0elhHMmRWUDJ3bkYvaU1aSVNXdEs0NGZiNGFDRE83?=
 =?utf-8?B?bVBWc2M4QXBRS2tTVlhKaExtRCtGVXVKcFRUcmFtcVZxVHkvNW9jQmY4b0FR?=
 =?utf-8?B?ZEppOGo5dVdGbllkdGQxaUpXQ2RqU2lNdVVTT0Z3TXdnUXVhUlRsWFNZY1hl?=
 =?utf-8?B?NHBJRjgxUU1NbitISjEwVnVzQW51N05PZGRuRnNLSElDaTNQMUtJQ2VtWkxN?=
 =?utf-8?B?ZXFhNU9sZ0dFTEFhNy9PTDF4YlZrWnJSRUwyT3NONDNLekpHYWxvTDlmN2ZP?=
 =?utf-8?B?ckNUOVNBd0l1K3NtK2w5bUFWdVhkKzVTUW84bUd3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330118b8-1fbd-4732-dbbc-08d8c41e0b75
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 06:20:59.5180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB0ycOdfWbwBEuhEhStnjUNlA86er2Bp6GlDEFWZWb/OLB9dkK8ns+8NuLpTeHXwzj/6QYCMbFyxFWtc627SOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290033
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290033



On 1/28/21 5:04 AM, Paul Durrant wrote:
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
> - if not present then expect a single page ring (i.e. ring-page-order = 0)
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
> 
> v2:
>  - Remove now-spurious error path special-case when nr_grefs == 1
> ---
>  drivers/block/xen-blkback/common.h |  1 +
>  drivers/block/xen-blkback/xenbus.c | 38 +++++++++++++-----------------
>  2 files changed, 17 insertions(+), 22 deletions(-)
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

Is it really necessary to introduce 'multi_ref' here or we may just re-use
'nr_ring_pages'?

According to blkfront code, 'ring-page-order' is set only when it is not zero,
that is, only when (info->nr_ring_pages > 1).

1819         if (info->nr_ring_pages > 1) {
1820                 err = xenbus_printf(xbt, dev->nodename, "ring-page-order",
"%u",
1821                                     ring_page_order);
1822                 if (err) {
1823                         message = "writing ring-page-order";
1824                         goto abort_transaction;
1825                 }
1826         }

Therefore, can we assume 'ring-page-order' can never be 0? Once we have
'ring-page-order' set, it should be >= 1 and we should read from "ring-ref%u"?

If the specification allows 'ring-page-order' to be zero with "ring-ref%u"
available, we should introduce 'multi_ref'.

Thank you very much!

Dongli Zhang


>  	/* All rings for this device. */
>  	struct xen_blkif_ring	*rings;
>  	unsigned int		nr_rings;
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 9860d4842f36..6c5e9373e91c 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -998,14 +998,17 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
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
>  
>  		if (err != 1) {
> -			if (nr_grefs == 1)
> -				break;
> -
>  			err = -EINVAL;
>  			xenbus_dev_fatal(dev, err, "reading %s/%s",
>  					 dir, ring_ref_name);
> @@ -1013,18 +1016,6 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
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
> @@ -1129,10 +1120,15 @@ static int connect_ring(struct backend_info *be)
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
> @@ -1141,8 +1137,6 @@ static int connect_ring(struct backend_info *be)
>  		return err;
>  	}
>  
> -	blkif->nr_ring_pages = 1 << ring_page_order;
> -
>  	if (blkif->nr_rings == 1)
>  		return read_per_ring_refs(&blkif->rings[0], dev->otherend);
>  	else {
> 

