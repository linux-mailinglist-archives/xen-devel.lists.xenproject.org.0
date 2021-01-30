Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4F3091F6
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 06:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78724.143389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5iVr-0001TL-K3; Sat, 30 Jan 2021 05:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78724.143389; Sat, 30 Jan 2021 05:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5iVr-0001Sy-Gd; Sat, 30 Jan 2021 05:09:35 +0000
Received: by outflank-mailman (input) for mailman id 78724;
 Sat, 30 Jan 2021 05:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0cu=HB=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1l5iVq-0001St-NQ
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 05:09:34 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c33a2532-4aea-470e-8456-74ff2ff6ab5a;
 Sat, 30 Jan 2021 05:09:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10U541bA090325;
 Sat, 30 Jan 2021 05:09:29 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36cxvqr480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Jan 2021 05:09:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10U55vfY129217;
 Sat, 30 Jan 2021 05:09:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 by userp3020.oracle.com with ESMTP id 36cxsgbkm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Jan 2021 05:09:28 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3762.namprd10.prod.outlook.com (2603:10b6:a03:1b6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Sat, 30 Jan
 2021 05:09:24 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1%5]) with mapi id 15.20.3784.019; Sat, 30 Jan 2021
 05:09:24 +0000
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 CH2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:610:4f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Sat, 30 Jan 2021 05:09:22 +0000
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
X-Inumbo-ID: c33a2532-4aea-470e-8456-74ff2ff6ab5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BJBqaoZujhsO7wt5eW6gLp885+C9RiZiWsP5dpymY/M=;
 b=Y8D6txB3MQ1xJNGUePNG9tgmFmmmjlXRB+73ni360OQU8dsIyNTmb8rBHh/oBWnf6lbY
 B9gRRRPlJUjiReLzgFHV8tCjNyCSnqhoyHTnm2EmuQ2Z05JOxIQ243FfknVXnNJKk4R7
 KwyqvZ0sLSSg4wG4cA3ZhCS2TvY8C22WAataCDMup6JnD/DIi3R3DZZo6tIunJ4hzSat
 EX2Hc8bL4bAOXrWUjB3rqppJYzasXvzuhZSIOl1W1U403+LwlR4wHJk1pIET8onEfQNP
 TAESpx5c6SAcFp3euMFj9a836xAbbrr1VX7wrykoLJqBOrmB2MC1gnSM/iPybLCeHdA+ eQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDXckQv6cuqCc4dNFiZD8MOzKTwUrDrOlVGBZeci6q67b+P5zMqeQqhjCF73XTgFrwFF7Rj8W+I9UQDm8sVM/xv1anha8dccla66xp8Sdroc+dxrMyocM2oGK8jCXmCWlx/SP+bCDQ7xskva3X4Q/l5S2LxPqLooQQ4Y5nfoLHea/8AAvUAEKaAYMkzOrX27sKZsE1jHZYXt3m1sce/vkx6t2hZQhRYaJezcsiHq8l2dSADiz0/wl21ckFNTO5Y3mQW39AKoHNQklAiGsii5XRrK+nbZNuGlquKrqG9CiXnN+Jxpv4zof9Fof0rwTzdbZVnDrTdf5OrwO/RYav7sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJBqaoZujhsO7wt5eW6gLp885+C9RiZiWsP5dpymY/M=;
 b=Wg/fsUUHRVOyQevJMzllSIhF8wJndsomXMF8q9aV+Gh+OQBAR9dJmYRuZoBBAGc+9eAEvoZ3reSzzjkRRMqhFu7H/xSRJq7JgLPZYMiZgkfMKMCjP9kuMaPxtuX89iCr2IqNTQmb61S0BqR0MzKge4q4PkTHBIVPQnz2y7Jv3hLmRFeFS7fXgVUlrUgI+kzprmCg04XUQrMUSxI4PbknaOQg9LU9SNXFMvqIhcVEnp54MMOqDLUGanN1StqeNsPnAluwWSw6iQqZCrNTMvlfUZ7+7H7bh9zjmGNstAL1o15pKNm+mB65Rvs6+ftqY/T3nBIl+ge84i7ge9novtnJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJBqaoZujhsO7wt5eW6gLp885+C9RiZiWsP5dpymY/M=;
 b=MoUjsUPXDbpLwaeSLyAgI31rLe3SBEbFwZpYVUmRysBTl06ME0mAhlfEHUcXfCShl3odx91Gt8uFr0yft4FNkXdYzxphu6oJq9fel7Xi8nIHYWd0ZTVEHcSB0BVaVMaReE78DKyUGVcfRgDVamO0jcGxZb0bg7pOMs9IcPwcg0Y=
