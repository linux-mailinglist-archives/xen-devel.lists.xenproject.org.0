Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A851300B53
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 19:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73041.131676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Hg-0006Uc-Gl; Fri, 22 Jan 2021 18:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73041.131676; Fri, 22 Jan 2021 18:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Hg-0006UD-D3; Fri, 22 Jan 2021 18:35:48 +0000
Received: by outflank-mailman (input) for mailman id 73041;
 Fri, 22 Jan 2021 18:35:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HJv=GZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l31Hf-0006U8-7s
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 18:35:47 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8df3dbd2-b356-4614-aa60-d610a09f5778;
 Fri, 22 Jan 2021 18:35:46 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIOQv4070311;
 Fri, 22 Jan 2021 18:35:43 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qn5grj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:35:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIOxTg024118;
 Fri, 22 Jan 2021 18:35:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3020.oracle.com with ESMTP id 3668r1ehgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:35:41 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 18:35:39 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 18:35:39 +0000
Received: from [10.74.97.144] (138.3.200.16) by
 DM6PR13CA0048.namprd13.prod.outlook.com (2603:10b6:5:134::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.7 via Frontend Transport; Fri, 22 Jan 2021 18:35:36 +0000
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
X-Inumbo-ID: 8df3dbd2-b356-4614-aa60-d610a09f5778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=vLdU/scUf64EG3RN5DB9R7P8AJSBv1b5W7fOfZb9PM4=;
 b=i84H11LDng09bujDr9l9il4+0R7E2zW/X+/Jh+SX3vi5qosYYxuYEGmvocuo1G6th+Bq
 KtQjqGqyFB3jWMNWjTklutB+U5id/VQXu+qjgOwHjRPUtSOUvK2g7ojQ4EaVn9C7Sek5
 TX3czp/DXU/PS7qOkJER79w/MTSBTCKXOcXfGqFt56qJwTXsb3t4/wBH7C7J+FHL4hYi
 F4xRqsKJPRGHYcx6cVPXnecc5TqpVmvDoClE/ODsUr1S1EbyeqWhyf4TYC4ZJ/RuRtFQ
 Dau/zniixu3Kh3Tk4ePC3hCc0sUgYAPesiNLeqsfNdy0he38el2Q2JTXGUX9nVCG7aPa oQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVrdkkcXERVCKEPBZwFOF5S3VqYRknSoX+KyZJuRGBc3+mqFCZt7/zJ08M+gto8wnYQkOvrPtKaki86iW9Z+ZLnaXnUI6N6MWMgxTdp/N700ExJQ5NGqjz/4T0Q+jINyTX04MNSEzIS76Ff7IX75JNWW6soRmBPiqTstMAbbEYWm8Odvx0sWAqPWUIlzsOoqEkYRP28NBHH9dthScyzs+0jHV6UBzeWIEqSxys0r8DQEbajllYO/RcAFqBdv4EWE5wY4ojByH9pRA3H6q4z0zabCqnITUZWi2iC73EfulMPl8ZH+CtvOhZg0r+gSuROz/k9VUBg9Krl2rd9cY4zT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLdU/scUf64EG3RN5DB9R7P8AJSBv1b5W7fOfZb9PM4=;
 b=RS5FS2KxXcEB5XPPLesKWc8xvnQfthG7/CdA18TyTUWhsA2RrtHET1Lx5UFoEQSnzazP9oM8iVaVlAHWeKP0qfcXvZEUTIvDmdBdgTj3F1a16z63yTwWsmtLuFv0sAO9s1FHeTztNSE5obNKZ2EbwvICLpUsLPxpolqJwN+Y6O65a3NjnRqW9XrrvSaaTaC24fprXLt5DlzZzxUIGWXWY9Ux2KTu75hN3AOn5EgqXhH/l03gwIBkD5kFuK6F+2G86E0td1IGzfUx6X5jIzcpMIafM5/9HQK7yVyhVejhXDqMok+S5awmdv+XXV2KoSYMvb2vAr8tTTvJU0fE2eppIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLdU/scUf64EG3RN5DB9R7P8AJSBv1b5W7fOfZb9PM4=;
 b=ghagvYILASfDm5eIurV3EMU5xLnbtx5j2m71C+CZlj00lzdrzqUec5FrQVA3c/AO9B0NYA82RSa80160kvbFl8WjrFzIf7SyJ7miOpZA82/QjZYNFKg1cCfot8tn1rTV/bfbijQuee9GLun4OQvyNKRDtyqcrTaboXwyAwfNckg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
 <25bedac9-6d60-7c7f-46e4-7a439e7a17e2@xen.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <613d1fcb-621a-0095-437e-862af58e9bb1@oracle.com>
Date: Fri, 22 Jan 2021 13:35:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <25bedac9-6d60-7c7f-46e4-7a439e7a17e2@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: DM6PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:5:134::25) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e5e771e-8956-4a5f-5005-08d8bf048435
X-MS-TrafficTypeDiagnostic: BY5PR10MB4227:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB422762C1C90A8C5DEF7383B58AA09@BY5PR10MB4227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IVbd94rh0iE+iaR2fVl2BeMeo0pGxGyFzE1Vn7V41h0w/7b/2yjpgHuZy1/EED4sKEO+dg5MICsrMsk8f/WV+9GivmoZG8y8LjUJx6ddBJarxoQOrTDb/+zKSa+PHt/LIsi1mUcW6DGuOXXiF4Yux4LEgNvR8bOEq2FLEAP7NcyUmGoxHiNcob6iDXLkuIX/tUVm4FJj3dBCaqysceCbtreL4kH4EYmu0CNWwhkzxdqtXV+Nu32T71NltvHsnDdDVfzk0nSuTRC/UaU8x+9KYeKV0auwPhvOs8KFg31a1rnVv+yzadg9LEdGWhFsijShAlcLFwCmkKvbhzuUs1/stoqlYDAgg0peRw/+Gm56UGhYOwe7XQC/ZklPO8doXgeoqBFQsl7E+KK139+V5ynYC8ihKAEEEvdC7drfPTdM0Msnll+cTaTbRLRYl515bzjJTkaQYvdN2X3tg0eB3oOdaMosZeuYkrDLhO4D+Ak/UV+6BFn6IZsTgb+2/Z0bc/JFYTUHWzKLRIcK9rEZwqSIJn7ujzzF1SVQKjeF6gxIdvMVGv2pFv8F3dAjyPRWxdEB4AG/nuKDoB/dHvnnX8u0OzWzl4GhE010wkPPzL2IU/M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39860400002)(83380400001)(5660300002)(16576012)(31686004)(8676002)(2906002)(86362001)(53546011)(26005)(8936002)(6666004)(31696002)(36756003)(316002)(186003)(16526019)(44832011)(956004)(4326008)(478600001)(6486002)(66476007)(7416002)(2616005)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VUFSc1BDTkpmQ291cjZwejQzVDNuaFNORldnRkd0dUNWMkdIQWpWVmoyakx4?=
 =?utf-8?B?cmU5RXhhMGJyNWVJV3g2NGpIWW9ZQVJIQ2plWVJ0RXB2WDlvWk5vYW0zTkpN?=
 =?utf-8?B?NnoybVNkQU1KbUYrclFxZXN5alFIWldQT2NrdWFNR0dsQWxZYmFmRktpWC9K?=
 =?utf-8?B?bzBPSWd5dElVdFp2bCtaeFduclE2MTFxSXVzL3JsWm1LMUY0MEJWSjRlSHlV?=
 =?utf-8?B?cGhpY3Z4V0c0ODZ4UmZUQ3U4ZG9QR2g1L2Z1Mnh4RHhzNlpiZ2J5aWJEbEZi?=
 =?utf-8?B?WGY0UzBqWmphS2t2cW1LbWFNbSsyVklQTHRVT0x4S1ZaVTlObElqaGZZQmR6?=
 =?utf-8?B?L3liWGhkdDM3b3BrYUpqV3R6NjhteFpSRVZDMHNlQWR4NndIOGx5Q3ZFdlVI?=
 =?utf-8?B?Nm9MRVFZaDF3M0J6S1FRcTFZSFdMSEhsdHpEQ2ZNRFlGTGRUeWJtN3liZEdx?=
 =?utf-8?B?aEFKNFowcklSTUlNRmtPMTV6V0VwbTBraGsxTGEvVDlnWTlLWXBsa2F6WlVN?=
 =?utf-8?B?ZW04TnZvTnRkQzVRcGt1MThKMk9aSUlrU1MvdzRicHBWUFphRVp2Ym5JMVIy?=
 =?utf-8?B?YTV3YWFvMXI4MWs4OUlmRlF5WFh5Yy9neWtsVEIzVmRMeEI5MFA3VGJmR0xv?=
 =?utf-8?B?RUtNdWNvVit3VFlKbVJvTW9GQUZrUVI4SEFlL2JGZ0hDODVuajhBNWVKcWdO?=
 =?utf-8?B?VFhISWJiSkFLY3JtanRlclNaa1pic2tTWDhWTERqdTcxYWlBVW1KcENMNDU4?=
 =?utf-8?B?dkhtUUNzSWJnL3ZaNW1lM1VuTm1MNGwxL25McHdReDY4NXZJNFhFQnJ2Rkpu?=
 =?utf-8?B?dW5ISGpVUzl2S3pqNHk5QTl1YmdYOVdVV0hQNzVFQk5ENHVkYjZqQytTRFJZ?=
 =?utf-8?B?QjVqeWt3VXE3WTl0dzRSRDQxYk1rMlA0K08xVDgxUE5NR0hWbTVReXlwYVRi?=
 =?utf-8?B?anVFcmRkUGdwclVENm1pUlloQUVhZHp6VzBUWU51OGlMM3BYWDRlUlZTSXRy?=
 =?utf-8?B?ZldpSHErTmViTW1pNVF2Ym80RFRPdnBIRW1sTXFFN21RT00wMHBUTnI0L1hW?=
 =?utf-8?B?blNFYkFNNS9iWkUrUjU1MHhpY3J2Q2RoQXJQd1g3ayt6MXh4K09jc2JrZ0Va?=
 =?utf-8?B?T3hmVFlXNzJrOVNtamhza244YnE1M3lUcmZYeEIwc0o0d0N5dHg5bGNOMUhT?=
 =?utf-8?B?UTdGbHFlUEV1bjlpaE1TZjdCQUNrYVBKSjUyckpad29xQXQ3TjhhVHRURExX?=
 =?utf-8?B?UTR2R0NTWFpTZ0Z0QWtkMWEycFV2M2djZWk1TTZybVF2K0lLbUltNTgxWEw1?=
 =?utf-8?Q?QL6+YMROdTqixQniFDHRnfeTc9TaMeZ74s?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5e771e-8956-4a5f-5005-08d8bf048435
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:35:39.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGpbkgn5bwHeVKaRBDEVLp7RB8fQvlvw8o+TadeEFWXk1usZ2wcSIAzXOwNpokZO7ln3yLmS8O05MGXlb2xU9crjUCBITXgCspjf1jouLpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220095



On 1/22/21 4:56 AM, Julien Grall wrote:
> Hi Boris,
> 
> On 20/01/2021 22:49, Boris Ostrovsky wrote:
>> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
>> index 19168572fd3e..1f2abf6679d7 100644
>> --- a/tools/libs/light/libxl_dom.c
>> +++ b/tools/libs/light/libxl_dom.c
>> @@ -383,9 +383,10 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
>>       /* Construct a CPUID policy, but only for brand new domains.  Domains
>>        * being migrated-in/restored have CPUID handled during the
>>        * static_data_done() callback. */
>> -    if (!state->restore)
>> +    if (!state->restore) {
>>           libxl__cpuid_legacy(ctx, domid, false, info);
>> -
>> +        libxl__msr_policy(ctx, domid, info);
> 
> AFAICT, this is going to break compilation of the toolst on Arm because libxl__msr_policy().

Yes, it will ;-(

> 
> However, I am a bit unsure whether we should define a stub for this on Arm. It feels to me it would be better to pass an extra boolean (restore) to libxl__arch_domain_create() and directly implement it there.


Yes. And move libxl__cpuid_legacy call there too then.


-boris

