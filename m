Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F141414A8D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192740.343343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2Jc-0000qe-QA; Wed, 22 Sep 2021 13:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192740.343343; Wed, 22 Sep 2021 13:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2Jc-0000ot-M2; Wed, 22 Sep 2021 13:29:36 +0000
Received: by outflank-mailman (input) for mailman id 192740;
 Wed, 22 Sep 2021 13:29:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Psju=OM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mT2Ja-0000oj-AT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:29:34 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f486152-1ba9-11ec-b980-12813bfff9fa;
 Wed, 22 Sep 2021 13:29:33 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MCsSKZ028874; 
 Wed, 22 Sep 2021 13:29:32 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b7q4rbwq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 13:29:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18MDJarc107935;
 Wed, 22 Sep 2021 13:29:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3030.oracle.com with ESMTP id 3b7q5mxwrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 13:29:23 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 13:29:21 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:29:21 +0000
Received: from [10.74.114.106] (138.3.201.42) by
 SA9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 22 Sep 2021 13:29:20 +0000
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
X-Inumbo-ID: 1f486152-1ba9-11ec-b980-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5/k6rm/vumjDkkH8Yl96dkTOmRNZ9ESQftaZaR+KVP0=;
 b=NVC+C1DqXlAyp7V7ofXmNWyNuKLs+kYsgmZgQJP3cKQBvYxbHPeyZP8etGTahQBCnh7Q
 zNieUbc5A/12tbyE7Omv+5Q5V5XLm0NEozRw3bxtW6NFbmDcHDRavqnz1BpS+hdZUdbw
 h27Ta+nanTz0gBGyW6vK0MTs9CvqATKuGdqzcJ7Hij7QAsdf0CM1D9c2+uIr+VsDMiD4
 MaWxum9iy9dzf9dAqQ3e5kXiFZrjXDS4EwnmfMRalEQTphUR13ve4Shq7CoaAMnMDvUR
 rUG5czgqWJrDeeI2V0Wuj5f94ogAED/zxE1ZZ64MgK2sU7CRoMmVdZomvQDS3dhwLn2F gA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkO9pLgnAQzgeYNh4Lnu8w5vKPa+UjrRshVspHWJPduS8wjGaUNYR1lU/x87Uko1Q2cGmQwwBfT8ZoNhMNON7DllYYBwTDUwOoRgF+GsCJ0Us3fJExR00UZJU2BFy+CAiQDf0ELoniy+fqHBE285wGnOPD27fzqkD8JobigDFrzG7LHqO0e9wOz7TvweLH1mDjjuM7jsD0CIxZmJNCMHBcAsQBMyZZQmRw2+9AhG08ylxaE3gXu/mCVPD+j2C/cB95vPzF4UAtPDoK7cXPFMnbMGKRqjgLyiKUsEkwVBMb8Q5uaoGfMp1YJCC/vvGDN7xUTQAXJ/M0vrJrK5I94cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5/k6rm/vumjDkkH8Yl96dkTOmRNZ9ESQftaZaR+KVP0=;
 b=RVD/PFOa1MwjpmIwZ/aSlYWKIHbjIuOQFFqKAGpg2WFu5MkYUGMlXouXhoqV3D3rPAcngaTwO5t7F1KXT89+rdMU03te/0R2PK2rVzqosU1hcbVEZFl3coQFjQYty7fPICBoePtnsTWhoJ7eYaZ8kJ41j7/1UGpmTyGKNlZzETjEKDeYydIRyMIIN1XXSTjf10FGbVio5vK1JwYy+doLRPt6paiaqltU21hzTQ8PUVLMn3QrOylz7vaB2bA6Psb2DeokbwOsdMu55GoCFJYqudAKeCuSPAKEdgCLY61t9eCB1kxKBfCfH7IugHfu80NO7AUz7PzYrCZdc0lgWTGbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/k6rm/vumjDkkH8Yl96dkTOmRNZ9ESQftaZaR+KVP0=;
 b=vL01eEISu6G3OTNuWYkhfrdRF2BLlswhjHAiHXUN6y6QYmGlYDnfJ0f9mdSQeVcN0CQRGxqt1nY30eMmUV0WG4cyWwEpojFUwkwLsCs4ncTkcc7XUMpBGg4t3QrhVds0W2GKytlWhIqgxdQua85JDKtm5AJhJQxKoRp5riyJ1I0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/3] xen/privcmd: fix error handling in mmap-resource
 processing
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <aa6d6a67-6889-338a-a910-51e889f792d5@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <c0c84258-c2ee-f58c-ae9a-5f8bdd75f0db@oracle.com>
Date: Wed, 22 Sep 2021 09:29:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <aa6d6a67-6889-338a-a910-51e889f792d5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::25) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf1d85c0-8974-4c12-95e2-08d97dccfc8a
X-MS-TrafficTypeDiagnostic: BLAPR10MB5154:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB51545B9CC70422931FD15ECE8AA29@BLAPR10MB5154.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yXPL13EOsFoZqLkjP4mKSTI/AdMNYZVNvm/Iti68+op3pLuKF4vjQRNlBF9d1lmzCXioHJ+bE2DMUsOMk3Bqhrmll4ddXLQCMhmYheIvQ6u7FzxbENg8YbNW3VFlHqHFZrXvgTelvZHxILOZx/5uGgBaTeXl0z9ZmNZxdzKJ4TrNt316eSYPjf1Q3j+FaTH0FYzMcOBvCbLblB/dK5QIoZT3kOB+wYt67Y0t98nWkCPtA6B7sLRUWYes5VEU+8Jo3O7W0Ipf0zkxvWggh+40oRGcndRkj+DIC38noIpHX01WRU/8HQPnGPh8BgpGWn0d12whFXKIpRvKYJSWp+ru//rHBwHLLVhbaKReVB1d76phcoAvtLxuHR39D22JuGNOXOrKTVk70rU/EiHZ+GO6uXx4iNzEXrAJ5rYYrpAqas3eqJ1H2P2YdHM3Lg6vKOjGtF7AJneoGE/jQMnIadJMPs+Xs6lCfWq6Woxs1PoAxiFMhk1XcuT1v/YOyU1T39h393+2nrepGTwi9sJNFmN3TgVaKnMUsdQh3waY6DrwrGUukZbNlyiyEqkGdfrx8FwjOv0aWJ/3r7L7C6Jn1wMwhJhRrx07TGV48hsTq4zDoUyC0odpc2giBt67PaMNSP4xzcUP0N/0vA+BVxrgOQ5+W3jEuXkmMkXpgw0OY54CsiN0ZWGGamMvYfzbY9KKNw1r1QdsopHtRLgC0evQybLVcega9sDLqqg26+941XRoq9HDQvdpzzBddsMPmiAeCPJq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(31686004)(6666004)(36756003)(8936002)(86362001)(26005)(508600001)(54906003)(16576012)(5660300002)(110136005)(6486002)(2616005)(8676002)(956004)(316002)(38100700002)(66476007)(53546011)(2906002)(186003)(4326008)(66556008)(66946007)(44832011)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djRhUGdOWE9QZW1aT0tGU3BXeW4wUDdqbGd5U1AvQTV5WURha0hrUGVVNWpr?=
 =?utf-8?B?emRSMWJzcnNtbHFLemQ1OWlZOFZseXNWK3NyN2dWQ2JQeTkxV1cxN1lYM05l?=
 =?utf-8?B?OWJYVVh6Q2sxQ3FRbEZyOEh3U3pidDdXMkdPZHI3Slc3K2JCWS9MYWxqQk1a?=
 =?utf-8?B?OS83anErVkhTWHkweDVtUnZqNkluczl1bzlraEUrejR4QityQXZRK05YQy9G?=
 =?utf-8?B?YzZjTjRFaGwrZVdrSDJLYUEvL0V2YnBCcmp6UCs4RCt1cktGWmVFRGZ5QTJP?=
 =?utf-8?B?Wm5HNHpQSlhHN1R6ZGtyZDJ0WU83N0lIaW14OXVvVktvVkJDb1I2aFFMdXlM?=
 =?utf-8?B?cGZmVVRUUUsreHk5azA4QTg3TmNMMnpTN2VTMm5tWm85YjJHWFJ4YnNCWlpC?=
 =?utf-8?B?amlnUzI4aFNhKzIwdzNXQ0luT01NMjBJUFpDOGRmeHg2VUNEODNjZnhsTHVC?=
 =?utf-8?B?YVdHU0l4bkM2bjlxL2VvM3ZBaGdidXJYWnlmUWlhSzgrUEtvZlduRStKTzVV?=
 =?utf-8?B?RE00NEtMMFJEcXVUWXc4Z2hYYjFlaTcxanRBWFdGT3JKWXRJZTh1ajRFL09i?=
 =?utf-8?B?eWovdGZJakl5MENIc3pCMlJKR2FKMEhrTCtRZ2cwcloyeWtjMFkwUC9UNGlJ?=
 =?utf-8?B?ZE9Rc0ROdFZUb2dwaXZEUDdtWDBjaFVpbmk5ZEdVbFJPdmxJcFV5blhldVc3?=
 =?utf-8?B?ZTkrU1FmTW0wYnQwcnZMeCs2S1Ara3E0UFhrWllBM2hyWjJHWFJraGloRDVD?=
 =?utf-8?B?MU44c0tVRE5NOGF3azh6c3NIelU3ajZnNG9FVGp2YlpxOW9IZTlHWDhIUW5X?=
 =?utf-8?B?aGhkTkc5cGpVVVNyeVk2OW1FTWgxQjhiV3NHaHhDdDF5bUEvdEhqd08rYTdQ?=
 =?utf-8?B?TnpGVzlvU0RIMzFoU1ArOW04NlhQMkh0NE12THdGTHFCaWlkRHZYL083WFlX?=
 =?utf-8?B?WlpBREd5L05ZTmhRbkZNS2dzWDhDVGlGYUJISGhCQzhYKzA2QnFER3NTMTMy?=
 =?utf-8?B?Z2FVQjBLTURXZWpnZm5ydTBpWnMzMnB2RU5ETG1PdFQ5allPWmlKcStDVEhq?=
 =?utf-8?B?RjM3ZlBubXJOMktQN0tyYlhyeE9ZUHZVNlB3TWVpTU1vL0R4N2xSQ0xKTWw3?=
 =?utf-8?B?Z1pFUlRYWkxvUzRrOTR4MzVBYTM2dU03VWpIdWl6WlJVWGZxNkh5VUVSYTZM?=
 =?utf-8?B?QkRxTGZJUWRsSkdKQW41QmRZcVBtRm9pYjlScWExejNjQ2s3YlA5TzFKU0tK?=
 =?utf-8?B?bloxSlROTUsxMVRvQk9PdXQ0TlgxaW1DOGU5UFBKU0FEZ1Z5Q2x5YTdWN0Q4?=
 =?utf-8?B?OWFZajNpU04vUEZFMTczOWhRdytUVGlvcE9mSFZFdzIyUER4ZHBkUzQ1V0tQ?=
 =?utf-8?B?SWhlSGFxY3o3U2NmOC9vS2pmYzUxMGxhZ1FhWHRYRTkvS2JxWGxNM29qVko4?=
 =?utf-8?B?c004S3FBUnJ0Yk9KK2hsRWZ1Y2d2Um84TjBrbllWMkwxM2VWTVY1ZUNKbUdO?=
 =?utf-8?B?L2M3TzFYUjhjRVd4cm1WZFBEakJrZ0NGb2FjWjYzdEprajB1b0Z3SlQ5NDQz?=
 =?utf-8?B?WXZZaGtGN0RNR25VekZJbjR6amtxcUtIYkd4c1Y4cE9XZGZOZHFvdWF3ODd5?=
 =?utf-8?B?aDVlUFNJVXVvSVdmUUFBM1BOUzZvNFFwWmpQcHlTYm9lai9FMDh0WGU4aDBK?=
 =?utf-8?B?OGtFR2hXQ2theVdLTUYrU2k1UDQ3MlVZRWJTOXhCSXVDamVkN2doWU9KUTlp?=
 =?utf-8?Q?hsdYfgXKAh2sI0kZLgwmF+edwfbsniRHtDZpoaB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1d85c0-8974-4c12-95e2-08d97dccfc8a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:29:21.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmkuQmqJaPsbHVVLYK9iVhRnrKym2bBHJltBNHfwFp3yacFP5OObw9H9Fz1v5S5Gism+ynXyxgAMBLOJNW/oG6IW4qOY9N8tZnuegnQ3X9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10114 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220095
X-Proofpoint-GUID: x8abET5ak2bIf3aPfYFOW_NQZTVj0KYb
X-Proofpoint-ORIG-GUID: x8abET5ak2bIf3aPfYFOW_NQZTVj0KYb


On 9/22/21 6:17 AM, Jan Beulich wrote:
> @@ -817,7 +818,7 @@ static long privcmd_ioctl_mmap_resource(
>  			unsigned int i;
>  
>  			for (i = 0; i < num; i++) {
> -				rc = pfns[i];
> +				rc = errs[i];
>  				if (rc < 0)
>  					break;


Can the assignment be moved inside the 'if' statement?


I am also not sure I understand why we need error array at all. Don't we always look at the first error only? In fact, AFAICS this is the only place where we look at the value.


-boris


