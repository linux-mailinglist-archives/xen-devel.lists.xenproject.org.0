Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97461C9CD90
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 20:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176353.1500855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQWU6-0000BS-4r; Tue, 02 Dec 2025 19:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176353.1500855; Tue, 02 Dec 2025 19:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQWU6-00009J-1U; Tue, 02 Dec 2025 19:56:26 +0000
Received: by outflank-mailman (input) for mailman id 1176353;
 Tue, 02 Dec 2025 19:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/vY=6I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQWU4-00009D-Pq
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 19:56:24 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e8bcf5-cfb8-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 20:56:22 +0100 (CET)
Received: from BYAPR07CA0062.namprd07.prod.outlook.com (2603:10b6:a03:60::39)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 19:56:16 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::88) by BYAPR07CA0062.outlook.office365.com
 (2603:10b6:a03:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 19:56:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 19:56:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 13:56:15 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 11:56:13 -0800
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
X-Inumbo-ID: f8e8bcf5-cfb8-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASVR8zZqD8Wl5e6IZCquatBxJ/JJlh37UWilQL7P0ttpgfzUge+QMBjPr6enFHz9CdBYZ7IIJ6O91k+1vWVtdLTm97J3lFRmq14wUEA2L4aHiWp388otgN941GpeCQAei2JT5xqKzZfQXsYHwtR7Ls75K6QEUVeg7ihknyT3Ky5UQgsl9kSUcgfkv4/GHjxVtym52OT0IWHd1nOO5YnHnbbUx/bm8aTHweKhqP4PHM0uv9nJTAVkcprbDRBFm+HLGXSdB2Sj7gU4W8+XkGSPsyFzFLGSQslmScrv6NAsyDQGC+agxJueJcJ7Wo7H8+8CozclFbnwCnWwO8/tLHV1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/jLf+4/m/GtFIA0NHSxkTyYmsW3Re9H5WpdqOIhZbw=;
 b=hrM96WCv99lKNZVqjYi3gRkRfWK2kPzw8WJ/XG/hg93cQrNByrEy2Jr83q/3EgmPZtPlOatG9tdErApkSWRt6v1pwfv0Hs1RGKzAg9V0alIl0jcMvqIXLJVDxdhLJ1yPxGnPtpdQVqF2/wV+yuwk7gSkR0RmBeOMOhyGwIaMrh9Axlpyf1xZwBfIFm+7Bg8hFez0pWJ4r8b0d/pU3WeoeUkRdr9agoWP9cr8z+7zgp/dBdDdhYlBdMgdXv9T+cocS2sW9gTA1xOXfKG6gS39d1zbJz10yJJ+kMkcpW5u8EAqoXOdsvVRju9z9mHo/XXKUAqAUsr6wIXuz25LdkU2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/jLf+4/m/GtFIA0NHSxkTyYmsW3Re9H5WpdqOIhZbw=;
 b=CcPEWpXPtrA/e6BhXSnXsk/1rBz12KKskpR5Rl728O2zkazSZy6dgy4F2qgTFdbfcVgP3PI3s+fZWQpYTehnD2hcwVBroaEROJXCCNXR3UhqCjOZVJDI3BWVYHsxABU9nlhF/uB7hyIisAYuNLsTIoKGy8Bx/j16nSo6avPMHlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d1c1df48-a498-4ce5-8340-33755720101e@amd.com>
Date: Tue, 2 Dec 2025 14:56:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 4/4] x86: pvh: allow to disable 32-bit interface
 support
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-5-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251119192916.1009549-5-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 894ae473-ab44-476f-9b64-08de31dcda83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm5Bd2V1WXJoTUtXK1J5VVYvcXBLOG9kbTBCd01RczRIeWJXUlI2bnhNcERY?=
 =?utf-8?B?SHpiR3JGSjFlbUpDN3lGNkR6NFFBUXBDTm0veDY5bVRPZStFRll2czdWdThj?=
 =?utf-8?B?THdraUs3RzhrczAvSnZTbU1xME9QV2Z0S1pkNnRoTkJxUm56VGVaUUtQU3Zx?=
 =?utf-8?B?S1ZBN3FvQXAxaUptdGJHZXZKdml6SzJDNmJUcGp1N3cwbTZGMWZoQzBXdHdM?=
 =?utf-8?B?ZUptNWxUdGxxWXdZUEVIVGthREJqbVZmN0puRmVhOGxMcUpzTXR6YXU0WTJM?=
 =?utf-8?B?aGlCM25KdlZWS1FrSnVCNURRMWgxdVc4VXFCUzRLMnc2TWRkT1JGQjJleWly?=
 =?utf-8?B?QURsbnZRUHlJZWZUcEZYRkc3NUhxdi9IUFgxbEdxMUJyd2llb0dZOUxuanNR?=
 =?utf-8?B?VG9SbTBnbnZoa3NPQTdKQXZDVmN3VStwYXgzVzdqSXRZSDRSTTZ4NGcrWVo1?=
 =?utf-8?B?NmFWME9RNG4vRXpIZzQ3Z1BPRjF1eHFFcXgzc292citySjkreXM2VnNxN0RF?=
 =?utf-8?B?clpXemVva296Umk2aittTE9zcGNVeWFXWjN2KzRSenZyNnZuaWRNcVUrTGln?=
 =?utf-8?B?TjFYQXVUa3dKUlMrZVY1NXArQTN5SjNjRUc0b1VIaTJJNGRUQ1Y4bTNXaWtU?=
 =?utf-8?B?R09KSVBnV1NRalM1Y29samlvRVIxL1VkcjJrQlZwOHFCZU9EemZyTjY5Z0h5?=
 =?utf-8?B?SVh1Q1JNdjVnSnBTYmJnNDcwM21XQk5jcVBOT3dSdUpwRGRwdHgremhWM1la?=
 =?utf-8?B?bkNDR1FmOUdublM0YU5heFBtejVwZmsvNXNTelhYNGw4Y2orcm5ibkM0bUdY?=
 =?utf-8?B?RTBLM1FmOWZSRHhNSjBhakJpdFZGQnFHVU5LRS9nUWsvNGxaWFhvTGxTR1g3?=
 =?utf-8?B?QU40U01xRWR4ZmlyTEVua3VCUUZLYmFLYmdoWGV1OXhRbXVGWUYyVjdXVUkv?=
 =?utf-8?B?d0k0RFhCdklIb0UrU01ndUVRS2ZPazh5eHRsek1TR291T25ZWUxGT2trS3ZM?=
 =?utf-8?B?aG9EWXpTdFFTTWpoNHVKeW44a1RnQVFzVHg2SXI3di9yQ2pwbVJSMHRGSjZC?=
 =?utf-8?B?YW9BM09kQVJuZnJ0MzZPbUgxMFN1LzF4d2Q1WmdnV00xSDVmUDE2M3lYZHZB?=
 =?utf-8?B?R2NTZi9iajlRNWtLQUVUMnFMQStHeEk1S0Q1SERUWkRBK0dHcUY3TVUxWFhO?=
 =?utf-8?B?bFVTbnAvV0dRL1pkM1BmRTFJcjAvZlZpWEorZ2RraEM3Q3Y3TVZjSVlrY2s5?=
 =?utf-8?B?NGwyTHhSaldnNk1reDdvWnlZSmZPM2w2V2RNeHJ2S3E1RzczaW1YdXJxVVc5?=
 =?utf-8?B?UTBzUGNUWWVSSXgvQzB5RkdrdjlzVVZiRkhPK3ljOWlCN2lHM3RLcXhCK29y?=
 =?utf-8?B?MEViK3dnQklaVitLaEhIRlRucXp1QzgydG1GNHpkWmFleEJuNEppR0hCL2hB?=
 =?utf-8?B?WVcvTlJqQzVFbU9HSkJmdGk5RGVFWlJpRkhsdXNnZ1E4eGN1TTl3MnhWeCtx?=
 =?utf-8?B?Rkt0N1FnTjN1OWEzUGp3b1NFSE8vbkptemhjUE83RUNHY0ZuVy9DLzZzOWRx?=
 =?utf-8?B?dWFYdVovUklqMG40Qk5yUFhJK2RTcmcyaGN1MC9qUndUTmYzRENyYk5BUjFh?=
 =?utf-8?B?SWNLc1ZBc3NQa0xwTWNsN1FsdEFJeXNnT21ablpSQ2Y1Ym1yOHRkOTFZMmh3?=
 =?utf-8?B?U3RwUXB1ZlpON1diR0NPenRZNlc4Tkp0ODdVRklES1FqbzBVWFpCamFiS0Ex?=
 =?utf-8?B?YW9zenpBVGhwTTl5NWx6dmVSWGhsdlVrakMxS2M5eTBkYm1tVnJvbnRLUWpa?=
 =?utf-8?B?UmFPdENzUWx0NDltY2pyZ0xFYUZ0UHZkV3UzRnZmZ3lwbU5kSEd6aXhmZEZZ?=
 =?utf-8?B?YWFlZEdVYjIyaHcrbmV3ZnV3ckEwZDZZN1ZsSGV6VDNOWkQrUlRoYmVnUFRp?=
 =?utf-8?B?bTVocWV3UngvRE9VdlhDNmhISjRFRW1hdFVsZUhQaWl4TmhQZUdKai9WUEZ6?=
 =?utf-8?B?MlhKZG5OK2p5dm4wYjR1aHdDTlRuTGx1YUhwcUJVSzU2RmRwemdMdnpqWEc5?=
 =?utf-8?B?NVI0UXduK3dBVWRNeVJmeTl4UkFVZXFsand3cDZxRzBUQjJQanI0eGxueUph?=
 =?utf-8?Q?X5Ns=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 19:56:16.1055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 894ae473-ab44-476f-9b64-08de31dcda83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907

