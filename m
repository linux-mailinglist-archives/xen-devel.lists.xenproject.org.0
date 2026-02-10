Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKcLHchUi2kMUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:54:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC011CCF6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226553.1533061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq42-0004of-N5; Tue, 10 Feb 2026 15:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226553.1533061; Tue, 10 Feb 2026 15:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq42-0004nH-K2; Tue, 10 Feb 2026 15:54:10 +0000
Received: by outflank-mailman (input) for mailman id 1226553;
 Tue, 10 Feb 2026 15:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpq40-0004nB-DC
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:54:08 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7279fbe-0698-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:54:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5175.namprd03.prod.outlook.com (2603:10b6:610:a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:53:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:53:57 +0000
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
X-Inumbo-ID: b7279fbe-0698-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CadJeKJ3iLT0VdPcUaxaCrzW25RUdsQNJ+LwIVjsJxva9UiwmhnDuW3grF9RTAZPLrA/igVAIFrmSCEVvrS2FZOahdfUc955wGd+/2sLT9007QU39J6mqNl3eAd+40LfRx6nMT9D6Za6KT1TLwfIz4JOicsnMawQOhjvZMVViNt8ejc1AdZ61OgiI68dBv9jX9rRtSFRmBmZUnJwzBF/wW/lnYssnZZBEqUlRDOcifuNc/1N5Zy8M8iMAF+GrOsC4ZLvezOwzDdSWzyPcGCOvso8t4rYCz4VdaKvI54lsUmwmnsPqvtGGrpQOJYP52oeyvVfGxyQ0Dm3tCMWfxW9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmEvUZ1QKiHEzh84BWVqPOTp3oiFgQGTjg0LCZbwrMU=;
 b=LuygTHrbv6zuD/93PotxiWqszMY4269E1aeSMhNDiNb5A9bNc+ekPZwljWO0g6isJvL0GQdulnhGufmGBC9imcnRM/2fWgakRtlG4ks9Gp98RJIYY9h6YOnU0Rd4tfI1AfIoWz5TXoD4QkFfmmxSsAwViuXh698U8r2ueoiUaqBRtTGfb6+gLGgf53N5HKLB+8Lhbiwo+vpuudFhTExqsw6UY+mSB8rcurG9YugxurEU8ZGrfzYa8lUyyglGykh8Ih93rGTGWdC/XmTXFBGeQXcmHrFEj21WK4kAUAZxFnHa4JEnuGCFsfndHwzqT9CTxvJtJaBfiNVQR4j7SRJVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmEvUZ1QKiHEzh84BWVqPOTp3oiFgQGTjg0LCZbwrMU=;
 b=CmjQV/xB4IgTOHQRiijn47JP1zBMGlNvorDwZE+7+ygYNHlNN2K3M1ce4ZID+Kw7mQZJIewbZvjYbbQckeLEUXSrco/tkmtvfR5P38KHtPzxJ68rIF4gtwp8m6JRizMjilaGSaM4m2xIRTekgdZYuFLU4qb4j9hKbSUaFjb/3mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 16:53:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Message-ID: <aYtUkeoX273I8ABq@Mac.lan>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <8bef9911-2f37-4cd1-bf18-29cca646fb09@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8bef9911-2f37-4cd1-bf18-29cca646fb09@suse.com>
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 86237ae5-b383-4325-5dcb-08de68bc9974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWZUaWlWZVEvQWdVdFlueGFVNkkxNHROQXovYlJZMTZNUUlraWlsdWF4aXBV?=
 =?utf-8?B?Tlp3bDJoWmptSWwwZTQrOWJaZExFOUd0aEowYWNMRXJWOTRIK2RsK3o4YzZI?=
 =?utf-8?B?Q2RHUkJkWnB2bzJJVitIekZ1MXZvSUd5alhVNzg2dEFId2J5ZHMvcGd1RGlI?=
 =?utf-8?B?OEhxNmhSdDgvdTNsbG1mNXNZc0Z2bWI3Ylh1WUpqS3dZc2VZTjc1ZDdqWmdp?=
 =?utf-8?B?ZVFGQzV6YzRuYk45U3crWTdSWFJDQTZNOC9uY2lqc2tWN1dwUnJnZE1PWndC?=
 =?utf-8?B?SXdTcm1pUm5pT2k3NGVCRUpoVGF2akZlb2J2V2RrdWZUd3c0cGR5TDN5Q0Nl?=
 =?utf-8?B?d1orSGRQVjNDV3JyOHFhRStpVldSemd3QWltTzJ6U2Y5dlhRcXhGREVILzhu?=
 =?utf-8?B?WTMzbjVUZG5qS0lJQ245Yy9JUjJUTExnME95NUd2bnV6MitQN21WSVJCcnpS?=
 =?utf-8?B?ZlVDNWNiZnpackNRN3lrelNlVHp6Mm1oQ1JjdVZIYjdndVRzU3NEaS9NVUhZ?=
 =?utf-8?B?MXBsd1VhN2pRQzgzSytPSGZ3c01rTG5rSlFwb2p6MjN3d2FDQWF1YmZoREVy?=
 =?utf-8?B?SEFYS09tOE9mSndUTU5rUDJqUGtKYTRWd0h4NUpsTGNEL0pwU3FKWlVJcCsz?=
 =?utf-8?B?bnhkMmdwcnlqMlhodkZFWlRYQ0QzWnQ3VjRTeE5VTGpwbmQxa2p4SmdJT0p3?=
 =?utf-8?B?TjZKZTdVSFFFbmhkc1lhdk53UTNVN0xKczFrOGFCY2t2ZTg0MG5BYkt5SnVI?=
 =?utf-8?B?UVA0Q1RkWldnWldNcSt6RDZHYlFnenFuV3lvRUtHRm5aSU9RSy9Yd1dON2d1?=
 =?utf-8?B?MjNlTkdBR3RSOHZsaEUyRXduWVVCRHE1Qm5lTHpodTVUVE9zQXRDbmk2aC9M?=
 =?utf-8?B?c2hhdnVnK3M4SU5CZFRBTGxVUlQwNmI4RXFuUHYyN1BQZXdiSllSaGNpRjNz?=
 =?utf-8?B?eDVPVGtTeXUyaEtKRjJhVm1UMW5zU3puWlp4amppVlJkbVRTckhhS0hVVVRi?=
 =?utf-8?B?SVBLK3IvYW0rMXJVTWZrZ0k4UHF6WG84em9HdXl4QW1WTklLV2JRQ1R1ZUg5?=
 =?utf-8?B?dUZVQXdpVm9mZE1oUENuUklKUkl4aWdNYUQ4M0dWMnRhUENPWEhlam15MW05?=
 =?utf-8?B?WHlCY1M0RXJOM281a2JJeHdDUWNlSmwzWGdOMG4wQmdjMXBYRVc4ZzdYSjcx?=
 =?utf-8?B?SVJ5TWo3aGc5TDdjZCtqeXI5a2FMT0xIVjdLbjlIS1AvUEprNDlBdlR5d0tE?=
 =?utf-8?B?aXB3WHhSYXBGMTEwMWgwVjJDU0Z3UWMyYlZhWDZoZlhUMzk5bThPTUtSMHVR?=
 =?utf-8?B?UkgwcWZyZE1GejlwRGVIZVlWY0pMYTR5OFcxSkErc2hBQzVTZXlSdzh4bFRG?=
 =?utf-8?B?Y3E4YzFqRW5ucTI3ZEJ6TzN4aXVvcnYybnpsUmRXeEtDZ0hodFZ3Z256MVVt?=
 =?utf-8?B?Rk1TN3Qxa0NPMHo4RHlTMHJmbWRkOFFnZk1GZWxyRkNTZW9jMzNFWDhDNFQ2?=
 =?utf-8?B?L24rMUEzcDBIbDJPUWVtRVRHcVBlYjJISjdEZEF0MllaRFo2QXpwdTVZL05F?=
 =?utf-8?B?aStOY1d0a2R3VkdGVWFiM1IrVlBZMndHa2xrY3g2dXBlUzRvdHgwU2RjNXBq?=
 =?utf-8?B?cmU1eHZZODhDMHR2bmVQeDZOck1NSmQrd2NhOWZkcWFIdUdVbEt6TDZheTBr?=
 =?utf-8?B?L3IvSmlGUlZZRTltckgxcUlSWEorbG9KNGxSbTg3VTA5SENNNnpueWJ0VTE3?=
 =?utf-8?B?anEwd2dQRWZyUHhGWVBNOE83dkpJWXVMMDNBQnFxNVFHV1hpbW9MbVRBeURC?=
 =?utf-8?B?NEswOUtPU1A5amg2ZlVYTENVekFUV2Y3R093WVRYOXBNNXNjWXFybWhFNHRT?=
 =?utf-8?B?d0VjLytiR0tTSkM5N0VEcXhiZlRaaVRPY3F0L0l6VGZYZzRmczlPNjVzWFYz?=
 =?utf-8?B?WjBRakhrQ2hYdkJCd0pya0lSNy9IQVY2RTdqeFQxNkxDWktUc1NnTzB4VHF6?=
 =?utf-8?B?TGJnT094NFhMT0ZmeHE2RXVucGdud2ZTR3VnTE8ycmNVQ1ErOXpZTEVZS2pS?=
 =?utf-8?B?T0ZJTTVyL2lIdm44dllJUzczaGxUQ2graUFtbHcyMTk3QVM3Vm5WVnBLQ0lz?=
 =?utf-8?Q?v8qY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5xYnZXUitTRlI4d2lKOGwwR3ZaUHltSnc4WkRRYWJXQWg0UGZFRDZjcDRI?=
 =?utf-8?B?dFN5c1hIc0xJYTdEYWRUc0RZS2NYUjVDdjYxMDVzbHRpOEN2Uk4vWUFpTG1C?=
 =?utf-8?B?cWcxOHZ4NEo1cU1rMUNZYm5GckpldzNaZFN2aFlnd2lJUDZDQzRwYjFvWGpv?=
 =?utf-8?B?bWdQTWViYXZhOEhWZ0FsNlgvam9mdnowVzh0RjVLZDdWSUpxbVJIUjR0ZW1I?=
 =?utf-8?B?YmJ0aDlvWWo3aWFScGk2aGsxc3htSkdlaDlnTDUzcHdRSUlMY2lXZjRhdWxn?=
 =?utf-8?B?MndMUEFMT3VXVjJIRm9PUStYMnBrZUwrV0lFQ3A5QXVMRFk1NkFBRGV4VGk5?=
 =?utf-8?B?U3NBTDk3TTF5MytaaHZrYmRRcGxnUGE2ZjE1bzBTYWEwMTVDMTIzZnZXd2tZ?=
 =?utf-8?B?WFpybVFDUllSVW1sa2ErYU5pUDFmZWlNOTgybmlGVVVkZWRIR1g1Wno1dFhr?=
 =?utf-8?B?cDJJdlZQUHNXT2wwcFNRTlRsRGQxbEdCRmNsRno3M04xWTJGN1F1cUlHZHhI?=
 =?utf-8?B?eXdyUHhPUEh0VEd0MUl4WXR6VUQ0N3FWcmtyenl6OUVYS3QxTHE1QkhMMmZp?=
 =?utf-8?B?akhVQ1dZdFEyUXk5MFpnRnpsK2U4cmFYMnZiSHVTWm9pYU1IcjgxTzBKeWRR?=
 =?utf-8?B?NWc1eG9jYlNnV0NkKzhvOGZKWmwrMFJyT0djSFl2SjBNUUxBdzcvbUVuUlpV?=
 =?utf-8?B?ZmdxcGJ0SjBuZGZJVnZIallVNHBVSGZ4aTFOSFRFTmNLYkhNbEVWUnRmV0dB?=
 =?utf-8?B?Y2M3OU9tNTVXeUNyYVcxR3BCZG15eGFZZkRNaHRJNlRuaUdHMElQaHFFY0w4?=
 =?utf-8?B?V1ZQRm1uSmVPb0VHWDJod01kQ2NmQ01abXdYVWhhUXl0MWg0aFdTTklvMVpa?=
 =?utf-8?B?NzA5MDhxcTQ1QjNrS3FVZUlURGZFeGFsUlJRWkdHMmFyeDBaTWNmMldIejZZ?=
 =?utf-8?B?ek5ad2dvQXkvTUErcUROWlpQVlM2SHg4ZzU1YXp3Q2xsd1pNOUJmV0hwSFEz?=
 =?utf-8?B?TFVQL0lNVis1NjJEeTNTMjNacGo5R0c1TjNTemtxSUZpVklYKzdPNk5GRzlo?=
 =?utf-8?B?a1Q2RnVHNkVPSHlFTzUzbDYrSzBHZkVKTklvMWZGVTlkajNNU3JTa2FRblMr?=
 =?utf-8?B?MlM0SStYNlJFeitKY3JZNHhxZEVvMW1rMU53aDdReElvUU45TVpTbk8wcm42?=
 =?utf-8?B?Yzg1MUJsRkh6NHpxSmRSR0oxVUZLSlVERDVXS3NjVDJTVGdON1FhMWxZcXVB?=
 =?utf-8?B?Y0hHR3d2K0RSYjJuRFZpRTNYdzZZZVFRRWFHamVGaEtRYjVUcEpKMklNeS9V?=
 =?utf-8?B?bkdlNlVFMW5DaUNQMFc3UzBrWDNMSXZSQ2NGUDkxMmsyc1pORXl2dXN2UmRE?=
 =?utf-8?B?akxnS3hKSWxHdy9LNVk0NURoZEM2VVcyMEtPSGNtcW9GeTdqdWV3ZkxuMmVB?=
 =?utf-8?B?bWZSakVyM0FMekpEVXVZNkFpWFpKOGp4MGgvRXhkb0ViMDdHQS9MWmtSUWNy?=
 =?utf-8?B?NVh3QVRPU3B2YklubUQ4UWNTZlM3QVc3ZG1hNVdvOVczaThId3ZCeHI5cXBj?=
 =?utf-8?B?Wlpma2NiUnpnWE04b0oxdTdtTUdmcG1WZVRIa3RITmRTRlAxTEsyZzdyazB3?=
 =?utf-8?B?c0dIUmN3ZERzR3ArZTdyeEhhWU90WmVBWXY3ZFFpbFc5a0RTdHlEcGNBMms0?=
 =?utf-8?B?N0crVkM4cjV4L1hJcnJIeEFySjdNdzNYRWVxNEEzVWcrR0t2b3ZLYzk0bUVM?=
 =?utf-8?B?MExhTmIzUC9obTY1NWlnS3ZGMHQ2OTRUTWY3K285U2g0a2YxS2pFbENyK1Zu?=
 =?utf-8?B?ZWwzb0dCYjN0WHJEcElPNGZpcngxQ1BWVlE1c21tY2dDMm5Cdkt5UEMvb2pF?=
 =?utf-8?B?WTd1N0owV0EzcEFmWTdESXNPWlIxSE9jWlNlSGFKZjdNOUwvQ2svRUFIM0ZH?=
 =?utf-8?B?UUxKRHhCckhITXhvRVFGZENNZWhnWVJBZjJXSUlWSlpHSm5SWldsdlovN25w?=
 =?utf-8?B?cHlpWUV0amYzaWxBYkxZMXZTbi9YY2pUSWpVTGs5elZHMmVhS1FQMmNlcDY2?=
 =?utf-8?B?ckg4Q1lFZDRrQUdhMUtVTHVndGpYRmxTWVErTmg2aFBJNjFJcUVwU3orODQ4?=
 =?utf-8?B?SFJJQnoreFIvMyszdWdrcXBmMDJrM25wdlJ0cmc0M3dubVhES2c3azBQb3Nn?=
 =?utf-8?B?ZkVJRHpUZXp5enczSXhSZ2J6Vk1DeHVkaFpiRkliRTEreXlYTWdJQURBTkhE?=
 =?utf-8?B?disrd1hBRHFxTXdOZHQ0VXlWY0Y1RkgwaEY4ZVVUT3RJeU5aRUdYQjgvOUM3?=
 =?utf-8?B?SVlNZDNlb2ROSmRVd2FtSGxlQ0xrcC80ZGpwWHBUTmQra0lzV1dFZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86237ae5-b383-4325-5dcb-08de68bc9974
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:53:57.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xp9TYXDbrPw50AnECoeiG/Fca/UnexVWjbbuuE+/MXbUsd1K45xLlaDyP5T2AhlK/UFbhxAGWBFaS1Bcn4BeQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6DC011CCF6
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:27:33PM +0100, Jan Beulich wrote:
> On 10.02.2026 16:11, Roger Pau Monne wrote:
> > GNU assembler will consider '/' as the start of comment marker on some
> > platforms.  This is incorrect with Xen's usage, which does use '/' in
> > assembly files as a mathematical operator.
> > 
> > The behavior of the assembler can be altered by passing the --divide
> > option; unconditionally pass this option when available to force the
> > expected behavior.
> 
> I'm fine with this in principle, but I wonder: What about Clang? If it's
> properly compatible, it ought to also take '/' as a comment char for
> those same targets (in particular for the plain "x86_64-elf" one).
> According to godbolt it can't deal with -Wa,--divide, yet there I also
> can't control what exact target the toolchain supports (i.e. this may be
> only a weak indication of lack of support / compatibility).

