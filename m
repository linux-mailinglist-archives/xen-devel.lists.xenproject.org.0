Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84EE56A789
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 18:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363075.593414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9U4x-0005kM-4O; Thu, 07 Jul 2022 16:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363075.593414; Thu, 07 Jul 2022 16:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9U4x-0005hq-1M; Thu, 07 Jul 2022 16:10:11 +0000
Received: by outflank-mailman (input) for mailman id 363075;
 Thu, 07 Jul 2022 16:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9U4v-0005hk-QS
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 16:10:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43ad54bf-fe0f-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 18:10:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6160.eurprd04.prod.outlook.com (2603:10a6:803:fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 16:10:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 16:10:02 +0000
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
X-Inumbo-ID: 43ad54bf-fe0f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju8xy0RaFU2it4hpw2PkzNtS7igfirSYZSypNMeZRpmrMfIEIYqKx2bpUHKjc9Dv43uZsd4oyoHz+RCbDgbKKtqYiEc7pz5qk7ZBOA96pYJbEe1x+IP1JqBAOu5Fq+QA4HvCt0/ELp2ULCUkgCBNpZFcnrAGv2GktmPtRC87QaMc/wswXRZR+4n0SEnuxjn8Gsbhra5NKdGlNv0orDH4yVNgAocl37+hBOk5f+rGj9cKgBHaZ6anEakgfUHEmTvSuQAU6lsgHt2SfOC5llSyXVZ7YJpkmWhPwDyb/8de4h6B5O+JEkNy6ielQh+/ZS83cBMeLhtDiDFozv2IXuWnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHdlAz9eLtojN7BtpV3/c6vn67r/TQTAApEvmtC9hRg=;
 b=VnLe6QndA2S2w+3Ue2loKmJWilJ8hSH8CIwwxT/0JghviBAhf8JrDCDtgshNfTtYYcF8RjCVclZ/xiKwkdZsfvyEPXEgre6iSMiBgQsWETzagT8bZfrSdkMzKJFiBcSJ9+iDf+pLrM62peVZKTDuQ87Mx3rtcvGCrXID+GymhR/CDPA0f7g3h3+7CUQ/ak0xYWYZb/mX2Tyor4X2H9v5lx0kScaoaC5GXWGInAG20DU41Wff2nc7vBaqLW+pT0Dy1n8bZPIEpCAA7nkNrnJgQOXgdpJmCu0bbdjALTycWUqTAZGH+st1B5kVSXXeOcFQDihFUezTyc2Gui2nzadnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHdlAz9eLtojN7BtpV3/c6vn67r/TQTAApEvmtC9hRg=;
 b=mDoVhAiDoYuCvIVp5xGNTRmPrlVYgKGpBBz8VpRfy/lZcCF45j4DqQE+ZGz7dD2nOjw2e46ns6zeS/nb/uTwV6vBA3XiKtEqIBkT9QM5lKPBLR/hqRW+L//8Zxk3OqWQUUd5dBfR4xLMOq6t8Crn1sSXjUrsjjuO0mHhXvSJW6UaUp+G3mvpxKOt55wNxcmtPNugiCrT/YYxAKiKFg01siZnJcVFOScTZGknpgRRhMM3zP8L35XUUVrYJ9M+zfj1OaX9bOrKiU7cknBX3OExpKNRyXUc95EgEImsWsDqHc5bCO/tVdhdduhDwui7vg7olXXaNb0J5Uf0v69rAKsQ5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11bc7bb6-d08b-acd6-7f5a-28b9f8c394ff@suse.com>
Date: Thu, 7 Jul 2022 18:10:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: ***PING***: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220324140139.5899-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220324140139.5899-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bc9c9bd-1a28-4851-9878-08da603325a3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6160:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQSwbsmjkmLPKqWqk8Ih7eREDYdQMdWlNoLBsSREAolUthAE5VNVUcnngQc4RplUtRTqL2Zh3BFvff838KMWFXzCoJGBqWHmEmKTI0k6Sw0y1ZNZc6PIPx0eDja9gU7f7mbzZPBA9MC+V8M3MjoWUTq+sOD+XZZUTU0tg4KkCfPIomC3glZ/8rKnRRuRjROGQTVCfsdboIPiXaAMscA0khyYnBllQLbYhrkZaz0AAtYx7XttXHmErxir0SXQpCXxCVnZeYE47u1iEk2TY6s/iiF5PfcwKZgu6DjgEOpcLo5QQ6K8F672I8lEAEx41QgJHH56BL3MBRctoOle5Lhp5JIvixxSH+jNYXQqtPzQTT+Xe1se+LImarKO2Fkg9BSNTuE5OfgqLTMLn4F8B+mUGTuyTPkP01mmL92A2CuaDmeUHMUkInjz/QRYt2NRLwu6+s+Rn0cSD8l7XJV3/m5I11/kVzg5zSnyPOV0NQhiy+BTeucge4ypnB7qq1SkLl/IeL/KTcNCcmngehMJxjWusvd5GkcYuRg6g0XOfGnTVHVBRMSKM8t1brCO0GQ5RWXsBStGd1ClT4jmv93Gb7gQo13VwHS7W4Bmzz9Etomq04z6QcfSfeMZk/0CcRcnj4VgqSYCrSKU3Kz3BQtMH+158FrhDVgtPBRERTxhT0CCsssyGqHswXr0deagyaqa2TfKmaL3nzgwbpOwL15IYWCLjeEHaKGZ4GcEJf8yp5L6n36dZ+qvSSvqp3McEQK3MucxzuL7u2zW57rOAm8njHjeGv5c/aUzYiZaxYCliakNLx0MliXzCXANL3ohFqC9Tpt1EFKSTUTv2wcR0j5P8t73JQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(39860400002)(376002)(346002)(31686004)(38100700002)(31696002)(54906003)(2906002)(6916009)(6506007)(316002)(41300700001)(86362001)(66946007)(53546011)(66556008)(186003)(66476007)(8676002)(4326008)(26005)(107886003)(36756003)(7416002)(5660300002)(6512007)(2616005)(8936002)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1BOVHU0N1F5dDQrRDJ2WUtLQ2l6RTI3QURRSUk1VTR0T0tDcngrY0ZTS3h0?=
 =?utf-8?B?QzRZRFUzeVZpd2pWNjVjazZDTGZLOWVIYjh1ME9Cb0p4RitoNnVjaTdWVGNI?=
 =?utf-8?B?UFdlQ2krRmc4Q1NqVmF0SjN5ck9FK09MeUhMdGhrRkIveHZBTTNjc0pGdm4w?=
 =?utf-8?B?aGlCOEFKN2Fvc0hRSWlSejVDZmU4Lys2ZUxJU3pFU20rRGl4WHBQczlITE42?=
 =?utf-8?B?T291YXdZVEpLUERUYlRadXVCZTRxdkcwOUdFdDExTERCanBPZUdHTGpia3li?=
 =?utf-8?B?elNhUjU1NU5KVVh2bUlPOC80M092WHUrY1V1M2M1ZUtISjE5R3JmSGFuc2p6?=
 =?utf-8?B?eU1nbEhLWVUrRFc0L2RMSGNIalorMDF4RUY1VFdzQmtVTGoxZ0g4NzdKYS9r?=
 =?utf-8?B?bTZUQkxBc2xxeFdEa0g4NVhPWGMwTmh1Q1RrcVBCTGdaZTBld2JjcitISWcw?=
 =?utf-8?B?aFNTYzRyamUvcGI1a25UNEx1K1dlM0p5bVFzMS9mUU5BZWV1cGlTREZJNmEy?=
 =?utf-8?B?YzJQRTR1YlduT2dzZ0RDOXNNd3VDaFNzVjVZcVIrM2dYWnF3VUY3cERBWjEr?=
 =?utf-8?B?QklaR0NrVDAxVWs0NVMweGt3NXRvNzdVYzRJS3cwZldaVmhxbGVxdkJURU5m?=
 =?utf-8?B?bGp4YTB3QWo3S25BWE5rTXRpZVZHb1hFL2NlN29pb1FBTDd1YWZ4elJZMkdR?=
 =?utf-8?B?NnplMWQxNjR4WExkUDdMWFN4YTlTRm9EZkE4WDJXVVZBYThMQXJvaGRyU3pF?=
 =?utf-8?B?OGt0YTZyWXlvbkxqMTdHSUEvcFBxSm1VRVNPa2JLdGUxWlI2TExZQktNamJY?=
 =?utf-8?B?MTg2dTh1SmUxSzRsU2xrb1c3VXQ3OWRkMzVUWkg2aTIzS000aytRdG8zTW1R?=
 =?utf-8?B?UkZVV3hrcmY5K2x0RHEvdFBUSVVqOEVoWnU4ZjlTZllRQnZOZWFCVUtFOUts?=
 =?utf-8?B?YVBTVVZwN1FCMU43cmRKdmJVZ05jTk5LR3htek8rOFhZSjl5UGY5ZFVKMW00?=
 =?utf-8?B?L3AwdmJ2aTc1ZlI4ZWdPb0pxZVNYbEE3Qk1JczRFZ1lKRHc4Zy9lMGF6U0V2?=
 =?utf-8?B?a2lKc3VvVkxOVnEwbVFMWHh6R21JNGZhUlRaRWVkQzlXdHBSYjNHVlMyQytI?=
 =?utf-8?B?YVRoYjNtQ3dVKzJXQTRiNllDV0N3bnhtaWFKcGxzTm5NMWQ0L2NWRnI3MHlF?=
 =?utf-8?B?S2F6OS9SLzB5NzF4blJvcGxZNHh3WXRtdHFsTE1YTnlEUGlKSkFxQ1VtWUdF?=
 =?utf-8?B?R2hxblUwSXVvbVB4NnBqTmxVTlFaUGxla0lVeE5iRzRsU1NtQXpjdnI2aEtG?=
 =?utf-8?B?VEU4azRGb3BBU01sZCtrWm1UamxkRlhvNjhRaWh6NDFNdVVwQjFzbFdiVkc4?=
 =?utf-8?B?QVpFU08yU0hWU1R2MEZIM1dqQUZkK0VYTFZyYURjV3ZodnlHQTVGZkR4ODF2?=
 =?utf-8?B?YlliOE5hMWs2SjJ5UnhTanE0SUVNU1pCS01JK1cwMjdEMmhEL2oxV3MzYTF4?=
 =?utf-8?B?UE41dzkwRmptMWg2MFFuRjNJQ3JVQXhnRnhNRDl4UGZBZDVOUHAvcWJpL3d5?=
 =?utf-8?B?eks4eVpTTHdqTFVoT2dZck1INzNzcTk3SklVRnJDdjhqNE1VQ3RPazdnQ3Za?=
 =?utf-8?B?RGxZMVc3K0RzblYwaUw5MnJqT3J4WVpieThadlpkNno4THNWWWdRVmFBUFlP?=
 =?utf-8?B?UVk1QlVXb2xUZEJwWSswaG8wcWQ0NDVhcCs0OFREelkzOE9saExMd2g4R3Yx?=
 =?utf-8?B?RkNDVy9qL3FOU3FsMFNqZ2k1MWh3YVI4d2RLcFNGd3ZYdk9EMWFUZVhEWEV3?=
 =?utf-8?B?UVhKNFU1VmFJSDAvMk52KzVmOXJscHk5ZU5RNW5ya09Kdm4rNjhHZFFTSm5m?=
 =?utf-8?B?emovVG9BRmM4WTRYR3ZTaWFMUUMrTzBQSERQRzZrRXNMSzVUcFh2bTA4bElZ?=
 =?utf-8?B?UFYzZ2pEbUphUmdrNVlvKy94d25pSzdwOEwwbkdJVnFoS0c2ZXJKV1N4Q2hw?=
 =?utf-8?B?ZGJlSTR2Z3Yvazh3ZHZ4SUpzQU5QZC90T282VXhnUnJkU3hSampQd1lPYldt?=
 =?utf-8?B?VVFhQy9zQU9RNytJVVBhUWIrVzhBU3lvZ1JsS3ZIRG1vbGZNN1FyazRQOHNX?=
 =?utf-8?Q?h4Tpapb46wynmKhAFDEWaljDh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc9c9bd-1a28-4851-9878-08da603325a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:10:01.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5VkrsRnBHeASxZCcZd6mkRqhxn+7qbW70WtQ2XWs4mCNaIILyzkYIai301j/RQQYVvas+4+OLcXhWEDz9UfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6160

Andrew,

On 24.03.2022 15:01, Juergen Gross wrote:
> Juergen Gross (9):
>   xen: move do_vcpu_op() to arch specific code
>   xen: harmonize return types of hypercall handlers
>   xen: don't include asm/hypercall.h from C sources
>   xen: include compat/platform.h from hypercall.h
>   xen: generate hypercall interface related code
>   xen: use generated prototypes for hypercall handlers
>   xen/x86: call hypercall handlers via generated macro
>   xen/arm: call hypercall handlers via generated macro
>   xen/x86: remove cf_check attribute from hypercall handlers

we've discussed the state of this on the Community Call today.
Unfortunately you weren't there. It was common consensus that we've
waited long enough here, so unless very good reasons (including a
timeline) appear very quickly, the plan is to commit the series
(with REST acks to stand in for the few small areas were acks are
still missing) early next week. Should performance issues really
turn out excessively bad, we can still consider reverting down the
road; I don't expect we would want to go that route though, and
rather make incremental adjustments as necessary.

Thanks for your understanding,
Jan