On 2025-11-19 14:30, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> For x86 Xen safety certification only PVH Gusts are selected to be allowed

s/Gusts/Guests/

> which are started by using direct Direct Kernel Boot only. There is also an

s/direct Direct/direct/

> assumption that x86 Guest's (OS) early boot code (which is running not in
> 64-bit mode) does not access Xen interfaces (hypercalls, shared_info, ..).
> 
> In this case the Xen HVM 32-bit COMPAT interface become unused and leaves
> gaps in terms of coverage.
> 
> Hence now all prerequisite changes are in place, introduce a
> CONFIG_HVM_COMPAT option through which HVM(PVH) 32-bit interface support on
> 64-bit Xen can be disabled.
> 
> By default, CONFIG_HVM_COMPAT is ("y") enabled and accessible only in
> EXPERT mode.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - fix format and move above HVM_FEP
> 
>   xen/arch/x86/hvm/Kconfig | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index c323d767e77c..88090f5b3965 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -2,7 +2,6 @@ menuconfig HVM
>   	bool "HVM support"
>   	depends on !PV_SHIM_EXCLUSIVE
>   	default !PV_SHIM
> -	select COMPAT
>   	select IOREQ_SERVER
>   	select MEM_ACCESS_ALWAYS_ON
>   	help
> @@ -35,6 +34,24 @@ config INTEL_VMX
>   	  If your system includes a processor with Intel VT-x support, say Y.
>   	  If in doubt, say Y.
>   
> +config HVM_COMPAT
> +	bool "HVM 32-bit hypercalls interface support" if EXPERT

