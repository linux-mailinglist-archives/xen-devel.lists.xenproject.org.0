Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBAB11ECB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 14:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057760.1425474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufHev-0000jb-1c; Fri, 25 Jul 2025 12:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057760.1425474; Fri, 25 Jul 2025 12:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufHeu-0000hV-VB; Fri, 25 Jul 2025 12:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1057760;
 Fri, 25 Jul 2025 12:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufHet-0000hP-7Y
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 12:36:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edef2250-6953-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 14:36:05 +0200 (CEST)
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 12:36:00 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::11) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 12:36:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Fri, 25 Jul 2025 12:35:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 07:35:59 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 07:35:58 -0500
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
X-Inumbo-ID: edef2250-6953-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeKEUN/Akz9HMzcQny0GrM79WL3iIqu9M97vGkeRIGi6uCetXc1yxV/jafH+XxVqL65KnOzJdd6cmtoXU8DYItztaF/f6R2NDYixGXSkY89QWJ6LcFlrCD564pa0e1wNT0vsjwX3/rfFQovRa0CBv50rBFEOwGp4NccwbHjmEtWu6oYSRple5T7dCbVOIXvLgGBiStnp8VOggsMU/J2toUjXuzLhBU5VN/Lh6UWAK7FUmju6wMih6Hq1C3z4qADLV87uoLps/SAyjVsMzGYgn/d01BE1tiQ3RmCk8RcnShvq24oEYFDfdb6GXgqNdkJow4g7ctf/xeJvpxryu7I2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKTT7P1w9ynPZynKGyP5ykIsXF9168p88SZZONY9UBg=;
 b=WjF9UPFbQ8SuX7ySbND96+P9WFZHNJzfy+KCGXIbuoeVnFleW+1N27eocauAoV21+k4KycwMUsotzz58hvMQYhJHiSEfq5OMsj6hwctTJRY4V3LVa3+5mU30dXOp8xuii8riYI/Vd9tNp6o2D/m9VTkdEGZx2mzdCh0cPXNJidLL3BFkBLinL7Lg0587H58JDh7x3K4KIBW34O3PU7k/SdFbUT7JoXkuYNFKvA74qFMZVGzUfu7JOkrQ4Ho9cJJ7GauRhVnxND0o7pfUzmM9iJ7yG3iti0xPnm/pUwjvlrmiWlP6JdG3SItVsKUMizjrbQU05+VbUa2hBU1Qa0Do5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKTT7P1w9ynPZynKGyP5ykIsXF9168p88SZZONY9UBg=;
 b=w+0/zytsqyAnHgCWs855G/ZV5Rvg/4xAomUElozyW0TG5A/Fa9+zOR3spWYecKZJiNjSYcDF8d3B8Qe8fopbTrpwkb/G9rU4vjF3WH8ri4xMBKxWkKI0mILu0xbPF/rWIEXhVgpd+1kEkFNldIWJAU63SAExQBmVVgcDoRXc1G8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d49b8330-eced-44bb-8c77-e1c587cc737c@amd.com>
