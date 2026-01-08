Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939AD06383
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 22:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198150.1515352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdxLJ-0003Sn-5M; Thu, 08 Jan 2026 21:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198150.1515352; Thu, 08 Jan 2026 21:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdxLJ-0003Pg-2i; Thu, 08 Jan 2026 21:14:53 +0000
Received: by outflank-mailman (input) for mailman id 1198150;
 Thu, 08 Jan 2026 21:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HrZ=7N=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdxLH-0003Pa-OI
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 21:14:51 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101c13b9-ecd7-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 22:14:49 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 21:14:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 21:14:46 +0000
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
X-Inumbo-ID: 101c13b9-ecd7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ/CKN+3JISeP7pJnO5JRHtstM/06kLUfVFgQ1MYyNhjKrrVvYi8Ph5W8hsEjNp9qL3R6fPvhoS2eDdElB0Ldr0UHTbMPvqIj3SMU7gq2vOkF9JIQ/03OcgKcLpIUpzgDO7owDL1ne94nCprTDfuV0RYEe3vLhEmd2G5O0M5n01kKWOrf1VP5RpheIqXkYlUwWW4MFcQfQyEs2VI58RR1SBmoGa5JPMMxVKFiEGjok2pZi9h3+DAMqFx1csCKmhSpdvg7natM46veHuPSUA7GjGGDFxD5Q3bpgbWQ2HTzH4gStaDT1cgvnAkweDb+tQdC15/arn/znZLlEQOspSQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jpXeB/XVHxZbOd4fofwNGRIM3GOxc8aOGrrtgvNOXM=;
 b=u+T0c2VKK2aPESdXQGX5ooO7kiFd9rB4OnLZUgnS/Hh5pOYMNWpK15VzdOavCCMM7HpN+yhBCXz4wFdm6KJpVTFC55L4yVT69N+nIjTx7RqbwVYyWiIgYGNWt8Vl6/hHDhGjUcawBcmCEQ5VNdc4RrkqJx8a9bEi3Ms4QT7VJlx73tCvE1QMGGlMUWTFQL9hO9XMBJtyGxLq3SUWz7Jb+CdUa+B5hDdllKoQ2GVWwdD5orTG6RmNcS49X5JCE1ROGDDZqV6BmysxJe6J/cD7krS9ln0K4gysxsa1Td9T4tSQ0LUrw1OpxEdI78aGO2GTOfqHmIkELd4/XupE/Ffqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jpXeB/XVHxZbOd4fofwNGRIM3GOxc8aOGrrtgvNOXM=;
 b=ZcJ678WspRsclMsTAGd5AH1Jisnezhenv9S7e96PqjHubC8av+S1WQkvfWavX8fN5BQ+DYfwlACZ2cyKyoprGeZS0jhPculbcxEfFep+GsI5qSquwwNmqQBKKBUfTt/uM0Cx/wSQWOInZNQ3SFL9MRw3f9mQuR5jKvDq4cqtpX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7aa65893-c0d7-4739-98df-e64e48f168e3@citrix.com>
Date: Thu, 8 Jan 2026 21:14:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] x86: Avoid using .byte for instructions where safe to
 do so
