Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773AA916A1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957129.1350313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ko9-0007Xr-2m; Thu, 17 Apr 2025 08:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957129.1350313; Thu, 17 Apr 2025 08:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ko9-0007WB-02; Thu, 17 Apr 2025 08:41:17 +0000
Received: by outflank-mailman (input) for mailman id 957129;
 Thu, 17 Apr 2025 08:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ld+N=XD=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u5Ko7-0007W5-IS
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:41:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f403:2613::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7e261a5-1b67-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:41:13 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10664.eurprd03.prod.outlook.com (2603:10a6:800:268::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 08:41:11 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 08:41:10 +0000
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
X-Inumbo-ID: b7e261a5-1b67-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNelNYCMTcJzyMGM6rX5/9RktWZdF/Wi1NSF4l0QwFtchMHMNcolYWmC2TLbVpvPlSdv2wZTwF9csT5AYiCPPDVMCCGqMbEcJn1XE9mOMP3x+zBqnT1yqcd/4RboYbOs5UEMFgt/FgwZs74H1RrS4htBOL35ReC1RQ+CHqMgfib2Lm88E1JoS9yEirtMLM6JBE4wVbPt+HfGQuqL7PqPu+bBpAyOrukRlCgslTcErDtk6qojOs53QwPgvNRuiVe1zElHW3UGkIr1N3UuJmlMUShdxXW3jIyNA4AKBQkW66Nr1e2aIt1lHMz1jerlZXc/Q4jM4Hia2ydWdlhnRiizag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMdI+/yELdSRVzE6lNEdo9rmiOpZ/LniKDkzRbSBm04=;
 b=jOp0Wk5EC0sUGHCykmy24t7tcynk7WoukZ9HSkEmN/cFlEqGeWxL6AsZHdJLo2juHYcZydUCjdoo6aaJzXIUyaxMzBgTqXXb96xuTTtWgvfHbrKsGA7IgaJXGkIpQUo7whaEA24cWHtR/KVAVmFFnntCNiVeffxPtCdkMz5SlSCEaJCIDFXkS6+l4HWnPKOQBHM6YC9xkHq9vB3OuzKaqQyL2JTznB2aVMUPmILPStBFJSsA86BIQtxFw+eF28zUe5E5Zq9dFyIkytYJQa+PKBwrVrGz1c+JeUIZCHQ7BqCMiggYSCSBccHLtODy1le/1WLc1+WDt2zW0NxzYxZuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMdI+/yELdSRVzE6lNEdo9rmiOpZ/LniKDkzRbSBm04=;
 b=LJORwBE9zX2AZO9/KB3g2jBWPurYsq8H6a3F1Y738+d1k86COi34kQ/ox/yOL1wwqz7Z+Zz9nim0qJeF7bjHR6vvbamXBBttRvgt68oznuFNV4gGrG7tlQwl0y2haAu9UpE1jFwbCekNZuIBi2uUmtKx0CK+IPQccqDyZOsTt8wFkwJi/7YwDaYk92Fv7Lusd2SMKUfEwQbyKlzA4i4dSEezOA1EDGS8BVGgs4ExFlWvvRdMEtRYWSsHJOL+lIkBDZz3wrSReGzdIASeZeGx+ZzJNC/TqRp1p9Mi3lY/r5auOlE95lzukuYCOogWMhWhBL5Dl46Ia5u0N/B40yUncA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <922d02de-2d8c-4b72-bbd5-581595de86c5@epam.com>
Date: Thu, 17 Apr 2025 11:41:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder v2] uboot-script-gen: add xen xsm policy loading
 support
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Alejandro Vallejo <agarciav@amd.com>
References: <20250415070128.1938253-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2504161503150.8008@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2504161503150.8008@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::8) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10664:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f1fb89-dc7e-4c01-bad8-08dd7d8b9a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2NYNXhLb0cwRTladGhLMEVJRjI5VWNPN3FBeFhIRGx1OXdraXF5bUw0NFdE?=
 =?utf-8?B?K1NEUzlMUVdxbEhBWGRlRi9Hc21Cd2U4bVVNZ0wyaXd5dVNHOG5naHVCYjRo?=
 =?utf-8?B?Mm9pSGliTk9pVUZoMFFXNzdJcGk5SzBhd1hMVTB2ejhFcUZGQ0pyTGozMWUx?=
 =?utf-8?B?QUlPcnRjTzNMZ2R5YVZKYzhUYTVkYTlsdXdxUm1rTjNMQ29kTXhwSER3aGhl?=
 =?utf-8?B?Zm1XOHBOU2ZuekFIUVF2ZkV2OExpWHdzTlg4V2FNOUZSQ0RTRXVWby83UjBz?=
 =?utf-8?B?OUVsU1M0Um5nNitrT3RYai8rQTF4UkdQL0N2amg4VkRlem4yazVVNnpzZnhP?=
 =?utf-8?B?ajluME15aUpvbE55TVBPdk5wSjFlZHY0K0JWUVd0YkRvbW02MnQzVHhod2sv?=
 =?utf-8?B?bVpzRXRZc0hzNEwzZERUTUNmdERxeThQcDZucnpuenprMGF3WjJYWHhOY1Ja?=
 =?utf-8?B?RHJtZWppZnpkOWNTTE9GbXBkNjVyeSthWjdPWXRHaHd4MmdEVFpLTkZBWGtr?=
 =?utf-8?B?eU5YUWpMWnhCUndmU3pJbnJIRVZLbEJMaDQvQmtyL3lDcTMrclBZN24xYVgw?=
 =?utf-8?B?amZWN3ZmMGtmMnVnNll0ZGU4S2hDTFFOWlJua3BXMWlCS2I2L3JxSXJUTjlH?=
 =?utf-8?B?L1lmemYrWEd6QTI1N2p6QmZMaC9vTEdiaFhjMXlTdmFuTVFCQWpIRDVUK29H?=
 =?utf-8?B?TmZLbTY1K3Vja1dJaVZPdmIzblJFcnU0aDVrVWYrT1ZBTHMyL1JjNnZySzJi?=
 =?utf-8?B?cjFtZWF0VTRKY3VLTkNlUXVobm0wMXBkd3drMThJbm9nZzl4eHcyYUN3NWZO?=
 =?utf-8?B?eU5USkxNY1JWc0tJNGVqK3BjaTlBakpnQkFaVzVZa3VTRWR4TjZKbTRmb3FI?=
 =?utf-8?B?d2hlRzIyOENiUDU2dGhxcWJBRy9meHlXT240TU8xejYxdDlCZ2thNVBTeWxt?=
 =?utf-8?B?alpuelN3SzZFMFprTzNlQ21tMFpYbDhqeXprRlkzZDF0VmUwS1o2cGlSN0JJ?=
 =?utf-8?B?QjZtWDVrRkVRaGpibTJsM2hZVGdFWC9pcHRxVGtqNkFOM3NFa2h5dzhXd3Ry?=
 =?utf-8?B?WnFpVnE2dlprcEdoZDF5T0h0VHVUb3AreGFXZmtTZHlINFhWeGljQUxQeE5E?=
 =?utf-8?B?bFB3c1MvUDlIWkVGZkdmK1dNYy9NYnM1WmIwOFlrTEJaYUM4VTVrb2t0ZGZS?=
 =?utf-8?B?aU5vSmtGTE9Xc1phS1UvNUUrVjVWdUtLdEtaS2tSVDJSVy9WT2xZek03blNw?=
 =?utf-8?B?c1BlY012SWYxOHJab09Va3hNaS9DbkJYTTB1R0tiTTZGWC9SeHJaVEJsby9u?=
 =?utf-8?B?TnA2Z3JBRmcySnNZOVZSaXVqWVN0dlU2bGhpYnZqbDcyR2hnSFEwNmRTZWhK?=
 =?utf-8?B?RFhVS3lzMDhaNHFtckZUdloxWUFwQ3VOQ1V2MGd0Q1RXR0NocFRoL3daQ0Vw?=
 =?utf-8?B?TkhPUUgxTUJyUTdwQWw4QVBXbytOcVFnRGZYbUJDbkE2Z3FhNUg3eG4ydXhR?=
 =?utf-8?B?V2R6YnkyT1dGcHNRM3FJcXNCNFphMFlyYTJQcTV6SkZ2VitQYTFOMHZQSEhz?=
 =?utf-8?B?SzRWNXR0ZzhabUE5THRGZWlJWXB6cWRIY0dXWFhyNlg3V2laRmlFdU9GcnhF?=
 =?utf-8?B?aTRBY2lQZGx4S0hlM05DNjZwL3BRdXZ2a1ZpQWFCSk5jMkdvc2J0QWFYT09Y?=
 =?utf-8?B?NzNRY1NxUkp2Z1pWbitxWFRXeDBEdnQyOVlrVUVoT3BmSjI0NitmQmhKb1hh?=
 =?utf-8?B?T0t0RDhMS3E3aGJaWnpTdzZCTVFkenVNNFI3T2txRFlmTThGR1h4N0ZtVkI5?=
 =?utf-8?B?OEtrWUJiUjBPL09BU3Brb09hQU1WRDlQMUMxSWRZbisrcFJaOFpxckJRemxo?=
 =?utf-8?B?L2crZUlKL1IzSUFOaEdlSzJGRGdtNDR4amdQb2lCKzFody95ancrcEwvSG9a?=
 =?utf-8?Q?XgM8o8rOmco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkdqWHpxdmp4aVZGajlrY3NHY0VtTnFSOTFqUnlBaGFzOW9PakY2c3Z4UnVm?=
 =?utf-8?B?SWVJQ3U0a3JKL3htYVkrR2xhUXJwTERuMnRnZ3hFQjhCNkI2enB4QkovQzFO?=
 =?utf-8?B?WjFOdzFTTzA2czRZTGtLcjEwV29lL3lNNUdzeVdmWjJiRjdPSjRIRGNidWxR?=
 =?utf-8?B?L0FjOUFzYzRjdjdtYzZiYnZVQ0VkNjRyZWJGclVDakI2WmswMWhaZnMvaHZB?=
 =?utf-8?B?VEk2dkFkM1Bub0R6dnMxVXpnQVQ1cjlIYThUeFpCMVBYMlY0dzJjdnBCYnkw?=
 =?utf-8?B?OFlRY1VoTlcwWld4enU5Um9IKzY1WjkzNkt3YnlqamR4ZTlrdVNYM2JSbXV2?=
 =?utf-8?B?WHRrczhYT1J3aWN0QXVBQk9TcjNMd0dKb0FFMUlRS1IvbzZIMkdlS1NjTndQ?=
 =?utf-8?B?WU1uNGtQSExmaThPYnhPVWdEaW15U1JpRWNPSmlORVBuZHJaTnZNazM3anBL?=
 =?utf-8?B?U0JRcWowTzdrZTQwb0xaNklEL3NHREpONzY4emQwREhHVzNCZGRKUnlqQmsy?=
 =?utf-8?B?Sk9QN2tsNzhLVXhYRm12a2dTVGZmR0N1Q3BYdDFjTUZpMjZKNTlqQWVRaXNL?=
 =?utf-8?B?alJHTENaSTF6aWF0MlJYL1RVV2ZDYmVyNWhhRWJSVUpWaVlBRWcrRzRoNTVt?=
 =?utf-8?B?QTZLSGZjczZQOVdVWWxNN29yUEl4V3UrU3Q2KzU3amlmTHJiTmo3U2N3TXhH?=
 =?utf-8?B?NDJueS9BMGVlL2YyUys0WVNOQ3c0cFVERVN6czN0cmRkdGE3QVN1SzBTdG9T?=
 =?utf-8?B?eTA3WlBaUVVZVXV6YXYrdXJ6dTFEVHN1M0ZWVXlIWHFTY0FRbzhPdTdRd0kx?=
 =?utf-8?B?QnpjaTRSWUsrT0FjRXFKVnp2c1dIdVIrZVM5MUhtdHI2UzhQQ3kvR3ZNRXpR?=
 =?utf-8?B?VUlTMkxSL0diMjNHK1NyZ0dJUUFYQnJJOGFIU05VdnU2ODcydkxvMzlDQzdT?=
 =?utf-8?B?TEdTOGZtZno2NWdBdTliMzFPMG9VZ25QRjJpOENFOStXVTAxc2FhWjlVL0pX?=
 =?utf-8?B?QnpSTXk1R3ZVdmcyakZDUGc3TkplTVdmUnVJZ0VtajBleTlrUkh6ek54cm1r?=
 =?utf-8?B?TmtlU0ZaK0lRMEpacERxTGtmZHIvRnVhVHlZczdHQmhyRTdaanloQ0hVYzF6?=
 =?utf-8?B?RndrSUtWVzlDS3VaSDlnYVZqSHNtNVQyRkU1bFB5SGliWEs5Ym9XQUpXOUZW?=
 =?utf-8?B?bk5EMHA5UmZxcCtCZEVsZk5BeXF3TEFJTmFWVnBnRjVBaGlNaTVqUURBcU8y?=
 =?utf-8?B?eStoN0t2SUlyOWVZYVg0a01wNmxLNzRPNXFLWDhMR2RXNmZLMExZekhtNmY4?=
 =?utf-8?B?RURFekR0QzNmTWRsM0NtS1dyU3NIQkdYN1dSUlMzdmxwTzVCYU9xNFUwL1J0?=
 =?utf-8?B?NU9ocjF3VXJPQ05QUjFKeHNqekc1VWtVKzZHSitxNE4zWjFrU2xwUlZUdlZt?=
 =?utf-8?B?UXhHVlRHUyt6aFNoU1JlNEdpS0F5emN6TGw5V3BCTHVpR0Y5YmNYTzFxYTZh?=
 =?utf-8?B?bi94K0tvQ3JzRlI2MTN5U04zU0F6V3RsUGRoYlBndC9EdmtTRkVyYkxBU2JS?=
 =?utf-8?B?WVNySDY4SHBSQ3I0Y3hKUFdTTzZvVk5LNkNWUXc2elNDK3p3YURYWUxoN3pt?=
 =?utf-8?B?NGZkeHlGWnlnMUNZajQrK1NZSFA5eGV2MVF0d1NNWkNDK1F6VTlIOGdzaWpT?=
 =?utf-8?B?d281c2tYU0pIQmNYVFJlYnFvYktMaG5UR2F3MHRzZU9pUjgwaUt4OHNRMUFZ?=
 =?utf-8?B?RDY4a2FlT0xldEZpSEMxVklCaGdtbWNjWVVPZk1KMnZOamZab3lITFpnakVr?=
 =?utf-8?B?UzZnYTVuUmVHcFdFV3Vrc3ltdld6UzNDWnlHRG1BN0lwRFlBUXBVNEVVaUNk?=
 =?utf-8?B?Ni9kczUyYnRud0cwbytqc3U4ellGanBrVHdJdERnUnhWdmVkZ1RtRzg0SHBa?=
 =?utf-8?B?a1o0RTd3R1JJcWZzZFZaOG1nOVN6UkV6TmhQSVVPcWlTWkx6VStwUEV1YUFq?=
 =?utf-8?B?NHIrVDVSMGlxTE9WSnp0bVRES1ZhcDFhVGxYZVVpSlJzT1czLzBRcFkyc2ZS?=
 =?utf-8?B?VHE4cjdPMzJPbzlRMEZjUGdwekg5ajZVWkRGSXUybUkrbG9FSE9XZmErVXBt?=
 =?utf-8?B?Um5wMnMwYnV1djAzVmRXMXczYVRLcDdOczBBc3MwMlFRcFdRY0NPV1FrK1FJ?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f1fb89-dc7e-4c01-bad8-08dd7d8b9a9c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:41:10.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZb71X2b8aWQkhHpGnxXizCX5dT0IJX/JFXR38MDC2l36YWaRa8RN54WlUqq9GS7ukTdTQXURUbL8oH6MfO6vU23ce2dJf5GkClc+OBQ9bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10664



