Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEE8C5BB3
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 21:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721715.1125314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6xrg-00054v-5F; Tue, 14 May 2024 19:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721715.1125314; Tue, 14 May 2024 19:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6xrg-00052C-1z; Tue, 14 May 2024 19:31:08 +0000
Received: by outflank-mailman (input) for mailman id 721715;
 Tue, 14 May 2024 19:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gwnU=MR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s6xre-000526-MA
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 19:31:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed73f13-1228-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 21:31:01 +0200 (CEST)
Received: from BN0PR08CA0028.namprd08.prod.outlook.com (2603:10b6:408:142::27)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 19:30:51 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::60) by BN0PR08CA0028.outlook.office365.com
 (2603:10b6:408:142::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 19:30:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 19:30:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 14:30:50 -0500
Received: from [172.25.174.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 14:30:49 -0500
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
X-Inumbo-ID: 7ed73f13-1228-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSkQRB9EoVnuHyr/a7Is8mY3zM0wG6Fo2hbvxlLCJGWbJr8NlK8B8v301zU6PB7pxMARXABC/ZiJJndvw7TAkZ3J4vgoOJ8kTW3dWVQGo4L0jZvGtpSPmF1/5MNDwTi5S06ua0rTYU78ZQKyDj6IKQp31Q9v+u9TbriYHO75mKRoHRvmX6KKt6vK0KGf1M9VIa6m3LVZ7Rh1xQn52WGf4QM63Zmwco5Q5894gmXnPcHkPaaDqqfL1G0Oc8KYHnuVyajtbswMMMLityfN36dfMoMvI1bfkHxsTXynCYw2hqTUjVEs6kHyRqx7owTudA1wCHa/rp8LpZbj6jZM0ThxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HiN2/ngL8lzfBK0HAiA341EyVRfzfAdaOj4pY62+5k=;
 b=WyCW0CCLjcp3qU4ntToNlI3GG1ed/VNEw9H3/LmzYeM1Yie2+XUL8Rt0Wxf82eHgY4rffXSKnxtOL8BeFEc/TW0iVXpfhAPj9OYVinifXeHDVu0c9cmPRVLFMKPjgd491O1Cj94nsZnXYLjJLc/f5GANFIoi5v4kEPSYxFgv0qxhaNITIY71fTGW9oxdpfwLkQjxX+MDQx/+0EnLsdS5LMK61SvDjnp7CVPJRV/tSIZb7UyJIkzy5bmPb1G+pdBk/ebA3II1PCmDLFBW+BANUewMXv21ZpWYV5ehJaigQrx9U1EZa9gX8zbLNbjpJPYaWt8lI/WbRA9e85hXonpjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HiN2/ngL8lzfBK0HAiA341EyVRfzfAdaOj4pY62+5k=;
 b=qNRe500esttmZQbwPsCcfi6jWIctHYg7KuJ0GhduYyBFt9XUwjS+ygfWpbiXTBxYos5cjf0iNTUrNvkv13kVrkYhVPsLcQGgIduN5t9JwyK6QbKPMSYxvrhTKywxA2+oa0ZCNdk9kbE0KKZeEd6gWzTa5K96JTx8DBQNRK4IcBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <da33086c-10ff-42c4-b85a-0697c3659b8e@amd.com>
Date: Tue, 14 May 2024 15:30:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86: detect PIT aliasing on ports other than
 0x4[0-3]
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <039b9ceb-4862-4e26-a344-e47fc04bd979@suse.com>
 <0cfaeb1f-947a-4e45-9f69-a0e3f8143e2a@amd.com>
 <ecb8814f-f9bf-4eb7-86ce-48bdd34f8bf9@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ecb8814f-f9bf-4eb7-86ce-48bdd34f8bf9@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 497bffce-d136-4015-acc7-08dc744c5d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm9obDBRSTJKc0dJYVhwRDVoQlZCV2pPUlc5RGlKZm9zUkF1M3k0REVIS2d5?=
 =?utf-8?B?U29lQVgybnkvcEFqcS91YnVBdGsvaDJOQ1dMclllaHltUDhqQXBOcmtxb1hE?=
 =?utf-8?B?TXBOa2Y0a3NoY1g0aExqZ2VhR09JY0NtRTJ3MHdCWVpMVFRHUFd4a0pyb210?=
 =?utf-8?B?d3JIQlNEMzVhRDU1OThha25lL3Rydnh5Q3M2RVFiM3hkRVhHLzNqTjVTOG82?=
 =?utf-8?B?OGY5V2dYaG5FeXRFNGFVa25ZUEdXMENNNTBjS0JRenhWVm1FbmE3MnFoVXZw?=
 =?utf-8?B?STV0U0VsalZoNmozNUNjMkRDV0JxN25CWDBrVExuaWtxUXUrQzBteWs3VEhx?=
 =?utf-8?B?OEhQWWx4cUdDRllGOHlGMTh3SFhrQ0ZVTjI5emVhSUl4RXlKSUp2V2RMbzlP?=
 =?utf-8?B?enRKWXlPcUwyU0pDNTBTNWdUbHVLd3J3UW8xeGdhSURCdHJOMGFJeHg5VFc5?=
 =?utf-8?B?bjA2YklyWnNpVThJZ2JZRkxVSDAwUDBZRnRvbDNWczZadmc3WjVua1MyT2oy?=
 =?utf-8?B?YXprYTZNclIwSXRYb3lwTGFsb2NwMTY4OFlMT0RLaUJzaFo4R3RFcERFZGtV?=
 =?utf-8?B?MjAyQ3J0c2VnZmxWc2dPMDlJTE01YnpCVmduVFlrRHdGZjBYRHUyS1pYOFpH?=
 =?utf-8?B?SU9jY09oK2drcXlaRUIzdTVSUXhpUCt0ZDFIOWRiYy9nbzIvRGJkeGc1aFJ1?=
 =?utf-8?B?RUpiNHUyMjhjWDI0bGdQTTJuejlCcG9Ib0FsN0tJMXBzclkzNGFsaDg5UUlv?=
 =?utf-8?B?R2QydHVQWGpMcE03NW9JeDVCRG0yVm5ZTnJLWTQxL0pXWWpPemtLWUdCeHBn?=
 =?utf-8?B?cHl4QXZ5YnExWGJvK0J6OTd0Qmg0Rm5rdTZUczhUVWdEaEUvMGxPREJQajkr?=
 =?utf-8?B?djU0dExSUitpZHZ4a0ZQRGFjazlNbEE5K2owcHhIMXlpbUlTMHBpcFZTT1VJ?=
 =?utf-8?B?UkMwSy9GMWFiRkJiTm1CRzBSR2V2eDdZS1oyWUNvMGIwVHZGSXJqd3pyTC81?=
 =?utf-8?B?alNRdmVhMkxINEh3ekdFVXByamk3WXVLdVZCME5qNEJIdkpzMmhWTWdnVWhO?=
 =?utf-8?B?VjBMNjFVcVhnc3RZUUVMeFFGWlB1dDRwZkhzc3JJVHgvdnhpd2tpdTg0a1JN?=
 =?utf-8?B?MC9pSDZJYURybTRlamlyYXllS0FRemNySjlLSTFaQnRuU1Zvdm43QnphOU5j?=
 =?utf-8?B?bDRCRFJSYzE4RlRMU1ptZzNST3lUbXJ1SXNxUDFyM1VTNFJRRm1HbHlBWCtC?=
 =?utf-8?B?aVZOR0MvS2RaaVpCYzZUMnJpWDROc1NFR3M1MUVKZXcxWnpxOU5wdnRieGJN?=
 =?utf-8?B?K1p0eWQvbEJ0eTUrVzlKVjhrMG1uT2tOWlRGOEE4ZkVodmF2QTV4eFpTMFZl?=
 =?utf-8?B?Y1E0aG8xak9XVnBWQ2wvQUxLUC9rNlJBK0RDVnB2U3AvMFp5dWllNFdaUHJs?=
 =?utf-8?B?Yk9EWGgzcFdMaVdhMDY4NkpkTGxXY3dnaGI4QzFFZFphUzlUUm9ic2dqOTRK?=
 =?utf-8?B?Z1IrTE9yN1Q2Vmtaa1ZZdUxrUDRFVWQ5a29hM0YwNTRBVjNQRXhkMXRWNWpW?=
 =?utf-8?B?b0IwbGc0ZzJzbEpyTnVDRUZOQ1BNb1RnMlAwQ3pMQkhocVp2emVRZ05saTV4?=
 =?utf-8?B?Z1ZvdmxtQTFjcEVFUFZvaWNRUjJaK3EreWpSWWRoUTdHVk9CNzlXTy8vV2Jr?=
 =?utf-8?B?ZVRVRFZqSDA2b2g0MEtFdHRRWVZIQnh2VE9OQW1vNXhiV2FBclFTVDRvZDkz?=
 =?utf-8?B?MXVtQktPeTJUbkZyd1Robm4wTktlc2hYL3lIODByRDhnVkxtQUMyemJITFkw?=
 =?utf-8?B?SkgyTkUxWnozRzdNMExacFZJTlhqQ1lqUDBXMVRqVW5xTjhzRjd0NFo4SVNF?=
 =?utf-8?Q?jnF1rSKKAgp6C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 19:30:51.3038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497bffce-d136-4015-acc7-08dc744c5d6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434

On 2024-05-14 03:43, Jan Beulich wrote:
> On 10.05.2024 19:40, Jason Andryuk wrote:
>> On 2023-12-18 09:48, Jan Beulich wrote:
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -425,6 +425,72 @@ static struct platform_timesource __init
>>>        .resume = resume_pit,
>>>    };
>>>    
>>> +unsigned int __initdata pit_alias_mask;
>>> +
>>> +static void __init probe_pit_alias(void)
>>> +{
>>> +    unsigned int mask = 0x1c;
>>> +    uint8_t val = 0;
>>> +
>>> +    if ( !opt_probe_port_aliases )
>>> +        return;
>>> +
>>> +    /*
>>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>>> +     * we have a 16-bit value fully under our control, to write and then check
>>> +     * whether we can also read it back unaltered.
>>> +     */
>>> +
>>> +    /* Turn off speaker output and disable channel 2 counting. */
>>> +    outb(inb(0x61) & 0x0c, 0x61);
>>> +
>>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
>>
>> Channel 2, Lobyte/Hibyte, 0b000 Mode 0, (Binary)
>>
>> #define PIT_MODE_CH2 (2 << 6)
>> #define PIT_MODE0_16BIT ((3 << 4) | (0 << 1))
>>
>> outb(PIT_MODE_CH2 | PIT_MODE0_16BIT, PIT_MODE);
> 
> Hmm. I can certainly see the value of introducing such #define-s, but then
> while doing so one ought to also adjust other code using constants as done
> here (for consistency).

I had to look up all these bit values, so I think it's nicer with 
#defines-s.  Particularly, using PIT_MODE0_16BIT for the programming and 
checking shows the relationship.  I wasn't looking to make more work for 
you.  This function is self-contained, so just using them here for the 
time being seems reasonable.

>>> +
>>> +    do {
>>> +        uint8_t val2;
>>> +        unsigned int offs;
>>> +
>>> +        outb(val, PIT_CH2);
>>> +        outb(val ^ 0xff, PIT_CH2);
>>> +
>>> +        /* Wait for the Null Count bit to clear. */
>>> +        do {
>>> +            /* Latch status. */
>>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
>>
>> Read-back, Latch status,  read back timer channel 2
> 
> Was this meant as a request to extend the comment? If so, not quite,
> as the line doesn't include any read-back. If not, I'm in trouble seeing
> what you mean to tell me here (somewhat similar also for the first line
> of your earlier comment still visible in context above).

Sorry, these were my notes as I was interpreting the bits.  I should 
have removed them from the email before sending as they aren't 
actionable comments.  Read back was in reference to writing (3 << 6) to 
the mode - not the action of read backing back the value.

>>> +
>>> +            /* Try to make sure we're actually having a PIT here. */
>>> +            val2 = inb(PIT_CH2);
>>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
>>
>> if ( (val2 & PIT_RB_MASK) != PIT_MODE0_16BIT )
>>
>> I think particularly a define for PIT_MODE0_16BIT would be helpful to
>> show what is expected to be the same.
>>
>>> +                return;
>>> +        } while ( val2 & (1 << 6) );
>>
>> I think Roger might have mentioned on an earlier version - would it make
>> sense to have a counter to prevent looping forever?
> 
> Well, as before: The issue with bounding such loops is that the bound is
> going to be entirely arbitrary (and hence easily too large / too small).

Ah, yes.  Your response had slipped my mind.

>> Also, FYI, I tested the series.  My test machine didn't show any aliasing.
> 
> That likely was an AMD one then? It's only Intel chipsets I've seen aliasing
> on so far, but there it's (almost) all of them (with newer data sheets even
> stating that behavior). We could, beyond shim, make the option default in
> patch 1 be "false" for systems with AMD CPUs (on the assumption that those
> wouldn't have Intel chipsets).

Indeed, it was an AMD system, but my sample size is 1.

I didn't realize this was motivated by aliasing being common on Intel 
chipsets.  I think that would be useful to include in the commit messages.

Thanks,
Jason

