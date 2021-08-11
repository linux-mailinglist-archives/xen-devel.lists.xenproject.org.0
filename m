Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BF3E9439
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 17:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166123.303379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDpnz-0008B6-96; Wed, 11 Aug 2021 15:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166123.303379; Wed, 11 Aug 2021 15:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDpnz-00088K-5f; Wed, 11 Aug 2021 15:06:07 +0000
Received: by outflank-mailman (input) for mailman id 166123;
 Wed, 11 Aug 2021 15:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAfO=NC=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mDpnx-00088E-QG
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 15:06:05 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e280f7-fab5-11eb-a09b-12813bfff9fa;
 Wed, 11 Aug 2021 15:06:03 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BF5nwI003926; Wed, 11 Aug 2021 15:05:50 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3abwqgtdv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:05:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17BF1mJq078862;
 Wed, 11 Aug 2021 15:05:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by aserp3030.oracle.com with ESMTP id 3abx3vw8ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:05:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4062.namprd10.prod.outlook.com (2603:10b6:208:180::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 11 Aug
 2021 15:05:41 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c%7]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 15:05:41 +0000
Received: from [10.74.99.104] (160.34.89.104) by
 SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 15:05:37 +0000
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
X-Inumbo-ID: a3e280f7-fab5-11eb-a09b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IDo6EbQYrFmrwedcp0gCuD2MALZNysVxehj98xOOmVc=;
 b=t1Xpw8W1eRzW3/uI7bHvz1Jk1lxtw3Bvu5nDjMmlxBKPpB99bTceWJEN6D7QclZCAnCF
 yHJRiWyuu2940qkq8+jBDoypyDNRrThRPlYhgYnmzzYQMK7t0X+nPI0etmN2QzRc7+6U
 7Wgyz8bEFmNvH4NaWj0cKNxcMuxzqjA3tw2LrBEOaTtRCzNBxnihFimkv8r9+N80j5Yb
 IDPtdcxoN7ozo/ksN278udPleIlNkExsZWA36ESMxBAT+aaFbL7jIfBRkkccaJSpkeOa
 amLNCRYbbaiOYf5nJ/Pf403OBYxaT2N/sc3rZQF5UCEWq1B5cEQhxWwebFwH4fA4r8d3 cw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=IDo6EbQYrFmrwedcp0gCuD2MALZNysVxehj98xOOmVc=;
 b=dy+H6lfyvWHFQA8YQrxLSDfS/VVF++gxrskL/UeZHlmDsaXIZUBBvgBvm12WcNHyJwUH
 2fXHnVbOEHB3clb3huIW3QIZouvQEavHEhlvW0ejyB6nRqcVHSPy5RA3HBh1GTeK6ds7
 rJMNOseY8LQQwlurXBjX1cwu+nw3rcBliDLDKdH0T3g2TtaXWfpISXu7aaAfBC2wydS/
 4WCU54OJ87SI58b12sHtPleN0IiEV0BmBnz7/xANJy4hP3Ob2DB5uJqDtQhp5gZr0NPx
 5bUw3zAhsse8UmrsEnbuf132t/1Y+2U/oEd/HvpqgirSJlK3u4hEugGGrw4185xqFs5F YA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWBdar1msZVvkQucbytL54g2ldkHkH15KgL2f2fjPHYXqO+0fAg4z2D/PfZZqKbXd+5Fa1AkTFJkqCJ9UtxkV3kMmcTG3hqie/xnhoIw+0PiZtRDtuOxIQZ8KsFYHW5vmtwHXfoeN+6qmOlFrTvRJuxFm8mQGJ0ouwai4WsDKZjcTKlqIxGddAGU9kZO1S//UTN6sVK+5z4MJKHxq2H5LXny6HPF40QHmWo4r+96df6dBfLLJm8SIumsdxT+mQlEK+rngFB/38XAyTjzQyepWkpM1oIOHoMRZ4YR3Zdvk2B9bpMaJei3rvbMkuhw3sRGB5C7xvcCxyHmilC0E0YIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDo6EbQYrFmrwedcp0gCuD2MALZNysVxehj98xOOmVc=;
 b=QO+7BHN6vTAZ05d2FFpsvCMmtdi3PDgaM+F4NbQ9q8qlhDlCqFa/RhbCyvNxIa2CNA9nAJtQVelgHlidNynblldIkyAjSyTHUaZdn/KAujnNWKLuEtsE05S7I/Fi/FPALTjFI3zcVTAq6yQD5msRcKuUCizOpjxVgEbUp2amU65Ve3Jdk/ZmNYB1BsORmtmYSwV1pFCMjc63o8+bXefP1U1ZTyrIn7FTFFOGef3+UWHC86XjyfI1hmfGfk204hEf+PEI5t/BD68/voOOiVLHL3RnlWjdKdG1qWStg1KsvuI5wf0jL500dBcKOXluHK49mRRuurYIuG1qv4ncBZN54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDo6EbQYrFmrwedcp0gCuD2MALZNysVxehj98xOOmVc=;
 b=w9fwpfAQLvp9m2BR+soEAHhcESqgMMgWXtBma3Dkz7rkkwrxyaS3cV12JGgdbfhW4fZXwngpTJgt5oAm9VDh6VabrmsxuytfQjZPYsJga3oODiiTXjwg0ss2Is+9Sz6ljeeMR63QIJWSa/h/MyJ8Q+9k7CzREVJAA9suRytzNXI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/events: Fix race in set_evtchn_to_irq
