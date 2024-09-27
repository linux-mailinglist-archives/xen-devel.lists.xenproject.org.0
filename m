Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFB987F96
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 09:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806089.1217408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5af-0000rf-4O; Fri, 27 Sep 2024 07:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806089.1217408; Fri, 27 Sep 2024 07:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5af-0000pi-1G; Fri, 27 Sep 2024 07:40:37 +0000
Received: by outflank-mailman (input) for mailman id 806089;
 Fri, 27 Sep 2024 07:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfRU=QZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1su5ad-0000pc-IH
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 07:40:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c71f89ab-7ca3-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 09:40:34 +0200 (CEST)
Received: from SN1PR12CA0112.namprd12.prod.outlook.com (2603:10b6:802:21::47)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 07:40:28 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:802:21:cafe::6d) by SN1PR12CA0112.outlook.office365.com
 (2603:10b6:802:21::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Fri, 27 Sep 2024 07:40:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 07:40:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 02:40:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 27 Sep 2024 02:40:26 -0500
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
X-Inumbo-ID: c71f89ab-7ca3-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb6mCLJ2husD8xkPdqXG+KOv9IoJn7Sg2RA0EMFLjEkWkAl6PK3QIB6ynbs0h4A2LJYZq9pNp7dI8DnUhBCXROHWof22k2ga1/bw9/nooSXs2wu07PPfj8cBVuS5ZtdDjO9rCslBNtyukfappvndkdXZOOjj986T8AKYAsi/g8BK0r3A3gTJwfhtaDjFjNlcbdqr1HkCYVIPzKWJLRq69OLcY64Kia3/G8juRPhwgaskpHlLthC9KltsqYeDM2i1EOBQ3k6KGWhkprmpRWQyY4Fy0oBq9/mGzlmqFofq4lsW1Fc9BZ+y05WOnC6oLkmw+IBaMIcBFzudGcVmxd0aYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01WnzSD1bPsSkEUgOfFgjgEIzWiWB6w6krbBtRjz8Dw=;
 b=ubnfy4xKpTjrjJCowSkz3GM8cgIPmrN8UWkcz+J+0l7eMQS1V0xyJONwnmlc8th7Gg5JKUnWodWqEVw3wMkVnvlbzNUWy5m/YWWYU4Or5EooUsIeIGInz6U+oAXGEHKxEdiZ3ql7m8DWyG5NLZ/ymKErIOKjbuJWszyDi8WLb5sfU/Og0703dWnznTrqy9IaiNPfx8yeZRxt0tDyTaqYjhB0X4OVRZf3IYGLssbwa9Ywcdm7dqpvm36KeYgj+CNXHBRrmwpDkt9oJvCZX4U5bH/d6zAt3g4LA/sBX17OsVxItcCuxrNSm62l0IUX/dasRb7e+DMLT9Zn+OaYQxXhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01WnzSD1bPsSkEUgOfFgjgEIzWiWB6w6krbBtRjz8Dw=;
 b=21BzreAh1l6Hzj8acqB7/WRDdb4kvDAPnoqUeIlwFLodLz7xJoWYtTZ47SxAVwLPhKcgQsU3zD6zSTE2oHUKakovWI1aIrJrQMHdH1IgqJeXA5rX8vUfzIlj7KRSdBjl6FBQ8vR41OI4UNmG7z0nM9J7LZMeCynkKDpaw7lyc7w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9bb59a85-a6a0-43ae-8921-694bda8659e1@amd.com>
Date: Fri, 27 Sep 2024 09:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/common: move device initialization code to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <a45421ec3d5063596b44f0453e157de329a06f06.1727365854.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a45421ec3d5063596b44f0453e157de329a06f06.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: a96cc4a6-d28a-4493-a41a-08dcdec7a851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzFockErZEtWYjdwblNzdWVSTHFzYzdKY2Z6RlZYcEdRVnNRWm9FbVpkZmxz?=
 =?utf-8?B?SE1WVFc1bm9WTFJhemhZTURCa05OdkhGWDZYNUtZbDBURW5OVWgzR2gvZ0F3?=
 =?utf-8?B?eGhxa0VSNXY4TWs4Q0dadkUvNElxYkVNa1o2bjRJR2VwcGIxYTRiMzlLa3Uw?=
 =?utf-8?B?cDNDSVlqcTFGWGp1RWxMSWVQTk5scnFKSkt4U1pscld1UXJpR2k2blZKU05M?=
 =?utf-8?B?UmtFYUdpQkJNTjB5RTFxcUdBY1Q0MjhiU2QxMEJmQ3R0QkZJaGlqUFEzWUUr?=
 =?utf-8?B?WDBEdjFPNm9ydlBNL1NueVM0ZWZ5akFhc1RiV2kwbkZyV1hRM1R1K3VQdlpz?=
 =?utf-8?B?ZkFpZjNnOGluUjFOZDF2RTdxaldnRE1kcE9SSmt5ZkVLR3NoMlVTUGdmZmxS?=
 =?utf-8?B?UFk5MFpwS2pBeENCd3hZY2s3RHM2TTZNU1BUV2U3aVM3dXFFT2ZTLzEwaldW?=
 =?utf-8?B?K2x6YVBCK1QvTWFXODlsYUdINmdMa2RlMmo0bnlVeEJubzJtU2JOdzhGb0gx?=
 =?utf-8?B?bHM3cTB4amNES2Z3T3FTbmhPR3kvSGhqR0pldmZvTXRESjUySm1NTXltcngy?=
 =?utf-8?B?NlBxUTdSOVJrbitGQVVObjQ4Sml6cWxyR3A4dmg5elhNcml4V2Y2VmMreUpE?=
 =?utf-8?B?ay9DRXZCb3RONVFCYllDR3gwa1cyR0U5bS9GTzlUdHRSeFJ4aTNCNURBQTc1?=
 =?utf-8?B?WnJEYWJvOUxpZzRZVmh4ZkFMTko1WmswN1h4NUpaNGJSUU9FSzc0cnFrQmFx?=
 =?utf-8?B?Wnd1RTVjUVlPcUZZekxnVXh6djJBRDhUMmk4S0pGNlJPd1lxSm10Q05WeWNt?=
 =?utf-8?B?dzhnU0VabWYyRFZzQlBmS0laNHRobTYySlZGTDg2L1phNVE3em9sd3ViRXIx?=
 =?utf-8?B?SGhuOVJXeU11SnIyK21YSktObHE2TDkxSGpRN1dmUDlDM29XMS8xSXJVbWJM?=
 =?utf-8?B?QnQrTnBBQU5GeWlhUmxGYUQyOHdJcFNVbGo5UmlGVHUzMCtMMGt4Z3YrSVBs?=
 =?utf-8?B?cFNwVDdNVXZ4MDRUU1FDa01XeW9uL0RvcEJDRkUrcnZpMHlQTDQ5dTVwMEpK?=
 =?utf-8?B?OVBYQ29MMFZtbjVORC83dkh3c2QyS3MvWHRFUERmdXBhK1lNalVsZkJTYzVn?=
 =?utf-8?B?c3kzVVVTUFRKd2NFQXpIbldNR3dKZkUrZVVtY0sxemRFdU43WW85ZjNBVUN3?=
 =?utf-8?B?TDhSbnlTelAyRTZuVlFLN3hsSzZVWlg0LzdZRVh4UmV4Z3k0amZqdXM3d1Mw?=
 =?utf-8?B?T2MyY1dkWUFlcGt2Y29YSk1pUngvajlpc3V1R0Q3VmFUM1dMdXhqWm1wMndT?=
 =?utf-8?B?U20xemxmYUtpbkZOakpOUFBMZVlnc3ZueHRXR1l3S3lJMXB5c3Zoay9aL2x6?=
 =?utf-8?B?V09oUlFCcFBoS2h2MlVOeXJWb2hmNk5ibWVuNlZ6OFh6YjJTejY4dVAzV2ta?=
 =?utf-8?B?NDVaNkVXbHpkZGY1SmdwMEh6bkhiczRDM2VidGx3RHZ3V2NIVmlGcUxhUzhy?=
 =?utf-8?B?UlZPSkhQT2tEZGJMSlNlSnBDUmxxQlVXZWtmbWVXTi9PbUtRaWZRWXVyWEwz?=
 =?utf-8?B?R3JhVnVCTkZLMUVldDZwazB5eGFUbk5jWGI3NklFbkxmUFVnb0c1NFhoV0VF?=
 =?utf-8?B?Ylc3Y0lVWTkxS1ZrYUMvZEpLWk9Md0p3TFpDMEsrT2NYODY2MXBmS09NUks5?=
 =?utf-8?B?cWpxOEZWaEdzUkxGaGFLSzg4ZXltRDNUa21GdnJ0N0NPa1MxeUhjamRkL1pt?=
 =?utf-8?B?VENsc2srQ0VCbFllRWRJZitheVY5Wmp1a3EvMmtmK0U2cGNrZytxbTM0czRJ?=
 =?utf-8?B?VGhadm1TTTB0dlRKNFhkQnFhQXRjenAxVzNHMHRFWmJWc1N5Tk9KUDBtK1ZY?=
 =?utf-8?B?SzllbUh5YkNDNC9waVNsWUtuZms5R1RRcW1ELzdnQW5QR2pTVmNmcDdFcEda?=
 =?utf-8?Q?jkzzGXDja/x+5nlNIIYzUDBfmTce7HXy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:40:28.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a96cc4a6-d28a-4493-a41a-08dcdec7a851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891



On 26/09/2024 18:54, Oleksii Kurochko wrote:
> 
> 
> Remove the device initialization code from `xen/arch/arm/device.c`
> and move it to the common code to avoid duplication and make it accessible
> for both ARM and other architectures.
> device_get_class(), device_init(), _sdevice[] and _edevice[] are wrapped by
> "#ifdef CONFIG_HAS_DEVICE_TREE" for the case if an arch doesn't support
> device tree.
> 
> Remove unnecessary inclusions of <asm/device.h> and <xen/init.h> from
> `xen/arch/arm/device.c` as no code in the file relies on these headers.
> Fix the inclusion order by moving <asm/setup.h> after <xen/*> headers to
> resolve a compilation error:
>    ./include/public/xen.h:968:35: error: unknown type name 'uint64_t'
>     968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
>         |                                   ^~~~~~~~
>    ./include/public/arch-arm.h:191:21: note: in definition of macro '___DEFINE_XEN_GUEST_HANDLE'
>    191 |     typedef union { type *p; uint64_aligned_t q; }              \
>        |                     ^~~~
>    ./include/public/xen.h:968:1: note: in expansion of macro '__DEFINE_XEN_GUEST_HANDLE'
>    968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
> because <asm/setup.h> includes <public/version.h>, which in turn includes
> "xen.h", which requires <xen/types.h> to be processed correctly.
> Additionally, add <xen/device_tree.h> to `device.c` as functions from this
> header are used within the file.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

