Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6474F27A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 16:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561779.878306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJEY5-0003Hn-Sq; Tue, 11 Jul 2023 14:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561779.878306; Tue, 11 Jul 2023 14:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJEY5-0003FW-P9; Tue, 11 Jul 2023 14:41:05 +0000
Received: by outflank-mailman (input) for mailman id 561779;
 Tue, 11 Jul 2023 14:41:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJEY4-0003FQ-LN
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 14:41:04 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53a528b-1ff8-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 16:41:02 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 14:41:00 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 14:41:00 +0000
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
X-Inumbo-ID: f53a528b-1ff8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdZ8vHYtQVvmz593Ayc/1mRsem48QQmUACU71+fhNX7Tr7gvitIonSnOiXNDg5Es6LD4V10z3dZEVwXjwqfreYW3YIftQCZcT9vvjQ9v/g7jZf3dl5JkJLFVFPQAfgQakUSP8xNRE0kUIBW320bz4omx0NWb0nG453zwFUIx8GwoTD4/gI88bd79KzjVXfBHee9KhQxHqAoBt9T5kFlsB76qGuff3r/iHndsp2uLF5O3DhPwXbNY2K7Bd2dlgwiXeYJnUP0SsP4Sirc8Dp8unQZ3Lq15NS6AdLBgoUEwXpYZm5RIp+JiU9U5/zk9H+Vb2smDwAaBnGTKBE8x5/XTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eCMYDj8YVuWQ5O9a/ggtOvR1J3EVo9UBfTkFfcnpJw=;
 b=N9HiKWfl4OcnsAruIm9rzNRAC4DGJzUMZDXJyK2Xm4jzivqtxwR+IvpxxtoViBgQDrpNY1vsHzGgGA6fzfPh4nnB553KueZs+VLJqg9a0bDqRuYxSR5aa5AlZAID+2tM9WKfK0wExJ1s+gcQlnw14kDbnC1+XfmNuO1av+44/GUvnrJeBoPVG+0mFh55ytCJKofsf/hOCN7vnHPo1iBALBwVpDkhiu04x+B6rCkXevGkS/CXl0oEPiTIdPXc8O+zbPf4BC04F8x0yWe1b2RIvQpis23pXUtB1ME/R8Mwbrf5W7W2VLsgc30+pjNnEjeCITsTp40yU1mwZDb9tpw1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eCMYDj8YVuWQ5O9a/ggtOvR1J3EVo9UBfTkFfcnpJw=;
 b=M1ZzvReeeOUtklWc0hJGWvX5717jImTsrZS/xak5+f5xGxGFvMQ4m1x+pw08SNLFllvGXQpWh+Ur8uDQyYOyZCov0K2dbbB0GTb3peKK+7XF9mjTc4FbDHp5mx7C7/gwPhLfX5txq7A845Un4ile02Skvojgk4XrY8JLFTWONyhW2GFcsvy5BgkoBgIhS8RB2XVfdqfITUD2yR4rPJKqCuOBGWKgasLJJCC7i/8rl0VS02NvxJ2hwUQUl0QKgBFDobpxsV4lmJsxgTaCsHtrGB9d4oy0+15AplRRTbLFTFEUs1m8v0JKiOxW90fQtA6X9lyHDK6pJTnny2jgyZaxKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com>
