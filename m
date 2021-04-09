Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED835A836
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 23:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107964.206314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUyGE-0005SZ-JG; Fri, 09 Apr 2021 21:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107964.206314; Fri, 09 Apr 2021 21:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUyGE-0005SA-Fb; Fri, 09 Apr 2021 21:01:50 +0000
Received: by outflank-mailman (input) for mailman id 107964;
 Fri, 09 Apr 2021 21:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7vn=JG=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1lUyGD-0005S5-5B
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 21:01:49 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a3e4cdf-2d46-4454-bc93-0543cc396387;
 Fri, 09 Apr 2021 21:01:47 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139L0cqM186862;
 Fri, 9 Apr 2021 21:01:46 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 37rvagjr31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:01:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139L1S1S032944;
 Fri, 9 Apr 2021 21:01:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 37rvb720hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:01:45 +0000
Received: from SJ0PR10MB4605.namprd10.prod.outlook.com (2603:10b6:a03:2d9::24)
 by SJ0PR10MB4575.namprd10.prod.outlook.com (2603:10b6:a03:2da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 21:01:43 +0000
Received: from SJ0PR10MB4605.namprd10.prod.outlook.com
 ([fe80::a021:790:7ce6:6f16]) by SJ0PR10MB4605.namprd10.prod.outlook.com
 ([fe80::a021:790:7ce6:6f16%6]) with mapi id 15.20.4020.021; Fri, 9 Apr 2021
 21:01:43 +0000
Received: from [192.168.0.108] (70.36.60.91) by
 CO2PR18CA0055.namprd18.prod.outlook.com (2603:10b6:104:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Fri, 9 Apr 2021 21:01:41 +0000
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
X-Inumbo-ID: 3a3e4cdf-2d46-4454-bc93-0543cc396387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qyBgzCKl607gL22dRsS+TP0bUPGsXo35p1F7OMhd5wE=;
 b=wQEtrWNRgDNhHKdjbD6zhHKdbsDy9k116VpSh7HqcCZfziA7yorYAumHgRgNJu+0aubb
 Wth3jVZ8soS7BU+200NaBQS8h6f5dYAxOqBBAzHuGAbTkRnp+tqY8UjasIChGm9vGbr/
 RP5CyR7Fqcfj0XlwNN9RT1GR2W6qgV0Io7CTS2/J26mowZDReGEZTG9HRKsMN1ANU44b
 71mB4NWn2i/7z3+rGPsx7ObmvexUU6LW4bZOKsQh1iVRIVDlgDmFaQDkMo5leMu2tahW
 Yhzpe6Goui0d+ahvPnw4R5ceWS0aCHxxN6ItfYP6DOg/jJFXI49/F0Ge4bq9tRg8qlvi UA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQL4Ok6YmdhEDVqwDTXfsUUf4Kf3bWLLQDFc4Xd59sAQqQt7AZgxBvKO6oD7EEPRAzwVTkGS1f0CV3Jze1DngCCV4H4YphQcWTTsJiRQDzeJrASkNK+wzz3nQDtI/AsGQV96VsUW5zDuIdpTUtbYFlJnXVp1EjmtXxDWsfNNY6U88aOgsQcvtgl9GFlNVyO4cNFz+hqMh9VsiQ2lL+HWEc3VsiQF7RM2OPA+VU/mtXSQl/1OUmg6QJ5E939eCqqS9mKfS1ZGGRVt3+EmAD8+J7syR7miyoVh/WRtK+XWugsbk+BEZtoTVEtE/qsnZuzhuTqIqQAn9O23zq7niHWD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyBgzCKl607gL22dRsS+TP0bUPGsXo35p1F7OMhd5wE=;
 b=SbtbYlnjxc8fI6PG83WTVUxdkB/ewv2MCTN5F4bLdTZQ+1FSOar0zrzxzzOqdIjLyOI9Smm61r5DFU/s16ZnGskkSwBX+F7d4kjP3O4mrp8sVrmkb/BTHkSCJmBmJTXy62aGKJaLDGABjLXVyw6lw7eRZEijaB/RHnSdHJ4OdhqUitsGOJuB9qYf5oeCnBGfalbeBqxFOOJKmHCuuHZweVTmRcUX1Ti52hufgjURIOonhgqJbNRoNCV85uBMpvTqSItXHbrcYgPSlBVlf5eoPgboFb9gdwdPCycaRs+JsvQfcDowae9bnMBeopM/x77LjHWVZdPoT/EFS7wyRl+T+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyBgzCKl607gL22dRsS+TP0bUPGsXo35p1F7OMhd5wE=;
 b=YrM1hIxL3i3kBnnHvLb6+2ejM1a+yyVGKTOHvQB8HiMbsPEshIKGMDWVg6C8kiB8dzDjjj3+2XTuwB8U7F5O8QHzhAtq7lN4tmrjda0gBiEbNJZlky99PVhAOA9FEhMCLMIkuAC5cX1iUxYXK0tWe0/NH5K9bUMq4BiaOOYUWpU=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: x86: memset() / clear_page() / page scrubbing
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
        xen-devel@lists.xenproject.org
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
 <20210409060845.3503745-1-ankur.a.arora@oracle.com>
 <4d8202b3-ffe8-c4e7-e477-d8e7dc294c33@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <df955d0c-b78f-641b-41f6-ed52f9e45cb7@oracle.com>
Date: Fri, 9 Apr 2021 14:01:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <4d8202b3-ffe8-c4e7-e477-d8e7dc294c33@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [70.36.60.91]
X-ClientProxiedBy: CO2PR18CA0055.namprd18.prod.outlook.com
 (2603:10b6:104:2::23) To SJ0PR10MB4605.namprd10.prod.outlook.com
 (2603:10b6:a03:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3069a5b-071d-40e1-47bd-08d8fb9aadd8
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4575:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4575617D064A4B87B545AF01CE739@SJ0PR10MB4575.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EafBJJJRlxeV0dR6WWXODk+CVj7i9ib++RRP5o2/toQveGMdJoiGGEmrR3ZV450ZU2LHNl84bJnhEf2+Xqh/GMvQbpGXBMuDEeQriuhzPeYaf/GZUEgxZFFzkkXjPc1P6TRALOt6T9NbUCqznmuMg3S61gEgV2mDxvWgvkR6RJkU/OzPc4ov3TFb1V5D3iISW2PuhmUmBsihaSth6BNwL93A1IBvOiEC2gj82rJuAbefL1JelZhTSMMEz8GCtX0WrXtQChzhGFAUAiA6TcVgzrvcH5gc4Lyv/8KbkIlHhjrj1q1uAbdOKoB389sO0ApV1TJ6dLZAhxh48VK1x3QHbuBllZc77pJLOLfh/25cXndFtzNWar11GuvV19Da2wIAUKgkd62fi+fC+P8ePZxnhZ8S1qivzl4K6AVQtGvU5FfS5MGvR4535G1RPLSKKudU7lm5Gdj1aHpYjj+johD8bqM9Otibc6oiVss1tjHObEi+TJe5/pUPsFdtPIc9PBxe0zIJfy0JNqGkVJig+DaeoR49mEOMcyVPyKnIXP2cB9l8A9PpfJ0eUZwmfjCApa79QCpIFtqn53cW6lX6hRRcKSFO3xNqJOBCVdE3IqxVPNhmvVkyHFVi1z+je9Sg0D+ZWm3iAhOgpLd+kY5xhmZP9MH8LaXXOfohECk90zEw+m/r8gJMIS7qj5tOSHDgSGYcZgrs+2pSu7JIqvK7zHPeMw0XD5q4WxEiLV4fKCNXikc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4605.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39860400002)(6666004)(186003)(5660300002)(66946007)(16526019)(83380400001)(26005)(16576012)(2906002)(6486002)(316002)(6916009)(478600001)(36756003)(86362001)(31686004)(8676002)(31696002)(956004)(2616005)(66556008)(66476007)(4326008)(8936002)(53546011)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S3VwcldETFRhZ0ljWlY4ZlIrMk91eFJBYnE5TUF5VmhtUndkcHE1Z0R1UzhK?=
 =?utf-8?B?bzZ2TE4zMm9wcG11S0djZllqV25YbFlBTzAyZVRDbVZyTDV6dTlYUWV3OE04?=
 =?utf-8?B?cDBNTTROWUNQSGNJMDRyZGtHYzJTbzdYK2g2TzkvaE1TeWZIWlRUU0V0TlNa?=
 =?utf-8?B?S2thbVA3bG1zekJQcTlzL2hzQyt3b2ZQbXlJZWtTcCtBRm9vaUVUZDFURVJ2?=
 =?utf-8?B?clZJbzFMR0owZy80eUViL3VOVkV0QjI5YUJtRUY3ZEk3L1h3Y0VHQmRqd283?=
 =?utf-8?B?K1N1VkpORjlXTTJaVnFUc0NkbE1RYkFibzJDYzF6c1d0Q0lpUFVvUzF1bHdZ?=
 =?utf-8?B?eHgrUW5OMkg5Qmt2NFZUWEQ2a0IvMStOenZYSHlISVIzNkJhaGljRjBJUDI5?=
 =?utf-8?B?aDRUdFVSU1JhM2JUVkFsRFhhZXRWL2g2cVNHZ1pFcHVHdk03eEpyQmpPZ1Ex?=
 =?utf-8?B?aWRBOXc2cEJSVnlaWFBLcUFCS0ZVZG9Bb2t1UitNT2ozWGhhYzhnTVVDWGg1?=
 =?utf-8?B?Q2p3OEdOTnlJYnpWdlp0ZGtZbkpUR0ZQWUxsMndKcEM0TlR2UlFOSzB5MXBK?=
 =?utf-8?B?bW5PR0JJSTJFZVFMcnJIb3FITVRRVzN3VU9HVjNJeWQvakI3WSttbENuQXpx?=
 =?utf-8?B?L2xWL25FYkl5YkJzRExpdFZkKy8wMDJlNlc3UzF0dkxmVS9rUjlQTGFOMEg2?=
 =?utf-8?B?aXVsaUZ0N3g3di9ORGVObXFVRWJUMW41OHpBNDloZGoraEM2VExITU9KdXRp?=
 =?utf-8?B?V3N5RkpxanpHT2dOWldHY2V4NnUvYW43eXY5d2NiN2tLaHVvZ0VjeFRzcE9H?=
 =?utf-8?B?WmJ3SGxJWnFTZ2tFK0xReHNvVVFUZzdqUkxoVDBmSllZc2tSWUpmbUdUQXdo?=
 =?utf-8?B?QzV1aGxoOUU2OXNGdWxVR2liVE9LZ2JFUzJOc1RQWjAxS1loM3FSd1B4Y1R3?=
 =?utf-8?B?VUNsNFcwZUNYZVhrN3pGb1JGaU9IS0tId3J6bSt1SzZ3dHVlMHY0VG9wUU1V?=
 =?utf-8?B?RGdRMUI5YWd0a2tDNkdFVVNCRzBkUHVSZVAwaUpoQkcyYjlaYmxZS2dZdUxD?=
 =?utf-8?B?MFZOc1FQV1daZm55T1AwTjNmcjNUTmxnMHB4V0RVYXY4SC9Mc0c2NHdERDh1?=
 =?utf-8?B?VThBMFc0WDl4U3NRL2NpNTd2YnJ6M2JwMm50YnBCS1R2VWcvQWVKZ0dZNTlO?=
 =?utf-8?B?VDdQM0RtaWU5VHdNVVE1NnRzMEtJeWNXTmZrNHlYV3VPV3k0SW51TDZtZzV1?=
 =?utf-8?B?UGxXNExCNHN0NnJZSkJMV3JNalZYc2ZVK2dzcUVlZzhCRmhnQmNXT25Wc2Rt?=
 =?utf-8?B?SWF0ejZvRE5jYmhyUGZSNGhZdjBBWDc1OEc1eXNsSTN5K21ETlRvNTZiZWZ4?=
 =?utf-8?B?M0J5VSszaWI5UnVKUU5Ibkk4RlNZeHMzRzMyVFZkbGdoL1ZoUWtPR2RWZHhI?=
 =?utf-8?B?dmxwcGpJcVdsZ3ZKZ3ZuQWZZbGRoaitKRC9yQi8zZGdCVEVsMFdhR2RBZDBv?=
 =?utf-8?B?Z3JMSWtoMzdYblZ6R2dITWRGZ0xVSkgxMXI4R1FIQllXNkJVS0FKcGRUa1A1?=
 =?utf-8?B?UW45ekd6UCtSZXRKNWM4SGZ1aDhGcWRSTzNJMVNMcnpXQml2aC90ZnhpZjFW?=
 =?utf-8?B?QTVVWTlpYmhSM1NCOTNoaFFzM3BlOHNYNkgreGlGOUwzQU9ZcTZnNi8vZzE4?=
 =?utf-8?B?WXdoWVlvdHhIQnp6Y24rb3c1a2NLemEwZ3c1VjEySGloMDFaNTQ3YmNqN2FC?=
 =?utf-8?Q?JPi+njjBNVwjzsg/duuqzMgLShTs3YqvdpR65nY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3069a5b-071d-40e1-47bd-08d8fb9aadd8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4605.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 21:01:43.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKD6Qn4etwCCmleE1+r8VZFwX7niI+2p64JOT8tjLxhCEXuhU81OI6HbyGIczFlxjHDRRcD28Ks1zJ+ZFXKyRSXy4ZInfQF2vttgPmqgfN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4575
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090154
X-Proofpoint-GUID: Qupuq02DkBenjELPQ7fGiN-wEUoyiCjA
X-Proofpoint-ORIG-GUID: Qupuq02DkBenjELPQ7fGiN-wEUoyiCjA
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090154

On 2021-04-08 11:38 p.m., Jan Beulich wrote:
> On 09.04.2021 08:08, Ankur Arora wrote:
>> I'm working on somewhat related optimizations on Linux (clear_page(),
>> going in the opposite direction, from REP STOSB to MOVNT) and have
>> some comments/questions below.
> 
> Interesting.
> 
>> On 4/8/2021 6:58 AM, Jan Beulich wrote:
>>> All,
>>>
>>> since over the years we've been repeatedly talking of changing the
>>> implementation of these fundamental functions, I've taken some time
>>> to do some measurements (just for possible clear_page() alternatives
>>> to keep things manageable). I'm not sure I want to spend as much time
>>> subsequently on memcpy() / copy_page() (or more, because there are
>>> yet more combinations of arguments to consider), so for the moment I
>>> think the route we're going to pick here is going to more or less
>>> also apply to those.
>>>
>>> The present copy_page() is the way it is because of the desire to
>>> avoid disturbing the cache. The effect of REP STOS on the L1 cache
>>> (compared to the present use of MOVNTI) is more or less noticable on
>>> all hardware, and at least on Intel hardware more noticable when the
>>> cache starts out clean. For L2 the results are more mixed when
>>> comparing cache-clean and cache-filled cases, but the difference
>>> between MOVNTI and REP STOS remains or (at least on Zen2 and older
>>> Intel hardware) becomes more prominent.
>>
>> Could you give me any pointers on the cache-effects on this? This
>> obviously makes sense but I couldn't come up with any benchmarks
>> which would show this in a straight-forward fashion.
> 
> No benchmarks in that sense, but a local debugging patch measuring
> things before bringing up APs, to have a reasonably predictable
> environment. I have attached it for your reference.

Thanks, that does look like a pretty good predictable test.
(Btw, there might be an oversight in the clear_page_clzero() logic.
I believe that also needs an sfence.)

Just curious: you had commented out the local irq disable/enable clauses.
Is that because you decided that it the code ran at an early enough
point that they were not required or some other reason?

> 
>>> Otoh REP STOS, as was to be expected, in most cases has meaningfully
>>> lower latency than MOVNTI.
>>>
>>> Because I was curious I also included AVX (32-byte stores), AVX512
>>> (64-byte stores), and AMD's CLZERO in my testing. While AVX is a
>>> clear win except on the vendors' first generations implementing it
>>> (but I've left out any playing with CR0.TS, which is what I expect
>>> would take this out as an option), AVX512 isn't on Skylake (perhaps
>>> newer hardware does better). CLZERO has slightly higher impact on
>>> L1 than MOVNTI, but lower than REP STOS.
>>
>> Could you elaborate on what kind of difference in L1 impact you are
>> talking about? Evacuation of cachelines?
> 
> Replacement of ones, yes. As you may see from that patch, I prefill
> the cache, do the clearing, and then measure how much longer the
> same operation takes that was used for prefilling. If the clearing
> left the cache completely alone (or if the hw prefetcher was really
> good), there would be no difference.