Authentication-Results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page
 rings
To: paul@xen.org, =?UTF-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>,
        xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
        'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
        =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
        'Jens Axboe' <axboe@kernel.dk>
References: <20210128130441.11744-1-paul@xen.org>
 <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>
 <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com>
 <02d901d6f616$b0004750$1000d5f0$@xen.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <c10b539b-0f86-ac60-d289-4e3b7ded25fb@oracle.com>
Date: Fri, 29 Jan 2021 21:09:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <02d901d6f616$b0004750$1000d5f0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: CH2PR18CA0006.namprd18.prod.outlook.com
 (2603:10b6:610:4f::16) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60737acc-f949-435e-d722-08d8c4dd3595
X-MS-TrafficTypeDiagnostic: BY5PR10MB3762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3762214C3B0F9CA109CB265FF0B89@BY5PR10MB3762.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vU+ALDiC4tPga7ImetAY9Z4fW2XxA/aBLJ0zrJUzox2Ifv3KV6Kj9opjQmLndXNGoAbynlyoTaYg6KHnCH8ApqlUaMGf6gYaoOP8DKpdwlE9IcvYnIQa2RhRE6jAZMMb8IlJ936aW8IC3NP8C+FBwI6gT32w/MqVEASU580s5XphCU7XKHaf6MViAe/l7YbhDKtzJ0JnW08gJ+ZfsbV1Z5oGnyL2GmgaH52ADUJc0Mi5JGoMHMZEDlSMkuhXxR26jxIFm+mYzYtfdNMGvn4NtvgkJHjqxEgGlGJRUwibUrbvvmeqTmm6OL/N1wv/ooBclqfTBb/rofGavCprVMyiY5QKIbzkxlYZhCHRbp8uzYiG4exc/rC+JXiAq09X8USoLTWKkuG2sgAE7Z7wdbRQnOSeLhYfGtD6Oox9jOOZ/+H16yc+r2WjzjlaX4SCbc7Xvtgk0/pJdxecJf1tmVnJ7XI7zbLa8WNZnMs6hYXzzrf/QwnG6P0rfsYk9E0Vq07RyrcWF89bZMZmNPfYyAclt3c/IJkYSbw4CoRzBBeO8zEIQu1nQ1i6bGtS19r/OKXmTKaCZYoGmRVHylWJEZCmvYWJmfJ2tYap0TNwIxtuSSs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39860400002)(396003)(376002)(8676002)(54906003)(6666004)(66556008)(186003)(6486002)(16526019)(86362001)(36756003)(316002)(4326008)(44832011)(5660300002)(66946007)(83380400001)(478600001)(31696002)(31686004)(66574015)(8936002)(53546011)(66476007)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Qk5vRG5wQmRvek1peUFmdTV5amUzNFlSb2dSM3VYb1NDUjZsczJlckhqUWZp?=
 =?utf-8?B?a3A3VVV1OHYvOXhZejNITUlGQzlaMXUxQW03K0VWeWtnY0lCZ2VRaDZvbitk?=
 =?utf-8?B?ZWNtNk1id2c5aGdad0hYU0g3NXBLbDVVZ05ZelpORzN6bXZldXRSeFJQOStK?=
 =?utf-8?B?amJjVkJPbFdkbUlkdzZXYXY3MGNxakV1eFFqTU9lUUtUSVNRbXNjWnYyMkV3?=
 =?utf-8?B?T2c3ZmJpRDdVWlY4KzhXRHYxcXlJdGRqbmQ0YmgzNzZ2TVJGQ3ZwVlpnOG8w?=
 =?utf-8?B?MGZVelVQTE5HZkZ6c1BpV3Zya1J1SllqVTRKM2ZwZ3lpcUlxdVpGUWxoa0dj?=
 =?utf-8?B?TjA3cFd3WFlMaStNbytDRVZsa0J6QjJZUVYwSmtvdjFCNGtNTTQ0V1N0Y3hw?=
 =?utf-8?B?elRIa0NuRnVRSFgvQTIxczNTOFJpZGJqMzA1blU2dWcvNThnd1pFL1ZUUVBx?=
 =?utf-8?B?UG1vMnJYQ3UvUWNrMG5raXJZN3ZidTY4UENLM1dTODlnZksxMms1emJ5amYr?=
 =?utf-8?B?ZkNtSmJxcjk1bGhPdG01VWtwdVFCQ0VNbDREZFpnUStwcFhuWWxpSENaOVFZ?=
 =?utf-8?B?K05vNUVkdXVmaW1Jc1VJamFNWk5GeEViSE1nU0RXMVY3LzlST0phaWdkcmE1?=
 =?utf-8?B?ejMyZFJraTRnS3hnaXFidHQ2emtua095RTlsK2Uwb0ppQitlOFpxMk4vMk05?=
 =?utf-8?B?SkdQNExqdGFMa1NST3hwaTNmZUIweXluU1lUWkYxTkxpTGRZaGw4SS9sSFo2?=
 =?utf-8?B?RzJhR2hoRHZSSWZteGhjODJDTzBQOVZlVXgwS3Nyc2s3b3J2eTlkZngvL2d2?=
 =?utf-8?B?MUlRcTZ1Y21pMGl6U2NCaVpob0FtYXZ6ZmtReitIL3g2THlmSTljU1U3bm1s?=
 =?utf-8?B?alJ3NDViS2NXaTB1ZEJZTjIvTnNrUnlkRk16eTV4U2EvWFZrd3p0dzdORFVR?=
 =?utf-8?B?cUhYdDhpY1oyQnBaUm44WHdrd1hCeGZxbER2RTNlbnJXZ0QzTytzRDR0Y2Zu?=
 =?utf-8?B?cTkzejFiaVFiVG4rUzVpeTI2WnBsdlFmdi82cDRrU2hoeFlZTktEekdxVGhy?=
 =?utf-8?B?K0ZlcGlwRExtWTVDOGt5NlIwMVByN1owd2xOTnpsZWNrdm9zZ21xRGNNeHA2?=
 =?utf-8?B?UnR0elNTMHFVZi96UEpsRERvUzhlOWlFUHhDVmtPR2JhLzVvTDFUVTd0S2ly?=
 =?utf-8?B?UHRueTI1d0d2bWZrdHN1UmEwL3V1K01ObmNJbnpoekNmcDNDcG4xem4yWXVw?=
 =?utf-8?B?UkpydWdvbDlVcXd4eFRYUHp3elJ3LzFXUHUyL3NET0xiaDgzNjEwRHhhZVk4?=
 =?utf-8?B?Z1Bzd3d2Q2g0Nm45aDFNUkdnUXFsNmYxZ3Rka1dCV0tNMmt4SnZkdTI1d2k3?=
 =?utf-8?B?VjI2V2tXSmU3Q3A5bUU4ZGtpZzJnUjFOYUdacGtJN0ptRmkwUXVZZ3oxZkFx?=
 =?utf-8?B?cmYzTDFYZ1pZUXVSUUVKbUM1SEFpN0ttTTZWMGZ3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60737acc-f949-435e-d722-08d8c4dd3595
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 05:09:24.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8lrLqHwwfRkKUWSYGT7hu6cjzfCz3ffUNbY4PTWFSNGTAGBEUkejXdAtvfzsYB2/PQY6U2QVs32oLdrzlDrFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3762
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9879 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101300025
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9879 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101300025



