Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39FA19A2A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 22:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876034.1286413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tahzT-0002kP-BE; Wed, 22 Jan 2025 21:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876034.1286413; Wed, 22 Jan 2025 21:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tahzT-0002i6-7p; Wed, 22 Jan 2025 21:10:23 +0000
Received: by outflank-mailman (input) for mailman id 876034;
 Wed, 22 Jan 2025 21:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwLx=UO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tahzR-0002i0-2M
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 21:10:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47e48da7-d905-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 22:10:18 +0100 (CET)
Received: from SN6PR01CA0011.prod.exchangelabs.com (2603:10b6:805:b6::24) by
 DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Wed, 22 Jan 2025 21:10:12 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::c3) by SN6PR01CA0011.outlook.office365.com
 (2603:10b6:805:b6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 21:10:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 21:10:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 15:10:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 15:10:11 -0600
Received: from [192.168.62.40] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 22 Jan 2025 15:10:10 -0600
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
X-Inumbo-ID: 47e48da7-d905-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOjemcsZOnKu25m1QgoCG9vH2Tt8NTplmXjZDjxGQVOGSS5YzXxra7y+Nb7KgEQ2IDQMrG0r01yBuQIjwN8AvvkMSPzaQT3ky81uOsyc1/9QG9rZguX2i79FOd/2ji2spTsCRKlPazDVUJL04jhfniVqtYH38ZnMaFXIMASHBT6uLKRPmqoGvU0GBrfijFN06QIvz72OY2rO8ggET0SsC2hDfgfpk7cMkd+u7w8a/9m2arL1dBxIiK+C0QIhT2T8NLXEQt6KOty7alH4OyYwAnNn2lIT0pv7piuGpirqliwTfdagJyVabLnpFmP8PNxp+sFhq8A8HF/E0tRLLD4yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZebZP97Gkv980sGkf0i4UIqMoPKku5TR0lgvSI1jARs=;
 b=Q2bW/1OVpmwv5SlGO8/A37KlyWHjaJVLqULBhWAz1XvlVpzJsuejk/6AeuEt5QW6ez9lsIPNM/CN/gA/+byPz0VzAGWjaVuZkRDqkyfC+lOwSl/LYw+RrXlzPumr473ag+RKUTSVdhUhC6lOqI/I6OX6ceodqlEyQrnjWLvYAxhZ876homtNViIfkHEk5nCjhFmDcQiOYdjoeTT1+CCaugUa2+JOD+3775hSVpqt1UeaqXLtGABzhx/aEguH8+2TmeuD+7AN2ZmBkYrixFDdJCHc32uARFp9ZJ2n/JCL9H7proZea9/AFZgPXeR3pduyhvwltgqErdIcI/EIBqN5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZebZP97Gkv980sGkf0i4UIqMoPKku5TR0lgvSI1jARs=;
 b=JZIhKg6HdobzTb3NiXtN7RVCWAExxnMaQAiY+v6Hk5cml7Zwadl766DIir3OMZKHY3Wi8auELX2gUdPWzWsQRql91ECl/lVNC7HdNkc8eZZnsClq0zRqA6YoHXVkeQG93gwqzBNuwdlO8fKJ/v9Pqr38W2Fl9zcenUmfcqEn+yw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <22bd4587-cd00-41d4-a21f-102c6c61c942@amd.com>
Date: Wed, 22 Jan 2025 16:09:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/24] arm/vuart: move vpl011-related code to vpl011
 emulator
