Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9765B9E1BC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130246.1469815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1hcI-0005O0-HU; Thu, 25 Sep 2025 08:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130246.1469815; Thu, 25 Sep 2025 08:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1hcI-0005Lo-Eg; Thu, 25 Sep 2025 08:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1130246;
 Thu, 25 Sep 2025 08:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jamk=4E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1hcH-0005Li-0j
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:46:17 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 118219a9-99ec-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 10:46:03 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by PAVPR03MB10177.eurprd03.prod.outlook.com (2603:10a6:102:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 08:45:57 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 08:45:57 +0000
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
X-Inumbo-ID: 118219a9-99ec-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6OIItD6Z0+40cCSnwG5N/LQLnVcERzzgvzyO5556EeKWkhGfQlV+SUmbd6Z5fVWYpXQc7x1QGEobMNeAtoM4YgoItKK7X5frnATXLuwmq9MVbu7fYvPpGqlbbTUAi3bUz0xQvTnA8zvKMHgnaFK+Boy+yY/tueXnzcaiNe+/oImxZxH6hqrraN7yCo4X4v7QdYqx7+9T6Crz7/99QdcF9rCG4n/Vmf2R3Rpg+9huhUkVYJf78hes2EzLcHro4xjhUqQpaS4M1bzS3wrb/dOhaQSOVfYi0mtPuwQ2VlKoUd4n9nJja4pNXWazAt+MYs0dTxXUZ5X4bZKr26ACHQSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16u00z1+mtyVpnPty5YPkHMzdWoFNdqBIY/vClrtpuY=;
 b=k9I22jU5hYAVpSMFsToKC96pA4hHc8w4/cijhkKqeYFTVBeIzLXrRaAH8OwvZG5hstU+ncZz5hYIj8F7gHgjuEaR304mF2GzEgwc6pTGEAkSRt0QIDfBsfb0luE0NVzlpF7Ld2ZJptXYcPTnn7bXohyAeV2cxGyRTrYN2sjm+78rWfGNXWHQWPvu9kJQvfiih4+FSGfK7tlWtXPfHliU2toetEycdS1oFWR774YxZFx6+e1KthDDnAGEuuhylj5Xu68LcsnG82OfAvGaelXcxIoluXxaQF/ItiaS7XnNWqNjpBe+Orff2qhG2hirPT+ZcGibl5OOxT7CV1Iz1GbMow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16u00z1+mtyVpnPty5YPkHMzdWoFNdqBIY/vClrtpuY=;
 b=f4ZlzN+gNZAiQXiIvvYGVZqp8tupmFC25jf6EcxTp+9Y7Cwo0hRw99AbzAzjPWbCPrdzBEaTACgbylU2ug4qqNX9zWyoyRYcqceYCP/+XyvgPJl9BA68g88a7Sab086pKGouERxOOIVhSu8L/9w8ZUfaAW/vJEdkxklOR42WLr5PNRqGRRBZ3efQUK+aAzik2jDmWRPzQsPbX8Xh4bQPiXDwb4YJANNjxrjpS415LpMU1EsLyg8aGNHIPAjaYlSxgr1ShSojmXRI4s/x4UMHzJmUlVX/MHxfj9TnLg6M1LFx2iOOoSJx9no5qVFuzxBrwf9XHkvLJzi6fVM6pdHM2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d1d3601d-7532-481e-8733-49cc5d0728f7@epam.com>
Date: Thu, 25 Sep 2025 11:45:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Implement CPU hotplug on Arm
To: Julien Grall <julien@xen.org>, Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <0e69a741-b6e1-4315-91f0-581f72092c68@epam.com>
 <16c461a0-cbfc-4979-9513-4528d6b78463@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <16c461a0-cbfc-4979-9513-4528d6b78463@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|PAVPR03MB10177:EE_
X-MS-Office365-Filtering-Correlation-Id: e28a1825-9e96-45d1-e045-08ddfc0ff19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0lTcDVZWVovbk5sSnliaGJocVEwSmpHbFYwVjhPcHp2MWRCZVZpL0dBcWxX?=
 =?utf-8?B?dzdRZjV0V1p1dUZVSnhLWjNPbGlyeTY1NHR1MGsvMFRrNUN5bndaanFCcDI3?=
 =?utf-8?B?dkd6Zlo2UUdweTNvd0hiY3UydWcyV0cveHB3N04yZkFrTWl6L3o3OE55SjlQ?=
 =?utf-8?B?aGhsaXhFUnpta1hwTlRXVmJNOUMzd29UWDV0ZERBWWFxTEZsdG8wM2ZZakEx?=
 =?utf-8?B?WThJZlU5UTJFRkw4TmR1SlN4OHRKMTlNc25oZHNPaElEOHFpL3BLRTdUSG91?=
 =?utf-8?B?OU11b3BNQzd6RU04VGRsN3BXUFk3L20rVHEyc1lIMUxNclBubnhHV0V1ZmtH?=
 =?utf-8?B?Z2ttYzdpbHVuZWFwYXZCUDVhbU9iVTdzbmE1ekhtUlJrc2c3REI4dUI0Sis5?=
 =?utf-8?B?a1pMUFNrdTdnbFBVNUUyWUhKRjN2TzVjYkdJQ3h2dkpwcnpDdUR0N1luQ1Q0?=
 =?utf-8?B?M0t6RU1XUHM5N0hFNUp4RU4yOW1zSTg1aXJMWWdtYjhIYjhKZ0ZOdU1HK25C?=
 =?utf-8?B?ZXplaDVFSVZpWlU1bXpZM2dRK3NNVkVuOUlTTG9lWG1odXkwa29LbGhXRFJY?=
 =?utf-8?B?R3crb3Z3Z2xPVW01VkFwYXA3TDEwZEpLTEtrUzNsSTJQOGI4S2lCbEhDOXd0?=
 =?utf-8?B?VnovOUpPeTVMUVBjRGorYkhNRUE2VVNjYXM2ZWtKNG8xTFc3Qm1DWnl2YVhH?=
 =?utf-8?B?UDUrcHN5akppcU1iYWVhbU1lUk4xT283bmpQbUJZZ3VlN01UR0NJdVFVb2Ns?=
 =?utf-8?B?bjBmK01Ec2NSL0FIbzBYWFczbDZwN25rSDB6SW1jeVlCWlo0ZzFwaFNrb2Jh?=
 =?utf-8?B?RFJMa09GWThLcFpSTEdGZzJVeW1SVG9mVDVCUEt4NzFZdmowakpObVdBVzNH?=
 =?utf-8?B?RUlqYlMyZ1Qrazdxa1l2WGJ3bW90VEdrL244a213aG9DTHgvQ1dHZ2xsa2xD?=
 =?utf-8?B?V1EvUDVFODBvbDJWZmVRSmdmbnBJTHRtR1FXdlpFdUVSZytYaGFJNHZ3QXNV?=
 =?utf-8?B?Snk2dFB3OURxVU9rSWZqUDQ5dWxKRWlvWkVVTmk1OVhtOVowdVdVcEM0OUdX?=
 =?utf-8?B?YUFab3l3eUFSdll2MThKTTF2TWlVZ2tBQk1ac0RUSy9lVEhRbW83VWwyWll1?=
 =?utf-8?B?eG1ZakJRUXNqa1drcGhwZUlXc1VuWENRbGE1TWxlRFN6Rng2d05rcUd4YVhT?=
 =?utf-8?B?QUhKMzBNcGNBTXY2a1UwVDR1NHlxSERjd09EYUd6NFRmaE9jMmQ4T0RTNlZS?=
 =?utf-8?B?cWZxeVpoczlMOTdHd1NzUzBMVTZLTUFkeVFlZ1JEUmlxeEhjcWlDNzd3aUYy?=
 =?utf-8?B?Ujd4MmhseDZWdXFqUTc0RVo5V3JMNjUxZWRhaFJoZjdIYWVBdzBSMDEwQ3U3?=
 =?utf-8?B?OTlpMitYOGdSUkdjTk56OXY2aDRnZmtKRXlPWWt1U21jRnpnRkRkTU5GNzZW?=
 =?utf-8?B?Y0pqUjJFeWJpSEgvTHNROTdoMENuZFR3c1FWWkNQTjdWYVp4QzI5NVZIS1di?=
 =?utf-8?B?MnNNYjZ4aEZWdUtzRzZ0VVlzcjBwNlRsWmFlaGNTV0xLa2xINkJYWmYweDdM?=
 =?utf-8?B?eDRGSWplZTE1ankyR0t0dWZKMll2OHNhbW1VZ1E3THI2WTZDWWNiRGRKOFdl?=
 =?utf-8?B?Z01FblJLN3ozSEZCcDNHTTJudXNEdXRGNlorOUtudkhVMTdJckdoWUNoemZX?=
 =?utf-8?B?ZmVZNWZ3dTdna0ZZUkVpQnp6Qy9aTjdFa0V3a0xVZktyUHZvU3VIclpYOFFZ?=
 =?utf-8?B?UXZlTkdUQkNJME02WjJVb2dpelBhVlNzdlJUM1g2QXBRM0JtTjdVSjRZR3dr?=
 =?utf-8?B?OEhZVzhRbjNFZVpSUWgwU29ENG1XWWlwMkpkdm5PZ0NiVU4yTXJNTHd5bnh1?=
 =?utf-8?B?T0x5OGdnaTVQSlBEQTkxYk5YUzV6MStXRm1zK2V6Tk44Q1Z6QWpzVzl2R2c0?=
 =?utf-8?Q?3Neg6uqGl0t6oJZ9I/LrOwgPlz1Vl3RT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWk1dWZONFdLNkVLSDBVQUNMaHJsNDdEUFlqMEMwTmxZQUxEdnN2NjYydStR?=
 =?utf-8?B?RDRjcWpVTTBUcVJhN3BnaVphUTg0OXQxWWgwN2xyc2J5MmI1TXdVOXVraWtC?=
 =?utf-8?B?Sjh4SUU2MUIxYVlhb2YycUs1L05IU1h5NUpWS1VhSFZiVXl1dFZwWDBGb0gy?=
 =?utf-8?B?NXFWbWdRUThkVG9kOWJLRXdKYUZ6eVlOR3REYlZPYjRpNUdraGZidVVmMC9q?=
 =?utf-8?B?bTRaQVl2cVBjR1hWWHNIdWRjOEhlRCttOFB2cStPNXFGVkR6Njgzb3l4VTRX?=
 =?utf-8?B?QW92czNjWkRLUkFmL2ZIaENTcjJTL0tXRmtjeFkyYm56TXRDK2ZYd21ERHh1?=
 =?utf-8?B?QzB1RHhPNS84Y3NvRGoyZlVFT0xHVGVMZjA0M1gzTDhLMjBvclhhQlFhWFJi?=
 =?utf-8?B?MGEvVmRMUW1aQXBZN1JmMUxuQ3ZPak1XU3hvS2NJYU9HaERuZVdESjZVNkZT?=
 =?utf-8?B?NGZYV3RWc3BtQUpDbjcvd20wTFR0N2IzV093Y1BLd0JSbGVnTVBPZ0IrU1FT?=
 =?utf-8?B?aXJRQVFTS0ZVZ2lnbTdVaStkdjIwNEU1NjAvODdvVzR5aDZiRVlraTJJQWM0?=
 =?utf-8?B?OEJ0Z2FBbEUzU0MwUkFaWUp6WGtzYjRUbnhHVUo4aVlaUnFGa1B1VU1JWm8v?=
 =?utf-8?B?aUdSa1dxRVRqc1Q0TFQ1dStPTXlUWmVjT3J4Zy9Ba1VRSi9ocHNrTHA4Vzlp?=
 =?utf-8?B?cllJQ3pXUjNqR250cmtXdUl4am96WWxCU2haM3FlazllWms2SzZlS0YzenZX?=
 =?utf-8?B?dUZ3UHY0ZXYrcGlpUU8rbGx5RVlyNEoyVXF5dStkczBXeDdnTWNML3dpamJk?=
 =?utf-8?B?N0VpRFRGQWdwekZweXNDTHpxLzNTWU1QUldONTlqa3hhbVdiU3hpRllOUElR?=
 =?utf-8?B?Nm12WXlWTGUyejRyc1d5VmRFR013aHdrR2d1UzdWM3Yva3NkUjArL1RZeElr?=
 =?utf-8?B?QkUzbnhNVEgvQlA2S3ZkcTZPSTZJT1Z3c2VGbEVGUjVLc1JkdlNDS0FCRktH?=
 =?utf-8?B?WUpaYTh3ODNCQU0zVkFDaUhNZjBuM1pHOUt2ZzFYTStWanV1Yk1DSWhkWlla?=
 =?utf-8?B?RERMN1lXM2NmNHJGTW1XYzd4bldNb1RUU2V1SDVjcGpXVWxIVkV2cHVKUjJ3?=
 =?utf-8?B?a3hvTWJmU252TVp0c2JDSit0NEtwYktaeFMrNW1ka2tvV1kzNko1UUYzVUNR?=
 =?utf-8?B?ajBESnNzeGNpVVBBM2k3ZGlOSzRGWEtPV0JHMHNZQ0lNdzNsTnczRVZLbzYr?=
 =?utf-8?B?OXFPVEFCcU9UTWE0czZGRHB4aWpwU1RVcExCV3U5K2RCWlFPSFdTM1ZjaTdN?=
 =?utf-8?B?cWFxRlZqVnZRbXFIYUtXYS9mSE9iQzNGWmsyS2FrWnhZUU84ODJEL28yNERT?=
 =?utf-8?B?L2EwYlIvT3h3UTJXTFg2REx3dGJ5MytWZWM0blFlNkpPRXl0c1QxVTVwaGFm?=
 =?utf-8?B?VUZ1cENOcE11YnZvdHdWQ2pIeW9XaGFQdUJCenJKeXc3YzlKVUo0UFVNOGxW?=
 =?utf-8?B?RmorOWRQeFo5RkUxSTNDK0VnZGVpSmliWUFROEpYQ3JQVjhNWVBFVWRzeVpC?=
 =?utf-8?B?MVFUVnFQd1lHeU5tYzcwWjd3K1VOa0pYVThUUzBxTmt0ckQrY1FaVGxyZnZm?=
 =?utf-8?B?dHQxT243OGV0WWVPRm5SQVphNzdSMFgvZGpKUEdMSmpPa2lXWGwvS3hTL1Rn?=
 =?utf-8?B?a0JpVFZQTTdsYklJeC9salVtRTZad3dBS0NENmpENkI5R1h6R0w3UmFyTEts?=
 =?utf-8?B?VjBFQnRlUHFuWmd1T1FIRmllTVJkWkZxY2NkR3V0VVV4Nmxrc2tlSkxsSjY2?=
 =?utf-8?B?U2c3QUNyNnNzcXpIWkNEbVhZclpyeVIzTytCU3NnQzNSQUdlbS84OHJiL1pp?=
 =?utf-8?B?NVA2MmJiYkhWV05VMFZZN0VwWXhDNmI4aTRPTVArbnhPUVlJZmlYaGR4cHFw?=
 =?utf-8?B?cnNDaDhDQVBGdkNsbEl5dUtGSDJqMW84c01pVjllY09VY3ZndzJyZ1BSbkRx?=
 =?utf-8?B?WkV0Z3FXRVFraGZwSTdBZ3ptM2M2ZUQvMFcxWkptT1QvRUp5OHQ2R25RM1px?=
 =?utf-8?B?dFZEbmFFRTFDbUk4VnVKWk5taGhBZ1d4aHhoaE0xSGVoT2hKVytjMkhzbDBX?=
 =?utf-8?B?WlJpYmlqdXpMTGs3bVFJZW9hZFhsSHFxU0ZmaHJNSzVkMTZpelZjM1NhSzZr?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28a1825-9e96-45d1-e045-08ddfc0ff19c
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 08:45:57.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8KUXti8LkxfAUthaaw/8+i4OlurDcqeS77ahX1fD36GedQmwwnIa3Nz/fgBkSRB738HdcX3ENvpoGV4PNJ6iFuGtp7N6X1dtfM75/5F52E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB10177



On 23.09.25 21:38, Julien Grall wrote:
> Hi Grygorii,
> 
> On 23/09/2025 17:09, Grygorii Strashko wrote:
>> On 18.09.25 15:16, Mykyta Poturai wrote:
>>> This series implements support for CPU hotplug/unplug on Arm. To achieve this,
>>> several things need to be done:
>>>
>>> 1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
>>> 2. timer and GIC maintenance interrupts switched to static irqactions to remove
>>> the need for freeing them during release_irq.
>>> 3. Enabled the build of xen-hptool on Arm.
>>>
>>> Tested on QEMU.
>>>
>>> Mykyta Poturai (4):
>>>    arm/time: Use static irqaction
>>>    arm/gic: Use static irqaction
>>>    arm/sysctl: Implement cpu hotplug ops
>>>    tools: Allow building xen-hptool without CONFIG_MIGRATE
>>>
>>>   config/arm64.mk                  |  1 +
>>>   config/x86_32.mk                 |  1 +
>>>   config/x86_64.mk                 |  1 +
>>>   tools/libs/guest/Makefile.common |  4 +-
>>>   tools/misc/Makefile              |  2 +-
>>>   xen/arch/arm/gic.c               | 10 ++++-
>>>   xen/arch/arm/sysctl.c            | 67 ++++++++++++++++++++++++++++++++
>>>   xen/arch/arm/time.c              | 20 ++++++++--
>>>   8 files changed, 98 insertions(+), 8 deletions(-)
>>>
>>
>> Hence you introducing new feature for ARM I'd very much appreciated if you
>> add corresponding documentation under docs/hypervisor-guide/arm/.
> 
> I think some documentation is good. But why does this need to be Arm specific?

Only because this series is for ARM, if it could be generic (at least partially) - even better.


-- 
Best regards,
-grygorii


