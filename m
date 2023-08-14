Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF977B294
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583251.913350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS6J-0003vI-0k; Mon, 14 Aug 2023 07:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583251.913350; Mon, 14 Aug 2023 07:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS6I-0003tC-TY; Mon, 14 Aug 2023 07:34:54 +0000
Received: by outflank-mailman (input) for mailman id 583251;
 Mon, 14 Aug 2023 07:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVS6H-0003t6-4g
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:34:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d9cd083-3a75-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:34:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:34:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:34:49 +0000
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
X-Inumbo-ID: 0d9cd083-3a75-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFk7TZrZLGswX4kw/90dKwzHlcn3LZ0ZYe58sCfM5wQCeEQ4CciILMS+479d/+a0mBzCtu1x6Autmm/xOnbrb+RqE3M1W0hKvbQAifbNYC5gvInl6Lz1TYNnLuKi1S9yOjkb9L+GqMtYCzqWPrsQxXuHTGMKrZVD5+cmKGR1yvmel9fQ0XwLSQ4PyKyjGFy0KDvVC2PLSczUNVoEFBLvsUFTN9+/vvriSxx0CibWVacEBtloGCf75O/no2eHn7jQyPK7Nr5vfTOGX8dYXRyQHBwWLXiWFpoeDqHQ3+IbaLpv6vzgo/x7Dg2fyjvzY/xpjQYWHx+ZjPLtJkYekGJkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z6P//UiTBhtwDUnc5TffLPCjQMKeAqWHF8qvDO3eTg=;
 b=k73ukvwAJvU2FXtC3/fIlFwdQ7dDbagh4ujs/77TBTxo6efnKlsYh/r9KbscpM90radOO5pW8+wuj3iZna+TDY/ydyHYlKRC81xKaOkzRtDHfOxfQc8JCW7TOu6CVERghZF3xFOMLlVpH98RI6NxC3bZY0Js1kmTp6FLPDDd3vrd8whxkkmm1H62IDhbLQQ2M2Q9gv5uckozsRKMOtH2i85TNu65zGV8GuG4BC9VC6+4QmkWhGCAGG9b9DpFQBaagm5qGmTbPGnwStSJuih7qac6PCH/VlDMDsLvS309qwk6epR4iBBkewaTE2V8Cko1D7FWrejGwDjPUG+ZOow8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z6P//UiTBhtwDUnc5TffLPCjQMKeAqWHF8qvDO3eTg=;
 b=5V29A5rs29s+Nrz+3Ca0pdWTKYbd3znLTHXY/IAftAP3KIk+bJTZ2C+/nu+WZV3bjjAL4z9OgEt2Z7QsUI3DrTCCqealxmrMuuU7MrJ8eiA+CvsnYPLAvhqwWwlefQAAb16KUlY2C+sdlUTA6iabC+aboYZnfbW7ytZGrekhI/AKMkxWt6StcbFrRGjZUKEr+MRExQ57/gwT41GGcwXeF0BaTcwwb2tAFFE5aK8JWxae47LDXeT1oQ3tI/JBfkgI2Ocu++Fqq98SuaGIED4fDn17DXK7qA4nW7Pmb4GInTUhaJw4243iafHEfWcaP0l+cW6oI2v0EGwiv3TRr5ycNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90e71c00-befb-7821-a392-711903dd9e9d@suse.com>