Date: Tue, 11 Jul 2023 16:40:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
 <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
 <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb7ae33-2c90-43d9-2ca6-08db821cd81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E4EzkhSDTlZzLBlpdGPZKYbIeh4y4j8xVQTDny+WPyEJCFkaaI2lQY83bjnL0/NFNDu8qsqmrBIuItBc2IVZ754LWJysZXmUzj7YK+RI/z0TmIo9b8Xd582DyTC58HvXQ2kJV7t00oiIzAN8Sq8iRMdfSP3gyxKCjHPBWCOXRXSH43c7CqG32fQjO2HDGc+N3eDzsChbSorDtl2FItBOPoTgQQiN4oy7M69BjCPcEtFl0I+K8EImohTCNGBty+0mYmPCXw40q8Y4gDxQnQ02bNue+kxdK4fgGanKqlIYRt3cr+xL9QclKBxMlq92DWo5fJm0EmyKvJWSf6UOUQMo7XSR8Ysnodga39zoRxbV46Zp23gTGj9knvYD3A6IBHtPi/17xQFXY/4rb83QGUaEsWUEhnkTCAdh6ipKgyTcJo8NK4fcM13xUKlkHozjQdbXHDPm0/3kjdI4mFQtt05d52/DfAbHs90G7Jd+hVenzIhGqy+rmS5LPxUd0arkxJcnLMIpaqL4cbqqocGRNy/++22c8kfoXJ9hBg6zLIulKJJE+j23wyFKXnYv7j38fybVvXsSz1TvJd79JeHgepvd5HpRHzNWlMKNBuvNX8wIm5LE/RJKIkwMeWPhmu06y7bVFClQ2BA70jfS5WiYeVSyWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(2616005)(41300700001)(53546011)(26005)(6506007)(83380400001)(31686004)(186003)(6512007)(478600001)(54906003)(6486002)(4326008)(6916009)(316002)(66556008)(66946007)(38100700002)(66476007)(86362001)(31696002)(8936002)(5660300002)(8676002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHF6RHM0aUgxTEl3ZUZDamVEVTJ3RCsxQ3Y0dUhWOEdsRGpkSTZQbnRSWVpO?=
 =?utf-8?B?cGN2Sk83Q05waW05RlNCcWtyN3dtSWRoQlhQRFplVkFZUFFlUXViaWg1cS9j?=
 =?utf-8?B?WHBEVnB1Z0VYVUxkSSt4UFNzV0JoVXlmanBPbGYxNDBjOWZOeG5CUDJYZC9P?=
 =?utf-8?B?eUREWVlZdDhtUWI0Zm5EVVdLMHBGWkxFM0l5UHdpdVBGdFVFU1dHaWs5THQz?=
 =?utf-8?B?QUhMMVoveDF6L21maWdzNzB1MHUvWDdVRXVURlBGNVloOUxQN3dHQlBUelV0?=
 =?utf-8?B?Z2l3UVhCK1hIVk12MENUMS9qOUJwMFg0TlV4WHRhM0tKdzNNWUhCQ24rSUsy?=
 =?utf-8?B?djVwdkJ2c2dnVDdDQXZpcnIzT3N0SW9Wd0RxTm1YaE40SDgzK0cyVk5FRHg5?=
 =?utf-8?B?UDZqaEV3eU8yR3dmSDBkU1JEREVKZ290bkgzc21qVEJZUGRMV0s5aVp0OVFu?=
 =?utf-8?B?K3pmRGNTdzBvWmNsZDI0eXFTdkhDVXNFY1puRWJ2M3NzUEduekpvL0hHVThW?=
 =?utf-8?B?dkhFZTJVVTRtRmlNb3NvWWVsZDZHTE14OEJ6OFh0N1lnaHdnbGRYTXFVSjBq?=
 =?utf-8?B?VnVhb0JBanNQWDRmZHFGQUtXUXAvdldQNkpJT3BSdTErTFg0UXZrRExQeWc4?=
 =?utf-8?B?b0g0a1VRaVNoejBqbDlsTS9aS2k3ajcyVkxZQ0Urb3VRVWJPdjFKc250RUk1?=
 =?utf-8?B?NHkrRklRSWk0RnZlYk55Nm5LNGgrRm9aNjM2amVTTnpFOGxKQ2YrSldtRkZJ?=
 =?utf-8?B?VmdYdTM5V1FUdGRITHdPQ0tNeVRXbUJTcmRoMlJQUitHRXU5MzdaNGxVVnFD?=
 =?utf-8?B?VjNtWEdXVVAvZTQ5Mi8raEVuQWdSejZwR3g3R2dSZjk1Vk1qMTg0M2xxanBr?=
 =?utf-8?B?T1pwMVlzaFdxWEtpNFM3R0NCTHBRUjFFUWpVVXN5N2o0c2tTN2Z0a2NoeEJK?=
 =?utf-8?B?aXRmMFRnRTV4c3FzT3JuZkxZTGFwRHhUeEE2RENIRFBaZXFVZlNuTDZldU5i?=
 =?utf-8?B?WTIzbzNkTjJDSjVEbG1xM3NKOXJOTk8vVzZYektzMEFmVkRyTW1neDIzUXV3?=
 =?utf-8?B?V0hXQzdIZytPMlVQUzM0RUtza1JsSG9ON2lvSDNOL1VpV2lWOWFOcFVqUm9Z?=
 =?utf-8?B?VnE4M29jMm50UmRGNkU4TE9maHFWSk5yZkc2b25pcWt5cXQwTmtPYVMzZlZG?=
 =?utf-8?B?Q2p3QklsVUhKbTltcFdKNlRWMWc0MFBEUGZ3K0RtU3ZKeVYwUGNaQ09sUkgw?=
 =?utf-8?B?dzBCZXB5SkhZSnpaMS9FeXBTU0lqOVpNK3RXNC80VEdDK2hYNDZrWWhTNXIz?=
 =?utf-8?B?cXRES1VML0VrZWQzckNEelo3bUo0dTVHRjF1YkxHOWpKNFdkUldSQ0xJRGhC?=
 =?utf-8?B?ZjFiVFY3VU16OHVuaHZDUEdKQTZHaTZKOFMzSXRQWm5SazVzV3dPYWxGa1lu?=
 =?utf-8?B?MzBpSjdkd3BNUFc3dytRR25OS0VCMVhmNStDRXVzbm92U3BEQ2F3ZXRGWHRZ?=
 =?utf-8?B?bjYxRi9KY3cyTyt1eHovMVI5TWRrbXcvUEpQOU9rcjFkcGkzd0FsTWtidHBl?=
 =?utf-8?B?Y3E1T3pyZ2NqWnIrL29BcmdoQk8yeWRScm1jdzY5NzBheHhmSE42aENKNk8x?=
 =?utf-8?B?VWd0YmxHcFhyZ1hBbGdmMmp1QmZtaWFJbTNZeVlIOHpaRTluWkIvNUtodWZP?=
 =?utf-8?B?ZmFZcUZyMGVNYkZqY2VwMkk4M0dWdFg0dGJadVk4aEJ2M3VlOGtQYklHbk1j?=
 =?utf-8?B?NDNBd2ZKTkhuZytKVnBXczBaNlNaeCtyd21JZ1IvQ3NndXNOenVzSnpRd0dZ?=
 =?utf-8?B?aVJWRWIzMXlwa2ZIZlh5WGZxQjVNZTVsa05xbE40RmozWFQ4R0RwR0FQbWZZ?=
 =?utf-8?B?RVIvT2dUcTZIdC9zNVFxQUkzZldUSG1LVGtZbnBhdUVaTzNDUUJwMVN4RFdm?=
 =?utf-8?B?VWFMUU80QWdQMVdUSll4YkpJSHg3R2Q4SzZPR2NFMjNONXFCODVoS1phQWox?=
 =?utf-8?B?a0RhZjI0dG9iZ2Y5em9keGtES1lRNXNsWWVENE14SzJobUtJKzhRVHluZWQv?=
 =?utf-8?B?NkpuMnNrTzIvMUlEL09aMWRlRlYyVUhpY2lJQzBqU0hWbGN3Ly90TkhaaTAw?=
 =?utf-8?Q?p/FjdmZV5zEH2VD8vLGpVhyNt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb7ae33-2c90-43d9-2ca6-08db821cd81e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 14:41:00.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwPaj6sTB9nItUXfHmSsXLRrWRY3vUTrDLzukt+WTf7HJ9l7vfRrku6bBu8JWkKlFhh+lR3ViD1RTOiF83rqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316

On 11.07.2023 16:16, Jason Andryuk wrote:
> On Tue, Jul 11, 2023 at 4:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.07.2023 17:22, Jason Andryuk wrote:
>>> On Mon, Jul 10, 2023 at 9:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 06.07.2023 20:54, Jason Andryuk wrote:
>>>>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>>>>>  * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
>>>>>    respectively.
>>>>>  * `verbose` option can be included as a string or also as `verbose=<integer>`
>>>>> +  for `xen`.  It is a boolean for `hwp`.
>>>>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
>>>>> +  hardware.  HWP is a Skylake+ feature which provides better CPU power
>>>>> +  management.  The default is disabled.  If `hwp` is selected, but hardware
>>>>> +  support is not available, Xen will fallback to cpufreq=xen.
>>>>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
>>>>> +  processor to autonomously force physical package components into idle state.
>>>>> +  The default is enabled, but the option only applies when `hwp` is enabled.
>>>>> +
>>>>> +There is also support for `;`-separated fallback options:
>>>>> +`cpufreq=hwp,verbose;xen`.  This first tries `hwp` and falls back to `xen`
>>>>> +if unavailable.
>>>>
>>>> In the given example, does "verbose" also apply to the fallback case? If so,
>>>> perhaps better "cpufreq=hwp;xen,verbose", to eliminate that ambiguity?
>>>
>>> Yes, "verbose" is applied to both.  I can make the change.  I
>>> mentioned it in the commit message, but I'll mention it here as well.
>>
>> FTAOD my earlier comment implied that the spelling form you use above
>> should not even be accepted when parsing. I.e. it was not just about
>> the doc aspect.
> 
> Oh.  So what exactly do you want then?
> 
> There is a single cpufreq_verbose variable today that is set by either
> cpufreq=hwp,verbose or cpufreq=xen,verbose.  Is that okay, or should
> the "xen" and "hwp" each get a separate variable?
> 
> Do you only want to allow a single trailing "verbose" to apply to all
> of cpufreq (cpufreq=$foo,verbose)?  Or do you want "verbose" to be
> only valid for "xen"?  Both cpufreq_cmdline_parse() and
> hwp_cmdline_parse() just loop over their options and don't care about
> order, even though the documentation lists verbose last.  Would you
> want "cpufreq=hwp,verbose,hdc" to fail to parse?
> 
> All parsing is done upfront before knowing whether "xen" or "hwp" will
> be used as the cpufreq driver, so there is a trickiness for
> implementing "verbose" only for one option.  Similarly,
> "cpufreq=hwp,invalid;xen" will try "hwp" (but not "xen")  since the
> live variables are updated.  Even without this patch, cpufreq will be
> configured up to an invalid parameter.

Right, and I'd like to see "hwp;xen" to be treated as a "unit", with
",verbose" applying to whichever succeeds initializing. I don't think
there is much point to have separate verbosity variables.

> FYI, cpufreq=xen;hwp will be accepted.  "xen" shouldn't fail, so it
> doesn't make sense to specify that.  But it didn't seem necessary to
> prevent it.

Sure, that's fine.

>>>>> +    if ( data->curr_req.raw == -1 )
>>>>> +    {
>>>>> +        hwp_err(cpu, "Could not initialize HWP properly\n");
>>>>> +        per_cpu(hwp_drv_data, cpu) = NULL;
>>>>> +        xfree(data);
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    data->minimum = data->curr_req.min_perf;
>>>>> +    data->maximum = data->curr_req.max_perf;
>>>>> +    data->desired = data->curr_req.desired;
>>>>> +    data->energy_perf = data->curr_req.energy_perf;
>>>>> +    data->activity_window = data->curr_req.activity_window;
>>>>> +
>>>>> +    if ( cpu == 0 )
>>>>> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
>>>>
>>>> While I'm fine with this (perhaps apart from you using "cpu == 0",
>>>> which is an idiom we're trying to get rid of), ...
>>>
>>> Oh, I didn't know that.  What is the preferred way to identify the
>>> BSP?
>>
>> Sometimes we pass a separate boolean to functions, in other cases we
>> check whether a struct cpuinfo_x86 * equals &boot_cpu_info. The
>> latter clearly can't be used here, and the former doesn't look to be
>> a good fit either. However, ...
>>
>>>  This doesn't necessarily run on the BSP, so "cpu"/"policy->cpu"
>>> is all we have to make a determination.
>>
>> ... isn't it, conversely, the case that the function only ever runs
>> on "cpu" when it is the BSP? In which case "cpu == smp_processor_id()"
>> ought to do the trick.
> 
> The calls do not necessarily run from the BSP.  The cpufreq init
> callbacks run later when dom0 uploads the ACPI processor data.

Oh, of course. How did I manage to forget?

>  If you
> don't want "cpu == 0", maybe just print for the first CPU regardless
> of number, and then print differences from that?

Perhaps best then.

Jan

