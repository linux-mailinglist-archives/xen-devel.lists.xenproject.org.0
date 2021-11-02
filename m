Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0644312A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220340.381574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvHe-00053V-17; Tue, 02 Nov 2021 15:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220340.381574; Tue, 02 Nov 2021 15:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvHd-00050z-Td; Tue, 02 Nov 2021 15:01:05 +0000
Received: by outflank-mailman (input) for mailman id 220340;
 Tue, 02 Nov 2021 15:01:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhvHc-00050k-On
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:01:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 138f67ee-8913-4c2e-bbfa-c90b37f6a2c5;
 Tue, 02 Nov 2021 15:01:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-WUQ8GZJ5MYG4zeVjyazWLg-1; Tue, 02 Nov 2021 16:01:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 15:01:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:01:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0065.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 15:00:59 +0000
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
X-Inumbo-ID: 138f67ee-8913-4c2e-bbfa-c90b37f6a2c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635865262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLVG0DZzDQ0YMaC5fWsZ1L8TPeh5nFejUmjXOzwdKxE=;
	b=fVEiyf0oMOIi9LrxCJkvb/z6ezehHTP48DhwnoaC6vzMZI5IqxMJkmJiK6+6qUnWbaX3tN
	Hznfn+ikUdQb+piguVO5GTZX00Je1BmnxMTfciffKm1JRA1c6UrKdNMmWzlstSq5RCABWb
	WKITsEcP46jfKAyQeVgGYNAmO0Cy814=
X-MC-Unique: WUQ8GZJ5MYG4zeVjyazWLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQAFrul9lJeQGAa1zb311hjo+5nEaftr7HItlyxMppygG8Hp3PB2GT7JfAjv+owj6skqgCiqcrAOqBIdDfKA8hlZPKF0ieLA0JWrL9CeqLLWz67Ew7ghOxTfK6dQqFa27XQs8ee6jNDgROaSOH6UkQ2mCUqyo4clZTNzPnWUippLAEuLyMuzfC50XWxHiLsMBC9mMbQIkEgxb4Ku6uM3P1YN2GZGPFImq/Qlv6qY9LtuCBsuflMeEIbfKmlPzYwBzYcil5FbEP7zD02SoEQFYqKAXUNSyruR92AHArWo/jH5aOAE2ykmrLkHmH5ZuaQCp0fHjhBYzK/Bc5uDBel7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLVG0DZzDQ0YMaC5fWsZ1L8TPeh5nFejUmjXOzwdKxE=;
 b=K8/c9NqGwMyEYKzqiRQHryFCWnFCqSgRnJFfqXQ3B/K0W4vC0aibHSyWIsMk5npwoEO5IfKsdHrNjVYzEVYuhDevMRr47JKivM6oRD1HnC9CZtAk/bjHDtqzzEVoXaToS7UZdJ5XdWzZWCV6rB7qiTy84LC6lHKTrIfp6KfeGeVlim24lcs/1sK2pTS+m7QUesB6maj+AIUwwxU9D0Vl1V09NBU+ePA1ICUuFtd03JMSfNuU0neMnjY7rxJW0tdvXJd+wooGXaHjNgrLKu7ZHUfcuP9w4sAKaYt9GLBvpPIStgWXb1nce7p2cNpD/CitN4r7pdrqf7cpTtnhxAAviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a717cbc-fbf0-d3b6-e05b-4c80f587f37a@suse.com>
