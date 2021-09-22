Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF54414B3A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192790.343423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2kG-000894-SZ; Wed, 22 Sep 2021 13:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192790.343423; Wed, 22 Sep 2021 13:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2kG-00085j-PV; Wed, 22 Sep 2021 13:57:08 +0000
Received: by outflank-mailman (input) for mailman id 192790;
 Wed, 22 Sep 2021 13:57:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Psju=OM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mT2kF-00085d-I2
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:57:07 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c9e79f4-6cfb-46c2-8240-fef039a99a7e;
 Wed, 22 Sep 2021 13:57:05 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MDapWu010075; 
 Wed, 22 Sep 2021 13:57:03 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b7q4pbu5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 13:57:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18MDtaqM126907;
 Wed, 22 Sep 2021 13:56:59 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
 by userp3030.oracle.com with ESMTP id 3b7q5n07gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 13:56:59 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4109.namprd10.prod.outlook.com (2603:10b6:208:11c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 13:56:57 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:56:57 +0000
Received: from [10.74.114.106] (138.3.201.42) by
 SJ0PR05CA0195.namprd05.prod.outlook.com (2603:10b6:a03:330::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Wed, 22 Sep 2021 13:56:56 +0000
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
X-Inumbo-ID: 2c9e79f4-6cfb-46c2-8240-fef039a99a7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zhxTcPI7rWwl4C7tspU9gg/f3idfnYkP5xBPg20EQqo=;
 b=RL3VKgJVtoWw8nZl1vhUOzJESK+psG7xTRd4ABKxXnUoCp6vKAEOH78PvMKzeCK7iv8M
 3vs9opwP9OZ9Fl3k7AMqk1f8/12O1ut/wYY/gqQzXhBvEUsHkbFo2guY1CVJIRDcPGmp
 NCfOO/OOmWQNS7Y8o/lGKyLdAhCuw1hhq3R+sBqYkQ6wevAJayNTQ0bwXIQzUkCSnGr6
 CWHDym0mupfhy6TqSyhNF5ZgVnYD6iLU53SnC90JSI367QlBF9kdHaQG0TOOoJ1uXbuI
 08kYmggiU9XygLUYnnYbKLXPe8A4XuVDDBztnixcjmrwIRbN0px3cfN7Zq5eI9p6zxiU BQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRKiGgoqEdwvGVd2BNVNylRTzfy7dPF14q9Vcak/EKcjiBkfoGpyEIMuo6Svve1q4r+87us9bq9jXvTTtJ7doDf5Ir95XxMNA9OFvCjNMqaqYo8Hi10UebS5bKYcW6ahcBoyRcwog5mrLSg9i+yJEcdz/6KGv3DxfE9Vf42/aeh+epvz+0qnn+c3gpoAfA21yHt7tnRGY9/krqPPA8pYAyHTAvhzCQyfMiScaiS0hAxxf8x+ZFKVD0CAH8rVRqjQI3t/3X9pRLpc/oVi39HAB3ZaxCV1IPkoCSjbE43pjBq7TzwrI6K4QhxRPR3nOGDAnavwXN4KbPrfrQaJUK5LoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zhxTcPI7rWwl4C7tspU9gg/f3idfnYkP5xBPg20EQqo=;
 b=J3Y8eaDvOs18hD3QkcM+iQ2W2a0nEAwMM+KhYFZXAzu/UWhx2xWDDsiklZZVDZVzhU3mZpBGDxOvx0WQvs32dC0Q6mYrcDmzpHMCJr0Vs9weMDyXejJ3AcBJ1DgdomUQ0+SuD7MTmrpMOqVBkPcqd+0uCJjuqKndmag1aGUoEIwgetVigej8aRlm3s4aAiAaUSomelX0EkUE6oxbI/sMYsn840XVjjgZzRVlbGEIkfaPdDaroFoxAfxQnXiykWSS+P6WT8t7r2YhGScc3aK7qhRoMzwdyR51+pHHYjytEMNM3qScbSt6O+Ybz8Gb/N9g6kTPSOireds93i3IjED9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhxTcPI7rWwl4C7tspU9gg/f3idfnYkP5xBPg20EQqo=;
 b=V0GXo6/VCa05/s9ozdFvcund1BXpHgjP5rc8aea29Ld4gIaz2re4qLZNS1ScSGqsUJK2FgrweX7zEfR1pDCtZ017xLieve2ehdOprnWM5Rii77PntgWPo5+SDqIpmMG06YDfSBLJal3RGsOLwj9tgE90xbhmIolIMLuyjm/6ld4=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/3] xen/privcmd: fix error handling in mmap-resource
 processing
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        lkml <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <aa6d6a67-6889-338a-a910-51e889f792d5@suse.com>
 <c0c84258-c2ee-f58c-ae9a-5f8bdd75f0db@oracle.com>
 <1374b8da-1076-63fb-bc54-5be9f1ae94d4@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <ccf710f1-3c2f-880c-fa89-64fabe852527@oracle.com>
Date: Wed, 22 Sep 2021 09:56:53 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <1374b8da-1076-63fb-bc54-5be9f1ae94d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6b2368-65e3-4b2c-2fcc-08d97dd0d7cb
X-MS-TrafficTypeDiagnostic: MN2PR10MB4109:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB410992A8D36074047B80AD418AA29@MN2PR10MB4109.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yzkc66fbwES21RmkZ3XhFphm7sk61c36ArIFpns4JNm7Rr/K4jtrA66CvXl4tXsuGYPE+41bWmouQWgj8E52gpL9WCyj7EhOBPqSJJDCt4neL8xuzRmmPQYtIfo6TIRPN/Y9MID5ycFJqC5qC3NDVmHSdZHyoKyOsi6h5loojZ0NKThK0JToW1KriAZxjAvWcQ7GX5WC+1xnI40Za7Sl/XwPHNfsROKCqZAcnVqiuuoVgnGlqHjlZlKp09d9qPz4gS8Lk1q8n5UkqgchbkWjfV5VgDfxrRNCCWqdt3oBP7mr7JJ+BHL0UAqs0O1wtR/6xguTXGGemry4smiLv1ZDGFYChhBvreIM8f5+/ikrELz5+PkvZBfLZ7PJfuptfhAKyU1+3QNtFG8ak00p+Gp17sKaokffPK7wr0kBjdy1jAJJK4vVQt4kFV30kL2hlROAShyu+SfkFvlUIVmcjBKRtF3mCwZwegUE0o7yYTG3vwt8livuhjiwjmIWxyrhDyznUttNF4WEiu0qELSo3Z5FlJwlhBHBPfpzsJ5ETF9Ar+x6BMQuXgmR88lvcPunoPsG+SYvt/hMPhAfksEWZyizIXRl1+9q/k9HiNPvdu9E/135bT1qmXNLmfYXZ1lj3TEOmhv9Sfe0DYPINl2iBV1GdGc/B5bhg/9iaWS/5cTrE45dEnSIcawXupMeGUrGTKwg54wO5AbC8eHEeHuB7t8aW4Zy+Z4UOcLSrIP9zibU66PTKuhBlnyvYuTzAEeeiE1q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66946007)(31696002)(83380400001)(66476007)(8676002)(508600001)(86362001)(956004)(66556008)(31686004)(2906002)(6916009)(16576012)(4326008)(6666004)(316002)(186003)(36756003)(8936002)(54906003)(26005)(6486002)(53546011)(44832011)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1VOT01ySklBWTlKbDZKaTZsTkhObjFTakVmV05YRTlWY2FqSGw1ZTRyeTZ4?=
 =?utf-8?B?OFgzeEZ4azZUM0kzV2lUSFREVGJ3clFMN3dtTmZjWTBvNjU2djgrTjlKREc4?=
 =?utf-8?B?cUE4eXR2SlN6WUI4L2lBN2MyenJvNUVtV1RSdmRudk5seUoweTdPcXk1TjFj?=
 =?utf-8?B?c0Y4aHV1QWFqYVJqN3ZwR3A4dTUzWHpycVY2cDlUSkpJY2U1amt6TjVjSnNP?=
 =?utf-8?B?ckZJSDliQVFlTlliaXdtU2V5WExvOXpPK0E5Qkd5aDFTN1hKZEVrYlNSNWJn?=
 =?utf-8?B?eXNPeEtQWXJFdUpMbm5GL2ZkMzNVS2xVV3NKUXJWanowaEt0emJyczJwZVVw?=
 =?utf-8?B?L1duTDI5c0lmMysyUnlVYkh3VlYxYTFUNWtWam9LcnRjaTh4Nk4vekQ4ZHZv?=
 =?utf-8?B?c2ZKZms1NFB0L0w2WGRQeUcrSCtvSEoyQzZmd1hic091ZWpUMmg5S0RCaTNQ?=
 =?utf-8?B?bHJmbm00NWFSN1RVWFpBeFRIRlZPOFB5bk1kTWUxYkc5V1JaV3A1b29zOFJw?=
 =?utf-8?B?Y3lzNGNHZ1NrcTJNSCtidTdJSWc4Y3B1dUljM3FPYzgyZXhpdFZ1TTgvM2kv?=
 =?utf-8?B?Sk04aXd1SVA3MTRXTUdlQ1dvK0s1ejlyTEdMaE9EUG5IaU9ienVIakwxUW4w?=
 =?utf-8?B?NWo3Q1NLaVJTK2d1aVJGcjVFVEZkbDhMUW9HM0ZkbHY3ZVFqZVlaQ05zNUJ4?=
 =?utf-8?B?eDRQSCtNUVVDc3ZzcEFxdWFjc08xRm81RjRHNVlsaTNZVDN6eGt5OUc0OGc3?=
 =?utf-8?B?UlRnNFdvYzJHU0RXUHJUREVjV3lIUTN3QkJBNkxzRzB4OXVpZzkxTGdzL3pv?=
 =?utf-8?B?TzZuODdTVVdjaG1HUmNJNWd6N2hUazdjRzBTSUJlamFodlE3bFFFcmlCZFR6?=
 =?utf-8?B?ak5VNTQ0N01OcWkxb0xLNDBkbkpLeVdwREU1ZUNzTlV4MWxibExneWVrNVh0?=
 =?utf-8?B?bm9WcWo5MHljUjVZZTdHVWc3Q3lTaXNCVzRrNVMrcVk0a045OXZQZDlzNkk3?=
 =?utf-8?B?MEl3K1BGNEhUWWVKVjRSc3JPVlIzUkxkUTEzZE1WcFVsOGRTeFFlVWk0dyt5?=
 =?utf-8?B?MkZqREYyUm9wMFV1V2dOaUxsT0JWRVBUMnRmaW95ZmNwRG1TVVg3WTVzWFF4?=
 =?utf-8?B?RDZIdkxkMGxyWDh5TTVzV3FzeGo3YUlBMVZpVnRLTytRU2pTYTE2cjRLc1Ux?=
 =?utf-8?B?MWtObE9HQ3BqZ3NvQnlUbU9LbEJiZDliNHlnKzJ2a3JNRFBDWTFlcnN5SUZP?=
 =?utf-8?B?TVU1RVVEcytCTDZlV3VpN0dHcnA5YnRiRnEzdXpXMHp3Y3orcGpJTG9mYVYv?=
 =?utf-8?B?T3Q2MFIxWGo0UkJkLzhpbjdtNWVtVXNFK05zNTIrZXJaWWV2VHBnUXRNaUQ0?=
 =?utf-8?B?K0ZhM2Y5YXd5NG5Fcm1ya1A0T01EbHZ1bzlhMThkVWs3alVzejYyWWJrZGtX?=
 =?utf-8?B?dk5CSU5KZUZ5MTFQYnl3cFA0VEc0TlU2MmIrWnFPcEx6OU9rSXppQmdQUDNF?=
 =?utf-8?B?THBKRVk1SVVoS3A2SlZzSjhIaTM2cHhqOEFiOHVzU01QaU5QeWZVemRQcDlQ?=
 =?utf-8?B?bkJkeVpKcldYVUV4d3JrSXdocUFHdFlKYWF2eE5zS3RLQXRwMTRMTTQ0R1Ey?=
 =?utf-8?B?V201N2RMVjNxMTVmeHhBWTJhVG5kV0twdjhHSlN5ZTRBSGprMFZDRm52T3c5?=
 =?utf-8?B?YW11QlM0eDZnNHRadnpEL1dUcXZsKzh5dElYQjFTUDhlTWNpY3BQZWIzUk43?=
 =?utf-8?Q?Ip+vuNVCU+4G3SWAChuLr0QOw18JHessWC+crAn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6b2368-65e3-4b2c-2fcc-08d97dd0d7cb
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:56:57.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adL9GHjmxFK8opL1cf68tCzx5vX3IF2TAjQDLeWSM3zkt5e+R2FV6p2OjI1FchAzgqZXyAI5A96Y5eGQq+H5PMuvxzhzBtsiUGfmegMAhpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4109
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10114 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220100
X-Proofpoint-ORIG-GUID: 4gUOny7eEi5k4lSyVMf7k2yU2bhGGkBU
X-Proofpoint-GUID: 4gUOny7eEi5k4lSyVMf7k2yU2bhGGkBU


