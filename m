Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D131CCEF1A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 09:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190483.1510918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVjO-0000FY-Os; Fri, 19 Dec 2025 08:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190483.1510918; Fri, 19 Dec 2025 08:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVjO-0000Do-LI; Fri, 19 Dec 2025 08:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1190483;
 Fri, 19 Dec 2025 08:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vWVjM-0000Di-TK
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 08:20:56 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3593c89-dcb3-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 09:20:55 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by BN8PR03MB4962.namprd03.prod.outlook.com (2603:10b6:408:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:20:53 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:20:52 +0000
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
X-Inumbo-ID: a3593c89-dcb3-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMMNvIfE+ThMgCL1XwP1UPZkDcL2/M9OdHZUshWhcYslJkf6zH9Jg8YH/YctFPitVGe3sCBaAmIb8okFasErJ4k5R18/hPGFDjmB6shOCTK8+oPM6S2NIqyUC8GaVMk03pfYKOCZvDAPpcAOA6gfDIx64IJoA6WzgqezrkJM/oN/fzBI4kl7L1BSxhVyYOUHbTiLtozSF3/IfKU9TIyGpj4IYIoRAZoCEgMdIx2FZpE2dwDLdD+ArUEP+wvKobN7i6f3+E3BJnXCU3EpzsKDzkgAIZqheC/FfrGBaLK+kVn0YJ4O6DCdr/knt1HpSogAG+RfVD/1hGT9v5EgDxfLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoezJyPHiC0tSiF44WOen1wvN8vgB8Dkei2Rn7ufFwI=;
 b=Ynrszex0vJ705q7KggE5LK/ini2+gjKnnqj7n231H1QrmrXjQVLwKBOU7JpjgtDUD+QVX19iR8UgEAMUBhON+5zdWb5bd7Dscv6CJOQI9li/m8Dym7wb5kVcBtdiGtjnQlrThoq75CfK0cXqqu4CPpkPduhp2VsoNwjqL0ye61Gr2dki9DBD42qNFEceOCKBHnATIPrESNcFN6dWebqm8PUUIRjVS3Frf+2FOi8KJcShSTYlm2k230eKyV6vgOvhwkG1s0W1StOb29khHx8WHelWH8Y9s8qutyUlCuXZNVUp0rPGd2yysPCW5D2onbtolrUGXl8+NHd+og/JpcsqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoezJyPHiC0tSiF44WOen1wvN8vgB8Dkei2Rn7ufFwI=;
 b=E/Npb7USzQLdFJhI8wSkB+9XHIzQGwn2mgqWJnl8FepMrfPpxFUJ5IldzZ4SovaQM/HfDBivioqp/h8E5fWlVOhTDxxrzh6/9fdYE4UhlfWWZFvFvmEx20/fSQb8lbvkDDVyzMlHjDw4QZQFqzYa2wSCHpWkM5t7EONfVfrRXKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 19 Dec 2025 09:20:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] libs/xg: allow caller to provide extra memflags for
 populate physmap
Message-ID: <aUUK4dyezbqgUMiT@Mac.lan>
References: <20251218151728.28339-1-roger.pau@citrix.com>
 <b9e1d2d9-22c9-4574-9f83-46ab649d28af@suse.com>
 <70177c8f-63b1-4c6e-8b4e-52b7435e9197@citrix.com>
 <9a3c25a5-16fb-4f4c-a2cb-9d881271a63e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a3c25a5-16fb-4f4c-a2cb-9d881271a63e@suse.com>
