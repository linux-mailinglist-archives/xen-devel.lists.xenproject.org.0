Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A1764FDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570980.893682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOxLU-0002OW-Eg; Thu, 27 Jul 2023 09:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570980.893682; Thu, 27 Jul 2023 09:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOxLU-0002LG-Bs; Thu, 27 Jul 2023 09:31:44 +0000
Received: by outflank-mailman (input) for mailman id 570980;
 Thu, 27 Jul 2023 09:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOxLS-0002LA-T6
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:31:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64b413c2-2c60-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 11:31:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 09:31:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 09:31:38 +0000
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
X-Inumbo-ID: 64b413c2-2c60-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6TBHZgiXLOvHuKoWpFQnAdBTaoP7F22FT6o83HrA3GgKv/FVNt9SEnJVpNi3CXvgPfXfQTetepJeyMcG51yRYWKzujrPpiQuk4hdghJQF4RQXFRMNq6wprBtNVHmu7ynrB69XagC5QvYymVbqXyBmDS1QkhxI2qhcfjOSE2KLDnKkqtyVkNFesTl50T3YXFSJczbFVnHd30GMLC170nFEjpYGebq7AvAdB3c9tKcm83Z4XfVUn2Gl3TGnhz2WygX/q1xfaGYG5www0jeBwePf8MlOQIlROTv37imvW3QnDwYFW2zuLfL2AKu54e9cYi4m8r2fC47iMvp0rIR4gCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLpJFLAgX5XwxIGAjxrlSA+u5Xi6+nr7t2qpdXlKHyA=;
 b=fRUByzQzOJjXVUhqd/5oAbB9mbVIN+Q7YskiBXYi1dcfkWlvPrbdNiDyIVbkfGGx8od+eOIvbw0Itd1HyxLMT4+3UhSp/0LYuJri6PjTe9wUlfxRr65gMjHy/wLtj7ouEXyg5zRdQwQz9ZBzM3Ua5jyWXRCMthCMhjxTR6xz5iRYBYckmZjlk/mEvFuSJKfwbaq5aoPiPMvaW66TwWWWzxP3kgLKqbVMTe0xmW+J4SQDcvHzWQhXSfqdzLi4K5IK6GVUQj3gkNFK2cUnBx02VjK62RvuDlEXc4+9XdNZtZue+vKA/TfD/tRAf5ln/Z2YL4Er/PZAIeDZFWvCVfLaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLpJFLAgX5XwxIGAjxrlSA+u5Xi6+nr7t2qpdXlKHyA=;
 b=QaOOAuksE78UG/dJRi9Wnqh77YIZ4DGoc/JNIndBUj/xsQ3PrDg3meFe6l4pqSr4aKOPQa88YP2G+cV6Iqzhn8ZGYIqKesTCYaVXUTmTS30Aq6tgp3KUx4u3zvvQ8SFNZHi3q4mpQajWffoUcvHuPB3xbXasJm8mMyVHTzveylzsyxZU5T98wgt/9zDvTQijUqAhA/soidBV4q23qmH93VOKAuSiMkfds/DUPlNPpx9sdvxN8Z7CNfXuEAwPEBmNy07bxYapTXqJfLcpy2wvBk9831GKMY+khc5MH3q/oE+gzQTXFfO54ELz89bq3FanLEY2nDO+6FxQ5HVKCRDAaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bd3384a-f59b-455a-f6e8-6f170e554ded@suse.com>
