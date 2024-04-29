Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9A8B6166
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714371.1115574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1W4R-00008q-8h; Mon, 29 Apr 2024 18:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714371.1115574; Mon, 29 Apr 2024 18:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1W4R-00006F-5f; Mon, 29 Apr 2024 18:49:47 +0000
Received: by outflank-mailman (input) for mailman id 714371;
 Mon, 29 Apr 2024 18:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3sz=MC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s1W4Q-000069-8v
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:49:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0365cd-0659-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 20:49:44 +0200 (CEST)
Received: from MW4PR04CA0364.namprd04.prod.outlook.com (2603:10b6:303:81::9)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 18:49:41 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::71) by MW4PR04CA0364.outlook.office365.com
 (2603:10b6:303:81::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32 via Frontend
 Transport; Mon, 29 Apr 2024 18:49:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 29 Apr 2024 18:49:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 13:49:38 -0500
Received: from [172.30.12.82] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 13:49:37 -0500
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
X-Inumbo-ID: 3e0365cd-0659-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYrmeaJi/twdKfJSGarc8k9r5mmuN4YRrYuBoQoLalxBt2nAthjEKhTIsR4YbbTIPmgBE+wZ8XqPwXLtg3GDS1GvfPOMh6OQS5/D8wymXCzwxFr6vzLrnFNB4MO8lKzfHQqrsJevIjuBktXlNPP9deOYUmzFu9j2wb2CKE55uQGPFIO1Kv5weN1hHR2tFuMCt3sXLVN3/MeTdHdMWRTazoRim96hc1Ngy2U7I+96VnDNEvrtmR0vZgev5TmGl3o5BaeHf0GqyM8x9acF4ISfKyQgcTyBICoiCaGEPxFvAw1Fm+BQGgqwHmMlKYmczM2/y4ZaxeLbEznAdwRXc0LDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2Ie8bgsodaj1YRMsYjLwls9ChRMocqeI/d5B+nJdm4=;
 b=f1lZG7GZAdeg6VaCEu2Pi3g5hZ59rIpzwe2PDvlmQKaaC51dQD5SF8u6u0fSwSBbWpQ7Pewqk57JfqpTYUT2f8DtKPjhqssuUf/i1U/731XADkPHO+34W1h0/ZfXosA3rnODylNbrl3GUOximwvTb0G+4h2lt4tgv0JRH5SXXkMAZWIYlNqGLMZFsdj2niTCCRDxhkaK3HaKvjgjnipsCfb9/et7x5IEC2W6WP5u8MX/Py1bTFjseepZYj8Wj4EZhM1q2yDve0PCKEs7DDNQoKBve7DRwza9Bzc0ynpaaiSy2lJOQrHtXlEkXaJySlVOGZLdX4GnP35Zbq4GtqO5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2Ie8bgsodaj1YRMsYjLwls9ChRMocqeI/d5B+nJdm4=;
 b=yd1WQW2F25IrXHQCdbswwc6q7fAUsdyTDdYxXzkZDNAaBpu9YSHAwdPQ/ixnrH0zb6MfPxuFGP36xYNyhG6AXxbSsPo5EbVz3NSIpybPHMMBvO4DxSwunrH1VLBMcLyc3hdNfFjc4yKVcbFhMoczSv+56jEs4Oa1TbcG8Qg19e0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <91b72657-f289-4031-80b3-75b8f0cf9845@amd.com>
Date: Mon, 29 Apr 2024 14:49:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Explain how moving mod[0] works
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel
 Smith <dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
 <20240426140140.465506-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240426140140.465506-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2b3ccc-a797-47bd-4215-08dc687d2090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400014|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elhWUHIwK05XVFpuMk5jMWJsQjkrQlJXbjhucHFDOGZadG9KOVRNWmUyWGNh?=
 =?utf-8?B?MHVvWnFqREd6aWwwekJsaG8rTG4xcHdQKytmMW5OSlBRd0pRS1p3TFIwTGpL?=
 =?utf-8?B?NE9jQmNWUVFBRDZVbGZ5SWxBV2tjNVRKMUZJYTJ5YUtZOVNFNnVBSC9ZeVIz?=
 =?utf-8?B?dysremN6d3lFSk1LTmc5Um45eUVoVFg3VThEenN2Q3VnZGxtM0tXeHpLdnox?=
 =?utf-8?B?R3RLVWR3RFp3K2d2anZYVzl2azhRRHlzSlVyamJvMGUwUmV3RnkxdjJySW5F?=
 =?utf-8?B?S0Z0TE01bzNBNTdsSmQxYU1TQ255RngzZEYwV1k5YWowcnQrZUZORWJ2TnJS?=
 =?utf-8?B?YzUxSHFnVXB2d3lDSm5FeG95STAzZFhsYW1id0dFSTdoR09vNVo4Skh6K3VR?=
 =?utf-8?B?cHhmVzZmZTNXNjdSOWhCM0VKU2c0N3ZyYnpoM05QNkhJeWdTcTM4ZmxSejFt?=
 =?utf-8?B?eS94SkRxWW9icnhuemxpb0U3VDNRNjZEZ05tc21PWDFYOVBQUUI5UDZsNFNP?=
 =?utf-8?B?MVRpMElVWVYxQUpCTjRYK0RBenBKY1E5Z21yaDljcG0xaCtoTkVCWVpSSVhW?=
 =?utf-8?B?SmNXbDRJU3lZZU1xazNHMDJhWXBmOGlrVjQ0TE5KSXVVZjdJejdiUDhlTU8z?=
 =?utf-8?B?SlNwYklENHJuL3JzVmR0b2ZvQ2NwUU1QR2VLNEpCNWhGVCtiVVJ6QXdkWWFj?=
 =?utf-8?B?dlgxenlYRTNiSUFqMmE1VzZUTG9WaE5JR0pJcm4zcEg1YW1ZcnEydmxYK2Ry?=
 =?utf-8?B?WnViSjRjNlU3VGwxWVQ3cHdlbzUvWkppNUNONXhiMVNXeHRISFpZcFh1cWxq?=
 =?utf-8?B?Y3BQUERaTkFwYmdZeTNLSTc1U09zN1loMi8zMng1RWpQbmt3cU44UVk3KzVi?=
 =?utf-8?B?SU9CbG96TU80TFhaZ2t4cVlyT2FiSUhNZ2hqRDdLcmh1TFJ2OXpZKytzcU1n?=
 =?utf-8?B?a1lZSjdPSk1jNXJLb0RKdkNZK2VPY0Zrck1CUjhQb0lnQzh2MU01bW9YcTVz?=
 =?utf-8?B?Mk1INHJ0UWxndFhyazRtWUIzcnh3Z05DR2l1eWhoMEt3eVZiVHBHSXdVWE5n?=
 =?utf-8?B?S2VxUHFlNm9SYTVWSlpWZzN4TWl6UFNVeHlmOHgzcnpzRHNaYU51dlJkV0or?=
 =?utf-8?B?d29SQ1dSZGNvVFg5ZVRRRy9aaGhrQXNpRmo1a21mQVpwM0o1SHd4NmQ1OXhU?=
 =?utf-8?B?R1V0ZjhTQnUvOGpPb0pRNXFERndranJ2ZXFYTGpIOXpuUlB1VlpGdHJ3YXlk?=
 =?utf-8?B?Q1JxZjdOa3VqNE5IZ1VvZFd5ZjBYSDVYNUEvSm9SUWlld0hxaTlWRit2VVVJ?=
 =?utf-8?B?ODRvbkNqeTI4ZkZCbFdjYUhPQVR1LzBraGVnMEh4anJTWG1BU0xudTAwTzgv?=
 =?utf-8?B?VWcxaytUcVUrS2VoTkZKc1E2em01SXR3cmk1YndseG03NkRFRFpvcUdBdEdW?=
 =?utf-8?B?RFI5S2lVQmlDTXc1L2Mrc3M1a0hGd0lxa3hPeEsyeUhIREpEdEhZeEtRaE50?=
 =?utf-8?B?VlFMNmMwWUJuM1R1Q3dBT3RMVUZabjhIKzVTcHNwZlI5eVY5RVpXc2kzaU1M?=
 =?utf-8?B?VTM1aHk4anJ2cE90RW5ibTlGTHBaNldZUVVyejlnenNJYklmckdjYzhZMnZn?=
 =?utf-8?B?SEVvakl0b3lCM04zTDJaOWRMQWkzMUFxd3pvZ1VFNVRLN3pCMjhVQk1lU0pr?=
 =?utf-8?B?cmdFZTJRRmNaNWF3T08xaXVGK1JwVDluYnlnZlVqZUU4QllEVXlOOFlOV0Q1?=
 =?utf-8?B?WkV4UzMvdVI4R0Rtd0M3b25sQWRjNkZkWGRwa0hsUWhuTEdvMFF5cC9EeHh2?=
 =?utf-8?Q?IKeYn0EfvEGkyAPnWlMidrkWeoy/5Abjp3IGE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 18:49:40.4731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b3ccc-a797-47bd-4215-08dc687d2090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631

On 2024-04-26 10:01, Andrew Cooper wrote:
> modules_headroom is a misleading name as it applies strictly to mod[0] only,
> and the movement loop is deeply unintuitive and completely undocumented.
> 
> Provide help to whomever needs to look at this code next.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>   xen/arch/x86/setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index caf235c6286d..59907fae095f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1432,6 +1432,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>           /* Is the region suitable for relocating the multiboot modules? */
>           for ( j = mbi->mods_count - 1; j >= 0; j-- )
>           {
> +            /*
> +             * 'headroom' is a guess for the decompressed size and
> +             * decompressor overheads of mod[0] (the dom0 kernel).  When we
> +             * move mod[0], we incorperate this as extra space at the start.

                                   incorporate

With that:
Reviewed-by: Jason Andryuk <jason.andryuk@gmail.com>

Thanks,
Jason

> +             */
>               unsigned long headroom = j ? 0 : modules_headroom;
>               unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
>   