On 1/29/21 12:13 AM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 29 January 2021 07:35
>> To: Dongli Zhang <dongli.zhang@oracle.com>; Paul Durrant <paul@xen.org>; xen-
>> devel@lists.xenproject.org; linux-block@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>
>> Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page rings
>>
>> On 29.01.21 07:20, Dongli Zhang wrote:
>>>
>>>
>>> On 1/28/21 5:04 AM, Paul Durrant wrote:
>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>
>>>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
>>>> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
>>>> behaviour of xen-blkback when connecting to a frontend was:
>>>>
>>>> - read 'ring-page-order'
>>>> - if not present then expect a single page ring specified by 'ring-ref'
>>>> - else expect a ring specified by 'ring-refX' where X is between 0 and
>>>>    1 << ring-page-order
>>>>
>>>> This was correct behaviour, but was broken by the afforementioned commit to
>>>> become:
>>>>
>>>> - read 'ring-page-order'
>>>> - if not present then expect a single page ring (i.e. ring-page-order = 0)
>>>> - expect a ring specified by 'ring-refX' where X is between 0 and
>>>>    1 << ring-page-order
>>>> - if that didn't work then see if there's a single page ring specified by
>>>>    'ring-ref'
>>>>
>>>> This incorrect behaviour works most of the time but fails when a frontend
>>>> that sets 'ring-page-order' is unloaded and replaced by one that does not
>>>> because, instead of reading 'ring-ref', xen-blkback will read the stale
>>>> 'ring-ref0' left around by the previous frontend will try to map the wrong
>>>> grant reference.
>>>>
>>>> This patch restores the original behaviour.
>>>>
>>>> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid inconsistent xenstore 'ring-page-
>> order' set by malicious blkfront")
>>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>>> ---
>>>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>>> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
>>>> Cc: Jens Axboe <axboe@kernel.dk>
>>>> Cc: Dongli Zhang <dongli.zhang@oracle.com>
>>>>
>>>> v2:
>>>>   - Remove now-spurious error path special-case when nr_grefs == 1
>>>> ---
>>>>   drivers/block/xen-blkback/common.h |  1 +
>>>>   drivers/block/xen-blkback/xenbus.c | 38 +++++++++++++-----------------
>>>>   2 files changed, 17 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
>>>> index b0c71d3a81a0..524a79f10de6 100644
>>>> --- a/drivers/block/xen-blkback/common.h
>>>> +++ b/drivers/block/xen-blkback/common.h
>>>> @@ -313,6 +313,7 @@ struct xen_blkif {
>>>>
>>>>   	struct work_struct	free_work;
>>>>   	unsigned int 		nr_ring_pages;
>>>> +	bool                    multi_ref;
>>>
>>> Is it really necessary to introduce 'multi_ref' here or we may just re-use
>>> 'nr_ring_pages'?
>>>
>>> According to blkfront code, 'ring-page-order' is set only when it is not zero,
>>> that is, only when (info->nr_ring_pages > 1).
>>
> 
> That's how it is *supposed* to be. Windows certainly behaves that way too.
> 
>> Did you look into all other OS's (Windows, OpenBSD, FreebSD, NetBSD,
>> Solaris, Netware, other proprietary systems) implementations to verify
>> that claim?
>>
>> I don't think so. So better safe than sorry.
>>
> 
> Indeed. It was unfortunate that the commit to blkif.h documenting multi-page (829f2a9c6dfae) was not crystal clear and (possibly as a consequence) blkback was implemented to read ring-ref0 rather than ring-ref if ring-page-order was present and 0. Hence the only safe thing to do is to restore that behaviour.
> 

Thank you very much for the explanation!

Reviewed-by: Dongli Zhang <dongli.zhang@oracle.com>

Dongli ZHang

