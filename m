Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DEEA12BFE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 20:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873074.1284060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9Ps-00032c-98; Wed, 15 Jan 2025 19:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873074.1284060; Wed, 15 Jan 2025 19:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9Ps-000305-4p; Wed, 15 Jan 2025 19:51:04 +0000
Received: by outflank-mailman (input) for mailman id 873074;
 Wed, 15 Jan 2025 19:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY9Pq-0002zz-76
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 19:51:02 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1ae9e3-d37a-11ef-a0e2-8be0dac302b0;
 Wed, 15 Jan 2025 20:51:01 +0100 (CET)
Received: from PH7PR17CA0001.namprd17.prod.outlook.com (2603:10b6:510:324::25)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.21; Wed, 15 Jan
 2025 19:50:55 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::ef) by PH7PR17CA0001.outlook.office365.com
 (2603:10b6:510:324::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 19:50:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 19:50:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:50:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:50:54 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 13:50:53 -0600
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
X-Inumbo-ID: 0b1ae9e3-d37a-11ef-a0e2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt3GjgMtIe5Cu4iSL79/8dEJyl26YEwHgofulbGVwdF08CDjKZlmAErlseHbmBs/e8tDg96PbMGgE0vgjKJl+2MBGxxu1zoLZK12c6yXOZb2+UXKiluNjz2b08XAS3Iccyg7teusAiH5RKmwybXG3V1lDvS+1yXrppg+pUJ47lh58HR+QkYLs9tkGAWcwh7YmbKgFb14+RFU2MuY1kXHoYGnioNr31ctepZA/w9yrH7tC484PiJzULWHaDTPEn7SuXU6NFWXyOk+3hee4+YbGfR3W7l/m3PGKgY3DQRWG4oanJwWYTDgKBMQVEKBliJ4d8xSgFYK5nGOqY1b+1MfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seD+oyU96rm9OHwuiSKSM0dOceEInH33mH+S6spoIzM=;
 b=uhv21AuooVyd6Rwehg1NCxIACETacphnC474EnyXpdtjHeIZuDA3UkZtT5FkjHk+pXBJg2zECcPVc+aFRrpYzukvcPGdsYdFUzt9oZaE6tv0jUvVnR+BEOp+mrF5sDnCI+LznRBhea3wo3WmgYC691m1KtEY6FONhWJHqbSjAL6rMAA0vpcWwvC/ewTK40Jk6PHsFqulJeYsPyw933kDIoyOnuoRcPhLrAw4x9kBp9mJ/dW+s+jaD/g2MXcOuYSd4hT0Q2d6NnmrHq7Kq/hSQmIB1riPmEFknWRjmhbIe/TpZlSllSRmnlwCCKqxPAy4b1FR6CMcAMwtb5AdZFGYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seD+oyU96rm9OHwuiSKSM0dOceEInH33mH+S6spoIzM=;
 b=q3wpiaUfmpj+DZxBaTvJXiLgHEehgeso90XOq8cJG89AeMWowsA/KcPdYq5+02a9U5eLZvj6tcf7YmPT7xQAq/FQWg1CI7fCFRLwOGqJdV3Xgdscryt6dQMCmWzIGALLDtUcSAXd++30UuJcKRtan/hZl365hm7gtfTdk5rNykE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8b2f2a42-58cb-46dd-a278-069ccc03a4ad@amd.com>
Date: Wed, 15 Jan 2025 14:50:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-4-dpsmith@apertussolutions.com>
 <508cff3c-3fd4-4ab7-89ef-30a72a267111@amd.com>
 <245a2a00-98c0-498f-8a9e-ca62dbe59a71@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <245a2a00-98c0-498f-8a9e-ca62dbe59a71@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 1919d656-b119-44b7-0a53-08dd359dec60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bElDOHJQUWIvRWRENWxUTzgydkZnUHF6VDNTa2lWZHA3cWttNERmaHdBbUhY?=
 =?utf-8?B?UzhqQUUxUW84d1pFbThKelh5MDFVcmhQeUZ3TmNVQU9XU0p4Z0cxdGhFelAz?=
 =?utf-8?B?NnYzMmRHWWNicjZEUXlpSE9UQUFRZGZDN0swZFhhdVNueUdoNVhLb2ZZTDdk?=
 =?utf-8?B?NjM1ajdFWTEwSStkelQ1U1FvV2k0YjlqWXkwcGt1NGpZb1FUc1BKRDhxQUdB?=
 =?utf-8?B?MEV0SDNOTWNjZHE4S1RnaENRUVd3c1RxSEhHekpoREVqR01YZTFiaFdHdXNU?=
 =?utf-8?B?M05xSVFSOWQzMDNUU1NVWFdUVytCcDd2VjRjT0JWbityd0ppS2V5QXhjWUFw?=
 =?utf-8?B?S3F2Qmh2SVVSeUpZTU4vbW9nTkdXdUNpTGtIZnJ6c2s2dnJia1I2alNpenVH?=
 =?utf-8?B?aDF4TitQcWR5QmdkRm9XVlEwUm5PTit1SnQyY1ZDaDBGRWRZMWNCWWVqc003?=
 =?utf-8?B?RWJqeDVBRTRncVUxTzdFZm1UTTBjM1dHQWZJUzVMR2JhMnNlcUlSSVVXSWRT?=
 =?utf-8?B?eFhxdk9KckxPS3NiMlFBYXdYK3lRQ1VCY2xZL0dvdzJCT0Y2Wi9aQUYvaGpl?=
 =?utf-8?B?TzBjb004bDlEb1Y1Y1E1bmtMT1ZocUJsZFpoSlpXRW11ZmtWRThBN080Vndh?=
 =?utf-8?B?R0NxN3NLdDA2UDBjbXpYaUNoOG5scHEyRlRlT3d0L2dVSE80cnJFUW83QW9u?=
 =?utf-8?B?bHcrcmxrOVpVdGxmRERhbFpNdFZKV3Q0VXRNM0FwVEhNOVdBcUlnN2hsbDhU?=
 =?utf-8?B?aFJXcnhVZnA4WnJtZ291TWI1dG41MWpYYUNLRDhIeGFLWE81bGoyaUdRczlm?=
 =?utf-8?B?bWhBUW9rd1RPbGo4TDVlTzhDZU5rZ3FjT2MzbVFCRDZadU1vTWZkMTFmYmhv?=
 =?utf-8?B?ZEJFTEJRWUpyYWxoeENDVUpnU0hSaW1mZnF4U2Y5ZjM2QVI1MlF5UEpHRG9O?=
 =?utf-8?B?U25RQUlUcUIzcVRpZXc2QjF1T1RhemNXajh4OWxJYVFPSkpJVCsvdWNVK0l2?=
 =?utf-8?B?OFBDNUxWVW5IZ2J5Rm1lRER2aEJodTZkU2M3TlFjY1VZQ3pCRjdYN1FIYjZi?=
 =?utf-8?B?WGhuWnJOeGVJK0R2TzR2UmdYQ3RpVnBvVGZvSmltVnIyOWhPL2tVZnVnQld6?=
 =?utf-8?B?eGYxS0V3TDVWUnBuREpweGZuZFNGcnJaQ0JGb2UzSWFYVGFzMzZTNnl4NDVY?=
 =?utf-8?B?c2dlRUVRTm50dEpEWHE3Q3liNG56KzJPZTlUckFQd2U4SkJRdnZHamdNY3Ur?=
 =?utf-8?B?Nmp3Slh4TVpoM2h0N2U4VDFZc1dBNmE1aWVBeDNhU0Y0dk9DNGduK1JPaFkz?=
 =?utf-8?B?ekVFYW1NbTZneVc1aklaOUFIWmhEZXZlcitoT3MvZXJJNk96L0gyS3Urd0Z4?=
 =?utf-8?B?V1ppTVhGUVV1bGpwUFBIMm9BSVhTVFFBMHNDVWtPUHc5cDBTWHNwelFqUWJH?=
 =?utf-8?B?SHByKy82V0pzOGJUUlk5eGt2dkZVOHN5bk1KM0xOOU9ObTFEM0U3bkZQRERT?=
 =?utf-8?B?V2toY3Q5QWVBQUVPKytKcWFwYjBwVkprSzc2bXU4ZUY5UU9MczgxQmllYjVm?=
 =?utf-8?B?VHl6aTB5SHZaem00ZityZDBuMzJlL0JkcGtYalZYUisyU0lhTk43aHpGWFNT?=
 =?utf-8?B?NU5UVzJ0eElyYUhyYlNJckJTNGhBWm44b1BlTXM4OXVlVTNGUjVQaFhxNVBO?=
 =?utf-8?B?aUhUUml6UnA2cFd1RWsxaDNYMHBsdEpaT0tVZ2VEMlo2WFhncnlrYzNSTVdX?=
 =?utf-8?B?UUJWZDFsUW43ZTJvMmQrZDJJMzlqM29Na3M0TU41N25YSkhmTjE5Q25aVTdn?=
 =?utf-8?B?amsyMTh0ZkRldnpYNTRsQVV2K2JzMVVSYzhuY0F5VTBwUGgxN3dOV2FZQmxi?=
 =?utf-8?B?elI1d1k1d0RFTmJDTktZZjZkbmgyRTNyQmZNREV5UGlVRjFuT2ZsRlJabjhP?=
 =?utf-8?B?MFRmVzFhRm91WDlyMXdsZ0swL2UrTVBPRTJNSWw3L21SUFYyQzhRSlo0MU9O?=
 =?utf-8?Q?DoTyQ789a6QVWmRnjpY120mFH0upt4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:50:54.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1919d656-b119-44b7-0a53-08dd359dec60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

On 2025-01-15 12:22, Daniel P. Smith wrote:
> On 1/10/25 14:52, Jason Andryuk wrote:
>> On 2024-12-26 11:57, Daniel P. Smith wrote:
>>> Add a container for the "cooked" command line for a domain. This 
>>> provides for
>>> the backing memory to be directly associated with the domain being 
>>> constructed.
>>> This is done in anticipation that the domain construction path may 
>>> need to be
>>> invoked multiple times, thus ensuring each instance had a distinct 
>>> memory
>>> allocation.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>>
>>> @@ -1018,39 +1037,52 @@ static struct domain *__init 
>>> create_dom0(struct boot_info *bi)
>>>           panic("Error creating d%uv0\n", bd->domid);
>>>       /* Grab the DOM0 command line. */
>>> -    if ( bd->kernel->cmdline_pa || bi->kextra )
>>> +    if ( (bd->kernel->cmdline_pa &&
>>> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
>>> +         bi->kextra )
>>>       {
>>> -        if ( bd->kernel->cmdline_pa )
>>> -            safe_strcpy(cmdline,
>>> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), 
>>> bi->loader));
>>> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
>>> +
>>> +        if ( cmdline_size )
>>> +        {
>>> +            if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>>> +                panic("Error allocating cmdline buffer for %pd\n", d);
>>
>> I guess I wasn't clear last time.  Instead of two levels of indent, I 
>> was thinking at the top level:
>>
>>      /* Grab the DOM0 command line. */
>>      cmdline_size = domain_cmdline_size(bi, bd);
>>      if ( cmdline_size )
>>      {
>>
>> domain_cmdline_size() checks all the pointers, so this removes 
>> duplication and indent.
> 
> But it is possible for there to be no command line, thus there is a 
> legitimate case where cmdline_size will be 0. If it is 0, there is no 
> reason to go through all of this logic.

Sure, but domain_cmdline_size() already handles an empty command line 
and returns 0 for that.  So I think this logic is still skipped in that 
case.

Regards,
Jason

