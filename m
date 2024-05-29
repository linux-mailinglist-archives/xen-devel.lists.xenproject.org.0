Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2D8D3B02
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732188.1138072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLG6-0005r2-Mo; Wed, 29 May 2024 15:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732188.1138072; Wed, 29 May 2024 15:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLG6-0005pC-K8; Wed, 29 May 2024 15:30:34 +0000
Received: by outflank-mailman (input) for mailman id 732188;
 Wed, 29 May 2024 15:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcHb=NA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sCLG5-0005p6-D6
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:30:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61ecdb89-1dd0-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 17:30:32 +0200 (CEST)
Received: from PH8PR20CA0004.namprd20.prod.outlook.com (2603:10b6:510:23c::12)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Wed, 29 May
 2024 15:30:26 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::fc) by PH8PR20CA0004.outlook.office365.com
 (2603:10b6:510:23c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Wed, 29 May 2024 15:30:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 15:30:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 10:30:24 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 29 May 2024 10:30:23 -0500
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
X-Inumbo-ID: 61ecdb89-1dd0-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuPoDDsLIDCEwwp5ieUxidhXdZIDkath53V/79jXX/5P5l9jiY8pSxyiW7LDWSGwjtd8L9+J+vvgn3HfB6Oe77ESZa1kvCtxMHCEJr+xp8tFDiPrscpWkDHDNK7NiHUwXbXhdqyMw8kiX9dPRt4iVYIrkyoUzyzhx2DyeZ8lGb5rBT+rIOBi6w8X1+HLo6OG3++MdQr/B49keJXnMvZZ9/diX9OnsuQPy5DBlH13OQ77F00djQFicwZqhSh3v941IEdq+vjeCnbHWGgAIPeAS/vZnK470TPweMCsyA49jDJzYgSvyzkv/auGaHCRUabcHLsnn81kbkeYNwA4JGfu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTUBGfr3d7J2x5WWwui99WN/K/I5ilvznelX0mozrms=;
 b=fe4YPKXrmi1exRq1+V+ni1nSsDxN+inD2STUv50T398aa9E4VajuD2RqWdMH/y8nUazmFmf4Hl7zGuJj29jawvv9QOSeMEFquv9D0FZX5WdNB9QuLD1WG2tBNBbezEZsvbSZS8ClF806TDDFUB8d35Kj5y75Ymy8IYAbATli3k7DtHuu/CkynwAJaZ4Cn4vO4vYwtLIdYcJcR+sb+pcpqW9Pw6IS1L2ZSCNJjsyDhckSP/SHP7FeY4WTPV8jLxo1CgvO2j0dDeRS/oCW14Wami0tf9WDsfVStzg4rggfhJOFDqP3jW6fKj/ISp2H02bQ5eByULIkFJpMcuXD65+KXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTUBGfr3d7J2x5WWwui99WN/K/I5ilvznelX0mozrms=;
 b=sJ+f78gcVI13e70nagRQSTRYZCFJ3rqvMJ2NIm+AwGXBGFcJHjKla+cjIHNIRyj60q4D7fTxaO43ObwYpDj75EgpCcjFIwJbhACEQCGjGPMDotwp2C6pz99KQxxmkb5g9d+dhic0+D8LShNggeyNeyXXgY5Mqsk8HYGNjiFwVAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <10676879-e0e4-4332-b8cb-732d56cda818@amd.com>
Date: Wed, 29 May 2024 17:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] CI: Use a debug build of Xen for the Xilinx HW tests
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
 <20240529141945.41669-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240529141945.41669-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: a26c6f6d-97d2-49ad-e048-08dc7ff44347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDhNYWxBNXlGSlY0VnY1UUw1akdCSno3MG5FNlZUUXhoRmo5ekN3RGJ4UFdn?=
 =?utf-8?B?MlcxQ0NrNER1QmxiS0g3VjlZNDk5dElPU2crQWhEK2RxMVAxYlpHWlAwRnFu?=
 =?utf-8?B?R3U4d3ZFclJkVXFna3Myb3lweHNSV0hvU3RNVlVnanRHbmswTkFQVFdiK05s?=
 =?utf-8?B?NGFLUmtnd2VJQUtCQU4rWExNZlpTWUJwRzA2RXVKN2NHZ3ZLbWtUTnp3SGsr?=
 =?utf-8?B?NDI1NFA3eDNCekRXald5aVBzbyt0a3VCTEtrUTFkRCtnVTJOZG9aVExlbllH?=
 =?utf-8?B?WHpqa3FYekZoQlBqeTBKTGMvbkM0SU5aaVdGQzAyNm9ZMzhwRzJQdWhGT3Qr?=
 =?utf-8?B?TjFhSFh1clg0aVkwZWUzanlDcGFXdEgwUGZhUUdMTVVKM3UveW1xUlBMY1dz?=
 =?utf-8?B?YjBBcGpsdHVDOUNYUml4V1JkNmJtMzlobEd1TmFEdGhSdndQUlVWSUVCV3JH?=
 =?utf-8?B?N1dkdVFjdW5zQUNqZ2R0SmloNnRDRjNuZm16VFdtOFRxeHlTMEptNmdDc0gz?=
 =?utf-8?B?d1B6eGMrSUluc2Z5RkRCVCthT1Rydyt1ZzZ4T2RTc0FRM3k2MzdQdDFhdmJW?=
 =?utf-8?B?c3hyNTgvNnRmTE1pSnd2YU9ZYStGTlMzL0krRVdTc09aQXZBaytnbDY5QkUx?=
 =?utf-8?B?YVRFMS9iSHBNaGQrMEFMQW00Y1pHR2JhOStUNGd4aExRRzRQMk00Zmd2WnRl?=
 =?utf-8?B?NHZuRnZ2YS9Vanl0cXNxcGJXOEZYVWtFeldkNno3SjBZYjYyNWVzMlBDM2RI?=
 =?utf-8?B?aVFBV2VqSmVZb0p5UVV1bjd4NndwMGx0VDRRVjREbURWVnZiWlBGbXVuSjFh?=
 =?utf-8?B?OUJ5ejhqR252RWJsK2pUQVRkSlpZd1B0YzlOSFl2bUlCNGp3NTB3SUNhWmVC?=
 =?utf-8?B?RCsycEE3dkNrVkpnODlNWTZZYStzb2orcDVQVk82bU5veHlHUkgyV21abENM?=
 =?utf-8?B?WllxZXFJSjhTNTgxK3ZVTEZUMzV5VFJGWmFYRVN4QkptMVZTeEpvUEViVzFX?=
 =?utf-8?B?OWZ6cDdiRjJhT2JJVzVNYmg1V1Y5Z0RkcEJnWERBMzB3UlM3b0FuUWVoY1Jw?=
 =?utf-8?B?TkVVekt4ekpLWlB3WWZUTFE1YS9YOFV2Zm5YcDhhK3FGd1ZWRXhXaWhWaFhK?=
 =?utf-8?B?Rks2VTFZeGdUL2p0L0FBWlhyY05VNE1Wd3VIb2FHUEE1azlJWS8rT1BURTE1?=
 =?utf-8?B?Q0JQZitadkx5cWdSd3Q3aVFWVjRSTEpZUGlTbGcvbFhUWDRrOWJHUCsvbDVB?=
 =?utf-8?B?eDBBQjFGWWFMNFNuYjAxdEgxMmhrVWVhelJyTDRleEJ5L0p5QlowVUFFYnAw?=
 =?utf-8?B?Ulp3UmJyQWFaaU96a0xIVXJEY0FubHA2bEQ2bU81Umk5aVg4U0wvaXZhMEQz?=
 =?utf-8?B?aEF6ZmJlL0NPQ3ZqeTJFNXlaZGhqTE15RVVVcGQ3SzdtUnpHMUhuRFljZ00v?=
 =?utf-8?B?dzJPR2Q2UlovVVF5RlV2UmRCWllWdlMwSm1JSDkyVEVjTDVHUmZKMG5MVk0z?=
 =?utf-8?B?MUpqUEVBSGpGNUZsMWpHcDRGVWV3aUxpWXNGNHMrckJvVGZOT244ZmZuQmJo?=
 =?utf-8?B?ZWtSSVBBQU9lQTQ2L2lSQjF2QUdmUXRCUW13SGZMRkRuYVYxL3hublBYZ1lw?=
 =?utf-8?B?S3A5eVZCVFVmc1hhTWx3K0dDZ0VESWNGWkkzOFVLRktUbDRNRklNMUYzNzFs?=
 =?utf-8?B?ZW5XNWZxWElDSDEzN2x0K1Evcnk3REI5SVltZUIzd0N5OGE0VjVRcFM5TkNp?=
 =?utf-8?B?bWxtTlEzRnJPeDk4eVR0TW1oVGNqRTRjUFdZZGxPNFRkdWVXNit3R0s5NWNB?=
 =?utf-8?B?cGlvTVVoZENvd1hJWlpac1prbWIyK096VjdRY0U0cmNZL1NXampVclFrUytI?=
 =?utf-8?Q?9M+Weic+7Ceux?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 15:30:25.6205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26c6f6d-97d2-49ad-e048-08dc7ff44347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

Hi Andrew,

On 29/05/2024 16:19, Andrew Cooper wrote:
> 
> 
> ... like the other hardware tests.  This gets more value out of the testing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/gitlab-ci/test.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index efd3ad46f08e..e96ccdfad54c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -149,7 +149,7 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64
> +    - alpine-3.18-gcc-debug-arm64
This change should be reflected in the name of the test changed (here and below), so that it contains -debug suffix just like every other debug job.
With that done:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

