Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4EA201CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 00:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878224.1288394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYkW-0004hC-K2; Mon, 27 Jan 2025 23:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878224.1288394; Mon, 27 Jan 2025 23:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYkW-0004fK-Gn; Mon, 27 Jan 2025 23:42:36 +0000
Received: by outflank-mailman (input) for mailman id 878224;
 Mon, 27 Jan 2025 23:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=naHB=UT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcYkV-0004fE-5w
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 23:42:35 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61bc4cde-dd08-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 00:42:34 +0100 (CET)
Received: from PH7P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::16)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 23:42:28 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:33c:cafe::fb) by PH7P221CA0060.outlook.office365.com
 (2603:10b6:510:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Mon,
 27 Jan 2025 23:42:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 23:42:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 17:42:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 17:42:26 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 17:42:25 -0600
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
X-Inumbo-ID: 61bc4cde-dd08-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0QeBbjtED0/qTvjV3EJc9nEcaHLHUOvNAiltikSz3qhwRqpw8Gg1f40Yf4Q8m20ZF6hof+1qg57g8iq71aE2hCYo3CBNojD42zkds0RdhpTxTjR5PO7IZ14lB2zjpijrTHcE4wDVfSLu3oyw2YG2AMvXXm5HUzAJVX9j20tvQMtvLjkki+VmcovH3EDOIVZ4/R+e7YkffUKQGSKu0Wyqem2QrAHwSDsCdVpE9Pdt8nnnNHJFaqUAexYuTvq88hA55L8vRrNUa9Izze4XbgUF2EvbAT0L/3dDcID7OD0+fGVsDPmkyJBm/jeEdZbUj3u6kW2z9IWOGloYzICwRzx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TirXJZjTRGRvx07tf5vGQzHCNzL4jWXylt3e+EN4K1I=;
 b=I/TvooH3icUXftP8J24Bm07IaAmZ5+KlYCzR6WdelN/P66vjNhOOoAlDUpDAOQd/neSMhev5o0T8pg0G96I4k4kl5MxaK0rppJRE84p4AEnUA3wlcGNnXcyYLoEKq1mF/RyF8bRRocdXJ0dqg8ZnXvsfK/8qL/aYspw0bAmadvDa4nGoE7Qed8KAgJe80uWb1qhuCQr2y1gpknsGu2dbFS/ykn3yIVit2dvY+lxibSrNG7Owh6bvBxfY36MzdzbereutErFIoOr6V9wGgl07h0+gHT8j3k+jtnDbenqN57geqAIC78MtjPpH7f1hO4lHlcVBz/Lg4NCK7jGIInpqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TirXJZjTRGRvx07tf5vGQzHCNzL4jWXylt3e+EN4K1I=;
 b=rTyfzsgC9M+GfxiUjDQuWC3T+eOTmX8Ee76DH+GOw73Jj/qCaXVpvTLxXX/VqUiMHxr+36r6UimRPEMdrXkT0OfnLQY+/qGXLEhWrdOBm2GPID+AJMOpfiE8cGy+LitPnEE/+odQATp7vda3mLhzpM8Hg0KJ579HiMLhGZoUnY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2e246050-94db-446f-a6ce-d82c63888cbf@amd.com>
Date: Mon, 27 Jan 2025 18:07:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/24] xen/console: introduce
 console_{get,put}_domain()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 0059da27-334e-4cb2-5c36-08dd3f2c4212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFpVVVlKMVZrZEdUYjVEVjFaTW9nbXJOV3NKMld1MGdheHlWdWFzU2U3Y0xv?=
 =?utf-8?B?YnVhMFJQcnNteG5sTHprYUxUK2x0QnpSS1l0N3IxbENGRTRGTHoyWkI3UDd3?=
 =?utf-8?B?RlMwMGhPSmhzc21lT1IySW42aHd2VGdKVkFRblVKd0YrUTdYZ2pJd3FmczdL?=
 =?utf-8?B?Vzh5TWgraFpXUjhlZUNNcEJnbFNQSGdNcXplazBhZElQeUhKNEZlZFNiZDkr?=
 =?utf-8?B?OEo2bjk4NUkySkJHaDhkVWNNVjBGZEoyN0s1Nm1iRmUwQTIxSUlCVlVKaWtW?=
 =?utf-8?B?WWZhUHJzWTliL1haSDFtOEI3Vkl1NjRaTGxNalBFMmtoRVlSUGxVbG5Nekx1?=
 =?utf-8?B?UVpwcHFwYngrTzkySk43S096a25Vd0Y5QjVmdTloUmxwVjFCalZiT3JFNkhU?=
 =?utf-8?B?OE9WNG5tUGl4YmZrODFmWUwrUExrSW5mN1hPeWl2MzgyZks0WjgwNjdTL3h5?=
 =?utf-8?B?YkxXczFrMnNHSkw1M1R3aGFWamxXbmZYS0I5d0VDVFJnSHhnWGpYaHRSTDJ2?=
 =?utf-8?B?NjJHRm9IblNvZUhBbkkwNmQyUmVzRnVBczlaUUo1VzR1R09EZmk3d0g2YVU3?=
 =?utf-8?B?V2FzRGNpdTljVEx4RDRwMmZVemRvb0EweUoycUlDaGFLRisrT1RJeHlSNkdQ?=
 =?utf-8?B?UzNObHNVWHYrejErN2pRNzJya2d6YmpiOXZJeDQ0dVk1MXEwUUppeU5iWnRJ?=
 =?utf-8?B?K0l5UytNMGZVWXFFSkswSDRkRkxQREZkQVdLWGlhMVJRUDNSNXNleVdiZHJE?=
 =?utf-8?B?U2d3dXRrQWYvTVpydG1iWDhMV2UzTEJ6dmVUdlVZQXZQNjlVN2JnZnVzeWlk?=
 =?utf-8?B?Z0JLcUcraENHNUJzRHVvRmVTNmQzUmFjT29oR0lqeHp2cVBsUEt3d1NnaXBE?=
 =?utf-8?B?RVFhWDBvZ0lSYVBpMGNVNDBPcVhZbVB4OGFoYStXamdORjgreTIyVXhIUitQ?=
 =?utf-8?B?dUYrZjk3ZFpHWm1VNG44empsU3JhWUFpdkpvTTZrTUVEbUMrT2U3OG12QldL?=
 =?utf-8?B?NVN4bEZXbkZUL2R5UkJtSUhvV3c2dkJNNGt4a1pLb0kyT1hYd1dTNmxCeWQ2?=
 =?utf-8?B?Ulg3THQ2cHpFL0hVZ0JzVldjeFVBVGk0V3JuTWhlaWpLT0RQWDIrVlYrOWtU?=
 =?utf-8?B?TGtIaEwrYk00elY0L0VTU1VBVkNoeGxVb0NRcE9GdjQzWUZaOFdNWm9YN2FD?=
 =?utf-8?B?UkZtQnoraW02RmV2ZUNqb3dRVDB6cFU3R0JoMEZwbFFmamR1WDMyMHhDRjFj?=
 =?utf-8?B?dnhHVjB0ZzVnTnNDZXpwbVZRaTh1eG1kci9LcEN2c1R1NXBOanlpZDV2aUdj?=
 =?utf-8?B?YVUvWGpSN0t3YVRnN1Nqc2dYUU5jaTNGdVpuSmFBWkFwamxkN1YyNjZaVFZh?=
 =?utf-8?B?aGdYcTZvOUFubEEyMUVlZDdmUTQyWEJrZnRrazRtY2JUVGpHb09tcURKMlBB?=
 =?utf-8?B?Ync3MmluQVlJK2NCRXhuOW03QUcrcG9EQnNXZmt0bTNrQUNqVWhnSThmd2tl?=
 =?utf-8?B?TEZJT2dMSUtPNnBOYm5yWlBHMzdrOVlIMHMzL2dKaVU4d3ZpWDBRb0Rla29E?=
 =?utf-8?B?SUpxR2FGMTVxSmJpK0Z0aENpenJrbXBkWW55cDdadCtzbFpjaWFxeEdIdTgy?=
 =?utf-8?B?bmQvY1FnSVJqZG5mZFFhdTdJRFJobWZxc3NOaEtXVDVkTXFHM3ZNRVlTU211?=
 =?utf-8?B?OGxWTkFFYnVoYkpVcWZFeElvdVd2OHM4Tmp3RGN0MlFQcGhnbk1OdHhGSjlW?=
 =?utf-8?B?NkhEcUx0Vi9WSmt4OE1hbDBXa2Q1ZWR6ck1sTXcxbDNvZ1NTcVUxODZNR05w?=
 =?utf-8?B?NjhFVzliWWxMcWlSNkZHQzhGTlBLV3VpaHd3UGZBeTdvVnZ4dTZ5d3dZNVBM?=
 =?utf-8?B?aU9Rbm9MUFcwYUo3Um9TditweWl6eWpXejlVa0h3SnpCS3JtcEc2NWRDS3U4?=
 =?utf-8?B?WHFJYWtuUG5CeTNpOVRyVkoyWmtRSjV3Lyt4UXJNaExYM3laOG9OOGppMDRS?=
 =?utf-8?Q?p+Bze7y3G2Xm5CmwHPcEmUdaTBdhCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 23:42:27.4370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0059da27-334e-4cb2-5c36-08dd3f2c4212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_input_domain() takes an RCU lock to protect domain structure.
> That implies call to rcu_unlock_domain() after use.
> 
> Introduce a pair of console_get_domain() / console_put_domain() to highlight
> the correct use of the call within the code interacting with Xen console
> driver.
> 
> Also, use new calls in the console driver in __serial_rx(). That prepares
> the code for the follow-on console driver cleanup series.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

