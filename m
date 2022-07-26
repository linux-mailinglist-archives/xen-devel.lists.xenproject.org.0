Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE785812BB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 14:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375178.607500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJIp-0000EQ-FK; Tue, 26 Jul 2022 12:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375178.607500; Tue, 26 Jul 2022 12:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJIp-0000Bb-Bp; Tue, 26 Jul 2022 12:04:43 +0000
Received: by outflank-mailman (input) for mailman id 375178;
 Tue, 26 Jul 2022 12:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGJIo-0000BV-Dr
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 12:04:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50084.outbound.protection.outlook.com [40.107.5.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2107afcf-0cdb-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 14:04:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 12:04:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 12:04:39 +0000
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
X-Inumbo-ID: 2107afcf-0cdb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYzJBAcFA/HTJiXov+tVZnxaEi/htdED5dU3wZpTIA7jOX7stV63DFMUFCKAHn6ZNgpIiIu4153ANKY8n5/R31rsYVOrruz5Runv0QiVyzkdkskC1ISPcWlAg1rpRB3nHSZiSW5wKCuOS8/Vtvov2KkTDFuDjSFCatsxE+MIi9Ix5fnzU8n1XSLPUiTnfyhuhCX+m10vtKGCaKCUEtvl7dGLLuMboTQGpHpAMQo9aVwznRIm6tGr2R1IK+SBaL9RZJBlfqKcUfqWrc9TUTVMOmnSf5Mx10501feN4LAYPyZls5ssVYqx47wWD9Vxa4ysZsQqh5ofWLeNs9Cmm8153Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXh9gKNtud1ZrN19d0DgmDdiCO/IOG4r03VDESj3UDM=;
 b=W5Oc4+dHDDdrsdWpcUoTqOgRy9+cnxxi6kO0Gzn23NKIcmz/ZDu+miR/IaMJykrDAHSlZ+RO2PKePzO03NlOOUfgjVFBN3xw3p0dpaO6kaUar/CsvuqVon2oe2N/0K93cGGfxagw2p0nXJ03bw6qtDo/r7J2AlkkSt386Dh8WxVBP9G2ghAQ4rfOFHxjsGV2f/2w8PqVzCSnbdOozsaY43OGcOLJlaidwBEYYjrsyZoG87JmpaY3EqcsJdElCXLrzweyIBVxJL+Fj1hs6qi/c7c/pKR662NAvlUwug/cn2FnqvUxNur6omUwo0QQEXjppdPz/V3S1AxRzwE2QZcnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXh9gKNtud1ZrN19d0DgmDdiCO/IOG4r03VDESj3UDM=;
 b=mVLxA9k/e5eZWiehguLUO8wG9E2VYQtHmW9e1ZcGwifWC8yKJ4pA3VFo4Kslwyag99sjlE5foDxCqUQwJVx4CQZVQdhLuHUvAN2ufDzgtj1cxPW1lu8T+l7ShrUkJwA7RPDt3+vRT3DptvyJcbz3hrC4/UpL3ADfA/hwbwEnodt1T6+Inc57TUBlzoXQvIDYS2mDqgyYVNvZRs/dCU0REzcwBjiSNVfMx//NuBJaIrtY7JRW9EEygpw1XfnN26LVPnQl1yJJjmbrvvauUy8AnduvLILZGfIWkV4sTmYZDd5NIb46mwMtX5t0ZQ3bE5bwc9JsK0IPZMl/pzCmBPXISg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0f441bd-7ed9-b32a-6517-9c08b6c01abc@suse.com>
Date: Tue, 26 Jul 2022 14:04:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/pv: Inject #GP for implicit grant unmaps
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220725175013.893-1-andrew.cooper3@citrix.com>
 <b4f1ee8c-d83f-d56f-e72e-d1e0fd4b2228@suse.com>
 <c7a8a191-18af-23c1-c57b-1de3f1187384@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c7a8a191-18af-23c1-c57b-1de3f1187384@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 002e771c-bb69-44f4-7559-08da6eff0415
X-MS-TrafficTypeDiagnostic: PAXPR04MB8093:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jQEejHLaAT33LJVnHFgi18FX99hs55aDMxwTn+VmzsgQQxeNcCmsLiLGucu2brN2GvYTfETmQl1l8doRfcQYIQzTO0AicTbIYqtHS2kGvcqTnr4+DM6zk14pyZGrP1HNMso5LhkWlGYx8zYo9/8TWraZtgL1m8c/FvOaYvKEFodjY17lN9oHcy97MAA6lG1DarcuRDi/PXaLsZW2TIcskG6eX0AbvzfDdfUVnqB5yrljMQ/RjgcvxRKLX8A+G7qgLl63o/No+/E/IczqotG2NVreOoZr79tVEY32MJIDDGodsyb8qbrZmak1kgVmE4OWqQtxdnbLfI5q/J2CV9ECe7RXIi2OBLlEk/uBKJeb28s1cvKTQ7+9LQsEc2E3iKc7kuZNb/WeZMNTpr2sIJbwmv8UeanSdw/u27S/8ML2pKodk3hk3BdLz53caF0SgrvdyJU5wq7tYnU6FrX4qovmmWIIwDN00XJwTPeIH9fqVYSbHSFq18wWH07EKJuwiyQr0b5ALNZWn+zyehc+kQsv24Vefwd7uky6zK7qOseRKeGv/aNR7yAaRXtx8bl+oJKhiiqFchKLx+WrCughYWdUaEr+K/hwpvxSar+qTcnyB0k471EIoC3lSQngHsrSngtc+bTUH3nuL+FdXJbk+fcDCjgk19WA9ubq9AUVU5BS04WEQ6G7oFgOsJdT6HHLw+vSR3Y+QnnzK97CFcuIQLbXSXfPlsoRzM3i32yZ2kWA5Jg2IkTspgaGwNV7uHgaRZNm2Wu4Ledj8nn2oyEVrdrtDiI/iR/s/6SEqzABLBQwnsbP7UvRNKZ73ot6w8s/75LLU+nnLXRL814qMzHR7h1qFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(36756003)(316002)(31686004)(2616005)(83380400001)(38100700002)(186003)(54906003)(6916009)(6506007)(8676002)(4326008)(2906002)(31696002)(66946007)(66476007)(66556008)(478600001)(26005)(8936002)(53546011)(6512007)(6486002)(5660300002)(86362001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzloclQ1NlRFa0kvVXhwM3QweW1VcmljMkpTdlJ0VXBkbjlLOTAyZWdDemhP?=
 =?utf-8?B?anBOTlRzR0xkSkJKS09rdFJVa3RVQmhWVHQwL2pDK2xlRzl4ajd3TFpFWlpS?=
 =?utf-8?B?Ulo3QjBTbDU5RklxSVZ0T2ptZjFUczJnK3NlbnpMS0tuOGw1OU1VWm91MVJQ?=
 =?utf-8?B?S2FDOVZzTUxEa2NueXFMUFZmZ0M3N1FvV05aSlp0N2dhNDVqcXZ1SWJyNnRn?=
 =?utf-8?B?TXY2amNkRTliZ2JFWkpnMjhBRzZQbVFZazJjSk9yRkFlcUY0Uk1mbWhQcFQy?=
 =?utf-8?B?S1hTUmdhcnZzaGlVYjI5cjFSWjlRb3EzeFpiMXB4RVpNL1VvRml6UFlybnRD?=
 =?utf-8?B?VzhEQzYxMXFJYXFSdnljQkRyZHVvdnZraUh4WURXZXc0dmEyT3F6T0tFMzRn?=
 =?utf-8?B?enFqTitySjYrWTNYSGZWOFJtRm1FUjFkYkJuWmVES0ZjZW9Dbyt0U2pVdUkx?=
 =?utf-8?B?dWxvdGJkZWVXa0xwTjVzNkRCeXRhZmh4NVNkMXZ5SExicjg3SGQwUmhuelln?=
 =?utf-8?B?VXZQSnNhUWFJVmJqRE8rUG5qWmJJbUE0Z1Ziam9PUWdEeHNRNjQrN2dYRHgw?=
 =?utf-8?B?US9TenB5QWUxQkxkRWFiamhPVUpjRjAzOGRuZGVtZEtWS1BYVlpSQzhXS3BI?=
 =?utf-8?B?NUNvbndWYTFPeUhRQ3BwUjc5NW82MW1ycFJkbU1sYWxXZzVwamU1NGhnOG5m?=
 =?utf-8?B?SktqUHdhdHBzSStLMmxaekVSekxaeTlLYWUrNkpmSTl1cXRMYnBVejEzL01q?=
 =?utf-8?B?cFYvbzhMd0ZaVnk2cDBBMFB1N0VaZjVjUGphWXd2RUFtc0o4RGZleFh4TXlV?=
 =?utf-8?B?cmFha3UrRjdLSW5Kd2FTNWdjWjFGTytacDFwRVJQWGJpbEtkSUcvMUhPNzA3?=
 =?utf-8?B?Z3U2NjdycVlhL3lneVJkY0RlTjdXL2IrUnlpaW1ITUdMREtaV290bGRQSzhx?=
 =?utf-8?B?VlVDUlNlQTVZMVhhRXYxQWdVSUQ4Nmt0UmNkOEVNRzg4WU0rUFhTbHB6UzdG?=
 =?utf-8?B?NzVjREJhK0NVME1EMXhBSnc4RUlzMlhRZkl3UXgxSTdWeWpUOUJiTVpZWC9k?=
 =?utf-8?B?Y1pPa0ZVTWdHWjJlWjBwL29xRU9peUpycGFUQ3FmNWxKTDI4N0tNTVEvMytz?=
 =?utf-8?B?V3ZCTFlIaTdKV1prZzk4YTlQMHRUc21uVWRVVGhWemZtaGJDRlI1WjliZ2NH?=
 =?utf-8?B?YkI5LzMwQ0hSWTJDVW1LWjlPOFhrRjIrZHQxbE5CMUh6M1gxYjdFWGxSR1kr?=
 =?utf-8?B?OXJ6T0s4MTRBK3dwUXFlSC8zbG9PZHdOeDBCZFV3eTNoSE1JaFdBblZlSVRt?=
 =?utf-8?B?Uys0SEdhMlJpSmxrb2lNdXpKc29OdjBnS2RuTnBUS2lyb3U4cVM3TzFLSm9h?=
 =?utf-8?B?R0xiTEpqUlNTc2g3ZkVmQ2FEUG9WT1VEa2h6U0RFbjgxS3NHYzdTVndhbE9n?=
 =?utf-8?B?aFZqWUNCZkV4WjdoaXhoT25nQzFGOGdBUkxEZndkQjBIZDBGOGpYTGprNkRM?=
 =?utf-8?B?dmZ1NW1OZTl0QW91SWxGamNMWERRcFBid0J5TGVRbmIrZWJ2ZnpNd0p3Yzds?=
 =?utf-8?B?aWk3V0dQVnZUSm9RSWVxczNWWGdZbGRrNzdTdlZRN3ZBcjlNTmtRMDV6cld3?=
 =?utf-8?B?elFhc2hEY3d6V2p0aWFGNEtMWHEyZndOYlhMZHpsSTlkelRQU000Y0hxOEZv?=
 =?utf-8?B?bjZEQzBKRWFvazhMQVhTb3JzY01rZnJGOTNIeVlQaTJVYlFHU0Q1NmkxdlNT?=
 =?utf-8?B?ZEZVK2dMTFJWS0NFcnQyeVBGaXhLejI5NEJvWHVZWDN2NnpGNENPcVlocHJW?=
 =?utf-8?B?elUrU3BWRFpOWXVVbFFXZklqeXJEcnlPTXdPTlN4bEp1WlNwb0RWWXR3Y2tI?=
 =?utf-8?B?Ti9rRExEYUFJZ0QxcVJlejdaL2I3bUdsVlM2bmFmV0tKT0RaaEZ3eERpbHI3?=
 =?utf-8?B?Zk9SeXdXUmxPcnJ6MVdDQVJDSHBRSmRESWsybWpZLzZtRXN5d2ZvclcwTm45?=
 =?utf-8?B?bENPd0gxazkybS9rYmQ0ajRiNmo1bHByODdBM1JmZVBFbjRtNVhPNXBGYXVL?=
 =?utf-8?B?SXJOUTZ0MlB5U0ZtVSt3K3VhNGo0THJ2RXZFdERqbEJxWlJyVm0yeVB4MXJ6?=
 =?utf-8?Q?aHIGBuFbF3H4S0XBvtF0BS6R8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002e771c-bb69-44f4-7559-08da6eff0415
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 12:04:39.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JR0x8x/uIs2FPbOcxCzYmV9xuTX848CD86cBoCx09TV07TGDOpbTvNKWyFzgZA4F2q7B8B2WLtSDdxZrsbbyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

On 26.07.2022 13:51, Andrew Cooper wrote:
> On 26/07/2022 07:29, Jan Beulich wrote:
>> On 25.07.2022 19:50, Andrew Cooper wrote:
>>> This is a debug behaviour to identify buggy kernels.  Crashing the domain is
>>> the most unhelpful thing to do, because it discards the relevant context.
>>>
>>> Instead, inject #GP[0] like other permission errors in x86.  In particular,
>>> this lets the kernel provide a backtrace that's actually helpful to a
>>> developer trying to figure out what's going wrong.
>>>
>>> As a bugfix, this always injects #GP[0] to current, not l1e_owner.  It is not
>>> l1e_owner's fault if dom0 using superpowers triggers an implicit unmap.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Albeit preferably with ...
>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -1232,7 +1232,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
>>>          gdprintk(XENLOG_WARNING,
>>>                   "Attempt to implicitly unmap a granted PTE %" PRIpte "\n",
>>>                   l1e_get_intpte(l1e));
>>> -        domain_crash(l1e_owner);
>>> +        pv_inject_hw_exception(TRAP_gp_fault, 0);
>>>      }
>>>  #endif
>> ... the gdprintk() adjusted to also log l1e_owner.
> 
> Ok, how about this incremental?
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index b3393385ffb6..74054fb5f4ee 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1229,9 +1229,9 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct
> domain *l1e_owner)
>      if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
>           !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
>      {
> -        gdprintk(XENLOG_WARNING,
> -                 "Attempt to implicitly unmap a granted PTE %" PRIpte "\n",
> -                 l1e_get_intpte(l1e));
> +        gprintk(XENLOG_WARNING,
> +                "Attempt to implicitly %pd's gntmap PTE %" PRIpte "\n",
> +                l1e_owner, l1e_get_intpte(l1e));

DYM to drop "unmap"? With it restored (or anything similar to that
effect), fine with me.

Jan