X-ClientProxiedBy: PA7P264CA0342.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::12) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|BN8PR03MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 8516dddf-62af-4ec6-0fe3-08de3ed78661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDIvWk8yQ2FwNlgrQ2ZnRjg1OVB4NnkzYVNnMWdYK0kwSDg2aXU4citXWkUy?=
 =?utf-8?B?bTVtL1M2TU5NdTg4c0JyS3ZYNC9jWVltQkx0ZjBTUlVvR1UyQ0NZZE8xdUVF?=
 =?utf-8?B?Zm5aRXhUOC9BL2JtcG9aZHVKbUdVOEZReU1UT0N4dWVCMVA0NU41SkFmQW52?=
 =?utf-8?B?TFNpUTVvWC9VMm1SNEJENHNKWmRIQnEzaC9GbFlaY0grVlpEMTlCbjZKd0ll?=
 =?utf-8?B?Qk8wMGdSVlNYUjVRakZLbW5LcmlkZi9ZazdDNmZVWGFpaVkvdmgrUlhtbk43?=
 =?utf-8?B?NHZFd01TaVByMDdKcElueWVuNXlyalZQb0g2QUxEY2ppN29FQTB2K0pUMlpr?=
 =?utf-8?B?enA5dlRBdHJTNTM0QWg4eVhhNmxDMUJvc3lWRXl6ZEs1TENob2N3QWJRZVZC?=
 =?utf-8?B?UWpDNnVFWXVCdVNUaUhJTDZwbFh3TXk3QjZOSkR5RCtnUEFqK1AvNStEbUZS?=
 =?utf-8?B?YzRwZDRMbzN3SjJ3S2xWNEovbUYrSnA0c1RNQVNHdmt6b3JWc0c0d0hHR214?=
 =?utf-8?B?RnhZWGEwWU9QWFlPQUJ2WkxRRjJ5TGdYeWt4a0tlN2JwU2VjQ2Z4Nm9VSVlo?=
 =?utf-8?B?Sjl0U3Y3Nk5aa0ZDNXlOSjRjbU5QaGdkMXJudUVDVWJsZ0RuVlkrdXRnZUM3?=
 =?utf-8?B?WVpvZ09kMmc3TmdOWnpydFc4KzBWN0loMHdGTkcyNi9xQlhkUTZnYjkxV09Z?=
 =?utf-8?B?MEY2L2RBSWYyd2RTcklLTHRLb2NEemxqcWJsamFnTkpMdGcrQStad2NhSzhj?=
 =?utf-8?B?R09rcE1KYXJTNXBpTHRLNks3L2N2MWM1Zy9Ed3A4eENpYldWT0NKWXhWWW9Y?=
 =?utf-8?B?SkpnQ2wyYTdraXNLOU1JdHhnYXB1Qm9wTEN6bVpRVzMzWGN0K1ZkYVJZL1RJ?=
 =?utf-8?B?YS9LU0FIUmxCb204RCtvWDNLR3NmMjJ5OXpLbEVldDNIeEpVYUpMWW4xdUwv?=
 =?utf-8?B?TjdXRmFIRU1xdzBnT1NOUFVFVkxWVXc1ckpoTXRQck4yM3NoaTVtNmNjM2VO?=
 =?utf-8?B?citXUXlMcWlvOVVsVHQvSWN6b05TeFhpVWZWWnV2dE5EcExmeER1d2hzOFFS?=
 =?utf-8?B?aXdSZy94TEcyMUttZ1R2VG9SS1pIQVAyN3U4azdBNnZqekJST0Nud1FhNUk5?=
 =?utf-8?B?MExkejYzeTJFRDN6aWxsTXZZMS9ySk16RWxubUFGWXZuS2d0QUhVWlVKNVU5?=
 =?utf-8?B?ck1EVW1VNW5UNnZubWhGNDJUOGlCVkwyYUNySjNOZXo3aVlMREw5dlRtWTBF?=
 =?utf-8?B?aE80bThBRWtvMi9SMmN1ektMd2JsV0dGV0IxRHBzVVlFTmx6QnFTbTRONk5C?=
 =?utf-8?B?RW9RTDl6bVNpamJrRnkreVROVjN2Qmx6aG1DVDdJYkZpSm4rY2tKbHpkbktZ?=
 =?utf-8?B?NVVMK1hPaE1GWnZlYW9nZGNsbUY0QVJiUlFCMWh1ZDdZdldUSEdaRWp1Q3Ju?=
 =?utf-8?B?Q2xTdmdPazM0aCtnYWF2Q1VqVnRtWHNSeUR3ZVMxd0ZyRFVXOGJ0MFFYMnVw?=
 =?utf-8?B?WGFJRlMzTm94Y3Buc1FEbjRnWkNkN2tFTXJVQmxYTVpteXpneHNINnJnSXJ0?=
 =?utf-8?B?YlJ3WWlhdWhJNGkwbWpIQzBMVkx4SzM1T0RIOU80UGx1L2ovbm9XKzlDQ1dW?=
 =?utf-8?B?WVpqWURoN2d6OXlxQkZOeitCZTVqUXVCNE9tZ0ZrbkNpM2VpMW55Qi9NMFRR?=
 =?utf-8?B?VXpoTlNhYXdIaHoxeCs1anZ6V20xdXRvRkpldDlqTFN6Z1VxR3J2SHJEQmFw?=
 =?utf-8?B?OEZ3aHB0dXVRY241TlRXc092bkUyaFp2SXlObFZVd1FnRmdsMjQyTmxhWVdV?=
 =?utf-8?B?N1huY29DeThLVHN3TkpnSlI3YlkyWS92cUJjK1ZXVjc4aGQ4eFdjZWQ1QzF3?=
 =?utf-8?B?RkRRUnVTRU9KVzVBNVNLczdqaVQvQUhPbFBBaTVueHd2bExRR003UC82K0lk?=
 =?utf-8?Q?sQli6tCE+SLN2hFaYhZbjD1OXaqLyhc7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhGTnRGSndGWDlwQ09lZ1BuNW90dk9WbkdDekNmelZuYktaWTk2b1Q1V1Fy?=
 =?utf-8?B?SlJRTVhxSzF6Z0ExMnBvZVBFVWhXbjQ4UWduQWxTRW50eHAycVBMZ2NvMHJa?=
 =?utf-8?B?MFlKcjVmZVU3cGc3dGxCaE9SSm1CRThzQituc3pHTlFvTTlqeDFmblY4aXdS?=
 =?utf-8?B?VXBMZk42VG1pQTZQdFE0MVFsK1paZkZ4VHNFeEJlUURJK1hGTWFiYkpIcDh0?=
 =?utf-8?B?OFR3bHZybXF5eDZRQk5JVm1mdG5FdFhZRVhWa25xNWRGbUJKRDVkcFh4UDY0?=
 =?utf-8?B?dGI2SzlJZ2xXNGw3b2NOZjlWSHFGTDlTaFVFckJobHhObVpvYUsyUTdQZnEr?=
 =?utf-8?B?Z0kwdlJmbFE4enpHc3Nsd3h1eVhPR1YwOGg2UTU3WVRXcmNpbkNaN3JYMzJh?=
 =?utf-8?B?RzZFT0dXbzQxSFRja2kyT2cvaEhrdTIrTFl6SW1lT0I0T1puZnZLUTFEdVRs?=
 =?utf-8?B?WHF5azNURGw0ZTdJcCtQY2pTUGhRaURkczNRbVlDbkpadWJtWHR6NUhJMUdG?=
 =?utf-8?B?N3dnemtpZEdHeXlFYnpzS09iTTZVRVV1Nis5WUdZSFdtWWJEL3dkRkFpK2pz?=
 =?utf-8?B?bWFtdzV0Wk9DbjF1RjZqNHRleC80UForazJiQnNlQUROalpXdUE1T0NvWStR?=
 =?utf-8?B?eDNWVjBnM2Z1NWhYbGM1eWFOZEd5UjJRcGdaOGFHTFpBVXdiS2xJUXByWHdL?=
 =?utf-8?B?d2dTOUNTRkVaSjFsYStqUzdzSFBNWWowd2xCbnZOVVpaQzkraWRIVTluUXdH?=
 =?utf-8?B?b0dteCtXd0tsRGxyUUVMRVNqZGtCWkV2bkZUT2l2QUNFUlBOMjVGaGRUeXZ5?=
 =?utf-8?B?UndBYVZPRkkzNjVLaXJDdmVYRCtLRWlGd1R5Mzluc2tiSmdEQXc1VlhvUER4?=
 =?utf-8?B?WTE4blBzdHRhbGhIU1FDT0twcEwvWUVwQiswcE9rbXZkZHJZTC92T0NuVkVD?=
 =?utf-8?B?QmFqRG5YUkg3UUM1MW53ZWcrc1VmRnJCRHNhVlJvbDNSc2lyT0hWVHdHWHVH?=
 =?utf-8?B?aWZxVDV1NXBKRm5XV1NvY1VtcWNnVzQrSmkyaHNzRDR1b2R2QWN4ZTIrU0l2?=
 =?utf-8?B?TDFFVnp5TTViNGgwVHpBcDZUZi9mMU01S0NtaXRxR2FGdE1vTVhUQWVwTVlk?=
 =?utf-8?B?RzZKSm1GcklHMnBSNklxbXlRZXhWVnJYbzhod1pJNmxkUll2MkU4cE4zUWZz?=
 =?utf-8?B?TEZCUmZMR3B4Q3ovQzZ5WTcrbE5WSHRhaGpzM2lqNDVHNi80akplS1dMOGU1?=
 =?utf-8?B?NTEyaE1qbFlJQldtSWFLc0FlU3V0NmVqSmZzbjdiUkMwb0Znckc5OGRsckJ2?=
 =?utf-8?B?T0pZdzIvSFBKZy9aNi9sd2h4R1ZkMWpXcEdHa3BVZTF1WWZ6dS9HZlFRSzJF?=
 =?utf-8?B?WlBJMm5wbE14SVdiZFhYTUtKRUw0ZVpySU4vN1Z5QnExRVk2NVVoVlBrWXc5?=
 =?utf-8?B?MHhRU0Zwa0FjSE1Iekw4Uk9nQU9DTVJWUUVDYUZQSFdsbCs5eUlJUHdxMWhK?=
 =?utf-8?B?dStvSWp6MVhlSzJYOXlvSmtFNDQ1dWNLZW45c3l1RDJLdVRyb0xSdm5Jbm1y?=
 =?utf-8?B?Q3h4MC96SENFZGlFek92dGEwTTg2TTBhS0hQV2t3V3hnMTlUY3d6c2R6WHE4?=
 =?utf-8?B?RDZvdXppSGFndEdpTFpHSjQyYzJxbTcrdHJhWG9PdDJ1ZGV1SFVLeE9Xazl0?=
 =?utf-8?B?b3hYZWQ1VktENFRPbG1aQ0pONmk3MktjTUsyODBXeWpDVXhBTXR5TGN4Rk1V?=
 =?utf-8?B?ZzlCazJQYzluQ0VoZ1FwSnNPSXpMYXFYN1h4blhicmpiaHVrYnlpN3RhVnF4?=
 =?utf-8?B?QzB1ckI2YnpFQkFkZmhnSTBQL2drUGFISjhQd1JxZktpNHlRVnozbG53NlU5?=
 =?utf-8?B?WGJETjhZODI4Mk5EUmZMbmN1aWxDZHRid0MyZ3NkQi80S1VEdTZpVklqR3JF?=
 =?utf-8?B?N0JWMFN0dDNuN3JPZjIwZmRjakd1R05mdmFJckNzQ3pxOXFQSVVaa0VLNTh3?=
 =?utf-8?B?a3kvT3NqMTZzNzE2a2QvYllNZXlqa2RYTmlKNDdyZW5kWWg3K3gzdjYvbEI5?=
 =?utf-8?B?RnhtdExwNVVBM2FyVU0xaHJaOFlGUHFoeEpRM0NoQzBBZVZxWW4vNDYyL0xQ?=
 =?utf-8?B?eXVETFQ2QURPN3pjSHN4WUVPbXBxMXpuaTRib1pkL2ZvTnF4cy9WaWVLSTNN?=
 =?utf-8?B?dStpZjVIR0NDbTh0SHJQVnNQbUZLM1p2L0NKOTRqZWs4Z0lramdJN3YwdWYr?=
 =?utf-8?B?emhkd2dkRzRacnJ6QkFMWk1FbXR5Ynp0TWlJc2RyS3lTaU5ETmQyS2VpcUNR?=
 =?utf-8?B?VFNKMEYyOVZYVWR3MDlFQUhDbFZWNWhPNTYxeXpxV2cyalI4NjBxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8516dddf-62af-4ec6-0fe3-08de3ed78661
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:20:52.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOoy+P3YHF/ExVG2TpcqHy10Y28RQcO9CQAUVoXqGf7hX23vOrjACmfXi8oBd9Oi1g1/OXDkoPr2k5ka4ABcbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4962

