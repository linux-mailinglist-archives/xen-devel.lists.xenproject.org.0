Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B23AB07A15
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045381.1415484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Dy-0002mg-Q1; Wed, 16 Jul 2025 15:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045381.1415484; Wed, 16 Jul 2025 15:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Dy-0002k4-N7; Wed, 16 Jul 2025 15:39:14 +0000
Received: by outflank-mailman (input) for mailman id 1045381;
 Wed, 16 Jul 2025 15:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc4Dw-0002jx-M1
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:39:12 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20606.outbound.protection.outlook.com
 [2a01:111:f403:2407::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0432420c-625b-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:39:10 +0200 (CEST)
Received: from DS7PR05CA0007.namprd05.prod.outlook.com (2603:10b6:5:3b9::12)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 15:39:07 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:5:3b9:cafe::70) by DS7PR05CA0007.outlook.office365.com
 (2603:10b6:5:3b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Wed,
 16 Jul 2025 15:39:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Wed, 16 Jul 2025 15:39:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 10:39:04 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 10:39:04 -0500
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
X-Inumbo-ID: 0432420c-625b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5Xl3C/7/SewFvriHIpHigF8hfuXyv/+ZiMY1pfhfiztVMJbaZzfRHs4nhacgm/VXEpS7ornVKzpeU4zU7uPka9K6O27dbaRYUeTWCegtZje9X1tChANGFGH8nR0meCUDq+8rBxI6HuWjiD84xtV0x3xOrg8vnr+tN2OqHK8NUOo0ayquPCUQVXPOPi6huJiV8+TRrHHTwcWAHj5wmP/H98xMIFCU6W8umAR7kUMScZLGyysK9FbbyvEQH4i+Ebz/zcrHGAt4Y95tkjxyQCDkLo1Lb+2oPbeQ1JSn1AGAH/W9q1eZvlGDWafGnLlu9VxE//OrIO7Y+xAdszFbrnQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrIEvn3tag9p59Ci/xP2si2qWGx3qV8raXGQnnFKfqo=;
 b=tQ0tdPD64h+6cwdb2LKVSzka+cFR7QtHGOp31O0ULpAb74Jkv/2ReaQ8uW2Z92SsmZmS5y/lWotSsmE7m7VLuiciFcikv79vA4vJu/RZAZAbt5KykAkau4azorUkcj9yfoZ6BPAfRPOYXdB+wIUnMHtxD6RiJMq5W51C6WEjs4EPZ4UGczzLQAY3f3bMFmarXkz/8UGzhRHt9J+kLZdq8UYpsA+1f8vKH0wT8VbfsrnAjOK6QERk36CUtL/Hascm4hfYD/wsHSFFgAZyYVRvonHxXZlEeY/jwyk+HL2Z0tMac0w71dIqcduac91nRlJu7Jc1kCZLDe5rouWdo399UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrIEvn3tag9p59Ci/xP2si2qWGx3qV8raXGQnnFKfqo=;
 b=t8HQVpXKplv6R4zIx4B47KpgvG5iH5vNsq48/jIXmogC0aBSjv3CACUUzJv8del1XAsHYoaQvrqYis4HhQ9nt655qykZJAqAunmzdAHtfWfYUWjkDXPpNIPAJ4Nc/W0h0A0LEs5Rnq2MPntUYjZkwCqoRMBApSQT++dugAUz0pA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <74098139-731b-459f-91f0-88b7cc2c7f7b@amd.com>
Date: Wed, 16 Jul 2025 11:39:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Prefer d->max_vcpus to dom0_max_vcpus()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: 89526c31-a9ca-4a9b-dacb-08ddc47ee664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1RacEFsRlduVGp5NWkyS3dyTnIxekZBaDNxb2dtWHRDN1pGenZ1N0k3TjlU?=
 =?utf-8?B?NDZpNHBBQ25YRXJGMy9KWDUrNkZUcGRlNnhIOS9PM1lzOXBVLzNweWJjN1k4?=
 =?utf-8?B?S2xHV1RoU1FHR1RyZU8zOW5wMjJzaklaKzJtR1luZ3M2d09JV1lnNGFDZ3Ry?=
 =?utf-8?B?Z2wvM3N4UWplVW5ZZjE0bnVOWlVZNlRqNE9VeHJFTUFXYk95N3FLUkxadElS?=
 =?utf-8?B?WXdWRE4vd0R6Y2VEdGtlUFE1QlNmMnk3UVZPTEphcDBpTlU3Q3d2dVhGN3dL?=
 =?utf-8?B?cDNTRFRDVVFYQWhrMjNrMWxZSjRhcWIvVjhpcFIreTNWRnFEcDJCa0RqbXZW?=
 =?utf-8?B?WHNEcGl5OVEvb09QS1RsY2x2bmt1bDM5WWNUZVhEcm12RE9nUy8waTB0WVly?=
 =?utf-8?B?ZVVQYmo4Q0JEb3NWaDRZN1lvbVN6b2U2ZnRpSW5ZNGhOaHppVjJvdEFmdG5D?=
 =?utf-8?B?TTdYNTNDeUVnSUNzbk1mSGtEQnBjY1ZsN1ZGNFZaZUtjOGJsaHJrR3luMDdk?=
 =?utf-8?B?b2xwdEx3Y1d3dXpZQ2JjVmNLbldyMm5YanFzUjFnS3c3TGtKQ0JxTzVQMTMr?=
 =?utf-8?B?ZHNUNlpJcVpIV0xzSXRlZTZPYWVNT1RjdnhlWDBsY3VKUjBlelJuOEJDaE9R?=
 =?utf-8?B?VWFxT0FZdXZ3VEFCZytkbFdobElzRDZUQm45TCtyYW4wUTZac1h0dnVrN2h4?=
 =?utf-8?B?K0dDZHl4eWs3OE1vUTRBaHdXSW1va3RnaE1WY0ZoWGp4WWVrUytwODVXc2c1?=
 =?utf-8?B?Q2JOVHJvRzhKKzFnUU5RcUdQV2FOdmhiSWl6Mk5uakJma2l2UnEwS0x4SDRz?=
 =?utf-8?B?TFVHQnBSRktmTDEweVZNTEF3bWV3Vy8xdkdZMy9nYTc3WEtuRi9FbWNvRFo3?=
 =?utf-8?B?VSsxamVzVGxRbHhUVWJDZ21TcG5PTC9NNkZKV2ZJeFkrNkRzWitORWFiMVRz?=
 =?utf-8?B?aksveVp0czN4Mk1oOEk1Y3VtZDR1UjVQVjIxUW5LaUQ4d3lzK1hXMDB4RVgv?=
 =?utf-8?B?RmkwcFNnRWw2bisya1VoZ1o5WWpaOW81a1JQQUJ0a1dXRmRjRmVqTmVZbDQ2?=
 =?utf-8?B?NjY5ZFBIbHF0MmIvM1oySUZDVGJhY2hyYU85QVpyUnJOVU5KcEgwM2szZCtv?=
 =?utf-8?B?eCtqNjVWSHdjb1B4a2laR0d6dlAzVGd4L2tvSm9BSEJnbzBZK25rd3Zyd2Mw?=
 =?utf-8?B?UjhaSVJsa1Q4RUQxdy84RnlNRHYzdGxzbmZrbk1NMStEcW5wSFkvU21yVTVi?=
 =?utf-8?B?eWh4WDhvckt3aDJMS0hWckNIbFFwTFc0Z2ExK1phZ0ltaTlML3owS3o1L0xO?=
 =?utf-8?B?cVF5L1UrbDdjaWd5NXRIZzV0WEhOOHUrY2xPcXRmUHduVTBsNnNUWGFhSUNn?=
 =?utf-8?B?RkJYTUFlR1JFbHo2ejd1SytoUWtMTytqYkFiMG9qN29IMkFpY3JoU3R1eVM3?=
 =?utf-8?B?MFB5WE1wRmdVaWd0SGdIa0g0c0ZOV1BXOVI4NWw0S1hkd1hiS1VadXhiT2hy?=
 =?utf-8?B?dnJCMWllb2ttL3p4UTJQUTRDa1BoZWtRNW0vK2F6WlR6dzdKbVp5VXovVTFJ?=
 =?utf-8?B?Z09MKzVjYjlDQUtSVVVhL0VDYzl6SlorL3pOaEs5djRWWlJMM0ovQzlWRnhq?=
 =?utf-8?B?Ulh0RDcxbnpwdlltRXpnOTMwSHlrNSs1RnNPQTVkQitaNW5DMGpVOFFaaW5N?=
 =?utf-8?B?YUpmLytPM0pkVldkNjNIYUVnODZtRk9WUnpZOHE1NmRyUVhxbFp3MjlnU3J1?=
 =?utf-8?B?dzQ5MDltcjUwYVNnSEZpb3RFOVNYUXNmSnl0UWViWHlNVXRicFBtSVlOeWxO?=
 =?utf-8?B?bVIwVUJwY09sNzAya0FCNllDN3pXV2Y1OG5EWUVhdlNUZEpSVk9zd281ZkJa?=
 =?utf-8?B?SFJnNDhnWFN1NlkweFlkMlViQkJCaDBxdDFtZE1PN2JZS1lzU2tsV2gzM3hP?=
 =?utf-8?B?K3V1anBUKzUwUXMzTlNzNFpFUEJXWnc3NjlmcmtUTnFsdG0xYzZKRGlvcmkw?=
 =?utf-8?Q?2DzwpIZ/PnUK0U13ksV4wkRiFj6BbY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 15:39:06.6239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89526c31-a9ca-4a9b-dacb-08ddc47ee664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048

On 2025-07-16 10:18, Alejandro Vallejo wrote:
> These days d->max_vcpus is populated on domain_create(), so use that instead and
> avoid a function call.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