Hm, I'm unsure I can get such a Clang build to properly test it.  Note
the checking for the presence of the option would also be done in
Clang.  I would like to think if Clang integrated assembler has this
behavior the option to select our expected behavior will also be
--divide.  I think that's the best I can do ATM.

> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -405,6 +405,11 @@ $(call cc-option-add,CFLAGS,CC,-Winit-self)
> >  CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
> >  CFLAGS-$(CONFIG_DEBUG_INFO) += -g
> >  
> > +# The GNU assembler will interpret '/' as a comment start marker instead of a
> > +# divide on some platforms.
> 
> Could I talk you into s/on some platforms/for some ELF targets/ ?

Yes, that's fine IMO.

> A more fundamental question is: Do we really mean to support (allow)
> building with arbitrary-target toolchains? There are other subtle
> differences, which may be hard to evaluate as to them possibly affecting
> the Xen build.

Hm, TBH I wasn't aware of such subtle and annoying differences until
today, so I'm not sure what to reply here.  I haven't tested the x86
image yet, as I'm still attempting to resolve some non-POSIX options
usage in check-endbr.sh.

We might want to state which ELF targets we do explicitly support for
production usage.  TBH I doubt anyone would use a Darwin build for
production.

> >  Pass --divide when when available to signal '/' is
> > +# always used as an operator in assembly.
> > +$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
> 
> I don't think this should be done here: --divide is an x86-specific
> option.

Oh, that wasn't clear from the output of as.  I can make it
x86-specific then.  However, is there any chance of this behavior
escaping outside of x86, and hence would we like to ensure this
behavior on all possible arches?

Or is it possible that other arches re-use the --divide option for
some other functionality?

Thanks, Roger.

