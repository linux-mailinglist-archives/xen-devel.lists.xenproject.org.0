Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5C32071F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 21:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87335.164466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDYz0-0006Cj-S8; Sat, 20 Feb 2021 20:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87335.164466; Sat, 20 Feb 2021 20:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDYz0-0006CK-O0; Sat, 20 Feb 2021 20:36:06 +0000
Received: by outflank-mailman (input) for mailman id 87335;
 Sat, 20 Feb 2021 20:36:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ysU=HW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lDYyz-0006CF-GR
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 20:36:05 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0c53bce-7601-4708-a125-51667abf3dab;
 Sat, 20 Feb 2021 20:36:03 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11KKYvIL099809;
 Sat, 20 Feb 2021 20:36:02 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36tqxb8ydu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 20:36:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11KKYZGL001838;
 Sat, 20 Feb 2021 20:36:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by aserp3030.oracle.com with ESMTP id 36trf9rxwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 20:36:01 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3064.namprd10.prod.outlook.com (2603:10b6:a03:8c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Sat, 20 Feb
 2021 20:35:58 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Sat, 20 Feb 2021
 20:35:58 +0000
Received: from [10.74.103.244] (138.3.200.52) by
 SN2PR01CA0064.prod.exchangelabs.com (2603:10b6:800::32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Sat, 20 Feb 2021 20:35:57 +0000
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
X-Inumbo-ID: b0c53bce-7601-4708-a125-51667abf3dab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Ttjp2TZJU+U2UIOOLpcWd1iIjWpC5sFOUFSHTnkE3mU=;
 b=Mkj+XBr/1YTpPlMd+xsWqx3WOG0CI3Cu9sUzdnaG6M+/axHOrIc5hNQs9POEa3UWUeZK
 tIbHaosC+hfiY+ISKn4fTQfoS8u+9LtPdDC0FvSnKTQ0I8pqf2qS1/kWIoybjANsN+lM
 wpQlobBLTz/WcLmo3oacHaGMu0Luz31GkyjoeRWwN8G8caFJho7bqy3mAETvDPVY68hz
 Be878R8WJaJH26sObVpooLhzlbCZClRB27jCX4vG3pX67LRX559Kdy69WhL+A+7uJVP3
 WyAVnKtrbCPRuXkzi3nOTZfg0RiKkyMMJNC8AH6ISF2GyvMtgAyjzKovWV0n7MqhNKbC 3A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENV4ehp03eIj0SSnQAs96rP91js2iu9jrzg41p7haHcRXOJiQIXF47u9HVUUPe8ySYf+XPhyCWVeXulOFZZRLKYjBGYRil+1Rt6NoSOCmMJhdQyIh++dr/VW1ZxBt31n/d0AuHgBL14XGNurj0cBNTpOdSY3vc36u54vZ7fmwm1DaoSizSA2BSoKFo/XpGt8SQqF39Wt2yi2WE1ayV3ZF1t8It8EzqPLkfcqhgcTCiPOMZB1x4isxAgiR2Bj2V/I+gmpjepeq/CLz8umgm6iyr78LM2GcAJ0n2jxpzMF8qH+Tf553q0KaA7//vC99XR3Y+O87Gkak9C9E6Lv7nv+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttjp2TZJU+U2UIOOLpcWd1iIjWpC5sFOUFSHTnkE3mU=;
 b=XJPWrLwzVhhCjt6dB1iFqZXSDq8/UyvQPPvWGP1q7jMg4G/Y08GQACLs6CCcg7RWCGTU4KCEwJSl25TFQs5j6OqpIS2E4SzkEhEa9wG5tmCkD59ntyEG9LSdeI3tx84+sgtjDNOBs7zDo3YsJ8NypYjD4nCMCQ1C34GGdqsAl5vVowVBa+czHpwjBKcudyEqL99bugwqtu7scq1pnbfn64cKYOgOC561fj+wSkWOAP8l1ZXSkIoBLrjqy8daP2g2glFLx/3s2RmfMi2JyonygmyAAv1C95x7H8OPOCfQRO3Ndj4VJO8q3+DozDUQCiS6c6L4LIhqbeQ4lugsMqG77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttjp2TZJU+U2UIOOLpcWd1iIjWpC5sFOUFSHTnkE3mU=;
 b=HdDmoWIPSsjmQzb4UN2wxkzdCLK+mAo/TPEJvsbRq3Hx5sb/HFiasbo8cvmgMdmqv5h+Uxve0NBJePG+gt2qVWdndwK6dHOJUjG59/1P45/VNXw4DTMdtuNog3f3GPZ6CC6azmILWXjxVui+TfVgErhNdXpmWX0k6KDIHVS2LkQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v3 8/8] xen/evtchn: use READ/WRITE_ONCE() for accessing
 ring indices
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20210219154030.10892-1-jgross@suse.com>
 <20210219154030.10892-9-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <3d3016a1-d1c8-32fe-40e5-e86e9c39b8cd@oracle.com>
Date: Sat, 20 Feb 2021 15:35:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210219154030.10892-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: SN2PR01CA0064.prod.exchangelabs.com (2603:10b6:800::32) To
 BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38e3ba5d-f69d-4496-64ea-08d8d5df210e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3064:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB306435DA72C13F0F16FC56FB8A839@BYAPR10MB3064.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JmNur/r+mfPuFR3uy7HQfIY4dJMDm32K+tC4fkVYY9O/h2j1eDhPN/u3vO38ZBmFrROe1U8MSmaIVvug4hSv7ftvTf8F7zZDW+XymXVm7TruEP4taT4joTMZxc8IimHzziVwa4blm/mrsDTWpt3NwIDzV67PhzycxjoYuaD/vkQfKtaFIxXiS9pNkWzKRN0k9hG89ysb2lo+qjew78eG2eaXc1x6pbyfsTsKdhM0Y26tWU0WUCo+PlcLiFZUF03WHMY0cZ8McXbpRge4zKIVdV3HjZoTVcFLC/n+YTjLB52+I6/lJOsDsdS8MgkNGKwkFegEyjGfjIDKpn7ZOSnSOt6qAVbKJ8Y0xxAuXlJykUqdzibJzot4RwrLEIFu90++DTSurHvECkYc4c6Dce2BpqJFOFeGGjIkehxQD9bVLyRucFEFAWr8GVgJD5g+hbiYKu2bhCHk8KRg3D1/klzO0vW8nI7msa01YvOrTmBRUgKTOYMu6JdWQBVzaCZ+oPbqqBsKrstlSeGqpyiB950UtJb8aIUCcUIWDu7vZoGpyoPkH9a/1vzPUj4aIhOPtFhEbWZJtSuNJe33+bYazOQqRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(36756003)(31686004)(66946007)(6666004)(53546011)(86362001)(66476007)(31696002)(4326008)(558084003)(478600001)(26005)(8676002)(83380400001)(2906002)(5660300002)(6486002)(956004)(316002)(186003)(2616005)(16526019)(16576012)(8936002)(44832011)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SFV3RW1TaldZZW9vamYvckZibjhWVllSU0RNaEQvTGZBNmhGQmhvVWJncmpw?=
 =?utf-8?B?YmV0MTV4TEV4bm5kbmZDVWpNMEJRamthRDlNSjZBQ01QZ0Nwd1Brb0hCSDdB?=
 =?utf-8?B?QktWaTNpYVB3dWpnTlZ5ZFdoSmFvRFRZQkVuQmxtWE5qTzZZNVhlRGZ4WTZO?=
 =?utf-8?B?b1N6SFpGVys3ZFpKQjJKNy9TMDA0aERXYjVpR2VRTU95K3h1UHU2bFRPZDJw?=
 =?utf-8?B?M09GekhobVpROFFpMDJYZVZLd0tVcTRvOExvMng3V1JxN3llemFtNHF2RllF?=
 =?utf-8?B?cVluQThNdHU1U1hiaFRlSjlVd01WLzZ2R2VhU1M1TXNxOVVXVk54SWtObVFZ?=
 =?utf-8?B?RHVOUDB3ekRuVlY5U2dWcUREMUJ3V0hJTVJhWktOODZyaFlyM2xSUEtOS3NQ?=
 =?utf-8?B?SzFQMkJKU0JRQkM5V1BBRlRUZ3JXN3RKaGN2Um1ya2xhc2w5V1B0RmxHeGJD?=
 =?utf-8?B?Y1JaYkV1ZjFHR3pWK1dIOW9jdm80QkUzZ2JoL3czRHgyQjVUV2ZYUjlTVnE1?=
 =?utf-8?B?eEVyWFVNTStmWEFpOUF3WG5VS1QvdDZpdXBhUXhTNXA1c0V3bkFxaE1sK21K?=
 =?utf-8?B?alE4c2ZGZ0JpdXJBMUZodE55WUtFdzJEUHN5cHVndzlaQ3JIWDRvVDAwZTZV?=
 =?utf-8?B?WnVpNU80ZTYyd3VMSEtaZFdMOFZLOTZlcy9QUFpLc1BjeTdsV1lLY2phZGpw?=
 =?utf-8?B?dENWT2c3UTFWWHk0N0liU1ZLUzhKTm9oNnVwYVVrOWxSVGhjUGVXeUI4N1lF?=
 =?utf-8?B?cmxmK2h0NnhxUHlrb0ZUWVhiOUw4bjBnNHVxeVc2MWFZMVlpNDlXUWhjQThU?=
 =?utf-8?B?aEQvUVFVWkRVZFVXYlgrd21peGhseHZOR3lHQWZUc3IvckZsRDB0aDh2MWMv?=
 =?utf-8?B?ejgzMmxsZHFkSG9SL3VuS2M4WVVoNjBISVNBa09QU2IzcEp1Q0FWaHZ3cSt4?=
 =?utf-8?B?K01zbXdTNTJNUTdJZ2FKWDZTeHpidUUwZkx5b1p5MTQvaHRuU3BiYnZzeGlP?=
 =?utf-8?B?cm5ITXUzaW5KbndKR3J4U0VWWWxtTUhOZEJnWFZFbUdpc3ZuUy9wMGlPZUNC?=
 =?utf-8?B?aU83SDloYlhHbU43ZURIcXpSKythSVQvUE1MRk5ZbElTb3VEenVlVDJEc08w?=
 =?utf-8?B?bWVWRzhCTDF4WXFmOEZtK29mN082Vy9DbkgyM2ZiSnlmOUFycFdPRlZvTUtx?=
 =?utf-8?B?ckRtV1NZMFdYNGx3YnBtSWRqRmlTOGl0Q2MzQ3dCY1hRSktvN2xlMFRUSVFW?=
 =?utf-8?B?UmJQcTNXcTY5NHZTeDRsUFczTGwzZVB0bmV0cW4ydzBzQ1BycXdWWnlJaWR2?=
 =?utf-8?B?ZWtPWnlJYm4zdEhOQnljN3pVenBRcXVWbjVWTitjOXBiNEpNdGVhQUJ5STQ2?=
 =?utf-8?B?S0pwY3JxZ3dIL2lKRFRxMmZvZFBiaGNWcWhsR1BtUTdqSmxjaFJJaGk1T1RR?=
 =?utf-8?B?WjN4MWVjQ0k2VzFCVTFLN2RtekRVU3VNeTE5MXZIS1NqOHQzcDBlVU1Gd0dy?=
 =?utf-8?B?S3ErVC9oTzl6V2RHSk9QTHZ2bXRIRnJwYU41QmFwVkdENDYrZGV1blVPK1Ft?=
 =?utf-8?B?RE9CSFpLb0tmS3NSMTQ4MjFsTW41d3JQRHVhdDkvRHJYbndqczF3Q3g3d1Bz?=
 =?utf-8?B?NFdDZXpSRFpHUGNTOS9GZklBRlhwdVQvWmR5ZTNlcEhPVnVvYVpWc0ptNU1u?=
 =?utf-8?B?VUxNcEpqS1p0V01GTGFyYmRUemtPN2pRWVlDaVZwS0RDRS92VDNJOHBQblVq?=
 =?utf-8?Q?fWkkz4/Yoe60D6j3l4XfXMt0NZ8JT3C99GPhplB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e3ba5d-f69d-4496-64ea-08d8d5df210e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2021 20:35:58.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvDUhs5L8jSNwSOs1xb63DldtmsFsyzjGLgwUI4GBh17dxlPrOTsLN1kSQufdCLha1geB5Z96EnRyy5dE7pYDEnSdi03F2kX1OKF0Bc53Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3064
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9901 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102200192
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9901 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102200192


On 2/19/21 10:40 AM, Juergen Gross wrote:
> For avoiding read- and write-tearing by the compiler use READ_ONCE()
> and WRITE_ONCE() for accessing the ring indices in evtchn.c.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