Maybe "HVM 32-bit compat hypercall support" to get "compat" in the 
user-visible text?

> +	select COMPAT
> +	default y
> +	help
> +	  The HVM 32-bit interface must be enabled for HVM domains to be able to
> +	  make hypercalls in 32bit mode. Non-PVH domains unconditionally need this
> +	  option so that hvmloader may issue hypercalls in 32bit mode.
> +
> +	  The HVM 32-bit interface can be disabled if:
> +	  - Only PVH domains are used
> +	  - Guests (OS) are started by using direct Direct Kernel Boot
> +	  - Guests (OS) are 64-bit and Guest early boot code, which is running not
> +	    in 64-bit mode, does not access Xen interfaces
> +	    (hypercalls, shared_info, ..)
> +
> +	  If unsure, say Y.
> +

Maybe something like:
"""
Support HVM hypercalls from 32-bit code.  Hypercalls from 64-bit code 
are always supported.

Disabling 32-bit compat hypercalls reduces the hypervisor binary size. 
HVM guests require the 32-bit hvmloader, so they cannot run with this 
disabled.  i.e. Xen will only run 64-bit PVH guests with this disabled.

If unsure, say Y.
"""

While what you wrote is correct, I tried to rephrase to highlight the 
the implications.

Regards,
Jason

>   config HVM_FEP
>   	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
>   	default DEBUG


