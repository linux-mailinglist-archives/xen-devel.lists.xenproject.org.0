Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD58D175F0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201254.1516937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa3l-0006Wz-Km; Tue, 13 Jan 2026 08:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201254.1516937; Tue, 13 Jan 2026 08:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa3l-0006VW-HQ; Tue, 13 Jan 2026 08:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1201254;
 Tue, 13 Jan 2026 08:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfa2b-0003C7-NN
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:46:17 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d26b8d-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:46:15 +0100 (CET)
Received: from DM6PR18CA0021.namprd18.prod.outlook.com (2603:10b6:5:15b::34)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:46:08 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::38) by DM6PR18CA0021.outlook.office365.com
 (2603:10b6:5:15b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 08:46:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 08:46:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 02:46:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 02:46:07 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 02:46:05 -0600
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
X-Inumbo-ID: 51d26b8d-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7rPML9cHNdAOEpITlNSARhe+FYyhRKAvGUWhcYjfzJxjVmI0QR01Z6Pa5t3MCTG5DxXo9T3He9X7kBZFLdutROXsH5/eKdGHc1qoCnX3Ux8HPdKqjDpRgNRzuxh19CuPU+SCNFbBiVRuqtBBhtp8ioUPzJnNdPvBZfjJw1DMOP9Ri9FiWXIWWaMVdgRQ0uRzC8dmhZ/udqTvLxl3CwzOI2jlF37r9FtO8BhvO7BDHBGDTp91VNY4Tu6pI4MmAggchIqsYhU+EcajHPCeXuQrQJlc9oyZgOIysrroFkjmJeDLgU6rLpbx1TtKLkD8ruWTmj1otkMqLvPPOsqjF1E+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s8yzkIgbumej70kjP3ByTRzIi6fvqlQRmrtmuUF1AE=;
 b=jy6apFIVKnw5HBZdKao8tRuHrksyT/bOJ5NOh407a82K6As4MOPZeusijdWvFEHkTMRlHtwaifydRdVO3ePLli9JJ3tLPn5xKikgm1r9mP7twOGO86YGlQcc6SbvRgQwYUPMoZAIOg173ctlhP5J63Da09OnkPMGQYOvw2Bo2HxILi9newOTth5YNpqRwfbvYe+JiiNyuyZdsORyJ1O8EEw0fdKbfK3kdXc189ghdRNbDBeNcdw94qKBk/RfwfDYrvTUPpA8cOiCNhYPiTt1Ueh3+xIouClXmyqtwCFjvcTRJ9N68J8j7hrnzWqurs4A+Vz2jMFPEvAdlt3E80HLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s8yzkIgbumej70kjP3ByTRzIi6fvqlQRmrtmuUF1AE=;
 b=x9w9FsPLC9tXfPERAHPZc9Pk/tgyljmIN+rYjGiaRVBCRufoek5mmONnlLvfTX4yyTwrs86sAhz2KLQRyVHZHjJg5/FYjHzEtL5gWqyGxbccZ5BYBu5yh8+BqnorZF5koo8mnBg3+A4qVRL65lVgStLxcDcxt7LnMIdPHf7n7IY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <05e9d883-f130-4a69-b2f2-deda9379c591@amd.com>
Date: Tue, 13 Jan 2026 09:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSS] xen/arm: CLIDR Ctype scan order in get_llc_way_size()
To: Mykola Kvach <xakep.amatop@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
References: <CAGeoDV86se5TsPK5hENABJqsN+0FvFv=TJSkHs4N7VivhB2UaA@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV86se5TsPK5hENABJqsN+0FvFv=TJSkHs4N7VivhB2UaA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: c39d95d5-35b4-477b-36ec-08de5280323b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlVNNkNVTTJKSC9qMHFVS3lXTkRCRm9aa0xLSlBMNkh1RXIvRVEyb1pZWXMv?=
 =?utf-8?B?ZmhqTWpCS2ZZNlpKTnBiYk1abXNCMndxbFd6T1FJSVZRejlBb2hPbEVBcG5l?=
 =?utf-8?B?Ry94ZHBIdEc1VmFmSGx3T25FeG1WZzFFeTFoeG4vQUhORkxDTk4zWG9GVDBN?=
 =?utf-8?B?QzdJU1VydC9OZWxiaGFUcGx2Z0dYQXhnRnVTSFlqekxtZ2tKTERCc3JCZnpG?=
 =?utf-8?B?di9EbkhDQjlhZDZvUVFZUkUraklDZUppSExVZ05GcWNaTmVmd3FRTUxDa1Uw?=
 =?utf-8?B?MUFKTmZTckFYc1RGR0hjaTdJYUZlNlAvZEZ0c3F6bER2NU5Fcnp0OWppVWUr?=
 =?utf-8?B?c0E0dFBiNVErcmJpSzVFU09CcURpeXJPQUVMQlJXRlV1Vk9RNW9wZ3dXbHNx?=
 =?utf-8?B?RUxONWtkd2ZCZElvRmNNNDB4ZG1pbFU4MCt5eE5sbXFQOXFWd1RYMk1abDZu?=
 =?utf-8?B?dVlPTmVIK050TlRGV0lRUEdLazZ5cG1vUVNkT0pkMEpoem5KOVpveE50dy9o?=
 =?utf-8?B?UFBONWROdVZiYy9JVUIvUHE5OVNMQkpHN3JFY1FPZGlFVXpvdisyU3paN0pN?=
 =?utf-8?B?Y2NRN3Y1bWh3eHpxZlF5aEdzRTFaOFRsa0k0cTlOMS9UREFSWWFyaEhNRFc2?=
 =?utf-8?B?SDhxMWZWdmlieHBiZGVCaWMzWDRCZnhHbHZha0M2Q1JZaUlpOVhYS0xLOTh4?=
 =?utf-8?B?YUtOMk0ya1pXaHFkM2hnaVlsd3pxSTAwYU8wZzl6Y3dZOXpTU2p5ZEhiUzZZ?=
 =?utf-8?B?Tm81OUJzcVQ0QnJ1VCt0RFNuNGs4bkI5WEZwc2pVcHZzejJhVjhGTXQ2QlQr?=
 =?utf-8?B?aHZ3MitXRGJBWEcxYmVqbHNLSUlndGlQVkVjc0dFMklNR1lyOU1aSlFrazBv?=
 =?utf-8?B?NlRKajRHdExZQVl2L3JiMGZMaDNzZ0RkTGcxZnJWVGlvQTNQNU1JWkFRY2Ex?=
 =?utf-8?B?RXp2bENtN0tBWXFQY2JoT2FackF2ZHBpSXFoMEZ2bkdGZ1pGVnhBWFhtTGxn?=
 =?utf-8?B?Y0dvemk0RTRvd0lSTk1GOEpRQmtidVI2Zkk5d3IzWERuNHpuRXJ2ajNVbGp5?=
 =?utf-8?B?Y0R5NFZlRy9JZHNieCtrRkEvT1RFOVBpOTZUL0hRdnlnMEJTUXIzM0lOYnJl?=
 =?utf-8?B?Kzg5dUI3Z0ZvVXVLRi9zeDZQWnpBKzFRSkNma1BwTkpUZk11MXhBR0xudmFV?=
 =?utf-8?B?cWsrTytvUm1Pa0ZGZ1gzM0JFNzhkcFNGZFVoK0xGYmtDTDZxQUorRitadk9L?=
 =?utf-8?B?OU9NNU5qOVM5dzVMakNEeHVERFBCOU9NYi9vY1RGZlg3M1ZvMjd4dEpEVHMy?=
 =?utf-8?B?QWJweFZsdXk4Q0Nsck90aTFaRm5QRmZsSHF3aWhTN3dIOEpVUzY5Z0d2dWpU?=
 =?utf-8?B?M3RWM1RNbWxyVXpsZmw3WHdqYVhhcTAyMGgzUWlZVTRUVmtCaTNxSGp1dVRB?=
 =?utf-8?B?SGVnazBRSGFOOUt3THV2bTYycnlZOXppUWF3OG1tWHgveDBsUEJEWE93RTU4?=
 =?utf-8?B?RVViRlVHc0twOUQyd1VZMFJzZUIvWjBaZkVIZk1LOTcrTHNnSWdkTVNIYmNl?=
 =?utf-8?B?bFhCNXVXSHpQUjFhemV4WE9JUUNTUGZjbndKSFQvZ01pUVVMbVFIT05UTVZC?=
 =?utf-8?B?cjZFZUk1K0VvaW5YNGZydlM5TzVjaFlXRTRNQ1dzVGFwemJFQUVxRFBNb28y?=
 =?utf-8?B?a3M1QW04MiszK21OL1dYOHdXRXBzdFI3RGNqTkZzMTI2TVJMM2NMYVltYWpY?=
 =?utf-8?B?V0ZkZitsQzZHUXlVQ1ZPeHJwQzUrbzlmYUFSRzZIbFovZ0hxWFRMOGkzNDFh?=
 =?utf-8?B?N3p3dDFVTmpucTVZQWZhMUUrM1J3Unh2d1BTYmRZelFuUHhKUXU3N3VnQWto?=
 =?utf-8?B?eC9TT2p4cEhZR0F4WmdBcjBGNDVFbEFEdkVBNStwWDFOUCtzbjVCR1BTL05z?=
 =?utf-8?B?MGJOM0V4VmgyWGFrWU1zSHpYcGhrelJ0bkN3ak42a1kzUWdqZ0ZQV2ZTbFp6?=
 =?utf-8?B?YlRMeFZKaEhTaWxJOVIzZWFVR1AxMndONWxSOWwvL1FnVVBpNFVpWkRtb3pX?=
 =?utf-8?B?V0tnN1IzaEUrcitBcklCQ1p6dHQvbU9WaXI4WXJESDBybWY2MVhCaExhWHZH?=
 =?utf-8?Q?GBhM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 08:46:08.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c39d95d5-35b4-477b-36ec-08de5280323b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027



