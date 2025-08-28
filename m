Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E3B390AE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097304.1451699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR7U-0008Us-Vh; Thu, 28 Aug 2025 01:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097304.1451699; Thu, 28 Aug 2025 01:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR7U-0008TO-Si; Thu, 28 Aug 2025 01:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1097304;
 Thu, 28 Aug 2025 01:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urR7U-0008TG-51
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:08:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ecd452-83ab-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:08:02 +0200 (CEST)
Received: from DS7PR03CA0188.namprd03.prod.outlook.com (2603:10b6:5:3b6::13)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Thu, 28 Aug
 2025 01:07:57 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::7b) by DS7PR03CA0188.outlook.office365.com
 (2603:10b6:5:3b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 01:07:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:07:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:07:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:07:56 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:07:55 -0500
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
X-Inumbo-ID: 70ecd452-83ab-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkjemc0EyLg02rTD3kJIYW7bbojK13MKpqiiLDkzP+ngJbP/ipL/NFQN6tTFOozDho1exdv493fOwXupsWubO3gMFM2m/5W8NbI4x4Fj3RZmNTW9atNQNQTDeqd+U6Cg6k0uEuDBHX5Rvui3EFW2w24WTg448ja16Df0cYA4t/ckCUimGX3bS6bysjQlLQ6h5UQ6GXnDEXnc/VHnGEqquj+Mi7KZ9UXugUmqYxwvHbnwmXc0eOuCeP/x58KthKOq1eRQRslknoujXKYdHcunXUcev0YZtYJa+WT7pfdfSay2Ixml7JafKhbWSVmeiJ9pz2i0h3MmUkmQmd6EhMpzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5nlDEQGwljIGzFs/Z+E/hsllWyY+nsXQVnwNFYt9hk=;
 b=fB1hhcctgPY1CsGgnAkZiTXsDLGp7qHi7l6IIRIL9x3/4JeesmCkKO0KOVHjegdhwebgeisDbiIJM3LAxGYhA2Xfa1CyECfI4rDwXdV9bHT+Q+sjuSfeEL0HJCrXu6O4MnYumdWa8G+z6hA29NWPGmmF25eiRv+ENfkCetzdl2s3b4x1S7foVybJop1ABYSe27AOn9ojCYuOqMdQlL2J230fdtPzND4VgXoonaMwkezEpM+bOtsznUoj6qPNPuMl72MeMDDaOtPrNoQyQMVzAYVbjetivYwjyYiwR9YxNzcZFTRFmBQzcIwAD8jeV05CUvGcaA1mDo7UUAruUSk77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5nlDEQGwljIGzFs/Z+E/hsllWyY+nsXQVnwNFYt9hk=;
 b=L5wJDehV288/EEX+ncE+JiebtERJBMiKbfFKRib3kcpRREuUOLTPdwsmaPdT81KABl0tPKQIXRu2U78kGiwGm/IlRLfJS/cut9kOMjOVuk/1XJpd3s2Tf1bXXLIrGt2Wjtf6J+QUjoaJCn7Em+war0bb9Sdf9gMnXWUuQmz/fV8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8ec4b804-28d0-4f39-8d2e-29d326a6909c@amd.com>
Date: Wed, 27 Aug 2025 21:07:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] symbols: prefer symbols which have a type
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <b7261eaf-b3ce-4b71-aba2-3f40adbbe93e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b7261eaf-b3ce-4b71-aba2-3f40adbbe93e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: a52498b1-5579-4ef2-555a-08dde5cf52cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejJNODFQMnpuQUlHNFdKbll3Zks1K1hoTCs2QVk5VDRrVTNYM0U1TElsR20r?=
 =?utf-8?B?OExEMmRiNHdjSEVmbGlEQ0RxVnhmaHhLb3dPN2JsYnVUSnNyL2twa0p4b2k3?=
 =?utf-8?B?NHEzTWQ1QkhxUCtlQWZVbmcvMDJRYmFYVXlyUDZvc0w1NGRHKzk2S0hDdW40?=
 =?utf-8?B?V1lkbitRMWZReUF6Z05qbFZlM3c5R2FNUncwclBDZ0crSVcxYXgzMitrTmlW?=
 =?utf-8?B?ZThUL2sweUlwMUFlTm55VjB1aE9aa3l6WTFxNEJPdDlHYjNtdml1VDZGS3B2?=
 =?utf-8?B?TlVwalB3WUVTR3kvd0wxWWJuNUdSbUNxMnl1bXVseERJUTBacTF4U1dqdE5x?=
 =?utf-8?B?cUlzRjRBanc4VFhjL0poYW5KYWpKRGhNSU9DNWg2aHRnZUtzU2dSQ3c2bFlL?=
 =?utf-8?B?REtSY0VGUCtDeFo4VGJEZ29UZUY1bHBjQUZCeEJEUTMwbFRnbmtZWDVQU3NQ?=
 =?utf-8?B?ajV0OWJwcndwdTdoU3AwUUNjOGlsdE11TkJKQmZobVQycUl0bE9kVWdtSGd2?=
 =?utf-8?B?ZFY3V2JXOWxTTnA3V1JvNkRQUWkxUG5DV0tONXZONUdaRGpNK0YzQlFQa3Bk?=
 =?utf-8?B?YWNvWWJVRWlrYS9lWEtqWlRpdG5BTVhiYmRSSm1yTW1BS3E1WFUzaVoxVDlL?=
 =?utf-8?B?RDBucU4wU2pqbldiWlcwbHhpV25FcnJvZWk1aEVmUFhPYnhic0lHRzNDYjUw?=
 =?utf-8?B?bWVXMXJPdDM0eUpaWHd4OEo0djhqSHdMSHBhUERuS0Z2dVZrN1I2SDNNL2xO?=
 =?utf-8?B?UFdFakljbTA0cDBpUk5JNkNtU2REbGZ5V2dBOFg2b0pPaFp6Q3grL0d5bVp3?=
 =?utf-8?B?azdoSHpiODdtT3gxTW9ha05CdGp6WEIza3R6eXQxVWpvMEd1L1g4dlVFU01X?=
 =?utf-8?B?dFduWjJsZ3dlK3Y4RFFLRjVLMFpaT01yUWxRZGNFQWVuVHNxclM4a2NsMUlm?=
 =?utf-8?B?RXFxa0JTazhtUDlmZXlodzQrUWJTamRRbGZxU1RoN0p4MmJDVlk4S09Bb3Bv?=
 =?utf-8?B?SVUyZnUyeTdOdzlzYnp2SEFnMFl1czFiUkVOOGxMWUQvOERPVE1vNEFjOE5j?=
 =?utf-8?B?dU82cmdKeVJraXllQjlTN3F3YkRUVE1DMzE3dXdvcUFsc29zZ2ZiV1k4ckNU?=
 =?utf-8?B?MXVWcTE4NENwOEl1L24rUzExNzRMNUhuaTJOZy9tT205SnJ4dSsvSFVQWmZJ?=
 =?utf-8?B?OFovS3dLSFJ6aDlwSjQ1QjVlNkNjVldjQUtTWWNYSlQrSytBVWdnNHR0QU5H?=
 =?utf-8?B?MHAwWFIvY3BNZXB6eWE5d1ZPdDQ2Z3VhVHdGeWMrSUh5dVdkMUNMWVVoK0ph?=
 =?utf-8?B?eFBxemxoWUZlTm1waGFFeUpaWmFveGhUbGNXaGtkL0RrZDZzUGNkejQxM2RT?=
 =?utf-8?B?cmIyTld1T05IRVJNc0g2Zkd3cmdPVHBhUUxlUjhOcEtWaVBSMldaM01mSjJN?=
 =?utf-8?B?MkdOdzVNRW5RanZkUVJ2WE55aE4xNGpoMFJrZVRjYU83NEtBL01XbHFJNkRY?=
 =?utf-8?B?QTZGenpHc1UyeHVQNjg3U1FIREZsS2hXMG1yZm51aERDV05yc1ZuMXcxMXhl?=
 =?utf-8?B?K1FMNE1XV0JOYlozY1pqeHJLRDNwUEx5Sjc2WEIwaTFuQytWL1RGOFlhT2o2?=
 =?utf-8?B?QlkyK2dsS3ZtMktPOStKamVuUjY1R0hxcDNwbktoeE8xcUlTZlB4SDYzRi90?=
 =?utf-8?B?NWUxVm03QkpiMGJ5dWxmTDJWV0VlUDN0T1FVU3NTd1pZR1gwckNjWlRtc2VL?=
 =?utf-8?B?b2hPQzZGTHI4eldMNzhuN05mbWZtUjR2aXFGVUV1VmxhbE41YmRydmdORE80?=
 =?utf-8?B?cDloRWx2UVdUYnY0Y01qaWw2MWJxVmFJVFJOTEdHM0ttTGVwenhwenBJNzI0?=
 =?utf-8?B?ZlB4cXhYK1FqSkNLTEFkMEVrVGFQekFiVWhCWUV5SVErUlZqeXJtbU83a094?=
 =?utf-8?B?QXd1enlmajFTbjdFSjNXcGkxWWptVFNsUnYyVCtWVnRKOW1MT0U4dVZkL1RP?=
 =?utf-8?B?aGJTbEdTNFJNYUF0TVRZOWxEWnJIVlhKL3A5elFQcXd4b2VzRHNkQzNjWitH?=
 =?utf-8?Q?9zurke?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:07:56.5781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52498b1-5579-4ef2-555a-08dde5cf52cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

On 2025-04-02 10:00, Jan Beulich wrote:
> ... and thus typically also a size. Using global vs local is undesirable
> in certain situations, e.g. when a "real" symbol is local and at the
> same address as a section start/end one (which are all global).
> 
> Note that for xen.efi the checking for "Function" is only forward-
> looking at this point: The function-ness of symbols (much like their
> size) is lost when linking PE/COFF binaries from ELF objects with GNU ld
> up to at least 2.44.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

