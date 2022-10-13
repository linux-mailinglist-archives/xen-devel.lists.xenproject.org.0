Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D75FDC4E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422227.668099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiz4t-0008Tt-JY; Thu, 13 Oct 2022 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422227.668099; Thu, 13 Oct 2022 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiz4t-0008Rk-GH; Thu, 13 Oct 2022 14:20:51 +0000
Received: by outflank-mailman (input) for mailman id 422227;
 Thu, 13 Oct 2022 14:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiz4r-0008RO-Ho
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:20:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eba951d-4b02-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 16:20:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8222.eurprd04.prod.outlook.com (2603:10a6:102:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 14:20:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 14:20:47 +0000
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
X-Inumbo-ID: 2eba951d-4b02-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8WoEyX/Q1aSbfVa4rkAAveiprSAoTaOxAsOVCgOSKCZfpl1K4mgp4lCKXNg30SvVuXr95SqWIhD3A0wVn59swyQO9T/il9LaJ/l5y5G4gzNdIHmZ+EE452BLsVRfKbxTo9kTzAUzNTnrgtJLlMtJuuf2IkDWDETNlC3jf6jMPbjoWfPKgik+de7VnR5L4fDenoQSI8TwsQDUDp3jUyZVvK0BVkYcwKeQ87V6ngMojI2ByLvWzjg6/3EEPye59svfkA4QZYnQ4sgldm22Rk+p4Co0jBCGXI2hSlca4mjJy9lK645fpyBEyPJkOo9Z4k37zERrWtEmhqujmO/5lS1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veQFpq4mgKJoYEVkuIX/6zOa2CK07IW2mMT67BUJpiU=;
 b=RbIsA2t1DXagkzvwCx1VkSCpiVIRoIfHja+FFzJ7HNyqm1/ZXbhoPp4PLlgg5LK4duGx0s4qUzoWK8SXaqqfycLRRLTu4/XyjJksmyFAtl33D1RD9ergrB589hggLBJgQ+8uxISpHmRzZt841Xxiw81wrFi5YdykGJBMAm75X7o9meMqC90MHVPk/uTH/AHLA5s2dTnqsxmggtClmft45S8kxSAq1cFASXIm58WPoKlUy+tjUYYRhj89nm+1Y+jNKuoQTOwltQgm/O5tLK1urN6PyCesgwLNu60DSdLzHGt+Zi/PacJ1biqCgSmLbKoaz+hqw59ZqBQQxAUHR+vm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veQFpq4mgKJoYEVkuIX/6zOa2CK07IW2mMT67BUJpiU=;
 b=X+GcpkGSZZIPx9/ggb3DVp1sJEHSbLYGXZn8wMmnu/4qMVpgRPiAN+9tfTYH5XjYLmZzV85eWNHkgi8AAS4ISlrQt06NkY9ehjvSVIHgeucRV+iGHwxn7846Kr3fAoF+sRD356Ew9TXWJ4BXMs8eKnaHEtmzSDjmEvV8SYcGk2KUhg7K0ZgbK7GYFWlVSQ3TM7EsdRhTANvU8aZpBwxfCrBrA8iBHe+ystCw5oFaCIEpyDaCHBXcNMSAZ2WeGlRjjteDdMsOtkaHRkAJUOEQC9lHtftPxgXQY1nxHdsoIaZ+ozf6YymVa+YC0PQlFNqqXq59OrUSvjTOibEijcQlgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
Date: Thu, 13 Oct 2022 16:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Henry.Wang@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
 <Y0gXnD4jsyIp2kKb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0gXnD4jsyIp2kKb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0163.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f78aa15-2556-4ed9-0df7-08daad261f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMOcRfKjxJJKk7wDwHXvShrVgxlWlSxJU409fnEipwdbXpJi5YRWIjlEYbkEcw8NwHlUXzPcjXOg1z4S0s39gxbiLnDnchFeT/cbP9wdUseM0VgL24kJDkk86ZNzRMsxwW+aJyxslzAG22kalSBE0E0GpBKQaEv6vy7ci1GggRf4HKpckvBTmd7YktPDjnX6v7gIxwDObysV9lilkoXXirWsvS+jMC7RruX4YkO17lniz1nycD4Gf5Fb5hAPqQkslS42QushJvP26O2hiGajCL42Ileq78qY/tENMXyAGh8TnxN12x4QrZPtYvVH8/wzlTagfU2oH19u2m0qYatIWNL8rAwg31sDZRFR3tiCtXytqy8eHVRtbZFXbbtOjIzK6cmMqMs5PqPG+7NL/wNVTldiiq/vyQvOMBogNPPbzibAAkVJ5ALQkmlrORd4PZZh0SaUOQpn8LYqVVPMXHUxu0kEuU17GMyxoVfj7B4LFI67XOC7JKN8apY9axmNjUdlMxV7VFJO3YXEpGnBFS1V2s+QbmknnCJZyli+iZ3tMmN0FyiTKMzKCom5JO0PJSLmsyGa+xjWzUGA9Sw1+5MBVig/GgS++NaGqhqoHXko2iAnFddWoiNnAhdiVliy8A2EqBPRqvKqhlq36HNgx+dSM2/Qcq/v0wMslH28vO5iKaOY1XOCGR6r5AUYudiivPHZUfb39tRUjiITrZiRiZzPFSOFbW7WRuX1o1W6ypTxEJ2tJ9xG1508p/WUYzEnA5W0J8lgrIAvwUuNAMcUjsKG/q0D2jAdKHRjFMLlZnkScRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(396003)(39850400004)(451199015)(53546011)(26005)(31686004)(316002)(38100700002)(110136005)(4326008)(8676002)(66556008)(66476007)(66946007)(86362001)(31696002)(36756003)(83380400001)(8936002)(6512007)(2616005)(54906003)(478600001)(6486002)(2906002)(186003)(41300700001)(5660300002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0NHSHpBdWhNcEQxN1FibTducGF1R2JZOE53T0FJMmVaY1FvZDRrWEgrN3lH?=
 =?utf-8?B?RklMc0ZoT1ZCZlQrc3RRN09YVGV3eVpEMkNPOVY2V3pPTTdsd0xqNmpLL3RD?=
 =?utf-8?B?elFVdEhMYTNzWkF2SFJKMkJXZmpmU2V0MHZiV1pkOWhYLzVxaUhGY2lmT3hs?=
 =?utf-8?B?bmJJQUhzdzZHRFZ0b2xLWkNDUllTbEw0Q2hheW81RFBYVHZ1bFFDQ1JYWWNh?=
 =?utf-8?B?ZWRMMUxNdmllU2FiTWUxOVZnRGFRdUFlNUJHYnFLRmhSdlFRMHFCWDA3aTJs?=
 =?utf-8?B?cG1nQmdyc2g3dmZ6V0xvSEtDZnRqcHJQcmJPMk1SWnV0ZUJjbXVBSFdYcjJx?=
 =?utf-8?B?VlVjNElIQmVObC9mM1o2Z3QzNDR0SmJuWGNPRUYzeFpoV056OXg5eGNWc2RY?=
 =?utf-8?B?QW1HTWhjcXU2MXcxMVlMTzZMYVQ5T2NreEFub0Yxek1DR0ZwNWxPa2JTbWVI?=
 =?utf-8?B?NkFCaVJ4M0lFMXEwTDQ0ZVBQVWlwWFlhZXVqZGZSVHl4M05zN1dFMW1HbjVp?=
 =?utf-8?B?RWJ5RWNYNXAva3hHam9GNjRNa2dZb01HN0FDa3ZTaURNS2tvYm8zak12VVI4?=
 =?utf-8?B?V1BUZFNvRGRZVk5JUForenBPR1ZTZUgrdzVNY2FtNFBJZ05JTTZNVzM0QWdz?=
 =?utf-8?B?T050WmJsbm4yNkk2U2pkcVRJV09zRFJXdGV5UkpSZlRCTVBvbmJtODVTN3NP?=
 =?utf-8?B?LzJQQ3ppYnZPUEFjWkszZEVRWWhQMEl4UWJxR1dyOStvQWFaNjQ3VGR3V0FQ?=
 =?utf-8?B?bFhPMUx4bW5PeDNOSEl6MmJIamtMRW9RWXdjTXhoaThQT1pyYkNMYUw1dUdE?=
 =?utf-8?B?b0NmeGV0Y1IvaXp4OFF4aGNkZ0tSU3RSZmk0cnRWemdtNnFjamFUOVFtY0xR?=
 =?utf-8?B?c05NMC84R0JEdlp5Ny9NR2wvb1dVTUNwMDZacHFUOFFEejU5bm1DOWZIbWk5?=
 =?utf-8?B?MnBwKy8wWFFIT2wvV1BpcXg1TE55Nmc2RXJlRGhUR2V0eTRrYWFyZFVyNnA1?=
 =?utf-8?B?Z0VmMnkwS2JicVJqUGNZd3k0ZXNVVGpHdmpKSHg2UHlKd0xCRElPdWtmZitM?=
 =?utf-8?B?NG5adXJLd3FZZEh1YzUrMzMvVHdlcFYvRnlNRXZsQXI0eWw2VnNRQUdvT1hp?=
 =?utf-8?B?T1hFZ3o3MnBhcEhQNktFWVg0MjJYa0owNW9vMEtGNTNvTVBKQ3UvdWxMTGNI?=
 =?utf-8?B?QnNmYWxqZXJYRVZkUGlhTmN6ZlVEeDV0c21vVnJuQVZQenQ5aXE0NnQ1bUdC?=
 =?utf-8?B?d0xzQ1RlNzBOWWpZTko5TFcrQVVPRjVNQ2oxejJVOWtOdFMxWjZjcVMvR0No?=
 =?utf-8?B?b2c5NEY1aG81Vk5La0dYTUs0YVBWMW9aaGhrdk1UTEZSSkQvOFZOVXB1N0xp?=
 =?utf-8?B?VTVZaFNzakc4T2l1djlma1JYNThTOHlXL0U4VFNDeWdwcUxzeWhZYVB1dlB4?=
 =?utf-8?B?ZXZSUmZCU1huRVFEN3pDNXJYUVBwRXpLK2s4TG5VTVBPQi8wOXVrWGVXUEkz?=
 =?utf-8?B?SzVTRE5tT3BHd3NrVDA4RnYzb1FkMkcxeVBHTTk3VldsWHpDb2NYVXY3UTZt?=
 =?utf-8?B?UjAwMU5DcFZDZTJVMTJVL1d0YXYyV3FIWXhZcjIwUXp2QkxjS1JnZmNxai9Z?=
 =?utf-8?B?MHhsRjRTMXFMZkVTTzBQSDhCbTA1QUs3Y0tncmZ0c01rR2FXUVVKa1RVU2wr?=
 =?utf-8?B?Q21tbnh1eENXcmZjU29mU2FnK0c3Tzd1b3V4NFkyNk02WjhtcUlGbXZpS0x1?=
 =?utf-8?B?eHVWa0VpQ1pCUDFBMFJxM05kdVB0V2VDTHB5N3hwR0NFTUdMQjY4ME5ack5E?=
 =?utf-8?B?K0R3T1FaUUlEK0tuRzFoL0hhaWhUdVFpTnk1ZVNxTnBHREc2eStMTWlDL2VV?=
 =?utf-8?B?V3p6SnNJSHhGSk9rN0ZUSzJxTkJ1Qm50T2RaUCtsSU12ZFFSdU1mdUxVTGRB?=
 =?utf-8?B?d2RlQlFnaEc2bDlyb2p5L1Q2aVJhaUg2WWZrcGJxS3l5dXpua0FsQ2ltRTFi?=
 =?utf-8?B?bk0wcnlZczZZb0krUHZ5M0xwYWJRSnFsM3k0dm0rY1AyeWxUT2ttV0N5Y3Ur?=
 =?utf-8?B?K3g1SzlsY3dnZEl5NnNXV1VNNUs3bTA0dDQxSmxLQk9UMlJUMWlrcmRpaUFt?=
 =?utf-8?Q?HWZjFktXzeM1iJNDr0bpakbhd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f78aa15-2556-4ed9-0df7-08daad261f2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:20:47.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PEvkDvJ4KiCEd7r8zJHTC5BvUqEnVwT1sP4bdgLcveviloRrRau4zPEEUzsWVXZQMQ4UcbjrAYarBbyHSTMDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8222

On 13.10.2022 15:50, Roger Pau Monné wrote:
> On Wed, Oct 12, 2022 at 10:30:45AM +0200, Jan Beulich wrote:
>> On 11.10.2022 18:02, Roger Pau Monne wrote:
>>> @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
>>>  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
>>>  when hardware hints recommend using it as a blanket setting.
>>>  
>>> -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
>>> -option can be used to force or prevent Xen using the feature itself.
>>
>> Why would we want to take away this level of control? Shouldn't we turn this
>> on while in Xen if so requested? Which would then either mean enabling it on
>> VMEXIT if a guest has it off, or running with it turned on using the OR of
>> guest and host settings.
> 
> Right, but then we need to context switch the value on vm{entry,exit}
> which is problematic.  I could move the context switch code code out
> of the GIF=0 region, and assume that NMIs executing with the guest
> selection of SSBD are OK.
> 
> Alternatively setting ssbd= on the command line could be taken as a
> value to enforce for the whole system and prevent guest attempts to
> change it, not exposing VIRT_SSBD, AMD_SSBD or SSBD (haven't
> looked at whether not exposing the SSBD CPUID related to
> SPEC_CTRL.SSBD will have impact on other features).

That would be my preference (albeit I'm uncertain about the "not exposing"
part, as we don't want to misguide guests into thinking they're unsafe or
can't guarantee safety when requested by user mode code), but ...

> I was under the impression that the command line ssbd option was added
> to cope with Xen not exposing the feature to guests. Now that the
> feature is exposed guests should be free to make use of it, and hence
> there's no need to force a value for Xen.

... me not having had this understanding may have been wrong on my part.
Andrew - any chance you could clarify (original) intentions here?

Jan