To: Jan Beulich <jbeulich@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-5-andrew.cooper3@citrix.com>
 <673f05ca-39d7-4219-86bc-044a84e46699@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <673f05ca-39d7-4219-86bc-044a84e46699@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fc3e9e-0f78-4d77-6dc3-08de4efaf30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU8zNmd6Q2I2aHRmcE14U3RydTlvNE5SQXlNMzdldTlWdlVkR1JxcmdNVkha?=
 =?utf-8?B?dmlHN1oyazMvYkU0OE0vRmtPVkwvK1NnN3g5VHJDQXROMUcyaHhsSmIwbGhq?=
 =?utf-8?B?bDU4SGI5b2NhZnViNmhHVjdJNUQ2NXZod2J6MVI4YnJyU0V5TS9vTFdZSTBG?=
 =?utf-8?B?NkpZaENqUkFldkVMUFNIcExTMkpoTkR4NHd4STk3Zks1aUtUMEZUZjRXaU5L?=
 =?utf-8?B?bWcvcWE1NFRmTW9yM2t1UEZoSkk0NnYwMy9uMGtlQ21mN0l1NzB3RkJlNzhE?=
 =?utf-8?B?QkNpVlJhOURVVjNFczBnSVBaUDMwWWxBR3F0aDd4dU5vRytnVllsR3B1ZHRy?=
 =?utf-8?B?c1JOQmFGWVBvRWk4d0RsNEVyQjIrblErS29pb00xU2ZHOTNxdVg4Q2hqQUhF?=
 =?utf-8?B?V1RNNEJNdUUwcy9tNlVPa1Q3dThOWlBVVnVaV0pjR3A3T1RuSm0zb2szdnNR?=
 =?utf-8?B?S2tDYjJzU1hOWEVKZ2FTV0xkVUxGRGZLeHYvajFVaUpJUWFOb1NnMkxaNFZD?=
 =?utf-8?B?cG5jRDVsSytNaVlZMGFSVjZTSzlqbzkyaDFVMzZHMWxRdU9pZFY1ZjdLcWNH?=
 =?utf-8?B?cDZjUFNCWHZmbVl1bVRCWWRDS2FvSElkd3o0cmNOY0piTXFUNzZRSEVXUVlk?=
 =?utf-8?B?TXJvYXIwMGlVdkF5bHZJdlFYSWIyOWQzN2tSWExXRWFQcDJOSkNjeU1RQWhN?=
 =?utf-8?B?UTlHWGtHMnF6OElLdVVBdWlVT1BONVlsV2Z3SVdrcW1ibWllZWQ2VnNFSVpm?=
 =?utf-8?B?M1FpdXorU2R5cU5EZVh6M0owem5XQndRS2daSlZrcmRtTFlCbm5BT2o1Yjhq?=
 =?utf-8?B?NkhzTExZRExEMHA2c3VEVWVCZkJHZE9PUkZVZUtuTlk4dzQzdEhGbzhrazZu?=
 =?utf-8?B?UnhWS2NudjY3bkhPK2VyeEhDekxjN2NjQjBpd2NNNFFyVGo4aHl6MmptQ0ND?=
 =?utf-8?B?K0ZHdlMvU2t1WHJyTlBCRDJiSDQ3TGJkNEhXOUg0bjVrZENRUmlaemd6Yk8w?=
 =?utf-8?B?R2hoMjJ2R0xVd3E2dFRJdHdFME13M3IxNFllbVdDSGpHVG44SitIR2VHaHBi?=
 =?utf-8?B?SUpNZVJYZUVSb015eTBFM29mTTBFOWNlckZuNXJTcSsxcGlKZEM2czYwSFZx?=
 =?utf-8?B?MmpsL1laK3lNdGJLcmJhTVFuTC8xbFFhTC9xUFVjanNNRzlPTElDZDA4RXJ4?=
 =?utf-8?B?d3lreGNUenpiRW9CRXp0MEYrVTJPeHVLQWtlYmFSQ1JXdUQ3ZWFGTi8xZUhI?=
 =?utf-8?B?SkxkbHkvanNWK1RMREFDSE9NTUxocWhkdHM1V2RYdWM4K0JUaFVNT2lldXJN?=
 =?utf-8?B?T2FKQnhmQ25EWDRySnJoWUFKK1dIQzl4bHp5dlpLaFp6MXlTSEMzU3E5WWVN?=
 =?utf-8?B?dzFMNDN5dkh4dndRa2VBRHZna0ZaOERtMXgvTzNycEh6aDB5ekdSR05QcDA4?=
 =?utf-8?B?T1hMeHZIaENjYVJ6RFBoS1IzYzFWeGdVWkdNalFEcktYSzY2TUU4OTBCNUtI?=
 =?utf-8?B?STliWkNQK01oRU13YnhJamx1ZTRzZHVxVFVhM3NpY1d2THRyYmVDT1RxaFlp?=
 =?utf-8?B?WnNyaUlzcXQrRnJjMHJzZTJSdzhXTEhPTTlCLzMwSGRwL01TTVNpU1RDN0x3?=
 =?utf-8?B?S1lURDZXb01CUzdybzZCK0ZIYktFUFZacUVWcTI2K1EvalpDM1JGalI4VGN1?=
 =?utf-8?B?SWdoU0RrRThyTzdOOHJXM2FUTlAvNncxLyszMFVvQzFERDVtYkNnZElWVmhJ?=
 =?utf-8?B?SVhYNGJiUlVDN3FEMmUreW1pWVZYMnNKVnFaN0tMOGdHbE0xbVZ6aTQvN2pV?=
 =?utf-8?B?WFJhZ2p2Y3Rra0FGU2VUaFF5Y2hCdnlBaG1WdnVOWjFOVDQwU0JmeVJ1c0h3?=
 =?utf-8?B?VEEzU2RVQS9ISnVmQ0VTVXg5QkIrRW52aVJBcHNtVWc5MEdKbGFoT1FsQW1R?=
 =?utf-8?Q?9eypZMfpupQnT8Xa08DHNRdvC2buwwZ+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2xqM2NnQUNiTUM0Uk9DbWdhd2cwdUJQYnZwQWlEcTZoUmFQb0QyOERkYldS?=
 =?utf-8?B?V016WUlnQnhLRktCaWhSRzBuS080OHdPQ1NtaHgvUWIyeXYwZjRlSk1qdFcz?=
 =?utf-8?B?OTJWM2tFY3lBcjV5b0hGcklDa0J3RG1sUlIvaTQvaEwwTEhWRnlYV1BHbnlM?=
 =?utf-8?B?WXlIbXlMUzBienk0Uld2UVJ0U2M0b1I2bk1Ec2RuZSsrbVc4N05SQjhwd1I0?=
 =?utf-8?B?VlNZWWFDRE5vMmpMRWxuckhPSE84NW9LbWs5Z0lidk5sL1FPNmtNTWVLMHp5?=
 =?utf-8?B?QzRVRzdzRlFwYUhwNnRLWW4vUUtxcEZyamdvWk9RVERWcE1hTEc3c3AyM1Y5?=
 =?utf-8?B?ejUzTnlCazIvTUJXT09YZGlnTzBlY1BSaFRMSEN4MUR0MkxLczVlbFg3cjMx?=
 =?utf-8?B?V0llM21JTlJGQlpLelVNRnhUcWtXaG0veFREZDh6VWRrenp1cC9IZ1h6WGR0?=
 =?utf-8?B?WG85eFhocHpXK1JXZDFuaXRqOWZkK3BDYmcrV1EvdWJ5Z1A4MWowNE1KOE5x?=
 =?utf-8?B?dDJlYzZBVWpWc1NuZ1IyZzluUytiTTdZTkpNUGlFYjVueHlNSUJHNm1pbUll?=
 =?utf-8?B?cDZjTTczWGtIZEo5cElBVURaOWpodXhtNExmL1d0aDVIMUM3RHU1NUMvOXY5?=
 =?utf-8?B?WGxtcm0reWJKRHg0bWdiVjEyV2M2d3VQK0hPTTRLQnFzWkc3bHkzc1ZEWVYx?=
 =?utf-8?B?TStmeER0SkRLMTRrc3ppdW92R1dQWUdzM1pCMmt1N0RTcGhNMk9tQS8xZEF6?=
 =?utf-8?B?UXY2TFlxOUZUbnVnb2pVRHdmckd6c3ZtU0dqdURkNmV0cTBEY3JKUjdZdC9G?=
 =?utf-8?B?WExtK2xMRkp2Rnl1TUFtbjFJNUtzODVkZTZyYzBaTkZva01ueFpab210ZVlD?=
 =?utf-8?B?QXJNMCsrRFdqbVJGOXBmajkxVlJwbEQyM2xMNjRzZDBsV04wMEk3N0ZDWGpz?=
 =?utf-8?B?NGU5Q0JVbUtGMmtraUZySjlFNHhOd3Q2TjFPNkZOVitKNXFJOG01WDlKTmdG?=
 =?utf-8?B?VGcycXVqNUpxQXpUemtLeXZpcWExZ0VrcXp2c1N4eGovRlJLUVYzcCszaGNy?=
 =?utf-8?B?dUgzM0w4NC9KYzJQUFVpdWs3SThHRGtPWU1iTjRTNXlHaDByYzNXZXJ0Q25v?=
 =?utf-8?B?a2RNU0dud0t2MnhCV3pIQnAxc3V1dVlYN3JxM0FYUWUyZnVjSmFPNkhVVzhU?=
 =?utf-8?B?Z3ZZWkwzOEh0UldUdkppN2o4dmxtTFBoSFJDampKLzYyY0JndGpzZ3h3aFYy?=
 =?utf-8?B?YWx3ZDVHYXU5cDZSVUNBUVVMWmtDOVdSZWxHR2JjODFiZTQzdHdrNFlNbVZk?=
 =?utf-8?B?K1dnSmNvSzByQ0JiTHBmbWdwOG9aVjd2dFBFTnFMd1BTRjUyVXZvT2dySVpt?=
 =?utf-8?B?ak0zWXBsQnkzbkVZdHFJemVQUDRCdE1JL0wvMHRseXpkY2cvcmdzRzA0dUR5?=
 =?utf-8?B?ODRSelc1WlBrWkphWGhlQ2xIWitKVU9lc09vZ2gxWW5qc2VHb2lDZWNXMmE1?=
 =?utf-8?B?UzZCeGNmU08xTytaOTdIVXBtanNiL2Q4ZTlQZENPc01laDdvM2I0eHFHdG1H?=
 =?utf-8?B?SVpoSnlKc1JZTWpaMlI5QjBOeWZYdTJCd2VkcFlTTWhETHR4NENWeWw0cUFN?=
 =?utf-8?B?SitxUkRmUHVQWXhjSUxUYkI3ZnVER0RIdmxZUU5KUjVXVGY3Nms0elQ1Ynh1?=
 =?utf-8?B?bHdoQkNiR05rNlUzS25OK3ovdkV0bU9vVHR2M3pEd0o2R0pDQ2VzaXQ4eVFH?=
 =?utf-8?B?OFdvcmpFbUVCc3RNUFVMYzRUaEloV09VR1FCWk9ZdWs3WGgvM1BkZjV1THA4?=
 =?utf-8?B?RGlrektSWlkzcTEvdHMyNTErYkxXTHdXNmVFd2NYbmc0akRwVitORmc5WGVN?=
 =?utf-8?B?WWhQTmNpdkZPekl0TStrS29jNisvUXB3S2s2ZkVoakNCQVJuak9BUXFtTkV1?=
 =?utf-8?B?WnlRNVdoVzRwbXZCaTlBSE8vMXp1Z0Z2REtpRGFYTEh4VTkxTFArQjRCQ3gz?=
 =?utf-8?B?K3YreUQ3b3JTei81K1ZyV1J1TXM5UytKR3dXTFpCVG1pamlsbCtnWkJVY296?=
 =?utf-8?B?V3NNS2lRRlBjSEdsWEFDdklEZEt4UDZKMXNhRTlKaFh5MzZwajFUQXFuWGlx?=
 =?utf-8?B?dGgxQ2lGSkdqVXhyS29aWFp1NTc2TVFIemFSOVRPT1NkUkRsaEl5RWhBWWNT?=
 =?utf-8?B?UWN6K283a0JnbkRuSjAxTWprQnhncUt4OUkrN0IrYnkxUGgxc0FsTlIvTGI4?=
 =?utf-8?B?VmdqQ29TcmRkYUJ2dmNWUTFFU2lBajZFYnV2VlhvRVNKRlpMcjJUSU92QXRH?=
 =?utf-8?B?R0hGdnF1MktaKzcvVVpqdUIweVAzRU5oNzBCR2l1TWw3RytVUnV2OFcvMUxs?=
 =?utf-8?Q?5LphLhI4gTRor0IE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fc3e9e-0f78-4d77-6dc3-08de4efaf30f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 21:14:46.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTYoEg05hErDXnhB6jOaMaA2bAUaCfzBMJqdr4zuEKPJ+CFhnpqJVGRFXkEpeXA+6IVitM+ZDZMduvcqURKlbSs6pSSLPKVGIVJVyjYag6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

