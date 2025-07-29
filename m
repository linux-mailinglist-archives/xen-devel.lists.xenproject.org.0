Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6CB1455A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 02:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061997.1427602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugYDr-0000ZN-IP; Tue, 29 Jul 2025 00:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061997.1427602; Tue, 29 Jul 2025 00:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugYDr-0000Wc-FA; Tue, 29 Jul 2025 00:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1061997;
 Tue, 29 Jul 2025 00:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zENc=2K=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ugYDp-0000WW-Md
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 00:29:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f91de4-6c13-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 02:29:34 +0200 (CEST)
Received: from BYAPR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:74::14)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 00:29:26 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::e1) by BYAPR05CA0037.outlook.office365.com
 (2603:10b6:a03:74::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Tue,
 29 Jul 2025 00:29:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 00:29:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 19:29:25 -0500
Received: from [172.21.111.141] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Jul 2025 19:29:24 -0500
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
X-Inumbo-ID: 18f91de4-6c13-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFsqX+wyiiE8UYLsndV0dzBFReyOAd9H83u2wH6Gu+QE8tx6OULYCujcjt0sGIrKGK6bot259Id3+qNsLAurtUOSdDMoFElFmqjIjMBwqO4MIEMDD38cFv4riO3JSrKMXf8Mo0YyKN9xNoADkc40dbit6enFUJEqNhtRse9+LlNtM09WRsAGt6xgVSwF+k1UrzYCsep8Ie1Vqt74T83BZsQliDuMdwYam2cINQISnKJUW1qvP9RaBIXKj0fWX1kkKeRvE3lEDwrVvxEk5dOqc5AcfT1TmxFw7vVRRsW9kUZcr0SRRXgYRsPevgvpBD8Jw+Kbmrs+eg4dzXD8kC/asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmdBH9afn7zJDj1WMqCUFB9PfGkWN6VL+CLvyskocpk=;
 b=vFdh7msP3q+Bl06dfxRTPQEKYh/cOZBj3lDla9ck9LFpP5a8cakL+ehjCZgbJEbugUAtnvt3CaAXnWTCiVfCcP3tGkpvMGJq4+3oYAHTWkscAzdeLd0n5Qf0Byd9WjDkpZghT0b5dyERlf51BvJy3fTrs0G3tF6J/Pn9fkQ2dWZQTK31MW4WaTvR+VewPp9OIfoixePD2eTv+gJ132Hvy/J3vtLgxBhmv/D+eJ1Ssp9ru6nHMjm8p0KG99coS5Jqv0Q5NiXJpLYfGoo4qX9JK6oYWN6EXXxNbGmj3yt001OTpuJ2KzKmYtYeZjLlsa0dbs53CCyaw1xt8xaJY85vUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmdBH9afn7zJDj1WMqCUFB9PfGkWN6VL+CLvyskocpk=;
 b=eRsQD/Jlyoj52RDaEE2234qY53Xq1Y7gqsgd6nv9lh9DZCvuILWk13l0A8jntxvIJ4PAMn7qmS8oIkQHjOLGW7ZFStChmLR/G7xD6+ZCCKq+QWWHoZ0MnxUViW4RTapa6rIZRyK5FPd+CPo86L8zlWqTJeX1uyVBN6pFVLKWM3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <55d8f784-4ad5-4a20-bfb4-ad6219415288@amd.com>
Date: Mon, 28 Jul 2025 20:29:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
 <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 98be0097-c4c9-446d-7ee6-08ddce36f945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3VhQXoxK200KzZHTUFQdXcrc2dwdlltN1pCenFOcVhFWStWUGUwRW0yQmxt?=
 =?utf-8?B?NjByenVlMlJxa3NITHJEc1JkV1F6aTUyNEx1NWlOcXhkUi9pdmxYRlRGajJa?=
 =?utf-8?B?R1hqUjhWdTA4alBGWjd5bC9OamE5R04vTkNpd0gvSE1pTm9DN1RCaEpSMkE0?=
 =?utf-8?B?L3pCNTBBUEpCRWFwNVdNaC9aQ1NBTVVQKytES1RkT3NjVDlDSGxPYlpuNW9I?=
 =?utf-8?B?akg0ODYyRDVsajVpeFhBWFZ0TXZGNnNPTU5ncU9mdDN5T1p6Zys2OGRQN0Nq?=
 =?utf-8?B?OFFmVnhwOTNYZkRBemwwMVJBYlVwK0h1cVFOcVVraGJJSXhtRlNFcTdaQ3Fk?=
 =?utf-8?B?VFhXYWM5YTFka1ovTVVOV2JJQytucUVLUVk5amNRWlR5SzZZVDYzUjlFZlVY?=
 =?utf-8?B?YnRBZE9hYzhDT1p0M016UE43SDZFM21BMkhRWDZCVWUvR2VvREJEODE1OGhq?=
 =?utf-8?B?US9wVGZZSG1yVDVMT1dtNGtHUVBsSHNwZWVRSUVyWTFxUHlCb2ZQV3pWbzQy?=
 =?utf-8?B?WjhOWnZKb1hHY2hKS3dmVmxoMXhySjloS2s2bVNDNnJoM0JoOUFodXJld3J4?=
 =?utf-8?B?OHBYWUNEdHY2bFZ1SENvUWcrU2tZWVhQTGZuNGpVMnZ5VkJsR1VweW55d2R0?=
 =?utf-8?B?RFQxZkxUeXpJSnBKYnJxdlI2SlBsdzg0Tm5ZLzB3eWJueTZCSTd0cmVEdFc5?=
 =?utf-8?B?L0lNV1ZWQ0hXR252U2lNZENrSWtvVCt4WlBNTlVSdUxwUENvNXNaL0lBWFdZ?=
 =?utf-8?B?S3JVM0R5ZWJ2a0Q2U3hUZUcwR1RobWdNc0tZbFFzZFQvMXlOL0lTU2dPZlVP?=
 =?utf-8?B?YWdjdnUzZHNmc29NcS9BNUV6Y1pBM0ROc3hsUFlCWEF2NS9JOFJLNGMvMWtX?=
 =?utf-8?B?c3hTTjdHRE02L2Z5MktLYms1aUdzdldOWldmalRiRGZVZ2VFKzMwNEw0aGtR?=
 =?utf-8?B?eUhHQmFjbTZ2TnFleVFFZmhWdU5HOHdSSnNPL0ZCaCttQ3p6dEJzeExtUjlx?=
 =?utf-8?B?engxTHpuUW55aHN2QU9FYVZlcUt5aGVFbTBxam1ROEg3M0pqMnJEaU0zTlJ1?=
 =?utf-8?B?VUE4WXNoWFltRVNhWGJPRlJkZ3o1dXd0ZkZhVjVpdzFGMEQyTXVNYWcvUEJK?=
 =?utf-8?B?UmdXaFZLODRmYWVHRGJrRkxyK2VGcnJldnpiTytvNkxnbGs4cVFSSUpUN3NM?=
 =?utf-8?B?YnBoUHFoZ1ZOMm0rUXRBRVFFaHp3WlRySUJtN2pVZEQ4bEF0cUNndTd6dWdq?=
 =?utf-8?B?M1ZPL3RFNWNlUDhSSFkzcWhMQklBT3ozbG84eGdEOGVIV0FMZGVHOG5iN3oz?=
 =?utf-8?B?eThYTlR1WXVjNWt5Tk85ZnczUzBxTjNhT0xpWlprWmRXKy9jZG1GMVlTNCtF?=
 =?utf-8?B?b2Fzc2ZqaGJrajJQUlFUVFMxcm1tTXllK0xBeGZ5Wm9uV3hXcndKcmxXeG54?=
 =?utf-8?B?dUxXTTlIVjdmYUNwUlJiaVFJc3RJc0dmRCtjZVRPb2dlb29ZOUZxdS9idGhX?=
 =?utf-8?B?UHlZei92MjdRNGd5SzFIaUl2NVFKR053MmNJNFNCZkwrcThJVXo1QU9XWU9a?=
 =?utf-8?B?aldLdisvbk9PSy90OHhsOVVwMXZOOHM5dHFuT2ZPWVJGSU44V2VjS0pkUGZu?=
 =?utf-8?B?MWZKelhKT2JRbFJsbFk4aHJXakFYTzNUdXpnK0hiczIwczRDQTZlT0tGaE83?=
 =?utf-8?B?UHJ5Qlp2Uy8zZEdnSkJJaVpWS0Uwd3RQUndyMXdicFZWK1RSYUtJdjdvWHFh?=
 =?utf-8?B?cHZUT2M5TnY2NUloSndTLzNEdU5IL0pjM1JaVWRyLzY4K2xlSzBIekRUcFZV?=
 =?utf-8?B?aklIS2NlWGxqNTVOQWZWeVR5RnAvZkJnaXQ5dU5lR245N3RiM1FKd1VIMlRj?=
 =?utf-8?B?SFhVZE5pcjNJYTF2YjZuYzluVDRCTmN5NFY5OHQyMHFheEJlMkxPY3pyZ0ZJ?=
 =?utf-8?B?bm5ZUUI5WTZGaTI2QjVKSjdtSzdJN09JUWlpU2lrWUlnZUFrTjVtWVZsMGpY?=
 =?utf-8?B?VVVoUnNzODRZMDlmZ0N2RjVJTmFaeS95bXQ1RHlkUi9PK1ZLNE9OR2FzQTg1?=
 =?utf-8?Q?/kjDVn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:29:26.0769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98be0097-c4c9-446d-7ee6-08ddce36f945
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492

On 2025-07-28 06:45, Andrew Cooper wrote:
> On 28/07/2025 11:24 am, Marek Marczykowski-Górecki wrote:
>> When running xl in a domU, it doesn't have access to the Xen command
>> line. Before the non-truncating xc_xenver_cmdline(), it was always set
>> with strdup, possibly of an empty string. Now it's NULL. Treat it the
>> same as empty cmdline, as it was before. Autoballoon isn't relevant for
>> xl devd in a domU anyway.
>>
>> Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>> So, apparently the "No API/ABI change" was a lie... it changed "empty
>> string" to NULL in libxl_version_info->commandline. Quick search didn't
>> spot any other (in-tree) place that could trip on NULL there. IMO NULL
>> value in this case makes more sense. Buf maybe for the API stability
>> reasons the old behavior should be restored?
> 
> Hmm, I didn't intend to change things, but I also didn't anticipate
> libxl__strdup()'s behaviour, or for something to depend on that.

I think it isn't strdup()'s behaviour, but rather the old code:

-    xc_version(ctx->xch, XENVER_commandline, &u.xen_commandline);
-    info->commandline = libxl__strdup(NOGC, u.xen_commandline);
+    info->commandline = xc_xenver_commandline(ctx->xch);

No error checking on xc_version(), so strdup() is duplicating whatever 
(stale?) data may be in the union.

Regards,
Jason

> While this does turn out to be a marginal API change, I think your
> solution is the right one.  I do not think it's reasonable for there to
> be one magic pointer that has differing NULL-ness to the others, and
> NULL for "no information" is the better interface.
>