Date: Tue, 2 Nov 2021 16:00:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 2/7] crypto/vmac: Simplify code with byteswap.h
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634897942.git.lin.liu@citrix.com>
 <97aca2e39ff1eefdab1e0b3440929958e4b99892.1634897942.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <97aca2e39ff1eefdab1e0b3440929958e4b99892.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0065.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e23df9-902c-4156-ad93-08d99e1194e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46058B139E9E9F17A3BAE137B38B9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fojQgv4RJeolzEUuhtEFWXXavSahThA54CCwfYguc9V/zTFAsePGZV84N/iua67aRJ0pL60zYLD4+Pj8bTIVXLbLfIFnnRgJlmxBdWLgwUtAFzGpYXyyji0jDE+cXDlRtpLkMTIYAsBA6dw2FYagIpe/OIo6vLBu2/mmq+ow1XrfoXqyfCgoM8eU2l5pr8xJUuH7dC638Ul5lsU1DVUYzIaBTrmVZ6QiD3gFqHf/q1VGucApbq7cFyHrz7giLPY282dl6vbXieuQjOhiBMaRjpgdewvAIlFEtqdwIx22hS8AxnVmwyGqVFQM2kvyAOZvTs71I7JMrgUbQpfwuvJtwS2C0SfFQvlfdthptgb34Xo9bphLIS2Liz6W1TbIJYyMRvPQPO+ZdQSDRYz0+SGXhHoZW0iXYhcBDzD6BmR5Vc0/ZE4H0vFdNzkKe6kzy4VzZ6Q6eR5Nvh6KmjrQOB4Jx2VEsfJwhPkFOku8Csf/rvH7b/S3iH0m2OenVBHKcwx3Db8gO/nCMNuuKyeBUYqCeJ0vpYsmAfoNCR6uJQ78KRrcX4SRK9LompMIwGSWEoNW27yaBTPn7n7lYTS0fx0M+4ViLiV5ZZbBQQDMzCNGG8aHBPaRC2daLQ6m0oJ7zNlCeuQeR9Dzw/9rsDjexHcc6eTwBZKAx1Xj5KP2Q07XIcM97pkR9ju7BIpmpAkE8VBZmLciaW6R+Tr993bIiMQFUqhbAMzis1wvS3EnZ6CXB7LmvuWg8BqjQO0QIvMPlqAI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(16576012)(86362001)(316002)(66556008)(31686004)(8676002)(36756003)(558084003)(54906003)(6486002)(31696002)(2906002)(66476007)(508600001)(53546011)(66946007)(8936002)(6916009)(4326008)(38100700002)(186003)(956004)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxtRWJMK1lwM2RBbTJBT2JXdWkvZnhLa1JsdUtZYUpyendyamlrL3ZMVEE0?=
 =?utf-8?B?SGZJT3VvK3lPaFJnZG9HM0ZrS2o4cDdxY1V2MU9RTG9HVlF0VXo4VHVkSmVR?=
 =?utf-8?B?NFUwRWVDdTNIK3hJWi9aaHJSSGk4eWExY1ZpTWlKUUlseTZBTUJsRjdRaW9O?=
 =?utf-8?B?VDM5eVBJRWxhK0dzbTdqY2kzR0xKQjNNZWoyc2lnTUh5QVc2L0x0NitEaS9i?=
 =?utf-8?B?cURnbTl4VTlQK0gzRjE1WW9EbDhHalE1dWl2Z3owamoxNm9NUEw2K2NZRTdW?=
 =?utf-8?B?MVJzQlZ4QW1YNDFTNGNQUUJzdmhFMFJNOEJNQzZTUnJvSlJUNmJ5UHhDWFYx?=
 =?utf-8?B?c0h5dGtMZkZWaERQSlNrWGVxMHdkS1JIMjI1S1dnRkJ0N3hqYUNaSXFGOWNC?=
 =?utf-8?B?d1UzTHhXYUIyaHcwaThmUmRVcmdoVy9Md0ZPd1NtbTdsZWpwUEJsWm5lZCtt?=
 =?utf-8?B?V1ZHUWdGNmNUdWV4dGZFVjZWeURLNi9uRW5jMm5XcjFiWlFmVHVqQXR2emQ0?=
 =?utf-8?B?TVJXT2k2WjRtbGVNWUJSNitUVlc1MFZ6UkNobGROM2pTUHZRUEd6ODhsMmdM?=
 =?utf-8?B?Z0oyUVJlTk1Yd0ppWkcweWF1b2drcXFHNFBHdUptTlk3SkJyd3N1REkvRzB0?=
 =?utf-8?B?T09sS245ck9CRmlWdFlOWmsyTWxyb2R3clhITjBndXBUZWJVNU9uNDh5UHFB?=
 =?utf-8?B?YTFkRW5kOXo2L3RoYnVCWE1FS2VtK29HVCt1a0d0aGpERVFlUFcvdkhzN28w?=
 =?utf-8?B?RUx4Y0IveHo2aGNtNWlOV2E5L0x4RzBjV01wZS9pTDM1TEMwSCtUeFNRTlhU?=
 =?utf-8?B?ZjNIeDBvTDBKbGNFZWJLZDgvOWRzV3l5OFVmdHRwQ3NJcVZWTU0rNExadnFV?=
 =?utf-8?B?TWZObW9DTm9OVFVGakxIRVFESE90clNJRm5kR29sVTdkcEowbjd2TENsdWg5?=
 =?utf-8?B?U3F6alJuL3IrNUVHTE41cmdhQTdXVXN5RExxMENaeVV3UkxNRnJCTXQ2L1ZY?=
 =?utf-8?B?dXdPTlE4aXVCQnRVSGFhVHBaR04xMVNleHF0VUZJdHlkZStmSUpYRHdEQk8v?=
 =?utf-8?B?ZkdGY3pLcW5JZHhBekkxaFNBR1k4QzZnakRFcGVEUUE4TVZLL1k0bms4MnQ3?=
 =?utf-8?B?N0NuaEY2OTVISkJuRUtGa09KOWt6M25pblk5T05GZUZkTWdHbHptb2ExSnFL?=
 =?utf-8?B?b1FrbE4yOUZNaHBkdmIyZzAwbC9jd3JaUGdSbjFXTmNNdjBKOU5SWE52cmxo?=
 =?utf-8?B?aWJnVFZIOG1DN0NsQ20yZ0JVQXl3TUEvdlk0QzZXNWNUeElINUNQV0JSN0J1?=
 =?utf-8?B?dFJBTlhsRCtjTks0U1VoTUs4aVRZUWgwY29KS2paYUsvWTc4WUZrSXpXOWVJ?=
 =?utf-8?B?QytJWERYNUszMUR6cWZmMDFPYUtkNkVOT1BETzVjaW14UEZCbmlFbFBkUHdR?=
 =?utf-8?B?ZmZrTGVWNGNXYUgxSXMvR09CN2VSREVpSE52ckxRaFdYMFlwTGdpRmZ2QVRV?=
 =?utf-8?B?eUllaDhNR1RCbDEwejlabGo2RGVPTExpdnI5aFRaMnJpM1pWWjdFWWN4bzhX?=
 =?utf-8?B?ZXlUV1VLQndycHpxOGh4WnlIVUFoTVFqR2pDQTR5Y01CcEJ0NnZFUHRGM1Qx?=
 =?utf-8?B?UEFUdW5hVDBWbzhaTWdST0xXSGdWS01IWUtzRURCSDlhMnZsVU90QU9NajYy?=
 =?utf-8?B?U2Z0ZkpEQmRUU1pUVmtiL053U1BKMG5rS3AyVkhES0g4cEdYYVNzUVFzN1NL?=
 =?utf-8?B?N3M3dWovb1pCQld5NloxMjR6OGZYKzNFLzFmVzZ0ZEEwNVM0NW5rZW45a2h6?=
 =?utf-8?B?SXZtMTU5QVRXakJnaDk4VmppRjhoOGw2VXFTMGZXTUVtck5Pa0YrQ3NkNmh2?=
 =?utf-8?B?YlhQYzdwUkVITDFOdlBqb3QyaHc3Z3FJYUsxWkFJK0g4ckVKb2pXYXQ5K3ZU?=
 =?utf-8?B?b2VibjhveUZlL3VqMWVLRHBSLzcvbENXQXd2aXU3UmdtS0Z0K3ZQOXhiYSt0?=
 =?utf-8?B?UGsxRGVQNHIwblY0OTk5d1JlTi9CQnR3ZVl0RUxiM3B1TUordGo1TThNaTV4?=
 =?utf-8?B?Y1A2NWNIVjE0d2NNOFF5anFLbHFHRGlWSURualZKMHB2UlNZNStTeTFFWkI5?=
 =?utf-8?B?aXI4eVM2MVdBWTUvNVowUjVOdm5oYzVNZzNpaXR1ZFhjbU9HNGdiR1ZyQ1Vi?=
 =?utf-8?Q?sLDOcRt68cjG5/W0Cou2Dl8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e23df9-902c-4156-ad93-08d99e1194e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:01:00.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pADbkwLy1SvKzKjUiY87cb5Q9eON501vu2kb2CCoCH+k5K7/Z0ro7mV0n/mmN6FdNtG9QCvIDSCKZLIgovxBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 22.10.2021 12:47, Lin Liu wrote:
> This file has its own implementation of swap bytes. Clean up
> the code with xen/byteswap.h.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