Date: Fri, 25 Jul 2025 08:35:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
 <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
 <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8307e1-b4ba-4c3e-c85e-08ddcb77cf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDlCQzZsTGNTLzE4YkRhMW8zTXJjZHIzeXNiOW9aR1JSMEgyMWRNaUZVdFND?=
 =?utf-8?B?V1ZTZVhydFRlMUQvNEovWkpqbHdrR2pSbnN3azhuYkRGY2dmR25HZVRGVjdC?=
 =?utf-8?B?S3JTOTlTK3ZQS2FOU1FWZHlrcExKaFZHNFVHc3ZHeGxyKzZ0R1JUZTRyNGtK?=
 =?utf-8?B?VUFSNUN3OU9LY3F5SjdlOXI5b1N4ZW1FOU5vVUZqRG9aUFl6eXlCVDJjcFlm?=
 =?utf-8?B?Y0xMSWRLTlI0OFNzRFBvdWo2Q01GK05qSnc0bUNqRzZvOFlJeS9nYUR4dm1R?=
 =?utf-8?B?ODdBdnhBL25ER1lsZVhpbFp3NmxjWjJpb1hGWDljdENGK0xpai80aDJaUERt?=
 =?utf-8?B?NUh0U3UvRUZkeFE5N01LNDdmY1JiSWJ3QUpBK003TlZMbDdyeCs5aXFKd0Qr?=
 =?utf-8?B?QjU1cGUvTzBmSkh5YmVDK3JTdzNLaVFvbElPU2NEeVBROWplMXBnbFlZVkRM?=
 =?utf-8?B?Tzk5R2VLb2FkejhBZG1qNlJJdC9lYjl0ZFFwd1hPT29HNXkzb1I1QTk0dUZ3?=
 =?utf-8?B?YWcxYlFxVU8zTUkrUFhvR0tkTFRyOWc1SlZsa1JVSysrWEpsWkpkRnNCS3FM?=
 =?utf-8?B?ZDByQ291eWlnZTJpaHlxQndrbWJ1ZEdpSk8vWUZEL2Zqc296enoyaDQ3REVo?=
 =?utf-8?B?V0RHY0piUnZFa0JHRlhZeGFFN2ZaN3FRWnFPNStZYmZZM1NEbkJOT01EZGJt?=
 =?utf-8?B?RldJT2F4YWNBVnRRdnloa3BVdUl5UlVseTdMa2pQRVdxQUh4UkZxeEs1WWgy?=
 =?utf-8?B?eUNQemVLU2RTOFlFM1NnUVAreXNjUDZ2bjlpdG83VVdyNTFzZVNTSmZRZFc1?=
 =?utf-8?B?SWl6T2hCU0d5Mkd5WW9IRXYzTlk4eUJCMmo3OWlkTjRlVzNRZUswaHBiZVM4?=
 =?utf-8?B?T2x2Z2V2dmh1TjZ3d0tyVFliQjh4SytITUN2Rk1CRFoyc0FkQlhkMHlZUDNx?=
 =?utf-8?B?amtzOUlNNnZhblR3ZXczUVc2UkVlQ0k2bWQ2ZUY3YTJWVmlJbkZZbW9DMGRs?=
 =?utf-8?B?dUJlazBqMVVqMVVCTkdFczV1TW5rQ0ExNU1RMWJ1ZlZWTW5oeUNHMFE1SHh2?=
 =?utf-8?B?VGJRM1R6WEk4TjBjVFp5Z3h2T1NVU0FaS3UrV1JzTExoclBSdUoyT2FzcXhJ?=
 =?utf-8?B?Q0ptUXpJNjZVQjJQdXJkaFBOZm9uOTFOMmhoVmV1RUNEUXhySlUraUEvZ29h?=
 =?utf-8?B?ZWJ0RE1mRFFMNSt3WGFaY0FLaWkvNEd3Mit5RHQ5c0lVZlYrTW9YRmlWTXAx?=
 =?utf-8?B?UDZwcWpKMnRzNEJDcDhGSnhiUUZaYXhvazcweUdkTFluZkxuN2pYZVBDaVNU?=
 =?utf-8?B?UXhmMEx2RUhkZFJocmJIakhPaTdnaGd1bUwra3VuaDRGbkRrVHZJTTYrTTVY?=
 =?utf-8?B?RjVQdzBrT1hjQ1N3RnEvdGdQaithcHJEZVV3c2Q2a3N3QkI4ZVUvOUVMVzFw?=
 =?utf-8?B?R0tHSHQwRWl1bVBkSXo4TDM5VlFKTHNXb0x5TGtUMFZycEdHNGRQNVpFYkV1?=
 =?utf-8?B?dGtOaTQyYi9SMk9HRm5tMmtzYXY2a1RYRlRNLzF1ZWNFRy9hTUFmNmsweGx5?=
 =?utf-8?B?Qi9ZSlhlV2JVcU5sS3Zsb1NkcDhTbXRyLzkxclJCbzBad3V4K2s4ZVQxTU1V?=
 =?utf-8?B?SE9nYnBSWGFqWUhHMDlNRzArREhPcjBKb0pSYnd2VzBteXc4RVJMeXNHdmhK?=
 =?utf-8?B?SVFQOEJOTVlvL3JDTTUySjQ1U2RIZDhsZDFPdExnS1c0LzVHekpZVDRDeEN4?=
 =?utf-8?B?YnhvbVIvMGd4aVEwSEpoYXVheDNKaTJ2OUhDL1FpcDFjSXkzMWpiMDI5NXJj?=
 =?utf-8?B?TnY1SzgzYkxkeVNuT2RxYWFiazZvUzlpRHlETCtjQmtiMEZzWkRZY3NWR0d0?=
 =?utf-8?B?TWdjZmtlMEZaeStCU2xyWUpUTkhTN1h5WDN0K1pZSWpTaDNzaUtobGtaWDFj?=
 =?utf-8?B?cEk1WWRxVFBMbFNGVXRvTUdlb3JrOFc1UFVyb3J6c3M4clV0QWhDM1I5OGhX?=
 =?utf-8?B?bTdPeWg0cmJIMVRCbzJRZ1VVZmswcjRISW9EZTJ2bU9qd3Y3OW82OUpjWjZZ?=
 =?utf-8?Q?poe6AI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 12:35:59.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8307e1-b4ba-4c3e-c85e-08ddcb77cf9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

On 2025-07-25 01:18, Jürgen Groß wrote:
> On 25.07.25 00:48, Jason Andryuk wrote:
>>
>>
>> On 2025-07-22 10:06, Juergen Gross wrote:
>>> Add per domain server features, which are initialized by the supported
>>> features at domain introduction, or by live update from the migration
>>> stream. This requires to add the DOMAIN_DATA record to the migration
>>> stream, but for now it will only contain the feature word.
>>>
>>> Advertise the Xenstore features to guests by setting the appropriate
>>> bits in the ring page.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>

>>> +static int dump_state_domain(const void *k, void *v, void *arg)
>>> +{
>>> +    struct domain *domain = v;
>>> +    FILE *fp = arg;
>>> +    struct xs_state_domain sd;
>>> +    struct xs_state_record_header head;
>>> +
>>> +    head.type = XS_STATE_TYPE_DOMAIN;
>>> +    head.length = sizeof(sd);
>>> +    memset(&sd, 0, sizeof(sd));
>>> +    sd.domain_id = domain->domid;
>>> +
>>> +    if (lu_status->version > 1)
>>
>> Is this why you expose lu_state below?  I can't find any other use.
> 
> Yes.
> 
>>
>> Are you guaranteed lu_status != NULL?
> 
> Yes, we are already writing out the data for the new Xenstore instance,
> so lu_status must have been setup.

Ah, right.

This looks good to me, but with server_feature assignment movement, I'll 
wait for the next version.

Thanks,
Jason