Date: Thu, 27 Jul 2023 11:31:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2 4/5] build: evaluate XEN_BUILD_* and XEN_DOMAIN on
 first use
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-5-anthony.perard@citrix.com>
 <edc3f2b5-8722-7f11-f759-b87d71a840ef@suse.com>
 <b74752d6-54b2-4dd1-88a9-c23ceb014e56@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b74752d6-54b2-4dd1-88a9-c23ceb014e56@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aff0ea8-e7ee-4230-be42-08db8e84471c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	myJFZgKsMBJQ9v5/Ame8L2s0sqtfjN/TsynoiYOav+nYIPmDhxrls3Kq98fzKkSQzDTzmjhjVS98gf0x9VclDT+7atc/2jp8PdTPvOP3vClFCFymYw5GhZWQnuv1T3p7q1dhTl2aRpA4d3Mx4po4gPNnbJo4Q4ct+jH5sUByCm8XRYZwosTTBowoGEEO5dyIZT3bGHYaSXFTB/V4hvUS4DbiIvjtsbhP/1NA1iGkYNQMOigo8ivct+CF8OaO3P+lHKSzQQjK8iviHJKEUdvgMzOmZv6SM8ScGbPBvLxCqzXOCUFFFmU7gwCSFawFPRR0Z6L5HW6P0cUxrdOTKT4JjfLxLH0rDbV2F9Tvy1snaD1Y8xn6LvXt/nHNDAk7Wl1Qu5gpqKfDHSFhjLC1wUXqIDi3SXRxCfB1wKP31fF4PEJ4/w6mQVlzQk1FaFhc6ArTTs6WmSZjP7BcBm7P6VwVupxP9yMOzU5w1adSsVOvk40QqXVx82vt342VIT/logjXKFdiPsuVXsZM1jhQRQ9F6+Y+HXbqP75rT3HkCCtvPPLA8Mk1230DYysRqeB1ARdqRACyXyIbly+228t77le6v+8+OUf++ryhBiCjIveSi1hTHO04inDHB1kkPAp85dSL6dkNKRfGFzYVzx8+w3Fwdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2906002)(316002)(8936002)(8676002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(6486002)(6666004)(54906003)(478600001)(26005)(6506007)(53546011)(186003)(31686004)(2616005)(66946007)(66556008)(38100700002)(6512007)(66476007)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkQxZEcwV0NOT3pSTi9paitmZDNObXpEbjIxdi9GNU9GM3dTQ3l4dnJVWnQx?=
 =?utf-8?B?L1hlaUkxSGd2bE5YVmdpbTNSQlhXc3g4QW9ZMDRIVHBseWJPd0p3SG5qTUh6?=
 =?utf-8?B?b1ZEWGs0TWVOWDg3SEszdWJKREE3QUlLMnFOcVJMSysvYThsZmU1a0M4SmJz?=
 =?utf-8?B?cld1WENwU1I3V2lXaysrVFhUd3M5YmEwUWtpQi9CcXplb3ZBRGFIaHM1VVRK?=
 =?utf-8?B?WEx4M2trcTJUSzhCaURZOEpNQ2tEaitpTFlSNDd5cWpCL0hrK3YyR0pZbHI5?=
 =?utf-8?B?ckYwUUd6SkcxUlk5WTZoaGNvZitjMWNtZG9SMnI3YlRiaUJ5Y0xRcUtHY3FN?=
 =?utf-8?B?ZTJwVU55S3ptVWppeExUSmx6MWErcUNMbmRGUVNGZzBiUEVtVVptUjBFU0VH?=
 =?utf-8?B?ZFJXSW5oM05NRWVxWGRxRWFHdkQ3K0NQSWx4cUpCWkI5V1RlWVppSGRkU1B1?=
 =?utf-8?B?Zk5HNkE5QmZ2V1ZPd3k1SmxMcU1jSDQ2S29leTRMOWwwS1VQTDBHRzFsc0N0?=
 =?utf-8?B?YmRWS2w5S1FicHBPeE9ZL3NqanRnT1labXBWV0F0R2plTXBBMGRVTm5GZnRr?=
 =?utf-8?B?MGtkajJkelZKa21UMmdvcFZnNVczSXN1dW9LdmZ2Z0Q2MDc3bnlMa3k3R2ta?=
 =?utf-8?B?TkoyL3pQajBBWmNKMUsvV3ZtVnVNd3RwRkJhVEFNSXRweW1LelU2TTZzaXhK?=
 =?utf-8?B?ZytyRVJGREdWRnhPWHFwcC9pYlEwK0kvVWFSTkJEaGRocVljR0Fqd3ZyaFph?=
 =?utf-8?B?SG9YM29TSWgxcGN2RzZrcnJvSUhoWmNnb081QnRQSERRMW0vdG1zOGlpeUl1?=
 =?utf-8?B?WmRSdHJubUM2R0p2eW9jUWY0L09BR01hQng4a3JJdEpuVkVjTVJCN3htOFZW?=
 =?utf-8?B?enIrT28wZWR6b3pRUnR2NkRtcFFjMmJUZWpNRnlyKytvSzE1MFcvejFVV3FH?=
 =?utf-8?B?Sk9meWVNNUZSWU9lQXZyVUU1b210bS80bEVjNkw2T29vVGZ5Ky9tSW9HNmtr?=
 =?utf-8?B?Myt5YmlLS2NlbFhiS2IzNEtrSWMvbFpPWnJYdklnSGNSL05RL3VzV3ltVHll?=
 =?utf-8?B?OTZwUy9qUHJQT1lvelhRcjIxZGlMSUlBd09sUXQ1aTdzakRiMmE1TEtXeVpC?=
 =?utf-8?B?YzhWdmlBQVFHRzJaNGUzYVVZLyt6TVZ5MXZLRk5QNjhCWHlNRHJvRm13blVs?=
 =?utf-8?B?cGFEN2k5QjFKQjM5WVozd1BrcEVXa0Z3Z1Z4NVR6TlNKOEtlNThDT0UxMHFH?=
 =?utf-8?B?Nk1TVXAxRDZwRlNMUW5PR2tDZlM5K1RpMEpwUUZMME8zQ2oxRkNHUGRZdHlL?=
 =?utf-8?B?eENXZFIwVFpQdGNVcXovNk5LY1JnZUI2WnlSZFV1VExkN2tiZTVHVk9Kdllu?=
 =?utf-8?B?eXFzcE9uVVgyVll2V2w4SnFSWUdzektMcGhCU3MxWUlPL05FK1g3cktFWFF1?=
 =?utf-8?B?eVhINm9TR1pMTGVBcnZhRGg3Tms0L1lITTFEdS94QzRBMmhrelk4VEE2eEpv?=
 =?utf-8?B?d3o2Nk14bENNZTVDQmpicDYwc2NPem1pTENMeGkzMjRYQWVmNFdnNGYrOElN?=
 =?utf-8?B?RnpSaDZyT3E1Q1psOXlPM0s3dUh6YWpTUWI1ZktKSHZsRGdzdldudlhCaDlk?=
 =?utf-8?B?TGNmVVZtTXlvYjV0U3k2YVNSbUtSaU0xcE8vZTM3dlJUazNZS1pNWTFhSTRp?=
 =?utf-8?B?S0ZtcmJYVlFvcW9wbmY3OGc3S1VDN3dqOVUxWDh5UmVRRi9lb2RUK1hCcWov?=
 =?utf-8?B?aWZxV0dsRHQ3TlVxRzZ4b0RJM0hEakxmTW55cVBibWV0WHpJanFsbXJzdkxm?=
 =?utf-8?B?WUlRd0FRQTloTk1kSjlFaWhnV09SQnIwWDd2aXkwWm1IYkNuZzFwcUtGamF6?=
 =?utf-8?B?M2Z4R0Nab3kzMVgrbVl5MEV0aTRQREdiVE1FTzBUTm5ySjBhWGpmWnpKZGZt?=
 =?utf-8?B?bU1ieTIyTlc4b09yYzlMRjdTS1NtQ1dwbTFYcDZieFR1aW5rSFZ1Zk9HSnN6?=
 =?utf-8?B?N29zUmVzdGhQUWNxRFpiRUNzNmVIUTdMN2pMS2FHRzN5YTlST2VQa0lBSnR0?=
 =?utf-8?B?NGw2Wk52YXVsVkEyT0JaZFB2c1dJZkg5Q01CVy9NRFZDSUpXcXlQQW84MC9s?=
 =?utf-8?Q?/P85qKZvHAzGb/p0Qz+rczW3a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aff0ea8-e7ee-4230-be42-08db8e84471c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 09:31:38.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYHjNG4fisoyxtUyi3+6F28bKDWYwg9oyS0UzhF9RXR3yoNSHndWlWOJPTgJDxW5bJfEvA2Ies2GTkU9dNm4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9594

On 27.07.2023 11:15, Anthony PERARD wrote:
> On Fri, Jun 23, 2023 at 10:07:02AM +0200, Jan Beulich wrote:
>> On 22.06.2023 17:30, Anthony PERARD wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -11,10 +11,10 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>>>  -include xen-version
>>>  
>>>  export XEN_WHOAMI	?= $(USER)
>>> -export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
>>> -export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
>>> -export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
>>> -export XEN_BUILD_HOST	?= $(shell hostname)
>>> +export XEN_DOMAIN	?= $(eval XEN_DOMAIN := $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown])))$(XEN_DOMAIN)
>>> +export XEN_BUILD_DATE	?= $(eval XEN_BUILD_DATE := $(shell LC_ALL=C date))$(XEN_BUILD_DATE)
>>> +export XEN_BUILD_TIME	?= $(eval XEN_BUILD_TIME := $(shell LC_ALL=C date +%T))$(XEN_BUILD_TIME)
>>> +export XEN_BUILD_HOST	?= $(eval XEN_BUILD_HOST := $(shell hostname))$(XEN_BUILD_HOST)
>>
>> Interesting approach. It looks like it should be independent of make's
>> internal workings, but I still wonder: Is this documented somewhere,
>> so we won't be caught by surprise of it not working anymore because of
>> some change to make's internals?
> 
> So, this is a makefile trick that I've seen on someone's blog post.
> 
> But I tried to find evidence in the GNU make manual if variable expansion is
> expected to work like that, and I can't. So I can imagine one day make
> doing expansion of variable in parallel, or were the result of the eval
> would happen only on the next line. So I don't know if this approach is
> always going to work.
> 
> Maybe we could go for a safer alternative:
> 
> Simply replacing ?= by something actually documented in the manual, and
> then replacing = by := .
> 
>     ifeq ($(origin XEN_BUILD_DATE), undefined)
>     export XEN_BUILD_DATE := $(shell LC_ALL=C date)
>     endif
> 
> An alternative, with a macro could be:
> 
>     set-shell-if-undef = $(if $(filter undefined,$(origin $(1))),$(eval $(1) := $(shell $(2))))
> 
>     $(call set-shell-if-undef,XEN_BUILD_DATE,LC_ALL=C date)
>     export XEN_BUILD_DATE
> 
> But this kind of hide that a shell command is been called. But having
> $(shell) as parameter of call $(call) mean the shell command is always
> called even when unneeded.
> 
> But then, with the macro, I'm not sure where to put it, to be able to
> use it here and in Config.mk for the next patch, another file in
> xen.git/config/*.mk ?
> 
> Should I replace all the eval with "ifeq (); endif" ?

I think that would be best (and I prefer that form anyway for being more
clear as to what it does).

Jan