To: Maximilian Heyne <mheyne@amazon.de>
Cc: Amit Shah <aams@amazon.de>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Jan Beulich <jbeulich@suse.com>,
        Malcolm Crossley <malcolm.crossley@citrix.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210811140806.75710-1-mheyne@amazon.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <482af7c4-ad9e-6054-db45-ec05249a2517@oracle.com>
Date: Wed, 11 Aug 2021 11:05:33 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <20210811140806.75710-1-mheyne@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9421e239-e915-4cea-31a3-08d95cd97c71
X-MS-TrafficTypeDiagnostic: MN2PR10MB4062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB40623EEE954B99B689F6730E8AF89@MN2PR10MB4062.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kIGKsSuwbk9wcAFbVc8LBE6/X+XLLBiSLxM6MHoAjQuUasTfcaHb3in83SV4nE/tqz1P9qlvMTH+v5IMf6Fe0/D6W7o4ZPauzNhX9tbpWIKgaMgrAkQG/FSb6Ya3l9ePclyzMSd/im9OI4uTjjntDX/jUHgnAKIOK/52OGde7UR3esJUtEidjlk8dlaLaMubsbVCCJ4o9Barxum17Fk9sgftGXfbgWwpsEEFrxHHi6q44d5EEmZeONu5Jy8HBrTpqOao4ZkmluVs+rlAYefziz8/alLXLLC9MHUHY9u6XMhsztfteA8HXID3+qHzeZoNHk8MWlaq78fQIMohEowwCqgpAzBTeOHGgT9yqnZk93bd5YfBeOT9TuIH579kWwObCxQ1IQhIpUjIIIpX0sApriVxeGGj9WxSkljh3pjP2HLQXnq2C2VXYQvMGVZ5AyclJt870Upl7X7+pGPrnOl/NzbgDfHmQIA5zYi7N7VcNhWywpana8btP7MUWzBtlWO1ZbQLvuGGUHnVE9PjBlkfEQfwV+i1ekPRxX2S9R2DPbA8DcxOYxVzr+j+INpqRzVjatxlMDHXXrzSy0YkVklqRhwU/KK/zoW644DKO1rGzVe15BbhsRjNFMslc5gaQb8QVqvTIxVD09Y1aB0eoxyOn/EFXJWgw+kwVVRaWndvnFmqyuhsb1zzSP2pDJsOP0fkNovOXQceZPn36ubDns4ek5kjusgIQ/8k95mmEpEBAWo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(346002)(366004)(376002)(31696002)(36756003)(83380400001)(4326008)(316002)(86362001)(7416002)(478600001)(8936002)(8676002)(6916009)(16576012)(6666004)(38100700002)(54906003)(66476007)(5660300002)(6486002)(66556008)(26005)(66946007)(53546011)(956004)(44832011)(2616005)(31686004)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bW5oN1l4SkhkaWNKZW9GR0hsb0NaeUhvby9IZWZFWmRzOWxBUmUzSEJpOGdJ?=
 =?utf-8?B?THoxMFlwRVJ5M0NMcEFJV1VzWjZoU2YyalpZcS9GcjZMdE1vMmZKejNPZGlZ?=
 =?utf-8?B?dDdSRURDWHg1R1c1bjVyQjB5Y2RoOUZUcHZuc3gwN0hJU2txdEhSMHdXTDFt?=
 =?utf-8?B?VHhyQWVSWWxRTDRVcTFmdHVROGpGNUlOekJiMHVrSytwRk5YUlFaZThxU0tP?=
 =?utf-8?B?czhaemlGcWFnSlA2OUdPRGhQSnN0M1dFUDM5S0owWnpkbzA2RXhNclJNc3FP?=
 =?utf-8?B?OGU2NTlOa2tEWlFFZlpMNm5jTnV5UjVTZVl5OElqbGdmZnBuQ0xYWGJSZll2?=
 =?utf-8?B?NlJnQy8zRWwwUWU2WEFkdkk0aEYzMFJJSFVrWlgxbTU3T0VNek5UTHEydkZi?=
 =?utf-8?B?ZVZvOTJ5Tnp2ME0rYUxNY1RUNW93ZmNsc0ZCbjNiUDJCbDNCL3FVMVMyaU5V?=
 =?utf-8?B?Mm9ER1NsUUZURzZRa1NwQWVkcnBCc21nSXhXYkd0eGNtQ3JzR0ZTTFRvN1ZY?=
 =?utf-8?B?bmxOenhVNll4UnZEUHphZFREYy9ZZVhuWEdVVDFLTHNVSnRDOGRmcUp5ZUEy?=
 =?utf-8?B?ZXB0czJTL3JpSzZiZ1dYb1k4cGptcGkyRUxiUEtENk5sVE9odVVVNHRqVk0w?=
 =?utf-8?B?djlPT2RSZXJQZEV4RThKd2RzMVY1WjhKek1ZVGJqV0JMSWNMZnQrWUxFYkkz?=
 =?utf-8?B?UlRKbFpPbU9IRW94Q2xQN05nLytKeEFYTEZORHFyeE1vYjIwWGVoYVRGNkpa?=
 =?utf-8?B?Y0lLQzB1UVEyZ1RueTFUNUovZlhybDdwZDVnV3ZqOUc3RFpRekFrNjFkUFlp?=
 =?utf-8?B?YzNKb0NPdldBNkNyK2Z6Y0ZvRU5VRFZ2NFBCMUMwNUJ4MTk4c25rZTBMdktZ?=
 =?utf-8?B?QW44V0oza1cwUWNUb21MczFSWENPWGRXTXY3SDhJZnp2eE5lQ2J2VmFSUDV4?=
 =?utf-8?B?YzQ5aW9XOFp1WnNUWTVIcGNHREdDZUd1T1ZxUDNJRUJXeVJXVnRmcTEvenVF?=
 =?utf-8?B?ZHdzaTJTZmd4TzJMeEM3bUdZSlFpWWVUNEt6QWJrSXpMWktILzQyaEI5cnFk?=
 =?utf-8?B?cmdibEtYaWRydlY0bld2cU00UW9IR25obFNlUlZJU1hRVFVzY3k0N210bndG?=
 =?utf-8?B?a0NPSm1FcE1mNWVtQk1OSlZBaEk2WmNhdXlucnhTYUxubFJ5QlJkUG5QZXMw?=
 =?utf-8?B?bnBnb1RUa3ZBMEFHaW5iZHoxMGhBZDYxRHZ6R0c5d3dONVAvbm1OaFQzVG1x?=
 =?utf-8?B?MUxvQWl3UkNvR1lURWJhT3Y5ajBWRjQvRUR0TkRJQWtCUXRuUEQyejErWFFl?=
 =?utf-8?B?b3UrdWpqaTFoS1RnZ1FmTyttMmhOQ3RVRE9rVWRxakRvcGIxMU8rQW5tR0hP?=
 =?utf-8?B?TlhyYW43alVSRDVsQ3k5RXg1R2haRjgwcWFkYTIvQ3JEWlJsSGRWdEwyRHFY?=
 =?utf-8?B?d3haMDBzNWhkTWpjeFRPbkRoN3ZaNlRXbHVyaEpKaHAraUR1bm5JNG90NWVJ?=
 =?utf-8?B?WEIxQU9qYm1QdThIeEhreW5ISUQvY2l0SlpGYzluM0hPbjQzVHVOTVFpbkRQ?=
 =?utf-8?B?ZDN0a2xyMTRkWmJLTEcwMm56bDc2YzV6R3o4VXRlVWZkYU01UUpvQ1BkN3Fn?=
 =?utf-8?B?K2RjSXpJQVFvUFQ2aDhSZ0VxZUZmZjd3MTh0a1llT1p1cFFJa0NOWWFiSWNQ?=
 =?utf-8?B?RGpHSFRTRE02Z09ldVkyNG04aU5zalZMM2VNdEFWbWw0R1BPUDNhbG5BNFdZ?=
 =?utf-8?Q?Kw9bN0Fw5M+WBqPd0IvqGOVIrH7VqmGIKcT3QIm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9421e239-e915-4cea-31a3-08d95cd97c71
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 15:05:41.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZpdoqsqxd1qjdb0iIoE1n22LkLGHTr8XvTw32+grNIefOskwvVSj1ql3vz1wChajdyZ79GHIAEC4Q8syHAKp1hDBZpblAIeNoqM/2viPrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4062
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10072 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=844 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110101
X-Proofpoint-ORIG-GUID: YnaBpIpl3LJ3d-hhg-PW9E01XoZSRxLz
X-Proofpoint-GUID: YnaBpIpl3LJ3d-hhg-PW9E01XoZSRxLz


On 8/11/21 10:08 AM, Maximilian Heyne wrote:
>
> This patch sets evtchn_to_irq rows via a cmpxchg operation so that they
> will be set only once. Clearing the row was moved up before writing the
> row to evtchn_to_irq in order to not create a race once the row is
> visible for other threads. Accesses to the rows are now guarded by
> READ_ONCE and WRITE_ONCE just as for the columns in the data structure.


Is this last part really needed? We needed to do that for array elements to avoid an interrupt handler from seeing a partially updated entry but I am not sure I see how this can happen to the row pointer. The only place where it might be important is when we update the pointer to the new page but you are using cmpxchg there already.


>  
> -		evtchn_to_irq[row] = (int *)get_zeroed_page(GFP_KERNEL);
> -		if (evtchn_to_irq[row] == NULL)
> +		evtchn_row = (int *) get_zeroed_page(GFP_KERNEL);


Not directly related to this patch but I don't think we need to get a zeroed page --- we will initialize it to -1 immediately below.



-boris


