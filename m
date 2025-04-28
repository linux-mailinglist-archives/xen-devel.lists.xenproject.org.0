Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B3A9FC2C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 23:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971197.1359673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vxm-0000p6-LP; Mon, 28 Apr 2025 21:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971197.1359673; Mon, 28 Apr 2025 21:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vxm-0000nR-Hf; Mon, 28 Apr 2025 21:24:30 +0000
Received: by outflank-mailman (input) for mailman id 971197;
 Mon, 28 Apr 2025 21:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEkc=XO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u9Vxk-0000nI-Hc
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 21:24:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c1a025-2477-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 23:24:25 +0200 (CEST)
Received: from SN7PR04CA0074.namprd04.prod.outlook.com (2603:10b6:806:121::19)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 21:24:19 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::6) by SN7PR04CA0074.outlook.office365.com
 (2603:10b6:806:121::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 21:24:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 21:24:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 16:24:17 -0500
Received: from [172.25.248.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Apr 2025 16:24:17 -0500
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
X-Inumbo-ID: 27c1a025-2477-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z74swt1c2HTYw7aHxsFkaLteri5r12cLDvJhBbd6ksO2HGetYB1dohNrgsVbUPU3HLLsyrKvYj4JilzApur/lAOqd4FbwzGcSEKILLkPbMMYHLWI72kj1ek+SY5UNUtZ/ceIPBQHs+BPBVgynVXZOmS39LKnFSRxgc2StV1z/n+LOs2Zl8VhAU6UKQRmugj7Iq416UiSkHnhD2f8z4zpFil75QMT3t7YEFlHbG6uo7QbE+iFH2fhvf4LHyjEutp317lOu065Wx1QXlo45SXZm/Y7kZAYk4hRb7VmqEcSAbmsfhNsbW564aLYxdfmdyq+lzUy1Delofb2C+G/cb0hkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3byd3yNyi0rP6Vcx1i8DXhRwYJnAy64H5JrqmQiWUQ=;
 b=B9FT533++skF0EYLOO7wRh/MsBWeXBUVIhB6y80k6WJNjZflWmbUyQu3hiu4OfPtXwoPhXcimGlJkDZ6Ypox40Z27xwaD/tO4/618iSblPJE/rk7LBrfcGWr0vRkkl4Y9ICMi5R0Q7qw79IecOamAALq2D+0YZMz2PbffWQPev8yVA5TRJbe5nTpBuUNEc0HQ64ot752p+xqUap+3eHSM0suyLBQPmWifB8f5Q5Wp6VtjK2WuS3/us17Iz5kKLUAywjqu1fhZKtPDrn0PtHzpO9ODi7DroCfLsd27yW98HJfL4sjcjGFMnJqeNMtfY+Fuo+TYq252jN7XHSOjfO7Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3byd3yNyi0rP6Vcx1i8DXhRwYJnAy64H5JrqmQiWUQ=;
 b=okRHPSaLnN3ZYnqbxhSLjMxelea5GFck0jrm0GO8LSGQJZg0FOgERk/X0T79GAMSn3iZYkrS6AvA/Cf9aVpnsU/HKKzQjERK7//bboG5Idzy6FnbmFqnfVMkdk9ZsNCL2qKJw79mlQ/J6V189Wrw1Rk4kjeBCsslpTU3VBM527g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7e9e0624-f684-444f-8b87-41bf423a91c6@amd.com>
Date: Mon, 28 Apr 2025 17:24:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: avoid UB shifts in FLDENV/FRSTOR handling
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Fabian Specht
	<f.specht@tum.de>
References: <c8eaa6aa-d63d-471c-b66f-6a8c00e03ba1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c8eaa6aa-d63d-471c-b66f-6a8c00e03ba1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 228ec1b9-bbab-4684-8331-08dd869b08f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3dURDFtOXZvZzNrcnp0NlA0NkZUSjdkYlRaNGJleTdCWW9aTTZYSHRiSEI0?=
 =?utf-8?B?aG50djR6M05Pd2FZeVRhck5tOSttMEhpa28rVVdjNWUyczRCTW9Fb1JSV2F2?=
 =?utf-8?B?MlRqL1k4M3dSUk5wRHhwY3ZhbDF1OC9GdDlVSGJYMktwTjZSQ0FmQklTV25D?=
 =?utf-8?B?UWhnM2VaZGJMWkdLTlFvTFpoZldmUE1XZ2JBdEhPc25RT3NldUU5QVZtL0l4?=
 =?utf-8?B?MUhRVUk5K2JkOTR3NGlkWkdnMnZpYm8xSE5wdWt6NHhZeTRVVkl3OFVEYmw0?=
 =?utf-8?B?dFAxdXlJY1ovOEx2L3FUY2U0Yk83a1ZyQnB6VXVNYm5GTnAySlFuQ0RzaG1F?=
 =?utf-8?B?RlNkTXpHNHNhTExpMlBlcGlRNWdzb1E1MlRidEhyQlh3TWYzbW80WE5yZzk0?=
 =?utf-8?B?ald6anM0d3F3QWkrZ3hhWnllSzFreGExSGY1NWRNODdyRGs2NTYzbSsvQ2g3?=
 =?utf-8?B?VjFOTWJ6cDBpam1sVGFZclpHZGZMbDlSdGkzOVEzbjBhaEIrdGFUTGk0RGFI?=
 =?utf-8?B?Q1d2ZVdQYVloNXhjZ05EeFlhSE9jZ0UwYjBFMTRFWVAyc1Z5Z2RlTlVGVytB?=
 =?utf-8?B?azVqcXVSL09Va0dwKzc3MFlUZFRyL2w4KzZlQmZGZVRMUWFCRVNOTXRkbDdY?=
 =?utf-8?B?NEtPWGJ5NUJSYlh3L3pRQitldlRhRFRsdXdSNFYzUTM1SFU4UEZudlpDejZO?=
 =?utf-8?B?QnZta0dqdkRHVEZGUy9uZWhTdG8yelV0VHdJZk1HN1V0b29BTUVmTHR4eWY1?=
 =?utf-8?B?Qi90QzBjd1ZtRFJSaDgxUUdPM0xtZTNnQ0NiYy90Y25iYTV4S3FLcEF5NmtY?=
 =?utf-8?B?Q01tMzFlVnFXWEYxc2ZYeldsN1UzRGpxdHZXNVpEbHViNWJ6MndBZ1MwSndJ?=
 =?utf-8?B?Y2htaXJ5VGxEMUlVY0YxRGdUd1VHZTBRWG1ROC9LVHlLa3NKZUhCWnoybzZR?=
 =?utf-8?B?bHE4YmxvL21BaU50WisxTHZiV29qenJoR21FQkRjdjlDSm5ubVdhUWNhNEtj?=
 =?utf-8?B?Tlpma2FPSUZBZUFGOWJQUXgrMEVNOWNBVUlXU0toU1BrQzNhdlN4U1RRUS9o?=
 =?utf-8?B?Z1ZrUzhaTy9OV0Z1UzBPN0pYdC9rMU1Mdlh1RW1IYzMvYTU2V1V2Qi8zcE94?=
 =?utf-8?B?YkNGTi9sZWNBN3hXbUx2enF3U2JINlJhYXV5WFREdmI5akxGclA3Zkc5VCto?=
 =?utf-8?B?S2trM3RJdG4vMWt1Sk9INVI3RlgyZDJqY3hiMnlkZkFoUHk0VXgyQjYxaC9u?=
 =?utf-8?B?QnJFMC9NbFlTOEFPR09INW0yZzdzYXRDQnI5cktCYTkrRHNKUm0rdjJobTZx?=
 =?utf-8?B?cjk5bG9oY3BLeWRsQUhsVlRoN2RhNFhldGpiWi9pZk55TXZubXQzaGlaKzBV?=
 =?utf-8?B?UjBpaUlHZUNSSXVqUmpMU0MxM0MxSXBXOEg4aU1nYS9EOGdOeG56TVRRd1Fs?=
 =?utf-8?B?OFZ5bTYvajdjUkNMTCsyL3N4dzcxTndSc0FOWHVwMUt0UVB2MVpuSnIwa3hJ?=
 =?utf-8?B?bVZLKzU0MFNCWGJxbGgwc0hJdXBpbmFSd0htZmdTQlhEQmNhSjBxSEp5WUJB?=
 =?utf-8?B?TU1kODl6dHpqTVYwNG1JZm1mdlRpMC9zYk5XQkpKMmNrLzF0N3ZldFM0Y29t?=
 =?utf-8?B?OGlEOW5vMTVuVWpOY3YzM0VvT0JpbzlMa2RPZlRpRWEzdko2eWVFcWVud1B3?=
 =?utf-8?B?Y3A2ZHdieDFDczgwWDE0eTg0UVFBWEZOcHAwS2hpK0xMTWhLQ01nK1l3VFVT?=
 =?utf-8?B?cklOZlYyR2I1S2prRG5SQm9LUWJydDNDdzdvYWhrRU43ZzhwdjNWek1MZU5t?=
 =?utf-8?B?ZHBHQ0dueWNSN0V4ejFZeC9WTFZBUEl5N3M4WS9jRG82TS9hOXF2UHV5SXA0?=
 =?utf-8?B?ZGRyWEJkbjFGRGdjSVF1d3ZES3Z1aFFYcW9aY3RiNEFBY3BLY3pMN0lSekpG?=
 =?utf-8?B?RVlNN3NGdkpHMVNGSjlhRXA0QzlvbVYzaDVVZnkrU1dNVE4xUEhXQklFSEJE?=
 =?utf-8?B?RnNUWFdjYjdYcktIQUNKM1hMcEp0bVNpcG95TGlLd2pkcThHK1YzaTlLRU9H?=
 =?utf-8?Q?ZUaPh3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:24:18.4196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228ec1b9-bbab-4684-8331-08dd869b08f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475

On 2025-04-28 07:29, Jan Beulich wrote:
> 16-bit quantities, no matter whether expressed as uint16_t or as
> bitfield, will be promoted to plain int before doing any arithmetic on
> them. Shifting such values by 16 will therefore shift into the sign bit,
> which is UB if that bit becomes set. To account for all reads and all
> writes accessing opposite members of the same union, introduce yet more
> local variables to reduce the shift counts to 12.
> 
> Fixes: be55ed744ed8 ("x86emul: support FLDENV and FRSTOR")
> Reported-by: Fabian Specht<f.specht@tum.de>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

