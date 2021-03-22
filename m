Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FD344FA0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 20:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100453.191375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPve-0003Bu-Lw; Mon, 22 Mar 2021 19:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100453.191375; Mon, 22 Mar 2021 19:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPve-0003BV-IY; Mon, 22 Mar 2021 19:09:30 +0000
Received: by outflank-mailman (input) for mailman id 100453;
 Mon, 22 Mar 2021 19:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r/9b=IU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lOPvc-0003BN-SW
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 19:09:29 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7b693f7-0dfd-49da-82cb-2781285e916b;
 Mon, 22 Mar 2021 19:09:28 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MJ4AxC094132;
 Mon, 22 Mar 2021 19:09:25 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 37d6jbcphn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 19:09:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MJ6MrN041457;
 Mon, 22 Mar 2021 19:09:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by aserp3020.oracle.com with ESMTP id 37dtxxaw7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 19:09:24 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 19:09:23 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 19:09:23 +0000
Received: from [10.74.101.211] (138.3.201.19) by
 BYAPR02CA0037.namprd02.prod.outlook.com (2603:10b6:a03:54::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 19:09:21 +0000
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
X-Inumbo-ID: c7b693f7-0dfd-49da-82cb-2781285e916b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=zPn+iu7Ye/W2MmnTGOHRETUDtVmPyAC2+mP2WpRSSlc=;
 b=Vy2stZql1bm9ynr2mTr5L2alkQqsZTjdWZoXNTOkaPBkG7gO6pW1aTy52JCzbN/wNKi3
 QVzV4BBC0sqQPhvmKW9pZaRuqto+jfoLqb/dim9Q7b5VQs8rZy3qom7jTsGIM8Od6Eza
 +kEsku5K5O9Olq92mmtXyxmmEs016exyfAeBHqq5iI+XGcAQxWjiujg5qwMWolxOmAkZ
 x9RyfHDn4oFTeY9sL2Ej8K5B4CyYe+9okgIOrlufIiqc5mULo4T9d3hwiJcczzExv1uz
 NgnbsIv9iVODkA5yBgZOLP9Yu7JUgiPeS6u6dSTDNZm121iKPy8FKSWyb5o0HDOe3Buz tw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMR45aSgKcP5hzx158TFPS5rNSwIt2R2bTvgVLkeGWvKfNNuon4wVhhAjqI4JiMkYj9XAtPGziqS3/4rXvoZb7hYcSTDUbCDfLjjUodtVyRnuSklZb8c8x0LMFgWSzmzbR9H83w121XRDx/wucow84lV5Ok4siTN7vGe+GJWHGGQnK7wfDm6BkpWWDpWBq+bNJHJpMqX8dJhrtCaSPhNZ+ow1mpSTHSVTT4cuXwsex8JLRHWD5ASG8FRrBIJOvj1dhVWquHQ9jGZCoXrHSTBs/Uq3jHr8Cdt1IRXdmLTXkB2fkZKdME6DUDcHcNDwcg1Z2bkau3BAhKZM2G5QHT/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPn+iu7Ye/W2MmnTGOHRETUDtVmPyAC2+mP2WpRSSlc=;
 b=ik2CvQfGEHkAQYrJUVpxPWv00z2yzLIRSw6tXFsVjVmm5TvCG4SahPmPfMDlzPAWqxzZI7MckaqvaypljtUlOdLibMRItWO0pfQ1Ho3qNJmFcO+//NQsx5QKfJQDNcEBFA+uLdMnh44GicggznVyHfH4Aj7P8cHDI7yzUvaA//jkpw9kAC0grcrp4u1Y7I9l2wgl167QLo/tB8wsdvsZmNTWJ9WQ4lXMU0bziye1U+j4FhIJoODPM9U5Devd4jU548ACm2sgCvGnaYwFFwyv7GCWBuYel6/MJbUOc65J6+9sekvx1l06Pzg6pFXNGNvbFagfQVZIwYQNby2f69e4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPn+iu7Ye/W2MmnTGOHRETUDtVmPyAC2+mP2WpRSSlc=;
 b=pqbrbdTi16q6ItNk3cOXvacNXKnXvUROuLoA8jATY9xdXktRz4Q7Gjs25GDCgJaMXVDu3fkvZQ6zgi+5KFKsfXvVTQDR8V4pIwfo7PPvnxR7nqLlFNKWiqy8pTgUj15Sm0esc6NhALE12Sc0TkHHJu2b6x5N9BxA6PZXqkxnig0=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH 2/2] Revert "xen: fix p2m size in dom0 for disabled memory
 hotplug case"
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20210317110401.46322-1-roger.pau@citrix.com>
 <20210317110401.46322-3-roger.pau@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <aaa16b38-6de3-7faf-e4d3-31a7b726d4a2@oracle.com>
