Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C377E43CA3F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216917.376701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiXQ-00013s-M4; Wed, 27 Oct 2021 13:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216917.376701; Wed, 27 Oct 2021 13:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiXQ-00011K-I6; Wed, 27 Oct 2021 13:00:16 +0000
Received: by outflank-mailman (input) for mailman id 216917;
 Wed, 27 Oct 2021 13:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfiXO-00011E-7m
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:00:14 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25d17e6-3725-11ec-845e-12813bfff9fa;
 Wed, 27 Oct 2021 13:00:12 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCThjx023019; 
 Wed, 27 Oct 2021 13:00:08 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4g19r0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:00:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RCtG7p051618;
 Wed, 27 Oct 2021 12:59:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3030.oracle.com with ESMTP id 3bx4g9vmqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 12:59:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB3757.namprd10.prod.outlook.com (2603:10b6:208:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 27 Oct
 2021 12:59:49 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 12:59:49 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN7PR04CA0047.namprd04.prod.outlook.com (2603:10b6:806:120::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 27 Oct 2021 12:59:46 +0000
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
X-Inumbo-ID: d25d17e6-3725-11ec-845e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=X3TQ78hrD55J4dSEd5tXdmdstbmPGtogtES+IsQjVWg=;
 b=DPw+HS3VetPZdkGoQkZcLc1aDblZylDTW9nHAa9RdEbo1OjQosc5kVwOlzyEFSTJctCz
 j4VNm9EZE/Ot/CbvHsLQviXChS3V2jDdtB1n9XOW3U3o8DV6hhFdKpEpHTwxes9CMw1u
 Gjbifqu+fDs9IWKbfr/VE5Jgw3ifcGr6MmIm/mbkwTFNup7Of80c4Y6DD60ukSbjfEd+
 sCDar+RyB1Glrivd+NaP1MnBqAQGdo/U2rGoULhN5CulszjKFfy+hmUKxe2vWhJHXHOM
 /rilrPV9nCyfue8Qf9euGZMDuU86mY2HlOGwUfxaTaDaywWlTZ+FmdK0VbPGcIPLc8UO 1Q== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAMlYLCM0S18kpXAvMhJE5+JzLXqXwub4DhC8mtea9rNRnfxHh09WUMn0v82+J7m2Kkr5O/5q2Bd+k9QW75jz5ZyrbwTj9K0uL36B1YwbgEHicB2LO1sbKwlrPXcDsG1XrUYfNuRtoNObpZpw4I+REjG5UZEZZLhKIGoX4aDJV/v1lpbRF2Y0oHm7S3Idc7eyBvk5dxygg0cpW04OI9h6CggEvs9c5jQHonvhc3sXTwPN1B1JOGRAInUYAihgiHd582U0u8XbRRWhRJ38lBq5SBkZ9ImesMT5EkbD4ZGO6Pv/IpR2m5I4sthfja4NvZqp16mT1TmjFjzZFl+YVoREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3TQ78hrD55J4dSEd5tXdmdstbmPGtogtES+IsQjVWg=;
 b=awHgM634+LdGfkBhL4EgIT0lyOZjW+Bv3Puee6dJmHEIAr3IdzWOnFi8T6iMz4d+gDORnLu1xguGyyevOXfBlG2z6hUwDZjLfsu2Va4K4zrrEGxEJVzPMPQGceV33X8wmECRWJSKLq2VIKv/0bPTf/Bw1cKsErUdn3JMwdJsOMhI3GCe+XuDmSpH30m4AguIAnVF0m9vdKq8dMrl0DRt9/PdMf+yiWe14OIjVjNzuqeuEUaIJENi15QSNklY4sovzA93ygVshZn1297mL7nAvjDP9o1709D5ZA6p0Kln/wJRF1tmtW8sRLITHNcd6Z+RT2rw+pucXBwm5NcTnrrfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3TQ78hrD55J4dSEd5tXdmdstbmPGtogtES+IsQjVWg=;
 b=Q++DSuQ8x5nYCY3lUw16DduvgNky1+o2resN0P9w7bBxQEqyxaJT2mhLjvmz+S0c3OkyqmuNX5jfFmbU8H+4OMCuSxyEXlOMrDr14cYTzFysrpAHCagwvCpf7OvHUQKZ44gK1vbj3Ivz5oR4oPBAdC6qqPiw7FmPWFmPSfvGZZ4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
Date: Wed, 27 Oct 2021 08:59:43 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, julien@xen.org, sstabellini@kernel.org, jbeulich@suse.com,
        Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
        Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20210928073501.433559-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:806:120::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47a38ff-065f-45c7-a5ac-08d99949a8aa
X-MS-TrafficTypeDiagnostic: MN2PR10MB3757:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB37576298A904C4C08FA6DE898A859@MN2PR10MB3757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UIOkF6QwnqDI9q/OUC/xW67/EJI9i7EPPFJ23qTrCDBODcF4GkHbQJkR8FLatk+9k4mwDFlHdmt8gfGz1w/HJ+UpRKXNYgWeQThtp/mSS4dcNaQCmBL70Tl0YeTVw/owsDVxR/kkTaZaTdUXmbyxec86gV+X/3FzXBfMreHnQia9oLoTtjUxrT2aTZUlbCuXfrKb0ytEPSYha4Rnmii8J5ZrH3fhuUkdR6oYCMKOu+vKiqjLnXd8qCyC0xOk9C0bX2j5F+AICachRUz+gwUP45gmOBXTkWOHQxjafvR00CwSvne29Tae2YrjpHSrbCwpbjWc5JkthDZrOGk6cUUCHPCEY1kfWajOQOvQwAQUVZRLkToexxBgtAqOp4Of5DA7SsY1gw5d8wCiHrkx6/dvh9/sJ3SAL9uCwU4AVz/ecqQCAGbYCOjvXiDs05oDp2h4/gMh4c7P+koRXo3O0LdZoyJHYrHzVwBYyYIHpmf9YJF7BpANPSkAuD/ibjP5rJifu4weWFd4JcwWO20K4bxM9GAoqKBrGntgkZfEiuF9CkpZ8qI6rUN36gnF/feWMURVV+ftfJ5TqeXZOXtKwM2PjeJ3giBb4wfQ8i/24BnprVL+3XTQrjtinmPkY6xOPlrcLYZCo6WSf5/dzkOnF0J61Ly+nki1JVgSDIPxDA+6ZvGlUeNbPFlpWaRziVD3EWO/xu81rZqAC8mM4aPJE0q93A8TNVroCudra3H3c4E0AUQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66946007)(66556008)(66476007)(38100700002)(83380400001)(8676002)(86362001)(31696002)(956004)(2616005)(36756003)(44832011)(8936002)(5660300002)(186003)(26005)(6666004)(508600001)(53546011)(4326008)(16576012)(54906003)(316002)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zi9HMm1ROG1aRSt6ZTJCaDhpdnFIK0F1RXlvRUx2OVZ3UmllOTZ0RlRPNURY?=
 =?utf-8?B?RWpWdTVaZnZucVg0Ujl5cTNyaDIxdlVQTGZkRkM4UmFOZlR3YTRackRYanFX?=
 =?utf-8?B?NFNxN1d0ay9HeEo5TXFqOTBQZXBQVEVQTjhOeTdmVGcxZnB4Mk03OGFzdm9N?=
 =?utf-8?B?Vk9Jd3NMdGg5WDlGNzRaYXJtY2tzdyt3UjlpVTNDNG15QjRxRW95NFMrZjZ1?=
 =?utf-8?B?NTl5TWg5NGJJdHhJOXUxZ0RNZFlTL2RFNWZ0dkx6Znc0VWo1bXNkSHluUGU3?=
 =?utf-8?B?TC83N0dGSnFyKzJlaEcxKzlMVGJWU2VtZy9sVFkvZHhjN0tOR2dRNWFKUEFl?=
 =?utf-8?B?Ym1Ra0g1MnZDaW85UlBMVUFpOFBFdit6TnlCUFJmcHZ6blZmQ09nSDcrSmRT?=
 =?utf-8?B?cm5TU2x2Q0ZOdlloK2JRcEh3SEZyai82SXNUR0tGWUpxME1WTTBaTEg1eWpC?=
 =?utf-8?B?L3J5SGROVmNGQndDazZrdG5GT09USzZGTy84TFk4eVFxOXR1aGZpVDRtaWY1?=
 =?utf-8?B?Wk94NGtlUU40dlVHVE5Ka3hXWklFUG16ZnMySXgxZFBNSFZpcTE0NHdhTFFJ?=
 =?utf-8?B?S05jd0VkelpaSE4zTkd3K2o0cGJQVXZoSzNxeFJidFE0VWdVR1ZBWFcyNnY4?=
 =?utf-8?B?aGZnY0kxUFdQWTJ5U0VMWk9XR1plRUFYRjVTV2JzWldjMk5hYXJ0WjFzekIy?=
 =?utf-8?B?TEk5NUZVZUZJSk54U2krbGhFMUMwRVBHT25CTmJxdEhlSUNTNjlpUzJCRThz?=
 =?utf-8?B?cEcwblFHbWxjZWtwOHloaDBldGFmVWJmUGtQZ0h6S2RrUW9zLzgyeU93czh1?=
 =?utf-8?B?OVk2TXBBZVZjVWF2V2hmaGxFVzhrOUx6dU5CNTF6VW1OSC92M1dlL29TRWFZ?=
 =?utf-8?B?ckJ6aWdBSU43MjdQOEZ4b1JyZ0dKZmV3OXhQWUFPWkZUM09RRGdCb2NZbjYv?=
 =?utf-8?B?NFE2WjVqb0pFc0ZPQ1FQbVZkU2hRUjdBbUhiU1ExVVRuN0Fna0x5QXUra05G?=
 =?utf-8?B?TCtob0ZHSmdXaDRkYXhlelBKREkrUWppV3BLT1BKY2UvWEc5eitmWXY4YkZH?=
 =?utf-8?B?aFYvNndna2k3eW1QTHdnandPRW01WEpENnd1ZXlnVDBEZ3dOZzNLK1NwQjd3?=
 =?utf-8?B?UWZic2NHWkVhMTdyNXExRkRNNzNoZnJmRmhSeGZDMWw2cjNWbHV1bXJhM0hq?=
 =?utf-8?B?Vk5jend4Z0lZRjRQc2lyVXlic0E4V3ppdVV1azhFV2VjWkp4VTk4ZVUwNndO?=
 =?utf-8?B?eXZZd09OWW5NdHliajM2TkxnVlllRktVaGlDenMrVXJSMmliU2l3bTR3MG52?=
 =?utf-8?B?TElsTUh3WEx0WU5SRmFhdndQSVpSYXo1QUtuZFdxNFRyck9iYVlDbTRnSmRJ?=
 =?utf-8?B?dllnMUduUUFQSmhRUzVCM0ZvNytMQUJiekFWeVpQTk5HYzlaQitUMVd4YWNn?=
 =?utf-8?B?ZjF5TlVjUlBic0QvRExGazI2RnlWOUJ0NEI0b2M1ZFRZc1ZmYlp1YXlydURx?=
 =?utf-8?B?VE4renVuYmQ1N2JvMjJSS1krWGsvbUUxbmJ1bnNSV1Q4ZCsxc2h4eGhBdGVH?=
 =?utf-8?B?MEZ2RGwrSi9Cd29LOEFuSE5BTGZtL1VMS2ZLd3dQS1d2dkQ2M3E3YXozV3c3?=
 =?utf-8?B?Wm1XbFM2elhxQmZVVDdlQzZNRkVTWWFTL1l4TDFRL252eEtkVjZSVVdreUtl?=
 =?utf-8?B?L1VDWkdjMG9xbEE5SHNRbDZDWEx6bVY5Y1ViUndkZk14WjlDZVc0ekVhakgz?=
 =?utf-8?B?QW42UEtzUFBIcWdoeFBuRndHcllLQVQxTHMzL2trQVBZVHRJdlFESGEyTkFr?=
 =?utf-8?B?cVgzTFlqcEJCTDR6VjRxZGFEMjc3NVY2ckRHbWlrTkVYNHh4d0tobjhLZVdm?=
 =?utf-8?B?ck5wYnVIWG8ySnR2KzRaV2hKYzdzN2YwUCsrOURiYnY0c2w3eWpKTFlIN3hr?=
 =?utf-8?B?SWtrMytVQkhJZ3hEc1Y0Ky9tUXNnRXJEaURQYWlQSldzMjRVOURlZmhBUUhq?=
 =?utf-8?B?c1c5bUJjZHZnc0NqalViRWxDYURDOWdTTHl4YUVXY3djMm9NbCtnc25BOWRP?=
 =?utf-8?B?TnBucktubWlMNEZ6Q016Z2dGdndJMUR5a3JIdENnWkEwWStQRGNvRlR5cVVY?=
 =?utf-8?B?TE1xUEVnMjNEakpuU3hQMURkdTNLZ0tSeERsd0lSRTY2VFR0czhTak1aN2xV?=
 =?utf-8?B?Sld1S1EvQkl0L2pVem9YYXdQTE5tbS9meFozRnVSZ2dRcTlENWVLOWtYamtN?=
 =?utf-8?B?SlpUU24xaEhBUnF4V3h3OFdrT3R3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47a38ff-065f-45c7-a5ac-08d99949a8aa
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 12:59:49.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAWkgY1loPKCi7SzMG6bDlAnHCPj3BMSO4GJo6xrm/egnbQeRzCsGd3t8hle/TFdNBoM86t9Wf6+fAo8EgVyrrh/FReq+Fm2q/kZH4dDLHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3757
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270079
X-Proofpoint-ORIG-GUID: 7lkM7CfiKkEAy04K_2Em4FMfmi7OZfDI
X-Proofpoint-GUID: 7lkM7CfiKkEAy04K_2Em4FMfmi7OZfDI


On 9/28/21 3:35 AM, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
>
> Currently PCI backend implements multiple functionalities at a time,
> such as:
> 1. It is used as a database for assignable PCI devices, e.g. xl
>     pci-assignable-{add|remove|list} manipulates that list. So, whenever
>     the toolstack needs to know which PCI devices can be passed through
>     it reads that from the relevant sysfs entries of the pciback.
> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>     through a PCI device it needs to be unbound from the relevant device
>     driver and bound to pciback (strictly speaking it is not required
>     that the device is bound to pciback, but pciback is again used as a
>     database of the passed through PCI devices, so we can re-bind the
>     devices back to their original drivers when guest domain shuts down)
> 3. Device reset for the devices being passed through
> 4. Para-virtualised use-cases support
>
> The para-virtualised part of the driver is not always needed as some
> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> model for PCI device passthrough.
>
> For such use-cases make the very first step in splitting the
> xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
> drivers.
>
> For that add new configuration options CONFIG_XEN_PCI_STUB and
> CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
> functionality, e.g. no support for para-virtualised scenario.
> x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
> fully featured backend driver.
>
> Please note, that CONFIG_XEN_PCIDEV_BACKEND and CONFIG_XEN_PCIDEV_STUB
> are mutually exclusive.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Oleksandr,



Can you please rebase this on top of 5.15-rc7? There is a bunch of conflicts due to cae7d81a3730dfe08623f8c1083230c8d0987639.


Thanks.

-boris