On 17.04.25 01:03, Stefano Stabellini wrote:
> On Tue, 15 Apr 2025, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> This patch adds Xen XSM policy loading support.
>>
>> The configuration file XEN_POLICY specifies Xen hypervisor
>> XSM policy binary to load.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v2:
>> - fix conditional statements for XEN_POLICY
>> - add XSM policy binary check
>>
>>   README.md                |  2 ++
>>   scripts/uboot-script-gen | 34 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index 137abef153ce..9106d2a07302 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -91,6 +91,8 @@ Where:
>>   - XEN specifies the Xen hypervisor binary to load. Note that it has to
>>     be a regular Xen binary, not a u-boot binary.
>>   
>> +- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
>> +
>>   - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
>>     and is in the format startcolor-endcolor
>>   
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index c4d26caf5e0e..208eafdecfeb 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -315,6 +315,15 @@ function xen_device_tree_editing()
>>       dt_set "/chosen" "#size-cells" "hex" "0x2"
>>       dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>>   
>> +    if test -n "$XEN_POLICY" && test "$xen_policy_addr" != "-"
>> +    then
>> +        local node_name="xen-policy@${xen_policy_addr#0x}"
>> +
>> +        dt_mknode "/chosen" "$node_name"
>> +        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
>> +        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
>> +    fi
>> +
>>       if test "$DOM0_KERNEL"
>>       then
>>           local node_name="dom0@${dom0_kernel_addr#0x}"
>> @@ -900,6 +909,15 @@ xen_file_loading()
>>       kernel_addr=$memaddr
>>       kernel_path=$XEN
>>       load_file "$XEN" "host_kernel"
>> +
>> +    xen_policy_addr="-"
>> +    if test -n "$XEN_POLICY"
>> +    then
>> +        check_file_type "${XEN_POLICY}" "SE Linux policy"
>> +        xen_policy_addr=$memaddr
>> +        load_file "$XEN_POLICY" "xen_policy"
>> +        xen_policy_size=$filesize
>> +    fi
>>   }
>>   
>>   linux_file_loading()
>> @@ -939,6 +957,22 @@ bitstream_load_and_config()
>>   
>>   create_its_file_xen()
>>   {
>> +    if test -n "$XEN_POLICY" && test "$xen_policy_addr" != "-"
>> +    then
>> +        cat >> "$its_file" <<- EOF
>> +        xen_policy {
>> +            description = "Xen XSM policy binary";
>> +            data = /incbin/("$XEN_POLICY");
>> +            type = "kernel";
> 
> This should be "firmware". Aside from that, the patch is fine.
> If you are OK with it, I can fix it on commit.
> 

I'm ok. Thank you.

-- 
Best regards,
-grygorii