Date: Mon, 14 Aug 2023 09:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86/hpet: make variable 'per_cpu__cpu_bc_channel'
 static
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <5e13888db7b69cee21e5367ce8750fbdc1e22d5c.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111554360.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308111554360.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 119d3233-f57d-4884-96ad-08db9c98f0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVsT1iOogpbcmrJ3E9YZpg09uBvOuJ6Fpuy5a89GvlnRSryC+H5QUCIQGMHCq11LdfTmkfs5tipukLJPd+DG0+4Scb+uSGdY7zRhJxQ3rPUKTkQFx+dStGsDdfv9CUFhGP1E6ggF3QYsrnsHTYXMXIgFNjOFwmunbsBDjDiv7QO5c4WImvKli9gd+j4RB0pcu8XesSOYrA1yF4CmcZvVMhONkRttmRaYSgzGCMNi3HVm7bUUj5exJ9wsu+SDgqBouKMRdJ+fDt38obYeDdxki+jX0OoXHzl6bMU8Px+zfd9vXbEqufTDeAw+harTkqminohF3lU/pLrRWUJ0XNgZeECOz00JH5XnZltThuyAyK6oZOErOSJT/Cvg0V+2jAXCOxLuxOXPuD+JwVY6jJuXHxaGMXkSZy1n6UOa6fwiRFaYkDpLT6fOzlay4J6BDEq24v/jq6qTsKlPcCN0fFTFhN++lG5BZb6JHZAijrKbG+rwcr0KO2t96tCYdt0gxEweQ7hOuS198RN4oo0MtYHawimsa5WpZoUGntR6NmHwZvsN1zoab8w/0IFdmveUc08FAyeLN72BW/t9+cAquFGNommWp2SSQcYnQqbPxR80h/7bCsR/CRJVuQONu90U4walxCrxao51q7dhxctW9f/0ZxFyqUGuS8ewXCcE7K3TXhRUs9KAq1t6fgBunza4SnuO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(186006)(1800799006)(36756003)(5660300002)(2906002)(31696002)(86362001)(4744005)(31686004)(66556008)(6916009)(4326008)(316002)(66946007)(66476007)(38100700002)(41300700001)(26005)(2616005)(6512007)(53546011)(6486002)(6506007)(8676002)(8936002)(6666004)(478600001)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzdKTmQvZHBUdWVRZTBiMlVDOU5wWi93RVJEMzJTQ1djMlZWZkRPRmlIaU1x?=
 =?utf-8?B?K2VNQU51eE5qRmE1bk1jTHlZOGgwNGxYcDRHRmllcmc2NUExNHdvMlZnVCty?=
 =?utf-8?B?ckVkV0ZLdkFGVkQrNUdDUW1sVVl5MGNlRm4vbEF3Z2Y0Z0VoZjA4RUVvSzl5?=
 =?utf-8?B?cEtzaE1YVDllTXY4anJIRE04YU1LYXUxV0N4a2pNMUZIMWNaQUNtdkJBdzNF?=
 =?utf-8?B?QVFiUkFCVDlBeFF1ODhZdjV6dEpNdzNaUG1mNVRBcWF3TExnV0UwTEp1SUV5?=
 =?utf-8?B?YUZqWnYwR3hHR0JaY0RtMzBiNVRDemhTM09ZK24xY1UybUxDT1h3UGhwZ1Vk?=
 =?utf-8?B?MWJ0K2xsTGxvYk5oUHB3ZDZHdGVGVmgyRnh5akxldWsrbko0UEcwTitaMHRB?=
 =?utf-8?B?eUZyb1loL1czb1N4dHpzUEk0dUtFSER1enpEL0xFOUo0by9ZNDhqTFZndVI3?=
 =?utf-8?B?SHNhM3RXZFJtN09uTEhtcnVaSTlVNzZNSkhZd1B5UlMxY1ZvQm5hcnNRWDFD?=
 =?utf-8?B?VXVqVVJMalc3T0hibVhYeDJ4eHV0SUVoRDBKZGovK0Q3alJLc2RIRDFnbW1R?=
 =?utf-8?B?UXNLVlhNRmxCYXlVMkxQWFRlUm5MbkNBNTZ3bDJJMXVlWmlybzVldTllQlZ2?=
 =?utf-8?B?OXUrWkYyUDlJUXhOYUJ5V0V0Zm5qemRNY3FFQ0s1NG5iMFNwS2xyRFhxRTRy?=
 =?utf-8?B?N0ZwT0VCc2EzSVgwYXpWN21UaFZhR2dibVdRcUw1blkzTThNWWJxU1dQM0lm?=
 =?utf-8?B?RlBQajBpTVhpa3hpYzM0NDNZMDh2MFJYOGJFUDBxMkxkRFVPOTh6QnN0Nkhj?=
 =?utf-8?B?WVFZM3JlTmNtb293UVFyYkdvd2RVWEgwUUF6MVlXRnRBVjZOdnlwcTk3aHF1?=
 =?utf-8?B?OHo4WE15alJBUnlRWjlQZ0ZKOHY1RzhYNUZ1RVZ0SmJzbWRlUXlwOTYzeVVE?=
 =?utf-8?B?em9sREpHMTBZTkl5d09XY2hybzBXdmFwNkd2MTNLamNBbkxOOFhTSklEWlcw?=
 =?utf-8?B?TC9EeXc4YnczbGFuNXZHSzlXbWVyMExDbUtVWnFKaTVSQ3lla1VrQTJOMWNw?=
 =?utf-8?B?Vy9rcmUwZDdBUFl4RndKdkZTN1ZuWkoyRW42bW1ZdFF2eHVIUnpFSi9xUXYv?=
 =?utf-8?B?bGdXRThNSmdLMFRDL1Zud3NyK2prY1doVDVhQW1RdWtwVlBSMS9YYTJkM0tx?=
 =?utf-8?B?NmJCcFRIa1JWWThQUU9iV3hHOXV4bzEvYjBrdURFSllOOW1OeHhqVDFPdnBV?=
 =?utf-8?B?MmxnaXJkTFZ6WHREM0ZNamJsZEw3REc2VFo1VDMvcmZ5b3NlTUlrNVdFbjNN?=
 =?utf-8?B?eGJER2RyczB3Q3pmSHZ6RXc2bmhOQzNvM3lRTUI2WlZOTmhjK2ZLMEdVSHBz?=
 =?utf-8?B?YU9Wb2pHNEMyQTdkNSsrNjJZNmVUSW9mSG9JM2Z0NS9EZ21sOFkzZDVCSUsx?=
 =?utf-8?B?TEhTVWdWa3A5d3lqdnVjMXVEa1RTNXdVOTdpdmU2THdzR0Jma25CQzF3dE55?=
 =?utf-8?B?R3ppaFJSQ1l3ZmlVdVFac1prd2lNWjRIWFNLVVVtRG4waFl5YmdQb2d4NHhx?=
 =?utf-8?B?Ym1IVXdqUkxyd3ZENjY1ZDhhTXMxeWpDNC92dU9abTRoNDJBdmlKMGorK3I2?=
 =?utf-8?B?MHQ5ajNFRXZIQm0yckdNcjhaNTlkTE9VSUxUQVNpUWRkMUd0eVMzOVZzcW5m?=
 =?utf-8?B?RzIzeUdQbXNaM05lRHlDTmZZT09hY0l1UnJJTWVFOHJPa0FSdXFhVS8vNGNI?=
 =?utf-8?B?SUhId3NINDRKL2hxU25ScVVzdHppSU43cTZXMCtIS1R2ZXJzWjJIYjdIMmQ0?=
 =?utf-8?B?Wms2QW5OeGpHdTVHRUxQbjErTUk4R3JTOUtNSThMdXFRQzVNZzRkSmRYNWpa?=
 =?utf-8?B?WjVkZmVyVFhBTUFxd2dxZ1ZLb0VXbWVsYm94MG9iL1BCaHNUb1FGZjZHZXk2?=
 =?utf-8?B?V2llRWZGTDNtb2lqM1IxdGxuZVlvSFlNTUpydWw5UlVzcWV4eEZubWYzSStV?=
 =?utf-8?B?bVNDcnZseXVTbVVKWGRYcTVxa0pDY0JITTNSdXZydDhvd1A2Nms4NDBKbVI4?=
 =?utf-8?B?VjZQSDI3TFZibE9vMTZnRzVndGUvNnIxWkFvT3VIOWJZbk9sMzdPLzB2M1h6?=
 =?utf-8?Q?+uxh++lw4FVHBf+2CGMmmNSEq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119d3233-f57d-4884-96ad-08db9c98f0db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:34:49.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMOkcFjg4nXoL2KQl/gY25LnoZR8k36jomhZfKdnW6+WVSp1xEp77KJgTw+VuSBHewT/it/SWBIUGXS2LliHSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

On 12.08.2023 00:54, Stefano Stabellini wrote:
> On Fri, 11 Aug 2023, Nicola Vetrini wrote:
>> The variable is only ever used inside the file where it's
>> defined, therefore it can have static storage. This also
>> resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
>> of a declaration prior to the definition.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



