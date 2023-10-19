Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E37CF1A4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618955.963331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNle-0008MC-H1; Thu, 19 Oct 2023 07:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618955.963331; Thu, 19 Oct 2023 07:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNle-0008KO-DG; Thu, 19 Oct 2023 07:48:30 +0000
Received: by outflank-mailman (input) for mailman id 618955;
 Thu, 19 Oct 2023 07:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtNld-0008KI-M9
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:48:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e30d4b71-6e53-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 09:48:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 07:48:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 07:48:24 +0000
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
X-Inumbo-ID: e30d4b71-6e53-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVrhXRd2s6LQiGvM6aBrUSRPqdCMnfbEepQKMUwZgygzeZc8eRb2BLIi6VoGlUeJjP4KYYdRmepxm+cbPc4mf0jekVQZ1IukdtI5Ah2bvK84uD7l88yfr3BeCBENI2mMWJmMU4EsEcvwepZi9/gHbASj97ZgfX0kq7e1ioYPouMA0OxxTeecGQk2ava3px3X64eXrjuWWVspy3OK/9q0U/KNKnEq8Iv7VTlHhaFjgrw+Pl4DYFxchW16aRJXAOEEQ4E4q9YzpfU9Fuk5DwAN1Yy219GfdT4HX4eFoFzBd5x+7FkwcfI6NIch3GcYdly3nW2Fb1awLJCKfDxhPmCaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeDL6BkzpG6WN7PmKzsfB5IK1hDEhWpDLBhqUIxE+L8=;
 b=cK6G7JG6b2Fv3HcG1g8a5+/B9wTjY8jas2psXCeckoMSPRnTRR/Lr1A6RHYxYenXtd9p9xlRR8eFNKgW5seIZWE3hzWXS+0fUQvaTmCfdNt7RQbRW6fWRDFTJdyEAZfVbfAmBrb9/n+kvb8tkIAn6pEg2Tqd6FlkOxZpneeuvaWIA4cjcEjjiwVC9Os9TIR4J8krSAT/ulatTVkSmmx6FA7oASoSFozF+iQTq3OZm3mOXlZVTnZNxviKDGVAZtXFAUcjdXDbk0M/qfXUnrFgwn19kNi3liK8+6biZZB4nVy+r8Yi/KQwPTrjP6cbXWqKobnKijCx2+FLb00U9+WURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeDL6BkzpG6WN7PmKzsfB5IK1hDEhWpDLBhqUIxE+L8=;
 b=yXbsYIFPqATBA3vX5rWLmPqw5kXX0jVtGl2N8sim89Ko6aithv6lLG6W2/jou+9TPCuF7a+4LqWs63oPzV3V4o6oinRcDngY0LAtJWhnBgH0pHa4NS6gadUo+Oi2+UuWZIGrFKRuK7aUoK94qQc0PcJWGIlIQcidCN0Z18/Zm6JYA79ACDv4TA2dH3ox79k6tSV3CuopPjG8AdKzOr9U7Zxc+Ig5ksNQ4kQmDeBiOYWNqTNwcdrmy0FCl+QAG2jtTrMDrKKrncl2beFIV5k2KIIWByWr05Iq8whgc4Hfdos6tsX1giwx1ZQlAX2+gyl7hFqSAGVDRULiqssPWmE+0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c86cb866-b795-b6af-0ad7-38e68c7d35c4@suse.com>