To: Jan Beulich <jbeulich@suse.com>, <dmukhin@ford.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-2-c5d36b31d66c@ford.com>
 <99bda095-391e-4825-9bb4-c21b7c5e1813@amd.com>
 <68e3da06-2b21-4f42-8d24-2743290ac562@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <68e3da06-2b21-4f42-8d24-2743290ac562@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: caa07a86-a68f-46bc-47c8-08dd3b2928c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVFTcTRYOEQ3alpLT0w4UnltK2hjc3JJeWdNYU92Wloya0Y2bWdYUmMrcEJ4?=
 =?utf-8?B?M1NOcmtPMWc4NkJjTnNKWXoyNjdLZGhEeDdaMzdHMnN4WHF1WFREZFR2dVF6?=
 =?utf-8?B?dzY3aUI5aFp4VzlRdDZxSm5MUit2VHY4V0ZBYllWTmtsZmtDSG1ubmtPYzBV?=
 =?utf-8?B?a0xKVFYzZGdSZzNyWlp1RDc5bVRVdlFHVHIvV2F5eVg3dXRCUlpTMjJ2dC9S?=
 =?utf-8?B?UmJlOFZsQWlkakZ6YTFEZ3hPMzFlNDFJL3RUaG9MMEdvYVd4eUxQNFZ6Szd2?=
 =?utf-8?B?dzFGVTFUTGFydCt5QjdmTjhRcitURk5lRUh1Z3MrZWNxemlMN2dESmQ5dXZx?=
 =?utf-8?B?RVhSTlRaT3NiSURXVTZwbFBLdnpXUjZaRjRxZEgwN2RBemErZ3R0V0RBc3Rp?=
 =?utf-8?B?YXBEQUZ2ZjNBMEgrL0doTlp3YjNibTk4OTZTSHVnbGJVR1p6R2xWRGc5U1FL?=
 =?utf-8?B?cG0yWlY1eHZrbFhkOTJlZm5aRnlKTU9LQ3ZWbDJnZ3NqL1ZSUThsVVdOdzZm?=
 =?utf-8?B?d21KK3NrT014RGxvUE9IS2ZQUktmMFJ4Uy92QlJ1dlNGT0VJSWEvejRUK0hx?=
 =?utf-8?B?NzhWQmtUZXYrNitsOHhlSjhlLysxUEx4TTB3UFdvaUpreHUzbDdsL2d2NGEv?=
 =?utf-8?B?eGpTMGxUMDVnbnNEeVphOCs2L2x4NkJqSWE5U0pTcFljM2VqNktOZjErcFY2?=
 =?utf-8?B?SnhlOEVtTmxYR3Y1NFk5bTFoZHlkem90NnpGRE0yZ2FJR1JDK2VUbGtJb3dG?=
 =?utf-8?B?d1NMU1g4U0phWFJwWDZ2Wm91LzVnNFdNNkdZV29FY0VUSzRhQmw5M2dLVUpL?=
 =?utf-8?B?U0VSemZ0VW9LazFkc0UrKzJFUHZHQmQwVkR6STh6NEd4cHQvejlCMTNrK2FO?=
 =?utf-8?B?ZW1EQ1FxcSt1aEkrK3MwOU9LTkZsTnZBcmYzQjdzQ2hwZzVTQ3FLdlVkM3hO?=
 =?utf-8?B?TU1aSTA2Zzl6TklOS0xwdmZzWmZYYVh1Q3FRNkUwTnpNMzBzU1dvQ01KSlpa?=
 =?utf-8?B?Y2RmOFd0ZEhyS1h3ck1WSlluWlRJbFlnWnVlWUo5TTRVQTRHcTdiTm80OUR6?=
 =?utf-8?B?eVo4WTl1ck85WktHYUNSZE1WcVZOdE9zbFl5elc5dHNGTVNGbVhlTmJyZWdX?=
 =?utf-8?B?Qk81RS9qUXJzdWZMcEh4NHdjelVnTlRGeVdQdC9jL1EyUHNTMXQyT0J1NS9M?=
 =?utf-8?B?SVcyRmt1N2E3Z0NvdmpISG1nbFh4NmtKMjdvRDhHWDh4eC9mdytmTzRxOWNF?=
 =?utf-8?B?dFdTdWpxckVyb0t5OXJ0UE10c1Y2bTJGMW9nNllCSHNibDBwS1JWTXI4ZVpq?=
 =?utf-8?B?d0xlN1VJOStGaXFrTjVNd3lsNFRuZ2ZPTE5PY2cvVHhia0pMa2Jna1U4eHVz?=
 =?utf-8?B?WjduYXZobXd6bk0vQVpoaHhOSjFiRTlrWWlMQ1ZQNmlwTUhwenBlb2ptOHlp?=
 =?utf-8?B?RDZkRG9JMm51UzZoYkNhSldmdlBYeWdXbUh2Q3hmbGhidTZrS3lZdDhUOFZy?=
 =?utf-8?B?YWtRRnlPd09La0p3ZjdCOThNYkRwcDlDdVZJNFE2Q0lRWUdtMlJjbGU3d3V6?=
 =?utf-8?B?TE1nKzFDRytidklyWVRtZXNFSFVjRWYyU2xMVk93VzNWVXhIbGV1WG0wME90?=
 =?utf-8?B?SWxTYU1vNzQ5dHYxQWJRVy9JRGNsbUc0Sjh0MUFkSTFsVG9CNkUxVmJvMzYw?=
 =?utf-8?B?UXJmM0Q3emZhSDMxbVQ0Z1NhR2tiRjE2NUw4T1p4TmR1VlluYjcwaWl5c29K?=
 =?utf-8?B?R2RpQ3NRcGlUZUhRWmFoNUpUSC9iL2RWa0Jra2dVVHp4ZmNCTW14NTlIME5z?=
 =?utf-8?B?VllXQjNKc0VUWFNTNEtIQThSMVd0Q1g1ZWpMUGVscm9qSFZ4QnF5M0sxT1p6?=
 =?utf-8?B?amFwQTh0SkRPZjM0Qyt1MHdKa0JBRGE2YjMzQXIzS3pvLzNoR1VlVkViLzlC?=
 =?utf-8?B?Q0dzeFNnRGVmMmZjaDNZaTgvSUZiL3FGdW8vUDB5anFDNzNKS05WZC83TEJ0?=
 =?utf-8?Q?F73UOfsgNhmD/ZYjDZoQco0mcl8nE8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 21:10:11.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa07a86-a68f-46bc-47c8-08dd3b2928c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353

