Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B97B1B97
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609547.948666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlphi-000494-DD; Thu, 28 Sep 2023 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609547.948666; Thu, 28 Sep 2023 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlphi-00046H-AN; Thu, 28 Sep 2023 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 609547;
 Thu, 28 Sep 2023 12:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlphg-00043T-N1
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:01:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b66c7f39-5df6-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 14:01:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9703.eurprd04.prod.outlook.com (2603:10a6:10:302::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 12:01:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 12:01:04 +0000
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
X-Inumbo-ID: b66c7f39-5df6-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGW4DafNN8JIXKrP2szhRg4u1q8rUhUiTG1teNPh/zMD/VMfmfMpBOr/gqMwxAaVh3ob6KHRAW97XvQCxhlNkuu1pSRg8TyAnevIGmypJD4cuihlK4J9NDoJVo35s2O/rb2nce3QXmK2sNLTwjmK10LTH2HWcdDk8XviteWu2pGN4rjYxvRkq0CxyZW2drjLNgDDTj+rrV3ESHoo2kl+cTLqlI4aU6lp+hSHwEFJ0eJ561HOes8rYEflXwZ2jv0vrskAKbfdwGpgvPi+9XCTHvtzP1IPwSTu32RBpnuFYoCDoJZBLUpdmMjkm0/oNNYDxS++pVYJmNmQUo+4XZfNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zyyKID/KslGTjHmp0B6uVL1Gi7ynLQi6C0qkbW50DQ=;
 b=VrO0GeG6qaKR2dRHNVZJk9eLtzD0aOZMByn21ma5OtoSJud3NhDXHhcWjhWzlDBh1r7whdYAazDdV5fw+XQcIJuKgocrYnNdrXpHAauR8v63m77RbcQOMNUWcyOwER6QnTjkzQBEqBYW6oIfVV7XSh9pc0aiMp1ykIxHWzlu08czRgBOEA7UIfBq1zNMcKaRsmdV8rlVVJ72VApV+WvJGmhVmNn+y7mUI/EgKJQ8ddP3RjzYl78XnsYVq5OV5ruKfCkUJRugFcieJqFV+ZP4w4tXY1EjDbzZyM3ArlJFFGO+5hzpRXX80m2MY8cbLSgHnTxVPC2vVa/O3OV6eRabFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zyyKID/KslGTjHmp0B6uVL1Gi7ynLQi6C0qkbW50DQ=;
 b=x1N/yPKl2VOhNJwaGWoPCOw+wI1iBz9z2ftXEzt9jqIUGNegXz811htYPUY/a+CPOV4YdVG4lv3YN3tcigVh+qTenYiXx5UwqNbUqhSHUv0AjebmLVztCYiMTIYOIr7bYz7ejCZD4vE6ToXZsNDBSanhXQXHZ3qnJsn/RT221Cr3dOAqHeYVQpRq2FUQaR9mhb6ZntGxn+kBg6rzPjHKeLQUqyrO8fiJ5kwIU5RdXChNgNNsPV7D1TCc+d19QpWSSl3JUixnxo0Ad70L+ABXyPxNTBb0qPQGnZVvyDlM9oDCuWMt8wqzA7b5kFFpVOdkKr24DlH7y332cpYK6Wkp4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50bfcf5e-d232-08e7-ec8b-38682359035d@suse.com>
Date: Thu, 28 Sep 2023 14:01:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v6 2/7] x86/hvm: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
 <40606e79-65b4-f344-1d4f-19c8946a67e2@suse.com>
 <0d75770b-cb95-434b-b3fe-32431c2e1b15@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0d75770b-cb95-434b-b3fe-32431c2e1b15@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd2afd1-0cdc-4265-1ae6-08dbc01a96fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y5XxZUU/8JG1triy7VJw5u/E4MgMOLu3nMatC3LQVegf76jzHx3Jti+9TG2BDBrXtA0Qxw8Sz/B1o3RbHg0JmjlAfgXXyO/jCmxyB5oFE0KNptfdXKTDp+ZAbCz/G5WBmInxF8K1ZZqdZEoqct370YCK9OBlWVnPvlEx4ovQXiNcSS2gyFQKPa2Y6akBQoe99JuMnEqg2OHN5OvxeQwEL7whiF/GlNz04Sxt1IAVmjYbmzXRqAQe+JL+xOdsz1YeVUWbSfUcQ+rp1TSHkvoJAixhoe15Ikj7BRBWMwiJYAwLCUY3x4c2hzSMAOGkq/ocE21FODpKWZJql2Np17+8rDNCFjR8bBdDpbZeJmmnXVufHyDTgTqHEtP0WUFkuCd3yIKS1B6FSnh6YvqU0ChYFYlgyD2cLWCsDXMjgCAU+tGD9u/3yDr9NnecfHfQbWqNggiRPokzakvsbHW5QLO9DFbqjLNl5V9xMCKHOkLmIBnc55z1YwZPta5xw8RTDpCAbh1FTpghfyrHIDgHOhnjXdrRWXoN1ZiN+LRChSkywDXKor7K4oDoHn9YvUjEcAbCqTZ6PvDDt+PnrKXOo9D/kSDYCHGEOqRUXRB1xxzEXJM4zE42v4zeXCyzQlJuxfvqfc1ch92a3iDNrXPZ85Gx5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(316002)(31696002)(86362001)(26005)(2616005)(41300700001)(8936002)(6666004)(4326008)(2906002)(66556008)(6916009)(36756003)(5660300002)(478600001)(66946007)(54906003)(66476007)(38100700002)(53546011)(6512007)(8676002)(6506007)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHlEcjlsa0JZZlJicngxeGxSWk9Ua21mZWRqakUrODM3Lzk1ZHhEWFI2T3k1?=
 =?utf-8?B?SzhieXdkN1Zsb09UMkxHYWs0LzRSVzJTc2RkU0NINmp4VTNNU0lRTmRVV3Jj?=
 =?utf-8?B?SDZGT2VlRHZCYUhxMlNvY0VnTXdxT05EcGNUdG9Kb21rYkpXYzUvMnh0SlBi?=
 =?utf-8?B?Uk1kTHBpeVhTNjFuS3Rpb0UrUzdtWDJ2WUVwaHQ1N0xGcWoxaURBWHgwTDBB?=
 =?utf-8?B?Z0N3Ylk4aXhBUjcyVkxDSjVVSER0STNpWWh0N0lmd2pJWlBCRXpPdWhjQWF4?=
 =?utf-8?B?d2RVdmZwOTFvTzhrbksvUWtwQzZMZWlhOVBJQUF6Z2JGVkliS2VSWjR4YVJt?=
 =?utf-8?B?NGRWNTh5NTlPRGNaaFNBUEhIZEdBWDNmd2UrMytNbHZrNzd3V2dlZ0RSMGlR?=
 =?utf-8?B?UWFRRW9mQWFheWtWOGUvbUZFY3RiNnB2SXNWN1pyeEE3cldJODZyUzdHeVZr?=
 =?utf-8?B?SG1aQkZ2T3AwWW91eG1rNytjcU9pRzlvTFFzR0xsRnN2WFdWWStoKzFSSlQ0?=
 =?utf-8?B?VzNjUnJhblNubFZJOTRMQWNwZFRCNFNaYjZBRTJ0bXVuamVrSFJBdkRtdlJG?=
 =?utf-8?B?emp0Y2dEQ2FDSVZja0oxZGx1ZmZEUlFBd3JBRDNwRGRjckppOWorVmxaYnM2?=
 =?utf-8?B?ZEFwVkRQN1pub2hvK3ZVb0loR1dZTk9Vejk4SU92Tis0SEZqWkRHaE81YXBR?=
 =?utf-8?B?RTJKSzRuWURLOTFKaDV6U3hkTk05a1UwWkNBSWViZ1M5NlRXUkZoQmNMczlN?=
 =?utf-8?B?ODBpdEphNk5aTXdMSmZ3bnE2VjkyTENVQzU2bFF5NWZ2UThXRUQweWJkR2Nx?=
 =?utf-8?B?MHJFTzNMYVIrLytzT2ZEYW1PS292SVBvajRmVG9QZjZQK1dKNHI4RUozV0xL?=
 =?utf-8?B?bjFxUG1PZ0U5bEF3cHRGRjFYSHZHc0tNeDh0YkwwWjJ0QnJIT1h2dDZBaHpG?=
 =?utf-8?B?VlFVL3E3dmlMblRQUEhLRUx0UjRXcTExWTZVbzRJSjkva0VkenBBNEJwSzNL?=
 =?utf-8?B?Zmp5anM3dCtZa1FVYTkyYk5qaHVvWERDd3ZKQi9SWU8vMzRhY3VxM3FDOFFQ?=
 =?utf-8?B?Z3pDMTBoVk1HelZRb056SVEwMXZuME04Wng1WkR0QWxxandXTGR6TlhwSXB2?=
 =?utf-8?B?ejdPWVRKa0lId3Vrano1S243SWNpUFpGQXBRZGgxVVBHSUJENTgySnJKUnhR?=
 =?utf-8?B?bFc2THFudXM5c0RzT2NUNXpaRUNBWkpCNGMzNnRpVEMxZXhpQnprbStqVCtS?=
 =?utf-8?B?WFRseGhxajR5OE5ieXFtWThjUXZyd3M4OXBnd0VSazFMTXA1T1ZFbmVPMzAz?=
 =?utf-8?B?ZHlNWGJsWXd0VlJiVDdXdU9uOUxIVHR0cVozNDFQdzMxM2lCREVlSkEwR2Fi?=
 =?utf-8?B?cTJWZVNPL2hOcVhQOU9QbUpJNHlyZEpoUE90STZqWEh5cTRUaVczN0xYcDlN?=
 =?utf-8?B?REI5Wks4b01IeTk5TzlmV2ZNS1ZaZzhYTHE5WlgwT3VhL1ZmdWliRUJmY2J1?=
 =?utf-8?B?WndaVXJiWFByNnNhUHd4amZxSGN1MVJwSVFnc1lKTUVaTkl5S2hPTHplWjdo?=
 =?utf-8?B?UUJ6NTBRRkJtWFlKSzl0L1g3R3VhK1NFWHdab2Q4aVhVRmQ2bVJCeWZ2d2h3?=
 =?utf-8?B?K05QWVVZaGxSMnJYLzB4QU9vL0xLMEhseUM0T0ZPMm1MNUtrVnZnTjdjeFl5?=
 =?utf-8?B?YVZJK0dpemZmY2lEN09qNVdEeUUwZWx5Lyt3WnpVRGFyMlAwQlBjWCtYcUt3?=
 =?utf-8?B?UCt2Z0NiUEs5YUpYQTB3Y0ZXN2J6YTl5RmRCS0JRblkxbTliY2t3NGRYa2Fn?=
 =?utf-8?B?Q1dKRFhUcFA4WXd6YmZlYkg3MFRmbytSRDBsUUUyajBWKzg1bWdUTGFpbm1E?=
 =?utf-8?B?dXRFeFVDRTJqaFRrVFhzZTAxT005VVJDMEFBSldZKzFQcEh2T256dCtJcXBY?=
 =?utf-8?B?WGc2dUVwYTR1bmJ6aGkvREVMMk5uRVh3TzFPSzMvSlM4TUZRV3NUc1ZrREVW?=
 =?utf-8?B?UGpNYnFDb0FLYnIyNnV2eXZNR3J3YUZ5RUdOK3o0V28ycEZLRHBkSFNvaG1q?=
 =?utf-8?B?dDhNYjlEMXhPYVNvVFdlNkxuMml3VDZXZ3VWbGlNM0RUYzFxdUExdnFRRERn?=
 =?utf-8?Q?GORMKsGg4ZD6NqUaT276phx3E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd2afd1-0cdc-4265-1ae6-08dbc01a96fe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 12:01:03.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruZTWTgJJNE4qU2uSDohy0yXPslblxQahPcUlBiRxJdAKWW3cd+CPz74326NSykOKVJqSgNcFdQovhktC3k+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9703

On 28.09.2023 13:11, Simone Ballarin wrote:
> On 13/09/23 11:44, Jan Beulich wrote:
>> On 12.09.2023 17:38, Simone Ballarin wrote:
>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>>> headline states:
>>> "A 'u' or 'U' suffix shall be applied to all integer constants
>>> that are represented in an unsigned type".
>>>
>>> Add the 'U' suffix to integers literals with unsigned type.
>>>
>>> For the sake of uniformity, the following change is made:
>>> - add 'U' suffixes to 'mask16' in 'stdvga.c'
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> Comparing with v5 - are the two tags in the correct order? And is there
>> a From: Gianluca missing now? Apart from that I'm now okay with the
>> changes presented here.
> 
> The commit is new and it has been obtained splitting a previous commit 
> made by Luparini. Currently Luparini is not working on that, for this 
> reason I'm the author of the new commit.
> 
> I thought that the first signed-off tag should be the commit author, 
> this is the reason why I've changed the order.

If this patch is a the result of splitting an earlier larger one, then
the question still is who made the (initial part of the) changes that
are now in here. If it was all you, then I don't see why there's a 2nd
SoB. If part came from Gianluca's earlier work, then imo the first SoB
still ought to be his.

Jan

