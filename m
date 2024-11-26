Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BEC9D902B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843297.1258938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFklD-00065o-RG; Tue, 26 Nov 2024 01:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843297.1258938; Tue, 26 Nov 2024 01:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFklD-00064L-NB; Tue, 26 Nov 2024 01:53:03 +0000
Received: by outflank-mailman (input) for mailman id 843297;
 Tue, 26 Nov 2024 01:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFklB-0005yP-L6
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:53:01 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2417::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283796a1-ab99-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 02:52:58 +0100 (CET)
Received: from SJ0PR13CA0042.namprd13.prod.outlook.com (2603:10b6:a03:2c2::17)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 01:52:53 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::42) by SJ0PR13CA0042.outlook.office365.com
 (2603:10b6:a03:2c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.11 via Frontend Transport; Tue,
 26 Nov 2024 01:52:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:52:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:52:43 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:52:43 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:52:42 -0600
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
X-Inumbo-ID: 283796a1-ab99-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjEyIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI4Mzc5NmExLWFiOTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTg1OTc4LjAwODEyMywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbJFEvKL0DNtxpp9t7zJJaj0rj7FFG7iMrYBR7B/UXaSWLF6McTJ9gSHCx/YFuvAhx1tdVtebtMGt61KjMWflOI+aZMbtJ5NMRKfHqNnlLhlsQIDxxjneIkzboTIULNdsYFDmUcJYpG1lkyJDlamgyuGlPKEe9Q7v28OCNjkQ83FKGEvNAgmhRn/MiG1+CTSFj0E3U7WFjCIk4AJGZUCPUgR5OUFdMS3p+gylNm9oe7bROVeSgIZ1wcsf2qdAw2nvYGvw+ucj2PmVVCIKMQAgkgmJKgED+RpyuOpAr3D187XHfnWt9GfYIXmd3H03M30YBcL/cTHxOLjvEs3fS0JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPUn3Jo/A2ZL2CVrQ2ghv1LmOegn4bY6NabzGL/9xLI=;
 b=B8uFjTZJxvrWszzELmsu18R5Kza30bsf+W1NPegnJjOC1FOTzuZspQ53EYmORSp+RJtX4oUl7vAlq2cPYkOmopkP/+CBBv0wGBeTbgVSGhfKxQUdHib6Hox8aA/2PVKVxC/RB0YcGHSGS6r2URSudFS0pIAYy9ums90eCC/bDcJ91EuIOr87DizIPwV2baIw6jdcJHua0APE/6H7ZUViwGTeoltZaath19NIMH/NHkosh56EcIac6BRIrHcsPX52rCJRZVv+3nwd3l0BEdcF38+ORrELHZy7ll5HvFoeFyp3SIJMuyregCHrKXkgKKuVNjS6VFE6f/ANDQ9a/fYYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPUn3Jo/A2ZL2CVrQ2ghv1LmOegn4bY6NabzGL/9xLI=;
 b=2LYBlKyjdI2MbgJOPhVoBC/BuH1GnxjpJr4qwrPbzYZbjhGW1y0D4yiO/ZzxrSIdcwjYrpXBnxWZAueUBgaVOuOcd0SWeZdtuAmEpHVjsh2VTca3b2hrIPc5E5YBRtIUxnAfwCPyzaTneWw/llprf4vwQ/8+2nL9vCCcLf3a+90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <40db3a16-0f02-4b9a-ac1c-8e237b32b006@amd.com>
Date: Mon, 25 Nov 2024 19:11:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Hyperlaunch device tree for dom0
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH7PR12MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: e452c032-5a53-4a0e-c445-08dd0dbd0a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUl5VTJ2YzhDQ2IyTkFNQ2hUMEw1dUdkQUdleEdWVFZXV2tSNFVwdWFmd1Nk?=
 =?utf-8?B?emRQT2xleEtpdTY1R0xjRzVvRlVtWEMzTnRCWlQ4RnRPVHdwQW9LckxGSGpW?=
 =?utf-8?B?aEFnRGkvdXArNDVSUUlBNXVNaU1XdFRVbTQ0VWtLalJDY2dKbXlBQUcvUjVh?=
 =?utf-8?B?M1pFclpGRkdEVjVBbFlxRmVqVHBNWTkwdXlVaHF3c2FmdWozVTFkRHBzeFdx?=
 =?utf-8?B?eW9qZ0dMMU9jSktrenZEUTBnb2pPYXlMeEtiQlREQUE0NW5BWmRxZjZ5RDdL?=
 =?utf-8?B?Q1JHNUpOU1lPSURhdkJTblowNWg2ZFVVdXFKOFRWRnU3akNBbjJlOE5FUER0?=
 =?utf-8?B?ZS82a2NjRU00WE01QzRmTjBTN0Y0UEZJUVdYQjFjWU5TTDRpOXJjeHZMNEwr?=
 =?utf-8?B?WVpCOWkvTDc1Ti9tK2Zjd3gwQVR0QjkvNnhuQWM4cTRQYlZpS093R09iTzFQ?=
 =?utf-8?B?TGxqMkJTRWs0ZDRDYnpLaThlWFRoeHl3ME0rSFFrQlhXUHYzMnN4K2lWK01G?=
 =?utf-8?B?ZTUxNUxGYllZTGJuOGFoT3U0WENIdkNIV3dibUo2a3JWQ3lYOHRjdzdIZEVE?=
 =?utf-8?B?K0YyR2o0aXkxS1BBK2ZMay9nZ2E5SVdHTzJpQ3B2ei9PNmE2azVCUktSN2dS?=
 =?utf-8?B?RnRZcGRpS2c1bThXL0VFY20veEs1NU1iZ29xYWlzeXliNVI4WU92THJQR05z?=
 =?utf-8?B?cHprRHQ0SzlzKy9WNUFlUk5iSkJJMVNmUDltYmIrTUNSZU1NWWdMY29EQnc5?=
 =?utf-8?B?THJkMktZM0w4YTJ0ZXlKTzhVekpwejZhOGVNV2h1RmZzRStBd0YvS2hxK2Mr?=
 =?utf-8?B?ZzN6UExPRFgvaU4vM1JsNzVVWjFJS3hFdTdtajArS3cxTy9TeUdGdzNGZXFB?=
 =?utf-8?B?UVJiU1JFQStwYmY4dnhNS0FLM3dpNFM2dW5GT1BJMnlBcmZ2TVlWczZYUjJO?=
 =?utf-8?B?Z1JrWldyZFAray95LzFoejg2aVpTa0lNRVZFS0tMYjF6V2xnMlVBK2NYQ0oy?=
 =?utf-8?B?K2F5V3NKTGxrWksxRGtITjJ1cFhTcXRmbnNnZEltWDRVcHpRVlN5YTIyRG83?=
 =?utf-8?B?UzdMYUdCS2tRd0t6Q1BKUS9FVHZ1S1dGM0dVdVg4RW9UOHZEblc1TjRzNDEv?=
 =?utf-8?B?MGl3UHFNNGttVVhUVkd5SDZzTElSV3RqZkpmajMyZHExUnNxUk5ZREFtT29C?=
 =?utf-8?B?czVFaTV5akYwYnBjZVZuSHFFalNXTDM2RUpTa2xleVEwUklhd25yanJ2em1r?=
 =?utf-8?B?a3FLSWpQejVaN1dZK0NDMmRxa1R2VnpXWnVuRkJpY0NISU16YjgvRlNyUWdI?=
 =?utf-8?B?VlA2Si9hSzN1eDRIeEFDR1JjVnVvSkw3WTlnU2IzRzRXUDBwR05aVWdSaUZN?=
 =?utf-8?B?QmlOaE9UeUJGQlI3TlhvRmUwc040eXRBYU5kMUUwZS9qS3dHbnc5eWJLdlBv?=
 =?utf-8?B?WURVbUhhT1pZS1JaZVRCRHRMWXlVSUZQMWhna1dnSzkzUUtoN1MrV2RhWkty?=
 =?utf-8?B?alB5c2JKak9md2FDM0tHV1hycFQ0bVpZUW9udjAzeGQ5Wm4rZHJMUE56Vytx?=
 =?utf-8?B?UzVrR09Tb3B1Q2JoOEplMVB1WmpaZFNHNHNCZG9WaGRPeDh0akRUVlR2TnNZ?=
 =?utf-8?B?TWVPV3lsN1NiY1VmZXc2OTRtWC9yQmlsYWwwN3Q0dDg2TXBSbEo2K05RdkFa?=
 =?utf-8?B?ZkR1Z2F5NDJzN29uaHZMbktiWUJCalUycS85U3NOS0g3bkk1R2N2KzJDa3Rs?=
 =?utf-8?B?M1dmdjZDRXN5SzkzcW50REZEOVE0cGt0dXRET09Ub2tCaWZoekRhNjdSTHpG?=
 =?utf-8?B?Ti91akhFbnErS3UvdEtoOThLOVFpYnpQc1pDN2IzS3hxVmNta2JFN1BvTFFn?=
 =?utf-8?B?Wmd5dzJXeG9jc3lOeEdnNTZwMTQxOFMrM1Z4UkdJY1M4ckJ2aVNZTVZlUlBo?=
 =?utf-8?Q?TF/nXtCrm72Cb6wR0MfaC2pCNzidNZIO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:52:52.5536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e452c032-5a53-4a0e-c445-08dd0dbd0a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939

On 2024-11-23 13:20, Daniel P. Smith wrote:
> The Hyperlaunch device tree for dom0 series is the second split out for the
> introduction of the Hyperlaunch domain builder logic. These changes focus on
> introducing the ability to express a domain configuration that is then used to
> populate the struct boot_domain structure for dom0. This ability to express a
> domain configuration provides the next step towards a general domain builder.
> 
> The splitting of Hyperlaunch into a set of series are twofold, to reduce the
> effort in reviewing a much larger series, and to reduce the effort in handling
> the knock-on effects to the construction logic from requested review changes.

Having gone through this, I think you want to ensure that 
docs/designs/launch/hyperlaunch-devicetree.rst is updated with each 
patch adding a property to ensure they stay in sync.

Regards,
Jason