On 9/22/21 9:39 AM, Jan Beulich wrote:
> On 22.09.2021 15:29, Boris Ostrovsky wrote:
>> On 9/22/21 6:17 AM, Jan Beulich wrote:
>>> @@ -817,7 +818,7 @@ static long privcmd_ioctl_mmap_resource(
>>>  			unsigned int i;
>>>  
>>>  			for (i = 0; i < num; i++) {
>>> -				rc = pfns[i];
>>> +				rc = errs[i];
>>>  				if (rc < 0)
>>>  					break;
>>
>> Can the assignment be moved inside the 'if' statement?
> I wouldn't mind, albeit it's not the purpose of this change. Plus
> generally, when I do such elsewhere, I'm frequently told to better
> leave things as separate statements. IOW I'm a little surprised by
> the request.


Sure, can be done as a separate patch.


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


>
>> I am also not sure I understand why we need error array at all. Don't we always look at the first error only? In fact, AFAICS this is the only place where we look at the value.
> Well, to look at the first error we need to scan the array to find
> one. Indeed we bail from here in once we've found a slot which has
> failed.
>
> I guess what you're trying to say is that there's room for
> improvement. In which case I might agree, but would want to point
> out that doing so would mean removing flexibility from the
> underlying function(s) (which may or may not be fine depending on
> what existing and future requirements there are).


We haven't needed this for a while and IMO existing code, with overloading the meaning of the pfn array, is rather confusing, unnecessarily complicated and error-prone (thus your patch).


>  And that would
> be for another day, if at all.


True.


