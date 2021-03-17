Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C314533FB47
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 23:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98798.187640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMehV-0006yA-H5; Wed, 17 Mar 2021 22:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98798.187640; Wed, 17 Mar 2021 22:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMehV-0006xo-Dn; Wed, 17 Mar 2021 22:31:37 +0000
Received: by outflank-mailman (input) for mailman id 98798;
 Wed, 17 Mar 2021 22:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F+Cc=IP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lMehT-0006xh-Dc
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 22:31:35 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb6fc99-4eea-40a5-8665-fd3984818369;
 Wed, 17 Mar 2021 22:31:33 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HMT7ds107855;
 Wed, 17 Mar 2021 22:31:28 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 378nbmdqgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 22:31:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HMUmdt040661;
 Wed, 17 Mar 2021 22:31:27 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2054.outbound.protection.outlook.com [104.47.38.54])
 by aserp3030.oracle.com with ESMTP id 3796yvdcyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 22:31:27 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4448.namprd10.prod.outlook.com (2603:10b6:a03:2ad::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 22:31:25 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 22:31:25 +0000
Received: from [10.74.97.52] (138.3.200.52) by
 CH2PR15CA0021.namprd15.prod.outlook.com (2603:10b6:610:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 22:31:24 +0000
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
X-Inumbo-ID: 5fb6fc99-4eea-40a5-8665-fd3984818369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1xsl4Sp7vVhV1/McVvgxVvbShTrrJX7i6O0SN0cZZ7E=;
 b=0hRkaezyia1UoQ/QW1pOvSskhSGV+m19U2ItG5XRupsdzIUNvpvDdmfJhEP/u9V3PTxB
 LjHIUroZ5Fklk//SwdxtV7Opw6Qjy4/VNFbqt57NhxEh7SFNBDKK8CuiRGxnH80bloqS
 zoZzOWcsCz1AMVM+ltNMMRDcVSRZpvyvXNo0WWqNUun7Yoi21+zbbDlXK0a4dxxxxgoT
 1+P46sAbe2I7KFOj/rh2QB6NaFqIbZgaaG5aMs7WZH9SqmJ69Dj5A12ZX0w9Uhq6R1OB
 G4ik+oZo+w6uIryE4deDpCxwVkJAHLH5Zq70X48VTRAX0J1SZbX8WGMpEqnnjfg55dOo OA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExRP+n2fqvow2rJeu6AJRmetjqioreXASrySF4zEFyfIZye8LhlFMNRuDBx++uPb3mfnWU2bOieP3tgCUa0R87QJ7LRVW1/i0EeQREkYcSKlTr50WVEA6P+PxTKKfGEafxgAxuo+OcFgnEBN0Fafl1zgnRVRF1zxUzA90knIICgC61HtyvimTYEkXcLBDv6C9nOh2D9iHZUUDjE98wl9gXZn/L7tpVh1BTYRws7oD/HFAue0wLx88cfPjeTG9jByd7tZtyBO+STZofxC2fygqjmQU55+deaW0mHY4yRRspmRRjCMqOR8L9RirrhCg1LsNX3LAxCsQNIdHnvLbNqEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xsl4Sp7vVhV1/McVvgxVvbShTrrJX7i6O0SN0cZZ7E=;
 b=bAzBYJuc123nRAjXW2cywWYE3+pAbw4FOWNFmkwkaXTB0N0yDHDwdG2527Mr7f5UdtlDSwgOmkaE5YMAdpbWSVte7fNFYz6YR7tnyMc/+Es688is1KrvGCYmISfMvs/UMidXqHX6WtWoC0WwKU9qOCGfgIAsqN4y0Bcn/S6i+iuQVzgF7wEzXQUrwTX0q30il3PORHmVFIYa2Sg58bqUz3c/JDBOYJNcCv8F3sFP6YuVjDgOrbil8xBcNUFKXIm2svYhJEst2srFV4c+utwEg2hwr8AcN4x4/Es43+EaLB/cojHFJ2brl9Z43JeYcUiSWAbRZtl1I5kvPRy+ol8iuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xsl4Sp7vVhV1/McVvgxVvbShTrrJX7i6O0SN0cZZ7E=;
 b=tg83fvC7O9Lnkoy/R9tYbpYmMO3IgBIGbm+UCzgBNaZO0zje+pdjsp9oebnUs9iqWW1s8o+XqKvDfTh9lzl1I1jug8KKehsG9mClGQc0cL/bZVkav6n9kdnk8ENxIyMnO4AzlSY3ISxJKz1KeXLUZmLG11KCWvkygDVtDENA4ek=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/evtchn: replace if (cond) BUG() with BUG_ON()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <1615950299-96787-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <5ae410c5-6b7a-70d4-128a-255f80cddda3@oracle.com>
Date: Wed, 17 Mar 2021 18:31:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <1615950299-96787-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: CH2PR15CA0021.namprd15.prod.outlook.com
 (2603:10b6:610:51::31) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6591767-3888-47f1-78a6-08d8e9946681
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4448:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4448A874F2DEDEFBC5BE86838A6A9@SJ0PR10MB4448.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gphi1ozmTqTPQ9VMT9WRdKfbs3kN3tgKUtUUBnqq30GJk9H//AsrCbAbzie+rcwJJdPmQvXqVCGhZYUHlDehfxpg9LZFMmVHNGyeYjKWkz/Hus+Xz6ttNQcff03K22i/d4XgpX0QHja8mB/DOXV02WtgpHn0SjzqFuG78H8hjgIQ4iuMPwF3XgcQ6kvZZZGSyDhX71DWhISppXmh+YG/NIVdyk1yxnHY6epEApZs7PaNYzXPiM120VkLIDpZJhJD9nXkJ8KO9r2G6HvC1M6bYgmb2o93sDX5PFNF6oWfcKaxobb4Pk/oRhzyRQVHymAeoET0cW+U+h+Jc5AeHVSUm0DpMJpF7iKBm/Z2Vt+X3N5dGKVr3p8KjD5FIx9UnisolqGanINfcJahIKv4Sl9riwVsqRiTj3/zAav7KRjkRJTgo/Qpt5amnilmGZX7jYtmN+t+cQOWh3iuZdu0NlSoWmOtzpY183WuXo6Jb7xzofxFq3SOVs6rFn+tUaAv9oNE5L2U19v64tmEGShrtSlVDklNyLi489YFqe4OaVy1Qx2D75CUxlAMaAM7H1xIXgH3qq/DyqhV8SjdQhio4K5vfjKLKNUNIhXLxkWxslU4DIQsm61daGILX6YzELHMEQrDH/A/cm/ALhWnr0A0dkhH+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(6666004)(478600001)(6486002)(86362001)(31696002)(66556008)(53546011)(66476007)(26005)(66946007)(16576012)(316002)(31686004)(36756003)(8936002)(2906002)(8676002)(5660300002)(956004)(2616005)(44832011)(6916009)(4326008)(83380400001)(186003)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N2VEUkdrNms2d2RxaVR4bFdaSlpHdFlBcW4xaTRTYW54WnpHbFQ3OVBaaDZ2?=
 =?utf-8?B?VFUvb1ZMcDZFd1JmaVVLcmN1dnZFVHFXZWRMMFVDamIzT0dqbnN6QWdjTVRZ?=
 =?utf-8?B?Z2IySG9RcUJrOFMzMHVzYTVvai83OFFTQTAxcC8zRzloUUpneWNkQ1N0eTJE?=
 =?utf-8?B?bG9vekNzaGN6M2NSUE12MTZsQUlodm1UcTRkOVRnQ3VldmJLcTNIaTEvczBX?=
 =?utf-8?B?SXFnTFBQandyS2VUWDhGZEk0c1M2TW52cWhQNUhva2cyRExqNW4wMWE2TGlD?=
 =?utf-8?B?cUxndHRudUsyYVM3WVNIRU9kZUxxZ2hwMjB0NGoya0Z2K2c4VXJlZUs2SmdJ?=
 =?utf-8?B?VFRWa1JUTUd3dHBIbEpOaXorakZObk5YajV1d0pxTmRMaWttV3puMmlRYjBU?=
 =?utf-8?B?ZnorM0R3NGErZ0Mxd2pIQlFXUlorY0Y5MFBOSXIrbFd2bXFJQW9TNXBiSmRl?=
 =?utf-8?B?ZmJDNjlmaTcwNElFYlluWW5WRkxaZTI0TzRjcnh0VGs1aW9FSnU1Mk5mMWo2?=
 =?utf-8?B?dDRNenFCbHovMVJuRmVjNmlxQzNDMmV1WW5OaDR0VkpGN3REWXYyWTIzQ3dK?=
 =?utf-8?B?RjJBNkZ2L3JrNkxRajdvR0UxU3lPWlRMZUp2V0p2Q2ZDZWF0TFVTcEtrODFo?=
 =?utf-8?B?UC9zK2VPSXpXOGNLSTVMcllNT3JmTUdMdXNoakJsYzhIbFJOVCszbWFhNXNw?=
 =?utf-8?B?Nk5Id0Z2ZEFoVEhFRDkzMk1CN1hwcGNZMGViU2hLSW1VajBzcmRzem4wcmhl?=
 =?utf-8?B?YW5WcXdVMmRkcHNTUGY2NmRjRHRxczk1MWQrTVcxT3ExWXJROEJRRDVOMWpz?=
 =?utf-8?B?by9rRVVsSnIvQ1lFM2xWTG9sRW1mbXZwWUlLMUJvK0toY21jQWhNRTU2OXVY?=
 =?utf-8?B?aXlaUWRjVnZHTm1IWW5yTDh6K2Jva0x6QlhJQTFvN1hoSllJZTdscTZjSmFn?=
 =?utf-8?B?V01GcUxxNjRSUXQzRFNINGZ4MC9TS09pWENlUjhWQ3c3K1NaRVY0SjN6YWty?=
 =?utf-8?B?WEVvN0NHVC9CRERqaVlnOGdtL29FVmpWLzBYUlpXOGlyWkRxRDNTdGMwTlFh?=
 =?utf-8?B?NDVaWDlzYVlVdjlKK1IrZnJ1UnMyVVR6cE52MVIzN2pkdnIvZHhrVU4xNHRx?=
 =?utf-8?B?dHF5ZEJmK29RNEtxc1cxcWNVWmlzK2N2Zjh0WVlBOURNSnB3bUYyNUU1V01J?=
 =?utf-8?B?bmRwSFNQbEdGYnU0ZzJhUWJ5Q2x3UWQzTUxzVXUzOFpTb1hLcEE3Q25CSFZB?=
 =?utf-8?B?anFXVm5uQ3ZMSVVsOHpGMW9QL2hYMCswUDFOcWZkY2M0d0Y1Tm44VVJjNHE3?=
 =?utf-8?B?eEoyMVN4ckpoNXNyREVTMEZmN09RY3AvaUNoUU9vTmVUY1o5RGhsUitHUU5z?=
 =?utf-8?B?QU53TnBuRFdUdGVqYktmbnZ5ajRMQ1ZGclh3VTJ0WnlHWkgwNzBHcWlJVENp?=
 =?utf-8?B?aTcvZTExOG9nZjN5SWpzU2h3WWttMTVVSWpLQWxoT012dWMxSW1LTnBDMklW?=
 =?utf-8?B?bmZSRGVNYzM4cExYQkhkVWJpY2JKekl1eWdybnFEdHdUdEV5VnhrZTBUUjRW?=
 =?utf-8?B?RGY4UmxCQTFrZ1JQNlRTMjRvT1JnVHBuZEtzc01pWTgyd3N6Yi9KSW5teDMx?=
 =?utf-8?B?T2NSVHNnZGhIQmptbG5sUVpqMWgvR3ZlZEpCa2xJSXhUb1hPdExYK0s1eW9S?=
 =?utf-8?B?S1V3dnZpSmUzekd2WmN3OG1JTHdDUWkzeGxEOThwVHZEUlhXRHRjVEJMVjBs?=
 =?utf-8?Q?gFj5CEuwJtFmhEJJnvSbe7QuKa3UkwmNklq1cRY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6591767-3888-47f1-78a6-08d8e9946681
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 22:31:25.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbArWLtj+KBeJ83inU+rxCAa0rfjbFUjXkdrr2BdVgtvqTem0zbWFhH1gYIRPyDpfqHGulJC404hu9BOppJldZW8zJtyT++L4KpHb3/iUbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4448
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170158


On 3/16/21 11:04 PM, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
>
> ./drivers/xen/evtchn.c:412:2-5: WARNING: Use BUG_ON instead of if
> condition followed by BUG.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/xen/evtchn.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
> index c99415a..b1c59bc 100644
> --- a/drivers/xen/evtchn.c
> +++ b/drivers/xen/evtchn.c
> @@ -408,8 +408,7 @@ static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
>  err:
>  	/* bind failed, should close the port now */
>  	close.port = port;
> -	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
> -		BUG();
> +	BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0);



Is it actually worth doing a BUG() here at all? Seems to me WARN_ON_ONCE() should be sufficient.


-boris


>  	del_evtchn(u, evtchn);
>  	return rc;
>  }