Date: Mon, 22 Mar 2021 15:09:19 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <20210317110401.46322-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.19]
X-ClientProxiedBy: BYAPR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:a03:54::14) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c92eae6-9992-4f4c-615e-08d8ed6600bf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB473481750A6DF195F57571BA8A659@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/2oy0h82ICFEHtw/Hsn+JHrTDQfGEegVPbzJoNqmX/Yyjn3yVU5sSLL8rFH76B17v9siLMTDXzlieeISMzmzfaiEDcuV1Xa2Islrx3pyqzIciOcYuxQ/w6mcwt29HlONd3ccjVm3HNVtG/OGjxc+zS3yziTT1acrIW6jrr3eDQGEID5ywilrXDP6x5uLiv1N3D0/1t3p/H5e1FUu09lm5UcoGKOJ57It4dkax00zbEFjkKU45hUA4EGaG1OKX/KFbsmT81SaEydv1f2aHoeAF/J3hwRvxrA/ldFoF3tfuvpEY9UNQFzo7EKcZvkmfPJ+fscbS6qdLUJ21Ds/TDBk9LiJA2cO7KCTIoMXEpEQm9h+IGqreBgHuyfs6GI46n5+hvn2lXgWQiEqikXzwYDt5A+/8PynR4/crNo0iQpL/PqMOZZvvscrJWSmT7jv1DJ6pih3pjzqCXgwcgcqZRs4W2WSyFhZsCNOCmYGiDQ0FWkomOrey7ai0cb0mhPx7AJNyxmM9wOZp8wH3Tgamv79DyuQphNRHgWyGHpTuBlpChdRB1WQ6UvVY1xDAZcjAJertDr8kk1LHM5hIyAmTIgnC4rd7zD6HgdKuz6y4QPM1voHdsIj3ZUnmJdJ7bhgvO9s23RbZtzn/oB9s2sjov8xI5b+ErmIVssEq3YLfpr1FL5mprg/yuTR34PiT70qGMWfNCwj+4Blc4Id5pYb8n9dXTezd5WzCmAaT3szjbSr+1s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(376002)(366004)(39860400002)(6486002)(478600001)(86362001)(8676002)(66556008)(31696002)(83380400001)(2906002)(38100700001)(8936002)(31686004)(66946007)(66476007)(4744005)(316002)(16576012)(54906003)(5660300002)(36756003)(53546011)(44832011)(2616005)(4326008)(16526019)(26005)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZFM2M3lSbHhDZTh0NE9KVnh5MjUvTnJ1bWswYk9KMFJadWNZSWN2QUVTbTFk?=
 =?utf-8?B?SnhmT0U3RnA0a3N1UjhjV1kxU3B3QWhJbGw0azRPZWhzVVZsNHd6QzdNSmVq?=
 =?utf-8?B?QVIxUGRHVzFXMVExbWdyNnMwOVNjUWhKb3k4NVNhN2l4OFNlMWJVaStzNUxh?=
 =?utf-8?B?N2J2Wjk2NjZoSDFPVGhPKzhseFAyWk80bWJKYjVQUUFIck1iN21mVGk1MGFT?=
 =?utf-8?B?am0xeWNibnZhMkRuTjdEMWdqYWJ1aW1pUXh6d0YxbXUwSHdxSnVZNkNKRXFF?=
 =?utf-8?B?RXdBSFdiOFFDUFloUDl2OEEwRzhCK201U013dVlDRWxTL3ZiQ2YxT3FiVzYx?=
 =?utf-8?B?MzZJMGNVNnFyNW1CbHVrUGNhdEpHcXE1c2NmRzVXTTlKVUtPMnphQStoNE9z?=
 =?utf-8?B?VTU0c24yWXgzRGRHaWFUR0Q1aE9JNSt3U1hjS1VLV1RETXcwU21NbkZPN2JN?=
 =?utf-8?B?Wm9FMDNjKzUreHU2ZU92Q1ZaR0lmZkk4K1MyKzlRNHdZait1ajNmaStkNklw?=
 =?utf-8?B?aHg3KzhMM3N2cmllTnVXdmNvYWtJb1N5TTJOL2hCYW82Q01KVkpCWlA1SzNM?=
 =?utf-8?B?S252bFNCdFpGYmVldU5IR1JFMmNLK1RUR0NkTWZLbW9JYk51SHZoWnpMV1dU?=
 =?utf-8?B?cHJXeGRBakhSWUdHVk1MVEtHTUxSazlnanVlOC9iV092QlRzYVJUMktDTjVY?=
 =?utf-8?B?TlgyQnJXejRyZnZ6YktlOEgwczh6aVJucDhxVEo2UXl4NUVHNHJ4d1JyRXlk?=
 =?utf-8?B?U25udFF4ZjFHRkVCOXNWZHpjYit3VERjbkE5aTJDU2J5cFFxdnplTjVHZ3pV?=
 =?utf-8?B?aEdiMlJ1RTJ5dWZ2eEN3WmJSQnRqaG9FcFlOMjRhWkZkaTRZdDI1enJRMm9u?=
 =?utf-8?B?RjZMR1dXSTRjU1pVcEN3N0h4Rit2djJEWFBROHhwMXFrNFlXQXZtMG1wcERJ?=
 =?utf-8?B?aG1RQmtPMmt3SlpRNUw3cTFMc3ZTTUJza3NtMmhLZS9yRThjYUs5TUtqS2k0?=
 =?utf-8?B?MVJSekJQM1hNVkdldndCVHQ0QmZmdE4rTlNsekFYdmVlOExYbkZ2QWR2VjZ6?=
 =?utf-8?B?NzJtYnJHY0dGVzRodnZ3eGF1aDVrZkRsQit1VkJmNFZnUzBiR1ZoY0k1TjU3?=
 =?utf-8?B?Q3RiY3pGL2RVMk5UeHBTb0s2TjRXY0JqMkIydG1md25BdzVBbVNtVzNBRGJq?=
 =?utf-8?B?VDlxYzdySVZ3THVCQ01iaVNDRTdwVk1rMUQxbW1taW1GU3lPVHdzUUFsYlpP?=
 =?utf-8?B?bGdrL1dhcGtyYnh6OGcxWkkwd0RiUk9sSUphZ3JTTDd3c09uSmN6ZUkzcnRm?=
 =?utf-8?B?bTZQVzNKa25BWmpnNGN2aGs5ZnlWOEo5a3pNd0tEdVhFdyt2VG9mMjNkS29U?=
 =?utf-8?B?NXVFQmV1ZFlaV3M2WHNpR3ZVZmg2UmhXZG9rL3FDT1NlSDZ2ZzdsZ1FvU2k4?=
 =?utf-8?B?SEFKZEJUaWxXd3U4Z1pMWnFiZFFqckU3UkMvQnRqaEJZdzA0WjQ4N0hEK1FY?=
 =?utf-8?B?MUwvWkkwZ2FuRGRJcmgyYkhrK2F2dUxodXNLcllWSWFvb0pLaUdwREpUV1lI?=
 =?utf-8?B?S0EvbFRkU1IxRlpJY2M3ZmZUd2ltSnR0dFltZnlwR0RPbExWMHc0L3dla0pK?=
 =?utf-8?B?SmdiT2pPTk9WNElzT1hkS01CZ3E0RU1nM0NnWmlVSEhveXZzaXR1Y2o4YlRm?=
 =?utf-8?B?VFIyZXY2akJCRk5XZGZhU2l1RnVrUkdpZHRlVUhzaWI5M0k5NjFiazlpMGpD?=
 =?utf-8?Q?71oh2UHPMrjDTVnhS8j/lH+qCGeSeTn82K4xAaD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c92eae6-9992-4f4c-615e-08d8ed6600bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 19:09:22.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jugGJqx/9G8W8EXvsQ6CXeCINi8keBJ3znTjGh+chSi6fxNhN7JcH94tOPyKLGW3WP1hte2T93L1W6N6iXtEp7kyhxvcVG664En4ZQOOBaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220138
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220138


On 3/17/21 7:04 AM, Roger Pau Monne wrote:
>  
>  	/*
> -	 * Clamp the amount of extra memory to a XEN_EXTRA_MEM_RATIO
> -	 * factor the base size.
> +	 * Clamp the amount of extra memory to a EXTRA_MEM_RATIO
> +	 * factor the base size.  On non-highmem systems, the base
> +	 * size is the full initial memory allocation; on highmem it
> +	 * is limited to the max size of lowmem, so that it doesn't
> +	 * get completely filled.
>  	 *
>  	 * Make sure we have no memory above max_pages, as this area
>  	 * isn't handled by the p2m management.
> +	 *
> +	 * In principle there could be a problem in lowmem systems if
> +	 * the initial memory is also very large with respect to
> +	 * lowmem, but we won't try to deal with that here.
>  	 */


This comment looks out-of-date in light of deprecated support for 32-bit PV. So I think we don't need to revert this part (except for the macro name).


-boris