On 2025-01-22 02:26, Jan Beulich wrote:
> On 21.01.2025 23:56, Jason Andryuk wrote:
>> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>
>>> @@ -579,6 +571,9 @@ static void __serial_rx(char c)
>>>        if ( pv_shim && pv_console )
>>>            consoled_guest_tx(c);
>>>    #endif
>>> +
>>> +    if ( rc )
>>> +        printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
>>>    }
>>>    
>>>    static void cf_check serial_rx(char c)
>>>
>>
>> This will print the ENOSPC that was formerly silent.  Since this is
>> input from the console, that seems more informative to the user and okay
>> to me.
> 
> I don't view this as okay. For one it needs to be a guest log level, such
> that rate limiting can suitably suppress too many of these messages in a
> short time (which in particular might happen if the ENOSPC reason isn't
> dealt with by the receiving domain). And then I wonder whether this
> wouldn't better be even more strongly limited, perhaps to just once per
> domain.

I was thinking of a user typing into the console.  Silently dropping 
characters is frustrating when you don't know it is happening.  On the 
other hand, if the domU is echoing characters, then the user receives 
feedback on their typing.  So maybe silently ignoring ENOSPC is okay?

ENODEV could be okay just once.  It could also be helpful to get the 
message if you come back a week later and try to type into the same 
console.  But these the user should rate limit themselves when they just 
keep getting errors :)

> I'm also unconvinced of KERN_ERR - from Xen's perspective nothing error-
> like has happened, once again most notably for the ENOSPC case. I'd view
> this as a warning at best.
> 
> Finally: Why d%pd? It ought to be just %pd.

Yes, thanks.

Regards,
Jason

