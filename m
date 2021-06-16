Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628C3A9D45
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143251.264072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWI6-0008Nj-Q3; Wed, 16 Jun 2021 14:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143251.264072; Wed, 16 Jun 2021 14:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWI6-0008Ks-Li; Wed, 16 Jun 2021 14:13:14 +0000
Received: by outflank-mailman (input) for mailman id 143251;
 Wed, 16 Jun 2021 14:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5mW=LK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ltWI4-0008Km-Im
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:13:12 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 549fc2d7-84f2-4f9c-b5f1-c387f5bbede4;
 Wed, 16 Jun 2021 14:13:11 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GECaps016432; Wed, 16 Jun 2021 14:13:06 GMT
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39770h96h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 14:13:06 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15GED5Ev037081;
 Wed, 16 Jun 2021 14:13:05 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by userp3030.oracle.com with ESMTP id 396wanweed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 14:13:05 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5010.namprd10.prod.outlook.com (2603:10b6:208:30d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 14:13:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 14:13:02 +0000
Received: from [10.74.102.136] (160.34.88.136) by
 SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Wed, 16 Jun 2021 14:12:59 +0000
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
X-Inumbo-ID: 549fc2d7-84f2-4f9c-b5f1-c387f5bbede4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=T7vY73bDKI8WFO+pocnsgZkd5Hzn8Ef9UwS+QEQ96XI=;
 b=L3orx3mmYJhIbf79pqmBUu7jWhw4O2m3Hypxr0EZ7O1pWPYslDqvkGB59U31R2URIz7P
 4Lls7X+mnvFjdoLOyebS64piS4LrHIsvlatPszRTwZsW26pQTSV8ZDbD8u9EcKFPcaxz
 M2IBIc1FdmGyZW74sSzq2KIUkPXFTQ9gYa/ceWvU7xl5Fg5nP8mP8zxGe6u0CmzhBw5g
 XXoOVrL50DC80sYIahsXLl6yDwmJYkOjo4Qh+WY07ZUCwz1gi75q+Jkir6WYxwZL2u9R
 qT1MEW57C8eQ3YFXntlv4c6Yy4zODex1XW/qiw+h2AotOSyS/8CzdCeJfannRxARLa5U 3g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICmAjzJDhqyZfQVlnvCMP6XCHZhXO+cebuhjrZnBokz+6/+D0lIqywSqyXEKb2tlBVopKplvvgAousMeYR27ots5RQ1XQXrr/0oRfTHWOIduRYD1bgGUz6SBEvbxH1gUR490iTZx6ASnPz0sDKc/VIiG6qIWXPecPIqY/hsaKlALDgtiz1iA34T6Tyd6bvuti7up/exiSW4tf1zhpxnxEK9BQe2BUq2eBukZqq3GSstGtDbdx332aAQDR6leN9/rL/nYly7i5JghrnAVxGb7C7lHptl8njEFURttGRo5PqL6h9Fmpth66IZgEjp6qEh/j3nF0ReKJV4AanmmDPB8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7vY73bDKI8WFO+pocnsgZkd5Hzn8Ef9UwS+QEQ96XI=;
 b=Jw/xO06fEdGtF551RGlSRhzrwxnQyloFXfV3yDjXwXUvjU+kly2YGjb9Wi07a2wPiBtGDSa0gWEIFaddD12qU4cyLBpTalRJRF8YSZ3j2R3DRnO+t/M2bRAVmUXTUXTlWjHua8Nj3KO6O/Llr0jd2tKJGg3OCeSnrot23IsO1/nGtpWTZNABr4pJlOEI/z+aDfjBgRt/05SljOqrAkBJTIVfl/SLvw4vswofidP/RnlA3a3l6uzczr2RiH9pJ/LfULxjxTQAiNUBFsvBBzAQT08iGTIjtHLDi+IKT+75riv0r784s90ORZunRMZ83cx9JBQ4Jon57bVi499QSYKq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7vY73bDKI8WFO+pocnsgZkd5Hzn8Ef9UwS+QEQ96XI=;
 b=XIcmjUsypaJuzpQ5GWgStVOAwIoxnUuvUYvFNyTU89XO7oMLqUlU0UJ6qpVqWrUKkydm03kGaIak7IP4cNE/2W2ZK4RkQdyjVmJ4vZ2embwbHA6YopJztbs8MDdV2kagxrYPxbNQjDr+mZgOkLbN8c7KGbi75GTEWoRw8JMpFB4=
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable dma
 ops
To: Roman Skakun <rm.skakun@gmail.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Andrii Anisov <andrii_anisov@epam.com>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
 <20210616114205.38902-1-roman_skakun@epam.com>
 <20210616114205.38902-2-roman_skakun@epam.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
Date: Wed, 16 Jun 2021 10:12:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210616114205.38902-2-roman_skakun@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [160.34.88.136]
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa76d82e-ff93-4f88-4148-08d930d0da67
X-MS-TrafficTypeDiagnostic: BLAPR10MB5010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5010217FBC106EA9B3FC25A78A0F9@BLAPR10MB5010.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9WqY3a8BulNSroI+92f5uZf/SbIOjBy6tQJalZafuswYUfzDfGhopKg2h45D4ezJKbdtrpGZtsee0TPFaVXxlm5eo3RsQEic9UukS5kSaGrAUVdnyNgkeeBNdVs9qjFt0rmx6k/xxPNr7+1i4Q1I/O/cy5dP1jXSAcvQDkd2beSy9C0bu3r7EFeDlVcU2RENdvNaBKdyTg71fLq0ms+MFBIL7wxxvit/+3bgTTjOMuMG88zUjm80eQt5lEAnuAtala6hrFQQctDCfiMxlvB+71HzMBbzU+x8ENcOjwJn1h3hx1X3SBUBLfJx2IvpkKF6p8JRz2/JzukZrUhqr9J9vmA1czOt92ID14S+GtcAlnA8xEwyBHk+cgXIvT/PwMH9zCHhdhkjary7odRH+Bof1/1Wp4HqebauBUhz4XISaM3w2rcA+6vdwICf0GkxZg9/c3xMOS4N5llhPqGg76DuUeK9C+XJaRzWBWoWP8VLWQuzRt0qjl03UyIl3FSZwTGaj6fXGZFjmkJa2VvuXe+dXv0AYgjJG04zQwfE8QXRvUMMiigg5adDU43DnXAS/b7lD4kK7XK3AWYWAQEkzAfPBdt/P2lZwvkGKkowRXRXMQul9Ben3xmoGLxPDpDsNoum+8O4rh7QHp3OZ8RdSCMI0QfYkRqEEDC2F2ANk6HdjdOU/+rIe/kLo+tmG2Wj4dYu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(39860400002)(366004)(66476007)(66556008)(8936002)(2906002)(4326008)(44832011)(16526019)(478600001)(6666004)(83380400001)(186003)(7416002)(8676002)(38100700002)(54906003)(110136005)(5660300002)(2616005)(16576012)(26005)(31696002)(316002)(956004)(86362001)(31686004)(53546011)(6486002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clVQVTRkTUlHcERvdFFvMDUwZ3RmRDZ5c1RQQUdNNVV3dmsrUEVVRFF2dzVn?=
 =?utf-8?B?VUhvQ0I2NlIveDBCVkV5Ti9qMlFUdldkWDFaQmkrNUp3ck12NHhZTHZmUDVs?=
 =?utf-8?B?Zk02UmJqMHVkOWxiYmlOWFpGanZTZFF4ZU8rOFJuZHpTUjVOdXluczlLR0RQ?=
 =?utf-8?B?QkdKMFRQMG1rVmpJbGltOEpXNjd5TEhsU3lRZ0gxMWp3V1JjTFlBUTE0M3N6?=
 =?utf-8?B?S1ZreEQ4RUxiaWVnSFdkbEVjdTM1NU1GU3orTlVjN3ZFdEh0akJvejdNZ2dq?=
 =?utf-8?B?aDZiclZwSmpXYk9JdEgxWVk4bnMwNlRsdEVGTW1pN25kN2NJQm8rQTVJUDhF?=
 =?utf-8?B?WUtPcmVxQ3c1anJBQVRqcFFLT2V4R1lNczl4WkZHT2pkNjNjRXdyZWJiTUdm?=
 =?utf-8?B?WnNXNmFwbGd6VzRXeHJvYlU2c2NXazVLVzlTVGhBNnYwU2dhU250dFR5cmN0?=
 =?utf-8?B?QllySEpKYUJVdHE5N2NYZmVaNGkrZlRweE9MNmppaWhjdXpZNWVzQkVsRTJk?=
 =?utf-8?B?c1NLbHZLU214VU9vUkxtUE5EQnJ2VmVQOVVobHQ1T210RmxzNllEcHBHRHhG?=
 =?utf-8?B?aW9XZDk3OFNFRHdxakU3OHMzVjVETWFPTHQyNmpucTkwOHZDa3RwWDJQeE8y?=
 =?utf-8?B?NjVlb29BUkh2MW1peklQYWZ4VEpvNTRNK0l2U2srbFBtTWdCN1VuOXZwTHdB?=
 =?utf-8?B?MFBueDVTaHZsTzJ5ci9ZVnN4YXZIdGVLcEl3ZlBkNmFBSUtxRlJMaFlLaVhy?=
 =?utf-8?B?ekhBNUVKNkdYM2x4Yk8wMEdPQUhCNmhNeE1NMDdmczdVdWs1QjlNaURjaHpF?=
 =?utf-8?B?Ty9NdUZrcUVVWU1na3d2YnVhWFZ5RmMzOHpBVTdVRnkybHlSU1Nldks5Y3Iv?=
 =?utf-8?B?T1puT1RGMHhjVWdSdGRzcjVOUHRTSzR4ejZSa3JISWovZHdTN1pKUHdkbUtv?=
 =?utf-8?B?MUxsK2ZjWTVidUJvOWN4SWl2SW9rd3ZndzdNWFhzV3NmVVNpamhNTVVPWE9x?=
 =?utf-8?B?bzhVdHhLaERmV1ZEQ01obTVLUHJWMDhva2tMSHQ4VDZjYVl0SFN6eXovbG5p?=
 =?utf-8?B?eFBEVldGRlhCcnk3b0NYQit2eHJ1MjdHU2NzMUE2T2VxNmdCdDdCVTZmWXNm?=
 =?utf-8?B?SkNEL1loTGFVL3ovUHE1aU9tMGxDZDY1T1pjbHNGMzVMR1pkdFIyWjkwc1Jm?=
 =?utf-8?B?UEdQWDhIV1liNlZ3Q2ZNdXpRcWh6RnhjMkRuZ3UvVDlLQmVra1YyaW9VK2c4?=
 =?utf-8?B?dzdhWFEwOHM4VGhsS2ZjU1dSK3lJTzZSaTZqVW5kdUdEWWh5QnJLTXFXSXVM?=
 =?utf-8?B?R2w2TkViMDdIbzJrOG8xbzBaZFVVaVdaRG1SZ3F1YkFLZGFSaFArTml3aHZV?=
 =?utf-8?B?UnNmSEhpeFZnaHRhQVg3eU1YRTdGM1I5ZHBhRU9pZ3hOK2F2ZUxBdnZ2RTB3?=
 =?utf-8?B?QjNPMG5QRmdyOW9IOU5OVGs1Yk8vYkZnaDl4cHhCYkNVUDF2QndrTThxWVF0?=
 =?utf-8?B?THZmSmVVeG0xQy9EdWxoemZ2RW9aL0phRDhTeWtiNmRYVXhpb2ZaQ1BOTXNU?=
 =?utf-8?B?OE8xUEY4SndhWXd3U2tUc3B5TGsyMjQ3WlZFUHJRaGs3azZlS2J6TGYrdmFH?=
 =?utf-8?B?Rm05cEJhenFPZ3hGWStJeDhDY3NYMEYrc0V4WDY2ZWlRSEFiRVFkdkhNYmQ5?=
 =?utf-8?B?aVlzQ2RQSTRlWDl1L01sV1BpYWZ5M3h2R0V5bzltN01HZnBWR2JKbmx0RmNO?=
 =?utf-8?Q?J47h/hknymDYuAMp0nsYTfBEX2wXjP7lpNQP+zV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa76d82e-ff93-4f88-4148-08d930d0da67
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 14:13:02.6670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DUX2/d7H8Nh5WUow0Xu3IguO83SfOSSzhqDZ07uad5oABLIdAgDloOyH1RbwZbHLKcvanyfgUOQMGjwCLpE4a0/MPgz6CkPsyMEGQeeLGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5010
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10016 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160083
X-Proofpoint-GUID: 8eyhWaWUFcFNEW6BVBQAZX7jHMuNc9vm
X-Proofpoint-ORIG-GUID: 8eyhWaWUFcFNEW6BVBQAZX7jHMuNc9vm


On 6/16/21 7:42 AM, Roman Skakun wrote:
> This commit is dedicated to fix incorrect conversion from
> cpu_addr to page address in cases when we get virtual
> address which allocated through xen_swiotlb_alloc_coherent()
> and can be mapped in the vmalloc range.
> As the result, virt_to_page() cannot convert this address
> properly and return incorrect page address.
>
> Need to detect such cases and obtains the page address using
> vmalloc_to_page() instead.
>
> The reference code for mmap() and get_sgtable() was copied
> from kernel/dma/ops_helpers.c and modified to provide
> additional detections as described above.
>
> In order to simplify code there was added a new
> dma_cpu_addr_to_page() helper.
>
> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>  drivers/xen/swiotlb-xen.c | 42 +++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 90bc5fc321bc..9331a8500547 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -118,6 +118,14 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>  	return 0;
>  }
>  
> +static struct page *cpu_addr_to_page(void *cpu_addr)
> +{
> +	if (is_vmalloc_addr(cpu_addr))
> +		return vmalloc_to_page(cpu_addr);
> +	else
> +		return virt_to_page(cpu_addr);
> +}
> +
>  static int
>  xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
>  {
> @@ -337,7 +345,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>  	int order = get_order(size);
>  	phys_addr_t phys;
>  	u64 dma_mask = DMA_BIT_MASK(32);
> -	struct page *page;
> +	struct page *page = cpu_addr_to_page(vaddr);
>  
>  	if (hwdev && hwdev->coherent_dma_mask)
>  		dma_mask = hwdev->coherent_dma_mask;
> @@ -349,11 +357,6 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>  	/* Convert the size to actually allocated. */
>  	size = 1UL << (order + XEN_PAGE_SHIFT);
>  
> -	if (is_vmalloc_addr(vaddr))
> -		page = vmalloc_to_page(vaddr);
> -	else
> -		page = virt_to_page(vaddr);
> -
>  	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>  		     range_straddles_page_boundary(phys, size)) &&
>  	    TestClearPageXenRemapped(page))
> @@ -573,7 +576,23 @@ xen_swiotlb_dma_mmap(struct device *dev, struct vm_area_struct *vma,
>  		     void *cpu_addr, dma_addr_t dma_addr, size_t size,
>  		     unsigned long attrs)
>  {
> -	return dma_common_mmap(dev, vma, cpu_addr, dma_addr, size, attrs);
> +	unsigned long user_count = vma_pages(vma);
> +	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	unsigned long off = vma->vm_pgoff;
> +	struct page *page = cpu_addr_to_page(cpu_addr);
> +	int ret;
> +
> +	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> +
> +	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
> +		return ret;
> +
> +	if (off >= count || user_count > count - off)
> +		return -ENXIO;
> +
> +	return remap_pfn_range(vma, vma->vm_start,
> +			page_to_pfn(page) + vma->vm_pgoff,
> +			user_count << PAGE_SHIFT, vma->vm_page_prot);
>  }