On 05/01/2026 3:58 pm, Jan Beulich wrote:
> On 30.12.2025 14:54, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/asm-defns.h
>> +++ b/xen/arch/x86/include/asm/asm-defns.h
>> @@ -1,9 +1,5 @@
>>  #include <asm/page-bits.h>
>>  
>> -.macro clzero
>> -    .byte 0x0f, 0x01, 0xfc
>> -.endm
> This can't go away yet, as it became known to gas only in 2.26.
>
>> --- a/xen/arch/x86/include/asm/prot-key.h
>> +++ b/xen/arch/x86/include/asm/prot-key.h
>> @@ -19,16 +19,14 @@ static inline uint32_t rdpkru(void)
>>  {
>>      uint32_t pkru;
>>  
>> -    asm volatile ( ".byte 0x0f,0x01,0xee"
>> -                   : "=a" (pkru) : "c" (0) : "dx" );
>> +    asm volatile ( "rdpkru" : "=a" (pkru) : "c" (0) : "dx" );
>>  
>>      return pkru;
>>  }
>>  
>>  static inline void wrpkru(uint32_t pkru)
>>  {
>> -    asm volatile ( ".byte 0x0f,0x01,0xef"
>> -                   :: "a" (pkru), "d" (0), "c" (0) );
>> +    asm volatile ( "wrpkru" :: "a" (pkru), "d" (0), "c" (0) );
>>  }
> Same for both of these.

Oh - so they did.

This is a fairly old patch, and I don't recall exactly how I did the
analysis, but it was clearly wrong now I've double checked the 2.25 branch.

I'll annotate these rather than dropping them.

~Andrew

