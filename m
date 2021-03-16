Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0233DB46
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 18:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98437.186747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDlR-0003dY-P0; Tue, 16 Mar 2021 17:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98437.186747; Tue, 16 Mar 2021 17:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDlR-0003d9-Ld; Tue, 16 Mar 2021 17:45:53 +0000
Received: by outflank-mailman (input) for mailman id 98437;
 Tue, 16 Mar 2021 17:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LdR=IO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lMDlP-0003d4-I0
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 17:45:51 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c7ab7e7-f53c-474c-b779-2907a01faf20;
 Tue, 16 Mar 2021 17:45:49 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GHdpmA165634;
 Tue, 16 Mar 2021 17:45:47 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 378jwbh7tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 17:45:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GHjjl2188302;
 Tue, 16 Mar 2021 17:45:47 GMT
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2051.outbound.protection.outlook.com [104.47.44.51])
 by aserp3020.oracle.com with ESMTP id 3797a1h1tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 17:45:46 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4414.namprd10.prod.outlook.com (2603:10b6:a03:2d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:45:43 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 17:45:43 +0000
Received: from [192.168.1.195] (73.249.50.119) by
 BY5PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 16 Mar 2021 17:45:42 +0000
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
X-Inumbo-ID: 4c7ab7e7-f53c-474c-b779-2907a01faf20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kcpvcCoIM0xxonXgBrVXpFNy89LYrWOFkQnLx/8LnYY=;
 b=mFiLTGQwCfC90A0sYrKhP+Ji0Zxaxosz8Ak5XIovzYwOj9fnCYKJ5pADbzK5e0trhwIx
 KzgH3wbeC0Sh6ErO1mCX7aunheMQagFk/WxYVU/Vp5c3dypv4YITN7zWdxhcsaeVtwk8
 3KNENqIesLeW2uuBZ9wVFHioF/lksPzCb+HWigFpF3uincN9b0EBCeC1GDuzPJlvs2lm
 Rvph53V7bafvN8roOCksXnIC3I9S6VKb8iHkYqDY1ptJFGmvcY4F+yE8mSFJu9K7sz58
 OGy80WZ5vuH1xdV9nThRuXk2dc+gw2uOha8C6M9uFo/HrJfIM6UhkXzictWwIHkJPCI6 Dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld5zoZrI/3qZRp9VTkWngQxfmtVOMgTqsttXAyGgLPyfX/0+znnA++fq9t50REEGotvXr/5mwSysQTeS6TqRT/A+SYfyED3Da9Yaz0HQkJx3o2YAa7wpgddzsnw9RZ5/MGyJFRtAoSBBeR+qg9HJmAZnYE4SFTXfr7q+TokP2ZaQ5fSENO0C4Jle+nqg8nG8L9B/cxS3Yg60y6si76vS4Qq2n5RNf2JT5M5ZVF3Eerotqt97Qup7+qiewi2MpoBn0E53lulr9YN+smjg1cMpb7GldqPq2fDf+gMbUN4pkYN4mU2NRyQ4Z76AI8oYXXwE6VmPJlNBuYT5T8uTvHa8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcpvcCoIM0xxonXgBrVXpFNy89LYrWOFkQnLx/8LnYY=;
 b=FEQjg5vRj6Ny9ex8DQeFdfW2Uqe52sI6St9Dpc8xqEjqMWC3dUyvtM/RasqeI3QQadVtZ6rwhpgielVIZF2QvaFaa6KavduIis6DP5Hvxuetb655F0Kwt6C4DgIcOc53KY8XChJiUGIVtZmmw9osSMCd4tXwC64CRrJWEfFBnwgevTCV02Sysr4t6Kp/kYr4IK7ICni0RcqCI6TNRA9H9Oun+ISywo1aIdNARlJNbn2bQahZ6W1Ec82keWICHF/QLya/ljgWAy4ZmqdAF7ycDWmrRZd5V5r8/uQN5Wn9WZCdq+EJrv7xdvWvyMaUJFE5cbPntrguFE320103mHYi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcpvcCoIM0xxonXgBrVXpFNy89LYrWOFkQnLx/8LnYY=;
 b=D9ZOtlW+T8TCCbJaTSwgmmwbWvKqpstU0haxiWFgMwFjNrfP3KVHekebfxgXS4ajs8Zrj0iYqrNi6CRQ/mJgF4r7JKO06DOScVhSk9apG+9Vxvi4dhiY+fjPHxqvOl4oU7kpUo2k9orqFw3frHkhtg7m1qRH4YkNr5CwU1GPJYw=
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
        Ian Jackson <iwj@xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
 <YFDjUSz/whe9Jrqp@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <ab4c93d6-ec09-11e4-5a10-2b75173061be@oracle.com>
Date: Tue, 16 Mar 2021 13:45:40 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <YFDjUSz/whe9Jrqp@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [73.249.50.119]
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae24770-f2f2-4234-0420-08d8e8a35251
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4414:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4414EDAE33D3DB40D33321C78A6B9@SJ0PR10MB4414.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EmGCu8fxM/seEEEUdNlZi5A9guPCR74NTJHuEqmYG1DVjWgaIuq1l3f8Lf9vlBdYhkPVt/qRONmeoiTpUR7pgSThTbUBBcsqJhFS1A9Ep6tPYTjiTRPgFIFCY1xayWtE/AYDv/4oE4AAD72O5OTB3ZYSRNJY35lmM229sCYJltJIASagpJtCw6s/EPLHZOOh112LJLdHMPZTSZrS2EDgYSnfh/TDN50CJDvmMMhIAiA+3IzHFPuzliEuKhVZR+9SfILZzR6GVQLIrDC27ugDUVUS+z10Rf2NmQp7P2jHNzhi+s08ROawBcHqTVMqpx9QNt/eEKHtHk8tHnY2JyqDJYXLbEUxS4fQIzBD6JZw19l3LQl0SFES0vHByEwsj8jE+wfOLgn4KcZm9yTcRYyY+QJlDnFEi73ayHB1CDmOsl0jD3wSaxfyhwfTYcEUpy7eEhOJssZu0Q9anBFqGC2EIicIgFH0jBTHglk9FK/AW66Ydt93fKnXR/eKIy3f86dXlreW1UVFOnuNM2guke8Ea8McVYJDzNnVx2oY3nUr20nRq0kvRI+e8yXzc7OAEtuxiQ6IpbuigMqsIZlQog7+fuaWr8VBDjiChf5ltFWExFMwspQMwwKDpOH/q6Aq53WBFhwbFaJMNO2R7kaadKkk1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(366004)(396003)(39860400002)(316002)(558084003)(16576012)(2906002)(8676002)(110136005)(8936002)(956004)(83380400001)(4326008)(2616005)(54906003)(478600001)(31686004)(31696002)(44832011)(86362001)(53546011)(186003)(66946007)(66476007)(36756003)(26005)(66556008)(16526019)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M3BMcEhWampDd29vUFlxc016S204MENaU2J2NFdWaXdlc01nK1RiSFdMemFw?=
 =?utf-8?B?bysxclNaRTM4ak1neTFmYkx0c3FhYy9JaUJvTFZQV3VZUnA5Uk5KTERLR2ds?=
 =?utf-8?B?VEtrd2Y1ditjVTN0cFkzWVU3cXJUQlJzV29lS0JSRktFODlQMzMxYzhLN2E5?=
 =?utf-8?B?N0c3ckhrTUhic2d1eHVjbjJyNzBobGZ4R2Joc25pYVYxV3ErT2NLbWtaZjNF?=
 =?utf-8?B?enU5Z3lSSUU1THJnVVhncCtvRWRza1d6bDZNQm93SlV2UHVmdzdCQnlLcGlp?=
 =?utf-8?B?R3dnN1c0VExhM29sODNKMU5KdGpZYWZ2b0ZUcUZNdEI0aW1JMmhkN2JEVjNi?=
 =?utf-8?B?MklINjRaV2pwME56QWROT1ZRY3lXT3N5UHNWZEthL2dTZ1AxU0lkeXFLZXN2?=
 =?utf-8?B?QlloMHJFczNnYzRFWEl4RUs4d0h2TGpvbVNDY003RlBDQTJ2THBpQ3B0ZE1v?=
 =?utf-8?B?ZVUxSS9uM0MrcFRmYkFIb2x5VFYzbHkrZGkxRGtUejVQVFcvV2ozL1BuT2Vk?=
 =?utf-8?B?OFV1dmVyM1ZmZkpoUWZNNUl1bzI5RCs2NEFmWlAxcklod2pNelRaMG1WeWx6?=
 =?utf-8?B?NHo4b25XaXRKU1RIUUVINllDYm5Rd2xCaUorb2xlN1AweG45NU1ITm5VMzJJ?=
 =?utf-8?B?L1dOWm1SNGVTNG5hNENYL3kyQnV5bEZGdU4rTXNWbHJlWlhQWkFQOEgzSzFT?=
 =?utf-8?B?MERXS052UnlSZythMml3bFdOL3RJajZETFlsV3k0ZUJ1d2o3NWd4RVhSUUo1?=
 =?utf-8?B?WmNIWGZQc0FEY2EranpvVG5NRDdNc2c1dGZLV29nOFBEUnNyTURJNysyZ3Nw?=
 =?utf-8?B?K0VzYWlTSm9xZXhrUkFsdUV2eTM1ZkxTTG9yS0lLVXFwUmlnVHVnVENIUFBK?=
 =?utf-8?B?RkpVaVlyNmhxR09KaWRoUTU3Q0V0cm5MRjFPZmVFbFAxc045aTRVaGo2cmMx?=
 =?utf-8?B?UEZVdlN1bG5tSTBQRUhQcTU1TDZxZG4xTDlHL0wvOWYvY2ZNWXNIMWgvRWxC?=
 =?utf-8?B?eFA5SS9rcmdGMEFOaHRMMWtPbXpsTlZsMVdJcjg3NWYzaWpPdjZvQk1sOXFW?=
 =?utf-8?B?SDM5TCs1T3h2eHlqU2VqYXZKY1ZaNkxLV25HS2tsa2hzMUxjTzIwM1JFeVZk?=
 =?utf-8?B?OWJ1cFJNejVUd3hGME5uYnQvRHdPTllWc1hnMUdIV3VybFRXVG5HcXFIdUNi?=
 =?utf-8?B?NG9nK2FFMUZxSmtSZHNJMStWcUZDTVNtQnRsTjF5Y0owZHlQeFhCM2txVUtl?=
 =?utf-8?B?a2Z5U0tnQmwyb0RFL09nQXl4SHY1dCs2aEJSUnFFY2ZIcjV2THkxc2RKZE5S?=
 =?utf-8?B?Uzh2eDc3aUtDRlFscTdpSUxkalZLSEVkc0I2RTU0QzI2SlJyOVhCUEN5QlNT?=
 =?utf-8?B?NnVjZWZ6a3hxNjlxSzVCUnRaWEZmb0pDYzJoa1E4NmF2UXVPanUveURNOVFY?=
 =?utf-8?B?TTFlczRCMDFkaitjd09obUszdFFSb3hxUkxPZUFvM0lJTWlWMWlra2pBUkQ2?=
 =?utf-8?B?UkF6YjFuYUVMa3BSQnQ0Uy9sVVdLeDNBcFZBbVdVZVYzdzBHNjdWR0w0dGFH?=
 =?utf-8?B?Z1BlamkvN1hJTit3M2JoS1dwK29ZRTl1TldUd3pIVStMYk9zaGdpc2pCM2Rq?=
 =?utf-8?B?NjRCRTlMK29HZUhsQnZIYWdoanJscWxVZ2V4NHkyK0lzUUVKNjI1RjVPK0xG?=
 =?utf-8?B?SmR3cWlhQWR1eGVpVUkzajQ3c1ZPV3VTZHNvWnE4ZHdUeXNxbDRxcnh4SEJK?=
 =?utf-8?Q?PlSzE7VEI3DrDDiX6JUUfijpc/K6ssU8jdOwGBw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae24770-f2f2-4234-0420-08d8e8a35251
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 17:45:43.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK8mWqnazvvZ9sAYwdTrJ3pKNmqjevYQFUXv38btKVxYq1rG0ptArew6W9Ega2arTE/7QSDaVKNVhbiQvRCOPjN7QwIM700JGSXpgwLTXSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4414
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160113
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160112


On 3/16/21 12:56 PM, Roger Pau Monné wrote:
>
> Do we also need to care about MSR_AMD_RAPL_POWER_UNIT (0xc0010299) for
> Solaris?


I can't test it but I don't believe Solaris accesses this register.


-boris