Date: Thu, 19 Oct 2023 09:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/13] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231013094224.7060-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fa5e2e-7b7a-4b17-1c00-08dbd077c609
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/t5MKAjtEEv9YJWET3jJIecw30f+2fKMg1zZOZzngbabqNlVStPSSNT+TvO4iLiCtsaa2nxmKbas3X0cfjWGEMP6l2WYriIM5eP6ZkH78NYJh9Hh12mk0QG6a69W/qt8+l0Z9r88C7Kc/+lQTxcpBSmc2IjK7+fyhPKCCiqGEKkk/0AtWEGHWowOgp9u4CXUoAx+MyUZlEetVsMuDiE8co9k5Xz7/XvHToAKnQvK3kmj94FdPL+/aDSLlcG8o53rJzgQLEJVWcljH9VLYrA9NPavIk8n/MdIvitLFUYmpRqBVuftnbCXwqLNQJklzTZhXNvLGxzK9JoCIFrI2BjXhrDtlOrKiEGymi3sabxemGXwaZnTFvvyvHs8laZFdz6wIXVo1pynw/L/64r5s9yaSMbRtUMqGYll7OVXUJaHlvIpQqWQnQTyEszUnwxJDvuaYkvSYfG2cDP1Y7K/ttu5oRrCzeBgnvjTlgUcRsPLKb1ECKP7BDcmIpaDY+gbaOlrnVDK/KHH51zta/6FHGAJobzCmB+BKpmP6H5ubhSeyEWJFyqeWoiXiRfy/Opg5ICgqDfvyWRA3nDXWaZ6jTlSLRMJd2IxApBxUZ3989qNOuDEnxXvovWsCKQoj7HnkzbVZHjbYprvstObbLONlTEaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(478600001)(2616005)(83380400001)(6512007)(6506007)(53546011)(31696002)(86362001)(6486002)(38100700002)(4326008)(8676002)(7416002)(6862004)(2906002)(36756003)(5660300002)(66556008)(66476007)(41300700001)(66946007)(54906003)(8936002)(6636002)(316002)(37006003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnpUNjJobXViemRzOEh3a0hiR0ZPbHVIZ0tJSU50aWtjMWtyNk5tSGh1UXBa?=
 =?utf-8?B?dThWaEZOcEJLV2V2R3dhcFJKdG8rcVVtUDhGTGl6MHB4NFlJeWxMZlRNL2Y0?=
 =?utf-8?B?d3ZsMkoxcmdQQVNDKy83Y0tvbVYzMmN0d2ZMeXF3YmRySFpSOVBEWC9LZXBp?=
 =?utf-8?B?U0RLVmFjc3cwR2JvQUg4R3Vob2hhcFB5dDVBZEhSMDZ0VVlCQ1hMeEllV1Zy?=
 =?utf-8?B?Zk03V2pVdXNuRkZTbGYwUWxKTWpkaUNvU3c2SEIvQVVJbEx5VWF0RTR0T0dk?=
 =?utf-8?B?bXZaY1RsYXRBS3ZPaE0zTnJVa2M0TXlSV0s4RHZMRnRQM1o5d2tnOFYwTFlt?=
 =?utf-8?B?NVEzNE1MZE9MU2tUQUtoQkRRVU9XUWV4NUNnWXJKTDJ4Q2ZRZTIvWlA5VVFS?=
 =?utf-8?B?bTN3NGpBS0lhWW1UelE2aUYrYTJqaUFYM3Jhb2NqOWhuai94YzloTlFZNS9J?=
 =?utf-8?B?QnJ6MzhUSWRHcmFWbmRBNVNwUHNFZVZoZE5qQ2lhcVZIQkNQOVRGYThTYi96?=
 =?utf-8?B?ZUNHSXpxMXZGQ2pJaDB4TFFkQnZVOXlrbS85TEpvME9uWTBGWkZkL1hsSTVY?=
 =?utf-8?B?RUlSMVBPZjg3cWNML1loYzV5aVdMVlBtbVduSUtQRjhRdHRRRzN5Ym1yYTJa?=
 =?utf-8?B?Zmh3YXlOdU9CQWVjRzhXOGVicitKMXlyNWVjeTlydzJGOGdoZ2Y0bHRJWHFD?=
 =?utf-8?B?TTMrNVhKMENoWW1oNlZMNUxDdzRGWndzVzRlVlQvTzBHZFdJOG1BMldTZ3VD?=
 =?utf-8?B?R1VlVFlETmRERE1tMEYybVZ3c1gxOHhCYUZOcTFoL0sxRldTcG1QdHNUME9E?=
 =?utf-8?B?eFMxYzc5MHlNaC9hUWNtOWg0NW1WVE8yZTlTVzZrL1BtVytJWGVrSVc3VW1M?=
 =?utf-8?B?bzJGbFNnWGdYa2pwK0lialdXUVRxdTZBejdHelVKRUR0MDgvTFRKeTNQTWx6?=
 =?utf-8?B?NUV2aXEvMXY2UzlmTVV5UlRTdWZ0NUcrd3B6TTVWMmdCeDhHVXNkTTlSL21Y?=
 =?utf-8?B?eC96T21QMXB3M0JoaEhUSHdzL3FsMVJWVlovUmRuYzBlZUZmc0FBaXVqdGRX?=
 =?utf-8?B?L1dlM2piK1pIazlTRlJUb3RVVWt2eFpuV2Y3akZwR3hBWVVmY3JWTUl3Y1NR?=
 =?utf-8?B?WnBxQUx3bTVXeFdXV3padXgxck5BUHFyOCs4aFo2aHFqMFVZNWMrNlduVjRW?=
 =?utf-8?B?Z0tNb0luU1k3NXRGaU5jUVJhYk82NTVpZTlUNW9DR0ZudHN3Q1pMNVF0bkFq?=
 =?utf-8?B?OFFGVGRGZGk1bkxNeWE2T0V1RDRuc3AzWVlqM1kzOUpnT3hQaXJDbFhGYlZX?=
 =?utf-8?B?OWFBbXVMbW1YQTlMdUM4VlRZMWh0NXowNjE1MmsxR2g4K1MxTXFDeURad3BN?=
 =?utf-8?B?dHRzYTBaQmxDVEhzR3FXRW9UbnlheTNyUkg2MmxkUkxucXFYSVQ1cFNnRytO?=
 =?utf-8?B?RUtINUptb1VWckhPWjhYYXpvSW9CWTg3YjUwODYrYmlIemN3dnZFWjFxU3ZE?=
 =?utf-8?B?emlJVk82SWQyMEN3dGtKTmxRN2FGNnVOVFVZeXpXbDRmVlpVdEFWTU4zM2Vv?=
 =?utf-8?B?eTdpaWw4RG1WdTJ1Vy9BbURkMHNhMHNuY1diNkpYcWp1TGFlTFl2dWVpZ3pH?=
 =?utf-8?B?Ym4zdWtPTEVCcEhubzdtdmo0eHRhY0ZadWxqdDUwVWdtdENmblNNbUxzK1FF?=
 =?utf-8?B?Y1ptTmFQSlo5QjJzQWdFeGw0UVhNbnA1U2QyZzBRdTlIMkphc3ROTmsrYWJW?=
 =?utf-8?B?by9iYmpBemNoVjJRQ043UlJpNGNMcXh3cFd6c1dFRkV1NEpMNkNzdnd2a1Er?=
 =?utf-8?B?dENTVXVyL1ZwYWZJYXRURW1wM1E2TVdPcnZqSlhlSTkrS3FWTlBmeGlmbVZL?=
 =?utf-8?B?WHFuQ1NXM21XOWxQKzY0ZG9LeFE3N1VTa2dha3FIb09DK2xDSUpqaEdKRVo1?=
 =?utf-8?B?RHlmNTNiS1FUMEhrcmEyZ3p1RGFuR1pEYngydDYwd2RnOFdzY25hVVdaVXB5?=
 =?utf-8?B?S1ZVMEU5UG45N1FoenpHR0h3SjlQTTBheG5jbzREMTJaeWl5aU9BbHoySUFH?=
 =?utf-8?B?K3k1NHBmUTNZUTQ2dXhEdlBLZnpQN1hmVmd3YlovVmFPempIcVE4bDFDOURS?=
 =?utf-8?Q?lssBBrHrhbThsb1xzl1xNU7Jj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fa5e2e-7b7a-4b17-1c00-08dbd077c609
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 07:48:24.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HejUWvxX9pcLYCnup74lgCVMg4UgyD2hTk21F75w6Ul/RHpuNay/Jx7iP1p70HgC1Bf/NDS2mGkVO4i6qYsBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8563

On 13.10.2023 11:42, Juergen Gross wrote:
> Instead of being able to use normal spinlocks as recursive ones, too,
> make recursive spinlocks a special lock type.
> 
> This will make the spinlock structure smaller in production builds and
> add type-safety.
> 
> This allows to increase the maximum number of physical cpus from 8191
> to 65535 without increasing the size of the lock structure in production
> builds (the size of recursive spinlocks in debug builds will grow to
> 12 bytes due to that change).
> 
> Changes in V2:
> - addressed comments by Jan Beulich
> - lots of additional cleanups
> - reorganized complete series
> 
> Juergen Gross (13):
>   xen/spinlock: fix coding style issues
>   xen/spinlock: reduce lock profile ifdefs
>   xen/spinlock: make spinlock initializers more readable
>   xen/spinlock: introduce new type for recursive spinlocks
>   xen/spinlock: rename recursive lock functions
>   xen/spinlock: add rspin_[un]lock_irq[save|restore]()
>   xen/spinlock: make struct lock_profile rspinlock_t aware
>   xen/spinlock: add explicit non-recursive locking functions
>   xen/spinlock: add another function level
>   xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
>   xen/spinlock: split recursive spinlocks from normal ones
>   xen/spinlock: remove indirection through macros for spin_*() functions
>   xen/spinlock: support higher number of cpus

Before looking at patches 4 and onwards, I'd like us to settle on the future
of recursive locking in Xen, considering in particular Andrew's objections
to their use in the code base. If the plan was to eliminate them, I'd see
little point in reworking the infrastructure. I'd like to suggest that one
of us tries to remember to put this up as an agenda item for the next
Community Call. But of course the discussion can also happen right here; I
merely expect there might not be much of a reaction.

Jan

