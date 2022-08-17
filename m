Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1E596B9C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 10:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388745.625489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEla-0003Hu-04; Wed, 17 Aug 2022 08:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388745.625489; Wed, 17 Aug 2022 08:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOElZ-0003G7-TZ; Wed, 17 Aug 2022 08:51:09 +0000
Received: by outflank-mailman (input) for mailman id 388745;
 Wed, 17 Aug 2022 08:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOElX-0003G1-UX
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 08:51:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf77b30-1e09-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 10:51:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4664.eurprd04.prod.outlook.com (2603:10a6:20b:25::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Wed, 17 Aug
 2022 08:51:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 08:51:04 +0000
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
X-Inumbo-ID: baf77b30-1e09-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d72Yq7h4qjaBJdMpWSfKbt+k4c5TxQV29KU+mrFFTz1cxWGoaP2siKCLB/iDSN5LnuoQ54vUk7/zLHLhyOx/eeJRU56BbFqKVWCk5s6spmq+r1MPpNo8282zs6qnaNBnINIWRnVDtp7wfjQZ4mMKu2FNOF6ruvlxTHKkzwYmxq7Wp/gJHPLylayJw6137PEfy3QV5iLPlF9JiB3Dp/iWTVFiIu/1pawWTC9JoHdU5qxa5tr5YNuPvUxy+DCivn+2/ey8QoeR7kiglWciBO9vWrjvdQ98V53d40cePq68IXZFYi1gtxs/DpQ5qAZhZlzpP9N4b6mvacqmHnQI2V9Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KNIHRTwuVsXDeNf0hizZ0ZQ5aVUULu1bWpEcMl9E1M=;
 b=cGK193rKmJ/TLnXz7ARjXKU1Zxw3tSnrJmMG9rfzAcT+VmGpZKGiWjj+87AdOpwC1Pry5IAdEBvybsl0L7JMChxWREP///YvGCma2Yd5ezQI/oMLr9nFxPqls+8iHWingf6OxYXP/HRz64zQqI97Z8evmnYwZQ+Yq8qDSxOJ8ewvjsxsdJYnq0ZT/E5qPw7DOqvooYZVwIQm+69oXrx/xcICMdgn6cQ9zTfLPoIj/kFodqv6xpphGuEs5+EbTyFrybG3wWUT4CnwhJoTtP6rX0iHK8y7oRIA1ZXX+h7cUgjBuutp+GvwftoHrSNptwYSrK1DVvE/EnMQ11FloOVzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KNIHRTwuVsXDeNf0hizZ0ZQ5aVUULu1bWpEcMl9E1M=;
 b=GjdMLAFyo86jQ+7Gy7tI95n2VXavQgbj1WDEfCsXbAt98RYxEATHI93fte9M4mgJV8LNPD/+FBUMyhT6jGpG4bAQy3TZSlhq9/bBCmzXelfOH6c2Fepv8k4MCHsQ0X/PxMQM5oLjtDOEw27nDb5svPGzC8rlc5kjbixQP0OyVoGiL0PZ/71fyNnD85MaM6i5kVLVGFxjwOKJdclEQh9HLTwSpDqqb3mlYQmdYENWFT83tQkDx/qq+DldOv71iXVCSPaSC7Ma8T/8ieOniPxv2Js3Wxuq1XGV7dspalJ/RyIbAmp6pC1W5qiDSph1Nq3rJJYZBAVC/LyVHGb8gY/klg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41292732-588e-10b8-7264-a9f329910523@suse.com>
Date: Wed, 17 Aug 2022 10:51:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 6/9] xen: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816023658.3551936-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce902ff9-1096-4314-2216-08da802d9deb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4664:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I0gOk4KhgYZHFJ4S4EfqsUVIW3K95EIqVYPWKxq/2b9dSZBWnt3Zewwqe3Ylju04vl7RnBwdU1HCL5uJu+GQB8xcnFQ1erDtodRcWFiDzB8Pnw9fNfGFydJp0HrH639DGE3IKV2LLzUu97BSCXoDza7o/zQyqROtHEZ8wx29RwjhPk3GOfAO13Oa6vTARNaARZ9IvLl0x8LqfblgAIh2tWHGU3+DoNC3ukm8tfJgoBzehURSWbxdm4DB6tr8XLz4pyt8lQvxEAutdhFzuAuV5ZPo7akB2m/QG7U0opDF0+NuBJ/UtjRGJZ3S13w7EUDoV6VvoxZjGY3vR8q/wV9wbqHracInkllnsFaHqfFqwAj3w1PKlr8YXUsbJrpNyN7apIkfqNYZCWHUpbX/mUXQBanE0CF/OiXOAvi3VnnS4e/t0b+QblECMM1r69gyYxyBZpidYWqq2Man1h+E0N61HWDCMZuRsSA8fGbIQLHlxydt2VzD/+lR8t4RETZK5zxlMS3SiUjfYGyKqmgMbgmxd1p3RpTRxXOCzsj2ppEWrYhNXPNJwrvqOqkBe1INl5ueDq2Qmay8i42ea/DPhBCVAsMlzTxJc5pSxsa4TVZwtldPVv/MahOye3H4F7jqNW+rW5pu5BYd/rIy0aat2RYC1q1gtXXG4BmK8+QD3B/qPaJDrqxAMpwlUZAD2BpUracuFevKJjtBBDtSgh259pFy4VK0WakL91LG6fmZN3w6UjSEdfPl8ExIhWx5+Or69g1Yp5arRa9gjkV00k8CYhrRxdJymQUKUC0Ijgl6Ru9YHEkoYYoJvLbBabsQrthHrDyNqMqBkL4v/0SwezV5HVPR8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(366004)(136003)(39860400002)(53546011)(8936002)(2616005)(6512007)(2906002)(6506007)(5660300002)(4744005)(478600001)(26005)(41300700001)(31696002)(186003)(86362001)(38100700002)(54906003)(6916009)(31686004)(66476007)(66556008)(66946007)(4326008)(316002)(36756003)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHlOTHoxWGpJdGVCaGVGOXRUSkpYRFd3UXRScU51M2ZJSlJ3dWNVUmdiczJ5?=
 =?utf-8?B?NXlOaXkyTXVrTG1CUmEzV1NZK2xoS3dvdEpyN1FNSFpqTk1JYjg3UU1zNGh6?=
 =?utf-8?B?ODFuY1ZId0luSnRXZW9pMENOdUowdTZ2YUhTQktsQzd5QWdBTmpBdXRiSjB2?=
 =?utf-8?B?Y2U4ZmMzY1U4RmJUSlVYMGNqL1BGeU9SemVpMFlZVmNDWDVSUVYxdXY4dVdD?=
 =?utf-8?B?NU45QzB3M3NoTUFPeGRFSmRpSVljODA1bG5uOWJiamZhM2QzbkZMaUZmQ0NB?=
 =?utf-8?B?eEZrS3BYa1QyZjhsdWVYeUd2THFYZUx0ZjFTYUhxR2NjTjB4eWFEQmJZTnJV?=
 =?utf-8?B?cVRuTFNKVlJzWVByKy9GU3o2bFIwa1U0NmsvUlFpS0dpNXEzRVJyMU0vdUlK?=
 =?utf-8?B?VXQ2WitEVUZOMmVyVFV3bzB0dk9ONFVhd09tOTZPeGowUnArd3dCa2MvL2Zk?=
 =?utf-8?B?QVJabXBiSVo3a3BMTG0vZ01WOXl0YThIMVM2NFo2TnJkV0xBcGpvdUFtRDRo?=
 =?utf-8?B?QnowNGs0RHViWUtSSjFYWk5ZTGFPaVpLd0FsU1piQU1NMk90VUZ4QlAwd0lh?=
 =?utf-8?B?UmptU1RjY1lsSFRVSm9mbDN5bDhBY282V01SeFcvcXZpbk0yVjR1cFh2VTZB?=
 =?utf-8?B?N2FBdzZNUUNHVERpNk5mMVRRMTErekwySjdocHFmM0x6SFZUUTZVRzlneHV3?=
 =?utf-8?B?Q3IzVlBmUlRGV2xiUEc1RzNJcGZRdHdDUEJhL0JvSlY1SWlvUUwyeEZFdUox?=
 =?utf-8?B?OWhMaTFnNlY0MTgzRTE5dFYxMnFnekRHM21KWEdKODhGTkVEQ3BXcXh0cmQ3?=
 =?utf-8?B?OE00cmlqZnpNd1BLT080VUZ4Q2owelB4Y0VzRlg3Y3lnR1Y1QkNZOVRjdnlZ?=
 =?utf-8?B?UklTZEdvS1greFhGbkdkTnNnREN1REpwWnBzcnBIUVl5TGhoTzdSZTV4VWEx?=
 =?utf-8?B?VFZQalIwVzh5L01lNUtOYzQ4bEZKQkhhWVdlYkh1am54WGtwd3Zta0xNUTlV?=
 =?utf-8?B?eDhGc3p6Mk1MU0w4cVd1algyemdhM1Y5eHlzd05RS1RLTEVwakU1NHMwZTN2?=
 =?utf-8?B?TDJJdjlteFk1d0NGcFZBaUR2MTc5UDRXcC9iNkJ3cTFMNnJZbHZ1ZGNBSG9F?=
 =?utf-8?B?cDhadkNYUmg0c1cxamR1MlNFWjhwUVJuTFVuK1RVS1dBa1JCeWFHQ3B4TUto?=
 =?utf-8?B?SUhMWEsyMmN1N2Rhelg3RjRRc3hjMFllSkxhRXFhRGhqdTFuUVFTU3lZR2E5?=
 =?utf-8?B?a2JuNlcvN1ExSWgzSG9qbThtdWhyS1B3OU1Cd2ZUVlN6UDVUY2d5bmRmY1d1?=
 =?utf-8?B?bEtxV2lRaFNCNmUxc0UvYWV2cndrSEZZajdvOTNzdFRqeXZHWFZvYTg1b0gw?=
 =?utf-8?B?QUVvb25nWEpsdDRoSmxKdENGOWluMjRpWUoxcE9HUEwvT0JLQ2lvNzhyUWVp?=
 =?utf-8?B?VFRsSzRSQnF5R29GdG83eWNnYzZNSlh1cDU2MlJOZkJRcU11V1ZlUU1mZm84?=
 =?utf-8?B?MURrck9PRFhXSDQ3ZzVhVUhVSSt1U2Nvb1BoOGl2SzdyZ243bmtVYWMrdU9x?=
 =?utf-8?B?U2JRTlVjMlVpV014Nk5XeXpkY0szRzFlTnkzSWh0NTNMaVNxTGtOYThScHFn?=
 =?utf-8?B?S2d0TG5nSklyeEtORWNWWGcxWDNqUXJPRGJNL3hQb283K0lNNkFnMGRHWGY1?=
 =?utf-8?B?WFN3TkdablpacnRIcDQwL1ViNTFTSlNSS2RzeFhUTnNvb0x6aTRVMXlwQmFr?=
 =?utf-8?B?K3VGbjBlZUE2cWxCUlU5QitYSWZjRng3cWJxU29JSjh6c1YzMHcwbk5WN1Jp?=
 =?utf-8?B?KzN2cU1rNDdTUmpGWFdqSzJVMnlzS2NyQ3E1b1V0aFpVd285K0prNzdwTHFj?=
 =?utf-8?B?dU9KSmU2OXRhZWU0Y2FLMjdDbi9xdjZiS3NDK0M2Yk1GWjV3T1dtYzdlMXcv?=
 =?utf-8?B?VWpaa3BQbkNvUWo5UWp0b05RdFpwWGw1QVlBbkFXSGZpZ2laSFNKZEphai9u?=
 =?utf-8?B?WEpCcGdRdUIzUmpYN0V5Rk1pM3dtRHNBMHQ5cXNmUFVFVHR1bjR0dFUrUHNL?=
 =?utf-8?B?dm5tdWNCTGpyNCtQT1p0VEhhWlNJVjFHaHQvYm1INXB5N0xicUg5Vm9obDNW?=
 =?utf-8?Q?QcGHL8H/9G2yuEaZTWfntlwt4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce902ff9-1096-4314-2216-08da802d9deb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:51:03.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8IMv/fy/MC34h/dT4ziFYJBn+zGtLxtUo6oJfKv2p2dsztzp+N1q0hUYMB9HIIP31tjtIW3N0FQkxjGI69Acg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4664

On 16.08.2022 04:36, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory back to the heap allocator. And it will be a problem if domain
> is static.
> 
> Pages as guest RAM for static domain shall be reserved to only this domain
> and not be used for any other purposes, so they shall never go back to heap
> allocator.
> 
> This commit puts reserved pages on the new list resv_page_list only after
> having taken them off the "normal" list, when the last ref dropped.

The last part of this sentence (which afaict was backwards anyway) is
now stale and should be removed. Then ...

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


