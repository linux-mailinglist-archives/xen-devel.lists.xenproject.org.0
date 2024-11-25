Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067699D9000
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843259.1258898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkT2-0001Mf-Lf; Tue, 26 Nov 2024 01:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843259.1258898; Tue, 26 Nov 2024 01:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkT2-0001LC-Ip; Tue, 26 Nov 2024 01:34:16 +0000
Received: by outflank-mailman (input) for mailman id 843259;
 Tue, 26 Nov 2024 01:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFkT2-0001L6-1Z
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:34:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88a3cc22-ab96-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 02:34:11 +0100 (CET)
Received: from SN4PR0501CA0122.namprd05.prod.outlook.com
 (2603:10b6:803:42::39) by IA1PR12MB7687.namprd12.prod.outlook.com
 (2603:10b6:208:421::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 01:34:06 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:803:42:cafe::de) by SN4PR0501CA0122.outlook.office365.com
 (2603:10b6:803:42::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.19 via Frontend Transport; Tue,
 26 Nov 2024 01:34:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:34:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:34:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:33:42 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:33:41 -0600
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
X-Inumbo-ID: 88a3cc22-ab96-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjJlIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg4YTNjYzIyLWFiOTYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTg0ODUxLjEyMDI4NCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmeyu6I3PGiBgdsfXzYzkSbDm0X3ZnY1YKQdE40yKm1SScY3QY7M7o7lDQbrgg7Ewdm8M5rnI2Try3ahhUK9KtJ9ECvx7kAZWG/8Iln88EGjIxsHbf1CCGqTL4DQ0DOU0UMjhfs5wse9pezWX4Z2MxcYOOkIavXqXESMXJ1Fd3Grx6pqH6h0uwwP9g78moQgw7w5N0LvOnH8phlNTQdCkbjjmsuaSfzFStXZ/H+kdgwb6ID07cOAP9blKrsAueCBr6JKgs/WMKR88NS2bacmEMNtBOmrscfCMiijUbgTH5GXEo96AUrQlXI0zNZksPelD+Q+KojdMWigbVIFHMLfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+kG8zJDPb7WPuXlzOHlqTnI/QLJOPtaa4Neg0SoxVg=;
 b=Q/Su/PTan1ecVNvlcB4lNpuM1Qt+oZOH6JrGiffR+EHVYghrW8Dy1KRTpy8DpI/M89TBsoriK4sDmXSI6qtk+6xDUgvVabP7BaHYDysuFwqAJUMlYbODgeRkzF/el2H9PqinLAULH0QTxgtM+CkTr3c3Fwjob4UbeL0Ff3Mlg+IquuSTwQdPyU7468Tw5QHmEl9GyQIayxiYKzgJyTI8ohnI+jRjIgZuAq6iqqAhIIV+LBfVFHZB+rVAACN5wS+P/Be+9g2/SFSjAtzDE0XyNgzVPHL4/bunCEg+DCG21M5PcxnY9dEWaepoDP1h5sS72OO0A0JRRJYjIWQD80PXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+kG8zJDPb7WPuXlzOHlqTnI/QLJOPtaa4Neg0SoxVg=;
 b=DKVutg80DnzFx6vNor+m/p8LHsAJ+QglgNGmFGGNnkvgarRaHZgn3GxZY9qsQ9f6FDuZC+U61VETSQaTjCpv/aTzSTIB79GZTR/7o0p/17sLnZE1AevJxfgZGzX6uMbs01BPwDO1Cfe0hG5h2T3hbdlALjYEL2Vp7xB0tGbfz6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d93c041b-7371-46c3-bbe6-e5679ba0c73a@amd.com>
Date: Mon, 25 Nov 2024 18:52:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ca156e-33e0-4efa-fbb5-08dd0dba6a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkNTV0tqRFlXMFc2UkZVWEJzWURWdnd5U1YrWjBUcThuRHNtOHUzYXdtTGkv?=
 =?utf-8?B?OVl6ZHZJU29PYzVDVUpoT1R1TFF6eVJIeHV5L3N1TXNPNnVpc0IzR3lrVFg2?=
 =?utf-8?B?WVZUMklMNzZSbHZaNytYTUxPMDZCWVJZemtWM0gyV2lhZC9PTWtJdDZBRytw?=
 =?utf-8?B?MzlBME1PMmhoUkF6SFNVdmh5dEo0dm9sMjFHaXpSTzZnelVwRStiT2M2L3A4?=
 =?utf-8?B?cjUvY1kreHZsU2hnTnNOaWtMTDkybzUyMTVqRDlvcTVLSi8yUWwrT3FBZVk4?=
 =?utf-8?B?WVBWTlpzeWsreW1hR2tHZ1RDcDFML0dVUWY1enJ2TzhpTHgxYWE3V0lvb1pW?=
 =?utf-8?B?WDNGUGN6SDZQVWpEemwyN1pEZUdXT01DK3dzSVAzZDF5K1NrcXNmNVpON3hS?=
 =?utf-8?B?eWs0cDZVN3hoRDhLbjNlVXduOWQ5TTBUdmFTZHJ5QldsTnM3bEw3THJVRXJa?=
 =?utf-8?B?M3lYNWh1OUtTZ3BFY3MrckNqWGxLR0NUTDhjdEc4ajFsZmYyKy9TcENuU2ND?=
 =?utf-8?B?TE9xUVdKRlJZN2lZUUNIcEwxUC9VV09Vd3ZqQ1BIb2ppTkxNN1hKYmdzbVFU?=
 =?utf-8?B?cGI0SkwxSkxNb2pUZmRXaTlTWDhQOFo4bHo3WFJaNm95L3V5WVI0Y2NWVUh6?=
 =?utf-8?B?Q0JkUmdqTWg2U05rbVZzbG10RTYwMnN2NlU5cjdCci9iRGEyTkoraDJocjdw?=
 =?utf-8?B?bitZeW5PandkQVZHUjJKK2pDSkcxL3VSSmQ0d2FENWNpSVpxb3laSnUyVkVI?=
 =?utf-8?B?ZXBtQWlUdGx2T1ZDQ2ExRHhaYTg3VEZnTWRCL1Vtbm9kd1VuY251SEtmaGpr?=
 =?utf-8?B?M2J3VEIyajkxUXVTWXFYbktlb2U3Y0wzSWhZVFRCcCtoeEFoRlVNclU2RDIr?=
 =?utf-8?B?eGpjUHpGVGdDemR3aUlDM0NZUEtFUnFJR2JwSUtLZUlvZ0lHOWxiK2lRczBh?=
 =?utf-8?B?V2hHWll5UkVMVTMwMVNlMlRVN3ZxNG5aL2k5Z0krUDhlOUd3bXZuQ0RrRE1Z?=
 =?utf-8?B?dW9iWnpKc2FOamlJSk9NRTNqSUs4cnVldnFsYVhhTFgrOVc3bWMwcFo3QlFv?=
 =?utf-8?B?NGxwVlhkLzYyNGtaL1NkeXlTRjBmVnJKKy9ySEMydkNIZUpSaWd1WWtkZkJM?=
 =?utf-8?B?N1BkNjFVdGZnaUxTZTk1cHZuZjJJQUE1d1loZjFtTGlUS2U2VU1VS1UzT1or?=
 =?utf-8?B?Mnk4OEUwK2RtNEppTkJjdUUwWkRJeW9RRlBYR0JSR2lYS2RWWW9mNEdsNmNz?=
 =?utf-8?B?ZHZySlZsM1dUMU96NU9mbzdBNUI3NzBMUzNQQ21IWEQ4NXQxS3FOY3lyMmR0?=
 =?utf-8?B?UUowajYvcE1haHFZQUdwT3dzcTJrR2Y5dGRVUmdwQjlaSllKTklIbVFOS2o4?=
 =?utf-8?B?MjhIVWgwdEFhek9MTFZSQmlUdThKRmRkSzNtQWNtT3hhSk1VK21xditSbjl4?=
 =?utf-8?B?ZjRiZUZEbTBLcUcrUjRBRVZrd1c3OENPNUVWSDZuRGNiSmNqMW9na3BOc3Vr?=
 =?utf-8?B?Si9KOWIzVWNqWGNPMFFPOGdxZDdlOWdTNGVNYXE0U0ZVNXJtbmZpSXVScVRq?=
 =?utf-8?B?SENJYlc0Mm1wazloaTJQN2d1SEVXSFMwZUlGT21Ed0ZrQ2JRMjRQdmZZbEF6?=
 =?utf-8?B?aXRXOEFXeTNhVXFDODVFUEZRMlZHd29lWDFsTXZna3EreTJ0TVdERDljb3kx?=
 =?utf-8?B?cTlSejV5MlhqU0c2U2VlVGZGMXMvL3dKTEdHM016WHBVWUdUMFVsZUtweWFz?=
 =?utf-8?B?VFRiZkVYYXN4V1c0eGRHMkVNYWVyYUZWT0FPWEJFaFNySDlNMmpRZSs2dFM0?=
 =?utf-8?B?SFVaWWhiZDNTaVVOa0FadFNwYjljSVpGMEZkL1Y0b1dkQTdzTEJ3TUJ3ak16?=
 =?utf-8?B?VkRtU3JKN1U5bURWQTJYUFJ5Y3k2TEpXeXB1c3dmS3p2T28rb0RKUGxyblds?=
 =?utf-8?Q?BRL5SRb1xLWp5f5yRkRmRRDxJSwCozSm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:34:05.3640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ca156e-33e0-4efa-fbb5-08dd0dba6a41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Enable selecting the mode in which the domain will be built and ran. This
> includes:
> 
> - whether it will be either a 32/64 bit domain
> - if it will be run as a PV or HVM domain
> - and if it will require a device model (not applicable for dom0)
> 
> In the device tree, this will be represented as a bit map that will be carried
> through into struct boot_domain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

32/64 is only applicable for PV.  It might be worth mentioning that.

Regards,
Jason