On Fri, Dec 19, 2025 at 07:59:59AM +0100, Jan Beulich wrote:
> On 18.12.2025 22:34, Andrew Cooper wrote:
> > On 18/12/2025 3:27 pm, Jan Beulich wrote:
> >> On 18.12.2025 16:17, Roger Pau Monne wrote:
> >>> --- a/tools/libs/guest/xg_dom_x86.c
> >>> +++ b/tools/libs/guest/xg_dom_x86.c
> >>> @@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
> >>>      /* allocate guest memory */
> >>>      for ( i = 0; i < nr_vmemranges; i++ )
> >>>      {
> >>> -        unsigned int memflags;
> >>> +        unsigned int memflags = dom->memflags;
> >>>          uint64_t pages, super_pages;
> >>>          unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
> >>>          xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
> >>>          xen_pfn_t pfn_base_idx;
> >>>  
> >>> -        memflags = 0;
> >>> -        if ( pnode != XC_NUMA_NO_NODE )
> >>> +        if ( pnode != XC_NUMA_NO_NODE &&
> >>> +             /* Only set the node if the caller hasn't done so. */
> >>> +             XENMEMF_get_node(memflags) == 0xFFU )
> >>>              memflags |= XENMEMF_exact_node(pnode);
> >> I'd like to suggest to avoid open-coding the 0xff here and elsewhere.
> >> XENMEMF_get_node(0) will be less fragile overall, imo.
> > 
> > XENMEMF_get_node(0) is even more meaningless than 0xFF, which is at
> > least obviously a sentinel value.
> 
> How that? XENMEMF_get_node(0) is the node that is used when no flags (0)
> were specified. I.e. the equivalent of NUMA_NO_NODE. The underlying
> (pretty abstract) point being that if we ever made a binary-incompatible,
> but source-compatible change to how wide the node representation is in
> the flags (e.g. by the consumer defining some manifest constant to
> engage the alternate behavior), XENMEMF_get_node(0) will continue to
> work while 0xFF won't.

I didn't use XENMEMF_get_node(0) because I found it confusing to read.
When I read that construct I internally associate with node 0, while
it's actually no node set, as the value passed to XENMEMF_get_node()
is the memflags, not a node ID.

> Otherwise at the very least I would strongly suggest libxg to make itself
> a #define for this (repeatedly used) 0xFFU.

I didn't want to introduce that because there's already a define
in libxc for no NUMA node ID, which is wider than 0xff.

Anyway, will do the change and send v2.

Thanks, Roger.