On 13/01/2026 08:00, Mykola Kvach wrote:
> Hi all,
> 
> While investigating current Xen code, I noticed that get_llc_way_size()
> scans CLIDR_EL1 Cache Type (CtypeN) fields in reverse order to locate
> a unified cache level.
> 
> According to the Arm ARM (DDI 0487J.a, D19.2.27):
> 
> If software reads the Cache Type fields from Ctype1 upwards, once it has
> seen a value of 000, no caches that can be managed using the architected
> cache maintenance instructions that operate by set/way exist at
> further-out levels of the hierarchy. So, for example, if Ctype3 is the
> first Cache Type field with a value of 000, the values of Ctype4 to
> Ctype7 must be ignored.
> 
> This reads to me as an architectural constraint on software: fields above
> the first 0b000 are not architecturally meaningful for decisions (regardless
> of what bit patterns might appear there in a given implementation). With our
> current reverse scan, we could (at least in theory) mis-detect a "unified
> cache" at a level whose Ctype field is required to be ignored.
> 
> Discussion points:
> 1. Is the reverse scan intentional? In particular, do we rely on the
> assumption that Ctype fields above the first 0b000 are effectively
> RES0 in practice, or that they may legitimately describe caches which
> exist but are not manageable via the architected set/way maintenance
> instructions?
It is intentional in the sense that it makes the implementation easier
but it looks like we did not pay too much attention to the statement you provided.

> 2. Would it be more correct to scan from Ctype1 upwards and stop at the
> first 0b000, tracking the outermost unified cache seen prior to that
> point?
Maybe it would. At the same time I don't necessarily view this as a hard
requirement (the sentence starts from "IF the software reads from upwards" which
does not mean that reading downwards should not be done). I'm ok if you want to
change the implementation.

>
> If there is agreement, I can send a small fix patch with "Fixes:" adjusting
> the scan order/termination accordingly.
> 
> Thanks,
> Mykola

~Michal