I wonder now whether we could avoid code duplication between here and dma_common_mmap()/dma_common_get_sgtable() and use your helper there.


Christoph, would that work?  I.e. something like


diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 910ae69cae77..43411c2fa47b 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -12,7 +12,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
                 void *cpu_addr, dma_addr_t dma_addr, size_t size,
                 unsigned long attrs)
 {
-       struct page *page = virt_to_page(cpu_addr);
+       struct page *page = cpu_addr_to_page(cpu_addr);
        int ret;
 
        ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -43,7 +43,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
                return -ENXIO;
 
        return remap_pfn_range(vma, vma->vm_start,
-                       page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+                       page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm_pgoff,
                        user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
        return -ENXIO;


-boris


>  
>  /*
> @@ -585,7 +604,14 @@ xen_swiotlb_get_sgtable(struct device *dev, struct sg_table *sgt,
>  			void *cpu_addr, dma_addr_t handle, size_t size,
>  			unsigned long attrs)
>  {
> -	return dma_common_get_sgtable(dev, sgt, cpu_addr, handle, size, attrs);
> +	struct page *page = cpu_addr_to_page(cpu_addr);
> +	int ret;
> +
> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (!ret)
> +		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> +
> +	return ret;
>  }
>  
>  const struct dma_map_ops xen_swiotlb_dma_ops = {

