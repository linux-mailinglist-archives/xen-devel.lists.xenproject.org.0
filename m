Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0323E509F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 03:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165239.301993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDGYz-0008LX-T3; Tue, 10 Aug 2021 01:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165239.301993; Tue, 10 Aug 2021 01:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDGYz-0008IM-Oq; Tue, 10 Aug 2021 01:28:17 +0000
Received: by outflank-mailman (input) for mailman id 165239;
 Tue, 10 Aug 2021 01:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yq6I=NB=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mDGYx-0008IG-CO
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 01:28:15 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0707ca2-fa48-43cc-99b5-1b70e1730edc;
 Tue, 10 Aug 2021 01:28:14 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A1B4ii012493; Tue, 10 Aug 2021 01:28:09 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aaqmutr10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 01:28:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17A1A6JZ009758;
 Tue, 10 Aug 2021 01:28:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3030.oracle.com with ESMTP id 3a9f9vygxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 01:28:08 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4063.namprd10.prod.outlook.com (2603:10b6:208:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 01:28:06 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c%6]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 01:28:06 +0000
Received: from [10.74.102.132] (160.34.88.132) by
 SA9PR10CA0003.namprd10.prod.outlook.com (2603:10b6:806:a7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 01:28:04 +0000
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
X-Inumbo-ID: d0707ca2-fa48-43cc-99b5-1b70e1730edc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=msdWJQy84fO/fVz0Rj6Q/Ua7qi0sN5TdRrBYd/lzob0=;
 b=TeWcVmXyWxPkxWe+5GaNP1p/QYlOvlPt1D0SfWzFuM8rhQxXt+111he625Qouwj1wJUk
 gEKMRqHPwzIJvsND4k13cA0TJOtSuLiy8r5mgqhju9QtET9jsCeNavwd4OqeJ9sMn1f+
 G+e5bKA7I8zK6yAuvx3U4/8ZNV1RdRvdVsP24up7bAki1CpLDuhvq9zZFvcX/RV4mAtq
 xsSsbzdPRjBZb1AYmkwg2RwKL83vRXBxXpJPtpdG1hLHO08wXUfoLFi1jKTWtyECMWn1
 B/j7lWI+9mcIJMgU5d+4Eqav4a51zseSef2tvuUER8A2eXLounEknTBA8zQQbpw4KrJI Ng== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=msdWJQy84fO/fVz0Rj6Q/Ua7qi0sN5TdRrBYd/lzob0=;
 b=SRKk+DMiw5stXZaoKwPokj/Va2YiCpYhXH10EaaDlUBaKBPcRNAu7Td7CqQ7s9EIYyFL
 gPanNphJYs5adBFot1Bu76UzDONanHHhrsw04Z31Q12u4qvO9p7Dv8SwrF5oJRkO8YMp
 sqV0VGL3kwAwJMs+dFVG2iQ3MIfz3d7xGH7HrUO6396RgnHOQD5+BmcxhVtNPVNRkEGx
 JthyXv6FMoAOcSDAg/YusLpVKmxwG90SV6+fDMStKoU6f7WLtsK9DPN0+EAa3pIdmxNA
 iBxYiKyTQZ878v4tKJOpNNj/VNaFgU0d0FxGzNifCzrqPmpNqLYElD8pn5uiQLnLfrD2 sA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJrPAKLI0WDW+GA4kOH6fLsqqGYtvGJpwc1YFu7+YmANiK36p2Sj8CJp/swgjOZEA626azierLAKoagsDNPYsTmITNGfPxoBymaAdI2Jl449b9ZJ+dKe9PVtPyMr9u2fp8d/7aua1Sch5gdbzLPqft5hUNI9oJhcBxTIuCFj/29IKtIBC17+m68se0dcA5xAZAJc8hoMTsAlY1mwG24I36FldnCCF485szM1PYyQg3TbPqmH8ER//pIqrVZRDaj7ru23q2UVp5gEey8mCLAvnOoTRFof1zdo7A/gkFpWehK0vBQXJGtnrKkMKV1FsdDxYZJLW+5qJxQO3yH81PDuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msdWJQy84fO/fVz0Rj6Q/Ua7qi0sN5TdRrBYd/lzob0=;
 b=b6Gr9RhZ4vDyZF0Eg8n6AwHaJKDiPxrBovdqoWac2KlZxWg6x3ba8XnJxlTMvErTrZnzf/tKqqm8W/pcqoIur1bjQcvE4QRnuDnBsT5ZoTA12C98G4R7woqnRTIYBw4UzIkKUuuCM8crGWQfD69D8pNzDDWr7nv0670MimD1IR0s8nUoLDLh8vVQERNoujblgt9UnMUCXPTRKIo3Dd4/O5CizC3zq/7zdSjs0jdwnzFBbGL787TLz1hZKkpQz8IlEsMMO5sQE52QZxGlyl7CdvHA9tyuHHxn3Iwtiqb3L3aNbY6G200jrzZAeCq8IMRziej7HGqt1hvAk0GBVFtXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msdWJQy84fO/fVz0Rj6Q/Ua7qi0sN5TdRrBYd/lzob0=;
 b=0CiM45ZremUGJzGT0kvVSA/SmHC7OBfCVNx9qsw1JgmTYJIxPstYiRx+m/tgB8WAGH9327/E1WGEitzV7gsPevWiYImGHXAujFKSn4aR0AGp+MI0dDi4Fh/EzZu4ya23PsE3x5/mXHPtxhs1pU9qHChTcAHOpFtA1fSUBJDA4yQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen-blkfront: Remove redundant assignment to variable err
To: Colin King <colin.king@canonical.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210806110601.11386-1-colin.king@canonical.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <539ef292-ccad-dcfe-e2f8-6116e8d94b48@oracle.com>
Date: Mon, 9 Aug 2021 21:28:02 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <20210806110601.11386-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:806:a7::8) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8db24a4-b0a2-4756-68ec-08d95b9e1a93
X-MS-TrafficTypeDiagnostic: MN2PR10MB4063:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB40637C9730B1B72232BBC3A88AF79@MN2PR10MB4063.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JLpsINUUZurS/ybSu1ZJwcSeAnOoF2zSyaB087Jaz4xNM9XA1J9TQ3EowePwiMkr2MnNpaR7Lk07L39rwIPO14xZAtFfSd4NPk9cV0TWgKwD1x5lbL/bIGCsY9IgO/JVuQyklQleEsy3IaEfOR1wMSsGbMgMfld02kFGiVaYhGmdylqJn9kpgz7dtSUx9W5T3QHFYtfx1uwn2GUDDqDQki2p+8jgpJhgRymPCr+oPEPtnF5wvN6g3qiO27xxG/hdykeaB8duidJHKxfnkb+Ch6y5Kd+Wzo3dZJKRk2tpLBU3TnUBDkiJkTOxnSjebYWc6n+uu46Tv4diT9BTbbE877M3+Rw8nltPPQWXB9jatGrCzdoktsxAKTc1j9hrpfglEu14Fu2gV24nKhFGxAYQdpmWO8ZwTRlmh5bq+yVcHrRodlJE8/VpkHXu8eC/zvZihrRVjjwT0zcdI571tXLsJ6PsI9O2WGcTrYfd2/LMom8Bv2wVC+AJvK3I4D6YQT4u/mWXXRgMA2G5GKIwMEcmL+YM3YA+DiRXpeSMUm8g98Xosobc4CLPymqEI/ZFAgcLOfolYzGokWgzeX287189uGEI9KUnOatrymTR9hjQ0lcy4qVCaVVR846spnqQ/KuGAZogIhJKbJYh1dtz979nlVTTbfL9yH8cerco61t+jNW0JIb5X5VSpA9iRVaBOOhDs87HvNs91pl7pQSoJ3tV4M5GgoH/0/2vkD6pcOWIPLU9OKeaCUF6BVM9Lqnda6Jc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(5660300002)(66556008)(66946007)(31686004)(66476007)(44832011)(53546011)(956004)(4744005)(4326008)(6486002)(38100700002)(2616005)(110136005)(86362001)(26005)(31696002)(8936002)(36756003)(8676002)(186003)(16576012)(2906002)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?My9FbStGMjNram1vVEpVZmV0S3ZHeXJHNG9pWERrVHV5UVdFd2lTYmI5TTU1?=
 =?utf-8?B?ckw2S1RPYU1USnlOUlJVaWhwUjlyQUhydDBqZU5JRGVSQURhMlNHSkg5Ujlq?=
 =?utf-8?B?QVhsNDd5RFkxYVhwQUViNFhJd3MyMEk4ckN4QUlUZUtzaHo2SFZWc05aT1dl?=
 =?utf-8?B?a1RlR3R3Rm9PUFdwL00xYVJJTnJuTU9oRmgrck9acFlXZ0VJaHlCYmthTjgw?=
 =?utf-8?B?T0ZKMlhyU1lnd2ZHQWtzR0NXZzZzTmFMZndhUTljY25FWnNob1hmOHZSMmNO?=
 =?utf-8?B?djNZL3REZ2o2eG5RSk1EYzBqZEREeEZORkJEZW5CcDRaeXJyUHRoRFJ1cnlt?=
 =?utf-8?B?OU9aOUUyVHExUm9DVWZZL2NUcHRZb3pPMEkrdG5xRUxubm9mbElUVks4THFh?=
 =?utf-8?B?N090d0JwRkdPTlFyWmxaQlk2QVF4QmhlMDM0THhndG1OOFlUMHhVTS9ZRHY3?=
 =?utf-8?B?U2dxeFU1MzNVd2lyT1c0dmZ5czc3YmFDTmZiM3FiWW9yMHY3RjBQTUY0cGlL?=
 =?utf-8?B?bnNkY2tSOTVKMjhMRDdmT0E4UDkvZHc0RWlmOXM4TWVwL3AyNWxvNm9VZzVG?=
 =?utf-8?B?WHk5M3J1THBjeHh0NGV4TitnZkcxdmNIZ0R5T3F1alV5SDB1Zk1qOU9XV1RI?=
 =?utf-8?B?WkVIUFE5aEIzcnV6YmNuM0FqS3RSUzBxSnNEeURVdDNGTWdBNGI3S3FkeTVS?=
 =?utf-8?B?TUovaUVWSEZrcUhQZnZBVkYrT3NDWXJqdUkrM1hoSDVTUGZycTd2SWtsdUZH?=
 =?utf-8?B?Q2dQTE1lWHFVckhVVE9pREN0QUI0ZzJITm5YMGVXWEhvYWk0WnZtaTRURk95?=
 =?utf-8?B?azFqY1dkcTU2LzcvaGFCcmFyR2hxM21zekp6dm1GaUo4eDZzUnJOd1RiZG1J?=
 =?utf-8?B?L0hPN0JCMDhYc1V4MDJHV05zT1IvR2RIVHMvcWlyV1pSZWtBbUluM2FQN3RF?=
 =?utf-8?B?S1FwLzdtOFJLT05FMyszNmNGY0ZnR0Zxby83WXBza284ZVpLV2NHV1Bwd3JE?=
 =?utf-8?B?Vk1abjBpQ1UzNzQwc3dRZENHUXoxV1ZhQ2lyQkJvKzNNc1FCb2dhT3R5clJx?=
 =?utf-8?B?K3pCVDJsWDZoazlORm0rdG1vazFxVG9HdnFVME5Ya2hFS1hIUXJ6MUJVMUZD?=
 =?utf-8?B?K3dzL2xHaTVJWCtTTVV0TmlFQTh6akxUc1VtMEh0NjlOMlpET29kbmRXWGtB?=
 =?utf-8?B?alFkMHQ0bFZ4YUZKMVRtTitCeE5vQmc1QmhnYmpvcTNqakY3TWpiY1h2N3h3?=
 =?utf-8?B?azRVREJMN2dST0V3SHYwb1FDQjNrU1d1aEMwTVVsRmxVZjgzNytxZHR4dC9C?=
 =?utf-8?B?VFF6RDRITGZpWlVheVM1NDVhcXZ0TkpvaGF0Nk5wRzNZRnJzSnQrcWZJZ2Zm?=
 =?utf-8?B?U2VIRGN3TFE1dFE4eFloOEM5dzdpakZYbitMRGRLR2lPY0VpWkZDNytTWDdy?=
 =?utf-8?B?ZWEwSTBhanB6RkNUa2xhUDV2NzZmYVMzZFhwT1RVOHVRa2hycURWaGZlTzFl?=
 =?utf-8?B?UEFxTXhsajM1NHFEeGN2Vk9MeU4rQSt0K3RWYkV3TW9pUGJwMlJFbkV0dVNM?=
 =?utf-8?B?b09TQU5PYmF5ejNySnlkeWYyWVFscTEycndmeHI3VG1aQmIycWFOQk05U3hT?=
 =?utf-8?B?NW85cm56TVI2YXdPb28wR0VNenlsYUpvUjdjTy9tcWVUMVphblQwTTNPcDYy?=
 =?utf-8?B?VDFaYzlpVSs4bEJTY2RuL3VEb2tmYWVPOWVXQjFzUElBQjJTMStZWkFOczV1?=
 =?utf-8?Q?9MqkI9/sBG8Au4HS1vnpiXHp5AIuxeZQnoExJ1b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8db24a4-b0a2-4756-68ec-08d95b9e1a93
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 01:28:05.9758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGFTDWwNf1G9HRxztSFBsp4Z92JBS+1Z1y42HHXMBqEgXMtcww6Mp/YZHKZpCcIPRwYM88MKQZ2vXhzTJfn6zUx0A4qM0lSxNq7+ZIWW8ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4063
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100006
X-Proofpoint-GUID: 0aVv8rDdHhR0LXZcW5AdLT7mNCXp-pp6
X-Proofpoint-ORIG-GUID: 0aVv8rDdHhR0LXZcW5AdLT7mNCXp-pp6


On 8/6/21 7:06 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable err is being assigned a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


