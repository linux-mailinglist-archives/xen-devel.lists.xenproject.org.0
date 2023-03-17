Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457326BE336
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510919.789494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5Lu-0001mX-CO; Fri, 17 Mar 2023 08:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510919.789494; Fri, 17 Mar 2023 08:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5Lu-0001jq-9N; Fri, 17 Mar 2023 08:22:18 +0000
Received: by outflank-mailman (input) for mailman id 510919;
 Fri, 17 Mar 2023 08:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pd5Ls-0001jk-Tu
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:22:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28664e0-c49c-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 09:22:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9832.eurprd04.prod.outlook.com (2603:10a6:150:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 08:22:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 08:22:11 +0000
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
X-Inumbo-ID: d28664e0-c49c-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJNrYgso3R3kdfHuaHEfyQF5D5TwdTAPvZ9AdZUQpBjdqUqYLq31hEtlRycEqXeXt/4sb1C3uD7kVjSjPGMYgiM7XNflYQBnXzunAUPWg6UGwVJUhkTK1AQx6VExn6EaqvnXKe89jCm1RvUeR5waTWkTU5XrdxfZG2G2xl/nWbCTocLGH+O2s7DXNyUj6SN6wRgmeHftP7rr2OhAczvnTC9lZ/l/PIvbpg8kjvvYOjTYMbqCrqrecTAbLn50Eq0XGKemF+3KYzC76QBPTkZuMf1ziDXM0IqOBzaLBhK4sNdzV0SLinGfAlVCpymZm51baLve8xr+0Ha+4WG3pwpoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG3Sj4YBBnH8+KJafntZ1Sr3s1Kmi0aYm/goaF74ReM=;
 b=gX+HO7TC1l5eTpMo9GEV13ltaMuuvBkNrRXqErTAjCb1Gk5Gw0yOPZCTkjQ9WN0mzTVbQvtf4t2PN5yCiwFOmdagJ5MbOmwEYiDMi0JqrkhHZPvVi0YVSRatuVAC93gCBRnV+lyADSHcgr8ijyIzgCWAKo+H8A/rlLjxDVXLaoVuVUAVjqFCAScVpfGRITWRz7KrZEGX+VL2wkfXesb6Hn1xCZ6iA6lQZEnaAVA7NDtHo6zTks/roF/GVjfy3851bKtq3vxzJGxJjey43JUUEHIdH4vsU829gTUbKqkP1cckjiui/Eg8+QyTgMxGKRZhRNP5FSi6N/DCrS4JOeVZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG3Sj4YBBnH8+KJafntZ1Sr3s1Kmi0aYm/goaF74ReM=;
 b=yqL32TJrbudyF6M5mZNAimYaBKn5G2O7NbmQJgPzSbm2aaULms3Je/uPf8ihs4HQWzklYerXy8R15dDGq1LcF3gUc0FI2nwrEklGa69/8JpsY2VYCBYKWmkoKqlIg0rLhxqzwQWp/npf7fQX+392U9SUfupJW3hAREV+6B0lXsrvSLGKVGAYGQYIgwpuJxb0/fqror4wrx/OZvBk84rBciG5geKuIDJGJbcVRIBV4FKZwOQVW/o4ZnH27gx8Dt/JrBGFGB7HZWciCjOrLLRrjOPrKsOnuOJiRCCsYutYS5Ti+ZvbW3ohKpazAghvV/PNjByaeAuP/TAVwLFxq4mllg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
Date: Fri, 17 Mar 2023 09:22:09 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: f83970bb-2fbd-4bf8-eab1-08db26c0b496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQnnSl1z6/IguvLP6G7XecAvzfim8NmIOo5Zcxgxb5qjOUPzkiT0/p0J/SHC2GiTAOFkf5/HM/yfDHx+q7+UgVe8sg1B81pcW+FtsD8ydYCiBx9JKpEFSzF2J03Hya5gdAnQv+ikOi/76C48R8I/DjPEJlQVq3i5t5Vry4kZsYFZwgPjD4BcwycAHi6I3kl0zIItvsklxQg+edt8FzrjAWLMK40N6coxtpjJ3+cC1UbkIdXJAmFSxL+5v1JPHwonM+Jx9aXKPVQ9tw8OmqOPemMeMTvwT/TKIdOPNxdkrMhCowZ3RfO4rjmac7zl2L1u0sodMVrSWTUJ/dXbR5EG2vmxlLOBaum5cemUf0BOJUl4rOxTIH5M48ZEyIVMX9oVsDGSgdoo3+qd4tKJFMNi/L/irhD6T7qcJQwE9mvocbhTDShm3EhF/+LwfOlSa3cTtbzD2/dUxjWyD6G6YlXk/Ay3x2VvtP3wwqhhzgHwdViqgTihNmDgA5nGGEnai2AUQF+2Of6szme/7rI7wbymUL+G3ManmhwWzfXSepqYtmrcMQ9OnAT/krT+T9ox5NvNXWk4yiyasoR0Snp+Hkl+u9ISHMT3O/BtljDrHsnaMM07PNrDN3DIwqKyzXDU8VbxOr0W4oGfEQFoHX2eRPG9YCgACGT/2FNVDhA1vmNvmyobw4qipi1iPRa76J/G4hEAShsFNxNe8gFfcy/FuUvRVEndX7bNgPjaOhQWGT8U3DI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199018)(31686004)(2906002)(8936002)(41300700001)(5660300002)(36756003)(38100700002)(86362001)(31696002)(478600001)(8676002)(6486002)(66556008)(66476007)(66946007)(2616005)(6512007)(26005)(4326008)(316002)(53546011)(83380400001)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE45QzJaTUhTcmxIVDBwTFNpUDlWRW1Wa2FhT2VrbERjUGlTZ2VBRTFxYzAz?=
 =?utf-8?B?Um11K1h1dU5DaXFBZUdJYjRrOEZ5UExJVEh6Q2xkSzM1ejBTRC9uWittZXp4?=
 =?utf-8?B?ZWRNK0dkVnFtU1NtUkxiM3FIenNQVTlUWVFuSXhpbVA3UFpCTVM1TElOUDhR?=
 =?utf-8?B?QUV1YjFSS2NCT3hZOW0walA3VDRucWQyaFBLSGd4c0Zadm1rRDA2dy8yR2Rq?=
 =?utf-8?B?WnNxWWY5MGJ0NEoybWx4VytDZjgwbUVNd1c3V2tvblpkNnd2d25QNWpQOTUv?=
 =?utf-8?B?ODNrRmtrSXEzVUZCaFNmRFNrdjl1WVpIK3BSeDN3eWtNdDBlMU9IbS9BelI0?=
 =?utf-8?B?QjRpbnFUVC94QU80NVFrdjhPc3ZRSVpTRmFjMmJ1SDdGQUtsekw4VFhWZksv?=
 =?utf-8?B?ZTFDVDF1SEhZSkFEYkJLMUd6aVc3VnlUcXV0Um41cHA0alFNL0pkWHJPRDVk?=
 =?utf-8?B?dUVBb1B4a2FhcHNHeEZlT2dIVVovaGtoOUUrdXBBRlBzQkFFTFh4eURzZnIw?=
 =?utf-8?B?OGpDK3p2QTRHNTlWQWQ0S2tka1MrNWV5OGZPdUlqVmpsZjRWejFPdDVPNVIr?=
 =?utf-8?B?Zkd3NDRVQmtaUGpwTnNtdENMcFRmTjEzOExjRHJwMDdmTitWeHN4K3BtKzIv?=
 =?utf-8?B?TkpJc29JVjdZRWNCZzY5dXNPV1pTRHJ3ZW5lMmVkWlFWd2FhZlVUNzNKNWJ3?=
 =?utf-8?B?NGZReGMyN2REY216RFcvUC9hZEVQc0pXK1d3MnpMSmxjQ01PMTIyejdiWnJa?=
 =?utf-8?B?TXBGSUFYRzJFTTFJMEIyaHMydlpSQkpLTWJYc1lZRzkzR0lQZXFRdUpNSU5u?=
 =?utf-8?B?T0hIMGZXdHFoKzl6TGl3RGJMZjUrY2Z6UzUxYktpZEdCT2dEZzllWkNMMEs5?=
 =?utf-8?B?eGl3M2t4Yy8wR0ZhcHRWN1RTZ2dBWGdZcnplQ2tZcDhOOGh5dU5mN25IOWF4?=
 =?utf-8?B?YlBUdUVFV2NGSGFnQnRDV3gvMFBpbzZxcDNSNm04cENuTFdqQmlRWEduQ2xQ?=
 =?utf-8?B?c0J1dGxoc3hNQ3lETkdTSklUTnB3RXVzZi9zT2tNUkV1K3dMOTUyQnA0azVa?=
 =?utf-8?B?SlMzNHZya0ZyOHFianV1SzRzREJmbzdEWVFhNFJKQ1UyWmw0aW56ck51SDdP?=
 =?utf-8?B?Rm9zdm9ESE01YUI2ekk3RWpFV0F1NlpEZGtBMXpwb1FuUVpESFZtamtvbFJH?=
 =?utf-8?B?NThZUnpxcHh3aHJycVY1MklYczVTaDFickcyalo0TmUrWHNlaVdmNTg4bTFo?=
 =?utf-8?B?a3NaWVd4MGg5cnE3NXJwTGlUUCtQY3JWNFRBUHdWYjFhb2hOT1k1cFVEdnhx?=
 =?utf-8?B?cmFhZ0Z5a1o5aTloN3VGeWcwWTE5RXVndzUvQitwNmhPYk10UWNBTUtnTllt?=
 =?utf-8?B?WjRCcnQ0ZTRBOVB0OStrYVM2RjNhTlVEWERHR21xdXVockQzQVo1ZzIxVGtn?=
 =?utf-8?B?d0oraGpwdDFGSDIzVTRkdUNxa3QyWkNFT0NCTU5CS3Z2QVUrNTd6dVRSMmV0?=
 =?utf-8?B?dGs3Skl1Ry92TzJidC94V0ZIUDE1aUtqSUxoaUJVWjNmejhBRmt5dWxOOGUr?=
 =?utf-8?B?cFh0R3hCWGVWMWRTTVk2VE02WUcwRFlJcjRQTEM2SHIxNndCcHV1M0dFQUpI?=
 =?utf-8?B?WnlSZHNWcTRDZjM5ZmozWndhbHhMVVcwUXU4WjRvUGJWRkVkVHVycUtvQmd0?=
 =?utf-8?B?VjlHNncrcWlvRngvR05MOGI3QXMzQkVVa1JmVSszS2xSMmxURXhMU3M3a2hO?=
 =?utf-8?B?ZklDb0ljMlVZVHRQZ2VqQk95KzMyZnk2bms4c3YxVzJTTHJkbnVMTHlkS0ZS?=
 =?utf-8?B?dXJCVGs4MVY2U0Vnc2dQdXNSTTNtL0RxbDZXZUYvSlZtbFJPc1FsRDV5VHBT?=
 =?utf-8?B?by9DczBTUllwVVpEUWhmQ3M3R1cyb1hWaXJ6VGY4TzBLaDhuNkUyVms2Mjg5?=
 =?utf-8?B?ajJTdXR6KzNmTHRvUlhSTUVld2l6YjRCWHJDOTRkVG5IV0hZMndyZUVnbHRF?=
 =?utf-8?B?QVBJdllrc1d5VVVQZDdTeEROZUhsOVh4b1dnZFdSZEtTd3RqZTUyMm1YNXZo?=
 =?utf-8?B?VFd2QkxxRTAxR0QyUDd3b3dKQVRZSFhMa3FCNitVczFnRkxGcHE0M0hiQ1Jk?=
 =?utf-8?Q?I3MFOkbowTtUd+jtH8Y9CDnxt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83970bb-2fbd-4bf8-eab1-08db26c0b496
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:22:10.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o47zv1zj+aC5SkEyzjkjJcktEVZfEfJlVPo/m5zkgMYaYMfbQhCYp/GFXNoBzXwRe3nz04O1MfBLGBbvlawOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9832

