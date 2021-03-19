Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A463424FB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 19:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99367.188950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNK3o-0006Wx-IH; Fri, 19 Mar 2021 18:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99367.188950; Fri, 19 Mar 2021 18:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNK3o-0006WY-Ey; Fri, 19 Mar 2021 18:41:24 +0000
Received: by outflank-mailman (input) for mailman id 99367;
 Fri, 19 Mar 2021 18:41:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2B3=IR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lNK3m-0006WT-Dr
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 18:41:22 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c15901-fcad-44cc-9c20-edade0f9bfad;
 Fri, 19 Mar 2021 18:41:21 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JIOdK1085297;
 Fri, 19 Mar 2021 18:41:19 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37a4em0v9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 18:41:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JIPjgp035185;
 Fri, 19 Mar 2021 18:41:19 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
 by userp3020.oracle.com with ESMTP id 37cf2c3k4b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 18:41:19 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3126.namprd10.prod.outlook.com (2603:10b6:a03:15c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 18:41:17 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 18:41:17 +0000
Received: from [10.74.102.27] (138.3.201.27) by
 SJ0PR03CA0151.namprd03.prod.outlook.com (2603:10b6:a03:338::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 18:41:15 +0000
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
X-Inumbo-ID: 90c15901-fcad-44cc-9c20-edade0f9bfad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tEz2JFMr1dvD5djeC9s6X8ftcCzTFEKLa21UzJKdQEQ=;
 b=Dg2PLw7e32TwltPWbNXPOGJCg5LPRdPi/+XwHKAguOHeCo72R3ZLMnElTTllZNjqko3e
 /t/BAA2pMw7q1qMD0cXISIb/Yfy0HMf2rfzOtj8VHl2bb87HxerwCi59X55Z9mJBrFuM
 3D/TJSQf6squLpHI1S1EefBDYqB7XDKbsEEo3/TNsVhosBBuPfmyvqd4M6RQrT6qQjqy
 wo97EI1fvUnwVqoi7DdTUrKZwW1lIk3n/P/pdctA2AwD6b16/fU+IaQ1tRGsz3VGTPwP
 aPIeEVXwP7sewyt0jdZ/8YfmJTtMe0H9eZ91eWLNy1eaji9xpuKm/QyqmlzsbVd86HJw pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnxzbWVbmuVq3vAEH+th2uIFsxbB9g9DCQ38W0fwR/fgMWYHQtzCzRXMdKLSRyqWJvKEn9gL+f6R6+RLhRwNhcIbXq2AjMbpG6UspIjDcBVNeouOWRqpDCoi3QoHyrhDpImw5sqbUGH4FSICRjQo7HITwYp7GbNub8f93ypOjsKoda8JwCiNo5yOnzJVMgvn2LqbLmzJ8uBCvr5wq7lRBePL/5MFQGm+phAEoh7cTjsz09zLI+DB5fClOCNeJNmwj1rbi6sjae/o8EZJcPMFu/EtT8GNBJHHFz45ymnZ6W3o0/5M3CkBpNLTizkdGmIYFoWC2GQ/Y6dRsHRYbKjaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEz2JFMr1dvD5djeC9s6X8ftcCzTFEKLa21UzJKdQEQ=;
 b=VhtMwierE7FwOITZ8FbZzNmUlePLN2E2aCsvgFmVrmNfRjDNk/mIBoyRfflDAprrRNTKMRC1GfhW74TYTAljoWudXMqgK4gpN4c53MU6AG9TKl+LmKB1X7R8vnOlyjrowcQ56NUFj1dNJXu0VuhiwDAyE255m02RWvLgKLgwKcOuzdKAAPHIYwP6LujWEzcUSbTlOKIPEUzxNIOVOvutCvVr0ZTwBuONoUtu1Qw42XXMBELFP36hDcaRBpXaolh/7mFU3z00+bLGbNDOu14BojS2E+uqYbsVeODkhRzGLePSBAb4RcbmXKEgABW/xaoniXQwARJTsqSuvjkFLqvg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEz2JFMr1dvD5djeC9s6X8ftcCzTFEKLa21UzJKdQEQ=;
 b=aARO8e0ZDddAssJkospLWQM4G3U0SoJ4vcpl6p78YoBegOIr1xKvb0z3k3aosUhWIzeuW3DuhpkQbEKr/NMeIukliZI2ZP8eGtP9BSQg9777YRXLihC1Jq8QTe5miFV/y9gAiJCsJIE4ReISGdkXHnfQ0/AGGbsH1K6Vou1hsbs=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210225235158.24001-1-sstabellini@kernel.org>
 <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
 <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s>
 <47d6b423-5414-f14a-2730-74834bfa18f5@oracle.com>
 <alpine.DEB.2.21.2103191050120.439@sstabellini-ThinkPad-T480s>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0c62cee9-e7b2-f616-a3a9-dac29d4b9d43@oracle.com>
Date: Fri, 19 Mar 2021 14:41:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <alpine.DEB.2.21.2103191050120.439@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.27]
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e88422-63c0-40ae-4fbf-08d8eb0694aa
X-MS-TrafficTypeDiagnostic: BYAPR10MB3126:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB31265F92210EB789C58992858A689@BYAPR10MB3126.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fjo0jJnfZdV1mXG48+qLP6djL5ysSJ62hLYBLLC3wBZY+MLen1BZ5rP/+dlIr5k0c1sT6YozR1FvKiWV5fhtgUqn+P2+MwbX1f6elrzj82L2AqJ20KV3dTo3JEVoC21JgrjCydU9JFia2+uM0T02SS1KjT0fOWqTTqSF1l45UIaj2ljTRPcfuyt2eSnSgqrbRQ5Ky8cF1gsHOR96XIJf9dPV3PkYZZ2kAUrDyn6w65o3TklcFowHyv8DGaqxCpSei9/tbEgBEJUbmgEkyUfdLwksQsbZEfbXj+J1dE1hMArTEQvlWvyrkg4B5GRxsgspEIVErCjKx9eeHrkj3ky7dWboZ3DeGIVtfcbyXLqhvajxToUYVPVeoIrOr2SfunC0qAW5odbJ7IAptC6lhtkUf/4Z7wXmEuktFjM81lNhY9AgB/iyCMDpognntNphckGUJILppXMcEWUN1OvxhxjSd45y5Myw2KrqXP7wWYhnnq773oGDIjjdDSa5Si3v+GXAFpO3EgOnVKc7JKZzky7rAO1SOTqpyjx3nmJkx7nNS6YVai9B/ql78ASOdqrc5366qArwfpJiPOACssPHNUDsnzdpXRsPY5EvoMpzKvnBBcHmeME272zjgswvdlLexJfFstDMg89+WNWCsKPd1G6tnHJ7c7YGZm1BQbAbkUNe9jcs6IJyo5ixaNPGxBDf7+qAZHi9Ylbrf5KDkYG0GyDjJ5Q/dtzeClVGBzImezGyPxk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(376002)(346002)(39860400002)(38100700001)(6486002)(8676002)(6916009)(316002)(8936002)(31686004)(478600001)(16526019)(186003)(31696002)(6666004)(2906002)(86362001)(44832011)(2616005)(4326008)(956004)(66946007)(36756003)(5660300002)(26005)(16576012)(53546011)(83380400001)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y1NvbU8vZlFCV3VPS1NNQkxWanJVUXBWUERVS0Z4MHJmajh0K1Bad3VWWkVi?=
 =?utf-8?B?Mm9TMGJUdlBEb1dESW1UeDJscEhtSkdHNWdNSHZPejVuN0c0OVpsRmlWeEVa?=
 =?utf-8?B?U1JoYjBZa2txRlpBZnJuQTNBZytiUnRlYVhLN29RbkI4aUdjWldDR0kwUmpp?=
 =?utf-8?B?ZDdOZWhVWjlZcG4zWmpMWmtCZG02UW5EVzNqTVZkZUpFSk9oeDAwVVo1cS9F?=
 =?utf-8?B?VDJNSEZRa3NZQjQwcml2YU9EQjZJTnY2Um80RnFMVmJBTGZZMWpZL2laMkhk?=
 =?utf-8?B?L2FTS1psQlc5Z0VxSjJ6cGZSV2MrSWhHZEFWcjNCTzR6SFpVSFZBbXRCU09O?=
 =?utf-8?B?Q2Z1VkdTejczeW92cmVaNTkyTlJzeFhoSFVuL1hQVmFaRUlZWlhKUDdVMFNN?=
 =?utf-8?B?anhxUW9kSTFrSU5CRmNpUHNpU0xGTmVOR3VQbkRxN3oyTFdFcXVXQjdCbXFV?=
 =?utf-8?B?eGZUcm12NVJ6QnNXUVVvc2p5N2dybS8wdUdIRCt1YXpEK0h5NEFJNThuUXJM?=
 =?utf-8?B?NzQzRjBzaE11NmJDV2F2MHk0NytCem9adjJDaW5XYlovbmhkem9vaUNxRUNu?=
 =?utf-8?B?ajU0MXlRbUdzb1h6Qy9ONDdHTnBkRGgvWUhINzdhU21PSGJtNGlLZnpTNk9h?=
 =?utf-8?B?Q2doZ1V0NGhJcDA1UXhremQ1WG5KVzBXYU9UMDBkQTJJOHB2TnlrTkxiengr?=
 =?utf-8?B?bFVYc0FZMDJ6RTFKanFnV2JnOUNlOXlidWFocjBmZlpLNlNUK3hBaUJTQ01o?=
 =?utf-8?B?YzgxNlBSUkRqcXZxa1Z0d1RnNzY5ZFhEeVhKMDhGekxCcW1keThINWR4aUIr?=
 =?utf-8?B?cUFUZHhQbEsrUVlUM2FtYXpFcm1zUVpsT1VLR1YyNHRLNUJROW9wd1BMKzFq?=
 =?utf-8?B?ZCtuVGRINGQvaHZUbkdNTVRnb0g3aTJyMjV5NkdYWGwxSWQxcjBIU0pBQjBh?=
 =?utf-8?B?ZGdDM2ZLN2wvNjZXZTZvTkJkNWZENndNMXQyS2hIRmMwOGVOZHl6WkhTeGkz?=
 =?utf-8?B?N1EvbEYrdnQzcGtzMWI4M21IZkYwT1RGV1VRS3BWNXFuekdMdU1la0N3L2ZF?=
 =?utf-8?B?aVV3bjRTSVBxY3RTVHIvRnVNZWpISDdwVi8rM1dxT3JlVHdrTXBIanJQYUE2?=
 =?utf-8?B?M0dGNmx4ZGZ1ZGhIWDBoRG9BVXpQSG5rWW5VeVJIZDF2eFNvOEtOeHMxOTBU?=
 =?utf-8?B?Sm1oZmtRMEhKQUlKSkZzZmFBU1pwRStCYndCeVlFZEUxdUxkMFM3VGtRWG5w?=
 =?utf-8?B?ekNtclhqa3FFUHBaVk51L2kxMWF1dW5zUmlQN3Bvbk9obkRTL1NpN3NzRHM5?=
 =?utf-8?B?WnMyK3IwYzJFTzZjSFRUdU0wRFdFU2hPczR6YVJhUk5LVXlPOWxERVQvRW51?=
 =?utf-8?B?QW1IemNTVnhuREwxN0U2cnRmUlVwOVU4Z1VSdG8wcGlkbUVkdEdlZ2dSTEZD?=
 =?utf-8?B?VFJWU0tWaE93b2lRVzlzYW1kWmFSNExvNHRZeVhDb3gySnFSN3l2aUxrU05C?=
 =?utf-8?B?cGxOSzZXNkJHbUpycHJrbnRVejhYaDBYeTFQU0N1eUlsSkNFV0Vzei9RMWha?=
 =?utf-8?B?VWRFaE9QMHR4NHNKZXVrVmx2Y3FScVljMWp2bGxKT3J5eWtZOTdUeUVlMzdi?=
 =?utf-8?B?L2w5Qk9GbFh2OHJaVE9lU2JMSW42YVBoL1BDK1REZnpVYkRPYWRUd1pVaitD?=
 =?utf-8?B?TTMyUDlJYXdjMnUzUGVRdTJwZFhoQWRTZVFhcjB1dXFTdnJDWjNwMEFMdnlF?=
 =?utf-8?Q?XMRkLfOjPj9hTe1TTq+JgaQzzW9wouvSj1HwJ11?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e88422-63c0-40ae-4fbf-08d8eb0694aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 18:41:17.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efFERi9JEfGZ61sTS2Wu37RgsL11T/Le2np3bk4RE/RYPd1Nl85XvxnG4PcnIpJqOd429xAMzFuPZBSDuWHDtDcFlgnlK5D4FCjT42mt+dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3126
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190125
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190125


On 3/19/21 1:53 PM, Stefano Stabellini wrote:
> On Fri, 19 Mar 2021, Boris Ostrovsky wrote:
>> On 3/18/21 7:28 PM, Stefano Stabellini wrote:
>>> So, I'll follow you suggestion, keep the x86 side named as it is today,
>>> and provide a tiny wrapper so that we can still have an arch-neutral
>>> xen_swiotlb_detect function (on x86 just calls pci_xen_swiotlb_detect.)
>>
>> But now on x86 side we end up with a routine that noone calls. And pci_xen_swiotlb_detect() becomes not __init and so it will have to stick around after boot for no good reason. (You could have made it __ref btw).
>>
>>
>> I think we should leave x86 alone. And if there is a declaration in include/xen/swiotlb-xen.h that's only relevant to ARM --- well, so be it. Or perhaps you can create arch/arm/include/asm/xen/swiotlb-xen.h
> Yeah I wanted to avoid creating arch/arm/include/asm/xen/swiotlb-xen.h
> because I would have to do one of the following:
>
> 1) add one more #include <asm/xen/swiotlb-xen.h> to arch/arm64/mm/dma-mapping.c
>    (#include <xen/swiotlb-xen.h> is there already)
> 2) add #include <asm/xen/swiotlb-xen.h> to include/xen/swiotlb-xen.h
>
> What's your preference? If I have to create
> arch/arm/include/asm/xen/swiotlb-xen.h, I would go with 2).


Yes, I agree --- #2 is the better choice.


-boris


