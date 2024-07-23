Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436F93A5E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 20:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763483.1173753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKFv-0000Sj-Tx; Tue, 23 Jul 2024 18:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763483.1173753; Tue, 23 Jul 2024 18:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKFv-0000Q8-QQ; Tue, 23 Jul 2024 18:28:59 +0000
Received: by outflank-mailman (input) for mailman id 763483;
 Tue, 23 Jul 2024 18:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWKFu-0000Q2-EJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 18:28:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac73c71-4921-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 20:28:55 +0200 (CEST)
Received: from SJ0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:a03:333::29)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 18:28:52 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::fe) by SJ0PR03CA0114.outlook.office365.com
 (2603:10b6:a03:333::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Tue, 23 Jul 2024 18:28:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 18:28:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 13:28:50 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 13:28:49 -0500
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
X-Inumbo-ID: 6ac73c71-4921-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hus+TonpatTjnTwXA9HoYFSpDBOCXGTCKRR8UbG0x+7LoTNWThOsfUM1kronEfI0sttOm84mlpXX8EmenqMREfTZyZt184R/5Mg/bgI68D9xY5Atr+uiA4wmNBs7ecYB7Aha3zdtCeSad2VDO7t0CCGJTtD6Kuz/uSUP+GPVl2bwNBfBR/HEQ+FY+UvxiEbc1Ewz3rCmaUlqN2E+9wQ4PtMRIOOtUXswajtylPgxS/8B71XawLb01AITCO27pL0iclIJnHeGY9Kf1H+Ku2LK4Ns9a+xpXEUYk71yxXdkmbYgKHDGamqGqcEC5n04eGaO07v3hKtph0B+bQOadKTLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+DT8OJiqnlgbG5hYSt88xcANE9o/290vg2yp65LNGM=;
 b=omlYVKvvbiSUTg74QE0H2qFHoH3C/FPYHyQJtKCEACK1QaUTqzuKbJKM9++PqFnvbsiDyG8PcDdaN2TMLN8WsW9L/ZwGZaiIfSuO6EpKlBroXdcwnM3X4I40ROejg5/rOBXEMlR+W6el5RVv9kL8XQfQgB6Er1zm6BQmlh4V4OSXcVyiHkBkLfskGvNFjI1QkgRjJl5yLJTNF6cT2YW1YAfQcYfPpXypm1U5vFPjvne1nMuNB7l1JhP6UTOiVpBWkEfxCj/yLh1X71+7rZCZt99sL2rmIzno5qa8AKCMdRcCjvArdK+R//SK/YDrS8Xhk8egzAYk2qHqn17WeApgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+DT8OJiqnlgbG5hYSt88xcANE9o/290vg2yp65LNGM=;
 b=obWrpHyzsg+F+LmVIlb6OZHPCEXtMfC4hACHVLyKy+1uk2IqINv6bi5Owm113FeuFtODefyDWMuuyNc78DCIc10xFcsHlotb6uliB5xiwzi1ISENszWvYWcbw74I1oNBc4kpyniTzqzNZ6mZZrOPd8ALlfqeXB0Wz0sG04I9Uho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e5ee360d-d945-4807-a6ce-9a7b97b69bea@amd.com>
Date: Tue, 23 Jul 2024 14:05:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <oleksii.kurochko@gmail.com>
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14>
 <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
 <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
 <eb096455-cc60-4c34-b7e4-fb0345086934@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <eb096455-cc60-4c34-b7e4-fb0345086934@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5135a0-ffd9-482e-313b-08dcab454d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzdKamNya21uUDFCQXJMb2dDUjNTdXc5MnNFdlNZa1djb1BlTk5ONGR4bTM3?=
 =?utf-8?B?bm5qM05MRFZqQmlmM0szZ1dyZlZGNDJqVGtRNThpWGMrNDdjdXAyUFBBak5U?=
 =?utf-8?B?Q0dFTjUwbml2aVNkSFVnb3FDUEprNE1EajZqRlgvMjBRSHptTEZ3SE9ZakdQ?=
 =?utf-8?B?cjhqTkg3ayt6Q2Q4OTZ4aGY2N0RVakc4Z3hNSTU5UXhWOTJGTCs4Smpwa3p1?=
 =?utf-8?B?TUtRYWJoZnJSbmt0eVFSVkx0UXVRRDNiYmY4QWVHYkttYWZnYTlYSFdJb2pn?=
 =?utf-8?B?NTJzQzZVbjR6bnVYRGFPNjZibXB5aER3bXZYdzhwQ0FKRy9yOE9CaEJCOHF5?=
 =?utf-8?B?dWRvT2JRdWkyZTU1QVRoNEZqL2VrbGlFNXpETy9QRjhMQ2tHZjF3NVpvYStQ?=
 =?utf-8?B?cWJpWmFBdWFqWStiaGlMaFNieG9nd0lIZzJKZUltdUt5cWpZU3ZTYTBNSVEy?=
 =?utf-8?B?MzlFaHJJQkpLSkd6YkY1ZC96elhFZVBVRk1RSzNuSXhENjJHVSthZTZqK1p6?=
 =?utf-8?B?Mnd1cVpxOVk5dVBrdXhCRVQ5UXdRMEZ3VHBzak5GV0FRK0Q1QytCbEFEWXpi?=
 =?utf-8?B?SUpRSVlOWDRSMUIzNnJrYnhsWE92VnVZcEVJU1o1aUVGcTlwZVV4Nzg3L1d0?=
 =?utf-8?B?c1NQQXV5RUZiUXhpNlJjRVFwWDhoOUZWRjNUYk9aSW1sQ3VQNWpyNnozK2VN?=
 =?utf-8?B?MjM2Y1pnNGZoUGVxbVpUNiswSHZUK09XekM0bVMxUU1xTU9vblBOakJabzll?=
 =?utf-8?B?Zk92cEhPWTFJWjRKTm9qWVVvWG9UWWpGY1U0TDR4bVI0cmFnQm1YV3p1Ymt2?=
 =?utf-8?B?SEJ2MkRtbzVudXhmVE02ZnFHVldxTms2WUYwYU9Od1BDZXJta202UktHdWhZ?=
 =?utf-8?B?a3FYR2dMdXBOOFZyWU1wWXZoYWlGWkc4ZmF6VGJvRlNnaXNwMEpHSGV3RVJD?=
 =?utf-8?B?cjhFSjc2OFpSK1NTMkNqb0hmS0V2MUwwYW9hYU9iZDdjVERRZXh5NG5SdHEz?=
 =?utf-8?B?SEc3dEpsZFpldnVSc0pSS0lQYnJ0ZWNiby91RU0wUGlFUDNQNXZPVkhFTmZa?=
 =?utf-8?B?a3NnRlpId3A4bi9NaEhQdGFPTUlNRjdNc2VZbkV4L0NTbmI5cmZESDJGUGpY?=
 =?utf-8?B?Znl3NUhKS3J4Y1pKdVlUOG1oUkJZeFJkNE5YSVJJeDV4WVYyak5ta3U0eWRT?=
 =?utf-8?B?WW0xRUNrbW5DQTl5SDcxaENQeEQyWmNEYWNWR1I3T0xJL1lXSnhqSlM4TUcw?=
 =?utf-8?B?WU1mUW5jOFZleThzbVpWZjI0STR2QmcvZ3ZyWXc0SkJHazgzQ0ozMTZJejJs?=
 =?utf-8?B?THowemw0bHRuWVFucDBtT3l4YXBqTG5YK2NRUVY1ZnFEZXVVQ3RQMFdUOEZn?=
 =?utf-8?B?NG5PV2ZnNVM2OUszNFh1UlprOWk2YVhEdnBlTDNhM2FkaEcwd1FLcy9jUG9D?=
 =?utf-8?B?MlhURGdJNXZmN3NnZzdVa2VQTjg5WUVMdXBPNEhjY3ZEeTlGWjQzRFRzL2ZL?=
 =?utf-8?B?TFZlVlZES1lWb1o1Z2tRWFRFWExUSG5pLzNlOWNWeUVWRHZkbTA2UE5DUW1Q?=
 =?utf-8?B?cXAwT2JJSlVJSzZkSGI3clNmM1YxRmthYWRzZHRpTk4ra1BnWDVTaHV6TVlz?=
 =?utf-8?B?WUlNQThNSVpLclVsb3J1QlgxclNQenBLb2JSYXRBaUI2WWVnRGxKWHRNMERJ?=
 =?utf-8?B?aHF3UUtnSklyaUhZNm1pNVlJTHMzcmZXeXJxVkpLTDVyZVhSVForK1dieHY2?=
 =?utf-8?B?c05VVGxqOVB1WlJPZVM2ay9YL1BKcVdJMU9WMG5ZbnZRSU9OWGs0RVNzZHUr?=
 =?utf-8?B?MS9oQVFURlFDL3RTZ1FBYXFhQUx2YWVQTlc0NjBQQ0pKV3RKc2ZBV2pnMmxo?=
 =?utf-8?B?K3pOcDVmNVI4OGZaZ3d6QnVVTS96bXM2ZWtQZEYyY01GZVN5Q00yc0hjZks3?=
 =?utf-8?Q?tvvMSiS4iK5KRDWj97YJzA+lCJs6FnPX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:28:51.6828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5135a0-ffd9-482e-313b-08dcab454d6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

On 2024-07-23 13:34, Andrew Cooper wrote:
> On 23/07/2024 6:31 pm, oleksii.kurochko@gmail.com wrote:
>> On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
>>> On 2024-07-23 11:04, Anthony PERARD wrote:
>>>> On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
>>>>> "$dev" needs to be set correctly for backendtype=phy as well as
>>>>> backendtype=tap.  Move the setting into the conditional, so it
>>>>> can be
>>>>> handled properly for each.
>>>>>
>>>>> (dev could be captured during tap-ctl allocate for blktap module,
>>>>> but it
>>>>> would not be set properly for the find_device case.  The
>>>>> backendtype=tap
>>>>> case would need to be handled regardless.)
>>>>>
>>>>> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy
>>>>> compatibility")
>>>> Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy
>>>> compatibility") ?
>>> Yes!  Thanks for checking that - I must have grabbed the hash from a
>>> local branch.
>>>
>>>>> Fixes: 76a484193d ("hotplug: Update block-tap")
>>>>>
>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> With the fixes tag fix:
>>>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>>> Thanks again.
>>>
>>> Oleksii, this is a fix (for an incomplete fix) for 4.19.  76a484193d
>>> broke compatibility for block-tap with the blktap2 kernel model (when
>>> adding support for tapback).  This finishes restoring blktap2
>>> support.
>>>
>>> I realize it's late in the release if you don't want to take it.
>> It's pretty late but I just wanted to clarify:
>> 1. Is so critical that we should have this in 4.19?
>> 2. If we won't take it now, then will it be backported anyway?
> 
> 2) Yes it will get backported.  In fact I'm about to commit it to staging.
> 
> 1) It's a bug in a new feature for 4.19, so if we don't take this bugfix
> then we'll have to strip it from the release notes.

It's a bug in the old feature.  The new feature - tapback daemon 
support, backendtype=tap - works with what's in the 4.19 tree.  It's the 
old kernel module support - backendtype=phy,script=block-tap - that was 
broken when adding tapback support.  This patch fixes the old support.

The change is localized in the block-tap script and requires explicit 
configuration (script=block-tap) to use.  So it seems to me to be a 
lower risk to take it even though it is late in the cycle.

Regards,
Jason