On 16.03.2023 23:03, Elliott Mitchell wrote:
> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
>> On 11.03.2023 01:09, Elliott Mitchell wrote:
>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>>>
>>>> In any event you will want to collect a serial log at maximum verbosity.
>>>> It would also be of interest to know whether turning off the IOMMU avoids
>>>> the issue as well (on the assumption that your system has less than 255
>>>> CPUs).
>>>
>>> I think I might have figured out the situation in a different fashion.
>>>
>>> I was taking a look at the BIOS manual for this motherboard and noticed
>>> a mention of a "Local APIC Mode" setting.  Four values are listed
>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>>>
>>> That is the sort of setting I likely left at "Auto" and that may well
>>> result in x2 functionality being disabled.  Perhaps the x2APIC
>>> functionality on AMD is detecting whether the hardware is present, and
>>> failing to test whether it has been enabled?  (could be useful to output
>>> a message suggesting enabling the hardware feature)
>>
>> Can we please move to a little more technical terms here? What is "present"
>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
>> also left unclear what the four modes of BIOS operation evaluate to. Even
>> if we knew that, overriding e.g. "Compatibility" (which likely means some
>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
>> In "Auto" mode Xen likely should work - the only way I could interpret the
>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
>> speculation on my part ...
> 
> I provided the information I had discovered.  There is a setting for this
> motherboard (likely present on some similar motherboards) which /may/
> effect the issue.  I doubt I've tried "compatibility", but none of the
> values I've tried have gotten the system to boot without "x2apic=false"
> on Xen's command-line.
> 
> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
> I see the line "(XEN) - x2APIC".  Later is the line
> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
> leaves the x2APIC turned off since neither line is present.

When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
mode. Are you sure that's the case when using "Auto"?

> Both cases the line "(XEN) Switched to APIC driver x2apic_cluster" is
> present (so perhaps "Auto" merely doesn't activate it).

Did you also try "x2apic_phys" on the Xen command line (just to be sure
this isn't a clustered-mode only issue)?

> Appears error_interrupt() needs locking or some concurrency handling
> mechanism since the last error is jumbled.  With the setting "x2APIC"
> I get a bunch of:
> "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
> (apparently one for each core)
> Followed by "Receive accept error, Receive accept error," (again,
> apparently one for each core).  Then a bunch of newlines (same pattern).

This is a known issue, but since the messages shouldn't appear in the
first place so far no-one has bothered to address this.

> With the setting "auto" the last message is a series of
> "(XEN) CPU#: No irq handler for vector ## (IRQ -2147483648, LAPIC)" on
> 2 different cores.  Rather more of the lines were from one core, the
> vector value varied some.
> 
> Notable both sets of final error messages appeared after the Domain 0
> kernel thought it had been operating for >30 seconds.  Lack of
> response to interrupt generating events (pressing keys on USB keyboard)
> suggests interrupts weren't getting through.
> 
> 
> With "x2apic=false" error messages similar to the "Local APIC Mode"
> of "x2APIC" appear >45 seconds after Domain 0 kernel start.  Of note
> first "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
> appears for all cores with "Receive accept error,".
> 
> Yet later a variation on this message starts appearing:
> "(XEN) APIC error on CPU#: 08(08)(XEN) APIC error on CPU#: 08(08)"
> this one appears multiple times.

That's certainly odd, as it suggests that things were okay for a short
while.

> If one was to want full logs, the lack of secure communications channel
> would be an issue (since filtering out identifying data is difficult).
> DSA-3072 with SHA2-256 is now less than wonderful, but DSA-1024 and
> ElGamal 2048 are right out.

I think how good or bad my publicly available key is doesn't matter here
at all. You're not asked to provide the logs to me or any other
individual; you're asked to provide the logs to the community, such that
anyone interested may take a stab at addressing the issue. Eventual
patches may also want to refer to (parts of) such logs, which wouldn't
be possible if they weren't to be public in the first place.

Jan