Yeah, that does sound like a good way to get an idea of how much the
clear_page_x() does perturb the cache.

> 
>>> Its latency is between
>>> both when the caches are warm, and better than both when the caches
>>> are cold.
>>>
>>> Therefore I think that we want to distinguish page clearing (where
>>> we care about latency) from (background) page scrubbing (where I
>>> think the goal ought to be to avoid disturbing the caches). That
>>> would make it
>>> - REP STOS{L,Q} for clear_page() (perhaps also to be used for
>>>    synchronous scrubbing),
>>> - MOVNTI for scrub_page() (when done from idle context), unless
>>>    CLZERO is available.
>>> Whether in addition we should take into consideration activity of
>>> other (logical) CPUs sharing caches I don't know - this feels like
>>> it could get complex pretty quickly.
>>
>> The one other case might be for ~L3 (or larger) regions. In my tests,
>> MOVNT/CLZERO is almost always better (the one exception being Skylake)
>> wrt both cache and latency for larger extents.
> 
> Good to know - will keep this in mind.
> 
>> In the particular cases I was looking at (mmap+MAP_POPULATE and
>> page-fault path), that makes the choice of always using MOVNT/CLZERO
>> easy for GB pages, but fuzzier for 2MB pages.
>>
>> Not sure if the large-page case is interesting for you though.
> 
> Well, we never fill large pages in one go, yet the scrubbing may
> touch many individual pages in close succession. But for the
> (background) scrubbing my recommendation is to use MOVNT/CLZERO
> anyway, irrespective of volume. While upon large page allocations
> we may also end up scrubbing many pages in close succession, I'm
> not sure that's worth optimizing for - we at least hope for the
> pages to have got scrubbed in the background before they get
> re-used. Plus we don't (currently) know up front how many of them
> may still need scrubbing; this isn't difficult to at least
> estimate, but may require yet another loop over the constituent
> pages.

Agreed MOVNT/CLZERO do seem ideally suited for background scrubbing.
Alas, AFAICS Linux currently only does foreground cleaning. The
only reason for I can think of for that "decision" is maybe that
there one trusted user with a significant footprint -- the page
cache -- where pages can be allocate without needing to clear.

That said, given that background scrubbing is a fairly cheap way of
time-shifting work to idle without negatively affecting the cache
it does make sense to move towards it for at least a subset of pages.

The only potential negative could be higher power consumption
because idle is spending less time in C-states. That said, that
also seems like a wash given that this only shifts when we do
the clearing.
Would you have any intuition on, if the power consumption of
the non-temporal primitives is meaningfully different from
REP STOS and friends?

Ankur

> 
> Jan
> 

