Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C8C921C4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174819.1499762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyQA-0001GO-6l; Fri, 28 Nov 2025 13:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174819.1499762; Fri, 28 Nov 2025 13:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyQA-0001EJ-3t; Fri, 28 Nov 2025 13:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1174819;
 Fri, 28 Nov 2025 13:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8i5=6E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOyQ8-0001ED-Tb
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:21:56 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34affe42-cc5d-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 14:21:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5049.namprd03.prod.outlook.com (2603:10b6:5:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 13:21:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 13:21:51 +0000
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
X-Inumbo-ID: 34affe42-cc5d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySx50DlD6HRMenEKARInUbTKQUiGHC3zcdNfos0UBmKH2xJPMR6QE3s1c4RHVVHDwkFc7OrjWcOWnWFHcLhQ/c8iaoiNG5XpC4S298X6/+pFcBqjj1Dwk8G3DQTuYvBT/e+rvDlK1kgohoXayBdluhhDd35Px3+TV0mzSYU07oHTMS88MUjUPBjHvWL1hRCIGBvGOMiB3vEnlnDEPGFeLY1HbUeUPRxmZ/y69mBJVPPnfPEDEIiIc55RhEZADpuncadO1kAOifGtQKV7LjZdLJ/X6LOXWay8tkLD1sDvQnrZfL2gKzsDt0eW5dT/unTZRQucArYheflzzDr/QL6gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2QEGf+zrHIxYID8CQKtWOgFrzfF3sHiE1bAHH/jRE0=;
 b=pHZKpa5QyoAyvFh+klaIsGYAqW+ak05yVQlbfiIH9TFY37J0OSqCaCrLny1/HUmyvXOTj5vU6PQGke/NxzWqPMYTWidw+aLJNwF58R7iv15e3ZPJ1Wo2gSUS8Hlc1skZJyRohJaT0O0cl2gJonc1HGGlhOfA3p/1a5RC0FGYthAR68hxT6+cSSlyQcJGchXmzIyFRRIPfv+SI+YwsLDia1lyD/79n8cBUBOqIW3pWKiy7eoZ08kLiJdPr1h0/JI6y7doSN68GpSOvjagqLJzmBc0GPLF30tTM6ZPOqCN9eUPLglblku6qUOGEE7ag+0FVT5JpIe/qtkn/JCAGEM64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2QEGf+zrHIxYID8CQKtWOgFrzfF3sHiE1bAHH/jRE0=;
 b=Jrz6kLCoWchAFcdjPILk/KDyIHpAoxGwGHDEqs7woG+F3UlXSLXA1l7ZjgOI/Oo4Qv9IARdYDk1k5x/O48DUvf9j5N1Zafuagx+Nst7FfzkENrW3r7bRR/NDWJGg+cWgo+R4FZfZYvoifnBMSM79jM96FS8CmwQXJJRC44h1urQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <883304e4-0a1a-464d-b9e0-93d9d8a4ae82@citrix.com>
Date: Fri, 28 Nov 2025 13:21:47 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>, Paul Durrant
 <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen: move vcpu_kick() declaration to common header
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f291e02042a24de86cab5f62cb2301ad8c72fecf.1764328801.git.oleksii.kurochko@gmail.com>
 <18a52859-1b73-44b9-a54d-2f37c7ec9933@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <18a52859-1b73-44b9-a54d-2f37c7ec9933@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::13) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: eee8cce4-8dcb-4c07-f706-08de2e81170f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG43STA5am9zRFhrdnZaTGRCK3hMNHZBODE0b0tLbXU3VStVd09ibGV2MUx3?=
 =?utf-8?B?UGxZTndDc09CVFc2K1MrcmNNZmNob014ZzhsT1lEcFpxVjgzSTR4WlpEMHB4?=
 =?utf-8?B?WHFBZHZ4QXg1TGZTVGpqejRYMkhpVnRpN2NINmRsV3ZOejdZaFA3UXhTZ2tm?=
 =?utf-8?B?R3JYRVdtTm5lZ1FsOFBzZU9GTS9oM3lZQnZ4Wm0rMkk1RTdmVDA4cHd6d3ND?=
 =?utf-8?B?ZnhIcTZQV05kcHFWSFVZMlFEcUNwWmlCSzdIUUk2VjdVQ1grVkNqQk1Rem5S?=
 =?utf-8?B?VWxvS2ZyT0ZpVm85eWhYQ0k0M1REdHErWmJXMUNFaFhGSjN6RG1hdExoaWxO?=
 =?utf-8?B?RWQ3bytMM0JDNlpzMEpmV0pSRVVEaEVaOHl6VmUvKzdDU3Bicis3TFU2MEJy?=
 =?utf-8?B?Q2lCRUJzY0REdUNsZGJFMEJvY09MM2ZJUW9rTkY5S3lwNVQ4MjUvZnF3ZHRn?=
 =?utf-8?B?aVB5SGVDMTFMYTQ3Wk0rdGZTUnZQdmtSY0Y5WmduQkY0Q2hHZlM2bjF3TFZy?=
 =?utf-8?B?UG1RL1h2K1A0bkxFMytxcEJhYVpEMk85eVl4UHl0VU13ZTNxNVhiVGl0YXJF?=
 =?utf-8?B?WXVlV2VyeU1jYjZENTAxTEJnNGRRVVRsamZZUnFUcDdqRDRhT0M0SHFld2xF?=
 =?utf-8?B?SzJKSkJDeCtEb0dEWHNOeSt1S25QQmlZeDNWSUZoNDJqRTZiQUo1UlBsSXZj?=
 =?utf-8?B?MkQ4N3pjcSt0QVpOdmM4ZTdwTGFGTEFqbVJWNzRPeE5DWkNFa3Q3YmN2U3Rj?=
 =?utf-8?B?cVNxeWdON3Y4bHJlMS9EeEpOZWsrQmNGR2lXRy8vMUd4Z2huOVVXQ3J0Skp5?=
 =?utf-8?B?a3B5bUtrbTFNZGNtazR5bjVzZHZ3Nmw0aDNUZ1NYNnQ3YnpPUGZwWTJvcUdM?=
 =?utf-8?B?anF2QTZKYnRhNmtqYlEvUEFNMi9KdzMrbDI1S1EvWXFIb1JjU1EyZi9OeDQx?=
 =?utf-8?B?RUtkN3BVTUMxSHNlelZER2RENnhXS0k4ZlFoVWRFU1NvaVNCN3ZTUVBJK0RN?=
 =?utf-8?B?VlcweW1JV0ZHV0cwU2doNEU5bXdVbUduQk1tYUtVdnZoU1B4NkwxSjZlWmhr?=
 =?utf-8?B?NjUwZGRnUkNxNExaNWJVb1VHbnlKVlpPckN3ZEZRU0xWSUJSV29ySlBSWUVI?=
 =?utf-8?B?UVNuQmZwQXVOQjcvM0l3bXNTckw5L0thNXV4RHRHYXZmR0hFNWZ4cjZQQTNL?=
 =?utf-8?B?RVErVWtXRWl4Y2ZDSTVHcTZWTWMva2ZMd1dxR0tYTWdybjc1cjhnMXVlUDB0?=
 =?utf-8?B?dmEyQWZqczFTeEZibUFCcGRMWkNGZkVqOUFPOWpVdzlWVCtHck0zMFFydWJX?=
 =?utf-8?B?emkyc283Uk11Uzh4REtBZEJoQXFobUlGMVljMlMyckxraXJZWnpxaEZRTUdS?=
 =?utf-8?B?N3NYV2ZaMHYxNlM0NU84cEY2Z3RIbk5MdWtTTVkyTmVWYnlCcDlOcmtZOHhS?=
 =?utf-8?B?aDVyVWF4YmZLZ3pyeG00RWdJWG5UVzRwVDZzZ2JpMVE2NVc5THI1WFh3TmlT?=
 =?utf-8?B?ZDk0TzFMZXJCUE5qTzlubGhDL05BRDdWem5kZ2s0YUppVmVqRUw0U29uU0Rx?=
 =?utf-8?B?clBLTEI1cEdaR0xxZWtTTEt5clEzMnhoSjZuMWpXVzlobHVoVm8yNFVnMDVF?=
 =?utf-8?B?N3FXZlliRGQ1S0pSd1FJWUpQZ3VvMFJJTFQ5NlJYQlZDQk9MNTRKWEF1QW0r?=
 =?utf-8?B?WEdIOWlmNkxoR3hVM0VIMGNzV2cxU0xHNUdrZ3NqU0V3Zi9ZUml4OE1FQU5F?=
 =?utf-8?B?VzVFOWt2WTR1QXJDQjRMUUgzVmFsc2h2bHorRUZGNDRqVmkwVHFZRy9ITDBo?=
 =?utf-8?B?TVNMMGppSjZlRFRuRUlhdGw1VERrLzUxN05VK2FKMW9GMmYrUVROZnROWjJD?=
 =?utf-8?B?MUJ5eVprZjhCVFVaOWgrT3hZMG8rNUpMRDRDYzE5WENYRFVEMDExRDRDaFU0?=
 =?utf-8?Q?kGLV/yeVoD6aR5fpDsf/w4zunvL3ysF9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW1PaUNXUXlkcXFYN3pWVERManlORnd0V3BNOUpyNjFzTFh4cW9mUm9SS05k?=
 =?utf-8?B?Y1UzUnVxbXJvcCthYXVrTW1aSXFVeEhWaDNCWE5xUWsyMnpJSkRvR0E3cmtx?=
 =?utf-8?B?bmExRHpReFBZZkl5ZzMrS1Yzb0Vxemo3azVFL05Scm1lNlhWZDlWb1ZxVjQ0?=
 =?utf-8?B?SnJ4aXVGekdiN1NDOWFHWFJVT1FCbXdLdGc0SEhNU0RyRkZscWdvT2QxWVVt?=
 =?utf-8?B?M1Bkamg3Uk1PbTU5WmRrNkpCYkI5QlNYN2llSzNDdVNIM05rYTlkMUd3N1ZL?=
 =?utf-8?B?WitjREFkRVpycTFvaVJwaHFMZjZWWHc3eXZvN1NBd0lvOUZxQWFtQVIwbnZG?=
 =?utf-8?B?QnBQU2JBWVFOMnZ0QzVDcWN5QnRmeUxsVW04UjJTSnpnVFYrbjNVakhuR0RH?=
 =?utf-8?B?TVArKzgrVkREVjUzMUVrMmFncklGR1VYQU90Qk5IOFp4clNmdVVIQ1FJbnk0?=
 =?utf-8?B?RzZ6dHNTWGpBQTR6QzNITDZyVXJ0VGwrdDNFZFRJdkp5YS9PTmF4eHlnb21R?=
 =?utf-8?B?ZHM0M3JFMTlUd0VIangwc2NOVHFDUU10SWViR3RjdUgyOXYwdXgva3ppdW1x?=
 =?utf-8?B?ZmhtLytiR29pWlJiZVpFMU04RDFHMDlSYUN0cnR1c2NXK2cyT04wTmdoZHNV?=
 =?utf-8?B?bXNhTkJJOTFCUHFHRDVjUEFETnpJQXhwUWdDWUpvdEw4cU9WeE1GYUJQakNz?=
 =?utf-8?B?OTFna0Z4YWdhbGZPZ0RRQWNmcDRQSmZyK0w0OGZMNjdFL0tTZmdiSEgyK0RQ?=
 =?utf-8?B?OXFTWHo4VEM5K0hSZFJ3a000dC8zTlFTM29Vd2VLeGJjVncydDNpQi9rdjVE?=
 =?utf-8?B?R1lzdWxOd1d3S3R6ZVFQRUZ1OFhhSW9oUHNxRFQvSHpkNjVrekE3MkFxajl2?=
 =?utf-8?B?VXJLYlNOSWZia2xxdVQ0eUZ2MDB2bXVSdWo0dmk5OHNiNVZBNkliUU1sbjZj?=
 =?utf-8?B?dEFPUFJMQzlONDdkVHNMckt4N0poUXRPOEpWd1h0Ris3TGZmOUlGMXBLTExP?=
 =?utf-8?B?aVUyQTFoeDNzeVJmbmowODIxcHZCNWFvR1VmVVNOaVZFaU5LVGU1UWEvWlN4?=
 =?utf-8?B?YkZsY0t3TCtrOFNXNWdtUWlHUGlLL1k2b09SOHRmK1NvMVNYMG5WQWNKcnBa?=
 =?utf-8?B?VXIyL0V0N1VnMHBITkxjYythWnpBeU5oVzJMMmJPV1NwTzl0eDFwbnFyNllY?=
 =?utf-8?B?UEV0ZFBhSU85SkUzbU0vdXZRVnlSbzdDKzhQNElLckJYS255aWVUZmtzMk5V?=
 =?utf-8?B?bS9vaU5KTTBaOXQ1RGp0bTZKTVMrdExNTEhNbkI3VUNKcjVWcmllelFFVU14?=
 =?utf-8?B?VzVhMmlYc1FFT1NWd1RlQmVxVUtRQ29VbzhaL2hMeko4b0ZjWDFXSWszTE1Z?=
 =?utf-8?B?QWZ2dnE3UHpHQnQwUEdubERuSFFmenFONEw3TVA2TGhuVzNsNzZrb1VMakVO?=
 =?utf-8?B?NUsvYnZDOThxZU93RGhQWlMzTW5yTWhZL1laRlZzYitRYWlETmNJZGxpUzM3?=
 =?utf-8?B?SmE1UUlZNldUMlBuSjdVYWhhWFNyVmpvc0orNm5ISnpBbW5MTU1QbDQ4dU1y?=
 =?utf-8?B?bzZSaEhiWHNMNjdubGU2RCtFdU5INWplOElWcXpyNTFza2F0bXdnZEh5NDlh?=
 =?utf-8?B?OVNjdTIyTmlQU0lydXJqSDhFM1JveEZuQ2ZDM2FFUy9TckVoSXJrMmc4dkc4?=
 =?utf-8?B?MkdiYlZWWXdUdFN4ZU9vQ1pCODNLb0d2WHRLMitmcGZLSXdSelcwenFoOGdP?=
 =?utf-8?B?MmJyZUdoUXpKemhqc0EvdHM4V1NkSi9jZGJ4c3RIa2VKL0tSZHVRSithckV2?=
 =?utf-8?B?N2ZaSUFxSmtvZGRDeEs3ZDAvcGFuT2NNUkpIZ2J1VEtRV0VWU0hybjVJdmt5?=
 =?utf-8?B?MmdrVVBNVnBmZStEZFZXSWxQOEFoZklMN0FLaFMzcVdpS0xhQUVkbjVOcUFI?=
 =?utf-8?B?allvNWk4R1FNdHNpc25SS2F6OTAvYmhxaXkwR1N2ZkNLc3hBYVlzTXJEQkxm?=
 =?utf-8?B?NXllUXJPcWwvb0xacWljMGViK0RXbVBObUFFWnE0K3cwUGJySlpUR2JNMUFE?=
 =?utf-8?B?QS9EWGt1ZXlSQWFpU2wyRnhqSGVZUEYzZC9DOWkyTStaNHZCOHRnNWF2aWJJ?=
 =?utf-8?B?V1V1aFBBdCs2cmoxZFFyL2JOckpwTTZSM0xnczlVVVlxclY0NUJzZG9kRVJP?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee8cce4-8dcb-4c07-f706-08de2e81170f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:21:51.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KknXNJ40J4bzHG8CAOennLkMvg7TrqFK8+BAzcx0gEvAaQ5TDEQSFVIG5OrNDJHDZrzvpWS+0Jmo10tmD7LkQE1G1WQ2HgqNz6FAW4V1do8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5049

On 28/11/2025 11:58 am, Jan Beulich wrote:
> On 28.11.2025 12:38, Oleksii Kurochko wrote:
>> The vcpu_kick() declaration is duplicated across multiple
>> architecture-specific event.h headers (ARM, x86, PPC).
>>
>> Remove the redundant declarations and move vcpu_kick() into
>> the common xen/include/xen/event.h header.
>>
>> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
>> as it is already provided in ppc/stubs.c.
>>
>> Include <xen/event.h> instead of <asm/event.h> in places where
>> vcpu_kick() is used, since its declaration now resides in
>> <xen/event.h>.
> Centralizing is of course good. Question is whether xen/event.h is a good
> home for the decl. Generally related decls live in xen/sched.h. There was,
> however, a vague plan to try to split that up some. Others, REST
> maintainers in particular: Thoughts?

+1 to centralising.  I'd suggest xen/sched.h too.

~Andrew

