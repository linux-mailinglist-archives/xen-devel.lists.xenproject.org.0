Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DE3B0B7B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 19:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146005.268574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvkGB-0005Pj-Ad; Tue, 22 Jun 2021 17:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146005.268574; Tue, 22 Jun 2021 17:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvkGB-0005NZ-7Y; Tue, 22 Jun 2021 17:32:27 +0000
Received: by outflank-mailman (input) for mailman id 146005;
 Tue, 22 Jun 2021 17:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRfs=LQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lvkGA-0005NT-0k
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 17:32:26 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b55deedd-7656-4874-a7a0-a3530016ff2a;
 Tue, 22 Jun 2021 17:32:24 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MHHQkU010365; Tue, 22 Jun 2021 17:32:04 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39as86ujdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 17:32:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MHFqTF173442;
 Tue, 22 Jun 2021 17:32:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by userp3020.oracle.com with ESMTP id 399tbt3d1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 17:32:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB3949.namprd10.prod.outlook.com (2603:10b6:208:186::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 17:32:00 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 17:32:00 +0000
Received: from [10.74.101.176] (160.34.89.176) by
 SA9PR13CA0177.namprd13.prod.outlook.com (2603:10b6:806:28::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 17:31:57 +0000
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
X-Inumbo-ID: b55deedd-7656-4874-a7a0-a3530016ff2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=sF9B9msUqlPodgpOgTK/j2ZCCIDp54oksLKTPM+GdSs=;
 b=GykAkj2D6CJ1tsRQ7U1VWSofxSM8d0qtq5tbVgAz3NR9ESi+s2xSqxZ7fHlJxoUZvzdO
 zWOKZDoEf67FZyRCH6bGUEgyrTtlqq0WQehb2dqdcRRyw8PCeCWcJ4+IUFWM6GsVQxW0
 /joRjbaTUgtCAOetGkqM2mqWIEgW1/JmZHZtcnPcNBMB25IT0zYk+USrrX8jRtFaDvSc
 SanhtuNAIxriphvb0XFdpipSnSkUnoT01gN6a9n2i5Jdn0O7Qk7xXOYvE15tXmBUieWn
 ezebfytcPh8sEtLPo3Yf2KhVHHAndjrEFZGgfwe1WJC6uXBbf9J9Z3eEx7+eU8c35cg/ fA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQWuFbq/lPVSfpTZw948PFpsFc3T2BkUDI1mzqDMtsGtRrFA7brLUaDstrTzwkEhtlXOY75znL7dkcnTF9hc9XwTAG5XNbAP4FfM1wMnBwwu1n8ySTGXIwZZ8zngeKaMAjAOcY2nCVmpcaytQwIR9TTstoKngxr49bbk/oq9x1Avyb0Bg0bBAfbmAVzFCtD9Fj2EtL5FeIwI58vlmBRLzda7PmFh18RM7F4wgwqoVzN24FlYSbxmpWiGSWWeRT22RxO9IMkJeSAngXE3vnJ0xr3yJgJqEN3UHt81jhchQgtM2paWUtLobpVD/eCkNXrnvk9ul/Osiv7vVxqSopLrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF9B9msUqlPodgpOgTK/j2ZCCIDp54oksLKTPM+GdSs=;
 b=aRT/1LrfyMgmyC/2mSYKvai+JpoeKCOO1yPoQU8hGX6FYfXF0njmZ5eeEAxglNomlYzknMiGBub1zB/n1eH18C0Jbv8Z6V/Gu9q0tEeLuGjMmP8CxhAYjHUjX1n/ypfCwnqkglXYHsSER8MUbCHMlDEl3uClT5RGh5ujep6YV5XNSGKN/ydmiaOSoDSZorO/o2tYhUIWOLZQIwHb0h7OZN19XaVBzEQi8583VLKmWtsoRh9lnXW98P8BiH8iLuM1WyZGwilPpNDfQNIcimIFwyO2KOj7uBIjgFz6TLUgGoiHUWDFvPKAgycCvzMyE0bHEDsXqR6IQrjzsUoXzGwvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF9B9msUqlPodgpOgTK/j2ZCCIDp54oksLKTPM+GdSs=;
 b=ZUhrK/s/8ExAbRgDCFHBdfTz4nzz+DgUQAsCPaQ6HhJGhVVs117vynu7uI/8p2c6TQuOsa4WlYM9MzMu5d2a6w7Q9WHtIhoBJ43r4zRMzBEHZ0k0+fzBg2gPrnJdPau2qf01SG/oh23jEXoO67DbZl2KiuMY3lSELfF3r4zyohc=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Zhu Lingshan <lingshan.zhu@intel.com>, lingshan.zhu@live.com
Cc: Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
        xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>
References: <20210622093823.8215-1-lingshan.zhu@intel.com>
 <20210622093823.8215-2-lingshan.zhu@intel.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <92fdf981-68ef-92a2-b1ae-0c5f347ae460@oracle.com>
Date: Tue, 22 Jun 2021 13:31:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210622093823.8215-2-lingshan.zhu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [160.34.89.176]
X-ClientProxiedBy: SA9PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:806:28::32) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec7e3d1-b17d-488f-fd04-08d935a3a47f
X-MS-TrafficTypeDiagnostic: MN2PR10MB3949:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB3949FCEA45214EAC56C215418A099@MN2PR10MB3949.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S2TECVWxkXCYnj2uONAjQLYztdX2kYyeQe/02lbuR4XxwbK6hKZn7UmndvLLAtWcsAdHDngPtvDawnUE85tcIlSVyuxvtNpDKptFYxaFA8Hb/jY5oeufKf0pxmt0ALF5MVJb5k/IcVWi/1GtVy3u+TJcrXrlE0P7aMeeArHAvle+ypdnBg64A9r/rPbEOt82rNeZinqjIJ2IEyM0ij6yCJvE3n4q0ITK9GN3TeH8N+QaRIn/pq9J/WnHY9RxuiGPvsxFzrZ/Aoh/oQPLCtqKLaxbdwRLW7b/8s1xmegebER/ET0Or+XFqiGQsogZ3RETrQfT57sOEHpuy5hA/zxFlM65oUkxlqhC7ZjiLCGGcsXBgfbTmgqMf6GglOJpfmlKn9ciK3i1RMYJqzvIcfOzwV9D2rWNd9sWpLshsc85rDZAg5i4do3syTLVlvaGDUNao1epaLZ6gWJM4vgp6Qv8El+WwY6oGzctU/qotfQGmuON3ix/JS2Q5JBnvgLhyK/YibhH0JS6z5mg8PflInW7h9KLb50dCpSoDpMusKhZcR6eznzN3vCUu72wenaBe2XNTVT+naQSxJMKgj3cSsf3OH2YlEGyqZ0Pgz/6xxhRdbsWeLLYP4yq1H1XYWgVUcLLgo23B4YdYFFM1TJMEX5PDnxy4KkB2t9BthLt5dFjVeN8VnR3M5OOXLOymVGMHLjU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39860400002)(396003)(376002)(2616005)(956004)(478600001)(86362001)(6486002)(31686004)(8676002)(44832011)(6666004)(5660300002)(31696002)(38100700002)(8936002)(53546011)(4744005)(16526019)(186003)(7416002)(316002)(54906003)(66946007)(2906002)(16576012)(66476007)(66556008)(26005)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QSs3OHlvN2hibUlOMDlteWFoaGtvaW5oVFVqUm1UZVZSUmVxckpZRzB2MGlF?=
 =?utf-8?B?WkZmQjI3SlNaVHpTWTJCQ2tybWRaR2FzVkhLenB1TzQ1ZnRvMHRBbDZBWE9q?=
 =?utf-8?B?bDV1K2NBalpVTjQ2TE95bzZuVTVHcm1sd0dNODVjUzJTM0pPK2Jpb2R2V1R6?=
 =?utf-8?B?MFF4SVhsenpZa3h0bFd0U3FNMTY3ZFhxb2xXUG04Ym0xZG9aTDRmcURQN0Ju?=
 =?utf-8?B?MGNJd3BCWURZc3hiZTVsNFFPSEdOc212dHhvR1ZpOFp4MVdQWkI1bHI0UFVt?=
 =?utf-8?B?Yi9RZmFZTnBIZ0VKUHJVbk93Rk5YSFdrRWdZU2lnR3Y0SFE2QTIrVUZjYUJZ?=
 =?utf-8?B?MUt6VVF4V2I2TUZRWlVnSUlvRTZwbklscTN2NnJYc1laMmdpODlIblMyQUFT?=
 =?utf-8?B?R3l5OFNyUG9QM2xucys0N2FiSUwzeWdYOW9wbDZhWFBRTjN4dVo4R1BnSjY3?=
 =?utf-8?B?eVBSSStEc1N4QXRuUkJreDFjNWlLVHYvNlVNb2xlUlMxd2tTUmx4eUxjQWxl?=
 =?utf-8?B?a2tqbXhocDJLQ3VUZjBwOUJlQkxPdENYK3EzMUZBdjJsM2lXYXQ1aVFWVGRO?=
 =?utf-8?B?WWRWSnpiTHJ5RUFMak5KUGw3ck55WlJyM3JXcWZFWnFOUnIwSmppNjFQSmc4?=
 =?utf-8?B?N2xEOXFWSGxtMDV6UkxIU2RNWVJQbUlrNStYTVJoRXo2bmJ3bk5idHZNeFJ4?=
 =?utf-8?B?elFLTXhMMkwzdGFVQktuZkNFZ1NTbk11YXV5aE5DbGlUdTZjVTQrYXlqWHc3?=
 =?utf-8?B?RFN0dUJkc0h3b1UzWGp5cGxQRkF5V3EvY0c5bmFlRnEzdDhCMEk0QVRsNmQ0?=
 =?utf-8?B?VEVCaENUaTJWQk5pSUhUQkZZUW5RbHVwN0hnVWk5ZlVWQWd2UGVYZ3dsUEM0?=
 =?utf-8?B?Z1lYM2RNOWVHbnQ0WmpNZVFCQTBiSGZvbitPWmF0QUdNaGllSVVsVXlJVzRI?=
 =?utf-8?B?dzNIYUZMWnVZdkZHWXdXbnVuRUQxNGdLTkJLV3NJakNZSVZYS2o1UWMxeHNq?=
 =?utf-8?B?QThWVTM5VU4yVVNTMVBtN1ZDREJuVFdTaUFDcTNNN0g2UjFueFdPZ2pua1o4?=
 =?utf-8?B?VFFxWDNQYkxJVGtIVGtjTlQwZndlWW5ySUMrWTEzOFZEWXovU3U5RU9qZlo3?=
 =?utf-8?B?UzVnL2xnVFRoUXFmMnJYKzJhRHpHazMvWGgvakYvci9nU1pQSnYwcFF4c2RH?=
 =?utf-8?B?UUI4YjdoYy9tVHpCdGdEVDBQby9oL3ovQ2hmRElGZml5WlY4S2JyMjNqdEJq?=
 =?utf-8?B?allJbVN4aURuaGZodkxkYklrcnZLekM0SlBsbUF0ZHIyalVyVklSL013a25E?=
 =?utf-8?B?STl2RGpES0FDQnF0aEFQWkcxTXpNcG1wVzB2cGxzYVkwbWI1Wjh6bWtWd0Nx?=
 =?utf-8?B?c1k2WGRYaXdsM0pXUjU5eWlKTDZiQUVQR29HNzFLd1ZlVW00dExFU2hGZVlt?=
 =?utf-8?B?Qy8rdGgrMmZlMkNRNHl2Qm01NmJMYmltZEZsMnRMN0djOXpLZ2VkdHhaQ0w3?=
 =?utf-8?B?aXZ5TFNLeERjWUVlRjRRdFN6cksxL0FpaTdOdE9oRXNuNm9ibHhZUGNNTFFk?=
 =?utf-8?B?MGtwN1k0M3M5S3dxTnFBYlI5OGRPRWhWNW9QUVBEdmNwRStyV3dZNFJpTUhI?=
 =?utf-8?B?dDVwaER3WlBmWGhxUTVzS2gvVUxFdEpoVElJMjZXOWlVMTFUM2pRckh6dGU2?=
 =?utf-8?B?SWQ5SlF1REFmL0xCY1Rta3BqYStWTitRSytOekY0eTZSNU04bGFUcW9jbDhB?=
 =?utf-8?Q?u0hDQz4k9Jzl7q6Wd+MGKOZ7AH9+4fScol5NbUj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec7e3d1-b17d-488f-fd04-08d935a3a47f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:32:00.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YVs+b2Nc31rMRqE2PKtH/74M4K4k0fKBthZ8m1eG3GUPyhbDbT6WoR7GkrDJjLvpoKrLDJpWNDWzXlbsmaVPIPDEkyCDRbZc7vFQYTlpow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3949
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220107
X-Proofpoint-ORIG-GUID: UXmCLfIhSmGpnCOpGGDyWcShhxKwOCv9
X-Proofpoint-GUID: UXmCLfIhSmGpnCOpGGDyWcShhxKwOCv9



On 6/22/21 5:38 AM, Zhu Lingshan wrote:

> -static int xen_is_user_mode(void)
> -{
> -	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
> +	state |= PERF_GUEST_ACTIVE;
>  
> -	if (!xenpmu_data) {
> -		pr_warn_once("%s: pmudata not initialized\n", __func__);
> -		return 0;
> +	if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_PV) {
> +		if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_USER)
> +			state |= PERF_GUEST_USER;
> +	} else {
> +		if (!!(xenpmu_data->pmu.r.regs.cpl & 3))
> +			state |= PERF_GUEST_USER;



Please drop "!!", it's not needed here. And use "else if".


With that, for Xen bits:

Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>

-boris


