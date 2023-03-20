Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5986C0BF4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511750.790949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAev-00081h-4b; Mon, 20 Mar 2023 08:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511750.790949; Mon, 20 Mar 2023 08:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAev-0007z3-0F; Mon, 20 Mar 2023 08:14:25 +0000
Received: by outflank-mailman (input) for mailman id 511750;
 Mon, 20 Mar 2023 08:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peAet-0007yx-LO
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:14:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b9e0c8-c6f7-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 09:14:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7614.eurprd04.prod.outlook.com (2603:10a6:102:ea::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:14:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:14:13 +0000
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
X-Inumbo-ID: 36b9e0c8-c6f7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw+QEUhACpj20NJwKTWakz6p+pahM27deBRKU14GPAZ6UHiyVZXpTx8/4YfJgm2p8834iJS4e/0pcO3j2JH5QFjct5L+BJ2jBaxfvZGOUQezhplcVCcM/H2pUJJvud5wjHiUeU6qhyrfqeIpfA9fksT1jhXTbK6UvqARskHUILm07CEMS+yGuwqdWRygJJGWP53bqrB+/ZPZZ3jLNXZvL9cqZln6f9QSE758ofZDRC6cEurYXQQnXwjqiiuMX/wXQsv+yyJ7R1o91XUPgUQNJObCCzHxo1mec99X/piwGjSD3sAiEBTR9M1JF12ee1Uq0tZSfw7s8ED8DNREhgXuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fALf4sfZYXdGl8/blyrbl7A7VTR5ltLiuPxysFoLP5Q=;
 b=K8cZGfXz7zneUbpC0CF4YUOuUH2CsgnI2neecSO71JW8DOlo8GqiahhO2laxIBCKEEeG0LLZnH0x8WNZn+rkC7GlJt4X8HkPLSWkNzkfjuUsMfUOqdgZtQcRb/PbzLGMYnPp7JJhVe8h4w3SJnUAx2rdBWoefg9S6xdrnD8JgFz2iYNP6AXZzPXtNLee6bD2jP8zjwIxuAwK2PhAAoJm0pyr4GnCmCxrNZgWU0WqhgKBCOV0FerZ+IZEtIAokqgq5zmbEDDy7u85vozExXcq8ZRhYn4sQtYkahVJ7dTvYNpIfIAuGOxnL0NN2GAshjnwzoISXEB6j6SBh8PjAF8klQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fALf4sfZYXdGl8/blyrbl7A7VTR5ltLiuPxysFoLP5Q=;
 b=gGy0Hho8QsOI95JZhxs7eksU5KeuGBP4l8/yyeNGjnb6SuaMT54dav376pzldDz9WJlMCd22BW2XuppzukGgtQg0M4S52MZIQzDqFm75UGsJ0Mr9WAJvLTZhKgLcwDWoil3SBvWdHMSdMqoYwKwHrupfSeETObFCXUnDIQQvIs2QVvsQUq/1CLLkYxStaKKndjMWn9eKOskCNaZRvCYt5ma+pJu0vXAxAEBu5KZPTJRtUFbqJjnS7ZvrK2+Vkuq+xmuUT+7uaSSRpqOAedW8hACbfFTrAw7L6USy+AnnBkLuOsTEA3fPv9VGgE8B2/cSwGfs2C/ALbcZ9eCXXupUDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
Date: Mon, 20 Mar 2023 09:14:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 282884e9-2da2-4c70-70d8-08db291b1715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BfuyPPTwikaNBrot3Ct0ZVAup4cTPc3hz9qbDmTs8xPVp7eIKAY+2kKMB5CcB71S3w0tnmhgKmO0ct6+4FCmcZhaBwaPHs/jnB9T7YGTKsdSfLfZ57MX1xn11YjT+m/LEhI36tbkpw2icpkkMt5XyLa9mT3YSC4t7lM21/Xn5IuiTTMRqJY8Mo17Do4leSk8M+mzkQW4fRwVk58IQoOIJ9xjh1eC5hxDo6OXfS3tW+XSdAZIqxqNiDFdZ51JLI//MYiGHQdKNGCiDFbni9HTlZpzDDNdMwGqNi0IkmgSeaiz0zYJO+wmlEG2WHbUjHzqXn4qCur6DLWzRW5LoIX9KOMJlI5zJo9SxAjjOI/rR/lIQnKkjnO82/baZysAHK50bjtkaqzkyVK6HYnW9O/RwgMhdCoJHTcL9MybGs4GeHKNFti2NhCJHb1lSYH3ymlJDP7aN5ggMoIuS1HvLXWA5/ttVBTj8G7czRLPEeprWCZ/X8em2E0OUIzJcXDoJp7wza4MpVwBu+XlEC827nfFNhgNmwdlQdQuB0vROHnDP3mhFaHpiOA57wy0Pr7EpeAO1wz499D4KuJjwafGT+qmZx96mjG+3itvfbsZZuPuRJkVwXcwLRoGEvcLeC8/tH92LiBZqJZQe9m6Ttqzt2mwhMZuItebTGu9hACPwHbqPbn9EZzzDdu4vhleN5/k/hzdiB/WeCaUYBNnEu9SNRvd35epJ4+QzcXAMTFQV+3aPfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199018)(186003)(478600001)(26005)(6486002)(83380400001)(6506007)(6512007)(31686004)(53546011)(2616005)(316002)(66556008)(66476007)(8676002)(66946007)(4326008)(8936002)(41300700001)(5660300002)(38100700002)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0FTMmlHVVRpV3pmWUd4L2kvejJOR0M1QzBRY2Q4OVNPckJwOXRWYS8rZFMw?=
 =?utf-8?B?VG9DQWlneFN2STlkSFFQb3g2ckZEWG9zM09qNzVoa3pGSVlpZjdqSE94VCtB?=
 =?utf-8?B?cmxwYVNuZXptVXdTVk9OSllOWDlDc0dKckJXV2tFQzVyT2ZqVkdZOUY1ckVR?=
 =?utf-8?B?b2dKbGliSldDMlFLN3BubmNENnMwQWhUOUxUcGgrMk05d1AwQVIzd21DeTVK?=
 =?utf-8?B?endRY0ZPTmd0QmpwaUVLQi9EVXFtamFha3hLc1ZhMllHLzhsMU15VGdudlYy?=
 =?utf-8?B?cDdVcUFZUUVocW0xL05hUEV1TEIyRjlxaStVdkxRMDc5WHFHUk1Fc29VWGJ4?=
 =?utf-8?B?emRCNm9KU1dNQzFuV1M1eDdGdTh5R0dQbW1IVFVzZVhwM2VGOWtaZWdQNCtW?=
 =?utf-8?B?a0RETU9iSDczM2hWSk9sUjJXSk5FMmUvNTBOL1FQUGQ0NTl4SlN3WEJVdmJy?=
 =?utf-8?B?ZitqSlgwT2lXTlBZNDFVdERWL2ppc0dkczJubjErbk92QTlXZSs5ZTRVMlR1?=
 =?utf-8?B?d2liVzlIaWVpYi80Z3hOc3U2RWFVd0VwampHRzdZRGlwSGh2QUlNS2Vubkxr?=
 =?utf-8?B?V2dJd2ZYVGxDZTFaNENYOW5VMEJaNlA1OTdYSURQd3cveEpJZ2F2UE95RU1F?=
 =?utf-8?B?ODl4TkxDSW1ESUxlaUhDdHBsMU5DbjdVcUgyWTgyMmErY1VMNUN5QkZoOUdi?=
 =?utf-8?B?aHJpeHpkTXlvR0hiMHI2MXdWYzJWdzNnc0RtSU5FUXc0eWloQkZTaHBZT3pD?=
 =?utf-8?B?UjRZUURINGt0VnRXeEJiU1k5RnRwcUtCNGt0RXQzZm5JNlZGY1pDUFZzb0xm?=
 =?utf-8?B?WXJCc3NLMDB5R3NMeGlkOXcydGVndlp0UjBlMXUxcG1hRENrSWg0MUFnVDk1?=
 =?utf-8?B?OTl5VGlOdDdhWVVtMHVkUDAvV1RZMzE0UDJPY0JqV0pkVzg4bk13L25KSWhG?=
 =?utf-8?B?TWRQODFMQUZZMTF6NTAwQVlPYVkvSE1lOWJLdXYxOWEranQzZml5NFIyRllo?=
 =?utf-8?B?WWsxVktMRzNpNkU2ZEY2QjF3Wjc0YlMwNVpQaWtvd09lL0NlMGNKTDQwbm52?=
 =?utf-8?B?NVBSL0J0YWRzSUwxMWp5YVg3RGJ4bDRvTnp6aUF1d1Q0Qit3RjdWQzlwZjZG?=
 =?utf-8?B?Qk8rL0w2bGJpVjZKMU15c0w5bGh0Wmxzd1Nta1VENDdYVWJnbjB1c2RFVDRk?=
 =?utf-8?B?TWdEMzRWdHVSQ2tTNUpiRG82cURUa05MYWd0ZW9Wanc2V2RjRVF4dy9VbnhC?=
 =?utf-8?B?TTQ0WmZHbFZ6N2xTYk41QTArZm1Bamd0aG5XallLOWNRbG5hMkoxSXhKTytR?=
 =?utf-8?B?WjRQY1FtRDFPQ055Q2ZFQW8rV1V1TkZCUGVQbUxrbk0xRTdTRVhLc0V3eFpk?=
 =?utf-8?B?OFNpcmY1OU1ueGRhNkNSQlRMVnVTem80dDk0VGV1YlBtOWVFeEN1S3RwbHZQ?=
 =?utf-8?B?L2o1UzF6ZUJDZWp0akhWVzR4NkJBNkxkT3NzV21uNzV5My9NcSs1bVRGbDZv?=
 =?utf-8?B?SUJBUmY0MmZ3MTdXMm1rY2VCKzYrSmxjNStNMXJ0Qm41dGFlSDZvbWhsMlVk?=
 =?utf-8?B?a25UYkk4dm0vSmpwMEpIekRFbjRpY1l1R3hXK2IwSU14K3hkeVJUamhDS1Qz?=
 =?utf-8?B?R2twRnozS3dIdUpaaERiTENiaDZWTmlEUTJmUUc1YS9DMUtvVUpvbTZGVUJq?=
 =?utf-8?B?dkVlc3dDbkEwNnJ5UjhvbFdIUnQzcVlkb1hidWlMazA3SVVWZDZxaGxSdGVj?=
 =?utf-8?B?bDNqUXlIblcwQnpxMXpCblJZRVdvNkZrcitvSzVFZ2sxZFRidGlTMy9DMUcr?=
 =?utf-8?B?NDJtSDdLRTl2U294VktRUmh4ZTJ2UDJEZStyNytGcUphNkhpd0pUVnVrZWRF?=
 =?utf-8?B?cXRmWHduTkJteDBvQzA1ZXAyaGtudjVycHZyRG0wQmxpQkpvRkFab1QyS25q?=
 =?utf-8?B?QnpJVVpKNThJTmFyMDh4R0hIcmFPWnZoZEZGeThSOGxQYzg2dUhYK0lXeWVE?=
 =?utf-8?B?ZFU5ZzhiRFdBYXZBYmNBZU1HcFBUenpHTyszaHU2QXgxNWdFYzdoVmtBSFly?=
 =?utf-8?B?b2JiL2hBb2xwL1pkSkR3TUU5ajR2QUxPYldxN2RhZzhDNGZwTXBONjMyNjEr?=
 =?utf-8?Q?RqOETMkRtywRrhzRik1DgFcN/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282884e9-2da2-4c70-70d8-08db291b1715
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:14:13.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBjGBbkx4b+ZtZ2QQycVAL9IOTsazMq1petcDIueClGivsgq/AbxBAFSRdWm+gEQ1tJHA4bTserYLSz0lv41kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7614

On 17.03.2023 18:26, Elliott Mitchell wrote:
> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
>> On 16.03.2023 23:03, Elliott Mitchell wrote:
>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>>>>>
>>>>>> In any event you will want to collect a serial log at maximum verbosity.
>>>>>> It would also be of interest to know whether turning off the IOMMU avoids
>>>>>> the issue as well (on the assumption that your system has less than 255
>>>>>> CPUs).
>>>>>
>>>>> I think I might have figured out the situation in a different fashion.
>>>>>
>>>>> I was taking a look at the BIOS manual for this motherboard and noticed
>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>>>>>
>>>>> That is the sort of setting I likely left at "Auto" and that may well
>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
>>>>> functionality on AMD is detecting whether the hardware is present, and
>>>>> failing to test whether it has been enabled?  (could be useful to output
>>>>> a message suggesting enabling the hardware feature)
>>>>
>>>> Can we please move to a little more technical terms here? What is "present"
>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
>>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
>>>> also left unclear what the four modes of BIOS operation evaluate to. Even
>>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
>>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
>>>> In "Auto" mode Xen likely should work - the only way I could interpret the
>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
>>>> speculation on my part ...
>>>
>>> I provided the information I had discovered.  There is a setting for this
>>> motherboard (likely present on some similar motherboards) which /may/
>>> effect the issue.  I doubt I've tried "compatibility", but none of the
>>> values I've tried have gotten the system to boot without "x2apic=false"
>>> on Xen's command-line.
>>>
>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
>>> I see the line "(XEN) - x2APIC".  Later is the line
>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
>>> leaves the x2APIC turned off since neither line is present.
>>
>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
>> mode. Are you sure that's the case when using "Auto"?
> 
> grep -eAPIC\ driver -e-\ x2APIC:
> 
> "Auto":
> (XEN) Using APIC driver default
> (XEN) Overriding APIC driver with bigsmp
> (XEN) Switched to APIC driver x2apic_cluster
> 
> "x2APIC":
> (XEN) Using APIC driver x2apic_cluster
> (XEN) - x2APIC
> 
> Yes, I'm sure.

Okay, this then means we're running in a mode we don't mean to run
in: When the IOMMU claims to not support x2APIC mode (which is odd in
the first place when at the same time the CPU reports x2APIC mode as
supported), amd_iommu_prepare() is intended to switch interrupt
remapping mode to "restricted" (which in turn would force x2APIC mode
to "physical", not "clustered"). I notice though that there are a
number of error paths in the function which bypass this setting. Could
you add a couple of printk()s to understand which path is taken (each
time; the function can be called more than once)?

>>> Both cases the line "(XEN) Switched to APIC driver x2apic_cluster" is
>>> present (so perhaps "Auto" merely doesn't activate it).
>>
>> Did you also try "x2apic_phys" on the Xen command line (just to be sure
>> this isn't a clustered-mode only issue)?
> 
> No.  In fact x2apic_cluster is mentioned in all failure cases.

Could you give physical mode a try, please?

>>> Appears error_interrupt() needs locking or some concurrency handling
>>> mechanism since the last error is jumbled.  With the setting "x2APIC"
>>> I get a bunch of:
>>> "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
>>> (apparently one for each core)
>>> Followed by "Receive accept error, Receive accept error," (again,
>>> apparently one for each core).  Then a bunch of newlines (same pattern).
>>
>> This is a known issue, but since the messages shouldn't appear in the
>> first place so far no-one has bothered to address this.
> 
> I won't claim it is the best solution, but see other message.
> 
> I'm tempted to propose allowing _Static_assert() since it is valuable
> functionality for preventing issues.

How does _Static_assert() come into play here? Also note that we already
use it when available ...

Jan

